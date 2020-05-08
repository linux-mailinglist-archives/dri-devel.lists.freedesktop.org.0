Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 011681CB133
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 15:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308E489E59;
	Fri,  8 May 2020 13:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6874F89E59
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 13:57:38 +0000 (UTC)
Received: from 89-64-85-173.dynamic.chello.pl (89.64.85.173) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.415)
 id d8c954b8ac2de5b7; Fri, 8 May 2020 15:57:05 +0200
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the amdgpu tree with the pm tree
Date: Fri, 08 May 2020 15:57:05 +0200
Message-ID: <1973656.7Sjq3fjOQu@kreacher>
In-Reply-To: <20200508143457.14acfc46@canb.auug.org.au>
References: <20200508143457.14acfc46@canb.auug.org.au>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, May 8, 2020 6:34:57 AM CEST Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the amdgpu tree got a conflict in:
> 
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> 
> between commit:
> 
>   e07515563d01 ("PM: sleep: core: Rename DPM_FLAG_NEVER_SKIP")
> 
> from the pm tree and commit:
> 
>   500bd19a7e5d ("drm/amdgpu: only set DPM_FLAG_NEVER_SKIP for legacy ATPX BOCO")
> 
> from the amdgpu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for resolving this, the resolution looks good to me.

Cheers!



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
