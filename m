Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C980E228174
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 15:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AB189D40;
	Tue, 21 Jul 2020 13:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F1389D5B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 13:59:07 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ECFB920771
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 13:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595339947;
 bh=gLckNsYh14wN8V0/tcKaLTFBild0sZAw45voTSmhvnw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X9FxBf1QQ/oRk1mNPAyeO6jF+3lE+IB1LXHzTVIG1Y3gHqr4T87aUHi3/B5wUUYUx
 LCFfGHdLluRywW6enRh3hoM8ZsJABI8agN6cDj6PHYtbPUHCEbdZEmw0hIRtLQDYZD
 E8f/sj5KP6gkVPp4357w2H7EDd48e+QHvQ8oiaBQ=
Received: by mail-oo1-f46.google.com with SMTP id t12so3933009ooc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 06:59:06 -0700 (PDT)
X-Gm-Message-State: AOAM532UBbFhWlCy8QH3qFb5nUivRi6RsIkkTWgMyWee8X8MPBj7sPmX
 Tm7B/1AyDha4hwd9hNEyL2AinS7syYQnrAI8UA==
X-Google-Smtp-Source: ABdhPJyYjl7WVU3V2AZbMxJnFr515YDrcWIxW4LtJAK9t6VjPhcMM208pWMsNHcf/mD8rUfmCCGlIjSTOP3WGaGGS84=
X-Received: by 2002:a05:6820:1015:: with SMTP id
 v21mr23488832oor.50.1595339946333; 
 Tue, 21 Jul 2020 06:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200714071305.18492-1-wens@kernel.org>
 <20200714071305.18492-2-wens@kernel.org>
 <20200721021026.GA3382460@bogus> <20200721092333.yr3wwmrxwz5rvpam@gilmour.lan>
In-Reply-To: <20200721092333.yr3wwmrxwz5rvpam@gilmour.lan>
From: Rob Herring <robh@kernel.org>
Date: Tue, 21 Jul 2020 07:58:52 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+=vOxCLNPwgj3yjphh4RpcXu9_0fW3QWL2+XGZQhChMw@mail.gmail.com>
Message-ID: <CAL_Jsq+=vOxCLNPwgj3yjphh4RpcXu9_0fW3QWL2+XGZQhChMw@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel-dpi: Add bits-per-color
 property
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
Cc: devicetree@vger.kernel.org, Siarhei Siamashka <siarhei.siamashka@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 Chen-Yu Tsai <wens@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 3:23 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Jul 20, 2020 at 08:10:26PM -0600, Rob Herring wrote:
> > On Tue, Jul 14, 2020 at 03:13:01PM +0800, Chen-Yu Tsai wrote:
> > > From: Chen-Yu Tsai <wens@csie.org>
> > >
> > > Some LCD panels do not support 24-bit true color, or 8bits per channel
> > > RGB. Many low end ones only support up to 6 bits per channel natively.
> >
> > This should be implied by the panel's compatible property.
>
> I'm not sure it should, or at least it's not sufficient. Some panels
> while 24 bits capable might only have the higher bits connected to save
> off a couple of pins per color, in which case we should probably
> describe that somehow.

That's the bus/interface format which the 2nd paragraph said this was
not for. If it was, then just bits per component is not enough.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
