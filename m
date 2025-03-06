Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE092A5538A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F1510EA42;
	Thu,  6 Mar 2025 17:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="exQXuDB/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B348810EA42
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 17:53:55 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30bee278c2aso7174141fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 09:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1741283633; x=1741888433;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VcmDipHwuj8PgRhQ4UBe7gUhRK502GziUS3SiEtvIAg=;
 b=exQXuDB/G90xqWlfrBaQMdSttF179YI5SvzBdVnNdPIHTQvxZbRtHPd68gWdlfoaAP
 uWt18WqFvc4PFTDn/ICFvAqk4cV9K7cCnOUVEAMbrUXn7GQ759L8Qph15hqmX4HPx/7Z
 vSPcEdCzToRsuUrA0p9mti7QLlGJ8dxsSMY1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741283633; x=1741888433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VcmDipHwuj8PgRhQ4UBe7gUhRK502GziUS3SiEtvIAg=;
 b=MYlYY/9ODZ3rkPuekAk/wkx78NcCs81csQ17rTepnPJr5vi0As3c9XUf2SXn2I1QB4
 DPaWmnqBUVRoLsyHm3wGUKRUy0Vh74l0Y2W/dtbC6huqxKdkmOJ70C8sNuDZDclurSND
 w25/neZY+7Q6ghEJC1+MTM41l/XDBCkiveI/biWf8CZpiARiaIxMAg0bp1j3aKoZ5LDE
 qcYicxXz0tBas48WciwqbbuSKFsF56ANadiCXZqVi+Qzbf5GmMQWgyaJkWOsBKGodZj4
 JzEu/xROABKpidKyqBx+/MWOQxH6bQtXRBs8uWtsBqkkPRU1co/EWj/CSx7soz+/gPGX
 2WMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYRADPUqSYPekiZ5h7mFAuYYiXNfD3wVb4on4VzVW3HDlLcFSWoJvkiHmNhVPGM+AXeid9Mb/E/X4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9hNNAAD/N9r8mEwWnpl9SDEMoT0WbK6Sp901tcsmAdGa4jal5
 4SYYdbtG02RIm9EH1vewRsLs1kDkBXSEv4UQPJl1b/EZecU3jWU0Ak572rkqZmUfHD0R6/6Ukxg
 8Dqhs
X-Gm-Gg: ASbGncvCaGNjg1NreyiLBnawvWp7klXEwXfZTv1wvVR3DlLRkcBtMvsfYPpr+/7mAaT
 xXWUTCxZOF02LBfXycFq7cAQ3vmWAIlzuGv9meqeiZmsEUz0VpsuWdpdrwFEk+EHd0GNyKf31AU
 c5FZdVo5JL/7jlN5FrrCuGMfvyhKx3N4IKpW5fmgDKe8pBrAf8KixVfCZk1eKzBz0mMTxCvZgea
 4AOHlK6Z08wjIKBq+Dj3ZNXDeee2cGO25kOdBCFAw/nLHsea1GeDsw4FPMrWZEr5Pb3a28vCeIg
 VyDYZOcp4YsLjAulmu3OIF5lEQQz0piLI/dD9ianO4IHjHJ1QQcGEReTASBZMk123u8/GU0AJcy
 NyVsMSAaIbkxf
X-Google-Smtp-Source: AGHT+IFMthfd/oqX8QxrT5ofYB1O1LqTJBSF4nudkG60h/gtrvCDmvcAINkFMMRWRh8WW/+WpkGHDw==
X-Received: by 2002:a2e:bc27:0:b0:30b:c328:3cdc with SMTP id
 38308e7fff4ca-30bf3397e2amr1796691fa.2.1741283632668; 
 Thu, 06 Mar 2025 09:53:52 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30be98f3175sm2665981fa.40.2025.03.06.09.53.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 09:53:51 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30ba563a6d1so25745881fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 09:53:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXhG9vK0/zCGrxNQaP/cK5A2pjGbxLOv3YeCNURD3cVIjVTg5LHCaGB15qMfzKgUe0etOl69VNbZuk=@lists.freedesktop.org
X-Received: by 2002:a2e:9187:0:b0:30b:f0fd:5136 with SMTP id
 38308e7fff4ca-30bf0fd5290mr6793931fa.18.1741283631322; Thu, 06 Mar 2025
 09:53:51 -0800 (PST)
MIME-Version: 1.0
References: <20250305-mipi-synaptic-1-v1-1-92017cd19ef6@redhat.com>
 <20250306-clever-lime-tanuki-e2fc43@houat>
 <CAN9Xe3SDyC47HWww1eH63aZOiM-WF9BGxztM3yh9bf6ORuY7VA@mail.gmail.com>
 <20250306-brave-wonderful-sambar-3d0bc5@houat>
In-Reply-To: <20250306-brave-wonderful-sambar-3d0bc5@houat>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Mar 2025 09:53:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XZJjNpzUgvGog0pFGwqUR09SocYFEk5355eptbK_gjqA@mail.gmail.com>
X-Gm-Features: AQ5f1JrRJDiXo61n02Hjt29_oRyhxwMEG-u37b6Vvo-aWJLulx2MO1UpXmYjZko
Message-ID: <CAD=FV=XZJjNpzUgvGog0pFGwqUR09SocYFEk5355eptbK_gjqA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/synaptics-r63353: Use _multi variants
To: Maxime Ripard <mripard@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>,
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Tejas Vipin <tejasvipin76@gmail.com>
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

Hi,

On Thu, Mar 6, 2025 at 9:20=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> On Thu, Mar 06, 2025 at 10:08:24AM -0500, Anusha Srivatsa wrote:
> > On Thu, Mar 6, 2025 at 4:31=E2=80=AFAM Maxime Ripard <mripard@kernel.or=
g> wrote:
> >
> > > Hi Anusha,
> > >
> > > On Wed, Mar 05, 2025 at 07:01:41PM -0500, Anusha Srivatsa wrote:
> > > > Move away from using deprecated API and use _multi
> > > > variants if available. Use mipi_dsi_msleep()
> > > > and mipi_dsi_usleep_range() instead of msleep()
> > > > and usleep_range() respectively.
> > > >
> > > > Used Coccinelle to find the multiple occurences.
> > > > SmPl patch:
> > > > @rule@
> > > > identifier dsi_var;
> > > > identifier r;
> > > > identifier func;
> > > > type t;
> > > > position p;
> > > > expression dsi_device;
> > > > expression list es;
> > > > @@
> > > > t func(...) {
> > > > ...
> > > > struct mipi_dsi_device *dsi_var =3D dsi_device;
> > > > +struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi_var };
> > > > <+...
> > > > (
> > > > -mipi_dsi_dcs_write_seq(dsi_var,es)@p;
> > > > +mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
> > > > |
> > > > -mipi_dsi_generic_write_seq(dsi_var,es)@p;
> > > > +mipi_dsi_generic_write_seq_multi(&dsi_ctx,es);
> > > > |
> > > > -mipi_dsi_generic_write(dsi_var,es)@p;
> > > > +mipi_dsi_generic_write_multi(&dsi_ctx,es);
> > > > |
> > > > -r =3D mipi_dsi_dcs_nop(dsi_var)@p;
> > > > +mipi_dsi_dcs_nop_multi(&dsi_ctx);
> > > > |
> > > > ....rest of API
> > > > ..
> > > > )
> > > > -if(r < 0) {
> > > > -...
> > > > -}
> > > > ...+>
> > >
> > > The point of sending a single patch was to review the coccinelle scri=
pt,
> > > so you must put the entire script you used here.
> >
> > I was actually thinking of sending patches per driver this time around
> > since Tejas also seems to be looking into similar parts....Thoughts?
>
> Not really?
>
> The point of doing it with one driver was to make sure the coccinelle
> script was fine before rolling it to other drivers. And actually, it
> doesn't really matter: the whole point of putting the script in the
> commit log is to be able to review and document the script you used. If
> you're not going to put the one you used, it's kind of pointless.

Personally, I don't have any interest in reviewing the coccinelle
script so I don't need it and, from my point of view, you could just
remove it from the patch description (or point to it indirectly or
something). I'll review each patch on its own merits. I am a bit
curious if you ended up fully generating this patch with a coccinelle
script or if you used a coccinelle script to start and then had to
manually tweak the patch after. Actually, I guess I'll take it back.
If you manage to fully generate conversions for all the panels with a
single cocinelle script, I would love to take a glance at your full
script just to satisfy my curiosity for how you handled everything
properly. :-P

-Doug
