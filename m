Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71275196F05
	for <lists+dri-devel@lfdr.de>; Sun, 29 Mar 2020 19:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2DD89DDD;
	Sun, 29 Mar 2020 17:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE7289DF7
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 17:44:19 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id j29so7530093pgl.3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 10:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kmRMCVebQwKolZ1owfxZgEJ3Z36wIWAyCqEaSASHlvY=;
 b=Bq06fe9AJChcuooMu7thhI4C1GMIK7gBxwAa5A71KCW1ABGzEVfx/U97uOufooY5Hk
 fb73LsjUD0AuOAFgeEoeyRLu9vHh2p1QuQoIz1x0YmdQuURcftUjh1s3aNTqabzM1tKA
 glBN7VgzxkikA71e2C0Mm1VFJ8syJGrqmRMFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kmRMCVebQwKolZ1owfxZgEJ3Z36wIWAyCqEaSASHlvY=;
 b=Zrj7cN0rb52OuPZFKUnr9EB4u6m0gmNkvmUwq3ikFEURMhgkwGv9vEWd8PO83qhDHk
 UAm5bnmi3sRdcJsKIbsMXbSmNp4jjNjbAdm18mc5rb6wbYY4VVyMpPSCQ5eyAvBLuVRf
 tMzPoSyQw/z5R22zzJihqI0AUXQKbI4TDD3goXRPADAmwPlz6yAKpP5yKbBQ2ax6byU4
 5b8Y4gz2IjhYqWyY1creHNeSGF3ybiwwQD1Qz+RYtH3okSyXxmuacitJWgcK8jIs73ff
 CnQC06Vrj4gKSVBeNe8sA3GiwGYlw4tgrLF6zusN64tyHx+aZuNqTRSjZO8lZmAGFcAe
 J8NQ==
X-Gm-Message-State: ANhLgQ07WeXMA5b9X8/cj7L8JNGPEOhmBHcl7fVOWVrWgH95I0POTZVv
 T5OvhwDF6Zs+p7gtzBWq9YTNfLZ6J2A=
X-Google-Smtp-Source: ADFU+vs0uMGtGWmK6rFkOfdAMPSqn9eO9elktCgbjLQA+xwo3JFqty5Dy0EluvHOkdf0DrnOXdwAWg==
X-Received: by 2002:a62:7950:: with SMTP id u77mr9691072pfc.34.1585503858884; 
 Sun, 29 Mar 2020 10:44:18 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id o14sm8393537pfh.147.2020.03.29.10.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Mar 2020 10:44:18 -0700 (PDT)
Date: Sun, 29 Mar 2020 10:44:17 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v10 0/2] Add support for rm69299 Visionox panel driver
 and add devicetree bindings for visionox panel
Message-ID: <20200329174417.GB199755@google.com>
References: <20200327073636.13823-1-harigovi@codeaurora.org>
 <20200328204047.GG32230@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200328204047.GG32230@ravnborg.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Harigovindan P <harigovi@codeaurora.org>,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Sat, Mar 28, 2020 at 09:40:47PM +0100, Sam Ravnborg wrote:
> Hi Harigovindan
> 
> On Fri, Mar 27, 2020 at 01:06:34PM +0530, Harigovindan P wrote:
> > Adding support for visionox rm69299 panel driver and adding bindings for the same panel.
> > 
> > Harigovindan P (2):
> >   dt-bindings: display: add visionox rm69299 panel variant
> >   drm/panel: add support for rm69299 visionox panel driver
> 
> I have only the first patch, which is now applied.
> Please resend second patch as it is lost somewhere.

Yes, it seems for v8, v9 and v10 only the bindings were sent, even
though the cover letter and subject say it's a series of two patches.

To my knowledge the latest version of the driver patch is this:

https://patchwork.kernel.org/patch/11439689/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
