Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A7EDC665
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 15:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1FE6EB54;
	Fri, 18 Oct 2019 13:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF006EB50;
 Fri, 18 Oct 2019 13:43:35 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id w6so4779048lfl.2;
 Fri, 18 Oct 2019 06:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=HtN0DkwTbafHcFmdH+bFfoyxmW/SEGdsV/AxGMBaxfU=;
 b=tY9WMdgLznOQauiJq7Vgw+oIzEUdkKZ8riXCwmygHEODQs9i8xZNrntML1ydD6X28f
 30geYz1MfLBO/KFGz7cNmUmrUENkGi6ttW5iR+OzsVVkr7gBolzITu+0lYm1mvTwy//k
 2Q+9r4AyZ4U3ECd7hyEtiQndJE/HPg/ZHKDMeliAzy+q5Q8BWrP6EI9uvARoMsZ5408i
 sv7bJgfyYK/qbmPb8Wo2U7GKPMaOc5w1KxkFwdcUucZgAiaGc6mw35j2SQVh3QqcKJuZ
 N5r8wcOY57TgslFPWbykgr2NEgEl/fcw1Z159lFZbNUmTUGQKJi3FRS3Zoj1jK85u5mU
 Nhww==
X-Gm-Message-State: APjAAAVMTglQDd8gSJBi1gUrwVSVa3ZH8/XML/LjygQ/bZ1ql7lHjlI7
 mAXho9vA2wm7CjyDaYdii88=
X-Google-Smtp-Source: APXvYqxeM9cYITPjXEW/qywtJTio0DIqyCGUdGXf3dRInf9hBCG1LpR3l+p7PMB2pgJSLcCZx9V6mw==
X-Received: by 2002:ac2:4304:: with SMTP id l4mr6374697lfh.130.1571406213650; 
 Fri, 18 Oct 2019 06:43:33 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id e29sm2401893ljb.105.2019.10.18.06.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 06:43:33 -0700 (PDT)
Date: Fri, 18 Oct 2019 16:43:29 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Drew DeVault" <sir@cmpwn.com>
Subject: Re: [PATCH v7] unstable/drm-lease: DRM lease protocol support
Message-ID: <20191018164329.412b14ca@eldfell.localdomain>
In-Reply-To: <BXSMP84X56T9.317VNFYFVMCWW@homura>
References: <20191018122130.0f880724@eldfell.localdomain>
 <BXSMP84X56T9.317VNFYFVMCWW@homura>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=HtN0DkwTbafHcFmdH+bFfoyxmW/SEGdsV/AxGMBaxfU=;
 b=UGpc/mmrGkEAZTO2T1p3vLFXUEminQ2saYgwVSyfKskme/D9h1qti7wbT9zGw+nzNI
 10iD1kSBs4L5XA2/tfeTDr8H53tyFSkXc6T857KgV2mXrrS826X/TQFPOyQ5olF6eL8B
 eYG9su5+3J0Em5FZ+R9+r+AkrqRocUmQ+a1xYdwp4zFj4gd1FMn5qLiHhRaM1A2e6Qyj
 jyNu2FVCbTfO6XH3r20ith6+59WY+13ZePL4sXA7REbNVGZqrMJzKjyJjtjFvjPZLoGQ
 fJeNIZzyP4flQt658N9ObCwHWg7rKNRpJ6ir8PJIzEAgNwmzBR8s+DnyLon5o7ujWDdw
 OylA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Marius Vlad <marius.vlad@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0293801670=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0293801670==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+7kNDCAdp+DpbaRNMMoqC8/"; protocol="application/pgp-signature"

--Sig_/+7kNDCAdp+DpbaRNMMoqC8/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Oct 2019 07:54:50 -0400
"Drew DeVault" <sir@cmpwn.com> wrote:

> On Fri Oct 18, 2019 at 12:21 PM Pekka Paalanen wrote:
> > One thing I did not know the last time was that apparently
> > systemd-logind may not like to give out non-master DRM fds. That might
> > need fixing in logind implementations. I hope someone would step up to
> > look into that.
> >
> > This protocol aims to deliver a harmless "read-only" DRM device file
> > description to a client, so that the client can enumerate all DRM
> > resources, fetch EDID and other properties to be able to decide which
> > connector it would want to lease. The client should not be able to
> > change any KMS state through this fd, and it should not be able to e.g.
> > spy on display contents. The assumption is that a non-master DRM fd
> > from a fresh open() would be fine for this, but is it? =20
>=20
> What I do for wlroots is call drmGetDeviceNameFromFd2, which returns the
> path to the device file, and then I open() it and use
> drmIsMaster/drmDropMaster to make sure it's not a master fd. This seems
> to work correctly in practice.

That is nice.

Personally I'm specifically worried about a setup where the user has no
access permissions to open the DRM device node directly, as is (or
should be) the case with input devices.

However, since DRM has the master concept which input devices do not,
maybe there is no reason to prevent a normal user from opening a DRM
device directly. That is, if our assumption that a non-master DRM fd is
harmless holds.

(Wayland display servers usually run as a normal user, while logind
or another service runs with elevated privileges and opens input and
DRM devices on behalf of the display server.)


Thanks,
pq

--Sig_/+7kNDCAdp+DpbaRNMMoqC8/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2pwYEACgkQI1/ltBGq
qqeSqQ/+Nyov3Yu8NHgt7YM/ETuNOXXYb6n1LmRTdQPUyePiE4TRhj/udpbDQADn
f+Pk9PbxoMAPGlyOePil8KBvgSRh+ELAAOxKSfhXsT/3bet1+5Rj97PtscZbzZ/s
HIx5Ww+aKH4J0maybaQ8alyDKam3NfwE1vk6eJ28FcRQUCpF73/OtBHnhdW05jHK
sSKjrxuQdEMNYvIYZxjru8ra5hQQciWWPUdl59Y7+dvRBylIswS68+LOHH7g+MBU
DCBa9nzU86tJIVahNcL0VBUyjvhqnjUXbHGXHDNOzmCCVj978ZZwpjc1C72OM/1P
XCiuV6RnQ4z5cMQH+KMjVHksSJjJ239f+WZOHDK30/QSdNY0ICFPoiTse+ad4cfU
YyNsa793KESmySLv1tKOWqnERWzbTNTI47oDNQgvZrY8utKnOc2YK+L50NJbqFKA
u9v+a7+8ELteHewaVQDbnfD0MPGcDWbNwbzU6/HGEPjmQr/npiK2S1g5jjBasrqD
3QBvmqrgsuiEPddsK5MBrdkUFGm9tuz+LT5PPe4be7lROzYf7UlIm0d3GSLJgAiC
yP0NTFob1gzJexrrghuFaPJWJc8t0Tpkv6LtpnrO/IuVhTV8tRRA8Jd9buQ92N6U
tK7Yb1wemPCxCgFwD2DQlElOS3czN9ftXnQAPX67iLAyazZUue0=
=nyJA
-----END PGP SIGNATURE-----

--Sig_/+7kNDCAdp+DpbaRNMMoqC8/--

--===============0293801670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0293801670==--
