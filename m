Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C7D50B21A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 09:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71CE10F491;
	Fri, 22 Apr 2022 07:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC93210F491
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 07:58:35 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M5Gt97028198;
 Fri, 22 Apr 2022 09:58:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9LZRINyuViKBArdIM1/SKVkSFPRxo1+nGcdlcVRuGJQ=;
 b=ln+4BaE+or9vSss1YylIHnncN5YbpgyEGnypbJn/NhdkaawMPkgOqymiGv0t+euVTna3
 CUcXmGevDipR3fTOZ9JHgSp4Lj18iRDgTLO6FgsktQB+zkA+7h/BB77vmcLdH9lD+JeD
 9/uyReRuG0cxvwpDZemRH952OIwaaIgBnOlaoG0uAObvKlOX2bU9dIOP8sPPM/pu4APQ
 3+gBc5j+3oNwUHm3acZt4x7dEd9S7M/CegXywBaWCjA9uikQ1ROhvJStBQFxji8mYyfy
 GtZXd27xiCy2FMh1TAZPcZHBDSzNq12zNUDMevABaJtJY54eTy7giKFzbHxkKuHsdUiI Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqh7c7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 09:58:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 626A9100039;
 Fri, 22 Apr 2022 09:58:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 537E8216ECA;
 Fri, 22 Apr 2022 09:58:29 +0200 (CEST)
Received: from [10.201.21.216] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 22 Apr
 2022 09:58:28 +0200
Message-ID: <133fb3f2-16b9-aff8-c4c8-67beaa19703d@foss.st.com>
Date: Fri, 22 Apr 2022 09:58:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] Revert "drm: of: Properly try all possible cases for
 bridge/panel detection"
Content-Language: en-US
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <YmCU7YLx/+ILPptK@ripper> <YmED/vYsrjoc4OjC@aptenodytes>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <YmED/vYsrjoc4OjC@aptenodytes>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On 4/21/22 09:13, Paul Kocialkowski wrote:
> Hi,
>
> On Wed 20 Apr 22, 16:19, Bjorn Andersson wrote:
>> On Wed 20 Apr 16:12 PDT 2022, Bjorn Andersson wrote:
>>
>> Sorry, I missed Jagan and Linus, author and reviewer of the reverted
>> patch 2, among the recipients.
> I'd be curious to have Jagan's feedback on why the change was needed in the
> first place and whether an accepted dt binding relies on it.
>
> We might be able to just keep the whole thing reverted (forever).


This patch was merged within the last mainline kernel and was breaking our STM32MP15 platforms.

Switching back to drm-based kernel (drm-next-fixes branch) made me realize this patch was faulty.
I'm glad it was reverted.


Thanks,

Raphaël

>
> Paul
>
>> Regards,
>> Bjorn
>>
>>> Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
>>> bridge")' introduced the ability to describe a panel under a display
>>> controller without having to use a graph to connect the controller to
>>> its single child panel (or bridge).
>>>
>>> The implementation of this would find the first non-graph node and
>>> attempt to acquire the related panel or bridge. This prevents cases
>>> where any other child node, such as a aux bus for a DisplayPort
>>> controller, or an opp-table to find the referenced panel.
>>>
>>> Commit '67bae5f28c89 ("drm: of: Properly try all possible cases for
>>> bridge/panel detection")' attempted to solve this problem by not
>>> bypassing the graph reference lookup before attempting to find the panel
>>> or bridge.
>>>
>>> While this does solve the case where a proper graph reference is
>>> present, it does not allow the caller to distinguish between a
>>> yet-to-be-probed panel or bridge and the absence of a reference to a
>>> panel.
>>>
>>> One such case is a DisplayPort controller that on some boards have an
>>> explicitly described reference to a panel, but on others have a
>>> discoverable DisplayPort display attached (which doesn't need to be
>>> expressed in DeviceTree).
>>>
>>> This reverts commit '67bae5f28c89 ("drm: of: Properly try all possible
>>> cases for bridge/panel detection")', as a step towards reverting commit
>>> '80253168dbfd ("drm: of: Lookup if child node has panel or bridge")'.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> ---
>>>  drivers/gpu/drm/drm_of.c | 99 ++++++++++++++++++++--------------------
>>>  1 file changed, 49 insertions(+), 50 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
>>> index f4df344509a8..026e4e29a0f3 100644
>>> --- a/drivers/gpu/drm/drm_of.c
>>> +++ b/drivers/gpu/drm/drm_of.c
>>> @@ -214,29 +214,6 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
>>>  }
>>>  EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
>>>  
>>> -static int find_panel_or_bridge(struct device_node *node,
>>> -				struct drm_panel **panel,
>>> -				struct drm_bridge **bridge)
>>> -{
>>> -	if (panel) {
>>> -		*panel = of_drm_find_panel(node);
>>> -		if (!IS_ERR(*panel))
>>> -			return 0;
>>> -
>>> -		/* Clear the panel pointer in case of error. */
>>> -		*panel = NULL;
>>> -	}
>>> -
>>> -	/* No panel found yet, check for a bridge next. */
>>> -	if (bridge) {
>>> -		*bridge = of_drm_find_bridge(node);
>>> -		if (*bridge)
>>> -			return 0;
>>> -	}
>>> -
>>> -	return -EPROBE_DEFER;
>>> -}
>>> -
>>>  /**
>>>   * drm_of_find_panel_or_bridge - return connected panel or bridge device
>>>   * @np: device tree node containing encoder output ports
>>> @@ -259,44 +236,66 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
>>>  				struct drm_panel **panel,
>>>  				struct drm_bridge **bridge)
>>>  {
>>> -	struct device_node *node;
>>> -	int ret;
>>> +	int ret = -EPROBE_DEFER;
>>> +	struct device_node *remote;
>>>  
>>>  	if (!panel && !bridge)
>>>  		return -EINVAL;
>>> -
>>>  	if (panel)
>>>  		*panel = NULL;
>>> -	if (bridge)
>>> -		*bridge = NULL;
>>> -
>>> -	/* Check for a graph on the device node first. */
>>> -	if (of_graph_is_present(np)) {
>>> -		node = of_graph_get_remote_node(np, port, endpoint);
>>> -		if (node) {
>>> -			ret = find_panel_or_bridge(node, panel, bridge);
>>> -			of_node_put(node);
>>> -
>>> -			if (!ret)
>>> -				return 0;
>>> -		}
>>> -	}
>>>  
>>> -	/* Otherwise check for any child node other than port/ports. */
>>> -	for_each_available_child_of_node(np, node) {
>>> -		if (of_node_name_eq(node, "port") ||
>>> -		    of_node_name_eq(node, "ports"))
>>> +	/**
>>> +	 * Devices can also be child nodes when we also control that device
>>> +	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
>>> +	 *
>>> +	 * Lookup for a child node of the given parent that isn't either port
>>> +	 * or ports.
>>> +	 */
>>> +	for_each_available_child_of_node(np, remote) {
>>> +		if (of_node_name_eq(remote, "port") ||
>>> +		    of_node_name_eq(remote, "ports"))
>>>  			continue;
>>>  
>>> -		ret = find_panel_or_bridge(node, panel, bridge);
>>> -		of_node_put(node);
>>> +		goto of_find_panel_or_bridge;
>>> +	}
>>> +
>>> +	/*
>>> +	 * of_graph_get_remote_node() produces a noisy error message if port
>>> +	 * node isn't found and the absence of the port is a legit case here,
>>> +	 * so at first we silently check whether graph presents in the
>>> +	 * device-tree node.
>>> +	 */
>>> +	if (!of_graph_is_present(np))
>>> +		return -ENODEV;
>>> +
>>> +	remote = of_graph_get_remote_node(np, port, endpoint);
>>> +
>>> +of_find_panel_or_bridge:
>>> +	if (!remote)
>>> +		return -ENODEV;
>>> +
>>> +	if (panel) {
>>> +		*panel = of_drm_find_panel(remote);
>>> +		if (!IS_ERR(*panel))
>>> +			ret = 0;
>>> +		else
>>> +			*panel = NULL;
>>> +	}
>>> +
>>> +	/* No panel found yet, check for a bridge next. */
>>> +	if (bridge) {
>>> +		if (ret) {
>>> +			*bridge = of_drm_find_bridge(remote);
>>> +			if (*bridge)
>>> +				ret = 0;
>>> +		} else {
>>> +			*bridge = NULL;
>>> +		}
>>>  
>>> -		/* Stop at the first found occurrence. */
>>> -		if (!ret)
>>> -			return 0;
>>>  	}
>>>  
>>> -	return -EPROBE_DEFER;
>>> +	of_node_put(remote);
>>> +	return ret;
>>>  }
>>>  EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
>>>  
>>> -- 
>>> 2.35.1
>>>
