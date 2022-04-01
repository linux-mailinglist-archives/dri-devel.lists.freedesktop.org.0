Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41A14EF220
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1F210E3DA;
	Fri,  1 Apr 2022 14:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F6410E3DA
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 14:52:44 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id b24so3231939edu.10
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 07:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CDTGg7xmd02lguFcPgMwbnDRM6tHMxG1F9pAwbPQoHo=;
 b=T7W8CN+jz5+aiumWrrsmaS77T+E5scb+pwhmUc7sQ00YF6qeVlR/iuX7nMux/sXgZi
 aoXbT2oN81ea9wAj+fdmjo3mi8803aMoqN5bRP+HmiPDTOHrxU4/qO8cTYWxf3yOu74k
 3YTMVUWBBT6ijr8xnLFMnkty+UNhHPWXYJ4yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CDTGg7xmd02lguFcPgMwbnDRM6tHMxG1F9pAwbPQoHo=;
 b=uxhkcfceGDhjPIDOnDZFVD75GHbtphhmEQk5GFModQqY9RHoCClO3eH96VTT++Ve2q
 Boi5u6z7vg3lngU76v6uc8ndlbNpFrY4jml3YFKGqGrebPMu1qqlhpLUm6m5kPUQjrFW
 fK85e930Lp+e1jRDbkEjByBXvuBNEgV9xj5Rby37/2xMqMWvJkYC0pI6i7v7E/MBsRlE
 JeB8fKf2aWLjCdSI28Q86nYxeS6SDl+TmYTEQnsmA+0GDpNX243A0rX6qasw1bTBdFmu
 4y5PP1E9Qj2eqY4B/Hd/isv0rsQAyvzAS93ZLTWBEz/6nlpWlyWTuAVgaRtQi7iYGW8f
 xvhQ==
X-Gm-Message-State: AOAM533ppUqQM6bkxzWElVvxY5hWFE+2T3m2FZVc1dC95f1dbmldBmBJ
 L+LJtNdDtGJ2lSYDepmrzDiUDkpzkkuZJBiR+pfemQ==
X-Google-Smtp-Source: ABdhPJwiHgIV7HJawa3rB+bvMNReOkRYBuvb2rbFfBdUHW6q0LcxoVGrpPWP1JWfHYg+Rjf+M7hRjLo0TYW/6FnZzJo=
X-Received: by 2002:a05:6402:1941:b0:413:2822:9c8 with SMTP id
 f1-20020a056402194100b00413282209c8mr21428644edz.13.1648824763403; Fri, 01
 Apr 2022 07:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220401015828.2959505-1-victor.liu@nxp.com>
In-Reply-To: <20220401015828.2959505-1-victor.liu@nxp.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 1 Apr 2022 20:22:32 +0530
Message-ID: <CAMty3ZC6pLJXP=kxwFeZj6CF87ASvoxz9+8Z-7O+DCNwtcLHcQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: nwl-dsi: Drop the drm_of_panel_bridge_remove()
 function call
To: Liu Ying <victor.liu@nxp.com>
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
Cc: Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 1, 2022 at 7:26 AM Liu Ying <victor.liu@nxp.com> wrote:
>
> Since this driver has been changed to use the resource managed
> devm_drm_of_get_bridge() to get bridge from ->attach(), it's
> unnecessary to call drm_of_panel_bridge_remove() to remove the
> bridge from ->detach().  So, let's drop the drm_of_panel_bridge_remove()
> function call.  As nwl_dsi_bridge_detach() only calls
> drm_of_panel_bridge_remove(), it can also be dropped.
>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Guido G=C3=BCnther <agx@sigxcpu.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
