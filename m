Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE783210A32
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 13:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8B46E894;
	Wed,  1 Jul 2020 11:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D516E894
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 11:20:06 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id EC378804B9;
 Wed,  1 Jul 2020 13:20:02 +0200 (CEST)
Date: Wed, 1 Jul 2020 13:20:01 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Vinay Simha B N <simhavcs@gmail.com>
Subject: Re: [PATCH v5 1/2] dt-binding: Add DSI/LVDS TC358775 bridge bindings
Message-ID: <20200701112001.GA652928@ravnborg.org>
References: <20200701070344.6330-1-simhavcs@gmail.com>
 <20200701091940.GB266726@ravnborg.org>
 <CAGWqDJ51_QRHLP0mUyaCJCiKMJkGmbwuR9y2rZ=t=Mo7gCdb1w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGWqDJ51_QRHLP0mUyaCJCiKMJkGmbwuR9y2rZ=t=Mo7gCdb1w@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=Nvn8WTl6hB1VAHlkLJEA:9 a=CjuIK1q_8ugA:10
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
 <devicetree@vger.kernel.org>, Chris.Cheng@taec.toshiba.com,
 Ken-Sue.Tan@taec.toshiba.com, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Bhushan.Patel@taec.toshiba.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinay.

On Wed, Jul 01, 2020 at 03:14:09PM +0530, Vinay Simha B N wrote:
> sam,
> 
> I rechecked, but did not find any indents are too spaced.
> This is taken from a working dts tree.
> 
            port@1 {
            |   reg = <1>;
            |   dsi0_out: endpoint {
            |       remote-endpoint = <&d2l_in_test>;
            |           data-lanes = <0 1 2 3>;
            |   };
             };
         };
     };
See above, something is wrong with the indent in the examples.


> I had given two examples for a purpose. One for single lvds
> configuration single link mode,
> another is for dual lvds configurations dual-link mode and port mappings.

Please provide a proper description of the single link and dual link
modes in the descriptions of the bindings.
The examples shall support the bindings, they shall not include
information that is not covered in the bindings.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
