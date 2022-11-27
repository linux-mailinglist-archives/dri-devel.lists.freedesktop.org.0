Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7924D639CF2
	for <lists+dri-devel@lfdr.de>; Sun, 27 Nov 2022 21:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A059E10E12C;
	Sun, 27 Nov 2022 20:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A633B10E12C
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 20:43:53 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id r12so14598139lfp.1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 12:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WU620aZn5AL/waGo/b9AZT3G8pG+gupJvw4MWpZ4moc=;
 b=O08/eujaW85+C0IWwQZNyo+5jCluWgzwgCv1bic2nSoyedz+35AiWulKdyqmvSY5XD
 dwyhcrsmrBFWHvFzAzxv5/9qbg5ewkeZO/KZkt8XXDZMuYXJwLTSIvgECOMMeSRUhsst
 Des1PU/FKyv2TaZrC3sJoDJCHXk8jE/Y9JN+u7BZZ1P9W0SD40I0KjQ/8FhmBC+HdKOb
 hBiPkGiFOs9iGPEslHHBZ7MVE0/UsC0hHPTkkN8tPTdqC8OwaVux/tDjVFKA9vzaQqvF
 vwMv+fZv7j9ZoSRtr7eod2/NnLWFX3OJ+G4aAaNX+jD0siCVHHHACJFsn9/PPf4cchvQ
 ID1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WU620aZn5AL/waGo/b9AZT3G8pG+gupJvw4MWpZ4moc=;
 b=Kqf65RMVYv9fuu8SGVMDD2GzyH6t2XB+84NOZnrCBxa84FUE3UuooSpNWGpj5xFtky
 aOBfQhA3i/Mbqj67oIP+1k5S3GMFSAvYAlRLsvIbxouRrUZ/PzTuenAtY+fQFVdQaGHX
 cJNrlkkv5DJzclkzCOENQr6Bf+m8P35SdbNsQaK3FQlPS/s2whzllMrNAXAZWpP4RO6U
 5BwcFzMWygToJ3ZC4mW+1aa7oJaJn4qrbXsTnetWXxWZiY6N9vmaVpnU4ZwZ4iVQmi5z
 AIOyWjLKIq71Yv72bqqn525U97m2riHxKt+5BH5crdq68PWBHkoGCXKspls3pGFePxgH
 wXGw==
X-Gm-Message-State: ANoB5pmB+1S6Vbl4fJULN17LC8Uy9tQpoWjt5uedxKvebQ0sIoOCV5tm
 76raFz/xgexok2BQxMsdFJC70A==
X-Google-Smtp-Source: AA0mqf740r5rtGE153p6xDrYfBPt+Z+fKCo/6jqO6P/zfAXOEUsysF06L2sUe7TSKt4FGHwULSyUEw==
X-Received: by 2002:a19:4352:0:b0:4b5:1334:a1f8 with SMTP id
 m18-20020a194352000000b004b51334a1f8mr956057lfj.401.1669581831481; 
 Sun, 27 Nov 2022 12:43:51 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8848000000b0026b2094f6fcsm1049350ljj.73.2022.11.27.12.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Nov 2022 12:43:51 -0800 (PST)
Message-ID: <a71312e4-e8c8-ec35-6d90-5c363cc99ca1@linaro.org>
Date: Sun, 27 Nov 2022 21:43:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/4] drm/tiny: panel-mipi-dbi: Support separate I/O
 voltage supply
Content-Language: en-US
To: =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221127185948.1361083-1-otto.pflueger@abscue.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221127185948.1361083-1-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8
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

On 27/11/2022 19:59, Otto Pflüger wrote:
> As stated in Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yml,
> the MIPI DBI specification defines two power supplies, one for powering
> the panel and one for the I/O voltage. The panel-mipi-dbi driver
> currently only supports specifying a single "power-supply" in the
> device tree.
> 
> Add support for a second power supply defined in a new "io-supply"
> device tree property to make the driver properly configure the voltage
> regulators on platforms where separate supplies are used.
> 
> (Resent from a new email address with proper formatting)

I just got only this cover letter, no rest of them/thread. Mark resents
as RESEND:

git format-patch --subject-prefix="RESEND PATCH" -4
scripts/get_maintainer.pl 00*
git send-email ... 00*

Best regards,
Krzysztof

