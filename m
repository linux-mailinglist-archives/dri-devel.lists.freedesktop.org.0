Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0614D24BD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 00:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4D110E32B;
	Tue,  8 Mar 2022 23:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6128310E32B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 23:18:25 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id n7so929541oif.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 15:18:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iit0u9zWiQbQ3YiVBUcj7kSNoNspLfGLfmOn3xXbkEQ=;
 b=q9mp1jK22JJEHhMk4HE7x2LsVUnzI7fNdlvnz0NQn7PhB3MIEnJFAzB9xzJ7IDsgAp
 oq6wHnFtAMKdlK8NPs7JRxj5sFtJj/t3cc/i1Ob8wRNP7b9Q6+SvS82Uu26IM2Ov2LPX
 l56cGpX9p/eSV5djqHDlLwzlaXxhyNXSVeihMXqTIvTPI3wwaBTEHRLbEINOOpLRbm9R
 x8NEfvH+BxPMbiK8kiFz9qFtRZ0k9WoJhgSEOctmEATrSlA1Y8xbM7lTOyntil1n240K
 oFUKiXeP5FT4MO2CaIgEgsVb10oweeafPepR/oKf6dQqNgBNMh6HAWsc90IA833qtwhH
 fiNA==
X-Gm-Message-State: AOAM530zYt9Iopw1jmZuckLvQmFNihpqK623be4GMM1Lh6Ut4XCRBNMU
 9/VA8ma3MlhoGi6lYQ36gg==
X-Google-Smtp-Source: ABdhPJxyh2TC/u+YmC4dbuRB94Ndhj6I+qJNb4nn1oht99Z0poj4FiI9BQlsQnzRtlNfAVkLp/uQdA==
X-Received: by 2002:a05:6808:14d2:b0:2d9:dad1:a148 with SMTP id
 f18-20020a05680814d200b002d9dad1a148mr4272138oiw.257.1646781504401; 
 Tue, 08 Mar 2022 15:18:24 -0800 (PST)
Received: from rob (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a056830409900b005af164235b4sm88950ott.2.2022.03.08.15.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 15:18:23 -0800 (PST)
Received: (nullmailer pid 1546596 invoked by uid 1000);
 Tue, 08 Mar 2022 23:18:22 -0000
Date: Tue, 8 Mar 2022 16:18:22 -0700
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add macros for video
 interface bus types
Message-ID: <20220308231822.GA1538975@robh.at.kernel.org>
References: <20220306173905.22990-1-laurent.pinchart@ideasonboard.com>
 <20220306173905.22990-2-laurent.pinchart@ideasonboard.com>
 <YiT3wZ746ES6x3gl@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiT3wZ746ES6x3gl@pendragon.ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 06, 2022 at 08:04:49PM +0200, Laurent Pinchart wrote:
> On Sun, Mar 06, 2022 at 07:39:03PM +0200, Laurent Pinchart wrote:
> > Add a new dt-bindings/media/video-interfaces.h header that defines
> > macros corresponding to the bus types from media/video-interfaces.yaml.
> > This allows avoiding hardcoded constants in device tree sources.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Dual-license under GPL-2.0-only or MIT
> > - Rename PARALLEL TO BT601
> 
> Contrary to popular belief, further investigation revealed that BT.601
> doesn't define VSYNC and HSYNC (or HREF, as it is also commonly called)
> signals. MEDIA_BUS_TYPE_BT601 is thus likely not a good name. I haven't
> been able to find a standard for parallel camera interfaces that would
> be a good match here. On the display side there's MIPI DPI, but on the
> camera side it seems things have evolved quite organically. I may have
> missed something though.

So keep 'PARALLEL' and anything less ambiguous will be a new type.

Rob
