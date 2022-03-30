Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC1A4EC735
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 16:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102A310E1E6;
	Wed, 30 Mar 2022 14:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E13210E1E1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 14:52:26 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id h7so36291071lfl.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 07:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=hc8fraLWBmPS2+8If+3/sRtFOFyaAgxs5c6eZI6wZpY=;
 b=m3AUKtB/RoJ+VRRoPr4TRft7zBZzhRqjrSHJ6EuPYQX2QVUUAsjvrYumRBliHhkKsx
 Dn4kcYGtA0NU7Vyuz5Edy5eOxK1QnQ4SeAmDUSuz8/lJoc97fvrhQ1lNDHSwWZfmqt6z
 UQqwlJXi6F5m3aPTMCVg6KZYnj1fcjZBqOtLzFOqIIKFDGbbv9qdyLLhb8/DFXCBF3qP
 bDSNhqI/aK9YAAAJlMvLRpLc7m8vB5/2+S/UVAc8fBUydLRzOddeU6BQ7QgFsfvXBtLa
 lJvHWb9RPw63H4YcOOaClFMdJqpoTcs41Wt64Xm/JK4tVL8aHQSC441jLgVCE/Dt6bGO
 wb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=hc8fraLWBmPS2+8If+3/sRtFOFyaAgxs5c6eZI6wZpY=;
 b=yPsCCdZJkWr0oT/0i5cd2qCC6IePWrL0isGKnQLsCDbZZghwK21g4vXwTGdfd+x7xT
 6fsWXd2nP7HmsvLE7eNq4zpTaN4PPh/fNfTpUQJvZ40RLiy/OjlQBWIV4mppt9CuiMYv
 4MaLmW7RO49j5lA/i95t4VqeR53h29DBZhKPVR9LIHaqgrtIhFIFxwPmGe8PzbwT0IXV
 a9BsTau1BU1daB/F0rnfi5zWpQhAODTqQV28N/FsQ+53SeD9Xd/ehlTZA0y+hWyUKMtK
 Ng9J6ArepjYUhU7kwnNZhkVNu8uNqa903Y3opo5S7M6qMoZoWYtjHvIO1AkXXIjUvpPO
 meMA==
X-Gm-Message-State: AOAM530rrgjRZchI9davrrRbSLz9KCH+qugn9uracJi4Uz7UbIvGHE3B
 zgMHmnOwqu6/Iv/vZvzoE/k=
X-Google-Smtp-Source: ABdhPJzyYYjDtGAGoeg7trsTFkePsA5/OO3BBWaZB84gKUFc4HtGpAK0GxybtA/ISrhgDJfp9iMeag==
X-Received: by 2002:ac2:4d8b:0:b0:44a:2aec:669f with SMTP id
 g11-20020ac24d8b000000b0044a2aec669fmr6981393lfe.49.1648651944653; 
 Wed, 30 Mar 2022 07:52:24 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 k2-20020a056512330200b0044a096ea7absm2351567lfe.54.2022.03.30.07.52.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Mar 2022 07:52:24 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20220330102046.GA12181@pengutronix.de>
Date: Wed, 30 Mar 2022 16:52:22 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <60601619-EF07-457B-91F2-64FEB598FEBE@gmail.com>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220330072822.GX12181@pengutronix.de>
 <0D8F5951-5375-46B5-BFF0-7ED410371EB7@gmail.com>
 <20220330094556.GZ12181@pengutronix.de>
 <D3DA14F9-C9C6-4927-B015-5B7D25689DAA@gmail.com>
 <20220330102046.GA12181@pengutronix.de>
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
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Wiadomo=C5=9B=C4=87 napisana przez Sascha Hauer =
<s.hauer@pengutronix.de> w dniu 30.03.2022, o godz. 12:20:
>=20
> Does it change anything if you do a "modetest -s 69@67:1920x1080" =
before
> starting the app? Or if you run "modetest -P 43@67:1920x1080@NV12"
> before starting the app? Or other combinations thereof?

So i tried following combinations

1.
-boot
-start app
-stop app
-modetest -s 69@67:1920x1080 -> ok
-modetest -P 43@67:1920x1080@NV12 -> green screen

2.
-boot
-modetest -s 69@67:1920x1080 -> ok
-modetest -P 43@67:1920x1080@NV12 -> green screen

3.
-boot
-modetest -s 69@67:1920x1080 -> ok
-start app
-playback in app -> green screen
-stop app
-modetest -P 43@67:1920x1080@NV12 -> green screen

4.
-boot
-modetest -s 69@67:1920x1080 -> ok
-start app
-playback in app -> green screen
-stop app
-modetest -s 69@67:1920x1080 -> ok
-modetest -P 43@67:1920x1080@NV12 -> green screen

br



