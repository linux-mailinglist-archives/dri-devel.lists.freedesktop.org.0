Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AB9124E6A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 17:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182AB89B70;
	Wed, 18 Dec 2019 16:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237F689B70
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 16:53:25 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id v201so2172804lfa.11
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 08:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3qRY5XWsuCN6n8xU9fQoJH+pjwO3CHxgP4k/GmBdPYo=;
 b=IQ/5SIJ292ei03NolmBfEocYNplOmoBhNP+TWlRlx+4myoE2yY3tCOpuPqX84ODewr
 ZxIOOBR4eB7XLKzlxlNHA06k/cN6HUup8nG4oOWMpGflrWzw93Hd0PHehXWWyDZ6ZG3V
 w6hWLdp59SrCGRimV2hdbFAi3ES7UIYg62ve8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3qRY5XWsuCN6n8xU9fQoJH+pjwO3CHxgP4k/GmBdPYo=;
 b=cpNNDN2QKOzPGYgmkqQur9R0jw13pYfw6cgCXxNqGDZWY0ZfiBjm7UsVaCDL1GfaAa
 NoKFW7Sqmf4rldrxAoFV5MUHzMQHQU8uKKjzk/kqG3jxUNBkIMLfTLe4b2fQfAyJ/fR6
 09Mb7XY82jAWcKTorfDyQkGt3uD+98rslM/DSLX2oIrHAOWzdQ7+aaD+RXx1p4fBb/pe
 3NgTUespzrR0Zosfu/qO61KAkxrvCLxV/w/mT7QpMxA4SLUFsp/8nRHPstIGp8WR/iLd
 e72hblvTy7e0hn2ESXCbeKRyOoBTKPB2ZmhxJ6nW5pqmwvzyOXsWqu3judUZor8uCEYM
 DBDw==
X-Gm-Message-State: APjAAAVaJJavup085TJCwkAMjQxxuZRKZ3WMDKFvqFuT3ZqCjeGojyf1
 lmwToht0mHqAIp1mUntul5S9xXToOY8=
X-Google-Smtp-Source: APXvYqzzgXJlVT55TOFGW+33wldob5Q6C56zcZhUDAAk0ET7xYOxbKhxK1CvMtp8NFx2vhy9VyTkfg==
X-Received: by 2002:a19:dc1e:: with SMTP id t30mr2443416lfg.34.1576688003713; 
 Wed, 18 Dec 2019 08:53:23 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id y11sm1856762lfc.27.2019.12.18.08.53.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 08:53:22 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id u1so2917107ljk.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 08:53:22 -0800 (PST)
X-Received: by 2002:a2e:9041:: with SMTP id n1mr2508178ljg.133.1576688001995; 
 Wed, 18 Dec 2019 08:53:21 -0800 (PST)
MIME-Version: 1.0
References: <20191125204248.GA2485@ziepe.ca>
 <CAHk-=wiqguF5NakpL4L9XCmmYr4wY0wk__+6+wHVReF2sVVZhA@mail.gmail.com>
 <CAHk-=wiQtTsZfgTwLYgfV8Gr_0JJiboZOzVUTAgJ2xTdf5bMiw@mail.gmail.com>
 <20191203024206.GC5795@mellanox.com> <20191205160324.GB5819@redhat.com>
 <20191211225703.GE3434@mellanox.com>
 <20191213101916.GD624164@phenom.ffwll.local>
 <20191218145913.GO16762@mellanox.com>
In-Reply-To: <20191218145913.GO16762@mellanox.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Dec 2019 08:53:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgR7OSE9Bn2+MbOYDbiu7n1RQaQhdc6gkEywXL9rMFcpw@mail.gmail.com>
Message-ID: <CAHk-=wgR7OSE9Bn2+MbOYDbiu7n1RQaQhdc6gkEywXL9rMFcpw@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull hmm changes
To: Jason Gunthorpe <jgg@mellanox.com>
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, David Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 18, 2019 at 6:59 AM Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> Do you think calling it 'mmn_subscriptions' is clear?

Why do you want that "mmn"?

Guys, the "mmn" part is clear from the _context_. The function name is

When the function name is something like "mmu_interval_read_begin()",
and the filename is "mm/mmu_notifier.c", you do NOT NEED silly
prefixes like "mmn" for local variables.

They add NOTHING.

And they make the code an illegible mess.

Yes, global function names need to be unique, and if they aren't
really core, they want some prefix that explains the context, because
global functions are called from _outside_ the context that explains
them.

But if it's a "struct mmu_interval_notifier" pointer, and it's inside
a file that is all about these pointers, it shouldn't be called
"mmn_xyz".  That's not a name. That's line noise.

So call it a "notifier". Maybe even an "interval_notifier" if you
don't mind the typing. Name it by something _descriptive_. And if you
want.

And "subscriptions" is a lovely name. What does the "mmn" buy you?

Just to clarify: the names I really hated were the local variable
names (and the argument names) that were all entirely within the
context of mm/mmu_notifier.c. Calling something "mmn_mm" is a random
jumble of letters that looks more like you're humming than you're
speaking.

Don't mumble. Speak _clearly_.

The other side of "short names" is that some non-local conventions
exist because they are _so_ global. So if it's just a mm pointer, call
it "mm". We do have some very core concepts in the kernel that
permeate _everything_, and those core things we tend to have very
short names for. So whenever you're working with VM code, you'll see
lots of small names like "mm", "vma", "pte" etc. They aren't exactly
clear, but they are _globally_ something you read and learn when you
work on the Linux VM code.

That's very diofferent from "mmn" - the "mmn" thing isn't some global
shorthand, it is just a local abomination.

So "notifier_mm" makes sense - it's the mm for a notifier. But
"mmn_notifier" does not, because "mmn" only makes sense in a local
context, and in that local context it's not any new information at
all.

See the difference? Two shorthands, but one makes sense and adds
information, while the other is just unnecessary and pointless and
doesn't add anything at all.

                Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
