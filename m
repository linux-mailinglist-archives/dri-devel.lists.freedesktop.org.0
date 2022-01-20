Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B4A495251
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 17:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A9710E721;
	Thu, 20 Jan 2022 16:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281B710E721
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 16:26:49 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id w7so7582674ioj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 08:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MiyQLWG80mstT5YpAPWl94SZ6aP1HBrogLLQBpAX1RY=;
 b=TCpLRXFBUmF+X5S4H5np0qUSumViPSruH+u/jcLvA+9VpSmaQT1bY+QQ1G3XbbFOoy
 QH6BFyaIfmIcUyMifW2b/+3pNNsJ98S1jtrqA1tzveG5wwpAmPAthLkHg8O1E2TkKem+
 PTz6c7hAangKEg6AQ8dFTi0kbbjkF6pnKSV3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MiyQLWG80mstT5YpAPWl94SZ6aP1HBrogLLQBpAX1RY=;
 b=dkn5sAUc8Yyhpuyk51Jhgl5dqPnc+4HCjE0H5YS31ND1pYfEZ9R9BzOE/N4mDVCyxB
 x6wbMduB/TXwSaRHjnx2SRlRwcw59Mne/g4+M4ez1XkIilngmL5SymB/OGf/Dpo7pNzL
 yMqSZpByFqKZ0L237lxzLK44VUbCFXvHLUy1/YDzB8ntbhGHZT9mblsFCNXTYtzdE2Fo
 geYuGlYMmXrvA6wpfY6bb5qGG0HYSG7qaP4NMq4LIKujMheirvzWKRPmsm3JPSG4dwlP
 9wooYGjLr/Cdk8Imb0cbEw82dP27XEogyr8H03PkDDK7O/MKVO+JiEbUlxo9x6b0Z7zz
 ktCQ==
X-Gm-Message-State: AOAM530i+LThD6UMd6KWSXFEXsLshdMWAkiAsrCOuTC/W5T71AtOnEPk
 hFwW//9XF/+Wi21rUv/VeiBuMr1LoA0P0Q==
X-Google-Smtp-Source: ABdhPJwzPeP9HFT0wLsi4Xz7VVhkMHLUJk9StVClp7MXHJCTToiImRnM0J6GQPkYWE/wk97sm3T3MA==
X-Received: by 2002:a6b:5006:: with SMTP id e6mr19081784iob.33.1642696008281; 
 Thu, 20 Jan 2022 08:26:48 -0800 (PST)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51])
 by smtp.gmail.com with ESMTPSA id k20sm1516982ilr.45.2022.01.20.08.26.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 08:26:46 -0800 (PST)
Received: by mail-io1-f51.google.com with SMTP id o9so7602866iob.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 08:26:46 -0800 (PST)
X-Received: by 2002:a6b:7314:: with SMTP id e20mr13900347ioh.177.1642696005981; 
 Thu, 20 Jan 2022 08:26:45 -0800 (PST)
MIME-Version: 1.0
References: <20220120064457.1.I337b8db7efaba8eb9c0ffd4da0d8c8133faf6f19@changeid>
In-Reply-To: <20220120064457.1.I337b8db7efaba8eb9c0ffd4da0d8c8133faf6f19@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Jan 2022 08:26:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VEes8afsYDFT2z=AGeEPGqm93VzqK03aojePe=phH1BA@mail.gmail.com>
Message-ID: <CAD=FV=VEes8afsYDFT2z=AGeEPGqm93VzqK03aojePe=phH1BA@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: panel-edp: Add panels planned for
 sc7180-trogdor-pazquel
To: Grace Mi <grace.mi@ecs.corp-partner.google.com>
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
Cc: Bob Moragues <moragues@chromium.org>,
 Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Yunlong Jia <yunlong.jia@ecs.com.tw>, Henry Sun <henrysun@google.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jan 19, 2022 at 10:45 PM Grace Mi
<grace.mi@ecs.corp-partner.google.com> wrote:
>
> From: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
>
> We have added corresponding information:
>     [BOE]NV116WHM-N45 use delay_200_500_e50
>     [KDB]116N29-30NK-C007 use delay_200_500_e80_d50
>     [STA]2081116HHD028001-51D use delay_100_500_e200
> Add 3 panels & 2 delay.
>
> Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
> Signed-off-by: Grace Mi <grace.mi@ecs.corp-partner.google.com>
> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

This looks good to me. I'll plan on landing it in drm-misc-next
sometime next week unless there are objections.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
