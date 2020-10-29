Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8CD29E97A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 11:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663A76E8C2;
	Thu, 29 Oct 2020 10:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36FD6E8C2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 10:49:40 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w1so2230108wrm.4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 03:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fWgnf3Vay7YJsIWIspYVapY8D2lXsfI7vh8j9QoniJo=;
 b=DQ2mmLGw4j5aZDOWYCyWk+HR40suIZmgnIMJjOc5FoxzijLK2NeRCliqdffHMKm7ar
 FlCIPt57UsHEieI4SamjG1jw54v6YWF72PuZkBYiQyyUhF4jVeCG8dNmyEs2RJapqCQa
 waPN1RrK/toJo7GAcySZCYDaFuJASFhQ0dmRod0REmjboKrF6FBi0b0GuTDaspihfHir
 DeScYSEk33jpgbxat6t2+Ub8hSZnvmC9f19Rg0d3ObwNw6gBn6DIlUCMC3ZlNj2QcT7S
 TkqtWnyJXqPtmjTujqpRc9rFSDuAnmY36stHe7QzF98q4+QeVMfBJLY9YDWgDKJ0Weky
 G9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fWgnf3Vay7YJsIWIspYVapY8D2lXsfI7vh8j9QoniJo=;
 b=oYlnp2E+0xkYoVq3SDlW1GFOO8mPw5X7oKnBEqyUiWGCZMOApqQtHjso6StqrwWrN3
 eQTZWmkRdwPZdjMfij84wL3zTVSX0SsYwZ6URIJNBDHcZ0TzTClA1xkKuYoFYBYeXmSb
 dc4EVQUtlqcZ4qIm0EDLbAU2AyHG8rOesu9hlCIhLTaW2GKIBy55ndXsXGVyTMCho1wQ
 TmZ0H+JKLUeHolXdFOYE613k1YEZmgdMN29cm6DRhMx6sGcTySuF720WfWJao2fnVmqv
 0cqKH1MGR0hSL+MUwehJiqoYDwu7CKU+uYaQZ1Uv0HpI4IvnLmewimCf7E0xl7F3rTru
 1dPQ==
X-Gm-Message-State: AOAM531F+aFS3GBwBq0DxWnDFt/L3U/QhnAcDp0PfMXTzUhAcrtzZ1PR
 HreTg4SbdXdAsZF9t1asdVyUd33TVhGozo38ZCbcXg==
X-Google-Smtp-Source: ABdhPJysG6bl6ykmxAdrw0jBM8fyM0KME0or6r4pT0ObRPIXfB1Yhc4nzjkr+G7tOSdRkfDeYLRQFB4GqkT0spsVIjI=
X-Received: by 2002:adf:bb07:: with SMTP id r7mr5087781wrg.150.1603968579576; 
 Thu, 29 Oct 2020 03:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200925130044.574220-1-maxime@cerno.tech>
 <CAPY8ntAOsE5Xg-6R64B9NVE9SS85SkiNXJq19Uspx=-4v4Y3ug@mail.gmail.com>
 <20201029091746.2byv4tewvlozehh3@gilmour.lan>
In-Reply-To: <20201029091746.2byv4tewvlozehh3@gilmour.lan>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2020 10:49:22 +0000
Message-ID: <CAPY8ntAocwhSdgvbFZRwoU+u6LYhKPROgpjOOBsMZZTjiCrAzA@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: hdmi: Block odd horizontal timings
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Oct 2020 at 09:17, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi!
>
> On Wed, Oct 28, 2020 at 01:42:20PM +0000, Dave Stevenson wrote:
> > Hi Maxime
> >
> > On Fri, 25 Sep 2020 at 14:00, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > The FIFO between the pixelvalve and the HDMI controller runs at 2 pixels
> > > per clock cycle, and cannot deal with odd timings.
> > >
> > > Let's reject any mode with such timings.
> > >
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> Thanks for your review
>
> > It's unsupported due to the architecture rather than broken.
>
> Would you prefer s/broken/unsupported/ then?

If you needed to respin then yes, but it's not that big a deal.

  Dave
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
