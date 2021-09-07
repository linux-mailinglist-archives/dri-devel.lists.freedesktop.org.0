Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA09402DBA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 19:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0B16E0C2;
	Tue,  7 Sep 2021 17:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B9A6E0C1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 17:29:10 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210907172909euoutp017a6e21a2eb792e4c962ac28a51eb51d5~iml9FKYRm0370403704euoutp01v
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 17:29:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210907172909euoutp017a6e21a2eb792e4c962ac28a51eb51d5~iml9FKYRm0370403704euoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1631035749;
 bh=uJ8KrS108i1LXT3m5kCkRY46+7MC4pMzTI21m569ZWo=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=NI3onICegXnpuPjh6cC48e2buhlIYeV2o4HbmL0TLB6Jl9z7KF3iWG/vFQic3fBg5
 sAhAFq+BiBnBxh8uueXboM0/A7IAlXhzSCwD73VQwvIqlgVFposi+/jU6uAvSxTdlD
 9sQ35/n63lfvcmTrUkLJ0lUJUfwSKY+T9pzw4ddU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210907172908eucas1p293bbb3c3eb35eec08b17081e32f080a0~iml8fJtBO2753727537eucas1p2x;
 Tue,  7 Sep 2021 17:29:08 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 26.73.42068.461A7316; Tue,  7
 Sep 2021 18:29:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210907172907eucas1p29a84a9b934d1982d756a859c689225e2~iml8DN7_43213332133eucas1p2J;
 Tue,  7 Sep 2021 17:29:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210907172907eusmtrp17160ea373aa38adedd79003cdc8567b1~iml8CiBqK2616326163eusmtrp1N;
 Tue,  7 Sep 2021 17:29:07 +0000 (GMT)
X-AuditID: cbfec7f4-c71ff7000002a454-40-6137a164ae25
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 70.95.20981.361A7316; Tue,  7
 Sep 2021 18:29:07 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210907172907eusmtip2593c283073e444c68117add70db6f444~iml7jTOAJ1031010310eusmtip2g;
 Tue,  7 Sep 2021 17:29:07 +0000 (GMT)
Message-ID: <9b3d6595-0330-f716-b443-95f3f4783ac4@samsung.com>
Date: Tue, 7 Sep 2021 19:29:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0)
 Gecko/20100101 Thunderbird/92.0
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Check link status register
 after enabling the bridge
Content-Language: pl
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Jagan Teki <jagan@amarulasolutions.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Linus Walleij
 <linus.walleij@linaro.org>, Robert Foss <robert.foss@linaro.org>, Sam
 Ravnborg <sam@ravnborg.org>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <6544aaba-a3e3-f3f6-32d9-5c396df52601@denx.de>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsWy7djPc7opC80TDfrf8llc+fqezeLLpgls
 Fp0Tl7BbTPmznMniTVsjo8WnWQ+ZLVb83MrowO6x9uN9Vo95s06weMzumMnqcefaHjaP+93H
 mTyWTLvKFsAWxWWTkpqTWZZapG+XwJWx9rZEQaduxZdNlQ2MJ1W6GDk5JARMJO5sXM7axcjF
 ISSwglGi781bZgjnC6PEkrb/UM5nRol5q7awwLTcnbOCBSKxnFFi3YNFjBDOe0aJi68fM4NU
 8QrYSXw5toYVxGYRUJH413uCFSIuKHFy5hOwSaICCRLPl35lArGFBVIl2pZdYQOxmQVEJG48
 amEEsUUEHCQOtk8GO4NZ4AajRPf5Q2BFbAKaEn833wSzOQWsJda+7WCCaJaXaN46G6xBQuAJ
 h8Slhzug7naRWPVwMzuELSzx6vgWKFtG4vTkHqiaeon7K1qgmjsYJbZu2MkMkbCWuHPuF9A2
 DqANmhLrd+lDhB0lbvzfzQoSlhDgk7jxVhDiBj6JSdumM0OEeSU62oQgqhUl7p/dCjVQXGLp
 ha9sExiVZiEFyywk789C8s0shL0LGFlWMYqnlhbnpqcWG+WllusVJ+YWl+al6yXn525iBKaj
 0/+Of9nBuPzVR71DjEwcjIcYJTiYlUR4/5qbJQrxpiRWVqUW5ccXleakFh9ilOZgURLnTdqy
 Jl5IID2xJDU7NbUgtQgmy8TBKdXAVCC759iWm3VB8vuUTym++jXjzTf+rVEqjVNLntX/endJ
 yvhwUJHxz+n3WE+1nmeYzR/o4h6tuFDWWuEer7LYnz03tr96P79jm07TxTVylXP44tjWVk2c
 1/qm7JzBxPmKnre3bt30rXvD1XVx6mkHpDPuSkR9cQq30f8SVm1yey6P5lTuqnlxQeH+aryf
 rjH+n/3+W97rk1s9fe92HFscJPbiSoIp2wH9mm3iNye6VWQ8fqn+99v9vwuXXSjfa1DhtlVW
 U0wiYbkS7/tDpQcuZXA2LRd9NGnSyqsCyg7rtn35tqTU1yP829OiSLdNaTKyRxqeu+seX72t
 MGzy88pNz2ZwiZwwbjAI9+XznyCzWk+JpTgj0VCLuag4EQCmbSuqtgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xe7rJC80TDZ581rO48vU9m8WXTRPY
 LDonLmG3mPJnOZPFm7ZGRotPsx4yW6z4uZXRgd1j7cf7rB7zZp1g8ZjdMZPV4861PWwe97uP
 M3ksmXaVLYAtSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1
 SN8uQS9j7W2Jgk7dii+bKhsYT6p0MXJySAiYSNyds4Kli5GLQ0hgKaPE4V+rmSAS4hK7579l
 hrCFJf5c62KDKHrLKNG3/A8bSIJXwE7iy7E1rCA2i4CKxL/eE6wQcUGJkzOfsIDYogIJErsP
 d7GD2MICqRJty66A9TILiEjceNTCCGKLCDhIHGyfzAyygFngBqPEjBsH2eG2nW5dDnYGm4Cm
 xN/NN8G6OQWsJda+7WCCmGQm0bW1ixHClpdo3jqbeQKj0Cwkh8xCsnAWkpZZSFoWMLKsYhRJ
 LS3OTc8tNtIrTswtLs1L10vOz93ECIzAbcd+btnBuPLVR71DjEwcjIcYJTiYlUR4/5qbJQrx
 piRWVqUW5ccXleakFh9iNAWGxkRmKdHkfGAKyCuJNzQzMDU0MbM0MLU0M1YS5zU5siZeSCA9
 sSQ1OzW1ILUIpo+Jg1OqgYnhLpOnxPJCvnADAXbngETHlG0yS87OPhnI+fZ4a6u759pzF581
 Sa0InftcoKeu7/fBPN0NfJ/ub9t64M+0M3FTXDJmBCxO5VIK+H35ykOWy4E7TJl6LldMLvqz
 78LPbx2ngz/qaH73n25ak7JhxeqbU6wXBluYxIe9nr5mk83rYpPnNxcbGdwT/fa43UNcSJfj
 SsmFNO17O2oedyWulHlew8ayN/jL5lM1aXw1pnn9ak6Vvsw7K7nuO1fs3fiE/d064/PndNTl
 Piy7Nk9+Ap/VVeZwhvXbe3SKd2maKG+Pil7KEPRn8ado8xstvpNP/9fepNjpaqsyreSKxJrT
 HRvU4+zMJ9ZkiL95n5O2wluJpTgj0VCLuag4EQDa10SySQMAAA==
X-CMS-MailID: 20210907172907eucas1p29a84a9b934d1982d756a859c689225e2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210907073151eucas1p196543fbd114f34f6de700013fd0e4168
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210907073151eucas1p196543fbd114f34f6de700013fd0e4168
References: <20210907023948.871281-1-marex@denx.de>
 <CGME20210907073151eucas1p196543fbd114f34f6de700013fd0e4168@eucas1p1.samsung.com>
 <2f530ec2-3781-67eb-6f34-c7b6a29641ea@samsung.com>
 <6544aaba-a3e3-f3f6-32d9-5c396df52601@denx.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


W dniu 07.09.2021 o 16:25, Marek Vasut pisze:
> On 9/7/21 9:31 AM, Andrzej Hajda wrote:
>> On 07.09.2021 04:39, Marek Vasut wrote:
>>> In rare cases, the bridge may not start up correctly, which usually
>>> leads to no display output. In case this happens, warn about it in
>>> the kernel log.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>> Cc: Robert Foss <robert.foss@linaro.org>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: dri-devel@lists.freedesktop.org
>>> ---
>>> NOTE: See the following:
>>> https://e2e.ti.com/support/interface-group/interface/f/interface-forum/942005/sn65dsi83-dsi83-lvds-bridge---sporadic-behavior---no-video 
>>>
>>> https://community.nxp.com/t5/i-MX-Processors/i-MX8M-MIPI-DSI-Interface-LVDS-Bridge-Initialization/td-p/1156533 
>>>
>>> ---
>>>    drivers/gpu/drm/bridge/ti-sn65dsi83.c | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c 
>>> b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>> index a32f70bc68ea4..4ea71d7f0bfbc 100644
>>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>> @@ -520,6 +520,11 @@ static void sn65dsi83_atomic_enable(struct 
>>> drm_bridge *bridge,
>>>        /* Clear all errors that got asserted during initialization. */
>>>        regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
>>>        regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
>>
>>
>> It does not look as correct error handling, maybe it would be good to
>> analyze and optionally report 'unexpected' errors here as well.
>
> The above is correct -- it clears the status register because the 
> setup might've set random bits in that register. Then we wait a bit, 
> let the link run, and read them again to get the real link status in 
> this new piece of code below, hence the usleep_range there. And then 
> if the link indicates a problem, we know it is a problem.


Usually such registers are cleared on very beginning of the 
initialization, and tested (via irq handler, or via reading), during 
initalization, if initialization phase goes well. If it is not the case 
forgive me.


>
>>> +
>>> +    usleep_range(10000, 12000);
>>> +    regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
>>> +    if (pval)
>>> +        dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
>>
>>
>> I am not sure what is the case here but it looks like 'we do not know
>> what is going on, so let's add some diagnostic messages to gather info
>> and figure it out later'.
>
> That's pretty much the case, see the two links above in the NOTE 
> section. If something goes wrong, we print the value for the user 
> (usually developer) so they can fix their problems. We cannot do much 
> better in the attach callback.
>
> The issue I ran into (and where this would be helpful information to 
> me during debugging, since the issue happened real seldom, see also 
> the NOTE links above) is that the DSI controller driver started 
> streaming video on the data lanes before the DSI83 had a chance to 
> initialize. This worked most of the time, except for a few exceptions 
> here and there, where the video didn't start. This does set link 
> status bits consistently. In the meantime, I fixed the controller 
> driver (so far downstream, due to ongoing discussion).


Maybe drm_connector_set_link_status_property(conn, 
DRM_MODE_LINK_STATUS_BAD) would be usefule here.


>
>> Whole driver lacks IRQ handler which IMO could perform better diagnosis,
>> and I guess it could also help in recovery, but this is just my guess.
>> So if this patch is enough for now you can add:
>
> No, IRQ won't help you here, because by the time you get the IRQ, the 
> DSI host already started streaming video on data lanes and you won't 
> be able to correctly reinit the DSI83 unless you communicate to the 
> DSI host that it should switch the data lanes back to LP11.
>
> And for that, there is a bigger chunk missing really. What needs to be 
> added is a way for the DSI bridge / panel to communicate its needs to 
> the DSI host -- things like "I need DSI clock lane frequency f MHz, I 
> need clock lane in HS mode and data lanes in LP11 mode". If you look 
> at the way DSI hosts and bridges/panels work out the DSI link 
> parameters, you will notice they basically do it each on their own, 
> there is no such API or communication channel.


There is one-time communication channel via mipi_dsi_attach, it allows 
to set max frequency i HS and LP, choose mode of operation (HS/LPM) and 
few more things. If it is necessary to extend it please propse sth.

Regarding requesting LP11 I am not sure if we really should have such 
low level communication. LP11, as I remember ,is initial state in HS so 
it should be set anyway, before starting video transmission.


And maybe this is the main problem:

DRM core calls:

crtc->enable

bridges->pre_enable,

encoder->enable,

bridges->enable.


Usually video transmission starts in crtc->enable (CRTC->Encoder), and 
in encoder->enable (encoder->bridge), so in bridges->enable it would be 
too late for LP11 state - transmission can be already in progress.

It shows well that this order of calls does not fit well to DSI, and 
probably many other protocols.

Maybe moving most of the bridge->enable code to bridge->pre_enable would 
help, but I am not sur if it will not pose another issues.

This is quick analysis, so please fix me if I am wrong.


Regards

Andrzej


