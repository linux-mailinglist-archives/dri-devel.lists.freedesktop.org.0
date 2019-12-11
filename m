Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EF911A980
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 12:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079106EB08;
	Wed, 11 Dec 2019 11:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70048.outbound.protection.outlook.com [40.107.7.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6856EB0A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 11:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwN8PcxqFOtQmAt6wiqXPgWG7g6A4BFgTzN4NDdK6ak=;
 b=rAYeFlymSQPewpupifB8UH7ivgIO+ASgPtUal+becRD6GPyJVa8Sz0FLlFlXcGr9iklpMBoHmlrQonA6S/yn5HDcnieoMQ2prbnlOKIEjpdnTEEw+bjGhhgJBoCWD3urfyfD1Dm+n9Z4KBUnl7Wz7RDWM9swKAwh+EmyHYjOY74=
Received: from VI1PR08CA0086.eurprd08.prod.outlook.com (2603:10a6:800:d3::12)
 by VI1PR0802MB2446.eurprd08.prod.outlook.com (2603:10a6:800:ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14; Wed, 11 Dec
 2019 11:01:45 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::202) by VI1PR08CA0086.outlook.office365.com
 (2603:10a6:800:d3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.14 via Frontend
 Transport; Wed, 11 Dec 2019 11:01:45 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 11 Dec 2019 11:01:45 +0000
Received: ("Tessian outbound 64ac59f2ee79:v37");
 Wed, 11 Dec 2019 11:01:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6bc191d44bf8abe1
X-CR-MTA-TID: 64aa7808
Received: from 90db28842b0f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C15BE57E-1C01-43D0-B56D-B69FC9577409.1; 
 Wed, 11 Dec 2019 11:01:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 90db28842b0f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Dec 2019 11:01:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/lVgNfMlMtQX6xswtzK52hiH2EpjR7vDj//tEFtbstfrQZlNHcmzaWZXK0NSbzBFoyOY9D+MBI3DacO7k4xzLT1k+cpnevRKY9Vi8xZ7s4WqzvIR9cCW93W8EvkkXJ9S1viVaW00FGSl8I0jF7jPGVbrde6U1dMxsj371vRTLcdiU5tMAhfdGO6InRlZpmZb825HLJFzVjdTfQiSLKb9XhGxUBzWgkgpwQTen1ipWI8qQo5n9O2Qf31IpxETXFU/Jjh1hXpV3B5xxk+eeiOA9PQ5JLoG9WZ4ajbEv80LMV6zdIxDdursfztJ9Nt1Z4CghdEzNBrRvchdc5ylPQDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwN8PcxqFOtQmAt6wiqXPgWG7g6A4BFgTzN4NDdK6ak=;
 b=KjHQ7tUB6PV0KTcHkjpecjiUqjabnqVviKNgoFFJ998OojuhUWggljHKM62FrqWU991OmpAGQfxqdvnvQp+WFg2vDfwXxVH06qMp0RPjUijZ13IkMKC7qC69i+75o0sInKOPoTKdpxnzH5RtrBARn7Q8M3gcZo4oojOmwXvsWjx2hKL6AGFIT1UunUmdkMe4MfIAbHC0FPI9B7+hK0r/vAfmKUN4h723lDJk3TqZqiNtqQwzGY6QnEey3sbYsHpm79ifv0Qr3wACXA0mNKS+XHH85373FdazqLlgRe6yWft6zP8mu6X4DO5JNiI9u92kpgIcYGxaqWtqfJtUX7QHcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwN8PcxqFOtQmAt6wiqXPgWG7g6A4BFgTzN4NDdK6ak=;
 b=rAYeFlymSQPewpupifB8UH7ivgIO+ASgPtUal+becRD6GPyJVa8Sz0FLlFlXcGr9iklpMBoHmlrQonA6S/yn5HDcnieoMQ2prbnlOKIEjpdnTEEw+bjGhhgJBoCWD3urfyfD1Dm+n9Z4KBUnl7Wz7RDWM9swKAwh+EmyHYjOY74=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3901.eurprd08.prod.outlook.com (20.178.80.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Wed, 11 Dec 2019 11:01:37 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2516.018; Wed, 11 Dec 2019
 11:01:37 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 04/50] drm/bridge: Add connector-related bridge
 operations and data
Thread-Topic: [PATCH v3 04/50] drm/bridge: Add connector-related bridge
 operations and data
Thread-Index: AQHVr61Yginenu0TWUKL7qtCKfCf1Ke0uquA
Date: Wed, 11 Dec 2019 11:01:37 +0000
Message-ID: <17760433.LU8cBYXBuO@e123338-lin>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-5-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20191210225750.15709-5-laurent.pinchart@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LO2P265CA0308.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::32) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f9f8f310-31b3-4e86-0318-08d77e29834e
X-MS-TrafficTypeDiagnostic: VI1PR08MB3901:|VI1PR0802MB2446:
X-Microsoft-Antispam-PRVS: <VI1PR0802MB244667BF4A46DA4D570F4FB78F5A0@VI1PR0802MB2446.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:751;OLM:751;
x-forefront-prvs: 024847EE92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(189003)(199004)(9686003)(33716001)(52116002)(81166006)(6512007)(26005)(8936002)(478600001)(81156014)(5660300002)(186003)(66946007)(66556008)(6506007)(66476007)(86362001)(66446008)(64756008)(54906003)(6916009)(2906002)(316002)(8676002)(71200400001)(6486002)(30864003)(4326008)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3901;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: SLddQ1yyFlfyCbYj+6ofWLf+S/Gc8RQnLCoI58CV2rGq7VNbCWkuWx6eIb1hVdBIOJIkqQsW/qsJ1pHM/s0k399cQwmvtoQEhj4IdLHS/FlGjjuWuREg05Fjj2zf8QLKoPXbw7aLQMEXSzpL4eQrbL6yAyAD7yWfXJRZY1A8eYNEjIfUnbQ08Mk7EGwzfoiJpOxhNXEB4lelVwPAigaw5RLJ09d0YzpARejSLlTKjuQgsarfALEUq5Nh3YKJY/HnsHjMXEw69C3xbWuYnPIj3raJfB9S696quEwGijFzpPNyhZwT7xCGQafu6VIRppUX2BElw4msLvojPQn5fQF7lXfGYn3iyP6nPZwReekbSZrO0lhrH9xSqDsW0/lJ0xcHJ9YJs6LdOcm9HpRJu46LAk2fG4QVUmbpsAaYYc/7P1ioThvBy0lOGy8q+auxs6PMUCUM5ks9NvwyUtVTCohxlG/g9vSozJiakzivaJoTsRHJL22NK3IQtGZCMzSHU3ii
x-ms-exchange-transport-forked: True
Content-ID: <EDDB7BF24636624DAC6B6B50706F51BC@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3901
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(39860400002)(136003)(396003)(346002)(189003)(199004)(6862004)(6486002)(107886003)(186003)(54906003)(33716001)(26005)(356004)(4326008)(9686003)(26826003)(2906002)(6506007)(478600001)(70206006)(86362001)(8676002)(70586007)(30864003)(76130400001)(8936002)(336012)(81166006)(81156014)(6512007)(5660300002)(316002)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2446;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 299c3a0e-8ccc-49a2-dbbd-08d77e297dfc
NoDisclaimer: True
X-Forefront-PRVS: 024847EE92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gs9smRsQW+XaaU8/2J3xGHNj3CXzCBif1DZYTYpMXE3NLdz79X5Yr3ZmS7t0xUsfqhnJygCNNgEOnnHIB+6j7denjK72HZqxgLXInlMHsk/6ro7SacydDCW5yWdtBCgmgkQeJtYV5rKlyarVv/haj0WQv7ubI6f3VszZ63ayen7sPA8vEozpIiY/Y3kiN6UI+aO/JkzVHrA5OKvLMhCBTxOv2ElnLN7pqNEDy0DTHK7acl+lHbt1x2AOAvPaxJZShINvTm7ARiPF6hKtOovquiqCtg6YNZKoMSaPmk+5/L+Zy49ZznziicrZpsE7YhUukrlLiy6iNRVmIJOgPCeqfXnaXOU08Q4N8sSspPJ5Iz348qTWk21VOMt8xiDv+PewrUfehYsW+VR63HAiAHoME/LZVO5E9GLcG030lt80oCIV6zG0FI3iktLUcTFsGLUdfxX3zhw1tEz+Pb3BnvsnG4FK4jrKE2lJvIOhD+I0RcV1CtFaD7swA5x1t1kEGKH7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 11:01:45.7200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f8f310-31b3-4e86-0318-08d77e29834e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2446
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Tuesday, 10 December 2019 22:57:04 GMT Laurent Pinchart wrote:
> To support implementation of DRM connectors on top of DRM bridges
> instead of by bridges, the drm_bridge needs to expose new operations and
> data:
> 
> - Output detection, hot-plug notification, mode retrieval and EDID
>   retrieval operations
> - Bitmask of supported operations
> - Bridge output type
> - I2C adapter for DDC access
> 
> Add and document these.
> 
> Three new bridge helper functions are also added to handle hot plug
> notification in a way that is as transparent as possible for the
> bridges.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes since v2:
> 
> - Add wrappers around the .detect(), .get_modes() and .get_edid()
>   operations
> - Warn bridge drivers about valid usage of the connector argument to
>   .get_modes() and .get_edid()
> 
> Changes since v1:
> 
> - Make .hpd_enable() and .hpd_disable() optional
> - Rename .lost_hotplug() to .hpd_notify()
> - Add ddc field to drm_bridge
> ---
>  drivers/gpu/drm/drm_bridge.c | 162 +++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h     | 193 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 354 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c2cf0c90fa26..473353bd762f 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -70,6 +70,8 @@ static LIST_HEAD(bridge_list);
>   */
>  void drm_bridge_add(struct drm_bridge *bridge)
>  {
> +	mutex_init(&bridge->hpd_mutex);
> +
>  	mutex_lock(&bridge_lock);
>  	list_add_tail(&bridge->list, &bridge_list);
>  	mutex_unlock(&bridge_lock);
> @@ -86,6 +88,8 @@ void drm_bridge_remove(struct drm_bridge *bridge)
>  	mutex_lock(&bridge_lock);
>  	list_del_init(&bridge->list);
>  	mutex_unlock(&bridge_lock);
> +
> +	mutex_destroy(&bridge->hpd_mutex);
>  }
>  EXPORT_SYMBOL(drm_bridge_remove);
>  
> @@ -516,6 +520,164 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
>  
> +/**
> + * drm_bridge_detect - check if anything is attached to the bridge output
> + * @bridge: bridge control structure
> + *
> + * If the bridge supports output detection, as reported by the
> + * DRM_BRIDGE_OP_DETECT bridge ops flag, call &drm_bridge_funcs.detect for the
> + * bridge and return the connection status. Otherwise return
> + * connector_status_unknown.
> + *
> + * RETURNS:
> + * The detection status on success, or connector_status_unknown if the bridge
> + * doesn't support output detection.
> + */
> +enum drm_connector_status drm_bridge_detect(struct drm_bridge *bridge)
> +{
> +	if (!(bridge->ops & DRM_BRIDGE_OP_DETECT))
> +		return connector_status_unknown;
> +
> +	return bridge->funcs->detect(bridge);
> +}
> +EXPORT_SYMBOL_GPL(drm_bridge_detect);
> +
> +/**
> + * drm_bridge_get_modes - fill all modes currently valid for the sink into the
> + * @connector
> + * @bridge: bridge control structure
> + * @connector: the connector to fill with modes
> + *
> + * If the bridge supports output modes retrieval, as reported by the
> + * DRM_BRIDGE_OP_MODES bridge ops flag, call &drm_bridge_funcs.get_modes to
> + * fill the connector with all valid modes and return the number of modes
> + * added. Otherwise return 0.
> + *
> + * RETURNS:
> + * The number of modes added to the connector.
> + */
> +int drm_bridge_get_modes(struct drm_bridge *bridge,
> +			 struct drm_connector *connector)
> +{
> +	if (!(bridge->ops & DRM_BRIDGE_OP_MODES))
> +		return 0;
> +
> +	return bridge->funcs->get_modes(bridge, connector);
> +}
> +EXPORT_SYMBOL_GPL(drm_bridge_get_modes);
> +
> +/**
> + * drm_bridge_get_edid - get the EDID data of the connected display
> + * @bridge: bridge control structure
> + * @connector: the connector to read EDID for
> + *
> + * If the bridge supports output EDID retrieval, as reported by the
> + * DRM_BRIDGE_OP_EDID bridge ops flag, call &drm_bridge_funcs.get_edid to
> + * get the EDID and return it. Otherwise return ERR_PTR(-ENOTSUPP).
> + *
> + * RETURNS:
> + * The retrieved EDID on success, or an error pointer otherwise.
> + */
> +struct edid *drm_bridge_get_edid(struct drm_bridge *bridge,
> +				 struct drm_connector *connector)
> +{
> +	if (!(bridge->ops & DRM_BRIDGE_OP_EDID))
> +		return ERR_PTR(-ENOTSUPP);
> +
> +	return bridge->funcs->get_edid(bridge, connector);
> +}
> +EXPORT_SYMBOL_GPL(drm_bridge_get_edid);
> +
> +/**
> + * drm_bridge_hpd_enable - enable hot plug detection for the bridge
> + * @bridge: bridge control structure
> + * @cb: hot-plug detection callback
> + * @data: data to be passed to the hot-plug detection callback
> + *
> + * Call &drm_bridge_funcs.hpd_enable if implemented and register the given @cb
> + * and @data as hot plug notification callback. From now on the @cb will be
> + * called with @data when an output status change is detected by the bridge,
> + * until hot plug notification gets disabled with drm_bridge_hpd_disable().
> + *
> + * Hot plug detection is supported only if the DRM_BRIDGE_OP_HPD flag is set in
> + * bridge->ops. This function shall not be called when the flag is not set.
> + *
> + * Only one hot plug detection callback can be registered at a time, it is an
> + * error to call this function when hot plug detection is already enabled for
> + * the bridge.
> + */
> +void drm_bridge_hpd_enable(struct drm_bridge *bridge,
> +			   void (*cb)(void *data,
> +				      enum drm_connector_status status),
> +			   void *data)
> +{
> +	if (!bridge || !(bridge->ops & DRM_BRIDGE_OP_HPD))
> +		return;
> +
> +	mutex_lock(&bridge->hpd_mutex);
> +
> +	if (WARN(bridge->hpd_cb, "Hot plug detection already enabled\n"))
> +		goto unlock;
> +
> +	bridge->hpd_cb = cb;
> +	bridge->hpd_data = data;
> +
> +	if (bridge->funcs->hpd_enable)

Is this check necessary given the DRM_BRIDGE_OP_HPD check? Would a

if (WARN_ON(!bridge->funcs->hpd_enable))
	return;

suffice? Similarly for the check in _disable below.

> +		bridge->funcs->hpd_enable(bridge);
> +
> +unlock:
> +	mutex_unlock(&bridge->hpd_mutex);
> +}
> +EXPORT_SYMBOL_GPL(drm_bridge_hpd_enable);
> +
> +/**
> + * drm_bridge_hpd_disable - disable hot plug detection for the bridge
> + * @bridge: bridge control structure
> + *
> + * Call &drm_bridge_funcs.hpd_disable if implemented and unregister the hot
> + * plug detection callback previously registered with drm_bridge_hpd_enable().
> + * Once this function returns the callback will not be called by the bridge
> + * when an output status change occurs.
> + *
> + * Hot plug detection is supported only if the DRM_BRIDGE_OP_HPD flag is set in
> + * bridge->ops. This function shall not be called when the flag is not set.
> + */
> +void drm_bridge_hpd_disable(struct drm_bridge *bridge)
> +{
> +	if (!bridge || !(bridge->ops & DRM_BRIDGE_OP_HPD))
> +		return;
> +
> +	mutex_lock(&bridge->hpd_mutex);
> +	if (bridge->funcs->hpd_disable)
> +		bridge->funcs->hpd_disable(bridge);
> +
> +	bridge->hpd_cb = NULL;
> +	bridge->hpd_data = NULL;
> +	mutex_unlock(&bridge->hpd_mutex);
> +}
> +EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
> +
> +/**
> + * drm_bridge_hpd_notify - notify hot plug detection events
> + * @bridge: bridge control structure
> + * @status: output connection status
> + *
> + * Bridge drivers shall call this function to report hot plug events when they
> + * detect a change in the output status, when hot plug detection has been
> + * enabled by drm_bridge_hpd_enable().
> + *
> + * This function shall be called in a context that can sleep.
> + */
> +void drm_bridge_hpd_notify(struct drm_bridge *bridge,
> +			   enum drm_connector_status status)
> +{
> +	mutex_lock(&bridge->hpd_mutex);
> +	if (bridge->hpd_cb)
> +		bridge->hpd_cb(bridge->hpd_data, status);
> +	mutex_unlock(&bridge->hpd_mutex);
> +}
> +EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
> +
>  #ifdef CONFIG_OF
>  /**
>   * of_drm_find_bridge - find the bridge corresponding to the device node in
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 694e153a7531..56ac260094f4 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -23,15 +23,20 @@
>  #ifndef __DRM_BRIDGE_H__
>  #define __DRM_BRIDGE_H__
>  
> -#include <linux/list.h>
>  #include <linux/ctype.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_modes.h>
>  
>  struct drm_bridge;
>  struct drm_bridge_timings;
> +struct drm_connector;
>  struct drm_panel;
> +struct edid;
> +struct i2c_adapter;
>  
>  /**
>   * struct drm_bridge_funcs - drm_bridge control functions
> @@ -338,6 +343,119 @@ struct drm_bridge_funcs {
>  	 */
>  	void (*atomic_post_disable)(struct drm_bridge *bridge,
>  				    struct drm_atomic_state *old_state);
> +
> +	/**
> +	 * @detect:
> +	 *
> +	 * Check if anything is attached to the bridge output.
> +	 *
> +	 * This callback is optional, if not implemented the bridge will be
> +	 * considered as always having a component attached to its output.
> +	 * Bridges that implement this callback shall set the
> +	 * DRM_BRIDGE_OP_DETECT flag in their &drm_bridge->ops.
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * drm_connector_status indicating the bridge output status.
> +	 */
> +	enum drm_connector_status (*detect)(struct drm_bridge *bridge);
> +
> +	/**
> +	 * @get_modes:
> +	 *
> +	 * Fill all modes currently valid for the sink into the &drm_connector
> +	 * with drm_mode_probed_add().
> +	 *
> +	 * The @get_modes callback is mostly intended to support non-probable
> +	 * displays such as many fixed panels. Bridges that support reading
> +	 * EDID shall leave @get_modes unimplemented and implement the
> +	 * &drm_bridge_funcs->get_edid callback instead.
> +	 *
> +	 * This callback is optional. Bridges that implement it shall set the
> +	 * DRM_BRIDGE_OP_MODES flag in their &drm_bridge->ops.
> +	 *
> +	 * The connector parameter shall be used for the sole purpose of
> +	 * filling modes, and shall not be stored internally by bridge drivers
> +	 * for future usage.
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * The number of modes added by calling drm_mode_probed_add().
> +	 */
> +	int (*get_modes)(struct drm_bridge *bridge,
> +			 struct drm_connector *connector);
> +
> +	/**
> +	 * @get_edid:
> +	 *
> +	 * Read and parse the EDID data of the connected display.
> +	 *
> +	 * The @get_edid callback is the preferred way of reporting mode
> +	 * information for a display connected to the bridge output. Bridges
> +	 * that support readind EDID shall implement this callback and leave
> +	 * the @get_modes callback unimplemented.
> +	 *
> +	 * The caller of this operation shall first verify the output
> +	 * connection status and refrain from reading EDID from a disconnected
> +	 * output.
> +	 *
> +	 * This callback is optional. Bridges that implement it shall set the
> +	 * DRM_BRIDGE_OP_EDID flag in their &drm_bridge->ops.
> +	 *
> +	 * The connector parameter shall be used for the sole purpose of EDID
> +	 * retrieval and parsing, and shall not be stored internally by bridge
> +	 * drivers for future usage.
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * An edid structure newly allocated with kmalloc() (or similar) on
> +	 * success, or NULL otherwise. The caller is responsible for freeing
> +	 * the returned edid structure with kfree().
> +	 */
> +	struct edid *(*get_edid)(struct drm_bridge *bridge,
> +				 struct drm_connector *connector);
> +
> +	/**
> +	 * @hpd_notify:
> +	 *
> +	 * Notify the bridge of hot plug detection.
> +	 *
> +	 * This callback is optional, it may be implemented by bridges that
> +	 * need to be notified of display connection or disconnection for
> +	 * internal reasons. One use case is to reset the internal state of CEC
> +	 * controllers for HDMI bridges.
> +	 */
> +	void (*hpd_notify)(struct drm_bridge *bridge,
> +			   enum drm_connector_status status);
> +
> +	/**
> +	 * @hpd_enable:
> +	 *
> +	 * Enable hot plug detection. From now on the bridge shall call
> +	 * drm_bridge_hpd_notify() each time a change is detected in the output
> +	 * connection status, until hot plug detection gets disabled with
> +	 * @hpd_disable.
> +	 *
> +	 * This callback is optional and shall only be implemented by bridges
> +	 * that support hot-plug notification without polling. Bridges that
> +	 * implement it shall also implement the @hpd_disable callback and set
> +	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
> +	 */
> +	void (*hpd_enable)(struct drm_bridge *bridge);
> +
> +	/**
> +	 * @hpd_disable:
> +	 *
> +	 * Disable hot plug detection. Once this function returns the bridge
> +	 * shall not call drm_bridge_hpd_notify() when a change in the output
> +	 * connection status occurs.
> +	 *
> +	 * This callback is optional and shall only be implemented by bridges
> +	 * that support hot-plug notification without polling. Bridges that
> +	 * implement it shall also implement the @hpd_enable callback and set
> +	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
> +	 */
> +	void (*hpd_disable)(struct drm_bridge *bridge);
>  };
>  
>  /**
> @@ -376,6 +494,39 @@ struct drm_bridge_timings {
>  	bool dual_link;
>  };
>  
> +/**
> + * enum drm_bridge_ops - Bitmask of operations supported by the bridge
> + */
> +enum drm_bridge_ops {
> +	/**
> +	 * @DRM_BRIDGE_OP_DETECT: The bridge can detect displays connected to
> +	 * its output. Bridges that set this flag shall implement the
> +	 * &drm_bridge_funcs->detect callback.
> +	 */
> +	DRM_BRIDGE_OP_DETECT = BIT(0),
> +	/**
> +	 * @DRM_BRIDGE_OP_EDID: The bridge can retrieve the EDID of the display
> +	 * connected to its output. Bridges that set this flag shall implement
> +	 * the &drm_bridge_funcs->get_edid callback.
> +	 */
> +	DRM_BRIDGE_OP_EDID = BIT(1),
> +	/**
> +	 * @DRM_BRIDGE_OP_HPD: The bridge can detect hot-plug and hot-unplug
> +	 * without requiring polling. Bridges that set this flag shall
> +	 * implement the &drm_bridge_funcs->hpd_enable and
> +	 * &drm_bridge_funcs->hpd_disable callbacks if they support enabling
> +	 * and disabling hot-plug detection dynamically.
> +	 */
> +	DRM_BRIDGE_OP_HPD = BIT(2),
> +	/**
> +	 * @DRM_BRIDGE_OP_MODES: The bridge can retrieving the modes supported

s/retrieving/retrieve/

> +	 * by the display at its output. This does not include readind EDID

s/readind/reading/. I saw the same typo somewhere above too, so please apply
to the whole file.

> +	 * which is separately covered by @DRM_BRIDGE_OP_EDID. Bridges that set
> +	 * this flag shall implement the &drm_bridge_funcs->get_modes callback.
> +	 */
> +	DRM_BRIDGE_OP_MODES = BIT(3),
> +};
> +
>  /**
>   * struct drm_bridge - central DRM bridge control structure
>   */
> @@ -402,6 +553,33 @@ struct drm_bridge {
>  	const struct drm_bridge_funcs *funcs;
>  	/** @driver_private: pointer to the bridge driver's internal context */
>  	void *driver_private;
> +	/** @ops: bitmask of operations supported by the bridge */
> +	enum drm_bridge_ops ops;
> +	/**
> +	 * @type: Type of the connection at the bridge output
> +	 * (DRM_MODE_CONNECTOR_*). For bridges at the end of this chain this
> +	 * identifies the type of connected display.
> +	 */
> +	int type;
> +	/**
> +	 * @ddc: Associated I2C adapter for DDC access, if any.
> +	 */
> +	struct i2c_adapter *ddc;
> +	/** private: */
> +	/**
> +	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.
> +	 */
> +	struct mutex hpd_mutex;
> +	/**
> +	 * @hpd_cb: Hot plug detection callback, registered with
> +	 * drm_bridge_hpd_enable().
> +	 */
> +	void (*hpd_cb)(void *data, enum drm_connector_status status);
> +	/**
> +	 * @hpd_data: Private data passed to the Hot plug detection callback
> +	 * @hpd_cb.
> +	 */
> +	void *hpd_data;
>  };
>  
>  void drm_bridge_add(struct drm_bridge *bridge);
> @@ -491,6 +669,19 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
>  void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
>  				    struct drm_atomic_state *state);
>  
> +enum drm_connector_status drm_bridge_detect(struct drm_bridge *bridge);
> +int drm_bridge_get_modes(struct drm_bridge *bridge,
> +			 struct drm_connector *connector);
> +struct edid *drm_bridge_get_edid(struct drm_bridge *bridge,
> +				 struct drm_connector *connector);
> +void drm_bridge_hpd_enable(struct drm_bridge *bridge,
> +			   void (*cb)(void *data,
> +				      enum drm_connector_status status),
> +			   void *data);
> +void drm_bridge_hpd_disable(struct drm_bridge *bridge);
> +void drm_bridge_hpd_notify(struct drm_bridge *bridge,
> +			   enum drm_connector_status status);
> +
>  #ifdef CONFIG_DRM_PANEL_BRIDGE
>  struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
>  struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
> 


-- 
Mihail



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
