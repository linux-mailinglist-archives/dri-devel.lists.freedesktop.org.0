Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FF5629867
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 13:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E9710E3B4;
	Tue, 15 Nov 2022 12:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C86110E3B4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 12:16:12 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id b9so17274331ljr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 04:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b8a2trAk20zeNjRwRS1+8oYlaEQHwTwjT9p/pnuw5YU=;
 b=dVbIYOtdGkdVqly/KvZDhArnIz9Fg5uIJ7HwKYzGD5l3QqfLqCS/BgEctba5QO/jRi
 QrQrKowMdp+yub+BQE1jtloLdOnm4gFG4hi7EbaGD5AcNAOYhc3KlzgsrLOXoGQotw3b
 cz5E8/tR9A3SbwixqCSFycD2rCk/lxKGiiAcMPp2DgvE13Q7dEZm8DKTfduPgzfj9pdx
 CoVW2rzOHgAK/Qw/35cnKfyG3+lu7BYhpElAPXD65RgK4fSTncSy5LSU/tI6ZnOQmJPJ
 zsu/wY00PJYxTYXIcaGFou97tq3YGcZvHLHeKsDErsVfV3MY0ps3JFlKnUhwlcCqnFN8
 H7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b8a2trAk20zeNjRwRS1+8oYlaEQHwTwjT9p/pnuw5YU=;
 b=oqFwgjJ4fyH81yxV6VfU0s/M0fpgGVHJuEKbaewgvY/2g50XW2jCnwbTzO1QKjlHZc
 VEHoW5gd++Wgi24322D8a6AWvPtbOH/ObFxvZ5SlOu/4/abJNMVYYbdjTaiJfiKOmqwD
 vwLpAMGalL7P38y5w6zASfh2Q8LSkfHjDBTwsd2OpPBTQ14WD+HuImFYleHYhVfRLT6a
 wnosdBUNntzdhIqDAuKx9o9P99jRLhkaujrC732Qq8YOt6DbLMWqgdUN5M6lYPWe8dVu
 kpzGydqwElP9fnxT5N9U1XDSNURd+W4D46Bs2S97rmeL0tynrvD0r1Eh9CFcTJUnQgf7
 WaRA==
X-Gm-Message-State: ANoB5pl2c1gXa1TkHmDaPPXg17gYJRc/Y9qph1uouB06F904g5rmsV+w
 uTeStVNcq23uYncNKw0HnyECpg==
X-Google-Smtp-Source: AA0mqf4WeDRLRTpDDIEIh3ypaNHFe3jqjG4gsVQVteBMWm/oxYn2XR1BnUd2CwXWpgdeL568DSRP4Q==
X-Received: by 2002:a05:651c:904:b0:277:1d64:f21c with SMTP id
 e4-20020a05651c090400b002771d64f21cmr5984950ljq.373.1668514570434; 
 Tue, 15 Nov 2022 04:16:10 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a2eb90d000000b0027781448499sm2489000ljb.85.2022.11.15.04.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 04:16:10 -0800 (PST)
Message-ID: <9d894b13-78f3-bcd0-28ee-911e09799426@linaro.org>
Date: Tue, 15 Nov 2022 13:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/23] ARM: dts: tegra20-tamonten: add label to avdd_vdac
 regulator
Content-Language: en-US
To: luca.ceresoli@bootlin.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
 <20221109141852.729246-5-luca.ceresoli@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109141852.729246-5-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2022 15:18, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Useful to enable it from a board DTS.
> 

No, it does not make sense. Adding unused labels is not useful. This
must come with an user.

Best regards,
Krzysztof

