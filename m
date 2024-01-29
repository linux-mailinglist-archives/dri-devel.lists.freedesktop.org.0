Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2ED83FD73
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 06:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9838610F60C;
	Mon, 29 Jan 2024 05:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594ED10F608
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 05:06:37 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-603c5d7997aso9433057b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 21:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706504736; x=1707109536; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=36DxkH6EOQYVv8sFye0ArPdaaYXhn0u8iLVoIcGDUF8=;
 b=gUXIpFL6+6DizLCiQydINx71l2AePH3SbiEeerzX4PqHxZhmYWonPc1vAzcQ42qokJ
 tdSzkFhMTBFG1n3+J/s8HsSkK6UQgQFehweXlig0AjbCAXnMg7bCvbDwko6jdcq1Tf+A
 Wd82wyx0OaDq/ec+GGrKiEQOT1R3a6nY08uC5YF3TXeouwuyQQf+2kpcPphIRs6M+AN+
 pYdgzMgQLuOto35lAInt3ajz5CceChlJsCTao/ViNCfu21Du1fN6/9VUZF8yq3rlFryf
 9EsSGqfloGFH9U7azr48+6LHnc97/Tm1RqcnD/c/RDBjdedvyN5N9eC1bb19/BgYbIjY
 1Kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706504736; x=1707109536;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=36DxkH6EOQYVv8sFye0ArPdaaYXhn0u8iLVoIcGDUF8=;
 b=nvT0aJM7WjjVzMGTzIgp2U2lteyeE9NV1hK6JVdrUbdSxFgIzgVelcy4YHXCsYwtEU
 U5LHGeQWoJkxvNdunW6XIRCC/GPIl6Qb224j3sNP2j9rR1ZqAUxTFLQSL41BRl3LCX6y
 iRvLU/B6UqZKjYlXLxmuc4uZtJMgDUptABUZ6DsmxRMR5qMCiNZpUlPxAoopOH/6R59j
 jGQHlbrDg/0Kp4/f75GznanJupZwG81t3EpJT8AmUerBnm80yxUIsALMTZ7vl4OxNF1S
 plakwnTfduGnpmweO3WrKLzIMCu8Y/8V2wvGM7zeElbsSPlSkrkP7INRBCDlnOddmAh4
 Ya9A==
X-Gm-Message-State: AOJu0YykGHOj8K4hbun36MHF7BU9JEWQ6tOOCCE+wW32i1nKHAFF6Gfp
 xqDUXQ3I3vVPK1XKg70S9hEW5qW6pdYswafrPjJaBuQXs7mZSIPhmJa4sHhPuURkHtyG0VQnEWD
 qTSus+Z1QwLsPsFK3nhEnPFLaRtIRWOyQhzfXug==
X-Google-Smtp-Source: AGHT+IFTpEi+5wpjQGrqUTNDBhtl3rOEmxqgInQ/CfP+pGJfm9CWl8JLLWMENATmXQa2P6Q80sCt7FGxnNS4cvwZkds=
X-Received: by 2002:a0d:ca49:0:b0:600:3eca:564a with SMTP id
 m70-20020a0dca49000000b006003eca564amr3106647ywd.95.1706504736465; Sun, 28
 Jan 2024 21:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-18-quic_parellan@quicinc.com>
 <493926f1-90e9-493a-bd2f-ea1db16d7ee6@linaro.org>
 <72ca08ac-ae16-37f6-6f85-f203ddf79084@quicinc.com>
 <CAA8EJppj1xN8E==VGncvW5DKMtLPixynpgAqyZoJzPQXZEEYjg@mail.gmail.com>
 <1666a8c3-f1f0-f050-aa06-cf221bdbcbb9@quicinc.com>
In-Reply-To: <1666a8c3-f1f0-f050-aa06-cf221bdbcbb9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 07:05:25 +0200
Message-ID: <CAA8EJprDUBb7yM-16QVa_i6ONRaNYSWRvJKMG=Z2rPhJ0JfwXw@mail.gmail.com>
Subject: Re: [PATCH 17/17] drm/msm/dp: allow YUV420 mode for DP connector when
 VSC SDP supported
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: neil.armstrong@linaro.org, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 Paloma Arellano <quic_parellan@quicinc.com>, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Jan 2024 at 06:30, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/28/2024 7:52 PM, Dmitry Baryshkov wrote:
> > On Mon, 29 Jan 2024 at 05:17, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 1/25/2024 2:05 PM, Dmitry Baryshkov wrote:
> >>> On 25/01/2024 21:38, Paloma Arellano wrote:
> >>>> All the components of YUV420 over DP are added. Therefore, let's mark the
> >>>> connector property as true for DP connector when the DP type is not eDP
> >>>> and when VSC SDP is supported.
> >>>>
> >>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
> >>>>    1 file changed, 4 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> index 4329435518351..97edd607400b8 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> @@ -370,11 +370,14 @@ static int dp_display_process_hpd_high(struct
> >>>> dp_display_private *dp)
> >>>>        dp_link_process_request(dp->link);
> >>>> -    if (!dp->dp_display.is_edp)
> >>>> +    if (!dp->dp_display.is_edp) {
> >>>> +        if (dp_panel_vsc_sdp_supported(dp->panel))
> >>>> +            dp->dp_display.connector->ycbcr_420_allowed = true;
> >>>
> >>> Please consider fixing a TODO in drm_bridge_connector_init().
> >>>
> >>
> >> I am not totally clear if that TODO can ever go for DP/HDMI usage of
> >> drm_bridge_connector.
> >>
> >> We do not know if the sink supports VSC SDP till we read the DPCD and
> >> till we know that sink supports VSC SDP, there is no reason to mark the
> >> YUV modes as supported. This is the same logic followed across vendors.
> >>
> >> drm_bride_connector_init() happens much earlier than the point where we
> >> read DPCD. The only thing which can be done is perhaps add some callback
> >> to update_ycbcr_420_allowed once DPCD is read. But I don't think its
> >> absolutely necessary to have a callback just for this.
> >
> > After checking the drm_connector docs, I'd still hold my opinion and
> > consider this patch to be a misuse of the property. If you check the
> > drm_connector::ycbcr_420_allowed docs, you'll see that it describes
> > the output from the source point of view. In other words, it should be
> > true if the DP connector can send YUV420 rather than being set if the
> > attached display supports such output. This matches ycbcr420_allowed
> > usage by AMD, dw-hdmi, intel_hdmi and even intel_dp usage.
> >
>
> hmmm I think I misread intel_dp_update_420(). I saw this is called after
> HPD so I thought they unset ycbcr_420_allowed if VSC SDP is not
> supported. But they have other DPCD checking there so anyway they will
> fail this bridge_connector_init() model.
>
> But one argument which I can give in my defense is, lets say the sink
> exposed YUV formats but did not support SDP, then atomic_check() will
> keep failing or should keep failing. This will avoid this scenario. But
> we can assume that would be a rogue sink.

This should be handled in DP's atomic_check. As usual, bonus point if
this is done via helpers that can be reused by other platforms.

> I think we can pass a yuv_supported flag to msm_dp_modeset_init() and
> set it to true from dpu_kms if catalog has CDM block and get rid of the
> dp_panel_vsc_sdp_supported().

These are two different issues. CDM should be checked in PDU (whether
the DPU can provide YUV data to the DP block).

>
> But that doesnt address the TODO you have pointed to. What is really the
> expectation of the TODO? Do we need to pass a ycbcr_420_allowed flag to
> drm_bridge_connector_init()?

Ugh. No. I was thinking about a `ycbcr420_allowed` flag in the struct
drm_bridge (to follow existing interlace_allowed) flag. But, this
might be not the best option. Each bridge can either pass through YUV
data from the previous bridge or generate YCbCr data on its own. So in
theory this demands two flags plus one flag for the encoder. Which
might be an overkill, until we end up in a situation when the driver
can not decide for the full bridge chain.

So let's probably ignore the TODO for the purpose of this series. Just
fix the usage of ycbcr420_allowed according to docs.

>
> That would need a tree wide cleanup and thats difficult to sign up for
> in this series and I would not as well.
>
> One thing which I can suggest to be less intrusive is have a new API
> called drm_bridge_connector_init_with_YUV() which looks something like
> below:
>
> struct drm_connector *drm_bridge_connector_init_with_ycbcr_420(struct
> drm_device *drm, struct drm_encoder *encoder)
> {
>         drm_bridge_connector_init();
>         connector->ycbcr_420_allowed = true;
> }
>
> But I don't know if the community would be interested in this idea or
> would find that useful.
>
> >>>>            drm_dp_set_subconnector_property(dp->dp_display.connector,
> >>>>                             connector_status_connected,
> >>>>                             dp->panel->dpcd,
> >>>>                             dp->panel->downstream_ports);
> >>>> +    }
> >>>>        edid = dp->panel->edid;
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
