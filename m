Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3725F7188DC
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 19:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3996A10E502;
	Wed, 31 May 2023 17:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1201510E502
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 17:53:24 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-568af2f6454so28799557b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 10:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685555604; x=1688147604;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dqEFokutPlWHp6iUC83Xjciu2KQ+BavT6TGVpdRnlGk=;
 b=EwfgnWll56GCjBcN1cIZ2Apaci26NiYl7FrcVAXCG7aRlFZmfBTA2ZErk5/YRUt3+L
 6oGWzV6JxeRNo1LeDkRzouJkskwx0giwJpnQmYG23W6gKXnPVe0UFb9l4w03zQUvdtVj
 aRGmsoNtALgyFf9mrc3/VoNlBy5nawN8xPLyPGfNQLbbOsge1XxyFAEXeAsU6MaPOwc8
 /guGT1UXBcxA/QmM2kGRwEGEUIku46WsFp89FXBwXb0uVqP3sRGjPB13g/HdR1Sr2Ylw
 80xexz0qm27he4N4vO0vohadJzPgDpVFW4S81i+oz9lgrIU7y1nWkOTkR7csYMv9ma1o
 udBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685555604; x=1688147604;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dqEFokutPlWHp6iUC83Xjciu2KQ+BavT6TGVpdRnlGk=;
 b=ItMl5n2gYOFE7f0ItjkdmsX+gQYw8T+/0oVjzhvTWwOWMT0w6Tss4rHUI8eUPSqDdh
 axT0FfukoE5MHu4Ccorc2dMX4AQTfMCDooVyTwyovusSbq9ZfUQShe5S4kINOgcWc5zd
 AjGxZehq4Q6qMkgXhRETuPGgHYo63/zdoUtWNUPG3yDvjkSSDb0JxiCBUY1bwjgXLw4S
 MFrsZvg1OV5+TBQRsjV7I7DRy+fLYbN8d2vF+5g9PFhBwjOf2PgA/HsPxVHjYYFG5bvN
 MI7drY+aBgTw5doBnet8BmJh3rUL2BK50FSKi9cLvGMWOURvIOC03utMYthv/CGffcMJ
 CEgw==
X-Gm-Message-State: AC+VfDwq/txfdu4j3zp7IhGFtl12PVo3V+7bJD7duVYBeJLIqbPLaG64
 Eq6jYt9978QUZkkpLfdWa1azNWoXUVX4SJM92ucdzw==
X-Google-Smtp-Source: ACHHUZ53vNWX+g9NG7x1PjohENCM9c217qPR01yiSb6haDYnSF3yL9PFSNFfSq1sZz8ugsuL++LHR2Rn0O/zdrb2HPo=
X-Received: by 2002:a81:92c2:0:b0:564:e527:4d7 with SMTP id
 j185-20020a8192c2000000b00564e52704d7mr5979020ywg.25.1685555603892; Wed, 31
 May 2023 10:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <1685464318-25031-1-git-send-email-quic_khsieh@quicinc.com>
 <1685464318-25031-3-git-send-email-quic_khsieh@quicinc.com>
 <dfa12c8b-ccec-261c-9c83-54536e17c02d@linaro.org>
 <157e8219-7af2-c7ed-6d99-3caa6fbc11ba@quicinc.com>
 <CAA8EJponkEne2vVsNP=2Fxmv=Uc6i_LzAGBSEz9hPPotCEpGzg@mail.gmail.com>
 <e69f02b7-eba9-5f33-5ca1-eb0638928414@quicinc.com>
In-Reply-To: <e69f02b7-eba9-5f33-5ca1-eb0638928414@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 May 2023 20:53:13 +0300
Message-ID: <CAA8EJpr9dfrrEsFf8heOvG3BWRTVCY-q1QYNH_3OBeMAWEwotA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/dpu: retrieve DSI DSC struct at
 atomic_check()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 May 2023 at 20:29, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 5/31/2023 10:12 AM, Dmitry Baryshkov wrote:
> > On Wed, 31 May 2023 at 18:41, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>
> >>
> >>>>    +    if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> >>> INTF_DSI
> >>>
> >>>> +        struct drm_bridge *bridge;
> >>>> +
> >>>> +        if (!dpu_enc->dsc) {
> >>> This condition is not correct. We should be updating the DSC even if
> >>> there is one.
> >>>
> >>>> +            bridge = drm_bridge_chain_get_first_bridge(drm_enc);
> >>>> +            dpu_enc->dsc = msm_dsi_bridge_get_dsc_config(bridge);
> >>> This approach will not work for the hot-pluggable outputs. The dpu_enc
> >>> is not a part of the state. It should not be touched before
> >>> atomic_commit actually commits changes.
> >> where can drm_dsc_config be stored?
> > I'd say, get it during atomic_check (and don't store it anywhere).
> > Then get it during atomic_enable (and save in dpu_enc).
> got it.
> >
> >>> Also, I don't think I like the API. It makes it impossible for the
> >>> driver to check that the bridge is the actually our DSI bridge or not.
> >>> Once you add DP here, the code will explode.
> >>>
> >>> I think instead we should extend the drm_bridge API to be able to get
> >>> the DSC configuration from it directly. Additional care should be put
> >>> to design an assymetrical API. Theoretically a drm_bridge can be both
> >>> DSC source and DSC sink. Imagine a DSI-to-DP or DSI-to-HDMI bridge,
> >>> supporting DSC on the DSI side too.
> >> Form my understanding, a bridge contains two interfaces.
> >>
> >> Therefore I would think only one bridge for dsi-to-dp bridge? and this
> >> bridge should represent the bridge chip?
> >>
> >> I am thinking adding an ops function, get_bridge_dsc() to struct
> >> drm_bridge_funcs to retrieve drm_dsc_config.
> > So, for this DSI-to-DP bridge will get_bridge_dsc() return DSC
> > configuration for  the DSI or for the DP side of the bridge?
>
> I would think should be DP side. there is no reason to enable dsc on
> both DSI and DP fro a bridge chip.

Well, there can be. E.g. to lower the clock rates of the DSI link.

>
> drm_bridge_chain_get_first_bridge(drm_enc) should return the bridge of
> the controller.
>
> In DSI-to-DP bridge chip case, this controller will be the bridge chip
> who configured to perform protocol conversion between DSI and DP.
>
> If DSC enabled should be at DP size which connect to panel.

Ok, so it returns the DSC configuration of the bridge's source side.
Now let's consider a panel bridge for the DSC-enabled DSI panel.
Should get_bridge_dsc() return a DSC config in this case?

> >> Do you have other suggestion?
> > Let me think about it for a few days.
-- 
With best wishes
Dmitry
