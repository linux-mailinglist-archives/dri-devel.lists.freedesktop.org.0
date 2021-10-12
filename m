Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54063429FDE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 10:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC056E7D7;
	Tue, 12 Oct 2021 08:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5026E7D7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 08:30:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id i12so51693281wrb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 01:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v0u01eW6pVIEIVQHUq1gwzCt0Crh/8LM88kItCmByGY=;
 b=AWL3WWm5TA1JOb/tjU59RANSfhru3mTDLFmtdWuDqd7U5T+SjpAZ3iMkoK1UrF/Brj
 jDr3fWCedHYfmt9d0VTl/piGF4LjArq6gz7v04tJaTHTwBtXV65XynhSfz4Fco9ZlJgb
 PgRietc/wmfDWkRW8jCwh8WI7YS29phZFKLQ7bft5+lty4Ti3Q4EjeETqVQ0fo/skO/G
 gPyWdkWJiEkgE8HXV/RAYC79mcljZPGDs1/PaPTx/zyGB14j3DcQhJovzq6Tz39v1cjf
 5wwJ7Rg/ysTIP91czuov5XgI1u5ouQCPccO7kWx4tn4FMaC/8/uayGCtYXxni6renSrm
 30zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=v0u01eW6pVIEIVQHUq1gwzCt0Crh/8LM88kItCmByGY=;
 b=DQeGzoUKICr1j7sxwrUT70Jn2/2pyX8dVEUtxxdYrsE7jjBCJSs2Lnd7fmt5d+1atc
 p/kTzSb9zbdGiVBY0PwvZUoQgJwYk0OVsdee0hNvzXC9w1viBATnsnYdRAjCu8Z+gNak
 9wYsG3+Nngm+pBOnKmpjVlmHqLUwj6x7ci59yuWjXHOiQdRC1P5Q23GlDeu7NLIghOgB
 IxNX5mGf35h4+JwYAqW26EHiPtanwyY0z2tIpAszlMjhq86xe1voXooSiOi9BPM9zKuX
 obZWlcYgvkaS61YbxgaJB2zayAEsJWWKK/0VOaYkbS3K06GSjCyN4k2YPIV7cakGQ0JS
 ZpvQ==
X-Gm-Message-State: AOAM532amLg8/ESgHFlLk7nlIOsX/xRz4MEUtKGjfc105JamobeaAIHz
 +sfRTAH3nz8pHmCuAgCVw+3zmg==
X-Google-Smtp-Source: ABdhPJzkvaqzlM1do02bHVH6nS44rfitAqHTBfh0TXPk0pMJNJEPFYCHWU9I1CdkwwqSiOH4AiRUOw==
X-Received: by 2002:a05:600c:4fd1:: with SMTP id
 o17mr4146166wmq.110.1634027411159; 
 Tue, 12 Oct 2021 01:30:11 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:4e93:9fa7:4d66:4f5c?
 ([2001:861:44c0:66c0:4e93:9fa7:4d66:4f5c])
 by smtp.gmail.com with ESMTPSA id q14sm1817081wmq.4.2021.10.12.01.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 01:30:10 -0700 (PDT)
Subject: Re: [PATCH v5 0/8] drm/omap: Add virtual-planes support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com
References: <20210923070701.145377-1-narmstrong@baylibre.com>
 <e7c295be-7a0c-877c-ba25-3b580d7d9521@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <a4e72823-6e92-cce1-0607-5506ddda42fa@baylibre.com>
Date: Tue, 12 Oct 2021 10:30:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e7c295be-7a0c-877c-ba25-3b580d7d9521@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 12/10/2021 09:15, Tomi Valkeinen wrote:
> On 23/09/2021 10:06, Neil Armstrong wrote:
>> This patchset is the follow-up the v4 patchset from Benoit Parrot at [1].
>>
>> This patch series adds virtual-plane support to omapdrm driver to allow the use
>> of display wider than 2048 pixels.
>>
>> In order to do so we introduce the concept of hw_overlay which can then be
>> dynamically allocated to a plane. When the requested output width exceed what
>> be supported by one overlay a second is then allocated if possible to handle
>> display wider then 2048.
>>
>> This series replaces an earlier series which was DT based and using statically
>> allocated resources.
>>
>> This implementation is inspired from the work done in msm/disp/mdp5
>> driver.
>>
>> Changes since v4 at [1]:
>> - rebased on v5.15-rc2
> 
> What is this based on? Doesn't apply to v5.15-rc2, and "error: sha1 information is lacking or useless".

Indeed the sha1 info is useless, it's based on v5.15-rc2 on top of "HACK: drm/omap: increase DSS5 max tv pclk to 192MHz"
in order to validate on 2k monitors.

My bad, I thought it would apply based on this patch, I'll rebase on v5.15-rc2 for v6.

Thanks for the review,
Neil
> 
>  Tomi

