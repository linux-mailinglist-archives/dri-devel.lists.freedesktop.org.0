Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DB0AD9057
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F122E10E8EB;
	Fri, 13 Jun 2025 14:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bc75vj0k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3BC10E210;
 Fri, 13 Jun 2025 14:57:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 78EFE62A03;
 Fri, 13 Jun 2025 14:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26116C4CEE3;
 Fri, 13 Jun 2025 14:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749826625;
 bh=6QnZLRc+ykfWuKZO3baY3fEzwK/xXk4uH1U4YWAzkys=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bc75vj0kPUTFaLVyswX01iBtAddd/CF4zVKWO9I5wKguNaJir+eouPg3bf5Y0wRxi
 BkGw7Oov44lYp3oXHoPHrEK8nQ3Fdy2BjlL0uvlkPmrYdmjdJCXhp3H7gnbJ0f4bOx
 jLpNtkTMBEk+F8Ty1XpDu+T08w1ypFcTbSJV5o+m/nld6Rfx6grw89O1I3AzZXMBNu
 hclG4a0TXiry/Rvwk4wFTHBzHsw1P2lrJ/4SIiWjp2/Ujl/kwMY7N0EyJ4CCP7kot9
 NuI/T1Uvgqud9iGKQ4hT9vekOL6cENRmncNRzqlT6J+xepmJoGgf6QPKUAuqOyjIzX
 EIGlVUDkvbyMg==
Message-ID: <f1b7c96b-b1d0-4079-a89a-050017eb88bc@kernel.org>
Date: Fri, 13 Jun 2025 16:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/gsp: fix kernel-doc directive after file
 rename
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>
References: <20250612152758.659750-1-jani.nikula@intel.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250612152758.659750-1-jani.nikula@intel.com>
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

Hi Jani,

On 6/12/25 5:27 PM, Jani Nikula wrote:
> Fix the kernel-doc directive after the rename
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/{r535,rm/r535/gsp}.c leading to
> erros:

Thanks for the patch! This is already fixed by [1]. Since this patch appears to
be before yours in my inbox I take this one.

Besides that, the relevant doc entry was moved to rm/r535/rpc.c, despite the
rename mentioned above.

[1] https://lore.kernel.org/nouveau/20250611020805.22418-2-bagasdotme@gmail.com/
