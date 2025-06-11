Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C209AD54CD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 13:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B426110E0A1;
	Wed, 11 Jun 2025 11:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="GkFzxb33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1EB10E0A1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 11:56:52 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 9EDA56003C08;
 Wed, 11 Jun 2025 12:56:51 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id lqO9FPTecebC; Wed, 11 Jun 2025 12:56:49 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 495336003C1B;
 Wed, 11 Jun 2025 12:56:49 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail; t=1749643009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJUruQAOGbhUpiQy9dRrHappJl3EfKmSUYgVRieXboY=;
 b=GkFzxb33XyZ+Uv3TH3RQ4jmB6ESz/iLOoIhYGofy+s93P+Q4jGQjYoSkk1PYQ3opDizp/B
 LinPIL7BXJ4BmRHgBEUazzWw9mZ5j6X4K/XgokKnOEHwyN7mfjm4ovKeQGc+fapLp4SO8K
 arhFWeG26mu4WR51Pp7ikgtRjw81Od0=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown
 [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 0E6DF36008F;
 Wed, 11 Jun 2025 12:56:49 +0100 (WEST)
Message-ID: <9ddcd776-28b6-4fad-ab09-d3305e0f960b@tecnico.ulisboa.pt>
Date: Wed, 11 Jun 2025 12:56:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <lxgh2rtt2fqbmom64vbmtkly2dqcnivwvlhxt6zscwskhzsrne@kd66mumdaukf>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <lxgh2rtt2fqbmom64vbmtkly2dqcnivwvlhxt6zscwskhzsrne@kd66mumdaukf>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/10/25 9:58 AM, Thierry Reding wrote:
> On Fri, Jun 06, 2025 at 11:45:33AM +0100, Diogo Ivo wrote:
>> Hello,
>>
>> This series adds support for the NVJPG hardware accelerator found in the
>> Tegra210 SoC.
>>
>> The kernel driver is essentially a copy of the NVDEC driver as both
>> engines are Falcon-based.
>>
>> For the userspace part I have written a Mesa Gallium backend [1] that,
>> while still very much experimental, works in decoding images with VA-API.
> 
> Nice. It's good to see that there's some use in this after all. I
> haven't taken an in-depth look yet, but from a high-level point of view
> this looks like what I had imagined back when I started out with this
> driver.

Good to know that the structure makes sense to you :)

I still have some kinks to iron out before submitting a merge request in
Mesa but if you have the time to take a look before that and you already
have some comments before that that would be great.

> This made my day, thank you!

Happy to know that!

Diogo
