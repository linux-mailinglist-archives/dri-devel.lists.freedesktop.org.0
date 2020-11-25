Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9142C475F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 19:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC6C6E8EB;
	Wed, 25 Nov 2020 18:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A542D6E8ED
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 18:16:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s8so2832430wrw.10
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 10:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j5gTn7rnt46vXkbVABsd/nLFo1oDvs2e/sre8ZiKqDQ=;
 b=2RcIEuqtZY++KbyHHJ/8Al35LHvGEMfjFhX1wg6Sx1lnUQGdB99z0SrLom14WDlOHC
 JzFjfP0tNkkwXcu6XzC6NAhOhzQoKp7yho7CnvBk07fTG44rTUd8izJ5QltWtboAdbOs
 aCwthm9Lwh07mqfBhvxEgEy62qR7qdqH+QrYogMcZX0700fvS9sUweRgeTkiom3OxL5l
 QQq2a/7Luu4pPuoc8nmOoPM+g7UUK1JTIHbOZYOZsTOa1alHfkhxBDNUi3/IBmDcpRRF
 G0Vssw/bwybi4EgR5nUVohtKi/g9Eh+ZHJX4b7hFPGkxVT5uexQ6SNfhT0tVKhkKie1I
 gk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j5gTn7rnt46vXkbVABsd/nLFo1oDvs2e/sre8ZiKqDQ=;
 b=ttX0Lq3ojY3FJ+sfhL3Y6G/AhLLJjSXW91RFXo34VEGejzqv9mZ6GQDXOl7Rdi7A1C
 Q84xVNQFFgnyYJW+kndru6i9MBpFxPW24nkd9NKm/JUE7oflVTZRxXq/aUhLDez3IxBO
 e1Wej5xN63d3uDfQBifM2upwWwWyRKj7t6c6QkmFfdmhRZr1tXnTCYFIVKWIUcyQfp0w
 2DAJh3H0yA8CRUsFT4Sr1JRf+m1Euch//68lUBJt6aIh7i69O+esxgSLrDDs/HnJE6RY
 MHTj6HyB76TsM6kmAeTtAp5OMHeJCd+5kvChDfMDhHiTs5EODb8FeAklOsrV07nx+LjA
 lW1w==
X-Gm-Message-State: AOAM531feQtg2AEnOYSGpHU1wqMK6TswGTUWzeBhQ03SYaulH/iSlnF1
 j25zTHvbBtfdvlGrKuc1v41cT0QCtIP29IZgvvw1Wg==
X-Google-Smtp-Source: ABdhPJwQ8WelxJodfMPdFHmQdz1O8TGE9MrvKPhhxxXuE5dHnylhfXIpx/XMn0moXpHiTw1HBA2/nw6OzXt+/ScISSw=
X-Received: by 2002:adf:e509:: with SMTP id j9mr5578411wrm.354.1606328213209; 
 Wed, 25 Nov 2020 10:16:53 -0800 (PST)
MIME-Version: 1.0
References: <20201125162532.1299794-1-daniel.vetter@ffwll.ch>
 <20201125162532.1299794-5-daniel.vetter@ffwll.ch>
 <CAKMK7uGXfqaPUtnX=VgA3tFn3S+Gt9GV+kPguakZ6FF_n8LKuA@mail.gmail.com>
 <20201125180606.GQ5487@ziepe.ca>
In-Reply-To: <20201125180606.GQ5487@ziepe.ca>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 25 Nov 2020 18:16:42 +0000
Message-ID: <CAPj87rP-=yXjdPc48WrwiZj8pYVfZsMhzsAqt-1MrrV2LoOPMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: don't set page->mapping
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-xfs@vger.kernel.org,
 Linux MM <linux-mm@kvack.org>, Huang Rui <ray.huang@amd.com>,
 Brian Paul <brianp@vmware.com>, linux-fsdevel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 25 Nov 2020 at 18:06, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Wed, Nov 25, 2020 at 05:28:32PM +0100, Daniel Vetter wrote:
> > Apologies again, this shouldn't have been included. But at least I
> > have an idea now why this patch somehow was included in the git
> > send-email. Lovely interface :-/
>
> I wrote a bit of a script around this because git send-email just too
> hard to use
>
> The key workflow change I made was to have it prepare all the emails
> to send and open them in an editor for review - exactly as they would
> be sent to the lists.
>
> It uses a empty 'cover-letter' commit and automatically transforms it
> into exactly the right stuff. Keeps track of everything you send in
> git, and there is a little tool to auto-run git range-diff to help
> build change logs..

This sounds a fair bit like patman, which does something similar and
also lets you annotate commit messages with changelogs.

But of course, suggesting different methods of carving patches into
stone tablets to someone who's written their own, is even more of a
windmill tilt than rDMA. ;)

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
