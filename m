Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B75C1514957
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 14:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3512110E8CD;
	Fri, 29 Apr 2022 12:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C58210E8CD
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 12:31:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRQ0BlPTFaFe26JO7vhTmTBfETKlJlwDFke2Rz76LMOPb7o+lmkOgDZg0OWsQFUzHV+DqwczPOWWju4awgKfV6UMTVECCOODREf2v2tGGufaO+xlJhqmF6pwlyMrceJsdlgQMXVjQQ6PjLbGsJaO4F0Ww+oTsZdP2zfMsFRbxjmUYpvE9HNaekyAzJ+QhVwFyY0opQPq6ld8CVuuUGuS9t+zmVMGHNDzacK0xOwpm1sWHAFLQO+heyh7jeg6YZjBYsvJhgPZisUnbQYOMs3gy6gv/mJOh5ZkV/nTobmwwmWciiIKh9xA+rLyDDw1zZE6sKQ4pdFiRC5wLlHL0X7ADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1AvEDK5QlOiiZbusUC4RoQIN3aACsTkdbKESwe66TQ=;
 b=WpmRWcrMtULVeobhuuOSCZybYz0Dmh2pRDq4mfzn2bpmaxGnU/twUNAdknwYqtYWF1kz5bg64N3K4ebSpwIeDwD6de/ybddMjhZohKqDJKQNzHeM2yCZZTi9VU0aaCtV0qxrQWT16ouzeITxORcqVx9tFE66ODPIiDMIrgwgKuFbxUkgV4suNqdWiaprMnUPnSmjgSpZHk2/Xuz0f2/ciduUv2VuGkB94q+nJ6MTRzaLhj5XHzZf5QIoSegoPbTz3YtZ0orp9MGfV1fhLD5QeDkpV+wn7QJCMr1uEu8RTRtJH5YrPbzW0O4Ed5h6CQaSPrt8moO5PLz740LDD6ECCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1AvEDK5QlOiiZbusUC4RoQIN3aACsTkdbKESwe66TQ=;
 b=F4aNZkJtKNXMhg8I22XqHg9cTLWx5P6JZfID+Bo8ohIVy907ROvqgdm9VWbBS5gngnECFvASzfsg5fNgqlZOEs6cE/GoUweMaoMnMgpSy1WI4bjGOxkWuqQ+lhfWbxf9rDt6eUHi7i2S6ZN1wbUbaURvJLTvnemTmO0tNQTrlK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7646.eurprd04.prod.outlook.com (2603:10a6:102:f3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Fri, 29 Apr
 2022 12:30:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::f5d8:2b7b:6f48:51f8]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::f5d8:2b7b:6f48:51f8%4]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 12:30:57 +0000
Message-ID: <538339829534d8ef10c68198016d198a9ec037fc.camel@nxp.com>
Subject: Re: [PATCH resend v8 1/5] drm/bridge: nwl-dsi: Set PHY mode in
 nwl_dsi_mode_set()
From: Liu Ying <victor.liu@nxp.com>
To: Guido =?ISO-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
Date: Fri, 29 Apr 2022 20:30:43 +0800
In-Reply-To: <YmLkv4PYsi+XiFr5@qwark.sigxcpu.org>
References: <20220419010852.452169-1-victor.liu@nxp.com>
 <20220419010852.452169-2-victor.liu@nxp.com>
 <YmLkv4PYsi+XiFr5@qwark.sigxcpu.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK2PR04CA0067.apcprd04.prod.outlook.com
 (2603:1096:202:15::11) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c03723eb-aa99-42d9-6dfc-08da29dc1b88
X-MS-TrafficTypeDiagnostic: PA4PR04MB7646:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <PA4PR04MB764620923CEA9A1EC1BF2E0A98FC9@PA4PR04MB7646.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: veFj4RPSYyG/jFTPxMQ+dQEu6e3Hnrs1lCp56P1p8QJOfPcAG8GhxizQnEmQwVRuxfQKknLvsAxzb0YuJ4kf0TTkI3JeWBnZCDZoOpWhaZcUrIK/VI5+0KSdjxSVcO+Inqovv4gd1uOWCELLg6RriKYbBNsp7qON6GGnkgo/mZ3QjBL5x5y5rfYJQxW48wP+/qI9IM6b65MKSR2PPDD2slLEhRVddHdQ0n48wLY977ve4BUtu1mBvjogEPbZeGmY96zCo64iMw7e8mJ8l/Av2BgJtTET3NoQRgQFs/6603ElU6UFiCkmpKnX6wcJekUtxzqJO6Rz5op6uP9BAFby9KOka7sTANbXnNPN5mwmXDBb4Z/Bcc2BQUyQTRBdphgqQSxUUhmOo+KnpcyYMNTWbcx+iq+LosYKJlAKsEj2peJ+JBMCG1BJDlBuaPifyFjogbKIhKvQ2BYOTbgqoi0ppa2zu65lE5HRlQS0HyRFqut8pbBlWYFrpVX3URe+8A4KXpkkxka/tnTEL6ojakgKd6Qz47wMSSJlqOKUshuwNMVajxWJ3Vp2fenfMwGY9Z7kVf6uB+HfqcMXI1lzPd1fobmYMETLVh6Qc8hL+tWnOz4ulOu9AbK1+ASOiCtVLHm4YvprRXCPhZAH6I4dbvZQdcRZ2xxNys5fTWW4qunD/yqhE3kJqJbhdEXg9cGN1Y5Cp6k4FgzLxXkv8TuxcdxZXUbaw9yEiFb6w+sPoLfMnAc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(6512007)(508600001)(6916009)(316002)(83380400001)(6486002)(4326008)(36756003)(8676002)(66946007)(66556008)(2616005)(66476007)(186003)(38350700002)(8936002)(5660300002)(38100700002)(86362001)(52116002)(6506007)(6666004)(7416002)(2906002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXR0dTVtNVRvL3pjODZlUXAxNHRSRG5oRHl3bzU5TUJkVlZaS0E2dHo0QXJj?=
 =?utf-8?B?U1pUN0czd2YyWXRaZDVKak8zKzdQWkxOWmdEVUlEU0dnNlMrVHlMODV0S3JY?=
 =?utf-8?B?RzBGbXNhOEdPcFYvM0p1bUtmWTBnbFVMSFB5QWpjWWlYYmNoUkszYkF5Mjhz?=
 =?utf-8?B?VXVKZVpLQmlhYWZJVTlYVU8vUzJsS25rNnpVTTVOUXJhc0RuZUhkcURBMytu?=
 =?utf-8?B?Q0xXVzlaK0cySDlkdktLcmJjNlhXU3RIQ3Rid3Bkdzg5aWxOU1dwZlpnL2J2?=
 =?utf-8?B?NWk5V3dtclBhbkZzK1dXOXpHMmlDWVJvQzFpdnMxamxQckdqNldMNGZEZXEr?=
 =?utf-8?B?OWRiRG9NenZQR2tjZEdrZGdhandCZkEzeFRXRVEwWjkvMlJ6R1ZRYmxuRk5O?=
 =?utf-8?B?TUJxVVJFZ2hFdm9KdVR5bUpKdlptNFNLeUxTdEI1UWF5T2NhcmFOaTVXdUY4?=
 =?utf-8?B?MTFUaEd2TlJjT1JaR0xOVzZtTjBHNUZrTSsxZlI1c1BXclNoSzJMT3JSNUJE?=
 =?utf-8?B?RlFCQ2I2WG95WXZDci9uMVpmckNrSjZCNlEyQ1VqaUZDdkNMZTJEc2FYUEJk?=
 =?utf-8?B?ME5NOVZOUVZ3OEMwc0wweDR1bWVOYmx5L1pqVzdRV3dIUEFjRmhqMHNVZmpw?=
 =?utf-8?B?WC9HMVlpb3JTd3dIT3ZvbDN3RlByZUExZzJkRjBiaDdlL0hQd1hYSThGV2c5?=
 =?utf-8?B?WXd2Tmh2ZE5LK3U4K09rUmxZSFR6YkZkM3VZS1RMZUNSeXdBbU51M3FNSjl1?=
 =?utf-8?B?Yk1TNWMxWWNaZVN2UWg5OWQxd0xhQzI2RnFjdDVhaGxJYjhNWE1FRk83b2ha?=
 =?utf-8?B?Vy94dmZ0dm94T0RkNWVHYmtIcnYyOUV4OTVpVS92djRXQzlDd3dndENRZmQw?=
 =?utf-8?B?S0lMN3R5Q0xEYUx5TWYrRWFtMnV2L05zbGtXVUowb1ZzUWw2aWNWd3VsZE5U?=
 =?utf-8?B?bHAva1NwS2RRYkYwMTJNZU1YVHNyRVRmamFDc0xVbEplQ21sSEwrMzdPWUVJ?=
 =?utf-8?B?MjFFU2dwMW1XUEloUUtjZkhNd0FVOVhYVExibmo2UVFRWmxuaVV1OFFmR1lX?=
 =?utf-8?B?cnpIc0FsUDB3TzZZU0p6a2U3RCsvVjU3SXJadks5bDJ0S0t1bHZYV3FlblU3?=
 =?utf-8?B?dVhDRkNUVk8wdzdmM1MzekhKT09hVUJxN3RnbVRES0hnZmZGd3JPNkdYVHlT?=
 =?utf-8?B?cytiVFlqSk5pT0JzNE5CK1FOVjJESVJkeDdxSytKU0tvUGdiKzMzSVZRMlF4?=
 =?utf-8?B?L3hiUyszQlZ0TWxkZnNrYll2VnMzZ2FVT0loVkVPdmloaEcxcUVxN0VMNmVl?=
 =?utf-8?B?U3QraTRVdytPajd5bVY3UVR0REJIZTdXdytHMEtUZzlSSWppTWd5ckxURU5S?=
 =?utf-8?B?T2VQSlorbnVFMFBkMkhyZjBBRnR2RE4wcnZuZklneFZVZEtJOWtkUFhITHhv?=
 =?utf-8?B?L3Buc1IwdzY3c1gyKytUMzNVVW9mOFgwUDM5TnNlNW1KT0F1SzN6Y1RqeUg4?=
 =?utf-8?B?WS81WmhDaUZHMysvcGkyY2FKc3REYk5wRDZkaHVSdjd6ajNaQ1k2Y2o2Tkwx?=
 =?utf-8?B?clBVUlBHOWoyTzYwRitNU1lpNytKR3JST1hxT2srK0xyRXJKT2ZyOW1XOUd0?=
 =?utf-8?B?b2RHVlpPVU5nTDAzb2s0RW5heWdVK0pkK1BKM3dDekNmclpKZ29rNnhrWEdk?=
 =?utf-8?B?Lzl1V0ZpTE1FWHhwSDlJNmtMUEsyTE50eTY2b1RlSFl3K05UbjJCU0RkMVBX?=
 =?utf-8?B?Wm9iYTAyamdOam1YTm1zSExmVldFbkpLN3NnU0c5NldwdTNlcmd5N2NhaU01?=
 =?utf-8?B?NHAzZXBZZmRtNkEzWGJ0NUNXcVNFWm5DUkhnd3N2SC95aVhrWlhic1VkTmE4?=
 =?utf-8?B?bGV0dzdYdjczL2tVVzlETWRTS1l4dVYveWtURS8vZG0yMi9YRVFrSVhYOFhE?=
 =?utf-8?B?SnplSlRXaEViTXczSkZsT3JUZzlySkI5QnpqaWowUTRZOGMrbGNheU4zT3lF?=
 =?utf-8?B?RU9jZWtrN2hqNzlneEtsMkJhd0c1cE9PQWsxV2JYb1oxRjllZVgrWG5zajdq?=
 =?utf-8?B?aFo1RklacVJHZ0k4V1VpUng1ZDZJQVZJTjlZSzBDZFI1bktXNzIyU2JzUDBI?=
 =?utf-8?B?TERKbHlaZnhjMnRnVWNaZExPc3piblI0RWFzbnlIeVNBVUN1amRXNERSYUdS?=
 =?utf-8?B?Vi9rMXNYdzJqTjkxN3Q1WERvRHd4RzA3bTc1b0todXNsSVIybmhzbnZKU2Y4?=
 =?utf-8?B?aTJtNkpvUkFXZ1FIQmI1bGNWWHpucVdwT3ZSN3hIcStVNFFZMFpoNDB1alQx?=
 =?utf-8?B?S0FCQm9aM21aSzRpRDhST3JydktYQks1ZFNOQ1VkZHE3OCtUNmgwQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c03723eb-aa99-42d9-6dfc-08da29dc1b88
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 12:30:57.2371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFD3dnmoY4YQamWOL/SHZSxxf5i6EXvuipOJYkIRU78biPDWntoOzQVBodsx5DnheHrLpZznll9qA+2otlxMOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7646
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 linux-phy@lists.infradead.org, martin.kepplinger@puri.sm,
 jernej.skrabec@gmail.com, kishon@ti.com, linux-imx@nxp.com,
 robert.chiras@nxp.com, devicetree@vger.kernel.org, kernel@pengutronix.de,
 jonas@kwiboo.se, s.hauer@pengutronix.de, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, vkoul@kernel.org, krzk+dt@kernel.org,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 2022-04-22 at 19:24 +0200, Guido Günther wrote:
> Hi,
> On Tue, Apr 19, 2022 at 09:08:48AM +0800, Liu Ying wrote:
> > The Northwest Logic MIPI DSI host controller embedded in i.MX8qxp
> > works with a Mixel MIPI DPHY + LVDS PHY combo to support either
> > a MIPI DSI display or a LVDS display.  So, this patch calls
> > phy_set_mode() from nwl_dsi_mode_set() to set PHY mode to MIPI DPHY
> > explicitly.
> > 
> > Cc: Guido Günther <agx@sigxcpu.org>
> > Cc: Robert Chiras <robert.chiras@nxp.com>
> > Cc: Martin Kepplinger <martin.kepplinger@puri.sm>
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>

Hope this patch won't fall through the cracks.
Can someone please apply it to drm-misc-next? Robert?

Thanks,
Liu Ying

> > ---
> > v7->v8:
> > * Resend with Andrzej's and Jernej's mail addressed updated.
> > 
> > v6->v7:
> > * No change.
> > 
> > v5->v6:
> > * Rebase the series upon v5.17-rc1.
> > * Set PHY mode in ->mode_set() instead of ->pre_enable() in the
> > nwl-dsi
> >   bridge driver due to the rebase.
> > * Drop Guido's R-b tag due to the rebase.
> > 
> > v4->v5:
> > * No change.
> > 
> > v3->v4:
> > * No change.
> > 
> > v2->v3:
> > * No change.
> > 
> > v1->v2:
> > * Add Guido's R-b tag.
> > 
> >  drivers/gpu/drm/bridge/nwl-dsi.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c
> > b/drivers/gpu/drm/bridge/nwl-dsi.c
> > index d5945501a5ee..85bab7372af1 100644
> > --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> > +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> > @@ -666,6 +666,12 @@ static int nwl_dsi_mode_set(struct nwl_dsi
> > *dsi)
> >  		return ret;
> >  	}
> >  
> > +	ret = phy_set_mode(dsi->phy, PHY_MODE_MIPI_DPHY);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "Failed to set DSI phy mode: %d\n",
> > ret);
> > +		goto uninit_phy;
> > +	}
> > +
> >  	ret = phy_configure(dsi->phy, phy_cfg);
> >  	if (ret < 0) {
> >  		DRM_DEV_ERROR(dev, "Failed to configure DSI phy: %d\n",
> > ret);
> 
> I can't currently test this but it still looks good so
> 
> Reviewed-by: Guido Günther <agx@sigxcpu.org>
> 
> Cheers,
>  -- Guido
> 
> > -- 
> > 2.25.1
> > 

