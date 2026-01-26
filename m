Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MI8YHl3jd2k9mQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 22:57:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD4C8DC12
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 22:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441FA10E062;
	Mon, 26 Jan 2026 21:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LCXGMY+Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F9110E062
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 21:57:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 47492C214D3;
 Mon, 26 Jan 2026 21:57:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5396260717;
 Mon, 26 Jan 2026 21:57:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 874EC119A8652; Mon, 26 Jan 2026 22:57:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769464662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JPwZyDe4OThoaY1OrbYDXoRov92xdqHIGYafSht4NfM=;
 b=LCXGMY+ZTWlhL1gecMErzIScZDyGU0NQZPJmDtsoIaTKfhqkz/dw0BOfPXjNi+zRc53RN8
 gZ+HMhMCK7t8zArJcfx9ysmuPANr0TGU5iT6jyyteXZr5mQmCEBvtCMI/wCpXK+vQUIKBh
 5JLvSGLcyi4iik+iFHZW7TpDhBmqiOi6mrVxtIN5dTlqJChxN05zbgtWK5qhl7N6N1XpTm
 jQchp++A4t4Hg+f7SR55Z6Gm+pcNUUMp4voqvkFZS5eaggk+kqMygbagGhGI92yko1Iq4j
 cZqCoDJ/KgHtQpjNEDADwc/TP1VB2/DSmujZ6JyRxeObbxSWkCA1a51BafitOg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 22:57:35 +0100
Message-Id: <DFYUVCNVLBND.3MHWLTF20L4TS@bootlin.com>
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 4/4] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-4-a62b4399a6bf@bootlin.com>
 <e2536229-f8d9-4d65-8211-cf445677bef2@nxp.com>
 <DFYQ7TS25SQT.2F7NBYOP8P5R4@bootlin.com>
In-Reply-To: <DFYQ7TS25SQT.2F7NBYOP8P5R4@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Hui.Pu@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:luca.ceresoli@bootlin.com,m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,nxp.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:url,bootlin.com:mid]
X-Rspamd-Queue-Id: CDD4C8DC12
X-Rspamd-Action: no action

Hello Liu,

On Mon Jan 26, 2026 at 7:18 PM CET, Luca Ceresoli wrote:

>>> @@ -260,7 +259,7 @@ static int imx8qxp_pixel_link_find_next_bridge(stru=
ct imx8qxp_pixel_link *pl)
>>>  {
>>>  	struct device_node *np =3D pl->dev->of_node;
>>>  	struct device_node *port;
>>> -	struct drm_bridge *selected_bridge =3D NULL;
>>> +	struct drm_bridge *selected_bridge __free(drm_bridge_put) =3D NULL;
>>>  	u32 port_id;
>>>  	bool found_port =3D false;
>>>  	int reg;
>>> @@ -297,7 +296,8 @@ static int imx8qxp_pixel_link_find_next_bridge(stru=
ct imx8qxp_pixel_link *pl)
>>>  			continue;
>>>  		}
>>>
>>> -		struct drm_bridge *next_bridge =3D of_drm_find_bridge(remote);
>>> +		struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
>>> +			of_drm_find_and_get_bridge(remote);
>>>  		if (!next_bridge)
>>>  			return -EPROBE_DEFER;
>>>
>>> @@ -305,12 +305,14 @@ static int imx8qxp_pixel_link_find_next_bridge(st=
ruct imx8qxp_pixel_link *pl)
>>>  		 * Select the next bridge with companion PXL2DPI if
>>>  		 * present, otherwise default to the first bridge
>>>  		 */
>>> -		if (!selected_bridge || of_property_present(remote, "fsl,companion-p=
xl2dpi"))
>>> -			selected_bridge =3D next_bridge;
>>> +		if (!selected_bridge || of_property_present(remote, "fsl,companion-p=
xl2dpi")) {
>>> +			drm_bridge_put(selected_bridge);
>>> +			selected_bridge =3D drm_bridge_get(next_bridge);
>>
>> Considering selecting the first bridge without the companion pxl2dpi,
>> there would be a superfluous refcount for the selected bridge:
>>
>> 1) of_drm_find_and_get_bridge: refcount =3D 1
>> 2) drm_bridge_put: noop, since selected_bridge is NULL, refcount =3D 1
>> 3) drm_bridge_get: refcount =3D 2
>> 4) drm_bridge_put(__free): refcount =3D 1
>> 5) drm_bridge_get: for the pl->bridge.next_bridge, refcount =3D 2
>
> Here you are missing one put. There are two drm_bridge_put(__free), one f=
or
> next_bridge and one for selected_bridge. So your list should rather be:
>
> 1) next_bridge =3D of_drm_find_and_get_bridge: refcount =3D 1
> 2) drm_bridge_put(selected_bridge): noop, since selected_bridge is NULL, =
refcount =3D 1
> 3) selected_bridge =3D drm_bridge_get: refcount =3D 2
> 4) drm_bridge_put(next_bridge) [__free at loop scope end]: refcount =3D 1
> 5) pl->bridge.next_bridge =3D drm_bridge_get(), refcount =3D 2
> 6) drm_bridge_put(selected_bridge) [__free at function scope end]: refcou=
nt =3D 1
>
> The idea is that for each pointer (which is a reference) we get a referen=
ce
> (refcount++) when the pointer is set and put the reference when that same
> pointer goes out of scope or is reset to NULL. "the pointer is set" can b=
e
> either of_drm_find_and_get_bridge() or an assignment, as each of these
> operations creates another reference (pointer) to the same bridge.
>
> Does it look correct?

Based on this discussion I thought the commit message could be clearer, and
rewrote it as:

-----[no changes from here...]-----
    drm/bridge: imx8qxp-pixel-link: get/put the next bridge

    This driver obtains a bridge pointer from of_drm_find_bridge() in the p=
robe
    function and stores it until driver removal. of_drm_find_bridge() is
    deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
    refcounted and use bridge->next_bridge to put the reference on
    deallocation.
-----[...to here]-----

    To keep the code as simple and reliable as possible, get a reference fo=
r
    each pointer that stores a drm_bridge address when it is stored and rel=
ease
    when the pointer is set to NULL or goes out of scope. The involved poin=
ters
    are:

     * next_bridge loop-local variable:
       - get reference by of_drm_find_and_get_bridge()
       - put reference at the end of the loop iteration (__free)

     * selected_bridge function-local variable:
       - get reference when written (by copy from next_bridge)
       - put reference at function exit (__free)
       - put reference before reassignment too

     * pl->bridge.next_bridge, tied to struct imx8qxp_pixel_link lifetime:
       - get reference when written (by copy from selected_bridge)
       - put reference when the struct imx8qxp_pixel_link embedding the
         struct drm_bridge is destroyed (struct drm_bridge::next_bridge)

Do you think it's better now?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
