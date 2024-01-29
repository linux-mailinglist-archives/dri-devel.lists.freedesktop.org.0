Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D0C83FD07
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 04:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8974810F5D4;
	Mon, 29 Jan 2024 03:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C040D10F5D4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 03:53:35 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dc22597dbfeso2915454276.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 19:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706500355; x=1707105155; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pXzkmM0Io5FhP7wU1xumZrJF60VkcQ0t5v5wmRt/yWg=;
 b=g5CrDdWwJIYymUZo59AMD2iz7HaZdJQUPTtYLzkGFRLKzsglWMqmeojfrYwbiej92y
 feQ0q17/VtnESu7ZVNz1LprDcL7HfMmW63bUaSnm+Jd2d+/Bq9l0GEMAiJQ7mmtAZgIs
 T7QUcRnmGK5cJoKF/78rEFaMNt1+ftWMdUDiPp8dZBlUK3YajaqeitFE8ZPLhmEc515P
 pfmczIRgnSXhL8es2li+1SeUxNH4R7/mYF1zQbbCj117K0vMp9eo04WdV16TT/B31m9I
 4D1kRON0Dptk6vmTJLv9L/pjwiiIMFFNP3IGGfpqUIgQvQpWveSCZtmmHMDORGh+rq6J
 UTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706500355; x=1707105155;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pXzkmM0Io5FhP7wU1xumZrJF60VkcQ0t5v5wmRt/yWg=;
 b=SLLAEJ6jTv8/h5lf+c9ArXrjql6S1wPlId0l0hlluautlKr/tJCDu1PlRIx8wSabpE
 xH1Qal4qgHdduJ6Y4nTQV7Giklr+H4FF2j2Bg9E6neXULby4tFCbB650wolyhvP85Vsy
 xP9+BeglWeLfOU13Wn3fl6q59WaAPRBTU7/niveMl0mtYjBWsTH/dD5LNH8r5FbuAlSC
 B6mAhp8AnSF+m75lMfXKchxbIP9Dy2cHEMIh8ytNV6LzNdIrWqXBGedFAhxxXjgCOHY6
 7SFh7stjOISGL+NDsbKUgZ36imKybBdRUSFElh3bYQSVnRU4TQCMHjczTFZu0AitqI62
 cuHA==
X-Gm-Message-State: AOJu0YxY+Ai7jknJ2Z7xOrGVOcFFv8STsck2LlgJdSY/BJMOG4F1dWV3
 UqACtli9HFzDvfzbM5P5bHSkSZIjGXml0+brwD/wc5gjIgAv8YQBeFMErYmEe/ypR1QmdJpesAc
 nL6F4Sud9DFSJUzrxvAWauJjUTBPk7G2FGSYlHQ==
X-Google-Smtp-Source: AGHT+IG5C65qU/0gcWAKfSFARxzyL6u3mN0Xtc9oqbv09qPqppYihW4uBL1M+tgFQw4KqF1LuOG1RCKLgmDkBH+ElDs=
X-Received: by 2002:a5b:bd1:0:b0:dbd:72c8:738f with SMTP id
 c17-20020a5b0bd1000000b00dbd72c8738fmr3622259ybr.103.1706500354961; Sun, 28
 Jan 2024 19:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-18-quic_parellan@quicinc.com>
 <493926f1-90e9-493a-bd2f-ea1db16d7ee6@linaro.org>
 <72ca08ac-ae16-37f6-6f85-f203ddf79084@quicinc.com>
In-Reply-To: <72ca08ac-ae16-37f6-6f85-f203ddf79084@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 05:52:24 +0200
Message-ID: <CAA8EJppj1xN8E==VGncvW5DKMtLPixynpgAqyZoJzPQXZEEYjg@mail.gmail.com>
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

On Mon, 29 Jan 2024 at 05:17, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/25/2024 2:05 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> All the components of YUV420 over DP are added. Therefore, let's mark the
> >> connector property as true for DP connector when the DP type is not eDP
> >> and when VSC SDP is supported.
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
> >>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >> b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 4329435518351..97edd607400b8 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -370,11 +370,14 @@ static int dp_display_process_hpd_high(struct
> >> dp_display_private *dp)
> >>       dp_link_process_request(dp->link);
> >> -    if (!dp->dp_display.is_edp)
> >> +    if (!dp->dp_display.is_edp) {
> >> +        if (dp_panel_vsc_sdp_supported(dp->panel))
> >> +            dp->dp_display.connector->ycbcr_420_allowed = true;
> >
> > Please consider fixing a TODO in drm_bridge_connector_init().
> >
>
> I am not totally clear if that TODO can ever go for DP/HDMI usage of
> drm_bridge_connector.
>
> We do not know if the sink supports VSC SDP till we read the DPCD and
> till we know that sink supports VSC SDP, there is no reason to mark the
> YUV modes as supported. This is the same logic followed across vendors.
>
> drm_bride_connector_init() happens much earlier than the point where we
> read DPCD. The only thing which can be done is perhaps add some callback
> to update_ycbcr_420_allowed once DPCD is read. But I don't think its
> absolutely necessary to have a callback just for this.

After checking the drm_connector docs, I'd still hold my opinion and
consider this patch to be a misuse of the property. If you check the
drm_connector::ycbcr_420_allowed docs, you'll see that it describes
the output from the source point of view. In other words, it should be
true if the DP connector can send YUV420 rather than being set if the
attached display supports such output. This matches ycbcr420_allowed
usage by AMD, dw-hdmi, intel_hdmi and even intel_dp usage.

> >>           drm_dp_set_subconnector_property(dp->dp_display.connector,
> >>                            connector_status_connected,
> >>                            dp->panel->dpcd,
> >>                            dp->panel->downstream_ports);
> >> +    }
> >>       edid = dp->panel->edid;
> >



-- 
With best wishes
Dmitry
