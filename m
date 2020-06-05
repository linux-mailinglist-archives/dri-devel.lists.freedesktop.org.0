Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DE51EFD00
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 17:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069E06E942;
	Fri,  5 Jun 2020 15:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F476E942
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 15:48:29 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B341320033;
 Fri,  5 Jun 2020 17:48:27 +0200 (CEST)
Date: Fri, 5 Jun 2020 17:48:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for KOE
 TX26D202VM0BWA panel
Message-ID: <20200605154826.GB207594@ravnborg.org>
References: <1590991880-24273-1-git-send-email-victor.liu@nxp.com>
 <CACvgo50UOby-xV_OYmM55VUXUbwLxK-q6bs2FoS_FuwB9ChYJg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo50UOby-xV_OYmM55VUXUbwLxK-q6bs2FoS_FuwB9ChYJg@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=S1NEfQAhQLroaEqAo4oA:9
 a=CjuIK1q_8ugA:10
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
Cc: Liu Ying <victor.liu@nxp.com>, devicetree <devicetree@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil.

> > +               .width = 217,
> > +               .height = 136,
> > +       },
> > +       .delay = {
> > +               .prepare = 1000,
> > +               .enable = 1000,
> > +               .unprepare = 1000,
> > +               .disable = 1000,
> Ouch 1s for each delay is huge. Nevertheless it matches the specs so,
> the series is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> 
> Sam, Thierry I assume you'll merge the series. Let me know if I should
> pick it up.

I went ahead and applied both patches to drm-misc-next.
They are now pushed out.

	Sam

> 
> -Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
