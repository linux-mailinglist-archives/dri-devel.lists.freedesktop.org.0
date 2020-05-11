Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A456F1CD656
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 12:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B766E42F;
	Mon, 11 May 2020 10:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6F56E42E;
 Mon, 11 May 2020 10:19:35 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21158493-1500050 for multiple; Mon, 11 May 2020 11:19:31 +0100
MIME-Version: 1.0
In-Reply-To: <20200511095433.GA206103@phenom.ffwll.local>
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <20200511095433.GA206103@phenom.ffwll.local>
Subject: Re: [PATCH 0/6] RFC Support hot device unplug in amdgpu
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <158919237000.1729.13151635793333034320@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Mon, 11 May 2020 11:19:30 +0100
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2020-05-11 10:54:33)
>   - worse, neither vk nor gl (to my knowledge) have a concept of events
>     for when the gpu died. The only stuff you have is things like
>     arb_robustness which says a) everything continues as if nothing
>     happened b) there's a function where you can ask whether your gl
>     context and all the textures/buffers are toast.

Vulkan/DX12 arrived after eGPU, and there is at least the concept of
VK_ERROR_DEVICE_LOST. Mainly used at the moment after a GPU hang and
loss of context.

https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#devsandqueues-lost-device
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
