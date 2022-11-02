Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02558616926
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 17:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9704710E502;
	Wed,  2 Nov 2022 16:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CFD10E502
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 16:34:02 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id h21so6653425qtu.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 09:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QDxuOmZwLuYcD+cc4tzL4paE9YkxJAoVZjE1yHXXoiI=;
 b=NbqOXxFZzBhGaS+tdTOH/lJMlHvuSFxwd6lNdC0Xod4th3g0Aeb3bgcfTL0XO0nStC
 lXGpjUwpO/xGNqutsOjxsR4/MDogFW9xR/a+Ye5TRyl/W3gPX7helPafFAKKK3WCbb/3
 BosxAGetdMEVi2nOzvBLefpIAcwUp/yDRnZjjdsb8O9145FHuGP2xdJQmduy0odmO9Za
 i0vC1gdgJNEArnsAPq00UERiyuRzJHK2SsLwGpxA3koqRcA2xzX2VPSrFEbefbnn7TBH
 9VxcbmYF5S/pP2oOWkByIN351P5lEpNJowB4cNFqkXPsTa3WaUUWoFI7QQ+onoD/kTLf
 1CgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QDxuOmZwLuYcD+cc4tzL4paE9YkxJAoVZjE1yHXXoiI=;
 b=X1iF9Mt+Mdpi+SWojAt5hurpJFhyN4Qj4d4r87Ncjdc0xWI/ksle0rbsjpky853BgK
 x9JIIzDeZYVyzFFfKqIeHw/0g2ZpY0l6uFQ687PJWkCs+4GNBq7bXDPYhODBzsmxHZeA
 2Mf8E2U3eDG6FLh/UWyDJYG+bDZ/1tmNpxp94sXO3pokeURvR6fV6ftUAeIODMcsqW85
 0lD3MsqiBpFYGQHKv+Se8YdI5YBjScBaaMz2BWVg2UfR7AaPKi8L9pKFXZHLzKd4LrpA
 qwdVJsZyHigTWHJ8FQbQzwGzASajSDQUcAn7kY9AR+Y5W3UenN7OJr1sv0uoxW7cg2gn
 UAzg==
X-Gm-Message-State: ACrzQf2Zdxhsb0oDoc3ifw6C8E8JXN64upG+oysZMhNcH+AxTTAReC7e
 7rdFBYQO1VH2C/stFGp1vDvIhg==
X-Google-Smtp-Source: AMsMyM68vZkJx0W7eXxAb94Zjjlvos7EBZ6NwidNbQyyCFcbALsnrufsb1zE1n6gEKo+ZMNkGGyMBw==
X-Received: by 2002:ac8:5e4a:0:b0:3a5:1fc:3a04 with SMTP id
 i10-20020ac85e4a000000b003a501fc3a04mr20165429qtx.132.1667406841054; 
 Wed, 02 Nov 2022 09:34:01 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93?
 ([2601:586:5000:570:28d9:4790:bc16:cc93])
 by smtp.gmail.com with ESMTPSA id
 bp6-20020a05620a458600b006cf9084f7d0sm8726229qkb.4.2022.11.02.09.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 09:34:00 -0700 (PDT)
Message-ID: <30ce6ed4-cbea-7b82-cca5-8920fc1eddad@linaro.org>
Date: Wed, 2 Nov 2022 12:33:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v6 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Content-Language: en-US
To: allen.chen@ite.com.tw
References: <20221027030155.59238-1-allen.chen@ite.com.tw>
 <20221027030155.59238-2-allen.chen@ite.com.tw>
 <d6f14e09-0c24-e19a-0951-bb3ca2219e79@linaro.org>
 <18659f5a5b2c4fd7b76731836aeb713d@ite.com.tw>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <18659f5a5b2c4fd7b76731836aeb713d@ite.com.tw>
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
Cc: devicetree@vger.kernel.org, Kenneth.Hung@ite.com.tw,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Jau-Chih.Tseng@ite.com.tw, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, treapking@chromium.org, Hermes.Wu@ite.com.tw,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 jonas@kwiboo.se
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/11/2022 02:54, allen.chen@ite.com.tw wrote:
> On 26/10/2022 23:01, allen wrote:
>> From: allen chen <allen.chen@ite.com.tw>
>>
>> Add properties to restrict dp output data-lanes and clock.
> 
> This is a friendly reminder during the review process.
> 
> It seems my previous comments were not fully addressed. Maybe my feedback got lost between the quotes, maybe you just forgot to apply it.
> Please go back to the previous discussion and either implement all requested changes or keep discussing them.
> 
> Thank you.
> 
> ==> I am sorry I didn't find the missing advice you said. Could you explain it again?
> 
> Rob asked - Commit msg should explain reason for breaking users.

And where is the reason? I saw only one sentence "Add properties to
restrict dp output data-lanes and clock."

Best regards,
Krzysztof

