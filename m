Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC6960F316
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 11:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908F510E591;
	Thu, 27 Oct 2022 09:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777B310E591
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 09:01:01 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so3657304wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 02:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B2Lt3ikNZDtQQkIgZ3i41ZL3J59GirfJ76RKYEAsV3E=;
 b=FqDExJi8VcmdkOd/pJofSgdK9Dk2qWutB5Vhp6FXnC6NSWY5DjxAB4iJszt09XWZ+y
 iab5mlEad+FG+TvseiJfezeYERaaDafgl2y0z2dPa3TT+SacMdEIsnlbx3fOX1n0++3v
 1okzyqzULSmVO/w8FxZKlDOEZT+175/pXJhhYyw23s5bdr6K78nUFjAkfC1OEIGw8BD8
 h5XGSn2raRTs05RcRSLAzvQQB7kf044Qq6djV0kynVBeg6gu9xn4CErWTSZyf3+eGkJv
 bJBVQY3r35XAGQh7f4h72J83meizB5EoyMpUYOPPhzg9lfPyIHWeYsWro3bB1mHeZp97
 P94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B2Lt3ikNZDtQQkIgZ3i41ZL3J59GirfJ76RKYEAsV3E=;
 b=HTdgF4Fbmp/UAZc7uaDcih8+6FBCcWltE3anxSAhKuK5IOUUfy06mAmEOeVFP7og9L
 Lf1prqTmKIuTiXStvcEsBYKilTsTu/Y8s6V/bF3vVxWL8fZEuIIsoB54K5kkXUUCOa5/
 Ep90A8EYl1R8nmOHNBBvJYWLF034zsueBdHhLPvY3acY16QTaAl6fFthxZpcQIF4raGS
 dwzooF9xk/y7JNq/nHIJdShvD6RaB9Cuy3A1bdQmzqLHIwulzShFTRlpxDoWFrf9nzkD
 fkUvbDHMDKxZY2CNkjLfAQ7zkbY6D5HZBA5PKokq+J2Sd3f9alsm4A05+tYDerDAMElU
 E/Qg==
X-Gm-Message-State: ACrzQf0MBj3Yj6HR3EpfxHLHK7iRcDYVf9SaeFQl0W7hRNNWoRoMFkgc
 uDK7Dy+cBOC70BRcPWCeD2Nsij165X9Eyqtua6Q=
X-Google-Smtp-Source: AMsMyM7+UAKStju1/B50RTKX+u1jUgvZKIwZNg+/RjMpMI6Q1ZvQvv4nagqx0Yl2+KtLat4U1n2LhKr/1T2VTAGQJ/0=
X-Received: by 2002:a05:600c:4142:b0:3c6:eed5:847c with SMTP id
 h2-20020a05600c414200b003c6eed5847cmr5286886wmm.113.1666861259862; Thu, 27
 Oct 2022 02:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221025061846.447975-1-brolerliew@gmail.com>
 <CADnq5_NweAo-7snRLkidNkOizu7Ft+7GgXCS2Rnv1oxmRFb_RQ@mail.gmail.com>
 <a70dcda0-6723-38f6-efeb-e8edb16dab55@amd.com>
 <69e672a5-a68e-7bad-fc49-4281c1c6039d@amd.com>
 <9774ddd6-60d9-245c-77ac-59951c13b263@amd.com>
 <ac73b553-9173-4ac5-ef16-a95b8a8cd4f9@amd.com>
 <5bc35aea-466b-bd09-563e-f3e32796b83b@amd.com>
In-Reply-To: <5bc35aea-466b-bd09-563e-f3e32796b83b@amd.com>
From: broler Liew <brolerliew@gmail.com>
Date: Thu, 27 Oct 2022 17:00:48 +0800
Message-ID: <CAODyvyypneTxCDUgUNB0UCm+eZtKn_yLJRxZ8nh-kg2PUkaTjw@mail.gmail.com>
Subject: Re: [PATCH] drm/scheduler: set current_entity to next when remove
 from rq
To: Luben Tuikov <luben.tuikov@amd.com>
Content-Type: multipart/alternative; boundary="00000000000048b6f305ec00616f"
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000048b6f305ec00616f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's very nice of you-all to finger it out that it may crash when it is the
last entity in the list.   Absolutely I made a mistake about that.
But I still cannot understand why we need to restart the selection from the
list head when the current entity is removed from rq.
In drm_sched_rq_select_entity, starting from head may cause the first
entity to be selected more often than others, which breaks the equal rule
the scheduler wants to achieve.
Maybe the previous one is the better choice when current_entity =3D=3D enti=
ty?

Luben Tuikov <luben.tuikov@amd.com> =E4=BA=8E2022=E5=B9=B410=E6=9C=8827=E6=
=97=A5=E5=91=A8=E5=9B=9B 16:24=E5=86=99=E9=81=93=EF=BC=9A

> On 2022-10-27 04:19, Christian K=C3=B6nig wrote:
> > Am 27.10.22 um 10:07 schrieb Luben Tuikov:
> >> On 2022-10-27 03:01, Luben Tuikov wrote:
> >>> On 2022-10-25 13:50, Luben Tuikov wrote:
> >>>> Looking...
> >>>>
> >>>> Regards,
> >>>> Luben
> >>>>
> >>>> On 2022-10-25 09:35, Alex Deucher wrote:
> >>>>> + Luben
> >>>>>
> >>>>> On Tue, Oct 25, 2022 at 2:55 AM brolerliew <brolerliew@gmail.com>
> wrote:
> >>>>>> When entity move from one rq to another, current_entity will be se=
t
> to NULL
> >>>>>> if it is the moving entity. This make entities close to rq head go=
t
> >>>>>> selected more frequently, especially when doing load balance betwe=
en
> >>>>>> multiple drm_gpu_scheduler.
> >>>>>>
> >>>>>> Make current_entity to next when removing from rq.
> >>>>>>
> >>>>>> Signed-off-by: brolerliew <brolerliew@gmail.com>
> >>>>>> ---
> >>>>>>   drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
> >>>>>>   1 file changed, 3 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> >>>>>> index 2fab218d7082..00b22cc50f08 100644
> >>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >>>>>> @@ -168,10 +168,11 @@ void drm_sched_rq_remove_entity(struct
> drm_sched_rq *rq,
> >>>>>>          spin_lock(&rq->lock);
> >>>>>>
> >>>>>>          atomic_dec(rq->sched->score);
> >>>>>> -       list_del_init(&entity->list);
> >>>>>>
> >>>>>>          if (rq->current_entity =3D=3D entity)
> >>>>>> -               rq->current_entity =3D NULL;
> >>>>>> +               rq->current_entity =3D list_next_entry(entity, lis=
t);
> >>>>>> +
> >>>>>> +       list_del_init(&entity->list);
> >>>>>>
> >>>>>>          if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> >>>>>>                  drm_sched_rq_remove_fifo_locked(entity);
> >>>>>> --
> >>>>>> 2.34.1
> >>>>>>
> >>> Looks good. I'll pick it up into some other changes I've in tow, and
> repost
> >>> along with my changes, as they're somewhat related.
> >> Actually, the more I look at it, the more I think that we do want to s=
et
> >> rq->current_entity to NULL in that function, in order to pick the next
> best entity
> >> (or scheduler for that matter), the next time around. See
> sched_entity.c,
> >> and drm_sched_rq_select_entity() where we start evaluating from the
> _next_
> >> entity.
> >>
> >> So, it is best to leave it to set it to NULL, for now.
> >
> > Apart from that this patch here could cause a crash when the entity is
> > the last one in the list.
> >
> > In this case current current_entity would be set to an incorrect upcast
> > of the head of the list.
>
> Absolutely. I saw that, but in rejecting the patch, I didn't feel the nee=
d
> to mention it.
>
> Thanks for looking into this.
>
> Regards,
> Luben
>
>

--00000000000048b6f305ec00616f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It&#39;s very nice of you-all to finger it out that it may=
 crash when it is the last entity in the list.=C2=A0 =C2=A0Absolutely I mad=
e a mistake about=C2=A0that.<div>But I still cannot understand why we need =
to restart the selection from the list head when the current entity is=C2=
=A0removed from rq.</div><div>In drm_sched_rq_select_entity, starting from =
head may cause the first entity to be selected more often than others, whic=
h breaks the equal rule the scheduler wants to achieve.<br></div><div>Maybe=
 the previous one is the better choice when current_entity =3D=3D entity?</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">Luben Tuikov &lt;<a href=3D"mailto:luben.tuikov@amd.com">luben.tuikov@a=
md.com</a>&gt; =E4=BA=8E2022=E5=B9=B410=E6=9C=8827=E6=97=A5=E5=91=A8=E5=9B=
=9B 16:24=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On 2022-10-27 04:19, Christian K=C3=B6nig wrote:<br>
&gt; Am 27.10.22 um 10:07 schrieb Luben Tuikov:<br>
&gt;&gt; On 2022-10-27 03:01, Luben Tuikov wrote:<br>
&gt;&gt;&gt; On 2022-10-25 13:50, Luben Tuikov wrote:<br>
&gt;&gt;&gt;&gt; Looking...<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt; Luben<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 2022-10-25 09:35, Alex Deucher wrote:<br>
&gt;&gt;&gt;&gt;&gt; + Luben<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On Tue, Oct 25, 2022 at 2:55 AM brolerliew &lt;<a href=
=3D"mailto:brolerliew@gmail.com" target=3D"_blank">brolerliew@gmail.com</a>=
&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; When entity move from one rq to another, current_e=
ntity will be set to NULL<br>
&gt;&gt;&gt;&gt;&gt;&gt; if it is the moving entity. This make entities clo=
se to rq head got<br>
&gt;&gt;&gt;&gt;&gt;&gt; selected more frequently, especially when doing lo=
ad balance between<br>
&gt;&gt;&gt;&gt;&gt;&gt; multiple drm_gpu_scheduler.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Make current_entity to next when removing from rq.=
<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: brolerliew &lt;<a href=3D"mailto:br=
olerliew@gmail.com" target=3D"_blank">brolerliew@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0drivers/gpu/drm/scheduler/sched_main.c=
 | 5 +++--<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 2 del=
etions(-)<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/scheduler/sched_main.=
c b/drivers/gpu/drm/scheduler/sched_main.c<br>
&gt;&gt;&gt;&gt;&gt;&gt; index 2fab218d7082..00b22cc50f08 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/scheduler/sched_main.c<br>
&gt;&gt;&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/scheduler/sched_main.c<br>
&gt;&gt;&gt;&gt;&gt;&gt; @@ -168,10 +168,11 @@ void drm_sched_rq_remove_ent=
ity(struct drm_sched_rq *rq,<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock(&amp;r=
q-&gt;lock);<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atomic_dec(rq-&g=
t;sched-&gt;score);<br>
&gt;&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0list_del_init(&amp;ent=
ity-&gt;list);<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rq-&gt;curre=
nt_entity =3D=3D entity)<br>
&gt;&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0rq-&gt;current_entity =3D NULL;<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0rq-&gt;current_entity =3D list_next_entry(entity, list);<br>
&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0list_del_init(&amp;ent=
ity-&gt;list);<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (drm_sched_po=
licy =3D=3D DRM_SCHED_POLICY_FIFO)<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 drm_sched_rq_remove_fifo_locked(entity);<br>
&gt;&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt;&gt; 2.34.1<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; Looks good. I&#39;ll pick it up into some other changes I&#39;=
ve in tow, and repost<br>
&gt;&gt;&gt; along with my changes, as they&#39;re somewhat related.<br>
&gt;&gt; Actually, the more I look at it, the more I think that we do want =
to set<br>
&gt;&gt; rq-&gt;current_entity to NULL in that function, in order to pick t=
he next best entity<br>
&gt;&gt; (or scheduler for that matter), the next time around. See sched_en=
tity.c,<br>
&gt;&gt; and drm_sched_rq_select_entity() where we start evaluating from th=
e _next_<br>
&gt;&gt; entity.<br>
&gt;&gt;<br>
&gt;&gt; So, it is best to leave it to set it to NULL, for now.<br>
&gt; <br>
&gt; Apart from that this patch here could cause a crash when the entity is=
 <br>
&gt; the last one in the list.<br>
&gt; <br>
&gt; In this case current current_entity would be set to an incorrect upcas=
t <br>
&gt; of the head of the list.<br>
<br>
Absolutely. I saw that, but in rejecting the patch, I didn&#39;t feel the n=
eed to mention it.<br>
<br>
Thanks for looking into this.<br>
<br>
Regards,<br>
Luben<br>
<br>
</blockquote></div>

--00000000000048b6f305ec00616f--
