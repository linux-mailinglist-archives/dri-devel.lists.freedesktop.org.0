Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3946C3F3004
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 17:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9116EAAC;
	Fri, 20 Aug 2021 15:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96756EAAC
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 15:46:52 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id a13so12815359iol.5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=92ifLfUdCfgzu4dobglorYhOZke3wvKfuSJrLJppmSI=;
 b=PNYN10dYDhFe0EbJZmnbL2MpCc/Phz+KekA56PuYlXGfyhrgadC8ZBvqP4bgYpHkrD
 c2NV9qlj5/XxJrm1f5erIMDqX8r37yNUz6tT+xYNmRz4LnKQL400qBwAXSZ5vavybAHB
 nq3oU74XvwgJ7R8daQQsXnf3Ste24aetEfBeA1H31in6MI2EyaFoKvWIjoKLcV8zxTpV
 c0vR23TBx0Ul3wqKuqc39RVQMyDBBxgAdnkqdQSgTxNEgVi/YN0sn246I6wEzw7BWwmq
 SDTDniiYRrRkYvS90ZsL67MedF0t9Z/SfccTQlPILAXazDy0obz1nyx7gNxfzMB1SFpE
 H7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=92ifLfUdCfgzu4dobglorYhOZke3wvKfuSJrLJppmSI=;
 b=JYHNzKiF3dokGe6SnBQplDeeMYhI5qYWl3PpCjNptchyFMIMm8lsh4wxUn9usGyk0d
 nKoCQsqa+nXxVHhFzXCixxEQxwW07gbALWAg3T6wG42Ci8NTV+hFa5Tov3LbaJzDS7OH
 +6eXJBU1eqyJqKzriZdggeF8cJu6z3WuYSkioNL/7wPr+VLPUija4Q4ixGqOon/oha9X
 albW+qKWS4yLpT7JLD6e7flFFldpHZeSO2Gf8TdM42BZV1X43XdkIY+gdqmmm9wCq0xN
 4ei8NkRBYqJa33lKLZ4zachBb+Mwdt5DjOIWFtpxruLHpENzu/t+j4JCLNde85mYtsIW
 Dnzw==
X-Gm-Message-State: AOAM533k5xGsmtWh8G+Vp//wsJbx5kcv9lWsuXSblRZtuUc1YaZr+UQW
 IuEQz+Sn4NUwSZr3DhxaYgUBUjhPs+jATIa3qK5N1yJC/kTeXA==
X-Google-Smtp-Source: ABdhPJyeDULv+E/a2RqKOUTOS0IIYgxZw7LAHi9Cjof6nWXftZVSKfx+/Uvzqc2gH3xg/vAkChi9QjcC53vMuWU9SEA=
X-Received: by 2002:a02:cf18:: with SMTP id q24mr18404225jar.5.1629474411859; 
 Fri, 20 Aug 2021 08:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210819124844.12424-1-yangcong5@huaqin.corp-partner.google.com>
 <20210820070113.45191-1-yangcong5@huaqin.corp-partner.google.com>
 <20210820070113.45191-2-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20210820070113.45191-2-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 20 Aug 2021 08:46:38 -0700
Message-ID: <CAD=FV=UTQz8_a+nNE9JiaD-bAa_jxDyho6VBMfqG5Jz6qwcUSw@mail.gmail.com>
Subject: Re: [v2 1/2] drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 20 Aug 2021 15:47:43 +0000
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

On Fri, Aug 20, 2021 at 12:01 AM yangcong
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
