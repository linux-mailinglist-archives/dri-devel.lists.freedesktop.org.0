Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 480B44A62BE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 18:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A0010E189;
	Tue,  1 Feb 2022 17:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4024410E189
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 17:42:27 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id p63so21324682iod.11
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 09:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4xoABbCLAqy/4kreknPMVLPWf+5QXy7Icd8rKXEaL4M=;
 b=hvNpGaMdHLShbno3NJ1JqnKRgSHU1Q5U/DIbbWxCdii7VvT5St5h4sayNtOtlyDHJd
 Am7J82HYYdLAzZAtMwgAYWXmd3oIj4xLbcmgRDc9Qa9WyATfj5qJGj3QicyEAer27hnP
 wqTWwj8Eugi/98m5OPPM7ioR/woxVmsa4Rxtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4xoABbCLAqy/4kreknPMVLPWf+5QXy7Icd8rKXEaL4M=;
 b=ruTRR2+w2EE2NUnreYYpbMzhghTZx+dRqZRfrNs04Cqp+XG/l/1FLcCv+ywtWnkrOJ
 LJx/Js4oL+nDxFoifhR1FHJio0TGOR+x7jJfKE9VJE3HaIyU+x0ZHPs9/MNjJJzCdQdO
 k7pd3hpeZB11MpooANJp0ygcemCotPbkBqdJMTTmfzWwY1HlEBZDJIYir+8o+5HxDXDF
 OHQBBrKi2p6+11chCQK5+fSreQdo48psGgEW0tToY5N/ZVMnjH6Swyzrm6G9th3HGGkc
 WjQSwcmYn5WYbrovSE28NtuQdH1+x2dULn+14jFBjodbfnUlvPdZc97o969Xc51YaYNT
 X3Dw==
X-Gm-Message-State: AOAM530IUuTqWp1UBbQC9V4Nmc1g8qN32sOIQFf0eU/5wuJspQfW0Ihn
 6Xk8ozVq9yhkpTknDdw+k3TXDySPrml0fA==
X-Google-Smtp-Source: ABdhPJxToyJ2FBqvY3c7AHBAtxmOKz7SZTRLh2Mf2W5QOMxc7VveyZ8AYgWWr6M6HSn2z8NyqBXlMQ==
X-Received: by 2002:a02:83c1:: with SMTP id j1mr14011220jah.185.1643737346287; 
 Tue, 01 Feb 2022 09:42:26 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45])
 by smtp.gmail.com with ESMTPSA id m13sm4791944ilh.18.2022.02.01.09.42.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 09:42:25 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id c188so22166349iof.6
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 09:42:24 -0800 (PST)
X-Received: by 2002:a05:6602:3411:: with SMTP id
 n17mr14210351ioz.128.1643737344585; 
 Tue, 01 Feb 2022 09:42:24 -0800 (PST)
MIME-Version: 1.0
References: <20220201092152.1.Ibc65ec6fa05017e9856ba9ef557310268429c3ce@changeid>
In-Reply-To: <20220201092152.1.Ibc65ec6fa05017e9856ba9ef557310268429c3ce@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 1 Feb 2022 09:42:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U6=2jPiOZ5=hnD+9tur=p7_u7ikbikEjB3jH=Jg8bNnQ@mail.gmail.com>
Message-ID: <CAD=FV=U6=2jPiOZ5=hnD+9tur=p7_u7ikbikEjB3jH=Jg8bNnQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/panel-edp: Allow querying the detected panel
 via sysfs"
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Feb 1, 2022 at 9:22 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> This reverts commit 363c4c3811db330dee9ce27dd3cee6f590d44e4c.
>
> Since the point of this attribute is for a test, this should be done
> in debugfs, not sysfs. Let's revert and a new patch can be added later
> doing it in debugfs.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 39 ++++---------------------------
>  1 file changed, 5 insertions(+), 34 deletions(-)

Pushed the revert with Javier's R-B, provided on #dri-devel IRC.

2bf68bbdb6f5 Revert "drm/panel-edp: Allow querying the detected panel via sysfs"

-Doug
