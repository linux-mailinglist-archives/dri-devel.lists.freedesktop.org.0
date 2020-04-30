Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1BE1BFDD5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 16:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589406E90E;
	Thu, 30 Apr 2020 14:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877596E90E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 14:20:57 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id x10so5363014oie.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 07:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vU7NNDB88N8b7luDUTJQIrpl7937xKbm7PdW+jOV5J4=;
 b=pyVQXCzRdeYFN35dxvsghsrXzIdcIbEYwc3EaNswiigQ56cZTaQdOFWpaTh0LfCcdm
 2KjNZxbDLoiOShbqWhjVC9o5qbxrY7BWh0w5c+wVG3zivALqYuf86KUZjg5MdLb8W9j5
 pICF3wLWqrM0bo3kIYJMJJyW8jKzWQXR9OH5A5rzn2vBpKJwwOImwWTVnzVH08xSth+I
 9+4KH1ak29J3udYms0FoW4bD0Oh3Y2xYPy++zsxjMAbWXZc59UIOz4nbUiYnTT3lvxzn
 mR2DQiqizyIRFsjO3i3lIyN/yI1wkbOWVcjCADgROSvUQboVCrBkRfFoDvvfSHp3Hy19
 ZvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vU7NNDB88N8b7luDUTJQIrpl7937xKbm7PdW+jOV5J4=;
 b=EVvyDdhtzo/NqU26qDMZr4/d8pNL0jnR4RmuuYQH6FSsa78J3yNsnhjl3O3W8nmQ0+
 FbS5QPmmlddwYvpk5SqOUofMoCmOJ54+sNZTMg+J9no+fD6JWc8ohkvsAkBOB8Vap9no
 qmzaVg/Dp+qU/HDnjP6T/tBFHnAkuYSnJBwbW/SbBSPygt17MMi5ZAgIGrSeHJ9dpbHa
 7dnkr3df2KY6MYGUDJ/LaqTh+r9kO+ev1UBvSf7QPwMpfOXydDYNXrkeegdVRdupKPcH
 GBODU2ssv4ESHxllM5gqCOV0NIDU1tXrMIM1K+6uFvwp8LL3KYFXQfmagSBR/cj6EO3B
 lUSQ==
X-Gm-Message-State: AGi0PuZvqQSYdZovfOBOnwrZDBKa83t946omCFx7d9mtJg8jYOzq2/7Q
 42eWOHCp9yFZEmyqfmk8VXFe8FbXvTdnIaw+vz4/wQ==
X-Google-Smtp-Source: APiQypKi11+B07gGR75YnzeMGeraH6AVLTAvNHkxcGX7oFLvFp4wW4F3hi8wb9UT3WC71m1+ov8vwd6qa2wRA4NbCjo=
X-Received: by 2002:aca:d485:: with SMTP id l127mr1766826oig.119.1588256456666; 
 Thu, 30 Apr 2020 07:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200430015930.32224-1-vitor@massaru.org>
 <cb4d93a0-b967-f37d-ea01-0368c91b896e@infradead.org>
 <0463c90cfbe2036235010c5f8b92af6a96c20f74.camel@massaru.org>
 <20200430043723.GA27272@ravnborg.org>
In-Reply-To: <20200430043723.GA27272@ravnborg.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 30 Apr 2020 19:50:45 +0530
Message-ID: <CAO_48GGgeJ9cFeAfKB7GjLTwOzXxk_goKsi42ocRswwXkWh11g@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Documentation: fix: `make htmldocs` warnings
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, brendanhiggins@google.com,
 LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Linaro MM SIG <linaro-mm-sig@lists.linaro.org>, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Vitor Massaru Iha <vitor@massaru.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Everyone,

On Thu, 30 Apr 2020 at 10:07, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Wed, Apr 29, 2020 at 11:27:22PM -0300, Vitor Massaru Iha wrote:
> > On Wed, 2020-04-29 at 19:06 -0700, Randy Dunlap wrote:
> > > On 4/29/20 6:59 PM, Vitor Massaru Iha wrote:
> > > > Add missed ":" on kernel-doc function parameter.
> > > >
> > > > This patch fixes this warnings from `make htmldocs`:
> > > > ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or
> > > > member 'importer_ops' not described in 'dma_buf_dynamic_attach'
> > > > ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or
> > > > member 'importer_priv' not described in 'dma_buf_dynamic_attach'
> > > >
> > > > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > > > ---
> > > >  drivers/dma-buf/dma-buf.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > > index ccc9eda1bc28..0756d2155745 100644
> > > > --- a/drivers/dma-buf/dma-buf.c
> > > > +++ b/drivers/dma-buf/dma-buf.c
> > > > @@ -655,8 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
> > > >   * calls attach() of dma_buf_ops to allow device-specific attach
> > > > functionality
> > > >   * @dmabuf:              [in]    buffer to attach device to.
> > > >   * @dev:         [in]    device to be attached.
> > > > - * @importer_ops [in]    importer operations for the
> > > > attachment
> > > > - * @importer_priv        [in]    importer private pointer for the
> > > > attachment
> > > > + * @importer_ops:        [in]    importer operations for the
> > > > attachment
> > > > + * @importer_priv:       [in]    importer private pointer for the
> > > > attachment
> > > >   *
> > > >   * Returns struct dma_buf_attachment pointer for this attachment.
> > > > Attachments
> > > >   * must be cleaned up by calling dma_buf_detach().
> > > >
> > >
> > > Sumit said that he would be applying my patch from April 7:
> > > https://lore.kernel.org/linux-media/7bcbe6fe-0b4b-87da-d003-b68a26eb4cf0@infradead.org/
> > >
> > > thanks.
> >
> > Sorry. I didn't check if the patch has already been sent.
>
> Sumit - patch from Randy is neither applied to drm-misc-next nor
> drm-misc-fixes.
> A reminder in case it was lost somewhere.

My bad: I have now applied it to drm-misc-fixes, so should be seen in
-next soon.

>
>         Sam

Best,
Sumit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
