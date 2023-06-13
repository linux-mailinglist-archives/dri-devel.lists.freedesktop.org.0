Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3433472EB23
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 20:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3B410E3DC;
	Tue, 13 Jun 2023 18:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B3010E3DC
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 18:41:27 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f62cf9755eso7270522e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686681685; x=1689273685;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=FdT67fKucfyqLof8pjePvycJSeZz/0hJjuTHyY9IUKM=;
 b=VAH9jlwMkv8XQJGyD4wIrvQtTomQuaRcXoVjeuqDuR/vdl0iQpUITtyOjSo8ia/q6I
 MMR8+c/X/f5SIx8C1CeVjam0rOeJViMBaeS4MlKAJVjrWn3jXEa9auMPu0MoBXFDK0RA
 AdNOdlr1WXnmWpY+0AT1JBKrk2/yDdcjIWRiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686681685; x=1689273685;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FdT67fKucfyqLof8pjePvycJSeZz/0hJjuTHyY9IUKM=;
 b=aZGdXWV3Pt+SprcEjBd6wfMA/FgqBU81S6bCD8I+7hJE3fea9AwOcVuBJ7Qn6bQhce
 kmZXCIrR04p1XiwzmdJuFcRkRqHY67CkT6DJ2/3h8+EBJEW6H8qYDW+cCylvvipDkv0R
 UagZtDBG/L2ZzPf0ogc+dZ0z60X5m1O87rPvVaVursWwVS9PeV6WXY2pUij3sIUaXP+X
 xH4UzQaNpNiEFkEq6ebZ85Q5d9nX/5Oybvk0bDXBTB3GYitOCr4jxwe8xRchFg4Eg4li
 2g8AS3Mxx2D6MXlId7310xUM9PRXP0zgTMvSJwM4QbJYDMRNHywVZoeaZ2DypRz78XtW
 M+wg==
X-Gm-Message-State: AC+VfDxr1bl6fD3B03cdXfcHlJ90Z8kd7F5m+NpLwxHHB4rGhILWu4K2
 lSSG2b5ThdVsOlNLmDIZDi2WhN7E6OaZzvCKD5ioMRHmwl/YeLNF
X-Google-Smtp-Source: ACHHUZ5twIRLMsNYAqsbiwGsP6jZQb3rUvX+RJR4V3HQjUTdHbwI5IDzQFtLAlmAacz9JWEA8JTRY/i22CNlVbJN2uM=
X-Received: by 2002:a2e:3801:0:b0:2b2:a6:6132 with SMTP id
 f1-20020a2e3801000000b002b200a66132mr5527545lja.25.1686681684721; 
 Tue, 13 Jun 2023 11:41:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Jun 2023 11:41:24 -0700
MIME-Version: 1.0
In-Reply-To: <20230613065812.v2.1.I24b838a5b4151fb32bccd6f36397998ea2df9fbb@changeid>
References: <20230613065812.v2.1.I24b838a5b4151fb32bccd6f36397998ea2df9fbb@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 13 Jun 2023 11:41:24 -0700
Message-ID: <CAE-0n51fbLvobz-R_3LWPZBRg7SNOxgFQ_DYqMo820W_4UOhDA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Fix auxiliary bus lifetime
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2023-06-13 06:58:13)
> Memory for the "struct device" for any given device isn't supposed to
> be released until the device's release() is called. This is important
> because someone might be holding a kobject reference to the "struct
> device" and might try to access one of its members even after any
> other cleanup/uninitialization has happened.
>
> Code analysis of ti-sn65dsi86 shows that this isn't quite right. When
> the code was written, it was believed that we could rely on the fact
> that the child devices would all be freed before the parent devices
> and thus we didn't need to worry about a release() function. While I
> still believe that the parent's "struct device" is guaranteed to
> outlive the child's "struct device" (because the child holds a kobject
> reference to the parent), the parent's "devm" allocated memory is a
> different story. That appears to be freed much earlier.
>
> Let's make this better for ti-sn65dsi86 by allocating each auxiliary
> with kzalloc and then free that memory in the release().
>
> Fixes: bf73537f411b ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to-eDP bridge into sub-drivers")
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
