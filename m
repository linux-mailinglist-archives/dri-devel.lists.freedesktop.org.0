Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB59A441D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 18:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C55F10E8A0;
	Fri, 18 Oct 2024 16:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PIbBLgUr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0353710E380;
 Fri, 18 Oct 2024 16:48:11 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2e2b93d2da6so262308a91.0; 
 Fri, 18 Oct 2024 09:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729270090; x=1729874890; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+KdFMyZilgxNgos2aKAfdGC1JRwrBCcFoee7Jhfl6wo=;
 b=PIbBLgUrFU9cdAorCcuWIVvzTSLP7PVjWwqZ6Sm27U5H+CZxL9qVWfbvnBLJfXvEPl
 Ykk4W3nMWWLXQRsY8VJlFxX0Rg61iZGvq6hTqQYLTGliyoR/IIw/gmu3OSIU19McgFFj
 8EfOPeONBJgtxn/52eKjFlpKqSZufbIv5q+YH43VVofibhQQ6UIUJ0lj1uGd6V2bG8NU
 wb3MxCcm6YlRsax39ECHCphbeYqT0PxU9LAcJsCu4GZgq2ZoRZFnzZShPSf/FbQKP5bJ
 PVVWYpjwZlQegEEAu25Y3Yvjf8tu7V+vOcRE3/kIryo9p9jE2apq3YQp0bxtSIsHwl5/
 sK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729270090; x=1729874890;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+KdFMyZilgxNgos2aKAfdGC1JRwrBCcFoee7Jhfl6wo=;
 b=OF/EloH/D8GMWfL8jY073m9lp/U96lslMRqw62dAOk4qszQkDvLRaKgHbIM9H0ecDt
 JTbRD6+BxWP3xwmg4+Rqo5iaXkZsadXtVWpzM6d3SdA0xGwRrguwNZxa8FNfVGsE173x
 DenSzFrgwreCqxTg/fJCOJZHcHgRLIYF1xg+1zUhhMN9YWA7g0f7i0TylDC/f6LPfUbq
 vZdCEty9N7P7JQAuN8vR7+OvV+z5VYfhna2r07n74OSP2ILrPQXlZjSXETwrjmk0nzKG
 AoH4HMWqh5Nwg56aY3eA/4/dmrXiLjG01kCC1vhvBd/PuAzBOX2l1iXBcwpeDNLgVk7C
 Xabg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/NmRBycqGTpdbEK34Ja3YtQ1c9KrUXE3emDkKFCuVIDSav4o/GIEcxr1T9JfPgxD6NSPmo+zK@lists.freedesktop.org,
 AJvYcCVhilONHzw1eIqgceY5GoMrb8oD3gJmGQJCFB+3/eTqcFXYm6fwINgXoGFhQv1Q0r0ISszX4NEras5c@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxq+aE5CbJWQEgvZLuOQ80EonJqAuo4MDi6/szQCDLyPb3bL1No
 ay7boNYW1S5rFrugIXZLJmwTfLVdNTHMVsOS/GSbcVMWahLjqsuiUL2tIoG5oQpMK5lBHLT5T+L
 0HrtlNVQcV127hd52kaN1YrvU5O0=
X-Google-Smtp-Source: AGHT+IEHHpQqFYmBn0xV51TfI+SJmAuytoxVOYISR+ezP4xC8C3OEqfFW8De5N7maRo4MXgcOq1zix+V+Pc+gPWkCFg=
X-Received: by 2002:a17:90a:f189:b0:2e2:a70a:f107 with SMTP id
 98e67ed59e1d1-2e5615d618emr1697930a91.1.1729270090387; Fri, 18 Oct 2024
 09:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240824-amdgpu-min-backlight-quirk-v6-0-1ed776a17fb3@weissschuh.net>
 <cfec358a-ff42-49c3-a174-149bee7a461c@t-8ch.de>
 <5b1c8688-8154-436e-ba8f-f5a9087d2c85@amd.com>
In-Reply-To: <5b1c8688-8154-436e-ba8f-f5a9087d2c85@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Oct 2024 12:47:57 -0400
Message-ID: <CADnq5_N9HxF749HviiM-cAcrrEUHJMohzdar4t5RTy_kNNK+Vg@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] drm: Minimum backlight overrides and
 implementation for amdgpu
To: Harry Wentland <harry.wentland@amd.com>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, 
 Kieran Levin <ktl@framework.net>, Hans de Goede <hdegoede@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dustin Howett <dustin@howett.net>, linux-doc@vger.kernel.org
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

On Wed, Oct 16, 2024 at 1:47=E2=80=AFPM Harry Wentland <harry.wentland@amd.=
com> wrote:
>
>
>
> On 2024-09-16 14:23, Thomas Wei=C3=9Fschuh wrote:
> > Hi Harry, Leo and other amdgpu maintainers,
> >
> > On 2024-08-24 20:33:53+0000, Thomas Wei=C3=9Fschuh wrote:
> >> The value of "min_input_signal" returned from ATIF on a Framework AMD =
13
> >> is "12". This leads to a fairly bright minimum display backlight.
> >>
> >> Introduce a quirk to override "min_input_signal" to "0" which leads to=
 a
> >> much lower minimum brightness, which is still readable even in dayligh=
t.
> >
> > could you take another look at the series?
> > The issues around panel power are not specific to the low pwm values,
> > so shouldn't have an impact on this series.
> > (And are nearly imperceptible anyways)
> >
>
> I think these patches are good.
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Can you pick these up?

Thanks,

Alex

>
> Harry
>
> >> One solution would be a fixed firmware version, which was announced bu=
t
> >> has no timeline.
> >>
> >> ---
> >> Changes in v6:
> >> - Clean up cover letter and commit messages
> >> - Add my S-o-b to patch from Dustin
> >> - Mention testing in combination with "panel_power_savings"
> >> - Link to v5: https://lore.kernel.org/r/20240818-amdgpu-min-backlight-=
quirk-v5-0-b6c0ead0c73d@weissschuh.net
> >>
> >> Changes in v5:
> >> - Forward-declare struct drm_edid
> >> - Reorder patches, quirk entries are last
> >> - Add patch from Dustin for additional quirk entries
> >> - Link to v4: https://lore.kernel.org/r/20240812-amdgpu-min-backlight-=
quirk-v4-0-56a63ff897b7@weissschuh.net
> >>
> >> Changes in v4:
> >> - Switch back to v2 implementation
> >> - Add MODULE_DESCRIPTION()
> >> - Simplify quirk infrastructure to only handle min backlight quirks.
> >>   It can be extended if necessary.
> >> - Expand documentation.
> >> - Link to v3: https://lore.kernel.org/r/20240731-amdgpu-min-backlight-=
quirk-v3-0-46d40bb21a62@weissschuh.net
> >>
> >> Changes in v3:
> >> - Switch to cmdline override parameter
> >> - Link to v2: https://lore.kernel.org/r/20240623-amdgpu-min-backlight-=
quirk-v2-0-cecf7f49da9b@weissschuh.net
> >>
> >> Changes in v2:
> >> - Introduce proper drm backlight quirk infrastructure
> >> - Quirk by EDID and DMI instead of only DMI
> >> - Limit quirk to only single Framework 13 matte panel
> >> - Link to v1: https://lore.kernel.org/r/20240610-amdgpu-min-backlight-=
quirk-v1-1-8459895a5b2a@weissschuh.net
> >>
> >> ---
> >> Dustin L. Howett (1):
> >>       drm: panel-backlight-quirks: Add Framework 13 glossy and 2.8k pa=
nels
> >>
> >> Thomas Wei=C3=9Fschuh (3):
> >>       drm: Add panel backlight quirks
> >>       drm/amd/display: Add support for minimum backlight quirk
> >>       drm: panel-backlight-quirks: Add Framework 13 matte panel
> >>
> >>  Documentation/gpu/drm-kms-helpers.rst             |  3 +
> >>  drivers/gpu/drm/Kconfig                           |  4 +
> >>  drivers/gpu/drm/Makefile                          |  1 +
> >>  drivers/gpu/drm/amd/amdgpu/Kconfig                |  1 +
> >>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++
> >>  drivers/gpu/drm/drm_panel_backlight_quirks.c      | 94 ++++++++++++++=
+++++++++
> >>  include/drm/drm_utils.h                           |  4 +
> >>  7 files changed, 117 insertions(+)
> >> ---
> >> base-commit: d2bafcf224f3911b183113b2fcb536c9e90684a3
> >> change-id: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a
> >>
> >> Best regards,
> >> --
> >> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> >>
>
