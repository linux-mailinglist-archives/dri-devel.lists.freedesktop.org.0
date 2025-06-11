Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4965CAD5487
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 13:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC08B10E63B;
	Wed, 11 Jun 2025 11:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="CI4bgteK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6701110E63B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 11:50:31 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 35DB6600300D;
 Wed, 11 Jun 2025 12:50:30 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id JsGNJbs1NHZS; Wed, 11 Jun 2025 12:50:27 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id D44F16003021;
 Wed, 11 Jun 2025 12:50:27 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail; t=1749642627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I7XSGBOcxQpYk0h/wGTNiRSmcKoeBKA/9HOVOJjOKKs=;
 b=CI4bgteKdfArBuzN+fuNxQ52a/7CVvIYaglQfYMWIBwUBXxSeB4C60GRzu4VVMLm3BsY6h
 z7zS6B9N+UpjSZem4pqOBzxlhzdzLQgEzO5W9FZQtd+XaVezhTGFBQDTzclW625Hzij+PL
 4BeabFcUgQiEWaiC5eOi0dHbiGywfoI=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown
 [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id A90AA36008F;
 Wed, 11 Jun 2025 12:50:27 +0100 (WEST)
Message-ID: <64ed6209-81eb-431c-b06d-262c68835344@tecnico.ulisboa.pt>
Date: Wed, 11 Jun 2025 12:50:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/tegra: Add NVJPG driver
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <cyndis@kapsi.fi>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <20250606-diogo-nvjpg-v1-1-5f2c36feeb39@tecnico.ulisboa.pt>
 <811ad406-4afb-45c5-9783-683779f874cc@kapsi.fi>
 <fhumfjczxcohn5h5mnrdmz3x23ituxktzudtfutly35jkziiou@ocffx4vennrn>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <fhumfjczxcohn5h5mnrdmz3x23ituxktzudtfutly35jkziiou@ocffx4vennrn>
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


Hi Thierry,

On 6/10/25 9:44 AM, Thierry Reding wrote:
> On Tue, Jun 10, 2025 at 12:26:07PM +0900, Mikko Perttunen wrote:
>> On 6/6/25 7:45 PM, Diogo Ivo wrote:
>>> Add support for booting and using NVJPG on Tegra210 to the Host1x
>>> and TegraDRM drivers. This driver only supports the new TegraDRM uAPI.
>>
>> Hello Diogo -- I'm happy to see this driver!
> 
> So am I, nice work!

Thank you Mikko and Thierry for the kind words :)

> [...]
>>> +	if (IS_ERR(nvjpg->regs))
>>> +		return PTR_ERR(nvjpg->regs);
>>> +
>>> +	nvjpg->rst = devm_reset_control_get_exclusive_released(&pdev->dev, "nvjpg");
>>> +	if (IS_ERR(nvjpg->rst)) {
>>> +		err = PTR_ERR(nvjpg->rst);
>>> +
>>> +		if (err != -EBUSY || WARN_ON(!pdev->dev.pm_domain)) {
>>> +			dev_err(&pdev->dev, "failed to get reset control: %d\n",
>>> +				err);
>>> +			return err;
>>> +		}
>>> +
>>> +		/*
>>> +		 * At this point, the reset control is most likely being used
>>> +		 * by the generic power domain implementation. With any luck
>>> +		 * the power domain will have taken care of resetting the SOR
>>> +		 * and we don't have to do anything.
>>> +		 */
>>> +		nvjpg->rst = NULL;
>>> +	}
>>
>> I see you've taken this from sor.c, but I think it should be unnecessary. I
>> imagine the code in sor.c is overcomplicated as well, maybe because we used
>> not to have the power domain implementation.
> 
> Agreed. SOR is also slightly older than NVJPG and used on Tegra124 where
> we don't use power domains, so most of these quirks are for backwards-
> compatibility. If we can avoid them for NVJPG, that'd be great.

Sounds good, I'll get rid of this explicit handling in v2.

Thanks,
Diogo
