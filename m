Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8099572EAE7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 20:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87FB10E3DA;
	Tue, 13 Jun 2023 18:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C3410E3DA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 18:26:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 08DF363321;
 Tue, 13 Jun 2023 18:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0BBC433F0;
 Tue, 13 Jun 2023 18:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686680778;
 bh=R+xVWiMxprZvOhUetmFyXU5kmbM0wMzPd9ONFta1rf0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WjPm+fG7vLmZU+5bzb6NGSYFQURjHj4dBcqMG00QgrPrHFrGCaLqeohNSTn33/Njv
 ozJSyRuoRtUjlswhIRlkTnCzgCNDEVpqoF478if5YMIAA3jJwzQU7P7gK2EmGMGpnH
 jq1kjv1S66zpEu2YRPNVUfQD/JFBAvyJ3qHzuZ2pLY+3tQXGgW0pIB2bi/pwRBIsYG
 yml2v4UpbBitFvosB3o+BXbyVxhkdpQR1t+K4aN353Uqr02xoy7i237IEABWxXzdbu
 cqkkRmhx9ud7U5AMbTku0vr1bryQkAJol3G4k+NYebQZDv8taM44ig2xA6aaYJPWue
 +A8PqReCWc+aw==
Message-ID: <c3c94c4a-4066-a233-e503-92fe9c11a9aa@kernel.org>
Date: Tue, 13 Jun 2023 20:26:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 00/17] Imagination Technologies PowerVR DRM driver
Content-Language: en-US
To: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230613144800.52657-1-sarah.walker@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: matthew.brost@intel.com, christian.koenig@amd.com, luben.tuikov@amd.com,
 dakr@redhat.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 sumit.semwal@linaro.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/06/2023 16:47, Sarah Walker wrote:
> This patch series adds the initial DRM driver for Imagination Technologies PowerVR
> GPUs, starting with those based on our Rogue architecture. It's worth pointing
> out that this is a new driver, written from the ground up, rather than a
> refactored version of our existing downstream driver (pvrsrvkm).
> 

...

> 
> maple_tree: split up MA_STATE() macro:https://lists.freedesktop.org/archives/dri-devel/2023-June/407927.html
> drm: manager to keep track of GPUs VA mappings: https://lists.freedesktop.org/archives/dri-devel/2023-June/407928.html
> drm/sched: Convert drm scheduler to use a work queue rather than kthread: https://lists.freedesktop.org/archives/dri-devel/2023-April/398458.html
> drm/sched: Move schedule policy to scheduler / entity: https://lists.freedesktop.org/archives/dri-devel/2023-April/398461.html
> drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy: https://lists.freedesktop.org/archives/dri-devel/2023-April/398460.html
> drm/sched: Start run wq before TDR in drm_sched_start: https://lists.freedesktop.org/archives/dri-devel/2023-April/398462.html
> drm/sched: Submit job before starting TDR: https://lists.freedesktop.org/archives/dri-devel/2023-April/398466.html
> drm/sched: Add helper to set TDR timeout: https://lists.freedesktop.org/archives/dri-devel/2023-April/398464.html
> drm: fix drmm_mutex_init(): https://lists.freedesktop.org/archives/dri-devel/2023-May/404863.html
> drm/sched: Make sure we wait for all dependencies in kill_jobs_cb(): https://lists.freedesktop.org/archives/dri-devel/2023-June/408901.html
> drm/sched: Call drm_sched_fence_set_parent() from drm_sched_fence_scheduled(): https://lists.freedesktop.org/archives/dri-devel/2023-June/408904.html
> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15243
> [2] https://gitlab.freedesktop.org/mesa/mesa/-/tree/main/src/imagination/vulkan
> [3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15507
> 
> v3:
> * Use drm_sched for scheduling
> * Use GPU VA manager
> * Use runtime PM
> * Use drm_gem_shmem
> * GPU watchdog and device loss handling

No changes in the bindings? So you decided to just ignore the comments?

Sorry, that's not a good approach. Implement all the comments or respond
to them.

Best regards,
Krzysztof

