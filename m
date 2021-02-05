Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781E1311381
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 22:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F87E88E34;
	Fri,  5 Feb 2021 21:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C606D88E34;
 Fri,  5 Feb 2021 21:29:04 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23803014-1500050 for multiple; Fri, 05 Feb 2021 21:28:53 +0000
MIME-Version: 1.0
In-Reply-To: <202102051319.E5D8B4528D@keescook>
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
 <20210205210610.29837-1-chris@chris-wilson.co.uk>
 <161255976138.12021.9385501710085642237@build.alporthouse.com>
 <202102051319.E5D8B4528D@keescook>
Subject: Re: [PATCH v2] kernel: Expose SYS_kcmp by default
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Kees Cook <keescook@chromium.org>
Date: Fri, 05 Feb 2021 21:28:52 +0000
Message-ID: <161256053234.12021.17815864250035077266@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Will Drewry <wad@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andy Lutomirski <luto@amacapital.net>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kees Cook (2021-02-05 21:20:33)
> On Fri, Feb 05, 2021 at 09:16:01PM +0000, Chris Wilson wrote:
> > The subject should of course be changed, as it is no longer being
> > enabled by default.
> 
> "default n" is redundant.

I thought being explicit would be preferred. There are a few other
default n, so at least it's not the odd-one-out!

> I thought Daniel said CONFIG_DRM needed to
> "select" it too, though?

Yes. We will need to select it for any DRM driver so that the Vulkan/GL
stacks can rely on having SYS_kcmp. That deserves to be handled and
explain within drm/Kconfig, and as they are already shipping with calls
to SYS_kcmp we may have to ask for a stable backport.

> Otherwise, yeah, this looks good. Was the
> export due to the 0-day bot failure reports?

Yes.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
