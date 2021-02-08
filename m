Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2013130FB
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 12:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012EF6E8A3;
	Mon,  8 Feb 2021 11:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F93D6E8A1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 11:36:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6780F64E40;
 Mon,  8 Feb 2021 11:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612784185;
 bh=fBp9LiWsmCqhuaI9wcJM8SBAr5veZ226g9+wpY2pX+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ubHOUH2l2tFZUF2ynWkVVod7BUYjSKuOSrCEIvHN0ZJyFeqBx8hPUkx8ibDvJM6cp
 nYgvBXrN7yP6JPyVxnB5Vl25KRr4gUYEtwf8ZWhdKErl70xdsLpHW/kxIlsvpTL2KU
 7wshBHn6WQ/X9D2rLICFJKJ6l/CWRLTblBGEIZjFAboNqwhE1W6cXhnVCMmg+s3RK8
 t3HE2TPmQBQPngHWdOQeK67EAanjk7crsmyGh7z9toVdi4bcIA4jwAmSMy7m/GHEBq
 aCd9u393CVZ+h6B9r1/Qqj4tW0JbbTw8jCs10nzwjrpRirqCtk8wVn3xF8/6XFQklM
 6j1XdiBtOr5PQ==
Date: Mon, 8 Feb 2021 12:36:18 +0100
From: Jessica Yu <jeyu@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: module loader dead code removal and cleanups v3
Message-ID: <YCEiMoWRLj+lpNqS@gunter>
References: <20210202121334.1361503-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202121334.1361503-1-hch@lst.de>
X-OS: Linux gunter 5.10.9-1-default x86_64
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+++ Christoph Hellwig [02/02/21 13:13 +0100]:
>Hi all,
>
>this series removes support for long term unused export types and
>cleans up various loose ends in the module loader.
>
>Changes since v2:
> - clean up klp_find_object_symbol a bit
> - remove the now unused module_assert_mutex helper
>
>Changes since v1:
> - move struct symsearch to module.c
> - rework drm to not call find_module at all
> - allow RCU-sched locking for find_module
> - keep find_module as a public API instead of module_loaded
> - update a few comments and commit logs
>
>Diffstat:

Queued on modules-next (along with the updated patch 10).

Thanks everyone,

Jessica
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
