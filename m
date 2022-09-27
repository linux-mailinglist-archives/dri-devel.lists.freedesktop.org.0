Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 423B65EC752
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 17:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56D510E38F;
	Tue, 27 Sep 2022 15:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207D910E38F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 15:12:50 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id 23so742808edw.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 08:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=zXKimN4auJa1FuNCWZCgoPHdaRZI8eUov4kEfskoTHY=;
 b=AXbWSfSsDnVMo9fDM5F5y422Ri0feMPF3EugH6ubSc0sV85QBBJXCyfJ9l/1rUrgfY
 /dzLE7gyd6vr81gUg0Mke6nHbdptrtlzUuW80uSHgtSF4pQCsDcRgI8079Y8WrXTP3h0
 cVrhac99DGCiIeFmew2y+7Ke/MXmiibqzFPm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=zXKimN4auJa1FuNCWZCgoPHdaRZI8eUov4kEfskoTHY=;
 b=B/Qa2S48GmwUGAGiA/3cSBjIQPOVvuQI7Skd4IOGIAgEuRbPWDhb+K/2keifOhJGDS
 9QyS+nvJXo2XoL/fMutB3qcy1XLbTHeGRKalKDFYDVlFv7+2aXOt8dq+d9C5/JU7P7fP
 VSVkeduxDZ4LR7bIU1SklB0gj/F37MR+4Hy5S4AzL753VflhHrjLUKCHzWSMNeVUcUxE
 58cdkOtDL0tIBkoAEmXxPs4zZNE65YCb7qLbGg/0wOrehUsoq8cLcJQuim0T3u/JiVAl
 FuElKt0KfS4g/oiB1IAIhzrVrLlSeREmnqFvN8XDQz17W7xM8fo7bQbXw5q9qpY/FnoK
 pIGA==
X-Gm-Message-State: ACrzQf0Gx+Zj3hF2vyM20G2IP5bU/5i73NLTiwUB6EPTZJtFzaLLw/2l
 qixxyMA8C0xvPVgs4mcOUUFbNhcxfIQ9QGDL
X-Google-Smtp-Source: AMsMyM4RMiCGnWbuUuw7tjNtn6ijmHGG1QqpYGiJUGN9B8kZG+SSzykGUo5543p1kYInLMii1Pe82w==
X-Received: by 2002:a05:6402:354b:b0:454:5162:42a6 with SMTP id
 f11-20020a056402354b00b00454516242a6mr27364543edd.281.1664291568459; 
 Tue, 27 Sep 2022 08:12:48 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 ez21-20020a056402451500b00457c5637578sm969383edb.63.2022.09.27.08.12.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 08:12:47 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id
 ay7-20020a05600c1e0700b003b49861bf48so1153610wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 08:12:47 -0700 (PDT)
X-Received: by 2002:a05:600c:1e18:b0:3b3:b9f8:2186 with SMTP id
 ay24-20020a05600c1e1800b003b3b9f82186mr3218712wmb.151.1664291567062; Tue, 27
 Sep 2022 08:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220927021835.488803-1-sean.hong@quanta.corp-partner.google.com>
In-Reply-To: <20220927021835.488803-1-sean.hong@quanta.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 27 Sep 2022 08:12:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UGZnW1dvjprT2Or=+4Tv54DqTK35zUQ4z-Y9e6LHE+Bw@mail.gmail.com>
Message-ID: <CAD=FV=UGZnW1dvjprT2Or=+4Tv54DqTK35zUQ4z-Y9e6LHE+Bw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Fix delays for INX N116BCA-EA2 (HW: C1)
To: Sean Hong <sean.hong@quanta.corp-partner.google.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 26, 2022 at 7:18 PM Sean Hong
<sean.hong@quanta.corp-partner.google.com> wrote:
>
> This panel has the same delay timing as N116BCA-EA1. So, fix the
> delay timing from delay_200_500_p2e80 to delay_200_500_e80_d50.
>
> Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please include "Fixes" tags for patches like this, like:

Fixes: c7bcc1056cff ("drm/panel-edp: Add INX N116BCA-EA2")


> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 102ab9f5d40a..e25851de7954 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1893,7 +1893,7 @@ static const struct edp_panel_entry edp_panels[] = {
>
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1152, &delay_200_500_p2e80, "N116BCN-EA1"),
> -       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_p2e80, "N116BCA-EA2"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_e80_d50, "N116BCA-EA2"),

You just sent two patches that touched adjacent lines in the same
file. That means that they will conflict with each other and I've got
to resolve the conflict. :( It's not that hard in this case, but it
would have been better if instead you did:

1. Put both changes in one patch. I think that would have been fine in
this case.

-or-

2. Send both patches in a 2-part series.

In any case, I won't ask you to spin just for this since it's trivial
to resolve, it's just more work for me. Please don't do this in the
future.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

43113fd4c5f5 drm/panel-edp: Fix delays for INX N116BCA-EA2 (HW: C1)
