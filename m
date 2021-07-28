Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4F43D8767
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 07:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112496EC9A;
	Wed, 28 Jul 2021 05:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECF96EC9A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 05:48:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E4BA60F00;
 Wed, 28 Jul 2021 05:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1627451334;
 bh=JbVsyLEsyV0K95tq78eYFj+nbQBWex8TPUG2O5qezhI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LoC9EgXWUIVE6yfgEZosITUtLaP51IYAc4EF8BMu6yXcuHArSq3YpSLR0z9QW9PkB
 rOHss0A4SNXP4+opIRM5+O+mGIbwTTaMd/SSh7hXGIKc3F31yUanRxa81+9XqFAzLR
 gpTe0njI/NP4taNwLMzklkg1vAwgKq5naQqJEoXw=
Date: Wed, 28 Jul 2021 07:48:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 49/64] cm4000_cs: Use struct_group() to zero struct
 cm4000_dev region
Message-ID: <YQDvxAofJlI1JoGZ@kroah.com>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-50-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727205855.411487-50-keescook@chromium.org>
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
Cc: linux-kbuild@vger.kernel.org, netdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-block@vger.kernel.org,
 clang-built-linux@googlegroups.com, Keith Packard <keithpac@amazon.com>,
 linux-hardening@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 01:58:40PM -0700, Kees Cook wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memset(), avoid intentionally writing across
> neighboring fields.
> 
> Add struct_group() to mark region of struct cm4000_dev that should be
> initialized to zero.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/char/pcmcia/cm4000_cs.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
