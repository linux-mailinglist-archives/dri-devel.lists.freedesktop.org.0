Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 056E9247FE6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1574289CB2;
	Tue, 18 Aug 2020 07:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995DF89C6B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 01:52:31 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id k18so14036952qtm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 18:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=szzpFDA9AlK4enccjSiFaUNDWItaYlytHuvona3L4xE=;
 b=XrifYsF5rKfoCWUjJR56iJTuvGs1mu+hofxMCRYvN1bgU+9hCume8MfdskDYx/GXUi
 qvEoW0g2PrbsvnXO5CaiZC1mOPUQAVJ9FMbksSCTsWnT24/upbZp/dhWv4hX4hHLZZ+i
 FLEIIS2aoHuICneFAVnJh2bcK/OldVdEs4CP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=szzpFDA9AlK4enccjSiFaUNDWItaYlytHuvona3L4xE=;
 b=mUEQ4GPCm3hbQLh1oOchoLJSRJWV9opiHOYouS7UHIDxeOFd6HJnYKKJXukU+q9zp0
 M/Z0bYMx6UE0Dh52juPWqs0Z4cjCH30gPTP2YKWGYGQcAYi8h5fyVBejf+Vw6iVLAC8G
 5XBX4w+Hk0glcTxOz1FDzBLkv1PM2kTunklPDzGxlOlHKw9m0FWfle/C+eTx0aWUsIny
 zkta/T07xhMB9KK8Xn8w2PU+gOS6kQvOVbnby7kLPNdouqwTV1EB2MRFRv/BjpYu8FUy
 7D+bW0rB+3sykjBiVD4ViKh6ro89KG/p3uIp/SuBQG8mSXDB0UcJxgFEnnL8p4FZwGwQ
 FurA==
X-Gm-Message-State: AOAM5330vOWzIa9t9rYY678Y8wuZWGAORI97zd3lRNKnkozVxWZalTrI
 1UIwMraDdz/0NcnxNyoZK+/Kl4AQEu0t1IFiZv8Xmw==
X-Google-Smtp-Source: ABdhPJxTMwbSOeJZ+JjlM+dBnOrWPf2Un6ZL7ISpGYM5sJBiPu9rwbZVoK+XvNs2l/kehDF6aM8NBGUpgV8YpoFB/PU=
X-Received: by 2002:ac8:45c7:: with SMTP id e7mr16254448qto.187.1597715550749; 
 Mon, 17 Aug 2020 18:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200609012518.198908-1-stevensd@chromium.org>
 <20200609055021-mutt-send-email-mst@kernel.org>
 <CAD=HUj7wJfoKj_K44Cs9eEmh=OQHZ1+qz7ZHxoscHjYgOMXvZQ@mail.gmail.com>
 <20200817105008.mi3ukh6kxgi37gjs@sirius.home.kraxel.org>
 <20200817111234.i7pqtnnk2ciw4rqb@sirius.home.kraxel.org>
In-Reply-To: <20200817111234.i7pqtnnk2ciw4rqb@sirius.home.kraxel.org>
From: David Stevens <stevensd@chromium.org>
Date: Mon, 17 Aug 2020 18:52:19 -0700
Message-ID: <CAD=HUj65N3ejzYgUcpHLvPHguXFDC-B4OFeNOfvSML1zdoNRPg@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH v5 0/3] Support virtio cross-device
 resources
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Approved-At: Tue, 18 Aug 2020 07:50:42 +0000
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
Cc: virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 alex.williamson@redhat.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 17, 2020 at 4:12 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Mon, Aug 17, 2020 at 12:50:08PM +0200, Gerd Hoffmann wrote:
> > On Tue, Jun 23, 2020 at 10:31:28AM +0900, David Stevens wrote:
> > > Unless there are any remaining objections to these patches, what are
> > > the next steps towards getting these merged? Sorry, I'm not familiar
> > > with the workflow for contributing patches to Linux.
> >
> > Sorry, just have been busy and not paying as much attention to drm
> > patches as usual.  Playing catch-up now.  Queued for drm-misc-next,
> > unless something goes wrong in my testing the patches should land
> > in linux-next soon and be merged upstream in the next merge window.
>
> Oh, spoke too soon.  scripts/checkpatch.pl has a bunch of codestyle
> warnings.  Can you fix them and resend?

Sent a new version to fix the line length warning. There's still a
MAINTAINER warning, but I think the new virtio_dma_buf file can fall
under virtio core (and the existing wildcards do match it), rather
than get its own MAINTAINER entry. I can break it out into its own
thing if that's better, though.

-David
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
