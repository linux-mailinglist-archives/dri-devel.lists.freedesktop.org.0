Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A129768C1D
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 08:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941EB10E1A7;
	Mon, 31 Jul 2023 06:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AA710E1A7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 06:39:43 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qQMYs-0001Vc-CZ; Mon, 31 Jul 2023 08:39:22 +0200
Message-ID: <0be7d390-f2dc-85ea-6a54-35919bc03047@pengutronix.de>
Date: Mon, 31 Jul 2023 08:39:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v4 2/3] dt-bindings: display: simple: support non-default
 data-mapping
Content-Language: en-US, de-DE
To: Conor Dooley <conor@kernel.org>
References: <20230523-simplepanel_support_nondefault_datamapping-v4-0-e6e7011f34b5@pengutronix.de>
 <20230523-simplepanel_support_nondefault_datamapping-v4-2-e6e7011f34b5@pengutronix.de>
 <20230729-tinker-provolone-a88d55c07cad@spud>
From: Johannes Zink <j.zink@pengutronix.de>
In-Reply-To: <20230729-tinker-provolone-a88d55c07cad@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
 Dan Carpenter <error27@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, kernel@pengutronix.de,
 patchwork-jzi@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Conor,

On 7/29/23 12:19, Conor Dooley wrote:
> On Fri, Jul 28, 2023 at 04:16:56PM +0200, Johannes Zink wrote:
>> Some Displays support more than just a single default LVDS data mapping,
>> which can be used to run displays on only 3 LVDS lanes in the jeida-18
>> data-mapping mode.
>>
>> Add an optional data-mapping property to allow overriding the default
>> data mapping. As it does not generally apply to any display and bus, use
>> it selectively on the innolux,g101ice-l01, which supports changing the
>> data mapping via a strapping pin.
>>
>> Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
>>
>> ---
>>
>> Changes:
>>
>> v3 -> v4: none
>>
>> v2 -> v3: - worked in Laurent's review findings (thanks for reviewing
>> 	    my work): fix typos in commit message
> 
> I gave you one for this patch too, no? > https://lore.kernel.org/all/20230523-jaywalker-modify-500ec1d79223@spud/
> Any reason in particular you didn't pick up the tags? Here it is
> against, since all that appears to have changed is some typos.

sorry, I forgot to add the Tags, There is no functional changes in patch 1-3 of 4.

Johannes

> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> 

-- 
Pengutronix e.K.                | Johannes Zink                  |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

