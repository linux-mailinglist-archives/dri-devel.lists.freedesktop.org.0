Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DCC496BBC
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 11:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AD210EA91;
	Sat, 22 Jan 2022 10:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEE210EB28
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 15:43:46 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id o12so34591757lfu.12
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 07:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0IQlKjnnKeNHzaC+tXi/PTRE2Oz7fqwhjlXjoMrnJzs=;
 b=hTsh8w4JEfQxMuE1YG5sEQ6WWb3ORoeadqwCS1bbOYNIa6qA9iXfxL+y4wcJeP/EzI
 Wj0kQ8pOK+I+yE0Togpo5Um6XSGBAeApogCY691ywwhhOYv87/2ZswD46USxCJ29lvq4
 5tbE7mdv9oU4lvyrwzuhiJWI82a8kNS9iDGUe3io1IyyMnQXRH8qGGuJQcxzE3CztfjX
 Ara2HUFQkEV0PchizcDF4EK1/aZSsEWyUimxQWc3I69CRFapTCc/yceYmF0NHLMI+TME
 WDft1x1OodIUA6IlaYf25vOhlsTJEdjZme6LLST14LXCfHJqtQNFwXRLt6Gll5KfqoXS
 zlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0IQlKjnnKeNHzaC+tXi/PTRE2Oz7fqwhjlXjoMrnJzs=;
 b=D8wG/AHtZG2D9NtNYVpNvKxvnI5dBPk8LujXbmEbxkNDYA47IIs3gC5+GxvjAOajYD
 dU53Bux10+l13cBfEnPcvzG7bLKVeTMdagcJB7YbuKsua2wNjezJHXQO0kD+OSe07B2S
 6nPkhkRpNZp5SXqTxKtdPpkbY/BHnI++QefIazzrM9wHVw61P4V0y2ygBXM7lxQhbj0v
 A1FSRM/Zk6TzwKbvr7WMet3qPtq5P0HVegoYvSF6ocPr6ZylwPddDJdui0+bERpQcva5
 IYnSQWxvZC5rQtUoYZ4QWGnjqaHW9LWhHseeSGBiMk3q58ddbRPIMbvdlwMY7jp0fHcV
 Yi9Q==
X-Gm-Message-State: AOAM533SU23YqwK6hTjoBayunhJoyCKTQ2oXNK3a8KLaF8Fti04cs7RH
 TVxBnw5zHOOSGEAqnhP78GxCp/SbTdWXtg==
X-Google-Smtp-Source: ABdhPJzHH+Dty7JNy7NWcmObRj9g7VPT34BQZJ46+jLYh36xPQfXtg307iHEs6dE/6zi4OGBXGkMew==
X-Received: by 2002:a05:6512:1093:: with SMTP id
 j19mr4019418lfg.360.1642779824476; 
 Fri, 21 Jan 2022 07:43:44 -0800 (PST)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245])
 by smtp.gmail.com with ESMTPSA id s10sm287569lfb.248.2022.01.21.07.43.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jan 2022 07:43:43 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v3 00/22] drm/rockchip: RK356x VOP2 support
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20220121103245.GT23490@pengutronix.de>
Date: Fri, 21 Jan 2022 16:43:41 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <44C87C12-A194-4AC8-922B-C4C215474AC9@gmail.com>
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
 <AA3A26CB-6282-4A6B-99DC-8042DC8926BB@gmail.com>
 <20220121103245.GT23490@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Mailman-Approved-At: Sat, 22 Jan 2022 10:44:23 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Wiadomo=C5=9B=C4=87 napisana przez Sascha Hauer =
<s.hauer@pengutronix.de> w dniu 21.01.2022, o godz. 11:32:
>=20
>>=20
>> 1. how support for CEC looks/prospects (plans for future, not in this =
code, expecting others should implement, etc)?
>=20
> I had to google what CEC actually is. We don't have plans supporting =
it.
> It looks like this is a matter of the HDMI driver supporting this and
> not bound to the rockchip driver.

Ah ok. sure. got it!
(I asked as Rockchip hdmi driver already well supports CEC - so i was =
thinking on rk3566 this is more of enabling than writing support code).

> You enabled the panfrost driver with other patches, right?

Oh - i wasn't aware any patches are needed for Mesa for rk3566....
If so - may you pls point me for latest/correct patches for rk3566?=20

>=20
>>=20
>> 3. in kernel dmesg I have many:
>>=20
>> "rockchip-drm display-subsystem: [drm] *ERROR* Unsupported format =
modifier 0x810000000000001".
>=20
> This message is correct. This corresponds to
> DRM_FORMAT_MOD_ARM_16X16_BLOCK_U_INTERLEAVED and the VOP2 driver =
doesn't
> support this. I have a similar problem here with
> weston-simple-dmabuf-egl.  By default this uses DRM_FORMAT_XRGB8888
> which ends up being PIPE_FORMAT_B8G8R8_UNORM in MESA.

Ah ok. Clear now.

Thx!

btw: i added support for argb8888 in my app and now all is ok.=20
no anymore errors in dmesg :-)

so summarising:
your vop2 code works for me in all supported video pipeline variants:

-x11/Glamour
-Wayland-EGL
-EGLFS/EGL-dmabuf
-EGLFS/DRM Planes=20

Your vop2 work is impressive!

btw:
you mention:

> In weston-simple-dmabuf-egl I can pass a suitable format on the =
command
> line, in my case I use DRM_FORMAT_ABGR8888 (which becomes
> PIPE_FORMAT_R8G8B8A8_UNORM). With this the panfrost driver does AFBC
> which then can be rendered in the VOP2 cluster window overlay.

is this mean that: when my app is using ARGB8888 format - then I have =
AFBC on rk3566?


