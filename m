Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D4173252
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 09:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19D06EE27;
	Fri, 28 Feb 2020 08:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116836E931
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 15:54:43 +0000 (UTC)
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1j7LUm-0000J5-7d; Thu, 27 Feb 2020 16:54:40 +0100
Date: Thu, 27 Feb 2020 16:54:40 +0100
From: "bigeasy@linutronix.de" <bigeasy@linutronix.de>
To: Thomas Hellstrom <thellstrom@vmware.com>
Subject: Re: [PATCH 1/2] drm/vmwgfx: Drop preempt_disable() in
 vmw_fifo_ping_host()
Message-ID: <20200227155440.7ftnv4cmtm3ubrdp@linutronix.de>
References: <20200224140726.1550689-1-bigeasy@linutronix.de>
 <b2580fd686c9fea6afdb25f94adeab544a5c1d66.camel@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2580fd686c9fea6afdb25f94adeab544a5c1d66.camel@vmware.com>
X-Mailman-Approved-At: Fri, 28 Feb 2020 07:59:27 +0000
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
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-02-26 15:01:15 [+0000], Thomas Hellstrom wrote:
> Hi, Sebastian,
Hi Thomas,

> I suppose there isn't something like a preempt_disable_unless_RT()
> macro?

We got rid of most users of "preempt_disable_unless_RT()" since it was
used as a duct tape.
We still have it in the rt-devel tree but we have a plan for most users
and we don't intend to get it upstream.

> If not,
> Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>
> 
> I'll include in the next vmwgfx-next pull request

Thank you.

> Thanks,
> Thomas

Sebastian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
