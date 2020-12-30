Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E00382E77C0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Dec 2020 11:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D46D89332;
	Wed, 30 Dec 2020 10:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E5D89332
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Dec 2020 10:25:43 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id l11so36718038lfg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Dec 2020 02:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xIm4HsxBV/YhkpyIFKWJu43DP/gigBQe5OSNfmqM3jI=;
 b=TuBSKdzSRSdX+McwkeVBLm4eBQ+nkUBbdBrEL0iHuejlnRtM8fm/5odPMcpNHwdsuo
 fNocmaGR2kNYRoZ6f+OUm6QjE1gmIQenAmuhTdeJsdx5UrjfXrr8PXIv/NqC1ro4gJJe
 0mK6eoYWhgbD0tcrlYwPgzfTWMfhMDiuUawZD9vTE/BWIqZd8Z4h9QUwuLEPvMtG8q2y
 YFrY1rX1VJu/GpzmatJe/cvUaJO98wWWeIq1mLsTkP6jqw3J/Lvj21imJHe/QZcZ6vff
 q/sAHSdf40xVBumDZRpZmXbw3pIQoTow6Ql8pvF7Wk8hvPzwJKA83VVF423rhbdbNyJb
 1AyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xIm4HsxBV/YhkpyIFKWJu43DP/gigBQe5OSNfmqM3jI=;
 b=O44UVPloE0AJSkLUSHhRoE2bownBqW0X6ghTHlWe+9x/JFU9VBw73namkfSSZPOJE6
 8Jih8nS9T1DNVyg6qLInYOlgfSBKUcgBI2UPXZ+fN6QN6Itj0UL7FnPEiGB7AAtuLEVQ
 5O/RoN8FJgsu4rF0ICDiFcEel+94ImEny0r2zCzRXTUKG5zAFREC9IR7FmVcJixafQNt
 zZiTvb2MqOKmq2ot+os9FjD0oJZ6EAg1/cdI2O+yQDjv5o2v/836CU89mEtg5OoBxfNs
 G55rERdfJIlNhzS42XauBBej01bnry+x8cRf7IN6bz0G1Gf8V02MIJhGStATcJ7Rz3n9
 PIFA==
X-Gm-Message-State: AOAM530JcvCMxulKB69k8BRrju0BD5p/T+DigjqgwM6dlCpvTGFPapSH
 wUDnIze9EmkB2IoLTxaENpLzaW1sgEuk0JqT3JwqOA==
X-Google-Smtp-Source: ABdhPJyEv1fhuXqDub8AiwkAbhOEiz1w3ywoxgjdgMqSi3R5T2QA2x7OuAkOToJf9h9yDzcP/WEDi3TpW+XEzoJ+7/Y=
X-Received: by 2002:a2e:586:: with SMTP id 128mr28120352ljf.273.1609323941829; 
 Wed, 30 Dec 2020 02:25:41 -0800 (PST)
MIME-Version: 1.0
References: <1609291023-46889-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1609291023-46889-1-git-send-email-tiantao6@hisilicon.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Dec 2020 11:25:30 +0100
Message-ID: <CACRpkdbG0YK62ydVCso8OXOnFSMcKT6GiT6nNhe6Qsq7B69HaQ@mail.gmail.com>
Subject: Re: [PATCH] drm/tve200: remove unused including <linux/version.h>
To: Tian Tao <tiantao6@hisilicon.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 30, 2020 at 2:17 AM Tian Tao <tiantao6@hisilicon.com> wrote:

> Remove including <linux/version.h> that don't need it.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Patch applied.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
