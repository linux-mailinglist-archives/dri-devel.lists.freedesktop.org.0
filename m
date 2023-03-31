Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8757D6D13EC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 02:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7751D10F0B3;
	Fri, 31 Mar 2023 00:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4073B10F0B3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 00:16:55 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-544f7c176easo385944897b3.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 17:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680221814;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nwvfaw6V9dI0/2q8Aos33hd9sn4tNv/OIznp4380bhA=;
 b=a01qGW759DCrNw8iYW5mvUtEzjuZ/9zM+dyA1D6Nk21WkKg0b2TSWhfP/CYl6tA/cq
 Go1FZ2Nj5CVqh+8LeCt0ooKNdm3xZK+dDEZGwL8rGI7nSMdnmVOIrgZwgkhNQpVaznM2
 9T2J+kRems4rjDcH2/Ep2I8LR0KEwA2wEzx8Nmhv1vQ12pG4ZYwp0MHNqCFvbST8eKBY
 h6B7bEwg/bP9MUAs+pjbnI2r1dW2fybA7zsLGEDCqAcWPGYlCVSb3+MZpc6wJ9OdYT6p
 bI2TMdstjTFu7as4wvfCSJWXwDi3bdC36Xy//N78YsSS9LHDcHX83dQ+MCrV2nmLcWwg
 mf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680221814;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nwvfaw6V9dI0/2q8Aos33hd9sn4tNv/OIznp4380bhA=;
 b=bdMenq55eQney2x6fcnTEjtsV3STQFoi3sBb5gGgVycZwIS1FJ1WEiQQR1TpOdzttj
 oN8zJs0hEnt8xURLQ8d8AwsLtJ6P5HQL4L/sJ/hJYIFeQMkNUPipw6tIP5lzFgsqCw30
 3XbKWavnODK9aM4xMcIbctSvFfm0ImBzk2Rk2eNMzyw8joWx//yCHO+w7OxxO9qJysJs
 jq0VSxeckrqSRY/p1EPySWHJrYmo80qgiiSXqiLQC10t+cVkgGxfSX6ztl5aLqA4RPHm
 2BcINcK48m+xYQealKMXh+Q0EY2gsCu4Fbzwh1RmE4MHjnGBUc9V+JIfZM+7zFdklDlV
 HjMQ==
X-Gm-Message-State: AAQBX9dvbMngF+nt0vOuhiSpNGIWgbY7stDT52pIQUuC2vO4UZQru74h
 eT/BtehnWAgOyeotmEj4fTCB5nPenEYE9BuRv9KOvg==
X-Google-Smtp-Source: AKy350YULGhI88B8rpCIUYDVshjOig8QxNGjzbSr/leeOL3+1x3nAIgmZaWodS7XOCzA6c6ljtL7dd+VjDMKYJDBBNw=
X-Received: by 2002:a81:b617:0:b0:541:7f69:aa8b with SMTP id
 u23-20020a81b617000000b005417f69aa8bmr12056627ywh.5.1680221814251; Thu, 30
 Mar 2023 17:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-5-f3e479f59b6d@quicinc.com>
 <0698ce89-d70c-c3f4-f006-18130858aacf@linaro.org>
 <2c9ac12f-df2f-8576-555b-3d84a6205ee3@quicinc.com>
 <c3ac5c2b-e0e0-5d7c-67d3-4fc2316b68c5@linaro.org>
 <6461a8b8-f620-5f9c-9533-f65ac42c0524@quicinc.com>
In-Reply-To: <6461a8b8-f620-5f9c-9533-f65ac42c0524@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 Mar 2023 03:16:42 +0300
Message-ID: <CAA8EJprriCLXR+P7ZOWLQCOhvi0WCUzNrCu4eyyqegNtPZbBUg@mail.gmail.com>
Subject: Re: [PATCH RFC 5/5] drm/msm/dsi: Use MSM and DRM DSC helper methods
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 31 Mar 2023 at 03:07, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 3/30/2023 4:14 PM, Dmitry Baryshkov wrote:
> > On 31/03/2023 01:49, Jessica Zhang wrote:
> >>
> >>
> >> On 3/29/2023 4:48 PM, Dmitry Baryshkov wrote:
> >>> On 30/03/2023 02:18, Jessica Zhang wrote:
> >>>> Use MSM and DRM DSC helper methods.
> >>>>
> >>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>> ---
> >>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 18 ++++++++++++------
> >>>>   1 file changed, 12 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >>>> index 74d38f90398a..7419fe58a941 100644
> >>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >>>> @@ -31,6 +31,7 @@
> >>>>   #include "msm_kms.h"
> >>>>   #include "msm_gem.h"
> >>>>   #include "phy/dsi_phy.h"
> >>>> +#include "disp/msm_dsc_helper.h"
> >>>>   #define DSI_RESET_TOGGLE_DELAY_MS 20
> >>>> @@ -841,14 +842,14 @@ static void dsi_update_dsc_timing(struct
> >>>> msm_dsi_host *msm_host, bool is_cmd_mod
> >>>>   {
> >>>>       struct drm_dsc_config *dsc = msm_host->dsc;
> >>>>       u32 reg, reg_ctrl, reg_ctrl2;
> >>>> -    u32 slice_per_intf, total_bytes_per_intf;
> >>>> +    u32 slice_per_intf;
> >>>>       u32 pkt_per_line;
> >>>>       u32 eol_byte_num;
> >>>>       /* first calculate dsc parameters and then program
> >>>>        * compress mode registers
> >>>>        */
> >>>> -    slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
> >>>> +    slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);
> >>>
> >>> This looks good
> >>>
> >>>>       /*
> >>>>        * If slice_count is greater than slice_per_intf
> >>>> @@ -858,10 +859,10 @@ static void dsi_update_dsc_timing(struct
> >>>> msm_dsi_host *msm_host, bool is_cmd_mod
> >>>>       if (dsc->slice_count > slice_per_intf)
> >>>>           dsc->slice_count = 1;
> >>>> -    total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> >>>> +    eol_byte_num = msm_dsc_get_eol_byte_num(msm_host->dsc, hdisplay,
> >>>> +            dsi_get_bpp(msm_host->format));
> >>>> -    eol_byte_num = total_bytes_per_intf % 3;
> >>>> -    pkt_per_line = slice_per_intf / dsc->slice_count;
> >>>> +    pkt_per_line = slice_per_intf / MSM_DSC_SLICE_PER_PKT;
> >>>
> >>> And for these values the result is definitely changed. Separate patch
> >>> & description please. Just in case, "values per downstream kernel" is
> >>> not a proper description for such changes.
> >>
> >> Hi Dmitry,
> >>
> >> Sure, I can put this into a separate patch.
> >>
> >> The reason this was changed from slice_count to SLICE_PER_PKT was
> >> because slice count and slice per packet aren't always equivalent.
> >> There can be cases where panel configures DSC to have multiple soft
> >> slices per interface, but the panel only specifies 1 slice per packet.
> >
> > Please put this nice description into the commit message. It is exactly
> > what I was looking for!
> >
> > BTW: Do you expect to change MSM_DSC_SLICE_PER_PKT later or it will stay
> > at "1"? If so, it might be easier to drop it and instead add a comment.
>
> MSM_DSC_SLICE_PER_PKT is the default value for panels that don't specify
> a slice_per_pkt value. (Now that I think about it, might be better to
> call it MSM_DSC_DEFAULT_SLICE_PER_PKT instead...)

Note, there is no slice_per_pkt in drm_dsc_config, so we must come up
with another way to pass this data from the panel or to deduce the
value in our driver.

>
> I don't expect it to change in the future, but it's a little more
> readable than just dividing by 1 IMO. If you prefer dropping the macro
> and adding a comment, I'm also okay with that.

There is no need to divide by 1, the value doesn't change. So I'd
probably prefer something like:

/* Default to 1 slice per packet */
if (panel_slice_per_pkt)
    pkt_per_line = slice_per_intf / panel_slice_per_pkt;
else
    pkt_per_line = slice_per_intf;

Or:

/* Default to 1 slice per packet */
slice_per_pkt = 1;
if (panel_slice_per_pkt)
    slice_per_pkt = panel_slice_per_pkt;
pkt_per_line = slice_per_intf / slice_per_pkt;

BTW: could you possibly change 'intf' to 'line' to v2? It seems there
is a mixture of them through the code. If there is a difference
between intf and line which is not yet posted, it's fine to keep the
current code. WDYT?

>
> Thanks,
>
> Jessica Zhang
>
> >
> > Regarding eol_byte_num, probably the best explanation would be that is
> > is a size of a padding rather than a size of a trailer bytes in a line
> > (and thus original calculation was incorrect).
> >
> >>
> >>>
> >>>>       if (is_cmd_mode) /* packet data type */
> >>>>           reg =
> >>>> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
> >>>> @@ -911,6 +912,11 @@ static void dsi_timing_setup(struct
> >>>> msm_dsi_host *msm_host, bool is_bonded_dsi)
> >>>>       DBG("");
> >>>> +    if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
> >>>> +        /* Default widebus_en to false for now. */
> >>>> +        hdisplay = msm_dsc_get_pclk_per_line(msm_host->dsc,
> >>>> mode->hdisplay,
> >>>> +                dsi_get_bpp(msm_host->format));
> >>>> +
> >>>
> >>> This is definitely something new and thus should probably go into a
> >>> separate patch and be described. Also I'm not sure how does that
> >>> interact with the hdisplay-related calculations below, under the
> >>> if(dsc) clause.
> >>
> >> After double-checking the math here, I think this part of the change
> >> is actually wrong. pclk_per_line is essentially doing hdisplay / 3,
> >> which is a repeat of what's being done in the `if (dsc)` block.
> >>
> >> Will replace `hdisplay /= 3` with the pclk_per_line calculation.
> >
> > Thanks!
> >
> >>
> >> Thanks,
> >>
> >> Jessica Zhang
> >>
> >>>
> >>>>       /*
> >>>>        * For bonded DSI mode, the current DRM mode has
> >>>>        * the complete width of the panel. Since, the complete
> >>>> @@ -1759,7 +1765,7 @@ static int dsi_populate_dsc_params(struct
> >>>> msm_dsi_host *msm_host, struct drm_dsc
> >>>>           return ret;
> >>>>       }
> >>>> -    dsc->initial_scale_value = 32;
> >>>> +    dsc->initial_scale_value =
> >>>> drm_dsc_calculate_initial_scale_value(dsc);
> >>>
> >>> This is fine, we only support 8bpp where these values match.
> >>>
> >>>>       dsc->line_buf_depth = dsc->bits_per_component + 1;
> >>>>       return drm_dsc_compute_rc_parameters(dsc);
> >>>>
> >>>
> >>> --
> >>> With best wishes
> >>> Dmitry
> >>>
> >
> > --
> > With best wishes
> > Dmitry
> >



-- 
With best wishes
Dmitry
