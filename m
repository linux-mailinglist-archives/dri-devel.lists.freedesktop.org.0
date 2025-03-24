Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D2BA6DFE4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 17:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABE610E496;
	Mon, 24 Mar 2025 16:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LMJRfGLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F50D10E496
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 16:37:18 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30613802a6bso48584231fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 09:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742834233; x=1743439033;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fDN1DigddMVH2DZcXLwHcLv3wl4mw8L1y1VFkP+R480=;
 b=LMJRfGLZWldXLgIfEirmp5XUS4Z5btU7GDrcdS9Kg/YTg3LSsGzlz5QXkT3lKY+Vap
 YA4FbRmsllgZp/KwCINODoqMBWnuvKLJnmJHeoi3f/pSBM8nIFPObqou+z52LVS2rRtp
 udqCo0VlaYpMMBGkz8X8XcEwpLK+pP0uivEDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742834233; x=1743439033;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fDN1DigddMVH2DZcXLwHcLv3wl4mw8L1y1VFkP+R480=;
 b=F2/finaFf0Tk4TW3pck02cXc30/8POK34i1RGjLFjeRyPOgF2DVttWdR27dM5r1+2n
 ihOpR1S44mgIfBPsaxr78YjMCGCv60fWNz5nr+seEuaTdYe0SHgTM8lCveUK4lp2YUpc
 /Pg1VrfZ289oyC5NVQkL97AiVdo5Ee6eMi4GMCxdJ1GISAVEDkmGTA4RUudBf/pUfHHH
 ucpOQhUK0Cba7CXL6AYlDGfZKXaQfU36ggqwqkQtXZlg0IKJIIwPoZWhHOlAXWmcbKhe
 3fzZ9Jk/rplE+ECIOmqC7msGeHozTACqxeOi7vTsZHSj7I26hA6IwkaK0IUnOnirdEZl
 NTxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYuK5m4QLiPLb7bEpctO11Nu+SpBdthjk5P/2Bdo72DoWU/tCNbHhc5eJLfJ0qeArJOfh1gC8wIJk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSSI3EIHckMs0g6LqSW/1S324cLwJDaICDHPafCjcEpRe1rKLe
 deEhZ65f7lTLlnVNogWKixPCmhTeGfUObkhjXVE10VUmExoxAPlWkSRU/KmCR276sItXp0N9ePn
 pIg==
X-Gm-Gg: ASbGncs3npZQi18DuKGoZQhTiBS+uk4JLqGgcDDneCRlziIbiMr5fu7P0M7EHK6YPdb
 dWT2gML4m9yvzrHRKpI45CuXgdxGT0QldxvUO3Km/t9eKTNwfckV6jS6TD/hkwdIRPIE8PXBk/R
 cRrBFQzPyo25Zr4uIO2MAilinNrPZsG6VPJ3Drpq0FIWcByAsXKyDVNeqkoY41b4wIsoKJ32Kmh
 vS4/6AXMpNBHRR2oSHvgJ5wRo8bUBG8qg2X41rO2kkzBKAmizNNxRKeMFJ/yjW08VecODyjE0ew
 m91VgPjNwdImOGI0PPfLuBKAi5+5Ep4vDiEHzlPoRfK3rgTPfblCnFurit4cjtUxOZ1LkDohO32
 Kx2UtUoj5
X-Google-Smtp-Source: AGHT+IE1qPK6wWEi9IRcBobWB7SLlR/1kPiN+tSYuNeciXnUYtQD8UswEZbaI+WqaQ8FpMH2biC3bw==
X-Received: by 2002:a05:6512:3e14:b0:546:2f7a:38c4 with SMTP id
 2adb3069b0e04-54ad647e8f9mr4329106e87.13.1742834232564; 
 Mon, 24 Mar 2025 09:37:12 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad65009b5sm1195550e87.128.2025.03.24.09.37.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 09:37:10 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54954fa61c8so4801604e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 09:37:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXpqzqR4StF89MSk+ZA2YfimZNr5mvcW/XKJg7DBrdat/H+cDxgZL2SyPt34K6oN4cxZ/nEmH5E1Fw=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3d11:b0:549:8cc8:efed with SMTP id
 2adb3069b0e04-54ad650a07dmr5306442e87.48.1742834226392; Mon, 24 Mar 2025
 09:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250319183106.12613-1-tejasvipin76@gmail.com>
 <CAD=FV=WZxF4CGSAAqSvs8XnLEvkXNEEv87V3ffE_uBfj-qWN=A@mail.gmail.com>
In-Reply-To: <CAD=FV=WZxF4CGSAAqSvs8XnLEvkXNEEv87V3ffE_uBfj-qWN=A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Mar 2025 09:36:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VWj03LmA-LfSDSkrg0m53AuYPg8YQLK0m_BKT6xBEBEQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrW47wJ32hbO7SbwG8ki058S8keXJviwMHqGv6pjeXdowOMFlpfudBmNlc
Message-ID: <CAD=FV=VWj03LmA-LfSDSkrg0m53AuYPg8YQLK0m_BKT6xBEBEQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: samsung-s6d7aa0: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 aweber.kernel@gmail.com, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asrivats@redhat.com
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

On Wed, Mar 19, 2025 at 1:05=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Mar 19, 2025 at 11:31=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.=
com> wrote:
> >
> > Changes the samsung-s6d7aa0 panel to use multi style functions for
> > improved error handling.
> >
> > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > ---
> > Changes in v2:
> >     - Remove unnecessary early return in s6d7aa0_lock
> >     - Remove redundant GPIO reset setting in s6d7aa0_on.
> >
> > Link to v1: https://lore.kernel.org/all/20250316045024.672167-1-tejasvi=
pin76@gmail.com/
> > ---
> >  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 222 +++++-------------
> >  1 file changed, 65 insertions(+), 157 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

When I applied I got a few whitespace errors that checkpatch yelled
about. I fixed them for you while applying. Pushed to drm-misc-next:

[1/1] drm/panel: samsung-s6d7aa0: transition to mipi_dsi wrapped functions
      commit: 837f9b917c47b4d35f0ee571a736de2895e2dd54
