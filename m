Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B3E403BB7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 16:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7616E155;
	Wed,  8 Sep 2021 14:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA756E155
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 14:45:41 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id u17so2561361ilm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 07:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5+eW/ZheKXj4ZX5orDoqEWxFt7XRuMsqdbmkjUkkg0Y=;
 b=fXFb0hn8qw8T9Jg1x1peuRXYSEoCZ7/hzNJMifqcQuxXdfiGk92VPL8zqn7yayp76A
 HZhgCxmXxcKlmHBHH2QTmQmtJkclTo1P8+XJ+PQyjHCtfu/weWuDpRtzLihXwUkcxstO
 KX3Kl7eJr8K0xfN0aQTcwn84dD13SedzA45RtIGwHYSvrDpC9H/P5uofXoCdAZrQqmiv
 HhzjJ2PfoPTMQkXJXjmNcR9WKf0iEFa6qRMuxZmv3lOd3IrfVta/uBQPMqKZMCZgOb8Y
 TZuf29q7GJr3APg3xdTEjfit52YLo44PHV5/I+tc6EXcy130Dj9URPnw5GEp/qJcw+PH
 xr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5+eW/ZheKXj4ZX5orDoqEWxFt7XRuMsqdbmkjUkkg0Y=;
 b=JQpqOqTapvm5RWDND497WUtGj5vJ2v7w520CnkvqQdoFASm2RQvlVEhcVJbSFWP/EH
 lfZQtTfgPI3SRLi8RIhQAtEVW16mZQy0IyH4lNgV3VwRVCvLr4kmz0jJZTbb/C/pTuRC
 wUkNGbAL+Ofb5X5+sIbA1qx6Pl7rNCx9HBmAwabcJJrFUmVaRlo6mGT30W6Z+GdL2NUV
 7oYbibbkMd4vNVbwhO1m431cWjR81AMQhT8vLHB2WG+hSij+HdRapYjFVY6CUjzR2Tq1
 tsrQ1+goUTjZyyoyiIc7GzAbpMftwO/H9YuC4PpQFfbVrinHcwA5YhAnwLJeIOal1m4j
 //sA==
X-Gm-Message-State: AOAM533RcE3ddNlhfsS/kK81dU4SyZ4a6+wXs5DTLw7WwTdp6F2Nb5wk
 xEnK8pnieQ+ChzcxQi+j+j0LHfh9pDVZ8Uu4rhEszw==
X-Google-Smtp-Source: ABdhPJz8YaQ9sLyJy0cQgutspDJTH9PZxDifyu0mxyEfhPS/VizaquyGfUh/HKcbYv/hXaNK093SulStSwzhVwCnjWE=
X-Received: by 2002:a92:6b0a:: with SMTP id g10mr160726ilc.27.1631112341151;
 Wed, 08 Sep 2021 07:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210830023849.258839-1-yangcong5@huaqin.corp-partner.google.com>
 <20210830023849.258839-5-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20210830023849.258839-5-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Wed, 8 Sep 2021 07:45:29 -0700
Message-ID: <CAD=FV=XzUUdh-hTTg_Pv1P8WHwTTXa7F5m6q1xq=XVdPxyDDpw@mail.gmail.com>
Subject: Re: [v4 4/4] dt-bindngs: display: panel: Add BOE and INX panel
 bindings
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
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

Hi,

On Sun, Aug 29, 2021 at 7:39 PM yangcong
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Add documentation for boe tv110c9m-ll3, inx hj110iz-01a panel.
>
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml   | 4 ++++
>  1 file changed, 4 insertions(+)

Not worth re-posting just for this, but when applying we should fix
s/bindngs/bindings/ in ${SUBJECT}. If you end up posting a v5 for some
other reason then you should fix it, of course.

-Doug
