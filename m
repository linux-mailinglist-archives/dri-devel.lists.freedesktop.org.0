Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 142557ADAC1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817E310E25F;
	Mon, 25 Sep 2023 14:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9788B10E25F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 14:57:24 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6c0e8345c1eso4117763a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 07:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695653844; x=1696258644; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O40XcCcHAsas1mpr+dRj0K7q2EqizN+rIJm4VTmzi9I=;
 b=fNWXG3K7wCvPyC9NomxEia90CEXhZvqSGJYE9PAYlsDAmc77Bx5w0PndylWQXAoiC6
 iqNcO+AobcgQ+sRRJvrgxb5HzLzBmbqOVBgaPx2OtKb7LUap4D/CSYzINkiMV7fbmQpj
 RXZpdRACUBPVwfsWe5luMOyTNNUkEhOuiQN06R1iSIAIGmWLHOUmq2D8ERgRWdbpA7I8
 kuH0i/M2sceFugMDP/OBXglLNVPMcIELBQh0ZjG+ouDbB+2v8cLNQHJZGHs4OcvyMAjY
 hsmwfy4Te7rpVOx6tpjRUcMLfGRHrSNdQTlgeBzBo2EeRPULkV8eGU1Dhx0la+WPTon6
 kw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653844; x=1696258644;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O40XcCcHAsas1mpr+dRj0K7q2EqizN+rIJm4VTmzi9I=;
 b=qbqyPVCX0N3tnJfwFvDBatQ0KKVE+fS6JEnVYOA/Rl0UOMDuMR9bYB++1VnIAYekcO
 YWV8F9BKUa7eqVRXlUE+qe7gWzwuwxypFJgKKviXPF9mfI1YTqDxj8gh9rjyGr+/64hA
 7IC+SdiIO0agJDmDhnwvjYC7Ukgi4CtDzdWk8H6Wq0WfDvZHOXZn09Xt5x1MFZ9xQkGU
 kEpfs+EUMiEyuY6VB2dGWaloI6a9c0jN6D8FANAlttdbHx0NqgBgawYl7XwjC7kfKCZI
 lMXfpqljMPqQT+bGrvJBqTtOrqb2sXQUTlytjHyb1vlm/VOZVlIWmpTq9Bchq1MIsbAe
 zvbA==
X-Gm-Message-State: AOJu0YyECtquu9V0SBCCyFAPPU31XTVWqHtgAPhR6Wxs8A2gF2zA4ANX
 1sqGh1Sr0i4tQIiNOLcWOtI7CZ2Lq0kAGwctuHg=
X-Google-Smtp-Source: AGHT+IHtQ8tD5jMMf7FdzdQNLk/vrGJ5JR+DLT3ZdercsudZfqftPCuTp8AJyh/nAdLzwxhcqc/z3nXbLRi1ydLwj6g=
X-Received: by 2002:a05:6870:c596:b0:1dc:6f48:5046 with SMTP id
 ba22-20020a056870c59600b001dc6f485046mr9200798oab.5.1695653843745; Mon, 25
 Sep 2023 07:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <1694753689-29782-1-git-send-email-quic_rsr@quicinc.com>
 <19ce2cd9abfd3bdf3ea91f9bceb43206e4740c2e.camel@redhat.com>
 <ZQ3pbVHRXMiLfUCf@ideak-desk.fi.intel.com>
In-Reply-To: <ZQ3pbVHRXMiLfUCf@ideak-desk.fi.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Sep 2023 10:57:12 -0400
Message-ID: <CADnq5_NQnQoheKv39DiuLjKY3Z83WpesrFRUO4FMdrn=YPhnSQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST port
 detect
To: imre.deak@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Jani Nikula <jani.nikula@intel.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Ramya SR <quic_rsr@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 22, 2023 at 3:22=E2=80=AFPM Imre Deak <imre.deak@intel.com> wro=
te:
>
> On Fri, Sep 22, 2023 at 03:02:23PM -0400, Lyude Paul wrote:
> >
> > Oh! wow thank you for catching this:
> >
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> >
> > I will go and push this to drm-misc-next in just a moment
> >
> > On Fri, 2023-09-15 at 10:24 +0530, Ramya SR wrote:
> > > Modeset mutex unlock is missing in drm_dp_mst_detect_port function.
> > > This will lead to deadlock if calling the function multiple times in
> > > an atomic operation, for example, getting imultiple MST ports status
> > > for a DP MST bonding scenario.
> > >
> > > Signed-off-by: Ramya SR <quic_rsr@quicinc.com>
> > > ---
> > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/=
gpu/drm/display/drm_dp_mst_topology.c
> > > index ed96cfc..d6512c4 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > @@ -4154,7 +4154,7 @@ drm_dp_mst_detect_port(struct drm_connector *co=
nnector,
> > >
> > >     ret =3D drm_modeset_lock(&mgr->base.lock, ctx);
> > >     if (ret)
> > > -           goto out;
> > > +           goto fail;
> > >
> > >     ret =3D connector_status_disconnected;
> > >
> > > @@ -4181,6 +4181,8 @@ drm_dp_mst_detect_port(struct drm_connector *co=
nnector,
> > >             break;
> > >     }
> > >  out:
> > > +   drm_modeset_unlock(&mgr->base.lock);
>
> Isn't this supposed to be unlocked only by drm_helper_probe_detect_ctx()
> / drm_helper_probe_detect() ?

Maybe adding a comment to that effect would be helpful for the future.

Alex

>
> > > +fail:
> > >     drm_dp_mst_topology_put_port(port);
> > >     return ret;
> > >  }
> >
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> >
