Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC78C427466
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 01:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946BD6E896;
	Fri,  8 Oct 2021 23:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1EF6E893;
 Fri,  8 Oct 2021 23:51:38 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id x27so45322869lfa.9;
 Fri, 08 Oct 2021 16:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uwgZMiF+2EZrddFYvj4zPW2uaBGbkJ1NsJjndwLFgmo=;
 b=QOKPxUmXBAKw6igDPT/zjPt5QMIFZE2KNEKOO/sVKw0K97S2Je2cABFymmu5qKAx4t
 iYMiWHnbtwY3LwV6wkpDvRGZ1RwVqJIxTlvl1E35YVrTFKAmmrmOCmaRrCZYSkr1ktvS
 H3haz772ryqXlSwRc957ycXHXmHvefPE5v9i6sCXDlVtMMKejk7Ocrk9JwR9lEdQzDX2
 l0uzse9bTo9as0ZZ1N6eK/bxWW4xmwKTFsQG8vfWkccim6atXoPNvYYvhUVMDwA7Tfqi
 qPGoo1bIiKqbPcTo1LnnaPiNRXBXSWTqtYpev401iUR0auPdzGx1rag306LnXFCwoenu
 zo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uwgZMiF+2EZrddFYvj4zPW2uaBGbkJ1NsJjndwLFgmo=;
 b=y7osFFX8CBWtBrJx1YX53izlFkZPuhhxNEa5ucdHL0VzQ6zXLwYx9SSRQDpFwsiBOF
 C8QkYwDchOcMJLOibAsZcHKDiYeVBB6lpYnIad585lYKl05lM8BqOt+DT7owYVv12Pb/
 6rOmSH7CFWq1p3qUHbfGGeHe3Vmw98/qnCHCfugT+KL2NtnU2lRuR0dXfNg0jFvs/zvP
 EheBa1UD416EVTh8mk3rMTz4y0E1LHw34qfBOvC8O2WC8CVBvFNnpvpyYoI/9VKjqE5i
 Oi5ScPy/6D4UTk65XsSkLW4kzf3/iAPHwdk18fRk0Veo8SBEGgOlVIhXmiSDyt3iQ3PR
 Z93A==
X-Gm-Message-State: AOAM531PI2qwPWFKbUnfqsq6AxL6vfBWNFw0nG2BOFkQ0G8RQ6R2rrWL
 jTtHa2z1Lit/YygGuSfY7SO/hG42ISEM3HPhIoM=
X-Google-Smtp-Source: ABdhPJz7Ow+K8EIslKeXp+4vVFFt/sRu9Sx24RquRofTAvElLfDQdvi+dltK3N0wFBb4tXcgGAUE9bWtvMGRBVZNDYw=
X-Received: by 2002:a05:6512:3d11:: with SMTP id
 d17mr11324880lfv.542.1633737096563; 
 Fri, 08 Oct 2021 16:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211007230903.4084-1-andi@etezian.org>
 <CAKi4VAJ-HUR1=-VKeB0i21Q81i3aC00n2c-gp2zmw3ybeULUbw@mail.gmail.com>
 <YWAaGdKXpSAaBfab@intel.intel>
In-Reply-To: <YWAaGdKXpSAaBfab@intel.intel>
From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Fri, 8 Oct 2021 16:51:24 -0700
Message-ID: <CAKi4VAJHYyoOmO52yGN0TxgAZv7BPB7A+0FxoJc4caUVySsqVQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915/gt: move remaining debugfs interfaces into gt
To: Andi Shyti <andi.shyti@intel.com>
Cc: Andi Shyti <andi@etezian.org>, Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 8, 2021 at 3:14 AM Andi Shyti <andi.shyti@intel.com> wrote:
>
> Hi Lucas,
>
> > > I am reproposing this patch exactly as it was proposed initially
> > > where the original interfaces are kept where they have been
> > > originally placed. It might generate some duplicated code but,
> > > well, it's debugfs and I don't see any issue. In the future we
> > > can transform the upper interfaces to act upon all the GTs and
> > > provide information from all the GTs. This is, for example, how
> > > the sysfs interfaces will act.
> >
> > NACK. We've made this mistake in the past for other debugfs files.
> > We don't want to do it again just to maintain 2 separate places for
> > one year and then finally realize we want to merge them.
>
> In my opinion it's all about what mistake you like the most
> because until we will have multi-gt support in upstream all the
> patches come with the "promise" of a follow-up and maintenance
> cost.

no. If you put the implementation in a single place, later you only have the
decision on what to do with the per-device entrypoint:

- should we remove it once igt is converted?
- should we make it iterate all gts?
- should we make it mean root tile?

Then you take the action that is needed and decide it per interface.
Here you are leaving behind a lot of code that we will need to maintain
until there is support for such a thing.

It already happened once: we needed to maintain that duplicated code
for over a year with multiple patches changing them (or failing to do so).

>
> > > The reason I removed them in V1 is because igt as only user is
> > > not a strong reason to keep duplicated code, but as Chris
> > > suggested offline:
> > >
> > > "It's debugfs, igt is the primary consumer. CI has to be bridged over
> > > changes to the interfaces it is using in any case, as you want
> > > comparable results before/after the patches land.
> >
> > That doesn't mean you have to copy and paste it. It may mean you
> > do the implementation in one of them and the other calls that implementation.
> > See how I did the deduplication in commit d0c560316d6f ("drm/i915:
> > deduplicate frequency dump on debugfs")
>
> In this case, from a user perspective, which gt is the interface
> affecting? is it affecting all the system? or gt 0, 1...? Does
> the user know? The maintenance cost is that later you will need
> to use for_each_gt and make all those interfaces multitile, and
> this would be your "promise".

multi-gt is irrelevant here.  This patch without any "promise" should do
what the commit message says: *move*. The only reason to keep
the old entrypoint around is because it's missing the igt conversion. If
you are going to support a per-device entrypoint and do for_each_gt(),
or do a symlink to the root tile, or whatever, it isn't very relevant
to this patch.
Right now we have just a single directory, gt.

Lucas De Marchi
