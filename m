Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CF82A2FD3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 17:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A497F6E52C;
	Mon,  2 Nov 2020 16:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928406E52C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 16:30:49 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id y10so3065846vkl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 08:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sREWGA01ccOZZ+Ac51fB5ORg2kfgSZpXJMerDUOeHQU=;
 b=QYCxrHXxOIzJRxoAyAIb0dG0Gl0FXPKT7ruPaIvINw1xlkDTkX4uUBFDqf2YFMeZOI
 9mcgE/JXeOyT2MlShJ4MxRdtqhxjf6do0o6f7koqGRhIfzaXzKXlKHkx9WDf5pYYVP2i
 uEuI7tqTsgV9KOGrWFC00ME+3sIQYj9ymedsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sREWGA01ccOZZ+Ac51fB5ORg2kfgSZpXJMerDUOeHQU=;
 b=XLEk/5OIYWAj1ZLbtgydNIUsYcGPyLj+p83TSr6B3u6UnsC5JF4QQgltXFGv7FdtWs
 MPGgFt02LSM+bkWjASJaqyEsr8xhW3qpUP229ruuC8ARTQHG94kYRf4+ChPPFSesf9Dk
 OBivN4HXgE3ZjCwwMlHX6JAiG4kVWZ/pe3i5n2M2kr2ua52aP1rdHyKUDAS87+BFV5js
 qeil5Wt6xl3dc3Gpa0APHcE3m7EqIXdNjhrOrxSEG1X543eMnqKEr7rAPRBUxx8hhXK6
 0ozOAnhXm6Qp9qBb+DarU5z5DQlaCl2Vb117bnqtS0PP8+C7XDZoiyLWbuFMCcrcdZ8o
 hb0A==
X-Gm-Message-State: AOAM532pjfRU4JiV8Jtme3E9O2ncvaQ2EGB9nXNOqktGk1x5VAMwE+qd
 uVbYE8KUkiCIjTly6i1cpr615i3A5m4Y8Q==
X-Google-Smtp-Source: ABdhPJyOOLPHxfBRD34UXCNnXtr4y5z5WIYP2yO0SuG/QIHuG4gzx0WI76yUUlq0IljvTKlORoqOsA==
X-Received: by 2002:a1f:fe49:: with SMTP id l70mr13549618vki.10.1604334648387; 
 Mon, 02 Nov 2020 08:30:48 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com.
 [209.85.221.176])
 by smtp.gmail.com with ESMTPSA id t10sm1890928vkc.51.2020.11.02.08.30.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 08:30:47 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id p16so3059556vkf.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 08:30:47 -0800 (PST)
X-Received: by 2002:a1f:8a:: with SMTP id 132mr3074242vka.17.1604334646803;
 Mon, 02 Nov 2020 08:30:46 -0800 (PST)
MIME-Version: 1.0
References: <20201030011738.2028313-1-swboyd@chromium.org>
 <20201030011738.2028313-5-swboyd@chromium.org>
In-Reply-To: <20201030011738.2028313-5-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Nov 2020 08:30:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UgFBiRNY7mJtciPt21=G4Em564z6p9VhLF-n-3DcQtJg@mail.gmail.com>
Message-ID: <CAD=FV=UgFBiRNY7mJtciPt21=G4Em564z6p9VhLF-n-3DcQtJg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/bridge: ti-sn65dsi86: Update reply on aux
 failures
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 29, 2020 at 6:17 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> We should be setting the drm_dp_aux_msg::reply field if a NACK or a
> SHORT reply happens. Update the error bit handling logic in
> ti_sn_aux_transfer() to handle these cases and notify upper layers that
> such errors have happened. This helps the retry logic understand that a
> timeout has happened, or to shorten the read length if the panel isn't
> able to handle the longest read possible.
>
> Note: I don't have any hardware that exhibits these code paths so this
> is written based on reading the datasheet for this bridge and inspecting
> the code and how this is called.
>
> Changes in v2:
>  - Handle WRITE_STATUS_UPDATE properly
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 36 ++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 4 deletions(-)

This looks right to me, now.  Hopefully if/when someone ends up with
hardware that exercises these codepaths they'll at least be in a
better state and maybe they will all just work!  :-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
