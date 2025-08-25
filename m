Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53501B3474E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 18:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D6010E118;
	Mon, 25 Aug 2025 16:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Am6SHu5m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D2410E503
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 16:28:20 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-770522b34d1so1375729b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 09:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1756139300; x=1756744100;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=woAfhn5HDSfsOd/+1jhyZYr6YehlXkPj2oA1ClHW5m0=;
 b=Am6SHu5m9EshFDRREZUfK3yIAf19hnR0KvRQuojN/EJdePLNpnOYOvoX+yGEjJPs3x
 3eoXS440ID4ctBzy6/Iwcv5ByOwZ7/VCRCtBqL9nE1x4uaqKpLx9B6IhTIe23v7JdIGc
 uOLUO18SpMQrnHGCiQX+C2H7SCAqBhNZvTJCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756139300; x=1756744100;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=woAfhn5HDSfsOd/+1jhyZYr6YehlXkPj2oA1ClHW5m0=;
 b=HG1B6GoxewzMLhXVlKEUtpXVyUuvV+Y73JRCju4PSGDZAnewMema+F6Px0jHyJIo0G
 4TEYykHej3pA4yVGXCy8UK2z/eCWvaZcfM7K3PLt+69E+p4OdxHEhKRlEcd/bu80iG/8
 B2nb/4s6P9DgcabdiJqe+mTV8FJt40p25zPtVFaFXyLBzsfBtXiKmBpcS+o7aBJaNmJt
 oryxvB7/lWiOGI6YK6/qYRFKAh17b67DXcGkVYIGZcKL/dYCMLK4SMB8/pat+spdNfJJ
 i9Q4PaNo8lYf/6dTCwAC7v07ajLQfUZ6P2vciLoXkV/nSnf6Z+j3c18MuAsLGywh7+yX
 afpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy7DoOIGYUP+5cvWeEHKrXzMbwe1RnKzLk4Es+rbWA83ssF9ZfkKICjHddQWpD2w2IVMO97Y+UUoU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4JLF11EQ2NTnaaXI5/WPLmrdY4tG9lcKxhnEGdtXtU1WLNBmt
 CkO5kd6NJS1/pOuxzyy7uAGAItQIbzWg2k6MFVHZJKxoIDfHyKp51o9xTDouNF+hPu52Apberg9
 O+ag=
X-Gm-Gg: ASbGnct3dlkZAyotjtLu3XecOktMPeFJc0h1v0iMwoKc3TPf/G+ccPpbAzK6ysu6QFO
 HF+epRrtxviHCPQLpWwyWFDNh76cqeGzaW7r4vii5Kq9aHI0zwQhoLqYVfxR++JaU6cRaUiBNET
 2sWvAX5LsZu79KFyK0yd5MSBqVwEs4Sr+4EQrqLdUJf8pS1H2Tw4pD6rjVz8fmdb1GzR8NWR3N8
 UwjmCzUeBM1j/HVd0UBhgag/30Y6Qxi8Q5nbPQbbEQ0/6G9vSqAyPz8ktdpsV4vsknHa7ikcCXo
 vGaS9FtNmaNP6NBoQOyzZFGchLiHsTIu9xhsIXjZbX9MCq4MwJ7issnQygNlwCkzBuxPsfjiPEJ
 dOw1tyfVHK+CQawlliLLfCNaAnkyEbTXhLBMH1L4ZA+3k2IVE35S4suoTOp+B9J3oaw==
X-Google-Smtp-Source: AGHT+IFUv/J4IO1t7f907uFnLnFmFHZGEI9usuzZS2KpOqe5CXSInjBRtvvD1usMneUdC08RRJO1HA==
X-Received: by 2002:a05:6a21:6d9f:b0:23d:d85c:bc0e with SMTP id
 adf61e73a8af0-2438783ad76mr237024637.14.1756139300098; 
 Mon, 25 Aug 2025 09:28:20 -0700 (PDT)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com.
 [209.85.214.172]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771e39cb4ebsm3087113b3a.85.2025.08.25.09.28.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 09:28:19 -0700 (PDT)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-246151aefaaso30415445ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 09:28:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU3dC36nS4zd8aN08vHJ5IUbSnIBGaVjlcjHA3rIKczQmCF08ddD4LuZdt26J/ErC6fmsXO2CRXdnY=@lists.freedesktop.org
X-Received: by 2002:a17:902:e548:b0:242:c66f:9f62 with SMTP id
 d9443c01a7336-2485712e9a3mr1483215ad.26.1756139298616; Mon, 25 Aug 2025
 09:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250818115015.2909525-1-treapking@chromium.org>
 <CAD=FV=XZK3HO8iC3VyMH+fP_XG2ogSNvUWuUcPFUxn1jU6-JZA@mail.gmail.com>
In-Reply-To: <CAD=FV=XZK3HO8iC3VyMH+fP_XG2ogSNvUWuUcPFUxn1jU6-JZA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Aug 2025 09:28:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xk+yTnizTh3FUJ8oBU=4q4t3VUO4bnHrSpJLZ1WL9O7w@mail.gmail.com>
X-Gm-Features: Ac12FXyUA1lsxksgKvSrs7zzRrWLTMGW6RoEiEQyPacS_X8GbWBGn9vOIWW-01U
Message-ID: <CAD=FV=Xk+yTnizTh3FUJ8oBU=4q4t3VUO4bnHrSpJLZ1WL9O7w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/panel: Allow powering on panel follower after
 panel is enabled
To: Pin-yen Lin <treapking@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
 dri-devel@lists.freedesktop.org
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

On Mon, Aug 18, 2025 at 1:11=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Aug 18, 2025 at 4:50=E2=80=AFAM Pin-yen Lin <treapking@chromium.o=
rg> wrote:
> >
> > Some touch controllers have to be powered on after the panel's backligh=
t
> > is enabled. To support these controllers, introduce .panel_enabled() an=
d
> > .panel_disabling() to panel_follower_funcs and use them to power on the
> > device after the panel and its backlight are enabled.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > ---
> >
> > Changes in v3:
> > - Update kernel-docs of drm_panel_add_follower() and drm_panel_remove_f=
ollower()
> > - Fix the order of calling .panel_disabling() and .panel_unpreparing()
> > - Add a blank line before the goto label
> >
> > Changes in v2:
> > - Replace after_panel_enabled flag with enabled/disabling callbacks
> >
> >  drivers/gpu/drm/drm_panel.c | 73 +++++++++++++++++++++++++++++++------
> >  include/drm/drm_panel.h     | 14 +++++++
> >  2 files changed, 76 insertions(+), 11 deletions(-)
>
> Looks good to me now.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> If there are no objections, I'll plan to apply patch #1 next week to
> give people a little time to speak up. As per discussion in v2 [1],
> unless we hear back an "Ack" from HID maintainers then patch #2 will
> just need to wait a while before it can land in the HID tree.
>
> Question for Jessica / Neil: what do you think about landing
> ${SUBJECT} patch in drm-misc-fixes instead of drm-misc-next? This is a
> dependency for the next patch which is marked as a "Fix". It'll mean
> that the patch can make it into mainline faster so the HID patch could
> land faster. The patch is also pretty low risk...
>
> [1] https://lore.kernel.org/r/CAD=3DFV=3DUV8_XGmxC=3D7Z18PEnj6wKz+yZQuV_4=
h+LJh_MNCqszvg@mail.gmail.com/

I didn't hear anything and it didn't seem urgent enough to put in
Fixes. Pushed to drm-misc-next.

[1/2] drm/panel: Allow powering on panel follower after panel is enabled
      commit: 2eb22214c132374e11e681c44d7879c91f67f614
