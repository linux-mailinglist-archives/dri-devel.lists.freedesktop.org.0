Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 150A179E6A2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 13:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D0910E027;
	Wed, 13 Sep 2023 11:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0389110E027
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:25:18 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qgNzW-00048k-NV; Wed, 13 Sep 2023 13:25:06 +0200
Message-ID: <089e6ed7-4d87-9469-b547-1f14d975ed62@pengutronix.de>
Date: Wed, 13 Sep 2023 13:24:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 3/3] drm/panel-simple: allow LVDS format override
Content-Language: en-US, de-DE
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <20230523-simplepanel_support_nondefault_datamapping-v4-0-e6e7011f34b5@pengutronix.de>
 <20230523-simplepanel_support_nondefault_datamapping-v4-3-e6e7011f34b5@pengutronix.de>
 <96898dbb-3fdf-7a74-ae80-f18ae2244f50@pengutronix.de>
 <e6a2df72-46cb-4f22-b983-ac5ad2995da8@kadam.mountain>
From: Johannes Zink <j.zink@pengutronix.de>
In-Reply-To: <e6a2df72-46cb-4f22-b983-ac5ad2995da8@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dan Carpenter <error27@gmail.com>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 patchwork-jzi@pengutronix.de, kernel@pengutronix.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

On 9/13/23 13:14, Dan Carpenter wrote:
> On Fri, Aug 18, 2023 at 09:04:34AM +0200, Johannes Zink wrote:
>> Hi Dan,
>>
>> do you have any input on this for me?
>>
> 
> Sorry, I was out of office and the truth is that I'm never going to
> catch up on all the email I missed.  :/
> 

nevermind, that's why I sent ping...

> Looks okay to me.  I can't remember what I said about this code in v3
> but it looks good now.  I'm not a DRM dev so I'm not sure my review
> counts for much.  

IIRC it was a mistake I made with a return value that I have fixed in v4.

You should always just assume that if I'm quiet
> then I'm happy.  :)

That's good to know ;-) Thanks for your review!

Johannes

> 
> regards,
> dan carpenter
> 
> 

-- 
Pengutronix e.K.                | Johannes Zink                  |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

