Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCC985C361
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 19:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A09910E136;
	Tue, 20 Feb 2024 18:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J+TCeWl9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1030A10E136
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 18:09:56 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6002317a427so47317887b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 10:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708452596; x=1709057396; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TJ0aDR9NVt9XM9NUkLl3BrBKP3ikJ6XdHk6DaL6OOv8=;
 b=J+TCeWl9TiOf2ydvZ+8rE6E5t6f8EeA5SXwllgvaW+1H+3anzmOAIt7X0MhDpIu3Ao
 P+qeoi6vodjfFtj0q1rAnmsM7uwxtBxtZu2nVF+e7V8sCHjRZvCNMhCJJ8TdAL2CF/SP
 PeRpQKuKnFQvOtxt2ZW9TUhVVAjl7s4keRBrS4Yj9Yi2yDEeZh0oI+d48AGeHvKNNzwK
 fYYbl3rux820zX4iKpg1lxn0E3HqbDctrqBoVDfa78pRLHYrJf11UOR4dConifer4IFR
 hrYR9O07z9Zbo8vQUtnr9ZWQyX8XzjFH3hbDmOqpTeXcsCtIBGn9x3inIlk9Nl94W55X
 b9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708452596; x=1709057396;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TJ0aDR9NVt9XM9NUkLl3BrBKP3ikJ6XdHk6DaL6OOv8=;
 b=HYcdawevVN/552uXzJ5v31eXBullW3ACiPUr1LQtyEoFtw3E6sFvQyMRZx0dDDAYlL
 jmALtKfmJkUX4Z9AwmgNrAGer9uWgYEJv20sEXr2H+fN3dRH1Yc4dnBXQlYlmlvcDmVn
 QrdTpE4SxGaQSp6G4kU+74foJsX2rXyMQF+iB9FWHNBy1ukjxNlkf0lTWAdsGrEP5cId
 PwKguO2U8DTzXeoIXHtBJpqt06zlm2RESscWlAJxkUkbzrjWv7FQTGqgLp+Tj+Eu7wuj
 0twgqsAYWSNKtXcANIK1mPvfv/+UumzlFtzcOj3/T4WTnmms1vqEZXzZGwzlAneMbBUK
 3beg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKiNeoo7Ze0COe5c8/DRGkuCWVOA1fibjGD5y1jvx9leXpNC3aAc7w53i1/eWWsQCjCBuRSmv2TKAw/zlHxO/X0HMcyS83Ycty+J+r2G+y
X-Gm-Message-State: AOJu0Yw9+hzZm7/q8axgnRVcEIzrsHNxAYBZd+KjaZ7dQqppTYsAAXto
 XuR11vfWOedqtxU1xII05e3TG7aG8CSYclwnoVHK4kAHx2h4dsO1kDs5s8+FCBo9qnvzj0gP6Ys
 7Zz3lRGVV8X2+819VNmC1F3h/7gZDei7wlq4L7g==
X-Google-Smtp-Source: AGHT+IFQeiHiIryJtC2om6c9aK4p9MZ4vJ/D8X0QgnxGrJvJytDUmw+oY9eK1dhe5485mH4cpPuSesAGuVShLB9++Qc=
X-Received: by 2002:a81:4f14:0:b0:608:664e:3bfb with SMTP id
 d20-20020a814f14000000b00608664e3bfbmr2360294ywb.40.1708452595734; Tue, 20
 Feb 2024 10:09:55 -0800 (PST)
MIME-Version: 1.0
References: <20240216230228.26713-1-quic_parellan@quicinc.com>
 <20240216230228.26713-14-quic_parellan@quicinc.com>
 <CAA8EJppO4FcJJex8mBbPoDyUbkn4zFvDFR0h3sOY75Qth15Rng@mail.gmail.com>
 <30f383ce-0952-0dc1-a7a1-a7565526f728@quicinc.com>
In-Reply-To: <30f383ce-0952-0dc1-a7a1-a7565526f728@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 20:09:44 +0200
Message-ID: <CAA8EJpr4XKDQELhhnumqmH2Yh4qzh-gypR4tpRQ0eDhSB3U0Sw@mail.gmail.com>
Subject: Re: [PATCH v4 13/19] drm/msm/dp: add VSC SDP support for YUV420 over
 DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
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

On Tue, 20 Feb 2024 at 19:55, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 2/17/2024 12:56 AM, Dmitry Baryshkov wrote:
> > On Sat, 17 Feb 2024 at 01:03, Paloma Arellano <quic_parellan@quicinc.com> wrote:

> >> +       }
> >> +
> >> +       panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> >> +       catalog = panel->catalog;
> >> +       dp_mode = &dp_panel->dp_mode;
> >> +
> >> +       memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
> >> +
> >> +       /* VSC SDP header as per table 2-118 of DP 1.4 specification */
> >> +       vsc_sdp_data.sdp_type = DP_SDP_VSC;
> >> +       vsc_sdp_data.revision = 0x05;
> >> +       vsc_sdp_data.length = 0x13;
> >> +
> >> +       /* VSC SDP Payload for DB16 */
> >> +       vsc_sdp_data.pixelformat = DP_PIXELFORMAT_YUV420;
> >> +       vsc_sdp_data.colorimetry = DP_COLORIMETRY_DEFAULT;
> >> +
> >> +       /* VSC SDP Payload for DB17 */
> >> +       vsc_sdp_data.bpc = dp_mode->bpp / 3;
> >> +       vsc_sdp_data.dynamic_range = DP_DYNAMIC_RANGE_CTA;
> >> +
> >> +       /* VSC SDP Payload for DB18 */
> >> +       vsc_sdp_data.content_type = DP_CONTENT_TYPE_GRAPHICS;
> >> +
> >> +       len = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &vsc_sdp, header);
> >> +       if (len < 0) {
> >> +               DRM_ERROR("unable to pack vsc sdp\n");
> >> +               return len;
> >> +       }
> > So, at this point we have the header data both in vsc_sdp.sdp_header
> > and in the packed header. The relationship between them becomes less
> > obvious. Could you please pack dp_sdp_header into u32[2] just before
> > writing it? It really makes little sense to pass both at the same
> > time.
>
>
> Just want to clear some stuff up. Do you want to call the
> dp_utils_pack_sdp_header() function right before
> dp_catalog_panel_send_vsc_sdp()? The point of putting the
> dp_utils_pack_sdp_header() function inside dp_utils_pack_vsc_sdp() is so
> that all of the packing could be in the same location. Although I agree
> that we are passing the same values twice, I believe that having it the
> way it is currently is better since it shows that the
> drm_dp_vsc_sdp_pack() and dp_utils_pack_sdp_header() are related since
> they're packing the data to the set of GENERIC0 registers.

I'm perfectly fine with dp_utils_pack_sdp_header() being called from
within dp_catalog_panel_send_vsc_sdp(). This way you are not passing
extra data and it is perfectly clear how the SDP header is handled
before being written to the hardware.


-- 
With best wishes
Dmitry
