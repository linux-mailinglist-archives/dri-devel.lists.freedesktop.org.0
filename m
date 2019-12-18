Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC9F1251EC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 20:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7ED56EA5D;
	Wed, 18 Dec 2019 19:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9BD6EA5D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 19:33:45 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id u71so3432698lje.11
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 11:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nkv/j0DmOufir99TeJBSwrc+MG8sCcIZ06VqqtU6qj4=;
 b=HB5BhhATDpbdm4h+jVarT9wg6GBJI7KN8S7Moxw6piTnQ1m9cOBJIQS/PaCI6gTwMC
 KcFBk1wxizpJ2F1l9fk+BZCervlQw4eLP6hIx3WTFqvuEuuqo1YSkFlmKAawJkGux2PE
 vW9q2+l9GY9Z481m0TD7EghEJOC9eulnbmi7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nkv/j0DmOufir99TeJBSwrc+MG8sCcIZ06VqqtU6qj4=;
 b=nlOwue8FGbtFgOIKOS3GASK3kIZ1+79AY0i666tdJv/4BVTTTkPvOZVxeOuKXIYo68
 NZ+xHYMGJeUq15wzqHAkilmuVXyQHyaWxcSznQZPfAOu98dZO0U0oUmsUbGag4lar9jV
 ssB23BFrebXiFmFe0STsyFW3GoFUdgB5ckiZ8v4cdGGDgLEsmBaKQoEiSFLkbKzC8guP
 dUGauQfzMaDG4u9E28ossI9R4I02leqOkq5hrtRAd7cx3r2qfpe6+D7Cmszn9QkTkRo4
 KMuQHBDwDgPEMMlqgD/6NyCEH2Lxx0Y+zlOYvlrL6e4rF2FWbpdbtplqX1IgRuCgR3fd
 NkFw==
X-Gm-Message-State: APjAAAUiLjwPGmLMtwaxZ0diAxRNj32YXGjipC4hSmRTSfE54lrpMUVz
 yOHAJwOvas6Mfue0RVIidTsgYwagmN8=
X-Google-Smtp-Source: APXvYqzqbqoQq3ntpfp0LOS3vcBidcrrwTV2vTM3MbBb6bStMr+/aHd7S5O4p7cvu33mgE3EcXQUwQ==
X-Received: by 2002:a2e:a37c:: with SMTP id i28mr3141576ljn.118.1576697623098; 
 Wed, 18 Dec 2019 11:33:43 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id s26sm2110045lji.9.2019.12.18.11.33.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 11:33:41 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id f15so2508728lfl.13
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 11:33:41 -0800 (PST)
X-Received: by 2002:ac2:555c:: with SMTP id l28mr2827166lfk.52.1576697621256; 
 Wed, 18 Dec 2019 11:33:41 -0800 (PST)
MIME-Version: 1.0
References: <20191125204248.GA2485@ziepe.ca>
 <CAHk-=wiqguF5NakpL4L9XCmmYr4wY0wk__+6+wHVReF2sVVZhA@mail.gmail.com>
 <CAHk-=wiQtTsZfgTwLYgfV8Gr_0JJiboZOzVUTAgJ2xTdf5bMiw@mail.gmail.com>
 <20191203024206.GC5795@mellanox.com> <20191205160324.GB5819@redhat.com>
 <20191211225703.GE3434@mellanox.com>
 <20191213101916.GD624164@phenom.ffwll.local>
 <20191218145913.GO16762@mellanox.com>
 <CAHk-=wgR7OSE9Bn2+MbOYDbiu7n1RQaQhdc6gkEywXL9rMFcpw@mail.gmail.com>
 <20191218183704.GT16762@mellanox.com>
In-Reply-To: <20191218183704.GT16762@mellanox.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Dec 2019 11:33:25 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh=9MNwP6gAqhMZ+T7GBVCt-VZyw8qb-i_eXQ61izBKrA@mail.gmail.com>
Message-ID: <CAHk-=wh=9MNwP6gAqhMZ+T7GBVCt-VZyw8qb-i_eXQ61izBKrA@mail.gmail.com>
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

On Wed, Dec 18, 2019 at 10:37 AM Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> I think this is what you are looking for?

I think that with these names, I would have had an easier time reading
the original patch that made me go "Eww", yes.

Of course, now that it's just a rename patch, it's not like the patch
is all that legible, but yeah, I think the naming is saner.

              Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
