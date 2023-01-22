Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F4F67719F
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 19:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F74F10E1A3;
	Sun, 22 Jan 2023 18:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E480810E1A3;
 Sun, 22 Jan 2023 18:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1674413155; bh=J41ioDWqknlOzdipOF5sD31nhNZl3NF7T0hUSNvNhsI=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=f2vIwTa7gBjC8QW6zWihuU2CxvUGZIQ4lWSAAJlEknZHH1gQPn/chKhj0P2B3ADr3
 6ljtIFr4O7T2RQiDTIMJkNU+erNDHvRrCizCJoNWofiZJE97w1pYFTWD6mQuSCJVY7
 e3+tYz4LnDkCixQalsK1OwmPlwBwutWHkDA8qCwM=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sun, 22 Jan 2023 19:45:55 +0100 (CET)
X-EA-Auth: LxLdcSa5DAPkBdm3lAE5Zi4Ztr6lojNLOTcMK4tmNwTIrMEaL45b16ba2tEHLBsIZr6K+6GtA76prZjHrpgzJvjUV0jW4QZq
Date: Mon, 23 Jan 2023 00:15:50 +0530
From: Deepak R Varma <drv@mailo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/amd/display: Use min()/max() helper macros
Message-ID: <Y82EXrIgJyJTVAFk@ubun2204.myguest.virtualbox.org>
References: <cover.1673730293.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1673730293.git.drv@mailo.com>
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
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 15, 2023 at 02:48:45AM +0530, Deepak R Varma wrote:
> This patch series proposes using standard min() / max() helper macros instead of
> direct variable comparison using the ternary operator or if/else evaluations. I
> have tested the change using a dummy module and similar simulations on my x86
> machine.

Hello,
May I request a review feedback and comments on this patch set please?

Thank you,
./drv

> 
> Deepak R Varma (4):
>   drm/amd/display: Use min()/max() macros in dcn_calc_math
>   drm/amd/display: dcn20: Use min()/max() helper macros
>   drm/amd/display: dcn21: Use min()/max() helper macros
>   drm/amd/display: dcn32: Use min()/max() helper macros
> 
>  .../gpu/drm/amd/display/dc/dml/calcs/dcn_calc_math.c   | 10 +++++-----
>  .../drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c |  5 +----
>  .../amd/display/dc/dml/dcn20/display_mode_vba_20v2.c   |  5 +----
>  .../drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c |  5 +----
>  drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  4 ++--
>  5 files changed, 10 insertions(+), 19 deletions(-)
> 
> -- 
> 2.34.1
> 
> 
> 


