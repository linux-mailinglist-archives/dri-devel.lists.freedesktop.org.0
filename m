Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC907A39D85
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 14:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C45C10E058;
	Tue, 18 Feb 2025 13:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=netztorte.de header.i=info@netztorte.de header.b="wxr0zCa8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Tue, 18 Feb 2025 13:33:50 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBA210E058
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 13:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netztorte.de;
 s=s1-ionos; t=1739885628; x=1740490428; i=info@netztorte.de;
 bh=iCjR/95oTaXUnDuLuR9Q5TMrDE09OqfT0MKB4fOsNfs=;
 h=X-UI-Sender-Class:Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=wxr0zCa8CvlbhA52YIWmG/JRNKP9pu6WDAlUThpEuEG0AnEIWaM1SNftJJz03Y1W
 d0qCYPhAV57agKz2JhrMgcHK4zSkcXXOzsuJRS99jwaVbBa0VSLF4JwYynMWiW4kc
 dhxwWUD3NvOik6IAkFPVXnX7F4qb+M4Qd0Dqf0WFqkLvmMXvswpOmI1GGYLMNe2ft
 dV51OIqCuadgc9GpoB1pnMt+Ag3CGE8DrEc/U5EporCYnbImdIKqKCNBBPpmd4s04
 eFGEjxixRcLimSHKdTRD48XPd2R4zMg7HlB8A3eJXKRubqFsiV5Nn3yY2Burk+A8z
 chG9MHha7MCw/futNA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([2.202.64.191]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MkpKR-1t4CLj3bXr-00b3Gj for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb
 2025 14:28:44 +0100
Date: Tue, 18 Feb 2025 14:28:43 +0100
From: Thorsten Maerz <info@netztorte.de>
To: dri-devel@lists.freedesktop.org
Subject: [Question] gpio-backlight: Is initial power state derived correctly?
Message-ID: <20250218142843.00002393@netztorte.de>
Organization: Severely Unorganized
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-w64-mingw32)
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAFXRFWHRDcmVhdGlvbiBUaW1lAAflAx8LDDHhuF4vAAAAB3RJTUUH5QMfCw4Kt4Q2+QAAAAlwSFlzAAALEgAACxIB0t1+/AAAADBQTFRFzq1j5+fW7+/n7+/v9/f3////////////////////////////////////////////hY5OKQAAAFRJREFUeNpjMMYBGEYlsEgwQIGwMTIbSULZGJk9aHUoCoGBIMhbCPZAhy55EgxIQBmXhPDg1gHiCCoiAEoMCiP7GTnOldEkBl4HKC0hR5GiIpXTFQAAVaS5+Z8eLgAAAABJRU5ErkJggg==
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6zjutwSCNCDRT2zDIdhimZ64jRKRn5gZBdCRV2Ko14qcLTBbvYt
 5xKQXJxFY44B/7nJag5zPn0wAWhvoWDKhZk576IjnwFCk3NYxMorH2FBGuB4hcVTJlyu3bH
 32oAZ215GA/Eh8LiHLIxd6TN5V9nkTMBHI6STew1Ij/zeuBuS3J4vVUvgetFVbDZkh63qtG
 XRG6Ek/Qb9SAQpqne8MyA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5jdg+byZXJ8=;23CZQz6irSuWmINN6MnJngfIj2u
 1We4O4RGOeAOEwEZB7f14NCiLacpbRMLAfovwqLVDWZa0YB3CoIabm/hwav83/0jpYq4PD8tE
 +0DBl8SosgGXNvOsIMB/ya1UOkb3Qb1KWPEKtQ2baJbcUqzcCHYicut+ZsX52sZL/aK6j/L74
 qrvQjOh7G4rBLwoPHRfRUWDXY2K9caDhaF5FSAE1hOdJ97MDE+BssD/HjMSPqUlFXNZ9vpl/m
 MryALhmJ3MHJsZLlO0fuInAgeavtCzNRvmmB/UiByrbaY7ddCKwpAlrj32e+G7QAxTJ08Pqqy
 WVXhbFJMCAUVzEDj5iGwb8W9X44ZcbtJofjYatU8wnBr7l8Dulfhlvo7mR077M9rZcHvdYAlR
 HKsTGCsR08X83sYnGAfmRzirTd6lE7LwusDriU7S2QLIkqq322SluIkAMr4ULKYfxPBePMYR4
 Sktw6YuafJYHd6JIihdwzveKVlR8p8BjI17exSJZ1C+FvfyjHJg+9wFtIEdVdlCn707iPgRVY
 28t//5paUJxtgAMLz25jH5eOlDI4qH8jjN8XleLJytWjODG4bI9HWrLRRTjQ+JQ4mzRg5AIsS
 rUztJoSyH3iNr12vlKAE5GPniufxGQAO7V74ynhrdMAC4d8qS6o1cOR20ZfDRd80/kRZZ4oPP
 S14VtfO6ScbHEFr1nTTW8/cNCcFeO9JZAnjToSwkVPbR/csXAk81QYSiqaNdU0CaVdJw8JqqE
 nNG0WOp/w49fLElY/L918+8e3hrrY5sN9UDXwMq66y+i34tbTsD3c/bRDpDpqIP4cKYCOprHc
 YS4SzC8yr1E/3pKqXgRPRcXJX5U9jIRB85lT6/MjtAIDv8+EauL55ujDVzul8NMyP28k6vuwz
 kX5HIfm8gTOmQ/nzcJj5YjYCE2cMYMlqocsasRS78S4S7H/0ANnpUGH/kzY6sb0irodlOyyGH
 EvURBTKwA8ISAmwq4UkOjihcF0Xz+FqB8F9VXxfHR8VoktJy6HR9JItWjmcB2CKZe1DYzPwMe
 Yf3vcip24fr+9+rs2cQ3hprjCV4esGU3JlOm3u5ZZFg4n8F7e7e3beUaVmwdw4/t+g+mk5IMr
 TEJY3oM/XDOOjw0QjClFcKjXPx9wykAQzzLmWWsbhRt2lC7E6R6dyqCGY3GussnmgJclMvQLC
 BiQSQWE/EkC7Cu+nUPlz7LWslGkRL/wpVt6+ZfjtjqZUUGioGMXX+Uzit3VDPdVcQJ3JlN5Fl
 1AYGJM2YYNqyWIIk/zItTlO6TQBYW5T/yWQfs8qK3pQPfEBRNOUC8A53/boieUjYianpd9fLm
 ZwKZ2WBiY15J2kr07SpLJoDjQb6gZZOXoCL8CNbYXVm/FFRyoF5mls/KXcdGlPec/IV
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


I am struggling with the gpio-backlight module, it starts up
with a black screen, though the devicetree states "default-on":
        backlight {
                compatible =3D "gpio-backlight";
                gpios =3D <0x31 0x05 0x00>;
                default-on;
        };

After bootup, the content of "/sys/class/backlight/backlight/bl_power"
is "4", meaning BACKLIGHT_POWER_OFF. The screen is black.

(The backlight devicetree section is working, I can switch on
backlight by writing "0" (BACKLIGHT_POWER_ON) to bl_power.)

It looks to me as if the logic for detecting the devicetree
is reversed:

See drivers/video/backlight/gpio_backlight.c :
=2D--8<--- start
        def_value =3D device_property_read_bool(dev, "default-on");
[...]
        /* Set the initial power state */
        if (!of_node || !of_node->phandle)
                /* Not booted with device tree or no phandle link to the n=
ode */
                bl->props.power =3D def_value ? BACKLIGHT_POWER_ON
                                            : BACKLIGHT_POWER_OFF;
        else if (gpiod_get_value_cansleep(gbl->gpiod) =3D=3D 0)
                bl->props.power =3D BACKLIGHT_POWER_OFF;
        else
                bl->props.power =3D BACKLIGHT_POWER_ON;
=2D-->8--- end

1. "def_value" is read from the devicetree.
2. "def_value" is evaluated after "if (!of_node || !of_node->phandle)"

Shouldn't the logic be the other way round?

        if (of_node && of_node->phandle)
                /* booted with device tree */
                bl->props.power =3D def_value ? BACKLIGHT_POWER_ON
                                            : BACKLIGHT_POWER_OFF;
        else [...]
                /* Not booted with device tree or no phandle link to the n=
ode */

=2D-
Best regards,
Thorsten
