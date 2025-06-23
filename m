Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE34AE4B83
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 18:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3228010E041;
	Mon, 23 Jun 2025 16:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h9bcefJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F4E10E1E3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 16:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750697903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MTfnmAglZFDkBEo3gK20ns+HBnzxFNQ6DQ2hm1nHy5c=;
 b=h9bcefJ/nIA8cRZBR8L8+mac2x8f8IrpQu8qhqUu/22gdwWlVX2shz3mvZb/U+h1Fq1TAS
 Sh12QbR4dcQFPNEeVpFmLNMP5og+TTOcI6IPKol0DhPvWJ6UYyCNbID31LtXVw0ILchZvv
 R+XETVSvHbJN8Hxx8XTa4GKCzimgAkQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-rai8JOFVPp-ysNJANWZhqw-1; Mon, 23 Jun 2025 12:58:21 -0400
X-MC-Unique: rai8JOFVPp-ysNJANWZhqw-1
X-Mimecast-MFC-AGG-ID: rai8JOFVPp-ysNJANWZhqw_1750697901
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-7111ff9c057so59902397b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 09:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750697901; x=1751302701;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MTfnmAglZFDkBEo3gK20ns+HBnzxFNQ6DQ2hm1nHy5c=;
 b=WOVauDM6yRpkP5lyYr7F+kJPwyH7dEVkipwOEQtPK2k6xsMQb/VXMJ8wkgBcnLebIx
 6fWLk82+VxYiRWLPRdwpgUwE6EBpF2rFvXdUCcRkyzMrwAgJEr74lVMe9lBoLvvQYxmm
 U2j9IsfDDSbU7hTNcGzHDouCXSiHPFRSEcShvYhr6gntxcpb0qsDeGFQliWgy/wbeI/Y
 3vfOiqVOQHv/Bi9EjHB2YgphHSlVj6mFtvGW/BP0vvIoU1pWCrJfBC+NTTId+bBFv5mr
 +tCaGw5SBKIMIDmiuD5JQGvk0uz0yoO8qrh23u9L1oPh2l3eV+qcMGztPJKEihtb6wZd
 eVTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQeHinS0Y0FvX/sRzlVxzEHCUtVDldxVLfQa0NeJZQ91T5Az9IOTZF0yNOqWyUU+as8nwgq3toIbA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx25f/zA6uSpC3GcNMDUN9W/lkyIKEPGONp+K1n8kg3jQuNcOwS
 xnF2fC99oYQCaIihhOnNWELn1rvNKxD/AxfVtkDFTK+SnpEZ2UZgfwN9HlywJu49wpX0f0Y26oa
 PsEiA7fp2+erwTNsB/I0A97LiDj2PqmzpMaDuGU4ZYhjUz5+3FWlA+T2KitkZ6lNSHRzVGMvfxV
 wru+T2oudPvuqeQhCttvY8W6sVzCCr3SR8dYcP6RGNQlDS
X-Gm-Gg: ASbGnct073nPw3OOkm63o8Ipen8uu9QMFsmKMCFhGYFjBzT+xr7DLb2UE5w5ArijjPb
 6H9+gdBXq9GDYVKd+e465TmpJuykUkgdRjge+ldTS3E8qbnCU404d+7tZRIzisTfYDXdW8yANqc
 8DNg==
X-Received: by 2002:a05:690c:480a:b0:710:e4c4:a938 with SMTP id
 00721157ae682-712c675ccdemr189056967b3.38.1750697900693; 
 Mon, 23 Jun 2025 09:58:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH7BoXvt6otSCCZ3AWrWzDi4F7Rau1Nse5bLUhpgl6FLSoy66YUklP0RkVdmxIQSuqCdUsxnjgCaOxMItX9JA=
X-Received: by 2002:a05:690c:480a:b0:710:e4c4:a938 with SMTP id
 00721157ae682-712c675ccdemr189056607b3.38.1750697900153; Mon, 23 Jun 2025
 09:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250612081834.GA248237@francesco-nb>
 <CAN9Xe3RFEXZuWTZB5E1tJdjXc9o_hB1ArgA5SvqbDUBkwYea8w@mail.gmail.com>
 <20250618105158.06e42668@booty>
 <20250618-fantastic-brown-elephant-df0ae4@houat>
 <CAN9Xe3RpkBx8k+=VqDFh1n+-35gHM_L3UQvCJH58bBPF6pPuuA@mail.gmail.com>
 <CAN9Xe3R96sTf911-n4iX=PME1zfO4Z+XojQSyK4OF8qw7vL7hA@mail.gmail.com>
 <20250619-ubiquitous-annoying-tamarin-bbfdad@houat>
In-Reply-To: <20250619-ubiquitous-annoying-tamarin-bbfdad@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Mon, 23 Jun 2025 11:56:59 -0500
X-Gm-Features: Ac12FXzdUDQpc42O2pnsG2CugIOc_OCqPAOZ6gq7OawOWG7nInu1BxtWbDz1-x4
Message-ID: <CAN9Xe3T_e2WhiX6Y7TQDMYvHo5aVp_qibfSTuemR4mCbMNJ+bg@mail.gmail.com>
Subject: Re: drm/panel/panel-simple v6.16-rc1 WARNING regression
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Francesco Dolcini <francesco@dolcini.it>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lk7KhQwcWFoLNQ3grAkbPKqmCyiX8ITwMNkyClC6KzA_1750697901
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000072b04e0638401efc"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000072b04e0638401efc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 7:08=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:

> On Wed, Jun 18, 2025 at 04:45:31PM -0400, Anusha Srivatsa wrote:
> > On Wed, Jun 18, 2025 at 11:48=E2=80=AFAM Anusha Srivatsa <asrivats@redh=
at.com>
> > wrote:
> > > On Wed, Jun 18, 2025 at 4:23=E2=80=AFAM Maxime Ripard <mripard@kernel=
.org>
> wrote:
> > >
> > >> On Wed, Jun 18, 2025 at 10:51:58AM +0200, Luca Ceresoli wrote:
> > >> > Hello Anusha, Francesco,
> > >> >
> > >> > On Tue, 17 Jun 2025 11:17:20 -0500
> > >> > Anusha Srivatsa <asrivats@redhat.com> wrote:
> > >> >
> > >> > > On Thu, Jun 12, 2025 at 3:24=E2=80=AFAM Francesco Dolcini <
> > >> francesco@dolcini.it>
> > >> > > wrote:
> > >> > >
> > >> > > > Hello all,
> > >> > > >
> > >> > > > Commit de04bb0089a9 ("drm/panel/panel-simple: Use the new
> > >> allocation in
> > >> > > > place of devm_kzalloc()")
> > >> > > > from 6.16-rc1 introduced a regression with this warning during
> probe
> > >> > > > with panel dpi described in the DT.
> > >> > > >
> > >> > > > A revert solves the issue.
> > >> > > >
> > >> > > > The issue is that connector_type is set to
> DRM_MODE_CONNECTOR_DPI in
> > >> > > > panel_dpi_probe() that after that change is called after
> > >> > > > devm_drm_panel_alloc().
> > >> > > >
> > >> > > > I am not sure if there are other implication for this change i=
n
> the
> > >> call
> > >> > > > ordering, apart the one that triggers this warning.
> > >> > > >
> > >> > > > [   12.089274] ------------[ cut here ]------------
> > >> > > > [   12.089303] WARNING: CPU: 0 PID: 96 at
> > >> > > > drivers/gpu/drm/bridge/panel.c:377
> devm_drm_of_get_bridge+0xac/0xb8
> > >> > > > [   12.130808] Modules linked in: v4l2_jpeg pwm_imx27(+)
> imx_vdoa
> > >> > > > gpu_sched panel_simple imx6_media(C) imx_media_common
> > >> > > > (C) videobuf2_dma_contig pwm_bl gpio_keys v4l2_mem2mem fuse ip=
v6
> > >> autofs4
> > >> > > > [   12.147774] CPU: 0 UID: 0 PID: 96 Comm: kworker/u8:3
> Tainted: G
> > >> > > >  C          6.16.0-rc1+ #1 PREEMPT
> > >> > > > [   12.157446] Tainted: [C]=3DCRAP
> > >> > > > [   12.160418] Hardware name: Freescale i.MX6 Quad/DualLite
> (Device
> > >> Tree)
> > >> > > > [   12.166953] Workqueue: events_unbound
> deferred_probe_work_func
> > >> > > > [   12.172805] Call trace:
> > >> > > > [   12.172815]  unwind_backtrace from show_stack+0x10/0x14
> > >> > > > [   12.180598]  show_stack from dump_stack_lvl+0x68/0x74
> > >> > > > [   12.185674]  dump_stack_lvl from __warn+0x7c/0xe0
> > >> > > > [   12.190407]  __warn from warn_slowpath_fmt+0x1b8/0x1c0
> > >> > > > [   12.195567]  warn_slowpath_fmt from
> > >> devm_drm_of_get_bridge+0xac/0xb8
> > >> > > > [   12.201949]  devm_drm_of_get_bridge from
> imx_pd_probe+0x58/0x164
> > >> > > > [   12.207976]  imx_pd_probe from platform_probe+0x5c/0xb0
> > >> > > > [   12.213220]  platform_probe from really_probe+0xd0/0x3a4
> > >> > > > [   12.218551]  really_probe from
> __driver_probe_device+0x8c/0x1d4
> > >> > > > [   12.224486]  __driver_probe_device from
> > >> driver_probe_device+0x30/0xc0
> > >> > > > [   12.230942]  driver_probe_device from
> > >> __device_attach_driver+0x98/0x10c
> > >> > > > [   12.237572]  __device_attach_driver from
> > >> bus_for_each_drv+0x90/0xe4
> > >> > > > [   12.243854]  bus_for_each_drv from __device_attach+0xa8/0x1=
c8
> > >> > > > [   12.249614]  __device_attach from bus_probe_device+0x88/0x8=
c
> > >> > > > [   12.255285]  bus_probe_device from
> > >> deferred_probe_work_func+0x8c/0xcc
> > >> > > > [   12.261739]  deferred_probe_work_func from
> > >> process_one_work+0x154/0x2dc
> > >> > > > [   12.268371]  process_one_work from worker_thread+0x250/0x3f=
0
> > >> > > > [   12.274043]  worker_thread from kthread+0x12c/0x24c
> > >> > > > [   12.278940]  kthread from ret_from_fork+0x14/0x28
> > >> > > > [   12.283660] Exception stack(0xd0be9fb0 to 0xd0be9ff8)
> > >> > > > [   12.288720] 9fa0:
>  00000000
> > >> 00000000
> > >> > > > 00000000 00000000
> > >> > > > [   12.296906] 9fc0: 00000000 00000000 00000000 00000000
> 00000000
> > >> 00000000
> > >> > > > 00000000 00000000
> > >> > > > [   12.305089] 9fe0: 00000000 00000000 00000000 00000000
> 00000013
> > >> 00000000
> > >> > > > [   12.312050] ---[ end trace 0000000000000000 ]---
> > >> > > >
> > >> > > > #regzbot ^introduced: de04bb0089a96cc00d13b12cbf66a088befe3057
> > >> > > >
> > >> > > > Any advise?
> > >> > > >
> > >> > > > Hey Francesco!
> > >> > >
> > >> > > This mail reached my spam and I hadn't realised till today.
> Thanks for
> > >> > > bringing this to attention.
> > >> > >
> > >> > > Thinking out loud here: If we called dpi_probe() before
> allocating the
> > >> > > panel using devm_drm_panel_alloc()
> > >> > > then we would have the connector type. But  dpi_probe() needs th=
e
> > >> panel to
> > >> > > be allocated....
> > >> >
> > >> > Reading the panel-simple.c code, the handling of the panel_dsi
> > >> > descriptor feels a bit hacky, and the recent change to
> > >> > devm_drm_panel_alloc() breaks it easily. Perhaps it would be
> cleaner to
> > >> > assess the whole descriptor before ding any allocation/init.
> > >> >
> > >> > You're right tat panel_dpi_probe() needs the panel, but it's only
> at the
> > >> > very end, to assign the descriptor:
> > >> >
> > >> >   panel->desc =3D desc;
> > >> >
> > >> > I think a good fix would be to clean it up by having:
> > >> >
> > >> >  * panel_dpi_probe() not take a panel pointer but rather returning=
 a
> > >> >    filled descriptor
> > >> >  * panel_simple_probe() call panel_dpi_probe() early [before
> > >> >    devm_drm_panel_alloc()] and get the filled descriptor
> > >> >  * call devm_drm_panel_alloc() with that descriptor in the panel-d=
si
> > >> >    case, or with the good old descriptor otherwise
> > >> >
> > >> > As a good side effect, it would get rid of a case where
> > >> > devm_drm_panel_alloc() is called with a Unknown connector type.
> > >> >
> > >> > Anusha, does it look like a good plan?
> > >>
> > >> It is, and I'd even go one step further. Like you said,
> panel_dpi_probe
> > >> kind of exists to allocate and initialize the panel descriptor, and =
is
> > >> called on the descriptor being equal to the (uninitialized) panel_dp=
i
> > >> global variable.
> > >>
> > >> We should also get rid of that hack, so do something like creating a
> > >> function that returns the descriptor, and is indeed called first in
> > >> panel_simple_probe. It first calls of_device_get_match_data(), and i=
f
> > >> there's no match, and if the device is compatible with panel-dpi, th=
en
> > >> it calls panel_dpi_probe (we should probably change that name too).
> That
> > >> way, we can get rid of the panel_dpi variable entirely.
> > >>
> > >>
> > > Thanks Luca and Maxime.
> > > To summarize:
> > > 1. add a function like of_device_get_simple_dsi_match_data() which
> calls
> > > of_device_get_match_data(). if the device is compatible with panel-dp=
i,
> > > call
> > > panel-dpi-probe()
> > > 3. Change panel_dpi_probe() to return the panel descriptor
> > > 4. call devm_drm_panel_alloc()
> > >
> > >
> > Looking deeper it looks like I have some gaps in my understanding.
> > panel_simple_platform_probe()
> > already checks of_device_get_match_data() to call panel_simple_probe().
> At
> > this point the change suggested is
> > to have to call it again to check if it is compatible with panel-dpi? I=
f
> I
> > understand correctly panel_dpi is a fallback
> > and the only place the decision to probe panel_dpi() is with the hack.
>
> I'm sure you can figure something out. And feel free to send me patches
> for a private review if you feel more comfortable that way.
>
>
Sure!
@Francesco Dolcini <francesco@dolcini.it>  Sending a fix with needed code
reorder in a  day or two.

Anusha

> Maxime
>

--00000000000072b04e0638401efc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 19,=
 2025 at 7:08=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel=
.org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Wed, Jun 18, 2025 at 04:45:31PM -0400, Anusha Sr=
ivatsa wrote:<br>
&gt; On Wed, Jun 18, 2025 at 11:48=E2=80=AFAM Anusha Srivatsa &lt;<a href=
=3D"mailto:asrivats@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&g=
t;<br>
&gt; wrote:<br>
&gt; &gt; On Wed, Jun 18, 2025 at 4:23=E2=80=AFAM Maxime Ripard &lt;<a href=
=3D"mailto:mripard@kernel.org" target=3D"_blank">mripard@kernel.org</a>&gt;=
 wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; On Wed, Jun 18, 2025 at 10:51:58AM +0200, Luca Ceresoli wrote=
:<br>
&gt; &gt;&gt; &gt; Hello Anusha, Francesco,<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; On Tue, 17 Jun 2025 11:17:20 -0500<br>
&gt; &gt;&gt; &gt; Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.co=
m" target=3D"_blank">asrivats@redhat.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; On Thu, Jun 12, 2025 at 3:24=E2=80=AFAM Francesco D=
olcini &lt;<br>
&gt; &gt;&gt; <a href=3D"mailto:francesco@dolcini.it" target=3D"_blank">fra=
ncesco@dolcini.it</a>&gt;<br>
&gt; &gt;&gt; &gt; &gt; wrote:<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; Hello all,<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; Commit de04bb0089a9 (&quot;drm/panel/panel-sim=
ple: Use the new<br>
&gt; &gt;&gt; allocation in<br>
&gt; &gt;&gt; &gt; &gt; &gt; place of devm_kzalloc()&quot;)<br>
&gt; &gt;&gt; &gt; &gt; &gt; from 6.16-rc1 introduced a regression with thi=
s warning during probe<br>
&gt; &gt;&gt; &gt; &gt; &gt; with panel dpi described in the DT.<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; A revert solves the issue.<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; The issue is that connector_type is set to DRM=
_MODE_CONNECTOR_DPI in<br>
&gt; &gt;&gt; &gt; &gt; &gt; panel_dpi_probe() that after that change is ca=
lled after<br>
&gt; &gt;&gt; &gt; &gt; &gt; devm_drm_panel_alloc().<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; I am not sure if there are other implication f=
or this change in the<br>
&gt; &gt;&gt; call<br>
&gt; &gt;&gt; &gt; &gt; &gt; ordering, apart the one that triggers this war=
ning.<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.089274] ------------[ cut her=
e ]------------<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.089303] WARNING: CPU: 0 PID: =
96 at<br>
&gt; &gt;&gt; &gt; &gt; &gt; drivers/gpu/drm/bridge/panel.c:377 devm_drm_of=
_get_bridge+0xac/0xb8<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.130808] Modules linked in: v4=
l2_jpeg pwm_imx27(+) imx_vdoa<br>
&gt; &gt;&gt; &gt; &gt; &gt; gpu_sched panel_simple imx6_media(C) imx_media=
_common<br>
&gt; &gt;&gt; &gt; &gt; &gt; (C) videobuf2_dma_contig pwm_bl gpio_keys v4l2=
_mem2mem fuse ipv6<br>
&gt; &gt;&gt; autofs4<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.147774] CPU: 0 UID: 0 PID: 96=
 Comm: kworker/u8:3 Tainted: G<br>
&gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 C=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6.16=
.0-rc1+ #1 PREEMPT<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.157446] Tainted: [C]=3DCRAP<b=
r>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.160418] Hardware name: Freesc=
ale i.MX6 Quad/DualLite (Device<br>
&gt; &gt;&gt; Tree)<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.166953] Workqueue: events_unb=
ound deferred_probe_work_func<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.172805] Call trace:<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.172815]=C2=A0 unwind_backtrac=
e from show_stack+0x10/0x14<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.180598]=C2=A0 show_stack from=
 dump_stack_lvl+0x68/0x74<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.185674]=C2=A0 dump_stack_lvl =
from __warn+0x7c/0xe0<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.190407]=C2=A0 __warn from war=
n_slowpath_fmt+0x1b8/0x1c0<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.195567]=C2=A0 warn_slowpath_f=
mt from<br>
&gt; &gt;&gt; devm_drm_of_get_bridge+0xac/0xb8<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.201949]=C2=A0 devm_drm_of_get=
_bridge from imx_pd_probe+0x58/0x164<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.207976]=C2=A0 imx_pd_probe fr=
om platform_probe+0x5c/0xb0<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.213220]=C2=A0 platform_probe =
from really_probe+0xd0/0x3a4<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.218551]=C2=A0 really_probe fr=
om __driver_probe_device+0x8c/0x1d4<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.224486]=C2=A0 __driver_probe_=
device from<br>
&gt; &gt;&gt; driver_probe_device+0x30/0xc0<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.230942]=C2=A0 driver_probe_de=
vice from<br>
&gt; &gt;&gt; __device_attach_driver+0x98/0x10c<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.237572]=C2=A0 __device_attach=
_driver from<br>
&gt; &gt;&gt; bus_for_each_drv+0x90/0xe4<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.243854]=C2=A0 bus_for_each_dr=
v from __device_attach+0xa8/0x1c8<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.249614]=C2=A0 __device_attach=
 from bus_probe_device+0x88/0x8c<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.255285]=C2=A0 bus_probe_devic=
e from<br>
&gt; &gt;&gt; deferred_probe_work_func+0x8c/0xcc<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.261739]=C2=A0 deferred_probe_=
work_func from<br>
&gt; &gt;&gt; process_one_work+0x154/0x2dc<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.268371]=C2=A0 process_one_wor=
k from worker_thread+0x250/0x3f0<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.274043]=C2=A0 worker_thread f=
rom kthread+0x12c/0x24c<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.278940]=C2=A0 kthread from re=
t_from_fork+0x14/0x28<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.283660] Exception stack(0xd0b=
e9fb0 to 0xd0be9ff8)<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.288720] 9fa0:=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A000000000<br>
&gt; &gt;&gt; 00000000<br>
&gt; &gt;&gt; &gt; &gt; &gt; 00000000 00000000<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.296906] 9fc0: 00000000 000000=
00 00000000 00000000 00000000<br>
&gt; &gt;&gt; 00000000<br>
&gt; &gt;&gt; &gt; &gt; &gt; 00000000 00000000<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.305089] 9fe0: 00000000 000000=
00 00000000 00000000 00000013<br>
&gt; &gt;&gt; 00000000<br>
&gt; &gt;&gt; &gt; &gt; &gt; [=C2=A0 =C2=A012.312050] ---[ end trace 000000=
0000000000 ]---<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; #regzbot ^introduced: de04bb0089a96cc00d13b12c=
bf66a088befe3057<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; Any advise?<br>
&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; &gt; Hey Francesco!<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; This mail reached my spam and I hadn&#39;t realised=
 till today. Thanks for<br>
&gt; &gt;&gt; &gt; &gt; bringing this to attention.<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; Thinking out loud here: If we called dpi_probe() be=
fore allocating the<br>
&gt; &gt;&gt; &gt; &gt; panel using devm_drm_panel_alloc()<br>
&gt; &gt;&gt; &gt; &gt; then we would have the connector type. But=C2=A0 dp=
i_probe() needs the<br>
&gt; &gt;&gt; panel to<br>
&gt; &gt;&gt; &gt; &gt; be allocated....<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Reading the panel-simple.c code, the handling of the pan=
el_dsi<br>
&gt; &gt;&gt; &gt; descriptor feels a bit hacky, and the recent change to<b=
r>
&gt; &gt;&gt; &gt; devm_drm_panel_alloc() breaks it easily. Perhaps it woul=
d be cleaner to<br>
&gt; &gt;&gt; &gt; assess the whole descriptor before ding any allocation/i=
nit.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; You&#39;re right tat panel_dpi_probe() needs the panel, =
but it&#39;s only at the<br>
&gt; &gt;&gt; &gt; very end, to assign the descriptor:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0panel-&gt;desc =3D desc;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; I think a good fix would be to clean it up by having:<br=
>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;=C2=A0 * panel_dpi_probe() not take a panel pointer but r=
ather returning a<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 filled descriptor<br>
&gt; &gt;&gt; &gt;=C2=A0 * panel_simple_probe() call panel_dpi_probe() earl=
y [before<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 devm_drm_panel_alloc()] and get the filled =
descriptor<br>
&gt; &gt;&gt; &gt;=C2=A0 * call devm_drm_panel_alloc() with that descriptor=
 in the panel-dsi<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 case, or with the good old descriptor other=
wise<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; As a good side effect, it would get rid of a case where<=
br>
&gt; &gt;&gt; &gt; devm_drm_panel_alloc() is called with a Unknown connecto=
r type.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Anusha, does it look like a good plan?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; It is, and I&#39;d even go one step further. Like you said, p=
anel_dpi_probe<br>
&gt; &gt;&gt; kind of exists to allocate and initialize the panel descripto=
r, and is<br>
&gt; &gt;&gt; called on the descriptor being equal to the (uninitialized) p=
anel_dpi<br>
&gt; &gt;&gt; global variable.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; We should also get rid of that hack, so do something like cre=
ating a<br>
&gt; &gt;&gt; function that returns the descriptor, and is indeed called fi=
rst in<br>
&gt; &gt;&gt; panel_simple_probe. It first calls of_device_get_match_data()=
, and if<br>
&gt; &gt;&gt; there&#39;s no match, and if the device is compatible with pa=
nel-dpi, then<br>
&gt; &gt;&gt; it calls panel_dpi_probe (we should probably change that name=
 too). That<br>
&gt; &gt;&gt; way, we can get rid of the panel_dpi variable entirely.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt; Thanks Luca and Maxime.<br>
&gt; &gt; To summarize:<br>
&gt; &gt; 1. add a function like of_device_get_simple_dsi_match_data() whic=
h calls<br>
&gt; &gt; of_device_get_match_data(). if the device is compatible with pane=
l-dpi,<br>
&gt; &gt; call<br>
&gt; &gt; panel-dpi-probe()<br>
&gt; &gt; 3. Change panel_dpi_probe() to return the panel descriptor<br>
&gt; &gt; 4. call devm_drm_panel_alloc()<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; Looking deeper it looks like I have some gaps in my understanding.<br>
&gt; panel_simple_platform_probe()<br>
&gt; already checks of_device_get_match_data() to call panel_simple_probe()=
. At<br>
&gt; this point the change suggested is<br>
&gt; to have to call it again to check if it is compatible with panel-dpi? =
If I<br>
&gt; understand correctly panel_dpi is a fallback<br>
&gt; and the only place the decision to probe panel_dpi() is with the hack.=
<br>
<br>
I&#39;m sure you can figure something out. And feel free to send me patches=
<br>
for a private review if you feel more comfortable that way.<br>
<br></blockquote><div><br></div><div>Sure!</div><div><a class=3D"gmail_plus=
reply" id=3D"plusReplyChip-0" href=3D"mailto:francesco@dolcini.it" tabindex=
=3D"-1">@Francesco Dolcini</a>=C2=A0 Sending a fix with needed code reorder=
 in a=C2=A0 day or two.</div><div><br></div><div>Anusha <br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Maxime<br>
</blockquote></div></div>

--00000000000072b04e0638401efc--

