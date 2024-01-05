Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 069CD825C08
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 22:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB28010E69A;
	Fri,  5 Jan 2024 21:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC9710E687;
 Fri,  5 Jan 2024 21:03:24 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3bbebe6191bso13439b6e.3; 
 Fri, 05 Jan 2024 13:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704488604; x=1705093404; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B64IeG1RCY/MEBs65dfrWUNSaGZFXKMZqNYUtFGWk8g=;
 b=M3aTyeyE6kFa7Fa1w3/CYsCcHsy1kuz3TEv5a9ZiNSaAiAwoQqvYn3iQq4E3hbtUdI
 d4EgWTePXJGXdXxYtqfRoGYssYrcRdEdlUQgTkPAqRMHC4chRWIYF+mkVrbPDl/8iWJn
 ecx2FmZtf7OqMtu0mxv5Q5akrCrCI9SLt2M7WiwhJVo+hVlLp4aAIHAibsKzTwo1mKb9
 V/lmXcVD5G7HNXotUfv1YljDGHEeWBMsqJh2Hi5dcRY8gY79sXARv7uxYIUNGuzxeJp+
 hy9pfrEXZbc3Tv314XnWtjOgqwn9UVG1xrjQ7LwcT+t2fdA0Msm/CPPvWpMeejy77blx
 WoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704488604; x=1705093404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B64IeG1RCY/MEBs65dfrWUNSaGZFXKMZqNYUtFGWk8g=;
 b=p5dQr0p0xw36VRFEv38Izuo/79xel/havfJOwKD9IalLSrRymPZfewGK/6o7aV86nV
 i1SQuOk9SZYo2/mn80IwSOioK1Eb3/bqD5tiQ9KNkbIV2uKqvUjiFJlhO7yZNsFwLLur
 WOozsMbUqr6dnPyB3pH6ZoxathS/Sj9E3BdqLzHcNdSEHfPcwBHjl+oVPjm/0uc2Zgfa
 j74yGcsZP/9+2RzLY22Nw5yo41GB1C2lyquh/dOdQMuAvDkXk4s3uLY9+dDD2l8xIreI
 TITrpELrXOF1IAF3WSNJChZwORBrzesXqeSLme7KKH+SwFLqEHO/i6HQZlSpR2plNaeO
 +MUw==
X-Gm-Message-State: AOJu0Ywrs7OmepMsOSQV+NZ6fge7Ral7lKr4Uzw1s6BcB8uL0jjoWlqJ
 qGBk9e1B3wE0YUbApz4A42xWi8XlyD9lOA34Rks=
X-Google-Smtp-Source: AGHT+IGrjLxJTloAK3EcO17e8m2TLEzCtw7SlR1mbTJf+utz7/X0cGrKUQC4i/NX13yZ4yXIV4C7loHZz6Qi9llF3K0=
X-Received: by 2002:a05:6870:b616:b0:205:dda8:6f2b with SMTP id
 cm22-20020a056870b61600b00205dda86f2bmr1317806oab.77.1704488603739; Fri, 05
 Jan 2024 13:03:23 -0800 (PST)
MIME-Version: 1.0
References: <20231207180225.439482-1-alexander.deucher@amd.com>
 <CADnq5_PdmDWyJsDvtvCbNguExt2aydXy_rZOPHii5imMtt_Z+A@mail.gmail.com>
In-Reply-To: <CADnq5_PdmDWyJsDvtvCbNguExt2aydXy_rZOPHii5imMtt_Z+A@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Jan 2024 16:03:12 -0500
Message-ID: <CADnq5_O4FERKSD9D3uxPQx1RB4NJ+krQEC-WfZBZzFNceAUZEw@mail.gmail.com>
Subject: Re: [PATCH 0/2] fdinfo shared stats
To: Alex Deucher <alexander.deucher@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping on this series again?

Alex

On Wed, Dec 13, 2023 at 4:13=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Thu, Dec 7, 2023 at 1:03=E2=80=AFPM Alex Deucher <alexander.deucher@am=
d.com> wrote:
> >
> > We had a request to add shared buffer stats to fdinfo for amdgpu and
> > while implementing that, Christian mentioned that just looking at
> > the GEM handle count doesn't take into account buffers shared with othe=
r
> > subsystems like V4L or RDMA.  Those subsystems don't use GEM, so it
> > doesn't really matter from a GPU top perspective, but it's more
> > correct if you actually want to see shared buffers.
>
> Any thoughts on this?  Seem reasonable?
>
> Alex
>
> >
> > Alex Deucher (2):
> >   drm: update drm_show_memory_stats() for dma-bufs
> >   drm/amdgpu: add shared fdinfo stats
> >
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
> >  drivers/gpu/drm/drm_file.c                 |  2 +-
> >  4 files changed, 22 insertions(+), 1 deletion(-)
> >
> > --
> > 2.42.0
> >
