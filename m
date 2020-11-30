Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F0D2C7E41
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 07:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9A689C0A;
	Mon, 30 Nov 2020 06:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94FD89C0A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 06:35:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AU6Z7YT091631;
 Mon, 30 Nov 2020 00:35:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606718107;
 bh=cXCixHeCGot/pyd+fzuCnD+eNOGDUwM7tzfbumcUAV0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=LZnhwOj1Wjvu5Qv0N93jMCFKHIdRfFgASFLMeYuSowXAv8aMY6WXr+5CQDZ3yKjTC
 yZZ8WfrWkkwYS4nabdyW1Cv2RFNPvAWvoUGxW3RatuixVVY9w0GGZP5Q7qAhlPTQWq
 itiN90LM5Icf2ZeVXh9jEIdazoGQO6BWwIXc+9eU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AU6Z6sX106753
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Nov 2020 00:35:07 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 30
 Nov 2020 00:35:04 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 30 Nov 2020 00:35:04 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AU6Z3qh090603;
 Mon, 30 Nov 2020 00:35:04 -0600
Date: Mon, 30 Nov 2020 12:05:03 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 4/6] drm/tidss: Set bus_format correctly from
 bridge/connector
Message-ID: <20201130063503.phivehin7l2cx53j@NiksLab>
References: <20201119160134.9244-1-nikhil.nd@ti.com>
 <20201119160134.9244-5-nikhil.nd@ti.com>
 <a36967dc-ca5f-d231-198b-1153c9720d65@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a36967dc-ca5f-d231-198b-1153c9720d65@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Yuti Amonkar <yamonkar@cadence.com>, Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14:51-20201125, Tomi Valkeinen wrote:
> Hi Nikhil,
> 
> On 19/11/2020 18:01, Nikhil Devshatwar wrote:
> > Remove the old code to iterate over the bridge chain, as this is
> > already done by the framework.
> > The bridge state should have the negotiated bus format and flags.
> > Use these from the bridge's state.
> > If the bridge does not support format negotiation, error out
> > and fail.
> > 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > ---
> > 
> > Notes:
> >     changes from v2:
> >     * Remove the old code and use the flags from the bridge state
> > 
> >  drivers/gpu/drm/tidss/tidss_encoder.c | 36 +++++++++++----------------
> >  1 file changed, 14 insertions(+), 22 deletions(-)
> 
> If a first bridge (after the crtc) supports two bus formats as input, how does tidss choose between
> those? This patch just picks bstate->input_bus_cfg.format, and it's not clear to me which one that
> is (the first one?). Also, we don't check if tidss actually supports the bus format.

The selection is done by the framework in
select_bus_fmt_recursive at drivers/gpu/drm/drm_bridge.c:810

My understanding is that currently, the format negotiation logic does
not negotiate all the way till encoder, it stops only at the
first_bridge.

Nikhil Devshatwar

> 
>  Tomi
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
