Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0B8159388
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 16:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089536E041;
	Tue, 11 Feb 2020 15:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7116A6E041
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 15:47:27 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3767720025;
 Tue, 11 Feb 2020 16:47:23 +0100 (CET)
Date: Tue, 11 Feb 2020 16:47:22 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v3 0/2] drm/panel: simple: Rocktech RK101II01D-CT + binding
Message-ID: <20200211154722.GA22105@ravnborg.org>
References: <cover.1581423249.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1581423249.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=11s9-sBWiV44Xjp9szYA:9 a=CjuIK1q_8ugA:10
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
Cc: praneeth@ti.com, dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com,
 tomi.valkeinen@ti.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jyri

On Tue, Feb 11, 2020 at 02:17:16PM +0200, Jyri Sarha wrote:
> Add support for Rocktech RK101II01D-CT panel to panel-simple and add
> yaml binding for it.
> 
> Changes since v2:
> - No separate binding document, just add new compatible to panel-simple.yaml
> 
> Changes since first fersion:
> - Move to yaml binding
> 
> Jyri Sarha (2):
>   dt-bindings: panel-simple: Add rocktech,rk101ii01d-ct compatible
>   drm/panel: simple: Add Rocktech RK101II01D-CT panel

Thanks,
Applied to drm-misc-next.

	Sam


> 
>  .../bindings/display/panel/panel-simple.yaml  |  2 ++
>  drivers/gpu/drm/panel/panel-simple.c          | 32 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
