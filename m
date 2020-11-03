Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022D42A4C61
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 18:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5CF6E8C3;
	Tue,  3 Nov 2020 17:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5EC6E8C3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 17:11:29 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id AABB120053;
 Tue,  3 Nov 2020 18:11:26 +0100 (CET)
Date: Tue, 3 Nov 2020 18:11:25 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: display: Add support for Intel
 KeemBay Display
Message-ID: <20201103171125.GA1504807@ravnborg.org>
References: <1604006877-20092-1-git-send-email-anitha.chrisanthus@intel.com>
 <1604006877-20092-2-git-send-email-anitha.chrisanthus@intel.com>
 <20201029222046.GA904738@ravnborg.org>
 <b30439f7-b77e-9ca8-57e9-16cf417da0cf@baylibre.com>
 <20201030211539.GB1003403@ravnborg.org>
 <CAL_JsqKFXDP921nGrO9o+RjMLnYLBiyagQmUUZFb10QJgu8kZQ@mail.gmail.com>
 <bcca48b9-5baa-2842-a6f0-23a2b668272a@baylibre.com>
 <20201102180406.GA1404335@ravnborg.org>
 <2f1b7ced-5bec-cb52-3d08-5dae61adf4ab@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f1b7ced-5bec-cb52-3d08-5dae61adf4ab@baylibre.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=XfxvPa2wqrcEG09bO-QA:9 a=CjuIK1q_8ugA:10
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
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

> >>>>
> >>>> msscam is used to enable clocks both for the display driver and the
> >>>> mipi-dsi part.
> >>>
> >>> If just clocks, then the msscam should be a clock provider possibly.
> >>> If not, then the below looks right.
> > 
> > I am feeling a little clueless here - sorry.
> > 
> > Can you help with any example that does this?
> > 
> > Everything I looked up in bindings/clock/ had a "#clock-cells" which is
> > not relevant for msscam - or so I think at least.
> 
> Looking at the code make it clear it's not relevant to implement it as clock controller.
> 
> The syscon is enough.

Thanks, I think Anitha is going to send a v11 today with the sysconf
change.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
