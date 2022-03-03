Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2034CBE96
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 14:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA9110E272;
	Thu,  3 Mar 2022 13:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3E210E272
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 13:13:18 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bg10so10591075ejb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 05:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to;
 bh=z83ai6YJkmKUW5jJF+issOQYawb8DTmSR4isI7/tX8o=;
 b=Aw6EcItCCacH6Q/KGW4/qLnNgYEcCT996Pt8p07zKW4Y05TE3Kd7eLXkAPShtgOJp+
 nTFvXZOe4ON3z9uo1jorAVBkB2lD6nlfD/wCJS3Ic1h7/I/XLpp25moYQgEFXci1yBmk
 an13Oh+jOH9/tOiwEFFt5dwEGMyYEl7z39MfYCnJ64kDrF2ChYL64SKKCn2QLC1YS+pq
 XIYupm8ObM7CjViMMN6Xaugqhs0EF6PpdgHhTdZkqwVvBMZGpZinDK5zyuYYLMw72Dih
 SDTPPayBAXfbnCWeBz2qqQynVmb8zDt2qZmVop2XDkwfIocQhqV52rjiiZCVWkzzJSqM
 jmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to;
 bh=z83ai6YJkmKUW5jJF+issOQYawb8DTmSR4isI7/tX8o=;
 b=IFXlTe2MZWh3LZS2eMEqLAt65g4QNc26y5N9ZTvZkXuKcKnLom2H42ObnpzIyxHy/p
 QrR3+qQBi5tAC3/G9VERV3A6zjQNRM11P1KNDctM2IGd/hA5+KY3m0BleicYWf3AuSxN
 CalTGifVjL9iLjEVWQL6qjBKLqKyK9eC7WQ39g1tBdLuUWGleUF/1R70ZDtj0LQ3cv2y
 O/zSBAaqpfRiAS9sX+ozyXguPlknmxsQekZsjrsXLFvfu+KIdeXhCtPgyShqWiuuxFCy
 VhHAcaXXKzqSDDcT9wdi46m1TUfbkDENK4nFQ0mhhO1evMb1h5WZq6fYYwpMYIt1ImZ/
 Bapg==
X-Gm-Message-State: AOAM530V1Pd/5dAi9Ctw8A2fcOqhZkTtqBKi0o+FcytYJ6J16Ziv/Kns
 Xa+w6pN9Cer6STSAHvWuZfU=
X-Google-Smtp-Source: ABdhPJzWWn1KJC5Y5z2KGWrGiUQWe8T31Z0Bv0oHFd1su4SZywv7m3muqLYjkGZaczowONPst9v0Gw==
X-Received: by 2002:a17:906:974e:b0:6bb:4f90:a6ae with SMTP id
 o14-20020a170906974e00b006bb4f90a6aemr27697906ejy.452.1646313196785; 
 Thu, 03 Mar 2022 05:13:16 -0800 (PST)
Received: from [192.168.178.21] (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 ce7-20020a170906b24700b006cf095c2f5bsm694935ejb.83.2022.03.03.05.13.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 05:13:16 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------YwDqmQ8S0wtpPBImV3BrUKIL"
Message-ID: <a1a1304c-ba2c-88af-153b-608b3dcbeac2@gmail.com>
Date: Thu, 3 Mar 2022 14:13:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 18/24] dma-buf: add enum dma_resv_usage v3
Content-Language: en-US
To: Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel@ffwll.ch>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-19-christian.koenig@amd.com>
 <YcOf9XAOsRJruwAt@phenom.ffwll.local>
 <CAOFGe97sb3YeN-9a5t8XZKEupYD0Y_sXGNxhDOm-JJBzJd4mOA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAOFGe97sb3YeN-9a5t8XZKEupYD0Y_sXGNxhDOm-JJBzJd4mOA@mail.gmail.com>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------YwDqmQ8S0wtpPBImV3BrUKIL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 02.03.22 um 18:55 schrieb Jason Ekstrand:
>
> On Wed, Dec 22, 2021 at 4:00 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
>     On Tue, Dec 07, 2021 at 01:34:05PM +0100, Christian König wrote:
>     > This change adds the dma_resv_usage enum and allows us to
>     specify why a
>     > dma_resv object is queried for its containing fences.
>     >
>     > Additional to that a dma_resv_usage_rw() helper function is
>     added to aid
>     > retrieving the fences for a read or write userspace submission.
>     >
>     > This is then deployed to the different query functions of the
>     dma_resv
>     > object and all of their users. When the write paratermer was
>     previously
>     > true we now use DMA_RESV_USAGE_WRITE and DMA_RESV_USAGE_READ
>     otherwise.
>     >
>     > v2: add KERNEL/OTHER in separate patch
>     > v3: some kerneldoc suggestions by Daniel
>     >
>     > Signed-off-by: Christian König <christian.koenig@amd.com>
>
>     Just commenting on the kerneldoc here.
>
>     > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>     > index ecb2ff606bac..33a17db89fb4 100644
>     > --- a/drivers/dma-buf/dma-resv.c
>     > +++ b/drivers/dma-buf/dma-resv.c
>     > @@ -408,7 +408,7 @@ static void
>     dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
>     >         cursor->seq = read_seqcount_begin(&cursor->obj->seq);
>     >         cursor->index = -1;
>     >         cursor->shared_count = 0;
>     > -       if (cursor->all_fences) {
>     > +       if (cursor->usage >= DMA_RESV_USAGE_READ) {
>
>
> If we're going to do this....
>
>     >                 cursor->fences = dma_resv_shared_list(cursor->obj);
>     >                 if (cursor->fences)
>     >                         cursor->shared_count =
>     cursor->fences->shared_count; 
>
>
>     > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>     > index 40ac9d486f8f..d96d8ca9af56 100644
>     > --- a/include/linux/dma-resv.h
>     > +++ b/include/linux/dma-resv.h
>     > @@ -49,6 +49,49 @@ extern struct ww_class reservation_ww_class;
>     >
>     >  struct dma_resv_list;
>     >
>     > +/**
>     > + * enum dma_resv_usage - how the fences from a dma_resv obj are
>     used
>     > + *
>
>
> We probably want a note in here about the ordering of this enum.  I'm 
> not even sure that comparing enum values is good or that all values 
> will have a strict ordering that can be useful.  It would definitely 
> make me nervous if anything outside dma-resv.c is doing comparisons on 
> these values.

Exactly that is added in the follow up patch which adds 
DMA_RESV_USAGE_KERNEL.

I've just had everything in one single patch originally.

Christian.

>
> --Jason
>
>     > + * This enum describes the different use cases for a dma_resv
>     object and
>     > + * controls which fences are returned when queried.
>
>     We need to link here to both dma_buf.resv and from there to here.
>
>     Also we had a fair amount of text in the old dma_resv fields which
>     should
>     probably be included here.
>
>     > + */
>     > +enum dma_resv_usage {
>     > +     /**
>     > +      * @DMA_RESV_USAGE_WRITE: Implicit write synchronization.
>     > +      *
>     > +      * This should only be used for userspace command
>     submissions which add
>     > +      * an implicit write dependency.
>     > +      */
>     > +     DMA_RESV_USAGE_WRITE,
>     > +
>     > +     /**
>     > +      * @DMA_RESV_USAGE_READ: Implicit read synchronization.
>     > +      *
>     > +      * This should only be used for userspace command
>     submissions which add
>     > +      * an implicit read dependency.
>
>     I think the above would benefit from at least a link each to
>     &dma_buf.resv
>     for further discusion.
>
>     Plus the READ flag needs a huge warning that in general it does _not_
>     guarantee that neither there's no writes possible, nor that the
>     writes can
>     be assumed mistakes and dropped (on buffer moves e.g.).
>
>     Drivers can only make further assumptions for driver-internal dma_resv
>     objects (e.g. on vm/pagetables) or when the fences are all fences
>     of the
>     same driver (e.g. the special sync rules amd has that takes the fence
>     owner into account).
>
>     We have this documented in the dma_buf.resv rules, but since it
>     came up
>     again in a discussion with Thomas H. somewhere, it's better to
>     hammer this
>     in a few more time. Specically in generally ignoring READ fences for
>     buffer moves (well the copy job, memory freeing still has to wait
>     for all
>     of them) is a correctness bug.
>
>     Maybe include a big warning that really the difference between
>     READ and
>     WRITE should only matter for implicit sync, and _not_ for anything
>     else
>     the kernel does.
>
>     I'm assuming the actual replacement is all mechanical, so I
>     skipped that
>     one for now, that's for next year :-)
>     -Daniel
>
>     > +      */
>     > +     DMA_RESV_USAGE_READ,
>     > +};
>     > +
>     > +/**
>     > + * dma_resv_usage_rw - helper for implicit sync
>     > + * @write: true if we create a new implicit sync write
>     > + *
>     > + * This returns the implicit synchronization usage for write or
>     read accesses,
>     > + * see enum dma_resv_usage.
>     > + */
>     > +static inline enum dma_resv_usage dma_resv_usage_rw(bool write)
>     > +{
>     > +     /* This looks confusing at first sight, but is indeed correct.
>     > +      *
>     > +      * The rational is that new write operations needs to wait
>     for the
>     > +      * existing read and write operations to finish.
>     > +      * But a new read operation only needs to wait for the
>     existing write
>     > +      * operations to finish.
>     > +      */
>     > +     return write ? DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE;
>     > +}
>     > +
>     >  /**
>     >   * struct dma_resv - a reservation object manages fences for a
>     buffer
>     >   *
>     > @@ -147,8 +190,8 @@ struct dma_resv_iter {
>     >       /** @obj: The dma_resv object we iterate over */
>     >       struct dma_resv *obj;
>     >
>     > -     /** @all_fences: If all fences should be returned */
>     > -     bool all_fences;
>     > +     /** @usage: Controls which fences are returned */
>     > +     enum dma_resv_usage usage;
>     >
>     >       /** @fence: the currently handled fence */
>     >       struct dma_fence *fence;
>     > @@ -178,14 +221,14 @@ struct dma_fence
>     *dma_resv_iter_next(struct dma_resv_iter *cursor);
>     >   * dma_resv_iter_begin - initialize a dma_resv_iter object
>     >   * @cursor: The dma_resv_iter object to initialize
>     >   * @obj: The dma_resv object which we want to iterate over
>     > - * @all_fences: If all fences should be returned or just the
>     exclusive one
>     > + * @usage: controls which fences to include, see enum
>     dma_resv_usage.
>     >   */
>     >  static inline void dma_resv_iter_begin(struct dma_resv_iter
>     *cursor,
>     >                                      struct dma_resv *obj,
>     > -                                    bool all_fences)
>     > +                                    enum dma_resv_usage usage)
>     >  {
>     >       cursor->obj = obj;
>     > -     cursor->all_fences = all_fences;
>     > +     cursor->usage = usage;
>     >       cursor->fence = NULL;
>     >  }
>     >
>     > @@ -242,7 +285,7 @@ static inline bool
>     dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
>     >   * dma_resv_for_each_fence - fence iterator
>     >   * @cursor: a struct dma_resv_iter pointer
>     >   * @obj: a dma_resv object pointer
>     > - * @all_fences: true if all fences should be returned
>     > + * @usage: controls which fences to return
>     >   * @fence: the current fence
>     >   *
>     >   * Iterate over the fences in a struct dma_resv object while
>     holding the
>     > @@ -251,8 +294,8 @@ static inline bool
>     dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
>     >   * valid as long as the lock is held and so no extra reference
>     to the fence is
>     >   * taken.
>     >   */
>     > -#define dma_resv_for_each_fence(cursor, obj, all_fences,
>     fence)      \
>     > -     for (dma_resv_iter_begin(cursor, obj, all_fences),      \
>     > +#define dma_resv_for_each_fence(cursor, obj, usage, fence)   \
>     > +     for (dma_resv_iter_begin(cursor, obj, usage),   \
>     >            fence = dma_resv_iter_first(cursor); fence;       \
>     >            fence = dma_resv_iter_next(cursor))
>     >
>     > @@ -419,14 +462,14 @@ void dma_resv_add_shared_fence(struct
>     dma_resv *obj, struct dma_fence *fence);
>     >  void dma_resv_replace_fences(struct dma_resv *obj, uint64_t
>     context,
>     >                            struct dma_fence *fence);
>     >  void dma_resv_add_excl_fence(struct dma_resv *obj, struct
>     dma_fence *fence);
>     > -int dma_resv_get_fences(struct dma_resv *obj, bool write,
>     > +int dma_resv_get_fences(struct dma_resv *obj, enum
>     dma_resv_usage usage,
>     >                       unsigned int *num_fences, struct dma_fence
>     ***fences);
>     > -int dma_resv_get_singleton(struct dma_resv *obj, bool write,
>     > +int dma_resv_get_singleton(struct dma_resv *obj, enum
>     dma_resv_usage usage,
>     >                          struct dma_fence **fence);
>     >  int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv
>     *src);
>     > -long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all,
>     bool intr,
>     > -                        unsigned long timeout);
>     > -bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all);
>     > +long dma_resv_wait_timeout(struct dma_resv *obj, enum
>     dma_resv_usage usage,
>     > +                        bool intr, unsigned long timeout);
>     > +bool dma_resv_test_signaled(struct dma_resv *obj, enum
>     dma_resv_usage usage);
>     >  void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq);
>     >
>     >  #endif /* _LINUX_RESERVATION_H */
>     > --
>     > 2.25.1
>     >
>
>     -- 
>     Daniel Vetter
>     Software Engineer, Intel Corporation
>     http://blog.ffwll.ch
>

--------------YwDqmQ8S0wtpPBImV3BrUKIL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Am 02.03.22 um 18:55 schrieb Jason Ekstrand:<br>
    <blockquote type="cite"
cite="mid:CAOFGe97sb3YeN-9a5t8XZKEupYD0Y_sXGNxhDOm-JJBzJd4mOA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr"><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Dec 22, 2021 at 4:00
            PM Daniel Vetter &lt;<a href="mailto:daniel@ffwll.ch"
              moz-do-not-send="true" class="moz-txt-link-freetext">daniel@ffwll.ch</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">On Tue, Dec 07, 2021 at
            01:34:05PM +0100, Christian König wrote:<br>
            &gt; This change adds the dma_resv_usage enum and allows us
            to specify why a<br>
            &gt; dma_resv object is queried for its containing fences.<br>
            &gt; <br>
            &gt; Additional to that a dma_resv_usage_rw() helper
            function is added to aid<br>
            &gt; retrieving the fences for a read or write userspace
            submission.<br>
            &gt; <br>
            &gt; This is then deployed to the different query functions
            of the dma_resv<br>
            &gt; object and all of their users. When the write
            paratermer was previously<br>
            &gt; true we now use DMA_RESV_USAGE_WRITE and
            DMA_RESV_USAGE_READ otherwise.<br>
            &gt; <br>
            &gt; v2: add KERNEL/OTHER in separate patch<br>
            &gt; v3: some kerneldoc suggestions by Daniel<br>
            &gt; <br>
            &gt; Signed-off-by: Christian König &lt;<a
              href="mailto:christian.koenig@amd.com" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;<br>
            <br>
            Just commenting on the kerneldoc here. <br>
            <br>
          </blockquote>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            &gt; diff --git a/drivers/dma-buf/dma-resv.c
            b/drivers/dma-buf/dma-resv.c<br>
            &gt; index ecb2ff606bac..33a17db89fb4 100644<br>
            &gt; --- a/drivers/dma-buf/dma-resv.c<br>
            &gt; +++ b/drivers/dma-buf/dma-resv.c<br>
            &gt; @@ -408,7 +408,7 @@ static void
            dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)<br>
            &gt;         cursor-&gt;seq =
            read_seqcount_begin(&amp;cursor-&gt;obj-&gt;seq);<br>
            &gt;         cursor-&gt;index = -1;<br>
            &gt;         cursor-&gt;shared_count = 0;<br>
            &gt; -       if (cursor-&gt;all_fences) {<br>
            &gt; +       if (cursor-&gt;usage &gt;= DMA_RESV_USAGE_READ)
            {<br>
          </blockquote>
          <div><br>
          </div>
          <div>If we're going to do this....<br>
          </div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            &gt;                 cursor-&gt;fences =
            dma_resv_shared_list(cursor-&gt;obj);<br>
            &gt;                 if (cursor-&gt;fences)<br>
            &gt;                         cursor-&gt;shared_count =
            cursor-&gt;fences-&gt;shared_count; </blockquote>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"><br>
            &gt; diff --git a/include/linux/dma-resv.h
            b/include/linux/dma-resv.h<br>
            &gt; index 40ac9d486f8f..d96d8ca9af56 100644<br>
            &gt; --- a/include/linux/dma-resv.h<br>
            &gt; +++ b/include/linux/dma-resv.h<br>
            &gt; @@ -49,6 +49,49 @@ extern struct ww_class
            reservation_ww_class;<br>
            &gt;  <br>
            &gt;  struct dma_resv_list;<br>
            &gt;  <br>
            &gt; +/**<br>
            &gt; + * enum dma_resv_usage - how the fences from a
            dma_resv obj are used<br>
            &gt; + *<br>
          </blockquote>
          <div><br>
          </div>
          <div>We probably want a note in here about the ordering of
            this enum.  I'm not even sure that comparing enum values is
            good or that all values will have a strict ordering that can
            be useful.  It would definitely make me nervous if anything
            outside dma-resv.c is doing comparisons on these values.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Exactly that is added in the follow up patch which adds
    DMA_RESV_USAGE_KERNEL.<br>
    <br>
    I've just had everything in one single patch originally.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAOFGe97sb3YeN-9a5t8XZKEupYD0Y_sXGNxhDOm-JJBzJd4mOA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>--Jason<br>
          </div>
          <div> <br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            &gt; + * This enum describes the different use cases for a
            dma_resv object and<br>
            &gt; + * controls which fences are returned when queried.<br>
            <br>
            We need to link here to both dma_buf.resv and from there to
            here.<br>
            <br>
            Also we had a fair amount of text in the old dma_resv fields
            which should<br>
            probably be included here.<br>
            <br>
            &gt; + */<br>
            &gt; +enum dma_resv_usage {<br>
            &gt; +     /**<br>
            &gt; +      * @DMA_RESV_USAGE_WRITE: Implicit write
            synchronization.<br>
            &gt; +      *<br>
            &gt; +      * This should only be used for userspace command
            submissions which add<br>
            &gt; +      * an implicit write dependency.<br>
            &gt; +      */<br>
            &gt; +     DMA_RESV_USAGE_WRITE,<br>
            &gt; +<br>
            &gt; +     /**<br>
            &gt; +      * @DMA_RESV_USAGE_READ: Implicit read
            synchronization.<br>
            &gt; +      *<br>
            &gt; +      * This should only be used for userspace command
            submissions which add<br>
            &gt; +      * an implicit read dependency.<br>
            <br>
            I think the above would benefit from at least a link each to
            &amp;dma_buf.resv<br>
            for further discusion.<br>
            <br>
            Plus the READ flag needs a huge warning that in general it
            does _not_<br>
            guarantee that neither there's no writes possible, nor that
            the writes can<br>
            be assumed mistakes and dropped (on buffer moves e.g.).<br>
            <br>
            Drivers can only make further assumptions for
            driver-internal dma_resv<br>
            objects (e.g. on vm/pagetables) or when the fences are all
            fences of the<br>
            same driver (e.g. the special sync rules amd has that takes
            the fence<br>
            owner into account).<br>
            <br>
            We have this documented in the dma_buf.resv rules, but since
            it came up<br>
            again in a discussion with Thomas H. somewhere, it's better
            to hammer this<br>
            in a few more time. Specically in generally ignoring READ
            fences for<br>
            buffer moves (well the copy job, memory freeing still has to
            wait for all<br>
            of them) is a correctness bug.<br>
            <br>
            Maybe include a big warning that really the difference
            between READ and<br>
            WRITE should only matter for implicit sync, and _not_ for
            anything else<br>
            the kernel does.<br>
            <br>
            I'm assuming the actual replacement is all mechanical, so I
            skipped that<br>
            one for now, that's for next year :-)<br>
            -Daniel<br>
            <br>
            &gt; +      */<br>
            &gt; +     DMA_RESV_USAGE_READ,<br>
            &gt; +};<br>
            &gt; +<br>
            &gt; +/**<br>
            &gt; + * dma_resv_usage_rw - helper for implicit sync<br>
            &gt; + * @write: true if we create a new implicit sync write<br>
            &gt; + *<br>
            &gt; + * This returns the implicit synchronization usage for
            write or read accesses,<br>
            &gt; + * see enum dma_resv_usage.<br>
            &gt; + */<br>
            &gt; +static inline enum dma_resv_usage
            dma_resv_usage_rw(bool write)<br>
            &gt; +{<br>
            &gt; +     /* This looks confusing at first sight, but is
            indeed correct.<br>
            &gt; +      *<br>
            &gt; +      * The rational is that new write operations
            needs to wait for the<br>
            &gt; +      * existing read and write operations to finish.<br>
            &gt; +      * But a new read operation only needs to wait
            for the existing write<br>
            &gt; +      * operations to finish.<br>
            &gt; +      */<br>
            &gt; +     return write ? DMA_RESV_USAGE_READ :
            DMA_RESV_USAGE_WRITE;<br>
            &gt; +}<br>
            &gt; +<br>
            &gt;  /**<br>
            &gt;   * struct dma_resv - a reservation object manages
            fences for a buffer<br>
            &gt;   *<br>
            &gt; @@ -147,8 +190,8 @@ struct dma_resv_iter {<br>
            &gt;       /** @obj: The dma_resv object we iterate over */<br>
            &gt;       struct dma_resv *obj;<br>
            &gt;  <br>
            &gt; -     /** @all_fences: If all fences should be returned
            */<br>
            &gt; -     bool all_fences;<br>
            &gt; +     /** @usage: Controls which fences are returned */<br>
            &gt; +     enum dma_resv_usage usage;<br>
            &gt;  <br>
            &gt;       /** @fence: the currently handled fence */<br>
            &gt;       struct dma_fence *fence;<br>
            &gt; @@ -178,14 +221,14 @@ struct dma_fence
            *dma_resv_iter_next(struct dma_resv_iter *cursor);<br>
            &gt;   * dma_resv_iter_begin - initialize a dma_resv_iter
            object<br>
            &gt;   * @cursor: The dma_resv_iter object to initialize<br>
            &gt;   * @obj: The dma_resv object which we want to iterate
            over<br>
            &gt; - * @all_fences: If all fences should be returned or
            just the exclusive one<br>
            &gt; + * @usage: controls which fences to include, see enum
            dma_resv_usage.<br>
            &gt;   */<br>
            &gt;  static inline void dma_resv_iter_begin(struct
            dma_resv_iter *cursor,<br>
            &gt;                                      struct dma_resv
            *obj,<br>
            &gt; -                                    bool all_fences)<br>
            &gt; +                                    enum
            dma_resv_usage usage)<br>
            &gt;  {<br>
            &gt;       cursor-&gt;obj = obj;<br>
            &gt; -     cursor-&gt;all_fences = all_fences;<br>
            &gt; +     cursor-&gt;usage = usage;<br>
            &gt;       cursor-&gt;fence = NULL;<br>
            &gt;  }<br>
            &gt;  <br>
            &gt; @@ -242,7 +285,7 @@ static inline bool
            dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)<br>
            &gt;   * dma_resv_for_each_fence - fence iterator<br>
            &gt;   * @cursor: a struct dma_resv_iter pointer<br>
            &gt;   * @obj: a dma_resv object pointer<br>
            &gt; - * @all_fences: true if all fences should be returned<br>
            &gt; + * @usage: controls which fences to return<br>
            &gt;   * @fence: the current fence<br>
            &gt;   *<br>
            &gt;   * Iterate over the fences in a struct dma_resv object
            while holding the<br>
            &gt; @@ -251,8 +294,8 @@ static inline bool
            dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)<br>
            &gt;   * valid as long as the lock is held and so no extra
            reference to the fence is<br>
            &gt;   * taken.<br>
            &gt;   */<br>
            &gt; -#define dma_resv_for_each_fence(cursor, obj,
            all_fences, fence)      \<br>
            &gt; -     for (dma_resv_iter_begin(cursor, obj,
            all_fences),      \<br>
            &gt; +#define dma_resv_for_each_fence(cursor, obj, usage,
            fence)   \<br>
            &gt; +     for (dma_resv_iter_begin(cursor, obj, usage),   \<br>
            &gt;            fence = dma_resv_iter_first(cursor); fence; 
                  \<br>
            &gt;            fence = dma_resv_iter_next(cursor))<br>
            &gt;  <br>
            &gt; @@ -419,14 +462,14 @@ void
            dma_resv_add_shared_fence(struct dma_resv *obj, struct
            dma_fence *fence);<br>
            &gt;  void dma_resv_replace_fences(struct dma_resv *obj,
            uint64_t context,<br>
            &gt;                            struct dma_fence *fence);<br>
            &gt;  void dma_resv_add_excl_fence(struct dma_resv *obj,
            struct dma_fence *fence);<br>
            &gt; -int dma_resv_get_fences(struct dma_resv *obj, bool
            write,<br>
            &gt; +int dma_resv_get_fences(struct dma_resv *obj, enum
            dma_resv_usage usage,<br>
            &gt;                       unsigned int *num_fences, struct
            dma_fence ***fences);<br>
            &gt; -int dma_resv_get_singleton(struct dma_resv *obj, bool
            write,<br>
            &gt; +int dma_resv_get_singleton(struct dma_resv *obj, enum
            dma_resv_usage usage,<br>
            &gt;                          struct dma_fence **fence);<br>
            &gt;  int dma_resv_copy_fences(struct dma_resv *dst, struct
            dma_resv *src);<br>
            &gt; -long dma_resv_wait_timeout(struct dma_resv *obj, bool
            wait_all, bool intr,<br>
            &gt; -                        unsigned long timeout);<br>
            &gt; -bool dma_resv_test_signaled(struct dma_resv *obj, bool
            test_all);<br>
            &gt; +long dma_resv_wait_timeout(struct dma_resv *obj, enum
            dma_resv_usage usage,<br>
            &gt; +                        bool intr, unsigned long
            timeout);<br>
            &gt; +bool dma_resv_test_signaled(struct dma_resv *obj, enum
            dma_resv_usage usage);<br>
            &gt;  void dma_resv_describe(struct dma_resv *obj, struct
            seq_file *seq);<br>
            &gt;  <br>
            &gt;  #endif /* _LINUX_RESERVATION_H */<br>
            &gt; -- <br>
            &gt; 2.25.1<br>
            &gt; <br>
            <br>
            -- <br>
            Daniel Vetter<br>
            Software Engineer, Intel Corporation<br>
            <a href="http://blog.ffwll.ch" rel="noreferrer"
              target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">http://blog.ffwll.ch</a><br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------YwDqmQ8S0wtpPBImV3BrUKIL--
