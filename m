Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAC67BBECC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 20:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3D310E012;
	Fri,  6 Oct 2023 18:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D09210E012
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 18:37:48 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-77063481352so282784785a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696617467; x=1697222267;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FUsZT6JR1mxAtln74G5fulu8ZsYfYM6u3bqPEQGHJks=;
 b=zEoZe1WQboFs6eRst/SFND6m/JU42JGfJRoBc18Ost/+Ph4TQEvdlX6rFnLmPmQniW
 iYCiG9g4CYDRHvjxVXojs3naFFzCo14l/+tY3TP/aHVLsfeUfbmHgx2gWIe3eHcKKeOe
 S9vgf1K+uVyx0FT4fmWD+yyhhlWo1JeZK+7LxYHhLCQ0pibuK+SFEoKO+pTEg/uji/Pe
 JDUQYEuF+/SPlKKxeyp0yrGKmI5/e5zIxtdQUqjUA7VSZhRxOCCCYNy+sjgymKZ5eYZN
 xJGejPWAnUb+MzcRTBtoD6jVMqQIJrC9U/pvrjsAoxEsslYjyEk4dexDRloFAoZ2tY96
 n4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696617467; x=1697222267;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FUsZT6JR1mxAtln74G5fulu8ZsYfYM6u3bqPEQGHJks=;
 b=fCbnWwlRVMi5xlDalnh3/8TTVxzP7WPZZRA9S5si0pKnxRr03R52alXTjzb52ulIf+
 rRsxB10aqMbWYhMDOpJOmaKJNssTPPuJDchaCig/J8A9nR41yxTrcdKoJppsAcyhhv22
 Pl3W57iu+qch/wpW3YFisIQZb8/hcFo3bRM6LZiUlLXcqE7ckCoo1qFRmQzzOTZa0jwb
 /Pjb/iC0qoiNpu00AAE/ACCNQmmsYeDzLKD1zHjv9n7liw5Y6CUwbKcb6uGEAoRzn5+G
 LDErmbOUPb3YHs2XdslWCLRLh1eljooHIEWOY7HJd/0hv6bc3CkjAIJ5TB/LuoCetL3V
 pZAw==
X-Gm-Message-State: AOJu0YxdsFrZ6/9GSSRHrv90KTciu7zDMdcrOwoflLjZweclAC1ecOK1
 1eKPxehvCrHdxJ9SlKviTVEQWQQVl+r7GQqwnUkuzw==
X-Google-Smtp-Source: AGHT+IG/eBBZI7Kyun6Vg1I49xej+UlhI6fkSfeOyMuLsXMQNQ3b7/C8pQCmeQs/lnSFHAA8BbHdJRIw4HcReN63ea8=
X-Received: by 2002:ad4:5f8e:0:b0:63d:8447:ddd with SMTP id
 jp14-20020ad45f8e000000b0063d84470dddmr6358120qvb.20.1696617467200; Fri, 06
 Oct 2023 11:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230921131201.157767-1-lma@semihalf.com>
 <20230922063410.23626-1-lma@semihalf.com>
 <CADmiTCTHn+XaNqkAZjLmaYUy+6bsb5chue97g3n0bKP7Lcf9_w@mail.gmail.com>
 <CAFJ_xboEqNFyG6+F0EkXq32X0Y8pPEWYFw9+7JJye42SrrOkWw@mail.gmail.com>
In-Reply-To: <CAFJ_xboEqNFyG6+F0EkXq32X0Y8pPEWYFw9+7JJye42SrrOkWw@mail.gmail.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Fri, 6 Oct 2023 11:37:35 -0700
Message-ID: <CAMNLLoQfvrXygb2Lzm2tudf0GMUn11K3pRT-JJ==MX192HQ2RQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/dp_mst: Fix NULL deref in
 get_mst_branch_device_by_guid_helper()
To: Lukasz Majczak <lma@semihalf.com>
Content-Type: multipart/alternative; boundary="000000000000742fc4060710898f"
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
Cc: upstream@semihalf.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000742fc4060710898f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Lukasz for the patch, looks like it is reviewed by.
@daniel@ffwll.ch <daniel@ffwll.ch>  or @airlied@gmail.com
<airlied@gmail.com> , could any of you ack this as well, so I can go ahead
and push this to drm-misc-fixes branch?

Regards
Manasi

On Thu, Oct 5, 2023 at 6:35=E2=80=AFAM Lukasz Majczak <lma@semihalf.com> wr=
ote:

> wt., 26 wrz 2023 o 16:01 Rados=C5=82aw Biernacki <rad@chromium.org> napis=
a=C5=82(a):
> >
> > On Fri, Sep 22, 2023 at 8:34=E2=80=AFAM Lukasz Majczak <lma@semihalf.co=
m> wrote:
> > >
> > > As drm_dp_get_mst_branch_device_by_guid() is called from
> > > drm_dp_get_mst_branch_device_by_guid(), mstb parameter has to be
> checked,
> > > otherwise NULL dereference may occur in the call to
> > > the memcpy() and cause following:
> > >
> > > [12579.365869] BUG: kernel NULL pointer dereference, address:
> 0000000000000049
> > > [12579.365878] #PF: supervisor read access in kernel mode
> > > [12579.365880] #PF: error_code(0x0000) - not-present page
> > > [12579.365882] PGD 0 P4D 0
> > > [12579.365887] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > > ...
> > > [12579.365895] Workqueue: events_long drm_dp_mst_up_req_work
> > > [12579.365899] RIP: 0010:memcmp+0xb/0x29
> > > [12579.365921] Call Trace:
> > > [12579.365927] get_mst_branch_device_by_guid_helper+0x22/0x64
> > > [12579.365930] drm_dp_mst_up_req_work+0x137/0x416
> > > [12579.365933] process_one_work+0x1d0/0x419
> > > [12579.365935] worker_thread+0x11a/0x289
> > > [12579.365938] kthread+0x13e/0x14f
> > > [12579.365941] ? process_one_work+0x419/0x419
> > > [12579.365943] ? kthread_blkcg+0x31/0x31
> > > [12579.365946] ret_from_fork+0x1f/0x30
> > >
> > > As get_mst_branch_device_by_guid_helper() is recursive, moving
> condition
> > > to the first line allow to remove a similar one for step over of NULL
> elements
> > > inside a loop.
> > >
> > > Fixes: 5e93b8208d3c ("drm/dp/mst: move GUID storage from mgr, port to
> only mst branch")
> > > Cc: <stable@vger.kernel.org> # 4.14+
> > > Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> > > ---
> > >
> > > v2->v3:
> > > * Fixed patch description.
> > >
> > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > index ed96cfcfa304..8c929ef72c72 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > @@ -2574,14 +2574,14 @@ static struct drm_dp_mst_branch
> *get_mst_branch_device_by_guid_helper(
> > >         struct drm_dp_mst_branch *found_mstb;
> > >         struct drm_dp_mst_port *port;
> > >
> > > +       if (!mstb)
> > > +               return NULL;
> > > +
> > >         if (memcmp(mstb->guid, guid, 16) =3D=3D 0)
> > >                 return mstb;
> > >
> > >
> > >         list_for_each_entry(port, &mstb->ports, next) {
> > > -               if (!port->mstb)
> > > -                       continue;
> > > -
> > >                 found_mstb =3D
> get_mst_branch_device_by_guid_helper(port->mstb, guid);
> > >
> > >                 if (found_mstb)
> > > --
> > > 2.42.0.515.g380fc7ccd1-goog
> > >
> >
> > Reviewed-by: Radoslaw Biernacki <rad@chromium.org>
>
> Hi,
>
> Is there anything more I should do with this patch?
>
> Thanks,
> Lukasz
>

--000000000000742fc4060710898f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Lukasz for the patch, looks like it is reviewed by.=
<div><a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=3D"mailto:dan=
iel@ffwll.ch" tabindex=3D"-1">@daniel@ffwll.ch</a>=C2=A0 or=C2=A0<a class=
=3D"gmail_plusreply" id=3D"plusReplyChip-1" href=3D"mailto:airlied@gmail.co=
m" tabindex=3D"-1">@airlied@gmail.com</a>=C2=A0, could any of you ack this =
as well, so I can go ahead and push this to drm-misc-fixes branch?<br></div=
><div><br></div><div>Regards</div><div>Manasi</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 5, 2023 at 6=
:35=E2=80=AFAM Lukasz Majczak &lt;<a href=3D"mailto:lma@semihalf.com">lma@s=
emihalf.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">wt., 26 wrz 2023 o 16:01 Rados=C5=82aw Biernacki &lt;<a href=3D"=
mailto:rad@chromium.org" target=3D"_blank">rad@chromium.org</a>&gt; napisa=
=C5=82(a):<br>
&gt;<br>
&gt; On Fri, Sep 22, 2023 at 8:34=E2=80=AFAM Lukasz Majczak &lt;<a href=3D"=
mailto:lma@semihalf.com" target=3D"_blank">lma@semihalf.com</a>&gt; wrote:<=
br>
&gt; &gt;<br>
&gt; &gt; As drm_dp_get_mst_branch_device_by_guid() is called from<br>
&gt; &gt; drm_dp_get_mst_branch_device_by_guid(), mstb parameter has to be =
checked,<br>
&gt; &gt; otherwise NULL dereference may occur in the call to<br>
&gt; &gt; the memcpy() and cause following:<br>
&gt; &gt;<br>
&gt; &gt; [12579.365869] BUG: kernel NULL pointer dereference, address: 000=
0000000000049<br>
&gt; &gt; [12579.365878] #PF: supervisor read access in kernel mode<br>
&gt; &gt; [12579.365880] #PF: error_code(0x0000) - not-present page<br>
&gt; &gt; [12579.365882] PGD 0 P4D 0<br>
&gt; &gt; [12579.365887] Oops: 0000 [#1] PREEMPT SMP NOPTI<br>
&gt; &gt; ...<br>
&gt; &gt; [12579.365895] Workqueue: events_long drm_dp_mst_up_req_work<br>
&gt; &gt; [12579.365899] RIP: 0010:memcmp+0xb/0x29<br>
&gt; &gt; [12579.365921] Call Trace:<br>
&gt; &gt; [12579.365927] get_mst_branch_device_by_guid_helper+0x22/0x64<br>
&gt; &gt; [12579.365930] drm_dp_mst_up_req_work+0x137/0x416<br>
&gt; &gt; [12579.365933] process_one_work+0x1d0/0x419<br>
&gt; &gt; [12579.365935] worker_thread+0x11a/0x289<br>
&gt; &gt; [12579.365938] kthread+0x13e/0x14f<br>
&gt; &gt; [12579.365941] ? process_one_work+0x419/0x419<br>
&gt; &gt; [12579.365943] ? kthread_blkcg+0x31/0x31<br>
&gt; &gt; [12579.365946] ret_from_fork+0x1f/0x30<br>
&gt; &gt;<br>
&gt; &gt; As get_mst_branch_device_by_guid_helper() is recursive, moving co=
ndition<br>
&gt; &gt; to the first line allow to remove a similar one for step over of =
NULL elements<br>
&gt; &gt; inside a loop.<br>
&gt; &gt;<br>
&gt; &gt; Fixes: 5e93b8208d3c (&quot;drm/dp/mst: move GUID storage from mgr=
, port to only mst branch&quot;)<br>
&gt; &gt; Cc: &lt;<a href=3D"mailto:stable@vger.kernel.org" target=3D"_blan=
k">stable@vger.kernel.org</a>&gt; # 4.14+<br>
&gt; &gt; Signed-off-by: Lukasz Majczak &lt;<a href=3D"mailto:lma@semihalf.=
com" target=3D"_blank">lma@semihalf.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;<br>
&gt; &gt; v2-&gt;v3:<br>
&gt; &gt; * Fixed patch description.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 drivers/gpu/drm/display/drm_dp_mst_topology.c | 6 +++---<br=
>
&gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/driv=
ers/gpu/drm/display/drm_dp_mst_topology.c<br>
&gt; &gt; index ed96cfcfa304..8c929ef72c72 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c<br>
&gt; &gt; @@ -2574,14 +2574,14 @@ static struct drm_dp_mst_branch *get_mst_=
branch_device_by_guid_helper(<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_dp_mst_branch *found_=
mstb;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_dp_mst_port *port;<br=
>
&gt; &gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mstb)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NU=
LL;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (memcmp(mstb-&gt;guid, guid, =
16) =3D=3D 0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn mstb;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(port, &amp;m=
stb-&gt;ports, next) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!port=
-&gt;mstb)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0foun=
d_mstb =3D get_mst_branch_device_by_guid_helper(port-&gt;mstb, guid);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
found_mstb)<br>
&gt; &gt; --<br>
&gt; &gt; 2.42.0.515.g380fc7ccd1-goog<br>
&gt; &gt;<br>
&gt;<br>
&gt; Reviewed-by: Radoslaw Biernacki &lt;<a href=3D"mailto:rad@chromium.org=
" target=3D"_blank">rad@chromium.org</a>&gt;<br>
<br>
Hi,<br>
<br>
Is there anything more I should do with this patch?<br>
<br>
Thanks,<br>
Lukasz<br>
</blockquote></div>

--000000000000742fc4060710898f--
