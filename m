Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 085996142B9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 02:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9069B10E2A0;
	Tue,  1 Nov 2022 01:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DA510E2A0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 01:11:38 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id v81so5861398oie.5
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 18:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EtuNirfdP3MaA2p83xUDjwwQUX0NJu7/yIl+/F9+dHQ=;
 b=VdDS+M00tL3Hjyehv3zLMl9+3mCVqUx8ZSwGRknmtXxXpunnzFKbjlXARoCdZiW5Th
 nb+WoqytD6MfVo8Jslk1RoP6YFs/rFwNR+tUqHo89Ogk4DhF5/rX0A0p9K28cALANld4
 yuhS6lKILElc/8qJL0+1/92twpmJkZXY0bEqHwuQSWzP50FoxsNZYV1lOQFwg59EoiHH
 UaKBjYiOb9I+bDgi3iIWr6A4k0PVEH+8aoA80ZuQCKHyc/IdnbgTn3K67PeTS3Ttrrzm
 sCQkdDNAB2xMy2G7A6+/TS4xGZtHg2ImE1cMlKcqeL/dBZiBxEq7ve4ei4rxbXBVEk9t
 Zhrg==
X-Gm-Message-State: ACrzQf0j3BurtP1IxwmOLVPrMkSWlhULRTvivOAlCjTKb1dIlRZCGi91
 4DrAr7r1Wck1iGinixBUGQ==
X-Google-Smtp-Source: AMsMyM7PkPjCjvokoDKlgpXF0xGhT0xxEIWsQFKZusHIVxDlXwthc+cfIjbWAR/yst/cwmPzfUYQ+g==
X-Received: by 2002:a05:6808:1a13:b0:354:b339:25f2 with SMTP id
 bk19-20020a0568081a1300b00354b33925f2mr16488065oib.285.1667265097603; 
 Mon, 31 Oct 2022 18:11:37 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j21-20020a9d7d95000000b00661b019accbsm3333754otn.3.2022.10.31.18.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 18:11:37 -0700 (PDT)
Received: (nullmailer pid 4041380 invoked by uid 1000);
 Tue, 01 Nov 2022 01:11:38 -0000
Date: Mon, 31 Oct 2022 20:11:38 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V4 2/3] dt-bindings: display: panel: Add NewVision
 NV3051D bindings
Message-ID: <20221101011138.GA4040180-robh@kernel.org>
References: <20221028205009.15105-1-macroalpha82@gmail.com>
 <20221028205009.15105-3-macroalpha82@gmail.com>
 <762efc62-cad6-609b-c82d-01a4290e5948@linaro.org>
 <SN6PR06MB5342D758FFA64096002E348FA5359@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR06MB5342D758FFA64096002E348FA5359@SN6PR06MB5342.namprd06.prod.outlook.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, thierry.reding@gmail.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 28, 2022 at 09:28:59PM -0500, Chris Morgan wrote:
> On Fri, Oct 28, 2022 at 07:01:12PM -0400, Krzysztof Kozlowski wrote:
> > On 28/10/2022 16:50, Chris Morgan wrote:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > Add documentation for the NewVision NV3051D panel bindings.
> > > Note that for the two expected consumers of this panel binding
> > > the underlying LCD model is unknown. Name "anbernic,rg353p-panel"
> > > is used because the hardware itself is known as "anbernic,rg353p".
> > > 
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Didn't you got here tag?
> 
> Yes, I'm so sorry. I always seem to miss one detail each time, I
> promise I'll get better (eventually, I hope). This one should
> already have the "Reviewed-by: Rob Herring <robh@kernel.org>" but
> I forgot to include it. Literally the only change from v3 is the
> return of a function changing from int to void, since that changed
> in the 6.1 kernel.

If you forget, just add the tags by themselves and the tools will pick 
them up.

Reviewed-by: Rob Herring <robh@kernel.org>

