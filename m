Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC61753C7AF
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 11:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74CD10E53A;
	Fri,  3 Jun 2022 09:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DF110E53A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 09:38:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id F13D41F45735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654249120;
 bh=JF0dKCc0L02G1KVh5HkaPXlohcDSdspKEYOdcEvE2V4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y5/SkoioXO8xg+2/iOPIiepGG/cYoQYDxYue3HE6KQKKMuXHIu9pNFuMO8o9hq+6N
 2VHJgXFvUfVygfE0xCBRQz4Jo3tBhxhCcyLr0iPtPhqIitY78zHs43S4iIF8d6MeTI
 lpTQBijFmnrNRZqS2jBAoE34jH2hSgufcjnghp4fPhVtpEmAmC4E/L+A0AAgrW+v6X
 jnTSHUP11TQnExnEKo5p78D3WtvFbGfuBIe+0Pv+Dy3tn2IVEzjVQtzTE4x5x3b7SL
 TPG3HoW1Euc4fUlfsmKKRJ0K+WVMMAhDAJ9+2jQ1o9WiyC3c8YBdtcLX+Ez7RgOawh
 S/mtlXQYMNldg==
Message-ID: <930f3721-ab1e-4bab-de1e-eaf83982e3ea@collabora.com>
Date: Fri, 3 Jun 2022 12:38:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v1 00/13] Host1x support on Tegra234
Content-Language: en-US
To: cyndis@kapsi.fi, thierry.reding@gmail.com, jonathanh@nvidia.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, digetx@gmail.com
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220516100213.1536571-1-cyndis@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/16/22 13:02, cyndis@kapsi.fi wrote:
> Hi all,
> 
> This series adds support for Host1x and VIC on the recently released
> Tegra234 (Orin) SoC. It's split into the following parts:
> 
> * Device tree binding updates
> * Cleanup in host1x driver
> * Add programming of new registers and old registers that now need to
>   be programmed to a non-reset value
> * Tegra234 device data and headers
> * Rewrite of the job opcode sequence, and related patches to
>   support MLOCKs on Tegra186+.
> 
> The rewrite of the job opcode sequence brings Tegra186, Tegra194 and
> Tegra234 support to a 'full-featured' status that is necessary to
> support all host1x features in the future. This should not have any
> impact on older SoCs.
> 
> This series should be applied on top of the Host1x context isolation
> series.
> 
> Tested on Jetson AGX Xavier and Jetson AGX Orin.

The code looks okay at a quick glance. Please rebase the patches on top
of latest -next. Perhaps won't hurt to merge all the related patchsets
into a single series for 5.20.

-- 
Best regards,
Dmitry
