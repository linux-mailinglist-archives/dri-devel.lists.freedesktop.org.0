Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F863B0663
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 16:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057C96E139;
	Tue, 22 Jun 2021 14:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65C36E139
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 14:00:53 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id he7so34668616ejc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 07:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h+bWnGyQ/wq94vghvPlLpsqRqqdBMS9P1PzgGdoEPaE=;
 b=BWywDAtbulevp+SPkll8OQPTT2RRVf3IJYmPldWPaeaymjPCezgipHNuEowK2Zh2vI
 YlFU3r1zIv4P4+PfqHAkVYGH0Ev5GBTgiecnkPzJnBkbZG/2kSwJw4E5e+/JSGWRPm4J
 tgn/qhxB/g44rwgWOJd+0aZ5hb2ucV8ut6whU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h+bWnGyQ/wq94vghvPlLpsqRqqdBMS9P1PzgGdoEPaE=;
 b=nL9mabLARvbJ3UwTUGrZJ2RWOj06bNDc7E/Q8BV0zLFV7u43oQJR9gBhxiHpO47cSM
 FM5YCJUTbveQB8cBFbkzJfXdIsAZNzN3T6lAmKNEJAVDDLsP/k2+BehQV582mBnm0yLD
 xA6UwfOTDM7KuR/Cx6wKCVF+LIVEuOik6XMHwwiZg1KVE8xE/bQMaEgtt+YkBSWiRA9q
 Jile7tjmIJ5AQ6Tne49HbxdhFwYuaowoRSxcNeGZRzvMc5ILrXrVtfygwHG9afQhIonI
 gTdXBJRVeNYMShJYyLhQJ2HITGLvLbpdSk/HeJeDk3MrZfM8N3uA6gFif/k4S17wpRLM
 YkBg==
X-Gm-Message-State: AOAM530JljNWof+JScukaRoOr22BTYB+48VkPE2+G/CfP3uF80Wri+mS
 OUBYglN2cYkBe8BxJt3Fh2VaDKiJuScnKISASV/ZmQ==
X-Google-Smtp-Source: ABdhPJwr8JK6MllaZZs8iC2GAt70uX8PAsy4nhmwI32j23cmu+JxKS4FcYxPw4p+qdtGKGugelY8Owc/A41xgn2XDrg=
X-Received: by 2002:a17:906:498b:: with SMTP id
 p11mr4235335eju.295.1624370452583; 
 Tue, 22 Jun 2021 07:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210620224701.189289-1-marex@denx.de>
In-Reply-To: <20210620224701.189289-1-marex@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 22 Jun 2021 19:30:41 +0530
Message-ID: <CAMty3ZAP-9X1d=8dFbAjU3ZYapr2zJD1iaTgQzxLSmnAK1gtRw@mail.gmail.com>
Subject: Re: [PATCH] drm: mxsfb: Enable recovery on underflow
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
Cc: Daniel Abrecht <public@danielabrecht.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, Claudius Heine <ch@denx.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 4:17 AM Marek Vasut <marex@denx.de> wrote:
>
> There is some sort of corner case behavior of the controller,
> which could rarely be triggered at least on i.MX6SX connected
> to 800x480 DPI panel and i.MX8MM connected to DPI->DSI->LVDS
> bridged 1920x1080 panel (and likely on other setups too), where
> the image on the panel shifts to the right and wraps around.
> This happens either when the controller is enabled on boot or
> even later during run time. The condition does not correct
> itself automatically, i.e. the display image remains shifted.
>
> It seems this problem is known and is due to sporadic underflows
> of the LCDIF FIFO. While the LCDIF IP does have underflow/overflow
> IRQs, neither of the IRQs trigger and neither IRQ status bit is
> asserted when this condition occurs.
>
> All known revisions of the LCDIF IP have CTRL1 RECOVER_ON_UNDERFLOW
> bit, which is described in the reference manual since i.MX23 as
> "
>   Set this bit to enable the LCDIF block to recover in the next
>   field/frame if there was an underflow in the current field/frame.
> "
> Enable this bit to mitigate the sporadic underflows.
>
> Fixes: 45d59d704080 ("drm: Add new driver for MXSFB controller")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Daniel Abrecht <public@danielabrecht.ch>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Stefan Agner <stefan@agner.ch>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
