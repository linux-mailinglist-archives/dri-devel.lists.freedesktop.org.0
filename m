Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEF03378FF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 17:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED236EE4F;
	Thu, 11 Mar 2021 16:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432326EE4F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 16:16:05 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id 15so2866847ljj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 08:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lfYyTSB6sN53w9Rpv4MYqNBv1FPOEZ0SmWjIhTyeJxs=;
 b=w7gbpWGeeJ+LlzySG7BIYUktxr5ZW6HHVY4+kDsfrOjR8+uCX7UfS12tge1fIba7bN
 siJe30TAnw+/h3qtte6NL8++/XN56VXtXOlGG2vrWXs32XJku7afWUNsnk0tLSZgaoRP
 qIZ/4GmtZ1i9oNXcd8zXNQVIY3z/cXgu/HYe6RiK/HznG1JHC1RnGEO26o+3Kc7Gu24t
 mDKnOJnUQbaI2aW18KnCx1bzYgbMjT0hOd0+44R+gc8vZc2nH65LvMln58GGsQgDMGjl
 svz66W78wmfOTwVlEZMQmHrfQk2qoRs3WoDHpHpgjVjwpj29LtQx6vil16mwBYI1Xq9f
 qtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lfYyTSB6sN53w9Rpv4MYqNBv1FPOEZ0SmWjIhTyeJxs=;
 b=tOcliEggxQeN4rw2BSMhabeUDzWPCPIrIWFplkEIpTLj+KLUd8TQAGe03Hi9cSZ/yJ
 25ONeLHNB458jTJW7C/e71KGvLAi+pM5zFeps2lwNMo9+DK9V2tY5OO/Xl6m3HAkBqcI
 FEHcNQ/PL0PJp3XR6dga6rQlXFHnZRaMBtdd+Ju7x239l74YquFyu4LtVmofCOdNFE7q
 GjJI23tKehRPq3ymyr+qOA/qUSQdyRkz6Juepqpq6x3md+wYnEyJR+C5a5LGHLLmTdrM
 QPaCfcLuHP3jORA0kChZmF7+J5J4Hd5HRgIpijXFIXVeX1QZ/KUD1Kh1YciICLLnQqAP
 D25A==
X-Gm-Message-State: AOAM530AHI7eKeHf5eUBn4Nqsb2RWXv7JVo2MYvuKzLCVpcaCB8dm8F5
 nfeywFWz+6m/O/iTiwy/39YsHMjaDktPDL3KMdvWWg==
X-Google-Smtp-Source: ABdhPJxjSHy1zm8V6vPLxd2/BZt39BMm+ldl/7gvjdw+kLTDN0YCYgFmd4U2bedbP56ygtsRdV6mIHbZc0eUiDGxSiE=
X-Received: by 2002:a2e:700a:: with SMTP id l10mr5292190ljc.368.1615479363631; 
 Thu, 11 Mar 2021 08:16:03 -0800 (PST)
MIME-Version: 1.0
References: <20210115224420.1635017-1-dianders@chromium.org>
In-Reply-To: <20210115224420.1635017-1-dianders@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 Mar 2021 17:15:52 +0100
Message-ID: <CACRpkdY0h0kEE_63y7wyc=0etTe0Bfn+EmWpfQSe7g2KcfTvhw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/panel-simple: Patches for N116BCA-EA1
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 15, 2021 at 11:44 PM Douglas Anderson <dianders@chromium.org> wrote:

> This series is to get the N116BCA-EA1 panel working. Most of the
> patches are simple, but on hardware I have in front of me the panel
> sometimes doesn't come up. I'm still working with the hardware
> manufacturer to get to the bottom of it, but I've got it working with
> retries. Adding the retries doesn't seem like an insane thing to do
> and makes some of the error handling more robust, so I've gone ahead
> and included those patches here. Hopefully they look OK.
>
> Changes in v2:

This v2 version applied to drm-misc-next.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
