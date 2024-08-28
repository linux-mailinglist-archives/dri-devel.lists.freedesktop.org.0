Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4C8961B5D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 03:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9458110E0DC;
	Wed, 28 Aug 2024 01:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WJNzdFvV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F323010E0DC
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 01:19:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0A510A404DF;
 Wed, 28 Aug 2024 01:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB8BC4AF09;
 Wed, 28 Aug 2024 01:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1724807997;
 bh=HkTJ4Z02ayqIUPhojcsjUl5UoyOWUAcRVHBJ6olPfuQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WJNzdFvVwu6bdkbAexFJCp4o3xRs3N2XVgbg7dWfYc8oKkS1bGy3wp08pzoD04Ddi
 KD9aCsG9Qn2KIcc/d508cy8wgLYsrMSorJeUt6j5clVoffTPvg5CptfFEW1q8IOr1w
 Cko2CkjE/Elw/vYXQL6TuLRVPMXDuoP+ETZqaeeU=
Date: Tue, 27 Aug 2024 18:19:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: torvalds@linux-foundation.org, alx@kernel.org, justinstitt@google.com,
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 0/8] Improve the copy of task comm
Message-Id: <20240827181956.73484860efe34e550f35db7a@linux-foundation.org>
In-Reply-To: <CALOAHbA7VW3_gYzqzb+Pp2T3BqWb5x2sWPmUj2N+SzbYchEBBA@mail.gmail.com>
References: <20240817025624.13157-1-laoar.shao@gmail.com>
 <CALOAHbA7VW3_gYzqzb+Pp2T3BqWb5x2sWPmUj2N+SzbYchEBBA@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Aug 2024 10:30:54 +0800 Yafang Shao <laoar.shao@gmail.com> wrote:

> Hello Andrew,
> 
> Could you please apply this series to the mm tree ?

Your comment in
https://lkml.kernel.org/r/CALOAHbA5VDjRYcoMOMKcLMVR0=ZwTz5FBTvQZExi6w8We9JPHg@mail.gmail.com
led me to believe that a v8 is to be sent?
