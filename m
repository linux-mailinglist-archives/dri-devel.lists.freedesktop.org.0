Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8429EFF55
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 23:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023EC10E65C;
	Thu, 12 Dec 2024 22:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fL/kMCFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D9D10E65C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 22:28:46 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e3824e1adcdso819379276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 14:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734042525; x=1734647325; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JGKLJLQdx25/Ga+STlOpY9vQNmJk5LexWqUDLyRbV2g=;
 b=fL/kMCFWYMS3bgJ2hr02+Ix1laN1AwY86O1b72oiIkGmJ+KQSgpVxERbv7nAr8rD6U
 uOpVL1PwsBs4hdS5xJ8/3EE6/IQ8bsrH16vXc203Q1KXsVfkHSGWFovOqcz//JXQGSOv
 pEaAM1LfXk5bEe12PmNe6mLMG4vv8/TgUVmziXF2OvFxw0N8xKWOGhrZGybkDndLPhzF
 mC4oGx5nJQvJZnDYeUMj5/d9xkdE6Bf/5dNPb5J+Ie/3byoCEGqD7n9S3ajWWqK51/Tz
 kF/wOYW9cvNn23DpaldZvFVcogKUoN67GSf0Bw4Df6YTrzQHqpRHBs/vR8F5pGul+n8U
 JF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734042525; x=1734647325;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JGKLJLQdx25/Ga+STlOpY9vQNmJk5LexWqUDLyRbV2g=;
 b=RWz/crt5grgRyUSOlh45+Ava8yit2+mqA1JUPqbXn7W+SEvkymUOT2WbDxE/GTQbd7
 TOzZ72R5YxmHSYjtZOeUYgpenbcQPp0IRHqHCqAKQib1hOoIETmhIMw+MM4V+CCXa1LU
 2cxCgYyNU9zfSGueksUY/U99eY7WhGaVibx30ha0yeiDCiFFOgJhptOCGZ1Ktz7OZt/I
 IuFGBaUlad7TIuBaKJvqJO+/Af9IKebsyAHm4SkIicGY4lfacs2l5EOXpk3GpP3TMhAT
 d/uOKP4E1NWv1TH0gmagocuiiWzu5YHNLtbbQArXxeUFbjIngst5scSo/GC3OnF6jSMr
 yZBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyDudDPcwH7MwLCsU4Rr7/jduIhszFSurKsO+/FXD2E7/C1MlPnzdJoKy2ctcFjcqUlbbQ0iu+skg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/ty4IOQhgSDWMzXTL+ABS8pgpDn37UjzHbaiSK47cMIYCCjdx
 L0nLx1nxvVR6adm3O69ZpcvDozTBBsm0irtOkSJxNjUshd+i13UGTVd/3G72ytL7OkTUColH9mU
 arB8bJo8HZGFb/iSdMuifldc+z3v5RvpEIGlWZw==
X-Gm-Gg: ASbGnct50+sAC5wLtTMki5kcgZybH2KDoiXlZ2nXCSx21eeRf4nX5NCNIpLMni/TDFl
 JFm1X+5/ZRWg9HKMuqVXbmbM9WbIGFYSniveGrg==
X-Google-Smtp-Source: AGHT+IEoFA6va5Vpt9diFX0HjcDxa+rf1e5iG7BZxupJBNypGbxlu35b6BCU48MhmnWRIivj4l+rd3CKU1QxWImoQ9E=
X-Received: by 2002:a05:6902:118b:b0:e29:1627:d4d3 with SMTP id
 3f1490d57ef6-e434e5e1407mr410610276.41.1734042525196; Thu, 12 Dec 2024
 14:28:45 -0800 (PST)
MIME-Version: 1.0
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-9-0b1c65e7dba3@linaro.org>
 <070dea1a-c300-4968-ba24-011625e4c133@quicinc.com>
In-Reply-To: <070dea1a-c300-4968-ba24-011625e4c133@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Dec 2024 00:28:37 +0200
Message-ID: <CAA8EJpqO=AjVGEnZHNbM5+Mnu2gMN96kABBLM5XHh3NMMGFtjw@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, 12 Dec 2024 at 23:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> > Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
> > to program audio packet data. Use 0 as Packet ID, as it was not
> > programmed earlier.
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_audio.c | 288 +++++++++-----------------------------
> >   1 file changed, 66 insertions(+), 222 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> > index 5cbb11986460d1e4ed1890bdf66d0913e013083c..1aa52d5cc08684a49102e45ed6e40ac2b13497c7 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> > @@ -14,6 +14,7 @@
> >   #include "dp_catalog.h"
> >   #include "dp_audio.h"
> >   #include "dp_panel.h"
> > +#include "dp_reg.h"
> >   #include "dp_display.h"
> >   #include "dp_utils.h"
> >
> > @@ -28,251 +29,94 @@ struct msm_dp_audio_private {
> >       struct msm_dp_audio msm_dp_audio;
> >   };
> >
> > -static u32 msm_dp_audio_get_header(struct msm_dp_catalog *catalog,
> > -             enum msm_dp_catalog_audio_sdp_type sdp,
> > -             enum msm_dp_catalog_audio_header_type header)
> > -{
> > -     return msm_dp_catalog_audio_get_header(catalog, sdp, header);
> > -}
> > -
> > -static void msm_dp_audio_set_header(struct msm_dp_catalog *catalog,
> > -             u32 data,
> > -             enum msm_dp_catalog_audio_sdp_type sdp,
> > -             enum msm_dp_catalog_audio_header_type header)
> > -{
> > -     msm_dp_catalog_audio_set_header(catalog, sdp, header, data);
> > -}
> > -
> >   static void msm_dp_audio_stream_sdp(struct msm_dp_audio_private *audio)
> >   {
> >       struct msm_dp_catalog *catalog = audio->catalog;
> > -     u32 value, new_value;
> > -     u8 parity_byte;
> > -
> > -     /* Config header and parity byte 1 */
> > -     value = msm_dp_audio_get_header(catalog,
> > -                     DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
> > -
> > -     new_value = 0x02;
> > -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> > -     value |= ((new_value << HEADER_BYTE_1_BIT)
> > -                     | (parity_byte << PARITY_BYTE_1_BIT));
> > -     drm_dbg_dp(audio->drm_dev,
> > -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> > -                     value, parity_byte);
> > -     msm_dp_audio_set_header(catalog, value,
> > -             DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
> > -
> > -     /* Config header and parity byte 2 */
> > -     value = msm_dp_audio_get_header(catalog,
> > -                     DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
> > -     new_value = value;
> > -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> > -     value |= ((new_value << HEADER_BYTE_2_BIT)
> > -                     | (parity_byte << PARITY_BYTE_2_BIT));
> > -     drm_dbg_dp(audio->drm_dev,
> > -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> > -                     value, parity_byte);
> > -
> > -     msm_dp_audio_set_header(catalog, value,
> > -             DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
> > -
> > -     /* Config header and parity byte 3 */
> > -     value = msm_dp_audio_get_header(catalog,
> > -                     DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
> > -
> > -     new_value = audio->channels - 1;
> > -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> > -     value |= ((new_value << HEADER_BYTE_3_BIT)
> > -                     | (parity_byte << PARITY_BYTE_3_BIT));
> > -     drm_dbg_dp(audio->drm_dev,
> > -                     "Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> > -             value, parity_byte);
> > -
> > -     msm_dp_audio_set_header(catalog, value,
> > -             DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
> > +     struct dp_sdp_header sdp_hdr = {
> > +             .HB0 = 0x00,
> > +             .HB1 = 0x02,
> > +             .HB2 = 0x00,
> > +             .HB3 = audio->channels - 1,
> > +     };
> > +     u32 header[2];
> > +
> > +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> > +
> > +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
> > +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
> >   }
>
> This patch is changing the programming behavior.
>
> Earlier it was using a read/modify/write on each register. Now, its just
>   a write. I checked a few chipsets, the reset value of registers was 0,
> so that part is okay.

Except that it was not a correct RMW, it was read, OR new data without
clearing the bitfield, write. So it has been working mostly by a
miracle,

>
> But, for the MMSS_DP_AUDIO_STREAM_0 register, earlier we were writing
> only the upper nibble, that is bits 15:0 of DP_AUDIO_SDP_HEADER_0 was
> kept as-it-is, but now this patch is changing that to 0. What was the
> reason for that change?

It is described in the commit message: "Use 0 as Packet ID, as it was not
programmed earlier."

>
> This is true for all the APIs being touched in this file.
>
> I guess the whole point of having that audio map in the catalog was to
> preserve the read values of these registers. I have to check what was
> the reason behind that as once again this was before I worked on this
> driver as well.
>
> So technically there are two parts to this change:
>
> 1) dropping read for each header and directly just writing it
> 2) Writing the registers directly instead of going through catalog
>
> It seems like (1) and (2) are independent. I hope (1) was not the reason
> to have started this whole rework.

Yes, the driver spends a lot of effort to preserve the data that will
be rewritten when the function is called to write the next header
byte. So it is useless. Only HB0 has been preserved, PacketID. If for
some reason we are generating a stream with the non-zero ID, it should
be explicit, not implicitly 'preserved'.

So, the reasons were:
- fix the RMW cycles to drop old values from the registers
- use new msm_dp_utils_pack_sdp_header()
- get rid of the useless indirection through the catalog and enum
msm_dp_catalog_audio_header_type
- write registers in an efficient way.
- if we ever have a set of functions to handle DP infoframes (like we
do for HDMI), make the MSM DP driver ready to be converted to such
functions.

>
> >
> >   static void msm_dp_audio_timestamp_sdp(struct msm_dp_audio_private *audio)
> >   {
> >       struct msm_dp_catalog *catalog = audio->catalog;
> > -     u32 value, new_value;
> > -     u8 parity_byte;
> > -
> > -     /* Config header and parity byte 1 */
> > -     value = msm_dp_audio_get_header(catalog,
> > -                     DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
> > -
> > -     new_value = 0x1;
> > -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> > -     value |= ((new_value << HEADER_BYTE_1_BIT)
> > -                     | (parity_byte << PARITY_BYTE_1_BIT));
> > -     drm_dbg_dp(audio->drm_dev,
> > -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> > -                     value, parity_byte);
> > -     msm_dp_audio_set_header(catalog, value,
> > -             DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
> > -
> > -     /* Config header and parity byte 2 */
> > -     value = msm_dp_audio_get_header(catalog,
> > -                     DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
> > -
> > -     new_value = 0x17;
> > -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> > -     value |= ((new_value << HEADER_BYTE_2_BIT)
> > -                     | (parity_byte << PARITY_BYTE_2_BIT));
> > -     drm_dbg_dp(audio->drm_dev,
> > -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> > -                     value, parity_byte);
> > -     msm_dp_audio_set_header(catalog, value,
> > -             DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
> > -
> > -     /* Config header and parity byte 3 */
> > -     value = msm_dp_audio_get_header(catalog,
> > -                     DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
> > -
> > -     new_value = (0x0 | (0x11 << 2));
> > -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> > -     value |= ((new_value << HEADER_BYTE_3_BIT)
> > -                     | (parity_byte << PARITY_BYTE_3_BIT));
> > -     drm_dbg_dp(audio->drm_dev,
> > -                     "Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> > -                     value, parity_byte);
> > -     msm_dp_audio_set_header(catalog, value,
> > -             DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
> > +     struct dp_sdp_header sdp_hdr = {
> > +             .HB0 = 0x00,
> > +             .HB1 = 0x01,
> > +             .HB2 = 0x17,
> > +             .HB3 = 0x0 | (0x11 << 2),
> > +     };
> > +     u32 header[2];
> > +
> > +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> > +
> > +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
> > +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
> >   }
> >
> >   static void msm_dp_audio_infoframe_sdp(struct msm_dp_audio_private *audio)
> >   {
> >       struct msm_dp_catalog *catalog = audio->catalog;
> > -     u32 value, new_value;
> > -     u8 parity_byte;
> > -
> > -     /* Config header and parity byte 1 */
> > -     value = msm_dp_audio_get_header(catalog,
> > -                     DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
> > -
> > -     new_value = 0x84;
> > -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> > -     value |= ((new_value << HEADER_BYTE_1_BIT)
> > -                     | (parity_byte << PARITY_BYTE_1_BIT));
> > -     drm_dbg_dp(audio->drm_dev,
> > -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> > -                     value, parity_byte);
> > -     msm_dp_audio_set_header(catalog, value,
> > -             DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
> > -
> > -     /* Config header and parity byte 2 */
> > -     value = msm_dp_audio_get_header(catalog,
> > -                     DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
> > -
> > -     new_value = 0x1b;
> > -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> > -     value |= ((new_value << HEADER_BYTE_2_BIT)
> > -                     | (parity_byte << PARITY_BYTE_2_BIT));
> > -     drm_dbg_dp(audio->drm_dev,
> > -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> > -                     value, parity_byte);
> > -     msm_dp_audio_set_header(catalog, value,
> > -             DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
> > -
> > -     /* Config header and parity byte 3 */
> > -     value = msm_dp_audio_get_header(catalog,
> > -                     DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
> > -
> > -     new_value = (0x0 | (0x11 << 2));
> > -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> > -     value |= ((new_value << HEADER_BYTE_3_BIT)
> > -                     | (parity_byte << PARITY_BYTE_3_BIT));
> > -     drm_dbg_dp(audio->drm_dev,
> > -                     "Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> > -                     new_value, parity_byte);
> > -     msm_dp_audio_set_header(catalog, value,
> > -             DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
> > +     struct dp_sdp_header sdp_hdr = {
> > +             .HB0 = 0x00,
> > +             .HB1 = 0x84,
> > +             .HB2 = 0x1b,
> > +             .HB3 = 0x0 | (0x11 << 2),
> > +     };
> > +     u32 header[2];
> > +
> > +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> > +
> > +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
> > +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
> >   }
> >
> >   static void msm_dp_audio_copy_management_sdp(struct msm_dp_audio_private *audio)
> >   {
> >       struct msm_dp_catalog *catalog = audio->catalog;
> > -     u32 value, new_value;
> > -     u8 parity_byte;
> > -
> > -     /* Config header and parity byte 1 */
> > -     value = msm_dp_audio_get_header(catalog,
> > -                     DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
> > -
> > -     new_value = 0x05;
> > -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> > -     value |= ((new_value << HEADER_BYTE_1_BIT)
> > -                     | (parity_byte << PARITY_BYTE_1_BIT));
> > -     drm_dbg_dp(audio->drm_dev,
> > -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> > -                     value, parity_byte);
> > -     msm_dp_audio_set_header(catalog, value,
> > -             DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
> > -
> > -     /* Config header and parity byte 2 */
> > -     value = msm_dp_audio_get_header(catalog,
> > -                     DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
> > -
> > -     new_value = 0x0F;
> > -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> > -     value |= ((new_value << HEADER_BYTE_2_BIT)
> > -                     | (parity_byte << PARITY_BYTE_2_BIT));
> > -     drm_dbg_dp(audio->drm_dev,
> > -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> > -                     value, parity_byte);
> > -     msm_dp_audio_set_header(catalog, value,
> > -             DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
> > -
> > -     /* Config header and parity byte 3 */
> > -     value = msm_dp_audio_get_header(catalog,
> > -                     DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
> > -
> > -     new_value = 0x0;
> > -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> > -     value |= ((new_value << HEADER_BYTE_3_BIT)
> > -                     | (parity_byte << PARITY_BYTE_3_BIT));
> > -     drm_dbg_dp(audio->drm_dev,
> > -                     "Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> > -                     value, parity_byte);
> > -     msm_dp_audio_set_header(catalog, value,
> > -             DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
> > +     struct dp_sdp_header sdp_hdr = {
> > +             .HB0 = 0x00,
> > +             .HB1 = 0x05,
> > +             .HB2 = 0x0f,
> > +             .HB3 = 0x00,
> > +     };
> > +     u32 header[2];
> > +
> > +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> > +
> > +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
> > +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
> >   }
> >
> >   static void msm_dp_audio_isrc_sdp(struct msm_dp_audio_private *audio)
> >   {
> >       struct msm_dp_catalog *catalog = audio->catalog;
> > -     u32 value, new_value;
> > -     u8 parity_byte;
> > -
> > -     /* Config header and parity byte 1 */
> > -     value = msm_dp_audio_get_header(catalog,
> > -                     DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
> > -
> > -     new_value = 0x06;
> > -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> > -     value |= ((new_value << HEADER_BYTE_1_BIT)
> > -                     | (parity_byte << PARITY_BYTE_1_BIT));
> > -     drm_dbg_dp(audio->drm_dev,
> > -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> > -                     value, parity_byte);
> > -     msm_dp_audio_set_header(catalog, value,
> > -             DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
> > -
> > -     /* Config header and parity byte 2 */
> > -     value = msm_dp_audio_get_header(catalog,
> > -                     DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
> > -
> > -     new_value = 0x0F;
> > -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> > -     value |= ((new_value << HEADER_BYTE_2_BIT)
> > -                     | (parity_byte << PARITY_BYTE_2_BIT));
> > -     drm_dbg_dp(audio->drm_dev,
> > -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> > -                     value, parity_byte);
> > -     msm_dp_audio_set_header(catalog, value,
> > -             DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
> > +     struct dp_sdp_header sdp_hdr = {
> > +             .HB0 = 0x00,
> > +             .HB1 = 0x06,
> > +             .HB2 = 0x0f,
> > +             .HB3 = 0x00,
> > +     };
> > +     u32 header[2];
> > +     u32 reg;
> > +
> > +     /* XXX: is it necessary to preserve this field? */
> > +     reg = msm_dp_read_link(catalog, MMSS_DP_AUDIO_ISRC_1);
> > +     sdp_hdr.HB3 = FIELD_GET(HEADER_3_MASK, reg);
> > +
> > +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> > +
> > +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
> > +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
> >   }
> >
> >   static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
> >



-- 
With best wishes
Dmitry
