Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E50C28884B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 14:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC506ECC6;
	Fri,  9 Oct 2020 12:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2476ECC6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 12:07:33 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id e2so9625060wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 05:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WPANr4oNlpaJ0WmcVDisYkIq8optqfuiCb1+0MP+tuo=;
 b=FKk92mpAnCeruU4/yKQxW1zJYANrAxzyoq+2WJGj+GSIpAsdNlI4MfdXDaa8taGkgS
 9yUlR5Uzsx6G4gfyPjUlgfNgkq7F/5IkHegAen9l+msCloWREsVr/O6zZeJ278XzJZlH
 IMe1HUHfL6wJ2+7i9V6xFRnUAwodUSWaZwx9EwUV5wmyqoivAkTBD+MAcPzr/5PrYfLs
 DlmY3gsINkkSw8gNPHbkv//NwsQV/eNd8NVozUK6ledZLjAWYO/iSI5qr38CVrNYujid
 rLlCGfgrJrwyacCJBAE9iw6M3oJVWsr2aOIuK3zzcYuBfA35PhdX3Ts3CX1UaKz/rgu0
 IPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WPANr4oNlpaJ0WmcVDisYkIq8optqfuiCb1+0MP+tuo=;
 b=pLtqWBVYxtkbOQ0IsShR18DafC5vrky2dufZcAQGqOxOF9hFTZ/0OOERCJev4vHjPd
 eTPReFjr9MeyEaFtMKw+fdW5InHHsLFY90BUw3kOyfxhbuYR99H3DA33C7j0XkbJEHYe
 3lUdmt1V7K/K12h/3qBMOl0M9GyaKVljtKa63CTsFzUTE4ywEnOmet5rzRkwIum8bELl
 VuCIV9MH/zAHhsAqGEEPTZ/LYtG5/fLDcvInInhKkrHfsDUCkF+RiQysw9+qWpM2kHlt
 hCE+iagu+gEua8LggCyNLQRaM6BPSnVl0H9EFa9OgedLrJdvfo42Zkj8TTbSjGojg5U4
 Rt5Q==
X-Gm-Message-State: AOAM532s6a7YX4n2ha3SVWhKZ2TMvyeSSBeul2YUTTHN05DwHTpVCI/C
 UEvQS0Boi/GIMZW0SzbIt/WfZE3aLAF7F7M6z7L2xA==
X-Google-Smtp-Source: ABdhPJwD42jNcHDujEJZiBu4g5tnOKgEX4qzK3EQMcjAxYun9OYH/8Nu2igC21YQ5/8VHSJtHHweAZR3rQYxJ5Ph7ns=
X-Received: by 2002:a05:600c:2707:: with SMTP id
 7mr14232636wmm.147.1602245252041; 
 Fri, 09 Oct 2020 05:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
In-Reply-To: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 9 Oct 2020 13:07:20 +0100
Message-ID: <CAPj87rM3H+kNzMgw1B00iDzH94gZPoLfr17KrAAiCXuUB2VHKA@mail.gmail.com>
Subject: Re: [PATCH] drm: document that user-space should avoid parsing EDIDs
To: Simon Ser <contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 9 Oct 2020 at 10:24, Simon Ser <contact@emersion.fr> wrote:
> User-space should avoid parsing EDIDs for metadata already exposed via
> other KMS interfaces and properties. For instance, user-space should not
> try to extract a list of modes from the EDID: the kernel might mutate
> the mode list (because of link capabilities or quirks for instance).
>
> Other metadata not exposed by KMS can be parsed by user-space. This
> includes for instance monitor identification (make/model/serial) and
> supported color-spaces.

So I take it the only way to get modes is through the connector's list
of modes. That sounds reasonable enough to me, but I think to properly
handle colour (e.g. CEA modes have different behaviour for
limited/full range depending on which VIC they correspond to IIRC)
we'd need to take more bits out of drm_mode_modeinfo::flags, which is
unfortunate since there aren't that many of them left and it's not an
extensible structure. Maybe proper mode handling is going to require
an expanded mode structure, but today is not that day, so:
Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
