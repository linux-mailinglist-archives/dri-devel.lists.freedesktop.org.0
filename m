Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E151C243B
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 11:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A548B6E0C9;
	Sat,  2 May 2020 09:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62BB6E0C9
 for <dri-devel@lists.freedesktop.org>; Sat,  2 May 2020 09:00:08 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21090891-1500050 for multiple; Sat, 02 May 2020 10:00:00 +0100
MIME-Version: 1.0
In-Reply-To: <d5789d27-bf14-c1e7-d9c0-71fce6e16f24@amd.com>
References: <20200430095839.6474-1-nirmoy.das@amd.com>
 <158824170487.7361.8387026848955948115@build.alporthouse.com>
 <d5789d27-bf14-c1e7-d9c0-71fce6e16f24@amd.com>
To: Nirmoy <nirmodas@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/1] drm/mm: optimize rb_hole_addr rbtree search
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158841000025.27785.3023804138122028190@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Sat, 02 May 2020 10:00:00 +0100
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
Cc: nirmoy.das@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Nirmoy (2020-04-30 11:30:43)
> 
> On 4/30/20 12:15 PM, Chris Wilson wrote:
> > Quoting Nirmoy Das (2020-04-30 10:58:39)
> >> +void insert_hole_addr(struct rb_root *root, struct drm_mm_node *node)
> > ^ static
> 
> 
> Ah I forgot!
> 
> >
> > (sparse [make C=1] or make W=1 will spot this)
> 
> 
> Thanks for the tip :)
> 
> Nirmoy
> 
> >
> > Looks good, I'll check more carefully later.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

If you do find some time to add some more tests, that would be great!

Even converting your example into a test-drm_mm benchmark [spending a
few seconds runtime max!] will be very useful.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
