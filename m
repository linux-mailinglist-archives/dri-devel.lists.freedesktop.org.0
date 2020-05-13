Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE211D0BBD
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBC16E134;
	Wed, 13 May 2020 09:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5366E134
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 09:18:07 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id x136so9650973vsx.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 02:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7zl3A/MaxL7nCBUTZMcCY1t2cl4EkBQrlf8JzlzEFA8=;
 b=i+YQX40FXZGW/sO82YTRCLHcnqv20di0Bt2fRRzmFwqG2HTwwnECknlnmoZCRZlVH6
 zij/YYzOjDMMMyYud9eosetCeXEf77hIFyhDfeiAwR2NVK1s2CN9tgfvaQyAbbd1ZffT
 U2OSIasuhRxNvGcZvwlUmd0iPsUW+OcXUsNcvsUbTtprpA/0PK1NxaFWGaVVyKD4jsxK
 hX2oprQwc2RWRsQuLeK+xzgh26c/33ABGJzOXz0TYW1Mb3qV6cXT1JBuI73Y/CcvZru8
 dkbbIhrAjw5vESwlzrYbNlyD3xoXJ4d2g1kVAmjiBqmd0hTKs4Mi1jean4P0/D3jxiAX
 PMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7zl3A/MaxL7nCBUTZMcCY1t2cl4EkBQrlf8JzlzEFA8=;
 b=C65crgeo7bD/TYjwE2fUpUbftZrDOGkwfTLIcCosHFZUKJUv6piR71r9Va3nWjpM/W
 03AG2JmDqMsi5hkhNkfYRCIOU5NYqDOazY0C2uXfyppPXz6+SujYQtVzzPi7YvQVe+9T
 AvwmchUdyoZI3USUQI/f+FWpqbaZXOe7GYHmRo3TQnEE+jPUf9qrPXYCtTky0PpiKjtG
 GMJeHjV9EMK36spMxvCOQoywHgCwhukMh0pp/ORJZT9kv7116hRRcxBX5O5/k6Fic9le
 CtEo8jKZkXGx//dKzutbNA7BB/lPInlLdNdZC6LoBQ1ktNIPHwJjxbCQUfjqhQlscrB4
 dhcQ==
X-Gm-Message-State: AGi0PuZEh/hlZ4z1SfSVsRqtBHOnxAl+apfL8LJlzCERWuWB5OrDRlD9
 rwiRkM3Gtt/Opz9JP2SrLwJzgJlkJeqS7XGuErw=
X-Google-Smtp-Source: APiQypI2atMZjgtMXg6UWJiAd5Jvu3quup/vgFE4ujcx6TOh7EfhmdXsbOsMMQED8noVIMbECqlSUNwQJTHivPCa6MA=
X-Received: by 2002:a67:de0a:: with SMTP id q10mr20875092vsk.138.1589361486356; 
 Wed, 13 May 2020 02:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200512084258.12673-1-tzimmermann@suse.de>
 <20200512084258.12673-13-tzimmermann@suse.de>
 <CACvgo522zu525bZX=s=h1AeTAFbbAVsWtFLwgt=i0uBORb-oVw@mail.gmail.com>
 <a2cc8ef0-f519-39ae-ea7f-52ff10e79d6a@suse.de>
In-Reply-To: <a2cc8ef0-f519-39ae-ea7f-52ff10e79d6a@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 13 May 2020 10:15:25 +0100
Message-ID: <CACvgo51iCz2d+P=CSvcAzD+DvygTVJkEfuB6-A=0uH5+9B5z_g@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] drm/mgag200: Remove out-commented suspend/resume
 helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: john.p.donnelly@oracle.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 May 2020 at 19:47, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 12.05.20 um 12:14 schrieb Emil Velikov:
> > Hi Thomas,
> >
> > On Tue, 12 May 2020 at 09:43, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>
> >> The suspend/resume helpers are unused. Also remove associated state
> >> from struct mga_device.
> >>
> > Although DPMS in it's traditional sense is no longer a thing, would it
> > make sense to keep this around for documentation purposes?
> > In particular, the pci magic and associated PLL/DAC/pixel clock could
> > be used for dynamic PM.
>
> That patch is not about DPMS. The DPMS code is still there. The
> suspend/resume helpers were outcommented and I don't know if they ever
> worked. Let's remove them.
>
Seems like the idea is to suspend/resume the device on DPMS off/on. A
rather moot point IMHO.
As the DPMS semantics and the whole modeset, got more subtle with
atomic modeset, the idea gets even more moot.

If the documentation has that process - sure nuke it. Although for
dynPM, this code is essential.
Considering a) one has interest in dynPM and b) the code is (close to) working.

The last two are very big ifs so I'll leave it there.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
