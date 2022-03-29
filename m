Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E0F4EA888
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 09:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485C810EFF4;
	Tue, 29 Mar 2022 07:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5937B10EFF3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 07:31:09 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id a30so14822724ljq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 00:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=XWnk+pKdZJqmV62/h657OWIHY82bAb8Z3BgjqTiOLz4=;
 b=ZCavqCdVJwYtGfT81BfsVjv2DbWIBe15YHPAb2is2LlqnbovkJCrWB7jH14nRSJsbc
 1PeyPqzQYMIhT03U54XHuSToZmfYPBcMumixdH39LypobqzQ+YGKtqjXV/Hu9zm+Mgcv
 6gZyCzkU5ySSErh38hFZ8tOjr54LdLAsmBoW45UOoFqVTMOq0mG2Zq55SaaYQBPI1PIp
 DQohnuBitjJ7L1+05TsrmaqyziJ5QwMZZFuVe+LAj6hxFW2gv8+ZjVg9zsMGdbV6Hiv5
 NqQGtElNtHViCHkWeFk28wQyGb41x63um96QvtKx/rq3bXRIszv79P8E2F1rv7X2ODfS
 +hfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=XWnk+pKdZJqmV62/h657OWIHY82bAb8Z3BgjqTiOLz4=;
 b=HaOA/LI2NIqM1VufTzrMAqAK8DULRZZ/XcrUJglLy8vbJivioQAuyhRdI9N+475OgD
 z+eQTEW4BEm5N93iasrfYmjLTQZ+1KHuDniPseJZyQNrnEXBLEjUUhshJowXUMtjX9wf
 9YSCk+OGq1B5TL5YvOreHK8tGOVy+9eKQh0Yj1qOoPaHDMtk/DlPm25ozspp/Y/CDLqI
 t6FdRrfDENh1X4y0VgvJKWdBRdIIzOTLHiro6d1QEKIbAIljxSrNl3MOq3M6vEZWKnRE
 zCQMvtg7hsSXz041/G8o4rASu+IvyHjuycTLrnh8aH3xNUQ5/g8nhX+eoPoudEoiuzxf
 VNTQ==
X-Gm-Message-State: AOAM530TAW4AV7vs/xjAvrUm3Fs/yCVpcCh+rECfOwVjlKD5lEC0wv11
 aH3E/tdqrTxdr1T4ZQPZ4wA=
X-Google-Smtp-Source: ABdhPJyT5tL6mJoGz4sCX2mi3mIH2uu0ICIFJhwPC75SzUetOpN8XKJFv4/ZDm10r94iaB6qmCbJlw==
X-Received: by 2002:a2e:b179:0:b0:24a:d3da:8691 with SMTP id
 a25-20020a2eb179000000b0024ad3da8691mr1412035ljm.392.1648539067518; 
 Tue, 29 Mar 2022 00:31:07 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 l18-20020a194952000000b00445bf2c3b83sm1898047lfj.58.2022.03.29.00.31.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Mar 2022 00:31:07 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20220328151116.2034635-1-s.hauer@pengutronix.de>
Date: Tue, 29 Mar 2022 09:31:01 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
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
<s.hauer@pengutronix.de> w dniu 28.03.2022, o godz. 17:10:
>=20
>=20
> Changes since v8:
> - make hclk_vo a critical clock instead of enabling it in the hdmi =
driver
> - Fix vop2_setup_layer_mixer(), reported by Andy Yan
> - Limit planes possible_crtcs to actually existing crtcs
>=20
>=20

Sascha,

FYI:
I was hoping v9 will fix green screen issue i see when video player =
wants to draw to nv12 capable drm plane.
It look issue is still present :-(

You can easily reproduce with modetest utility:

modetest -P 43@67:1920x1080@NV12=20

gives green screen.

however if you do:

modetest #43 (green screen)
modetest #49  (ok)

then

modetest #43=20

gives expected result ("rainbow" picture on screen)

let me know if i can do any extra tests helping you to fix issue
=20
br


