Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB502E060C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 07:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D766E0DF;
	Tue, 22 Dec 2020 06:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40ACE6E0DF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 06:34:03 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3BB8320024;
 Tue, 22 Dec 2020 07:33:56 +0100 (CET)
Date: Tue, 22 Dec 2020 07:33:54 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop unnecessary *-supply schemas properties
Message-ID: <20201222063354.GA3463004@ravnborg.org>
References: <20201221234659.824881-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201221234659.824881-1-robh@kernel.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=P1BnusSwAAAA:8
 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8 a=7gkXJVJtAAAA:8
 a=qi13JbtwXbsxw4tqeY4A:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=D0XLA9XvdZm18NrgonBM:22 a=cvBusfyB2V15izCimMoJ:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-iio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-input@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Jonathan Cameron <jic23@kernel.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob

On Mon, Dec 21, 2020 at 04:46:59PM -0700, Rob Herring wrote:
> *-supply properties are always a single phandle, so binding schemas
> don't need a type $ref nor 'maxItems'.
> 
> A meta-schema check for this is pending once these existing cases are
> fixed.
> 
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

For the Documentation/devicetree/bindings/display/* parts:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
