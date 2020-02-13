Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5AA15BA96
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 09:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FFA89220;
	Thu, 13 Feb 2020 08:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711A26E190
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 08:02:39 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id x2so4169807ila.9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 00:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=10gKpQZri/82cKq6/v6n1q70/ykUGaRsAC3tbxvLKNg=;
 b=VrWi7c2dKzqZsYHKurZTdMgkC4RFCLz8pRQXKliNxIOnXIQN+w/7W6XmD6fSAowzQM
 ioOh/SrY3dOutMvt3wb5cGoy9CCd2hq9e+XJfPgkt+l6cd7VhjlSGIwQXuLnco2uNsYC
 UypTXDK4eCxQ2pS4z1F9tocVzjWyCYt5twKT2tGFFb0FupN3d1FiybANMraeI/WOAHuO
 Vbh4+aY3BmlkgOA8BGZ67TXc1X2ej6xK2B6Xe6W65hODbjUpqhOCOYwGzk3H7J8Q00Ki
 OVjdyTUPZ8P7QlU9e6592dew2zas6uql7ZoBeMEedlHy4AhNyucuGZdfqAR9pwlXQ8jB
 AoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=10gKpQZri/82cKq6/v6n1q70/ykUGaRsAC3tbxvLKNg=;
 b=IZJ7qDqXPY2fWnoDNTnrfX33uKAS7d8gz7rwO6hodhLjicLwK4mXeqWgRRMrZeJOmW
 3x6Gw5GzIe/bl//+gdRsOCuda/PyaU27usWxK4uORuHyYfda64ZEqK28ocv+LhREESgN
 GWVrr7Q/7YThypc8czwATPj09+PfxblhEF5w9HfS9KNgG3tU/LD6aTLN64nuIHFM9MaC
 21ViDcbcx8eH2nQX9DbhR+cgs7LCqD0C25VI9tjvaLZ1ECkKEWcmI8SJHpb94cOjwnlf
 41Wrgfh6Co2UxaANoThqcArD/wm/MTbGcLI7zzCip5eJJxVUFWZX+EIT/mPajT5w3tbH
 09+w==
X-Gm-Message-State: APjAAAW/yAnL+WtaFGaO5+GMjKL1rFY0YQis9ke+InSodxI6ZkJLbGOp
 +P5CsfDruoPGdsvEZbn2P22NS6q/RpVPndRyioLGIw==
X-Google-Smtp-Source: APXvYqyyqulvy1f+tDe7AmP1JblcXRQSp7dWSy72c8KxhM3n5LgVfLKIkT420HK+MTxArT2iueFQFfyI3z7Ky2ifzjI=
X-Received: by 2002:a92:981b:: with SMTP id l27mr15162000ili.118.1581580958517; 
 Thu, 13 Feb 2020 00:02:38 -0800 (PST)
MIME-Version: 1.0
References: <20200206031752.193298-1-tzungbi@google.com>
 <20200206102509.2.I230fd59de28e73934a91cb01424e25b9e84727f4@changeid>
 <1581495554.22603.2.camel@mtksdaap41>
 <CA+Px+wXjC1rchzUGhYYCJVyEbm7RQNFnqf-sQNaky6d82DyLyw@mail.gmail.com>
 <1581559033.14792.9.camel@mtksdaap41>
In-Reply-To: <1581559033.14792.9.camel@mtksdaap41>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 13 Feb 2020 16:02:27 +0800
Message-ID: <CA+Px+wWAR3E8TWnPJEa62WjXQQ1Y-Ni9g1rqvPq0f_HPYYynHg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/mediatek: support HDMI jack status reporting
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Approved-At: Thu, 13 Feb 2020 08:12:52 +0000
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Dylan Reid <dgreid@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 9:57 AM CK Hu <ck.hu@mediatek.com> wrote:
> I'm not only consider the race condition of plugged_cb and codec_dev. I
> also care about the atomic of mtk_cec_hpd_high() and hdmi->plugged_cb().
> If these two function is not an atomic operation, below is an example of
> problem:
>
> <Status disconnected>
> 1. Thread A call mtk_hdmi_audio_hook_plugged_cb()
> 2. Thread A call mtk_cec_hpd_high() and get disconnected.
> <Status connected>
> 3. Thread B call hdmi_conn_detect()
> 4. Thread B call mtk_cec_hpd_high() and get connected
> 5. Thread B callback plugged_cb() with connected
> 6. Thread A callback plugged_cb() with disconnected (Bug here)

Another attempt: https://patchwork.kernel.org/patch/11379979/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
