Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B91E5B2381
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 18:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E0010EB4A;
	Thu,  8 Sep 2022 16:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9668F10EB4A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 16:22:52 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id ay12so11208885wmb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 09:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=BGJkDCrH9LUETLojStwhWIkhR+B86SO7RtaDm8mEauY=;
 b=RwwiQVwY3vPDuBMeJPweBE13KC2iNRsTP4Vym9M1/Csm0+yjy39dSZH1eRmMJQ7DPf
 X1W0LL7pZBiVEjDYb8rni6zFiWXk6JPpre+OPuSyyTGKG2J2Lnw2ZZ/DiioV2puNrvxe
 lgJKA6xkp4yD0gVlJsyYmJT98qPycD9g3d8Ef3nRiaS4pnFgg/9+NXbuH2wplSNb3PLX
 5iwiYkF0c//LMUt89PSWwemaaMg+fpQPqjwinnhTywaw5UFB7ztNNK95XEVRyiqkvweg
 A2pWaONnp6dXB4FXxNq+2FnCwhN57frNVkLEhERdAExAlMezKX2Dll3/t0Lx5pi82Cj9
 iRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BGJkDCrH9LUETLojStwhWIkhR+B86SO7RtaDm8mEauY=;
 b=7Wa0fUlPBiXNt9bmgkcal6CfLmH9WnQLdUpPT+ohYndS9snyTUhGbXFCbu8fRHvLrk
 VOGyIhCkfMpo5QH5467bpZh9I9hgWk4zVg6UbXPqJiMuGWZB4TXJzioXfyG71XtJejmB
 nYKxkHS3S25qP7k0Evw/4j9NT2/j4otQPK/D5DNoNAx4b24xbiu5mtUNwznldm81ixKI
 HAecqu4kxbgM6mJTl9oMDE118UwZ41S2raBGS42fmHb6YXRLH9+de4y3O72MlPqf4jJZ
 LSSRdhcw9t4gPG1kKQqk/ZWBW+dlV/rTkAzS7tkRjGeUqLc/RrNxW1NJF3GawvpiVaD4
 aahQ==
X-Gm-Message-State: ACgBeo0HvHLRjyl8Git9jr0DQN5YYC8/e24/daMXj1Liv/Sb6UH6w8Zh
 aSa7LSD1wt+xavVe8wH6woA=
X-Google-Smtp-Source: AA6agR6pbG+z44fWrfFFIpuYP73XS0I+jlnQ3zyiFTQUkL9ZblBelz2Ua8uw4IiIH1knjpm6bfYGuA==
X-Received: by 2002:a05:600c:a199:b0:3a5:dddf:ac6d with SMTP id
 id25-20020a05600ca19900b003a5dddfac6dmr2795265wmb.44.1662654170957; 
 Thu, 08 Sep 2022 09:22:50 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net.
 [82.149.1.172]) by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c4f1500b003a607e395ebsm4357001wmq.9.2022.09.08.09.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 09:22:50 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v4 2/5] arm64: dts: allwinner: h6: Add cooling map for GPU
Date: Thu, 08 Sep 2022 18:22:49 +0200
Message-ID: <3508969.R56niFO833@kista>
In-Reply-To: <20220906153034.153321-3-peron.clem@gmail.com>
References: <20220906153034.153321-1-peron.clem@gmail.com>
 <20220906153034.153321-3-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne torek, 06. september 2022 ob 17:30:31 CEST je Cl=E9ment P=E9ron napisal=
(a):
> Add a simple cooling map for the GPU.
>=20
> This cooling map come from the vendor kernel 4.9 with a
> 2=B0C hysteresis added.
>=20
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


