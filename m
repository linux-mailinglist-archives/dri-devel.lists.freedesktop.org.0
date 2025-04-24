Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F25A9AE93
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 15:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761DA10E7F0;
	Thu, 24 Apr 2025 13:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X7ngjX69";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40E910E7EC;
 Thu, 24 Apr 2025 13:12:26 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-3087a70557bso184459a91.2; 
 Thu, 24 Apr 2025 06:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745500345; x=1746105145; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eA7Xuy6k9ONAPkP6AgSuyk9zFim9A6uFvmLfDwCH8vs=;
 b=X7ngjX69oNc+fLX/xlbBobsqNb0bmgtvdgDylAetdWGNpEyiG4Ic9nrOmU389Isecp
 ffkpCRBCcY1SSCYEkjMIHfVb71o4KBVYzK6jdnscGKXAjWsYdgdOIg/4uc+BAfaoP/Fd
 668a2+TyksHso2CHqSRaAWZP9v615wBA7T8HSC5B8dl5qLjdoXIHMmAwgs6TJg2AMlkz
 FKUCtKcb6vYVlnNA8rxNk5qVQ+sKoGjD4d2HmLTqkQNyRQq78YtYj1wx+ycb3HYiitNG
 B1Q9y2ZsHnwVfvTEPqLSY8n54Tot/lpSdw44bT8KPKS5Nsnrlb0GpD8MvHtO6C+QBNRT
 /k9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745500345; x=1746105145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eA7Xuy6k9ONAPkP6AgSuyk9zFim9A6uFvmLfDwCH8vs=;
 b=Rku7jVrc9TK80iYetUdKbmbuy8m+c7hzpKw3mG+AEI0rJIuckVzIxBJR1N4jkRF1XO
 +r5gVIIa0DP5TrTcXb2lMhK0CfTBdu4w72Z4oPqtanS6/6Etzao0snhNjqa5IN0+71BK
 bwwdz9q2TNMej/mwRY84HsWxOip2zDMSxfkzQCipe86bN3+GI+yVwsWNnW7gurCbm91R
 RY3qwtC1Ilp+qBkm0N4S0LvD2gYDs/51TQfbo0FUEv3pMhGYqswtdp6W8P02sNZ3HfJM
 BcQTifzEIgiEyl5N8tFNxTOjPpwLqCkoyPV/cDgsOBYARkUk2cGA7Daw3/4uaUoAX1mW
 vC4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3G4JgTqVEYFDr6CAgi3kuuhLvBZjzJ8w2ZS6/RCyRPoYKfTT1TpDcAaCJHNCXOg9GAJOjvE06@lists.freedesktop.org,
 AJvYcCVY4V+rEUhlGpE6P5PT6RvT+l/4JnbyKcIK7DPHVMAKjuATdAskGLy5cZWU+gBifPew06uzX6wBuKDz@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7LrybdQi8z33TwC95tXThOnntBnjqfwXYSJM01w9BlILMhsTa
 oOiTrG0s0WITpAoEsWunsv80wlRjhpC0juvI8/nL8Wm7wissnJnusFf4j/mP2VOqO0aqzpdCgmj
 T+bMZ/GnrKo9x26I9JNdYA2LvRuE=
X-Gm-Gg: ASbGncvUMrz9jCJL3/Fam9SVraVawcuk1p2iVWzaaypp7IZUTyEgjofWBpL6IqOjeVh
 QQMixx/lFNF3yx9OR1lwFnnyYjAO84P1NDS+u5yHu6m46vlWurmi5A/aQJ8EliRRgnUkLddrIe+
 ccU3fSatWlZfGP7wTCYMh0yQ==
X-Google-Smtp-Source: AGHT+IEFvo9XYRtQEvgfEvNW3YyXCDl9i/8QVWCKx/TXGNL9aOOZJwdPzKvHZ6KZW7h65cYldr4AhFdLlL3QAZqAS3M=
X-Received: by 2002:a17:90b:3906:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-309ed24cc88mr1706401a91.1.1745500345346; Thu, 24 Apr 2025
 06:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu>
 <8963a409dd575e040e5f07e4ad5e9c1d26b421f2.camel@irl.hu>
 <CALT56yPd-xfd=47xRxrCk4F3jib4Ti7kg8pRXy-gVAQpbOc=pw@mail.gmail.com>
 <e323219b52cda1891a55d12ad77a2b34edc8688b.camel@irl.hu>
 <Z_jodBrNFdEpJRKA@mail-itl> <aAn6wsnJ-6mqK4vR@mail-itl>
In-Reply-To: <aAn6wsnJ-6mqK4vR@mail-itl>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Apr 2025 09:12:13 -0400
X-Gm-Features: ATxdqUFwuh2Liv704M5KwrRa6klhoiIfTdC591MnFCPLJIk1C-iKiwHLYfgFHos
Message-ID: <CADnq5_Ptzieevwysn1Qz5yxTOujMtEDW=Rbwqpvmd_3o2Gd--Q@mail.gmail.com>
Subject: Re: amdgpu_dm_connector_mode_valid regression
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Gergo Koteles <soyer@irl.hu>, Dmitry Baryshkov <dbaryshkov@gmail.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, regressions@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
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

On Thu, Apr 24, 2025 at 4:49=E2=80=AFAM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Fri, Apr 11, 2025 at 12:01:28PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> >
> > Hi,
> >
> > On Wed, Apr 02, 2025 at 04:35:05PM +0200, Gergo Koteles wrote:
> > > Hi Dmitry,
> > >
> > > But the code would start to become quite untraceable.
> > > duplicate mode in amdgpu_dm_connector_mode_valid()
> > > call drm_mode_set_crtcinfo() in amdgpu_dm_connector_mode_valid()
> > > duplicate mode in create_stream_for_sink()
> > > overwrite ctrc in decide_crtc_timing_for_drm_display_mode()
> > > if crtc_clock =3D=3D 0 call drm_mode_set_crtcinfo() again in
> > > create_stream_for_sink()
> >
> > FWIW I'm affected by the same issue (on HP ProBook 445 G7, with AMD
> > Ryzen 5 4500U). And the patch quoted below fixes it for me too.
>
> I've re-tested it with 6.15-rc3 and the issue is still there. Is there
> something I can do to help fixing it before final 6.15 is out?

I believe this should be fixed in this patch which is already in this
week's -fixes PR:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/b316727a27d0dac1e6b7ae5=
1204df4d0f241fcc2

Alex

>
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab
