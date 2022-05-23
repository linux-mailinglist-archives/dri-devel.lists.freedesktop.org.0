Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AFC531E44
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 23:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95C01121A3;
	Mon, 23 May 2022 21:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B517D1121A3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 21:58:31 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id v66so19426035oib.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 14:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q8SrzKwXbwxEUVDgvvMve7Yi3txpWp8p+iQJgO5oLAk=;
 b=iohk/agXfsij0LTxGdU0vY6kpIgx4QqFuvhQEnzmWnnDNBRfp7M+LaYZhlEqiOM+PD
 5Ofsc/QN1DC5SCtQ8cTlukZabTVMItX/J9cVbGmwqSVtQVsxHaKZnORw2esG2MBxarHq
 LHaKztBDVV9SBBmVYUc7/xgb0bTh0We+ra5CE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q8SrzKwXbwxEUVDgvvMve7Yi3txpWp8p+iQJgO5oLAk=;
 b=QCNSTmNbnVfCXih4jtCeixreGQHkEPTo7EZR+WCpSEpUMrM2EN8QuHvdd4jGxzaS0j
 hy7q0OR+h5x7QLIz1xHyY0FuT8uINuXnL9ozjCn8Nhy35eqECEYswf5UXg8tm89fgdvF
 YBtoX7ULdRdhwM6ycGU2OhiEVul9owgoz5MkiAvPjuJXWDV5iyYb1xyAOP13ekX3Ddek
 hD4dux0e9HejMWIDnEwdEIKCLKHS05kGyV49LGPDxCbXX0sf93KwCZUZEjeEHHjj+taT
 yH18C0wOw+7gLAmzC0cmfEJ+bsTduc/sx873uGM1IMVuDRadt+rQUn8SxKfhigyJL7Sf
 Zh0w==
X-Gm-Message-State: AOAM530bSxIQpkJ1R84JAQuraPKoFupIQVzOt/+Eevi2ZOE1x7jzquAo
 PNgQWIIK6JIafadGrUAPlmBAuV2xXXue3A==
X-Google-Smtp-Source: ABdhPJxMfxhR2rAFfE1G6S5/TKFsyWBPaZDpQLJMCJTa5rHP7DrwklaC7oT3bu6giwdD+QrQmDhb1w==
X-Received: by 2002:a05:6808:1487:b0:32a:eee3:68c1 with SMTP id
 e7-20020a056808148700b0032aeee368c1mr698986oiw.64.1653343110768; 
 Mon, 23 May 2022 14:58:30 -0700 (PDT)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com.
 [209.85.167.174]) by smtp.gmail.com with ESMTPSA id
 p132-20020aca428a000000b00325cda1ff8esm4485401oia.13.2022.05.23.14.58.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 14:58:30 -0700 (PDT)
Received: by mail-oi1-f174.google.com with SMTP id r68so5220962oie.12
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 14:58:30 -0700 (PDT)
X-Received: by 2002:aca:5e84:0:b0:2ec:9c1d:fc77 with SMTP id
 s126-20020aca5e84000000b002ec9c1dfc77mr600365oib.291.1653342713974; Mon, 23
 May 2022 14:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220228202532.869740-1-briannorris@chromium.org>
 <CA+ASDXNSThy7usMKkN22VBq2iyej7sCJ8CAmgnNvxDgZiMbukA@mail.gmail.com>
In-Reply-To: <CA+ASDXNSThy7usMKkN22VBq2iyej7sCJ8CAmgnNvxDgZiMbukA@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 23 May 2022 14:51:42 -0700
X-Gmail-Original-Message-ID: <CA+ASDXMW14GqJUAogQ0=dVdamhTTGDzcMRv-8Cx-TaXShHxj+A@mail.gmail.com>
Message-ID: <CA+ASDXMW14GqJUAogQ0=dVdamhTTGDzcMRv-8Cx-TaXShHxj+A@mail.gmail.com>
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

On Thu, Mar 10, 2022 at 3:50 PM Brian Norris <briannorris@chromium.org> wrote:
> On Mon, Feb 28, 2022 at 12:25 PM Brian Norris <briannorris@chromium.org> wrote:

> Ping for review? Sean, perhaps? (You already reviewed this on the
> Chromium tracker.)

Ping
