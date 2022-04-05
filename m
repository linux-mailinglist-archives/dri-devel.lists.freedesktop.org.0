Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E74244F40BE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 23:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220F610E828;
	Tue,  5 Apr 2022 21:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B640A10E828
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 21:21:20 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2db2add4516so6300037b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 14:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=05ESTLKuRKureM3diZOwIcKgKT6b+0avzQkzpMlIWl0=;
 b=F4+e721tNcbr4VyIH/v5IIZ9tP+O6JaNPcwsW2WnYFsjKwz+f51Jekl18A+rixt41J
 JOzuclwfSn8f5JdJQKTfJQNWNBFIdf0s995f8zlspLYdTtyXifztXr3SnJ52b5VLUVyc
 F47A1nlECQW6jmuo8criSUTu4sFzdp6DBZ36wOGQjOX3qBgox8zG3vFmBkWaEq7xRL/J
 8AssrUOlC7k5WTeV0oelsqfOT2PekmM12laoDKCx+Sik6VVl9ObsaNZITN/dIW6WZc35
 F3UUxaRXpwVu/a0lL7rew3B56UOopKkIXrdSFC/sHS6huWzOU7/u57GZ9ZN9n8CPrK6Y
 fAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=05ESTLKuRKureM3diZOwIcKgKT6b+0avzQkzpMlIWl0=;
 b=xr4VOraS4IMqm8j49Wm3S9WlyWlQCspBa68J5PdekCD2dfR2Kietb5mOoXZ1xCE2Wn
 i3AVqLA9NGtTbQLEyYEwBpDTSgbCYbEJQWO24WkJMn9hm8lt3zI0qhivCyOJZOFTbqhH
 51Z6/cKfUJiCM5D51i1o4M3poeajOvbQFX15Cjnh+YNy+JVhSdBtDlKNwUfCucCWjoo6
 V+3aplk6SX78BZc0FX4GtXYWNQfAr5nZkDAuZMLVr3aJTtlCpgmTTvlLtVKLnl7U1UZs
 UAgK7oiQ/B13ZiJCc4LCj5cxASCLzX1tmczfJuWTCi5yqSTz19Rq+MEkYL17rgW0S6tl
 HhoQ==
X-Gm-Message-State: AOAM533KK9itvNJT22+tG4pDV9IkmwMhBU7fJp0ItSVUR9VxryWANTX8
 SwvFcsdkLU4Ks0O5SxiDrl7XG6xwbF6a54fyJh1bfw==
X-Google-Smtp-Source: ABdhPJwEINNWKQDaea3+TJzBVTdGEUBx+YlA8z0uH9ht1nC2kDVLVG1VUZvrKbQB9SHESxmVI/MOBKOBSGZVxnZp0I0=
X-Received: by 2002:a81:d542:0:b0:2e5:c060:a0ac with SMTP id
 l2-20020a81d542000000b002e5c060a0acmr4410118ywj.118.1649193679956; Tue, 05
 Apr 2022 14:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220329132732.628474-1-paul.kocialkowski@bootlin.com>
In-Reply-To: <20220329132732.628474-1-paul.kocialkowski@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Apr 2022 23:21:08 +0200
Message-ID: <CACRpkdbcoRBS=mDqMfseKDWQLZu-ohtXf1jo0nL_S+AagewRBA@mail.gmail.com>
Subject: Re: [PATCH v3] drm: of: Properly try all possible cases for
 bridge/panel detection
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 3:27 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:

> While bridge/panel detection was initially relying on the usual
> port/ports-based of graph detection, it was recently changed to
> perform the lookup on any child node that is not port/ports
> instead when such a node is available, with no fallback on the
> usual way.
>
> This results in breaking detection when a child node is present
> but does not contain any panel or bridge node, even when the
> usual port/ports-based of graph is there.
>
> In order to support both situations properly, this commit reworks
> the logic to try both options and not just one of the two: it will
> only return -EPROBE_DEFER when both have failed.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Fixes: 80253168dbfd ("drm: of: Lookup if child node has panel or bridge")

This patch fixes the problems I have on the Ux500 MCDE with DPI
panels such as Janice, so:
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
