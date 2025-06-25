Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245CAE79D4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 10:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63E610E699;
	Wed, 25 Jun 2025 08:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tRtgFlVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E58C89EAC;
 Wed, 25 Jun 2025 08:20:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 296D85C669C;
 Wed, 25 Jun 2025 08:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CAEC4CEEE;
 Wed, 25 Jun 2025 08:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750839610;
 bh=d2K+swS3zVCovOGE/wtAt9dzlyYMqc+P9GuLT1mKK4k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tRtgFlVExlFPh0imTK6eu4wJeOx10TNZSZ1w2htRPfXKF1paTe47XTQR/OpA5nLk3
 TDdldgUgIUKKf0y9IFCM5yXY4UqWgKrx5FhvLwcXHEFHuQ2mA67KTE7B0dz2VHpfG1
 8SnCyLudyY9ZttejPrRqvMh/wjaEb+XsDorWzUiBRfDzouMTxmQxKpx6joRLhfCkeG
 pl5n0krVXzSBxVQ+9tXD4bUiG93xzhmMg6M+4vBO9caqOakMrWO36CRrb4+8ZiRZfS
 3hylYQwqItcot97TPtfdvFCtFIGhjIYf1F9iFGS8Z0qdfPxCiKBWX4gO6QPYeraEHQ
 fjmXeoMt4wPvg==
Message-ID: <db30702c-bda8-49a8-890b-e457dcb66848@kernel.org>
Date: Wed, 25 Jun 2025 10:20:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/nouveau/disp: Use dev->dev to get the device
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20250409103344.3661603-1-sakari.ailus@linux.intel.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250409103344.3661603-1-sakari.ailus@linux.intel.com>
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

On 4/9/25 12:33 PM, Sakari Ailus wrote:
> The local variable dev points to drm->dev already, use dev directly.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi folks,
> 
> The background is that I'll be using a Coccinelle spatch soon to remove
> (most) pm_runtime_mark_last_busy() calls. That won't work if the arguments
> aren't the same.

If you want to submit / merge it together with your rework:

Acked-by: Danilo Krummrich <dakr@kernel.org>

If I should pick it up, please let me know.
