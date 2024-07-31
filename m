Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20C59423FF
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 02:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ECB10E04A;
	Wed, 31 Jul 2024 00:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="yOaRG6xQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456D810E04A
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 00:59:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 012A261EA7;
 Wed, 31 Jul 2024 00:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C1AC32782;
 Wed, 31 Jul 2024 00:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1722387583;
 bh=i55BjG4Az1uMgUYMNpiUqocgXqxkBYbCX/reUu941+c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=yOaRG6xQyEFQANhk5kmfHuS8MU5QddMfdLCoZb7Fn3Dn1jftyjHTx1ybi8jCeft8n
 6h764jvhO3CQ0c5o+TVnmS20iygHQc9sgKpPD36OTPvk2zso5q2it+qi/r+Kaaa/QE
 ytAyGSH7qM171MciKceHCDOOZDW+rPYccVVdYelg=
Date: Tue, 30 Jul 2024 17:59:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH resend v4 00/11] Improve the copy of task comm
Message-Id: <20240730175927.673754c361a70351ad8a3ff9@linux-foundation.org>
In-Reply-To: <20240729023719.1933-1-laoar.shao@gmail.com>
References: <20240729023719.1933-1-laoar.shao@gmail.com>
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

On Mon, 29 Jul 2024 10:37:08 +0800 Yafang Shao <laoar.shao@gmail.com> wrote:

> Is it appropriate for you to apply this to the mm tree?

There are a couple of minor conflicts against current 6.11-rc1 which
you'd best check.  So please redo this against current mainline?
