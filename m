Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1514723C8B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 11:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F8110E223;
	Tue,  6 Jun 2023 09:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683A510E321
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 09:07:28 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-30ad8f33f1aso5149766f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 02:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686042446; x=1688634446;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=H7PV2fMN/fTvttTs59n+e74sqhlZtVJ8rgHwz2ZXCaA=;
 b=P9A0HFv67bS758BpN2s6TX8VNUdx6wqZc/0mTm/40VSiq5v1NQWYKhQZ4AHwMguj5r
 Oe6Cwayv3Vo+VZvLifB8yQsCCWOdTe3Q7znlWsHkUrOVSknhVr8qt7MV+dBI7KqCSC+q
 yWK7McIpvm8VQARio/ql1iLPVRYLVN1eDAHpv6Szu1G4jx3yG6Z4mDTFJnsX16TDxwKN
 qWwbZwx3o2Zu4ZRdQzwyfoHUY+OKBwbD4uj0YQUHkl1z6I3Pn3pcEoMBmxKzLKqCWZlq
 SVfGE2y1NeAGTUkYKTx13nmdPkrr0ENBmSpevQvwWezKgztxM1jYnn+ymHLW2eQyCnLx
 01KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686042446; x=1688634446;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H7PV2fMN/fTvttTs59n+e74sqhlZtVJ8rgHwz2ZXCaA=;
 b=FLb3Rp2WPXSvmv9hR6PeTfaQAOkUHDRCzgKn8KiQKN34DXZJJFdRYg840rMggatQDu
 foOzhgOWcBMU78/XFrjSookVh9nqmM4VGP6u4i9mVWB47xR++SLco/WrsbyMLb0sbByf
 GGvobEF+t/D/RsD9pXEFGNwIqKGQHCbGwQnIHqv6jmLYD4IFCvia26ilE2+DH4dkmXcN
 +upl5+r7gECqtYCTdiaawbNFzBLnchxOdF0LTS3+VVbsy1+Z0oPQ6J9AgETUxLOc/oWJ
 o5kcM+ogAZtMbPlFAZDEsMSQrSqRn8sGCo2htMX2UooCO657wZbk0yNex+Ja/lONb88d
 3/Jg==
X-Gm-Message-State: AC+VfDwtY/NTPDz11YVrobzVlaBgQ/cAGECM0SoWqKgVBEEQL7s+AEEG
 AthVF/R8CQpdM+Q+R67voSD+Ow==
X-Google-Smtp-Source: ACHHUZ6qNElORhBlV6A1b+J91L8ZdZTHYYENEcDfaw/boFMld0U+i/QwpfPKiUcbftXel1RuW35rqw==
X-Received: by 2002:adf:e4c4:0:b0:30a:d8df:6800 with SMTP id
 v4-20020adfe4c4000000b0030ad8df6800mr1194608wrm.33.1686042446300; 
 Tue, 06 Jun 2023 02:07:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4973:1165:b171:fa69?
 ([2a01:e0a:982:cbb0:4973:1165:b171:fa69])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a1cf70a000000b003f41bb52834sm16908761wmh.38.2023.06.06.02.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 02:07:25 -0700 (PDT)
Message-ID: <1f284e9d-5a1e-9fca-ceb0-478a413ae4ef@linaro.org>
Date: Tue, 6 Jun 2023 11:07:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Neil Armstrong <neil.armstrong@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20230606082142.23760-1-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 06/06/2023 10:21, Aradhya Bhatia wrote:
> Hi all,
> 
> I have picked up this long standing series from Nikhil Devshatwar[1].
> 
> This series moves the tidss to using new connectoe model, where the SoC
> driver (tidss) creates the connector and all the bridges are attached
> with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR. It also now creates bridge
> to support format negotiation and and 'simple' encoder to expose it to
> the userspace.
> 
> Since the bridges do not create the connector, the bus_format and
> bus_flag is set via atomic hooks.
> 
> Support format negotiations in the tfp410, sii902x and mhdp-8546 bridge
> drivers as a first step before moving the connector model.
> 
> These patches were tested on AM625-SK EVM, AM625 SoC based BeaglePlay,
> and J721E-SK. Display support for AM625 SoC has not been added upstream
> and is a WIP. To test this series on AM625 based platforms, basic
> display support patches, (for driver + devicetree), can be found in
> the "next_AttachNoConn-v2" branch on my github fork[2].

I can apply all bridge patches right now so only the tidss change remain,
is that ok for you ?


> 
> Thanks,
> Aradhya
> 
> [1]: https://patchwork.freedesktop.org/series/82765/#rev5
> [2]: https://github.com/aradhya07/linux-ab/tree/next_AttachNoConn-v2
> 
> Change Log:
> V6 -> V7
>    - Rebase and cosmetic changes.
>    - Drop the output format check condition for mhdp8546 and hence,
>      drop Tomi Valkeinen's R-b tag.
>    - Added tags wherever suggested.
> 
> V5 -> V6
>    - Rebase and cosmetic changes
>    - Dropped the output format check condition for tfp410 and hence,
>      dropped Tomi Valkeinen's and Laurent Pinchart's R-b tags.
>    - Based on Boris Brezillon's comments: dropped patches 5 and 6 from
>      the series and instead created a single patch that,
>        1. Creates tidss bridge for format negotiation.
>        2. Creates 'simple' encoder for userspace exposure.
>        3. Creates a tidss connector.
>        4. Attaches the next-bridge to encoder with the
>           DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
>    - Add format negotiation support for sii902x driver.
> 
> Previous versions:
> V1 to V6: https://patchwork.freedesktop.org/series/82765/
> 
> Aradhya Bhatia (3):
>    drm/bridge: sii902x: Support format negotiation hooks
>    drm/bridge: sii902x: Set input_bus_flags in atomic_check
>    drm/tidss: Update encoder/bridge chain connect model
> 
> Nikhil Devshatwar (5):
>    drm/bridge: tfp410: Support format negotiation hooks
>    drm/bridge: tfp410: Set input_bus_flags in atomic_check
>    drm/bridge: mhdp8546: Add minimal format negotiation
>    drm/bridge: mhdp8546: Set input_bus_flags from atomic_check
>    drm/bridge: cdns-mhdp8546: Fix the interrupt enable/disable
> 
>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  77 ++++++----
>   .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   2 +-
>   .../drm/bridge/cadence/cdns-mhdp8546-j721e.c  |   9 +-
>   .../drm/bridge/cadence/cdns-mhdp8546-j721e.h  |   2 +-
>   drivers/gpu/drm/bridge/sii902x.c              |  40 +++++
>   drivers/gpu/drm/bridge/ti-tfp410.c            |  43 ++++++
>   drivers/gpu/drm/tidss/tidss_encoder.c         | 140 +++++++++++-------
>   drivers/gpu/drm/tidss/tidss_encoder.h         |   5 +-
>   drivers/gpu/drm/tidss/tidss_kms.c             |  12 +-
>   9 files changed, 235 insertions(+), 95 deletions(-)
> 

