Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4783F7B50
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 19:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DB789956;
	Wed, 25 Aug 2021 17:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17E289956
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 17:14:00 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so46029856otc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 10:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=F18YLP2mtr+5HyJ/pmcAHG9a7g1G49mcq+SFUPInr7Q=;
 b=GfAwrm1lDeGg47ZdOF90kEgL7lc1T1Xrt4BgosVgjjBvk/VdcSbyJKyI5oaJIWxjzH
 SG89ZXuStu2PYhQXYa0A9TZ7H+NV0zToeFDKtTUHR0V0yonmsYfnyYX593ISM3fC3fL6
 KVVZOaaq8fTrLL66oNflyXRAyrOr4hDKzidhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=F18YLP2mtr+5HyJ/pmcAHG9a7g1G49mcq+SFUPInr7Q=;
 b=d6S5NvlW8hgeogckDBY92wggcOnfhpiXSmFqClYVEZBdI0nFbpTdlM5kRGtW1lPxtI
 cOrRZjmKQHiHd0+Lx9/eDt1Du5tbVfPEo0maB7UzgUJhnN6jD1EbPxAnt5sotHymicDI
 qEyhPNsvavofmMyix7ACdNXWEZqZebGfBRMyyzWNrASfZOV/gTjVJi3Sz6NAb72Ct6VD
 ECnvZIYlujT4iTxs/yDE3a+BXFVuegYiIA3QeP9gpHIUyWeR+wTpTylC5nJ5ngzYxpuX
 bPbmgccBMm2d05TA5ZV4IWHGY0VaLNtTR4T0NsOhRRl2owpmwRrXToIvc1c17AUEvnMu
 0+pA==
X-Gm-Message-State: AOAM531weqrzageIFWpmBcsROIkLs+aVDU/53sTn45WaB9xYgcTjEpr5
 q5pGUvJxze6OV0W4yGRK3/g0DqmPmcrW6QJu+vgAUw==
X-Google-Smtp-Source: ABdhPJyKV38cjFSmdW5cvFWhgMhKBwixXeiMVBDXQOWKiGrBfDaTkcrAnUwkuBu1F2nr5lC3n/mVQw1jxQJE67fJ8Xg=
X-Received: by 2002:a05:6830:2b24:: with SMTP id
 l36mr21330863otv.25.1629911640034; 
 Wed, 25 Aug 2021 10:14:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Aug 2021 17:13:59 +0000
MIME-Version: 1.0
In-Reply-To: <20210824181140.v2.1.I8ead7431357409f2526e5739ec5bc3ddfd242243@changeid>
References: <20210824181140.v2.1.I8ead7431357409f2526e5739ec5bc3ddfd242243@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 25 Aug 2021 17:13:59 +0000
Message-ID: <CAE-0n50Yd3J_g=tuSHZvxqVCRH8Cj_-VKy1cx5N=LNXwbh8wng@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: parade-ps8640: Reorg the macros
To: LKML <linux-kernel@vger.kernel.org>, Philip Chen <philipchen@chromium.org>
Cc: dianders@chromium.org, Andrzej Hajda <a.hajda@samsung.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Philip Chen (2021-08-24 18:11:55)
> Reorg the macros as follows:
> (1) Group the registers on the same page together.
> (2) Group the register and its bit operation together while indenting
> the macros of the bit operation with one space.
>
> Also fix a misnomer for the number of mipi data lanes.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
