Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FF7D3AF58
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 16:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D3810E354;
	Mon, 19 Jan 2026 15:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="w+FAGwqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO2P265CU024.outbound.protection.outlook.com
 (mail-uksouthazon11021105.outbound.protection.outlook.com [52.101.95.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6308810E354;
 Mon, 19 Jan 2026 15:41:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMuawLEWuI/akKPfyNUjAz4QxjhQ044C19CinENAziytWSmjpAEAHzBVZH6uRtmmkIKj9ULfAwmM8PobFyJ6EFn7G9h9nrwBrX3SZL6o34ysebzBcTg+ZXnv03cTcl9AmVAqO2XkYTNV4cNpWnAS6OgtEmFwVi26MCa30XkcF31G5vqiFgMWkRoEpJRYUP4hS8syzXNFauYfgr+hbZ9H1FO/2G/389mrNOLTqKWUMDYtE0yUDsIudorhQPBxxi0dRviHrmkHthkIdJtg66wADHHuRjks2E8yfNHGH6UPuj7ZMjVq1w14lJK1qgg97gIKllBpEWY5amw5MJFShdYExw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLGV8qmFAo6AYA6X4QRv2ovLbz8D9M41AMiYl/8qAvs=;
 b=dvMkA52J984b5veR/8wzhJSu6TK8YWidGSkULwF/eWirNVe3PHx1DLHfcb7Vi+H6Wa93n6Utd11uXhZNXkMI9G2O3rj0vO96sH3C44QDahrefmVMmFumPJpMzmGWARvJE3qGoD/xfONz48WsyLAYAXZOC2NecGbyaIpCthK5dRzIEVT+NwABVKgPAb/wJVwqrkpkGGMtwYCoHJJ6yyrOJqUch17vOImRnp+ZYBi7BpTqEi+LX3DdH6rz6J3O4rhRHU0Xy93G8jS3EHJNLfOXCSjVYMFI/meaGPoHSB/xvf+IPXM+Ckaj7uDTgajPcCK0Re84K6P+vQA1bowBAuqrSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLGV8qmFAo6AYA6X4QRv2ovLbz8D9M41AMiYl/8qAvs=;
 b=w+FAGwqIOThMWk8fH3FoYK/W5JO9QuCoTzXKq27OBJ7epy90vrDz1DazH/Cl8PAzAUkcKQ9RUZrTpXaabq1PMczvDo6JtDfLJdyVLspycJ4uMpDnn/XMVauSvMmXQt2P3y4NDOu/l/FgCLb1vwBNWBBlRReUqCfwtRi31Tg82vI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5298.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:191::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 15:41:32 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 15:41:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 15:41:32 +0000
Message-Id: <DFSOHLZPC87U.3IIGQOCYH0E@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Lyude Paul" <lyude@redhat.com>
Subject: Re: [PATCH v2 02/10] gpu: nova-core: gsp: remove unnecessary
 Display impls
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
 <20251216-nova-misc-v2-2-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-2-dc7b42586c04@nvidia.com>
X-ClientProxiedBy: LO6P123CA0048.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5298:EE_
X-MS-Office365-Filtering-Correlation-Id: db74ce0f-4c05-4e42-6dac-08de5771389b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHAxM1dMNGlQSnNNS1ZMSzhab3BZZGtVTUhoWnVqY0U0WUtvbjR4OWdPYjJs?=
 =?utf-8?B?bFB3WjZESUhEUFEvOE1ZQTZ0RmN6dWk1MTRxaVo3UmMwVHJSaTNwSUNDMFFl?=
 =?utf-8?B?dHJCT0dObk83WFlNQ1BVRDJyQzFuamdlNHY4RThlTFRIaEZRLzdOZjJiRDhL?=
 =?utf-8?B?WW9JUTF6QlQyNXg5ZFZSbXFXb0E4MG9xdEl0b20zdGxqOXQ1UTVPVHBhK2t3?=
 =?utf-8?B?NitlOElpeWJYTmM0Q1JmeFdvUFZGYXlib1RGTGpEMjhYdFVJc3crTGRxcUQ4?=
 =?utf-8?B?MGxJMmo2TzVwcllwN0I1Z3IzeTdreVFDdkhkNlIydURYN0p2elg4RG1ZcVpj?=
 =?utf-8?B?czk5cTF5WnVCdUgzQmV2TWwwOSt1YldNbkY1cUxmcHNUSStRV241ODdsdGZj?=
 =?utf-8?B?ejl4ZnFYTFpsVWNhdzArTWFQOTJJOWk5Wm9MSUQ4Wk8yZFdVWFdVOUtLUHM3?=
 =?utf-8?B?Njd2QXlBZ1V2QWRKVmJxWk9FVzZBandwTnNackoxaEZQYjNETnBFU3UzT3dF?=
 =?utf-8?B?R1pzTDg1bUZEVWtuMjJrVUZoQmt2dStkNjVtaEF2bUl4cGJ0alQ3VnpSS21x?=
 =?utf-8?B?NmNpM2l2bHNTWGdEejhyL2FnRmJ2ZmtDanUvNXZxbEdHWjg1ZXN5WURLZE5C?=
 =?utf-8?B?aWhHRE5vQzJidmVnSDd0UXRvekg0UHlEeVpMeGFmSm9LdUFkbFNubFBOTmVh?=
 =?utf-8?B?Um9EYlhvTEdseGt6VzFOYkVvc2ZWRHpDOWN1YmFVSENrK0xLWUlneXFRVVp5?=
 =?utf-8?B?Mk5RVmNTWGxldmhBU2VRYkJXaTdTdGQ5aU5VakRTeG5oZ1FUaGFBUVBKZk4y?=
 =?utf-8?B?ZHByNnRuNENkMDBrNDZBL01jMW1RV0ZGc3Nwai9XbTV4aG91eFkyZG0vTE96?=
 =?utf-8?B?RGw1YXJsS2NhZHV3RmVmR2I3M2RobEhQY0ZBek1WcnJOOGFIWitiaEVsNkYw?=
 =?utf-8?B?dGRSRk43Mi9kS3B0c3BTY1dKU0ZuZUN3eGk2aWlrSWMyalMrS0JIWUZBUGVE?=
 =?utf-8?B?dFpOM2JHTGp6Zld1SitXVTJZTGs3UDM5UzBJYlVkSUZ2L1dUbGs0blpRQWVI?=
 =?utf-8?B?M3RqMjBiYVJ4YURubDdVM2hWakFBemVOUWtRZFg1a0tkOW93Qi9NckZmM0hm?=
 =?utf-8?B?cHIvZkFleU10S0U4cTlWdEpNeklOQTk4c1hFSlRwU2pGeG02L2dWVXBSc1VK?=
 =?utf-8?B?VTRyS0hwSW9GZlRtTTBhdFlEUWRJdCtldmxyTlJIRENXNTFDNThVOFlPL3lH?=
 =?utf-8?B?VVl0djFTdVlzdDJtT1hEZVgzQ3c0WFJwc1owSm1XVjYrakhGbUNjR2RGUnU5?=
 =?utf-8?B?WHI1ZSsySUJ3dkpvcjlpYzZPUWswQTRadDVGS1kzeDU1aTcvYVlMS2QyNFl6?=
 =?utf-8?B?cjJVeFFNWUc5R3hhUDhpNENLU0RxM0F4dFBGb0dTWTRTZ2Z1SFF4QUE1MTJT?=
 =?utf-8?B?U2xyTDJ1MHlSVmJVa3FISGRxUVV4NytOMS9hS3ZlV0hjcWNVUUp1QW0yVGdl?=
 =?utf-8?B?NGpwZDRFbDI1TU5XUm52LzNZR08xWElhWnd3N1pwaWpmTU5TTjhDaDJkYlds?=
 =?utf-8?B?Q2RrSHUyL3ZXczN6YTVTVVhTYzlKQUEyUGlmOXczdVl5eVg4WU1GeXhoNEtx?=
 =?utf-8?B?RXFXQ0RSbXJaOVJCM2FJcFlwS000RXI3ZDJJc0lTNElJSWFCOGxxNXdnL1JC?=
 =?utf-8?B?TkVkZ2J3RlF2dTR0bEE1dDNlMER2eVFocFJqN1dvSUw2VGxiV2lmOFV2N1Ni?=
 =?utf-8?B?RkRvWW1rK3l1Sy9CdTk1UDdrUGtoVG5hdFV1WUpMUG5Hb1VmeUxMZVNndDly?=
 =?utf-8?B?Qk9PNHVpYUh1K0ovSHhBdXc3WHFpYWJxb05KcFR1dlptN3ZOR0dvOGkrK3Bo?=
 =?utf-8?B?UnZMdVowUHR3NjhsV01UeHA0dTZkd1U0bmk4bFpEV2NPc1Fhek9qR0tUYk1H?=
 =?utf-8?B?MjgwZnNPTTF5a2NaNWhHYms3TkVHWmtRc085TW1SVVZzQld4T3BXSkY1UnVy?=
 =?utf-8?B?YXlzYlJibko4VHkyZ3pNcmErVHA2RmQ3TEhnYjA5NWZ6NW1haW9xdFFGd2Y4?=
 =?utf-8?B?YTBXZ3d5dmVsb1hVMVBiQm9xRElKS3JPYzJZK1NGdkpsSzcxcnU5WTR0WHdt?=
 =?utf-8?Q?beDQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3RDd1pLUjZtV05LaUF0NVl1UHltYkxDQVFSamwrN3JETFF6dnFnNThndS85?=
 =?utf-8?B?VzduMXZmWGs4Uzd0WTRXVEs2UGRtSEQ4amEvWU1yOS9pcks4K0NCTXFjNGpB?=
 =?utf-8?B?aFVyaFpnTXlocTl1eHlZYWJmeFh0UXNDQ09pVFd0S0JPTzBzL3FKcTdOb2gz?=
 =?utf-8?B?bk11OCtBWlJOWWkrNEo4MktpUGJnd2RjR0M4TzRyVE41MVBuNFZXSFA0d2hr?=
 =?utf-8?B?VTYvTnJnUGNRMCtrUll2c0psUWlSQUZHMTdDbkwzNDdrSHNST3pWRmNSelN6?=
 =?utf-8?B?eUJldlhzcEQwWkV3RkJVTVprV2lJQ3FLZVZuVVBTMjdLVGFKcjJYL1NyWU1Z?=
 =?utf-8?B?VUU2cnY5TXFiT2U5YzJTcWpIZ2ozeTdCeWhpTjVYUngvNmVPb092ZmdLeGZ6?=
 =?utf-8?B?ZklBS0hyOTdWeUs1WTRjZk5ZbkJOcTFOR0xmRkd6QkZJR25KdE9TTndFYStK?=
 =?utf-8?B?c1UvblcwZkRIRjE2bUFqR1RiOWRkVE9vN3F6U3dQUHNvYVhqTC84bUtBQm16?=
 =?utf-8?B?TExzaUZ0cFJMd2Z4dFRudnp2QTRHa0wrMy9kMFBCRUZ6eXNQOHhvYmkxVGtk?=
 =?utf-8?B?UFMwb3hPS1UrVnBVSlc3VGlkSHhsbmo4Q3lwUDY3b0p5WWluOTVQSWYwTC9x?=
 =?utf-8?B?OXp2bkpYK1NEdE0rNTRCbnRjdVd2d3JXSjlDMW1zUXVreWJGeU5welFPV1E2?=
 =?utf-8?B?UG9TU29JaEt2a0ErSGZ0ZEh4eklCQkxXQzk5OVhvdllMR29BWC9oMUs3ZGpZ?=
 =?utf-8?B?VFRGQlhjVS90MkhDTFhQQlhrZU1oQ0JzYUlTRkJHK1dScEh5UzF1WkZ4TzBT?=
 =?utf-8?B?Mk5GZytrUHlRK0lNN1pRRG00SU5VSWRLN25OUlAvb05sNkxPN3lsN01tZ2Nn?=
 =?utf-8?B?SExvNlQ1cUxUZko0Ty9OK296NjM4YkNSbnc0Rzc4QlpUdGpBanJ5bXRUaWZY?=
 =?utf-8?B?WTJpM1RDUVFCZFE2djlKdlRGd3FNR0pwWThac1dTT3FEazFBRVpaaGdoT2R3?=
 =?utf-8?B?NmE0SU0vdkpaOENSYnI0MjJUV1FJU0JySTdzWUpMb2I4WWJsZ1c2QkJndzNs?=
 =?utf-8?B?MlJhS0lMaFZlR1VDUDRQT0Y3bjltZXBRdGM4M3lVT3h1R3dtWFRNQ2VHVWRN?=
 =?utf-8?B?RGgzYUQxYUcwTzdJRUtsM282TmwwVEFzTENYdGZhaEZabDZ5clhGZzlaMzFY?=
 =?utf-8?B?bGsvR2dpeUR2OEp0b1lrSEczKzFGa2JtU0NXY0JLT01RYzNNaTUrRnlWSU9D?=
 =?utf-8?B?ZzBwQktXLzNITkgxd094VTBLZHBqOE5UeFErQ0tiVjhTWVFkUTFZTHI2MWQx?=
 =?utf-8?B?d0hPOFVybkgrZU5LbHVtZmprOHNkT1lOZFk4dFNlWDEzakNGTnJmcWZFdEtR?=
 =?utf-8?B?bUJlZEdpWCtFQU02Q0Q2YzhvWXFRODg2OUxzazdzWVBRaWk4cVVjVTVhZnNl?=
 =?utf-8?B?RHZ4UUVHc011NW02Q3lFNldsM1gxUXBxaVhzTUpQRE5VVmtwcklaaFBneFNp?=
 =?utf-8?B?WVhNb1I0NjR4MXhNd0JWQmJzd04yQ3VFMWhrd3lTTlJhbXAxRHd1ckdZUElJ?=
 =?utf-8?B?cGFMckJPb1dZZlZxZUZPa2JTWDhrWTcySHRhT0pGUml5b0FOMlFBWkkrTVQ0?=
 =?utf-8?B?VUd3RFN6UG51SFpyR2tJRXg3RGZ0eFNHc0ZMN0J6RmI1d3VHbmhTeFYvMXpV?=
 =?utf-8?B?WTZqeWZON3p2bEdVTkpXZVM2NDYzZHB3RzJ5K1pXdjQrTFVzZ1p0a1d6b0Yx?=
 =?utf-8?B?L2Z5d0kzZ2pNRm9VdnFPUmh2VTNJMFhDSk5vU0RxZlBpMHpCUVpwZjFXekRj?=
 =?utf-8?B?WmZPMkJRYTVEcW1wa2w2SGU4c2pQcU5FSGlDWHJzRFBuempQc2lQTWRRTTJw?=
 =?utf-8?B?cnVMUEZpUXl1SU52TFFReFgrOGFDNnc5ZTJpZGErSU5MMmRhY0RFRUhqNTdX?=
 =?utf-8?B?MmFIdHRadVUxQytrWWtOVXJFMkxRT0JVemVlbUVwN2pyczVMR25yaHRwelhh?=
 =?utf-8?B?Mi9ZUmE5NFVnVVFFbE5yc0ZvT2ptd21hZTZvd1RkUjF4L1lKK0Y3eWJWL1I2?=
 =?utf-8?B?azlFTTNsVExxWTF0SnFpY1c0LzZTUzhENGpldGVHZ3BLN0hqUUFkTU9HYXlx?=
 =?utf-8?B?a21HMVZlRC9NU0E0TkIxN2JLQnZ4VlZ6TmpKWXhxalFSMzU5RmQvR2lJWmFa?=
 =?utf-8?B?V3UxaVllMEttdW5wUlplTG5xN1BqU1E0aUVCOEJIeU9uWU9Ca0p0T0R0YTQ2?=
 =?utf-8?B?M3Y5QW1FQ3c5ZHVyeGRZa3Vib3Ivb1NWcnFpbm1OdEtYQWFna2lRNjlpUWRK?=
 =?utf-8?B?eTV3ZTFVMEpQbjBHRnRnQmZkMDcwSUdOK2ttSkdBRGdPc3E0aDZXZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: db74ce0f-4c05-4e42-6dac-08de5771389b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 15:41:32.6325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcnlTZ40dJkcKlcbsFUjxvhyl0kmpj5DUfaRiRTan43DYeN2z3ZUDqhpQQkHXUZ1Hh0MZ44qTueaCaL2HS3EMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5298
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

On Tue Dec 16, 2025 at 4:27 AM GMT, Alexandre Courbot wrote:
> We only ever display these in debug context, for which the automatically
> derived `Debug` impls work just fine - so use them and remove these
> boilerplate-looking implementations.
>=20
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs |  2 +-
>  drivers/gpu/nova-core/gsp/fw.rs   | 54 ---------------------------------=
------
>  2 files changed, 1 insertion(+), 55 deletions(-)

