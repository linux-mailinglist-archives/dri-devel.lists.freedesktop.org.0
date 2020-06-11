Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2773B1F6E31
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 21:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D3A6E930;
	Thu, 11 Jun 2020 19:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D590B6E930
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 19:48:46 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id AE5942002B;
 Thu, 11 Jun 2020 21:48:44 +0200 (CEST)
Date: Thu, 11 Jun 2020 21:48:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: simple: add CDTech
 S070PWS19HP-FC21 and S070SWV29HG-DC44
Message-ID: <20200611194842.GA160434@ravnborg.org>
References: <20200610120131.3069-1-matthias.schiffer@ew.tq-group.com>
 <20200611124209.25028-1-matthias.schiffer@ew.tq-group.com>
 <686342440e7e1be0b010820154d3ae3dbc9f7990.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <686342440e7e1be0b010820154d3ae3dbc9f7990.camel@ew.tq-group.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=8f9FM25-AAAA:8 a=uEie4X3uJoHb6EmIMRgA:9
 a=CjuIK1q_8ugA:10 a=uSNRK0Bqq4PXrUp6LDpb:22
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias.
On Thu, Jun 11, 2020 at 02:46:22PM +0200, Matthias Schiffer wrote:
> On Thu, 2020-06-11 at 14:42 +0200, Matthias Schiffer wrote:
> > Add the CDTech Electronics displays S070PWS19HP-FC21 (7.0" WSVGA) and
> > S070SWV29HG-DC44 (7.0" WVGA) to the panel-simple compatible list.
> > 
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > ---
> > 
> > v2: no changes
> 
> Oops, it seems I held my git send-email wrong, which caused patches v2
> 2-4 to bounce from some servers, should I resend?
Please do, I do not see them here.

	Sam
> 
> 
> > 
> >  .../devicetree/bindings/display/panel/panel-simple.yaml       | 4
> > ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-
> > simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-
> > simple.yaml
> > index 31e3efc73e00..2ddb520edc6d 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-
> > simple.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-
> > simple.yaml
> > @@ -81,6 +81,10 @@ properties:
> >        - boe,nv140fhmn49
> >          # CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-
> > LCD panel
> >        - cdtech,s043wq26h-ct7
> > +        # CDTech(H.K.) Electronics Limited 7" WSVGA (1024x600) TFT
> > LCD Panel
> > +      - cdtech,s070pws19hp-fc21
> > +        # CDTech(H.K.) Electronics Limited 7" WVGA (800x480) TFT LCD
> > Panel
> > +      - cdtech,s070swv29hg-dc44
> >          # CDTech(H.K.) Electronics Limited 7" 800x480 color TFT-LCD
> > panel
> >        - cdtech,s070wv95-ct16
> >          # Chunghwa Picture Tubes Ltd. 7" WXGA TFT LCD panel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
