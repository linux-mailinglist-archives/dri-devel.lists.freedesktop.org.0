Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0031EB66F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 09:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21186E39B;
	Tue,  2 Jun 2020 07:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9ECA89DD3
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 04:14:35 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id d1so8105781ila.8
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 21:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x8a609a5qZV/8uK75Z+5pZGlJvWxTwewnSI1kRcruvg=;
 b=EcXQ31HMxvgQLQA3X19WLJf7eLN+UICimuf8ahojOCfjxhipVAcPXK6rUNSLcFoWM7
 zCy9sXmj/KUmWr0BQpFzAMQhWpIMOQ6OvYkeLH+SRjwIhwVvpjQZsBv21/QRCGKjODHM
 qSHaOnht3ufj3s18UykNubcE3++uJC4wO0C9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x8a609a5qZV/8uK75Z+5pZGlJvWxTwewnSI1kRcruvg=;
 b=ar3LX7jCWJnOVG5DSrse/l3gWVKhVsVDtYJVmIofatQIg5Pr8Vju/T0p3CsZoDc3ij
 Ey6IZbwXUth2QVRSAjZPU3nPgwYVjBWKg8q4Z0B+0IFPZkQoupT6+LqypTdieaEm0/gD
 qM6MZrquzA5TQuNw7vJuR/JFuNPDHc4SxOfbVAgQxnPArBOan+Yo/pQjQ+5SHnPIX/1r
 8zxY13KmTwhwz3lDwNuJD9iANjMgzdjlRUsjFQTROhec2/dgKjwZFKz9BWSGyINBTx4W
 1AnX2iV61TT2hNBsUOAsh48ah0aoFRHeAlDLxGcV/lEz7wBz6Xtc6PZhC8gNPcLmFzSu
 Q2DQ==
X-Gm-Message-State: AOAM530PsNE1mXf0xdeAUv101/suAHFWyCvUpNJtCHd7EjU3eUFOn7LO
 GCS+ttn5y0PixiXVdBld5pfO2bSBWlNtMXjj+FGCIQ==
X-Google-Smtp-Source: ABdhPJwDkiEP8Fr2F3U+zwZn2Cnk0c+q57D8FlJ0+ONjXpxJhdRbpWqi0aGoLKsD8uIuEDU5EshV/8yDSE1Eqot3/Qs=
X-Received: by 2002:a92:d908:: with SMTP id s8mr18767942iln.283.1590984875133; 
 Sun, 31 May 2020 21:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589511894.git.xji@analogixsemi.com>
 <3946984ac1024b53b72c2eb39ee41967a2bf9c3d.1589511894.git.xji@analogixsemi.com>
In-Reply-To: <3946984ac1024b53b72c2eb39ee41967a2bf9c3d.1589511894.git.xji@analogixsemi.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 1 Jun 2020 12:14:09 +0800
Message-ID: <CAJMQK-hkrsgbvi91=uBhPfn0scwTSh3OJBGLcy9tC3GYiW1i9Q@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
To: Xin Ji <xji@analogixsemi.com>
X-Mailman-Approved-At: Tue, 02 Jun 2020 07:16:26 +0000
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 15, 2020 at 2:53 PM Xin Ji <xji@analogixsemi.com> wrote:

> +
> +static int anx7625_bridge_attach(struct drm_bridge *bridge)

Latest drm_bridge api:

int (*attach)(struct drm_bridge *bridge,
     enum drm_bridge_attach_flags flags);

https://elixir.bootlin.com/linux/v5.7-rc7/source/include/drm/drm_bridge.h#L70

> +{
> +       struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> +       int err;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
