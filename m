Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FF14F1914
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 18:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C12510E190;
	Mon,  4 Apr 2022 16:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0662210E190
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 16:01:02 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-df22f50e0cso11211579fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 09:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=In5a/h4LjF5DkhmvQ6XqBzMYlDlycGFoe94+GhEprOk=;
 b=llLdaEjQlrzN7n9ODs4G9LkkeBRkKEqsfNK1bgy927LjBTeH+CReA5IT+QY4Asl1PL
 s/KCZMqK+TtILycg/zb14a1RlBiv4NhGPbxbJgHsSkI5HCR6+ACM3OSKHWZO5J+mjJFf
 UjrA6ZUQUT1ii7YMBK4b7pUrHRxeaOHkB0xyv3eCQXlw/wy4leiN7m5XFaz7SWVzTDem
 qSMkvk0Mn1DfCEAcka+5RSrA0zqtNVHEFeYpn6ZAXn6QT0eC4R8hKhbvu+p6PdPtYyq0
 VBT3aBxCZqWhhNSh6/H0F3ZVBM75OHnWXA4L4XdERcM12q2DCpw5y1LuioXeduyh7g8w
 EQFA==
X-Gm-Message-State: AOAM530N5h7mq5DmgnUxv9AMVSmZbr7iMfrxdTFYe6AkYVGJG7LDoVMN
 wX/AZDCsMA36wzqGxEkpbw==
X-Google-Smtp-Source: ABdhPJzLlngGRDK82Z/wQKGO1S8eEHE0KD2iiRawkQWiu4y3HOSYqt42l8QOgQ/7NQ17IiDJaFwp0w==
X-Received: by 2002:a05:6870:b39a:b0:da:b3f:2b6c with SMTP id
 w26-20020a056870b39a00b000da0b3f2b6cmr11130435oap.267.1649088062027; 
 Mon, 04 Apr 2022 09:01:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 os4-20020a0568707d0400b000e1e6ddcddbsm2220829oab.4.2022.04.04.09.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 09:01:01 -0700 (PDT)
Received: (nullmailer pid 1422687 invoked by uid 1000);
 Mon, 04 Apr 2022 16:01:00 -0000
Date: Mon, 4 Apr 2022 11:01:00 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RFC][PATCH 2/3] drm/modes: Make width-mm/height-mm mandatory in
 of_get_drm_panel_display_mode()
Message-ID: <YksWPK6ukLGAUTUo@robh.at.kernel.org>
References: <20220401163755.302548-1-marex@denx.de>
 <20220401163755.302548-2-marex@denx.de>
 <YkdImJRIRkaqeGDl@pendragon.ideasonboard.com>
 <efaa195a-bbdc-ca24-eccc-271995dfd27f@denx.de>
 <YkfAtkOtaWksnrlH@pendragon.ideasonboard.com>
 <a8b45b0a-b458-f9dd-c983-6ef4ec175432@denx.de>
 <d16332a6-63cc-8fa6-91f2-59064ce333f1@tronnes.org>
 <d230da1b-2649-2f8d-680b-015e9044540e@denx.de>
 <35a66df7-5619-cb10-620e-008adb64f2d7@tronnes.org>
 <92a5854f-0dc0-8bb9-0607-549d52822af1@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92a5854f-0dc0-8bb9-0607-549d52822af1@denx.de>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 02, 2022 at 07:55:59PM +0200, Marek Vasut wrote:
> On 4/2/22 19:08, Noralf Trønnes wrote:
> > 
> > 
> > Den 02.04.2022 18.39, skrev Marek Vasut:
> > > On 4/2/22 09:45, Noralf Trønnes wrote:
> > > > 
> > > > 
> > > > Den 02.04.2022 06.28, skrev Marek Vasut:
> > > > > On 4/2/22 05:19, Laurent Pinchart wrote:
> > > > > > On Fri, Apr 01, 2022 at 10:36:24PM +0200, Marek Vasut wrote:
> > > > > > > On 4/1/22 20:46, Laurent Pinchart wrote:
> > > > > > > > On Fri, Apr 01, 2022 at 06:37:54PM +0200, Marek Vasut wrote:
> > > > > > > > > Make the width-mm/height-mm panel properties mandatory in
> > > > > > > > > of_get_drm_panel_display_mode(), print error message and
> > > > > > > > > return -ve in case these DT properties are not present.
> > > > > > > > > This is needed to correctly report panel dimensions.
> > > > > > > > 
> > > > > > > > Can we guarantee this won't cause a regression ?
> > > > > > > 
> > > > > > > For the upstream DTs, I think we can.
> > > > > > > For downstream DTs, we cannot know.
> > > > > > 
> > > > > > Are there users of this function whose DT bindings don't require the
> > > > > > width-mm and height-mm properties ?
> > > > > 
> > > > > There is literally one user of this function upstream:
> > > > > drivers/gpu/drm/tiny/panel-mipi-dbi.c
> > > > 
> > > > Yes, the function was added for that driver since it was so generic in
> > > > nature. What about adding an argument to of_get_drm_panel_display_mode()
> > > > that tells if the properties are mandatory or not?
> > > 
> > > Sure, we can do that, but maybe the question here is even bigger than
> > > this series.
> > > 
> > > Should every panel set mandatory width_mm/height_mm so e.g. the user
> > > space can infer DPI from it and set up scaling accordingly, or should
> > > width_mm/height_mm be optional ?
> > > 
> > > I think width_mm/height_mm should be mandatory for all panels.
> > > 
> > > Thoughts ?
> > 
> > If this had come up during the review of the driver I would have no
> > problem making it mandatory. It makes sense for DPI. Maybe it's possible
> > to get around the ABI break by getting in a change through -fixes before
> > 5.18 is released? I'm fine with that.
> 
> Well that's awesome, the dbi-spi.yaml didn't land in any kernel release yet,
> so we still have a chance to fix it ? Rob ?

Yes, it can be fixed. And the binding, not the kernel, is the place to 
enforce it being mandatory IMO.

Rob
