Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730AC5524AB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 21:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCBA10E586;
	Mon, 20 Jun 2022 19:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336D810E4F1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 19:41:53 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id ej4so12560091edb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 12:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gOWWD+MkHTNlcYvKrVAOm7JvUVFBFo9uR5vqftGaLjk=;
 b=W8WmVZih7quVxfKEfljPR5j340B6P5N8FAd6PThBNHnDdEz20tbqna8RfEO4buTT+o
 PB6Mr9kZXPLoFT3zeROiP6JPq5kjGr1kp+n86NJXBdqJzLnxGIoZXUzouCDrL4xzQ1eZ
 VHrgI/e25ZEHf9nsRhA5uwRPhhxZvjNrrcIQ7KTB3XxSlzS8GFV/Bcuh4cc3aUlnY++u
 CruztMHrGCIKSxJcpm6y8MjAjeITOLAKNCTRD7o4HNLUcU+nG1/WqTbRdslBpZjQtXqn
 9O86yUBRjRuZOlZIKEDaCdO64eRYiuqQJytg5XUjqYGU9/g22VsdYw6HJ/PaU9wPLNV+
 fBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gOWWD+MkHTNlcYvKrVAOm7JvUVFBFo9uR5vqftGaLjk=;
 b=zwRJ7GXmZOHaRPBDx3fHdzdV99nJ0debIMoVuCDezECUAtUwGlPc9hyOWQSW7mACeN
 DRQc3BaSgrczbvvRr4KDpnX99LrgGpctA1wkC5fIRA6TQ6NajoW/drja2eEDumgvutGd
 Ur/mdUziZhZK+MyANZql7OW6b34KKMH5J0qo/MVDRrIg9U2CiM6sZ3ZB3LGK5p5LRvJO
 k1wt2t1JPocLpJYtmuXNKjpjpR68Ro4WBNDsX+BcNDMfBxPU/c7ws2V5oW4UJGDrc868
 LRVsCHqBWpcun4WUvP7I9OU3lSDsRSgraNgb8TB6JiFdiMs9b8uil2M2sbMXpB6yn3+W
 s0TQ==
X-Gm-Message-State: AJIora9Sg7L5rEfqIjZf47z3GG9AUkOV1DcTXSOiT4SxGvmIzMz4G3Rf
 IEWzZpxdO+3yQtynhkogC9aFFg==
X-Google-Smtp-Source: AGRyM1seu3VdAGMNSioKh2kKiJeSLRPGQAbOvhltJz+6Vxq9Z5CFbQUdUf+IFg1adIHARFl/Z3j+vg==
X-Received: by 2002:aa7:cd66:0:b0:435:74d5:2d58 with SMTP id
 ca6-20020aa7cd66000000b0043574d52d58mr13788414edb.34.1655754111793; 
 Mon, 20 Jun 2022 12:41:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 o18-20020a056402439200b0042fbc23bfcesm11448549edc.46.2022.06.20.12.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 12:41:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: daniel.thompson@linaro.org, linux-kernel@vger.kernel.org,
 lee.jones@linaro.org, jingoohan1@gmail.com, bjorn.andersson@linaro.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 kgunda@codeaurora.org, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski@linaro.org
Subject: Re: (subset) [PATCH 1/2] dt-bindings: leds: qcom-wled: fix number of
 addresses
Date: Mon, 20 Jun 2022 21:41:44 +0200
Message-Id: <165575403866.144830.12885632479282358471.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505154702.422108-1-krzysztof.kozlowski@linaro.org>
References: <20220505154702.422108-1-krzysztof.kozlowski@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 5 May 2022 17:47:01 +0200, Krzysztof Kozlowski wrote:
> On PM660L, PMI8994 and PMI8998, the WLED has two address spaces.  This
> also fixes dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: leds@d800: reg: [[55296], [55552]] is too long
> 
> 

Applied, thanks!

[1/2] dt-bindings: leds: qcom-wled: fix number of addresses
      https://git.kernel.org/krzk/linux-dt/c/ba52039325826b3f2bddd00972f3f61fbe7d9f0e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
