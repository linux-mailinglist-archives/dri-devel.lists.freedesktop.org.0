Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35024C65FBC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 20:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C77110E3F5;
	Mon, 17 Nov 2025 19:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZuXoanuv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5990210E3F5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 19:35:25 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b8b33cdf470so139366a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 11:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763408125; x=1764012925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vNEhjCgih2yIr+gO1V8TH7wfRldIE88Z4UFGLGIL54=;
 b=ZuXoanuvTMvAF/EGRaUwr2tZIfiNA0KFSH91qi7TEmvY+LFtOogAbczbIAH79oNSQa
 +b7B72sI9D7dH959SpOTGtQDsjO1TmgowQXnEywwfP0PY3jWLRyARZ8EKvJ8dd5Ucf0t
 IG2h+iRPyiGDCvpeURSpdFg9UCf5j2XEEIpd6AMIQxnk3+BoJom1OkDfXhR09PhQKwk0
 z6suK4TxI5RmUj6k6fSTdUe1Orv8YfxhCCgbgPwFn90VSKEyFk5CfZ7FZmUPpuGbze++
 m7ObL7XhGyhzMZmSutj1/ZUtHbw0EB5DECdNZp4E6MCaPMjVMCdD0QLEttBvJwZhnQif
 YzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763408125; x=1764012925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8vNEhjCgih2yIr+gO1V8TH7wfRldIE88Z4UFGLGIL54=;
 b=gbGMbGV2LJAj6ddvcB/+dZDSbiBM0cehJfyeTxhHp3wVZ95D2aZRw3qvLyFtxQfXxh
 1gYhjdiHRMwIxmmJVZlosycSl1e3GTZn2Qf7PMc/oURXwdXzIhfrEEu4mJ0Ul2O1vrL3
 w0iYZFL4attTotIoMAb2sTmbtREUfeszXeRODigSWmtqFQC0l5OwCjbJF7rvYfDzCGWG
 ecsl6QhGrEg1370BSL1iG9xrptAsGENjvBjoV+i+6Wg9g44JmfBPtfgLwqg+e2fO1xi+
 Vl54uIUTzrRC0e0/Q3KBOWTn8sgNDRHgygQmkjvctZSLdq54min1fzrOBA1PgiO8pYQX
 GknQ==
X-Gm-Message-State: AOJu0Yw+HnRi3zga26VmnXN2BnyGYXibTNjPs9wGkHJp9IS1y239Ex8e
 bqHUOufuZJeQ4dl4PN43AbTX7Tpm9N+X0KIe1RuP7VsUq4wI3N1mpo15sXa6ct3oVdvchpYFH43
 LJFinyTn5yLJqvxWWSS9r4j2q0LBsUR8=
X-Gm-Gg: ASbGncvRG7MZGx3bzAqCbqubqoQYiY4b+FJjsa9Bmoiv4XamIT7mXZxFjHcGc3FfdjI
 3YpQJmuAlOEt5QJL9QjlVWpXX8uLy4RhZ5tNvRxonuWNojSBnPDl+/tLICWjx2/Ry2igrC7uHOZ
 4YJZeSAOkjSvb1U9xdTLFH4dH30WDhI8zh4gFOXP1grOrA1dwRHRPy0chlCiMcPuEF6Hr9yE/hP
 QXskObwZalN0cE/Bb3Lz4ZSkAhKehrzReolxw8w7KmoPaNQcf0O9dMwpvA7+8dXP+q3nGw=
X-Google-Smtp-Source: AGHT+IEVKZU2+KmgRi2Qygjf3QF3mvfM6pYNfiqJWhO+GwlrQ3xkVdW75z+AcmJDnNWUpRjIunkYBYcHFg5NXzRZAxk=
X-Received: by 2002:a05:7022:ff4b:b0:119:e56b:46b7 with SMTP id
 a92af1059eb24-11b4915406bmr5281629c88.1.1763408124587; Mon, 17 Nov 2025
 11:35:24 -0800 (PST)
MIME-Version: 1.0
References: <20251108013505.671174-1-rdunlap@infradead.org>
In-Reply-To: <20251108013505.671174-1-rdunlap@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 Nov 2025 14:35:12 -0500
X-Gm-Features: AWmQ_blilGM0cG2hIDZU5_afAScUfsV6em2b7z8uAKlEs8lLC0j3wgTLBqwnN8Y
Message-ID: <CADnq5_PkKDWhNheSDkkXfyii8xak=rS=rxcWpfu3pQJSLiBpuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: dc_hw_sequencer.c: remove kernel-doc
 comments
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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

Applied.  Thanks!

Alex

On Fri, Nov 7, 2025 at 8:41=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> Change comments from kernel-doc style "/**" to normal C comments
> "/*" since the comments are not in kernel-doc format.
> This fixes around 39 kernel-doc warnings like this one:
>
> drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c:1322: warning:
>  This comment starts with '/**', but isn't a kernel-doc comment.
>  Refer Documentation/doc-guide/kernel-doc.rst
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202511062036.Ry8Z2APc-lkp@i=
ntel.com/
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <siqueira@igalia.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c |   80 +++++-----
>  1 file changed, 40 insertions(+), 40 deletions(-)
>
> --- linux-next-20251107.orig/drivers/gpu/drm/amd/display/dc/core/dc_hw_se=
quencer.c
> +++ linux-next-20251107/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequenc=
er.c
> @@ -265,7 +265,7 @@ void color_space_to_black_color(
>                         black_color_format[BLACK_COLOR_FORMAT_RGB_LIMITED=
];
>                 break;
>
> -       /**
> +       /*
>          * Remove default and add case for all color space
>          * so when we forget to add new color space
>          * compiler will give a warning
> @@ -1318,7 +1318,7 @@ void hwss_execute_sequence(struct dc *dc
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add OPTC pipe control lock to block sequence
>   */
>  void hwss_add_optc_pipe_control_lock(struct block_sequence_state *seq_st=
ate,
> @@ -1335,7 +1335,7 @@ void hwss_add_optc_pipe_control_lock(str
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add HUBP set flip control GSL to block sequence
>   */
>  void hwss_add_hubp_set_flip_control_gsl(struct block_sequence_state *seq=
_state,
> @@ -1350,7 +1350,7 @@ void hwss_add_hubp_set_flip_control_gsl(
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add HUBP program triplebuffer to block sequence
>   */
>  void hwss_add_hubp_program_triplebuffer(struct block_sequence_state *seq=
_state,
> @@ -1367,7 +1367,7 @@ void hwss_add_hubp_program_triplebuffer(
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add HUBP update plane address to block sequence
>   */
>  void hwss_add_hubp_update_plane_addr(struct block_sequence_state *seq_st=
ate,
> @@ -1382,7 +1382,7 @@ void hwss_add_hubp_update_plane_addr(str
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add DPP set input transfer function to block seque=
nce
>   */
>  void hwss_add_dpp_set_input_transfer_func(struct block_sequence_state *s=
eq_state,
> @@ -1399,7 +1399,7 @@ void hwss_add_dpp_set_input_transfer_fun
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add DPP program gamut remap to block sequence
>   */
>  void hwss_add_dpp_program_gamut_remap(struct block_sequence_state *seq_s=
tate,
> @@ -1412,7 +1412,7 @@ void hwss_add_dpp_program_gamut_remap(st
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add DPP program bias and scale to block sequence
>   */
>  void hwss_add_dpp_program_bias_and_scale(struct block_sequence_state *se=
q_state, struct pipe_ctx *pipe_ctx)
> @@ -1424,7 +1424,7 @@ void hwss_add_dpp_program_bias_and_scale
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add OPTC program manual trigger to block sequence
>   */
>  void hwss_add_optc_program_manual_trigger(struct block_sequence_state *s=
eq_state,
> @@ -1437,7 +1437,7 @@ void hwss_add_optc_program_manual_trigge
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add DPP set output transfer function to block sequ=
ence
>   */
>  void hwss_add_dpp_set_output_transfer_func(struct block_sequence_state *=
seq_state,
> @@ -1454,7 +1454,7 @@ void hwss_add_dpp_set_output_transfer_fu
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add MPC update visual confirm to block sequence
>   */
>  void hwss_add_mpc_update_visual_confirm(struct block_sequence_state *seq=
_state,
> @@ -1471,7 +1471,7 @@ void hwss_add_mpc_update_visual_confirm(
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add MPC power on MPC mem PWR to block sequence
>   */
>  void hwss_add_mpc_power_on_mpc_mem_pwr(struct block_sequence_state *seq_=
state,
> @@ -1488,7 +1488,7 @@ void hwss_add_mpc_power_on_mpc_mem_pwr(s
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add MPC set output CSC to block sequence
>   */
>  void hwss_add_mpc_set_output_csc(struct block_sequence_state *seq_state,
> @@ -1507,7 +1507,7 @@ void hwss_add_mpc_set_output_csc(struct
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add MPC set OCSC default to block sequence
>   */
>  void hwss_add_mpc_set_ocsc_default(struct block_sequence_state *seq_stat=
e,
> @@ -1526,7 +1526,7 @@ void hwss_add_mpc_set_ocsc_default(struc
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add DMUB send DMCUB command to block sequence
>   */
>  void hwss_add_dmub_send_dmcub_cmd(struct block_sequence_state *seq_state=
,
> @@ -1543,7 +1543,7 @@ void hwss_add_dmub_send_dmcub_cmd(struct
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add DMUB SubVP save surface address to block seque=
nce
>   */
>  void hwss_add_dmub_subvp_save_surf_addr(struct block_sequence_state *seq=
_state,
> @@ -1560,7 +1560,7 @@ void hwss_add_dmub_subvp_save_surf_addr(
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add HUBP wait for DCC meta propagation to block se=
quence
>   */
>  void hwss_add_hubp_wait_for_dcc_meta_prop(struct block_sequence_state *s=
eq_state,
> @@ -1575,7 +1575,7 @@ void hwss_add_hubp_wait_for_dcc_meta_pro
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add HUBP wait pipe read start to block sequence
>   */
>  void hwss_add_hubp_wait_pipe_read_start(struct block_sequence_state *seq=
_state,
> @@ -1588,7 +1588,7 @@ void hwss_add_hubp_wait_pipe_read_start(
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add HWS apply update flags for phantom to block se=
quence
>   */
>  void hwss_add_hws_apply_update_flags_for_phantom(struct block_sequence_s=
tate *seq_state,
> @@ -1601,7 +1601,7 @@ void hwss_add_hws_apply_update_flags_for
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add HWS update phantom VP position to block sequen=
ce
>   */
>  void hwss_add_hws_update_phantom_vp_position(struct block_sequence_state=
 *seq_state,
> @@ -1618,7 +1618,7 @@ void hwss_add_hws_update_phantom_vp_posi
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add OPTC set ODM combine to block sequence
>   */
>  void hwss_add_optc_set_odm_combine(struct block_sequence_state *seq_stat=
e,
> @@ -1636,7 +1636,7 @@ void hwss_add_optc_set_odm_combine(struc
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add OPTC set ODM bypass to block sequence
>   */
>  void hwss_add_optc_set_odm_bypass(struct block_sequence_state *seq_state=
,
> @@ -1659,7 +1659,7 @@ void hwss_send_dmcub_cmd(union block_seq
>         dc_wake_and_execute_dmub_cmd(ctx, cmd, wait_type);
>  }
>
> -/**
> +/*
>   * Helper function to add TG program global sync to block sequence
>   */
>  void hwss_add_tg_program_global_sync(struct block_sequence_state *seq_st=
ate,
> @@ -1682,7 +1682,7 @@ void hwss_add_tg_program_global_sync(str
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add TG wait for state to block sequence
>   */
>  void hwss_add_tg_wait_for_state(struct block_sequence_state *seq_state,
> @@ -1697,7 +1697,7 @@ void hwss_add_tg_wait_for_state(struct b
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add TG set VTG params to block sequence
>   */
>  void hwss_add_tg_set_vtg_params(struct block_sequence_state *seq_state,
> @@ -1714,7 +1714,7 @@ void hwss_add_tg_set_vtg_params(struct b
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add TG setup vertical interrupt2 to block sequence
>   */
>  void hwss_add_tg_setup_vertical_interrupt2(struct block_sequence_state *=
seq_state,
> @@ -1728,7 +1728,7 @@ void hwss_add_tg_setup_vertical_interrup
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add DPP set HDR multiplier to block sequence
>   */
>  void hwss_add_dpp_set_hdr_multiplier(struct block_sequence_state *seq_st=
ate,
> @@ -1742,7 +1742,7 @@ void hwss_add_dpp_set_hdr_multiplier(str
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add HUBP program DET size to block sequence
>   */
>  void hwss_add_hubp_program_det_size(struct block_sequence_state *seq_sta=
te,
> @@ -1785,7 +1785,7 @@ void hwss_add_hubbub_force_pstate_change
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add HUBP program DET segments to block sequence
>   */
>  void hwss_add_hubp_program_det_segments(struct block_sequence_state *seq=
_state,
> @@ -1802,7 +1802,7 @@ void hwss_add_hubp_program_det_segments(
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add OPP set dynamic expansion to block sequence
>   */
>  void hwss_add_opp_set_dyn_expansion(struct block_sequence_state *seq_sta=
te,
> @@ -1821,7 +1821,7 @@ void hwss_add_opp_set_dyn_expansion(stru
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add OPP program FMT to block sequence
>   */
>  void hwss_add_opp_program_fmt(struct block_sequence_state *seq_state,
> @@ -1852,7 +1852,7 @@ void hwss_add_opp_program_left_edge_extr
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add ABM set pipe to block sequence
>   */
>  void hwss_add_abm_set_pipe(struct block_sequence_state *seq_state,
> @@ -1867,7 +1867,7 @@ void hwss_add_abm_set_pipe(struct block_
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add ABM set level to block sequence
>   */
>  void hwss_add_abm_set_level(struct block_sequence_state *seq_state,
> @@ -1882,7 +1882,7 @@ void hwss_add_abm_set_level(struct block
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add TG enable CRTC to block sequence
>   */
>  void hwss_add_tg_enable_crtc(struct block_sequence_state *seq_state,
> @@ -1895,7 +1895,7 @@ void hwss_add_tg_enable_crtc(struct bloc
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add HUBP wait flip pending to block sequence
>   */
>  void hwss_add_hubp_wait_flip_pending(struct block_sequence_state *seq_st=
ate,
> @@ -1912,7 +1912,7 @@ void hwss_add_hubp_wait_flip_pending(str
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add TG wait double buffer pending to block sequenc=
e
>   */
>  void hwss_add_tg_wait_double_buffer_pending(struct block_sequence_state =
*seq_state,
> @@ -3270,7 +3270,7 @@ void hwss_add_opp_set_disp_pattern_gener
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add MPC update blending to block sequence
>   */
>  void hwss_add_mpc_update_blending(struct block_sequence_state *seq_state=
,
> @@ -3287,7 +3287,7 @@ void hwss_add_mpc_update_blending(struct
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add MPC insert plane to block sequence
>   */
>  void hwss_add_mpc_insert_plane(struct block_sequence_state *seq_state,
> @@ -3312,7 +3312,7 @@ void hwss_add_mpc_insert_plane(struct bl
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add MPC assert idle MPCC to block sequence
>   */
>  void hwss_add_mpc_assert_idle_mpcc(struct block_sequence_state *seq_stat=
e,
> @@ -3327,7 +3327,7 @@ void hwss_add_mpc_assert_idle_mpcc(struc
>         }
>  }
>
> -/**
> +/*
>   * Helper function to add HUBP set blank to block sequence
>   */
>  void hwss_add_hubp_set_blank(struct block_sequence_state *seq_state,
