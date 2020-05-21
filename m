Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F98B1DCB3C
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 12:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDDF6E128;
	Thu, 21 May 2020 10:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2B86E110
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 10:46:30 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21246172-1500050 for multiple; Thu, 21 May 2020 11:46:07 +0100
MIME-Version: 1.0
In-Reply-To: <20200521104152.305641-1-ayaz.siddiqui@intel.com>
References: <20200521104152.305641-1-ayaz.siddiqui@intel.com>
To: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>, dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915/gt: Initialize reserved and unspecified MOCS
 indices
Message-ID: <159005796564.32320.10401104105676819911@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Thu, 21 May 2020 11:46:05 +0100
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
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Ayaz A Siddiqui (2020-05-21 11:41:52)
> In order to avoid functional breakage of mis-programmed applications that
> have grown to depend on unused MOCS entries. It has been decided to
> program those entries to be equal to fully cached ("L3 + LLC") entry.

"It has been" appears to be you have decided, since there isn't even a
reference to the previous threads on this topic, or any other
discussion.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
