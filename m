Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA040330A07
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 10:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D324D6E837;
	Mon,  8 Mar 2021 09:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13BA6E830;
 Mon,  8 Mar 2021 09:13:09 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 24038287-1500050 for multiple; Mon, 08 Mar 2021 09:12:19 +0000
MIME-Version: 1.0
In-Reply-To: <20210308090722.8392-1-baijiaju1990@gmail.com>
References: <20210308090722.8392-1-baijiaju1990@gmail.com>
Subject: Re: [PATCH] gpu: drm: i915: fix error return code of
 igt_threaded_blt()
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Jia-Ju Bai <baijiaju1990@gmail.com>, airlied@linux.ie, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 matthew.auld@intel.com, rodrigo.vivi@intel.com
Date: Mon, 08 Mar 2021 09:12:15 +0000
Message-ID: <161519473525.8241.4435549444995105395@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: intel-gfx@lists.freedesktop.org, Jia-Ju Bai <baijiaju1990@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Jia-Ju Bai (2021-03-08 09:07:22)
> When kcalloc() returns NULL to tsk or thread, no error code of 
> igt_threaded_blt() is returned.
> To fix this bug, -ENOMEM is returned as error code.

Because we decided to skip the test if it could not be run due to
insufficient memory, as opposed to an internal allocation failure from
the driver.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
