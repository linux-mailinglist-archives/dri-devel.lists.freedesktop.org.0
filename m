Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE7C60A768
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD3A10E553;
	Mon, 24 Oct 2022 12:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904FF10E553
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 12:50:01 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id s3so5483283qtn.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 05:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6jCf/CbS4Ausj2wROnS6QLzmSsY7Fi0KDJ3zpPb3SGg=;
 b=yu4kVbpm5sjk0uyt4msUmiPwRnrzBrJXb+CwnL0ouXq7SePn/9fuNsiT8GD/ZgWFo3
 s5wuqPemURjhAYSIXWus7S7zJvwzCVhFW8HxmS+rV2cvns4vh0SqP5YNpSc476dJq3yb
 O1ox6mBHf1L3Mo0TapJeZ5r4BaaQTv+isWor/WRcAIipbWgApmtmXI9SnRrdTVz0MpYO
 +TSEMmMcNfCeEThilOJuKy7nukBTcJIQzdGAXdGImsRU/GlXgfgKZ7vNTJgTTVE65fTn
 lzgDyaN7Yy1tZYeplEVIBBwUPj4mJQPZ9Fyr2KrmIqglcVBtuRWIth/7otDAREHjEDl7
 4kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6jCf/CbS4Ausj2wROnS6QLzmSsY7Fi0KDJ3zpPb3SGg=;
 b=mXqrEOHW7Cpa/f1ec63NPWraRlj4LlSDhPR6n9lPDwEpoc9ENbS/dwW3t8Z/vMmExA
 N45trOxSB+DWxSuMukh0Ne6lBiC+OMkgW0TegZ4Hb8z/Uu30LMa593vSGEzUYncTT394
 ZE1+2dpLoexElgzDQks2jYOwGA70nV2u2b+33Vm42dp5A13GOu7zfFptyHzwhLXxS4AE
 yXG/cAVB6icfPqJ5h66Y1TxRM49FabD4HRdAmP3qm2RZXDx15c16xFk+Z1Nrg6gU9rOq
 oNe5NQkO6Mrtle3SZ/wDx7LQ+Mai9JZkaNpVqmyGdm66Us05T8hpLJSHQhxlWNYZr+r/
 WZEw==
X-Gm-Message-State: ACrzQf3zMjfgDCVxsQqmCLHhgjsbqh1QuTRXya8WGcQU92gDD+/uyrM9
 5kGSY9nvAboa8cRNl/+fkLiAJA==
X-Google-Smtp-Source: AMsMyM6tONSqnQie2CAY0VCT9/nEJoh4N5yZ/U3fumf9Qa2VnwON/dPLBe2dz6LDv9JldmqkG/kjmw==
X-Received: by 2002:ac8:5e0a:0:b0:39a:2960:d4a6 with SMTP id
 h10-20020ac85e0a000000b0039a2960d4a6mr26907024qtx.448.1666615800669; 
 Mon, 24 Oct 2022 05:50:00 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93]) by smtp.gmail.com with ESMTPSA id
 y13-20020a37f60d000000b006e2d087fd63sm14707240qkj.63.2022.10.24.05.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 05:50:00 -0700 (PDT)
Message-ID: <d3f9b680-9c37-4dca-8ab9-6a3375251f5a@linaro.org>
Date: Mon, 24 Oct 2022 08:49:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 16/21] fbdev: remove s3c2410 framebuffer
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Helge Deller <deller@gmx.de>
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-16-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-16-arnd@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Ben Dooks <ben-linux@fluff.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Simtec Linux Team <linux@simtec.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx platform was removed, so the framebuffer driver is no longer
> needed.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

