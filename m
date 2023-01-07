Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C29661197
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 21:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D4E10E1CA;
	Sat,  7 Jan 2023 20:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1198 seconds by postgrey-1.36 at gabe;
 Sat, 07 Jan 2023 20:29:43 UTC
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA1D10E1CA;
 Sat,  7 Jan 2023 20:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673123377; bh=Vg0zzi0E4maI0sKskX31d41VWY8Rj+KdJklhQyGkCH8=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=T2u91W+pNODLeh5YPl5ZS4JT+J7wGG9uDsaMu6/A6WU1SuHlOz6e9XkRUvL+C+8Wf
 FkJv42HLUJfAVtNIg8Sr1fIK8QV8gJyoMeiKNk+2IuQ1s2THyGGhbvj+222srLzIKd
 ir1nZlVXP1cnHlcYUhw1lnhR4l1EYMJb+SwMk22I=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sat,  7 Jan 2023 21:29:37 +0100 (CET)
X-EA-Auth: OzqmESPCaOU6ngWC3y6TpSCEfwulT5b4cksaLF7iCWZtq0pZYGLMADrUbXuJKrnxWltvMrYDQAjp4SM7nrIKEOCgddREdgr4
Date: Sun, 8 Jan 2023 01:59:28 +0530
From: Deepak R Varma <drv@mailo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amd/display: No need for Null pointer check before
 kfree
Message-ID: <Y7nWKNyggmf/HXj2@ubun2204.myguest.virtualbox.org>
References: <Y6s7989gmBZldV/S@qemulion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6s7989gmBZldV/S@qemulion>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Deepak R Varma <drv@mailo.com>, Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 28, 2022 at 12:09:51AM +0530, Deepak R Varma wrote:
> kfree() & vfree() internally performs NULL check on the pointer handed
> to it and take no action if it indeed is NULL. Hence there is no need
> for a pre-check of the memory pointer before handing it to
> kfree()/vfree().
>
> Issue reported by ifnullfree.cocci Coccinelle semantic patch script.
>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---

Hello,
Requesting a review and feedback on this patch proposal.

Thank you,
./drv



