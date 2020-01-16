Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA6413DD55
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 15:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0470C6ED3B;
	Thu, 16 Jan 2020 14:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1476ED3B;
 Thu, 16 Jan 2020 14:23:48 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 81FE320748;
 Thu, 16 Jan 2020 14:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579184628;
 bh=KNIqX/sx4KhchS5SQ+KG9h+E5ENCroy3R1j54AGgznA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qzkkuiBSFvpSjZIZT5iwzK6+SGNRGnsX9btY+dsBHaEtaAAr7Hp6kSV75PxZnJ88G
 pI4YRdXBW1PtXG9RMyBnrnBvHt8vNe9aXrZ+QTF2pDm0j9oonu2NuWdU39ddwuQ/bP
 E64IUuwgHDIjro25Fo9XF1lXa9hf7HTki+u7jTrY=
Date: Thu, 16 Jan 2020 15:23:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: [RFC PATCH 4/4] drm/i915/gvt: move public gvt headers out into
 global include
Message-ID: <20200116142345.GA476889@kroah.com>
References: <4079ce7c26a2d2a3c7e0828ed1ea6008d6e2c805.camel@cyberus-technology.de>
 <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
 <20200109171357.115936-5-julian.stecklina@cyberus-technology.de>
 <20200115152215.GA3830321@kroah.com>
 <9b32e225ee680e61716e300eb1ed8387599cc0dd.camel@cyberus-technology.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b32e225ee680e61716e300eb1ed8387599cc0dd.camel@cyberus-technology.de>
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
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>,
 linux-kernel@vger.kernel.org, hang.yuan@intel.com,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 zhiyuan.lv@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 16, 2020 at 03:13:01PM +0100, Julian Stecklina wrote:
> Hi Greg, Christoph,
> 
> On Wed, 2020-01-15 at 16:22 +0100, Greg KH wrote:
> > On Thu, Jan 09, 2020 at 07:13:57PM +0200, Julian Stecklina wrote:
> > > Now that the GVT interface to hypervisors does not depend on i915/GVT
> > > internals anymore, we can move the headers to the global include/.
> > > 
> > > This makes out-of-tree modules for hypervisor integration possible.
> > 
> > What kind of out-of-tree modules do you need/want for this?
> 
> The mediated virtualization support in the i915 driver needs a backend to the
> hypervisor. There is currently one backend for KVM in the tree
> (drivers/gpu/drm/i915/gvt/kvmgt.c) and at least 3 other hypervisor backends out
> of tree in various states of development that I know of. We are currently
> developing one of these.

Great, then just submit this patch series as part of your patch series
when submitting yoru hypervisor code.  That's the normal way to export
new symbols, we can't do so without an in-kernel user.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
