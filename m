Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636253F9A63
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C636E95C;
	Fri, 27 Aug 2021 13:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31416E95C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:44:05 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id x5so7057205ill.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nTcz622O5BJSdhwbyQLpgjIcVtxzhbuuDPAw/ERSb34=;
 b=nwMZdArwlv8PgqotkRBgtHlu7yabfcDMjYgvJM0IH8awX+9VQ78BYs+kxfawbg3ByI
 GVS2wJYh0hYBdqKT4ICNSQV2kSks6YSWLi64KWD9FOvegcbUE1JoBGwviQVEp37Kfscl
 t4BCXUCwTJbY3jAnUapbGiJ+WVyuxkBirs6cIOvHq2A3KzvYoG7qb3SG0QK884hzvCcv
 ZBHvOhm56MO6mWgbQin0tWbYzy4ca1GAUd8qfyl39NysGaPjI6q2Zrsz1TmZnpodQrGZ
 B2NIt3gK8LQHWMtNAIZngIXslebF4zKQ8vgVzFkxtmQx53VwA2/kqnEHWWVi9Bp6b3+c
 6MZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nTcz622O5BJSdhwbyQLpgjIcVtxzhbuuDPAw/ERSb34=;
 b=YDv7zZQCyDCGiPlbKvgp/qI7aTowhTz5CXAs7u3LmnQ3w51fRgvmdWBYB3Wzs78CmD
 1Nm3AROcBYP9rNdwPxksoSW88dmQKAUl7z5d/Bs+PwIszi7ieJWol+jLC3+G6bjsFRxs
 hyxgyutzeKevxsdr8Rzxb5su+yIQP1JGAPM9l644Xk2JaQCUwYZ0WNrxP0GfgeSHG///
 GLiodn3e9xES1k8z00E0mmMXZZMsicQPihFnjbIYgDQEZiKKk/a5WlXyMGkGmJed3Y18
 hFC5Wud7TNX5A9BNkyu10rAOvzpAcsfiIjSjrdFyQe9iuOxGq9jptwOuz8tf3w2HgMjs
 d6ag==
X-Gm-Message-State: AOAM530IY8I8+ZsJ0kzmZGzoyUtMz16uz6r3AuQlKWZf5j95DDJn7aDB
 DdnwGsNCIcAn/i16LkzEA/pd3q3u3p0yfBL6vonTUA==
X-Google-Smtp-Source: ABdhPJzTQDUwgP1HqS9A4c6xvJF2fQzeReSUEOiC4fqaM82hDkXm4wHKQiR4QMH5GN+DLTEf0xhxY3gl84w/dQcXMBY=
X-Received: by 2002:a05:6e02:168d:: with SMTP id
 f13mr6835390ila.12.1630071844764; 
 Fri, 27 Aug 2021 06:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210827082407.101053-1-yangcong5@huaqin.corp-partner.google.com>
 <20210827082407.101053-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20210827082407.101053-3-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 27 Aug 2021 06:43:52 -0700
Message-ID: <CAD=FV=V9GQXJo8YRwnPFK2QZY-CmaFG14v7H4Qb+JqmmiEF0Ug@mail.gmail.com>
Subject: Re: [v3 2/4] dt-bindings: drm/panel: boe-tv101wum-nl6: Support
 enabling a 3.3V rail
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
> to turn the 3.3V rail on.
>
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml    | 3 +++
>  1 file changed, 3 insertions(+)

There were no differences between this and the previous version [1]. I
added my Reviewed-by tag on the previous version, so you should have
included it in this new version. Rob's too.

[1] https://lore.kernel.org/r/20210820070113.45191-3-yangcong5@huaqin.corp-partner.google.com

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
