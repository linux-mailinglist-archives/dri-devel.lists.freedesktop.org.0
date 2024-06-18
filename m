Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F33990DD4E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC8F10E7A7;
	Tue, 18 Jun 2024 20:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Q/1O8pe1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B68210E5D3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 08:21:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+pjYcdmUFQgTvvus6o4JG4BzXm3oGqvG7Jv/YrjZy5H+bRs/jvhgIIVPkQN7TeI2V+Sp+Wl9DPLLztb4OBiozYlXqs6G6Rq0avSgFSUej6ZF2wGQWJsEjyVI9ROnzg05l5904A7A4YnSpKbhvEp7jfBhpKClj4zFMPJ8iIAuuho9kFqky39OPcemC4D5c3bPQtfjPRz497FVaxuU+wpXoDctitav+uu1BOV/eKbHBHU8y7NvXKB0+rEW6zF7xhbw1i5AgAckRmaX4juiS9jmG2cDfD8rkQGISPLMhFOWO9th4nHXfnWvSUsndjBtAZYOJWtiUoWyDW+Um+GpatSxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vC517gcaegSH6Enskl6/tSJist0pKrwB0MGrraQ3Gw=;
 b=d0fXgPcl/2ic9n/gDYze2sZICm0WDfH+WNPBoS8nLUVaUnR3OKuBr/FX8Fg5GohiR2oLfSbjNbRXLZZJrj4ud4kFXN4JrFU+SmHrzIRT7MUBhxfOi0uH5wxfsuRY19u7mglWn1nUS5wc7FAsTLHC5yQzGd8+eRBWPmgbfHC4MkMcNcxa8jwT66e7UoHwk5cmwcgCeCu4BDpWzTVqlzSigcT9cb1cf/2gbQTIGZ2dFTi8bG3i3mHtHUhT6ebRL1U+Oy0DYk7qWwIKQ70Gd7DkrCgoKikd5PySlMTNYIS17KSaRpUfvQA6yKYH/YBLKC3surbt6hspQekak1kvCIyOKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vC517gcaegSH6Enskl6/tSJist0pKrwB0MGrraQ3Gw=;
 b=Q/1O8pe1wsOuwtmAoZur2sovrsY2l3RKouY9jCjPiXEfzM48xZG+Y+kAU6V5KHrG3/FnT/m3gidWom0gXftQpFkcSBJxBn/vCmgldsRFLF4Oh0itnhU+Oy2EnKquW5SrvfxHQTb3azgqDwly/ee+vswUv99rMIA1ZX8ay2zDLsw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DBBPR04MB7643.eurprd04.prod.outlook.com (2603:10a6:10:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 08:21:33 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 08:21:33 +0000
Message-ID: <b0057315-2021-4015-96c8-d09fb6ddb7e0@oss.nxp.com>
Date: Tue, 18 Jun 2024 16:27:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: videobuf2: sync caches for dmabuf memory
To: Tomasz Figa <tfiga@chromium.org>, TaoJiang <tao.jiang_2@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
 shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, eagle.zhou@nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 m.szyprowski@samsung.com, sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Ming Qian <ming.qian@nxp.com>
References: <20240618073004.3420436-1-tao.jiang_2@nxp.com>
 <CAAFQd5B_RTHsMwMdD59RAAyFne_0Ok_A4ExdkVOgi=G6-UGfRQ@mail.gmail.com>
Content-Language: en-US
From: ming qian <ming.qian@oss.nxp.com>
In-Reply-To: <CAAFQd5B_RTHsMwMdD59RAAyFne_0Ok_A4ExdkVOgi=G6-UGfRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::21)
 To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DBBPR04MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: 388ff6d4-1f93-4f18-57f5-08dc8f6fa98b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|7416011|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eithMmh1ZmNhS0pLT3MwYThUMEdOTS9LRDBqUE4yOGxZNFdwNk41YlozaGtV?=
 =?utf-8?B?MlR1WEdxLzZZb1lWczJXUE90SVppMWRNVE1mY3RWT0t4aHVuYU0xak1LVDdZ?=
 =?utf-8?B?cEVOV0o5V1JUdEh6elIweVVIWWZLb2NCVnhvdDdNQTExdWxYRndXMXMxZFdV?=
 =?utf-8?B?NS93NXlWL3ZROFZNR0hJaVBsOGxXMjlZWEkwZzBhVW5JRnczQkxFcVNLZjMy?=
 =?utf-8?B?UFk4OStQMERDcEVTTEtZMHpNL3FMMWYvOHZrejg2OExkdmpuMXFwbmZoMFdV?=
 =?utf-8?B?RCs3NU5qRlVVc1JYbnlQOGgwNm54clVkU1dZeTA2U0VQWnRJbjZ5SXpFeUhM?=
 =?utf-8?B?RTJLNWNZWU43Mi9vYW9VVUZtN3ljNXErdFRhRjdCL2JuRzlMcWFMS21jU2lx?=
 =?utf-8?B?ODdHdVNKK3Z6SlUrbnE4UzZFOTR5TnNOWmRWaitWb0Q2Rm5rT0x1VmNwSVdy?=
 =?utf-8?B?T1Exd2MyOWNQVFNxVWNWanlKOHJLV2ZmaFYwcFVQSXd1VjdEeXFSeThVUUJU?=
 =?utf-8?B?akVwZXRMZWhLVjBjQk9DdERzci9OdkdBdUtMcjNxVGZBR1VXY3J4QTdBSWFj?=
 =?utf-8?B?QkliT05EbVl2alNuZ0NiV0xDMEd6RGhIK3hRYWlmNk0xMDZEckJJSlNRajg3?=
 =?utf-8?B?S0d1Z0xFK1dZYklFSWpmNFNMKzRSKy92SnhEbGhmd1hQQjQ3cERNNXd3QjBZ?=
 =?utf-8?B?QVZpb0NQUlpjM2FtOVVXNE1jdVZDaTErdTM2WkYxSHRGMjQ3a29sNFhaRFRz?=
 =?utf-8?B?Vlg3YXdSRHhRdlRqSVdvSHlPWHduekM4YllVTjNBYXFZSjFwMkd2OGFRcHc1?=
 =?utf-8?B?M3lqWUZYUFk1UmlURWdVdUpIOHNMeWNyNXBEYnhWQlpSNVZwZGdHWlhRVG5y?=
 =?utf-8?B?OTdxb0xROHdYV2RKRDk2N3d1b3NvbFRJQlk0Slh5Q01SejhZanNDQU9TVG9x?=
 =?utf-8?B?SjZKSEV4MkNwS3RiSUNzY3NyNHJaTDRpbkpvbGN1UHVRYTdDcmhTMDNFT2h3?=
 =?utf-8?B?Y1J0T2QyeTllWTZNV3RSUDlmOXlYK3BFdnVrZTlEckNnNDFmUWdTSHNhK0dk?=
 =?utf-8?B?Y21oUFJZa2FCVW03eFZFUXpMOUhMUklpOEs4VjdrNjFyTGNPVTh3enpsdWxI?=
 =?utf-8?B?aVpoQ3EwanhlL1RmQ05tcWs5cVRqT1FLODdiUlQzeDc1a2syTXRJVjBES1BV?=
 =?utf-8?B?U2RRcHE3bXFPY2VYRVl1TnkxYThBZkRpdHllNWplY2dUcElTbm9ONHFDVVFF?=
 =?utf-8?B?OXFreFkrT3lzS2JuWFBwRUFzSDlVcjZYUUV2MW9NdmNEVlorM3U5TjFhakZE?=
 =?utf-8?B?UnV5VG9ORStOaXlwT01TemhqaFNFem1jem4ycW1MNmFSUVZPR01DS1FOQUxQ?=
 =?utf-8?B?d0tRWjB4M1VIaldxQ05haEt4UGU2bjd0K2NKajNXMlpQeGtWN1p5SnA5Mk9m?=
 =?utf-8?B?WlhmeDlkc3FMT04rdVYwSDdORTZ0OGlBSzZnNllMdUN4dXVvTzBpVmJ5RjNT?=
 =?utf-8?B?UjhTb094WlRYZWcvUkw2TUMwRUUvbXB0ck5PS1NXazlyQjEvbjlsQ3lWZ004?=
 =?utf-8?B?SDRhNWFSeXVMU3RwV0ZqOHF3WnJkdmloQUlqeVAySm1Ba2p0cVVIaVZhWlJD?=
 =?utf-8?B?Zk9MeEtubUNBcTVta2tmVXArcjZUUStjang2Zm9yL3FEWTN3OHZPT1JnVG51?=
 =?utf-8?Q?XDChNNb/BOiOnERTeGxK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8254.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(7416011)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk5BUlA5MExTTTZsSXVRcDJrclVYM3VMalhhcjRFQkJwYVZRR1hjM0VUVXlN?=
 =?utf-8?B?Y1U3NkF4dUd6VkNHU1NmU2pmVmg5NVJQY1FPU3VGMWJ4SmFEZ1VKR0wzVU1v?=
 =?utf-8?B?SWxXWS9uUnNRV1hlWHZlTjZrc2ZycTBBTURNOWNLdnRRMGg2NThqeEJxWkUw?=
 =?utf-8?B?cXpTdHNXVkxUWkp6M052aVNVcEZoRm5BYjgwWlYwZmlsS3JKZlFTSWpnQjV3?=
 =?utf-8?B?bWh0a3FmbGRtdU96RUZDQzR2Z3UreFFjRjJsVHYwNUpTeHRmYzRGeU1tMUdh?=
 =?utf-8?B?bEZ4VEU1Y3ZtNXFjMTZWMmZXTmlFeFpYWm5WQm5CN1pHd3MwZy9JSmUxL3Uv?=
 =?utf-8?B?Vm5jcXRIYUdWY2R6VjU1ODJ0ZGRMd0lnaVN6UHZxOHlvOFhPb3ZKOG84WHRF?=
 =?utf-8?B?VHRneG5hWXBpdXlqQjhmVWJUTHpPNXpXeVVIdFg3Y3VWdlpOOEJ4NlYxMUZs?=
 =?utf-8?B?KytldXFxZUE1dmpUNjhxM3M3c0NMekxvTnprcFhscmdxeGIvZ051S0NqOEc5?=
 =?utf-8?B?OEFDL3A3YW9GQU1id2x3SGRCdmdLRkpCZ1BZQUg0VGEvNnZka21jQ2pucHRl?=
 =?utf-8?B?bGR3eFRtUFZWSjRTcTNwL25YYmFRd2NKZGxmdW1Qd1dxeUovZkIrNlpRc2V1?=
 =?utf-8?B?N2JsNUw2ZFN2bEtKNTcySGVtNGxhb2krVDJWekxvUllnWnh4RXJsbG9hWVAw?=
 =?utf-8?B?U054b2JOeU12Mms0djJ4dXg1anErSHFtc1NWSEFVYy9CbEJWSnZVVGI1T3Ro?=
 =?utf-8?B?Qlp5aEYzOEwwTlhIZHd2SnM0ck9rTVBMeTNFKzdrRDMwNVlnV21RVkFlVnN5?=
 =?utf-8?B?Mk9yVndWNVpRZFNJUm8zWmZNNWlnWi9ZaVdhNGhreUVKN1dPSGlvZWc2emFK?=
 =?utf-8?B?dkVyejNqMlhuLzl3MnRXZXkyUjR1QjRmYm9nd0ZlbUNGN3NtNkU1NFdBMVgw?=
 =?utf-8?B?QloxYmNLZkpIZ2phS0FVR0RMWTJIVUpucitiTkluSkEwc05CdlNnYTgxb1dH?=
 =?utf-8?B?aGR6OGw4QVp0YjI0UVFmNk5vRS8zcHVkNFgyeTNtWkZaUlFqRjBoRFE1K095?=
 =?utf-8?B?bFh6WVdpU3BNbnAySGx6WDEwTkZoMW1jSTNuTG55Y0dhaXFOellEbXpLaUVq?=
 =?utf-8?B?YzRvazhDbWFhdFVLaUZPSjE5VHNzZ01jREFPcDh2OTdLa1ZiaS94Y0gwU3ZM?=
 =?utf-8?B?RVpkUmFTMXBqYm9yUEEwS0JiWlI5UndqcDdIV1pBY3FRL2t0WnFZZitOTDFi?=
 =?utf-8?B?RTdDdFBLNm13UHlKQW5RS2JucFlQVGRIWkFIVUNoRVR1b2NXYlZlRXZQbXor?=
 =?utf-8?B?SVBBc09kNTFmMVNNOEJ1UXBkNHNLN201L2MrWDcrczQwVDgwMytqZG1VSnRZ?=
 =?utf-8?B?RTkzcmV2VlFEMHVxaDcyK1NraEdTL2MwWTZ6TnRRWDNtei93VCtndWRkKzRj?=
 =?utf-8?B?eWJrbGRqdGgzOFlBd21OOXJMbjFVTzNmbnBWR2RkanNzQXlKR2FBdUpzb0ww?=
 =?utf-8?B?Ri96NTdYL1hod2JUVUE0SFkzNUNhTUZkb1JwbHkzTTRtQW9aMXljQnk0Yzhv?=
 =?utf-8?B?cTZzVGFadUYxSmkzTmo3VzgvSVE0U2NUWk9UTldValdueHp0WlVKZnUxVDlx?=
 =?utf-8?B?V2ppRlJqWDd6STRGc0RzUmlmQ291SUxXVkhUNHRVNWVybW5Cb0p5S2FCRFdz?=
 =?utf-8?B?L1NTaHBIeG9OdGVkV2xaZlU4WGlManpxMlpsM2ErSnd6a3I4R042OHlKWWV0?=
 =?utf-8?B?cit0VEh6Z002Y1lpOHgvSnh0Z3czblZETVllSTF0YmJvYmltS25wTFFEaE82?=
 =?utf-8?B?d3RDVDdWOUovNk16d095eEJyMzkzTkE2QUt0UGFHQnA3OHZucUwwWFlZNnc2?=
 =?utf-8?B?N1d1T3ZnQWpKTFFRKzY3TCtQY2R0L2RVYTdqMGt6VjNJeUZFSFUyZ3lRcUpQ?=
 =?utf-8?B?MGZyWm1wM1cxYmV4Rk1uMDRqdkw3NTdSZmhUVkFLVm9qZDg1Z1VGSHBHc1lu?=
 =?utf-8?B?cmZmYXJXd252TmFqdVhtcW1VUno5NERCTmJQaUdkdUo3c0J0dVZKekF2NW9L?=
 =?utf-8?B?Sklkby9oM0NwTUVwdGJHZGoyekxWdkVDUXB5R2l2di9EWHpVZWlqWi9xcFJS?=
 =?utf-8?Q?XUV87eclTRR4NdxHDfQ7N7Ou1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 388ff6d4-1f93-4f18-57f5-08dc8f6fa98b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 08:21:33.1506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZl6lW5yXZCXQiHQbwrtiYq7JQg1uEqHca9uTZ/qjIkTR2JG2/XJs7RrZw+U86DnqGeWfNpU2XBjBy4hpj30uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7643
X-Mailman-Approved-At: Tue, 18 Jun 2024 20:22:02 +0000
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



> Hi TaoJiang,
> 
> On Tue, Jun 18, 2024 at 4:30 PM TaoJiang <tao.jiang_2@nxp.com> wrote:
>>
>> From: Ming Qian <ming.qian@nxp.com>
>>
>> When the memory type is VB2_MEMORY_DMABUF, the v4l2 device can't know
>> whether the dma buffer is coherent or synchronized.
>>
>> The videobuf2-core will skip cache syncs as it think the DMA exporter
>> should take care of cache syncs
>>
>> But in fact it's likely that the client doesn't
>> synchronize the dma buf before qbuf() or after dqbuf(). and it's
>> difficult to find this type of error directly.
>>
>> I think it's helpful that videobuf2-core can call
>> dma_buf_end_cpu_access() and dma_buf_begin_cpu_access() to handle the
>> cache syncs.
>>
>> Signed-off-by: Ming Qian <ming.qian@nxp.com>
>> Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
>> ---
>>   .../media/common/videobuf2/videobuf2-core.c   | 22 +++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
> 
> Sorry, that patch is incorrect. I believe you're misunderstanding the
> way DMA-buf buffers should be managed in the userspace. It's the
> userspace responsibility to call the DMA_BUF_IOCTL_SYNC ioctl [1] to
> signal start and end of CPU access to the kernel and imply necessary
> cache synchronization.
> 
> [1] https://docs.kernel.org/driver-api/dma-buf.html#dma-buffer-ioctls
> 
> So, really sorry, but it's a NAK.
> 
> Best regards,
> Tomasz

Hi Tomasz,
     Thanks for your explanation, sorry for bothering due to our 
misunderstanding

Best regards,
Ming

> 
>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>> index 358f1fe42975..4734ff9cf3ce 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>> @@ -340,6 +340,17 @@ static void __vb2_buf_mem_prepare(struct vb2_buffer *vb)
>>          vb->synced = 1;
>>          for (plane = 0; plane < vb->num_planes; ++plane)
>>                  call_void_memop(vb, prepare, vb->planes[plane].mem_priv);
>> +
>> +       if (vb->memory != VB2_MEMORY_DMABUF)
>> +               return;
>> +       for (plane = 0; plane < vb->num_planes; ++plane) {
>> +               struct dma_buf *dbuf = vb->planes[plane].dbuf;
>> +
>> +               if (!dbuf)
>> +                       continue;
>> +
>> +               dma_buf_end_cpu_access(dbuf, vb->vb2_queue->dma_dir);
>> +       }
>>   }
>>
>>   /*
>> @@ -356,6 +367,17 @@ static void __vb2_buf_mem_finish(struct vb2_buffer *vb)
>>          vb->synced = 0;
>>          for (plane = 0; plane < vb->num_planes; ++plane)
>>                  call_void_memop(vb, finish, vb->planes[plane].mem_priv);
>> +
>> +       if (vb->memory != VB2_MEMORY_DMABUF)
>> +               return;
>> +       for (plane = 0; plane < vb->num_planes; ++plane) {
>> +               struct dma_buf *dbuf = vb->planes[plane].dbuf;
>> +
>> +               if (!dbuf)
>> +                       continue;
>> +
>> +               dma_buf_begin_cpu_access(dbuf, vb->vb2_queue->dma_dir);
>> +       }
>>   }
>>
>>   /*
>> --
>> 2.43.0-rc1
>>
