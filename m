Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D180F3EE84E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 10:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF4A6E10B;
	Tue, 17 Aug 2021 08:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164646E10B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 08:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=09pE3PiSOeEq5xAeKQfrUFLsZ5sLAO/CSMefAwFhvT4=; b=bmZfjdxzfe1fZoWsA91LRS+H9p
 aRSINB3hAf/AnwxVzD0Qe353p4ItJTmUFsnEoFgTDoUwcJvXp0Xrc/vG/P2ZAxRcfECpnu3qYCKEh
 0dGTspwXKxFHfyWdWhdlmyMvMNzaLtgRiOlX+wSY82YMEz/c80NbEMa0CS6c+4skeIpCbrAt8igft
 wcb8k6gRPJPd53y6whdVFn3/9t6TbSoe+Zy+Saj+cPsDRTSyUpF8A837/QwzyvmyP1etv6dc63oVe
 b55ngt5RdBHlvhh6vGscyh9KqdlQw16LNCAt07n+oedOMycRx6Mam/hqGXblcw5yr3h4YXmjPRPKu
 H1l8tpDA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1mFuKK-0007wF-AX; Tue, 17 Aug 2021 11:20:04 +0300
Subject: Re: [PATCH v1 0/3] Tegra DRM and Host1x driver fixes
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210817020153.25378-1-digetx@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <4d161add-89ff-e6d4-8f8c-6467bc306bfe@kapsi.fi>
Date: Tue, 17 Aug 2021 11:20:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210817020153.25378-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

On 8/17/21 5:01 AM, Dmitry Osipenko wrote:
> Fix troubles introduced by recent commits.
> 
> Dmitry Osipenko (3):
>    drm/tegra: dc: Remove unused variables
>    drm/tegra: uapi: Fix wrong mapping end address in case of disabled
>      IOMMU
>    gpu/host1x: fence: Make spinlock static
> 
>   drivers/gpu/drm/tegra/dc.c   | 3 ---
>   drivers/gpu/drm/tegra/dc.h   | 6 ------
>   drivers/gpu/drm/tegra/uapi.c | 2 +-
>   drivers/gpu/host1x/fence.c   | 2 +-
>   4 files changed, 2 insertions(+), 11 deletions(-)
> 

Series

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

I went through the changes between v6 and v7 and from what I can tell 
the end address change above is the only one of those missing in what 
was merged.

Thanks,
Mikko
