Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34584CB917
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 09:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A8710EF41;
	Thu,  3 Mar 2022 08:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A17810E84C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 17:55:14 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2dbc48104beso27294547b3.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 09:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=607tKTexkPOE224q2rQmto8sXbQNWO1mrIPgejrRpbc=;
 b=E96Q1G891oBwItjALDtZArrht9pv6r3S55GfgVpSywOb/VK1zKUv5wAxsLFeiN9vJc
 NX3vK9vF3qFHgfL1qDgdiOffRPHxvX2HdQP94TTU2+Y+21fC/TESfMBptPGvkgGEEPpV
 XZHtXfR8Wg0fXLJCmrUzqvICzTm5A8eGmNf64HE8hAfpLZxyYVr31j1PRT3lZ6yB4iWA
 vAYIt6dVZhSloTs+d4rNylRSlX9fk8eGKmCItLQf8+CslrgIXRMt1KPWhv64sHxtx8BS
 ts2zsJCGcN4a3B5/6HI6KOVEdX4KdxIvBR920SYb3P0CwcwUu3vzQ/SAchKL8fn/5caL
 PkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=607tKTexkPOE224q2rQmto8sXbQNWO1mrIPgejrRpbc=;
 b=x3GgbpSDqjdkk6j+3ATho8zGSAmX9bw+55GYHs0Zh2/z77NyNmqYNScd82q552vkE9
 SS/3MsNQAzqK/bbIAgNji3mSQughoobgFsnurMy57VOapbOA2FFWBvOy1bKGVs7JOlqD
 5/ItJoyfYq8DLTPAG5RnOqer+huJRb0GfLLwTFzQ0q+kVRICD6zwmP3fU071HMZI4K2D
 aktGsB9dtleLsataOmLqYfBNW1i2kYmzeREg+en6yxEPgFIIZL0+Qs6qiRkhUUXffHcX
 8rQYRrWmrHA/LWVhFoQF2PQjkLkQP+DYtKMQiMlmO277syJUmNVTIXrR31SeKti/jZrd
 4KCw==
X-Gm-Message-State: AOAM530bwGLlATm3nq81Jxdu1K5LNbqO+UJB1fHbOww2F8XcbODUrTCR
 9BoTyymXWW5lz+K268Lv/uzbrrApdfUXpmKbBQUMMg==
X-Google-Smtp-Source: ABdhPJz7JHb6leWtBGXbzNRGMzAnq8oIPyv7Qv+1btAO6fU3lVKudPQDKaBfr8yGrHp/R1z/gypclOg8XioZs2eK/e4=
X-Received: by 2002:a0d:edc7:0:b0:2d8:2ec:2e87 with SMTP id
 w190-20020a0dedc7000000b002d802ec2e87mr30373806ywe.209.1646243713278; Wed, 02
 Mar 2022 09:55:13 -0800 (PST)
MIME-Version: 1.0
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-19-christian.koenig@amd.com>
 <YcOf9XAOsRJruwAt@phenom.ffwll.local>
In-Reply-To: <YcOf9XAOsRJruwAt@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 2 Mar 2022 11:55:02 -0600
Message-ID: <CAOFGe97sb3YeN-9a5t8XZKEupYD0Y_sXGNxhDOm-JJBzJd4mOA@mail.gmail.com>
Subject: Re: [PATCH 18/24] dma-buf: add enum dma_resv_usage v3
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: multipart/alternative; boundary="000000000000be763805d93ffb31"
X-Mailman-Approved-At: Thu, 03 Mar 2022 08:33:09 +0000
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000be763805d93ffb31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 22, 2021 at 4:00 PM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Dec 07, 2021 at 01:34:05PM +0100, Christian K=C3=B6nig wrote:
> > This change adds the dma_resv_usage enum and allows us to specify why a
> > dma_resv object is queried for its containing fences.
> >
> > Additional to that a dma_resv_usage_rw() helper function is added to ai=
d
> > retrieving the fences for a read or write userspace submission.
> >
> > This is then deployed to the different query functions of the dma_resv
> > object and all of their users. When the write paratermer was previously
> > true we now use DMA_RESV_USAGE_WRITE and DMA_RESV_USAGE_READ otherwise.
> >
> > v2: add KERNEL/OTHER in separate patch
> > v3: some kerneldoc suggestions by Daniel
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Just commenting on the kerneldoc here.
>
> > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > index ecb2ff606bac..33a17db89fb4 100644
> > --- a/drivers/dma-buf/dma-resv.c
> > +++ b/drivers/dma-buf/dma-resv.c
> > @@ -408,7 +408,7 @@ static void dma_resv_iter_restart_unlocked(struct
> dma_resv_iter *cursor)
> >         cursor->seq =3D read_seqcount_begin(&cursor->obj->seq);
> >         cursor->index =3D -1;
> >         cursor->shared_count =3D 0;
> > -       if (cursor->all_fences) {
> > +       if (cursor->usage >=3D DMA_RESV_USAGE_READ) {
>

If we're going to do this....


> >                 cursor->fences =3D dma_resv_shared_list(cursor->obj);
> >                 if (cursor->fences)
> >                         cursor->shared_count =3D
> cursor->fences->shared_count;


> > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > index 40ac9d486f8f..d96d8ca9af56 100644
> > --- a/include/linux/dma-resv.h
> > +++ b/include/linux/dma-resv.h
> > @@ -49,6 +49,49 @@ extern struct ww_class reservation_ww_class;
> >
> >  struct dma_resv_list;
> >
> > +/**
> > + * enum dma_resv_usage - how the fences from a dma_resv obj are used
> > + *
>

We probably want a note in here about the ordering of this enum.  I'm not
even sure that comparing enum values is good or that all values will have a
strict ordering that can be useful.  It would definitely make me nervous if
anything outside dma-resv.c is doing comparisons on these values.

--Jason


> > + * This enum describes the different use cases for a dma_resv object a=
nd
> > + * controls which fences are returned when queried.
>
> We need to link here to both dma_buf.resv and from there to here.
>
> Also we had a fair amount of text in the old dma_resv fields which should
> probably be included here.
>
> > + */
> > +enum dma_resv_usage {
> > +     /**
> > +      * @DMA_RESV_USAGE_WRITE: Implicit write synchronization.
> > +      *
> > +      * This should only be used for userspace command submissions
> which add
> > +      * an implicit write dependency.
> > +      */
> > +     DMA_RESV_USAGE_WRITE,
> > +
> > +     /**
> > +      * @DMA_RESV_USAGE_READ: Implicit read synchronization.
> > +      *
> > +      * This should only be used for userspace command submissions
> which add
> > +      * an implicit read dependency.
>
> I think the above would benefit from at least a link each to &dma_buf.res=
v
> for further discusion.
>
> Plus the READ flag needs a huge warning that in general it does _not_
> guarantee that neither there's no writes possible, nor that the writes ca=
n
> be assumed mistakes and dropped (on buffer moves e.g.).
>
> Drivers can only make further assumptions for driver-internal dma_resv
> objects (e.g. on vm/pagetables) or when the fences are all fences of the
> same driver (e.g. the special sync rules amd has that takes the fence
> owner into account).
>
> We have this documented in the dma_buf.resv rules, but since it came up
> again in a discussion with Thomas H. somewhere, it's better to hammer thi=
s
> in a few more time. Specically in generally ignoring READ fences for
> buffer moves (well the copy job, memory freeing still has to wait for all
> of them) is a correctness bug.
>
> Maybe include a big warning that really the difference between READ and
> WRITE should only matter for implicit sync, and _not_ for anything else
> the kernel does.
>
> I'm assuming the actual replacement is all mechanical, so I skipped that
> one for now, that's for next year :-)
> -Daniel
>
> > +      */
> > +     DMA_RESV_USAGE_READ,
> > +};
> > +
> > +/**
> > + * dma_resv_usage_rw - helper for implicit sync
> > + * @write: true if we create a new implicit sync write
> > + *
> > + * This returns the implicit synchronization usage for write or read
> accesses,
> > + * see enum dma_resv_usage.
> > + */
> > +static inline enum dma_resv_usage dma_resv_usage_rw(bool write)
> > +{
> > +     /* This looks confusing at first sight, but is indeed correct.
> > +      *
> > +      * The rational is that new write operations needs to wait for th=
e
> > +      * existing read and write operations to finish.
> > +      * But a new read operation only needs to wait for the existing
> write
> > +      * operations to finish.
> > +      */
> > +     return write ? DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE;
> > +}
> > +
> >  /**
> >   * struct dma_resv - a reservation object manages fences for a buffer
> >   *
> > @@ -147,8 +190,8 @@ struct dma_resv_iter {
> >       /** @obj: The dma_resv object we iterate over */
> >       struct dma_resv *obj;
> >
> > -     /** @all_fences: If all fences should be returned */
> > -     bool all_fences;
> > +     /** @usage: Controls which fences are returned */
> > +     enum dma_resv_usage usage;
> >
> >       /** @fence: the currently handled fence */
> >       struct dma_fence *fence;
> > @@ -178,14 +221,14 @@ struct dma_fence *dma_resv_iter_next(struct
> dma_resv_iter *cursor);
> >   * dma_resv_iter_begin - initialize a dma_resv_iter object
> >   * @cursor: The dma_resv_iter object to initialize
> >   * @obj: The dma_resv object which we want to iterate over
> > - * @all_fences: If all fences should be returned or just the exclusive
> one
> > + * @usage: controls which fences to include, see enum dma_resv_usage.
> >   */
> >  static inline void dma_resv_iter_begin(struct dma_resv_iter *cursor,
> >                                      struct dma_resv *obj,
> > -                                    bool all_fences)
> > +                                    enum dma_resv_usage usage)
> >  {
> >       cursor->obj =3D obj;
> > -     cursor->all_fences =3D all_fences;
> > +     cursor->usage =3D usage;
> >       cursor->fence =3D NULL;
> >  }
> >
> > @@ -242,7 +285,7 @@ static inline bool dma_resv_iter_is_restarted(struc=
t
> dma_resv_iter *cursor)
> >   * dma_resv_for_each_fence - fence iterator
> >   * @cursor: a struct dma_resv_iter pointer
> >   * @obj: a dma_resv object pointer
> > - * @all_fences: true if all fences should be returned
> > + * @usage: controls which fences to return
> >   * @fence: the current fence
> >   *
> >   * Iterate over the fences in a struct dma_resv object while holding t=
he
> > @@ -251,8 +294,8 @@ static inline bool dma_resv_iter_is_restarted(struc=
t
> dma_resv_iter *cursor)
> >   * valid as long as the lock is held and so no extra reference to the
> fence is
> >   * taken.
> >   */
> > -#define dma_resv_for_each_fence(cursor, obj, all_fences, fence)      \
> > -     for (dma_resv_iter_begin(cursor, obj, all_fences),      \
> > +#define dma_resv_for_each_fence(cursor, obj, usage, fence)   \
> > +     for (dma_resv_iter_begin(cursor, obj, usage),   \
> >            fence =3D dma_resv_iter_first(cursor); fence;        \
> >            fence =3D dma_resv_iter_next(cursor))
> >
> > @@ -419,14 +462,14 @@ void dma_resv_add_shared_fence(struct dma_resv
> *obj, struct dma_fence *fence);
> >  void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
> >                            struct dma_fence *fence);
> >  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence
> *fence);
> > -int dma_resv_get_fences(struct dma_resv *obj, bool write,
> > +int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usag=
e,
> >                       unsigned int *num_fences, struct dma_fence
> ***fences);
> > -int dma_resv_get_singleton(struct dma_resv *obj, bool write,
> > +int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage
> usage,
> >                          struct dma_fence **fence);
> >  int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
> > -long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool
> intr,
> > -                        unsigned long timeout);
> > -bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all);
> > +long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage
> usage,
> > +                        bool intr, unsigned long timeout);
> > +bool dma_resv_test_signaled(struct dma_resv *obj, enum dma_resv_usage
> usage);
> >  void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq);
> >
> >  #endif /* _LINUX_RESERVATION_H */
> > --
> > 2.25.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000be763805d93ffb31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Dec 22, 2021 at 4:00 PM Daniel Vetter &lt;<a href=3D"mai=
lto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Tue, Dec 07, 2021 at 01:34:05PM +010=
0, Christian K=C3=B6nig wrote:<br>
&gt; This change adds the dma_resv_usage enum and allows us to specify why =
a<br>
&gt; dma_resv object is queried for its containing fences.<br>
&gt; <br>
&gt; Additional to that a dma_resv_usage_rw() helper function is added to a=
id<br>
&gt; retrieving the fences for a read or write userspace submission.<br>
&gt; <br>
&gt; This is then deployed to the different query functions of the dma_resv=
<br>
&gt; object and all of their users. When the write paratermer was previousl=
y<br>
&gt; true we now use DMA_RESV_USAGE_WRITE and DMA_RESV_USAGE_READ otherwise=
.<br>
&gt; <br>
&gt; v2: add KERNEL/OTHER in separate patch<br>
&gt; v3: some kerneldoc suggestions by Daniel<br>
&gt; <br>
&gt; Signed-off-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.ko=
enig@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
<br>
Just commenting on the kerneldoc here. <br><br></blockquote><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
&gt; diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c<b=
r>
&gt; index ecb2ff606bac..33a17db89fb4 100644<br>
&gt; --- a/drivers/dma-buf/dma-resv.c<br>
&gt; +++ b/drivers/dma-buf/dma-resv.c<br>
&gt; @@ -408,7 +408,7 @@ static void dma_resv_iter_restart_unlocked(struct =
dma_resv_iter *cursor)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor-&gt;seq =3D read_seqcount_begin(&am=
p;cursor-&gt;obj-&gt;seq);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor-&gt;index =3D -1;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor-&gt;shared_count =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cursor-&gt;all_fences) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cursor-&gt;usage &gt;=3D DMA_RESV_USAG=
E_READ) {<br></blockquote><div><br></div><div>If we&#39;re going to do this=
....<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor-&gt;fen=
ces =3D dma_resv_shared_list(cursor-&gt;obj);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cursor-&gt=
;fences)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 cursor-&gt;shared_count =3D cursor-&gt;fences-&gt;shared_coun=
t;=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
&gt; diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h<br>
&gt; index 40ac9d486f8f..d96d8ca9af56 100644<br>
&gt; --- a/include/linux/dma-resv.h<br>
&gt; +++ b/include/linux/dma-resv.h<br>
&gt; @@ -49,6 +49,49 @@ extern struct ww_class reservation_ww_class;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct dma_resv_list;<br>
&gt;=C2=A0 <br>
&gt; +/**<br>
&gt; + * enum dma_resv_usage - how the fences from a dma_resv obj are used<=
br>
&gt; + *<br></blockquote><div><br></div><div>We probably want a note in her=
e about the ordering of this enum.=C2=A0 I&#39;m not even sure that compari=
ng enum values is good or that all values will have a strict ordering that =
can be useful.=C2=A0 It would definitely make me nervous if anything outsid=
e dma-resv.c is doing comparisons on these values.</div><div><br></div><div=
>--Jason<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
&gt; + * This enum describes the different use cases for a dma_resv object =
and<br>
&gt; + * controls which fences are returned when queried.<br>
<br>
We need to link here to both dma_buf.resv and from there to here.<br>
<br>
Also we had a fair amount of text in the old dma_resv fields which should<b=
r>
probably be included here.<br>
<br>
&gt; + */<br>
&gt; +enum dma_resv_usage {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/**<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * @DMA_RESV_USAGE_WRITE: Implicit write synchron=
ization.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * This should only be used for userspace command=
 submissions which add<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * an implicit write dependency.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DMA_RESV_USAGE_WRITE,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/**<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * @DMA_RESV_USAGE_READ: Implicit read synchroniz=
ation.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * This should only be used for userspace command=
 submissions which add<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * an implicit read dependency.<br>
<br>
I think the above would benefit from at least a link each to &amp;dma_buf.r=
esv<br>
for further discusion.<br>
<br>
Plus the READ flag needs a huge warning that in general it does _not_<br>
guarantee that neither there&#39;s no writes possible, nor that the writes =
can<br>
be assumed mistakes and dropped (on buffer moves e.g.).<br>
<br>
Drivers can only make further assumptions for driver-internal dma_resv<br>
objects (e.g. on vm/pagetables) or when the fences are all fences of the<br=
>
same driver (e.g. the special sync rules amd has that takes the fence<br>
owner into account).<br>
<br>
We have this documented in the dma_buf.resv rules, but since it came up<br>
again in a discussion with Thomas H. somewhere, it&#39;s better to hammer t=
his<br>
in a few more time. Specically in generally ignoring READ fences for<br>
buffer moves (well the copy job, memory freeing still has to wait for all<b=
r>
of them) is a correctness bug.<br>
<br>
Maybe include a big warning that really the difference between READ and<br>
WRITE should only matter for implicit sync, and _not_ for anything else<br>
the kernel does.<br>
<br>
I&#39;m assuming the actual replacement is all mechanical, so I skipped tha=
t<br>
one for now, that&#39;s for next year :-)<br>
-Daniel<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DMA_RESV_USAGE_READ,<br>
&gt; +};<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * dma_resv_usage_rw - helper for implicit sync<br>
&gt; + * @write: true if we create a new implicit sync write<br>
&gt; + *<br>
&gt; + * This returns the implicit synchronization usage for write or read =
accesses,<br>
&gt; + * see enum dma_resv_usage.<br>
&gt; + */<br>
&gt; +static inline enum dma_resv_usage dma_resv_usage_rw(bool write)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* This looks confusing at first sight, but is in=
deed correct.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * The rational is that new write operations need=
s to wait for the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * existing read and write operations to finish.<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * But a new read operation only needs to wait fo=
r the existing write<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * operations to finish.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return write ? DMA_RESV_USAGE_READ : DMA_RESV_USA=
GE_WRITE;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* struct dma_resv - a reservation object manages fences fo=
r a buffer<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; @@ -147,8 +190,8 @@ struct dma_resv_iter {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @obj: The dma_resv object we iterate ove=
r */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_resv *obj;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/** @all_fences: If all fences should be returned=
 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0bool all_fences;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/** @usage: Controls which fences are returned */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enum dma_resv_usage usage;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @fence: the currently handled fence */<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_fence *fence;<br>
&gt; @@ -178,14 +221,14 @@ struct dma_fence *dma_resv_iter_next(struct dma_=
resv_iter *cursor);<br>
&gt;=C2=A0 =C2=A0* dma_resv_iter_begin - initialize a dma_resv_iter object<=
br>
&gt;=C2=A0 =C2=A0* @cursor: The dma_resv_iter object to initialize<br>
&gt;=C2=A0 =C2=A0* @obj: The dma_resv object which we want to iterate over<=
br>
&gt; - * @all_fences: If all fences should be returned or just the exclusiv=
e one<br>
&gt; + * @usage: controls which fences to include, see enum dma_resv_usage.=
<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 static inline void dma_resv_iter_begin(struct dma_resv_iter *cur=
sor,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dma_r=
esv *obj,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool all_fences)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum dma_resv_usag=
e usage)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cursor-&gt;obj =3D obj;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cursor-&gt;all_fences =3D all_fences;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cursor-&gt;usage =3D usage;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cursor-&gt;fence =3D NULL;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -242,7 +285,7 @@ static inline bool dma_resv_iter_is_restarted(stru=
ct dma_resv_iter *cursor)<br>
&gt;=C2=A0 =C2=A0* dma_resv_for_each_fence - fence iterator<br>
&gt;=C2=A0 =C2=A0* @cursor: a struct dma_resv_iter pointer<br>
&gt;=C2=A0 =C2=A0* @obj: a dma_resv object pointer<br>
&gt; - * @all_fences: true if all fences should be returned<br>
&gt; + * @usage: controls which fences to return<br>
&gt;=C2=A0 =C2=A0* @fence: the current fence<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0* Iterate over the fences in a struct dma_resv object whil=
e holding the<br>
&gt; @@ -251,8 +294,8 @@ static inline bool dma_resv_iter_is_restarted(stru=
ct dma_resv_iter *cursor)<br>
&gt;=C2=A0 =C2=A0* valid as long as the lock is held and so no extra refere=
nce to the fence is<br>
&gt;=C2=A0 =C2=A0* taken.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; -#define dma_resv_for_each_fence(cursor, obj, all_fences, fence)=C2=A0=
 =C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for (dma_resv_iter_begin(cursor, obj, all_fences)=
,=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +#define dma_resv_for_each_fence(cursor, obj, usage, fence)=C2=A0 =C2=
=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (dma_resv_iter_begin(cursor, obj, usage),=C2=
=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fence =3D dma_resv_iter_first=
(cursor); fence;=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fence =3D dma_resv_iter_next(=
cursor))<br>
&gt;=C2=A0 <br>
&gt; @@ -419,14 +462,14 @@ void dma_resv_add_shared_fence(struct dma_resv *=
obj, struct dma_fence *fence);<br>
&gt;=C2=A0 void dma_resv_replace_fences(struct dma_resv *obj, uint64_t cont=
ext,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dma_fence *fence);<br>
&gt;=C2=A0 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fe=
nce *fence);<br>
&gt; -int dma_resv_get_fences(struct dma_resv *obj, bool write,<br>
&gt; +int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usa=
ge,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0unsigned int *num_fences, struct dma_fence ***fences);<br>
&gt; -int dma_resv_get_singleton(struct dma_resv *obj, bool write,<br>
&gt; +int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage =
usage,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 struct dma_fence **fence);<br>
&gt;=C2=A0 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *=
src);<br>
&gt; -long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool =
intr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 unsigned long timeout);<br>
&gt; -bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all);<br>
&gt; +long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage =
usage,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 bool intr, unsigned long timeout);<br>
&gt; +bool dma_resv_test_signaled(struct dma_resv *obj, enum dma_resv_usage=
 usage);<br>
&gt;=C2=A0 void dma_resv_describe(struct dma_resv *obj, struct seq_file *se=
q);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #endif /* _LINUX_RESERVATION_H */<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div></div>

--000000000000be763805d93ffb31--
