Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0E5258F1C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 15:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1316A6E0EF;
	Tue,  1 Sep 2020 13:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44C76E0EF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 13:32:03 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c19so983335wmd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 06:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=bx9oQ2NagEe6NO8GIGkDSi51bJAcX461SHWuEDdlU9s=;
 b=aODv4vSb/PtYX2etcdsUG9b4DkQ7ggsrTqv4odqPbmVeKSOtc8x4orvCVl5pTPdofn
 GzpU8kzSxnyrFLBsV4wDhaUkZVId84QvpqgasHh9RvVJ0U1Mk7G/7qsTfZCy2OJUeYaY
 v84qOYWsNzUtbkktxEDEnj+npfSVvCVZvemEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=bx9oQ2NagEe6NO8GIGkDSi51bJAcX461SHWuEDdlU9s=;
 b=Nxux36Q66V4YB/zM7CGrLNnc+H/PaE36qZiF/M7TVmkdsYWNyaxNDdaldof9erLxF2
 RCePR5b8IHAreod6CW/JdAcZSp9T2BEJnVhFHUuMJQt0ZMS4UGrZiPku9bFNEQjhDn7k
 tf7ghtRX7XFaPTY/WLNkTNmSu4ET6mv0ElnLiV6JnWYuYTVPnAK+PJVp1gMsKzVVgZsZ
 rrXLlLMh1ge2E3uZ6+fSXvkhXtWO80d5mWnbRUk+MkyWxLNmxyIxXVgLYIzyH1BUEl42
 zsKQC6hyEipWh9Ph0SUSpSsrYOnqyiyvN2Dgu6JgpxWCTXTUQSCZ7AJ4d71Q+KW5MfC7
 Cd8w==
X-Gm-Message-State: AOAM533/9Zt8dJq8dahn4r+PGgS+1BKmo/H+ssD9MiUx5oKwjiZzBRyQ
 LAf0G57BPRry+KbzqPd1sfjkMA==
X-Google-Smtp-Source: ABdhPJxMIpyA4+ivRVmjL76n4SwUIJPpyNp2oXzgh60A0zsTrXOGV9cAYNKuDeIxPZ/25Yor8JDoOQ==
X-Received: by 2002:a1c:2b43:: with SMTP id r64mr1778101wmr.105.1598967122596; 
 Tue, 01 Sep 2020 06:32:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s124sm2056569wme.29.2020.09.01.06.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 06:32:01 -0700 (PDT)
Date: Tue, 1 Sep 2020 15:32:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-buf: fix kernel-doc warning in dma-fence.c
Message-ID: <20200901133200.GE2352366@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Gustavo Padovan <gustavo@padovan.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20200831041713.12571-1-rdunlap@infradead.org>
 <81dc0a34-90f6-401a-f846-924fdff4aaff@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81dc0a34-90f6-401a-f846-924fdff4aaff@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Gustavo Padovan <gustavo@padovan.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 31, 2020 at 12:02:03PM +0200, Christian K=F6nig wrote:
> Am 31.08.20 um 06:17 schrieb Randy Dunlap:
> > Add @cookie to dma_fence_end_signalling() to prevent kernel-doc
> > warning in drivers/dma-buf/dma-fence.c:
> > =

> > ../drivers/dma-buf/dma-fence.c:291: warning: Function parameter or memb=
er 'cookie' not described in 'dma_fence_end_signalling'
> > =

> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Gustavo Padovan <gustavo@padovan.org>
> > Cc: Christian K=F6nig <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> =

> Acked-by: Christian K=F6nig <christian.koenig@amd.com>

Will you merge these two to drm-misc-fixes or should someone else?

Always a bit confusing when maintainers reply with acks/r-b but not what
they'll do with the patch :-)

Cheers, Daniel

> =

> > ---
> >   drivers/dma-buf/dma-fence.c |    1 +
> >   1 file changed, 1 insertion(+)
> > =

> > --- lnx-59-rc3.orig/drivers/dma-buf/dma-fence.c
> > +++ lnx-59-rc3/drivers/dma-buf/dma-fence.c
> > @@ -283,6 +283,7 @@ EXPORT_SYMBOL(dma_fence_begin_signalling
> >   /**
> >    * dma_fence_end_signalling - end a critical DMA fence signalling sec=
tion
> > + * @cookie: opaque cookie from dma_fence_begin_signalling()
> >    *
> >    * Closes a critical section annotation opened by dma_fence_begin_sig=
nalling().
> >    */
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
