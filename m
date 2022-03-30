Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3314ECD51
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 21:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9974510E182;
	Wed, 30 Mar 2022 19:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED0110E182
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 19:35:22 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m3so37605318lfj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 12:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=+hFS9yiWXU5Tm3A7GxdPXoa2m44Y5zzRQ3RHb2S5heA=;
 b=lbfzE5JFB87L0Z8EWEHyM+kuNGb+OvmW8NCsV3/EVi8u1qjjiLXRq7oqKajqRZ7ZSl
 nnu1RObxvYQbZVLYJ1tkczqhTD+lqdj4SMmgpWHqqBtCO/nATFK3NhicR38BMgFj3Mn4
 lUo+3NeimaiebVbTXd0NzshKT69ZbSPfcF8FvsU/Sm93VXN7iC3h73K5gm/v+ToxP9BX
 8JESl+XrimPd+fNrEK0hGZc2KsJ8SZimPetuLJ1wL3fWb6r8XzK8vBroyS4l4NhP1Vy1
 iT5tA+HSp+fVeOfGm1CkFLuMvILcwaMALnr02RBY1tfitUFDIkrqDmbCGksMcUXMf9am
 L+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=+hFS9yiWXU5Tm3A7GxdPXoa2m44Y5zzRQ3RHb2S5heA=;
 b=TlO1yRvt8V6Z6BPnpwCdRNcKojB48/0gbnmu3MrC0oT10mEqe186mCaurrww8oO2mq
 rhwfGWn8WUkfT1Z0J3H/oPmho1VaPkTxPwWSo81X/DuGuqbADcpumN/fMs/kw7AJTMEL
 sYCc0yd8YNUpwsobEp0tuVGY5HyWBjY2zdp+BwwrSS3ND8EM1/63XREDHcZh0PesxE7v
 u93v+pcyTuJRj8NqlsjZZn/W1uv5sdoI18Kc7lIE8b85KLVObe0LXiNY7SHb0kcWIipO
 FbjUaR9dZ3bpREhKaROihMq+HU/3yPgCPKiPn/VLhVGlDurhNi6zUbwqTGzqr+7zvHv/
 K6+g==
X-Gm-Message-State: AOAM531/JYC1fX6w54J+VB8R5MO+YG2u5RYkLzMvLH0T37aBKDdQn4t4
 kyJ+FZBP+zL7Z+B5P46TIEA=
X-Google-Smtp-Source: ABdhPJybiNtzm3A19YbhP1IZApDmGW72t2M57isGlDBtcyv1zNdYWTmgJc38kheIaiBAJl3rSRXXIg==
X-Received: by 2002:a05:6512:3e10:b0:44a:4443:76a9 with SMTP id
 i16-20020a0565123e1000b0044a444376a9mr7831211lfv.630.1648668921051; 
 Wed, 30 Mar 2022 12:35:21 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 194-20020a2e05cb000000b00247eb0e1b15sm2502598ljf.97.2022.03.30.12.35.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Mar 2022 12:35:20 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20220330192054.GA4012@pengutronix.de>
Date: Wed, 30 Mar 2022 21:35:17 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <4B10A821-DB1E-41EA-B5C2-364F2DE53F93@gmail.com>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220330072822.GX12181@pengutronix.de>
 <0D8F5951-5375-46B5-BFF0-7ED410371EB7@gmail.com>
 <20220330094556.GZ12181@pengutronix.de>
 <D3DA14F9-C9C6-4927-B015-5B7D25689DAA@gmail.com>
 <20220330102046.GA12181@pengutronix.de>
 <60601619-EF07-457B-91F2-64FEB598FEBE@gmail.com>
 <20220330192054.GA4012@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 kernel@pengutronix.de,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Wiadomo=C5=9B=C4=87 napisana przez Sascha Hauer =
<s.hauer@pengutronix.de> w dniu 30.03.2022, o godz. 21:20:
>=20
>> So i tried following combinations
>>=20
>> -boot
>> -modetest -s 69@67:1920x1080 -> ok
>> -modetest -P 43@67:1920x1080@NV12 -> green screen
>=20
> I have no idea what is going on here. There same commands work for me.
> You could provide me your kernel config and upstream commitish you are
> working on, maybe that gets me closer to your setup.

Sascha

May you try with my kernel config?
=
https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-5.17/f=
iles/linux-5.17-arm64-armv8.config

If this config will work for you then:

i'll try to build vanilla 5.17 + minimal possible set of patches =
allowing me to get video decoder working on rk3566.
This may help us to find why:
-you have it working
-I have it not working



