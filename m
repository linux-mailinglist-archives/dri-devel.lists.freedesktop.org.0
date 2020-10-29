Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B92429F0DA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 17:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC6C6E8C6;
	Thu, 29 Oct 2020 16:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CE26E8C6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 16:11:50 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id t15so855083ual.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 09:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MpdXRaHjhy22m2xPQ/mv08yTyf2gnU4AXsIatzMELM8=;
 b=YD5e3dH5w4KeVngaPn/rXDpipIyZ4twtKANlVvMnENs7daGWmLLAebfeBr4D+owVvo
 JmJN8bzwRSoSNY19EkWT7Gr+MLs6dMX+5hOfdBFihvOWtVjROHyoTNx8HfnP6UE20NBW
 CuPn2AeXXNaEUiMryrgndrtZ0UR4qAD5fHzek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MpdXRaHjhy22m2xPQ/mv08yTyf2gnU4AXsIatzMELM8=;
 b=ny/Q/MDqjmTpKu1+r+ue0eFKh5tBe9q22Z/a7MZ2xI7JfaTJEmY8ifOXG9pS7A+d8N
 A0/MBwiH1FCqQ+8onw1XNGPqN3ofzRc4VPK+csBicH13GhR0G1jXpu0mzaGBXHTZ7K5Q
 tWzi7zVWiZtxaxUk4S6dLyOndttyfbU7iwrlSZ65KcwE1YUAZpxtuP4X4l8Z8D1xZw12
 ojFm49txALLjL9V/E/Z2146dDF0uguWJLUIZa9Y85hqcd+myIw1VPZM06VlDIuSD6Co0
 WWiRnaYSj/LpKYBultcYh3eJI5LknrckHFpWMRkUVtgaOKPq/xEYTDjqQSvs4cDl3xkL
 MEmw==
X-Gm-Message-State: AOAM530d+qixSxRayaxcU6K8hjv37Qwxd2us5QSqm7OMr1PGXLwDSf19
 XPnFp3pG/OskASWjD2dQBMC66Nr/o87IaQ==
X-Google-Smtp-Source: ABdhPJyh7afIoT+nB8Jxz95BpC/q9Chep/wMTAEruIEW1tkIziBTBYcv5mvrJKAI+mtbms5Mz17leQ==
X-Received: by 2002:ab0:4e0e:: with SMTP id g14mr3405436uah.19.1603987909589; 
 Thu, 29 Oct 2020 09:11:49 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com.
 [209.85.221.176])
 by smtp.gmail.com with ESMTPSA id d12sm378353vkf.10.2020.10.29.09.11.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 09:11:48 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id m3so810495vki.12
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 09:11:48 -0700 (PDT)
X-Received: by 2002:a1f:2ed2:: with SMTP id u201mr3808913vku.7.1603987908290; 
 Thu, 29 Oct 2020 09:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201029011154.1515687-1-swboyd@chromium.org>
 <20201029011154.1515687-4-swboyd@chromium.org>
In-Reply-To: <20201029011154.1515687-4-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Oct 2020 09:11:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WScyFsu-QDWofXaAFd6-Qdvdb7WQMio2kQ9v6DvqKynA@mail.gmail.com>
Message-ID: <CAD=FV=WScyFsu-QDWofXaAFd6-Qdvdb7WQMio2kQ9v6DvqKynA@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
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

On Wed, Oct 28, 2020 at 6:12 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Use the DDC connection to read the EDID from the eDP panel instead of
> relying on the panel to tell us the modes.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Since we already did some early reviews off-list, it's not a surprise
that I have no comments.  ;-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
