Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1309013C75A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 16:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26986EADB;
	Wed, 15 Jan 2020 15:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9D56EADA;
 Wed, 15 Jan 2020 15:22:18 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 309C32053B;
 Wed, 15 Jan 2020 15:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579101738;
 bh=xQmCyFQKagD5zDRlX3Qlfs8hMu8+HZwNUQzGdVyqi5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fVw5yj+U1NPrGHrcpdvUVYorEbTy7dsunxncXsx5tOnJfYg8xDWzdUYV5T3JpRMj3
 kfhnPv44rNtofwxqnyHr36yJhL8caHMOIOVaXUPv4gIDfGdiFfXjVNr88CAT66S/Cw
 PLEbNEbRTfxGN9Yv+jMz+F9EOeYQuNQhYpTPRa5Y=
Date: Wed, 15 Jan 2020 16:22:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: [RFC PATCH 4/4] drm/i915/gvt: move public gvt headers out into
 global include
Message-ID: <20200115152215.GA3830321@kroah.com>
References: <4079ce7c26a2d2a3c7e0828ed1ea6008d6e2c805.camel@cyberus-technology.de>
 <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
 <20200109171357.115936-5-julian.stecklina@cyberus-technology.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109171357.115936-5-julian.stecklina@cyberus-technology.de>
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
Cc: linux-kernel@vger.kernel.org, hang.yuan@intel.com,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 zhiyuan.lv@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 09, 2020 at 07:13:57PM +0200, Julian Stecklina wrote:
> Now that the GVT interface to hypervisors does not depend on i915/GVT
> internals anymore, we can move the headers to the global include/.
> 
> This makes out-of-tree modules for hypervisor integration possible.

What kind of out-of-tree modules do you need/want for this?  And why do
they somehow have to be out of the tree?  We want them in the tree, and
so should you, as it will save you time and money if they are.

Also, as Christoph said, adding exports for functions that are not used
by anything within the kernel tree itself is not ok, that's not how we
work.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
