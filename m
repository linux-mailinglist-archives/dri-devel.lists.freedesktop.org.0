Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D82D67AF5E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9697910E767;
	Wed, 25 Jan 2023 10:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8615310E767
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 10:10:42 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d14so12814303wrr.9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 02:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+YbmCODXrWbUn0nWKxLJPq1L6PfEga2OS1d1Yrw45IU=;
 b=EWZ+hu4S4a62p8gA2V9ZYPkv1qLN+s8IMtIROJN7y8CarZG2svVmLvXgd+cIXCTqYK
 NmDzRiCF06lhNIqcgTEj1tarMHcDsKa7kHDQPaG8pOtIq/W5AbCQB6RvTcD1myTpCzRp
 TRVPIsNn/MVN84z/l/E40mM1M3YZ9xN3d/JOW4gawseKTBi9l/HQ5vDPs0OzNhZfxYZO
 aDNpO0Ibc/PEQId4AU9aFKgNJhl4vADNywb3qlpc3BO7gpS9YHIB2cwG5XYpu1Xj9faD
 FC0dRFpKpviOy+GKJ1IlFSq1v3ihdct8DCv97iaxXiys1mUD8mQh4tZ+cpBZvSJ/9qt+
 sssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+YbmCODXrWbUn0nWKxLJPq1L6PfEga2OS1d1Yrw45IU=;
 b=0dJP8GUHMweN4RdrGVY2zZPl+PlcuJLESWp9EKFF8g0NJTcEnJvXE6jLs5ZxDkQ6hh
 Sns01p43aB6v1xGKuxDLfX93FVJbb+X0i7Mmredun2cnJCEuGvxONfcqbJJrfKqU5qmj
 5WqWPKaTXH+sCBm4/5l1jC1E1SLzF5MKUO6/00zc1SDeaJioEhxDOzwh0JZ6kJ5r2RgM
 nMLQOfuD8mHmbto8CMxTYn45V6MtdX0jqaTOq0joPr7LBm03JPxMkeNVF/e4rxwR9f+z
 5Ka9BZOLOj6FccFZiySyXkKrHJiK4s+pYsCCG3BwqdfXdsWTPkwrOMLdnLC/7RQVR6u3
 W2cg==
X-Gm-Message-State: AO0yUKW50nvoeaO+4kQ0EECOqGNFMP8vU8gvd/nTIwEcQa0VjsBMXXuW
 /3gnB5zeClXcd8EA1TjoayzINg==
X-Google-Smtp-Source: AK7set8k1yyqihkL7lEDeuIamGfJrPidQaf3VL7shCTdtPbifYjaUj0j3ZCA+tCz22qbl5k7/4CR7Q==
X-Received: by 2002:adf:facb:0:b0:2bf:b746:6224 with SMTP id
 a11-20020adffacb000000b002bfb7466224mr2062674wrs.0.1674641440862; 
 Wed, 25 Jan 2023 02:10:40 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a5d69c8000000b002755e301eeasm4024686wrw.100.2023.01.25.02.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 02:10:40 -0800 (PST)
Message-ID: <859715d1-a442-7f64-2345-60d0fe28bdb5@linaro.org>
Date: Wed, 25 Jan 2023 11:10:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Sebastian Reichel <sre@kernel.org>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230124230228.372305-1-robh@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124230228.372305-1-robh@kernel.org>
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
Cc: linux-hwmon@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-pm@vger.kernel.org, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/2023 00:02, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present.
> 
> Add unevaluatedProperties or additionalProperties as appropriate, and
> then add any missing properties flagged by the addition.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

