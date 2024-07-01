Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E54BE91DB36
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 11:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7126A10E378;
	Mon,  1 Jul 2024 09:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YvdKORp0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7C610E374
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 09:14:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvA4uZKdZMzSpWogs1wjHXdIhcC8mGxr763q3OxZGP870G06ulvP+5OjSjObomHioCLzkViRMnC/zZZFXA8xzpMRrxFNh3hNQLiZJ4xfd4R5pQ+/TeiqDQXwM1RnUTd+vYOCEhW+IUydH8Cevbk+O8XuQHhWdAn1oGn4ZBkI7ZW/TtVWJdqqnJMwGpL3ERRpHjXsGvTmo7baxuUvip6H18Yto4afXtOAU80ph75fsnSXKVc9zbVqh6sn3Jcf5XCZBfxiRCQHHwqj+HSoFz91iXkyigVZKcRdJek5ltsnxPiR3qSjSBD7I5xUFVeUQB6hNPYLNn6W+BxbZdofFKRpXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARP9mqnBr8g2dAMGV1+Xu3BvAhUqmiN3ETOOsgEIveA=;
 b=M660O+9H0GrBwyt0gox/6LXFWj3Fpgh4OYXiO5W2ECpUjLuoh0/PjkBwhfXf78fReqebEM7YmFSPUPK0DPjl0A0w3AbdjxImmKmc2IRWPGqSykD6i2t/77bNRGNejgRvimwCuecIh7C+DFmgUiK/LzxsTruWuzQk47dIlMaD8rPvAtQzD+uFi/FKJ8U4xnET8+uv0M2UFowihEp+vZxs/X8QUi5IPdA20ZnY7EUZ0F4spH7e8f5zHPW/BEdCxz/g2CAf3E7dgN0ixDeNcFJeQgRnqhF5HMsJJxSsI4UgV3JVlyMNpdf/pl1XwgQVl5D1NxbMarDZHi2e1pawgl21RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARP9mqnBr8g2dAMGV1+Xu3BvAhUqmiN3ETOOsgEIveA=;
 b=YvdKORp0mHSomTY1yTFrUDhbZda3sa38VkXltL9+663ZzReP+JiFrwf8cdGhcOJxNbfs5LTRHwUVKN5d6XlFrTzkr90qWsREQXXnG9B4Jmv24a7HHVXGneOwpC0ry/YWiNOoi/gYeJdK9NApEjykcArebnURseq/cp6SM1gJu60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6855.namprd12.prod.outlook.com (2603:10b6:a03:47e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 09:14:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 09:14:37 +0000
Content-Type: multipart/alternative;
 boundary="------------Vmi9PF9F8XT2AiflhiQGEPM9"
Message-ID: <18c6ab56-1d43-4646-914b-6de793811040@amd.com>
Date: Mon, 1 Jul 2024 11:14:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
To: "mripard@kernel.org" <mripard@kernel.org>
Cc: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 =?UTF-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 "logang@deltatee.com" <logang@deltatee.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "willy@infradead.org" <willy@infradead.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>
References: <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
 <ZnxWWtdShekGSUif@phenom.ffwll.local>
 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
 <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
 <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
 <304c9faa-5a9c-4520-a3d8-0818f76dd7c9@amd.com>
 <20240628-cuddly-brave-squid-e1cb22@houat>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240628-cuddly-brave-squid-e1cb22@houat>
X-ClientProxiedBy: FR0P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c58ef99-c2af-4fed-9ae5-08dc99ae3abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnBIVXptb09VK2RBRUJwdzcyVi9EaVZwN1JVR2ZTcXpHYXl3R3V6OHJnbi9E?=
 =?utf-8?B?QzBOVXZnUHQvT2U3QVZRZjk0aXNwbFpoMXNHT1Y2TmtFeFZpU0REK0FSSmZr?=
 =?utf-8?B?RUFVd1hoTVFsTnAxeEdBd09YYjg0TWZaRm5rbTVvbnUzSHVXNnVhVXJzZnhE?=
 =?utf-8?B?TVZJNVdRaHlGS3ZpU1AxMHptRU8zMVYwZWVRVjRTd2phSlRqa0JhVE53V3Qz?=
 =?utf-8?B?L21wNFdiTiszREFVZ2NTdTAzZFhYZVlpbkVSR1FnSktRUlVzSkdsNHMrY1J6?=
 =?utf-8?B?aDhjeTJLRWM3SW1VcHZzVTRGWkhnd3J2OVdab1FtSG90cnVLTGpuUS8zaHZD?=
 =?utf-8?B?eWZLbllJeTJZc1FQcTVhTFlmZWVvcDYrL244c1cwSGdhMmR4K0cyb0NzMEpo?=
 =?utf-8?B?STNmR2c3Qi9iby9XQVc2NkFxd05OQ2EwVHZySmVMSyszZ1JETjNsU3JGTHEx?=
 =?utf-8?B?VXZvQnZmM1pZZzBjRXhGMERwdzBzamNGUnR1dHNndFlTUW4zbElzU3puZlgw?=
 =?utf-8?B?YXN3Lzl5YXdEMlVhanExQnFWTjZSS0dLZForalpVUHBpZWFyc2N1dUUzbHJj?=
 =?utf-8?B?V0EwUDJOTTNWL2xFWkw0VVE4TEZUSFNVbVFsTmQzSjI1OEJFSGRlVlBvUlNQ?=
 =?utf-8?B?K1FidEpVMGlTajJVbVRSRHVpY2dwdS9SUHpMeFVzQWtwaDVIK3Rmb1RLWElB?=
 =?utf-8?B?OFc0Q2M5QXFUeWJ2ZGZOVXNaS0d0TnRDMUMzQWhqcmJyU1ZZQjlQT2hoNHRC?=
 =?utf-8?B?a2dBRUNNelRNeDdlRHZsWVQwUnd4ODJaaFlzYTUrbU81b3g3MDIvdUY1R2k2?=
 =?utf-8?B?czU2eGVBSVM2RHEray9JYlhyTmFCbTZCdWpjM1lWdnVRYUlZTFRiR1hUTHRI?=
 =?utf-8?B?QUdvY1dDSy9mTFBsalVrUVQ3bjl5VHg0YzZUeEJYSlREMjFJbEs1Nkw2WDFq?=
 =?utf-8?B?MEVSY2RIL1BYbFpJcU1oWjlObEw2VWVzVVJlU0tUUXhRZjRCVnNTdWRkd1hl?=
 =?utf-8?B?cDl0eGgrY0xCT3Y5U1JZb3FhbytleUJQbTVjVnpkZUhISU9wMWc3ZjFMNlBi?=
 =?utf-8?B?MHlQaXRISCtRK2ZrcUluRDVwSkxic28yRi9saU5ETExreWpQWE1Cd2tLZ2RI?=
 =?utf-8?B?VVFsT0lTdWZKKzIwT1BmcDVZRzdkT1V2SENhSldVam5RL3loc3lzcUZ0dWdx?=
 =?utf-8?B?emJOZFh5YnltcXVFVmx1Q3NOQzZzV2xqMlRZQzFiOFVyNVVUNGk0TXcxTUJB?=
 =?utf-8?B?L3lJTjh3Q1ViNW94QzRpVnRxbnZwak5haGI4N3pNalJhOXVmNlE4VlZaU0NR?=
 =?utf-8?B?bmxjazQxUVdORlFrNlVRK0lPbWJ4eEcvbjZQcFB6QjQ1Z3hwbk1ENDVtcHRC?=
 =?utf-8?B?MFBBNDQyOFFuUTdFUHhoREhpeWFHelZNNVE3U2IvT2tNVUVUQ1YxNlJPck9w?=
 =?utf-8?B?VXgxQkFIeHBDUFdUb3R3NmpMbVNPQTRQZWlzWVVSV1FpTVJ5N0RScGVpQkRm?=
 =?utf-8?B?ZzdlcjlOSFFhVnRwYTBLRW1WVk1PVm83SHBqZW9EdHVYU3duQnVSMnlGcTJJ?=
 =?utf-8?B?VnF4ZjZuaXBqRVFQL1VrU1BZMHd6UndJdXhiaThVTVZKQ1FoeldtWVpFQWhU?=
 =?utf-8?B?OWM2WjhtUzdBbVpBSCtqUUEwQWRNZmtjVjNpNlJOUk9GSEIvaXhmMVcrZVRF?=
 =?utf-8?B?STY0bDdPdlNKR3oyYWxOYllZUnBMRUxtRGI3R3ZYWHAyUlpmY1FmTUxIYkFa?=
 =?utf-8?B?MXVoQlJlNDR3U1Q1bTFKclVlR1JMaDBkVXl4WmgvQkxWbEI3Yy9tMDh6ODdh?=
 =?utf-8?B?a2RpYi85WjRQeXpyVFJsZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGlzdVRmZm01cFlQOUlnY1h6N0l1djZ4SEVNMnRGdWdVZFVyRVV1MzJXNFFn?=
 =?utf-8?B?bWJJeG1XRWhSZzVJR2lGUytkRW5hcGxDeWlpTEtFS0p3QkYzTEpYOU8rMTlF?=
 =?utf-8?B?VGpIZHlrT1E0RndZMDhqNjBud0V6Q09yYzZIdHFvRmNxdGljaFg1c051SW85?=
 =?utf-8?B?TmR5a0hueXhVanRQNmY5VlFoSEJ0T3Bvd001WnQ0UnBOaDBOQVB2TVFlRy9r?=
 =?utf-8?B?WFRja2ZRUTBqL0kyQW1yVHhkekxXVmdHZUJBaXJKVDgrWEpPWmpId0g0L1Z2?=
 =?utf-8?B?MUUwTDIvQ2t0bzFyN2x5WndjU2VRNzBiWG80dFRCbmNtWFBBZjIxUTcydmxB?=
 =?utf-8?B?M2VxV3o0aXlsOFFocUI2OFVPb0Rrb1Z1TTZQeWVUZGxmbXpKbWd2QkpGWVJx?=
 =?utf-8?B?UGJzRFdjeSs2dVAxclhSRGgrNko2MGFaZlc2RDJhMWNheG5PZVIxcG4ybGo5?=
 =?utf-8?B?WUZ0ZFlaS3l1UkhGaWpLV3dyYkZhZncyaVMxdDZDeSs4SmxZVDNhL0s4aE1t?=
 =?utf-8?B?RWdXNU5qQmc2bGUrcFhHcTRjenlqTCtqUmJIRUNBZkdWRUhxZzVHN0FaS0N6?=
 =?utf-8?B?UzUvc3NtMmxheWI0L1VRTk1UODZ4Yk44dkNQNGFCMTVYL0VHMWVIdWxyRGZU?=
 =?utf-8?B?a2M0bXRncitPNWpIS25XT3NWbU82QjJocmQ3NWRIelh6dStEaml3bGdic0lh?=
 =?utf-8?B?VEVtclFDLzloZTRGVk5nOVcwanY0dXUycHY1a1NCSDYralhmRWJsTVpsY0kx?=
 =?utf-8?B?Zlc4Qys1MUgrN0xIZGZndmUyMUtLK09LT3VobVhXVThsNVNmbnNEZDRSZTlV?=
 =?utf-8?B?TlVDL09IM0l4Z1l1YWp4REpYU1ZoVGpERkVoeFV5RWNOY0cvUkQwbTJHTlVC?=
 =?utf-8?B?dVN4VzFKWmN2K2FsSm0wQ2g2RGJJeTIxbmI0K1ZuWEVHa1lWS3h4dUN5MW5s?=
 =?utf-8?B?NWdFR2dWOGNIVkFWbWNMZ0d1VUFrV3ppdkFvTUE0NEF6aHVybjM4NkhlTHQ1?=
 =?utf-8?B?MHJIeHY4NCtadXg1RWpMZi93cXBCV2diTkhWOHl0dHU5RURRbFNLQ0x4dnEy?=
 =?utf-8?B?c1I5RFJ3NWRCVmh6a3MxajREbXkyNjNWbUNkUjV4ckQzNGZNZnZzNmZTMm13?=
 =?utf-8?B?MjliWXQxcDdLWHNlQ2hORkUrK0ZtOHpEcFBZeTdvU2R0ODF2cmlmNnRyd2sw?=
 =?utf-8?B?Q1ZwL0ZlU2F3SUxSOGhRc2Zjelo1MkZmNTNwdW83eUlFMy82YWdiSE5panE1?=
 =?utf-8?B?OVp1NHZLeCsxQWlyczYwWFVPdGMwUjk3N1Fya0ZGNHdkbkpxeExYSTU4MWFL?=
 =?utf-8?B?UjRjVzZLTGZGaTNxb3hXRDRsK21zSEFDdXR5VGYvM3RLcnllZHcxbk5yaU1Y?=
 =?utf-8?B?a1NvQmQvU25sd214eUVxOWZ5ejVsbmF5cXJEeDdKanF3d1NJeDNiVUtxamFU?=
 =?utf-8?B?WXo0SjJUaVM3NHJTaFgyZGVPZWsxc21GM2VuTnNoZlhsMHRJbGVnbUZvQ3pS?=
 =?utf-8?B?LzMyN2RibDNmcHI4WHVEODhPUU5LT2g5dEhCeCs2NGlPb2o1VWJvY2M5MHpT?=
 =?utf-8?B?U0c1bGpwSU1zbWRiTmFmMWo1WHduNVdjck9DSVZ5ek9BV3ZqUGw4RFdBZVFz?=
 =?utf-8?B?cS9GV1RXSHV6bTJFTkJTRXlJbjNhcEs2azNEdDBQZDVSODI1QUtmT2RwdUkz?=
 =?utf-8?B?enRQOUE5aWtSVjQycTZYWjFJTGpBZ1BMeWI2WHFkS0tuUmRIWUpPVnh5b1pD?=
 =?utf-8?B?MndWaDkvcVdPV3RZNVlTNm9jUHZQdzZMbXlJc2pxTmVZbzhYVVluNWI2Tklv?=
 =?utf-8?B?bzB5ZUIvMkN3UVdjVXNkd0NnZ3BkNGhvSlpsaTZrWm14SmRDVnRleldqclVT?=
 =?utf-8?B?a1dXUk1sUjBWUXlWUkhtUlhqZUpkM0prdG9kK3NxNjdwd1hjK1Fzd1kyaHNF?=
 =?utf-8?B?cGpRLythOGRKMWp3bnZmWEFsaWNvVE5tREVqdVFkekVwYmV2TC9HUzlDd1Er?=
 =?utf-8?B?NDdsellKUkxjMFE4UXlaTUU3V3FjbHFIbzhpa2RvU0FQeHhWSkF4Ti9ZQkw1?=
 =?utf-8?B?WHFvMXZ5QSszaTVhTWxCRUtwVyszSHZDZFBzOS94U0txdHN1N1cxaWpyUDkr?=
 =?utf-8?Q?ionM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c58ef99-c2af-4fed-9ae5-08dc99ae3abb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 09:14:36.9901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZdv/ho500FJZkNUHJ5FPkE5YkWaKcy9vSUi0MIQj/y1UQJb+LBshyN/ONIZ4K5h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6855
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

--------------Vmi9PF9F8XT2AiflhiQGEPM9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 28.06.24 um 15:40 schrieb mripard@kernel.org:
> [SNIP]
>>> So nobody can map that buffer, and the firmware driver is the one who
>>> knows that this buffer cannot be accessed by anyone.
>> On most hw I know you can actually map that buffer, it's just that the
>> CPU sees only garbage in it because you don't have the necessary
>> decryption keys around.
> So you can always map and access the buffer, but only if you're in the
> right "context" the content would be correct?

Exactly that, yes. You need to have access to the decryption keys.

> I think that part is pretty different than what ARM SoCs are doing,
> where they would typically prevent any CPU access and fault on access.

Yeah, that's indeed an important difference Nicolas noted as well.

>>> Putting this on the userspace to know would be pretty weird, and
>>> wouldn't solve the case where the kernel would try to map it.
>> But that's exactly how all other implementations work as far as I know. I
>> mean what do you do if the kernel maps the encrypted buffer?
>>
>> On AMD we also block userspace and kernel CPU accesses, but that is only
>> done to make it easier to find bugs not for correctness.
>>
>> And userspace absolutely needs to be aware that a buffer is encrypted, cause
>> otherwise it could potentially try to access it with the CPU.
> I absolutely agree. I guess our discussion is whether it's something
> that should be implicit and understood by applications, or if it should
> be explicit and discoverable.

Oh good point as well. But I think that's more a question for the 
userspace stack design.

E.g. it can be handled explicitly by the application itself or 
implicitly by some V4L or VA-API library or something similar.

For the kernel UAPI design we agreed at some point that we don't want to 
have any implicit properties on the DMA-buf which are carried around by 
the kernel, e.g. the whole format metadata for example.

One notable exception to this is the actual hw topology, e.g. when for 
example a device has a special interconnect to another device and you 
need to make sure that the devices are powered up and down in a specific 
order to make things work.

This should then made known to the core kernel using device link 
structure. E.g. similar to how it's used between GPU and HDMI audio 
block for example.

Regards,
Christian.

>
> Maxime

--------------Vmi9PF9F8XT2AiflhiQGEPM9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 28.06.24 um 15:40 schrieb <a class="moz-txt-link-abbreviated" href="mailto:mripard@kernel.org">mripard@kernel.org</a>:<br>
    <blockquote type="cite" cite="mid:20240628-cuddly-brave-squid-e1cb22@houat">[SNIP]<span style="white-space: pre-wrap">
</span>
      <pre class="moz-quote-pre" wrap=""></pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">So nobody can map that buffer, and the firmware driver is the one who
knows that this buffer cannot be accessed by anyone.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
On most hw I know you can actually map that buffer, it's just that the
CPU sees only garbage in it because you don't have the necessary
decryption keys around.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
So you can always map and access the buffer, but only if you're in the
right &quot;context&quot; the content would be correct?</pre>
    </blockquote>
    <br>
    Exactly that, yes. You need to have access to the decryption keys.<br>
    <br>
    <blockquote type="cite" cite="mid:20240628-cuddly-brave-squid-e1cb22@houat">
      <pre class="moz-quote-pre" wrap="">I think that part is pretty different than what ARM SoCs are doing,
where they would typically prevent any CPU access and fault on access.</pre>
    </blockquote>
    <br>
    Yeah, that's indeed an important difference Nicolas noted as well.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20240628-cuddly-brave-squid-e1cb22@houat">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Putting this on the userspace to know would be pretty weird, and
wouldn't solve the case where the kernel would try to map it.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
But that's exactly how all other implementations work as far as I know. I
mean what do you do if the kernel maps the encrypted buffer?

On AMD we also block userspace and kernel CPU accesses, but that is only
done to make it easier to find bugs not for correctness.

And userspace absolutely needs to be aware that a buffer is encrypted, cause
otherwise it could potentially try to access it with the CPU.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I absolutely agree. I guess our discussion is whether it's something
that should be implicit and understood by applications, or if it should
be explicit and discoverable.</pre>
    </blockquote>
    <br>
    Oh good point as well. But I think that's more a question for the
    userspace stack design.<br>
    <br>
    E.g. it can be handled explicitly by the application itself or
    implicitly by some V4L or VA-API library or something similar.<br>
    <br>
    For the kernel UAPI design we agreed at some point that we don't
    want to have any implicit properties on the DMA-buf which are
    carried around by the kernel, e.g. the whole format metadata for
    example.<br>
    <br>
    One notable exception to this is the actual hw topology, e.g. when
    for example a device has a special interconnect to another device
    and you need to make sure that the devices are powered up and down
    in a specific order to make things work.<br>
    <br>
    This should then made known to the core kernel using device link
    structure. E.g. similar to how it's used between GPU and HDMI audio
    block for example.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:20240628-cuddly-brave-squid-e1cb22@houat">
      <pre class="moz-quote-pre" wrap="">

Maxime
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------Vmi9PF9F8XT2AiflhiQGEPM9--
