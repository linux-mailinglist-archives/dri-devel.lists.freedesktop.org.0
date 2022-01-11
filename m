Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9A048AA78
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 10:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5011414A18F;
	Tue, 11 Jan 2022 09:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB5F14A18F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 09:26:53 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id kl12so5983894qvb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 01:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8tq/et4xYmva4m9fJHsmk5wCnGh5xT4vOZTkPwsBoZ4=;
 b=vNKeTLO6E2Y+w9V8TpyEVaLyqb/tmqEv7QCdUlzyRk/NYZZ29FNUIJTnJFiSY8/GhY
 eBHu572eaY3mzHwFRcvIK1chc4kEVMBKyhgvYT6Tigm5G4IV+JdqRuJY+drlG+uy11y2
 kGz2SuhIHfTeQ/mVaUKATbf8par+xvWz6nz5yRS+GPARKAVom0d2/J/S4+vfOfJn/7Xp
 YU1O6ak6zV8h9Ak48U6p4Xxx8wTLWvFcoFyPjjvvLujAcn5NfjX+44nvTOgIfpi9jIeX
 M2rMTK9cm5ANG4rooHfumN5iedX8OaRlvjFOMQ3vbB2hUC8iKhGnZ7k9vph+kwgbqcsU
 R7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8tq/et4xYmva4m9fJHsmk5wCnGh5xT4vOZTkPwsBoZ4=;
 b=2so+xwQ+M8bueaKEy1ob1rE34p4c46J9wudnqI7tnf0WA4nEdu0oVFFRxH470kfjzG
 jr+Uaw6YB/CkEVGUCGmR48SXO/6/c/xndOXd2n/5RvqXLz8F79pbUe90ZrXl6CM1jwX5
 ibNi8VxI/Su7X6XTo2eLrDX9dJmOj4ReX6sV5KArye79HR1FLtINGvJYKxzVIEIsruN9
 1mDB2vI/xH1KOZv8EQgk5fZ6ZvsEYhgAtZ8KRJzz6MVBYf33/sHQvI9miLmJ/GKtpgnw
 2sSjy2sXm/YS94viXUzCinCKK6ElwJSdPS/1NCpz2d/aucMgWMo9Z6ReYfXsOi7ONONE
 G9wQ==
X-Gm-Message-State: AOAM532zT/NV1/RhMF/Em42+f4aZ9B6TuT2xGWHWQZPej+0Fwu27wIyX
 TMaw+NNSiSiSx2IDsXxw2epvfeLgsKLU2EF/6lwKdg==
X-Google-Smtp-Source: ABdhPJwQB4Hi/12Fc86eq6wqhDjHS9A0x4Cd0AOnfthOsT2jxd+R0eawLKmZaRZ4riayb6cxng+qlsGn/VzfkKAt9pk=
X-Received: by 2002:a05:6214:5288:: with SMTP id
 kj8mr3085474qvb.88.1641893212792; 
 Tue, 11 Jan 2022 01:26:52 -0800 (PST)
MIME-Version: 1.0
References: <20211215095117.176435-1-maxime@cerno.tech>
 <20211215095117.176435-5-maxime@cerno.tech>
In-Reply-To: <20211215095117.176435-5-maxime@cerno.tech>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Tue, 11 Jan 2022 10:26:42 +0100
Message-ID: <CABxcv=mseT4o71HYKETiezZ2FDFvvf=Aw+jpuOE98dVWdvwLzw@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 v5 4/4] drm/vc4: Notify the firmware when DRM is
 in charge
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Scott Branden <sbranden@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Tim Gover <tim.gover@raspberrypi.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maxime,

On Wed, Dec 15, 2021 at 10:51 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Once the call to drm_fb_helper_remove_conflicting_framebuffers() has
> been made, simplefb has been unregistered and the KMS driver is entirely
> in charge of the display.
>
> Thus, we can notify the firmware it can free whatever resource it was
> using to maintain simplefb functional.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier
