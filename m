Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE4949CF3A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 17:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C559710E540;
	Wed, 26 Jan 2022 16:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389D310E540
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 16:08:15 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id e8so34316ilm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 08:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DN8RvaHx5+77rk1/ysZjfhhFRASzKh3gGZwBlj41YRo=;
 b=nkLcw33OzZeDSgM/QdR+Uwjfl2uHPTsSuQARGXJ3DpzPJrZeFm9jTDuMOu+OGo6Mqo
 w60V3c73O+tVuA/TJlW7lMWrMUxiz3apgNPBHdp71o7RHa1/8SlQ3pnkj8zPUJxr05aC
 /DJlf9QXIck91Ui7drWLz++Sh0t55vLL+WIFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DN8RvaHx5+77rk1/ysZjfhhFRASzKh3gGZwBlj41YRo=;
 b=hI5UU5lmL+c8Rk3B8py677B7h66RaIUXnX6ZMPkG6q/gN13vB7v5sGwWPtLfZ9owCy
 5ks6kG2lP4wNOF3sXoopPwvn89LC3jGbuJt5iYHPWWtRH2dQL+efvbXNA/j0raFWQ5y1
 awn2aFXGYSzXbfe69GlcDUdUa4n5ts2MK216Pot8JP4D3H/AEXuYYNwVU87XNW0/KIXU
 w8/fwUSgu/L12RCUSbMo1ZZkmKDCVIozlZYpA6PB01ZoXfERVFM3sgcyMpAHBloDKEF0
 YIY7v+7tcUwd0aJav+7nRq+sudDUaA64OBGzgox6dQKZQIjEsgc7TJGwdu3omKDp/VHW
 IJZw==
X-Gm-Message-State: AOAM531znhAcpVahESSOmlIcO9KC46+jdLzdDAJFVx1kgkrJWkg1RXpO
 ca1za9iWIQuw9202FGEcDvsMzQ4G1IYzvg==
X-Google-Smtp-Source: ABdhPJy/oiIbYXTGjdaMb2gwplumm5RIh/eHVUwc/B8djn5hpH1YiUC4YxqnqvB7ymcYMJQRG1euMg==
X-Received: by 2002:a05:6e02:1ca5:: with SMTP id
 x5mr14804695ill.237.1643213293147; 
 Wed, 26 Jan 2022 08:08:13 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com.
 [209.85.166.41])
 by smtp.gmail.com with ESMTPSA id f13sm9611789ion.18.2022.01.26.08.08.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 08:08:11 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id w7so98038ioj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 08:08:09 -0800 (PST)
X-Received: by 2002:a5e:de05:: with SMTP id e5mr1173380iok.136.1643213289315; 
 Wed, 26 Jan 2022 08:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20220120064457.1.I337b8db7efaba8eb9c0ffd4da0d8c8133faf6f19@changeid>
 <CAD=FV=VEes8afsYDFT2z=AGeEPGqm93VzqK03aojePe=phH1BA@mail.gmail.com>
In-Reply-To: <CAD=FV=VEes8afsYDFT2z=AGeEPGqm93VzqK03aojePe=phH1BA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 26 Jan 2022 08:07:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UQXr16pKphfTmJWe4hKqGZ2QzSA2FJvRoTF8pRk1KMkg@mail.gmail.com>
Message-ID: <CAD=FV=UQXr16pKphfTmJWe4hKqGZ2QzSA2FJvRoTF8pRk1KMkg@mail.gmail.com>
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

On Thu, Jan 20, 2022 at 8:26 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Jan 19, 2022 at 10:45 PM Grace Mi
> <grace.mi@ecs.corp-partner.google.com> wrote:
> >
> > From: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
> >
> > We have added corresponding information:
> >     [BOE]NV116WHM-N45 use delay_200_500_e50
> >     [KDB]116N29-30NK-C007 use delay_200_500_e80_d50
> >     [STA]2081116HHD028001-51D use delay_100_500_e200
> > Add 3 panels & 2 delay.
> >
> > Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
> > Signed-off-by: Grace Mi <grace.mi@ecs.corp-partner.google.com>
> > ---
> >
> >  drivers/gpu/drm/panel/panel-edp.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
>
> This looks good to me. I'll plan on landing it in drm-misc-next
> sometime next week unless there are objections.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

b889d89ad45f gpu: drm: panel-edp: Add panels planned for sc7180-trogdor-pazquel
