Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD361D4E28
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 14:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F376EC8E;
	Fri, 15 May 2020 12:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE136EC8E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 12:54:28 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4FF420787;
 Fri, 15 May 2020 12:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589547268;
 bh=TotoL9YXsj+E4MwRDKyj3GbWs9IEi6m6QDbCpdIsCQM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M/zXyDtwPlnFMqEQDPslfgMp9FZncwD5Y623ZF6geSYAJDxstXP18RdhxSzkoQv5C
 +2UlOmeRnhVgPrsdSsTLzBIoBlufLx5x7KT25dXY3Q0bvDa0jwMOPg8fBIZblClI6G
 YRoRBwIqyER8H2ya1QhRxnTyos5uf8y+IjyLsbZs=
Date: Fri, 15 May 2020 14:54:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 01/11] tty/sysrq: alpha: export and use
 __sysrq_get_key_op()
Message-ID: <20200515125417.GA1928406@kroah.com>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
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
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Jiri Slaby <jslaby@suse.com>, Matt Turner <mattst88@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 10:43:41PM +0100, Emil Velikov wrote:
> Export a pointer to the sysrq_get_key_op(). This way we can cleanly
> unregister it, instead of the current solutions of modifuing it inplace.
> 
> Since __sysrq_get_key_op() is no longer used externally, let's make it
> a static function.
> 
> This patch will allow us to limit access to each and every sysrq op and
> constify the sysrq handling.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
> Please keep me in the CC list, as I'm not subscribed to the list.
> 
> IMHO it would be better if this gets merged this via the tty tree.

All now taken, thanks!

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
