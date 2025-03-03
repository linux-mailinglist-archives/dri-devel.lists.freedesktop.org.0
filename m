Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF5EA4CC4F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 20:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6240210E16C;
	Mon,  3 Mar 2025 19:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="SxGYl812";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8188910E4E1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 19:57:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741031800; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HQWvSc/f39OcTpTkPbe2apQLGvn9VQQdVSGuYxqaTgAyIkN1+nEkadPmha1BHzQkudg/wQwOBpl45zTCb5zyczlOZ27n9x8FIASBIeYigale13XRsKIrboTi1imS5vtSQh9+rsxmDRL0aP9zGquo4KL5kMR4FT8qo6+FNo5LVU8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741031800;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Gs+I0KFW62vE7fKYGPv4JeP1QHoVwlF8yI1f32icm2Y=; 
 b=m0HBI4YsVmU88LYlzydXdtZnFbZ2giJXW5drwWApzIoV24nbI8C1pmW+fzKkME0hH2SSNUYW59zPAkXLkMEWe12DdIERhgZJEj4iCpsTcS3MGSzPmj5X8u729O1Bvf6sfZQTr7ZMutw3IHqCtaX5pSFPi4aCx+zpIUc5M1hNHVw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741031800; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=Gs+I0KFW62vE7fKYGPv4JeP1QHoVwlF8yI1f32icm2Y=;
 b=SxGYl812GQ79Rlw/UUAmtI1AjYl+917MuPPYDnMfY32wiNNBddHhlzx/cmLL5MHF
 8OkP8TednaBR0TZVVNbYEh3YhpaIHoG8mSywfB2Pw8VeltEXC7X7VY+AqZ0lG8Y12Sc
 pbC25cZF5rAnP8odav8T8V4fbAJopSlUPIzxzFBg=
Received: by mx.zohomail.com with SMTPS id 1741031798061293.2349304120286;
 Mon, 3 Mar 2025 11:56:38 -0800 (PST)
Date: Mon, 3 Mar 2025 19:56:29 +0000
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Ashley Smith <ashley.smith@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panthor: Update CS_STATUS_ defines to correct
 values
Message-ID: <amz6ao3hshb4j2qorirasipksjrzl43rj6qmogg6dnntou3jfm@tgyds6mlnthr>
References: <20250303180444.3768993-1-ashley.smith@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303180444.3768993-1-ashley.smith@collabora.com>
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

> On 03.03.2025 18:04, Ashley Smith wrote:
> Values for SC_STATUS_BLOCKED_REASON_ are documented in the G610 "Odin"
> GPU specification (CS_STATUS_BLOCKED_REASON register).
>
> This change updates the defines to the correct values.
>
> Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
> Signed-off-by: Ashley Smith <ashley.smith@collabora.com>

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

> ---
> Changes in v2:
>   - Rename _RES to _RESOURCE
> ---
>  drivers/gpu/drm/panthor/panthor_fw.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
> index 22448abde992..6598d96c6d2a 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.h
> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
> @@ -102,9 +102,9 @@ struct panthor_fw_cs_output_iface {
>  #define CS_STATUS_BLOCKED_REASON_SB_WAIT	1
>  #define CS_STATUS_BLOCKED_REASON_PROGRESS_WAIT	2
>  #define CS_STATUS_BLOCKED_REASON_SYNC_WAIT	3
> -#define CS_STATUS_BLOCKED_REASON_DEFERRED	5
> -#define CS_STATUS_BLOCKED_REASON_RES		6
> -#define CS_STATUS_BLOCKED_REASON_FLUSH		7
> +#define CS_STATUS_BLOCKED_REASON_DEFERRED	4
> +#define CS_STATUS_BLOCKED_REASON_RESOURCE	5
> +#define CS_STATUS_BLOCKED_REASON_FLUSH		6
>  #define CS_STATUS_BLOCKED_REASON_MASK		GENMASK(3, 0)
>  	u32 status_blocked_reason;
>  	u32 status_wait_sync_value_hi;
>
> base-commit: 16e57a72780931c3c70dbc928aeee4a0518075de
> --
> 2.43.0

Adrian Larumbe
