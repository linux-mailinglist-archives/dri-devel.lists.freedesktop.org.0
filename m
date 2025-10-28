Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA52C16478
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CB910E637;
	Tue, 28 Oct 2025 17:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W1nAiYJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DA910E637
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:47:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9208E40749;
 Tue, 28 Oct 2025 17:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E23C4CEE7;
 Tue, 28 Oct 2025 17:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761673622;
 bh=tIB27fJlGHYWJS0XaFFJaUyApvbno/K/PK1n5ZQoZ50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W1nAiYJ6pbIo3BYCpiYMTSCcV3NdHroPoML9X2VgdhWGoOCR3UVQbjnoNRz0Gl7XP
 YOL3yhWMsznbPQwrhw3liaDnPhiTTKEPBrL+S/5yioDZcATbT3rPB+POy0y4axV8mn
 vkJv9ZXc7Lt2fQ5zhv9Pvo1HTHYKi3EMUqIuXj/dLnvRmbdHA10ITvmLSAA6cswpfQ
 +zeUDa9gQBLvqTwCYAkcg4zW6+RTMe2ddJZVjNSwYlgutpnGzj1+QCgIDp5y/+gJxu
 wekKQ5AbSj3n8BhBavQMIYtvcwZY3+8ucBsnN/4S3IWkzyAarwGGDds1vnWwg3Yn4q
 8exZIdGVEFfCw==
Date: Tue, 28 Oct 2025 13:47:00 -0400
From: Sasha Levin <sashal@kernel.org>
To: phasta@kernel.org
Cc: gregkh@linuxfoundation.org, christian.koenig@amd.com,
 ckoenig.leichtzumerken@gmail.com, dakr@kernel.org,
 dan.carpenter@linaro.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, matthew.brost@intel.com,
 robdclark@chromium.org, tvrtko.ursulin@igalia.com,
 stable-commits@vger.kernel.org
Subject: Re: Patch "drm/sched: Fix potential double free in
 drm_sched_job_add_resv_dependencies" has been added to the 6.1-stable tree
Message-ID: <aQEBlErx17wdKkh1@laps>
References: <2025102700-exception-unearned-a451@gregkh>
 <48644db5444c493aa0ec022b9708d3c71cd9f038.camel@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48644db5444c493aa0ec022b9708d3c71cd9f038.camel@mailbox.org>
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

On Mon, Oct 27, 2025 at 01:05:17PM +0100, Philipp Stanner wrote:
>On Mon, 2025-10-27 at 12:36 +0100, gregkh@linuxfoundation.org wrote:
>> Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
>
>What has happened with the encoding here?
>
>@Christian, your mail was UTF-8, wasn't it?

The end result in both the queue[1] as well as the released kernel[2] looks
correct, so I'll go ahead and blame Greg's mail sending scripts :p

I don't think there's anything that needs to be done here...

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/releases/6.17.5/drm-sched-fix-potential-double-free-in-drm_sched_job_add_resv_dependencies.patch
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.17.5&id=fdfb47e85af1e11ec822c82739dde2dd8dff5115

-- 
Thanks,
Sasha
