Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E7880292E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 00:48:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F0B10E16F;
	Sun,  3 Dec 2023 23:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D7910E16F
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 23:48:18 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-db549f869a3so2250178276.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 15:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701647298; x=1702252098; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vWqoLalNR8SshokhkQOf7/YDcCmn4G31mg9KQGgCRpA=;
 b=Xep4xzhQtkY8GC42C3VHzZWO4R0rbqCGbnKTC57w+dX/FVRmios1VDEPH6Wv4abDLd
 URPeHZMc4lF/PqBvm9kRrbHO5g9Eu03Vmu3rOl2vh9pVzGZoMsur3VFTlzX7wh1cdZuq
 GRVXoVar1qb/agCjQKmfvqL0alRoTXl2MKg4eSO5gYDD/0X463kLyWadeXTyu7dElFYC
 XvlnK2RSXkIQNxpgiN+sb26D33D21Tx5gBjFgKOHw5jOuOv4yoreBlOIZzhLZroUepWg
 S0NWpS98wmG4qbKoqm6eVrQBB7l06MQNY3FM5t4F7A4oQWKAWTe7Ix8hOUeFck59Fxlg
 3AdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701647298; x=1702252098;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vWqoLalNR8SshokhkQOf7/YDcCmn4G31mg9KQGgCRpA=;
 b=cDWJ5CdLn2PKKT2znm/gsgKZ49RN//fqwzvnIZmgL04PryAoHoT2vuT0ZzP8RQF5ej
 wqUDwUapdOLoNSsDvdgaeQF7ezenga9umNYkHBZPdWvN0Uw1fHJMI7mTnIsZNk0M5xCn
 YjWxo9BKI0qoZkBK5iK5p4VfAnjDHDzviiezvPEN4xk2Frkem8TbLNgLSBISNZm+rawA
 fSjIfc65dIjbwK2VJz7tlWrAYAgESc6LHXFpHMEa6949OQdlZN7CL1NsL9q0BAD2ge6t
 EpEG3A3E7A7r8f0tGcjNEOcGlNfWs8A84ZPmnmNouHSiupn1QZYggVdzzgwFx3jIWOYV
 iXvg==
X-Gm-Message-State: AOJu0YxOS0oVReVlgWDXSaZwvQTV8KaoZUU/fx7oZP1MbOmR6GWs4f/F
 WADt5iw7RM83dbu8ylddDsGJZ/XnWasK0ObBSgGFkA==
X-Google-Smtp-Source: AGHT+IGHplLFwjAr05PmC5DkiZjE2D9xRFircODZ6D9h2X05ViVg/npg+QkPUdC93HzupX7slUGi+rdZudZvMu7sLgY=
X-Received: by 2002:a81:b65f:0:b0:5d3:d439:aabe with SMTP id
 h31-20020a81b65f000000b005d3d439aabemr2265318ywk.26.1701647297842; Sun, 03
 Dec 2023 15:48:17 -0800 (PST)
MIME-Version: 1.0
References: <20231202075514.44474-1-tony@atomide.com>
 <20231202075514.44474-9-tony@atomide.com>
In-Reply-To: <20231202075514.44474-9-tony@atomide.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 01:48:06 +0200
Message-ID: <CAA8EJpqzz++bdJ7XHmfHWJ1RhXN=vXwwDPmt=SZAR5LxOCkjEg@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] drm/bridge: tc358775: Enable
 pre_enable_prev_first flag
To: Tony Lindgren <tony@atomide.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Simha BN <simhavcs@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Merlijn Wajer <merlijn@wizzup.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Carl Philipp Klemm <philipp@uvos.xyz>,
 Neil Armstrong <neil.armstrong@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 Sebastian Reichel <sre@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2 Dec 2023 at 10:03, Tony Lindgren <tony@atomide.com> wrote:
>
> Set pre_enable_prev_first to ensure the previous bridge is enabled
> first.
>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
