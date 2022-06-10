Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669A35459CB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 04:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8827611A7FC;
	Fri, 10 Jun 2022 02:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140078.outbound.protection.outlook.com [40.107.14.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B14E11A7FC
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 02:00:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNMJThUc6U1Dj7Fm3yQtePCNbr/D0iuDH+1hoR8FFEBBxsb0De32DvYVatGq8n9Y1yaOuZnAqUNZL7CDD6BXRj32hd0Zkf5wB3vUzu9QDS3fbBNyD2vPFT80VtgPtrrPUSuaQnzliRkZUbrw3vOfpoe/18mXrXdasSl82kpQCLcuQ5FJrzfOw2siHIEbR1S9W0SKonFN7J5IlIma+dyw+5buzb0qv7wWQiZXbbJs/XB7A6prM1xFZ2Etoh+4jX1cKi3GIjnaSiD7zHVoJywKycwZMjIfbT4i39jsvebXAWy3C/VKTZWHkq7rllcxtzVw/VHBbGSDNvQx8KxK6aHPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CZUgxTI8Xtekp9Jcvb+NTdQGMR5IiPvKkP/k8U2JzM=;
 b=fkazuyFelzG/I8BVf79I0VHTKWVaTsLm1cNsV0IMTeJTevmV5dbYJtHPgpni+/xhOCZGKp15aqAyV1Kb2CA/tW9z9+WGAl2SNo0AnmzRF/MhzXuInQN+tMkwiFFvdnt3GXxCff8qt7f3p3YkWB5ab2MPyhoo73TUk0cb2PhWsSnth+mGm7yE5HKKdfPrd6iGQACGJhXVIoBxEMUIlHuvCug6W2MDbCBWO7Ky2ZaTwWAkcTIByCQ69REzg7cRe9J/hazQgsdTRdYlthPvEmqjlBqF886mywjgPsqTqAGNq4tm6FR4zJcAxh0LiGOvC7h3VGzOpiJjZUb6FomABzz/OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CZUgxTI8Xtekp9Jcvb+NTdQGMR5IiPvKkP/k8U2JzM=;
 b=CHANMKKw44py6zyIbjgqnPHuAOZeNi+XZrsKSESt+WDn2pD6Vpn026r2Ej91xkCPgMMeDmHpBSSDsiXoy3twKI5X3TMuM4vHeA+P6+GU7DBytswr000eOWqrxK8HeTagEPcwTKeozddWGPmBt/k6hoOvZ8wxKcar+p0xuktbmn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR0401MB2254.eurprd04.prod.outlook.com (2603:10a6:800:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 02:00:40 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 02:00:40 +0000
Message-ID: <401cc508e528dca9bdb14ca723e4bb818a738b29.camel@nxp.com>
Subject: Re: [PATCH v8 03/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 pixel combiner binding
From: Liu Ying <victor.liu@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Fri, 10 Jun 2022 10:00:23 +0800
In-Reply-To: <YqGuK9g0g2XsJV+x@pendragon.ideasonboard.com>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
 <20220609064931.3068601-4-victor.liu@nxp.com>
 <YqGuK9g0g2XsJV+x@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0102.apcprd03.prod.outlook.com
 (2603:1096:4:7c::30) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f71bffe-c645-4fa1-8910-08da4a8504d8
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2254:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <VI1PR0401MB22543E1181F26B3E5E449EC898A69@VI1PR0401MB2254.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dzIAGvLEXSEwBbwuvffhxdqWEiOFlE5KJAWfK9uGcIGQh/NpsHxGc6vKjZXHFbKOwcMoVskYu3h3mSC9BJJ14DnE+TmbkQhb8UTdxP7N3qHLPdogeSxsOAH9kriNL0lRm7Dx6iEE5aHmLxItf+qjValL1Ub+Lx4+Viwd2qDUoPQZ1lorjwzivYyBjTRuC7z/PR7GazFT1gqdE8ztWdDhbp2xHnKDzeLlFpKTp1rQTr5Su+mJM2/MrG+U5iidK6rjI/RJc1dia8Tpqfkm1U0BGfHnSEEiQeVoKRO58C7TSBwdGpjhVH0Zi/2H4jrKWtIGrUDoOY/pi2GNqZSx1bPYlLTJYf1A2G0YjAVdYYT0OjmZ4lgDClA/vzu2ruk2nSCfolI+dBP91s8IHb6gmE1YNxS1M568kJnW8CKhgJAKML6XsaeWd0AkoUIpN4kEXPeXnIGUUiw+EMz3Ihf0hMH1JNXqpzm4dLC34ujUSA7pGgP22Pt5Vnak0hgXbRJH+TG/sa6H7mGT6OTnoRSKY3c9eYA5QFRpV5Xl2RaWUyoRyXHuAJQ4KFsf/KvHmsHsqJM2LuAa8xNLWFLYhGJMU6alJ0/7Dp6TrmOb8Igt+hrx5loq3eEgo0zOM+BV8+vIpH/x6oKOJUyVsnrUMZHtHzvg2oXWubllnDnFIiSP8hcUC2ib3H2dGiblrXjVweOlyWL2XISOH9gWRseQkwNdgwTypRDtpRp7/5JdzVaith2uK/i4qpIa3fsFf73sztRcrR59K65XTgg4tjhAcSGL8l9XjHdo+Weea0zXV4JOa2h5Yf7+Bv7SR7CRqZG7XDBlV3ETROO9HgsEcqvZrjBW1QSCYxGV+yl9wYPhDR+GaNVpp9I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(4326008)(7416002)(8936002)(2906002)(5660300002)(86362001)(52116002)(6506007)(508600001)(6916009)(45080400002)(186003)(966005)(38100700002)(38350700002)(26005)(36756003)(6666004)(2616005)(6512007)(66556008)(66946007)(8676002)(66476007)(316002)(6486002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkRoZG1tRUlvaHk0M1dVZVhQa3hBR0tiMURrV3U1NER2eFlCOEltdUhpYXdv?=
 =?utf-8?B?N3BxaHNQRHExejNmWEZqVS82ZWpJMG9PSW1QeXdLNE9wR3pYNmM2Mm5mbXBw?=
 =?utf-8?B?OHMyamQvU3phR1VhektnZU9DVkZsSWpjZzdpdSt4T1FKZytEOWZxQVkyWkk4?=
 =?utf-8?B?bVYxNlArUUJqTHlBcGcrSzlKZGNYcU1meitDNEZYRi9BUFBnNDlHZEx1ekVa?=
 =?utf-8?B?TC9tYkRpaXVDbVVhN0lzN0lyS3Z1b2ZzZG4zSm1YL3RRMk5IdXp5UXZOd3Ro?=
 =?utf-8?B?SzdZTGRicE5LeThUbk0weGNJTEdMNUNvSnd1WnlOY0d4TG9IVjZERHhxUnNR?=
 =?utf-8?B?ZkV5d1FmVnNIRElOdm1WUzNMM1hxL3QwRU9YODlpbGNOTXhkTThLS05JWFlH?=
 =?utf-8?B?aERUM2QrUEQ5ZktiUmVYRnBBU0xDRkxMZ0J3YkFLUkFQbnBSWGdZbDFtY0t6?=
 =?utf-8?B?bmlLNzQ2bmhGR2hEV2ZMOFN5YTZKNWo3WU9GTjF0NmJSM29XbjlBTllEUzBY?=
 =?utf-8?B?a1ZjVXpmRG8rM1ovc3pWT2VHWVVHNXBQanlnNUZ5bFVCK1ROMWNVbnlTZFov?=
 =?utf-8?B?SGJ1bHFPSFJsTkx3RFY1MTd3SUkydnhBZE9vOXlWM3Vsd2w3TjVhVjN5Z1FP?=
 =?utf-8?B?b0dJL04xWkNacDMvMEs0VHdWV0NMN0pLK2xaMWp3L2RBbXljR2cvTENjdmxJ?=
 =?utf-8?B?L2cwMkZtNWdIMnFqdGU1azc1RXJ0ampwNk0vM25aMVJlUUl5dHBUUFdENk11?=
 =?utf-8?B?blpuUEhVYUJvY25GWVNGWmRIUUpET0N6NWV4MnBWeEZtUGRyZW9iOTljdDUr?=
 =?utf-8?B?ZDB1WW9kd29vTlkvbHAxMWFTWGVaaHIvS0J3WFNmWnJYNkRaMnFQWXpjdXNw?=
 =?utf-8?B?L0hZZVB5RUgwYjBrMkIyUkkvT1pFNjkyUzZBazlaWFJQWWtPWUhkbng5Qlhr?=
 =?utf-8?B?NkcyWHdTdTVGSFRhYmdyZjBsZXJyUmo5TW5UT0srRnZMOW92bjU5aFlsUzl6?=
 =?utf-8?B?ZiswRG4xdEV0V2I4bGdLbHhSVjk2T1dSOC9Qd3ZTZWQybXlOQmhCZ2k0YmlP?=
 =?utf-8?B?SUhZYU1xZnpQc0FqRzVlang0bmhsNVhnL25qRTJpSTBTSHRVejZUSERiSjdT?=
 =?utf-8?B?b2l1L3pFZEN6RG91SldCRnFGMWhUeXlXZXZHbjRTaU1zemc5Sm95cCtzRmZl?=
 =?utf-8?B?cjFBYW1LR2FCeHBZODVLb3ZBT2YvTGZvRXNRemlzWlFMUXNlQ3g2a1piMzRt?=
 =?utf-8?B?ZUpwZHBiNEtzK0JHeUZvUGhjcDFzekZ5QmZDYWdhUGl0VjYzek9McFN3UVVa?=
 =?utf-8?B?aUx0NFVhQjhRWUI4TDF5c05YQ1RrMkMwSENWZUt6aFVpdTU1Vk1yWnNoNGNL?=
 =?utf-8?B?eWxjMjE4QmNsSVk4QzkzdjNIbjZsdWhTbVk4eU94Z2pMcUVTdXZjcXpMbDI2?=
 =?utf-8?B?UVYwTmxXRmpuK1lOdFFETC9qMWhmcjhrMi9zSkw0QjdZcDJSNXd3T2doc1E2?=
 =?utf-8?B?Mmsrb3VyOVBXU3hvQzZKZ1p0L0Y4dTNBYk02MlRZWFFjeG1lMU5lWndsOFFG?=
 =?utf-8?B?USs5ck1tWXVmejI5eFkxRUI4R2tETTgxb2k1MG9LejlVeThva0pOb3RJVWY1?=
 =?utf-8?B?QnJ1OGE3eGFJS1pXZlFQdWd4QlVRYnlaU0I5bHk4d1ZuVWxjbVg4K1VjWjE0?=
 =?utf-8?B?dkI3TVVRQlpOUk4yei9iQi80bEVmbDdNc011WGtCOVR0Wml2MkZvMW4yUjFh?=
 =?utf-8?B?S0hSUTZGVFJvMGJacmdCdFRjSnowYmFocFhNOGN2OTJENHZNYkdkM3h6RWw4?=
 =?utf-8?B?dkxlU01lR1IyTmxTamc3OGhnZ3dMWEJsYXIrM01wZWRIZUhNcXpFTlNuK3o0?=
 =?utf-8?B?ZEkvUjRROEVTQVFjbXJoSm8rUjVteDlmODJ4M25Cczlmd0lhY1RDL1l1RFdj?=
 =?utf-8?B?VkhHUEVrUDJ6SnR1TnZ5eE5SakRDdlBIelV3OWU5cW9OTCtlT2RNdG5Fb0Q2?=
 =?utf-8?B?NlI1M3MyUkp5MDFYcHlZWVBaYW1idjZlMDVXa2grL1ZZZGREWkxNYXpmRHhT?=
 =?utf-8?B?RjE4aEhSUzRzcHZOV21vK3FtUlJzdmlVanVyWm0wVVZuODR3U0FKaFF2ZWds?=
 =?utf-8?B?TnNvSGszV1VoS2xxa3N5bjZqZmxJUHpOUVhCMEh2L2VmM1VwWXoxc2tXMnA1?=
 =?utf-8?B?ZnN2emE2bTd0UCtadUp3MWdFNGhNM2NLYVhuSEJsWm1HY0tpVFp1b1hzNlA5?=
 =?utf-8?B?WlZTbXR4ZDJEcERBZG1HbWRWSGdCOHh2eTRGYzdNUnlXSDZyMUwxeDRxaS9o?=
 =?utf-8?B?VkJ3WGp4cnZyS2x2WklqVmRLTk9YUi8zdnUxMXQzVkhHYk1CSENEQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f71bffe-c645-4fa1-8910-08da4a8504d8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 02:00:40.1420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgpqfdpzsy6Av6pnud2DhiqrKq+a4NoXGUIsIcXK28XM81HvNYdwWuroi9qCRfL34EEjfAjDsvVqtIl1OCSoGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2254
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
Cc: andrzej.hajda@intel.com, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 lee.jones@linaro.org, jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com,
 linux-imx@nxp.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Thu, 2022-06-09 at 11:24 +0300, Laurent Pinchart wrote:
> Hi Liu,
> 
> Thank you for the patch.

Thank you for the review.

> 
> On Thu, Jun 09, 2022 at 02:49:20PM +0800, Liu Ying wrote:
> > This patch adds bindings for i.MX8qm/qxp pixel combiner.
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v7->v8:
> > * No change.
> > 
> > v6->v7:
> > * No change.
> > 
> > v5->v6:
> > * No change.
> > 
> > v4->v5:
> > * No change.
> > 
> > v3->v4:
> > * No change.
> > 
> > v2->v3:
> > * Add Rob's R-b tag.
> > 
> > v1->v2:
> > * Use graph schema. (Laurent)
> > * Use enum instead of oneOf + const for the reg property of pixel
> > combiner
> >   channels. (Rob)
> > 
> >  .../bridge/fsl,imx8qxp-pixel-combiner.yaml    | 144
> > ++++++++++++++++++
> >  1 file changed, 144 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-
> > combiner.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > pixel-combiner.yaml
> > b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > pixel-combiner.yaml
> > new file mode 100644
> > index 000000000000..50bae2122183
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > pixel-combiner.yaml
> > @@ -0,0 +1,144 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fbridge%2Ffsl%2Cimx8qxp-pixel-combiner.yaml%23&amp;data=05%7C01%7Cvictor.liu%40nxp.com%7Ca94c4502ac5748e2357408da49f17304%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637903598635803241%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=RIF8RJtIGU1gCGwSD%2FMsNx%2Bo7Kd9cxkInm310B1npq4%3D&amp;reserved=0
> > +$schema: 
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=05%7C01%7Cvictor.liu%40nxp.com%7Ca94c4502ac5748e2357408da49f17304%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637903598635803241%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=bQy5KKStqN17%2FnK8vGM%2F1nGhlkxdF%2FfYVDwGReWsbes%3D&amp;reserved=0
> > +
> > +title: Freescale i.MX8qm/qxp Pixel Combiner
> > +
> > +maintainers:
> > +  - Liu Ying <victor.liu@nxp.com>
> > +
> > +description: |
> > +  The Freescale i.MX8qm/qxp Pixel Combiner takes two output
> > streams from a
> > +  single display controller and manipulates the two streams to
> > support a number
> > +  of modes(bypass, pixel combine, YUV444 to YUV422, split_RGB)
> > configured as
> > +  either one screen, two screens, or virtual screens.  The pixel
> > combiner is
> > +  also responsible for generating some of the control signals for
> > the pixel link
> > +  output channel.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8qm-pixel-combiner
> > +      - fsl,imx8qxp-pixel-combiner
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: apb
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  "^channel@[0-1]$":
> > +    type: object
> > +    description: Represents a display stream of pixel combiner.
> > +
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +      reg:
> > +        description: The display stream index.
> > +        enum: [ 0, 1 ]
> > +
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Input endpoint of the display stream.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Output endpoint of the display stream.
> 
> When multiple ports are present, they are usually grouped in a
> "ports"
> node. Not doing say may work from a schema point of view but makes
> implementation of generic helpers more difficult. Unless Rob thinks
> "ports" is really not needed here, I'd add it.

graph.yaml mentions 'ports' node is optional and 'port' node can be a
direct property of a device.  So, it's legit to use 'port' node without
'ports' and Rob has already provided his R-b tag to this patch.

Regarding generic helper, the DPU KMS driver and the PXL2DPI
driver(patch 8/14) call of_graph_get_remote_port_parent() to find the
remote pixel combiner channel and ldb channel. So, it looks ok.

> 
> This comment applies to all bindings in this series.

Besides this pixel combiner binding, the ldb binding(patch 10/14) is
the only one this comment applies to.  The i.MX8qxp reference manual
mentions both ldb and pixel combiner support 2 channels. That's why the
bindings use 'channel' nodes to better reflect HW design. Using 'ports'
node in 'channel' node would bring more tabs for indentation, so I
prefer not to use it.

Regards,
Liu Ying

> 
> > +
> > +    required:
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +      - reg
> > +      - port@0
> > +      - port@1
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx8-lpcg.h>
> > +    #include <dt-bindings/firmware/imx/rsrc.h>
> > +    pixel-combiner@56020000 {
> > +        compatible = "fsl,imx8qxp-pixel-combiner";
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        reg = <0x56020000 0x10000>;
> > +        clocks = <&dc0_pixel_combiner_lpcg IMX_LPCG_CLK_4>;
> > +        clock-names = "apb";
> > +        power-domains = <&pd IMX_SC_R_DC_0>;
> > +
> > +        channel@0 {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            reg = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +
> > +                dc0_pixel_combiner_ch0_dc0_dpu_disp0: endpoint {
> > +                    remote-endpoint =
> > <&dc0_dpu_disp0_dc0_pixel_combiner_ch0>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +
> > +                dc0_pixel_combiner_ch0_dc0_pixel_link0: endpoint {
> > +                    remote-endpoint =
> > <&dc0_pixel_link0_dc0_pixel_combiner_ch0>;
> > +                };
> > +            };
> > +        };
> > +
> > +        channel@1 {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            reg = <1>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +
> > +                dc0_pixel_combiner_ch1_dc0_dpu_disp1: endpoint {
> > +                    remote-endpoint =
> > <&dc0_dpu_disp1_dc0_pixel_combiner_ch1>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +
> > +                dc0_pixel_combiner_ch1_dc0_pixel_link1: endpoint {
> > +                    remote-endpoint =
> > <&dc0_pixel_link1_dc0_pixel_combiner_ch1>;
> > +                };
> > +            };
> > +        };
> > +    };
> 
> 

