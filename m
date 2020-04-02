Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8506819BFB9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 12:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E7C6EA49;
	Thu,  2 Apr 2020 10:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4246EA49
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 10:57:06 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z14so6633700wmf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 03:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vBV0Allu6iOSmBCmW0uF3n1umxXRMetPcUSnAXweDa8=;
 b=ACdefVov4fLCo65LI5CXw33T60GoIon+IEpAvx5obPLg0SKcGSdwykc6Ud8W4Ljx3c
 yCZxIJXRoXtrfNJyB0VFvJQVPmwJ5+nvn2HD9qr1ZRibml4oyQTBhDYMEkqBqH+o9nzr
 nlnBgyycpUZjjTIbmqGpn+/bfvk/0YKd2VuwUuQUhIbElvx0vjkk1XV/B76C4EEz8Ium
 9rAz1d1Pz7+KmK9cpMV8t/GDFxa9M1qhaekZzLjN//+tnNW6d8YFo5MfxN+lBIYMKU05
 hJjO59hDfGKWmqEk2ZhrMgg2F9bXstfFTr4vtTRXmo9buzohrWmJu3GpqFkRHjiX24BM
 7CdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vBV0Allu6iOSmBCmW0uF3n1umxXRMetPcUSnAXweDa8=;
 b=f/6jIVLJCGheSFIASnRVwPhEAu+4UgYT88oMmOVV41uq73T/d54AHeGREhsrmbKrbv
 Le6AXXwLtb9huBdahRzghh3i8K+75xWx442F+IJXQnmm+GgmmEQWvS4dXrEGVHI9L2lJ
 4kDgal/dETSEsDQP5S+hVIiehCVayH7v8UsAB+NPYtfHzMfb23hHg8EVS0qvjbtw8Om8
 PVBFKqjAvqnJCwwWzrbqtiLS9lRKBCYDUOivlegVyOqfndErpH3XS1pufZNrp1CEpV64
 a5xUMnN8jPA3317sTg1syOBu9hUozuoGOgM5VqETuA984qu5u3q1x2jxsvj9kU2+NEAg
 lm8A==
X-Gm-Message-State: AGi0PuYV6jYQAvQ5CuwGp3NZcRfwQZfikyWPKoQJsadmxsvvyyUTOVSL
 XlNto99m0RUdjeNzXvo7aw2UX30eQqwuVUGDm+NEmws3YqI=
X-Google-Smtp-Source: APiQypJVohSVs9ODDtnBmhJg7XQtAXvVAtRnokgwil1qw7juc+svxCq/b7AIeTlx7L1lZAvoVZMejcXgxithSmsa5S0=
X-Received: by 2002:a1c:1d17:: with SMTP id d23mr2933273wmd.147.1585825025001; 
 Thu, 02 Apr 2020 03:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200402104035.13497-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200402104035.13497-1-laurent.pinchart+renesas@ideasonboard.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 2 Apr 2020 11:56:01 +0100
Message-ID: <CAPj87rMCf0qv0mQxKRZZLzhJ3HBG92MdABKM5JJx8KarG_M3DQ@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Create immutable zpos property for primary
 planes
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Apr 2020 at 11:40, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The R-Car DU driver creates a zpos property, ranging from 1 to 7, for
> all the overlay planes, but leaves the primary plane without a zpos
> property. The DRM/KMS API doesn't clearly specify if this is acceptable,
> of it the property is mandatory for all planes when exposed for some of
> the planes. Nonetheless, weston v8.0 has been reported to have trouble
> handling this situation.

Yeah. It didn't even occur to me/us that someone would do that, to be
honest. We need to have zpos information for all planes that we're
using in order for zpos to be at all meaningful, and we can't exactly
avoid using the primary plane. Without knowing the primary plane's
zpos, we can't know if the overlays are actually overlays or in fact
underlays.

> The DRM core offers support for immutable zpos properties. Creating an
> immutable zpos property set to 0 for the primary planes seems to be a
> good way forward, as it shouldn't introduce any regression, and can fix
> the issue. Do so.

Perfect. We support immutable properties entirely well, we just need
to know about them.

> Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
