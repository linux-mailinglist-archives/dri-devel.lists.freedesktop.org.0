Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E658F122
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 19:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC0012AAC3;
	Wed, 10 Aug 2022 17:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9A412A8B5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 17:03:30 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso1819090wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 10:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc; bh=RycH3O9/jVtOrwg8Tb4rCPx9NQGJX/8jY/4QeSrvWuA=;
 b=ahEMB/f1Os7HN/dmBZ/hQpmyqb6o4v/xxFPofPybSlzrEcYUrb651plr/cbP/+fMzr
 P5NUXhJef0mDLs9iqWCS20L/CffRua3nS9EACIIulJKL7+VNH01XgL+dwLXaKhp+Tfx7
 LpIwltdiTebuvkDiYQOw92vpVGk8zum9tL3uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=RycH3O9/jVtOrwg8Tb4rCPx9NQGJX/8jY/4QeSrvWuA=;
 b=AqplzVuNAP5j5gubBDoT3poqqLxEHY+sDbARZMjJylOuirPuVxU7rrRFL9DRDRPZC6
 iIcFNcHSXIbzHcKhU3yrG2tQTeAdg1MNCM7THTk1yGzF+tvGtr1tXErtBKT1yh9S2+C6
 s/ah+/38RDJcvdIXctTjC72E8miVyqaTNKFeWMY1HGCB0/iXnSrq/P7W0hB3FV0BXB19
 GzJJEB1MXhnOsx12ntZVDdJw618pp3ynJerwhxQ/AWKFpHaMTTlvrh87PpG4VT2sAWCW
 /IlGf4ET+gOQ1p0qUcwnghrRPZPWJhkH5162aHvJ7TYE0gCms4LMBSlxsheeg6Ox75yq
 Ekzw==
X-Gm-Message-State: ACgBeo1cC3wJShJjw6x6PMnl8LLp6NDLSjnHM7EACkjIALvCG7PwZzDU
 CP8c8iWB8pav0M6nwnwXOj68Eg==
X-Google-Smtp-Source: AA6agR7QsEM/xyMBF5xLERrn21uITTdQBdPJFNEQyJKrMuV11k6LvfptsnHkOpDEr4Zozx6IwaLSEA==
X-Received: by 2002:a05:600c:34c9:b0:3a4:f1d7:edbd with SMTP id
 d9-20020a05600c34c900b003a4f1d7edbdmr3099490wmq.128.1660151008998; 
 Wed, 10 Aug 2022 10:03:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 e3-20020adf9bc3000000b0020e6ce4dabdsm16865341wrc.103.2022.08.10.10.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 10:03:28 -0700 (PDT)
Date: Wed, 10 Aug 2022 19:03:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Intel-gfx] [PATCH] dma-buf: revert "return only unsignaled
 fences in dma_fence_unwrap_for_each v3"
Message-ID: <YvPk3pdz0t81Pz7A@phenom.ffwll.local>
References: <20220712102849.1562-1-christian.koenig@amd.com>
 <CAKMK7uFnMSKXcU+v_g-Sh62O5MB1uY=K2H-Fq7-5UYtmmjCZ_w@mail.gmail.com>
 <c78e4774-6319-a9ce-978b-4489e1913da3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c78e4774-6319-a9ce-978b-4489e1913da3@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: karolina.drobnik@intel.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 10, 2022 at 07:01:55PM +0200, Christian König wrote:
> Am 10.08.22 um 18:54 schrieb Daniel Vetter:
> > On Tue, 12 Jul 2022 at 12:28, Christian König
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > This reverts commit 8f61973718485f3e89bc4f408f929048b7b47c83.
> > > 
> > > It turned out that this is not correct. Especially the sync_file info
> > > IOCTL needs to see even signaled fences to correctly report back their
> > > status to userspace.
> > > 
> > > Instead add the filter in the merge function again where it makes sense.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >   drivers/dma-buf/dma-fence-unwrap.c | 3 ++-
> > >   include/linux/dma-fence-unwrap.h   | 6 +-----
> > >   2 files changed, 3 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> > > index 502a65ea6d44..7002bca792ff 100644
> > > --- a/drivers/dma-buf/dma-fence-unwrap.c
> > > +++ b/drivers/dma-buf/dma-fence-unwrap.c
> > > @@ -72,7 +72,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
> > >          count = 0;
> > >          for (i = 0; i < num_fences; ++i) {
> > >                  dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
> > > -                       ++count;
> > > +                       if (!dma_fence_is_signaled(tmp))
> > > +                               ++count;
> > >          }
> > > 
> > >          if (count == 0)
> > > diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
> > > index 390de1ee9d35..66b1e56fbb81 100644
> > > --- a/include/linux/dma-fence-unwrap.h
> > > +++ b/include/linux/dma-fence-unwrap.h
> > > @@ -43,14 +43,10 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
> > >    * Unwrap dma_fence_chain and dma_fence_array containers and deep dive into all
> > >    * potential fences in them. If @head is just a normal fence only that one is
> > >    * returned.
> > > - *
> > > - * Note that signalled fences are opportunistically filtered out, which
> > > - * means the iteration is potentially over no fence at all.
> > >    */
> > >   #define dma_fence_unwrap_for_each(fence, cursor, head)                 \
> > >          for (fence = dma_fence_unwrap_first(head, cursor); fence;       \
> > > -            fence = dma_fence_unwrap_next(cursor))                     \
> > > -               if (!dma_fence_is_signaled(fence))
> > > +            fence = dma_fence_unwrap_next(cursor))
> > Not sure it's worth it, but could we still filter but keep the fence
> > if there's an error?
> > 
> > I'm honestly also not entirely sure whether error propagation is a
> > terrific idea, since every single use-case I've seen in i915 was a
> > mis-design and not good at all. So burning it all down and declaring
> > the testcases invalid might be the right thing to do here.
> 
> This is not about error propagation.
> 
> The sync_file has an IOCTL which asks how many of the merged fences are
> already signaled. When we filter signaled fences here the result of this is
> always 0.
> 
> We have an igt test exercising this which reported that the IOCTL doesn't
> work any more.

Ah ok. I guess we add that to the list of reasons why sync_file is a bit a
funny interface, and people should just use drm_syncobj instead :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
