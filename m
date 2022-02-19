Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9E84BC92F
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 16:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C871F10FDB8;
	Sat, 19 Feb 2022 15:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A81110FDB8;
 Sat, 19 Feb 2022 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=51IuRnSgtWxZG2Jmu2renXJr42JUA6j1ZiqJaCkpimM=; 
 t=1645285432; x=1646495032; b=CCQuzFjfzzGzKzALC8gLp5pp112w4BkUR6KmRHZIROZVE6I
 c1gRY6yuWrz0XKcNwx1DVuuQNNf/vmX0uZuFolheBVyp/luKoUSun8Ud2M+OfKrYfR+1SyJzzpkFE
 y/15PMIK3CCKYdF4guFpo61h4xZcYXDj4dftgomQjUEU//wTTeVpQ1GV+98KHNeDJ1sZA/BzMMu5o
 H3lf2Dc3L7TspquHZOxdFSWwIv3wJVhVUICZL2CDcgMQQjvPqM9JVzmDImQJCvphOKlPIWYAp1bvL
 fd8xmWf8xNkbeTJX3l6wdiPUcp6OUiw1AsPP/n73vJoKnfwVeKawYwNGuKF3KJhg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nLRtJ-0035Fb-Ex; Sat, 19 Feb 2022 16:43:21 +0100
Message-ID: <d14b6a0c72788e78bab2bd1f0bc2c49891ded5d7.camel@sipsolutions.net>
Subject: Re: [PATCH 4/4] kunit: tool: Disable broken options for --alltests
From: Johannes Berg <johannes@sipsolutions.net>
To: David Gow <davidgow@google.com>
Date: Sat, 19 Feb 2022 16:43:19 +0100
In-Reply-To: <CABVgOSnBq0QE+Cq+SDeV-LxOQYbGZ6Bqbjix6h-UpNj0GMicPA@mail.gmail.com>
References: <20220218075727.2737623-1-davidgow@google.com>
 <20220218075727.2737623-5-davidgow@google.com>
 <ac4c5f8c890e5bdd7ad7ecc04a51e72fa3ac1703.camel@sipsolutions.net>
 <CABVgOSnBq0QE+Cq+SDeV-LxOQYbGZ6Bqbjix6h-UpNj0GMicPA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-malware-bazaar: not-scanned
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
Cc: x86@kernel.org, linux-rdma@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Jeff Dike <jdike@addtoit.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, linux-um <linux-um@lists.infradead.org>,
 dri-devel@lists.freedesktop.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 KUnit Development <kunit-dev@googlegroups.com>, felix.kuehling@amd.com,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2022-02-19 at 16:00 +0800, David Gow wrote:
> On Fri, Feb 18, 2022 at 8:26 PM Johannes Berg <johannes@sipsolutions.net> wrote:
> > 
> > On Fri, 2022-02-18 at 15:57 +0800, David Gow wrote:
> > > 
> > > Note that, while this does build again, it still segfaults on startup,
> > > so more work remains to be done.
> > 
> > That's probably just a lot more stuff getting included somehow?
> > 
> 
> Yeah: it used to work (a couple of years ago), but something has
> broken it in the meantime. It's just a shame that bisecting things
> with allyesconfig takes so long...

Heh, right.

But I guess you could "Kconfig bisect" first, i.e. see what option
breaks it? It might not even help to bisect, if it's just some option
getting enabled over time. Or perhaps the kernel is just too big for the
address space layout if you have allyesconfig? Though that shouldn't be
an issue, I think.

> I didn't realise X86 wasn't defined in UML: 

X86 is the architecture, X86_{32,64} is kind of a selection for how you
want things to be built, and it's thus required for UML on x86, because
UML imports stuff from X86.

> that's definitely a bit
> cleaner than !UML in a number of these cases.

It looks like some (most?) of them don't really work that way though
since they're not really platform specific, they just know only about a
handful of platforms that they're compatible with.

> Not all of those issues are fundamentally solved by "depends on X86",
> though: there are a few which might be other missing things in UML
> (maybe the 'dma_ops' issues?), and/or might be the result of -Werror
> being enabled.

Right.

> We do want the ability to build PCI drivers under UML, as it makes
> running KUnit tests for PCI drivers much simpler and more pleasant.

OK, fair point. I'm thinking about this area in general also right now
for iwlwifi, and obviously we're probably the only user of the virtual
PCI code that lets us connect the driver to a simulated device on UML
(but the driver doesn't really know) :-)

> And indeed, it does work for KUnit in general, it's just that some
> drivers do have the issues mentioned above, so allyesconfig picks up
> every broken driver.

Right.

> We don't actually build the PCI drivers by default, only if the
> "--alltests" option is passed, which does include them, as we do have
> tests which depend on PCI we'd like to run (like the thunderbolt
> test).

Makes sense.
> 
> I did try this as well, and it just got us a different set of issues
> (there are a bunch of drivers which depend on IOMEM but don't state it
> -- I'll try to send fixes for those out next week). 
> 

Fun.

> Ultimately, the 'broken_on_uml.config' file is just there to pare back
> allyesconfig a bit for KUnit's purposes, but we still definitely want
> as many options (and hence tests) enabled as possible long-term. So I
> think actual fixes to either the code or Kconfig do make sense.

Makes sense.

> Is 'make ARCH=um allyesconfig' something we actually want to be able
> to build? If so, no amount of adding things to KUnit's
> broken_on_uml.config will solve the underlying issues, and we'll need
> to at least update the Kconfig entries.
> 

That's a good point, as long as people are doing allyes/randconfig
builds on UML, we probably need to have these fixes anyway rather than
disabling something for KUnit specifically.

johannes
