Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17896136385
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 23:58:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BF76E979;
	Thu,  9 Jan 2020 22:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DB76E976
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 22:58:34 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id w67so76655vkf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2020 14:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d3Ic+/+tOQj2Lu5zb82dqbL3LnFvo8VU2lGIIpV77vw=;
 b=Vs4XiohJHiCv9DpKDaL8PP0Cv5qmD17Ku6z6gwXdTevogicvgzz0V56LTDKUUfNPhW
 Iwx3uHBuDesHk/r2q0/LgARjOLEqx4IOpy0IKZ97asjGTuxOtDPF+Jub17jyVKigXjQ0
 hlfVpIYGC1LZrXImn2ixRg2dQuyHeSCEDqyhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d3Ic+/+tOQj2Lu5zb82dqbL3LnFvo8VU2lGIIpV77vw=;
 b=B3va6sJOS75ZT9B7plVPb3H/4U6dQopr6cQGKUEdW7nl7qbOVQH6v7mgu1pC9PIqU3
 20NbWbn+bo+BfvwPNjZF4mQbBKSsQa1Fw2MCa+6TN0JvfWKkrfT57OIp0G2US9JymXkl
 fU7fp4MWiq7VHxYwrvdARS/n1z+85eorGDj8Q0YcHOfu/tuoLUi2x1Xb3CUmp2YNNvOH
 cJqBPlMRB4qIo6rHv8wv5N+l47VEceiGmA2RSCXNIByygSgPJKURLZyQr7slWzolW/kf
 WZunpOnX5KSJO6poJlF/izjujxVUVIDh4H/7NbKVniqLZdjAAYH7St/k06DBNKE3Qsr4
 r0sA==
X-Gm-Message-State: APjAAAVMsNUA4kchJ/TytZmr1sayRe5uLL8MI2xi5p79BWkpXrYVFyPd
 LEHV2ddxZ7YnTXiDFNmECaXHTviycpU=
X-Google-Smtp-Source: APXvYqzcpXyWHDt7i6MLl2z+KfI6rNuzVk7NarQclmIwWT2es9OfTCKVF4fEH1rb+iWlEK2BRQzM1g==
X-Received: by 2002:a1f:2a95:: with SMTP id q143mr23160vkq.2.1578610713545;
 Thu, 09 Jan 2020 14:58:33 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47])
 by smtp.gmail.com with ESMTPSA id u20sm103136vsq.25.2020.01.09.14.58.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2020 14:58:32 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id u14so114513vsu.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2020 14:58:32 -0800 (PST)
X-Received: by 2002:a67:e342:: with SMTP id s2mr50831vsm.198.1578610712346;
 Thu, 09 Jan 2020 14:58:32 -0800 (PST)
MIME-Version: 1.0
References: <1578396597-18324-1-git-send-email-harigovi@codeaurora.org>
 <1578396597-18324-3-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1578396597-18324-3-git-send-email-harigovi@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 Jan 2020 14:58:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XwkvGgJUeNs=aKoirSw_f47QoDTuvQF25VE7ychwdJTQ@mail.gmail.com>
Message-ID: <CAD=FV=XwkvGgJUeNs=aKoirSw_f47QoDTuvQF25VE7ychwdJTQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: add support for rm69299 visionox panel
 driver
To: Harigovindan P <harigovi@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jan 7, 2020 at 3:30 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> +       drm_panel_init(&ctx->panel);
> +       ctx->panel.dev = device;
> +       ctx->panel.funcs = &visionox_rm69299_drm_funcs;

I haven't reviewed your whole panel driver, but I did just try to
compile it and found that it won't compile against mainline.  Namely
this needs to be changed to:

drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
       DRM_MODE_CONNECTOR_DSI);

...because of commit 6dbe0c4b0fc0 ("drm/panel: Initialise panel dev
and funcs through drm_panel_init()") and commit 9a2654c0f62a
("drm/panel: Add and fill drm_panel type field")

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
