Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D2F140504
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 09:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3726F41D;
	Fri, 17 Jan 2020 08:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6066ED32;
 Thu, 16 Jan 2020 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U59tM/hjwBCgD+03ck/n2U6z9Uy02xUfGBDeEOA+9LE=; b=WyfDzBV5WGLSUyUA00FBOniqR
 a9Gq85FImZoxDN+FVmHJM5WPuqtJNqSsD7kYaZBj+s4Xmy2Moas2+2QSyFhUZRMngFEhPt126BPHs
 VnubuCv0JkpbhMzQgHPjWcyx+EBkqC55WkOp/Qv6pUL7FEAZZj4562jJAxepMlTyXqC2tcussZZet
 BhBpEM4nKD5cZcSXKd7aCjUGXwUQHfmhJK6MX7wyDTb0BS09cdgDXghuEgkfnX3DEkGXMvuotYy+L
 WYPxWE6bc2Y9rg3nrk0tJ/JFR3VnBOLRGdMI3Syz1AeuJdHqHo117g4GSOBcZfk+fwb9HrLGwqvSx
 K4ZCQ+DNA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1is5tQ-0002lH-BY; Thu, 16 Jan 2020 15:13:04 +0100
Received: from [2a02:8106:231:700:38db:ba68:aa3a:bbaa]
 (helo=localhost.localdomain)
 by sslproxy06.your-server.de with esmtpsa
 (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1is5tQ-0008eN-2d; Thu, 16 Jan 2020 15:13:04 +0100
Message-ID: <9b32e225ee680e61716e300eb1ed8387599cc0dd.camel@cyberus-technology.de>
Subject: Re: [RFC PATCH 4/4] drm/i915/gvt: move public gvt headers out into
 global include
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 16 Jan 2020 15:13:01 +0100
In-Reply-To: <20200115152215.GA3830321@kroah.com>
References: <4079ce7c26a2d2a3c7e0828ed1ea6008d6e2c805.camel@cyberus-technology.de>
 <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
 <20200109171357.115936-5-julian.stecklina@cyberus-technology.de>
 <20200115152215.GA3830321@kroah.com>
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

Hi Greg, Christoph,

On Wed, 2020-01-15 at 16:22 +0100, Greg KH wrote:
> On Thu, Jan 09, 2020 at 07:13:57PM +0200, Julian Stecklina wrote:
> > Now that the GVT interface to hypervisors does not depend on i915/GVT
> > internals anymore, we can move the headers to the global include/.
> > 
> > This makes out-of-tree modules for hypervisor integration possible.
> 
> What kind of out-of-tree modules do you need/want for this?

The mediated virtualization support in the i915 driver needs a backend to the
hypervisor. There is currently one backend for KVM in the tree
(drivers/gpu/drm/i915/gvt/kvmgt.c) and at least 3 other hypervisor backends out
of tree in various states of development that I know of. We are currently
developing one of these.

> 
> Also, as Christoph said, adding exports for functions that are not used
> by anything within the kernel tree itself is not ok, that's not how we
> work.

The exports are used by the KVM hypervisor backend. The patchset I sent
basically decouples KVMGT from i915 driver internals. So personally I would
count this as a benefit in itself.

There is already an indirection in place that looks like it is intended to
decouple the hypervisor backends from the i915 driver core: intel_gvt_ops. This
is a struct of function pointers that the hypervisor backend uses to talk to the
GPU mediator code.

Unfortunately, this struct doesn't cover all usecases and the KVM hypervisor
backend directly touches the i915 devices' internal state in very few places. My
current solution was to wrap these accesses in accessor functions and
EXPORT_SYMBOL_GPL them.

If the more acceptable solution is to add more function pointers to
intel_gvt_ops instead of exporting symbols, I'm happy to go along this route.

> And why do they somehow have to be out of the tree?  We want them in the
> tree, and so should you, as it will save you time and money if they are.

I also want these hypervisor backends in the tree, but from a development
workflow having the ability to build them as a out-of-tree modules is very
convenient. I guess this is also true for the developers working on the other
hypervisor backends.

When I looked at the status quo in i915/gvt a couple of weeks ago, it seemed
like it would be a win for everyone. Let me just clearly say that we have no
intention of doing binary blob drivers. :)

Thanks,
Julian

[1] 
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/gvt/gvt.h#L555

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
