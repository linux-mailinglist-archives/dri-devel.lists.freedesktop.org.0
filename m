Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019AD93CF46
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 10:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3597D10E947;
	Fri, 26 Jul 2024 08:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D0OxV065";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DF710E947
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 08:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721981208; x=1753517208;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=9XgdxMrvIfkd+SJBRa+5xDEpZzmO8H5H5XS3eZbYEog=;
 b=D0OxV065Wb9Q6dVqlQ4YYAfHGdjRYr157ZORGhNYh+IWULUcFGpjdxyV
 QJ/wx6ElSPoQ4W0uJDr2WxuG9E8U+F8Xs8JoazXp5Xoj5N1r7IJ6KvZiP
 /yTZ03S9tJQjkaDKM7JjeZlwdjLfvO8yzcUyhw04iWt0kA6n4LdAwNG4F
 Pw1JPJY1snAalsVK/xxEJbxpHIo7nEGqlMT9BbNtXJpE0qcOonZAvSmn2
 lvj6tWcNH5tlnCxp+aKAYcDrhNcBfzgA87RjUoRihyLigicNRkiC+BOPD
 IOpt5I8ZF0gp2ef5pRYqs00mwwSOuqV2ix48OR3E9d9AXIq5f+wk2/9uw w==;
X-CSE-ConnectionGUID: qGMV0uyvT8WhCHaC6RQdYA==
X-CSE-MsgGUID: +k6ivfo7S4eoVG7YB8ZjrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="22679023"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="22679023"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 01:06:48 -0700
X-CSE-ConnectionGUID: r1ab+2STRCmEt3ZuWAdtjQ==
X-CSE-MsgGUID: QzRcKxs0Q0au6gz37wJ4Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57984032"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.66])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 01:06:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, dianders@chromium.org, hsinyi@google.com,
 airlied@gmail.com, daniel@ffwll.ch, jagan@edgeble.ai,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] drm/panel: jd9365da: Move the sending location
 of the 11/29 command
In-Reply-To: <CA+6=WdS5QKMVX2euxdeDqCoHrCpWuqB_cu5vzHGUNdUq4NnPZw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240725083245.12253-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240725083245.12253-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <87o76lzwvr.fsf@intel.com>
 <CA+6=WdS5QKMVX2euxdeDqCoHrCpWuqB_cu5vzHGUNdUq4NnPZw@mail.gmail.com>
Date: Fri, 26 Jul 2024 11:06:40 +0300
Message-ID: <87h6cczien.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Fri, 26 Jul 2024, zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.c=
om> wrote:
> On Thu, Jul 25, 2024 at 4:41=E2=80=AFPM Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:
>>
>> On Thu, 25 Jul 2024, Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.googl=
e.com> wrote:
>> > Move the 11/29 command from enable() to init() function
>>
>> OOC, what is the "11/29" command?
>>
>> BR,
>> Jani.
>
> hi Jani
> Sorry, maybe I didn't describe it clearly. The 11/29 commands are sent
> by these two functions.
>
> mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>
> MIPI_DCS_EXIT_SLEEP_MODE =3D 0x11,
> MIPI_DCS_SET_DISPLAY_ON=3D 0x29,

Maybe refer to the commands with their names then? Exit sleep mode and
set display on.

BR,
Jani.



>
> BR,
>>
>> >
>> > As mentioned in the patch:
>> > https://lore.kernel.org/all/20240624141926.5250-2-lvzhaoxiong@huaqin.c=
orp-partner.google.com/
>> >
>> > Our DSI host has different modes in prepare() and enable()
>> > functions. prepare() is in LP mode and enable() is in HS mode.
>> > Since the 11/29 command must also be sent in LP mode,
>> > so we also move 11/29 command to the init() function.
>> >
>> > After moving the 11/29 command to the init() function,
>> > we no longer need additional delay judgment, so we delete
>> > variables "exit_sleep_to_display_on_delay_ms" and
>> > "display_on_delay_ms".
>> >
>> > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.co=
m>
>> > ---
>> >  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 59 ++++++++++---------
>> >  1 file changed, 32 insertions(+), 27 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/driver=
s/gpu/drm/panel/panel-jadard-jd9365da-h3.c
>> > index 04d315d96bff..ce73e8cb1db5 100644
>> > --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
>> > +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
>> > @@ -31,8 +31,6 @@ struct jadard_panel_desc {
>> >       bool reset_before_power_off_vcioo;
>> >       unsigned int vcioo_to_lp11_delay_ms;
>> >       unsigned int lp11_to_reset_delay_ms;
>> > -     unsigned int exit_sleep_to_display_on_delay_ms;
>> > -     unsigned int display_on_delay_ms;
>> >       unsigned int backlight_off_to_display_off_delay_ms;
>> >       unsigned int display_off_to_enter_sleep_delay_ms;
>> >       unsigned int enter_sleep_to_reset_down_delay_ms;
>> > @@ -66,26 +64,6 @@ static inline struct jadard *panel_to_jadard(struct=
 drm_panel *panel)
>> >       return container_of(panel, struct jadard, panel);
>> >  }
>> >
>> > -static int jadard_enable(struct drm_panel *panel)
>> > -{
>> > -     struct jadard *jadard =3D panel_to_jadard(panel);
>> > -     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D jadard->dsi=
 };
>> > -
>> > -     msleep(120);
>> > -
>> > -     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>> > -
>> > -     if (jadard->desc->exit_sleep_to_display_on_delay_ms)
>> > -             mipi_dsi_msleep(&dsi_ctx, jadard->desc->exit_sleep_to_di=
splay_on_delay_ms);
>> > -
>> > -     mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>> > -
>> > -     if (jadard->desc->display_on_delay_ms)
>> > -             mipi_dsi_msleep(&dsi_ctx, jadard->desc->display_on_delay=
_ms);
>> > -
>> > -     return dsi_ctx.accum_err;
>> > -}
>> > -
>> >  static int jadard_disable(struct drm_panel *panel)
>> >  {
>> >       struct jadard *jadard =3D panel_to_jadard(panel);
>> > @@ -202,7 +180,6 @@ static const struct drm_panel_funcs jadard_funcs =
=3D {
>> >       .disable =3D jadard_disable,
>> >       .unprepare =3D jadard_unprepare,
>> >       .prepare =3D jadard_prepare,
>> > -     .enable =3D jadard_enable,
>> >       .get_modes =3D jadard_get_modes,
>> >       .get_orientation =3D jadard_panel_get_orientation,
>> >  };
>> > @@ -382,6 +359,12 @@ static int radxa_display_8hd_ad002_init_cmds(stru=
ct jadard *jadard)
>> >
>> >       jd9365da_switch_page(&dsi_ctx, 0x00);
>> >
>> > +     mipi_dsi_msleep(&dsi_ctx, 120);
>> > +
>> > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>> > +
>> > +     mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>> > +
>> >       return dsi_ctx.accum_err;
>> >  };
>> >
>> > @@ -608,6 +591,12 @@ static int cz101b4001_init_cmds(struct jadard *ja=
dard)
>> >       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE6, 0x02);
>> >       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE7, 0x0C);
>> >
>> > +     mipi_dsi_msleep(&dsi_ctx, 120);
>> > +
>> > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>> > +
>> > +     mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>> > +
>> >       return dsi_ctx.accum_err;
>> >  };
>> >
>> > @@ -831,6 +820,16 @@ static int kingdisplay_kd101ne3_init_cmds(struct =
jadard *jadard)
>> >
>> >       jd9365da_switch_page(&dsi_ctx, 0x00);
>> >
>> > +     mipi_dsi_msleep(&dsi_ctx, 120);
>> > +
>> > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>> > +
>> > +     mipi_dsi_msleep(&dsi_ctx, 120);
>> > +
>> > +     mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>> > +
>> > +     mipi_dsi_msleep(&dsi_ctx, 20);
>> > +
>> >       return dsi_ctx.accum_err;
>> >  };
>> >
>> > @@ -859,8 +858,6 @@ static const struct jadard_panel_desc kingdisplay_=
kd101ne3_40ti_desc =3D {
>> >       .reset_before_power_off_vcioo =3D true,
>> >       .vcioo_to_lp11_delay_ms =3D 5,
>> >       .lp11_to_reset_delay_ms =3D 10,
>> > -     .exit_sleep_to_display_on_delay_ms =3D 120,
>> > -     .display_on_delay_ms =3D 20,
>> >       .backlight_off_to_display_off_delay_ms =3D 100,
>> >       .display_off_to_enter_sleep_delay_ms =3D 50,
>> >       .enter_sleep_to_reset_down_delay_ms =3D 100,
>> > @@ -1074,6 +1071,16 @@ static int melfas_lmfbx101117480_init_cmds(stru=
ct jadard *jadard)
>> >       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x02);
>> >       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe7, 0x06);
>> >
>> > +     mipi_dsi_msleep(&dsi_ctx, 120);
>> > +
>> > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>> > +
>> > +     mipi_dsi_msleep(&dsi_ctx, 120);
>> > +
>> > +     mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>> > +
>> > +     mipi_dsi_msleep(&dsi_ctx, 20);
>> > +
>> >       return dsi_ctx.accum_err;
>> >  };
>> >
>> > @@ -1102,8 +1109,6 @@ static const struct jadard_panel_desc melfas_lmf=
bx101117480_desc =3D {
>> >       .reset_before_power_off_vcioo =3D true,
>> >       .vcioo_to_lp11_delay_ms =3D 5,
>> >       .lp11_to_reset_delay_ms =3D 10,
>> > -     .exit_sleep_to_display_on_delay_ms =3D 120,
>> > -     .display_on_delay_ms =3D 20,
>> >       .backlight_off_to_display_off_delay_ms =3D 100,
>> >       .display_off_to_enter_sleep_delay_ms =3D 50,
>> >       .enter_sleep_to_reset_down_delay_ms =3D 100,
>>
>> --
>> Jani Nikula, Intel

--=20
Jani Nikula, Intel
