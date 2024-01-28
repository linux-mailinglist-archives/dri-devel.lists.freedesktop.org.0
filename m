Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899B783F424
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 06:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D680F10F2CC;
	Sun, 28 Jan 2024 05:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C274E10F2CC
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 05:40:23 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-5ffb07bed9bso12895217b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 21:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706420363; x=1707025163; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UD7q/y/zZ/nesDJ3qv83TUDsiRY8bFKW1PYUjUz0t/M=;
 b=VP8sXSvMSsHzF15FfuunyeGsDrf7WkjzvMrL6fksYwvfPMSAopAGBBl1CMgD8TjTCY
 nTXaRa/tdVthwn086R+Xr8k1GhlB4KjplGTq7wbqq4fctMKJi/Yw5U40iqZpCzBknyyC
 x+4f5H6jIyg6Td0vYjMfFGruqmJgTy+KaVZzMHSDxCYsMuDjYb0TXlznoaSdyXN7P3oh
 WKjoXTc1IVyIVorQZEkEzPm8dYyD0I0FP9a4Ue0T5LzyHTethNZ+AaV9Dw+Evsong+Z6
 Xwvh/JMeMZRfqjVk3EJrYiPHuYrm7P6u631fFG/kc990M42hW6S/odK/vWrUOxCs+q6k
 OSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706420363; x=1707025163;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UD7q/y/zZ/nesDJ3qv83TUDsiRY8bFKW1PYUjUz0t/M=;
 b=HIShFvB2bMdU9THdf09u9K8hynQ2kS3ZXwd82mbVpXBHQqzchUkhmPYmOsIINt3PSU
 eqah+3055D1jrr1tE5oyWwgabaq8dVyno6J3fUS4HZWw2ivB+q0QQsu3FKI8t8pF+cOs
 tItdjSo/9/kwJUkJjbEyfMX0Gz7hhS6PYeIJNauHF0YNz0sn3ilwo3hWtKgsovBx7Lgz
 IA84OkHpmpiygku3HXPz9wY5IK1moGpgI5JBRlPUVDJhMScrxZaf4dlkqvF++YS+94cn
 j3Xcdw9lq/ykM4mxxIYhThg2yK5/wgpfDyTCwDfBAMih0PjOTU+L4HcKWJa5dCGixoSX
 DdDA==
X-Gm-Message-State: AOJu0YxRtTuA+S1SvTQZybkp4oA5XM/dYV3nyaYX5Yknv8tpzO3e2PfV
 fGY68EklV3NmLjMf78WloRvTCbM3qYMm2zePLpnUUIa3bpsbu11BT3umE0MZ0s3EmJk6Ee1jAnn
 EfV/kwhFqAxmEch1NcIUWrEWO68Y+kRQ7g97FtA==
X-Google-Smtp-Source: AGHT+IHsWcaq/dNOaxDY7WHKON/tOZyo1ojshd+Sjx1ojPyQuaFFT+9OG3UV9udL8JToW8vmgktisZ6HA2+oIx3ttPc=
X-Received: by 2002:a0d:e68f:0:b0:602:9c33:f315 with SMTP id
 p137-20020a0de68f000000b006029c33f315mr1793167ywe.82.1706420363152; Sat, 27
 Jan 2024 21:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-12-quic_parellan@quicinc.com>
 <d94434ec-00fd-489f-98f2-8c811522ff82@linaro.org>
 <11c6fdbe-f85a-088d-92df-abd8405c966b@quicinc.com>
In-Reply-To: <11c6fdbe-f85a-088d-92df-abd8405c966b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 28 Jan 2024 07:39:12 +0200
Message-ID: <CAA8EJprPziRHhxVK9mAdQZNEeon9q95ZMKSBhs-s95O-7W10NA@mail.gmail.com>
Subject: Re: [PATCH 11/17] drm/msm/dp: add VSC SDP support for YUV420 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 28 Jan 2024 at 07:34, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 1/25/2024 1:48 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> Add support to pack and send the VSC SDP packet for DP. This therefore
> >> allows the transmision of format information to the sinks which is
> >> needed for YUV420 support over DP.
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_catalog.c | 147 ++++++++++++++++++++++++++++
> >>   drivers/gpu/drm/msm/dp/dp_catalog.h |   4 +
> >>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 +
> >>   drivers/gpu/drm/msm/dp/dp_panel.c   |  47 +++++++++
> >>   drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
> >>   5 files changed, 205 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> index c025786170ba5..7e4c68be23e56 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> @@ -29,6 +29,9 @@
> >>     #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
> >>   +#define DP_GENERIC0_6_YUV_8_BPC        BIT(0)
> >> +#define DP_GENERIC0_6_YUV_10_BPC    BIT(1)
> >> +
> >>   #define DP_INTERRUPT_STATUS1 \
> >>       (DP_INTR_AUX_XFER_DONE| \
> >>       DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
> >> @@ -907,6 +910,150 @@ int dp_catalog_panel_timing_cfg(struct
> >> dp_catalog *dp_catalog)
> >>       return 0;
> >>   }
> >>   +static void dp_catalog_panel_setup_vsc_sdp(struct dp_catalog
> >> *dp_catalog)
> >> +{
> >> +    struct dp_catalog_private *catalog;
> >> +    u32 header, parity, data;
> >> +    u8 bpc, off = 0;
> >> +    u8 buf[SZ_128];
> >> +
> >> +    if (!dp_catalog) {
> >> +        pr_err("invalid input\n");
> >> +        return;
> >> +    }
> >> +
> >> +    catalog = container_of(dp_catalog, struct dp_catalog_private,
> >> dp_catalog);
> >> +
> >> +    /* HEADER BYTE 1 */
> >> +    header = dp_catalog->sdp.sdp_header.HB1;
> >> +    parity = dp_catalog_calculate_parity(header);
> >> +    data   = ((header << HEADER_BYTE_1_BIT) | (parity <<
> >> PARITY_BYTE_1_BIT));
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_0, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);
> >> +
> >> +    /* HEADER BYTE 2 */
> >> +    header = dp_catalog->sdp.sdp_header.HB2;
> >> +    parity = dp_catalog_calculate_parity(header);
> >> +    data   = ((header << HEADER_BYTE_2_BIT) | (parity <<
> >> PARITY_BYTE_2_BIT));
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_1, data);
> >> +
> >> +    /* HEADER BYTE 3 */
> >> +    header = dp_catalog->sdp.sdp_header.HB3;
> >> +    parity = dp_catalog_calculate_parity(header);
> >> +    data   = ((header << HEADER_BYTE_3_BIT) | (parity <<
> >> PARITY_BYTE_3_BIT));
> >> +    data |= dp_read_link(catalog, MMSS_DP_GENERIC0_1);
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_1, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);
> >
> > This seems to be common with the dp_audio code. Please extract this
> > header writing too.
> These are two different sdp's. audio and vsc, are different with
> different registers being written to and different amount of registers
> being set. Can you please clarify since in audio we only need 3
> registers to write to, and in vsc we need 10.

Bitmagic with the header is the same. Then the rest of the data is
written one dword per register, if I'm not mistaken.

> >
> >> +
> >> +    data = 0;
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_2, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);
> >
> > Generally this is not how these functions are expected to be written.
> > Please take a look at drivers/video/hdmi.c. It should be split into:
> > - generic function that packs the C structure into a flat byte buffer,
> > - driver-specific function that formats and writes the buffer to the
> > hardware.
> >
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_3, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);
> >> +
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_4, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);
> >> +
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_5, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);
> >> +
> >> +    switch (dp_catalog->vsc_sdp_data.bpc) {
> >> +    case 10:
> >> +        bpc = DP_GENERIC0_6_YUV_10_BPC;
> >> +        break;
> >> +    case 8:
> >> +    default:
> >> +        bpc = DP_GENERIC0_6_YUV_8_BPC;
> >> +        break;
> >> +    }
> >> +
> >> +    /* VSC SDP payload as per table 2-117 of DP 1.4 specification */
> >> +    data = (dp_catalog->vsc_sdp_data.colorimetry & 0xF) |
> >> +           ((dp_catalog->vsc_sdp_data.pixelformat & 0xF) << 4) |
> >> +           (bpc << 8) |
> >> +           ((dp_catalog->vsc_sdp_data.dynamic_range & 0x1) << 15) |
> >> +           ((dp_catalog->vsc_sdp_data.content_type & 0x7) << 16);
> >> +
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_6, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);
> >> +
> >> +    data = 0;
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_7, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);
> >> +
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_8, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);


-- 
With best wishes
Dmitry
