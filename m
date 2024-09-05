Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F3996D09B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 09:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8E010E718;
	Thu,  5 Sep 2024 07:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wY1BaZq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E636E10E718;
 Thu,  5 Sep 2024 07:40:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3BEEFA44304;
 Thu,  5 Sep 2024 07:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C745C4CEC4;
 Thu,  5 Sep 2024 07:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1725522033;
 bh=PZJmqlHpJ1uU+ASFJIpncqC9uV3uvVokLmZ+DOZ31vY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wY1BaZq7EaV2nxp/Ky4u1EjnAofwymLmYwxfNFMzbKe0jbHCKfdS8gsQnzSNvxLBw
 PumHeZzyspeIqGIDgjb4BCQ/0o2i9Hx1hQmo8m8P4UXCskEjO3NFFDypxbP6bOCSaO
 tx5sTpSbitonzYibe/kA3nVEGUcVkW8snJjYW0Ms=
Date: Thu, 5 Sep 2024 09:40:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: sikkamukul <mukul.sikka@broadcom.com>
Cc: stable@vger.kernel.org, evan.quan@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 Jun.Ma2@amd.com, kevinyang.wang@amd.com, sashal@kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ajay.kaher@broadcom.com,
 alexey.makhalov@broadcom.com, vasavi.sirnapalli@broadcom.com,
 Bob Zhou <bob.zhou@amd.com>, Tim Huang <Tim.Huang@amd.com>
Subject: Re: [PATCH v5.15-v5.10] drm/amd/pm: Fix the null pointer dereference
 for vega10_hwmgr
Message-ID: <2024090523-collide-colonize-d914@gregkh>
References: <20240903045809.5025-1-mukul.sikka@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903045809.5025-1-mukul.sikka@broadcom.com>
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

On Tue, Sep 03, 2024 at 04:58:09AM +0000, sikkamukul wrote:
> From: Bob Zhou <bob.zhou@amd.com>
> 
> [ Upstream commit 50151b7f1c79a09117837eb95b76c2de76841dab ]
> 
> Check return value and conduct null pointer handling to avoid null pointer dereference.
> 
> Signed-off-by: Bob Zhou <bob.zhou@amd.com>
> Reviewed-by: Tim Huang <Tim.Huang@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Signed-off-by: Mukul Sikka <mukul.sikka@broadcom.com>
> ---
>  .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 30 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)

Now queued up, thanks.

greg k-h
