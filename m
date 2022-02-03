Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA9E4A831E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 12:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E33310F219;
	Thu,  3 Feb 2022 11:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C15B10F219
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 11:29:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 92ADA61651
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 11:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C1BC36AE2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 11:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643887765;
 bh=8O9T7JmkE8AXDR3qQnEgCe/VXdmEMAvfBxnpPNQJxN0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nyIoXkt3yDlGi6V+mFTwFjWtCJ1qhppOXzJeGQ0zaUBdBqy707RByZCUu8nH2qc0T
 gskXco++UZSS/9OrUPwE+cCF/2wit5SGjWfHBx4Ko4IdAQNLgI4/RRjSxAlOp/4zpU
 0vPrr0XBesTRIJYMH8U2Jmt0KQl91wu4lIvOWHoLRmI7pxxXqVwhJIMw6dY6WmF5Jg
 8qgc5poMtTkUs03bSx6PoTs+64D6q4ciRddKvA7JLEUXe9c7kmoSyZmgm42mVyJ4V4
 98NFsP/5M1uJGoHFugdSywIKYrfna0BWTwO6Gy5XFpaEH2cB1G+ch+YaGAho/rrfSd
 yxGuO7kui/uLA==
Received: by mail-pg1-f180.google.com with SMTP id g20so2023413pgn.10
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 03:29:25 -0800 (PST)
X-Gm-Message-State: AOAM531/ODMoWJBwxZcZlWtq8M6ZYImYxvpv+8tVAKv/03cMKKUaFgdA
 FArlaRJxM4mLux7iM9lb7sbDokbx4BDMCQBJoNY=
X-Google-Smtp-Source: ABdhPJwoFuDj2HLj9lqRkYYZvnAwBed7td2ZuLF3KmfMMGpv5YNS6lWDbYq2E79fj85vH3vrNIbVtmvMaaoFHYgLh58=
X-Received: by 2002:a05:6a00:2343:: with SMTP id
 j3mr33414155pfj.7.1643887764872; 
 Thu, 03 Feb 2022 03:29:24 -0800 (PST)
MIME-Version: 1.0
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <CAJKOXPfCjx6UoLK6LgXBZCfixxq8k7E-RFXb8i-chyXc39WEoQ@mail.gmail.com>
 <20220203110751.GE1978@kadam>
In-Reply-To: <20220203110751.GE1978@kadam>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 3 Feb 2022 12:29:11 +0100
X-Gmail-Original-Message-ID: <CAJKOXPeLS+PZBCvEOeazc8N5w1D=WeO_D45yEazu-XQQeHNohQ@mail.gmail.com>
Message-ID: <CAJKOXPeLS+PZBCvEOeazc8N5w1D=WeO_D45yEazu-XQQeHNohQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 Randy Dunlap <rdunlap@infradead.org>, Roland Scheidegger <sroland@vmware.com>,
 linux-mips@vger.kernel.org, Sui Jingfeng <15330273260@189.cn>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Feb 2022 at 12:08, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, Feb 03, 2022 at 09:53:35AM +0100, Krzysztof Kozlowski wrote:
> > > diff --git a/drivers/gpu/drm/lsdc/lsdc_connector.c b/drivers/gpu/drm/lsdc/lsdc_connector.c
> > > new file mode 100644
> > > index 000000000000..ae5fc0c90961
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/lsdc/lsdc_connector.c
> > > @@ -0,0 +1,443 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright 2020 Loongson Corporation
> > > + *
> > > + * Permission is hereby granted, free of charge, to any person obtaining a
> > > + * copy of this software and associated documentation files (the
> > > + * "Software"), to deal in the Software without restriction, including
> > > + * without limitation the rights to use, copy, modify, merge, publish,
> > > + * distribute, sub license, and/or sell copies of the Software, and to
> > > + * permit persons to whom the Software is furnished to do so, subject to
> > > + * the following conditions:
> > > + *
> > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > > + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> > > + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
> > > + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> > > + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> > > + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> > > + *
> > > + * The above copyright notice and this permission notice (including the
> > > + * next paragraph) shall be included in all copies or substantial portions
> > > + * of the Software.
> >
> > This does not look like compliant with GPL-2.0. You cannot call a
> > license GPL-2.0 and restrict it with some other provisions.
>
> That's the MIT license.  It's not the GPL-2.0 license but it is
> compliant.

It's compliant when included as "OR" for example in SPDX tag. The
current solution - SPDX and MIT license text - is not the proper way
to describe this. Otherwise one could argue that both licenses apply
at the same time and one has to fulfill both of them, which is
ridiculous. There is a SPDX tag for the proper case - GPL or MIT.

Best regards,
Krzysztof
