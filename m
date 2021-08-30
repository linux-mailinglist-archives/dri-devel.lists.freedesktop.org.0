Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FF13FB9F7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 18:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEA889131;
	Mon, 30 Aug 2021 16:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAA689131
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 16:17:49 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id v2so16637475ilg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 09:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nfzNrOmv2YiRjvQswBNc4WHEh4DSAzBWkoHqRjK3dy8=;
 b=d9/QBDnEGBQ72Erph/eIdUiV6qrcStrNFk8vsZVfX/3Ti4YujTKIU7L4Sh+1jCUi4R
 xUIMFcBgjHUznvgSzlDZQc1yEssjRtTBDNP4lnZpsbamDRPpqAZ9zdtlwRcHZkUgkaYe
 c+EdQRM7fY/JuLvJDKePxSHQfa5jaf4m3UvFNax4Af3yLDgHnuv8zCKbMOgJQif5PX4S
 IQLX+jo0dNI5vkJyZFAZ0++JwYOHnhUuRCfImdwMJwa3Dn2B3ZvxzAduNIOByKS86GQt
 KYQccZyCgVBRnHCaeTidrfMo7q5B15T9GSOlArFmRe2oQsPxyW4CJkXF6cBvU570u4n3
 CwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nfzNrOmv2YiRjvQswBNc4WHEh4DSAzBWkoHqRjK3dy8=;
 b=H2NGk3pyjIbXHRWJ1GfksDd2T7kEodA8YBX3bQp29qZI0wYUY9E5dcpSpEmDKB16Q8
 1khVQ1B0DUirjDZ+B6TKCK9FXSZ2zXfLfEFRf369nrxpuF1y6vYj6uXOf0ETvvb2q+VG
 9Md8GdBLuEHxPDopGytXl32FcLLobZsytkIGvhLWqnOxdAalbfTBsGx3a8/yAg0fO+xc
 C1OD+72cxpehNDQA1f8r3ji0KL1Z42WyEA1rjiYIISjBx/5hnKlOh7Rxbqz9yf4rQVGL
 3Q6jSypa3js0sdMgZbtH7AL2hvGezwSwDpFFO0eFKW6bQe0YmFANZm1gvxLqo3SggwjO
 UMwA==
X-Gm-Message-State: AOAM532KqxM18H14/oO/bG5XlqZgohlFhs4ZkJm/eWGROnQnrKl4ofwO
 avZLpWtJa2coZuxAX74EijRuqY4EpzX5WCPKTYMNOw==
X-Google-Smtp-Source: ABdhPJxLPJaQvCs6nLDT2CD5K46HzLBsxGup9E2eQR5G9BwCq+36P/T25Gy8JNWJbkdm2pmzlGqOEWHmYw7KDSK8JDc=
X-Received: by 2002:a92:cf4a:: with SMTP id c10mr17367601ilr.269.1630340269053; 
 Mon, 30 Aug 2021 09:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210830023849.258839-1-yangcong5@huaqin.corp-partner.google.com>
 <20210830023849.258839-4-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20210830023849.258839-4-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 30 Aug 2021 09:17:35 -0700
Message-ID: <CAD=FV=WcvanAAjWix=qv=irMr_KfhTNQW+Hgauwcs7=03510FA@mail.gmail.com>
Subject: Re: [v4 3/4] drm/panel: support for BOE and INX video mode panel
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
> Support for these two panels fits in nicely with the existing
> panel-boe-tv101wum-nl6 driver as suggested by Sam [1]. The main things
> we needed to handle were:
> a) These panels need slightly longer delays in two places. Since these
> new delays aren't much longer, let's just unconditionally increase
> them for the driver.
> b) One of these two panels doesn't support DSI HS mode so this patch
> adds a flag for a panel to disable that.
>
> [1] https://lore.kernel.org/r/YSPAseE6WD8dDRuz@ravnborg.org/
>
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 915 +++++++++++++++++-
>  1 file changed, 912 insertions(+), 3 deletions(-)

This looks fine to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'm happy to help land this series or for others to land it. For now
my plan is to let them sit for a couple of weeks and if there is
silence I will plan to land them in drm-misc-next. I'm happy to land
earlier with an Ack or I'm happy to step back if someone else wants to
take charge. ;-)

-Doug
