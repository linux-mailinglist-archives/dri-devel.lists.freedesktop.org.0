Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E64E95EEFC2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 09:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AB710E2EE;
	Thu, 29 Sep 2022 07:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80081.outbound.protection.outlook.com [40.107.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01D110E2EE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 07:56:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihgmRHSVSPk9bDqdjvIH3ni5bCYeUE/lsIFO9NDcc1QK59GshQLfJ63pOVxsPGu7pfKbX35ghzs7ZV+7DbTWO5jnHrgRLCI3xIQ8bf4mVs3cewQONlV9UQjxolo94VWj9STdrbJEAbKFVUPaVYIgE4rFx1ygEsne0jW0Icyya894+j5yXx7JhGZBcZoMCGd0jKzW0Jt72oTNjyNPUs8z4Og39I99DD1tu7S7CSub424JZK6YJaNuQcmJ364bOShFnjLGvkNEjT16Sssz/WDDEPRHViUFzgsXs1BnjobEIXpfDG62enDIKHy8bnd6uOabJHa17UvUPYS3eWjcoDE/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TM/03n7xeU6axAVfKt6ljGnB2mR+U5uE5DPPLebtYTg=;
 b=IrT3g3Q/wdKHVc/62fZIwSiZkfgWze5xm7q9J2EEB/nacqpVaDiQ5ceLTUVH9kkAHpIviYNK9OThDckwRge7du7n2BLr0A02/VwLOkxnL7VyhrD5c/qV0y3wVnaE94LP6a7EckqLtu37il8keue1TivzYRrQvEoXKoXjX+KYPrkHBuYdE+SmJ5LU7gsaq0nvoyv1VoV/mHgqya7vjonDj5d9boyhdxhDWXj6lFYt3bXRsXzzqlU4yKXNUVm1kACj70VcMEft52rO80oOK7jIgpeuBe0mvwEj9VXl81HCINDJDMzXlTE5gGcxErA1jqNQPSvmIa2pI+VS6BIXu0FOMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TM/03n7xeU6axAVfKt6ljGnB2mR+U5uE5DPPLebtYTg=;
 b=c9K1gOdfTMZRh3ZWrjegjX8np7FaC2SuKPAgt4U5U6/gPqBX/QzNA5yoILBlYS6gRfj/tERGNXv2wUijFQcCsdwmIs2aEKZMHb+nnenmSsmC9z5RfTixAG96tg/TVkOCJJhhuAI2yHeGDaRw7KjT/mV2EsnDsQ++lpc4WPw+XAk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9302.eurprd04.prod.outlook.com (2603:10a6:102:2b8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Thu, 29 Sep
 2022 07:56:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5676.015; Thu, 29 Sep 2022
 07:56:08 +0000
Message-ID: <98bb7c3cb7dc6ce388c82af51fd31b61765a685a.camel@oss.nxp.com>
Subject: Re: [PATCH v2 1/4] drm: lcdif: Fix indentation in lcdif_regs.h
From: Liu Ying <victor.liu@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org
Date: Thu, 29 Sep 2022 15:55:26 +0800
In-Reply-To: <20220928005812.21060-2-laurent.pinchart@ideasonboard.com>
References: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
 <20220928005812.21060-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: dce927a7-125b-46c2-a8e1-08daa1f01185
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +J7HVKHLkZ7zl+m7GhekSoZTu6PPdduqug7N/e+gJA4KL5oVXVi/tqPOn29e2b3MUaBJjhOJ+PzPshQdZh1qUCiPuvZjDja6VC5RjMZpebVK0J06v2pOtE89vQH5XNYDuP9tRmbwm7EbygFEshrPqSxkSJpiSXgHXta52kHd/JmYN5FdTcFf+ekL8TLCbqwy228H4YOB7/4w4CgxyQfuRiyofatxAqRzkY2jBCoyZxgQQlBHdnNELO7ut7MXr/VOhmCQ3NPFuhSFIRKGTB2AYlEMlYwuPWQtPsK/a0PwApU50hB00gtmkEwBgM0l09fWYPzJAZEBmMx9+g5Kkgec3kJ4ly7+JxdHCJG7y+IByAx8fdAOHM6Z5H3l44L0CuEfHF6DfGPFOqGabEXi5kFFjeTVQgadbMIwHKsG3a8ryX6GYxliofZi5YiQtsFhiWBhmB8Lmn76MlxXkN2+xdjaHUoZx1hjMdKRbJ4GlV/fsYS42/uLXIc7EADV9dr76lEiE1VKiDB93LvtFb8yGccblib1W1RUC+953mosYJP0fblygokUN5bqPa4s0Fm343lZ+IxZ4yMQfQnocBCpwHAnEzDeqPNlGv26KixRZ8IkDcoO9kvFZYImGmlenB48xTMcZI4UefL4kHQSUxfbm8PYzsaZCofDqIq/feiuvl69qgUPeiWbkU8WBrqZTSX+V2KjDxCHv9sG+E7WUIprHwYGj8GMkUiNdDCmHehxWIYebt3BGI/UD+6aeDVm7tg1y08L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199015)(38350700002)(38100700002)(86362001)(5660300002)(186003)(41300700001)(6512007)(26005)(4744005)(478600001)(6506007)(52116002)(6666004)(6486002)(316002)(4326008)(54906003)(2906002)(83380400001)(8936002)(66476007)(8676002)(66556008)(2616005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDUxbDZVYzZrSFFjSDd2WjlVYVRkOGN4MHY3VDZwM2FGMjlDYmtiNm1nSm9x?=
 =?utf-8?B?bjZMYVVvcTB0UE83ek8zR3ZWT0hlUjRQNUd6MWttbmxyZE9IL1ZJeVVIYjd2?=
 =?utf-8?B?SU1HVXpZb0NVUmxWNGlyRVp3V0E1eTNFbjZIcjdrWW5RcFY1OGZJQUp2NXBl?=
 =?utf-8?B?RHBVVlNRbkNCRmIreWR1WXBpTzdHQ0Fwd1BCRGlhWTArZi9HdlI4YmUrU0J1?=
 =?utf-8?B?SUtPeHdEZEZpQzVvaHE4a2piVTEzbGExWm5pbFVRYS8rZmtDTmVJZmlySVlL?=
 =?utf-8?B?OWYrMnpLSTFzSlI1WWVwVkNDUTdBQ2syOVB6Snd3a1RHb1pyeXM1TldOeVNp?=
 =?utf-8?B?ZG5KTlNpczdnRUFVbnJvbHlzS09qa2o0TW5vZlVLKzFGSWZra0hFVUZiQU5J?=
 =?utf-8?B?TFcvNytvZHEyUk0rK3dpbDUxbXZWUWpTY0RoUmRjN05KK3V0aHJBMVpoY2NW?=
 =?utf-8?B?UEhKb1FjY0FTM2FUZTBVaWdDbmpKZVQ4OTNXYysvaldOaHFYdHhpb3NZbkdI?=
 =?utf-8?B?QnJlWFF0Nnl3cUlTTkhjZm9nd0JYamhKdVEzcHBMdEVLaDZqN2tCOHlJU2E4?=
 =?utf-8?B?S1JUMmNUcUU2aWF5TmFsM0JqcEc1NlRmZWV0NzBwaDBwaUJRU2RpUkpiR0Zm?=
 =?utf-8?B?bURicDUzSldPR0hQR05NTm5FSmFIKzhqNVA2OXpaVDUyKzhNZzVUMjQ3N3Zx?=
 =?utf-8?B?Rnd2TFNlSzB3MXpjWThDTGF2emZGd0Y3Y0RVbWsxbGZUb1VaclU4R3pTN3dU?=
 =?utf-8?B?TGg0UkNFeTVDME5LRmRiRzNIVndwNCsrbFdGSktlMUx0a3JFRHJsaVdGRGN1?=
 =?utf-8?B?WmNJM1BOVkRieE1LMHJvNlczRWVBUnlDM3BId2NwREFSenZHTVZPR1Z6enZy?=
 =?utf-8?B?Q0dxVnAxcERBbVJEMXBXWXh0cEEwelVZRnhxV3BvU242V1EwODNWaEVvTUpj?=
 =?utf-8?B?ZExzSG9ONk9tL2daMnZJdmVGNGtUZjNGZHJ3SjVRdTlKcW1KbE9QcW5JZnpz?=
 =?utf-8?B?TE5ERWF1Wlg0YWwrZGtQQVF4ejVlMHRyOEVtbmZsM012ajlKYWNOTFVJNXVq?=
 =?utf-8?B?SmtNQ2hwbHNFK1E2a1ZDaWo3Zks1dWJGdDQ4Q2pxak9YR3hrMnZESUJ0Skl5?=
 =?utf-8?B?WVlacUdoblZGOTE5MllZdW83QktFb2lxUFdNVTR5czFOTW03cmhtMEhSWUww?=
 =?utf-8?B?WjNLSGRiM0ZDK0d1R0dWcGJLeTFOWVhucmNkRWFQcWh5VUdMV2Z2ZGttOE1H?=
 =?utf-8?B?eXNCaTg1VUNoRlcwZUxUM0ltdndxOEdrVCs2cDRrY2FDWTBEY0RtdjQzZEFl?=
 =?utf-8?B?RU5ZdmpqeXEzcWtuNUxMeE9tY1ZPR05SdmdjdGVPWFU3Z2o3YVMyN1ZTYWlw?=
 =?utf-8?B?bHd5WXJEZ0xoRjRiMjVGSjhaWVFQRUlzNGdjNFo4Y0VZdWc0NzA1N3JPR2Mw?=
 =?utf-8?B?amFZK3VlZlgzVWZ1YXV4MS94SmU1RURUN1owakM2Z21lbWZQUGh1NUdHcWtr?=
 =?utf-8?B?dVFEU3BPUkJrTGRKakhqWXJSakFQQVFmWkkxc1NuR0NmMmJBdzM4bXVxdXd4?=
 =?utf-8?B?ZlBpdDJqWVBVa3BoWnhQMUZHVHBmR1JCRCtYR1kzUU5wVW0zcmZCeEdodlVT?=
 =?utf-8?B?b2U0djEvamtaaHVEVzdTYUM2dnRaRGJFRHVCSFJDeXFJTktiOGRzLzdzeHVT?=
 =?utf-8?B?TVJCK1NRdng2Qm41NEwxWFFuSEU5Rldia0NLM0VNK1I5SVA2NEs4Q3ZkRE9l?=
 =?utf-8?B?SFhiQTVMMnp2OGRaY0U1UjNmdkdTUTUxRXY0OE5CaXVmVE1XdllNenkrNzNR?=
 =?utf-8?B?cEY2dit1QWNKV1QwVkdPNldwdE02TnlZRVZpU0tlNDNhOWE4YTRrTnErZHgw?=
 =?utf-8?B?b3haTS9wMDFqaUs2Y2ZpczdTUnROUVJ3Vyt5VVdodTJrT0RhaFNWUzd5L09B?=
 =?utf-8?B?Tys4RXZiUjZ5UDltSnU0eFJBaHc2eExiUXJHZDNHbDhHbks1LzZkUnpGQmxl?=
 =?utf-8?B?OSttNE1WdUl6VWRPN3ZTbVBOVXlxYWdrclErRkZleXR2NjNzdStQQWxpclZI?=
 =?utf-8?B?VGoyZWF5aWVvOVRiZG5QajNXVWNreVhzd05lcjBrcGZKWkhSbGZLRmRQTEdx?=
 =?utf-8?B?bnBJUllEcmhyaHZGYUs1eXNkcEZNV3NBNDJBdU81aEZFajNodzhjRklFRnUw?=
 =?utf-8?B?RGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dce927a7-125b-46c2-a8e1-08daa1f01185
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 07:56:08.7822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OjLLp9ClC8U8UMMXLZwHm5e9M9bPNjPt+czwBaAfFLc22LOlkh7hm4qHiboJhn4pd7MjRDor5MsuWVpnA4xh9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9302
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-09-28 at 03:58 +0300, Laurent Pinchart wrote:
> A couple of the register macro values are incorrectly indented. Fix
> them.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Marek Vasut <marex@denx.de>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_regs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>

