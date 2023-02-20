Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B52369D125
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 17:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB21B10E6DB;
	Mon, 20 Feb 2023 16:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94A110E6D2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 16:12:40 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id b20so1008009vsq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 08:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N9YDKDe6epatxZ1gr6OFmh5K4jyPdIZ9lMQgdMDcCrE=;
 b=Y5KdMem7l3pO2lrxR4UtCOuCA7Rrt35FiqDPo288m31B+ETIrr4Sjf1QJASJQy9JSd
 O8DCgKbgT0TgDgy9YYRoELxCH3pxrS7bLMIpgIJN/K6p2b7wzieKsMsI2Ol1dhTtgi1J
 R+vFIwhI7nzn3nl/Z6AKPySs9TxEExMBBGr3neLCUnJIFk2pshU5IdtPUmWVyJIRUWKh
 a4PRT14n+5Uwbz74ssP9MWrzRJVGvMH2t970vs3ulgFKn1pOQEyOz23kWqk+SP5X6xIo
 dhlBmKBSN9DP5jVjgoSrnjz6oj+umU0D8yPcFv1HNGmmQ7t9cBN0AtR4N1DIbujbe+sJ
 djlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N9YDKDe6epatxZ1gr6OFmh5K4jyPdIZ9lMQgdMDcCrE=;
 b=jjvade+tb1vHGuQnT94PEwT/bU5I/2rMHSFoRakmDrKca4MnLZ99QBa3Yx9rVAvOCr
 iujHwhVozmbVG4A0f5eEHyBF8dIcM/MtbmRX2hPPvBVVkZdK53dk6jW7aVKZdcGO+jUa
 fOrSeLF0gzxpXMlcWK9zTEu7FsnQTYK92/fo4f9tDbrezrlKVDer7AUlMYAQIiHsW55K
 OMctyDPwt8BGOCrGFGgvrE7T4OllAI1sXm2tlt9BYlLQ9pir3K2r7S738Td+OFbtgowZ
 c3C9Ij2+MsDaNbn042MX1FfLlGKkRklDyJYTy+V5bTpQbepAZcgPRAVjljvZ7itqKzB/
 yifw==
X-Gm-Message-State: AO0yUKUsBzGF2824BpAwxqAyH9LbZjadvwkJmM31v5Xjwv1IGRxHQxOQ
 hYvdZUB6UKF0GhRKTcMxqvHysfJQs+4Kczj8dX9o6g==
X-Google-Smtp-Source: AK7set8ijofQtS2ile7oLHr4uO6YdkT5a6MLL++v4ScMeHXIIQ7WaWAnvEcl7XhhE8TzNrr13OpeQYFR7rZR8QWCSMo=
X-Received: by 2002:a05:6102:5088:b0:412:6281:6a38 with SMTP id
 bl8-20020a056102508800b0041262816a38mr297978vsb.48.1676909559653; Mon, 20 Feb
 2023 08:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20230216130934.156541-1-contact@emersion.fr>
 <CAPY8ntBxsKgoaExW8BhbK8Z1VPY=BPGYdJ_r-K5gYhUwWr32Cw@mail.gmail.com>
 <EGf3SwlCai-KQHKYsrE0eaRVmSbbPyFQby1v29Cdpt9OYJdcipDQTF_WCl3F_PFvnno4zia_ObMH6pAnxZqCBlqFQapbpc7jxTlAYKzqiFU=@emersion.fr>
In-Reply-To: <EGf3SwlCai-KQHKYsrE0eaRVmSbbPyFQby1v29Cdpt9OYJdcipDQTF_WCl3F_PFvnno4zia_ObMH6pAnxZqCBlqFQapbpc7jxTlAYKzqiFU=@emersion.fr>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 20 Feb 2023 16:12:24 +0000
Message-ID: <CAPY8ntBdb4Tqo-rnxA+WTcuGvPvnih8a4QE+J2z5cAigcVa6qg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: document DRM_IOCTL_PRIME_HANDLE_TO_FD and
 PRIME_FD_TO_HANDLE
To: Simon Ser <contact@emersion.fr>
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Feb 2023 at 15:57, Simon Ser <contact@emersion.fr> wrote:
>
> On Monday, February 20th, 2023 at 16:49, Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
>
> > > + * User-space sets &drm_prime_handle.fd with a DMA-BUF file descriptor to
> > > + * import, and gets back a GEM handle in &drm_prime_handle.handle.
> > > + * &drm_prime_handle.flags is unused.
> >
> > Is it worth explicitly stating that the handle would be released via
> > DRM_IOCTL_GEM_CLOSE? I've had userspace developers query how to
> > release imported handles in the past.
>
> v2 spells this out I think.

It does - thanks.
I was reading back through my emails from Friday and the weekend, and
hadn't noticed v2 :-/ Sorry for the noise.

  Dave
