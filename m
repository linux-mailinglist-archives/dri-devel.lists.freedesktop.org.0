Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C36486E87
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 01:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B01D10E6D7;
	Fri,  7 Jan 2022 00:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F2E10E6D6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 00:16:38 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id s127so6090233oig.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 16:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=AhAOsZ/7jHs5SUsagnpCXuv8mziNMy8lNAe5OxNHwRI=;
 b=jtu0UCzsfvv7r/9Ui35y3wcCDJ3CTyXCC8ChvPsXCS9J3W37m6SMoBTQbsj+ErtfE9
 pe0aHLL5ZWI9rFnxE5JXD20lz7HQ5hXDUeTh2khVn4BFwqA6b1gU7t/PkpRjvVqM6VpH
 u3uv0WnE20bi241CKaAwLaQZj5rAyiY2wkRUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=AhAOsZ/7jHs5SUsagnpCXuv8mziNMy8lNAe5OxNHwRI=;
 b=7XTi7LP0y3T6zL9NsAtTeo0E3yXPvEG5bj8MJNnKypMfxLiezqDwb+ayBKYbvjZbX2
 bAaTI+Byqk+yk98tSLDPvwJ15YBZIE0Qh73ry6zLbe5AtbELo9YoQnbMGEf26iZbe2je
 FCv1FfvYYl7BYEplmyKucYKF7K7i7jfUAMI6a2GzIc5pez03CU1eYz1vDVGDcunu/LkZ
 vQpIK05L362NabtSKtHmHiZW6M55S2nZXglZaIGI9bHOAwP6utDTtUKrco6HlVTaXMS2
 mcjVFuTXeWqofrOgFPhUTXv/xpE6XHBVvo9YacpYOQgJfXIQ2eOb0NohEFBbT9GmlYe9
 tO8A==
X-Gm-Message-State: AOAM531pFRkhfkm4KmhnaTWzXb+1AVpGXM6OYkBo5Hrt+k461mainsAJ
 zEDnJzVGsM48svhd4zF5TVw69SXGw/OUNEsBrokAQg==
X-Google-Smtp-Source: ABdhPJzdnu0U3lCEWw7wwT5P+wBqtXsBtwXolcxsJQLEGILR/MbyPZuk7wEfhLzqqaqCXLmimPsFv6cKTyObVMLoGMs=
X-Received: by 2002:a54:4710:: with SMTP id k16mr7970018oik.32.1641514597511; 
 Thu, 06 Jan 2022 16:16:37 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 16:16:37 -0800
MIME-Version: 1.0
In-Reply-To: <1641501894-17563-1-git-send-email-quic_khsieh@quicinc.com>
References: <1641501894-17563-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 16:16:37 -0800
Message-ID: <CAE-0n51WQMSeChCyMKCHOGSqhGKf4=TamDinndrF8iVFrmrZ7A@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dp: populate connector of struct dp_panel
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-06 12:44:54)
> DP CTS test case 4.2.2.6 has valid edid with bad checksum on purpose
> and expect DP source return correct checksum. During drm edid read,
> correct edid checksum is calculated and stored at
> connector::real_edid_checksum.
>
> The problem is struct dp_panel::connector never be assigned, instead the
> connector is stored in struct msm_dp::connector. When we run compliance
> testing test case 4.2.2.6 dp_panel_handle_sink_request() won't have a valid
> edid set in struct dp_panel::edid so we'll try to use the connectors
> real_edid_checksum and hit a NULL pointer dereference error because the
> connector pointer is never assigned.
>
> Changes in V2:
> -- populate panel connector at msm_dp_modeset_init() instead of at dp_panel_read_sink_caps()
>
> Changes in V3:
> -- remove unhelpful kernel crash trace commit text
> -- remove renaming dp_display parameter to dp
>
> Changes in V4:
> -- add more details to commit text
>
> Fixes: 7948fe12d47 ("drm/msm/dp: return correct edid checksum after corrupted edid checksum read")
> Signee-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
