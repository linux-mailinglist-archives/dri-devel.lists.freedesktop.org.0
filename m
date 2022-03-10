Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A195A4D55D0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 00:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370E510E1E8;
	Thu, 10 Mar 2022 23:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0722210E1E8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 23:50:14 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 6-20020a4a0906000000b0031d7eb98d31so8712528ooa.10
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 15:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qSs+OWs1rd3swR36O2vNgKkkBCsIMZuIXdZ0u3m8Xik=;
 b=ms4RRU4ZyttsdToiIH3Sv1ehttlkGOuaHMYlv/yrwCG7GfF7G7ADyQ3pLWcdiSPTLg
 /4ZHSGavGVyd5cosnBfTPmshSYtXWjyiVV/xQKK2e9sj3fJDlRx4IJ1FsJWQA/Kyuq76
 pddpVo6STWfBplBRrZyUbSlTYnT84S1d69lbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qSs+OWs1rd3swR36O2vNgKkkBCsIMZuIXdZ0u3m8Xik=;
 b=PTOthk3PvYYq/077kfffVLUyrW8OLA1Nk1TAHduWaN2uwbMWVxkNuFzUOy5ofQPlO3
 1phkp8P30eC602ursniPC7gchBB658KhimdaU3W9bv2NnlWIgyRsdfXNJgR0OGpiL7ih
 r3V4EBIrpG8R1kb2x5yi02mpqCb5V0g51QyduYAJh3EBHlkBeQgbKUQjS9Jmw6CRD5XS
 YRZjg7HX0r4a9fHFXF9mQkcZnHJPD/XnpAzScXNF3voSoHU4rfNvyX3acFKRw2KkWdwN
 rbq69qOnciLw4ekcGnmgfiz2MyUTJaltPpj2FL0g6W8RSIqBsu2RQxrkugZo/WVZ54M0
 SZlg==
X-Gm-Message-State: AOAM531nQFCG1Xk/pDa7z6we+bG2pbOmNoPtxmWj+hqma9xeF403GTHa
 Vi9PrpiSQuOpYzB6F+z5jXCxynCI8vbl+g==
X-Google-Smtp-Source: ABdhPJxZKwprkNDTy3755jnwhK/doR7WK1hKWi3JlPPWjqbz5WI4ABfiXLzXGec35kzmUz2o7EaxGQ==
X-Received: by 2002:a05:6870:524f:b0:da:b3f:2b5e with SMTP id
 o15-20020a056870524f00b000da0b3f2b5emr9765973oai.253.1646956212833; 
 Thu, 10 Mar 2022 15:50:12 -0800 (PST)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com.
 [209.85.161.41]) by smtp.gmail.com with ESMTPSA id
 f17-20020a05680814d100b002da74126fc4sm1009644oiw.30.2022.03.10.15.50.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 15:50:11 -0800 (PST)
Received: by mail-oo1-f41.google.com with SMTP id
 6-20020a4a0906000000b0031d7eb98d31so8712432ooa.10
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 15:50:11 -0800 (PST)
X-Received: by 2002:a05:6870:b52c:b0:da:b3f:3273 with SMTP id
 v44-20020a056870b52c00b000da0b3f3273mr4139015oap.291.1646956211126; Thu, 10
 Mar 2022 15:50:11 -0800 (PST)
MIME-Version: 1.0
References: <20220228202532.869740-1-briannorris@chromium.org>
In-Reply-To: <20220228202532.869740-1-briannorris@chromium.org>
From: Brian Norris <briannorris@chromium.org>
Date: Thu, 10 Mar 2022 15:50:00 -0800
X-Gmail-Original-Message-ID: <CA+ASDXNSThy7usMKkN22VBq2iyej7sCJ8CAmgnNvxDgZiMbukA@mail.gmail.com>
Message-ID: <CA+ASDXNSThy7usMKkN22VBq2iyej7sCJ8CAmgnNvxDgZiMbukA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/bridge: analogix_dp: Self-refresh state
 machine fixes
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>
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
Cc: Doug Anderson <dianders@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Liu Ying <victor.liu@oss.nxp.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 12:25 PM Brian Norris <briannorris@chromium.org> wrote:
>
> Hi,
>
> I've been investigating several eDP issues on a Rockchip RK3399 system
> and have two proposed bugfixes. RK3399 has two CRTCs, either of which
> can be used for eDP output. For both fixes, we have bugs due to the
> relationship between the generalized "self refresh helpers" and the
> analogix-dp bridge driver which controls much of the PSR mechanics.
> These bugs are most visible when switching between CRTCs.
>
> I'm not a DRM expert, but I've been poking at a lot of Rockchip display
> drivers recently. I'd love some skeptical eyes, so feel free to ask
> questions if I haven't explained issues well, or the proposals look
> fishy.
>
> Regards,
> Brian

Ping for review? Sean, perhaps? (You already reviewed this on the
Chromium tracker.)

Brian
