Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5591E1E9923
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 18:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC6B89F9F;
	Sun, 31 May 2020 16:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5022789F9F
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 16:57:19 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id u15so1505068vkk.6
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 09:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UtxxKICt5UDp7CB33poXFWk8zp2+Y4ayXr0HmJFI4bQ=;
 b=PLN4nUBBEOBVLS6pRL3Yx97hZRg4yK890gRYrCktwYBzzIH38dTlk1XEd2UINNxVvX
 JlcAQ3g0KAupAqmAK2fxUWVLB+E9VEfFn2GDkzqM0j6ZeUS15jErpq9YmXNMAV6UMaga
 gcWYvEFOHpcsuwY/WY6asZvNW3V15KM8uaqcLhmYY7+KgWhA8nywBEyMBDStqQJZdlTG
 4lVPUYZa9Dmv8/xFa2pWCVNKcfv/7MVnkKGkIN1OxNPReZYGwxUiwRKHywrdTnga6jrJ
 61Ckg54Vv628W/OXfATOeZLSUAyA/mhIYtzhZF6/uAYmSEks0YzlDcfyvwct8/NwmxLJ
 vrxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UtxxKICt5UDp7CB33poXFWk8zp2+Y4ayXr0HmJFI4bQ=;
 b=Qs2CAuCGxT0gywbY/8EUqoL4bADUFPZreMKqHqk6xVYmhEGgmL2AVuW9t+ypU/WsXu
 I0ZpuJj+5oD1GnMKdgLHAQxk/GFTnmhF/Z45nLArBHJIWPFiQCH1o/7DCW9hdPpu+N5c
 KHI0vlac0KYRCW30QwoaGHHMfCQc+xrfDAqnQgq0ynZQOnHST0HkqzahiTF94iu73Zub
 gFaO2igPYGkIeES3FkdNals351PWlBlE/hRQizT10OwgDb2Dt27XUDMh0M3pf/aTQVzM
 0XrreTTiYaa6iNG/9HW87q79Yimae/I6l0N4zTSOK4Fr89mTk50c113POaGNU5b0w7K7
 RH2w==
X-Gm-Message-State: AOAM531hYOCrw2u57/FRYqsWe2y+T2W5ppJb/U1KKMKdG5fFDjnJMm6B
 wffLhv0gLQECJq9oBUeeIgB3jgjus3OO3e80DAI=
X-Google-Smtp-Source: ABdhPJyoBWv0q3A4WUGxrQRQ2k/XwDD/Vy9zej5thSnMvCk95qjmrjJUJ91Bf891TtRw3Yh3bHtnwzHcUHQhQFx685k=
X-Received: by 2002:a1f:ee81:: with SMTP id m123mr6732237vkh.51.1590944238450; 
 Sun, 31 May 2020 09:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
 <20200530031015.15492-23-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20200530031015.15492-23-laurent.pinchart@ideasonboard.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sun, 31 May 2020 17:54:04 +0100
Message-ID: <CACvgo50XZaOmH5RFtr-toZGrWcK72tcsQSE8aqcW+wuthECdcQ@mail.gmail.com>
Subject: Re: [PATCH v2 22/22] drm: mxsfb: Support the alpha plane
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, ML dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>, leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HI Laurent,

From a quick glance the series looks really good and neat. Then again,
I don't know much about the hardware to provide meaningful review.

A couple of small ideas below.

On Sat, 30 May 2020 at 04:11, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> +#define LCDC_AS_BUF                    0x220
> +#define LCDC_AS_NEXT_BUF               0x230

s/LCDC_AS_BUF/LCDC_AS_CUR_BUF/ - to stay consistent with the primary
plane name scheme.

Would it make sense to store the above registers in mxsfb_devdata,
just like we do for the primary planes?

HTH
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
