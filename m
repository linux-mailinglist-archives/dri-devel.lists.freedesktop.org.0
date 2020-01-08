Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F93F134E1B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 21:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466716E33E;
	Wed,  8 Jan 2020 20:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAE36E33E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 20:54:53 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0C383804AF;
 Wed,  8 Jan 2020 21:54:49 +0100 (CET)
Date: Wed, 8 Jan 2020 21:54:48 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: one binding file for all simple panels
Message-ID: <20200108205448.GA4476@ravnborg.org>
References: <20200102101712.5085-1-sam@ravnborg.org>
 <20200102101712.5085-2-sam@ravnborg.org>
 <CA+M3ks7_5To5r+PgUdg_4RrUpxHwVNuzTWGmn-cNXcfrgTq5Vg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+M3ks7_5To5r+PgUdg_4RrUpxHwVNuzTWGmn-cNXcfrgTq5Vg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=IEmTqaxMNtxA4Ll5eFEA:9 a=CjuIK1q_8ugA:10
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Yannick Fertre <yannick.fertre@st.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Benjamin.

> > +
> > +required:
> > +  - compatible
> > +  - power-supply
> 
> Hi Sam,
> 
> power-supply property should be optional like it was in
> ampire,am-480272h3tmqw-t01h.yaml
> else it looks good for me.

power-supply was discussed in PATRCH 2/2 and the conclusion was that
power-supply is required.
Thus I take this as an Acked-by:

And I have committed to drm-misc-next

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
