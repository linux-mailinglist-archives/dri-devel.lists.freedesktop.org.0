Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288E3733F3E
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 09:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1521210E008;
	Sat, 17 Jun 2023 07:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8313310E008
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 07:38:54 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51a200fc3eeso2129892a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 00:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686987532; x=1689579532;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=67YwpV4r/TA8L/XN9KeePCcghZaMw0dJnLsptSbS9OA=;
 b=lKJ6yNHVIk4OM5Rx6O8vvglodaLiXJITSBOlbOfJGwEHv0MsBvescU2jnfSbwfLGJf
 mBJTHXlp5xoEnw5mVNnIXQgQtw0MrR3bmefZ2QmCkLNMs/xnQifwxUwUlILPvNW59b8N
 r6k7pqBCEkvBy/6olQjd3y4oWubNq9qH0rwip0cAJLUTG8zyeyHS5um3qPeVqNWjxMvf
 /+OngTaWdZZiop4aVVNc4ZAdjRDpt2UHpqna0SWIl9AFqzyJgoS56IxqsbeBKO+Wxxr4
 Lm1CgpcN977UelBv8QH8ElOBXwRl82PW7tZkH+fbxwc7jDPSPKkqX94gWBzNy+zbu/P3
 lVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686987532; x=1689579532;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=67YwpV4r/TA8L/XN9KeePCcghZaMw0dJnLsptSbS9OA=;
 b=Y1hXTuFiCB0dE1GPmtRzcHkbGG4w30VvMsxzy7fF2ZoBdAVh7Nty9Vd1bhDsZuqSu3
 B5JHJ3YotKnCuKw3hRGalbUkzAlQPzraIFwxnL6oMOWH3dncSsaOPWUdQpG8zGy+j+mF
 97lf3X9cfj4YlncWo24ZhRkeLWRSPwP+Jk2EMqOGMkd2+8P7URinpovCdjWbjpPw3J/a
 BwHfYOi+gywV9o/FzoCyYHXJNftNTvEqE3z2xWrR7E359tmJ+D+FcUK1PSbiD0Ut6KBP
 ELEDs9ik8gnSdH854bKQo/e6xXUu8Ub//ZJXlhXpkitv19iS3Xfww1/W85DFbNcsthNS
 bh4w==
X-Gm-Message-State: AC+VfDyTnGV0m4GamfdL2P6P3n7ewMc//BWFurNXfnwnQAjbX3E9BuqZ
 l1Zs9QvxQDcPOregYAtXj7WmWw==
X-Google-Smtp-Source: ACHHUZ4a3vmkFekym1Wy32PM/lXo8GJNMTPsYYtsp2+g2VcUZnlEIFYweqBuiWG4OLclZzUT0aYqPg==
X-Received: by 2002:a17:907:728b:b0:96f:a8c2:77ad with SMTP id
 dt11-20020a170907728b00b0096fa8c277admr3992090ejc.63.1686987532568; 
 Sat, 17 Jun 2023 00:38:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a170906705000b00986fa07729csm864795ejj.94.2023.06.17.00.38.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jun 2023 00:38:52 -0700 (PDT)
Message-ID: <fc36dd50-7d4f-6232-ad59-968f929b6b6f@linaro.org>
Date: Sat, 17 Jun 2023 09:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add Mitsubishi
 AA084XE01 panel
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org
References: <20230616163919.2805694-1-miquel.raynal@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230616163919.2805694-1-miquel.raynal@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/06/2023 18:39, Miquel Raynal wrote:
> Add Mitsubishi AA084XE01 8.4" XGA TFT LCD panel compatible string.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

