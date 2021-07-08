Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 167D73BF617
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 09:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4506B6E839;
	Thu,  8 Jul 2021 07:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA856E870
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 07:14:32 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso4904982otu.10
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 00:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=EExaHI1thjef0RoUFOMDogl2sDpmm35wAYmQrG+YsrQ=;
 b=dxC2cDjRWk8y0DcKuvUIf6RY4Um7IgIWF4hpiAr6MhIyIw3kZ7WnFuPA6CoD1tgorB
 vwcBXRWBk0O+IzOMw03wYyvVRfLIe63zsI7ljfvMFzfylTasJNEdDzKa29/IKCFsSzY0
 vPZ/leRChW2En9Nfbw4ZSh9DSaua+jT75xtxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=EExaHI1thjef0RoUFOMDogl2sDpmm35wAYmQrG+YsrQ=;
 b=pYr7ZgwUTqsdOyAV3NITAE4QFk84TovE33ROHyhQ0Ie+5O1w4THnS+NpMPwB3QKON/
 gh+SFAWNaUUP2UdwsYgN9swn6tqIOYo79NtKsUQptyfjbn35KewvcVITatFH124hlXzQ
 16WNKAhrWCN3oD8rQM30+l8PU2dQNj7mvWEkE9gu+jXggSXJS87Ncz5/44u2Al2LOhY2
 Yb+FyH0ike2BrMu0vSOyz5A56LGynBF56s5yLqp7cFQIQn3TGwZwv3I7Z7M/LcXXSq4T
 r2fKMqXY22JQ3WJBPB/C2kFQG/AzAXwfXanjvmrzLZptsyVSqjxTWu4imDancsdGGqTL
 RoCA==
X-Gm-Message-State: AOAM533Ynt7Pfw6+k8ttZWSDFxlBT2p2iFCeBAREEKsFJprOtpeNHCUA
 B26fyXKPBpMZNre2Q7Z5AGh5WgIIpzYgiupYVUDzQFqfcMI=
X-Google-Smtp-Source: ABdhPJx7ElYsrePGFPR2BFjaZQI/FirCtlNOKAZzX5n2/4/kEnVJ5rYSzPPfVR+nmzhjQgoBci3gJw1a23+7SGL7XWs=
X-Received: by 2002:a9d:2781:: with SMTP id c1mr22131987otb.34.1625728471826; 
 Thu, 08 Jul 2021 00:14:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Jul 2021 07:14:31 +0000
MIME-Version: 1.0
In-Reply-To: <1625592020-22658-6-git-send-email-khsieh@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
 <1625592020-22658-6-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 8 Jul 2021 07:14:31 +0000
Message-ID: <CAE-0n53BnbjD3QaZ5vynJxw44ANatvvRW3rqytyG4jvjKs7L_g@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/msm/dp: return correct edid checksum after
 corrupted edid checksum read
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-06 10:20:18)
> Response with correct edid checksum saved at connector after corrupted edid
> checksum read. This fixes Link Layer CTS cases 4.2.2.3, 4.2.2.6.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 88196f7..0fdb551 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -271,7 +271,7 @@ static u8 dp_panel_get_edid_checksum(struct edid *edid)
>  {
>         struct edid *last_block;
>         u8 *raw_edid;
> -       bool is_edid_corrupt;
> +       bool is_edid_corrupt = false;
>
>         if (!edid) {
>                 DRM_ERROR("invalid edid input\n");
> @@ -303,7 +303,12 @@ void dp_panel_handle_sink_request(struct dp_panel *dp_panel)
>         panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>
>         if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
> -               u8 checksum = dp_panel_get_edid_checksum(dp_panel->edid);
> +               u8 checksum;
> +
> +               if (dp_panel->edid)
> +                       checksum = dp_panel_get_edid_checksum(dp_panel->edid);
> +               else
> +                       checksum = dp_panel->connector->real_edid_checksum;
>
>                 dp_link_send_edid_checksum(panel->link, checksum);

It looks like this can be drm_dp_send_real_edid_checksum()? Then we
don't have to look at the connector internals sometimes and can drop
dp_panel_get_edid_checksum() entirely?

>                 dp_link_send_test_response(panel->link);
