Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0404B9D5A4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 06:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F59110E832;
	Thu, 25 Sep 2025 04:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pd3iiixg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AA110E831
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 04:01:33 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0opc6002792
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 04:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IVLoNqcHzjdHSJF0+cAjgbUnE3s1NqEYDp0FPp5OiX8=; b=Pd3iiixgXSsj/gci
 E3l4G7wAxQyNa42+rTKII4AMq+rUVNsGkBpa/g5SNNPnOf/hI1BhC7MX0Zm/dK0i
 Xg5dPonGOJ2QBpcTTrHrbJGJRD2WQLjandGmfdUEONhh6bwc+9v9UGe+Dp2+w6Tt
 tTY0XzEcYKzya1Ti8L21OaqMELHUkrzM95KGvQviKfIiSkXYXlGiPEb6XYa0ch5Q
 YIs6a0SDge50q2pxK5cLXKYO9RV0x5C9FO8WTE5CpZbK92u4C5UOi7156BOgTBXz
 oRaGhF4DEtw6Yu0ojWnFbXJYYKAWYu5IZ5Jc9px4mtpyWmwsZzVyU3bISfeVmtty
 DE9e8g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf16ws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 04:01:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4d9a3ca3ec8so10250601cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 21:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758772891; x=1759377691;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IVLoNqcHzjdHSJF0+cAjgbUnE3s1NqEYDp0FPp5OiX8=;
 b=pr1Q0ASVqF5HzPODLLHjO4YUgmajKAiL1VLZNa+tvI/aBKffMnEZuk9/YJEisIm9op
 EG15NJOdj31ZH/PltePyedCAc43lOwkLLe3MxC+Gtcq3MJcHpaMeMJZ5Qt7YhAkYh019
 UG/mtIYu4aUqR6eDmmVyKge4gDLsN6bNl0IqcL+n5fQUbB6wfBQhJVY76gVzMjZB4aGq
 gcGe8p5peZlVmdK8HCYdGA5DMMyF2g81+K3kDXdGqr1UNiXKihHjXn4WINBDstouEtkn
 6Br5fDzH2Ns1v0UJKZUMd/I2+2nLJHsWzI/F3+0yzBXBOc8a5nd0e3vJQne5egazB51B
 2P5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3ag3F0tDio0yOpHAHk/tP0dtxT9SHDZ+XWVrchgelhPJ2nRrrnGF+X/metgOdCDbu7fvVAs/ZGL8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfU/pdwdoU59v5jFJN3N9WS+tvcarH4JD7Yx1tK9sziE57yFpb
 dNQ894nQ6lyFLK3QJWHrmR0VXzpQqGO3xHGJUmmJBWu53+YjmPePmZe/OUHvcyfG1fuRU/l22YG
 MosK6WaV/OkY8rvwfc7L39IZDD2dor2pNNqwhCsW5cjVF7247z/V/Spwd+kxqcGaBle8OhXY=
X-Gm-Gg: ASbGncuz7N1E79/y+NmQCAdrawRrQIirbtZqWvc7+F6Uiii3SmLTmVrouqc9x+0Hi61
 DqeXqcD+36C+e0XXuwcOAJoR2R/cPEL5naByuJ8rJ9CUY3EeC+iOIAv1xPxLY1y6gRXKCtuU/0z
 PB4kAyc4N6Wt5sIMgcgyyEUPH2K3owTNmp5S3Ug/fjyQsVhmbeolHrxibttshqhyOy7hM5i9TaG
 luvkR78XYTqHeCmb40WNcTYtDJzhllnl01jUrrnf3RZ29BWqJSeZr7JFadKzsbTQiQZbZwLNwR0
 JCunAO6z7ANKSeU9nR8QeUnC3Ls7s/Pz7gLNs/UItkrTGEqhZE/PN2Q4cnurkio3vbhUfjGVm57
 k8a+hwJZzw8njB6opBEQwuOeStleploC93CJTA+Up337OD+dMnqsV
X-Received: by 2002:ac8:5949:0:b0:4d8:fb05:d12b with SMTP id
 d75a77b69052e-4da4744e2c2mr27729711cf.10.1758772890797; 
 Wed, 24 Sep 2025 21:01:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZca+Iw2GZZsul8eiKgFQhtN//Wh11qIWaGFhGrwSz/NV22XiiNrfgNPym6U08AZdNqARbEg==
X-Received: by 2002:ac8:5949:0:b0:4d8:fb05:d12b with SMTP id
 d75a77b69052e-4da4744e2c2mr27729001cf.10.1758772889959; 
 Wed, 24 Sep 2025 21:01:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb4773b19sm2521751fa.13.2025.09.24.21.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 21:01:27 -0700 (PDT)
Date: Thu, 25 Sep 2025 07:01:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/7] usb: typec: Add default HPD device when register
 DisplayPort altmode
Message-ID: <6jlv47fgiq4anpflbs6agre4irf7grgvzorrk7roxwprtyuek6@edrya2syhchi>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-2-kernel@airkyi.com>
 <mygbqhiom6pkwsadzz2bqf5bth3ogsbd6iku5a7r5swxrakein@fjhz7udnkcks>
 <e9cf0aa8-ed32-4ffb-a755-150742455808@rock-chips.com>
 <sgvrzhbhkzxbuybmws44kyenhfyppm3blijkarypcin4fiscvx@mnajrlmicyxi>
 <18f55fe7-7c68-4982-916d-11752325c667@rock-chips.com>
 <bh73nttewwhom2pqccfnapnfkrys3zljkykgqmh4hsdalqgyzi@gbl5oejxsp3z>
 <86753f21-1996-4b93-acca-575a193a5bb8@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86753f21-1996-4b93-acca-575a193a5bb8@rock-chips.com>
X-Proofpoint-GUID: cDK-geAyiXF80dY0KcnRPhZNnnQgSBcG
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d4be9c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=s8YR1HE3AAAA:8 a=nLKCdIsASqLPV_WZ6OsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX3nlDgQM+QXrv
 oEOwnvEeDnm6Sy+06KJ+3refIkAVtnI7KQzXcyS9AUPm25KChOfjx16ECQq3MOrjGwJ5Ud5ay2t
 VQuOoEfD1NT62DPb+l7v8Z1kSuErBJW0ljbwcjpMk9nnzZhDKhuvu8H//VyuTMbiSgj2Fg6pfpz
 LZkH1l+sPd/qAPyGgJ9Vwwr2NuOhuIPz04/IE2oLanNSSXREZ3GhUUe6tpaIeZsDuGRkypQ8CKw
 ul40vAwn2e+GMg712cwNM1BUgJXnBnSRxqH7nFa15qrukguroz7XaGrOVB+MofSuBj43PLkulOr
 9Vej9OEs3wtQgWGBpdgQjN5M69rkSyfBmieoRwTEGPatZ0WNe7QWSVwoSQsYpxmlW8JfYKUuPl5
 oNPyTfnc
X-Proofpoint-ORIG-GUID: cDK-geAyiXF80dY0KcnRPhZNnnQgSBcG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168
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

On Wed, Sep 24, 2025 at 05:55:39PM +0800, Chaoyi Chen wrote:
> On 9/23/2025 6:40 PM, Dmitry Baryshkov wrote:
> 
> > On Tue, Sep 23, 2025 at 05:07:25PM +0800, Chaoyi Chen wrote:
> > > On 9/23/2025 11:11 AM, Dmitry Baryshkov wrote:
> > > 
> > > > On Tue, Sep 23, 2025 at 09:34:39AM +0800, Chaoyi Chen wrote:
> > > > > On 9/23/2025 9:10 AM, Dmitry Baryshkov wrote:
> > > > > 
> > > > > > On Mon, Sep 22, 2025 at 09:20:33AM +0800, Chaoyi Chen wrote:
> > > > > > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > > > > > 
> > > > > > > Add default DRM AUX HPD bridge device when register DisplayPort
> > > > > > > altmode. That makes it redundant for each Type-C driver to implement
> > > > > > > a similar registration process in embedded scenarios.
> > > > > > > 
> > > > > > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > > > > > ---
> > > > > > >     drivers/usb/typec/altmodes/displayport.c | 27 ++++++++++++++++++++++++
> > > > > > >     drivers/usb/typec/altmodes/displayport.h |  2 ++
> > > > > > >     drivers/usb/typec/class.c                |  8 +++++++
> > > > > > >     include/linux/usb/typec_altmode.h        |  2 ++
> > > > > > >     4 files changed, 39 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> > > > > > > index 1dcb77faf85d..e026dc6e5430 100644
> > > > > > > --- a/drivers/usb/typec/altmodes/displayport.c
> > > > > > > +++ b/drivers/usb/typec/altmodes/displayport.c
> > > > > > > @@ -14,6 +14,7 @@
> > > > > > >     #include <linux/property.h>
> > > > > > >     #include <linux/usb/pd_vdo.h>
> > > > > > >     #include <linux/usb/typec_dp.h>
> > > > > > > +#include <drm/bridge/aux-bridge.h>
> > > > > > >     #include <drm/drm_connector.h>
> > > > > > >     #include "displayport.h"
> > > > > > > @@ -182,6 +183,10 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
> > > > > > >     				dp->pending_irq_hpd = true;
> > > > > > >     		}
> > > > > > >     	} else {
> > > > > > > +		if (dp->port->hpd_dev)
> > > > > > > +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> > > > > > > +						  hpd ? connector_status_connected :
> > > > > > > +							connector_status_disconnected);
> > > > > > There should be no need for these calls. Once the HPD bridge is added to
> > > > > > a correct fwnode, the drm_connector_oob_hotplug_event() calls should
> > > > > > deliver the signal as expected.
> > > > > It seems that only drm_bridge_connector can do this. I'm not sure if I remember correctly. I'll give it a try.
> > > > Other connectors can implement the .oob_hotplug_event call. Calling
> > > > drm_bridge_hpd_notify() also depends on the connector setting the
> > > > callbacks via drm_bridge_hpd_enable(), a step which is done by only a
> > > > few drivers.
> > > Hmm, let's go over this again. First, drm_connector_oob_hotplug_event() requires a connector fwnode.
> > > 
> > > On the Qualcomm platforms, the fwnode corresponds to the USB-C controller device node, so
> > > 
> > > drm_connector_oob_hotplug_event(dp->connector_fwnode, ..) can handle them directly.
> > > 
> > > But our platform doesn't use the USB-C controller device node as drm connector fwnode :(
> > This sounds like an issue to be fixed. Alternative option would be make
> > the AltMode code find your fwnode and report OOB events against it.
> > But... I reallly think that using connector's fwnode is the cleanest
> > solution. In the end, your final 'display' connector is the USB-C
> > connector present on the board. If your display has a USB-C connector,
> > that will be the socket that gets the cable from the display, etc.
> > 
> > > So I use drm_dp_hpd_bridge_register() and drm_aux_hpd_bridge_notify() here, I think it just create a simple hpd bridge to bridge_list.
> > > 
> > > But drm_connector_oob_hotplug_event() use connector_list instead of bridge_list.
> > The OOB interface was created by x86 people, but we successfully reused
> > it. I think that addign drm_bridge_hpd_notify() calls just duplicates
> > the effort unnecessarily.
> 
> Yes, that commit comment said,  "It was proposed to add the displayport OF property to the DT bindings, but it was rejected in favor of properly describing the electrical signal path using of_graph."
> 
> But in the embedded case, we don't seem to have the opportunity to describe this kind of of_graph relationship between drm connector and usb connector in usb-connector.yaml. On the Qualcomm platform, the DRM connector fwnode to correspond to the USB-C controller, which is a clean solution.
> 
> However, on our platform we are using external USB-C controllers. In v4 and the previous versions, I focused on directly linking the USB-C controller with the DP controller. Referring to your suggest in [0], I think maybe this can be achieved with the help of the drm bridge chain. Assuming the bridge chain is like this:
> 
> 
> Other birdges ... ->PHY drm aux hpd bridge -> CDN-DP bridge -> DP to HDMI bridge or other bridge or nothing...

Looks good to me.

> We can use drm_bridge_chain_get_first_bridge() to get first bridge. In this case, that is drm aux hpd bridge from USB-C controller device. Next, we can obtain the fwnode corresponding to this bridge, and once we have it, we can set the connector's fwnode to it. In this way, drm_connector_oob_hotplug_event() can take effect.

drm_bridge_chain_get_last_bridge(), yes. That's what
drm_bridge_connector is doing. You'd need to make sure that there is a
drm_aux_hpd_bridge() registered for the USB-C connector node (from your
Type-C controller driver or from the altmode driver as per your patch).

> 
> 
> Would this be a good idea? Thanks.
> 
> 
> [0] https://lore.kernel.org/all/p3kgqn3euumhysckh4yyqavqv5y6any5zcrgkrcg3j5a7z7cyw@lfpkla5p3put/
> 
> 
> > 
> > > 
> > > 
> > > > > > >     		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> > > > > > >     						hpd ? connector_status_connected :
> > > > > > >     						      connector_status_disconnected);
> > > > > > > @@ -206,6 +211,9 @@ static int dp_altmode_configured(struct dp_altmode *dp)
> > > > > > >     	 * configuration is complete to signal HPD.
> > > > > > >     	 */
> > > > > > >     	if (dp->pending_hpd) {
> > > > > > > +		if (dp->port->hpd_dev)
> > > > > > > +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> > > > > > > +						  connector_status_connected);
> > > > > > >     		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> > > > > > >     						connector_status_connected);
> > > > > > >     		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
> > > > > > > @@ -391,6 +399,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
> > > > > > >     			dp->data.status = 0;
> > > > > > >     			dp->data.conf = 0;
> > > > > > >     			if (dp->hpd) {
> > > > > > > +				if (dp->port->hpd_dev)
> > > > > > > +					drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> > > > > > > +								  connector_status_disconnected);
> > > > > > >     				drm_connector_oob_hotplug_event(dp->connector_fwnode,
> > > > > > >     								connector_status_disconnected);
> > > > > > >     				dp->hpd = false;
> > > > > > > @@ -751,6 +762,18 @@ static const struct attribute_group *displayport_groups[] = {
> > > > > > >     	NULL,
> > > > > > >     };
> > > > > > > +void dp_altmode_hpd_device_register(struct typec_altmode *alt)
> > > > > > > +{
> > > > > > > +	if (alt->svid != USB_TYPEC_DP_SID)
> > > > > > > +		return;
> > > > > > > +
> > > > > > > +	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
> > > > > > > +						  dev_of_node(alt->dev.parent->parent));
> > > > > > This needs at least a comment, what is dev.parent->parent. Also, the
> > > > > > of_node is not correct here. It should be a node of the connector,
> > > > > > rather than the device itself. Consider USB-C controllers which handle
> > > > > > several USB-C connectors (e.g. UCSI). The DRM core won't be able to
> > > > > > identify the correct bridge.
> > > > > I think  alt.dev->parent->parent is the connector device. Am I missing something?
> > > > As I wrote, it needs a comment (in the source file). No, it's not a
> > > > connector device, it's a USB-C controller device. There is no guarantee
> > > > that there is a separate struct device for the USB-C connector. On
> > > > Qualcomm platforms, the device will point to the USB-C controller (TCPM
> > > > or UCSI), which contain usb-c-connector(s) as child node(s) in DT.
> > > Thanks for the clarification.
> > I think it should be fine to pass the fwnode of the usb-c connector that
> > is outside of the USB-C controller device (if that's what your platform
> > uses). But I think this should be:
> > - the usb-c-connector node
> > - it should be coming from the Type-C controller driver, you can't guess
> >    it here.

-- 
With best wishes
Dmitry
