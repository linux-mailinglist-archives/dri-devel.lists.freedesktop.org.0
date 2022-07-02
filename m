Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E19565ABD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF2810E361;
	Mon,  4 Jul 2022 16:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFFB10E002
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 19:06:10 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z19so6674472edb.11
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 12:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N0yu1El6vOD8A0gSx756Jt25HtpMxiSxwi6fNvLtoxg=;
 b=I4sXXmxDa/iZ225kkuLhwo9R+auGLloq99vC99wWuA7xov8rtKLRnD4nCrU8UbINB3
 6xypnAMT5Waiixv3xn8tW1xeyEQ3+ClVhd81CjOcKXGVDOeUkT13SqX3XM6EoCl4mZNF
 +gupnlPKVrv0MSsooUatuOJEyIqAypMd/4gRbTSOt3QzPcMyq7FsIVVW1SQM/uuDIXkZ
 gVa6joh8wIdt8MOBwVgeGryWLGywj8xdbq7UKuJjQGapV49d7kXlcme/mY3W+5Sygbsf
 ea11/cp1vHsccmOcFr8rrgx2yEulKEoC9ytXTXwOwDo4/zZTf5D1RGcoti6J8eK3cMXC
 v4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N0yu1El6vOD8A0gSx756Jt25HtpMxiSxwi6fNvLtoxg=;
 b=PH10EcfEHs5UetywWDKtPT4Yd+QdWOrikVoSg1pxNgroqlkTP78/NZ4goLfk9RUShD
 dI+Qf02Dj8gTn36WaMWufqjH1/tXu2qvEhW+wnKm1B7t0fX5TDbNxm3lD7JSSvLw+djj
 JKC2GHkrFDqCNIeNAb0hblWZDcyDhu3AoijjPBrNXeov31Ox//B0zvFfJwuYA7TSryOL
 7f63x5tvg+zIjNRRMeY/N0aIet4+UU7o7Cezxghnh3VgEsuS9J0xv9mSHPQbSgW7mjlP
 rJp+DX8f1uR+uuGv+meJEcBnsY2Pufz+4AOW+kPnzKJN+Lo3FgQfSS2uV7G9KekpFd3x
 MvTA==
X-Gm-Message-State: AJIora8zmtDXeiAcHdtxf/pvPbMg6okuJogsxHeC12VzinzS5GdqCTqP
 9p5f2Clat85Fz+6hqRMU4hw=
X-Google-Smtp-Source: AGRyM1uMMhIQ4Yw/s8eXzx+VpJdxchNQa9w2WGeJr1Rl6GkGJCDIxVskSkBGawHb9dTWaD4Ev/CxTA==
X-Received: by 2002:a05:6402:1774:b0:435:7fea:8c02 with SMTP id
 da20-20020a056402177400b004357fea8c02mr27136096edb.213.1656788769330; 
 Sat, 02 Jul 2022 12:06:09 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 c22-20020aa7c756000000b00439c146efc9sm1244786eds.60.2022.07.02.12.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 12:06:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] dt-bindings: display: sun4i: Fix D1 pipeline count
Date: Sat, 02 Jul 2022 21:06:07 +0200
Message-ID: <3674367.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20220702032921.22433-1-samuel@sholland.org>
References: <20220702032921.22433-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Dne sobota, 02. julij 2022 ob 05:29:21 CEST je Samuel Holland napisal(a):
> When adding the bindings for the D1 display engine, I missed the
> condition for the number of pipelines. D1 has two mixers, so it
> will have two pipeline references.
> 
> Fixes: ae5a5d26c15c ("dt-bindings: display: Add D1 display engine
> compatibles") Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


