Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 723D14FB3D1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 08:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A95E10EB7D;
	Mon, 11 Apr 2022 06:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C096810ED97
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 06:37:44 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id c6so1915279edn.8
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 23:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vzNjZUXGyvh4gu1a5eskzN2ZgAinNkq/VfowbMZKkRY=;
 b=n9tsVChRT1PVIqDW/MqDK2AAvs1Dzp1foGwlobVRiFihFy4lvDQG/DlNcqT7KZoBCw
 /b0cTlbdft9bB57n7QmxErwXwdW+oCBAIceQdsZl1SynUBR2d2DXQNpiSfUpWL2gCTlM
 fEnbLQP3oAeReSQqM8w8+/1LIrkSqlPl6XswAialCagtaqmTvdnjBRXvZt999cniBbYb
 wEPBtVWY0mWdCo4YIFofSwnP/9RtCGySUqGg5iQC8PKIhQCaoLUdc4bz/3ZoDPrZrE/W
 XCKJcdVDAII9iJRM45lmMEExa3pTLJOklS953Ygoc/KbNDSItyZ5i4FkcPwI3lOEQepa
 JTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vzNjZUXGyvh4gu1a5eskzN2ZgAinNkq/VfowbMZKkRY=;
 b=5vxNf4clKtuWlcoWx5zvb9+zOG6AbO6OzNUfClcaaV0Zk1DaXWJS1AAbGGdTNceZI+
 RZYNbwRFOwCXAwVfvaO6VrEFUa1hsLri5ugIMAYnr5THG0o1uHtorojjZXvni8QtL9ho
 aCENe+R/w7Fu+lp0zvKX+bjlwZLdRCBBw2nzNIKgzi6M6HICcn83ElvAuqGnZHnFQaDm
 MigM0Gxtsd02gLlghP7X44utf2cZlkx1JQd9kOJH/g3VdxXF2l1fFBGkHUYLx8l1DdDZ
 dFQk13qUgHLi/EVGkE5Y6dTzUOFkFuJxWcxwwY4vpvZMdZ3scGRPVAgiJcJGPUQxeUV3
 0SZA==
X-Gm-Message-State: AOAM531ZaeOk7nrWh1tf7o2wYyDvZxC4dR5X8wKqrY3C8HUNqJKJRtlH
 J5yRsO7cE50Hq1n/Rr8KYbxQDw==
X-Google-Smtp-Source: ABdhPJyxeX5ahiPnIwsYZpijDZ2+BJKM+oobLR5YazSI/pEHlQhHy62TVXuI5C0rQe+zdN6vXT8dmQ==
X-Received: by 2002:a05:6402:1c1e:b0:416:5b93:eacf with SMTP id
 ck30-20020a0564021c1e00b004165b93eacfmr32015436edb.302.1649659063100; 
 Sun, 10 Apr 2022 23:37:43 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 z11-20020a50e68b000000b00412ec8b2180sm14586743edm.90.2022.04.10.23.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 23:37:42 -0700 (PDT)
Message-ID: <ba417ad0-a263-77c4-a7bd-a1e7c43fe6b7@linaro.org>
Date: Mon, 11 Apr 2022 08:37:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 01/10] dt-bindings: display: Separate clock item lists by
 compatible
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>
References: <20220411043423.37333-1-samuel@sholland.org>
 <20220411043423.37333-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220411043423.37333-2-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/04/2022 06:34, Samuel Holland wrote:
> So far, the binding and driver have relied on the fact that the H6
> clocks are both a prefix and a subset of the R40 clocks. This allows
> them to share the clocks/clock-names items and the clock-output-names
> order between the hardware variants.
> 
> However, the D1 hardware has TCON TV0 and DSI, but no TCON TV1. This
> cannot be supported by the existing scheme because it puts a gap in the
> middle of the item lists. To prepare for adding D1 support, use separate
> lists for variants with different combinations of clocks.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
