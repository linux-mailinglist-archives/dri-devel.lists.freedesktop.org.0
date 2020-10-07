Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F50286B17
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 00:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F466E9D4;
	Wed,  7 Oct 2020 22:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0028.hostedemail.com
 [216.40.44.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B8C6E9D4
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 22:48:01 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 8ECAF18029120;
 Wed,  7 Oct 2020 22:48:00 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2194:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3867:3870:3871:4250:4321:5007:6119:10004:10400:10848:11026:11232:11473:11639:11658:11914:12043:12297:12438:12555:12740:12760:12895:12986:13069:13160:13229:13311:13357:13439:14096:14097:14659:14721:21080:21220:21611:21627:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: home58_190c87d271d3
X-Filterd-Recvd-Size: 2187
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Wed,  7 Oct 2020 22:47:58 +0000 (UTC)
Message-ID: <dee9c91dd38f05eda86eb126cc54679408518562.camel@perches.com>
Subject: Re: [PATCH] drm/fourcc: Add AXBXGXRX106106106106 format
From: Joe Perches <joe@perches.com>
To: Matteo Franchin <matteo.franchin@arm.com>, dri-devel@lists.freedesktop.org
Date: Wed, 07 Oct 2020 15:47:57 -0700
In-Reply-To: <20201007092725.13300-1-matteo.franchin@arm.com>
References: <20201007092725.13300-1-matteo.franchin@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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
Cc: tzimmermann@suse.de, airlied@linux.ie, liviu.dudau@arm.com,
 linux-kernel@vger.kernel.org, nd@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-10-07 at 10:27 +0100, Matteo Franchin wrote:
> Add ABGR format with 10-bit components packed in 64-bit per pixel.
> This format can be used to handle
> VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16 on little-endian
> architectures.

trivial note:

> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
[]
> @@ -202,6 +202,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_XBGR16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1 },
>  		{ .format = DRM_FORMAT_ARGB16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>  		{ .format = DRM_FORMAT_ABGR16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> +		{ .format = DRM_FORMAT_AXBXGXRX106106106106,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },

My is to separate this into 2 lines so every
column including .depth on still visually aligns.

+		{ .format = DRM_FORMAT_AXBXGXRX106106106106,
+							.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
