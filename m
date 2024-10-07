Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E60A993588
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 19:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF9F10E223;
	Mon,  7 Oct 2024 17:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vk4Mx36L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED7610E223
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 17:59:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 87813A41E72;
 Mon,  7 Oct 2024 17:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C231C4CEC6;
 Mon,  7 Oct 2024 17:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1728323954;
 bh=WqtbSakV4by+DFFQ2xQXqIDv0cF1tT9f9gKj/M08akA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vk4Mx36L5kfhqAX9OhASzL3lay4fq1JPskWhsTF+UfKVdzIOql4KRAZ9MLVgBozsw
 GUpV4j/VckmIdKLtpHnESQ1Jojg0h/U97ysGahq2+O8vqU5cr34tLTRAvTeu/ODhrf
 Tgo7CXOSKBuH5Tj7DDXeZLRIRpdbi48U5xhYTNMM=
Date: Mon, 7 Oct 2024 19:59:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: airlied@gmail.com, alexander.deucher@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ltuikov89@gmail.com,
 matthew.brost@intel.com, pstanner@redhat.com,
 tvrtko.ursulin@igalia.com, stable-commits@vger.kernel.org
Subject: Re: Patch "drm/sched: Always wake up correct scheduler in
 drm_sched_entity_push_job" has been added to the 6.10-stable tree
Message-ID: <2024100743-oozy-moving-59d4@gregkh>
References: <2024100752-shaking-sycamore-3cc4@gregkh>
 <8badb067-3cb3-431f-8081-be1bc0b9729b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8badb067-3cb3-431f-8081-be1bc0b9729b@amd.com>
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

On Mon, Oct 07, 2024 at 07:53:26PM +0200, Christian König wrote:
> Hi Greg,
> 
> please drop this patch from all backports. It turned out to be broken and
> the old handling has been restored by a revert.
> 
> Sorry for the noise. The revert should show up in Linus tree by the end of
> the week.

What is the revert's git id?  I'd rather take that so we don't have any
"why wasn't this patch applied" stuff later on.

thanks,

greg k-h
