Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAE11EBEA8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 17:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDE36E409;
	Tue,  2 Jun 2020 15:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671C76E409
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 15:02:46 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r9so3265478wmh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 08:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ie4XwPUUWuHUs6FpQc71seJRalOxPBnrHjEeZHur870=;
 b=rcV8xvqQ9pPbeXXUaiQ/IjScOQcZmPZgnBs587oPVmCd3+x1Ol79xSWBWAkedejyog
 avM37VtRjXAmg1llx2WbnE0Bc2LRYohlI/hp6EaqXOo5OlFJ6HREm4XxCFvpA3MYRoeE
 4v4sIWbUUqGgKydRX315TGSREnqTA8r57cXrvVxcWngHLMpdtFVSiuCKeaWv+2IG8Jk3
 FyA2tUj1kGPE99oxoNNjsIPXVPxdUShKlY5qjAiV4ZR5Ug6LI0ay8NpiPNSHr3VTuk4n
 iCBZEeEYjuryK4ouCKVKYCfPkxG4uUHEYu67H+aEf1AFloavvIhZVSzJtXN+0E/wH7Wv
 MjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ie4XwPUUWuHUs6FpQc71seJRalOxPBnrHjEeZHur870=;
 b=iHGogjkolXu0HXd6P/XW5cgZnku371qgdxi5cHq36hkINEl80M6EC5oh40lpOMmrNb
 hlbxwQycZMlQ51r9L/y1hPnuBVxX0m04wP3pCVS9ZFq0jFUX/cmZ+od8UoBc0HQUa9Mi
 WbJ+bndyGPP16QG5G67eXaWafOhb7Sr7RTiz4WNr401XrhgvFpqhSJK72xhWtHCGEh4d
 ECEoWTXWK04aT6Y6BFPAW95cYLqGJWm0ulyddHPwQmh5SSgSPbG4KwYyiuVSpZXtWCFJ
 reT1F95waVaD8CWgTqAbp2Ak/hvOCqyl5sEGb7Fyont5/ZWxuSd0o2YJWe5HIFjpup8E
 vNCg==
X-Gm-Message-State: AOAM532+JGUlxuvXv98jpmbALiljbRh6oMwmQUZHcE4fqXtXSCeywbkC
 M3W2m9r2/afhnfC1TmQSyvZv7tpE3wULaEWIWkOYGg==
X-Google-Smtp-Source: ABdhPJw+qlivYu2F8CIkQRiCrVBEGIQXfJye4OGlUJ/N4SBalG1P/TzpCkBTffuFw04vbpL4M63++mj+iMJssStM1iQ=
X-Received: by 2002:a7b:c186:: with SMTP id y6mr4835128wmi.82.1591110165044;
 Tue, 02 Jun 2020 08:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <d2c1850e38e14f3def4c0307240e6826e296c14b.1590594512.git-series.maxime@cerno.tech>
 <CADaigPU7c=1u47R9GzvGCH_Z2fywY1foGYEy=KbBikjUQpwUFg@mail.gmail.com>
 <20200602141228.7zbkob7bw3owajsq@gilmour>
In-Reply-To: <20200602141228.7zbkob7bw3owajsq@gilmour>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 2 Jun 2020 16:02:28 +0100
Message-ID: <CAPY8ntDZWJeu14mL5a0jqUWHFOEWm2OOBBkh4yjjP0oLU83UCQ@mail.gmail.com>
Subject: Re: [PATCH v3 032/105] drm/vc4: crtc: Enable and disable the PV in
 atomic_enable / disable
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime and Eric

On Tue, 2 Jun 2020 at 15:12, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Eric
>
> On Wed, May 27, 2020 at 09:54:44AM -0700, Eric Anholt wrote:
> > On Wed, May 27, 2020 at 8:50 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > The VIDEN bit in the pixelvalve currently being used to enable or disable
> > > the pixelvalve seems to not be enough in some situations, which whill end
> > > up with the pixelvalve stalling.
> > >
> > > In such a case, even re-enabling VIDEN doesn't bring it back and we need to
> > > clear the FIFO. This can only be done if the pixelvalve is disabled though.
> > >
> > > In order to overcome this, we can configure the pixelvalve during
> > > mode_set_no_fb, but only enable it in atomic_enable and flush the FIFO
> > > there, and in atomic_disable disable the pixelvalve again.
> >
> > What displays has this been tested with?  Getting this sequencing
> > right is so painful, and things like DSI are tricky to get to light
> > up.
>
> That FIFO is between the HVS and the HDMI PVs, so this was obviously
> tested against that. Dave also tested the DSI output IIRC, so we should
> be covered here.

DSI wasn't working on the first patch set that Maxime sent - I haven't
tested this one as yet but will do so.
DPI was working early on to both an Adafruit 800x480 DPI panel, and
via a VGA666 as VGA.
HDMI is obviously working.
VEC is being ignored now. The clock structure is more restricted than
earlier chips, so to get the required clocks for the VEC without using
fractional divides it compromises the clock that other parts of the
system can run at (IIRC including the ARM). That's why the VEC has to
be explicitly enabled for the firmware to enable it as the only
output. It's annoying, but that's just a restriction of the chip.

  Dave
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
