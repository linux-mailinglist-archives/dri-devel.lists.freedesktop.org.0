Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF1A3C93F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 21:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536DE10E885;
	Wed, 19 Feb 2025 20:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TUzWJdvY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D6A10E364;
 Wed, 19 Feb 2025 20:01:02 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-220c895af63so367655ad.0; 
 Wed, 19 Feb 2025 12:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739995262; x=1740600062; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cimPSTnT0VmPRvCmAm8mGE9gXb+RFptDwWRoJAVxdew=;
 b=TUzWJdvYj0N044J3XEkLw3TOK4a3LfSTVRRhLB1cd//onvBHsphDiRaJ4potMQszQ6
 8jG/ZtgLg10OdpsBD9rK4sWkWNgSg+axijy69s1TbYfeHxjkgnZgWAA4mX8uWSDbXN1i
 DwHPhY/GKASj1O+0BoSUWt6vEUSBlCM1YBXmC+bbsUl+GZEdPB8a6jcXzWGwyWrl9tub
 to9WW/I5OCI3jJIrzN6QktQGbUFENO0Ltl1Jb63FWFJcceGqjEpEB1yB/9aSG8vqsgup
 lq6YE18wWX2/SHC51qaBro4RY9CcIQxhgG2eebTwScRQL/efitHC1ESeFRg39VJN6we+
 ouQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739995262; x=1740600062;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cimPSTnT0VmPRvCmAm8mGE9gXb+RFptDwWRoJAVxdew=;
 b=YnZ9O8+uPaargRdj35RFUtIOB3wIqgiMv0xhFzf/4WKXxxBYqialo78374ojlykm3J
 7DB4XbK+K74vlIT0twtdLaEg5XmrfxUn5+HRygU19kf2k6JV/ofXu2gWpdnxIOEZ41R6
 9ZhJiQwkPk1m6rIvdpk+jhZY8WEajSVSZKHCQjOEj+5zFghaHZEDAvXWg6KDbedv56LD
 0Mu+PSSZSDy1TfkCImNVLizPhq6lY05N08wjQhLHq41rdSx84gkZgpOBBoRSWmMiaedJ
 B9cFjB1eXxrb17DmmIZwYm2a4GLriib5bKAVCwQ4/3lxZXiGlNMZfUg68W2MsLs7UIFk
 /9Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLZO8IV8/wQKP2xLqJrzoLZegmxrZfMqAS7yLz3xz/XgjB0xxRa0BbDT6sCZ2M2IFxRBXmea3V@lists.freedesktop.org,
 AJvYcCXhC27bcZPwCu17C1QsgrCSe7IYBd8HSXMCDRJmTLfvGOMuR9cMVi8UUBQLKhGHVhaJnYkc7cP1zI1d@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMVhCHmqEtQnud9OGaQgoBUquuyvWK/PL/7oEnE0+Gyem63L+S
 peSdXHsGljxiMjGJB8D8WMdRs1Jt6LTchTt66CWXZW+0qEO+SihGJzDw6jTcb/qp/XmKRJMVmK9
 wHUM7jhKqfyDulf7vPerlmQSRtQy8Jw==
X-Gm-Gg: ASbGncvVUwWXuOywmGybXN2w4gZ8k07GbWev4JBgSBovKrc5P0hihcy7aL9b19srl22
 HywDdXkFBBQfvApiRIgMn4f+q3zAqQj0KTYTQHcTLVUeUauWGGTL7lC2bt2OFxmInvE1wfgE8
X-Google-Smtp-Source: AGHT+IFC6teEJadKt/7mVTkHVTNcGzuBc7KoC4wNEFP8G2DN7ZgoMPG7VycpsxwtDvNXC/QtcekI1GsOZvBrYwp+4og=
X-Received: by 2002:a17:903:2cd:b0:220:bf1c:35da with SMTP id
 d9443c01a7336-2210402b73amr111871965ad.7.1739995261993; Wed, 19 Feb 2025
 12:01:01 -0800 (PST)
MIME-Version: 1.0
References: <Z7YomFgEdOZzIyun@gallifrey>
 <CADnq5_NpxZLJxvP0dWwT_9MbyLUvuTSWHTt7j=cgqeQUsPiDwA@mail.gmail.com>
 <Z7Y4P4hEltSuHLEy@gallifrey>
In-Reply-To: <Z7Y4P4hEltSuHLEy@gallifrey>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 Feb 2025 15:00:50 -0500
X-Gm-Features: AWEUYZlnyw3zTugQskNb8nar3nio8bM4meGLeDgueaPCyRDubPuGWsybVtAA5js
Message-ID: <CADnq5_NXQANfWsCky4kvBL2VBWXCRPJkEg27taeBDkZHkexR1A@mail.gmail.com>
Subject: Re: missing wire up of nbif_v6_3_1_sriov_funcs ?
To: "Dr. David Alan Gilbert" <dave@treblig.org>
Cc: alexander.deucher@amd.com, Hawking.Zhang@amd.com, Likun.Gao@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2025 at 3:00=E2=80=AFPM Dr. David Alan Gilbert <dave@trebli=
g.org> wrote:
>
> * Alex Deucher (alexdeucher@gmail.com) wrote:
> > On Wed, Feb 19, 2025 at 2:04=E2=80=AFPM Dr. David Alan Gilbert
> > <linux@treblig.org> wrote:
> > >
> > > Hi All,
> > >   I think you may be misisng some wiring of nbif_v6_3_1_sriov_funcs.
> > >
> > >   My scripts noticed 'nbif_v6_3_1_sriov_funcs' was unused;
> > > It was added in:
> > >   Commit: 894c6d3522d1 ("drm/amdgpu: Add nbif v6_3_1 ip block support=
")
> > >
> > >
> > > and is:
> > > drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c:
> > >   const struct amdgpu_nbio_funcs nbif_v6_3_1_sriov_funcs =3D {
> > >
> > > but, it's not referenced, which makes me think it perhaps
> > > should be in:
> > > drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> > >
> > > I see for 4.3.x there is:
> > >   case IP_VERSION(4, 3, 0):
> > >   case IP_VERSION(4, 3, 1):
> > >     if (amdgpu_sriov_vf(adev))
> > >       adev->nbio.funcs =3D &nbio_v4_3_sriov_funcs;
> > >     else
> > >       adev->nbio.funcs =3D &nbio_v4_3_funcs;
> > >     adev->nbio.hdp_flush_reg =3D &nbio_v4_3_hdp_flush_reg;
> > >     break;
> > >
> > > but for 6.3.1 we have:
> > >
> > >   case IP_VERSION(6, 3, 1):
> > >     adev->nbio.funcs =3D &nbif_v6_3_1_funcs;
> > >     adev->nbio.hdp_flush_reg =3D &nbif_v6_3_1_hdp_flush_reg;
> > >     break;
> > >
> > >
> > > so is that supposed to have something similar?
> >
> > They can be dropped.  I think they were just copy and paste leftovers.
>
> Thanks for the reply.
>
> OK, I'll send a patch then to remove nbif_v6_3_1_sriov_funcs.

Thanks!

Alex

>
> Dave
>
> > Alex
> >
> > >
> > > Dave
> > >
> > > --
> > >  -----Open up your eyes, open up your mind, open up your code -------
> > > / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  =
\
> > > \        dave @ treblig.org |                               | In Hex =
/
> > >  \ _________________________|_____ http://www.treblig.org   |_______/
> --
>  -----Open up your eyes, open up your mind, open up your code -------
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
