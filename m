Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570823D1E8B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 08:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514556E9D4;
	Thu, 22 Jul 2021 06:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from audible.transient.net (audible.transient.net [24.143.126.66])
 by gabe.freedesktop.org (Postfix) with SMTP id 34BD16E898
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:21:05 +0000 (UTC)
Received: (qmail 5416 invoked from network); 21 Jul 2021 13:21:04 -0000
Received: from cucamonga.audible.transient.net (192.168.2.5)
 by canarsie.audible.transient.net with QMQP; 21 Jul 2021 13:21:04 -0000
Received: (nullmailer pid 3505 invoked by uid 1000);
 Wed, 21 Jul 2021 13:21:04 -0000
Date: Wed, 21 Jul 2021 13:21:04 +0000
From: Jamie Heilman <jamie@audible.transient.net>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: remove special handling for non GEM drivers
Message-ID: <YPgfQMXhykBxMlzO@audible.transient.net>
References: <20210419092853.1605-1-christian.koenig@amd.com>
 <YPgZxiRY5/pl9IeK@audible.transient.net>
 <f4f6a295-83b2-6ba3-149e-4a49933c9458@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4f6a295-83b2-6ba3-149e-4a49933c9458@gmail.com>
X-Mailman-Approved-At: Thu, 22 Jul 2021 06:54:33 +0000
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Christian König wrote:
> This is a known issue and fixed by:
>
> commit a3a9ee4b5254f212c2adaa8cd8ca03bfa112f49d
> Author: Christian König <christian.koenig@amd.com>
> Date:   Wed Jun 9 19:25:56 2021 +0200
> 
>     drm/nouveau: init the base GEM fields for internal BOs
> 
>     TTMs buffer objects are based on GEM objects for quite a while
>     and rely on initializing those fields before initializing the TTM BO.
> 
>     Nouveau now doesn't init the GEM object for internally allocated BOs,
>     so make sure that we at least initialize some necessary fields.

Ah, good deal.  Thanks

-- 
Jamie Heilman                     http://audible.transient.net/~jamie/
