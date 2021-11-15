Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA54451AF7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 00:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE0E899DE;
	Mon, 15 Nov 2021 23:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96057899DE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 23:44:26 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id w199so5092868oiw.4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 15:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=PaQ00ZGEy4Uu84RCOZUTfeFZWA/YaY1Ww6m8YLQkvhs=;
 b=W2VWXeSJ7wyysKLzDpvFz3g4Id+6kYVmETNy7ILgaFccZ0N8OZhsm0Q+E5PEBV9stG
 tTm2eidYTQXb9mwOs5kOYnf+CLNeGHi4OziOUAHeDMh+r66riOTbQ76CaCPh+btspJCX
 rt+DT5fyUGDvywAuuNIHdD6mIWWlFgscl1FyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=PaQ00ZGEy4Uu84RCOZUTfeFZWA/YaY1Ww6m8YLQkvhs=;
 b=E1av1yMOsSMhQYuGX4jaH25CsF2lNdo/+CN+I5JEDkQJ9Vd6roaLJ0DXXLVNMvmH4J
 Y4t7tlErrSX/3Qq7e2qqNJTd+uvul87uQNziNyf9Bb7LLnW2CwuTpWQHkFxsTEpufR2d
 rP589UOr0UsPhxx37MByqImtOZST1pnwUOqmMfTKCw70ywOJ9pyj8KkdCWH+P+7Iz0ih
 IWfgGeUHjCi/GSYeUdDct5ri4krZfnfO6fbNAza3V+R4hXrnTauGct2vV6rTeoMvHe5F
 hNtw2G3Ihuy1QdV2Y7wmlf+zK6sJxFzxsFFBwAqVJVv0jCnuTUGp4qykHPLNRviMjNr6
 nOPA==
X-Gm-Message-State: AOAM531eePXqa/hbqD+QLWk3aLSO49J14Mm2fmMEbf3z9TZG4UyNWoz1
 FJqDqvzABYfwRnpZiDmZJRBk3k0WvW0D8KHwGHlrvQ==
X-Google-Smtp-Source: ABdhPJxCjyQFH++dUTHe2DWuuQH++OcFJWe93JshD2AnAevt+Mu3F1DFIzPwztSodo1vFR26oriYaUigBSgSRnqGH88=
X-Received: by 2002:a54:4506:: with SMTP id l6mr49058489oil.32.1637019866000; 
 Mon, 15 Nov 2021 15:44:26 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Nov 2021 15:44:25 -0800
MIME-Version: 1.0
In-Reply-To: <20211112084302.2447931-1-yangcong5@huaqin.corp-partner.google.com>
References: <20211112084302.2447931-1-yangcong5@huaqin.corp-partner.google.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 15 Nov 2021 15:44:25 -0800
Message-ID: <CAE-0n53zMYmm2DxmptUWNzXvLQb+4bY1mDby1G78Jf1Hjdbadw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Fix additional suspend/resume
 at bootup
To: Laurent.pinchart@ideasonboard.com, a.hajda@samsung.com, airlied@linux.ie, 
 daniel@ffwll.ch, dianders@google.com, jernej.skrabec@gmail.com, 
 jonas@kwiboo.se, narmstrong@baylibre.com, philipchen@chromium.org, 
 robert.foss@linaro.org, yangcong <yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting yangcong (2021-11-12 00:43:02)
> Through log and waveform, we can see that there will be additional
> suspend/resume when booting. This timing does not meet the ps8640 spec.
> It seems that the delay of 500ms does not satisfied drm_panel_get_modes.
> I increased it to 900ms and it seems that this problem can be solved.
> To be safe, I'd just round up to a full 1000.
>
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
