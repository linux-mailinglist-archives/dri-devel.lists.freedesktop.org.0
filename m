Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7774B256025
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 19:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1756E500;
	Fri, 28 Aug 2020 17:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7E46E500
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 17:58:04 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 10DFE201BD;
 Fri, 28 Aug 2020 19:58:00 +0200 (CEST)
Date: Fri, 28 Aug 2020 19:57:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH RFC v6 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
Message-ID: <20200828175759.GB660103@ravnborg.org>
References: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
 <1595930879-2478-2-git-send-email-kevin3.tang@gmail.com>
 <20200728202732.GB1277651@ravnborg.org>
 <CAFPSGXahb7KzsM3iZFjW=JjZAYr0h1vwMx2ROrwR=x8MCchn1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFPSGXahb7KzsM3iZFjW=JjZAYr0h1vwMx2ROrwR=x8MCchn1Q@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=eyGgB6SCGB90EZ01wQQA:9 a=CjuIK1q_8ugA:10
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Orson Zhai <orsonzhai@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin.

> >
> > Any specific reason why this is not a ports node like used by many other
> > display bindings?
> > In other words - I think this is too simple.
> We only support one display pipeline now, other interface, like
> DP(DisplayPort), HDMI...will be add later...
> 
>   ports:
>     $ref: /schemas/types.yaml#/definitions/phandle-array
>     description: |
>       Should contain a list of phandles pointing to display interface port
>       of dpu devices.. dpu definitions as defined in
>       Documentation/devicetree/bindings/display/sprd/sprd,dpu.yaml

There is nothing wrong having a ports node that is limited to a single
port node. But please remember the binding describes the HW - so if the
HW supports more than one port the binding should describe this.
What the driver supports is not relevant for the binding.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
