Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D402153B72
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 23:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E076F96A;
	Wed,  5 Feb 2020 22:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0081.hostedemail.com
 [216.40.44.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9746F96A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 22:52:13 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id C02BD3AB6;
 Wed,  5 Feb 2020 22:52:12 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::,
 RULES_HIT:41:355:379:599:800:960:966:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2525:2553:2560:2563:2682:2685:2828:2859:2902:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4362:4385:4605:5007:7903:9025:10004:10400:10848:11026:11232:11233:11658:11914:12043:12048:12262:12297:12438:12555:12679:12740:12760:12895:12986:13069:13311:13357:13439:14096:14097:14181:14659:14721:21080:21365:21451:21611:21627:21740:21811:21939:30012:30054:30064:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:3, LUA_SUMMARY:none
X-HE-Tag: order36_1316b577d5b11
X-Filterd-Recvd-Size: 2066
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Wed,  5 Feb 2020 22:52:11 +0000 (UTC)
Message-ID: <5a14078affad5e26330627d91df394da990ba301.camel@perches.com>
Subject: Re: [PATCH] drm: Add missing newline after comment
From: Joe Perches <joe@perches.com>
To: Stefan Agner <stefan@agner.ch>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie,
 daniel.vetter@ffwll.ch
Date: Wed, 05 Feb 2020 14:50:59 -0800
In-Reply-To: <586aab08af596120f48858005bb6784c83035d59.1580941448.git.stefan@agner.ch>
References: <586aab08af596120f48858005bb6784c83035d59.1580941448.git.stefan@agner.ch>
User-Agent: Evolution 3.34.1-2 
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
Cc: airlied@redhat.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-02-05 at 23:26 +0100, Stefan Agner wrote:
> Clang prints a warning:
> drivers/gpu/drm/drm_lock.c:363:6: warning: misleading indentation;
> statement is not part of the previous 'if' [-Wmisleading-indentation]
>          */     mutex_lock(&dev->struct_mutex);
>                 ^
> drivers/gpu/drm/drm_lock.c:357:2: note: previous statement is here
>         if (!drm_core_check_feature(dev, DRIVER_LEGACY))
>         ^
> 
> Fix this by adding a newline after the multi-line comment.

Thanks, already in -next

commit 5b99cad6966b92f757863ff9b6688051633fde9a
Author: Dan Carpenter <dan.carpenter@oracle.com>
Date:   Wed Jan 8 08:43:12 2020 +0300

    gpu/drm: clean up white space in drm_legacy_lock_master_cleanup()
    
    We moved this code to a different file and accidentally deleted a
    newline.
    
    Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
    Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
    Link: https://patchwork.freedesktop.org/patch/msgid/20200108054312.yzlj5wmbdktejgob@kili.mountain


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
