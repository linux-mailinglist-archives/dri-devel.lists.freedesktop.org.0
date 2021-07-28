Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA23D3D881E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 08:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C6E6E2E6;
	Wed, 28 Jul 2021 06:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B8F6E2E6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 06:41:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA8B16023E;
 Wed, 28 Jul 2021 06:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1627454479;
 bh=56P83WlclwichTl6Z38luZ2iMK3+gEOYgDjb65V+lIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RyFulSv1DKr+WMQoNMSADu/bvEL2Nt9m/j8r5jvKSLh5jGBe0pgTIj4j2kHvRaqiq
 cqa3qzmYXurTLeQgm/jDQEpxNsvH/ufI5US3zham8t8FNmVEui6kSE+H9CKeuNpq36
 x4opoXtu0wbNZ69pe/1t1danjGs4IfYhvpwS+YHI=
Date: Wed, 28 Jul 2021 08:41:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH 19/64] ip: Use struct_group() for memcpy() regions
Message-ID: <YQD8DcOeivPzLMkL@kroah.com>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-20-keescook@chromium.org>
 <YQDxaYrHu0PeBIuX@kroah.com>
 <baead202-569f-775f-348c-aa64e69f03ed@embeddedor.com>
 <YQD2/CA7zJU7MW6M@kroah.com>
 <e3193698-86d5-d529-e095-e09b4d52927b@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3193698-86d5-d529-e095-e09b4d52927b@embeddedor.com>
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
Cc: Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 netdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, linux-hardening@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 01:31:16AM -0500, Gustavo A. R. Silva wrote:
> > Why not use a local version of the macro like was done in the DRM header
> > file, to make it always work the same and more obvious what is
> > happening?  If I were a userspace developer and saw the above, I would
> > think that the kernel developers have lost it :)
> 
> Then don't take a look at this[1]. :p
> 
> --
> Gustavo
> 
> [1] https://git.kernel.org/linus/c0a744dcaa29e9537e8607ae9c965ad936124a4d

That one at least looks a "little" different so maybe it could be seen
as semi-reasonable :)
