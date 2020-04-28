Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A591BD4D7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 08:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1546B6EC98;
	Wed, 29 Apr 2020 06:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3E56E868
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 22:03:25 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k22so213472eds.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 15:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NR54EageimV01N0+P0/H4+3jaMZG7ansJYKsbb2lDA4=;
 b=a9KTwNGb6RSAuMXlCe8SZjpdmg0EZoGvUTiAaug8rze8fhPJooZKll9Wy+yb99XNBE
 oYtD3N7zekNIIPvqfSVNNBtdyQaXp2TjZA5IH1jZvFZ7U5X7cPou/ztPOkJWBV7wxaJU
 i353STD7krdCtZjCVMT03LT8In+W3uwfWm+boXgdqBg1QhIRviE8L2UQV+LmSm/dQJNY
 DMWlhZ7oPcWqcY0POIAFgOVAUAB0LtOCYjBnF4bc53GE3dQcsRnwAGmkYc9BQGVUkYJy
 UdhvNDc7fMo6h7SN3HfdxSZvecWp2gahv+jZpT0e6POyjReeBsn5geUu3KF2LO6JV57Z
 5pVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NR54EageimV01N0+P0/H4+3jaMZG7ansJYKsbb2lDA4=;
 b=H/dBpAuu1I8QMzq4FfT9qd9XovxIXVgatGEOuD1jaq0yiOXz7RKecUn4NhEwfUvMKN
 l0yoO1wCY8PnXBLrPRTZ1vFoiNqQmaX0/nTsgLJW7oyY/g0P0rCbaG+Fp7D2Y54HPVn/
 A8qHCiJ4xb22o890lecnl8JwZibfMNQbFWPR1P63H84psstKpGlFgGPkvuplpMqw+kvV
 8WP6d+YrAkg8uhfPu+cNAFhc+b0WC2SjLB+4Q3k6rS5nLahju6shIX8ndcYkpMffcjCW
 FJbA1Q7Zk4XzdaGsD9JGzG/HnDx8+bwPM3dc324LUGGMIqwrRw4+XkqrPkO64ABSN73p
 U/Jg==
X-Gm-Message-State: AGi0PuZu7N9TAIw6/0XQ/lNlobbeL/adD/06ZZj/AIWnXMoz1JUkTlNF
 BpG35eEe9tmSqiIjMTXi/BrsCbef8gnVOzsXCAY=
X-Google-Smtp-Source: APiQypL8g6O+FG9TaqsUDLdp/pis/jgZ50o0duv/BKwjfN19GSyMMa1FelXnRXGRWclbKX2YlA92SMbDu23K6WRUF7Q=
X-Received: by 2002:a50:fc06:: with SMTP id i6mr8028590edr.110.1588111404097; 
 Tue, 28 Apr 2020 15:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200428092147.13698-1-narmstrong@baylibre.com>
In-Reply-To: <20200428092147.13698-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 29 Apr 2020 00:03:13 +0200
Message-ID: <CAFBinCBb=FTH6aken5K9zoedBPYBJUCSj0eA+_Eghv+mnU_3vg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/meson: add mode selection limits against specific
 SoC revisions
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Approved-At: Wed, 29 Apr 2020 06:45:00 +0000
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Tue, Apr 28, 2020 at 11:21 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Amlogic S805X/Y uses the same die as the S905X, but with more
> limited graphics capabilities.
>
> This adds a soc version detection adding specific limitations on the HDMI
> mode selections.
>
> Here, we limit to HDMI 1.3a max HDMI PHY clock frequency.
for my own education: 1.65GHz from the PLL will be divided down to 165MHz
isn't this more like the limit of HDMI 1.2a?

> Changes sinces v1:
> - Moved frequency check in the vclk code, and also checks DMT modes
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

This looks good to me based on the current limitations of meson_vclk.c
If we switch to CCF based VPU clock rate changes then we should do
this in the clock driver by calling clk_hw_set_rate_range(hdmi_pll, 0,
1.65GHz)

The good thing is: we can re-use struct meson_drm_soc_limits even
after switching to CCF.
We will just need to set the max PHY freq using
clk_round_rate(hdmi_pll, ULONG_MAX)


Martin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
