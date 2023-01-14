Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5173766AC61
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 17:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A874E10E0A1;
	Sat, 14 Jan 2023 16:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C01610E0A1;
 Sat, 14 Jan 2023 16:01:01 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id E8468600086B;
 Sat, 14 Jan 2023 16:00:55 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id xTKXyWXOQpbs; Sat, 14 Jan 2023 16:00:53 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt
 [IPv6:2001:690:2100:1::b3dd:b9ac])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 77ED46000868;
 Sat, 14 Jan 2023 16:00:53 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1673712053;
 bh=RZU58FeLyRmpVsu+m1wZmQJWulTa9BOooLU8AzAOYRQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=gxS1l7bAin500lDfFN68KnKCFACBeuW1O0mIxDiHof35CCJRwhMnWnR/B/udQJU1l
 56W9yezlyN7kzFLhDUJlTKCj/FzKKCzaopWAy9EILTsltcmDtNfn/cuH5nPKqwbynr
 8FtQsNA8StHxguSO7574xCJNvzrQB5MSqaeJbwe4=
Received: from wslaptop (unknown [IPv6:2001:818:dcb5:dc00:d990:b664:f16:4cb2])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id B5F1F36008B;
 Sat, 14 Jan 2023 16:00:52 +0000 (WET)
Date: Sat, 14 Jan 2023 15:58:37 +0000
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] GM20B probe fails after commit 2541626cfb79
Message-ID: <20230114155837.edqhigueohrkd3os@wslaptop>
References: <20221228144914.z7t7a4fdwvbblnak@wslaptop>
 <c32ea02c-d706-ea2f-aa13-660b8db958ef@leemhuis.info>
 <481f19ba-da7e-6900-0bb2-64ba92d59ce6@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <481f19ba-da7e-6900-0bb2-64ba92d59ce6@leemhuis.info>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 13, 2023 at 02:19:06PM +0100, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
> Diogo, for that it would be really helpful to known: is the issue still
> happening with latest mainline? Is it possible to revert 2541626cfb79
> easily? And if so: do things work afterwards again?

Hello,

Thank you for your attention to this! I have checked the latest mainline and
it still occurs. As for reverting, I think it is complicated to do,
since this commit is a part of a larger rework, but I'm afraid I don't know
enough about the code to give a proper answer.

Diogo
