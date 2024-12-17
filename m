Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E801D9F3EF6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 01:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A3D10E802;
	Tue, 17 Dec 2024 00:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FmTTTeOg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE19B10E7F8;
 Tue, 17 Dec 2024 00:41:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6B3BDA41BCB;
 Tue, 17 Dec 2024 00:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12F7C4CED0;
 Tue, 17 Dec 2024 00:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734396099;
 bh=Ka+OMSaqE1tqko01dYUFN1zerLG7QyUuZt4Xtr1VtVU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FmTTTeOgGwQUKcETSk7JN9uS1HwjCzwU8/9sGIO3Bmrw15uctQ/lYEqdK/Y2LSc36
 sVRGyQIDFzYTswQB4XJjQuHhYx9O1fqa3MCoBjBngnZMdDWjTdZ1vQSA4ZnrXq1apM
 H9uWgDD5vchsL3JqZrjjgkuSeehBzjVSoBOMqyfhJeaaEIeN1NvM+1Le09/EnfsIoJ
 LTKU4scWe5S2hdTTM1QCmRn2znete1zt7t3IduwDQoj7szNb484ObmGOcP7KP82AIq
 qDk9g26Henr6xwrF7vH+dSu3Evhh1aTu0S+f/QCuMBGKj44cWhlYq5V+wuUrlOwuwA
 acPDcBfFbH4vQ==
Date: Mon, 16 Dec 2024 16:41:36 -0800
From: Kees Cook <kees@kernel.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 x86@kernel.org, linux-snps-arc@lists.infradead.org,
 linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: [PATCH 5/7] security: Replace get_task_comm() with %pTN
Message-ID: <202412161641.8209C666@keescook>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
 <20241213054610.55843-6-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213054610.55843-6-laoar.shao@gmail.com>
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

On Fri, Dec 13, 2024 at 01:46:08PM +0800, Yafang Shao wrote:
> Since task->comm is guaranteed to be NUL-terminated, we can print it
> directly without the need to copy it into a separate buffer. This
> simplifies the code and avoids unnecessary operations.
> 
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>

Looks good to me; thanks!

Acked-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
