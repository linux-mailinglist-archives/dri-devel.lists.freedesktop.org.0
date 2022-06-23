Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD9F558BD7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 01:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AAC10E71D;
	Thu, 23 Jun 2022 23:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685DE10E51F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 23:45:08 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id o9so1098379edt.12
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 16:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ikmHtD58shD6bwBLVpbuZjlxH1kCE1s2bn5lg6TI84=;
 b=Idb+m4MmDg0qMd2DH6fEfYzuuttvLSeFBYJHLxEIpsJQi14s4A53HQuCSN5EPUcDlu
 cHZr8bJG8h/PTgfMQpO0HbbedR/xKjdcHTojqasgMK1W7NG1vLAyJp2ONOWhpxRkyeua
 SwHT1Aus7rtxzv/TDgM3Hsx5fXimanh7yIQWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ikmHtD58shD6bwBLVpbuZjlxH1kCE1s2bn5lg6TI84=;
 b=OUFzb6LusjWB9aPrKasUg0ipNIRNMTdcnb9tPmIysGkn9OudUsHl4/3rvNFXAOqk7A
 dm9rCMVpCL7wpCxnaQH+r1jypKcE+ZNggQ4UodgkwQMtCr38D+M66zrncGw1te0SC19M
 WgeeYelGklGd1MEmtBVXdvgnU5DUzlOUhk4QD/9Ba6iTQv8Zk0l3IwagpqDqezKWnQ1G
 6sXBiEthdfWA1JJME7ijIEi4IKFr//0KoE2DaL0tcy0tWqq5zltHaTN6TdrTXqKn5mKO
 CPNuLalfzl1zBmsMY7Ysu8YKgoguIpQQ5HEHfCwkdGpbeIQAmA3sU6nAXl+t6hoWziPk
 Xouw==
X-Gm-Message-State: AJIora/v37iaEmi041uA6WRnm1xeqVbc60c4/X21grcHgf006GfmzDH6
 Z91CJtj8w96TnL9fis2X/3/F6rKH0GGtCrai
X-Google-Smtp-Source: AGRyM1uWp5X2mjJvgzzdAcDuK193onVHNo65HlAafGgyyerDzMW9mbtYyMLzy92g1XyngMvWLFqh4A==
X-Received: by 2002:aa7:cd8a:0:b0:435:dde0:c91 with SMTP id
 x10-20020aa7cd8a000000b00435dde00c91mr3613945edv.220.1656027906744; 
 Thu, 23 Jun 2022 16:45:06 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 s27-20020a170906355b00b00702d8b37a03sm234954eja.17.2022.06.23.16.45.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 16:45:06 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so563451wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 16:45:05 -0700 (PDT)
X-Received: by 2002:a05:600c:22d9:b0:39c:4b1b:5f99 with SMTP id
 25-20020a05600c22d900b0039c4b1b5f99mr469227wmg.151.1656027905540; Thu, 23 Jun
 2022 16:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220617172623.1.I62db228170b1559ada60b8d3e1637e1688424926@changeid>
In-Reply-To: <20220617172623.1.I62db228170b1559ada60b8d3e1637e1688424926@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 Jun 2022 16:44:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wsp6GA=L4GsEVjMqazgtw4qG40gtLq1HT++5e9eRrvTw@mail.gmail.com>
Message-ID: <CAD=FV=Wsp6GA=L4GsEVjMqazgtw4qG40gtLq1HT++5e9eRrvTw@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: vop: Don't crash for invalid
 duplicate_state()
To: Brian Norris <briannorris@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sandy Huang <hjc@rock-chips.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jun 17, 2022 at 5:27 PM Brian Norris <briannorris@chromium.org> wrote:
>
> It's possible for users to try to duplicate the CRTC state even when the
> state doesn't exist. drm_atomic_helper_crtc_duplicate_state() (and other
> users of __drm_atomic_helper_crtc_duplicate_state()) already guard this
> with a WARN_ON() instead of crashing, so let's do that here too.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 3 +++
>  1 file changed, 3 insertions(+)

I'm not an expert in this area, but it makes sense to me to match
drm_atomic_helper_crtc_duplicate_state() in this way. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I would tend to assume that this would be landed in drm-misc by Heiko
if he's good with it. After several weeks of silence, however, I'll
commit it myself.

-Doug
