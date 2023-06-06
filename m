Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52328723E2E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 11:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DEA10E242;
	Tue,  6 Jun 2023 09:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768FF10E21B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 09:48:32 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f736e0c9b1so27666695e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 02:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686044909; x=1688636909;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=nH9IXy+8mmr6fEKUjeAVrm6OrEN2ynlfCA5RHInWD/g=;
 b=zTebeQ5VTcDvGTHY8x8b4YFkkkxmVmwYcyWt+L7EqJFGAHB/Aw1MfV7XdsSJl6g9ZS
 QFf+cyBsG0jZnG1q00buj8TnKt9PPwmSiGAaRdGFuesUi9uJ/Y+aM2HUrXuUNIsTI3H5
 jDDgU0U6C2pxVmhDBjeJWneb40ID2C93V/65PzPwfn2kB0zYEQKHlntsA/i2hDxGA1eT
 dPNTIt61dgFsE0BY6JSQHu2gGkQaU2nwxThexB+KzF9hxx6h4o0skGMdD9NKSpOkD/83
 FZ3ZUGG4kVAUkJBc6KeTnhzadR6SS3GVnBtqB+Jklyb7EXkx3xCFCB2Bp6fzZRAL1lF0
 YfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686044909; x=1688636909;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nH9IXy+8mmr6fEKUjeAVrm6OrEN2ynlfCA5RHInWD/g=;
 b=EsUHAAMVq3kqHMkujJeNqGZRBCj0GzLivQsKYGpuJ3xwzSZyuJL0XD2jGV/DiT+c9p
 nv6x3dii9pjmz5/43SJcYM/c/cKtfVSnK4Qfoqdb+mR+dGF01sTtrJYwmlGE7cOVOYhg
 o9peqNwQ9kOrow2svbBo+SgmiPDtLBbaqKQIRuoKx1R57Dq3DbT0jZnLi756Px/ho3Gv
 WU0XJ1Tbwx74IfUr8isFNNKL7ch6lWKSfdJAsPiqdHi7JK5L3Xlj1yyInWrqdKpX/9zX
 mhw1Fw6pAtu3HrzayNw6uW/KFesybldvbGtiw7dCpCy3SBhCANi/GMzsY9n6njMBxjxL
 6ZXA==
X-Gm-Message-State: AC+VfDx3sCzYRnUYB/gYq84zcGX7nPgK3gwsRijVF4EbsjU/49NrEQvY
 F0oQfCXZ4/HPcweSeqopnio3CA==
X-Google-Smtp-Source: ACHHUZ5DwtWDzMb4zpcw1FeB4iY7eNE3ZKctzKba19fFKs6cvdR5J0xK2HTz6GvoD4cnjwuXPljVOw==
X-Received: by 2002:a7b:cb92:0:b0:3f7:29c4:8fbd with SMTP id
 m18-20020a7bcb92000000b003f729c48fbdmr1620359wmi.27.1686044909090; 
 Tue, 06 Jun 2023 02:48:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4973:1165:b171:fa69?
 ([2a01:e0a:982:cbb0:4973:1165:b171:fa69])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a05600c365400b003f60a446fe5sm13553200wmq.29.2023.06.06.02.48.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 02:48:28 -0700 (PDT)
Message-ID: <42151d11-12d9-c165-0d4b-a0af80b683c3@linaro.org>
Date: Tue, 6 Jun 2023 11:48:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v7 0/8] drm/tidss: Use new connector model for tidss
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Swapnil Jakhade <sjakhade@cadence.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230606082142.23760-1-a-bhatia1@ti.com>
 <1f284e9d-5a1e-9fca-ceb0-478a413ae4ef@linaro.org>
 <1b31f36c-b1ba-43b5-9285-0f50384a78cf@ti.com>
Organization: Linaro Developer Services
In-Reply-To: <1b31f36c-b1ba-43b5-9285-0f50384a78cf@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/06/2023 11:46, Aradhya Bhatia wrote:
> Hi Neil,
> 
> Thank you for reviewing the previous patches!
> 
> On 06-Jun-23 14:37, Neil Armstrong wrote:
>> Hi,
>>
>> On 06/06/2023 10:21, Aradhya Bhatia wrote:
>>> Hi all,
>>>
>>> I have picked up this long standing series from Nikhil Devshatwar[1].
>>>
>>> This series moves the tidss to using new connectoe model, where the SoC
>>> driver (tidss) creates the connector and all the bridges are attached
>>> with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR. It also now creates bridge
>>> to support format negotiation and and 'simple' encoder to expose it to
>>> the userspace.
>>>
>>> Since the bridges do not create the connector, the bus_format and
>>> bus_flag is set via atomic hooks.
>>>
>>> Support format negotiations in the tfp410, sii902x and mhdp-8546 bridge
>>> drivers as a first step before moving the connector model.
>>>
>>> These patches were tested on AM625-SK EVM, AM625 SoC based BeaglePlay,
>>> and J721E-SK. Display support for AM625 SoC has not been added upstream
>>> and is a WIP. To test this series on AM625 based platforms, basic
>>> display support patches, (for driver + devicetree), can be found in
>>> the "next_AttachNoConn-v2" branch on my github fork[2].
>>
>> I can apply all bridge patches right now so only the tidss change remain,
>> is that ok for you ?
>>
> 
> While the bridge patches and the tidss patch can be separately built
> without any issue, the tidss functionality will break if only the bridge
> patches get picked up, and not the tidss.
> 
> Would it be possible for you to pick all the patches together once Tomi
> acks the tidss patch?

Sure

Neil
> 
> 
> Regards
> Aradhya
> 
>>
>>>
>>> Thanks,
>>> Aradhya
>>>
>>> [1]: https://patchwork.freedesktop.org/series/82765/#rev5
>>> [2]: https://github.com/aradhya07/linux-ab/tree/next_AttachNoConn-v2
>>>
>>> Change Log:
>>> V6 -> V7
>>>     - Rebase and cosmetic changes.
>>>     - Drop the output format check condition for mhdp8546 and hence,
>>>       drop Tomi Valkeinen's R-b tag.
>>>     - Added tags wherever suggested.
>>>
>>> V5 -> V6
>>>     - Rebase and cosmetic changes
>>>     - Dropped the output format check condition for tfp410 and hence,
>>>       dropped Tomi Valkeinen's and Laurent Pinchart's R-b tags.
>>>     - Based on Boris Brezillon's comments: dropped patches 5 and 6 from
>>>       the series and instead created a single patch that,
>>>         1. Creates tidss bridge for format negotiation.
>>>         2. Creates 'simple' encoder for userspace exposure.
>>>         3. Creates a tidss connector.
>>>         4. Attaches the next-bridge to encoder with the
>>>            DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
>>>     - Add format negotiation support for sii902x driver.
>>>
>>> Previous versions:
>>> V1 to V6: https://patchwork.freedesktop.org/series/82765/
>>>
>>> Aradhya Bhatia (3):
>>>     drm/bridge: sii902x: Support format negotiation hooks
>>>     drm/bridge: sii902x: Set input_bus_flags in atomic_check
>>>     drm/tidss: Update encoder/bridge chain connect model
>>>
>>> Nikhil Devshatwar (5):
>>>     drm/bridge: tfp410: Support format negotiation hooks
>>>     drm/bridge: tfp410: Set input_bus_flags in atomic_check
>>>     drm/bridge: mhdp8546: Add minimal format negotiation
>>>     drm/bridge: mhdp8546: Set input_bus_flags from atomic_check
>>>     drm/bridge: cdns-mhdp8546: Fix the interrupt enable/disable
>>>
>>>    .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  77 ++++++----
>>>    .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   2 +-
>>>    .../drm/bridge/cadence/cdns-mhdp8546-j721e.c  |   9 +-
>>>    .../drm/bridge/cadence/cdns-mhdp8546-j721e.h  |   2 +-
>>>    drivers/gpu/drm/bridge/sii902x.c              |  40 +++++
>>>    drivers/gpu/drm/bridge/ti-tfp410.c            |  43 ++++++
>>>    drivers/gpu/drm/tidss/tidss_encoder.c         | 140 +++++++++++-------
>>>    drivers/gpu/drm/tidss/tidss_encoder.h         |   5 +-
>>>    drivers/gpu/drm/tidss/tidss_kms.c             |  12 +-
>>>    9 files changed, 235 insertions(+), 95 deletions(-)
>>>
>>

