Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EDB6F6AEB
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 14:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E55D10E38D;
	Thu,  4 May 2023 12:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA7E10E3AF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 07:36:16 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1puTVQ-0002EA-IB; Thu, 04 May 2023 09:36:00 +0200
Message-ID: <a45ac6da-8e29-9b2d-6172-8bc043afc415@pengutronix.de>
Date: Thu, 4 May 2023 09:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: support non-default
 data-mapping
Content-Language: en-US, de-DE
From: Johannes Zink <j.zink@pengutronix.de>
To: Rob Herring <robh@kernel.org>
References: <20230414161116.3673911-1-j.zink@pengutronix.de>
 <20230414161116.3673911-2-j.zink@pengutronix.de>
 <20230418212058.GA2351633-robh@kernel.org>
 <b4cb0a91-26f9-94d6-4bde-87cfc9ba2a47@pengutronix.de>
In-Reply-To: <b4cb0a91-26f9-94d6-4bde-87cfc9ba2a47@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 04 May 2023 12:11:44 +0000
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, sam@ravnborg.org, kernel@pengutronix.de,
 patchwork-jzi@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On 4/19/23 08:29, Johannes Zink wrote:
[snip]


>>
>> Why do you duplicate what's in display/lvds.yaml?
> 
> I don't think any of the other properties from display/lvds.yaml 
> currently make any sense to be put into simple-panel, thus I selectively 
> picked this one.
> 
> If there is a way to selectively pick only the data_mapping, please let 
> me know and I send a V2
> 
>>
>> This also just made 'data-mapping' valid on non-LVDS panels.
> 
> what is the canonical way of restricting the data-mapping property to 
> LVDS panels only? Or ist the proper way to go to move the panel I use 
> (innolux,g101ice-l01) to its own yaml file, include panel-simple.yaml 
> and leave the others alone? I think other LVDS panels might benefit from 
> this series though, which is why I think it makes sense to add the 
> property to all LVDS panels.
> 

gentle ping. How do you suggest should I proceed here? Maybe pulling the 
data-mapping definition in a separate file and include it in both files?

Can I enable the property selectively, e.g. only on the 
innolux,g101ice-l01 panel, in order not to enable it on non-LVDS panels 
or on LVDS-panels which might not support it?

Best regards
Johannes

[snip]
-- 
Pengutronix e.K.                | Johannes Zink                  |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

