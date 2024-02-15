Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDC1856CE2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 19:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464B110E750;
	Thu, 15 Feb 2024 18:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sMXcn+xH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321B810E22C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 18:40:37 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dc742543119so1096044276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 10:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708022436; x=1708627236; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JglBwXSntLlCbyjy/GHZdM028F64P17qowaUV5IhPx0=;
 b=sMXcn+xHC4Lf5KjDe80PYWtttccB5YN3LfAxAtneiYt8/23NRj4gGdXvxF3FqM5pob
 2K3lp8wUsj4ryZRfqOOG+/efBX/hIC7ygHmg+IegUFejWO2YeLFDxfIkwCtQYrtnMd23
 qQCMOnVM/mK0HeQCDxKg12AYzNy+Wcq24sT6F+tsF4Uh1FDgdiigzHHXprZOyXdZueeF
 d9ybz4bUSXDPWTyw3matOQaZLHao2aWTzUJtFAXruU4ZxmB8IcIo7a0fKsF3XCx9XMPI
 wWkYy11Xx4Sxd+Hot+dy3p+9ZdvQQs8ZIDsHLCLDdCfculmcxyZWx3zYro0I504oKN/+
 6NMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708022436; x=1708627236;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JglBwXSntLlCbyjy/GHZdM028F64P17qowaUV5IhPx0=;
 b=sq54qpacgxBKyoKF89pZ8dZ2ucqqpDZlm9NFX+yYPQ+v1TnaL6k4EYNzYH3/vQSANO
 lkKsrtPIMn0EiyZI3WK4CMyXgYaP/PZofAKokfa7DIKWzzNtZSN99KIBHFTtpqeX/dVc
 MG6RsW2apaucJ3SVFx+OHMvn3KvY6+1sLSqEslE3NUMQKTMFEUZktD5kPblt/LLCp+I2
 QrSvX2UH+LT9X+ys6GTjjVoLq0rx4XcVHHN1myDp9/X6y8Kksz0dvEwoTH5ugyYpxnUC
 yppvtFnCWfztMvC8s94EMTkXwcauvTNXpKQ39geW/oECdHO1HJ/rGiDd/xCpsJToliIZ
 85xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7y93w+2pZYJHuK4+RwpOce5gwUmonFVHO87RagbzwWDo6Rq7X163f9c2QDAs+GKkHQt3McAvG1nERGJk6rWgu3/9V8EUAwdXk9SCwVZ+d
X-Gm-Message-State: AOJu0YxmpBfsNTED4cOc8A1BqWBdRkyVkL7O6CDxNL75pL+8OlP5iVY7
 Q3G87utnMj/YxyHzmYfrtwM9WH4usnOSrKoTRVSgC/qTQRgA70eAwelg5/uvGuYTascSvL1oFS5
 u5qt+kpn2hwDPVUeu7DxEnQ6RbYS+D5SAZ4ARGg==
X-Google-Smtp-Source: AGHT+IGBc1DKEt44dJP+HARF8uN8GAF96QgYekZsW2BRKFHllOv5Vc7K0jzqLyY+mmENRqYLN1HGEXEPUYCDbI13GTo=
X-Received: by 2002:a25:6b11:0:b0:dc6:4713:bbf1 with SMTP id
 g17-20020a256b11000000b00dc64713bbf1mr2476660ybc.21.1708022436155; Thu, 15
 Feb 2024 10:40:36 -0800 (PST)
MIME-Version: 1.0
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
 <20240214180347.1399-14-quic_parellan@quicinc.com>
 <CAA8EJppCxHrcUYRdtGJYmjLYu=VwX3KbPXZ4YNsCzagkMEPvLQ@mail.gmail.com>
 <917eadef-0d84-be62-9ef2-9048dea97144@quicinc.com>
 <CAA8EJprroq8mcAgaPMO_g-XrpbaGOfZhjCDQ-4vxHy5Ae9iY3w@mail.gmail.com>
 <8f0ef8a0-9075-8bb4-e08e-58e35f6ab116@quicinc.com>
 <CAA8EJprWzyJpU4Q-o7qEgTytG_pUfoiBMos+LF-MdcmMpYHYkQ@mail.gmail.com>
In-Reply-To: <CAA8EJprWzyJpU4Q-o7qEgTytG_pUfoiBMos+LF-MdcmMpYHYkQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 20:40:24 +0200
Message-ID: <CAA8EJpr8WLC26rVU2YVhB1tt6VYny5MPXPwQ7CTGf5eRfNJpDw@mail.gmail.com>
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

On Thu, 15 Feb 2024 at 19:03, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 15 Feb 2024 at 18:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> >
> >
> > On 2/15/2024 12:40 AM, Dmitry Baryshkov wrote:
> > > On Wed, 14 Feb 2024 at 22:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >>
> > >>
> > >>
> > >> On 2/14/2024 11:39 AM, Dmitry Baryshkov wrote:
> > >>> On Wed, 14 Feb 2024 at 20:04, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> > >>>>
> > >>>> Add support to pack and send the VSC SDP packet for DP. This therefore
> > >>>> allows the transmision of format information to the sinks which is
> > >>>> needed for YUV420 support over DP.
> > >>>>
> > >>>> Changes in v3:
> > >>>>           - Create a new struct, msm_dp_sdp_with_parity, which holds the
> > >>>>             packing information for VSC SDP
> > >>>>           - Use drm_dp_vsc_sdp_pack() to pack the data into the new
> > >>>>             msm_dp_sdp_with_parity struct instead of specifically packing
> > >>>>             for YUV420 format
> > >>>>           - Modify dp_catalog_panel_send_vsc_sdp() to send the VSC SDP
> > >>>>             data using the new msm_dp_sdp_with_parity struct
> > >>>>
> > >>>> Changes in v2:
> > >>>>           - Rename GENERIC0_SDPSIZE macro to GENERIC0_SDPSIZE_VALID
> > >>>>           - Remove dp_sdp from the dp_catalog struct since this data is
> > >>>>             being allocated at the point used
> > >>>>           - Create a new function in dp_utils to pack the VSC SDP data
> > >>>>             into a buffer
> > >>>>           - Create a new function that packs the SDP header bytes into a
> > >>>>             buffer. This function is made generic so that it can be
> > >>>>             utilized by dp_audio
> > >>>>             header bytes into a buffer
> > >>>>           - Create a new function in dp_utils that takes the packed buffer
> > >>>>             and writes to the DP_GENERIC0_* registers
> > >>>>           - Split the dp_catalog_panel_config_vsc_sdp() function into two
> > >>>>             to disable/enable sending VSC SDP packets
> > >>>>           - Check the DP HW version using the original useage of
> > >>>>             dp_catalog_hw_revision() and correct the version checking
> > >>>>             logic
> > >>>>           - Rename dp_panel_setup_vsc_sdp() to
> > >>>>             dp_panel_setup_vsc_sdp_yuv_420() to explicitly state that
> > >>>>             currently VSC SDP is only being set up to support YUV420 modes
> > >>>>
> > >>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> > >>>> ---
> > >>>>    drivers/gpu/drm/msm/dp/dp_catalog.c | 113 ++++++++++++++++++++++++++++
> > >>>>    drivers/gpu/drm/msm/dp/dp_catalog.h |   7 ++
> > >>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 +
> > >>>>    drivers/gpu/drm/msm/dp/dp_panel.c   |  55 ++++++++++++++
> > >>>>    drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
> > >>>>    drivers/gpu/drm/msm/dp/dp_utils.c   |  48 ++++++++++++
> > >>>>    drivers/gpu/drm/msm/dp/dp_utils.h   |  18 +++++
> > >>>>    7 files changed, 248 insertions(+)
> > >>>>
> > >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > >>>> index 5d84c089e520a..61d5317efe683 100644
> > >>>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > >>>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > >>>> @@ -901,6 +901,119 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
> > >>>>           return 0;
> > >>>>    }
> > >>>>
> > >>>> +static void dp_catalog_panel_send_vsc_sdp(struct dp_catalog *dp_catalog,
> > >>>> +                                         struct msm_dp_sdp_with_parity *msm_dp_sdp)
> > >>>> +{
> > >>>> +       struct dp_catalog_private *catalog;
> > >>>> +       u32 val;
> > >>>> +
> > >>>> +       if (!dp_catalog) {
> > >>>> +               DRM_ERROR("invalid input\n");
> > >>>> +               return;
> > >>>> +       }
> > >>>> +
> > >>>> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> > >>>> +
> > >>>> +       val = ((msm_dp_sdp->vsc_sdp.sdp_header.HB0) << HEADER_BYTE_0_BIT |
> > >>>> +              (msm_dp_sdp->pb.PB0 << PARITY_BYTE_0_BIT) |
> > >>>> +              (msm_dp_sdp->vsc_sdp.sdp_header.HB1) << HEADER_BYTE_1_BIT |
> > >>>> +              (msm_dp_sdp->pb.PB1 << PARITY_BYTE_1_BIT));
> > >>>> +       dp_write_link(catalog, MMSS_DP_GENERIC0_0, val);
> > >>>> +
> > >>>> +       val = ((msm_dp_sdp->vsc_sdp.sdp_header.HB2) << HEADER_BYTE_2_BIT |
> > >>>> +              (msm_dp_sdp->pb.PB2 << PARITY_BYTE_2_BIT) |
> > >>>> +              (msm_dp_sdp->vsc_sdp.sdp_header.HB3) << HEADER_BYTE_3_BIT |
> > >>>> +              (msm_dp_sdp->pb.PB3 << PARITY_BYTE_3_BIT));
> > >>>> +       dp_write_link(catalog, MMSS_DP_GENERIC0_1, val);
> > >>>
> > >>> I still think that this is not the way to do it. Could you please
> > >>> extract the function that takes struct dp_sdp_header, calculates
> > >>> padding and writes resulting data to the hardware? This way we can
> > >>> reuse it later for all the dp_audio stuff.
> > >>>
> > >>
> > >> hmmm ... dp_utils_pack_sdp_header() does that you are asking for right?
> > >>
> > >> OR are you asking for another function like:
> > >>
> > >> 1) rename dp_utils_pack_sdp_header() to dp_utils_calc_sdp_parity()
> > >> 2) dp_utils_pack_sdp() takes two u32 to pack the header and parity
> > >> together and we move the << HEADER_BYTE_xx | part to it
> > >>
> > >> dp_catalog_panel_send_vsc_sdp() just uses these two u32 to write the
> > >> headers.
> > >
> > > I'm really looking for the following function:
> > >
> > > void dp_catalog_panel_send_vsc_sdp(struct dp_catalog *dp_catalog,
> > > struct dp_sdp *dp_sdp)
> > > {
> > >      dp_write_vsc_header(dp_catalog, MMSS_DP_GENERIC0_0, &dp_sdp->sdp_header);
> > >      dp_write_vsc_packet(dp_catalog, MMSS_DP_GENERIC0_2, dp_sdp);
> > > }
> > >
> > > Then dp_audio functions will be able to fill struct dp_sdp_header and
> > > call dp_write_vsc_header (or whatever other name for that function)
> > > directly.
> > >
> >
> > I think there is some misunderstanding here.
> >
> > Audio does not write or use generic_0 registers. It uses audio infoframe
> > SDP registers. So the catalog function of audio will not change.
>
> Sure, that's why I added the register to the `dp_write_vsc_header` prototype.
>
> E.g.:
>
> void dp_audio_stream_sdp(...)
> {
>     struct dp_sdp_header hdr;
>     hdr.HB0 = 0;
>     hdr.HB1 = 0x2;
>     hdr.HB2 = ...;
>     hdr.HB3 = audio->nchannels - 1;
>     dp_write_vsc_header(dp_catalog, MMSS_DP_AUDIO_STREAM_0, &hdr);
> }
>
>
> >
> > The only part common between audio and vsc sdp is the parity byte
> > calculation and the packing of parity and header bytes into 2 u32s.
> >
> > Thats why I wrote that we will have a common util between audio and vsc
> > sdp only to pack the data but the catalog functions will be different.
> >

After an offline discussion, let's start with the dp_util function
packing struct dp_sdp_header into u32[2], then we can decide on the
fate of the dp_audio stuff later on.


-- 
With best wishes
Dmitry
