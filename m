Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B57F3E3ECB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 06:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4026589A74;
	Mon,  9 Aug 2021 04:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C0E89A74
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 04:20:27 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id a8so25910392pjk.4
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Aug 2021 21:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sCRNReZaLDOQvPH4KjWdDvX5jH3hpYmDMhYSFZyyI+4=;
 b=Y2cgxiqH5ucNbGsSAAImYyUocfH0pYvQ/coZ86iqCrsJkzlYSWBx9tWk+1NJaVnNV2
 hQvTaDaiMT1AtbVhZH1MeUdyfYKcUgIJr4GqqxvL4RUGLOCTseH1Ztae8tRkA81HhuWZ
 9M4m1GSf5oXE71XG2tpY3yFNX/KfI0M7YpkAhOBlROHeD3w6m3R5rG2zXdbvu6fXSYZz
 7Endw//3IknW/uOq95mGC8mbGd2212mbqesZ542mHDDzBVM5TQaYKTwNUsyD+URf3hzf
 LtMKFVSGfyJBo+PCFWJfCRfzwbKwQ7OKeRBkD44kvXAIEGl9W3IXExeJBvI/59b6GhD8
 KRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sCRNReZaLDOQvPH4KjWdDvX5jH3hpYmDMhYSFZyyI+4=;
 b=c7ICwJNMJ30zOEBMQtkjPfYsIxo9iGYy4eapjK2KB27Bit4pJwmKVP0gyjhLXWqsXc
 GYOAk2T31NXmzJ8I4A5WUX5a4aJfP0ygeb5QiKwS2yGV1snZJjk36BgjsUOPQKcaDNsk
 Hlexv83waOvGTeRe4Z8rNBT4AqXPhTn5252K8Lq61IHkQWlw8110NP2yr8ne4qKQNq6B
 Eiszdtthg/Tw50qaVxjY2FKxo0BHc8rbzQZQg879w3ov6yP0P+KsSQeRKrDkJ/MPbtrf
 RmHg/PmC1GrcoJ9nHd7p3ucOEedxVpOVMvq/vIONb+CSOa7IhuLawh0w/SFO0k15qJd3
 iSvw==
X-Gm-Message-State: AOAM532KKyKZFY7PzPCtZqI8r6tKTQkfu4g17SJF1W2tHYGiFZrZsqQH
 Uz2H3mupl5gjChLqz6ed/3ciFQ==
X-Google-Smtp-Source: ABdhPJw45E670g4FSxxD+rVM8EYpeAPwFPVtdr+ur4PMyAaH0Tk3nJXWf7iYnvPpAzNVE33FMf5Gkw==
X-Received: by 2002:a17:902:8648:b029:129:dda4:ddc2 with SMTP id
 y8-20020a1709028648b0290129dda4ddc2mr10796851plt.4.1628482826555; 
 Sun, 08 Aug 2021 21:20:26 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
 by smtp.gmail.com with ESMTPSA id q19sm17263736pfk.49.2021.08.08.21.20.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 08 Aug 2021 21:20:26 -0700 (PDT)
Date: Mon, 9 Aug 2021 12:20:19 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Stephan Gerhold <stephan@gerhold.net>
Cc: Konrad Dybcio <konradybcio@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/panel: Add Truly NT35521 panel driver
Message-ID: <20210809042018.GD6795@dragon>
References: <20210804081352.30595-1-shawn.guo@linaro.org>
 <20210804081352.30595-3-shawn.guo@linaro.org>
 <YQqDb5eFqIx8tvAL@gerhold.net> <20210808134456.GB6795@dragon>
 <YQ/4WkA9ajpQx06A@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQ/4WkA9ajpQx06A@gerhold.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Sun, Aug 08, 2021 at 05:29:30PM +0200, Stephan Gerhold wrote:
> > 2) The driver works good, if the kernel is launched via "fastboot boot".
> >    But if the kernel is flashed to eMMC and launched by bootloader with
> >    splash screen, kernel will fail to bring up the panel.  After kernel
> >    boots up, a blank & unblank cycle can get panel work though.
> > 
> > The problem 2) is not driver generator related.  @Konrad, did you see
> > it on asus-z00t-tm5p5-n35596 driver?
> > 
> 
> Do you have CONFIG_DRM_MSM=y (built-in) instead of =m (module) maybe?
> I think a similar issue exists on MSM8916 but it does not happen
> for some reason if CONFIG_DRM_MSM=m instead of =y. Somehow having it
> load later during the boot process fixes some things there.

Indeed!  I have CONFIG_DRM_MSM=y in my build, and changing it to module
removes the problem.  Thanks much for the hint, Stephan!

Shawn
