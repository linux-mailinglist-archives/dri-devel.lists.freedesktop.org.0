Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E67E343DDC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 11:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32F989E33;
	Mon, 22 Mar 2021 10:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436E689E33
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 10:29:56 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id kt15so10846270ejb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 03:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S6xuF+xvy/1OeP+r1oWkPTjodWuYCgRma3tgYNyZ6UA=;
 b=F6jWpydB6AlIY1GvLRpNSU3YTfPY7nS9CheJIsq5dvQAJCLxfACC7/Ms8eXjeAcgsY
 molw3Iiy9kjbYktZ+zJRolAmplpPDkB1SC7VZ59Z7ZoPNCsRmII9eZ20a5Q2CYJqx30c
 b6LQpv5mGUMJoEdhLJSs+4puxa3SszSx019dQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S6xuF+xvy/1OeP+r1oWkPTjodWuYCgRma3tgYNyZ6UA=;
 b=lK2VULOoNJWVGI3hGzSx+YP+DkQ0Vd3WJWDtiuUBiR0Vox4lwPGRzbBE6XyGJNMKdW
 aLcNILHBUXQ8oXfUMGhGm0Zign67eU1DIssZ4tmlcf1SlSHMXpAikStXT11/Lc02/fYb
 jBh+MrfH3YUdTersoyFajH8DnrTKDNf2RwaxbD3XESWvZ3rH/vBxW4Xp+BJoVdXyY0Uq
 psTsZ9nXaBTzfSDKoUIIGtrQYNu/mAaacvsfWvhr5T6l7uhXHhVZof6uJuwy6YcZewQv
 n2/QwqjeY70NljPAmNddhz46oHeGv/xfDQNp21cGgFKUDD5uy0RFUxTXf+TW5TuS55DG
 KXVQ==
X-Gm-Message-State: AOAM5305wdvoB1jtn1Zpwf+/CJOmOT0r4235vYm0J7SwUghxcozkMw+H
 Q2xlbnVT4SHP/uiEauH1/WsRP+fGeAJbfx77mMQudA==
X-Google-Smtp-Source: ABdhPJzFITwipwiUuIsCPLxRHKPpBq8+cjpPujK+kqZNNG835CwFf8f9D30pqauBb17ZvcfpdMlv84HvQasbHmIv8pM=
X-Received: by 2002:a17:907:37a:: with SMTP id
 rs26mr18461737ejb.336.1616408994986; 
 Mon, 22 Mar 2021 03:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-2-laurent.pinchart+renesas@ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 22 Mar 2021 15:59:43 +0530
Message-ID: <CAMty3ZCm42aQh+c2bdmj==Uc0KuEvTTBb_+8efvp8G+Oyem9Bw@mail.gmail.com>
Subject: Re: [RFC PATCH 01/11] dt-bindings: drm/bridge: ti-sn65dsi8: Make
 enable GPIO optional
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 8:32 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The SN65DSI86 EN pin can be hardwired to a high level, or connected to a
> global reset signal, not controllable by the kernel. Make it optional in
> those cases.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
