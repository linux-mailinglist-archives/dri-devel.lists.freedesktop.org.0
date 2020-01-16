Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48866140502
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 09:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183C06F419;
	Fri, 17 Jan 2020 08:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09558958E;
 Thu, 16 Jan 2020 15:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZexOn4FEQsloo7emu6e0E5yv/ua4j8MP3CCsOZRUTrA=; b=cH5daPaIgIih/Pf96nB99OLLk
 He2uzFd9DbAroxYeSqMNge2LxXZrOBo0v9OmLE1S1Lx6nZDqfcfSUgRRsALGbAG6E0i3u9JEOoLeO
 nW8ahzkp0DymxyHCyrb8Lpgu8dDWPvaZBgthAi6iJ6k3RMozor0uQuZVcP18d1Kpdi3rjJr9/D93w
 YCYKZS4ffZBVmP4qGFJjIvCR2lV95riAy6Ynqt3L9SGKqmK97KlJbSORWmZeIQ7ZkC0OnfYRwsphz
 I5+MAvoMGMdH7r3DNTwUd2/voreF9TX9qKfWfK7oGJ64qA47BDI8Gy3Lhadp1enI/h8niGUyqBCSq
 tYsAw7+fQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1is6i5-0002D5-DF; Thu, 16 Jan 2020 16:05:25 +0100
Received: from [2a02:8106:231:700:38db:ba68:aa3a:bbaa]
 (helo=localhost.localdomain)
 by sslproxy06.your-server.de with esmtpsa
 (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1is6i5-000K38-4Y; Thu, 16 Jan 2020 16:05:25 +0100
Message-ID: <edb721906354e26c26883edf5bce09690ca07d6d.camel@cyberus-technology.de>
Subject: Re: [RFC PATCH 4/4] drm/i915/gvt: move public gvt headers out into
 global include
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 16 Jan 2020 16:05:22 +0100
In-Reply-To: <20200116142345.GA476889@kroah.com>
References: <4079ce7c26a2d2a3c7e0828ed1ea6008d6e2c805.camel@cyberus-technology.de>
 <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
 <20200109171357.115936-5-julian.stecklina@cyberus-technology.de>
 <20200115152215.GA3830321@kroah.com>
 <9b32e225ee680e61716e300eb1ed8387599cc0dd.camel@cyberus-technology.de>
 <20200116142345.GA476889@kroah.com>
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.101.4/25697/Thu Jan 16 12:42:45 2020)
X-Mailman-Approved-At: Fri, 17 Jan 2020 08:13:08 +0000
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

Hi Greg,

On Thu, 2020-01-16 at 15:23 +0100, Greg KH wrote:
> On Thu, Jan 16, 2020 at 03:13:01PM +0100, Julian Stecklina wrote:
> > Hi Greg, Christoph,
> > 
> > On Wed, 2020-01-15 at 16:22 +0100, Greg KH wrote:
> > > On Thu, Jan 09, 2020 at 07:13:57PM +0200, Julian Stecklina wrote:
> > > > Now that the GVT interface to hypervisors does not depend on i915/GVT
> > > > internals anymore, we can move the headers to the global include/.
> > > > 
> > > > This makes out-of-tree modules for hypervisor integration possible.
> > > 
> > > What kind of out-of-tree modules do you need/want for this?
> > 
> > The mediated virtualization support in the i915 driver needs a backend to
> > the
> > hypervisor. There is currently one backend for KVM in the tree
> > (drivers/gpu/drm/i915/gvt/kvmgt.c) and at least 3 other hypervisor backends
> > out
> > of tree in various states of development that I know of. We are currently
> > developing one of these.
> 
> Great, then just submit this patch series as part of your patch series
> when submitting yoru hypervisor code.  That's the normal way to export
> new symbols, we can't do so without an in-kernel user.

Fair enough.

As I already said, the KVMGT code is the in-kernel user. But I guess I can
extend the already existing function pointer way of decoupling KVMGT from i915
and be on my way without exporting any symbols.

Somewhat independent of the current discussion, I also think that it's valuable
to have a defined API (I'm not saying stable API) for the hypervisor backends to
define what's okay and not okay for them to do.

Thanks,
Julian

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
