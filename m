Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D56F4745A3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 15:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241C510E546;
	Tue, 14 Dec 2021 14:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2081210E546
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 14:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QZYhNaGojIhkj+DE3EZypSilzYN2uhm80/kOdf1GbYA=; b=IlPN7dM2SThppX1r0UTulL/Isn
 e+U/mXVxY67CDVx82BzZ2uOGU/otApvyN6778DHwVP2o81j9E6zO+GGobSI5PUNjiaZj+46Tt5Tms
 zYQPfUcnELURQm0aXn2m7WzCu23wzd4oUxEXYZKcv5BgpjSsOIeRjsT8fg8Ynta/tOSyD6IeFZhxa
 nNmcRLipl3uuTZZmONO7kULsoXP+ShRwKgB6FmoswXmpUBbjRv+hZq32V48Y5BWDCLVJyU7k4HNoP
 drdGSCjfNFKpuEcDPHLq75GFb0MlmXDXY8aL2idfIcBmAldsRSH203JE1+Trc22VEgx3+p2j/HCEL
 gzMoJjIg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1mx9BB-0000zE-4A; Tue, 14 Dec 2021 16:53:21 +0200
Message-ID: <a62602df-91f6-783d-60f3-d9eba10da543@kapsi.fi>
Date: Tue, 14 Dec 2021 16:53:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 0/8] Host1x context isolation support
Content-Language: en-US
To: Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 joro@8bytes.org, will@kernel.org, robh+dt@kernel.org, robin.murphy@arm.com,
 Mikko Perttunen <mperttunen@nvidia.com>
References: <20210916143302.2024933-1-mperttunen@nvidia.com>
 <10de82cf-27a5-8890-93a5-0e58c74e5bcc@kapsi.fi>
 <c382fb0e-6b73-5ca0-7f63-d2843351325e@nvidia.com>
 <91dddccd-a6c1-21b3-34d6-6a8082a386e7@nvidia.com>
 <a507b10b-395b-1f6d-87b9-7c7c436cab0e@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <a507b10b-395b-1f6d-87b9-7c7c436cab0e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/14/21 16:35, Dmitry Osipenko wrote:
> 14.12.2021 11:05, Jon Hunter пишет:
>> Hi all,
>>
>> Still no response on this :-(
> 
> I see only two patches on Tegra ML and others on DRI ML. Might be good
> to start with re-sending this whole series and CCing MLs properly.
> 

All patches should have been sent to the same set of addresses. At least 
LWN's archive seems to agree..

Mikko
