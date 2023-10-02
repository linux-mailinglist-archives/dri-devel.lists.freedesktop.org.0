Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF587B4FDF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 12:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41DB10E274;
	Mon,  2 Oct 2023 10:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FD610E272;
 Mon,  2 Oct 2023 10:06:05 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Rzc6K39JBz9sjZ;
 Mon,  2 Oct 2023 12:06:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1696241161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ox+gKi4bLoFPXXWfih5IxNiXLO7vrIVUXFkXDUiuxVY=;
 b=fi/SNZ9m3ulp2WS5NGQcISs+kt16+SCQ41dzctwiKAN0rwzeBYUdvE6oG3krUmOQGl2cEA
 aIBopFdrHvt0EcdxSUPh8eYtC1In2mIv1gt4Wv+PxE5f551K3HyGGUWeILNSPN5IxxboWe
 6AetKPbjFjAxOt0eUoQlOUyInYlfHFcajDZBY/U/cXgkIGeYGnPDb2fu+IVLPpRWPgepwX
 YjZc2wb79odiNPw/P7FGqZRPZPgVyzJ984IFY04V0reH38gSPuI5tFBXV5XyRta4nl4qzU
 7b9MCufos20Gawf4URqKIGMSCCbeGq8IC2NOQN6Aiwcm8cQMkYV40lHzPUZHjg==
Message-ID: <2a8ebf1a-0d74-e068-6d68-de0ecae9bdf1@mailbox.org>
Date: Mon, 2 Oct 2023 12:05:56 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "drm/amd/display: Check all enabled planes in
 dm_check_crtc_cursor"
Content-Language: en-CA
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
References: <20230929204120.120795-1-hamza.mahfooz@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20230929204120.120795-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: bb25a72978e7ad443ec
X-MBO-RS-META: jxzcx4axa4semwfmgchknxjnby4h5b5c
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
Cc: Stylon Wang <stylon.wang@amd.com>, Ivan Lipski <ivlipski@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 amd-gfx@lists.freedesktop.org, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/29/23 22:41, Hamza Mahfooz wrote:
> From: Ivan Lipski <ivlipski@amd.com>
> 
> This reverts commit 45e1ade04b4d60fe5df859076005779f27c4c9be.
> 
> Since, it causes the following IGT tests to fail:
> kms_cursor_legacy@cursor-vs-flip.*
> kms_cursor_legacy@flip-vs-cursor.*

Any information about how those tests fail? Maybe they accidentally rely on the broken behaviour?


FWIW, something like the reverted commit is definitely needed, see https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3177#note_1829068 . That MR is blocked by the reverted fix.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

