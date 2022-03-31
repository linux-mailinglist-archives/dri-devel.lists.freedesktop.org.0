Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E5F4EDC62
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7A310F392;
	Thu, 31 Mar 2022 15:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB8510F392
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:06:40 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bu29so42157165lfb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=iEeqXgqN7qNwmQ7SU0adYJu3zAo5+AxJKS/k66U7Uuw=;
 b=cSdCZGdJoMjReN01pR3Q7RjqXLfM/ds+zF+IGB5HU994zhdMp0MUwm7zC4myMiGEIC
 8R5ssSK40FIlevjSNoHjC8kXgJFSILuT/JItQh4qmwXwKnutMvBXuiRdQBnp1jv0iemr
 kYZR0Vrlwu9rj6pF+2LiP+biOfQkfK+kamY1vle2Ye0KNJpORClIuM25P/G9ndQMo3ka
 Evb7/Q2iWADK9ySutmkfanI748dH8qelFdtI4CcrD8H4HJt4lWpqRuif896AdevqTW+B
 ZCS+6ITiFb7poKmgiSIoEX9A+zj6J0QeufKFHyLIf563VeF3Kt0tf9WxGuhXAAS4zobe
 F+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=iEeqXgqN7qNwmQ7SU0adYJu3zAo5+AxJKS/k66U7Uuw=;
 b=6qqbOKrKDyJuc7nmJP7PDZmtNCmsM7F/EnvnwoH8yam2kEYAI6CBikWlVM1qw6Yu7R
 6lLr3liejGrzsQ3Dky9PnDMPtSZYDVSKMlW9IlaDcJAHlxE4tbta05ze40wIgI+CAzZ0
 quf2NEa2OBVRWHUEgiyjuYlsLsrZbGhtqn84VT/qBCtdbVgg2FDf9N8tDEt11tViPki0
 7inJH67zdA8Z0oBFtf5A8r+44Y8qQSS9E+tRvXc7nGi22f6VCPMx7tnweq+JdozwR29p
 L1orS4IIfUxnYmxvf1+lNTUyt0f3WYMlD5K5kr+551+uo0uTKknuvJ0FWIjWoZTy+YAN
 LOEw==
X-Gm-Message-State: AOAM530HXKiU/hBUBWkhB5/x/OsmXK36R/dlKssUuLb0ssgInozjk8mh
 dwdt0k6I39D8nYUecMCgHiA=
X-Google-Smtp-Source: ABdhPJwqfhKwVkGEAlyRMgBOZAf1wO/XCh9gwyq4jSKNAmK7zbJ0HROyx7wXfMKYpLhCy8ArHZKcZg==
X-Received: by 2002:a05:6512:3f86:b0:448:9448:5561 with SMTP id
 x6-20020a0565123f8600b0044894485561mr10757975lfa.489.1648739198577; 
 Thu, 31 Mar 2022 08:06:38 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 e3-20020a196743000000b0044311216c42sm2694691lfj.307.2022.03.31.08.06.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Mar 2022 08:06:37 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20220331150056.GH4012@pengutronix.de>
Date: Thu, 31 Mar 2022 17:06:35 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <3A5C5A71-0CE0-4072-9502-75385C1C43F7@gmail.com>
References: <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220330072822.GX12181@pengutronix.de>
 <0D8F5951-5375-46B5-BFF0-7ED410371EB7@gmail.com>
 <20220330094556.GZ12181@pengutronix.de>
 <D3DA14F9-C9C6-4927-B015-5B7D25689DAA@gmail.com>
 <20220330102046.GA12181@pengutronix.de>
 <60601619-EF07-457B-91F2-64FEB598FEBE@gmail.com>
 <20220330192054.GA4012@pengutronix.de>
 <af8445e0-f4af-721b-709e-2eb7c488a8a4@rock-chips.com>
 <B7CD9D55-9F2D-42F4-9D04-17C6A5FEBB08@gmail.com>
 <20220331150056.GH4012@pengutronix.de>
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
<s.hauer@pengutronix.de> w dniu 31.03.2022, o godz. 17:00:
>=20
>=20
> Have you applied the bugfix I shared with you here:
>=20
> =
https://lore.kernel.org/linux-arm-kernel/20220330072822.GX12181@pengutroni=
x.de/
>=20

oooops

noooooo
didn't noticed :-(

let me try with it!

