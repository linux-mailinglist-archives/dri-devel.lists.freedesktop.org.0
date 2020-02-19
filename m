Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24782164F18
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 20:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44666EC91;
	Wed, 19 Feb 2020 19:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302226E85C;
 Wed, 19 Feb 2020 19:42:40 +0000 (UTC)
Received: from X1 (nat-ab2241.sltdut.senawave.net [162.218.216.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA4E9207FD;
 Wed, 19 Feb 2020 19:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582141360;
 bh=1/a4Xx7AYtpyRHkBndK/JCsGsEXByxqpk4z2Vsn4cDw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Uj3MuukA5jUnnY+8Ogc8/SRaW1zDsJsUMgWiFSN5e61POmQMF2e8I1QqfftdJaq2l
 Ed+hqGyvNplUaUCzQFG1dsedWuI/bncsDV06wiYNUlwV1vj/cuxDFWhTJ7Lm0a6PS7
 OELziXddtDVsjHu4WF5SwkQqE7fV0X0XKGKfBoLk=
Date: Wed, 19 Feb 2020 11:42:39 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 01/52] mm/sl[uo]b: export __kmalloc_track(_node)_caller
Message-Id: <20200219114239.e8cf142af32a63bda44eef1f@linux-foundation.org>
In-Reply-To: <20200219102122.1607365-2-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-2-daniel.vetter@ffwll.ch>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christoph Lameter <cl@linux.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Feb 2020 11:20:31 +0100 Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> tracker in drm for stuff that's tied to the lifetime of a drm_device,
> not the underlying struct device. Kinda like devres, but for drm.
> 
> ...
>
> Ack for merging through drm trees very much appreciated.

Acked-by: Andrew Morton <akpm@linux-foundation.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
