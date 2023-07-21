Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 722A175CBCF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 17:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2C010E6AE;
	Fri, 21 Jul 2023 15:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87A210E6AC
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 15:34:02 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-521dc8ae899so2406455a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 08:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689953641; x=1690558441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e+J3maWKZDLZOHu0KMClUTkcLoWuu+H0TcJ6B1ppGIM=;
 b=fmDH21f77I25libj1wRrEk4TILKZ1kLWnMOmbSvfilgvRDaX/q9nI0LnO6BRwwLGyw
 g4JnW+IFQt+HznIwYpdXczSCO43cnfYgNAcCU5ljr0kBxTgU46cr6ev4SqEIZ2yHYbZl
 /+31gkI32NDaV/JIDkwmoD/mS26kbmdXRdCJFwQ7l5ihDpRHzBRd42vr6SM2dQ+gRKoa
 RCj0DGnoWV384OkZm/EzMt3wXooPGX9thKsillns/ckLFVKOCyzMFv5ezIDO3PxdEIpj
 XfuuKMAWBPKVZiOXw7/6NTCYGPvW3oaqbjYUfWeoQlvX098jxbIdIyLkRjlYP7SKMuHc
 5JEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689953641; x=1690558441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e+J3maWKZDLZOHu0KMClUTkcLoWuu+H0TcJ6B1ppGIM=;
 b=dpgouwH1M6dPTUkgMa5HeN79FcxbldYe3w8GdsWplNNpzmNtKHW+2iAaAwKlLaAwLT
 LYa3jUtk8pNeJ2aTGzDfcm6szAoDt1q3qBKsNEiwitFwwnjPxj8PA3yXU6FARCgSNA1O
 AUMIV18eaTq8TFu0lecVxg924vpAw0y1ByiOS4ATOd7aGdZeKU9Ij+QNgkkq/8Z5RR4I
 Fx1FbkjcBZeVVFUCj7CiodDEr7XnLhBdu5TWVdcIs2vTFL0m6/xwBZ+oM67mUrvERj1c
 Cw5VAzzcK5thvOE9XrF3AvE83e/2pGfeqLjVgnqw+lLrORnvyhYgcmenR6l9n5UW1b34
 I/GA==
X-Gm-Message-State: ABy/qLbiQU0trlVuo55/SWHD/YTCFX6BjYWw8K5AQRuxZNKm4qMljEKG
 uAKemUw5VEoICVVlQlru2mA=
X-Google-Smtp-Source: APBJJlHxHpHitpRJOlz0XvfBo0jSQ+i1+osJAXEtnMET5LtbtSRMYQN2nySPQ57QEZdfL8+yUCjgKQ==
X-Received: by 2002:aa7:c982:0:b0:51e:404:1e6d with SMTP id
 c2-20020aa7c982000000b0051e04041e6dmr1981954edt.38.1689953641105; 
 Fri, 21 Jul 2023 08:34:01 -0700 (PDT)
Received: from localhost
 (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a056402064b00b0051dfa2e30b2sm2244385edx.9.2023.07.21.08.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 08:34:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>
Subject: Re: (subset) [PATCH v2 0/4] video: backlight: lp855x: modernize
 bindings
Date: Fri, 21 Jul 2023 17:33:58 +0200
Message-ID: <168995363315.3656835.14137740606773160898.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230519180728.2281-1-aweber.kernel@gmail.com>
References: <20230519180728.2281-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-fbdev@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>


On Fri, 19 May 2023 20:07:24 +0200, Artur Weber wrote:
> Convert TI LP855X backlight controller bindings from TXT to YAML and,
> while we're at it, rework some of the code related to PWM handling.
> Also correct existing DTS files to avoid introducing new dtb_check
> errors.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: adapt to LP855X bindings changes
      commit: faae0778fa10fa4e8909fe9164f06acab170f1e9

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
