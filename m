Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AD14760EB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 19:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CA210F603;
	Wed, 15 Dec 2021 18:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3448310F602
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 18:42:35 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id q25so33036904oiw.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 10:42:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3OtsKeW4PGTLYhUwIW/0xDZ0rCoZLq4u4StGZiPBa7E=;
 b=V4jhePotyy1Fq0jbXvjXnz1sEIOUQc9zzUA047JUwBT6N3f+HIfmCtE6tRYUZxMBGS
 wbnp52mKrG2T6D+JjljXSovfF7zwvBDF2cGTNz4FxrxhAVGaF5aJZtsVhiJJu/XRMB9o
 FffSLuKZujRuDNPvf4h2uQ0cuRO2HLGgb74g6XoGoOK15d4myXd/8wiM/tkILP7bLqZO
 J1yUv2gD8SVH6xIG9RkSPEltZwHmGgSiaLOnuhiWVD0oRHxrievB7XdltSH40FrLZoAb
 24i1ynOaAohPAI8VKsZa1n2RcCNVNnB1SoIv/hDwlZa/u2JYEyb3GLCOqTsPG7g2Hhr7
 ttzA==
X-Gm-Message-State: AOAM5309UME+RtzTNXDsmTJe8V5pc8e0KAdchftT0lYGObgfSQ5lXlwD
 jiJ+ZlrDrjDEqGTGkmGOEQ==
X-Google-Smtp-Source: ABdhPJx1sPX5taOobDhPw0965b4z+Q5nH2DK3vahPxmFwzz1WnIT0pXUH6ue1ficuD1LEggwFjRtjw==
X-Received: by 2002:a05:6808:114f:: with SMTP id
 u15mr1117524oiu.74.1639593754429; 
 Wed, 15 Dec 2021 10:42:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v12sm571493ote.9.2021.12.15.10.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 10:42:33 -0800 (PST)
Received: (nullmailer pid 1622209 invoked by uid 1000);
 Wed, 15 Dec 2021 18:42:32 -0000
Date: Wed, 15 Dec 2021 12:42:32 -0600
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/2] Add SMBus features to Tegra I2C
Message-ID: <Ybo3GNYSZ9HLIwqj@robh.at.kernel.org>
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
 <e3deea6a-3854-e58c-0d27-602413f2a496@gmail.com>
 <YbMWPGMcHEQXGkHf@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YbMWPGMcHEQXGkHf@orome>
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
Cc: devicetree@vger.kernel.org, Akhil R <akhilrajeev@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, linaro-mm-sig@lists.linaro.org,
 andy.shevchenko@gmail.com, ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 09:56:28AM +0100, Thierry Reding wrote:
> On Thu, Dec 09, 2021 at 07:04:30PM +0300, Dmitry Osipenko wrote:
> > 09.12.2021 18:05, Akhil R пишет:
> > > Add support for SMBus Alert and SMBus block read functions to
> > > i2c-tegra driver
> > > 
> > > Akhil R (2):
> > >   dt-bindings: i2c: tegra: Add SMBus feature properties
> > >   i2c: tegra: Add SMBus block read and SMBus alert functions
> > > 
> > >  .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  4 ++
> > >  drivers/i2c/busses/i2c-tegra.c                     | 54 +++++++++++++++++++++-
> > >  2 files changed, 57 insertions(+), 1 deletion(-)
> > > 
> > 
> > How this was tested? This series must include the DT patch. If there is
> > no real user in upstream for this feature, then I don't think that we
> > should bother at all about it.
> 
> This is primarily used by a device that uses ACPI and the driver uses
> the firmware-agnostic APIs to get at this. However, it also means that
> the driver effectively provides this same support for DT via those APIs
> and therefore it makes sense to document that part even if there are no
> current users of the DT bits.

Then definitely a NAK.

> One big advantage of this is that it helps keep the ACPI and DT bindings
> in sync, and document this on the DT side also allows us to document the
> ACPI side of things where no formal documentation exists, as far as I
> know.

I have no bandwidth to review ACPI bindings and don't think the whole 
use DT bindings in ACPI is a good idea either. If someone wants this to 
be a thing, then they need to step up and review bindings.

Rob
