Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCFC4F11EB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 11:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D5210E609;
	Mon,  4 Apr 2022 09:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FB210E609
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 09:26:58 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id c11so7838050pgu.11
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 02:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LQIPC102LBY8jsfQ5+qALRGAiWnT6kIWTeL9/Fu7QJM=;
 b=DGlTsrmu7goQJGUavSpKmdPrHp4B3llVMMT9zPOcTCKW48MU5eANIbfNI6xaq+bBI1
 ZSA9YgagXDwZ3x/XpDDJOhM1Sv1c2U3f7Wml/5OB1BISYzYoQJaz8eVID13M4hORLISy
 M7xV6Q1ofulxLqcdzyY5FcVIW/Qf0jGRxRhnCzCzVJmA1wwd386MDsf1JsAVfZ+5Ucvs
 mgRPt4lGK4NH0/1JeDUEggRZ7v8Bm3pTMQuIEB9MXPGVPQ+SabeecNq6/OlQJisxJwPs
 cQeW8kKo2xzKRubHX4lO6ZU8GYY0QNamW1KyyLJndgs9s4ENkybMhM6RfW3GOqYDmso0
 YFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LQIPC102LBY8jsfQ5+qALRGAiWnT6kIWTeL9/Fu7QJM=;
 b=YYcF99j3BfG+7prF21dXxpIWL4HHt+c10KBH01itwEE6n7C9c5owycYNEF3/PE0nea
 X/U0P4YmhdkAgoBS0kMYjSma2ts0KMkV4IOs+QEGqNz6HZDUlqtwkX/06gCyCkHaJTwH
 vw9AzuQn51O896gHeeZSz6aXxVI1/0Q5nweM//ynHzlXr55bntprLt8MGVrs7IUjWLQ2
 R2T1usYzzwpc5uGPWtPgJLFVGvOyXoFTRyMZ0ua1iKt+OeXT7Hbe0QFAmn6ktloDqZhq
 o94zTWE9mD9f471hbYOcts33IuKUvZsqmgsriNdb6tTuKzyM3RJU+6nz9twTJ8JUd/bd
 e6tg==
X-Gm-Message-State: AOAM530WA93G9lq0qkREaTGcyNdiepQQKilO+NyzyF9Id9/fbQnCKere
 b5TAmDPOLc72Le0thx6uELX5G1ISLqM5UiTg6LauLw==
X-Google-Smtp-Source: ABdhPJw6OzrP/tqzilx2s0kEtrxnMuJo9dLpMBCZ0dCkwT/JEhpzNRmDgzrjJwTn1Q6SB9b0/nSi9vG/C105lJ9DU7Q=
X-Received: by 2002:a63:5747:0:b0:381:54b9:b083 with SMTP id
 h7-20020a635747000000b0038154b9b083mr24763452pgm.178.1649064417542; Mon, 04
 Apr 2022 02:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220401015828.2959505-1-victor.liu@nxp.com>
 <CAMty3ZC6pLJXP=kxwFeZj6CF87ASvoxz9+8Z-7O+DCNwtcLHcQ@mail.gmail.com>
In-Reply-To: <CAMty3ZC6pLJXP=kxwFeZj6CF87ASvoxz9+8Z-7O+DCNwtcLHcQ@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 4 Apr 2022 11:26:46 +0200
Message-ID: <CAG3jFys1O2ZT8_kf_VPQ7kCQAED13qNCfe8oqjgF9EsC4LX43g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: nwl-dsi: Drop the drm_of_panel_bridge_remove()
 function call
To: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Liu Ying <victor.liu@nxp.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Apr 2022 at 16:52, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Fri, Apr 1, 2022 at 7:26 AM Liu Ying <victor.liu@nxp.com> wrote:
> >
> > Since this driver has been changed to use the resource managed
> > devm_drm_of_get_bridge() to get bridge from ->attach(), it's
> > unnecessary to call drm_of_panel_bridge_remove() to remove the
> > bridge from ->detach().  So, let's drop the drm_of_panel_bridge_remove(=
)
> > function call.  As nwl_dsi_bridge_detach() only calls
> > drm_of_panel_bridge_remove(), it can also be dropped.
> >
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Guido G=C3=BCnther <agx@sigxcpu.org>
> > Cc: Jagan Teki <jagan@amarulasolutions.com>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>

Applied to drm-misc-next.
