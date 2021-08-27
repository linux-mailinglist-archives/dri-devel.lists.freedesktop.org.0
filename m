Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C618E3F9A5D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF2F6E969;
	Fri, 27 Aug 2021 13:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5386E969
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:41:11 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id n24so8493472ion.10
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yRD4HlKjeh59U2jdj/1xZGzYvYP9GrHQzdzoFY2mXsE=;
 b=A3CLO3YLxOrIbWyb60vFVY5nAOD1S0K91vtAH/tBZ4UYIiHTZRqbcQgbAmAKGoFWZG
 /An+oLCueW3IB4z0IrB/QaY7e7UAy6yx/3ssKU2Fizyj8m3ON5iHiQdnPtFOdWIfbppK
 htDep1pS9eTK5c/+T4ej18dgPpkJdWRLS7CDD+AYn/3lTkdeMmkXc/JVCOHk4JbjewSB
 7ODK1H8TgKOJHE43uB6BZMUYcWbNF+mh85ri3uzgabTB6VO8QWQQ0VKiyKnCnzQaPYaG
 V721Nv3zbGyMXlF73M/iHnaT+0Vgd7wPdlX0CnBctqfefPKau+ocjYQUJu/xbdfhj4b2
 OZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yRD4HlKjeh59U2jdj/1xZGzYvYP9GrHQzdzoFY2mXsE=;
 b=l2t9b+hbydJcL8qp6PiVLnZpq+Oogsy5mN0bVaKNvXs3jNi90RNX2oI8ZlNenXQvyx
 VQW7Pt4xBm04FQWslelKkSUkvNfkSuxSDeDwXOo9tX/ySGSQaiwlDgJQZRB36SQECghK
 LsRhTF3zOMZGHYINtEpcoerJv6ypnVGNfUfBTvvpGdS7yQn5dgHFWyBJMR4hUjaJ0cQx
 dGv4KUKqnLLVmShbqJ6APEXz9Kw9FVofwe0jroeCLhLI8yOgu4L6EIkYxLM7wlGXPSN5
 INMMveECBsGntojcAJoSX3CHjYHcwgJl8B4k98HXiFE/PlfdLtX+BGd2iRUkdcjm149H
 mckA==
X-Gm-Message-State: AOAM5310T88uC7SrFEG+5BuXuEvXlGyzf4PvIiHI6muUYJAmn9/dAAx9
 lweIWTZn1up3sPMqWCUTAv4+HMu6Jt8WGN5yERs/8g==
X-Google-Smtp-Source: ABdhPJzIbvsM9MZ1LrgsCvSCxH3OR626mdzjzjXmbVOemDc4miWf19ECt6QpYYBXweacC3uYNMgDR4fr6rdbIFSi2wY=
X-Received: by 2002:a05:6638:35aa:: with SMTP id
 v42mr8350640jal.5.1630071670391; 
 Fri, 27 Aug 2021 06:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210827082407.101053-1-yangcong5@huaqin.corp-partner.google.com>
 <20210827082407.101053-2-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20210827082407.101053-2-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 27 Aug 2021 06:40:58 -0700
Message-ID: <CAD=FV=UaAFY4Q+q8JyYqnjSeun=HHnbUEzFSVj5DtHVBPPAtdw@mail.gmail.com>
Subject: Re: [v3 1/4] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
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

On Fri, Aug 27, 2021 at 1:24 AM yangcong
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The auo,b101uan08.3 panel (already supported by this driver) has
> a 3.3V rail that needs to be turned on. For previous users of
> this panel this voltage was directly output by pmic. On a new
> user (the not-yet-upstream sc7180-trogdor-mrbland board) we need
> to turn the 3.3V rail on. Add support in the driver for this.
>
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

There were no differences between this and the previous version [1]. I
added my Reviewed-by tag on the previous version, so you should have
included it in this new version.

[1] https://lore.kernel.org/r/20210820070113.45191-2-yangcong5@huaqin.corp-partner.google.com

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
