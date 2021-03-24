Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ADF3471EE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 07:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEA46E98E;
	Wed, 24 Mar 2021 06:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E776E98C;
 Wed, 24 Mar 2021 06:57:37 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z1so26395825edb.8;
 Tue, 23 Mar 2021 23:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jUHLlaX1OMcEX+7hwUCV5OUoSacAoX8aUCeag2OeSgo=;
 b=XValwacryJ+5F8crFJE04X+dDf+TEhG+XkKzZb9hA3pejgNU/CdpbM5b0hIEi5JpRc
 Eymaj682oQlzpXrRG8NVN8IBO7hvQ/HLm38BUGQgzkXxYZWTyuZqSxrGqj8AwV8EK/Yf
 T9tOROEs2NuHGnYS3su/woSzNfslQ0v+TNRTarWXAQwfX7YEBHBfTlvc06VB5gPh/AJU
 Bm6sMVva72TVNr5QFK0cLd0F4VLIK4hdVPbFoNWoRFSQzNE2M3SV2x24KUPLEGb9+z7Q
 F0cJQW5rWIN1Ig+mq75+zYqb8rjlTYfFo7FMW69xzXTDio/0BDOMcmyV4iO63s2DTB/c
 xdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jUHLlaX1OMcEX+7hwUCV5OUoSacAoX8aUCeag2OeSgo=;
 b=jT46Y+nJOu054RynkweZNkCNm7VZ2RLCgnp7x+rINWOoB+EMSt3CBGLerC3vv48nEp
 1q8z2LkAp+vwI4Ddjzn+ODCk03vlik/cHyMlSH6ipGx+R1JLu+IOBhKW150dSUq7aFTl
 icQBCGPWr+M/+Ufe+dIp4UfUxszFsYMkHAOd/Ki8iDnLCozEjeG8Y+sVaShAUfT9cPez
 1fpES3Dn/nBVUx3PcWdcZxhQ24eDrkotxrZhcPtayKxoGL29eBwovZ5Nc6ZpH2Fg5QdO
 kYWS212ManSg9b9YR2ZdyFfLE8oHgTcTgqdCDRwIQnwGSJFLxZhBSB9cVgseSh9lbUOL
 6Chg==
X-Gm-Message-State: AOAM531U/DloIi+zlaS7AnBI6mBwovtbuZUvvv/2ID4nN2bK5RvJBo9Q
 nG/HBTnfQBMDjwndRaOe3b41jSTOTUPPiBnalqf2XsuX
X-Google-Smtp-Source: ABdhPJyvW+V3BAMCMz8MYvdbOzYdQOS9CrKYneQ80P8dAGB9eTqpeLSprtLBpDt4Kt9YX2Y1fRNHWstfdZLKZAxQBlY=
X-Received: by 2002:a17:906:ad96:: with SMTP id
 la22mr2060614ejb.237.1616567697813; 
 Tue, 23 Mar 2021 23:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210323084453.366863-1-daniel.vetter@ffwll.ch>
 <YFnqYj3geFFLFJac@phenom.ffwll.local>
In-Reply-To: <YFnqYj3geFFLFJac@phenom.ffwll.local>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 24 Mar 2021 16:34:46 +1000
Message-ID: <CAPM=9tyi3g_8hMPkGK+fSoMPxR-w6EzCh9iJpy4m1gCFb2z5Hg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915: add gem/gt TODO
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Mar 2021 at 23:17, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Mar 23, 2021 at 09:44:52AM +0100, Daniel Vetter wrote:
> > We've discussed a bit how to get the gem/gt team better integrated
> > and collaborate more with the wider community and agreed to the
> > following:
> >
> > - all gem/gt patches are reviewed on dri-devel for now. That's
> >   overkill, but in the past there was definitely too little of that.
> >
> > - i915-gem folks are encouraged to cross review core patches from
> >   other teams
> >
> > - big features (especially uapi changes) need to be discussed in an
> >   rfc patch that documents the interface and big picture design,
> >   before we get lost in the details of the code
> >
> > - Also a rough TODO (can be refined as we go ofc) to get gem/gt back
> >   on track, like we've e.g. done with DAL/DC to get that in shape.

I think we mentioned in the past about having better annotations for
dma_fence critical sections,

Otherwise I think this is a great list to get us out of the woods and
seeing how to move forward again.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
