Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCEB1B2A6D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 16:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACB06E15F;
	Tue, 21 Apr 2020 14:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3AF6E15F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 14:46:19 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id x23so11335377lfq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 07:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=7nNaL35jkVQeRE5sMmNE8+7MOE9AkVwBiZH9R31Or+Q=;
 b=ofTjZbCyRPZpEDO+l45P41Z9EcJRouy63Y/SyR9jXHQba+22vcG5ZKn+1PnBZ+0aGD
 1YVbhiapZb3593ztijFOmYt79690T9o71LbAPKY+V6+C8DUji4HnQRoYG/32jL0ZdP7i
 h2BZyNCoO3paTxSddv2rWRuDYoZM7a1woTGCBGaCHAgqcsNHIYrHm+JhgX9JD6G82y94
 eTfkhrp4VGV1DSCOtgiygHQfVzNPzZcq6KmD/IQ5DnP4qqlSEGNzawUM6meEZL33xgWR
 8jxPxi87STSrDHgLXi/UMBs52ze1vFkOiXSsq1ZLM83O4TMEk+V/YBL5InyKyBfVL6G7
 rdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=7nNaL35jkVQeRE5sMmNE8+7MOE9AkVwBiZH9R31Or+Q=;
 b=Fv4ThCCDwCF2purhkkvDe4Sp7cUSsUPsvCAEOtEe1vqmi6296aXCf7MlkcmKDg/ss3
 St6+32xRjuTpMRhjzxKcK6jmIbYtmdFGmuow6IA2VGoARaXEQez/ODQkODalA6kqdtYk
 v9RjRyhRjB97rgzc/JTGzE/f0+g58z+bMcI3XHUuM/VrOu9c82uMK9zms2RKvcV4qVkl
 W3ZBPE1Ev1a2epCKv3WT6sXOLaFp/Vzd1ZkT7lzXsSKr518xhMANfklCjAlwFXcMU4pC
 YH17LRrWFJVT3HsS0NwpYg+aznrdMb7HrB1Vjl4QZaFfUP/LVcNzAv/62Fhgd60NVhGy
 VstA==
X-Gm-Message-State: AGi0PuYLwzs/lLrsxnOSWynCwShsGn/4L7cvgtq6JWB+AvnFI6W6b0Ax
 djgAtrriaZBToIwWzMjsp/0=
X-Google-Smtp-Source: APiQypJQFOTx+gRV9wGuERLLhbzQ9ZpGLb4hkaeSMW/Oh06MFdPr+uLr+pgsQI+U0jkgGYTOxSxkZw==
X-Received: by 2002:a19:4204:: with SMTP id p4mr14154568lfa.111.1587480377687; 
 Tue, 21 Apr 2020 07:46:17 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id o18sm2235303lfb.13.2020.04.21.07.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 07:46:17 -0700 (PDT)
Date: Tue, 21 Apr 2020 17:46:13 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: RFC: Drm-connector properties managed by another driver /
 privacy screen support
Message-ID: <20200421174613.139991ed@eldfell.localdomain>
In-Reply-To: <e8da46f8-ebe4-aee4-31c8-229d06fa7430@redhat.com>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
 <87k12e2uoa.fsf@intel.com>
 <e8da46f8-ebe4-aee4-31c8-229d06fa7430@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Christian Kellner <ckellner@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nitin Joshi1 <njoshi1@lenovo.com>,
 Rajat Jain <rajatja@google.com>, Mark Pearson <mpearson@lenovo.com>,
 Benjamin Berg <bberg@redhat.com>
Content-Type: multipart/mixed; boundary="===============0735098238=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0735098238==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MwNsZrsaQ0p0YGYR=De+da."; protocol="application/pgp-signature"

--Sig_/MwNsZrsaQ0p0YGYR=De+da.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Apr 2020 14:37:41 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> TL;DR: Yes there will be races, because of both userspace +
> the firmware having; and potentially using r/w access to
> the privacy-screen state. But in practice I expect these
> to not really be an issue. Important here is that userspace
> only commits the property in a transaction to commit if
> it actually intends to change the property so as to not
> needlessly create a situation where we might hit the race.
>=20
> As for 1 vs 2 properties for this I guess that in preparation
> for potential devices where the state is locked, having a
> r/w sw-state + a ro hw-state property makes sense.
>=20
> So I suggest that we replace the current "privacy-screen" property
> from Rajat's patch-set with 2 props named:
>=20
> "privacy-screen-sw-state" (r/w)
> "privacy-screen-hw-state" (ro)
>=20
> Where for current gen hardware the privacy-screen-hw-state is
> just a mirror of the sw-state.

Hi,

this sounds like a good plan to me, assuming the kernel writes only to
the ro property and never to the r/w property.

I understand that as long as firmware hotkeys will toggle actual state,
there is no design that could work reliably if userspace will always
commit all KMS state even when it is not necessary. But not committing
KMS state unless it is actually necessary is really a new requirement on
userspace, so that needs to be documented before it's too late.

It's not enough to document "don't set it unless you want to
overwrite/change it" for privacy screen properties. It needs to be
documented as a general rule that userspace must follow with *unknown*
properties as well. "Do not restore unrecognized properties unless the
kernel KMS state might be incorrect compared to what you used to have."

This means that with a display server that does not understand privacy
screen properties, the end user will lose the privacy screen state on
every VT-switch back to the display server.

However, if we had a way to query the kernel for the default state to
reset unknown properties to, the kernel implementation could return the
current value of the privacy screen property instead of "off" to not
lose the firmware state. Assuming firmware hotkeys exist, but if they
don't then return just "off". The point is that the kernel who knows
all the properties makes the decision what a sane reset value is.
Userspace can always override the reset value for the properties
it recognizes.


Thanks,
pq

--Sig_/MwNsZrsaQ0p0YGYR=De+da.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6fBzUACgkQI1/ltBGq
qqdIpBAAiG85JC3O4wdO7U0OLAwV2sh9ly3RzscWg5+pIOt/by/5plTWdSXuxyAY
q6r2b0F0ErjZyZUs1lVlYR+bhbjhbyKiA7Ow4BXCglgoQDTbJlRmbypQ3Lr+n9KM
8ZRtQWjDdhDaCkwheTjC+kfBMx+mwQpIJr0GW63BsHbo9n2DsJL+FAkBg6OtTgTQ
UOvh/jLkRpOtjAlXEda6UH33jaCQuVKy0KW2wXjUwC5D0ESL30HmtfkEtKF2Iwyb
5spKyRE9FW4v0gP8j1fGZoLK10HijGGJpZWrRG+0INU3XxXzTEw9/VrxKzqHxEoo
0SXsWEbvUShxafIdLyTsfbYPs3pUDU+0OfPKQfPWr4WcFcY3iNkxTEfe/FdiLSsv
4Aofyl4PZgfLmn912Bci0PP5iTxc4pPldPzsZx5MDrps72wRmPQj1LZKKWbWfF85
V4+7e9CE+BCnOoo5+2hSD9G6P8lrtfYcfP06LMt87Cj/v178AGJELjXv/31vKbtn
O3XviRZVlSshJtw5PL0WU/zvXDwrl6kqIoTOCzBGgsSydjpfKTZvSrkKIVW1abbz
VeL01XueU5YRTjhtptMCg5dDBHsDcYL/WEoOpsG9vzXuNYUL0qSS2G4i9twCcEwY
Ft2xWqfNdcPvQtOgV4JBttWQ9GrxGT6em6APKfLHsC3vKnG7yB8=
=XOX6
-----END PGP SIGNATURE-----

--Sig_/MwNsZrsaQ0p0YGYR=De+da.--

--===============0735098238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0735098238==--
