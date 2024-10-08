Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE408995539
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 19:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F93510E59B;
	Tue,  8 Oct 2024 17:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GPe8BKcr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EA610E21E;
 Tue,  8 Oct 2024 17:01:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1356CA42922;
 Tue,  8 Oct 2024 17:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C196C4CECF;
 Tue,  8 Oct 2024 17:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728406901;
 bh=S/VXyazLkkj6SI8iY3GUV3SHm5ZS2LFCm7Sc4TiOSXk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GPe8BKcriZ7U7ADQ5jTGGh60KfIjW/WrTjps0LRYITWCJgzvr4g687ZhFvNtOW+v/
 rKDnC9wH83dVjo+c/Jr8V6n123pi0s6lzZ0XFBpg8rBz4gRjrAaT33OI4lkbJIlkjF
 87G+maFVs5XhkjQxM6ItLMjQRPIvUDh1zYtlBtIjPSyW/euVrSCuZHkozppvmIxHle
 P9/r1qSTfDj5YoKaz4Vo76OIDSv430NgqSYK9xpKZ77mLDeAEgA4n5D03k1R0Jjb5L
 P8LZal18b8bDTe3LneXeFlFd7jJQWLhUHgVSsgijgWmKyZ+Ao2oCKl0V3YsQf2GDiT
 qVFQnlO/YGy6Q==
Message-ID: <fc3f474b-92bd-46b3-919a-dec8ea105b86@kernel.org>
Date: Tue, 8 Oct 2024 12:01:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] drm/amd/display: Fetch the EDID from _DDC if
 available for eDP
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, "Limonciello, Mario" <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com
References: <20240927230600.2619844-1-superm1@kernel.org>
 <20240927230600.2619844-6-superm1@kernel.org>
 <0a996d5e-37f9-423d-9f6a-f6b83fe5f870@app.fastmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <0a996d5e-37f9-423d-9f6a-f6b83fe5f870@app.fastmail.com>
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

On 10/8/2024 11:05, Mark Pearson wrote:
> 
> For the series, we tested at Lenovo and it fixed a couple of different issues we had seen and reported on different HW models.
>   - issue with setting 1600 x 1200 on Z16 G2
>   - issue with frequency setting being incorrect on T14 G4 AMD with OLED panels
> I didn't do the testing myself (I don't have the configurations on hand that reproduce the problem) but my colleagues did.
> Can I do a:
> Tested-by: Lenovo Linux team <mpearson-lenovo@squebb.ca>
> Or is there some other protocol for this?
> 
> Thanks
> Mark

Thanks Mark!  If we have any problems that arise from this patch that 
cause us to need to change it or back it out we'll reach out to you for 
further testing from your extended team on the models it helped.
