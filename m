Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0F3A85CE9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 14:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8CE10EB8F;
	Fri, 11 Apr 2025 12:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WGblNMGO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09BB10E25A;
 Fri, 11 Apr 2025 12:23:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0JDn3mm1Aeu50Yx8EdXISADSllk0ZfC81Q5j4jxa+Gdluuyxct68UtQw0sP2nj55O+jQI80CMp05k8W8aYhjHY9BEiqGeeJ2GK72EhoDoO73b6RgoVg36oHdxyUR/JzTQrfUQ4w34i9FmbxQbUeQXG912Ob6Pm5BpcIY3mwFHC6BY2Tm1soAHUWhf9gxX6lkpTwhtr0O8oBQgnHL3lqkbFS+pqYAbmUaLWWYXgDEGj/XnI3mCvYvVyQQLdGqlRx3iTdrzBU/jIi3+3yu/5jWLk8qoFMZ7OG2UaoHZL8LnKVLh5fpPMAJe0Sk/dIG9apYqUHtk0sjhuf6zPl/dKNnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTmmfAG5Sgxkgl6oIH3q6VNeRGQSQ8elveUI5Y/s6Gc=;
 b=HzwfX8kcfHGeqwYn6rzLIagSNavLQYpKQm3VmZxhNYptUOfDzJiqeiKoCfj4idjL81SzgNzs8e+ApaTA+BUJbFBsWoBaHkpyVSG6Hi05KVKGN4Uf2uB7wTTdclGgION2lWEAtiCYPBpMHUGQq85qoFAhjWGZ44brs/XiDF6EStrp8W3zMfuWKToChyK4FP58o4L1fFCwiL+W1UxJ8fUi2TdUAAEeS5F1RureP3pBzCp8O5lA2q7U84zC1H5Q6KREmkJo7N9OQEqsjh/CqgcudUjBwwY02sYLFn18JgbdN5mQ+B2ooL88ZvRC8p9/DA2VSTXpDzHPcy6nta/PJu4K4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTmmfAG5Sgxkgl6oIH3q6VNeRGQSQ8elveUI5Y/s6Gc=;
 b=WGblNMGO2/jV66MzFXHk2OGMWdqpNcDsem2bQByiasIldcFvY1hRVCR5SjrJc0Sdh+406dBmcc3C7EBfsBdrO0fhtnD3bF/UYn/VbJjVMHx2UDmmYc17B3A0q7pEiBxnqnfXFjja82AIZw2l2Y8VLloZjy8VL5rTuFDmLkSwOEE=
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by DS5PPF18A985A10.namprd12.prod.outlook.com (2603:10b6:f:fc00::645)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Fri, 11 Apr
 2025 12:22:58 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 12:22:58 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] drm: function to get process name and pid
Thread-Topic: [PATCH] drm: function to get process name and pid
Thread-Index: AQHbqtSVzyiJv9jn6kySRHsn3pViKrOeX48AgAADlBA=
Date: Fri, 11 Apr 2025 12:22:58 +0000
Message-ID: <BL1PR12MB575316AE9C3957F352DF4B7393B62@BL1PR12MB5753.namprd12.prod.outlook.com>
References: <20250411112622.4075526-1-sunil.khatri@amd.com>
 <15b041aa-f87b-4e8a-8144-cabd07e19001@amd.com>
In-Reply-To: <15b041aa-f87b-4e8a-8144-cabd07e19001@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=6607cdaa-f29d-4cb5-b06c-ee9f78b6c5b5;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-11T12:22:32Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5753:EE_|DS5PPF18A985A10:EE_
x-ms-office365-filtering-correlation-id: 33aa1c23-1673-4539-46ab-08dd78f39851
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Q2NqSDl6SkVneU1zelgyM1JVSTRyeTVNTFE4Vk1hTWRkbFZ1VWYvUWVTZGhy?=
 =?utf-8?B?d2MrdzFkRklYd3U1N2ZxcWg1SlVjUitqenc0L2tSWTJac3dwN1YySGVlV0p3?=
 =?utf-8?B?c1dNR2FKTmJ3Mm5RYmNwSFNaRE5yMVQxN29QVHRBWFhzVXZCT1VaVFFzL25S?=
 =?utf-8?B?b2JlWFVwVGpLK0xZODdwTmFSYVhJY3RhbkdNMEVZWkJERENpNzhzd2ozN01k?=
 =?utf-8?B?OXcyWXBvcnpwUDNFMVZjYnBMQzJzQVVaQm1tQTdRTnVKcnMwOVFqbTNiYlJx?=
 =?utf-8?B?S3kxSFdDYXl3NVBoREowWi8vZy9lUHJHckdzaUxjUHhzV0tlYWFQVDM1SUVX?=
 =?utf-8?B?bkMyQS9lenN3YnUxckNhd2xaRlY1dXlENnUxSWNwaHROSWFnNTZnKzJIb1FB?=
 =?utf-8?B?aUFEbVFGb2s4VHRDc09YcFlQbG5Ka3lENFNrWDJaQnRwRmR3WFN5QktpeHRP?=
 =?utf-8?B?T0RLbTB3RWU0c3B2TkdNRDVnajlRNndEbjIrWWVyTkY5SEJleFRHRGJtZ1BS?=
 =?utf-8?B?ZGt2NCtTV25FRHhyQjk4MSs4RllXcFZIanNiYXdlSkh6K1BKZU9TQXgxc2VD?=
 =?utf-8?B?ck1vaTNvSWg2RHg0T0hRQjZqVHp3ZFNkblBoZnJtWktYNmFzSjFLc1dqRFlw?=
 =?utf-8?B?YlJMMGJpMTlXUXBmSmhHWG81clMxVVJCTWlmMU1ySTFxR2xkN29FRTBZKzBX?=
 =?utf-8?B?dGhnMXljVTFMclAwWDhhS0lISktVMFBMcDZHVDBmS3pGclZPYWVUWElrMlFu?=
 =?utf-8?B?c2w4TVJTSVVxdXhVY1dNSU9YeUNlVkxSbU81eEZTa1VXclZhRXNYMXpqK2tB?=
 =?utf-8?B?SG5Sb3Z3ajkrTi9rQlo3TWxDaG95Zmw2VkpzaWZvUW1kL3hNQW91blduejdy?=
 =?utf-8?B?UXJiSGJ2eGN5Z3FqNmpvdCt6elpzN2tmUFc0TUsxSnRwRDlvT2t0R3VSSkJL?=
 =?utf-8?B?VER5N1NST1VpempDbk5rTHBYalgvbXZULys1Y08xeUlMamhtOXJHNlFxcXo1?=
 =?utf-8?B?dGI4dFNSb3YycUZ6RnFlT1IxVnBOR1h1eXVBT1BDZUozWEt6endoNkNzMGtv?=
 =?utf-8?B?TWlsS0x2M1FybGcvR2RyVXdFUjJqb01WUVZjdE9uNzNldSt1djQ2MXBHWHRG?=
 =?utf-8?B?eEUrRGhUUTNjMGpKNDBmVm9jZTZULzhtUVdKYWRIOWIvRlpDU3cwelRreUdX?=
 =?utf-8?B?N1JLN25QZVZib2czWm5oT1Myc3p0TGllQ3hvL21DN3huMHdUb1Y1M2lqdTJz?=
 =?utf-8?B?ekxYNXJrOGNPTWhFbUpiYWFJK1VFbFNRS1BGTmxrU2JIR0prbUs5SCtLV0Vn?=
 =?utf-8?B?VThSRzBxSzFCbkxxdnVLZUZJKzJtRFk0bVYxSjUzeGtoWDB6cEIwY3FkN2Er?=
 =?utf-8?B?RU12SXFQRHQ3M1NSclNVY1YrWCtQbituU1B5MThsWk5JL0ViU282M1dMWlVQ?=
 =?utf-8?B?OG1vQlp6QnArY3Z1c0lBbGpBd3lzTThDM3l1WXhOTkRldmJqMjBXNFdsMWs1?=
 =?utf-8?B?UkhSeW1QK1diZ0RzVzc5WGlsaVVISGkzUHFkSk8rVEpOdzRRVjF5eXJ0V3Nq?=
 =?utf-8?B?MG1vZTJ2T3FMNHpMMG5lTTdadmt0Tm85N0dXWVBGNi9mUU1qNWpoejJXYUlr?=
 =?utf-8?B?cVJZSU1QN0EwQlZ5eVc2M0cvcWZYREVVVjVVdFN5TUJXeGxLMWR6bHVuQWpJ?=
 =?utf-8?B?dXFJVk81cUVsUmJoeEREbmlxbE9vU0VJZUl2MVd5bXdJaFFDelhjdTFucmdp?=
 =?utf-8?B?UTRZSXlHRzZLNWdhV3JHZitjam53VUtaV2t4bllUdVNJWkZOVDhZckM1QURy?=
 =?utf-8?B?TG5tL01WSW5KVTU4Sm5FVVhIa1FJT2YyR0FtK3JMRG5ySzRSaXlsUnJqZFZD?=
 =?utf-8?B?Q20raXVvWGV0TW80V2VtdlVPc0dsY1djVksrWVh5TGJWa2JGV2xOOVFPL09I?=
 =?utf-8?B?M28wRi82dC9pVUZoeXFJRUZnRkkzWFR2ai8rYVRXVmluQkluTXk2WGNNT2dQ?=
 =?utf-8?Q?7GmLDirCxtlAreklHul9Y4EJbwJxec=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUIxbjlkajU4Q3BlT0NnNFNTeU5Ec2xoVkdhT1U1Z3NsWWhVQ3ppVFVBMDg2?=
 =?utf-8?B?cHpDQUdWOHk0OXBqNUw1UklXZkhyeTdOUlhhVHZiTDNoNU0zK1hvU1NDOTcr?=
 =?utf-8?B?TWNWYXNyU1NxNEFzMjhTblJRNDJNYU0yMGc1Q1hSakVqQ3ZBeUFmNDEyaXdz?=
 =?utf-8?B?ZDg2czZiZzNyN0g0cytZbkJtdnRnTU9KTmcrT0hOblFnWmgvamhkUW1XWjdX?=
 =?utf-8?B?bWxLNFhQTnlraG5aQ3pmdjc1Rng3VENIUkt1YnNsdHlNYUdzb1hld1lDVXRU?=
 =?utf-8?B?S3ZrNnpkRmxMQkUzSEZ2WHMwaTJMZDdrNnlEU25jRVpaSkphaEJoTDVoMWcv?=
 =?utf-8?B?bSthRnA4TXJ0MjBYSmwxSllXSWtKNGhKSlR6bDVFTW9TQk82M0hLdlpMbHk0?=
 =?utf-8?B?T3p2OWNGSmcrMndFSDVsdGc1dzMwVG9VbVJ2bEM3aTBrcy90ZTdJZUNsNmNV?=
 =?utf-8?B?WXlHcDA2NWVSb1FCSGZ3eWZpb0I4eWdycmowSWtvWDNiMXJXYWc0MTRiRldP?=
 =?utf-8?B?bDMxd0xOcktTWTA2NHptSGhicDVmMGZCWXp3Sm80SDdZeHpxTHR6V2xUajVo?=
 =?utf-8?B?alREeDZSSUdGdVhpMUtINlNGdnlITTArWTJ5WWowai84NkozdXhUNU8rd0dZ?=
 =?utf-8?B?cldxR3lvOExjK29JbHdVWm9hblBENm1FK2h3K3dJb1dTWTVGOUYzYXdCemdK?=
 =?utf-8?B?bVNCQzBwc0V6MlJFQWdFZm5rWjZwWFFoVEVEenp6ZUMyOGRCN2NhRGtIdkh6?=
 =?utf-8?B?bC82OHI1bHVpcTFnY2dxTW5JK3FkdUZBZDQxTVVjWU40alhxRlRFbnIyRU9B?=
 =?utf-8?B?Y1h1SW5kNDNOUEpQNFJVdENVK0dpZUQzVjN1TCs5cUZKNWw2QW8vRTVKc0NW?=
 =?utf-8?B?YlpUa2Nyek51eUF0cG1ET1JaZE5KNkhoWnJqemFhYi95bnFSMHZQQyt2UHox?=
 =?utf-8?B?cHk5MVNpczh4SklucWZFeUt0aTV2ejh2Y1E5ZGlZbTBPSmk1eC9IbFdYOTBk?=
 =?utf-8?B?ZkR0alFZTTlvYU1LYlVMR3BLT21RNjZYeWxDaExxQjFzUVYway9SM2gwdUNs?=
 =?utf-8?B?YWlTcklGU1VpemNjM0xOaE54YXlOMDFJZ3pmLzV4YmJZTC9JcHlGM2FoVkhk?=
 =?utf-8?B?Zk5zYzRZazB1VmFPZGppU2YycUVzNitUTmV2c0NidEd2cmYxa0kxclQ4S3U3?=
 =?utf-8?B?REdKZ0lNY1oyTjZuVkZmV0ladVNjMnVpVzM5c255YkZZVVlOdHpnME50VExD?=
 =?utf-8?B?MEgyOG5DNytZaEtZNjNPZ094VnRKWDJtNTVCbngxQmYzUlZtS09wQ2FsclhT?=
 =?utf-8?B?N3VUMzRoYlFHUUlZNVFhWXFFZHdiVnd4QkdDMmh0clQ2U1cwN1ZzQ2JwNS8z?=
 =?utf-8?B?aFE0enF4djJmKzA0bkZrVUxHek9nbmxSZlJGbFJBWk81bnh5ZEFpL0JHZm1p?=
 =?utf-8?B?QUJnVWgxblR6cnpPY2gzQnVhekR3UWdMblIraEthOGIxNVNKeHNYTFFKSE1z?=
 =?utf-8?B?ZkhldUFyRGhkaTRXNlJWalRBMVVJVXhRVXFIdjhuZnBZclU5SCtOOGJGbkIx?=
 =?utf-8?B?Z1ZIVkV0RXJ6WS8vNmI3UHpITEhHVWVONXphd3MyU3lWNzFpVmFmVVZiY0RP?=
 =?utf-8?B?V0lYZlJ6TVQxdVlHcC9CTWkwc0tBdGJKOGFUT0dvYVpQS3BYTE9NWWpuVHZE?=
 =?utf-8?B?Z3lwSzhPUUh3aXNwUG40VWx2eXZ0QTZydDFNMmNyaXU1a21oRGxJdHVmMktV?=
 =?utf-8?B?aUxOb3d4NlR0R3p3SGxCTEc3d1RYVitsZ21ZZE9FV2lIVm1HTGpETHJ2TU80?=
 =?utf-8?B?RkppMXk2aFdUYzJsZkNoejhIbHdEY21ndm15Tnh2b2kxVTVzUmlFd3dXKzdC?=
 =?utf-8?B?TStVRFg0TTd3ajR2bEJ0MW4vdGYxeUlBZGFWbWdRNThnNktJYjJGNUlQT1Bp?=
 =?utf-8?B?QzIzbk84V21HRlBmUndHVmhoRVRJLzVQVmNhR3N6dDFBNWtWaWpUa2xwZkN3?=
 =?utf-8?B?dEtUM2FpZkl2VGpqYktIYUUrVWNZOFBsRGRpRzhObVNBTHpFNm9pTGVUNjA1?=
 =?utf-8?B?a0NuMjVZdlkrOXRzYnZkYkg1K0l5bzlKOEY2ZU5PK1k1MWNPaktBdXJZcmMr?=
 =?utf-8?Q?HLQc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33aa1c23-1673-4539-46ab-08dd78f39851
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 12:22:58.3813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GNK84oVWujvERZ5SZcYL5P2AhI1CFgBY7nY/ZrEQXonom3bci6auhl2xwwN9zwpe0vn5LZnlNSEyaPtMAqEYnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF18A985A10
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KU3VyZSwgSSB3aWxsIHNlbmQgdGhlIHBhdGNoIGZvciB0aGUgdXNlciB0b28uDQoNClJlZ2Fy
ZHMNClN1bmlsIEtoYXRyaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS29l
bmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NClNlbnQ6IEZyaWRheSwg
QXByaWwgMTEsIDIwMjUgNTo0MCBQTQ0KVG86IEtoYXRyaSwgU3VuaWwgPFN1bmlsLktoYXRyaUBh
bWQuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm06IGZ1bmN0aW9uIHRvIGdldCBwcm9j
ZXNzIG5hbWUgYW5kIHBpZA0KDQpBbSAxMS4wNC4yNSB1bSAxMzoyNiBzY2hyaWViIFN1bmlsIEto
YXRyaToNCj4gQWRkIGhlbHBlciBmdW5jdGlvbiB3aGljaCBnZXQgdGhlIHByb2Nlc3MgaW5mb3Jt
YXRpb24gZm9yIHRoZSBkcm1fZmlsZQ0KPiBhbmQgdXBkYXRlcyB0aGUgdXNlciBwcm92aWRlZCBj
aGFyYWN0ZXIgYnVmZmVyIHdpdGggdGhlIGluZm9ybWF0aW9uIG9mDQo+IHByb2Nlc3MgbmFtZSBh
bmQgcGlkIGFzIGEgc3RyaW5nLg0KDQpIaSBTdW5pbCwNCg0KeW91IG5lZWQgdG8gc2VuZCB0aGlz
IG91dCB0b2dldGhlciB3aXRoIHRoZSBwYXRjaCB3aGljaCBtYWtlcyB1c2Ugb2YgdGhlIG5ldyBm
dW5jdGlvbi4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBT
dW5pbCBLaGF0cmkgPHN1bmlsLmtoYXRyaUBhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZmlsZS5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICBp
bmNsdWRlL2RybS9kcm1fZmlsZS5oICAgICB8ICAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzEg
aW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9maWxl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYw0KPiBpbmRleCBjYjVmMjJmNWJiYjYuLjQ0
MzQyNThkMjFiNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMNCj4gQEAgLTk2NSw2ICs5NjUsMzYgQEAg
dm9pZCBkcm1fc2hvd19mZGluZm8oc3RydWN0IHNlcV9maWxlICptLCBzdHJ1Y3QNCj4gZmlsZSAq
ZikgIH0gIEVYUE9SVF9TWU1CT0woZHJtX3Nob3dfZmRpbmZvKTsNCj4NCj4gKy8qKg0KPiArICog
ZHJtX3Byb2Nlc3NfaW5mbyAtIEZpbGwgaW5mbyBzdHJpbmcgd2l0aCBwcm9jZXNzIG5hbWUgYW5k
IHBpZA0KPiArICogQGZpbGVfcHJpdjogY29udGV4dCBvZiBpbnRlcmVzdCBmb3IgcHJvY2VzcyBu
YW1lIGFuZCBwaWQNCj4gKyAqIEBwcm9jX2luZm86IHVzZXIgY2hhciBwdHIgdG8gd3JpdGUgdGhl
IHN0cmluZyB0bw0KPiArICogQGJ1ZmZfc2l6ZTogc2l6ZSBvZiB0aGUgYnVmZmVyIHBhc3NlZCBm
b3IgdGhlIHN0cmluZw0KPiArICoNCj4gKyAqIFRoaXMgdXBkYXRlIHRoZSB1c2VyIHByb3ZpZGVk
IGJ1ZmZlciB3aXRoIHByb2Nlc3MNCj4gKyAqIG5hbWUgYW5kIHBpZCBpbmZvcm1hdGlvbiBmb3Ig
QGZpbGVfcHJpdiAgKi8gdm9pZA0KPiArZHJtX3Byb2Nlc3NfaW5mbyhzdHJ1Y3QgZHJtX2ZpbGUg
KmZpbGVfcHJpdiwgY2hhciAqcHJvY19pbmZvLCBzaXplX3QNCj4gK2J1ZmZfc2l6ZSkgew0KPiAr
ICAgICBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2s7DQo+ICsgICAgIHN0cnVjdCBwaWQgKnBpZDsN
Cj4gKyAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGZpbGVfcHJpdi0+bWlub3ItPmRldjsN
Cj4gKw0KPiArICAgICBpZiAoIXByb2NfaW5mbykgew0KPiArICAgICAgICAgICAgIGRybV9lcnIo
ZGV2LCAiSW52YWxpZCB1c2VyIGJ1ZmZlclxuIik7DQo+ICsgICAgICAgICAgICAgcmV0dXJuOw0K
PiArICAgICB9DQo+ICsNCj4gKyAgICAgcmN1X3JlYWRfbG9jaygpOw0KPiArICAgICBwaWQgPSBy
Y3VfZGVyZWZlcmVuY2UoZmlsZV9wcml2LT5waWQpOw0KPiArICAgICB0YXNrID0gcGlkX3Rhc2so
cGlkLCBQSURUWVBFX1RHSUQpOw0KPiArICAgICBpZiAodGFzaykNCj4gKyAgICAgICAgICAgICBz
bnByaW50Zihwcm9jX2luZm8sIGJ1ZmZfc2l6ZSwgImNvbW06JXMgcGlkOiVkIiwgdGFzay0+Y29t
bSwNCj4gK3Rhc2stPnBpZCk7DQo+ICsNCj4gKyAgICAgcmN1X3JlYWRfdW5sb2NrKCk7DQo+ICt9
DQo+ICtFWFBPUlRfU1lNQk9MKGRybV9wcm9jZXNzX2luZm8pOw0KPiArDQo+ICAvKioNCj4gICAq
IG1vY2tfZHJtX2dldGZpbGUgLSBDcmVhdGUgYSBuZXcgc3RydWN0IGZpbGUgZm9yIHRoZSBkcm0g
ZGV2aWNlDQo+ICAgKiBAbWlub3I6IGRybSBtaW5vciB0byB3cmFwIChlLmcuICNkcm1fZGV2aWNl
LnByaW1hcnkpIGRpZmYgLS1naXQNCj4gYS9pbmNsdWRlL2RybS9kcm1fZmlsZS5oIGIvaW5jbHVk
ZS9kcm0vZHJtX2ZpbGUuaCBpbmRleA0KPiBmMGVmMzJlOWZhNWUuLmMwMWIzNDkzNjk2OCAxMDA2
NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaA0KPiArKysgYi9pbmNsdWRlL2RybS9k
cm1fZmlsZS5oDQo+IEBAIC01MDEsNiArNTAxLDcgQEAgdm9pZCBkcm1fcHJpbnRfbWVtb3J5X3N0
YXRzKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwNCj4NCj4gIHZvaWQgZHJtX3Nob3dfbWVtb3J5X3N0
YXRzKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgc3RydWN0IGRybV9maWxlDQo+ICpmaWxlKTsgIHZv
aWQgZHJtX3Nob3dfZmRpbmZvKHN0cnVjdCBzZXFfZmlsZSAqbSwgc3RydWN0IGZpbGUgKmYpOw0K
PiArdm9pZCBkcm1fcHJvY2Vzc19pbmZvKHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LCBjaGFy
ICpwcm9jX2luZm8sDQo+ICtzaXplX3QgYnVmZl9zaXplKTsNCj4NCj4gIHN0cnVjdCBmaWxlICpt
b2NrX2RybV9nZXRmaWxlKHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yLCB1bnNpZ25lZCBpbnQNCj4g
ZmxhZ3MpOw0KPg0KDQo=
