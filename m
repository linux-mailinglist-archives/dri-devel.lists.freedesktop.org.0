Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF3F302966
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 18:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31A36E0C8;
	Mon, 25 Jan 2021 17:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6BF6E09F;
 Mon, 25 Jan 2021 17:57:16 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id e70so13564389ote.11;
 Mon, 25 Jan 2021 09:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NMwzKT7ktJmn3D6xJkxUVnsUn1OrLX46FlrL0AsY5fw=;
 b=lHktMZfRoJ9IkZ9W26uHmuqwOTgpnAXPGphalH6M4iKPwEZ8Iza28yVZ6sCiTdK9hh
 Fi4XI1NmRY9amiOz1KqIrQhAr/SaSGdmWmmdQHH4Ewc+66zelYSegcqFZHTMdvte6dLz
 Dr+XC0f0dv6QI51aYemLRokUs3F1IvIN4blvQt/PsvEQqFyPAwKaRjJkAuMhRJiydfBG
 45D0mfwmgkahSVtagxndYT21sLYdl7nn/ZvuuE0RTcIXAbYmsy3ZlzRYUcEofwYTJ2+e
 L4O8VW7f2i5ig9PVeWTERfbOCrygg+VNc/ePyE92oRRXh5/5qDYj1O3k/lApS/dMKfz/
 Ff3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NMwzKT7ktJmn3D6xJkxUVnsUn1OrLX46FlrL0AsY5fw=;
 b=KENKjkZtp95suPXtHJL4A2Sc+rfG+Y2r/roFbgaUJHsWa8ZyYiqnw240J7E+YJyyR6
 wTXrIxZEoWd6pOoaPDcQBtvIH0RlGLd+Guwnnm1fcKqLeAVzKr0+kLs0BrI8xAwnnYoF
 LETbut2JAIWLoj5xk03LeRow/qGyFcQVO5o0I9PCB9xl+8+JHCi5o6E8175ON8OmYHJl
 kLmfLb7G7eCWc92du/aHtdmfd/ct2QqjcO/tegSHxSxyy9yL7aB9EuN30urMU4OZAzBm
 Al5xBEQGIOAILevmd7LjcupGTV3om22BIZRJi61DovZdPoeb/WBA4OSEXiL5eD4r5wvC
 N+Og==
X-Gm-Message-State: AOAM532QKJvVtVVYEJ6zhwgTJSM0dwVrL9y27LyXB7typhy5MPsbWSx9
 QRoZ3UdUKrD0U/JS1MxOvufsOKvta1eQ2XIYfb0=
X-Google-Smtp-Source: ABdhPJy502347firlsqDo862ryJ46G2dwR7qIM2clQvlt3priNlSlIo000RxSPOgvJ6cQ79rgGqCkMw/xZPyQB+UShY=
X-Received: by 2002:a9d:784a:: with SMTP id c10mr1328195otm.132.1611597435531; 
 Mon, 25 Jan 2021 09:57:15 -0800 (PST)
MIME-Version: 1.0
References: <20210121061704.21090-1-mario.kleiner.de@gmail.com>
 <20210121061704.21090-3-mario.kleiner.de@gmail.com>
In-Reply-To: <20210121061704.21090-3-mario.kleiner.de@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Jan 2021 12:57:04 -0500
Message-ID: <CADnq5_MaiO_OmULhcv2qtVBK2kXURd15Xe4QgBm05HxHhc-ASg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/display: Fix HDMI deep color output for DCE
 6-11.
To: Mario Kleiner <mario.kleiner.de@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 21, 2021 at 1:17 AM Mario Kleiner
<mario.kleiner.de@gmail.com> wrote:
>
> This fixes corrupted display output in HDMI deep color
> 10/12 bpc mode at least as observed on AMD Mullins, DCE-8.3.
>
> It will hopefully also provide fixes for other DCE's up to
> DCE-11, assuming those will need similar fixes, but i could
> not test that for HDMI due to lack of suitable hw, so viewer
> discretion is advised.
>
> dce110_stream_encoder_hdmi_set_stream_attribute() is used for
> HDMI setup on all DCE's and is missing color_depth assignment.
>
> dce110_program_pix_clk() is used for pixel clock setup on HDMI
> for DCE 6-11, and is missing color_depth assignment.
>
> Additionally some of the underlying Atombios specific encoder
> and pixelclock setup functions are missing code which is in
> the classic amdgpu kms modesetting path and the in the radeon
> kms driver for DCE6/DCE8.
>
> encoder_control_digx_v3() - Was missing setup code wrt. amdgpu
> and radeon kms classic drivers. Added here, but untested due to
> lack of suitable test hw.
>
> encoder_control_digx_v4() - Added missing setup code.
> Successfully tested on AMD mullins / DCE-8.3 with HDMI deep color
> output at 10 bpc and 12 bpc.
>
> Note that encoder_control_digx_v5() has proper setup code in place
> and is used, e.g., by DCE-11.2, but this code wasn't used for deep
> color setup due to the missing cntl.color_depth setup in the calling
> function for HDMI.
>
> set_pixel_clock_v5() - Missing setup code wrt. classic amdgpu/radeon
> kms. Added here, but untested due to lack of hw.
>
> set_pixel_clock_v6() - Missing setup code added. Successfully tested
> on AMD mullins DCE-8.3. This fixes corrupted display output at HDMI
> deep color output with 10 bpc or 12 bpc.
>
> Fixes: 4562236b3bc0 ("drm/amd/dc: Add dc display driver (v2)")
>
> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Cc: Harry Wentland <harry.wentland@amd.com>

These make sense. I've applied the series.  I'll let the display guys
gauge the other points in your cover letter.

Alex


> ---
>  .../drm/amd/display/dc/bios/command_table.c   | 61 +++++++++++++++++++
>  .../drm/amd/display/dc/dce/dce_clock_source.c | 14 +++++
>  .../amd/display/dc/dce/dce_stream_encoder.c   |  1 +
>  3 files changed, 76 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table.c b/drivers/gpu/drm/amd/display/dc/bios/command_table.c
> index 070459e3e407..afc10b954ffa 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/command_table.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/command_table.c
> @@ -245,6 +245,23 @@ static enum bp_result encoder_control_digx_v3(
>                                         cntl->enable_dp_audio);
>         params.ucLaneNum = (uint8_t)(cntl->lanes_number);
>
> +       switch (cntl->color_depth) {
> +       case COLOR_DEPTH_888:
> +               params.ucBitPerColor = PANEL_8BIT_PER_COLOR;
> +               break;
> +       case COLOR_DEPTH_101010:
> +               params.ucBitPerColor = PANEL_10BIT_PER_COLOR;
> +               break;
> +       case COLOR_DEPTH_121212:
> +               params.ucBitPerColor = PANEL_12BIT_PER_COLOR;
> +               break;
> +       case COLOR_DEPTH_161616:
> +               params.ucBitPerColor = PANEL_16BIT_PER_COLOR;
> +               break;
> +       default:
> +               break;
> +       }
> +
>         if (EXEC_BIOS_CMD_TABLE(DIGxEncoderControl, params))
>                 result = BP_RESULT_OK;
>
> @@ -274,6 +291,23 @@ static enum bp_result encoder_control_digx_v4(
>                                         cntl->enable_dp_audio));
>         params.ucLaneNum = (uint8_t)(cntl->lanes_number);
>
> +       switch (cntl->color_depth) {
> +       case COLOR_DEPTH_888:
> +               params.ucBitPerColor = PANEL_8BIT_PER_COLOR;
> +               break;
> +       case COLOR_DEPTH_101010:
> +               params.ucBitPerColor = PANEL_10BIT_PER_COLOR;
> +               break;
> +       case COLOR_DEPTH_121212:
> +               params.ucBitPerColor = PANEL_12BIT_PER_COLOR;
> +               break;
> +       case COLOR_DEPTH_161616:
> +               params.ucBitPerColor = PANEL_16BIT_PER_COLOR;
> +               break;
> +       default:
> +               break;
> +       }
> +
>         if (EXEC_BIOS_CMD_TABLE(DIGxEncoderControl, params))
>                 result = BP_RESULT_OK;
>
> @@ -1057,6 +1091,19 @@ static enum bp_result set_pixel_clock_v5(
>                  * driver choose program it itself, i.e. here we program it
>                  * to 888 by default.
>                  */
> +               if (bp_params->signal_type == SIGNAL_TYPE_HDMI_TYPE_A)
> +                       switch (bp_params->color_depth) {
> +                       case TRANSMITTER_COLOR_DEPTH_30:
> +                               /* yes this is correct, the atom define is wrong */
> +                               clk.sPCLKInput.ucMiscInfo |= PIXEL_CLOCK_V5_MISC_HDMI_32BPP;
> +                               break;
> +                       case TRANSMITTER_COLOR_DEPTH_36:
> +                               /* yes this is correct, the atom define is wrong */
> +                               clk.sPCLKInput.ucMiscInfo |= PIXEL_CLOCK_V5_MISC_HDMI_30BPP;
> +                               break;
> +                       default:
> +                               break;
> +                       }
>
>                 if (EXEC_BIOS_CMD_TABLE(SetPixelClock, clk))
>                         result = BP_RESULT_OK;
> @@ -1135,6 +1182,20 @@ static enum bp_result set_pixel_clock_v6(
>                  * driver choose program it itself, i.e. here we pass required
>                  * target rate that includes deep color.
>                  */
> +               if (bp_params->signal_type == SIGNAL_TYPE_HDMI_TYPE_A)
> +                       switch (bp_params->color_depth) {
> +                       case TRANSMITTER_COLOR_DEPTH_30:
> +                               clk.sPCLKInput.ucMiscInfo |= PIXEL_CLOCK_V6_MISC_HDMI_30BPP_V6;
> +                               break;
> +                       case TRANSMITTER_COLOR_DEPTH_36:
> +                               clk.sPCLKInput.ucMiscInfo |= PIXEL_CLOCK_V6_MISC_HDMI_36BPP_V6;
> +                               break;
> +                       case TRANSMITTER_COLOR_DEPTH_48:
> +                               clk.sPCLKInput.ucMiscInfo |= PIXEL_CLOCK_V6_MISC_HDMI_48BPP;
> +                               break;
> +                       default:
> +                               break;
> +                       }
>
>                 if (EXEC_BIOS_CMD_TABLE(SetPixelClock, clk))
>                         result = BP_RESULT_OK;
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
> index fb733f573715..466f8f5803c9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
> @@ -871,6 +871,20 @@ static bool dce110_program_pix_clk(
>         bp_pc_params.flags.SET_EXTERNAL_REF_DIV_SRC =
>                                         pll_settings->use_external_clk;
>
> +       switch (pix_clk_params->color_depth) {
> +       case COLOR_DEPTH_101010:
> +               bp_pc_params.color_depth = TRANSMITTER_COLOR_DEPTH_30;
> +               break;
> +       case COLOR_DEPTH_121212:
> +               bp_pc_params.color_depth = TRANSMITTER_COLOR_DEPTH_36;
> +               break;
> +       case COLOR_DEPTH_161616:
> +               bp_pc_params.color_depth = TRANSMITTER_COLOR_DEPTH_48;
> +               break;
> +       default:
> +               break;
> +       }
> +
>         if (clk_src->bios->funcs->set_pixel_clock(
>                         clk_src->bios, &bp_pc_params) != BP_RESULT_OK)
>                 return false;
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
> index ada57f745fd7..19e380e0a330 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
> @@ -564,6 +564,7 @@ static void dce110_stream_encoder_hdmi_set_stream_attribute(
>         cntl.enable_dp_audio = enable_audio;
>         cntl.pixel_clock = actual_pix_clk_khz;
>         cntl.lanes_number = LANE_COUNT_FOUR;
> +       cntl.color_depth = crtc_timing->display_color_depth;
>
>         if (enc110->base.bp->funcs->encoder_control(
>                         enc110->base.bp, &cntl) != BP_RESULT_OK)
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
