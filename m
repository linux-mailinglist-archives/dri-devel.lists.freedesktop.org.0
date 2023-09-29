Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9977B3C1B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 23:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB1810E144;
	Fri, 29 Sep 2023 21:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5EC10E144
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 21:50:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-116-43-nat.elisa-mobile.fi
 [85.76.116.43])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4CA2844;
 Fri, 29 Sep 2023 23:48:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1696024129;
 bh=866UJHw9/oWm82fUEDCPpnKQpE+OgZjRr+islnm5c4c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cYnm8AiNqLwsqHulShLaGOzyUfIBQcPCT2akuV1IiJbaSZvNHJopWO9ZvC4UZyWQw
 RrY9b8+hREl9S9I0XT91uh23ZnfodXBEZtHwhACJnQU/cd+y+RZoMThZWC3V/N2NNU
 sBkqcsgMa8wvMx1uxaEUivxIwt0+x5oLRNAaJP+Q=
Date: Sat, 30 Sep 2023 00:50:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Cooper <douglas.cooper1@gmail.com>
Subject: Re: ti-sn65dsi86 linux driver using dsi clock source for pll
Message-ID: <20230929215041.GC28737@pendragon.ideasonboard.com>
References: <CACJMzRE=1S-aD4o68WHan7yYQb3zoLTZiUsMJw2B3d91O4D0ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACJMzRE=1S-aD4o68WHan7yYQb3zoLTZiUsMJw2B3d91O4D0ng@mail.gmail.com>
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
Cc: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

CC'ing the dri-devel mailing list and Douglas Anderson.

On Fri, Sep 29, 2023 at 03:36:52PM -0400, Douglas Cooper wrote:
> Hello,
> 
> I've been trying to get the ti-sn65dsi86 to work with the dsi bus as the clk
> source (refclk grounded) and have concluded that the pll is not getting locked.
> Assuming the hardware is sound, have you ever seen this topology evaluated
> before? I'm questioning if that was a use case considered in the driver
> development. I will continue to actively investigate this.

I don't think I've tested this mode, sorry. Maybe other people on the
list have some experience with this.

-- 
Regards,

Laurent Pinchart
