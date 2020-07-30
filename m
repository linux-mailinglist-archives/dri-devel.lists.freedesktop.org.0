Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB5F232BF5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 08:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B4D6E85C;
	Thu, 30 Jul 2020 06:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9E86E85C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 06:33:43 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8631E2001E;
 Thu, 30 Jul 2020 08:33:40 +0200 (CEST)
Date: Thu, 30 Jul 2020 08:33:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 1/2] dt-bindings: Add DT bindings for Toshiba TC358762
 DSI-to-DPI bridge
Message-ID: <20200730063339.GA1434697@ravnborg.org>
References: <20200729164554.114735-1-marex@denx.de>
 <20200729165904.GB1372716@ravnborg.org>
 <81d8eed6-bac7-4e84-ff42-d158941d6620@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81d8eed6-bac7-4e84-ff42-d158941d6620@denx.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=WzHobfHSo-pyJhVskOMA:9 a=CjuIK1q_8ugA:10
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
Cc: Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 29, 2020 at 11:36:27PM +0200, Marek Vasut wrote:
> On 7/29/20 6:59 PM, Sam Ravnborg wrote:
> 
> Hi,
> 
> [...]
> >> +      port@0:
> >> +        type: object
> >> +        additionalProperties: false
> >> +
> >> +        description: |
> >> +          Video port for MIPI DSI input
> >> +
> >> +        properties:
> >> +          reg:
> >> +            const: 0
> >> +
> >> +        patternProperties:
> > Not happy with the use of "patternProperties" when there is no pattern.
> 
> So how should this be changed ?

Delete the "patternProperties" line and adjust indent on the following
lines. Then this should continue to be valid syntax and validate the
example.

	Sam

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
