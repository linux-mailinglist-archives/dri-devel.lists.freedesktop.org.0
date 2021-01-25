Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F966302B7F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 20:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B5D8919A;
	Mon, 25 Jan 2021 19:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6098919A;
 Mon, 25 Jan 2021 19:24:17 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id bx12so16866516edb.8;
 Mon, 25 Jan 2021 11:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m5kyWwSkQl1SymjGd1vo2A3XDUkXF/sxHcQgHiQjGwo=;
 b=tutVVJdMc8TRLWvBDnv/oqrr+9oc7ZT0fisxi4yDqWI6FB0S0gp9gAhvJilRCI5G6w
 Ch/KhuXlegSZ+L766Et35zCTpDtTTgqxZcDWGZz44n0ajm78BBYh3WpXfU1kl5xyut0A
 i2Vw8b62EagsaZmJN9mFmRWNXEFzRMLt0h+cKaEd3GPthfOWob00mk7kOaxd06dPhQbl
 4iJsDgsIaJsh0cEZ4A5lbdodEWF7zIX9E1231MvLDyd8IokjPS+YCsL6Lw+zqKDwBS12
 DGwP5PHNWsKmW2qs2oJyc0H1klfmArblE8+pe3KAMf1/5aYl+XKdkVkeC6/KkmTARFTF
 uGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m5kyWwSkQl1SymjGd1vo2A3XDUkXF/sxHcQgHiQjGwo=;
 b=oNxiP9Bemq/7QaSbtEBt4Thh4c08zqPu5rBGxtywJDresGZhQ+/LajAnmqt7S7FftE
 CcxjQKFjs1Kzsg881k86vyQfD3fcVhfuEeY4iP+M/+olCKvWIk3l2Bk3OAsjX/M5Ww3g
 qfLfBS2NH+88rNGHg6QW0J1RTb7rIdwWpgCPeb9jkD48bquKiyvEme5wdgxizuwZWKBq
 4GOJXw2X7TBhWq7mW34lZ84KYhtVxC1J6Szo/Hw4rJBFAilHhUjBNi21KQYZ2f59HyJu
 jI5LdI0FKw6cfpa6BGu00363ThT0ZoJLIo4sseVBcW625rHUsUsx1zN/UEPXFURnU66W
 KsWA==
X-Gm-Message-State: AOAM531TRC4d4n5yWudpEzdZ4tCefhu28ACiYVLa/+/Fmn+llkTw/2KP
 u0GBzq3o0Dvxt5LHHEe9ABIlWqr7Qp90oCiIUKY=
X-Google-Smtp-Source: ABdhPJzlpwzK7R/1tMv1EO7RUr+t7j9Oj98dPWIS+XcAGJWC6t+kQaGFW6dpRtD3ukrd6OsftsUPB8bMjDxvXl0pERk=
X-Received: by 2002:a50:cd8c:: with SMTP id p12mr1762515edi.380.1611602656257; 
 Mon, 25 Jan 2021 11:24:16 -0800 (PST)
MIME-Version: 1.0
References: <20210121061704.21090-1-mario.kleiner.de@gmail.com>
 <20210121061704.21090-3-mario.kleiner.de@gmail.com>
 <CADnq5_MaiO_OmULhcv2qtVBK2kXURd15Xe4QgBm05HxHhc-ASg@mail.gmail.com>
 <25c30592-43aa-50f6-8904-63f983391f56@amd.com>
In-Reply-To: <25c30592-43aa-50f6-8904-63f983391f56@amd.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Mon, 25 Jan 2021 20:24:04 +0100
Message-ID: <CAEsyxyh6ciQab9t6sRAPyR9RjsGLErZPSibuhCnR1YtcOym1mQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/display: Fix HDMI deep color output for DCE
 6-11.
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2111264373=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2111264373==
Content-Type: multipart/alternative; boundary="000000000000d86a4305b9be7b58"

--000000000000d86a4305b9be7b58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Alex and Nicholas! Brings quite a bit of extra shiny to those older
asics :)

Nicholas, any thoughts on my cover-letter wrt. why a similar patch (that I
wrote and tested to no good or bad effect) not seem to be needed on DCN,
and probably not DCE-11.2+ either? Is what is left in DC for those asic's
just dead code? My Atombios disassembly sort of pointed into that
direction, but reading disassembly is not easy on the brain, and my brain
was getting quite mushy towards the end of digging through all the code. So
some official statement would add peace of mind on my side. Is there a
certain DCE version at which your team starts validating output precision /
HDR etc. on hw?

Thanks,
-mario


On Mon, Jan 25, 2021 at 8:16 PM Kazlauskas, Nicholas <
nicholas.kazlauskas@amd.com> wrote:

> On 2021-01-25 12:57 p.m., Alex Deucher wrote:
> > On Thu, Jan 21, 2021 at 1:17 AM Mario Kleiner
> > <mario.kleiner.de@gmail.com> wrote:
> >>
> >> This fixes corrupted display output in HDMI deep color
> >> 10/12 bpc mode at least as observed on AMD Mullins, DCE-8.3.
> >>
> >> It will hopefully also provide fixes for other DCE's up to
> >> DCE-11, assuming those will need similar fixes, but i could
> >> not test that for HDMI due to lack of suitable hw, so viewer
> >> discretion is advised.
> >>
> >> dce110_stream_encoder_hdmi_set_stream_attribute() is used for
> >> HDMI setup on all DCE's and is missing color_depth assignment.
> >>
> >> dce110_program_pix_clk() is used for pixel clock setup on HDMI
> >> for DCE 6-11, and is missing color_depth assignment.
> >>
> >> Additionally some of the underlying Atombios specific encoder
> >> and pixelclock setup functions are missing code which is in
> >> the classic amdgpu kms modesetting path and the in the radeon
> >> kms driver for DCE6/DCE8.
> >>
> >> encoder_control_digx_v3() - Was missing setup code wrt. amdgpu
> >> and radeon kms classic drivers. Added here, but untested due to
> >> lack of suitable test hw.
> >>
> >> encoder_control_digx_v4() - Added missing setup code.
> >> Successfully tested on AMD mullins / DCE-8.3 with HDMI deep color
> >> output at 10 bpc and 12 bpc.
> >>
> >> Note that encoder_control_digx_v5() has proper setup code in place
> >> and is used, e.g., by DCE-11.2, but this code wasn't used for deep
> >> color setup due to the missing cntl.color_depth setup in the calling
> >> function for HDMI.
> >>
> >> set_pixel_clock_v5() - Missing setup code wrt. classic amdgpu/radeon
> >> kms. Added here, but untested due to lack of hw.
> >>
> >> set_pixel_clock_v6() - Missing setup code added. Successfully tested
> >> on AMD mullins DCE-8.3. This fixes corrupted display output at HDMI
> >> deep color output with 10 bpc or 12 bpc.
> >>
> >> Fixes: 4562236b3bc0 ("drm/amd/dc: Add dc display driver (v2)")
> >>
> >> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> >> Cc: Harry Wentland <harry.wentland@amd.com>
> >
> > These make sense. I've applied the series.  I'll let the display guys
> > gauge the other points in your cover letter.
> >
> > Alex
>
> I don't have any concerns with this patch.
>
> Even though it's already applied feel free to have my:
>
> Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>
> Regards,
> Nicholas Kazlauskas
>
> >
> >
> >> ---
> >>   .../drm/amd/display/dc/bios/command_table.c   | 61 +++++++++++++++++=
++
> >>   .../drm/amd/display/dc/dce/dce_clock_source.c | 14 +++++
> >>   .../amd/display/dc/dce/dce_stream_encoder.c   |  1 +
> >>   3 files changed, 76 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table.c
> b/drivers/gpu/drm/amd/display/dc/bios/command_table.c
> >> index 070459e3e407..afc10b954ffa 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/bios/command_table.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/bios/command_table.c
> >> @@ -245,6 +245,23 @@ static enum bp_result encoder_control_digx_v3(
> >>                                          cntl->enable_dp_audio);
> >>          params.ucLaneNum =3D (uint8_t)(cntl->lanes_number);
> >>
> >> +       switch (cntl->color_depth) {
> >> +       case COLOR_DEPTH_888:
> >> +               params.ucBitPerColor =3D PANEL_8BIT_PER_COLOR;
> >> +               break;
> >> +       case COLOR_DEPTH_101010:
> >> +               params.ucBitPerColor =3D PANEL_10BIT_PER_COLOR;
> >> +               break;
> >> +       case COLOR_DEPTH_121212:
> >> +               params.ucBitPerColor =3D PANEL_12BIT_PER_COLOR;
> >> +               break;
> >> +       case COLOR_DEPTH_161616:
> >> +               params.ucBitPerColor =3D PANEL_16BIT_PER_COLOR;
> >> +               break;
> >> +       default:
> >> +               break;
> >> +       }
> >> +
> >>          if (EXEC_BIOS_CMD_TABLE(DIGxEncoderControl, params))
> >>                  result =3D BP_RESULT_OK;
> >>
> >> @@ -274,6 +291,23 @@ static enum bp_result encoder_control_digx_v4(
> >>                                          cntl->enable_dp_audio));
> >>          params.ucLaneNum =3D (uint8_t)(cntl->lanes_number);
> >>
> >> +       switch (cntl->color_depth) {
> >> +       case COLOR_DEPTH_888:
> >> +               params.ucBitPerColor =3D PANEL_8BIT_PER_COLOR;
> >> +               break;
> >> +       case COLOR_DEPTH_101010:
> >> +               params.ucBitPerColor =3D PANEL_10BIT_PER_COLOR;
> >> +               break;
> >> +       case COLOR_DEPTH_121212:
> >> +               params.ucBitPerColor =3D PANEL_12BIT_PER_COLOR;
> >> +               break;
> >> +       case COLOR_DEPTH_161616:
> >> +               params.ucBitPerColor =3D PANEL_16BIT_PER_COLOR;
> >> +               break;
> >> +       default:
> >> +               break;
> >> +       }
> >> +
> >>          if (EXEC_BIOS_CMD_TABLE(DIGxEncoderControl, params))
> >>                  result =3D BP_RESULT_OK;
> >>
> >> @@ -1057,6 +1091,19 @@ static enum bp_result set_pixel_clock_v5(
> >>                   * driver choose program it itself, i.e. here we
> program it
> >>                   * to 888 by default.
> >>                   */
> >> +               if (bp_params->signal_type =3D=3D SIGNAL_TYPE_HDMI_TYP=
E_A)
> >> +                       switch (bp_params->color_depth) {
> >> +                       case TRANSMITTER_COLOR_DEPTH_30:
> >> +                               /* yes this is correct, the atom defin=
e
> is wrong */
> >> +                               clk.sPCLKInput.ucMiscInfo |=3D
> PIXEL_CLOCK_V5_MISC_HDMI_32BPP;
> >> +                               break;
> >> +                       case TRANSMITTER_COLOR_DEPTH_36:
> >> +                               /* yes this is correct, the atom defin=
e
> is wrong */
> >> +                               clk.sPCLKInput.ucMiscInfo |=3D
> PIXEL_CLOCK_V5_MISC_HDMI_30BPP;
> >> +                               break;
> >> +                       default:
> >> +                               break;
> >> +                       }
> >>
> >>                  if (EXEC_BIOS_CMD_TABLE(SetPixelClock, clk))
> >>                          result =3D BP_RESULT_OK;
> >> @@ -1135,6 +1182,20 @@ static enum bp_result set_pixel_clock_v6(
> >>                   * driver choose program it itself, i.e. here we pass
> required
> >>                   * target rate that includes deep color.
> >>                   */
> >> +               if (bp_params->signal_type =3D=3D SIGNAL_TYPE_HDMI_TYP=
E_A)
> >> +                       switch (bp_params->color_depth) {
> >> +                       case TRANSMITTER_COLOR_DEPTH_30:
> >> +                               clk.sPCLKInput.ucMiscInfo |=3D
> PIXEL_CLOCK_V6_MISC_HDMI_30BPP_V6;
> >> +                               break;
> >> +                       case TRANSMITTER_COLOR_DEPTH_36:
> >> +                               clk.sPCLKInput.ucMiscInfo |=3D
> PIXEL_CLOCK_V6_MISC_HDMI_36BPP_V6;
> >> +                               break;
> >> +                       case TRANSMITTER_COLOR_DEPTH_48:
> >> +                               clk.sPCLKInput.ucMiscInfo |=3D
> PIXEL_CLOCK_V6_MISC_HDMI_48BPP;
> >> +                               break;
> >> +                       default:
> >> +                               break;
> >> +                       }
> >>
> >>                  if (EXEC_BIOS_CMD_TABLE(SetPixelClock, clk))
> >>                          result =3D BP_RESULT_OK;
> >> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
> b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
> >> index fb733f573715..466f8f5803c9 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
> >> @@ -871,6 +871,20 @@ static bool dce110_program_pix_clk(
> >>          bp_pc_params.flags.SET_EXTERNAL_REF_DIV_SRC =3D
> >>                                          pll_settings->use_external_cl=
k;
> >>
> >> +       switch (pix_clk_params->color_depth) {
> >> +       case COLOR_DEPTH_101010:
> >> +               bp_pc_params.color_depth =3D TRANSMITTER_COLOR_DEPTH_3=
0;
> >> +               break;
> >> +       case COLOR_DEPTH_121212:
> >> +               bp_pc_params.color_depth =3D TRANSMITTER_COLOR_DEPTH_3=
6;
> >> +               break;
> >> +       case COLOR_DEPTH_161616:
> >> +               bp_pc_params.color_depth =3D TRANSMITTER_COLOR_DEPTH_4=
8;
> >> +               break;
> >> +       default:
> >> +               break;
> >> +       }
> >> +
> >>          if (clk_src->bios->funcs->set_pixel_clock(
> >>                          clk_src->bios, &bp_pc_params) !=3D BP_RESULT_=
OK)
> >>                  return false;
> >> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
> b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
> >> index ada57f745fd7..19e380e0a330 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
> >> @@ -564,6 +564,7 @@ static void
> dce110_stream_encoder_hdmi_set_stream_attribute(
> >>          cntl.enable_dp_audio =3D enable_audio;
> >>          cntl.pixel_clock =3D actual_pix_clk_khz;
> >>          cntl.lanes_number =3D LANE_COUNT_FOUR;
> >> +       cntl.color_depth =3D crtc_timing->display_color_depth;
> >>
> >>          if (enc110->base.bp->funcs->encoder_control(
> >>                          enc110->base.bp, &cntl) !=3D BP_RESULT_OK)
> >> --
> >> 2.25.1
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D04%7C01%7Cnich=
olas.kazlauskas%40amd.com%7C598b2b5e841940b8c27708d8c15aa80d%7C3dd8961fe488=
4e608e11a82d994e183d%7C0%7C0%7C637471942408643835%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3Db9C3Xi%2F2RmNsGyGUN5oBF8U%2BuGyt2w4jUZ2dK8NM4AY%3D&amp;reserved=
=3D0
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D04%7C01%7Cnich=
olas.kazlauskas%40amd.com%7C598b2b5e841940b8c27708d8c15aa80d%7C3dd8961fe488=
4e608e11a82d994e183d%7C0%7C0%7C637471942408643835%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3Db9C3Xi%2F2RmNsGyGUN5oBF8U%2BuGyt2w4jUZ2dK8NM4AY%3D&amp;reserved=
=3D0
> >
>
>

--000000000000d86a4305b9be7b58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Alex and Nicholas! Brings quite a bit of extra=
 shiny to those older asics :)</div><div><br></div><div>Nicholas, any thoug=
hts on my cover-letter wrt. why a similar patch (that I wrote and tested to=
 no good or bad effect) not seem to be needed on DCN, and probably not DCE-=
11.2+ either? Is what is left in DC for those asic&#39;s just dead code? My=
 Atombios disassembly sort of pointed into that direction, but reading disa=
ssembly is not easy on the brain, and my brain was getting quite mushy towa=
rds the end of digging through all the code. So some official statement wou=
ld add peace of mind on my side. Is there a certain DCE version at which yo=
ur team starts validating output precision / HDR etc. on hw?<br></div><div>=
<br></div><div>Thanks,</div><div>-mario</div><div><br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 25,=
 2021 at 8:16 PM Kazlauskas, Nicholas &lt;<a href=3D"mailto:nicholas.kazlau=
skas@amd.com">nicholas.kazlauskas@amd.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 2021-01-25 12:57 p.m., Alex Deu=
cher wrote:<br>
&gt; On Thu, Jan 21, 2021 at 1:17 AM Mario Kleiner<br>
&gt; &lt;<a href=3D"mailto:mario.kleiner.de@gmail.com" target=3D"_blank">ma=
rio.kleiner.de@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; This fixes corrupted display output in HDMI deep color<br>
&gt;&gt; 10/12 bpc mode at least as observed on AMD Mullins, DCE-8.3.<br>
&gt;&gt;<br>
&gt;&gt; It will hopefully also provide fixes for other DCE&#39;s up to<br>
&gt;&gt; DCE-11, assuming those will need similar fixes, but i could<br>
&gt;&gt; not test that for HDMI due to lack of suitable hw, so viewer<br>
&gt;&gt; discretion is advised.<br>
&gt;&gt;<br>
&gt;&gt; dce110_stream_encoder_hdmi_set_stream_attribute() is used for<br>
&gt;&gt; HDMI setup on all DCE&#39;s and is missing color_depth assignment.=
<br>
&gt;&gt;<br>
&gt;&gt; dce110_program_pix_clk() is used for pixel clock setup on HDMI<br>
&gt;&gt; for DCE 6-11, and is missing color_depth assignment.<br>
&gt;&gt;<br>
&gt;&gt; Additionally some of the underlying Atombios specific encoder<br>
&gt;&gt; and pixelclock setup functions are missing code which is in<br>
&gt;&gt; the classic amdgpu kms modesetting path and the in the radeon<br>
&gt;&gt; kms driver for DCE6/DCE8.<br>
&gt;&gt;<br>
&gt;&gt; encoder_control_digx_v3() - Was missing setup code wrt. amdgpu<br>
&gt;&gt; and radeon kms classic drivers. Added here, but untested due to<br=
>
&gt;&gt; lack of suitable test hw.<br>
&gt;&gt;<br>
&gt;&gt; encoder_control_digx_v4() - Added missing setup code.<br>
&gt;&gt; Successfully tested on AMD mullins / DCE-8.3 with HDMI deep color<=
br>
&gt;&gt; output at 10 bpc and 12 bpc.<br>
&gt;&gt;<br>
&gt;&gt; Note that encoder_control_digx_v5() has proper setup code in place=
<br>
&gt;&gt; and is used, e.g., by DCE-11.2, but this code wasn&#39;t used for =
deep<br>
&gt;&gt; color setup due to the missing cntl.color_depth setup in the calli=
ng<br>
&gt;&gt; function for HDMI.<br>
&gt;&gt;<br>
&gt;&gt; set_pixel_clock_v5() - Missing setup code wrt. classic amdgpu/rade=
on<br>
&gt;&gt; kms. Added here, but untested due to lack of hw.<br>
&gt;&gt;<br>
&gt;&gt; set_pixel_clock_v6() - Missing setup code added. Successfully test=
ed<br>
&gt;&gt; on AMD mullins DCE-8.3. This fixes corrupted display output at HDM=
I<br>
&gt;&gt; deep color output with 10 bpc or 12 bpc.<br>
&gt;&gt;<br>
&gt;&gt; Fixes: 4562236b3bc0 (&quot;drm/amd/dc: Add dc display driver (v2)&=
quot;)<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Mario Kleiner &lt;<a href=3D"mailto:mario.kleiner.d=
e@gmail.com" target=3D"_blank">mario.kleiner.de@gmail.com</a>&gt;<br>
&gt;&gt; Cc: Harry Wentland &lt;<a href=3D"mailto:harry.wentland@amd.com" t=
arget=3D"_blank">harry.wentland@amd.com</a>&gt;<br>
&gt; <br>
&gt; These make sense. I&#39;ve applied the series.=C2=A0 I&#39;ll let the =
display guys<br>
&gt; gauge the other points in your cover letter.<br>
&gt; <br>
&gt; Alex<br>
<br>
I don&#39;t have any concerns with this patch.<br>
<br>
Even though it&#39;s already applied feel free to have my:<br>
<br>
Reviewed-by: Nicholas Kazlauskas &lt;<a href=3D"mailto:nicholas.kazlauskas@=
amd.com" target=3D"_blank">nicholas.kazlauskas@amd.com</a>&gt;<br>
<br>
Regards,<br>
Nicholas Kazlauskas<br>
<br>
&gt; <br>
&gt; <br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0.../drm/amd/display/dc/bios/command_table.c=C2=A0 =C2=
=A0| 61 +++++++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0.../drm/amd/display/dc/dce/dce_clock_source.c | 14 +++=
++<br>
&gt;&gt;=C2=A0 =C2=A0.../amd/display/dc/dce/dce_stream_encoder.c=C2=A0 =C2=
=A0|=C2=A0 1 +<br>
&gt;&gt;=C2=A0 =C2=A03 files changed, 76 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table.c b=
/drivers/gpu/drm/amd/display/dc/bios/command_table.c<br>
&gt;&gt; index 070459e3e407..afc10b954ffa 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/bios/command_table.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/bios/command_table.c<br>
&gt;&gt; @@ -245,6 +245,23 @@ static enum bp_result encoder_control_digx_v3=
(<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cntl-&gt;enable_dp_audio);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params.ucLaneNum =3D (uint8_t)(c=
ntl-&gt;lanes_number);<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (cntl-&gt;color_depth) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case COLOR_DEPTH_888:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params.ucB=
itPerColor =3D PANEL_8BIT_PER_COLOR;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case COLOR_DEPTH_101010:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params.ucB=
itPerColor =3D PANEL_10BIT_PER_COLOR;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case COLOR_DEPTH_121212:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params.ucB=
itPerColor =3D PANEL_12BIT_PER_COLOR;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case COLOR_DEPTH_161616:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params.ucB=
itPerColor =3D PANEL_16BIT_PER_COLOR;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (EXEC_BIOS_CMD_TABLE(DIGxEnco=
derControl, params))<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resu=
lt =3D BP_RESULT_OK;<br>
&gt;&gt;<br>
&gt;&gt; @@ -274,6 +291,23 @@ static enum bp_result encoder_control_digx_v4=
(<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cntl-&gt;enable_dp_audio));<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params.ucLaneNum =3D (uint8_t)(c=
ntl-&gt;lanes_number);<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (cntl-&gt;color_depth) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case COLOR_DEPTH_888:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params.ucB=
itPerColor =3D PANEL_8BIT_PER_COLOR;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case COLOR_DEPTH_101010:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params.ucB=
itPerColor =3D PANEL_10BIT_PER_COLOR;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case COLOR_DEPTH_121212:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params.ucB=
itPerColor =3D PANEL_12BIT_PER_COLOR;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case COLOR_DEPTH_161616:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params.ucB=
itPerColor =3D PANEL_16BIT_PER_COLOR;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (EXEC_BIOS_CMD_TABLE(DIGxEnco=
derControl, params))<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resu=
lt =3D BP_RESULT_OK;<br>
&gt;&gt;<br>
&gt;&gt; @@ -1057,6 +1091,19 @@ static enum bp_result set_pixel_clock_v5(<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0* driver choose program it itself, i.e. here we program it<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0* to 888 by default.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*/<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bp_par=
ams-&gt;signal_type =3D=3D SIGNAL_TYPE_HDMI_TYPE_A)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0switch (bp_params-&gt;color_depth) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0case TRANSMITTER_COLOR_DEPTH_30:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* yes this is correct, the=
 atom define is wrong */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk.sPCLKInput.ucMiscInfo |=
=3D PIXEL_CLOCK_V5_MISC_HDMI_32BPP;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0case TRANSMITTER_COLOR_DEPTH_36:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* yes this is correct, the=
 atom define is wrong */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk.sPCLKInput.ucMiscInfo |=
=3D PIXEL_CLOCK_V5_MISC_HDMI_30BPP;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0default:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
EXEC_BIOS_CMD_TABLE(SetPixelClock, clk))<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 result =3D BP_RESULT_OK;<br>
&gt;&gt; @@ -1135,6 +1182,20 @@ static enum bp_result set_pixel_clock_v6(<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0* driver choose program it itself, i.e. here we pass required<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0* target rate that includes deep color.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*/<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bp_par=
ams-&gt;signal_type =3D=3D SIGNAL_TYPE_HDMI_TYPE_A)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0switch (bp_params-&gt;color_depth) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0case TRANSMITTER_COLOR_DEPTH_30:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk.sPCLKInput.ucMiscInfo |=
=3D PIXEL_CLOCK_V6_MISC_HDMI_30BPP_V6;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0case TRANSMITTER_COLOR_DEPTH_36:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk.sPCLKInput.ucMiscInfo |=
=3D PIXEL_CLOCK_V6_MISC_HDMI_36BPP_V6;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0case TRANSMITTER_COLOR_DEPTH_48:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk.sPCLKInput.ucMiscInfo |=
=3D PIXEL_CLOCK_V6_MISC_HDMI_48BPP;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0default:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
EXEC_BIOS_CMD_TABLE(SetPixelClock, clk))<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 result =3D BP_RESULT_OK;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c=
 b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c<br>
&gt;&gt; index fb733f573715..466f8f5803c9 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c<br>
&gt;&gt; @@ -871,6 +871,20 @@ static bool dce110_program_pix_clk(<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bp_pc_params.flags.SET_EXTERNAL_=
REF_DIV_SRC =3D<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pll_settings-&gt;use_external_clk;<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (pix_clk_params-&gt;color_depth=
) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case COLOR_DEPTH_101010:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bp_pc_para=
ms.color_depth =3D TRANSMITTER_COLOR_DEPTH_30;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case COLOR_DEPTH_121212:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bp_pc_para=
ms.color_depth =3D TRANSMITTER_COLOR_DEPTH_36;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case COLOR_DEPTH_161616:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bp_pc_para=
ms.color_depth =3D TRANSMITTER_COLOR_DEPTH_48;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (clk_src-&gt;bios-&gt;funcs-&=
gt;set_pixel_clock(<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 clk_src-&gt;bios, &amp;bp_pc_params) !=3D BP_RESUL=
T_OK)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn false;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder=
.c b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c<br>
&gt;&gt; index ada57f745fd7..19e380e0a330 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c<br>
&gt;&gt; @@ -564,6 +564,7 @@ static void dce110_stream_encoder_hdmi_set_str=
eam_attribute(<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cntl.enable_dp_audio =3D enable_=
audio;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cntl.pixel_clock =3D actual_pix_=
clk_khz;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cntl.lanes_number =3D LANE_COUNT=
_FOUR;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cntl.color_depth =3D crtc_timing-&gt;d=
isplay_color_depth;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (enc110-&gt;base.bp-&gt;funcs=
-&gt;encoder_control(<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 enc110-&gt;base.bp, &amp;cntl) !=3D BP_RESULT_OK)<=
br>
&gt;&gt; --<br>
&gt;&gt; 2.25.1<br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; dri-devel mailing list<br>
&gt;&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blan=
k">dri-devel@lists.freedesktop.org</a><br>
&gt;&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp=
;data=3D04%7C01%7Cnicholas.kazlauskas%40amd.com%7C598b2b5e841940b8c27708d8c=
15aa80d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637471942408643835%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C1000&amp;amp;sdata=3Db9C3Xi%2F2RmNsGyGUN5oBF8U%2BuGyt2w4jUZ2=
dK8NM4AY%3D&amp;amp;reserved=3D0" rel=3D"noreferrer" target=3D"_blank">http=
s://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.freed=
esktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp;data=3D04%7C01%7Cnichol=
as.kazlauskas%40amd.com%7C598b2b5e841940b8c27708d8c15aa80d%7C3dd8961fe4884e=
608e11a82d994e183d%7C0%7C0%7C637471942408643835%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
amp;sdata=3Db9C3Xi%2F2RmNsGyGUN5oBF8U%2BuGyt2w4jUZ2dK8NM4AY%3D&amp;amp;rese=
rved=3D0</a><br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp;dat=
a=3D04%7C01%7Cnicholas.kazlauskas%40amd.com%7C598b2b5e841940b8c27708d8c15aa=
80d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637471942408643835%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3Db9C3Xi%2F2RmNsGyGUN5oBF8U%2BuGyt2w4jUZ2dK8N=
M4AY%3D&amp;amp;reserved=3D0" rel=3D"noreferrer" target=3D"_blank">https://=
nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.freedeskt=
op.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp;data=3D04%7C01%7Cnicholas.k=
azlauskas%40amd.com%7C598b2b5e841940b8c27708d8c15aa80d%7C3dd8961fe4884e608e=
11a82d994e183d%7C0%7C0%7C637471942408643835%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Db9C3Xi%2F2RmNsGyGUN5oBF8U%2BuGyt2w4jUZ2dK8NM4AY%3D&amp;amp;reserved=
=3D0</a><br>
&gt; <br>
<br>
</blockquote></div>

--000000000000d86a4305b9be7b58--

--===============2111264373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2111264373==--
