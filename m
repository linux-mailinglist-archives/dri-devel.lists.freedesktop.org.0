Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EBBAE85BF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 16:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C82E10E73C;
	Wed, 25 Jun 2025 14:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bhAyAzkt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC6610E73C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 14:09:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 421F660010;
 Wed, 25 Jun 2025 14:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4313DC4CEEA;
 Wed, 25 Jun 2025 14:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750860592;
 bh=kQKYmpjDFsaLpkUk9CDZGYah9aqQ4tIMW64yGborBmw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bhAyAzktrnz4SOh611OtBj+DN0THXWQMcFdt+to6l8s7v3opnor+1+qTwaQTs++cX
 RCXCtZHh/GFWUxJWeh/oRXeonHnJW44HPQZfrsVFXwfKyDboxPo3tCUeQEZqdVxrnY
 xKn2MerVqFBSrJygi2sMr6CDmaoAlZH3aUNGb3t4G+EUWHAFWJAAtg1yWStf02nyZl
 ThG38WEf97QLvrn5Oc7fXjf/eMupjkqUzebrhIfPAaL4t+AUKkU4b/tfwv7N5do4CE
 9wPXVyttBYFKtyrpqS+YemEnz43EwNZlYCgzqYMsWEPDVeblT76+5K2PG80v6ljhZE
 PxOWpV7D77FAQ==
Message-ID: <84503a51-3a8c-40e7-81ea-6720a1831424@kernel.org>
Date: Wed, 25 Jun 2025 16:09:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] agp/amd64: Only try host-bridges when agp_try_unsupported
 is set
To: Lukas Wunner <lukas@wunner.de>
Cc: David Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org
References: <20250625112411.4123-1-hansg@kernel.org>
 <aFv70KKvwkkXl-Pn@wunner.de>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aFv70KKvwkkXl-Pn@wunner.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 25-Jun-25 3:38 PM, Lukas Wunner wrote:
> On Wed, Jun 25, 2025 at 01:24:11PM +0200, Hans de Goede wrote:
>> On modern AMD Ryzen systems the IOMMU code initializes early on adding
>> resources to the "00:00.2 IOMMU" PCI-device without binding a driver to
>> it (because it needs to run early).
> 
> There's already a patch pending and a discussion ongoing for this issue:
> 
> https://lore.kernel.org/r/f8ff40f35a9a5836d1371f60e85c09c5735e3c5e.1750497201.git.lukas@wunner.de/

Thank you for pointing that out. I've replied in that thread.

Regards,

Hans


