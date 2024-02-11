Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DDA850B5C
	for <lists+dri-devel@lfdr.de>; Sun, 11 Feb 2024 21:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C3A10E41E;
	Sun, 11 Feb 2024 20:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OJcxQlyN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF8610E41E
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Feb 2024 20:06:24 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dc6cbe1ac75so2044153276.1
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Feb 2024 12:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707681983; x=1708286783; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/sP+KXDdWumdh42ISXdMy/9U1hT/ZXoWJmOPWSe3vi0=;
 b=OJcxQlyNQpN4y1RRKrHAPQ28gVu7ntUSmNUEAsgooP+DHi5DWoXKOkTwFLu0gPuFcN
 3PyTXjQJI8mg6hlehDlnIaup0x+iUrf21wI0a7SbM248ZnWyJnGBwPLHzvsfaUT/SOuy
 wLEw1IIVOKfcDhD22McP5qAxNKU4akHxIogFHL/ozXcp0vq44CaZhW99ZtzibE2m1uP6
 fWrpFVMy5SHQORLn6BWpq38HXW1NcQDYYmG75Uv4GeCtpl7k8OghAxcCbQSlllriEc4I
 pZzRC3aPuzmpmX71rQJzq/1r1Fr+QsQEC2VFeafKgL1VyI1WRlfuMLK4HLrqOQU2NFwq
 UqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707681983; x=1708286783;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/sP+KXDdWumdh42ISXdMy/9U1hT/ZXoWJmOPWSe3vi0=;
 b=bDM7TAAUmjATFlRr04hdWcU/7hhxILqhJ5Z63HNDg1yg3dTmElksW5nXCB3B9y+hxJ
 RN5hNfKbXEygCp/Rf7QfcsnP6yBfwNo81nMYaWEl8l9CP6tmL7wC4r+D4uBEM+xPMSkB
 GtqsT0JkZPAB+Q7ktZpoJxOmzkyVZDcW9GXgyQwT5NDwg4UO7XUeJW89YtNEVPvl4+wL
 DVJwVwJjDsZr0yuF5lvxVBQWZ8Mqj8vSiqXaWPycKKy7T9u7fo8Dy0sPFLCILyixEWRP
 o2+koevfpJJJEcQCyHY+fA096KqVR/1XP5bX61kLuBbPgIWgftas+v9w4Bfvh0lKehl3
 nrpQ==
X-Gm-Message-State: AOJu0YwfYri51eAdjlR3UXmRoxNzaqRfDPOBneorAJk+XGV8iEppgPR8
 o0sluezJH0Lm3JpE1lg+l1DWBh5M34/Mr8dgRMeAFkLskc5IDn9GSTk6E9aI5RvaZaTIg3lGiXQ
 DJ7oW7Vh7FMJ7CXLaI1+Z+hPRop5RyPHbgB9hGw==
X-Google-Smtp-Source: AGHT+IEQ2TR+6KgOrJ6LAIAwB7DMaAIO3iNvKJ6/25awLnfbPL9rqS69hkfDe/88LywetMtLp/r9K9LJtw/CBxh8njk=
X-Received: by 2002:a25:acd7:0:b0:dc6:d1a9:d858 with SMTP id
 x23-20020a25acd7000000b00dc6d1a9d858mr3110337ybd.8.1707681983250; Sun, 11 Feb
 2024 12:06:23 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-14-quic_parellan@quicinc.com>
 <CAA8EJpq6EFn6xix2GLej=bB2JCP7btuQ+zugeJTeLBH+mVKdSg@mail.gmail.com>
 <6f4a0a31-e17a-3301-aacf-a88f458db6f3@quicinc.com>
 <8f728a4d-eb62-add1-1f67-8085eaea3102@quicinc.com>
 <CAA8EJpoct4xTYL38zNOuD=cy9J4_2dStGh+r2YKUdSxRQ8Zhgw@mail.gmail.com>
 <b1793aab-6fd7-14d9-baec-834bc63dae2d@quicinc.com>
 <CAA8EJpokVV+ng5Qp5BqFw+JFFOYxazH4bnj3rj3TbTyhCLo0sQ@mail.gmail.com>
 <a9b68699-6d16-0e57-a7bb-013881656526@quicinc.com>
In-Reply-To: <a9b68699-6d16-0e57-a7bb-013881656526@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 11 Feb 2024 22:06:12 +0200
Message-ID: <CAA8EJpqqxMw_AyWAY-TUe-uo7nPexivYDUyt3bJ43=jwAfcieQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/19] drm/msm/dp: add VSC SDP support for YUV420 over
 DP
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, Helge Deller <deller@gmx.de>, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
 marijn.suijten@somainline.org, neil.armstrong@linaro.org, 
 linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 11 Feb 2024 at 19:18, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/10/2024 10:57 PM, Dmitry Baryshkov wrote:
> > On Sun, 11 Feb 2024 at 06:06, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/10/2024 1:46 PM, Dmitry Baryshkov wrote:
> >>> On Sat, 10 Feb 2024 at 20:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2/10/2024 10:14 AM, Abhinav Kumar wrote:
> >>>>>
> >>>>>
> >>>>> On 2/10/2024 2:09 AM, Dmitry Baryshkov wrote:
> >>>>>> On Sat, 10 Feb 2024 at 03:52, Paloma Arellano
> >>>>>> <quic_parellan@quicinc.com> wrote:
> >>>>>>>
> >>>>>>> Add support to pack and send the VSC SDP packet for DP. This therefore
> >>>>>>> allows the transmision of format information to the sinks which is
> >>>>>>> needed for YUV420 support over DP.
> >>>>>>>
> >>>>>>> Changes in v2:
> >>>>>>>            - Rename GENERIC0_SDPSIZE macro to GENERIC0_SDPSIZE_VALID
> >>>>>>>            - Remove dp_sdp from the dp_catalog struct since this data is
> >>>>>>>              being allocated at the point used
> >>>>>>>            - Create a new function in dp_utils to pack the VSC SDP data
> >>>>>>>              into a buffer
> >>>>>>>            - Create a new function that packs the SDP header bytes into a
> >>>>>>>              buffer. This function is made generic so that it can be
> >>>>>>>              utilized by dp_audio
> >>>>>>>              header bytes into a buffer
> >>>>>>>            - Create a new function in dp_utils that takes the packed
> >>>>>>> buffer
> >>>>>>>              and writes to the DP_GENERIC0_* registers
> >>>>>>>            - Split the dp_catalog_panel_config_vsc_sdp() function into two
> >>>>>>>              to disable/enable sending VSC SDP packets
> >>>>>>>            - Check the DP HW version using the original useage of
> >>>>>>>              dp_catalog_hw_revision() and correct the version checking
> >>>>>>>              logic
> >>>>>>>            - Rename dp_panel_setup_vsc_sdp() to
> >>>>>>>              dp_panel_setup_vsc_sdp_yuv_420() to explicitly state that
> >>>>>>>              currently VSC SDP is only being set up to support YUV420
> >>>>>>> modes
> >>>>>>>
> >>>>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>>>>> ---
> >>>>>>>     drivers/gpu/drm/msm/dp/dp_catalog.c | 105 ++++++++++++++++++++++++++++
> >>>>>>>     drivers/gpu/drm/msm/dp/dp_catalog.h |   6 ++
> >>>>>>>     drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 ++
> >>>>>>>     drivers/gpu/drm/msm/dp/dp_panel.c   |  59 ++++++++++++++++
> >>>>>>>     drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
> >>>>>>>     drivers/gpu/drm/msm/dp/dp_utils.c   |  80 +++++++++++++++++++++
> >>>>>>>     drivers/gpu/drm/msm/dp/dp_utils.h   |   3 +
> >>>>>>>     7 files changed, 260 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>>>>> b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>>>>> index 5d84c089e520a..0f28a4897b7b7 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>>>>> @@ -901,6 +901,111 @@ int dp_catalog_panel_timing_cfg(struct
> >>>>>>> dp_catalog *dp_catalog)
> >>>>>>>            return 0;
> >>>>>>>     }
> >>>>>>>
> >>
> >> <Snip>
> >>
> >>>>>>> +static int dp_panel_setup_vsc_sdp_yuv_420(struct dp_panel *dp_panel)
> >>>>>>> +{
> >>>>>>> +       struct dp_catalog *catalog;
> >>>>>>> +       struct dp_panel_private *panel;
> >>>>>>> +       struct dp_display_mode *dp_mode;
> >>>>>>> +       struct dp_sdp_header sdp_header;
> >>>>>>> +       struct drm_dp_vsc_sdp vsc_sdp_data;
> >>>>>>> +       size_t buff_size;
> >>>>>>> +       u32 gen_buffer[10];
> >>>>>>> +       int rc = 0;
> >>>>>>> +
> >>>>>>> +       if (!dp_panel) {
> >>>>>>> +               DRM_ERROR("invalid input\n");
> >>>>>>> +               rc = -EINVAL;
> >>>>>>> +               return rc;
> >>>>>>> +       }
> >>>>>>> +
> >>>>>>> +       panel = container_of(dp_panel, struct dp_panel_private,
> >>>>>>> dp_panel);
> >>>>>>> +       catalog = panel->catalog;
> >>>>>>> +       dp_mode = &dp_panel->dp_mode;
> >>>>>>> +       buff_size = sizeof(gen_buffer);
> >>>>>>> +
> >>>>>>> +       memset(&sdp_header, 0, sizeof(sdp_header));
> >>>>>>> +       memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
> >>>>>>> +
> >>>>>>> +       /* VSC SDP header as per table 2-118 of DP 1.4 specification */
> >>>>>>> +       sdp_header.HB0 = 0x00;
> >>>>>>> +       sdp_header.HB1 = 0x07;
> >>>>>>> +       sdp_header.HB2 = 0x05;
> >>>>>>> +       sdp_header.HB3 = 0x13;
> >>>>>>
> >>>>>> This should go to the packing function.
> >>>>>>
> >>>>>
> >>>>> We can .... but ....
> >>>>>
> >>>>> the header bytes can change based on the format. These values are
> >>>>> specific to YUV420. Thats why this part was kept outside of the generic
> >>>>> vsc sdp packing. Today we support only YUV420 VSC SDP so we can move it
> >>>>> but this was the reason.
> >>>
> >>> These values can be set from the sdp_type, revision and length fields
> >>> of struct drm_dp_vsc_sdp.
> >>> The function intel_dp_vsc_sdp_pack() is pretty much close to what I had in mind.
> >>>
> >>>>>
> >>>>>>> +
> >>>>>>> +       /* VSC SDP Payload for DB16 */
> >>>>>>
> >>>>>> Comments are useless more or less. The code fills generic information
> >>>>>> structure which might or might not be packed to the data buffer.
> >>>>>>
> >>>>>>> +       vsc_sdp_data.pixelformat = DP_PIXELFORMAT_YUV420;
> >>>>>>> +       vsc_sdp_data.colorimetry = DP_COLORIMETRY_DEFAULT;
> >>>>>>> +
> >>>>>>> +       /* VSC SDP Payload for DB17 */
> >>>>>>> +       vsc_sdp_data.dynamic_range = DP_DYNAMIC_RANGE_CTA;
> >>>>>>> +
> >>>>>>> +       /* VSC SDP Payload for DB18 */
> >>>>>>> +       vsc_sdp_data.content_type = DP_CONTENT_TYPE_GRAPHICS;
> >>>>>>> +
> >>>>>>> +       vsc_sdp_data.bpc = dp_mode->bpp / 3;
> >>>>>>
> >>>>>> Consider extracting intel_dp_compute_vsc_colorimetry() and using it.
> >>>>>>
> >>>>>
> >>>>> intel_dp_compute_vsc_colorimetry() uses colorspace property to pick
> >>>>> YUV420, we do not.
> >>>
> >>> Intel function also uses output_format, but it's true, it is full of
> >>> Intel specifics.
> >>>
> >>>>> Right now, its a pure driver decision to use YUV420
> >>>>> when the mode is supported only in that format.
> >>>>>
> >>>>> Also, many params are to be used within this function cached inside
> >>>>> intel_crtc_state . We will first need to make that API more generic to
> >>>>> be re-usable by others.
> >>>>>
> >>>>> I think overall, if we want to have a generic packing across vendors, it
> >>>>> needs more work. I think one of us can take that up as a separate effort.
> >>>
> >>> Ack, I agree here. I did only a quick glance over
> >>> intel_dp_compute_vsc_colorimetry function() beforehand.
> >>>
> >>>>>
> >>>>>>> +
> >>>>>>> +       rc = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &sdp_header,
> >>>>>>> gen_buffer, buff_size);
> >>>>>>> +       if (rc) {
> >>>>>>> +               DRM_ERROR("unable to pack vsc sdp\n");
> >>>>>>> +               return rc;
> >>>>>>> +       }
> >>>>>>> +
> >>>>>>> +       dp_catalog_panel_enable_vsc_sdp(catalog, gen_buffer);
> >>>>>>> +
> >>>>>>> +       return rc;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>>     void dp_panel_dump_regs(struct dp_panel *dp_panel)
> >>>>>>>     {
> >>>>>>>            struct dp_catalog *catalog;
> >>>>>>> @@ -344,6 +399,10 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
> >>>>>>>            catalog->dp_active = data;
> >>>>>>>
> >>>>>>>            dp_catalog_panel_timing_cfg(catalog);
> >>>>>>> +
> >>>>>>> +       if (dp_panel->dp_mode.out_fmt_is_yuv_420)
> >>>>>>> +               dp_panel_setup_vsc_sdp_yuv_420(dp_panel);
> >>>>>>> +
> >>>>>>>            panel->panel_on = true;
> >>>>>>>
> >>>>>>>            return 0;
> >>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h
> >>>>>>> b/drivers/gpu/drm/msm/dp/dp_reg.h
> >>>>>>> index ea85a691e72b5..2983756c125cd 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> >>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> >>>>>>> @@ -142,6 +142,7 @@
> >>>>>>>     #define DP_MISC0_SYNCHRONOUS_CLK               (0x00000001)
> >>>>>>>     #define DP_MISC0_COLORIMETRY_CFG_SHIFT         (0x00000001)
> >>>>>>>     #define DP_MISC0_TEST_BITS_DEPTH_SHIFT         (0x00000005)
> >>>>>>> +#define DP_MISC1_VSC_SDP                       (0x00004000)
> >>>>>>>
> >>>>>>>     #define REG_DP_VALID_BOUNDARY                  (0x00000030)
> >>>>>>>     #define REG_DP_VALID_BOUNDARY_2                        (0x00000034)
> >>>>>>> @@ -201,9 +202,11 @@
> >>>>>>>     #define MMSS_DP_AUDIO_CTRL_RESET               (0x00000214)
> >>>>>>>
> >>>>>>>     #define MMSS_DP_SDP_CFG                                (0x00000228)
> >>>>>>> +#define GEN0_SDP_EN                            (0x00020000)
> >>>>>>>     #define MMSS_DP_SDP_CFG2                       (0x0000022C)
> >>>>>>>     #define MMSS_DP_AUDIO_TIMESTAMP_0              (0x00000230)
> >>>>>>>     #define MMSS_DP_AUDIO_TIMESTAMP_1              (0x00000234)
> >>>>>>> +#define GENERIC0_SDPSIZE_VALID                 (0x00010000)
> >>>>>>>
> >>>>>>>     #define MMSS_DP_AUDIO_STREAM_0                 (0x00000240)
> >>>>>>>     #define MMSS_DP_AUDIO_STREAM_1                 (0x00000244)
> >>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c
> >>>>>>> b/drivers/gpu/drm/msm/dp/dp_utils.c
> >>>>>>> index 176d839906cec..05e0133eb50f3 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_utils.c
> >>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_utils.c
> >>>>>>> @@ -4,6 +4,16 @@
> >>>>>>>      */
> >>>>>>>
> >>>>>>>     #include <linux/types.h>
> >>>>>>> +#include <drm/display/drm_dp_helper.h>
> >>>>>>> +#include <drm/drm_print.h>
> >>>>>>> +
> >>>>>>> +#include "dp_utils.h"
> >>>>>>> +
> >>>>>>> +#define DP_GENERIC0_6_YUV_8_BPC                BIT(0)
> >>>>>>> +#define DP_GENERIC0_6_YUV_10_BPC       BIT(1)
> >>>>>>> +
> >>>>>>> +#define DP_SDP_HEADER_SIZE             8
> >>>>>>> +#define DP_VSC_SDP_BUFFER_SIZE         40
> >>>>>>>
> >>>>>>>     u8 dp_utils_get_g0_value(u8 data)
> >>>>>>>     {
> >>>>>>> @@ -69,3 +79,73 @@ u8 dp_utils_calculate_parity(u32 data)
> >>>>>>>
> >>>>>>>            return parity_byte;
> >>>>>>>     }
> >>>>>>> +
> >>>>>>> +int dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32
> >>>>>>> *buffer, size_t buff_size)
> >>>>>>> +{
> >>>>>>> +       u32 header, parity;
> >>>>>>> +
> >>>>>>> +       if (buff_size < DP_SDP_HEADER_SIZE)
> >>>>>>> +               return -ENOSPC;
> >>>>>>> +
> >>>>>>> +       memset(buffer, 0, sizeof(buffer));
> >>>>>>> +
> >>>>>>> +       /* HEADER BYTE 0 */
> >>>>>>> +       header = sdp_header->HB0;
> >>>>>>> +       parity = dp_utils_calculate_parity(header);
> >>>>>>> +       buffer[0]   = ((header << HEADER_BYTE_0_BIT) | (parity <<
> >>>>>>> PARITY_BYTE_0_BIT));
> >>>>>>> +
> >>>>>>> +       /* HEADER BYTE 1 */
> >>>>>>> +       header = sdp_header->HB1;
> >>>>>>> +       parity = dp_utils_calculate_parity(header);
> >>>>>>> +       buffer[0]  |= ((header << HEADER_BYTE_1_BIT) | (parity <<
> >>>>>>> PARITY_BYTE_1_BIT));
> >>>>>>> +
> >>>>>>> +       /* HEADER BYTE 2 */
> >>>>>>> +       header = sdp_header->HB2;
> >>>>>>> +       parity = dp_utils_calculate_parity(header);
> >>>>>>> +       buffer[1]   = ((header << HEADER_BYTE_2_BIT) | (parity <<
> >>>>>>> PARITY_BYTE_2_BIT));
> >>>>>>> +
> >>>>>>> +       /* HEADER BYTE 3 */
> >>>>>>> +       header = sdp_header->HB3;
> >>>>>>> +       parity = dp_utils_calculate_parity(header);
> >>>>>>> +       buffer[1]  |= ((header << HEADER_BYTE_3_BIT) | (parity <<
> >>>>>>> PARITY_BYTE_3_BIT));
> >>>>>>> +
> >>>>>>> +       return 0;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +int dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc_sdp_data,
> >>>>>>> struct dp_sdp_header *sdp_header,
> >>>>>>> +                         u32 *buffer, size_t buff_size)
> >>>>>>> +{
> >>>>>>
> >>>>>> No. This function should pack data into struct dp_sdp and it should go
> >>>>>> to drivers/video/hdmi.c
> >>>>>>
> >>>>>
> >>>>> What is the difference between struct drm_dp_vsc_sdp and struct dp_sdp?
> >>>>>
> >>>>
> >>>> I think you were referring to the fact that instead of a custom buffer,
> >>>> we should use struct dp_sdp to pack elements from struct drm_dp_vsc_sdp.
> >>>>
> >>>> If yes, I agree with this part.
> >>>
> >>> Yes.
> >>>
> >>>>
> >>>>> It seems like struct drm_dp_vsc_sdp is more appropriate for this.
> >>>>>
> >>>>> Regarding hdmi.c, I think the packing needs to be more generic to move
> >>>>> it there.
> >>>>>
> >>>>> I am not seeing parity bytes packing with other vendors. So there will
> >>>>> have to be some packing there and then some packing here.
> >>>
> >>> Yes. Writing the HB + PB seems specific to Qualcomm hardware. At least
> >>> Intel and AMD seem to write header bytes without parity.
> >>>
> >>>>> Also, like you already noticed, to make the VSC SDP packing more generic
> >>>>> to move to hdmi.c, it needs more work to make it more usable like
> >>>>> supporting all pixel formats and all colorimetry values.
> >>>>>
> >>>>> We do not have that much utility yet for that.
> >>>
> >>> I think you are mixing the filling of drm_dp_vsc_sdp and packing of
> >>> that struct. I suppose intel_dp_vsc_sdp_pack() can be extracted more
> >>> or less as is.
> >>> Once somebody needs to support 3D (AMD does), they can extend the function.
> >>>
> >>
> >> Yes once I corrected my understanding of using the function to just pack
> >> struct dp_sdp instead of the buffer, I understood the intention.
> >>
> >> We can try it. I have written up a RFC to move the
> >> intel_dp_vsc_sdp_pack() to drm_dp_helper as that seems more appropriate
> >> now for it and not hdmi.c as we already have some vsc sdp utils in
> >> drm_dp_helper.
> >
> > Yes, we have. However all structure manipulation functions, even for
> > DP, are usually a part of the hdmi.c. If I understand correctly, we
> > can still touch this file from drm-misc (or from other drm trees).
> >
>
> hmm ... I think the only reason we have
> hdmi_audio_infoframe_pack_for_dp() is because of re-using
> hdmi_audio_infoframe to pack into a struct dp_sdp.
>
> We will not be doing that here. It will be from a drm_dp_vsc_sdp to
> dp_sdp. Thats why I thought drm_dp_helper is more appropriate.

Could you please raise this question at #dri-devel? Let's get Jani's
and other maintainers' opinion.

>
> >> But before I post, we will do some cleanup and see if things look
> >> reasonable in this patch too because we will still need to write a
> >> common utility to pack the parity bytes for the sdp header which we need
> >> to utilize for audio and vsc sdp in our DP case.
> >>
> >> I am thinking of a
> >>
> >> struct msm_dp_sdp_pb {
> >>          u8 PB0;
> >>          u8 PB1;
> >>          u8 PB2;
> >>          u8 PB3;
> >> } __packed;
> >>
> >> struct msm_dp_sdp_with_parity {
> >>          struct dp_sdp vsc_sdp;
> >>          struct msm_dp_sdp_pb pb;
> >> };
> >>
> >> intel_dp_vsc_sdp_pack() will pack the struct dp_sdp but we will have to
> >> do some additional parity byte packing after that. That part will remain
> >> common for audio and vsc for msm.
> >
> > I think you can do it in a much easier way:
> >
> > struct dp_sdp sdp
> > u32 header[2];
> >
> > hdmi_dp_vsc_sdp_pack(vsc_sdp, &sdp);
> > msm_dp_pack_header(&sdp, header);
> > dp_write_register(catalog, MMSS_DP_FOO_HEADER0, header[0]);
> > dp_write_register(catalog, MMSS_DP_FOO_HEADER1, header[1]);
> > // write sdp.db
> >
>
> Sure. Just a difference of packing it together Vs a local header. We
> will see which one looks better and post it. I felt that my way makes it
> clear that msm_dp needs extra parity specific to msm.

I just don't like extra wrapping structures. But really, let's see
your patches first.

-- 
With best wishes
Dmitry
