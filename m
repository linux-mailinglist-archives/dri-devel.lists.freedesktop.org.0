Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E18309EA0BC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 21:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47C610E7BC;
	Mon,  9 Dec 2024 20:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DcuzwIns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F306D10E56D;
 Mon,  9 Dec 2024 20:56:52 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2ee8ecb721dso846138a91.3; 
 Mon, 09 Dec 2024 12:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733777812; x=1734382612; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ezkmBL5VUO/PNXtpKMgd76cJBr7+MADsjdUYCjfhYy8=;
 b=DcuzwInsh1XruSeZ/MVgdykLdRIu3wigGXRl+erFtZMoUU6a8qsqiSlaeOHVZwD+9L
 79YpW14ksxiCW68HOuuvDxN3ACtqriGO/Nf2lqxnITB/wlsIF//oT9Tn9S/PZE5FpZS0
 tU4DNpOTNjWtS/iO5jPp8ERC+7fICU56/ZEyQr51HzlxuefFagO3BJeR0EHuCYAcGYOf
 r2rAO3/VW2fhwGMQMVDUEC+MXC+6qHTsmrcyDDrZs8yM9z3NnV+w7qElCx206aKisWYR
 WZ+Se1MWOSfW4BcbXrQSmEN4HWMlRYOhT/kdgJfn1P/89fORii5tDwU3bp1FkE0GJmHe
 rAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733777812; x=1734382612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ezkmBL5VUO/PNXtpKMgd76cJBr7+MADsjdUYCjfhYy8=;
 b=V95RhzD5lh3i8IC8wM180XGg00Ga8xRdx17kYs4CK/3av703K6hoeil/DOOOfL0shr
 bsM+1jukZg0idtI/sbOw78YbLjazIkMc4rnb1dwoWy9Ih8/Pb4PNsZCXTe+DzEuTA9jn
 yiR8HhVn5wecUx+AeXblPX05W/sKryDLF6f1qkw+mcfjBAZTlL3jvAhFjT+B58NxkvtE
 wCgl+F/tZQtFG4axaO0DirQ80V4i1+DWd61I4J2Z5eAleEbr3UZc2c4/5B2PQ95sA05b
 1IX1LgOlZkwwAXGB8qC65+loBtsmPzEO8r27zdt0mW/E/5TkKP7ZfZDwvpF8as5yZzpG
 mLSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2Saa8pKCa3v/JZEVz0gQvDq6/KrfrnM8MD79EF57cPa13/v52ecRJMcj+1nBRgL5tfCY6rtmSjMXB@lists.freedesktop.org,
 AJvYcCXIS7rYBMP915qzgpal7IftvchTDp5vEENePe2iD5SZULD7pCHQS+QA7C8B1709Nv3TFOQq7LNl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiYUPdRsjwUs5Fjli8F+jaJnMqENHZRxHGR9Pnmv+x3dnsvfWK
 GYxndGRstts1CZ9ny4yODZZZ0zIantCA/3u6GKlCj+r/NhZQdE8qU/zey7AdMF7vGODa8GClhqP
 JXHN1BEMm+SyX8UFNwmVj5QlwdL0=
X-Gm-Gg: ASbGnctF9v3hhV8MJ6aqKhxduJHY9S3O100j7FMBQUIIb+ub8Y8UeQmOWOmyYD53H2V
 lqppLVrAthqi+aOnNZZBYuVOl1rEeliioz00=
X-Google-Smtp-Source: AGHT+IFcRrfCMGls5yqYKTcr2PE5GRIpy/PG523CyNrG70/v+QAJwYJp8rMrfjufd2aMTUe7Bmwh2Iowhj5LZcmxjaE=
X-Received: by 2002:a17:90b:1b42:b0:2ee:6563:20b5 with SMTP id
 98e67ed59e1d1-2efd454dfb2mr588400a91.0.1733777812387; Mon, 09 Dec 2024
 12:56:52 -0800 (PST)
MIME-Version: 1.0
References: <20241104023852.492497-1-linux@treblig.org>
 <Z1JhHcaYZCzKHp-i@gallifrey>
In-Reply-To: <Z1JhHcaYZCzKHp-i@gallifrey>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Dec 2024 15:56:40 -0500
Message-ID: <CADnq5_OUSOzzUYin8SRRGPL0MCvmd+RGo0TM_DRAyp85zE--Jg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Some more drm/amd/display deadcoding
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com, 
 Rodrigo.Siqueira@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 chaitanya.dhere@amd.com, jun.lei@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Thu, Dec 5, 2024 at 9:35=E2=80=AFPM Dr. David Alan Gilbert <linux@trebli=
g.org> wrote:
>
> * linux@treblig.org (linux@treblig.org) wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> >
> > Hi,
> >   This removes a bunch more functions (and a field) from
> > drm/amd/display that are unused.
> >
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
>
> Hi Alex, Harry,
>   Gentle ping on this set - I think you've already pulled in all
> of the older ones (Thanks!).

Applied.  Thanks!

Alex

>
> Dave
>
> > Dave
> >
> > Dr. David Alan Gilbert (5):
> >   drm/amd/display: Remove unused enable_surface_flip_reporting
> >   drm/amd/display: Remove unused dwb3_set_host_read_rate_control
> >   drm/amd/display: Remove unused dc_stream_warmup_writeback
> >   drm/amd/display: Remove unused mmhubbub_warmup field
> >   drm/amd/display: Remove unused dcn_find_dcfclk_suits_all
> >
> >  .../gpu/drm/amd/display/dc/core/dc_stream.c   |  11 --
> >  .../gpu/drm/amd/display/dc/core/dc_surface.c  |   7 -
> >  drivers/gpu/drm/amd/display/dc/dc_stream.h    |   4 -
> >  .../drm/amd/display/dc/dml/calcs/dcn_calcs.c  | 132 ------------------
> >  .../drm/amd/display/dc/dwb/dcn30/dcn30_dwb.c  |  13 --
> >  .../drm/amd/display/dc/dwb/dcn30/dcn30_dwb.h  |   1 -
> >  .../amd/display/dc/hwss/dcn30/dcn30_init.c    |   1 -
> >  .../amd/display/dc/hwss/dcn301/dcn301_init.c  |   1 -
> >  .../amd/display/dc/hwss/dcn31/dcn31_init.c    |   1 -
> >  .../amd/display/dc/hwss/dcn314/dcn314_init.c  |   1 -
> >  .../amd/display/dc/hwss/dcn32/dcn32_init.c    |   1 -
> >  .../amd/display/dc/hwss/dcn35/dcn35_init.c    |   1 -
> >  .../amd/display/dc/hwss/dcn351/dcn351_init.c  |   1 -
> >  .../amd/display/dc/hwss/dcn401/dcn401_init.c  |   1 -
> >  .../drm/amd/display/dc/hwss/hw_sequencer.h    |   4 -
> >  .../gpu/drm/amd/display/dc/inc/core_types.h   |   3 -
> >  .../gpu/drm/amd/display/dc/inc/dcn_calcs.h    |   4 -
> >  17 files changed, 187 deletions(-)
> >
> > --
> > 2.47.0
> >
> --
>  -----Open up your eyes, open up your mind, open up your code -------
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
