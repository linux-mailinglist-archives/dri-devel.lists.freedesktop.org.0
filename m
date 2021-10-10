Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AA44283F7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 00:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A077A6E3FC;
	Sun, 10 Oct 2021 22:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7DF6E3FC
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 22:04:23 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id w8so5564846qts.4
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 15:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/5ObYAYd+03W3YBA6Pn4wWGWrRT1oHT143L5O16ds/c=;
 b=iixu0wmaF8IUA/xgeB9L8/92WlYvhOjmVUz0NDhb7kc/TIkwUAvwGCjxbIEzhrY/US
 1Tstm41AyFKwl9H9laUcb6Fn/MF0aEdslMb3FioJKkqXR8tbPLlETMQx//2ilxqsYqsB
 0KsvVU1zlidSTC672lVuh3XkD2H9S9Lo7LXjpOuwoJzO05nXbbL3yTNglVHRUHqDu36o
 80V0HkaB6g70lrKGIwq6IU65xFwxRRebxM70QpwYUeWz8dF225DqIMYUAVNNjdJ22urD
 v3BovLFWSW5j+qpi3Ui9NMFgQDnTY3k14oG4t/Qhudz04dy3vj0sBi/0+mzok/dFnZ2f
 TWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/5ObYAYd+03W3YBA6Pn4wWGWrRT1oHT143L5O16ds/c=;
 b=d/8chVzv3tCj6wYE+8baCnGI3eCl7lOHjDWEv6TYDVXeDXj7biDsKWv4JfHNKXsOAT
 TtpxxeaXxdafvU6MnL8pytP9NeVhymI7kjYjb382ln9U5xiYuyaHxELU4jjdk7WbvgKG
 ZdYAF7J4IoQmZoyDTV3ipUqyc9kL562eOdCMmqiEDiRps3e+sBRALph+tUcnIxbGCItI
 /w3Mt2hx3t70qztWJQltmZNlPnzVOhgxHFnhUb8RCnSdYmDNaZE4RKyi5RYLhl6p+YH0
 4R4pCdTl3+gFQPakEgTu1E09uIAfsofVyjGuc8MuTT1Ku1nwefHUlwX8HFrXmc6F9zqv
 m4Dg==
X-Gm-Message-State: AOAM5331YKgDelDh+0hSiigRXo96oamKb1jGaoziGJrOyAtaHGmatwQB
 c+Ve2VhhLApTENjxlC9iW60sIbgeKXdjkVA9/r9FyA==
X-Google-Smtp-Source: ABdhPJywgah7MRxRl8oRmiYWPWnUYFa6xvG6BmWJ9xvv5CRsXI3mGQPiMXd8S0SIeI6iXs311/kDxlBcrKOgV+4Dhn4=
X-Received: by 2002:a05:622a:409:: with SMTP id
 n9mr11463895qtx.153.1633903462263; 
 Sun, 10 Oct 2021 15:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211009203806.56821-1-dmitry.baryshkov@linaro.org>
 <YWMj8Yj5XM7YUPqs@ravnborg.org>
In-Reply-To: <YWMj8Yj5XM7YUPqs@ravnborg.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Oct 2021 01:04:11 +0300
Message-ID: <CAA8EJppqiGa4sgLVNxCO5w0FksfO-a+w_EwFEdjkZ05vU7Jr9Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add support for Sharp LS060T1SX01 panel
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 10 Oct 2021 at 20:33, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Dmitry,
>
> On Sat, Oct 09, 2021 at 11:38:04PM +0300, Dmitry Baryshkov wrote:
> > Add driver to support Sharp LS06T1SX01 6.0" FullHD panel found e.g. in
> > the kwaek.ca Dragonboard Display Adapter Bundle.
> >
> > Changes since v4:
> >  - Use MIPI_DSI_MODE_NO_EOT_PACKET instead of the old name
> >
> > Changes since v3:
> >  - Replaced small msleeps with usleep_range
> >
> > Changes since v2:
> >  - Add missing power supplies used by the panel according to the
> >    datasheet
> >
> > Changes since v1:
> >  - Fix the id in the schema file
> >
> > ----------------------------------------------------------------
> > Dmitry Baryshkov (2):
> >       dt-bindings: add bindings for the Sharp LS060T1SX01 panel
> >       drm/panel: Add support for Sharp LS060T1SX01 panel
>
> Applied to drm-misc-next and this time on purpose.
> Thanks for the quick fixes.

Thank you and sorry for the confusion/mess during the merge.

-- 
With best wishes
Dmitry
