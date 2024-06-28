Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F2991BDAE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 13:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C2B10E0B4;
	Fri, 28 Jun 2024 11:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Gnvx0T1Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C7210E0B4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 11:42:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYkfodJs+X99sWRqlsy0mbJWmhqyBtUHrW6mey0R+ZaxixykrYaVbK9G+7m2TYyRvkhziWp4nvz0vg6vyT0B01vZsuTg7fna3NBHK7heOIsrinrc4q0dBheGABS6cGVHKtqw6V41crPAZluygaCBipSDGzGvc2lKlh2HFRMc8GGu+TUHbsOSUKG3ifcK37EEJeSL0Azqd/9rxXU22fj9QbLu9cq3cPDW3wBNIiUkiRKlFF6vBRenAIHrnzr/TQyq5qo7Hw9u/7XLy+OJ5aJVbLPhK9cBSvo074E9tPPE8qb244Z+VzGvNXtx2uXyray73e08zVsOpLUy9Wb51jIAEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyPPxlB5U+jbvKjmlgnEEfZBQrvffoHFFP+UmQTgfCs=;
 b=jE0xQfPwaAcvLAOTXRvMtHZg0wuK8jNrs+lXx5FJuFRA7QehXf1kO/WkWjNGcRv7fRCJYK2C4G3nhdUpzM6I6hEnDSQHc5wHciA/OD9WgSc92h19e5DfKy549iYuxOYEuJ8DPcy3InfNmgiy7jGEm/j8qttOEf3yAlz8N67yKjvkKk8N+FRMMOO9242zIcqc6Kre/8TO5qTIItRYTmlz1sfEP0OUFNq75Bxxu4iJk7tIMBr5LAaY7BhDC0BMgb/s6I2qyS0k2Xfhsu1lh/GqfI5zvCby69XaFTQos0fQdX6HQYiDY4nZiJuhhvsjT1O+g8R6RBqPH13M9o8C/ZSx8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyPPxlB5U+jbvKjmlgnEEfZBQrvffoHFFP+UmQTgfCs=;
 b=Gnvx0T1YSK0aoLEECPhwO8nFqZG4SF3VUbB9jUTlfXtbs35HR/qHTci5U8XJF2eJ46VtRAbLFL8HL0W9n1xVLHyV0If8ZD/0FyK2jeB6OguQAhYpEak60TBR9L69z6Bisfs5d6usu2SZy4UkP88bFLmzx2LJtzMsTwc0QVxFN3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4439.namprd12.prod.outlook.com (2603:10b6:208:262::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 11:42:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 11:42:38 +0000
Content-Type: multipart/alternative;
 boundary="------------7XWKLUlZUiKle7lJAZtPkIT9"
Message-ID: <304c9faa-5a9c-4520-a3d8-0818f76dd7c9@amd.com>
Date: Fri, 28 Jun 2024 13:42:27 +0200
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
References: <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
 <ZnxWWtdShekGSUif@phenom.ffwll.local>
 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
 <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
 <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4439:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f91faf2-f2d2-472e-2e0a-08dc97676902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2Y4ZndOSlFZektYNG9pQjhwQXYzdXNYZWFHc3pzelZmTVhsSTBkRG9ZMkNX?=
 =?utf-8?B?b3ZtdnlkYk5lRVB3VkZKVkhsT05jc2VNSmhNZEhtZDJsM2Rra1RQY0VGZGpB?=
 =?utf-8?B?bzlqU21QSm80bXV0UVVBM05FeTE5VXdZd1Q3YmJibzhGOUJ1MUkrMjI4Wno0?=
 =?utf-8?B?azRRNUtQNksxWnNodmxLWWx1Nk0vNG5CaXBIdW1TSkVUSzNVWk1FQWx3UHFY?=
 =?utf-8?B?S2FBSmgyR1Z0US9McnF6NVZPOFNaQm5sNGs2ZHlQVzNjeG4vLzdvVnZqa1ZK?=
 =?utf-8?B?R3RqWTVOcks2UTJaZ05YZzNwMlU2MGQ4eFhIamhKWWZJMkZqaUltNTFMeVhz?=
 =?utf-8?B?VGF1b0ttcVBwc1c1dlJnWnF6UUdLNlVROUlTQ3RKaExBSnpJV3dnQk44SFdV?=
 =?utf-8?B?M21UeHp5cHZXYzBIYStMYlBTbDIzaDF2S1dGWEg1YXdCU3dnbVpCSUhzNVk1?=
 =?utf-8?B?azA5QzE2RGxydFlBaURMZjhEd21WWG1aYjlFSVZDYjF6UHhQTVpYQ0ZtTDRk?=
 =?utf-8?B?Rm9RYnBQTVRKdCtuNTViSUV5Z3NIMEx3czg0TVRlZ3JXUTVVMTVQV2ZhQzRp?=
 =?utf-8?B?TUxHRThQQjhuUDl0MDNpK0ZRNkF5SkphZWpoeEdtVjE5blZuRG5zaTZqRm9l?=
 =?utf-8?B?S0FPb0hLTkF3VDRxUTJkOTFmQi9XcHRDTFl5Yk1JbVVZWGlKVUVKV0lYSFIw?=
 =?utf-8?B?MHV1Uy8xYUZsOXkyaGFzUXFYeS9KUkExYXBkdTVXNkZTMWRIejRRc1NySHJQ?=
 =?utf-8?B?RzVsaWcvc2VFZ3RiUUh5eWhDS0EvWjNTRnQ0Ymx3dlA2Zi9jSlV4RllRaklO?=
 =?utf-8?B?Vk1DZ0toL3RtWVN1Q20rYVVNalNQQnNsVUZFUy9Pb1JtSWE5akxjb2ZrTVZx?=
 =?utf-8?B?QWt3SEU0UEtKSkw1ekVEZkZXZzZTem5JQ2Znc2VMb0QxOExMQ05rRU5uTWlJ?=
 =?utf-8?B?MS9RbXFUazJkTWVVaDNDaktRTHphUGwvTURKR0s3N0RqVHBPMkZtcjRXdHFH?=
 =?utf-8?B?R0VNWWt3b21sb2VZdmY3QnlyN3hoOG8rNXQvMTRXV3NORDlLVDEzS0t5TjR0?=
 =?utf-8?B?aG5yM2V3N0dzU2gyQ0o1ODIyeS9MRU9HUXRJMnRvdjVHSjl2STJ5TCs1NjlB?=
 =?utf-8?B?ZzcxdVM5QzlNUnZBOXBKQkpaL3dLdVk5WHNmeW5uMnhkUVVTNVAzcGRsNXhI?=
 =?utf-8?B?Y0RkUXc2RDF0ZXVwMGlQNFROUzZ6OTZLczN6VEdHeG9kOGdOWWZYZUV2Yllt?=
 =?utf-8?B?OU1teHpMVmVnQUtyU09QYzhVWmFOK2lrSHFiSzJycnlZakE1eVlDbzdUMDAz?=
 =?utf-8?B?SkxYeTFnYXY2MHdvM1dwRDJzNjFPQUJXUlFqeXYvOHg3KzIvZzFTLy9STmRk?=
 =?utf-8?B?cUhjTC9oNjhTSlNpckU5dFZTdW9hd0dvNlhKcStQSVIvU0RwY0JCeWRsajBp?=
 =?utf-8?B?OGlQVGFzaW11U2RUV1IvQnpPWHhBYzRweTY4eDBSK0RMYXZGRTBISFVla1Rn?=
 =?utf-8?B?aCtZZHNWaU9jY2ZodnZiZDc3YWdHVTlldEQ5VmpxcUZseWZCVm5lK2VOMmRT?=
 =?utf-8?B?ZlJHMVZvdGcwdlc5cW9VYU5wTm05VS9EdkltdW9QQ0FNa0owdTBJakZ3NitN?=
 =?utf-8?B?UDVpOWFoOWFJTE15Qk9UaFVMNWJIZWlmSnN6N2g0MUtwTG9uSDl0VGlFYTB6?=
 =?utf-8?B?Z005R0FSRWV4UURxbFo3N1Z3a2MxbEVSSTNJK2Z5a3dlemVFY253Q0dPdlhj?=
 =?utf-8?B?RHdSaVFaOGVwajVGc3NSSU5NZHhaL3NhWmR2dXRvVDJJd0N2eTd5bVN3S2lz?=
 =?utf-8?B?VjRGT0VjODhZeEk5Y2kvZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHJvV1NkeEZOT2RTYlB5M2Q2S2orVWkrbjVFMEVjVXhlSm9IOVBpbGk1REFn?=
 =?utf-8?B?cWJkOEJlc1dYTHllbXR2bVRMR0R2WXN0eUVmY1RGQ0lVa2pEcFpYNUdnNWgy?=
 =?utf-8?B?TTUwZVAzZVBuK2YvRzJDMU1ZSG1MZkFlMTNkbmZTOGY2V2ppcU1mOWM3cGRT?=
 =?utf-8?B?c2pMcmlqclpFK3JaWnZZWGZmTGtJUjdCWmgyWDVIWDFaeE9jWFBOdXExRGEr?=
 =?utf-8?B?TFpXUXFUL3o0engralpVR2gzMkRTYVZzZHNyWVhjbnBmRUhBZjkxdUUxU2FY?=
 =?utf-8?B?ZkxhRGlaWUd6UGZGS2ZHSHZHcFNGUEhZMUN1RldEZTVjNzZ0c3hPdFI0NmVX?=
 =?utf-8?B?NDNqbUVPZ0wxZ3R0cTFHWURVcURJc3lxM0VqNkY5KzdNQ2hQV0FobHVwSzJx?=
 =?utf-8?B?azFwK0Z6N1A2Q3JibGRieHVGSGlWelJaSS9WNk9qRzIrRC9ZTWxSV1Z0ZHdQ?=
 =?utf-8?B?L2drNG5PeVNpeUFqZHZmb1dKbVMxTU1rS01QeUxodjhLTnRFVU94bC81T0N0?=
 =?utf-8?B?blRYVUwyYlF6S3hpL2QrQWV2d0puZ2hkMjdmeWpSVU5Dek9qTWU3RjZoQk9H?=
 =?utf-8?B?dFIrNmtVbklROHlJK2V6STllcm9yYVhXUVJLQjE5dGlDUWpudWQ1aWw0MTFs?=
 =?utf-8?B?dHJuTWRJZ0ozazBwQjRkUEVNcFNWc1YxUGtxZ2NoNWhHUjhXU0hZM2RtUEM2?=
 =?utf-8?B?Qm5wZE5mRmNxR3NtZnVBS1RZNlJ2Y2l4TEpvUHpRZzJtcEkvOEdSbWhKd2xW?=
 =?utf-8?B?QjQ5dTBVSkliUFRWUzlHU2xWRS9jYjQzblYzeGVKcTFYQjMwRFd0RlF2YWVM?=
 =?utf-8?B?N2NJeFNYRVY4elk5Y3V1SUJGdFNsTW0yVHJmSW1jaFNBQlFtVytiWEV0ZjJM?=
 =?utf-8?B?ejgvWW83UFZHeXlnU09ORTFFZURBZGFxV1dRYjNjWFhJeEJYS0R1dThZRW9z?=
 =?utf-8?B?bndxQ291QkwzblVaZXlCdk5pYmIwaDNBallMTVFGSWx5U2t2OGdzZ0pIc2hj?=
 =?utf-8?B?MXQyTXRoQ3NVSFJvcWpjRGFoNEpPK1N2bS9Wano3QXNhWFVsNkdXSnVseGFl?=
 =?utf-8?B?UStGZW11SGpEd0N5RmZCUzhncERpSWVPcWtKMVdyNHl3ZWV5aHpHN1VuRFhQ?=
 =?utf-8?B?OERzd25qR2h3eWpKNURpWDVWOXMwc3FHaXJ2REhNSXJxOFJySW5NRmdOdTFt?=
 =?utf-8?B?Rk1CQXllcDQ4aWlWUlpCUDFRRWpEbDRSQmRzL28wcGhIWEdiRDRhaXFLbitZ?=
 =?utf-8?B?U0wxRU5CZkx1L3V4K2pMQTYxdFVrWElkdm9vMW15ZWE4UDcvRitvSFBtWmhh?=
 =?utf-8?B?UFI5Mm41bFhIb2tYQXdURlBhQy9YMmlQaTkrOFhqNE9rV1E0QzY4b0p3ZnJO?=
 =?utf-8?B?UlkyMWdzNGNZNkNnbytnaDlEbE1iaUVvTDFLNFYzQkxKU2YyTW9SSi8yQXhE?=
 =?utf-8?B?SHJ4ald6aHZiSi9lbWc5Z3UrYzVjR2hpR2E5ckJldy8zOFNjUk13RUFGSWU5?=
 =?utf-8?B?RExPSlpQdDVFcGhFajJSQkdqZHVza3FBdDRyOGxJV0xYbm50djdQWG0rNkZD?=
 =?utf-8?B?Wm9JQWVOY204ODl6SExxV2xLdnNNaXdRTnZKYWJqWkkybElweFNrRk9oZkd3?=
 =?utf-8?B?dE9FNitVUEIxR2lXK3hkdjhzbWxMUkk2WFV6VUxJcDNvT1h4ZUZoQzBxNUZD?=
 =?utf-8?B?UGdvdndwSWFHanlyMm9EZ2VBa1lWNmpkRE5IcjlrQkYyYWE0eDJiUW1DdUFq?=
 =?utf-8?B?VzRYR3lyZVp4N3phY2JmZ090cmxZZGs5dWZONVI5UEFRb1NjV0tqMTBxckMv?=
 =?utf-8?B?Ri82ODh1OXNPSHoxL0FrbG1iRzgxQnA3cVRJNDFacVJ4MmhCMW03RTlGd010?=
 =?utf-8?B?ZkJMNFpjVThlT2NHcy80NkxkR1dDMzY1Z3VKMDVWNkJ6ZWpIRC8yTVozd0o3?=
 =?utf-8?B?clR2RmdrQWp0aUZKUm5WMWFyNzFwWmFKV0EvK1ROWkpwUlB6MUdNdUQ0VndQ?=
 =?utf-8?B?R0tIa0FEMjIya0NXMFN6MnFkSkpaSzBDaGd0Qml6b1ZhWldFY2t5bldsS1Qz?=
 =?utf-8?B?VFQ4OWp5b0NTNm1DTWhOM1B2VS9NQ1l6UEpPSTkyKzRFbGZERWlVQ0NlOVBR?=
 =?utf-8?Q?Qvso60AQVdUz1rr/ThPrBdyGy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f91faf2-f2d2-472e-2e0a-08dc97676902
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 11:42:38.1656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTkwrNKjKTFqo/nPru3HnM8jO2YTKerO1Ef8tXy7feL/z8y/4doSw45Hm4x2bkZR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4439
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

--------------7XWKLUlZUiKle7lJAZtPkIT9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 27.06.24 um 16:40 schrieb mripard@kernel.org:
> [SNIP]
>>>>>>> Why can't you get this information from userspace?
>>>>> Same reason amd and i915/xe also pass this around internally in the
>>>> kernel, it's just that for those gpus the render and kms node are the
>>>> same
>>>> driver so this is easy.
>>>>
>> The reason I ask is that encryption here looks just like another parameter
>> for the buffer, e.g. like format, stride, tilling etc..
>>
>> So instead of this during buffer import:
>>
>> mtk_gem->secure = (!strncmp(attach->dmabuf->exp_name, "restricted", 10));
>> mtk_gem->dma_addr = sg_dma_address(sg->sgl);
>> mtk_gem->size = attach->dmabuf->size;
>> mtk_gem->sg = sg;
>>
>> You can trivially say during use hey this buffer is encrypted.
>>
>> At least that's my 10 mile high view, maybe I'm missing some extensive key
>> exchange or something like that.
> That doesn't work in all cases, unfortunately.
>
> If you're doing secure video playback, the firmware is typically in
> charge of the frame decryption/decoding, and you'd get dma-buf back that
> aren't accessible by the CPU (or at least, not at the execution level
> Linux runs with).

Yeah, that's perfectly fine. At least the AMD encryption solution works 
exactly like that as well.
> So nobody can map that buffer, and the firmware driver is the one who
> knows that this buffer cannot be accessed by anyone.

On most hw I know you can actually map that buffer, it's just that the 
CPU sees only garbage in it because you don't have the necessary 
decryption keys around.

> Putting this on the userspace to know would be pretty weird, and wouldn't solve the case
> where the kernel would try to map it.

But that's exactly how all other implementations work as far as I know. 
I mean what do you do if the kernel maps the encrypted buffer?

On AMD we also block userspace and kernel CPU accesses, but that is only 
done to make it easier to find bugs not for correctness.

And userspace absolutely needs to be aware that a buffer is encrypted, 
cause otherwise it could potentially try to access it with the CPU.

Regards,
Christian.

>
> Maxime

--------------7XWKLUlZUiKle7lJAZtPkIT9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 27.06.24 um 16:40 schrieb <a class="moz-txt-link-abbreviated" href="mailto:mripard@kernel.org">mripard@kernel.org</a>:<br>
    <blockquote type="cite" cite="mid:20240627-impetuous-aboriginal-cougar-cdcbbf@houat">[SNIP]<span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap=""></pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Why can't you get this information from userspace?
</pre>
                </blockquote>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Same reason amd and i915/xe also pass this around internally in the
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">kernel, it's just that for those gpus the render and kms node are the
same
driver so this is easy.

</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The reason I ask is that encryption here looks just like another parameter
for the buffer, e.g. like format, stride, tilling etc..

So instead of this during buffer import:

mtk_gem-&gt;secure = (!strncmp(attach-&gt;dmabuf-&gt;exp_name, &quot;restricted&quot;, 10));
mtk_gem-&gt;dma_addr = sg_dma_address(sg-&gt;sgl);
mtk_gem-&gt;size = attach-&gt;dmabuf-&gt;size;
mtk_gem-&gt;sg = sg;

You can trivially say during use hey this buffer is encrypted.

At least that's my 10 mile high view, maybe I'm missing some extensive key
exchange or something like that.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That doesn't work in all cases, unfortunately.

If you're doing secure video playback, the firmware is typically in
charge of the frame decryption/decoding, and you'd get dma-buf back that
aren't accessible by the CPU (or at least, not at the execution level
Linux runs with).</pre>
    </blockquote>
    <br>
    Yeah, that's perfectly fine. At least the AMD encryption solution
    works exactly like that as well.<span style="white-space: pre-wrap">


</span>
    <blockquote type="cite" cite="mid:20240627-impetuous-aboriginal-cougar-cdcbbf@houat">
      <pre class="moz-quote-pre" wrap="">
So nobody can map that buffer, and the firmware driver is the one who
knows that this buffer cannot be accessed by anyone.</pre>
    </blockquote>
    <br>
    On most hw I know you can actually map that buffer, it's just that
    the CPU sees only garbage in it because you don't have the necessary
    decryption keys around.<br>
    <br>
    <blockquote type="cite" cite="mid:20240627-impetuous-aboriginal-cougar-cdcbbf@houat">
      <pre class="moz-quote-pre" wrap="">Putting this on the userspace to know would be pretty weird, and wouldn't solve the case
where the kernel would try to map it.</pre>
    </blockquote>
    <br>
    But that's exactly how all other implementations work as far as I
    know. I mean what do you do if the kernel maps the encrypted buffer?<br>
    <br>
    On AMD we also block userspace and kernel CPU accesses, but that is
    only done to make it easier to find bugs not for correctness.<br>
    <br>
    And userspace absolutely needs to be aware that a buffer is
    encrypted, cause otherwise it could potentially try to access it
    with the CPU.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:20240627-impetuous-aboriginal-cougar-cdcbbf@houat">
      <pre class="moz-quote-pre" wrap="">

Maxime
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------7XWKLUlZUiKle7lJAZtPkIT9--
