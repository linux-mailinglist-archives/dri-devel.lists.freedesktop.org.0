Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 276DD856A71
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0926E10EA09;
	Thu, 15 Feb 2024 17:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oQ9ctsZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D8810EA09
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 17:03:44 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-60782336a3aso8856297b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708016624; x=1708621424; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LgUyubPPO9uWHMqmQ77PqGic9hMuovQKSKXohzLmn6Y=;
 b=oQ9ctsZfDNLRvZ6HZ/GGrqel9hAo54EKoqoLA2kp3yXuReOl2E3XfipKU0WxYPMjzI
 xPQ4LIUWp1bPGJldCQrwkUTXKWiJTXipM0ul/e9b07x2bBIFa2P8M4FA2+S9r45lJU6A
 28gXuicCD7bQOoqrfjjSKOMBDmbUN9MJBtkP877prZqbro2CrzfXhbnWoF6HB+OL/vdv
 wjS9qU35UP3DadfbFl6rgXzLBpI4NevPWjIwQEZ548Fccv+XyQu+WCQ1xZdlrVj1EJIi
 dFh9gZDXtPUSVotyRxqteYh6jY06MupcKgRhryGQGinBTsjYP8G7fzj4rro9Y9j46kPo
 zrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708016624; x=1708621424;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LgUyubPPO9uWHMqmQ77PqGic9hMuovQKSKXohzLmn6Y=;
 b=bIK5Z2cZg9+KKz4blMMZmz3arUidmTZn4779YVjoN6hztcrk6kJ6X/NyMzWQE+vIDz
 pECjgacRW7J67tsO0KVnJMtR7zpypbYvuBkKGnftyhS2562HiYzhJKzwXmto08qQ//3K
 Fop/sNR3UU3UJHGTojvoFMTQTJXscSsaDZgNfcs3Dgsyjyo9onMTMTFLV44FyXTlGGPK
 x+64gUMJHbkHPNqhnZmPR7epTPdlxwS7fDy/PSsBf11p06JDPsi2h6bQ8SaZUt+EzA/Q
 VsXux9g9zu8fAfhBT9gfg74AAqVeakGmeNWHoYUb9L3ACf0P9WQOf1BCnATLsqP8T+Ma
 MCEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPO58NeL6b7yMFSr9u9v23MAn3OnIj5cWd0xUL+VlZYgw3Vpts2QRhZ9CxLDQ7uc4VVq8WZfzhgRL64ADkgnq5yZCAXcbCNsLTxsTEEvm/
X-Gm-Message-State: AOJu0Yw1OtqR3WgZZx4ukXmv/tML6/TiT6MMCoRmo+i/NA2bnrNhR+qh
 dn8azdrrKRXA/9p87rLkVYK5B/XY9/M2AViv8IbpXpfSdHwgx+I+PDfbSNLQmrt1g2ayu/7BF6S
 xrOBMBDqDH12ROh05YbH1UalHKuKKdVwRhUovjA==
X-Google-Smtp-Source: AGHT+IGFwRNumJ9xz9p11cXcMelZ9OX05f86Blm3d8xPdqUtzgk1b57Y2WiVQj0AsPH/2TdAo1sBjDj9xE3biO9Evgo=
X-Received: by 2002:a0d:ebc6:0:b0:607:ec66:37e6 with SMTP id
 u189-20020a0debc6000000b00607ec6637e6mr860057ywe.42.1708016623724; Thu, 15
 Feb 2024 09:03:43 -0800 (PST)
MIME-Version: 1.0
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
 <20240214180347.1399-14-quic_parellan@quicinc.com>
 <CAA8EJppCxHrcUYRdtGJYmjLYu=VwX3KbPXZ4YNsCzagkMEPvLQ@mail.gmail.com>
 <917eadef-0d84-be62-9ef2-9048dea97144@quicinc.com>
 <CAA8EJprroq8mcAgaPMO_g-XrpbaGOfZhjCDQ-4vxHy5Ae9iY3w@mail.gmail.com>
 <8f0ef8a0-9075-8bb4-e08e-58e35f6ab116@quicinc.com>
In-Reply-To: <8f0ef8a0-9075-8bb4-e08e-58e35f6ab116@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 19:03:31 +0200
Message-ID: <CAA8EJprWzyJpU4Q-o7qEgTytG_pUfoiBMos+LF-MdcmMpYHYkQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/19] drm/msm/dp: add VSC SDP support for YUV420 over
 DP
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
 marijn.suijten@somainline.org, neil.armstrong@linaro.org
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

On Thu, 15 Feb 2024 at 18:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/15/2024 12:40 AM, Dmitry Baryshkov wrote:
> > On Wed, 14 Feb 2024 at 22:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/14/2024 11:39 AM, Dmitry Baryshkov wrote:
> >>> On Wed, 14 Feb 2024 at 20:04, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>>>
> >>>> Add support to pack and send the VSC SDP packet for DP. This therefore
> >>>> allows the transmision of format information to the sinks which is
> >>>> needed for YUV420 support over DP.
> >>>>
> >>>> Changes in v3:
> >>>>           - Create a new struct, msm_dp_sdp_with_parity, which holds the
> >>>>             packing information for VSC SDP
> >>>>           - Use drm_dp_vsc_sdp_pack() to pack the data into the new
> >>>>             msm_dp_sdp_with_parity struct instead of specifically packing
> >>>>             for YUV420 format
> >>>>           - Modify dp_catalog_panel_send_vsc_sdp() to send the VSC SDP
> >>>>             data using the new msm_dp_sdp_with_parity struct
> >>>>
> >>>> Changes in v2:
> >>>>           - Rename GENERIC0_SDPSIZE macro to GENERIC0_SDPSIZE_VALID
> >>>>           - Remove dp_sdp from the dp_catalog struct since this data is
> >>>>             being allocated at the point used
> >>>>           - Create a new function in dp_utils to pack the VSC SDP data
> >>>>             into a buffer
> >>>>           - Create a new function that packs the SDP header bytes into a
> >>>>             buffer. This function is made generic so that it can be
> >>>>             utilized by dp_audio
> >>>>             header bytes into a buffer
> >>>>           - Create a new function in dp_utils that takes the packed buffer
> >>>>             and writes to the DP_GENERIC0_* registers
> >>>>           - Split the dp_catalog_panel_config_vsc_sdp() function into two
> >>>>             to disable/enable sending VSC SDP packets
> >>>>           - Check the DP HW version using the original useage of
> >>>>             dp_catalog_hw_revision() and correct the version checking
> >>>>             logic
> >>>>           - Rename dp_panel_setup_vsc_sdp() to
> >>>>             dp_panel_setup_vsc_sdp_yuv_420() to explicitly state that
> >>>>             currently VSC SDP is only being set up to support YUV420 modes
> >>>>
> >>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/dp/dp_catalog.c | 113 ++++++++++++++++++++++++++++
> >>>>    drivers/gpu/drm/msm/dp/dp_catalog.h |   7 ++
> >>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 +
> >>>>    drivers/gpu/drm/msm/dp/dp_panel.c   |  55 ++++++++++++++
> >>>>    drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
> >>>>    drivers/gpu/drm/msm/dp/dp_utils.c   |  48 ++++++++++++
> >>>>    drivers/gpu/drm/msm/dp/dp_utils.h   |  18 +++++
> >>>>    7 files changed, 248 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>> index 5d84c089e520a..61d5317efe683 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>> @@ -901,6 +901,119 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
> >>>>           return 0;
> >>>>    }
> >>>>
> >>>> +static void dp_catalog_panel_send_vsc_sdp(struct dp_catalog *dp_catalog,
> >>>> +                                         struct msm_dp_sdp_with_parity *msm_dp_sdp)
> >>>> +{
> >>>> +       struct dp_catalog_private *catalog;
> >>>> +       u32 val;
> >>>> +
> >>>> +       if (!dp_catalog) {
> >>>> +               DRM_ERROR("invalid input\n");
> >>>> +               return;
> >>>> +       }
> >>>> +
> >>>> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> >>>> +
> >>>> +       val = ((msm_dp_sdp->vsc_sdp.sdp_header.HB0) << HEADER_BYTE_0_BIT |
> >>>> +              (msm_dp_sdp->pb.PB0 << PARITY_BYTE_0_BIT) |
> >>>> +              (msm_dp_sdp->vsc_sdp.sdp_header.HB1) << HEADER_BYTE_1_BIT |
> >>>> +              (msm_dp_sdp->pb.PB1 << PARITY_BYTE_1_BIT));
> >>>> +       dp_write_link(catalog, MMSS_DP_GENERIC0_0, val);
> >>>> +
> >>>> +       val = ((msm_dp_sdp->vsc_sdp.sdp_header.HB2) << HEADER_BYTE_2_BIT |
> >>>> +              (msm_dp_sdp->pb.PB2 << PARITY_BYTE_2_BIT) |
> >>>> +              (msm_dp_sdp->vsc_sdp.sdp_header.HB3) << HEADER_BYTE_3_BIT |
> >>>> +              (msm_dp_sdp->pb.PB3 << PARITY_BYTE_3_BIT));
> >>>> +       dp_write_link(catalog, MMSS_DP_GENERIC0_1, val);
> >>>
> >>> I still think that this is not the way to do it. Could you please
> >>> extract the function that takes struct dp_sdp_header, calculates
> >>> padding and writes resulting data to the hardware? This way we can
> >>> reuse it later for all the dp_audio stuff.
> >>>
> >>
> >> hmmm ... dp_utils_pack_sdp_header() does that you are asking for right?
> >>
> >> OR are you asking for another function like:
> >>
> >> 1) rename dp_utils_pack_sdp_header() to dp_utils_calc_sdp_parity()
> >> 2) dp_utils_pack_sdp() takes two u32 to pack the header and parity
> >> together and we move the << HEADER_BYTE_xx | part to it
> >>
> >> dp_catalog_panel_send_vsc_sdp() just uses these two u32 to write the
> >> headers.
> >
> > I'm really looking for the following function:
> >
> > void dp_catalog_panel_send_vsc_sdp(struct dp_catalog *dp_catalog,
> > struct dp_sdp *dp_sdp)
> > {
> >      dp_write_vsc_header(dp_catalog, MMSS_DP_GENERIC0_0, &dp_sdp->sdp_header);
> >      dp_write_vsc_packet(dp_catalog, MMSS_DP_GENERIC0_2, dp_sdp);
> > }
> >
> > Then dp_audio functions will be able to fill struct dp_sdp_header and
> > call dp_write_vsc_header (or whatever other name for that function)
> > directly.
> >
>
> I think there is some misunderstanding here.
>
> Audio does not write or use generic_0 registers. It uses audio infoframe
> SDP registers. So the catalog function of audio will not change.

Sure, that's why I added the register to the `dp_write_vsc_header` prototype.

E.g.:

void dp_audio_stream_sdp(...)
{
    struct dp_sdp_header hdr;
    hdr.HB0 = 0;
    hdr.HB1 = 0x2;
    hdr.HB2 = ...;
    hdr.HB3 = audio->nchannels - 1;
    dp_write_vsc_header(dp_catalog, MMSS_DP_AUDIO_STREAM_0, &hdr);
}


>
> The only part common between audio and vsc sdp is the parity byte
> calculation and the packing of parity and header bytes into 2 u32s.
>
> Thats why I wrote that we will have a common util between audio and vsc
> sdp only to pack the data but the catalog functions will be different.
>
>
> >>
> >>
> >>>> +
> >>>> +       val = ((msm_dp_sdp->vsc_sdp.db[16]) | (msm_dp_sdp->vsc_sdp.db[17] << 8) |
> >>>> +              (msm_dp_sdp->vsc_sdp.db[18] << 16));
> >>>> +       dp_write_link(catalog, MMSS_DP_GENERIC0_6, val);
> >>>
> >>> Shouldn't we write full dp_sdp data, including all zeroes? Here you
> >>> assume that there is no other data in dp_sdp and also that nobody
> >>> wrote anything senseless to those registers.
> >>>
> >>
> >> As per documentation, it says db[0] to db[15] are reserved so I thought
> >> its better not to touch/use them and start writing for 16 onwards.
> >>
> >> 1592  * VSC SDP Payload for Pixel Encoding/Colorimetry Format
> >> 1593  * db[0] - db[15]: Reserved
> >> 1594  * db[16]: Pixel Encoding and Colorimetry Formats
> >> 1595  * db[17]: Dynamic Range and Component Bit Depth
> >> 1596  * db[18]: Content Type
> >> 1597  * db[19] - db[31]: Reserved
> >> 1598  */
> >
> > If I understand correctly, it also supports 3D Stereo and other bits.
> > Also other revisions of VSC packets have other field requirements. So,
> > I don't think it is incorrect to write just bytes 16-18.
> >
>
> hmmm .... the packing function of vsc sdp does not consider 3D stereo
> bits today. But I guess if someone adds it later then we will not have
> to change this code if we write the rest of the payload as well.
>
> Okay, lets write all the 32 bytes of payload across to registers
> GENERIC0_2 to GENERIC0_9
>
>
> >>
> >>>> +}
> >>>> +
> >>>> +static void dp_catalog_panel_update_sdp(struct dp_catalog *dp_catalog)
> >>>> +{
> >>>> +       struct dp_catalog_private *catalog;
> >>>> +       u32 hw_revision;
> >>>> +
> >>>> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> >>>> +
> >>>> +       hw_revision = dp_catalog_hw_revision(dp_catalog);
> >>>> +       if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
> >>>> +               dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
> >>>> +               dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
> >>>> +       }
> >>>> +}
> >>>> +
> >>>> +void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog,
> >>>> +                                    struct msm_dp_sdp_with_parity *msm_dp_sdp)
> >>>> +{
> >>>> +       struct dp_catalog_private *catalog;
> >>>> +       u32 cfg, cfg2, misc;
> >>>> +
> >>>> +       if (!dp_catalog) {
> >>>> +               DRM_ERROR("invalid input\n");
> >>>> +               return;
> >>>> +       }
> >>>> +
> >>>> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> >>>> +
> >>>> +       cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
> >>>> +       cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
> >>>> +       misc = dp_read_link(catalog, REG_DP_MISC1_MISC0);
> >>>> +
> >>>> +       cfg |= GEN0_SDP_EN;
> >>>> +       dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
> >>>> +
> >>>> +       cfg2 |= GENERIC0_SDPSIZE_VALID;
> >>>> +       dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
> >>>> +
> >>>> +       dp_catalog_panel_send_vsc_sdp(dp_catalog, msm_dp_sdp);
> >>>> +
> >>>> +       /* indicates presence of VSC (BIT(6) of MISC1) */
> >>>> +       misc |= DP_MISC1_VSC_SDP;
> >>>> +
> >>>> +       drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=1\n");
> >>>> +
> >>>> +       pr_debug("misc settings = 0x%x\n", misc);
> >>>> +       dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
> >>>> +
> >>>> +       dp_catalog_panel_update_sdp(dp_catalog);
> >>>> +}
> >>>> +
> >>>> +void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog)
> >>>> +{
> >>>> +       struct dp_catalog_private *catalog;
> >>>> +       u32 cfg, cfg2, misc;
> >>>> +
> >>>> +       if (!dp_catalog) {
> >>>> +               DRM_ERROR("invalid input\n");
> >>>> +               return;
> >>>> +       }
> >>>> +
> >>>> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> >>>> +
> >>>> +       cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
> >>>> +       cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
> >>>> +       misc = dp_read_link(catalog, REG_DP_MISC1_MISC0);
> >>>> +
> >>>> +       cfg &= ~GEN0_SDP_EN;
> >>>> +       dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
> >>>> +
> >>>> +       cfg2 &= ~GENERIC0_SDPSIZE_VALID;
> >>>> +       dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
> >>>> +
> >>>> +       /* switch back to MSA */
> >>>> +       misc &= ~DP_MISC1_VSC_SDP;
> >>>> +
> >>>> +       drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=0\n");
> >>>> +
> >>>> +       pr_debug("misc settings = 0x%x\n", misc);
> >>>> +       dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
> >>>> +
> >>>> +       dp_catalog_panel_update_sdp(dp_catalog);
> >>>> +}
> >>>> +
> >>>>    void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
> >>>>                                   struct drm_display_mode *drm_mode)
> >>>>    {
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> >>>> index 6cb5e2a243de2..4bf08c27a9bf3 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> >>>> @@ -9,6 +9,7 @@
> >>>>    #include <drm/drm_modes.h>
> >>>>
> >>>>    #include "dp_parser.h"
> >>>> +#include "dp_utils.h"
> >>>>    #include "disp/msm_disp_snapshot.h"
> >>>>
> >>>>    /* interrupts */
> >>>> @@ -30,6 +31,9 @@
> >>>>
> >>>>    #define DP_AUX_CFG_MAX_VALUE_CNT 3
> >>>>
> >>>> +#define DP_HW_VERSION_1_0      0x10000000
> >>>> +#define DP_HW_VERSION_1_2      0x10020000
> >>>> +
> >>>>    /* PHY AUX config registers */
> >>>>    enum dp_phy_aux_config_type {
> >>>>           PHY_AUX_CFG0,
> >>>> @@ -124,6 +128,9 @@ u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog);
> >>>>
> >>>>    /* DP Panel APIs */
> >>>>    int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog);
> >>>> +void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog,
> >>>> +                                    struct msm_dp_sdp_with_parity *msm_dp_sdp);
> >>>> +void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog);
> >>>>    void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
> >>>>    void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
> >>>>                                   struct drm_display_mode *drm_mode);
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >>>> index 209cf2a35642f..beef86b1aaf81 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >>>> @@ -1952,6 +1952,8 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
> >>>>           dp_io = &ctrl->parser->io;
> >>>>           phy = dp_io->phy;
> >>>>
> >>>> +       dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> >>>> +
> >>>>           /* set dongle to D3 (power off) mode */
> >>>>           dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
> >>>>
> >>>> @@ -2026,6 +2028,8 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
> >>>>           dp_io = &ctrl->parser->io;
> >>>>           phy = dp_io->phy;
> >>>>
> >>>> +       dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> >>>> +
> >>>>           dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
> >>>>
> >>>>           dp_catalog_ctrl_reset(ctrl->catalog);
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> >>>> index db1942794f1a4..18420a7ba4ab3 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> >>>> @@ -4,6 +4,7 @@
> >>>>     */
> >>>>
> >>>>    #include "dp_panel.h"
> >>>> +#include "dp_utils.h"
> >>>>
> >>>>    #include <drm/drm_connector.h>
> >>>>    #include <drm/drm_edid.h>
> >>>> @@ -281,6 +282,56 @@ void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable)
> >>>>           dp_catalog_panel_tpg_enable(catalog, &panel->dp_panel.dp_mode.drm_mode);
> >>>>    }
> >>>>
> >>>> +static int dp_panel_setup_vsc_sdp_yuv_420(struct dp_panel *dp_panel)
> >>>> +{
> >>>> +       struct dp_catalog *catalog;
> >>>> +       struct dp_panel_private *panel;
> >>>> +       struct dp_display_mode *dp_mode;
> >>>> +       struct drm_dp_vsc_sdp vsc_sdp_data;
> >>>> +       struct msm_dp_sdp_with_parity msm_dp_sdp;
> >>>> +       ssize_t len;
> >>>> +       int rc = 0;
> >>>> +
> >>>> +       if (!dp_panel) {
> >>>> +               DRM_ERROR("invalid input\n");
> >>>> +               rc = -EINVAL;
> >>>> +               return rc;
> >>>> +       }
> >>>> +
> >>>> +       panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> >>>> +       catalog = panel->catalog;
> >>>> +       dp_mode = &dp_panel->dp_mode;
> >>>> +
> >>>> +       memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
> >>>> +
> >>>> +       /* VSC SDP header as per table 2-118 of DP 1.4 specification */
> >>>> +       vsc_sdp_data.sdp_type = DP_SDP_VSC;
> >>>> +       vsc_sdp_data.revision = 0x05;
> >>>> +       vsc_sdp_data.length = 0x13;
> >>>> +
> >>>> +       /* VSC SDP Payload for DB16 */
> >>>> +       vsc_sdp_data.pixelformat = DP_PIXELFORMAT_YUV420;
> >>>> +       vsc_sdp_data.colorimetry = DP_COLORIMETRY_DEFAULT;
> >>>> +
> >>>> +       /* VSC SDP Payload for DB17 */
> >>>> +       vsc_sdp_data.bpc = dp_mode->bpp / 3;
> >>>> +       vsc_sdp_data.dynamic_range = DP_DYNAMIC_RANGE_CTA;
> >>>> +
> >>>> +       /* VSC SDP Payload for DB18 */
> >>>> +       vsc_sdp_data.content_type = DP_CONTENT_TYPE_GRAPHICS;
> >>>> +
> >>>> +       // rc = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &sdp_header, gen_buffer, buff_size);
> >>>> +       len = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &msm_dp_sdp);
> >>>> +       if (len < 0) {
> >>>> +               DRM_ERROR("unable to pack vsc sdp\n");
> >>>> +               return len;
> >>>> +       }
> >>>> +
> >>>> +       dp_catalog_panel_enable_vsc_sdp(catalog, &msm_dp_sdp);
> >>>> +
> >>>> +       return rc;
> >>>> +}
> >>>> +
> >>>>    void dp_panel_dump_regs(struct dp_panel *dp_panel)
> >>>>    {
> >>>>           struct dp_catalog *catalog;
> >>>> @@ -344,6 +395,10 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
> >>>>           catalog->dp_active = data;
> >>>>
> >>>>           dp_catalog_panel_timing_cfg(catalog);
> >>>> +
> >>>> +       if (dp_panel->dp_mode.out_fmt_is_yuv_420)
> >>>> +               dp_panel_setup_vsc_sdp_yuv_420(dp_panel);
> >>>> +
> >>>>           panel->panel_on = true;
> >>>>
> >>>>           return 0;
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> >>>> index ea85a691e72b5..2983756c125cd 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> >>>> @@ -142,6 +142,7 @@
> >>>>    #define DP_MISC0_SYNCHRONOUS_CLK               (0x00000001)
> >>>>    #define DP_MISC0_COLORIMETRY_CFG_SHIFT         (0x00000001)
> >>>>    #define DP_MISC0_TEST_BITS_DEPTH_SHIFT         (0x00000005)
> >>>> +#define DP_MISC1_VSC_SDP                       (0x00004000)
> >>>>
> >>>>    #define REG_DP_VALID_BOUNDARY                  (0x00000030)
> >>>>    #define REG_DP_VALID_BOUNDARY_2                        (0x00000034)
> >>>> @@ -201,9 +202,11 @@
> >>>>    #define MMSS_DP_AUDIO_CTRL_RESET               (0x00000214)
> >>>>
> >>>>    #define MMSS_DP_SDP_CFG                                (0x00000228)
> >>>> +#define GEN0_SDP_EN                            (0x00020000)
> >>>>    #define MMSS_DP_SDP_CFG2                       (0x0000022C)
> >>>>    #define MMSS_DP_AUDIO_TIMESTAMP_0              (0x00000230)
> >>>>    #define MMSS_DP_AUDIO_TIMESTAMP_1              (0x00000234)
> >>>> +#define GENERIC0_SDPSIZE_VALID                 (0x00010000)
> >>>>
> >>>>    #define MMSS_DP_AUDIO_STREAM_0                 (0x00000240)
> >>>>    #define MMSS_DP_AUDIO_STREAM_1                 (0x00000244)
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
> >>>> index 3a44fe738c004..81601f3c414fc 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_utils.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_utils.c
> >>>> @@ -4,6 +4,7 @@
> >>>>     */
> >>>>
> >>>>    #include <linux/types.h>
> >>>> +#include <drm/drm_print.h>
> >>>>
> >>>>    #include "dp_utils.h"
> >>>>
> >>>> @@ -71,3 +72,50 @@ u8 dp_utils_calculate_parity(u32 data)
> >>>>
> >>>>           return parity_byte;
> >>>>    }
> >>>> +
> >>>> +ssize_t dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, struct msm_dp_vsc_sdp_parity *pb,
> >>>> +                                size_t size)
> >>>> +{
> >>>> +       u8 header;
> >>>> +
> >>>> +       size_t length = sizeof(struct msm_dp_vsc_sdp_parity);
> >>>> +
> >>>> +       if (size < length)
> >>>> +               return -ENOSPC;
> >>>> +
> >>>> +       memset(pb, 0, size);
> >>>> +
> >>>> +       header = sdp_header->HB0;
> >>>> +       pb->PB0 = dp_utils_calculate_parity(header);
> >>>> +
> >>>> +       header = sdp_header->HB1;
> >>>> +       pb->PB1 = dp_utils_calculate_parity(header);
> >>>> +
> >>>> +       header = sdp_header->HB2;
> >>>> +       pb->PB2 = dp_utils_calculate_parity(header);
> >>>> +
> >>>> +       header = sdp_header->HB3;
> >>>> +       pb->PB3 = dp_utils_calculate_parity(header);
> >>>> +
> >>>> +       return length;
> >>>> +}
> >>>> +
> >>>> +ssize_t dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc, struct msm_dp_sdp_with_parity *msm_dp_sdp)
> >>>> +{
> >>>> +       ssize_t len;
> >>>> +
> >>>> +       len = drm_dp_vsc_sdp_pack(vsc, &msm_dp_sdp->vsc_sdp, sizeof(msm_dp_sdp->vsc_sdp));
> >>>> +       if (len < 0) {
> >>>> +               DRM_ERROR("unable to pack vsc sdp\n");
> >>>> +               return len;
> >>>> +       }
> >>>> +
> >>>> +       len = dp_utils_pack_sdp_header(&msm_dp_sdp->vsc_sdp.sdp_header, &msm_dp_sdp->pb,
> >>>> +                                      sizeof(msm_dp_sdp->pb));
> >>>> +       if (len < 0) {
> >>>> +               DRM_ERROR("unable to pack sdp header\n");
> >>>> +               return len;
> >>>> +       }
> >>>> +
> >>>> +       return len;
> >>>> +}
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
> >>>> index 5a505cbf3432b..6946bc51cae97 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_utils.h
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_utils.h
> >>>> @@ -6,6 +6,8 @@
> >>>>    #ifndef _DP_UTILS_H_
> >>>>    #define _DP_UTILS_H_
> >>>>
> >>>> +#include <drm/display/drm_dp_helper.h>
> >>>> +
> >>>>    #define HEADER_BYTE_0_BIT       0
> >>>>    #define PARITY_BYTE_0_BIT       8
> >>>>    #define HEADER_BYTE_1_BIT      16
> >>>> @@ -15,8 +17,24 @@
> >>>>    #define HEADER_BYTE_3_BIT      16
> >>>>    #define PARITY_BYTE_3_BIT      24
> >>>>
> >>>> +struct msm_dp_vsc_sdp_parity {
> >>>> +       u8 PB0;
> >>>> +       u8 PB1;
> >>>> +       u8 PB2;
> >>>> +       u8 PB3;
> >>>> +} __packed;
> >>>> +
> >>>> +struct msm_dp_sdp_with_parity {
> >>>> +       struct dp_sdp vsc_sdp;
> >>>> +       struct msm_dp_vsc_sdp_parity pb;
> >>>> +};
> >>>> +
> >>>>    u8 dp_utils_get_g0_value(u8 data);
> >>>>    u8 dp_utils_get_g1_value(u8 data);
> >>>>    u8 dp_utils_calculate_parity(u32 data);
> >>>> +ssize_t dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, struct msm_dp_vsc_sdp_parity *pb,
> >>>> +                                size_t size);
> >>>> +ssize_t dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc,
> >>>> +                             struct msm_dp_sdp_with_parity *msm_dp_sdp);
> >>>>
> >>>>    #endif /* _DP_UTILS_H_ */
> >>>> --
> >>>> 2.39.2
> >>>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
