Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 517574C78D4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 20:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E9010E19A;
	Mon, 28 Feb 2022 19:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC5E10E19A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 19:36:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 46544B81628
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 19:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82B4C340F4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 19:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646076998;
 bh=uQg4SANC0tJU01vBVn+TzxDgIh1ds1BGQLyvH74OLKI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JmhigZUSDhZ+vHMwTgzv0oBamXBhzSJAeA3Vavjt4Qy//69c7JKo7ORpqJlQNESsW
 mzpl/VedukQsYsKkYF532OtaVmb9kgVB8hIVqKftGrBi/vHXYZ0DPnuCnsdKeLRACD
 XwojqULa2IJNeDz4V+UjYJAy8on2SJuqtteEEoshNGROulhmObqDORuAovTE7u2v03
 pIOQ7iV0evPjBIQU7clSQLG8n57kFdCnxggzhjMKXuRLZDnD5UlpZSQ8gg821EqKLl
 w0mmd1niDdEnYKHLpq+ltyFPzK9tTniIUAT6dvVxMBor11B5wG7yMO0+JwTDICQiM3
 oMf3LjZHzupRA==
Received: by mail-ej1-f50.google.com with SMTP id dr20so2260801ejc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 11:36:38 -0800 (PST)
X-Gm-Message-State: AOAM533VLM9gH+66ybJ4aSOwXPKS1mtSdC/LWYbTXSqIgfc4dheR9Ke6
 VflUF+dyVreeLu8n0kg4jcQVqefUI/fzzUFbmw==
X-Google-Smtp-Source: ABdhPJwy5V0qZqdzoWekWLIQTK+ex/E6tQfwsl/Ul2TecipRpl9pTgZCDU6AkEbHUbR6Tb1Q5X7GWm2ya30cCXWXbkw=
X-Received: by 2002:a17:906:9913:b0:6d6:dc48:5d49 with SMTP id
 zl19-20020a170906991300b006d6dc485d49mr1820180ejb.325.1646076997213; Mon, 28
 Feb 2022 11:36:37 -0800 (PST)
MIME-Version: 1.0
References: <20220124162437.2470344-1-carsten.haitzler@foss.arm.com>
 <Ye/vEilz6j8gX3wu@e110455-lin.cambridge.arm.com>
 <20220223101851.46423dcf@donnerap.cambridge.arm.com>
In-Reply-To: <20220223101851.46423dcf@donnerap.cambridge.arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 28 Feb 2022 13:36:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL5REBih_Q+q==S_RhH90Ook0pPKhpcz4910h52-AFa+g@mail.gmail.com>
Message-ID: <CAL_JsqL5REBih_Q+q==S_RhH90Ook0pPKhpcz4910h52-AFa+g@mail.gmail.com>
Subject: Re: [PATCH] drm/arm: arm hdlcd select DRM_GEM_CMA_HELPER
To: Andre Przywara <andre.przywara@arm.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, carsten.haitzler@foss.arm.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 23, 2022 at 4:19 AM Andre Przywara <andre.przywara@arm.com> wrote:
>
> On Tue, 25 Jan 2022 12:37:38 +0000
> Liviu Dudau <liviu.dudau@arm.com> wrote:
>
> Hi,
>
> > On Mon, Jan 24, 2022 at 04:24:37PM +0000, carsten.haitzler@foss.arm.com wrote:
> > > From: Carsten Haitzler <carsten.haitzler@arm.com>
> > >
> > > Without DRM_GEM_CMA_HELPER HDLCD won't build. This needs to be there too.
> > >
> > > Fixes: 09717af7d13d ("drm: Remove CONFIG_DRM_KMS_CMA_HELPER option")
> > >
> > > Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
> >
> > Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> >
> > I will add Steven's reviewed-by as well when pushing it.
>
> Did this go anywhere? I see my .config just selecting HDLCD still failing
> with -rc5. Any chance this can be taken now, as this is a regression
> introduced with -rc1?

I thought Liviu was going to, but in any case I've now pushed it to
drm-misc-fixes.

Rob
