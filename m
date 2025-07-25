Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A49BB11FBC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 16:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CA310E373;
	Fri, 25 Jul 2025 14:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QO07Zdsp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DEE10E36F;
 Fri, 25 Jul 2025 14:04:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6ACEBA56557;
 Fri, 25 Jul 2025 14:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D41C4CEE7;
 Fri, 25 Jul 2025 14:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753452277;
 bh=hny5WhFij0Jp2laNX+g6PMM1MYWHFRk2ugCOMxF6+bM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QO07ZdspzEMRhl83JYPt8OdnMHrRSfP23YyjKoOBIDcJojDyJXjdwHTY4IzuMgA6F
 zj/9h8Yy0B4C0mjhn5Nld6Q4sCA6C/17TyczKM51UAU9mudpt7kcgZ3CklcOlDNe8O
 EtX4o/rrik5p2IgvaWe/eI9I8MJu4+ON23tMzmXDNxz+F9N8ErKOTF03MX/S+IRyhl
 FtktPolZfb89K/dOZmgqjs899Tc/F8mPiDSxjVnKEVEehbtZ+w65pyfVyk7686GRGW
 mPs9jyHoD3QlERDktVkAHjdMljK5Chpu1zlGVMcY4IiG5hYl6MQ9Jq+HVQY6qkD1w5
 0MCgEfUXvoD6w==
Message-ID: <ab63103c-3b21-451e-b450-a1755b452d77@kernel.org>
Date: Fri, 25 Jul 2025 16:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: vbios: use offset_of in
 PmuLookupTableHeader::new
To: Alexandre Courbot <acourbot@nvidia.com>, Rhys Lloyd <krakow20@gmail.com>
Cc: rust-for-linux@vger.kernel.org, airlied@gmail.com, simona@ffwll.ch,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250718073633.194032-1-krakow20@gmail.com>
 <DBL6BUAHZ250.3UCFP2OB3UEIY@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DBL6BUAHZ250.3UCFP2OB3UEIY@nvidia.com>
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

On 7/25/25 3:35 PM, Alexandre Courbot wrote:
> This chunk does not apply - on nova-next PmuLookupTableHeader does not
> seem to exist. I think I remember you split PmuLookupTableHeader in
> another patch, so can you send all the relevant patches as a series that
> applies cleanly on top of nova-next?

If otherwise the series is ready, please wait for -rc1 to be out, and rebase on
-rc1.

Thanks,
Danilo
