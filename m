Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 499C46154CF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 23:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894E510E422;
	Tue,  1 Nov 2022 22:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02AEB10E42E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 22:13:32 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id y14so40667234ejd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Nov 2022 15:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fNisst7wQP7yVQDir2ZzGEUqhktVhSY0w4YILwST2lw=;
 b=drhCKYeq6+IIPFyskp1wUg6EYrGEeOB91Zy3MC2C4u8RrdX1ks3bcpXj1eUtPGQKSh
 1vIrU1v8PHf4Lo9stozzbEh4XpCJoVbD0wlTZvyV8osBXrnP7vbC1vLt7TdoT2Z44YHF
 t/0paYOJSaSbMxBbqHdqSOtEVw5904wz0PuASKBtIrLEcj521c32teNN37knvOR2BkSK
 3bArL9RWPWDXqw1BbrBwAItFOLS+8E3SvQCyclCrIjIaOkp/5/j3cS0B0ynaykdSh+YF
 snJngM+u/Ge2TE+nhpxKe50QqHx+kRSBpAdXXvm2Efl8FAZeJQTR7LooEQ2gESisTLVg
 h/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fNisst7wQP7yVQDir2ZzGEUqhktVhSY0w4YILwST2lw=;
 b=eTY7iKfDH1o0t2IaIMNOwU3rHtelIrvphH18JsHOdYFRv/bYSUdIDal6tnCUlHkeGo
 XCEHTSDLdFwEl0hksePQncmi0LsxZ3oncq/oYsw1u1P4WCzHh6YSA8+58Drkry3Dkep2
 JHN/wcBhuwAZU1gMQ1Gx4LLTYxMaUe0hWTCEyRWPVvmaiik3S+/+R8e1JMgzvac6a861
 4kN5K7oqicY9nbp9sLi4WKcRFNvj6TFFp4XKeAfhAk/XqlzxA50ZvV5r9lpkGyVk8Wg3
 DIUGGTpMPp3Mdmjwjtq51KeKEo5SAXrJ7OMUlSaH8RfbOqq33MdqKwsPXEcUYVUjCJ2O
 Tgww==
X-Gm-Message-State: ACrzQf0vLkJWiOnpjHInxnw5SeB+3/yp3gI34wdWShqxiVdIPcjltaPO
 6kdi+FR943+CoL95TZSN9QsAlEm1Y1wiVD+2ZgNmOg==
X-Google-Smtp-Source: AMsMyM5rWcEL/eHof+tQzFwZsTqjVhbW03U5wy6dleUSFsZ99NCepBUnEP7bUcKk0R5h94cyi2JIbXrhXW4WS93F9f0=
X-Received: by 2002:a17:906:9be5:b0:7ad:d0be:3467 with SMTP id
 de37-20020a1709069be500b007add0be3467mr13113432ejc.208.1667340811496; Tue, 01
 Nov 2022 15:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221014231106.468063-1-marex@denx.de>
In-Reply-To: <20221014231106.468063-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Nov 2022 23:13:20 +0100
Message-ID: <CACRpkdaqKUgaWy-cLzcoJoekkh9EE8SLuGuSdxVE4KjSSRF77Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/panel-sitronix-st7701: Remove panel on DSI
 attach failure
To: Marek Vasut <marex@denx.de>
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
Cc: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 15, 2022 at 1:11 AM Marek Vasut <marex@denx.de> wrote:

> In case mipi_dsi_attach() fails, call drm_panel_remove() to avoid memory leak.
>
> Fixes: 849b2e3ff9698 ("drm/panel: Add Sitronix ST7701 panel driver")
> Signed-off-by: Marek Vasut <marex@denx.de>

Patch applied, fixed up some complaints from checkpatch.

Yours,
Linus Walleij
