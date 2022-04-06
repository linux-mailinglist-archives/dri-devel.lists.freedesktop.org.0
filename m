Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0834F6D89
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 23:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0843D10E0F4;
	Wed,  6 Apr 2022 21:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3CA10E0F4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 21:55:11 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id a38so587035qkp.5
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 14:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=18K4Koo+gSDcc2mYQoqx/5md7n9d+vojvdjDwRnfQkQ=;
 b=Kvts+vyOdgj5qb/yrmcCtgFddEpMAYJ6Vtt+e7K/TdG5zlgevkxRZJ7mT6fCAextWP
 CkBNmJNYEme2Prp18S+VCdHLmsbnxtU2/GL7oLXhZyLH1ZbhmnD+NEIAXbAYNfNwDH0P
 xne4EbAvbRql8bNt00hQfBSFq9neL63asMKnw0R8vSI+6e1KKIwyBEfnMLIWLMnwxMY2
 UymboPIBOVUTC8THIxgFIWNXTLThaSoUhLGzr/yflxFTA9qQ/j4XZtytj7c/YrpAuTU3
 U1JW4JHshQKqmHCC3SAvRIuphMsmKxiP3pyGPi+vtdE/Ad4rYIqpWQTm/V3S581T+70y
 qWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=18K4Koo+gSDcc2mYQoqx/5md7n9d+vojvdjDwRnfQkQ=;
 b=z+0HVSeXEDqM16qN3vrdEHfg35fIQfDsJbb8UhxVl4ct5SP0opiV3EVXg8XT3JCL18
 iyAoNglmtTexMMcAKSk/Vt14vyeijo5MZ0fPqXeuI5M7/hopLuJ29uKvdi7seotomm6S
 ONAGZQDE02U1GOgVzWDyi+3OIFpT6jUmIAmv79ibGugyqWx5sJbGxnCZx3gbfmKAWgFT
 CCLT5Nq1RybuJg7nRTuBjf/HCUIzm6xi7ZtLt494qE4Cw/vPPOpQ0XrFCdoi8vuxTO5v
 NaJ/wplR1PSuI4zQUFbqUWEONGqycaGwSCKbY4jt/1W2tW2cHGHYwRn/jiZWOaQDnzit
 uWtQ==
X-Gm-Message-State: AOAM5302+NN7FYV8/xArgTdg8SvOkyq+Xr9hBkBesCUXuklWJLoq8kpS
 HDBtgfRFVpnC89jZ/TMrDMoa+gi3Jt7a/zomq4bnRA==
X-Google-Smtp-Source: ABdhPJzrSfiA86e2SS1hOhDbnO4gW9TDF++9F+ETBBY4qKTwTrC34JSvWVKrwHQPm+7n0fPZ0ApGvCzsI+S+PYVc3To=
X-Received: by 2002:a05:620a:892:b0:67e:60a9:83c2 with SMTP id
 b18-20020a05620a089200b0067e60a983c2mr7245120qka.670.1649282110221; Wed, 06
 Apr 2022 14:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220406172956.3953-1-wens@kernel.org>
In-Reply-To: <20220406172956.3953-1-wens@kernel.org>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Wed, 6 Apr 2022 23:54:59 +0200
Message-ID: <CABxcv=k=dRPg3S5LrY+bcrEJ91CxoLdsRjVx+sLM7GYEKdv8Gw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] drm/ssd130x: Add support for SINO WEALTH SH1106
To: Chen-Yu Tsai <wens@kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Chen-Yu,

On Wed, Apr 6, 2022 at 7:30 PM Chen-Yu Tsai <wens@kernel.org> wrote:
>
> From: Chen-Yu Tsai <wens@csie.org>
>
> Hi everyone,
>
> This series adds support for SH1106 to the ssd130x OLED display
> driver.
>

Thanks for re-spinning your series. I believe that gave you my
Acked-by for most of the patches in v1 already? But it seems you
didn't pick them up.

You addressed the comments I had in v1 so those stand, for all patches:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier
