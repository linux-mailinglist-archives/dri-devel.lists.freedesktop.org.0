Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589B7BA7D3B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 04:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27EE10E200;
	Mon, 29 Sep 2025 02:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Tc9biLHJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013020.outbound.protection.outlook.com
 [40.107.162.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2218E10E203
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 02:41:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dupgJkxAOYPjvHJslI3dr37KvFkpRrbaX7+0cyiIEnWurHUBUXoGe2BEnQsh4hA9QOxTN1qOPaTI7DqsMng+MJ8IwJ6fMaZcJ8sM4xj0EOED8opKVrnVsBFTpZ2HsIgSZIp9qWNoCz7hsbnkgF1klzQRSHQQijPNDVSr1at15J2xSHm5LZF2ssY3dcQZSk7Cprl5IQpGBcRNk8m+bDOxvwMmWCkpzRk9OY0vjHlWFxLVPDSF6RqCu1uVsdaxlVSXdoSaA03Sa/3ahrV5L0Uf3frhYWBGIp13qRA/Uau4s1KPq4sW/HCpF9LjwEO1KFY80l6ka0vNAJzEt6WpHxF34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6P3HmKfxpwnxvDGNu7Y7RD24cUPCPC5dmHEZMnYHxfo=;
 b=DJgukkU6BDYgnuHCqelAd0zadzbH4k0qOjDBuV7imXmE5nTj443ByVpKZQJuBMXqGJjeQg8l9iTZBzMOokbvuAu5zBX3KOJDo/QtJ65ahyLeiYUsu92OQ9oW0apcrKoXOKJLCSYsiTqwAWbx621+CWPrpTMt5UwzAo5vrPe5GGdH55XpAK7gfeIkOo1OYE8rHVd9ldybnpc6nOdxCTbfamvKjVVQNQGyFDhgwqhIFotfP9wLnnX43VeDjqWC/SoNOZOulG/Gjt0LIaiBp0fezpuzhrY7HNUyOqcaI/EwfE9OsbBdJGJC1N0ioi68CqmnW0pQMhLtWRj7B1G/tZ+Ntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6P3HmKfxpwnxvDGNu7Y7RD24cUPCPC5dmHEZMnYHxfo=;
 b=Tc9biLHJ4jHymD9MxsFKQ3j7FFNICObeowYlfERj+Nn7mOz1Z8c5Ll4IMAvS4z3dTbim8+KfPGoQ3LhtlnhvWPCjG445wj/4l69fs9j4UTisSNsOSrjMhUgkanWIQWPpCncmpcm9cXu1FP4FC23TMOz6RBo7ZsSRMkJX1yzuThfhh7s8xx/6LXe6z8u7h1Q/cE/UokDLTDF+WhNfO8UxUqiMZsMWiBV6duJNByx1pxadKPnSiom/hpNpW4vSvrFVvJizkuYj1n62CPQH4mYc6t8ro0o00xBd9e5GpVCmnAH0k1hN9/2M9YZ26DChXRlWyoTff4KEtxXyUCP17MaRKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11722.eurprd04.prod.outlook.com (2603:10a6:800:2ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Mon, 29 Sep
 2025 02:41:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 02:41:37 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 29 Sep 2025 10:41:47 +0800
Subject: [PATCH v3 12/14] drm/imx: dc-lb: Drop initial primary and
 secondary input selections
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-imx8-dc-prefetch-v3-12-c01d0608add2@nxp.com>
References: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
In-Reply-To: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB11722:EE_
X-MS-Office365-Filtering-Correlation-Id: 8505ae1a-bf93-4f5d-3dcb-08ddff01b66b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|19092799006|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzhudEZMNm9meXc0TkMzZC9ScEhEUm10L2R2Wk02eVkwQi9JVmVaR016QkdH?=
 =?utf-8?B?Vkg0cldvV1lIUnFaMmpqQkhBRGx3cjc2ZEo0VElDUXo2VUJ0dzV2Uy9sOW5j?=
 =?utf-8?B?aWN5SXBwZlErSzY1TnBrLzFCbkhxMkZXOWo1NFc4aDlValVZeDVnWGNBY3VS?=
 =?utf-8?B?cUZ5SnVxblJkUFlkRUVTS0VOTDlpOTc2enUveUJjd0pYU2ZNb1FrZXh5dUtn?=
 =?utf-8?B?cEwrVVl3YzFOdndKRDJPRmZPOTd5Qm5qcnVGWDFFanEwRUU4MFBIK1UrVVFW?=
 =?utf-8?B?dWpNdktyUmgyZkYvTU42djRaSS9CUHBNc1VQei9SOW5UQmRsdEcxUDNZcU14?=
 =?utf-8?B?SUFXYmVscWZ2NXhZNFpPVy9pM0RFekJqd1VBSWZTd3BFNTNjalpsdmtKSkNS?=
 =?utf-8?B?QVcySGVvU1BjYXl1R2VFT2x0ZEo4L0pMU3pTem9JTHQ5TXBUVXdwNDYxRHJu?=
 =?utf-8?B?ak1zK3JhY0RLSkxhaFAydWF2cGRQNFRhOTUxaVhoSHhGTUx3RzEwQ0k0dE9v?=
 =?utf-8?B?dDUzUjAxZlFyK2xDcmQvaDRkc1pyVk9sY0RCZlByM3ZlRDBPSDQwV0ZoM0pQ?=
 =?utf-8?B?ZnZ0VFBxcDVnNW9MYkZWbG5ObFBxbC9XU0dBNi94WDVuSnVDZEhTQVdEZEl1?=
 =?utf-8?B?OWF0bkdnWHhOTExCcUE0SDZaeVFuRXZaenZha3I5YnB3Ui9ZUW11b3RhQWIw?=
 =?utf-8?B?aTdGZXNGcE9CbFZreHVUUmxBVHJiajIzK21KcHlvM0tkUHA0bnlrWFZDWTR4?=
 =?utf-8?B?L0N4SlFSazI3WDg1bDhrR1J0Z0NzWm05c2FuK0NIK3FqZHhhai9PUnpoY2JL?=
 =?utf-8?B?UHZYQ3JQamt5KytXV2dNRHJheDZmVlg2S1Q0QXZVOVdkZFVNM0JPejJGSGtP?=
 =?utf-8?B?bEEzblpwUjQrWDVjOXRNaUJyQXZKRGV5ZmZwZ1U1bUVhcW1tSW04eHdCa09I?=
 =?utf-8?B?Nm9uLzBYZnZRN3FlLzl4RmpUMUtLQkpZUkxBS25QQWQvdWJZNVhhQ3grMXZi?=
 =?utf-8?B?WHlnNDFma3FaalhKdVFvOE5XU2RSdU5CQnVSR2QzU2t4WURvQ0xsTVZlc0VP?=
 =?utf-8?B?cGNseGlWR3VJMjhEeXM2MDJnVTNxZlliU3Z6b0hxZktwemdTclp3cnQrdUZ5?=
 =?utf-8?B?dTM2NGVrZmJwR0sybkFYbDZ4RTJ6WWZtWVBSOFkweHZSOUk3aVR6M0JRYjRr?=
 =?utf-8?B?cjZxYXNmdm0rR3RBZERueDBoM1NaNUlJSVlucmUzTnhDNndwcGVlbVlrUHBI?=
 =?utf-8?B?VTRQbG5LZVFWSkxYd01iOS91RU4wMFliMU1WdFZFMTZyMGRDZ08wRVJCeTNZ?=
 =?utf-8?B?eHI2MitISjBscDV5REw3VWZWZXRIZDRHbDdYbDNlL2tJNG56Lyt5cFZMZGVa?=
 =?utf-8?B?c2NNcHlFNzFRdERBaUk2cnlGSUhxRHhSL0x2RHF2OElqQjRhMmpEa3N2TTBE?=
 =?utf-8?B?cEhVSWV1ZmxHVlJHMEY2cU85UDN4TExUT1pNZXlPYWRTRXBTTVdZSVhJTmZC?=
 =?utf-8?B?NFV2VzlySGF1WWswL3JBbUpQSDc2cE8wUTBZeU9pL3J1R1ZlRUxkdE11UFJv?=
 =?utf-8?B?NlJvUElRZUJmSmJXZHUwR3NRWXQzYSsvbjlJTHZiOU56LzdmQVVaZzh4enZT?=
 =?utf-8?B?WEFZM0dJY3N1Z2lBamU5ODVPSEFkNWFIMUpyNTJ4OExxa2pyMUc4MVRVRDV5?=
 =?utf-8?B?NTE4bDV2UlNGUnBuOWF3dTlObXNHVGtXNHE5WWJJSkZKK0FsMkVjMUxTYWlt?=
 =?utf-8?B?QUVqazJQNDRCNXNBZFVjbkpIMUVrbWRucEpBbXpLK1RIR2dVeUxLcWZCcnhD?=
 =?utf-8?B?eWJUQmI2cDR0MnJERjdER3JPM2hXTjRmWDJ6NjVxQ1Y5OE0vTWQxYUxTZmpC?=
 =?utf-8?B?KzV5OGRyRXBXS3Q2WHVyRzZSY1hWNlV6NFZKYXVwZm4wQlNYakFOZVZoWFZV?=
 =?utf-8?B?eDFoZEdQM2NhNkVaa2NYR1ZwUnZxUDBqQ0NObnRTcXVINzNWbzJlZ2VablQ0?=
 =?utf-8?B?U0E4NUV1bWZsNXFKeEdUMTgxRDduaFJucVVGeEFnZnZpUGwwR2pMdmpWcDkz?=
 =?utf-8?B?WDNpdDl2U3QrOHF2REVYN2w4ZHF0QVBjUkxJQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ei9KeUo4NVNrNlNVaWl1WXhkLzlJaTlaTnd0QmJEVUg0elgyM2h5WnMvcHZU?=
 =?utf-8?B?TFBGT1pqWkd6amRvZnkyK0FpK0dpSnBTU2dCZG9sNGV4THRKYXltMjAvTCt0?=
 =?utf-8?B?b3FVVWFxWHpVYlBHV1BtNlN5d3d0S09majNtanJtK3VsaUozMC83cFM4bTFF?=
 =?utf-8?B?OHF3NVZKam9CZEg5dWlOdWlzNzJZZFlIUTFMRDU5ejREWkxUSkw5dlgwbWRZ?=
 =?utf-8?B?SXhha2dEdi92WjREdFgrVTF3RHBySmFRT0lwaDVIc0YvdjFDd1BrTEhpRVRF?=
 =?utf-8?B?NmFzajRFVlBNMTkxZGdTUUwrOHkybHpWeExUT25kZk9NT0o4N2FjNDNzNFQr?=
 =?utf-8?B?M3R5WjBTcHV0VUZBTW1VU3BuN0FIT29ja0x4QWpwamJtUCtEeUFYUTJXRTBL?=
 =?utf-8?B?WGVRZzlRRm9jWjhsWGZRaE1iekF2ckpmaEt0MnQyVWNhNzRkZ0FxbDhLQVVy?=
 =?utf-8?B?VGU1eXMwQVBuZXorMnA5TVdzMFJRK1ZhT0dPdFRXdkxXQVg0czBPdi9YQUd4?=
 =?utf-8?B?d3lSeEI1MDVCSHF5L2lmSzhuc2FNNFVIMVoxM3JLOG5EbUJVeUlvaXRmdytC?=
 =?utf-8?B?bzc5VjlVbFM5VUcrUDJzK2d0QW1tYXRjK01FSU5wcnFNcGFIN2ZJc0w4cmZs?=
 =?utf-8?B?aGk3ZmVtR1dDbVRNVXBKcUZvenNMUFlnY0MwRWhaZytPdEg0Y2gxc0RpeEk1?=
 =?utf-8?B?ZC9DS21MV3ZsekV0U2prdnRaMWZxQUFUT2NWYWhBK2NGaHcvK3YzVXE5QllV?=
 =?utf-8?B?TkpMZk45YlV1MWFwbDgraE56V1FGb1NYSjNRMEJtQnBGNDd4Vk5WRG10RmhZ?=
 =?utf-8?B?eUhiOU8vQ0Noak5BblNpMURxaDMrSkt2RStVUXB1U2kySWE1YnBkbjdTMHhJ?=
 =?utf-8?B?YzRzS2dXN3BZU1lKbnRwUVF6b0I4c2JTL0M2VUhLTE5odDgrUGg1d1BwZFhu?=
 =?utf-8?B?T2VoRTVRbGNzaVRVRXN5d1d1aHl4cGlESU1aRVNobXlhTGdsOVhPcTVycE13?=
 =?utf-8?B?blVYZ0FLU2ZFMzEzbWZjT0lMY1pJMmNzYlV3M0wwN3lQaktCL3h0alF5TGJy?=
 =?utf-8?B?OXd6WEI3Rkltcm5vTTExSlZLN2Z0UWNodWFqTUU3bzB4UGgzdDJEZ2svRGox?=
 =?utf-8?B?cXdvamdVSmVvK2RhVGlhSjk1WU5NazY2YXNFVEQrYm9INC9oWlZMMHJ3R0RK?=
 =?utf-8?B?aW9ZUGI2UDU3cUNOV3dJb0dYQVN6QW9wYy9vL3BzYmpZcXNhTlRnM3JoL00v?=
 =?utf-8?B?Tk0rMHNQVjd4dG42bWN0eEhoQy9BQ2dWbU1KdUJyRXVLcXhZd3BWUWZ3UGxo?=
 =?utf-8?B?Y1FHOEpzMjhmL3JjZlJOd3JrRms2TFVucCtXUlg0K0gvUEQzS1gxMW5XWWp3?=
 =?utf-8?B?SlNsaDJjYysxd2ZrOThpMmVyZmViVFZGYzc5b3JXeE9idzNpeGFJbDhUQUtv?=
 =?utf-8?B?VWRyWUFaemE4R3JpQnBOTGhDdEFkUkduN3RMenNUZzdYMVFHT0wvUjdYNDl3?=
 =?utf-8?B?V1NYbndnM3FEQ1BPY041R1VJSURXclUzY0QxNzJ6ZUkyUzNhbHVuK0kvS3JJ?=
 =?utf-8?B?TFFwMU9aZTZxS0tCR0FBdXRybHVEY1R3WEVOQ0pIeHl6UHRBVGFzUFFLZnp0?=
 =?utf-8?B?RmhBdDl6TkVScWVENnRwTmV3K2FMMWRsRmcxZHZ4NkN6R0RFYmZ3d3RQTWU5?=
 =?utf-8?B?anZsN0hoM3d2NHVMNUJ5VmxtdHMrZDI0VkdlYU92dW5GekFsSWNXRTFTK2FB?=
 =?utf-8?B?NiszbGRlQ2l3aDc1b2c5VUFBbjNsNk14VTVCclQyQTJaRWx3ZFhVMGs4Qy9R?=
 =?utf-8?B?SW94NEVJZFJ3SkU4UjRhVGlNZE14Q2VSeTdWcjhyU2ltUjB1RTVuTWVFaWI1?=
 =?utf-8?B?SG5QMTAwQTY1UUtQVE42ajJVbWxkVEZLT1hYcTgxQ291dDdMUHhVRW1wZ2FZ?=
 =?utf-8?B?T2Vvb2VGOVQwYWpxTURrbTBISWpGNVJQbXluRDF1eEZ3YUw1YWZjdlNQQ0NW?=
 =?utf-8?B?ZFNTZmdMY2Z4SWdHNFptSTU3cUM1b3l0VHNFSGJDOXF0WU9UMkRES3V2VUk5?=
 =?utf-8?B?b0Zjc092TkYxYXF1cjZtditFUDlXNW5NK1owdlpHSC9DQkVOU1EwSEErZEhQ?=
 =?utf-8?Q?rlViYa2RCmdw1BOv9kNth6o+L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8505ae1a-bf93-4f5d-3dcb-08ddff01b66b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 02:41:37.8178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8ksJO2LZDpWgkxZmP/IKwyTF3nSYL9PZIIa5bRcNxM5kvWN0zVwi3sUaq8sYzsHgiTmNos19b+r6ECxt8SLQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11722
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

It's unnecessary to set initial primary and secondary input selections
because KMS driver would do that when doing atomic commits.  Drop the
selections.  This is needed as a preparation for reading LayerBlend
secondary input selection when trying to disable CRTC at boot in an
upcoming commit.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-lb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index b0f3fb818799b58597e8ae41d868338c3fd40800..d0a805469ae79d467c7e71ebf75e1befb80e15f3 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -254,8 +254,6 @@ int dc_lb_get_id(struct dc_lb *lb)
 
 void dc_lb_init(struct dc_lb *lb)
 {
-	dc_lb_pec_dynamic_prim_sel(lb, LINK_ID_NONE);
-	dc_lb_pec_dynamic_sec_sel(lb, LINK_ID_NONE);
 	dc_lb_pec_clken(lb, CLKEN_DISABLE);
 	dc_lb_shdldsel(lb, BOTH);
 	dc_lb_shdtoksel(lb, BOTH);

-- 
2.34.1

