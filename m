Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975A11E5984
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA826E459;
	Thu, 28 May 2020 07:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A313589101
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 10:46:30 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id a18so6230869ilp.7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 03:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jV5qqlg6B+ZoGgVeaw+flUZDliIqHLZTV9SrChni80o=;
 b=mlA8n5ltaxaXU5Jzq9gQDdiAdLm7WHNtzEPDDmBFHHI5aY7Pd0ha50AJnDMF9b5/Xm
 Z2ZZRZAcqCMtYbCKXy3nceVZD3RnzhXQfF+FLoOHKH8bFRYpXfHoR4oHaf9m4htN+X4B
 kHOeUbi0Es6U1y5RBtZATXe0Vo/gA2fGm6nOOsrDYa+k5mwPj63ViOoY1u9rdK/cGq+8
 TNYJXlgXwwoTT32s8D0Fll3n5Ele44yw479wCHp13y6U/wV9kEPFVAgD6FH+dQ8sbV4q
 7hsp0Qisu5/+NRQsczixdYHaJcgLXXiFIaskLiZHmpQiPYObZI0OhYc25SDBa5uqdRto
 J8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jV5qqlg6B+ZoGgVeaw+flUZDliIqHLZTV9SrChni80o=;
 b=WtwkZSKfLTgIV7IYvdTapb1sAgbDRFHkSzLEL2eQL/KyNnZoXyqBlWo4pM/5c4hPLO
 mIW+iKZHutqc4EofZjM518a6s1omeRk1ZL3QT7MYaXUbi3VGTXsSA513ZA2AYmnYzeyq
 a4/o2bDxaCm2rixiJQsVtKuhrBs8T59VNOPqnhdUgoLwoxOBZOkI9ZRbRFHN1bWUWrMw
 PKDBWOsTHe3RwhbPMFuZa9X8nECJjNrftbX7ntm2w00F6URrcCva/Jqh3ppYk6VkOoSd
 kGkOu9StqWDJ5Z/YKhSclu1BOicBjSbizy+sp7jthRYt5S5SUMDAv+t1dV0bS5nHiCr+
 UyjQ==
X-Gm-Message-State: AOAM533dRjwyqOXp+ho9caagO/wymgMegeq+6ZykBqL20vohkaJQ7TmW
 2LIo16068IiAtziNKNdwuoXnIGshVrUYon4AGgM=
X-Google-Smtp-Source: ABdhPJxI8DmrhVOnjKvhDVgxWJ8+FIMyXLu/ryLZET7ClD2+54nQb9OTeBYG7x2X1lNxLOkc/LfdMlqtuwE8cn4F3ds=
X-Received: by 2002:a92:dc85:: with SMTP id c5mr4964053iln.270.1590576390035; 
 Wed, 27 May 2020 03:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
 <1590564453-24499-9-git-send-email-dillon.minfei@gmail.com>
 <20200527095109.GA5308@sirena.org.uk>
In-Reply-To: <20200527095109.GA5308@sirena.org.uk>
From: dillon min <dillon.minfei@gmail.com>
Date: Wed, 27 May 2020 18:45:53 +0800
Message-ID: <CAL9mu0JA=XRTj_HONQGtj74X05TAV0__dW2At0AAeymwNvJhEw@mail.gmail.com>
Subject: Re: [PATCH v6 8/9] spi: stm32: Add 'SPI_SIMPLEX_RX', 'SPI_3WIRE_RX'
 support for stm32f4
To: Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Hua Dillon <dillonhua@gmail.com>,
 linux-clk <linux-clk@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 thierry.reding@gmail.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 5:51 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, May 27, 2020 at 03:27:32PM +0800, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > in l3gd20 driver startup, there is a setup failed error return from
> > stm32 spi driver
>
> Please do not submit new versions of already applied patches, please
> submit incremental updates to the existing code.  Modifying existing
> commits creates problems for other users building on top of those
> commits so it's best practice to only change pubished git commits if
> absolutely essential.

Hi Mark,

sorry, forget to remove these two patch from this submits, will not
include it in later submits
which ack other's review result.

thanks.

best regards

Dillon,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
