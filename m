Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307F42C60F0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 09:35:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC436E9C7;
	Fri, 27 Nov 2020 08:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8979A6E9C7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 08:35:51 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id h39so4030149otb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 00:35:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xh1hHzZVurhLLa9A5bjYyJ5OP5iFGRKbQx8AzvX3xN4=;
 b=m5VWuyFtKRRDHPYvWFRbIS+SU3nw9TOloZFAsQrOV9IYFX+A4Sq/Xs1dxXsb81Nzwr
 rygmLDyTXGm13tqdJL/himc+wV6gphxcicpdswCfhXN80idx5ET2aCPVMnIlCsjD33/s
 Tmc+dndUbIUX52DshcpDjqf0ENMQAscRKp21uipfPaH4/DnqK4skiAJYuZ3TO4HdbMxQ
 qs9JtvgYKjaZFmhqa3mjr8Bxig5NUMwwcti2+LIM1+X2LOFhSRNI7BucSkphBuqkoQlv
 HXg+EwK7HbGh8HGN/cTAre0FD9vsEyzCBQDioazSjT3eL4E3/c84RTKoxdq6siooZ3rw
 zvYw==
X-Gm-Message-State: AOAM532vYEJSXazM9Ut/WWx4jTW33F9xa0db2Hp7xTtdaNI6M2xXu40t
 BQPkvRbdHJjSXUEwqXYGIV/awiNHabo/3LtfknY=
X-Google-Smtp-Source: ABdhPJxi+ycxEsm5KsGHfXpYVjf0qoqXVdSm5mG1czf/VSu3Ar1g/6kPH+lbgaSp8/Ea4xlpW0yThv8dOVha3z28GvM=
X-Received: by 2002:a05:6830:210a:: with SMTP id
 i10mr4949297otc.145.1606466150802; 
 Fri, 27 Nov 2020 00:35:50 -0800 (PST)
MIME-Version: 1.0
References: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Nov 2020 09:35:39 +0100
Message-ID: <CAMuHMdUbfT7ax4BhjMT_DBweab8TDm5e=xMv5f61t9QpQJt1mw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ALSA: ppc: drop if block with always false condition
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jaroslav Kysela <perex@perex.cz>, Paul Mackerras <paulus@samba.org>,
 scsi <linux-scsi@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Alan Stern <stern@rowland.harvard.edu>, Jakub Kicinski <kuba@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-block@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Geoff Levand <geoff@infradead.org>, netdev <netdev@vger.kernel.org>,
 USB list <linux-usb@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jim Paris <jim@jtan.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVXdlLAoKT24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgNjowMyBQTSBVd2UgS2xlaW5lLUvDtm5p
Zwo8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiBUaGUgcmVtb3ZlIGNh
bGxiYWNrIGlzIG9ubHkgY2FsbGVkIGZvciBkZXZpY2VzIHRoYXQgd2VyZSBwcm9iZWQKPiBzdWNj
ZXNzZnVsbHkgYmVmb3JlLiBBcyB0aGUgbWF0Y2hpbmcgcHJvYmUgZnVuY3Rpb24gY2Fubm90IGNv
bXBsZXRlCj4gd2l0aG91dCBlcnJvciBpZiBkZXYtPm1hdGNoX2lkICE9IFBTM19NQVRDSF9JRF9T
T1VORCwgd2UgZG9uJ3QgaGF2ZSB0bwo+IGNoZWNrIHRoaXMgaGVyZS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpU
aGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydEBsaW51eC1tNjhrLm9yZz4KCk5vdGUgdGhhdCB0aGVyZSBhcmUgc2ltaWxhciBjaGVja3Mg
aW4gc25kX3BzM19kcml2ZXJfcHJvYmUoKSwgd2hpY2gKY2FuIGJlIHJlbW92ZWQsIHRvbzoKCiAg
ICAgICAgaWYgKFdBUk5fT04oIWZpcm13YXJlX2hhc19mZWF0dXJlKEZXX0ZFQVRVUkVfUFMzX0xW
MSkpKQogICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7CiAgICAgICAgaWYgKFdBUk5fT04o
ZGV2LT5tYXRjaF9pZCAhPSBQUzNfTUFUQ0hfSURfU09VTkQpKQogICAgICAgICAgICAgICAgcmV0
dXJuIC1FTk9ERVY7CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAg
IEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBi
ZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0
aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3
aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9y
IHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0g
TGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
