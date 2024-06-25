Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEBF9166A4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 13:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB29110E08A;
	Tue, 25 Jun 2024 11:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="t7o2vWC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D3A10E08A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 11:52:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEDNzt95BwLt+NwAx/vVgpV8jwWQ94ROVpsc1YuoviuBNo+MclkHIA9AwnLorAOLPKtOBNesvt2zy+o6I9yoDDKAmkkuMQz+NiInVebmJnoE2YJUyE8tnc+jeA5Az0mzt/mhtluPfb5u0AakK36nsn0Mup67/SvL+LYS9H65Dqt7+JLxa6B5kegr+4v/H+tO1tw8dBIxG82uIHaegHvtC9Zh5uLXphOUu/sAwhk+JewG9enjDmJbngZKa/c56amLtU2QkOXxAe179ryx0v+KP5dNmhDmcMc30CzKX52WPdkrdooYEdHY7jYgqq+rBh1Z3v+VAFVCfLhVJPti6U8UUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWEsh4IGr1Be8KglAj7eWfCOs1huXwPWACTXkqi/OW0=;
 b=YlTgEiv+TyU7JrGLh5CAR4OIO2Hs6zN0tOTl9MIlC1Fxjfz85A51+oY89S+RYhQFFZp3egIfG1RPzvDmXuv2d/CknSD+M2vTWVZLTTK5Kp7VtjUQ0vk60mmVFGm8nMLhcQEcBD0RhORE+vICKq+WT/PbsEw7qh884k6CD6d+wRpoIZOLOTIo2zf7xl568WVWZmg0Mbj62FTxUyN9mtbf6oe5DjUMmS4nj9J9n45z+jUrrhN1V5pqCvhvasV8FsnDe30WykMRF4+KFuaLMYiabMo9FbjeTK+Td9uKxW7GPM2iEOmeMSl/qAnU/NsRRJVV6nYhjKA5kHiDTJJfUFP9Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWEsh4IGr1Be8KglAj7eWfCOs1huXwPWACTXkqi/OW0=;
 b=t7o2vWC3vThv0nLFJVCE4LRyZw5uMU0esq78jRG5Q4vayRLQG+pByK8H/tvMsyZ63AVvtHk+jO591uYGWluH91GF6y8fJHT2kLNmi7n9zh1ure6PWBm42V3H/cvcr7p6BGqGPLHtk/m69ObHoHm1s1Ka2sklHE9R5NAcMM4awjs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9155.namprd12.prod.outlook.com (2603:10b6:408:183::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Tue, 25 Jun
 2024 11:52:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 11:52:31 +0000
Content-Type: multipart/alternative;
 boundary="------------29cA2Y5usDSckaVmqnPIXvJK"
Message-ID: <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
Date: Tue, 25 Jun 2024 13:52:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>, "willy@infradead.org" <willy@infradead.org>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "logang@deltatee.com" <logang@deltatee.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-3-yong.wu@mediatek.com>
 <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
X-ClientProxiedBy: FR4P281CA0411.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cdb57fb-80a7-426a-07df-08dc950d4b9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|7416011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEZMZ2h6MHlqblRqTitzWE9ETUF0bVFudVgrM094NGFBMTBMSnR3dEZlUktH?=
 =?utf-8?B?UnpvVmVCeFhEQ1o0c2ROTUNKMjJrN2hHS21TMnNEZ1M1YlZmQXd0R3FFc0h5?=
 =?utf-8?B?WHdiQ3lhU0toUE9qU01RQm1BYjdhc081SjU1VVJTdUw2dGpGRFAxSDBLZ3ZN?=
 =?utf-8?B?RGw3OWh2djlMQVpXeXdweUxFZTdIMitQeGVBTk81NTdDSFBYSjg0U3JLQW5j?=
 =?utf-8?B?VVJDSkhIMzlNRVR3bE1SZWNpSUtEVTFmY09sRXdtMkNsaHkxYjlqc3p1QWJ5?=
 =?utf-8?B?NFRDVVpjUlVWZXc1cFFoMlVpQkg2VWpYQUdtTWJIUEVjbUFmK1h3SFN0cEVj?=
 =?utf-8?B?ZWxHQUd6T3N3dmNwM2k5d00vMnNXTHVDdFVjaG1BT25yL0RTbTF0MGtyZ0xz?=
 =?utf-8?B?OXZnU2JReVhoZkV2NmJUQURBMWRJOEplSzNWem5TbmQwZDgybzlYNzlqN0U4?=
 =?utf-8?B?YkxnendQR0VhT2lQV28vK0hTT2VBRWpCMUI3TGl5R241N2ZwTHRvd05Bck9r?=
 =?utf-8?B?MHBEckxnT0VjNkRIenovRzFFUXhWSG9qeVV6SnJ2QWFyR2g5RDQySUNqc0xo?=
 =?utf-8?B?a1dWYUNodWM3VjlmbndqMjBCWG5XZFhKNU1tZEF5dS9mUDdmaEY3eER0WmxU?=
 =?utf-8?B?NzZwSmNjNHJUU0RTOU0zL1JrTE54d3Myc1lYZDU4U2owVlRabHYrMnNSa0ln?=
 =?utf-8?B?UmdUTnNvTTJyUVVBZ2FOU2dLYlV5QjF5ekpLRnA0VXBETWxORVltZHVkejli?=
 =?utf-8?B?LzFkVDRmc2tmT3JQQ0JaUnB4T0ovZDVTZ1BBZTU4MmhiOVZ0eG9aSG02UlZH?=
 =?utf-8?B?cDdvZEg5dGdxYXRndkhndlF3RW80ajBUaXN4QmYzRTRzK2ZGQmFCRzIxeDV1?=
 =?utf-8?B?aWEyQTZ5ZHdYQjRmNHpRWWtIUUgxNUlMZ1o4SjRsVHJ6UkdxQURLdnlic2l4?=
 =?utf-8?B?dkpiNExHNHV6LzM0QS9CQlpkcVZseFpNTVFTSXF5eFdKNDRnL25MenRtaUUv?=
 =?utf-8?B?cGE3Q2d6emhZYkRMbHowNFYyUU5TUHhNT1cxUGZxMHlnaU1MQ2VheE5peGdP?=
 =?utf-8?B?cHhoMHV5Umkxcmhud3YzU0VhVWxwS1V4NEZwSXVybC9kR2ROWkJrSGVrZ1RD?=
 =?utf-8?B?clRaV3FkdmszS1U3NXZWTW1oT3VHSzBKdWN3TW5ZZXdiM1JYUWZ0bGNWS1Na?=
 =?utf-8?B?bCtMVkh6cDlHNDdZTGhLNlZsWVRSY0NqNjlwQUdndHIwR1J2eGVFY281NkQ5?=
 =?utf-8?B?eFY1S1grSU5YeW92bkQ4R2d2Umd5aEZSYkczTWh2M0xqRmZ1WFRLNmUrT1J1?=
 =?utf-8?B?QXo3VHk3cUdoRlhsMk4rcktZSnVZOFlKTmpYV1R6VFNWVjJaTStuNzUrNzFz?=
 =?utf-8?B?S0pwdGlhUmgzd2dKUTIxN1BmKzRvb0huL0IrQkhaazRBeGtLV3lCdEdXempJ?=
 =?utf-8?B?ckdpZTlvNEtJZUtSNGoxWWFublVwSldjNndMR1JBUFZuT2swZ1hCUlNmNlZV?=
 =?utf-8?B?S3pyUEQ3bWRBVTRLNmtJejR5QW51RkthdWpjV1VJa3k3MWNrbExoMlNUVzdB?=
 =?utf-8?B?a0lDaVpZcXlRNGRVOWhyNjZDWGRrZ2pJQ1NrK3AvU012UTg0NVZTK0FVd3Rm?=
 =?utf-8?B?aGpsTFpGWlNvMWY3NDR2a0c0a2p0bWdZY3FiSnQyNVhWOXBSSkJvdUVVODRE?=
 =?utf-8?Q?uaOxgrVKDYc+rnbezXlY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(7416011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S08yWFBsNDJtYmFwdnZSbWs0WjNBOVFDYWFtK01BS2psWDVPWkVXNk5EMEZY?=
 =?utf-8?B?SkhQa20vU1ZJcVFXK1NaSFk1NCtGZmloRjY0cmNGcFY2cGQ5YTl4UFNZNjRV?=
 =?utf-8?B?T084MEpIS09lMnUwaG9zQTZWSDExakozNWhXakJNYkN1YkZDSE1IdG1qUlJM?=
 =?utf-8?B?NURtM2ptRzlkRXR0SkszVnVqQkpWbEU0OVpCVUplaXp2OTNzZE9MZ0JTTGZx?=
 =?utf-8?B?R2UxTUxsa0Nud1dONmZOaTVhb1dWVzJacWtTUlRDdWMzUVB2VWxZeDRGM3JX?=
 =?utf-8?B?d2hMQmx3YUFqa3Z3RlZ1VzhWbklPR2V6cldlMkNXOU1OWlZNaHJlQ2xqcXVN?=
 =?utf-8?B?Vk4xNk54MUtCQ3lrRE5LV0FPOTBFNWQrQUlUZkg3cVZLSFYrallNMy85V1Z6?=
 =?utf-8?B?RUlqbVhRejBMN3VwZER3VjJuTzJ4SkRZRzdYT2I2dXJhVXJ2Z3lQQ05hMTNY?=
 =?utf-8?B?TkVEdmFlTmpDd2xmT2JlaWc3K3BrWkZOVWJDTlRnQ2RESE9UQlp4c25BYWRY?=
 =?utf-8?B?Z0xNMFNQSU94emlRZ2JnZ0ptdlBPTXBZaG5hSGRTOXRoSHFRb2xqYXZZNkxn?=
 =?utf-8?B?RUFwSG9WOVVUMVkxV0g0Mzl4V3F6eGxSUC9vdlBPL0pxR1Q2VVhoK1RSWTNw?=
 =?utf-8?B?bG0zVDFTcXB3K0h1Sk1HRXZiNUczalZtQmRsVnB2eFZ0emxyYWwrV01IYWho?=
 =?utf-8?B?ejBrOHozM2p4aWpaQUxKWitKMEIwT0RQdFlNWnVqbllBSWhNMVh2bmNldTNL?=
 =?utf-8?B?WXNGbmZzWHoyZi85b2ppU0VwYStqQUplSTZ4MHl2T2YxMUR6OEFUekRwR01G?=
 =?utf-8?B?WDdyYWlQN2h1eDNrTFZSbWpBSWlpWHF5RzE3Mm0ySmlVME1VM0p4bUpBL2Iy?=
 =?utf-8?B?ZEVFYWJhV0IyY0FhVGtjUWpBelVEVjdHVDVnOHFxcXhDQmhJaWl3TkMrdzRI?=
 =?utf-8?B?N2NHTUFManlBdDNEUStnemhySnRSRmxGNU44Uk5YTHduQy81cklxWTdTQ1pp?=
 =?utf-8?B?dVY1T1QwM25vbFRQOGhXR0pJVFNiMC8rVWo0YnVyV3lYK3ZJckVBL3QvME41?=
 =?utf-8?B?ZTBncDZjalRhc2k4bUE1Y3IzMHFGZ1E4anRzWitnWVY4TmRFNGpOclM2c3p5?=
 =?utf-8?B?aEtZZDdQSnR1Tnk0VDhwUGswY1JjN0ZibWh4THQ2bGFQSzVZYm8xbXZNeXhI?=
 =?utf-8?B?elptRDJrZVJ3dzhLeGFPUWsyRzQrV1JvTzJYS2VFUG42cGN3cWR3TSsvTXov?=
 =?utf-8?B?dy92MDB3UmZvNW9xdEl4ZWFHYllnZTZmU0lrTmp4ZFVzT2ZldWp0TG9RUmNK?=
 =?utf-8?B?YW1FZ2NwMmN6bmdyWjhRdFFGc0JrUlZoWHFFbGVnM00rcmZnYVptTVFjdWRK?=
 =?utf-8?B?bVFCMWNLR0h0dG1xaTdUeE5YWmc5NGcwZmhFZ2ZPZVdacjEvZjVscmVyMUtv?=
 =?utf-8?B?dzJKVWpOUldPUlFOUTRyZnB1V0UxMi9wMnZ2NmpsQTRNZGNPVEYraExkQlRa?=
 =?utf-8?B?VTZid2FSMkswNlYyV01oRzB1ZkhpRkhQRjRPcHpXZ1NmRWFILzN3QzhOajFy?=
 =?utf-8?B?KzFmYmJ5NS92KzdZdVhkQ091Nk5xQ0sxejhrNnNkZi9TNTc3VmZhTytjOGdh?=
 =?utf-8?B?djZxYzFJQmhYRzk0QzkrV28xY0ZsODVJY1JtSWhiVnZ0MUMwZEtjOWgxTzJM?=
 =?utf-8?B?Qld2R2lOOXIycXNpYytlN2RRS1Z0cGQ3Z0czRU1OeXdabXRXdlFBWEl4WWhZ?=
 =?utf-8?B?L0pHTVFWU1R1eXFJakJlbG5INGJsUWdzT2tDVllqUGN3QWI4S2lyRVAxeW5T?=
 =?utf-8?B?OW1WSEx6dlpiRVRuOXNaTXBYbmUrS0tNWTlJamhnb0k2a0h0Mmh1SEozVHd6?=
 =?utf-8?B?cWFUcHRxNWYzZHBLYmw0Q3owSHVXL1NhOU9OVW15MHJCaWd5cVJxMFYxYW8y?=
 =?utf-8?B?RTVwZCtCNGZWYmhXQm9YN1c0VjB0dlRwL1hSelhBMjZubmtKV0JhbnlhLzNC?=
 =?utf-8?B?OVF5aTVWcDlYVjliZ3dwb3Y3NGhUZDRucEhldFdZRTFYWHdLSHVPM0xuSVpN?=
 =?utf-8?B?blJRaEFUQUQ4UU95cGozVStKRVAwUkY5ZVYwSm5Od1NRSGZJZ0t3dStFSDZp?=
 =?utf-8?Q?TyQMIjF5ajewGEDGbQtuUr3Rm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdb57fb-80a7-426a-07df-08dc950d4b9a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 11:52:31.7097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEAQrui35ROl8PkgvO2y8I5sXbZY9PkMLiglAqbaxdBikjcvkKSkzcmMHsEU4aDh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9155
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

--------------29cA2Y5usDSckaVmqnPIXvJK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 25.06.24 um 13:02 schrieb Jason-JH Lin (林睿祥):
>
> Hi Christian,
>
> On Tue, 2024-05-21 at 20:36 +0200, Christian König wrote:
> > Am 20.05.24 um 09:58 schrieb Yong Wu (吴勇):
> > > On Thu, 2024-05-16 at 10:17 +0200, Christian König wrote:
> > > >   
> > > > External email : Please do not click links or open attachments
> > > > until
> > > > you have verified the sender or the content.
> > > >   Am 15.05.24 um 13:23 schrieb Yong Wu:
> > > > > Introduce a FLAG for the restricted memory which means the
> > > > > memory
> > > > 
> > > > is
> > > > > protected by TEE or hypervisor, then it's inaccessiable for
> > > > > kernel.
> > > > > 
> > > > > Currently we don't use sg_dma_unmark_restricted, thus this
> > > > 
> > > > interface
> > > > > has not been added.
> > > > 
> > > > Why should that be part of the scatterlist? It doesn't seem to
> > > > affect
> > > > any of it's functionality.
> > > > 
> > > > As far as I can see the scatterlist shouldn't be the transport of
> > > > this
> > > > kind of information.
> > > 
> > > Thanks for the review. I will remove this.
> > > 
> > > In our user scenario, DRM will import these buffers and check if
> > > this
> > > is a restricted buffer. If yes, it will use secure GCE takes over.
> > > 
> > > If this judgment is not suitable to be placed in scatterlist. I
> > > don't
> > > know if it is ok to limit this inside dma-buf. Adding such an
> > > interface:
> > > 
> > > static bool dma_buf_is_restricted(struct dma_buf *dmabuf)
> > > {
> > > return !strncmp(dmabuf->exp_name, "restricted", 10);
> > > }
> > 
> > No, usually stuff like that doesn't belong into DMA buf either.
> > 
> > Question here really is who controls the security status of the
> > memory 
> > backing the buffer?
> > 
> > In other words who tells the exporter that it should allocate and
> > fill a 
> > buffer with encrypted data?
> > 
> > If that is userspace then that is part of the format information and
> > it 
> > is also userspace who should tell the importer that it needs to work 
> > with encrypted data.
> > 
> > The kernel is intentionally not involved in stuff like that.
> > 
>
> Here is the expected protected content buffer flow in DRM:
> 1) userspace allocates a dma-buf FD from the "restricted_mtk_cma" by
> DMA_HEAP_IOCTL_ALLOC.
> 2) userspace imports that dma-buf into the device using prime for the
> drm_file.
> 3) userspace uses the already implemented driver import code for the
> special cases of protected content buffer.

What is so special on that case?

>
> In the step 3), we need to verify the dma-buf is allocated from
> "restricted_mtk_cma", but there is no way to pass the secure flag or
> private data from userspace to the import interface in DRM driver.

Why do you need to verify that?

>
> So I can only verify it like this now:
> struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device
> *dev, struct dma_buf_attachment *attach, struct sg_table *sg)
> {
>      struct mtk_gem_obj *mtk_gem;
>
>      /* check if the entries in the sg_table are contiguous */
>      if (drm_prime_get_contiguous_size(sg) < attach->dmabuf->size) {
>          DRM_ERROR("sg_table is not contiguous");
>          return ERR_PTR(-EINVAL);
>      }
>      mtk_gem = mtk_gem_init(dev, attach->dmabuf->size);
>      if (IS_ERR(mtk_gem))
>          return ERR_CAST(mtk_gem);
>
> +   mtk_gem->secure = (!strncmp(attach->dmabuf->exp_name, "restricted",
> 10));
>      mtk_gem->dma_addr = sg_dma_address(sg->sgl);
>      mtk_gem->size = attach->dmabuf->size;
>      mtk_gem->sg = sg;
>
>      return &mtk_gem->base;
> }

Complete NAK from my side to that approach. Importing of a DMA-buf 
should be independent of the exporter.

What you could do is to provide the secure buffer from a device and not 
a device heap.

> I think I have the same problem as the ECC_FLAG mention in:
>
> https://lore.kernel.org/linux-media/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org/
>
> I think it would be better to have the user configurable private
> information in dma-buf, so all the drivers who have the same
> requirement can get their private information from dma-buf directly and
> no need to change or add the interface.
>
> What's your opinion in this point?

Well of hand I don't see the need for that.

What happens if you get a non-secure buffer imported in your secure device?

Regards,
Christian.

>
> Regards,
> Jason-JH.Lin
>
> > Regards,
> > Christian.
>
> ************* MEDIATEK Confidentiality Notice
>   ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
>   
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

--------------29cA2Y5usDSckaVmqnPIXvJK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 25.06.24 um 13:02 schrieb Jason-JH Lin (林睿祥):<br>
    <blockquote type="cite" cite="mid:1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com">
      
      <p>
      </p>
      <pre>Hi Christian,

On Tue, 2024-05-21 at 20:36 +0200, Christian König wrote:
&gt; Am 20.05.24 um 09:58 schrieb Yong Wu (吴勇):
&gt; &gt; On Thu, 2024-05-16 at 10:17 +0200, Christian König wrote:
&gt; &gt; &gt;   
&gt; &gt; &gt; External email : Please do not click links or open attachments
&gt; &gt; &gt; until
&gt; &gt; &gt; you have verified the sender or the content.
&gt; &gt; &gt;   Am 15.05.24 um 13:23 schrieb Yong Wu:
&gt; &gt; &gt; &gt; Introduce a FLAG for the restricted memory which means the
&gt; &gt; &gt; &gt; memory
&gt; &gt; &gt; 
&gt; &gt; &gt; is
&gt; &gt; &gt; &gt; protected by TEE or hypervisor, then it's inaccessiable for
&gt; &gt; &gt; &gt; kernel.
&gt; &gt; &gt; &gt; 
&gt; &gt; &gt; &gt; Currently we don't use sg_dma_unmark_restricted, thus this
&gt; &gt; &gt; 
&gt; &gt; &gt; interface
&gt; &gt; &gt; &gt; has not been added.
&gt; &gt; &gt; 
&gt; &gt; &gt; Why should that be part of the scatterlist? It doesn't seem to
&gt; &gt; &gt; affect
&gt; &gt; &gt; any of it's functionality.
&gt; &gt; &gt; 
&gt; &gt; &gt; As far as I can see the scatterlist shouldn't be the transport of
&gt; &gt; &gt; this
&gt; &gt; &gt; kind of information.
&gt; &gt; 
&gt; &gt; Thanks for the review. I will remove this.
&gt; &gt; 
&gt; &gt; In our user scenario, DRM will import these buffers and check if
&gt; &gt; this
&gt; &gt; is a restricted buffer. If yes, it will use secure GCE takes over.
&gt; &gt; 
&gt; &gt; If this judgment is not suitable to be placed in scatterlist. I
&gt; &gt; don't
&gt; &gt; know if it is ok to limit this inside dma-buf. Adding such an
&gt; &gt; interface:
&gt; &gt; 
&gt; &gt; static bool dma_buf_is_restricted(struct dma_buf *dmabuf)
&gt; &gt; {
&gt; &gt; return !strncmp(dmabuf-&gt;exp_name, &quot;restricted&quot;, 10);
&gt; &gt; }
&gt; 
&gt; No, usually stuff like that doesn't belong into DMA buf either.
&gt; 
&gt; Question here really is who controls the security status of the
&gt; memory 
&gt; backing the buffer?
&gt; 
&gt; In other words who tells the exporter that it should allocate and
&gt; fill a 
&gt; buffer with encrypted data?
&gt; 
&gt; If that is userspace then that is part of the format information and
&gt; it 
&gt; is also userspace who should tell the importer that it needs to work 
&gt; with encrypted data.
&gt; 
&gt; The kernel is intentionally not involved in stuff like that.
&gt; 

Here is the expected protected content buffer flow in DRM:
1) userspace allocates a dma-buf FD from the &quot;restricted_mtk_cma&quot; by
DMA_HEAP_IOCTL_ALLOC.
2) userspace imports that dma-buf into the device using prime for the
drm_file.
3) userspace uses the already implemented driver import code for the
special cases of protected content buffer.</pre>
    </blockquote>
    <br>
    What is so special on that case?<br>
    <br>
    <blockquote type="cite" cite="mid:1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com">
      <pre>

In the step 3), we need to verify the dma-buf is allocated from
&quot;restricted_mtk_cma&quot;, but there is no way to pass the secure flag or
private data from userspace to the import interface in DRM driver.</pre>
    </blockquote>
    <br>
    Why do you need to verify that?<br>
    <br>
    <blockquote type="cite" cite="mid:1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com">
      <pre>

So I can only verify it like this now:
struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device
*dev, struct dma_buf_attachment *attach, struct sg_table *sg)
{
    struct mtk_gem_obj *mtk_gem;

    /* check if the entries in the sg_table are contiguous */
    if (drm_prime_get_contiguous_size(sg) &lt; attach-&gt;dmabuf-&gt;size) {
        DRM_ERROR(&quot;sg_table is not contiguous&quot;);
        return ERR_PTR(-EINVAL);
    }
    mtk_gem = mtk_gem_init(dev, attach-&gt;dmabuf-&gt;size);
    if (IS_ERR(mtk_gem))
        return ERR_CAST(mtk_gem);

+   mtk_gem-&gt;secure = (!strncmp(attach-&gt;dmabuf-&gt;exp_name, &quot;restricted&quot;,
10));
    mtk_gem-&gt;dma_addr = sg_dma_address(sg-&gt;sgl);
    mtk_gem-&gt;size = attach-&gt;dmabuf-&gt;size;
    mtk_gem-&gt;sg = sg;

    return &amp;mtk_gem-&gt;base;
}</pre>
    </blockquote>
    <br>
    Complete NAK from my side to that approach. Importing of a DMA-buf
    should be independent of the exporter.<br>
    <br>
    What you could do is to provide the secure buffer from a device and
    not a device heap.<br>
    <br>
    <blockquote type="cite" cite="mid:1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com">
      <pre>I think I have the same problem as the ECC_FLAG mention in:

<a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-media/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org/">https://lore.kernel.org/linux-media/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org/</a>

I think it would be better to have the user configurable private
information in dma-buf, so all the drivers who have the same
requirement can get their private information from dma-buf directly and
no need to change or add the interface.

What's your opinion in this point?</pre>
    </blockquote>
    <br>
    Well of hand I don't see the need for that.<br>
    <br>
    What happens if you get a non-secure buffer imported in your secure
    device?<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com">
      <pre>

Regards,
Jason-JH.Lin

&gt; Regards,
&gt; Christian.

</pre>
      <pre>************* MEDIATEK Confidentiality Notice
 ********************
The information contained in this e-mail message (including any 
attachments) may be confidential, proprietary, privileged, or otherwise
exempt from disclosure under applicable laws. It is intended to be 
conveyed only to the designated recipient(s). Any use, dissemination, 
distribution, printing, retaining or copying of this e-mail (including its 
attachments) by unintended recipient(s) is strictly prohibited and may 
be unlawful. If you are not an intended recipient of this e-mail, or believe
 
that you have received this e-mail in error, please notify the sender 
immediately (by replying to this e-mail), delete any and all copies of 
this e-mail (including any attachments) from your system, and do not
disclose the content of this e-mail to any other person. Thank you!
</pre>
      <!--}-->
      <!--type:text-->
      <!--{--></blockquote>
    <br>
  </body>
</html>

--------------29cA2Y5usDSckaVmqnPIXvJK--
