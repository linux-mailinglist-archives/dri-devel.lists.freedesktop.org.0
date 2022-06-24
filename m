Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7961F559FC6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 19:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81DE10E1A8;
	Fri, 24 Jun 2022 17:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D94110E1A8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 17:58:08 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id p8so4494073oip.8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 10:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gqe2BcnXvHPlqIWzjEeLMU7FqAv/n1XXHRJeEUKzlKg=;
 b=Kwt9moQUmYxkfufWsGqYBe5lp3LxFQbCnc0bamVdgN/b93sQhP6MEbkSTB7dkyROlE
 EyqGapHYCUabHsQjh7Hx6PJftkV7ojjZ4a5esOjA/2X0G5Xr6i0M/y2yRW98HfqLoNgG
 Tx/vQZXQDex2uzamvTdL9PY543Zsz0xr9Ggx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gqe2BcnXvHPlqIWzjEeLMU7FqAv/n1XXHRJeEUKzlKg=;
 b=vWh/4dd+bii1zXKAyHXkW0aIZeNPT7II7XStfq30JknegMLtP/2SkrtqaoQ0TXYZq7
 qpYNoPeaaAGdFT8apEW87uJ1xgMRRg3sfSv8mKewrhui6wmsBACutOW6XPqkXuinq6r+
 J+fz2UNZkZ9s0wrhyNVz4IdfE91bpGaoXzmBeHhUXWBdmRTMN+h/VCRdVDQc3fVSx5HJ
 FoGe2BI0I6PpbUKq1m58mHNUvPkvRQJ0JXqttcX9hdga4YanSbw4QixyYPYSCI+blfUp
 ImmryxtIjLVy2QsE0JaGfm1tJjZGo2MLK11HnZ12iaIW32FcpHwSo8y/9l8CsbO+FQU+
 i0/g==
X-Gm-Message-State: AJIora8YzlMw/nxbmP8UrFuIHmi4x5fHxrQwOn0l14xmC5qBILvFg572
 v6+uWeN/Niw67YSdGHIPG2KWexb0+ihwwQ==
X-Google-Smtp-Source: AGRyM1tBQ18u2/pSxN5B6J86xOFTJaPVm3d+DNhkXFRwqz2ZOIMff6C4/yF9p+9aSxYXTM3l/5PBag==
X-Received: by 2002:a05:6808:11c3:b0:32e:b9ef:4cc9 with SMTP id
 p3-20020a05680811c300b0032eb9ef4cc9mr164697oiv.125.1656093487191; 
 Fri, 24 Jun 2022 10:58:07 -0700 (PDT)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com.
 [209.85.160.43]) by smtp.gmail.com with ESMTPSA id
 s11-20020a4aeacb000000b0035eb4e5a6b1sm1757411ooh.7.2022.06.24.10.58.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 10:58:05 -0700 (PDT)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-101cdfddfacso4755743fac.7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 10:58:05 -0700 (PDT)
X-Received: by 2002:a05:6870:f71d:b0:f2:a4c5:191a with SMTP id
 ej29-20020a056870f71d00b000f2a4c5191amr2897379oab.257.1656093484616; Fri, 24
 Jun 2022 10:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220617172623.1.I62db228170b1559ada60b8d3e1637e1688424926@changeid>
 <CAD=FV=Wsp6GA=L4GsEVjMqazgtw4qG40gtLq1HT++5e9eRrvTw@mail.gmail.com>
 <4196825.8hzESeGDPO@phil>
In-Reply-To: <4196825.8hzESeGDPO@phil>
From: Brian Norris <briannorris@chromium.org>
Date: Fri, 24 Jun 2022 10:57:53 -0700
X-Gmail-Original-Message-ID: <CA+ASDXOzhoooDDJUWV7rKpz-7GkMR5v=3gKQt4XazTSgnY51WQ@mail.gmail.com>
Message-ID: <CA+ASDXOzhoooDDJUWV7rKpz-7GkMR5v=3gKQt4XazTSgnY51WQ@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: vop: Don't crash for invalid
 duplicate_state()
To: Heiko Stuebner <heiko@sntech.de>
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
Cc: David Airlie <airlied@linux.ie>, Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sandy Huang <hjc@rock-chips.com>, Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 24, 2022 at 12:23 AM Heiko Stuebner <heiko@sntech.de> wrote:
> The interesting question would be, do we want some fixes tag for it?

I'm not aware of any currently-upstream code that will hit this [1].
I've hit it in out-of-tree code (or, code that I submitted to
dri-devel, but wasn't accepted as-is), and this is the "belt and
braces" part -- the primary fix is that we should avoid calling things
like drm_atomic_get_crtc_state() at inappropriate times.

So, is the "extra safety" check really something that should go to
-stable? (Because let's be honest, everything with a Fixes tag goes
there.) Maybe?

Anyway, if you want to "blame" anything, this commit actually dropped
the safety check:

4e257d9eee23 drm/rockchip: get rid of rockchip_drm_crtc_mode_config

Brian

[1] But I'm not omniscient. So maybe it's good to have anyway.
