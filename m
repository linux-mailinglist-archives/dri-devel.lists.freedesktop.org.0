Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A962486C9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 16:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CEA89DE6;
	Tue, 18 Aug 2020 14:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F0F89DE6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:11:44 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28C3C207DE;
 Tue, 18 Aug 2020 14:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597759904;
 bh=Vqi/42Mlz96SYAOO6+KKIDxvCtnpMfrrWJ/Z01/wrbs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nPuaUiw6KplZId5dUjXhdwWgQwwK/Z334U0FwESa12br3aOOSsMxlwPMDclNcLlYi
 K0tZJRbGHGIpFvz9GkSi4lqC7gEamqwSbICUg4iLn1tl74sZE3ZHs0NmMEBoj7eZQC
 2bf8/BRC+n67kKGaAtnrM8vX3Izke6aOjEbWgijc=
Date: Tue, 18 Aug 2020 16:12:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tomer Samara <tomersamara98@gmail.com>
Subject: Re: [PATCH v2 4/4] staging: android: Add error handling to
 order_to_index callers
Message-ID: <20200818141208.GD562377@kroah.com>
References: <cover.1597602783.git.tomersamara98@gmail.com>
 <c653c468e0c3044b10df375e8245e5d50634a7fa.1597602783.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c653c468e0c3044b10df375e8245e5d50634a7fa.1597602783.git.tomersamara98@gmail.com>
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Martijn Coenen <maco@android.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Joel Fernandes <joel@joelfernandes.org>,
 Riley Andrews <riandrews@android.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Hridya Valsaraju <hridya@google.com>, Laura Abbott <labbott@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 16, 2020 at 10:31:22PM +0300, Tomer Samara wrote:
> Add error check to:
> - free_buffer_page
> - alloc_buffer_page
> after calling order_to_index, due to converting BUG to WARN at
> order_to_index.

You are fixing a bug you caused in a previous patch, not good :)

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
