Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD974D7057
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 19:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3859410E072;
	Sat, 12 Mar 2022 18:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A120210E072
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 18:12:35 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id u7so16288874ljk.13
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 10:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=k2rzdAvd062YWQZphahXNpHBoTUA0G/kUu5FJsmYidI=;
 b=cLIch6UNGEWBwpXkAfGnrMnkGP8hmmnuf7HiuH+uAu625SU0QmoGlc2SVrOSwdtHHB
 Ow2OyVUaeaCPY96YSOm8M/19K6KTez6AWn/3d/zmgIar9rkof3FPKnm87lO8kwKM2+1b
 3dX/gghLidF9HFV9HA0dXTkHfSUl/emasVYkGBa1cGvsdyxcncX44/2QpeLKqMLtYM/n
 XVvI3R378Ml+kG+Udza0rBX+dQPpqIuyderqiQEZniZbeF54vps152YPilKfdRClGtCi
 +cDeXVjFwu8Q7m3gLbXHxzTrBZXLNfwWgOyNtQU1Fpf00ssSL7uReonjyQonkmPSXM34
 Y7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k2rzdAvd062YWQZphahXNpHBoTUA0G/kUu5FJsmYidI=;
 b=T8fe9zjKTK8Wwv+YS7+GFOwzZPQDSGJgWq8xiL+4szjYe99qEqqivHb+/RU+VFNgKM
 8Yk6JbTn8kTNAspx+ke67fZ2V1yK7m0tPLMxPaLDCeA4I9Dhm6hSML14hdkkpTzbhd/R
 FE+9Oban92E56v2NwcIP8gFS82I2vJCm2R7WQadq63M4gdfld+mHyvXWKCpl814FA0Gz
 RlinsMsGR2mZ6aQ6qtyVGuDhIJuyvRhCkQy+EcmlUBJLM/CnYKv+IweTUmpfKKo3SabV
 WGBbIbxfiAn8gfJpJWcaN2AnaoHrZuQJHwNlTqvOBvKtb6939eyQYA/sofp+sC6oO+zz
 /nnA==
X-Gm-Message-State: AOAM530Iquc94s6XrIpHMwdeeRkDRrk+1HjjBEcxZ8mSPxW3QkJXpDW6
 ZcuRag74hjUegjSHW8FkDBI=
X-Google-Smtp-Source: ABdhPJxKzGvN1o8WcEOhsd6BTrlU/Lny5O/iTIWdGCHtEoNj9ujCnMKIsvOKhUi0uhP9YsrKpfM9og==
X-Received: by 2002:a2e:2d0a:0:b0:248:7c35:28b4 with SMTP id
 t10-20020a2e2d0a000000b002487c3528b4mr8155470ljt.175.1647108753844; 
 Sat, 12 Mar 2022 10:12:33 -0800 (PST)
Received: from [192.168.2.145] (109-252-136-171.dynamic.spd-mgts.ru.
 [109.252.136.171]) by smtp.googlemail.com with ESMTPSA id
 g19-20020a2e3913000000b00247dea5b468sm2571838lja.115.2022.03.12.10.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 10:12:33 -0800 (PST)
Message-ID: <45e5f833-b492-30df-a1ed-108e05a2b465@gmail.com>
Date: Sat, 12 Mar 2022 21:12:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 3/9] gpu: host1x: Add context device management code
Content-Language: en-US
To: cyndis@kapsi.fi, thierry.reding@gmail.com, jonathanh@nvidia.com,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh+dt@kernel.org,
 krzysztof.kozlowski@canonical.com
References: <20220301161455.4037062-1-cyndis@kapsi.fi>
 <20220301161455.4037062-4-cyndis@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220301161455.4037062-4-cyndis@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

01.03.2022 19:14, cyndis@kapsi.fi пишет:
> +/* host1x context devices */
> +
> +struct host1x_context {
> +	struct host1x *host;
> +
> +	refcount_t ref;
> +	struct pid *owner;
> +
> +	struct device dev;
> +	u64 dma_mask;
> +	u32 stream_id;
> +};

I'm still not very happy about the "context" names. For example here
it's only about the "memory context", then why not to name struct as
host1x_memory_context or host1x_memctx?

It's not good to use generic names for a special things, it hurts
readability of the code. It's important to choose good names.
