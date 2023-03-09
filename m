Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2426B20E0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 11:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D18E10E7D7;
	Thu,  9 Mar 2023 10:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953E810E7D7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 10:04:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07F56589;
 Thu,  9 Mar 2023 11:04:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1678356252;
 bh=66ENrWoctqa/DlNjCXXgOhffsRQ+ky57kWuEqZE5+lg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=myO+297I4TPOi+JY/TNTTg+khd3lhmmZoFeeH5xkMvcdmhmR9zxYBGnIInbQY16/s
 qq63Skef0FGB+YVSGv8E/Pe72y6Bwd+YcBu+tZX4EflqqIKQeGyI+8/c3JBj2YF/Gq
 lmmkPKWcC/mXXDuk/+cpE9W9haBLGZ87eZdnqGYw=
Date: Thu, 9 Mar 2023 12:04:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: David Binderman <dcb314@hotmail.com>
Subject: Re: drivers/gpu/drm/bridge/fsl-ldb.c:101: possible loss of
 information.
Message-ID: <20230309100415.GO31765@pendragon.ideasonboard.com>
References: <DB6P189MB0568FCA97758B820EAC036989CB79@DB6P189MB0568.EURP189.PROD.OUTLOOK.COM>
 <20230308232224.GG31765@pendragon.ideasonboard.com>
 <DB6P189MB056810B266B656706ECF7EAB9CB59@DB6P189MB0568.EURP189.PROD.OUTLOOK.COM>
 <20230309092647.GM31765@pendragon.ideasonboard.com>
 <DB6P189MB0568832655843F63CCE9B63C9CB59@DB6P189MB0568.EURP189.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB6P189MB0568832655843F63CCE9B63C9CB59@DB6P189MB0568.EURP189.PROD.OUTLOOK.COM>
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David,

On Thu, Mar 09, 2023 at 09:42:54AM +0000, David Binderman wrote:
> Hello there Laurent,
> 
> > Would you be able to send a patch to fix this ?
> 
> Sadly, no. My success rate with kernel patches is low enough to make
> it not worth trying.

I'm sorry to hear that. If you were willing to try again, I can offer
help with tooling and review to get your patch merged.

> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Sent: 09 March 2023 09:26
> To: David Binderman <dcb314@hotmail.com>
> Cc: andrzej.hajda@intel.com <andrzej.hajda@intel.com>; neil.armstrong@linaro.org <neil.armstrong@linaro.org>; rfoss@kernel.org <rfoss@kernel.org>; jonas@kwiboo.se <jonas@kwiboo.se>; jernej.skrabec@gmail.com <jernej.skrabec@gmail.com>; airlied@gmail.com <airlied@gmail.com>; daniel@ffwll.ch <daniel@ffwll.ch>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
> Subject: Re: drivers/gpu/drm/bridge/fsl-ldb.c:101: possible loss of information. 
>  
> Hi David,
> 
> On Thu, Mar 09, 2023 at 07:59:34AM +0000, David Binderman wrote:
> > Hello there Laurent,
> > 
> > > We could, but I don't think it will make any difference in practice as
> > > the maximum pixel clock frequency supported by the SoC is 80MHz (per
> > > LVDS channel). That would result in a 560MHz frequency returned by this
> > > function, well below the 31 bits limit.
> > 
> > Thanks for your explanation. I have a couple of suggestions for possible improvements:
> > 
> > 1. Your explanatory text in a comment nearby. This helps all readers of the code.
> > 
> > 2. Might the frequency go up to 300 MHz anytime soon ? The code will stop working then. 
> > In this case, I would suggest to put in a run time sanity check to make sure no 31 bit overflow. 
> 
> As it's a hardware limit of the SoC, I wouldn't expect so.
> 
> This being said, I think adding a UL suffix to the constants would be
> better than a comment as it will please static checkers and serve as
> documentation to humans. Would you be able to send a patch to fix this ?
> 
> > Just a couple of ideas for the code.
> 
> Thanks for taking the time to share those.

-- 
Regards,

Laurent Pinchart
