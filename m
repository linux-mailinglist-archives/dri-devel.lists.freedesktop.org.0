Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FDE1DB9B4
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 18:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6D56E874;
	Wed, 20 May 2020 16:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D2A6E873
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 16:37:13 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21243571-1500050 for multiple; Wed, 20 May 2020 17:37:07 +0100
MIME-Version: 1.0
In-Reply-To: <CACvgo509GWuekwkW9Fc7TdmWyspqMMgD8FBUESt1L4KB5EyVgQ@mail.gmail.com>
References: <CACvgo51fM1K2Fg=stC2_cz_pnJypi50Lu_OGs0utGH9QEMS3wQ@mail.gmail.com>
 <20200520142347.29060-1-chris@chris-wilson.co.uk>
 <CACvgo509GWuekwkW9Fc7TdmWyspqMMgD8FBUESt1L4KB5EyVgQ@mail.gmail.com>
Subject: Re: [PATCH] drm: Restore the NULL check for drm_gem_object_put()
To: Emil Velikov <emil.l.velikov@gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158999262660.8153.2394309055270577613@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Wed, 20 May 2020 17:37:06 +0100
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, Christian König <christian.koenig@amd.com>, ML dri-devel <dri-devel@lists.freedesktop.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Emil Velikov (2020-05-20 15:25:05)
> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> 
> I'm half way through checking the callers and I've noticed a handful of bugs.
> Will send the series in due time, although your patch is a perfect
> intermediate solution.

Pushed the compromise patch. That should keep us all happy within our
own little bubbles for the moment. Have fun!
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
