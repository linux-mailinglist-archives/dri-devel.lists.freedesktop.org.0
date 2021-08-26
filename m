Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D09D83F8D99
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 20:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2816E056;
	Thu, 26 Aug 2021 18:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF476E056
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 18:08:54 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id a21so4895434ioq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 11:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jy6kuEa6qOgtVcIiHcL8rg+bn6K8NFztM/6FPGA8TH0=;
 b=cOVMuHR/jcS4F7qoAfsqLFcmg6fAf3mJeeBFe3SuigOc873b4njVi0bY+8ShjxHOla
 wEXxYRLn03hQXt7bL0bhzXJ/YWy0n7GCBeTq0P2rKE+9SZTdDphev2LQdCbCv3OQB+Rm
 MOdPQJzIyaQ0sfzXZhP6JjPqS7jB/I68vMLtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jy6kuEa6qOgtVcIiHcL8rg+bn6K8NFztM/6FPGA8TH0=;
 b=GcMhKzZRejpIysTo6SfV4+g8wZHabrEpTvz2jigXSMO5GUhBuzpmrGkvIJVQBPf/6r
 zx2UDXvdOSfBAK5QgxXx/6EORqnAtAO7kyN7EaFeunz8LAqP+IC+Fzni1N2UBha4+DKr
 d9kBPFtpGlL0BNrSPjYWu3a71BKnw/UZYvyBUrrn3baHeiPZfLSFhOaf7lcQ3MNZp7ym
 yolTgJaGqIwhRiXP7RDYqY5l/PIUurbRPA59IAVon8CXoGbv4TK5EQcBmmLR/MS5sNQ+
 4CUWKB8V1s8eLDU/DaXOSEMtQiKemVb0kcfZQ9abPJ3VYDRC0IdCEndTFoxCLUuQcZW6
 hffw==
X-Gm-Message-State: AOAM531Py4PhZcTR+znHQmbL6t2BBC6y6R65Liw99IItsD++p5fQSaTw
 rX3oeF9NquoWBdw9v8zolp9scNpV/xM3QA==
X-Google-Smtp-Source: ABdhPJwOgA8E8+AV9ZYLyq9ZMa965tGjRmpdJdn9yZz77af85onZopDXvMHJp4QYZmhHdixHnYv93g==
X-Received: by 2002:a5e:8e04:: with SMTP id a4mr4088676ion.56.1630001333430;
 Thu, 26 Aug 2021 11:08:53 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com.
 [209.85.166.177])
 by smtp.gmail.com with ESMTPSA id t15sm1896010ioi.7.2021.08.26.11.08.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 11:08:53 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id r6so4145424ilt.13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 11:08:52 -0700 (PDT)
X-Received: by 2002:a05:6e02:964:: with SMTP id
 q4mr3649001ilt.229.1630001332199; 
 Thu, 26 Aug 2021 11:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210824181140.v2.1.I8ead7431357409f2526e5739ec5bc3ddfd242243@changeid>
In-Reply-To: <20210824181140.v2.1.I8ead7431357409f2526e5739ec5bc3ddfd242243@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Aug 2021 11:08:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UqcHiZxeVte_qYKeBQOqe6C_9TRXDJjesGqz2qWsNiqg@mail.gmail.com>
Message-ID: <CAD=FV=UqcHiZxeVte_qYKeBQOqe6C_9TRXDJjesGqz2qWsNiqg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: parade-ps8640: Reorg the macros
To: Philip Chen <philipchen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Tue, Aug 24, 2021 at 6:12 PM Philip Chen <philipchen@chromium.org> wrote:
>
> Reorg the macros as follows:
> (1) Group the registers on the same page together.
> (2) Group the register and its bit operation together while indenting
> the macros of the bit operation with one space.
>
> Also fix a misnomer for the number of mipi data lanes.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---
>
> Changes in v2:
> - Fix the double sign-off lines
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)

Pushed to drm-misc-next with Sam's Ack and Stephen's review.

28210a3f5412 drm/bridge: parade-ps8640: Reorg the macros

-Doug
