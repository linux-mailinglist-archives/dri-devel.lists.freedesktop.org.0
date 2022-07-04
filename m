Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C92FA565E97
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 22:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82B018B428;
	Mon,  4 Jul 2022 20:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DB918B428
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 20:43:21 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id r6so1540248edd.7
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 13:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5SgkUXQH5l8cW8OkSfWR9KslLQ4DlsgBpNjjffiER3I=;
 b=G5JeOSwftEpRaQHoM3zNdpWmB53p11R6ye5SAmUaG0t64gGczOXb8JX0/cvnrbyPDK
 bW5yI4qVLwNBgbvDpRuIpZzGhgei9QRBXlQWbD/mzd/GRVvowPzcmzENa2QZXmWxFXNG
 hEe239MMoOHdpRoPuNq5A+DYWgNqOSQrTmJCTAPMgvzStxpm9XGyC6eFOIkCwQl4Dsik
 sEPquI/IdCvtqMkZ5mKOBretHBoGHHFeVyR50zE5xU/cNvw4pURPJZMpQAE8bRUFfV3H
 4PBzZ8uwgZSt78DxKTcGHwghm2GYm82DqTS2JjzyNBE5UJeLfjb1kZe44KnORfB/LMbF
 VL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5SgkUXQH5l8cW8OkSfWR9KslLQ4DlsgBpNjjffiER3I=;
 b=eJcu6lOGtYes0/SRLx2undQqmSMM4UTHHYyEsq38LFWVb/uzdezaqo9a4o3l6zxdg9
 dx/3pVbVw+NZ41S63JZY/XgfjW4VrAzlEYtBAgCIm6EcbSSVx65lEVJU34Jqox4v4+kO
 ZvzF12SW7bQ8w4UHoMG8nKsIlG/6m06UeyvQbwS97PXKBraEFh3714GFATdHjAoqdnV0
 Hbmm7tJmAIrq2O8qVEE1rt2G4bodsaWLTPphLucA4+Z6RBH6j0mIAoo32sTgKEaCQW1i
 JIq8nxo7wCoqRvyXeomPoGDwOoVfnhmHgFCW8T4mSbeIfI7Rl7pNmtOXMOR5K3ZVmXJt
 5qHg==
X-Gm-Message-State: AJIora8XVfU6AML8pFQQ3m6K4T6H3yishX0RDhhyreniQWopQM0BVdbY
 w4C2/wt8WtC+EQ/LV+Uxpw8=
X-Google-Smtp-Source: AGRyM1uJg4JOYffjRpUlVFqnzKqPG26lAaeyXLKWrPya/IwhyIWItUAKp+GOUw6YxqxgzPLtmlb1FQ==
X-Received: by 2002:a05:6402:40c3:b0:439:6b72:483e with SMTP id
 z3-20020a05640240c300b004396b72483emr28796701edb.154.1656967399526; 
 Mon, 04 Jul 2022 13:43:19 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net.
 [213.161.3.76]) by smtp.gmail.com with ESMTPSA id
 f3-20020a170906494300b007262b9f7120sm14644879ejt.167.2022.07.04.13.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 13:43:19 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: Re: [PATCH] dt-bindings: display: sun4i: Fix D1 pipeline count
Date: Mon, 04 Jul 2022 22:43:17 +0200
Message-ID: <110465686.nniJfEyVGO@kista>
In-Reply-To: <3674367.kQq0lBPeGt@jernej-laptop>
References: <20220702032921.22433-1-samuel@sholland.org>
 <3674367.kQq0lBPeGt@jernej-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne sobota, 02. julij 2022 ob 21:06:07 CEST je Jernej =C5=A0krabec napisal(=
a):
> Dne sobota, 02. julij 2022 ob 05:29:21 CEST je Samuel Holland napisal(a):
> > When adding the bindings for the D1 display engine, I missed the
> > condition for the number of pipelines. D1 has two mixers, so it
> > will have two pipeline references.
> >=20
> > Fixes: ae5a5d26c15c ("dt-bindings: display: Add D1 display engine
> > compatibles") Signed-off-by: Samuel Holland <samuel@sholland.org>
>=20
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks!

Best regards,
Jernej


