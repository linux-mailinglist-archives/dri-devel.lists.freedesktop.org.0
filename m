Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4619B4089
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 03:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91A010E24F;
	Tue, 29 Oct 2024 02:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="E9SSj9cl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959B110E24F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 02:41:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOix60elxsAajZ22QtNUVUzKzbpnSbSyfZpoQ6Qb9USk3gB+IVLRk2bHjhTfmXmGcm7EgLp/kht3wDEtsynlF+CW1e+aKDvsESqvtuaWR6e/c5XtReu2M3MgZesokKH1EwY9vneiUHeKqQFDJGe/XULjXSDtL6dwvWLeUIx/Vmg1+LrIi/6kRyDygsjvsUMsGot9RmGkFn5Hi415EclAEMMsRUxkznJlQRJIsKW+wXDogfHOK4Nu56eEVfLpkW52DT29GjOv+jbtVa336JTJ+4DDM50/kfQZ5WbCrCNhZCRnUgMDtsxGEt69zepjo1Y58RI6he+CLmJS+mUdpAklKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOdocT1R2XfgY9DZnwaYMBkbJ9xg8OX1UxqIbZBAYrM=;
 b=MV62alGjKnIWmiRGkADKq6WVsgSr2EyC8UtCiu6qeD4a5VSJ0wq0hOr8WoXq6DoBnjAUU6vl3/Y9TDkgVKO9cgFI54xI8k+qWtZHBLvcpwKkWVgnpwuX4+3+6vB8ByDvL/+uUcNF2j2asDeK1Sjy5KdCdFW4FgZApo1u6Xb2abDKygbPNT5ruJUDoiMx32rAG9RcicphA2a1N+BbJnBzWnOLWAyZ01B/hhdJXy4U7vmZDqUfV0B3c+7gQb4w/rXzv5OQCGx3zINLvsqmIxoIFqaZN2SAOh4iDyArnQtTw3ofNDvqgUptUFEinHDFbs05GrNpsdzSyTu98E67jlRvlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOdocT1R2XfgY9DZnwaYMBkbJ9xg8OX1UxqIbZBAYrM=;
 b=E9SSj9clFYZiRSc8A6nMjdTOm3/VQEJvh7JQVqA6nYBZU18pz8o7hgmxRhF57zcoT84P6PkpWdpBUtRH3lAUaVzkvMa7f5SX0XobXp04i8kYwrlrXMIdkoyC9PpLAjk4+tmcmvVXsIz5+GDMNv4cp4bwBqY+DHh1jKFQe0zidBf49owdhkyJWBhuWANfzy1MJ9kIPKVKIWMUYBFJh3ae4MeLqO6/i+Bk444Bynt7FpYe465/KPEZwLmHZbQ0u8u1/+HgSx7WDftjlBKeHiNsm/jBTIjKuqhcOrMmKzh8KJeFKh544QMqDrpKxI55TSUiBYWIgB6tfv6bxCNObfhY0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8855.eurprd04.prod.outlook.com (2603:10a6:10:2e2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 02:41:22 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 02:41:21 +0000
Message-ID: <1e8526e5-d9b7-42ac-9db3-13b42ccc4fbe@nxp.com>
Date: Tue, 29 Oct 2024 10:41:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <CAA8EJprFBbC_=kBHi86j-nE_K68QeG+c2OBzJCbUyNWs5zQK0Q@mail.gmail.com>
 <TY3PR01MB11346F956733032EC10E997AF864A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <5ycxltnw3vhik3iype6ncuh4nelwwtom745o5dlf32qyiqh5bv@yjj5l6kb2psm>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <5ycxltnw3vhik3iype6ncuh4nelwwtom745o5dlf32qyiqh5bv@yjj5l6kb2psm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 66ebeb32-305e-47a1-5cc9-08dcf7c32c80
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkMrbWFZdmZFYmRUZU0xVGZyY1NGR3ZrY09sa0ZRYjFTYlhVRy81eEhPRVB1?=
 =?utf-8?B?WXp0eGplVU5Kek5tS09QTEU4RHYrQjExb2xKeUtKczBTaVBrY01SSVNrVXA3?=
 =?utf-8?B?UWNTcjQvR3JGdlU3c2NpTlRyZjdQSUkvZk9OdmhyY01PVU0yeXNTaWp1MXhM?=
 =?utf-8?B?ekRJNlJSWk5MMDdrMzBVU3J3S1hLMFJzWmFLYThxbHVYRHcyZU9sT0FXczA2?=
 =?utf-8?B?VXRyaklMQVpRTHZFT3hFektJQmZTZWh5WTRXVExEb1V5YjJhUmtScE5TY2U0?=
 =?utf-8?B?NXlaZTZqa040Ym1zOWJrdUNTS0FLRmEycjIxNy9ndTVXbm9kS3hHTFR0NmYr?=
 =?utf-8?B?L2FUeWRMdjNkOE02T3JzRjNQVVJiQ2s4L1pBQTlHbGE4UkUvR28vcy9qemVp?=
 =?utf-8?B?OVM0OFpJeHA3U3RURDNrUmlrQ1ZlbW5kUDNEc1FOdjh0eU1GMUVqaFBwYnc5?=
 =?utf-8?B?aTVhbmhDMkp0WUthYStkWGtmYlU2d1QwQmlSbHJLTnZYV2xuTTJBU3orUTdJ?=
 =?utf-8?B?Y2haNTE1dC9NQ0RVNFh0V2lsbGIvR1kwaTRxa2lMZm8yekZ2dkY2NktnaDJK?=
 =?utf-8?B?enliSWF0Ui9YYU81U0JDK0lXQ0dwZDlYQy95RlN6SFB1bWRZOEk2QXdrVXZo?=
 =?utf-8?B?Y0Rnb243OHB5aGVON0FtaWY2ZCtMWVlIcExIZ0pSOUNyYjZHNkg1Y0sybVNs?=
 =?utf-8?B?SWlKRnNybVp4OUowTUdXeDRwNC9MZkJicllFanhZbWNCTzZRbk92ZGlTQWc5?=
 =?utf-8?B?Q1IxaFZjcWtqR2F0TjZTODhrdXVIMFlUTGpmWExPSTZwOHd3S1hDNkF6ZHhE?=
 =?utf-8?B?MStkaXRNL2ljcUw5dE1IeVRQTGpUYXhTRXZXYVNUYmNKTGovWHpyR1dUV1J3?=
 =?utf-8?B?Ui9FRTkrZ3dJcWhDNC9oejZ0a00xVERxRWJqS3oyRk5ZUXJURS80QmEvUDhq?=
 =?utf-8?B?bnVKeXhUK3JPVHFKZmVsVWwxYVRFM3RHU2JTNDJkbkUxbUJ0NGJDSGg3bWZo?=
 =?utf-8?B?MzRxaTgzdHZHalVzNDEzclNzUXIySytHWDFnYys1K2d6OW5aYTVzK3NHYThq?=
 =?utf-8?B?bVFyYXE0OGcvcXZoUU5SVWUxc2FDR3RWS0dhdnN1MzNWVlNxeGtNZVZBWHd5?=
 =?utf-8?B?eC9pZGZvTGJFcGdqS242dkhVcDUzM1FUbmpsVTFtMEtCaVRYbDJlbTlOMWNW?=
 =?utf-8?B?UEdka0RRT1NiZE1FK001MG95cjRnMG1XdlJWOEtFb1EzNkFBVW14M09NOFlC?=
 =?utf-8?B?ZitUMWlOSW5RQmVLZjdHdWRpZStFZ21Kd0F1eWVBZkU3UTRJNzdSZitXMWxX?=
 =?utf-8?B?Z0RjQlFMNHZDeWZNdXNjSjhGRzllTTVLVVI5WlhTdnZoVHdFWFEzSEhxcmty?=
 =?utf-8?B?U3IvTjlCYXZNWTJrVHIxa3pCSnJzdGtoVUZPaWxVelJQYWJjYWpFOW84eHpM?=
 =?utf-8?B?REVYeDBHK2NGTnRYUVQ1aGhXWE1NWWVXbmYzbEVHa21OVllVc0NhdFRYRTZX?=
 =?utf-8?B?TFRrUmJFVURQcFEzZ2N5emF3WlpYbTFnck1XNEgrMzR3RFUzQnVNZGE2elZY?=
 =?utf-8?B?SmxINGRRSklWcE1ISFpRcEZhRXl4UUFlUExGcVdVc3ZiZGx0RmVPWUpaK1B2?=
 =?utf-8?B?a2FyTUtwWm55WlpDTmNMY05RMWdQOXdhY2xTWkhjdHJjOXBvUWFXOG05andx?=
 =?utf-8?B?dEFxd29CVFQvanhPWGNYSmkyMzQrRFV0enpmY1hYN1BuTm5jSlJLdC9ld3M4?=
 =?utf-8?Q?kyKeP1DYawZsLVu8g6oZp8rL3X9BZquvV4u1yjv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlFhaTUxY0d1eTNsVi9waVdFQkZWMitkQytLMWZuQ3lZUTBXTmVZcWozeHpH?=
 =?utf-8?B?RWwwa3dtWm9VZmVRNWNDSHBFRmUxaVVxTTN4bjFSSGV4UXpCRm9yQVlLTGR0?=
 =?utf-8?B?WWsyMUlYZlBxZnEvSG9DVk5jeVlMd1Ntd2F5VURGYVFuV1loUkNSb01EZVRJ?=
 =?utf-8?B?anY3T0xqaklaMlJPVG0rWG8yTEN2Vk9wSWFySG5hVzVBVGN3Rko5RXF6eDVy?=
 =?utf-8?B?RlgvUktvWWMzTUpvcU5tdHY3d1VHeEtTcWVQcVZFYmNsL2V2WmIzMm1heEk5?=
 =?utf-8?B?d09PVXQ1R3pVOUh5Q29ON1VXOGxXMmNpRlVJZnZYZjlSZnNqcklyYnZ2SDF3?=
 =?utf-8?B?WUtYTTBvdkVlZG9LWEllT2piK1BqcXNneldORDZIazNQR1pkNFIwcHRSVWhl?=
 =?utf-8?B?VXpNaUZOZU53V282cHA1UldVMU1MRXBTWlRrWmFKUWxzT3NwMFJ5Um55OWlp?=
 =?utf-8?B?UEU4Y3N0SndIdldrVnNpeWlDbGhHSVVua2IwdGJER1lZK2thbXU2eWRNVUps?=
 =?utf-8?B?Yzd5TkwxTmdwOU1DUVJrUTNGVmxFOG5DMmpMYTNzd0ZSbEREUG9LK2puaTFo?=
 =?utf-8?B?RWx2eTY1L2Y1RWllaGJTN084RVBUemVKQTRZMjd2eHVKWDhoUlA1RnROWTl2?=
 =?utf-8?B?WFBjaGF2dk1KZUFRV3J0NXV6QkNGZ2hHSG5lZENoR2JDaG5md1ZCaWlsSVJ1?=
 =?utf-8?B?dDF3NE9QSmZ4ZWY2UEZXWTVSM0dxaXFJQ0cwOUI1WjB4MGo0WlU2TWE4UmVn?=
 =?utf-8?B?UG9uczJjWC9VTW14NjZMK096STJJdkZoc1BybTIxUXhQaXBtdlZKcVo1Z2VN?=
 =?utf-8?B?cXE5UFlKQnZETWRqSEgrRVBZZk5sYkEwZXdYc3NSM3c2Zkt1TjJvd3N0Y3Ix?=
 =?utf-8?B?MjR0SmxaNWZVSFk1S2w2ZUF6aEFnYUx3STdCMUh2THdqenZaaHlkTWdRM0d5?=
 =?utf-8?B?ZHdhTm11L2VUU1ZXQWoyVzNpTndjTGxJK09FOUJ6LzFUQm9OaUk2WEkvSXhX?=
 =?utf-8?B?K2t5aDZseXFueHhCeWVycDVlc1BRR2piUjR3blR4WUJLL28xdkhUT0U3SUc2?=
 =?utf-8?B?K3RNRkdJUmIySlc2OHp5RDRxdElZNUwvT3d3SzBaNXJ4WTQyY01QcVNzWFBR?=
 =?utf-8?B?TUJCM1FZT0ViSHVOVUpnRjhGRk8rK280T1Nnbno3WW9GUFRrR0Jpc1hrdmNh?=
 =?utf-8?B?RkNTeWFVYjg0ZVJMRXZNWndjOUs3RlBUL0RRRFNwWklGQ1M5akV3RUNHL2Ur?=
 =?utf-8?B?UURXNEM0dXZ2M2lXVWo0bFZaZnMvMFJoWmgrZE44ZU51UWdhU1Z1OHBxWklL?=
 =?utf-8?B?djdZdVNaN1hlN3RvaUU0cGpOYm1VejRFYjk4MElHR3hmNGErejZOZ2w1K3Zn?=
 =?utf-8?B?aUNMOXVFRisxclhIdk1xUU9lN2JaVjh1UlRUTEVwc0tSaVgrZHJQNVI5Z1BX?=
 =?utf-8?B?cXo5SWVwb1puV1p5Uk9nWlhtQkc4cC9VUDNuSWFlaGttQmU0T0NEN0UvSzlz?=
 =?utf-8?B?US9DRVpqaUxnOWQ1VklRb3VPdlRoMTBPcjcvc3dtK1JOYXdZTTVaQzhBRUd1?=
 =?utf-8?B?SXFsQkErNW1QNElWa2RqVDhubDVPQ2hCQW5TeTFPaS9RYW8xZDFIUFVubExr?=
 =?utf-8?B?czNkTHJCZEUxYWlHMFpRNm90TjhQWU1hYzNHdEpDellPNzhNRkE4Z3pDczQ1?=
 =?utf-8?B?R0tGclA5MU52VzBQL016VUg5aS85VEJQdlk4ME9HNVdBZEo1cHgvVGlYbnJy?=
 =?utf-8?B?ZnhnV21HdUpsSTBqQ3YyMWpyL1ZaY1pUdWVrSXI1MW56SlRNSERFQmt6YUtp?=
 =?utf-8?B?blEyZktoTFIvNks3bGRQRFppaHIvd2ZVdVkrTlU5MmRTYmE2SXRrUDJ4Ri8v?=
 =?utf-8?B?TWVHVmVsREFDcVdXZkQ4ZVY4WHJ4alJFQ080MkpCTDBSc1owRU9USmFoQnc4?=
 =?utf-8?B?K0NRc0FOVStLNllCbTJncjZicG5qRDJjSkRKbmxUdWV4Y0dtSkhDclAxL3c5?=
 =?utf-8?B?bzg5di9MVmxnTzE5Z25jVWRUQVBvKzhZQjUvWHVGRWZJQm5RZFFpdTFmNlY0?=
 =?utf-8?B?Y0NJRXFYZkNRaTk3ZTMvRWdpQXM5azRKZkZNSW5LNWYzeFp2NTQ1SVhVTHJo?=
 =?utf-8?Q?+39wGgLQJDtjs6MrsW4+kaedl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ebeb32-305e-47a1-5cc9-08dcf7c32c80
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 02:41:21.8568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CctNe64JDTZBmFhJOYQ+dxmNPRJWP4f+vmy2IcMPDPU107dhK7RyPCOt2/t9xtW+SuyUjn4+lF/2Aisjn9JFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8855
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

On 10/28/2024, Dmitry Baryshkov wrote:
> On Mon, Oct 28, 2024 at 11:12:00AM +0000, Biju Das wrote:
>> Hi Dmitry, Liu,
>>
>>> -----Original Message-----
>>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Sent: 28 October 2024 10:20
>>> Subject: Re: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
>>>
>>> Hi,
>>>
>>> On Mon, 28 Oct 2024 at 04:37, Liu Ying <victor.liu@nxp.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> This patch series aims to add ITE IT6263 LVDS to HDMI converter on
>>>> i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
>>>> the IT6263 supports LVDS input and HDMI 1.4 output by conversion
>>>> function.  IT6263 product link can be found at [1].
>>>>
>>>> Patch 1 is a preparation patch to allow display mode of an existing
>>>> panel to pass the added mode validation logic in patch 3.
>>>>
>>>> Patch 2 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to find
>>>> the next non-panel bridge, that is the IT6263 in this case.
>>>>
>>>> Patch 3 adds mode validation logic to i.MX8MP LDB bridge driver
>>>> against "ldb" clock so that it can filter out unsupported display
>>>> modes read from EDID.
>>>>
>>>> Patch 4 adds MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,JEIDA} support, as
>>>> they are supported by IT6263(with LVDS data bit reversed order).
>>>>
>>>> Patch 5 makes drm_of.c use MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG}.
>>>>
>>>> Patch 6 supports getting dual-link LVDS pixel order for the sink side
>>>> as needed by IT6263 driver.
>>>>
>>>> Patch 7 documents jeida-30 and vesa-30 data mappings in
>>>> lvds-data-mapping.yaml, as needed by IT6263 DT binding.
>>>>
>>>> Patch 8 extracts common dual-link LVDS display properties into new
>>>> lvds-dual-ports.yaml so that IT6263 DT binding can reference it.
>>>>
>>>> Patch 9 adds DT binding for IT6263.
>>>>
>>>> Patch 10 adds IT6263 bridge driver.  Only video output is supported.
>>>>
>>>> Patch 11 adds DT overlays to support NXP adapter cards[2][3] with
>>>> IT6263 populated.
>>>>
>>>> Patch 12 enables the IT6263 bridge driver in defconfig.
>>>>
>>>> Patch 13 updates MAINTAINERS to add maintainer for IT6263 driver.
>>>
>>> This has pretty complicated structure from the merging point of view.
>>>
>>> I propose we take patches 6, 8, 9 (without 30-bit formats, they can be dropped while applying), 11, 12
>>> (?) and 13 through drm-misc in one batch (once DT maintainers review the binding parts). This looks
>>> like a minimal set, having no extra dependencies.
>>
>>>
>>> The second set might be 4, 5 + new patch, re-adding 30-bit formats to
>>> IT6263 binding (no driver changes are necessary). This can go in separately, after an Ack from media
>>> maintainers.
>>>
>>> Of course both sets can go together if linux-media maintainers reacts quickly and ack merging media-
>>> formats patch through drm-misc tree.

I'm fine with merging the two sets through drm-misc tree as long
as linux-media and dri-devel maintainers accept this.  Up to them.

>>>
>>> The rest of the patches don't have such strong dependencies and go in once ready / reviewed.
>>>
>>> WDYT?
>>
>> I guess, 6,8,9(without 30-bit formats), 10, 12 and 13.
>>
>> 11 may have dependency on 1, 2 and 3 as it is SoC specific.
> 
> Yes, of course, 10, not 11.
> 
>> Then 4, 5 + new patch, re-adding 30-bit formats to IT6263 binding.

I think it would be good to directly support 30-bit formats in
IT6263 DT binding, not re-add them to it.  This way, we'll have one
version of the binding, not two.  So, a better first set would
contain patch 6, 7(one existing A-b from Krzysztof), 8, 9, 10, 12
and 13. 

-- 
Regards,
Liu Ying

