Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1FA4949D4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991A010E8E1;
	Thu, 20 Jan 2022 08:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945E710E72B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 11:29:52 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id p27so8169466lfa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 03:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=/O/9gbEgb/RsADKkHzPbBZ+dKCzV5A6qaT+Ty+GAygs=;
 b=NyCoWG49BpQBxaruMTutTBuStWQyn43epxiT0gOU5UGakpXSxVwJMN2Q5ptdoCiamC
 3RfdPspfwkG1ajs+tCjdYfeSkqqnbRR25DS0BKwk2j9OIgugkEk+9Df0TLxdiJFJ3PwV
 dPFmoptAK/h2KfPLz4DRlVT2YSb641X9DhGVW/rRguAtFbTI2mw9DwhYM+q4dU5Bepoa
 OSBA+8jzXLUEMKmHjLoZv3Hj4zDPXGE+y+Q+fnk7Wbj+J7QaxZIFy17cBQLmFJFacDC2
 5rFo8iY+iW0pAgQtGCkLE1h66522LXnxhvrmQS1999S5aUr/ckLVcn4Q3xGndjAzEVg9
 KSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=/O/9gbEgb/RsADKkHzPbBZ+dKCzV5A6qaT+Ty+GAygs=;
 b=uMM6bAVvZU/OqtidoCxLvnIiYbQ+PQt7chmyVaRGgVDGKydi26oqGsQixxL3IAPFVm
 tQaPq1b+nqfmeBosSQVl8QIU8P26L6eEiO+0g2cnxoSvJyRB3fUQ0SjNKdKWIgThnQnq
 gZ93blU/Jf+tWLdaOGN8Pbd7ZxCsY+P5TklIJjy4DQACVSn3GtTD1QyrE0rR9ZIJ4abj
 89FYDrDupIfaT7PQ5phrJXP42OpcTOkwGQIJVp80BM6ozvUIrMwD2oJ/oClaVMyHCCBa
 Xf5ZyIYgmMq0mF+7M3LF20eh4gXeeQsXcrcD21TBaFWimaAvpooKykqsMp2yNo+5p5D8
 OMKw==
X-Gm-Message-State: AOAM530yScxvJWsAYs2n6I2YuRfijKI5lzREuj84szKA+dR1hMnPvmCQ
 H5YCd+CdzKZpdwPSzrWcvmE=
X-Google-Smtp-Source: ABdhPJy1z4RS+ms7ntE5sNfDU2ljl1ujtIN9nfavJi4ukAug4R6nUw7GZ6yKgchAuaUxn91nYztotQ==
X-Received: by 2002:a05:6512:3d94:: with SMTP id
 k20mr25617078lfv.272.1642591790928; 
 Wed, 19 Jan 2022 03:29:50 -0800 (PST)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245])
 by smtp.gmail.com with ESMTPSA id w10sm1980958lfu.173.2022.01.19.03.29.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jan 2022 03:29:50 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v3 00/22] drm/rockchip: RK356x VOP2 support
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20211220110630.3521121-1-s.hauer@pengutronix.de>
Date: Wed, 19 Jan 2022 12:29:49 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <AA3A26CB-6282-4A6B-99DC-8042DC8926BB@gmail.com>
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:47:25 +0000
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
<s.hauer@pengutronix.de> w dniu 20.12.2021, o godz. 12:06:
>=20
>=20
> Third round of patches and last one for this year. I hopefully =
integrated
> all review feedback. Additionally the driver is now fully converted to
> regmap, so no struct vop_reg necessary anymore.
>=20
> Sascha
>=20
> Changes since v2:
> - Add pin names to HDMI supply pin description
> - Add hclk support to HDMI driver
> - Dual license rockchip-vop2 binding, update binding
> - Add HDMI connector to board dts files
> - drop unnecessary gamma_lut registers from vop2
> - Update dclk_vop[012] clock handling, no longer hacks needed
> - Complete regmap conversion
>=20

Sascha

I'm using you VOP2 code on rk3566 tvbox (x96-x6) with very good results.

I have just few questions:

1. how support for CEC looks/prospects (plans for future, not in this =
code, expecting others should implement, etc)?

2. VOP2 code works nice for me for x11/glamour and for EGLFS with EGL =
DMAbuf rendering by Mesa EGL_LINUX_DMA_BUF_EXT.
I have issue however with app. rendering to DRM planes (GUI is DRM =
plane1, video is DRM pane2).=20
My ppp starts/works without any errors in log - but screen stays with =
kernel messages content.
(it looks to me like i.e. app renders to DRM plane but DRM display =
driver not pass it to CRTC. just wild guess here...).

3. in kernel dmesg I have many:

"rockchip-drm display-subsystem: [drm] *ERROR* Unsupported format =
modifier 0x810000000000001".

It comes from MESA i think - but i suspect because VOP2 provides =
unknown/wrong DRM modifier to mesa?.
I'm not sure how to progress with this (talk to you or involve MESA devs =
or wait for VOP2 v4)?

Again: great work with VOP2 on rk356x!

