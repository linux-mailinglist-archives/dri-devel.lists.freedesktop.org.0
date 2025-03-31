Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D8BA76BF2
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 18:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77B310E461;
	Mon, 31 Mar 2025 16:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="Qmv01uB/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazolkn19011029.outbound.protection.outlook.com [52.103.43.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C0910E45E;
 Mon, 31 Mar 2025 16:31:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRzxh26L0MeAYz2MaKuw5RCwvZXBAX7mmp4HUfpjrJZyPBZJoY6SBisZg37zXs8DCCQeD9snIyso6GlFX74nxzGfrf3J0rEZvFqKmGVx2l6yECAG1a4DZwVB5aTqX5Lg03r7IYqXoi8Tnr4vJqLp/pysG4g2cBdJuCiyNDeKEIGiUiM4ED5ZJQwhfIApQOk4KtAAgecipCFYHizc9jPEm4/RQd9GC9KITVagIOP72Ltkvi0LAQ56I2gAArHkEkWNWT2JIzOf74OFLlz1q/PHOOu2ec/TQsdQKO2guZY8SmvQXZrnjLbLZZiqb7m9TqytAakIIFCev0OUZAq00OE9IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJT9gsTpxaenru47Oxz1PixrI2Z7Z9kSEWz+cz5CXTM=;
 b=iOCP+uPqhAjAFKyhwizSselGMRUesiMafB6f0Sc0gTPBopIS6V+6QK1SqB7PxQDqOle9UQfL6v0v4x9sv3ETLm7BUr3OVR/6FiH2l6NsELlMkzTt9ozQTVE3GP8HiZPpScPDRUb276drsYquQyoblx2nVJlpTFRA4v2wzX9UThkFTuSEQvKYjlrv4TE40JmlaG0etV2z2oIisyA2qW8vl76uFSzWkkWO2Yr4GNz5v0FBtXRtM9eaC/x68cW7KzFmTtZQhRajDWLo2wO4qOu487N5KMjgl6jXDsGba58oH+WPxk7FZIITQdjNE2ATf1QOY4ddBmqyHF2IT6EynSBeUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJT9gsTpxaenru47Oxz1PixrI2Z7Z9kSEWz+cz5CXTM=;
 b=Qmv01uB/pvvLlhmDPpGOCg2zEKm9cZfUt62G+07c7vN4vhn2WOPweY5ZkPsoi7qRHK4gmJ2ELq4OvKZwoep/V0sjUjdxzT9ohyHSX/mnRa1c9qSxmehqUp1znsbgxuPGxVYFCgTMxSNVA6+u9XWSAC0PvLFnjOzTpj0PVI1u6bUTt2ZocavdWwLdRFQOda9rropmpWvsjKSWgw2YIHweEaJHBiMaAJsplenT4mWQRRI5sJJngQ+YQwcZjzZ4Xn4DXMO2ce8kxoRUUVB4+YCDB9KPL8f4KvqzV4BW/ArZIrWpXc2PmUNj6v7d5V82tiCRb7ReDefYE6nsfvPD396scA==
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com (2603:1096:400:156::5)
 by TYWPR01MB8676.jpnprd01.prod.outlook.com (2603:1096:400:179::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.37; Mon, 31 Mar
 2025 16:31:13 +0000
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f]) by TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f%3]) with mapi id 15.20.8583.028; Mon, 31 Mar 2025
 16:31:13 +0000
Message-ID: <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Date: Tue, 1 Apr 2025 00:31:06 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
From: Shengyu Qu <wiagn233@outlook.com>
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RsxFFnWSRZjWfrU0kv78WLNL"
X-ClientProxiedBy: TYCPR01CA0204.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::11) To TYCPR01MB8437.jpnprd01.prod.outlook.com
 (2603:1096:400:156::5)
X-Microsoft-Original-Message-ID: <8e38d8fe-c9ce-444e-988c-041514052c02@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8437:EE_|TYWPR01MB8676:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ecea67a-12d5-45c6-b056-08dd707173d0
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|7092599003|15080799006|6092099012|461199028|12121999004|5072599009|19110799003|8060799006|13095399003|440099028|3412199025|41001999003|26115399003|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFhNZEJoT0hYKytpZGV2YWFXYmFoU1JiMU5WRkpJdzMwRXF2bmlldURIUmJi?=
 =?utf-8?B?NjhSOVdRNzAwbWlKNDNDaDkrUUQzbGprK250SUdPNG0rSTZnMVVhaTFjZ3pW?=
 =?utf-8?B?bXpXTkZEV0lvbitneEdOd0dsN2oxQWN0blZnRlF3Y04zc2dObzZ2eVFrRnNC?=
 =?utf-8?B?bXM2MWxvVmpSbEp6cjZJL3RzbmRVY1Q1aHlmRFgzektxd3JralNRWU9FUGVl?=
 =?utf-8?B?alJwK3RKb29paHZ2S2pFbHNjNEEwdlJXZE4xeXlnejBURmEvNExGaTl0UkF1?=
 =?utf-8?B?WGhkVWxRb3RydDFTOWhyZ2I1MENKSlBBdXlnL2dhNnRPUWdoMnVuOGphUDRR?=
 =?utf-8?B?RmNUUmFrQ2g3Z3FBcFZlbjNhZDdydHpGUmU5eWFDNnMvdXhWSUU0WktkRUYz?=
 =?utf-8?B?aEpkcXhlRmkzSDIrWDQ5bjdTR0lsL002aDdYWHBjTjBxajRJdElCd3J5NU02?=
 =?utf-8?B?SDF5Z0hDNEZPQ0lUSEZ3cU5pTGVlNmpUeGoxQ09TY1dkTFdhcEVLQW9SSmE4?=
 =?utf-8?B?eFFCbjZoeGJZVDlBQnhFOGhmSmpQV3ZIcDNrUXUydEZwcGx2eFlYaTlJQnBC?=
 =?utf-8?B?L0MwQno2Z1k1ekhiRWRFSGpzamNRMjNVcHlGWFluNllPRU9xU2Fia0s1UDRK?=
 =?utf-8?B?RjBnaEZ2dnRKNkY3cnQ5amE0VXZ0ZnNyODk0alhiSncyZHl2ZkRnZHB4VFht?=
 =?utf-8?B?bkNIZlRJeXNOUCs4V3lnem5xcWdhVFI4eGJwN1FQeitIbWs4alhweTdlQzN3?=
 =?utf-8?B?cFRJeFNIZ2xpMUJPK0JaZDdkSE9ob0V6QkJVYmV4ckc3ZHFvd25iREtPNWhh?=
 =?utf-8?B?dG1tcmRRdjBtL1R0RHBhZVZOQTUwV0FicDlOZFdVTndZendjSzR5blRDYnJw?=
 =?utf-8?B?RFJYMHZQTjNzT0lhVkRSRDVrM3BYa1Y0eVBWWnVvTzd2SUM0R3pVb3ZYMmtU?=
 =?utf-8?B?T3huckNNaFpESnVjTW0zNHM1dHJoRm9JWEwxT1pzN1N5d0hRZzZRcnQvVDdh?=
 =?utf-8?B?N1dXOFNJRlhjQ1A4MnlqSEZTbVNjbE9XVHowa0NPVzd2anlOMEtmZnlCU3Rr?=
 =?utf-8?B?QkpMOGhNMExvR0I1elNyeGxiS285SWdUSFFPM2JBcTgzYXQ4WVc0S2FmVHhv?=
 =?utf-8?B?VGFlN0RkV0xUR1M0eGFJVk9PbzlzeVU3YWFGTnZXK0c0TllYTEZMYUdBU1FS?=
 =?utf-8?B?cnpvUGsySkJiazdxT2pZV2sxYjVxcFI5Q2ZoeHJEaytSU3RWWVRGdXNrdCt6?=
 =?utf-8?B?cGdpb0J4YlBTZGN3R2FCK1NkdGNsQmFRSVhoeTJDTnZkK05neS93OUpLdDFm?=
 =?utf-8?B?M2l0dXhRU3Q3ZkxNQWRiVlhYU3JRVnRvTGNJOEIvSGRYUU50WUxwQWJKTHdp?=
 =?utf-8?B?RHVFdnVCS0xheUVzcWN5c0U5dTIvenAwdTdHSEJkVXNzdDNCaTRXV0NJdnB2?=
 =?utf-8?B?VWt6eExPRFB6UWprNE51LzM4WWc5U2RRVVR3ckhSQm9rV1JlTjc2akZYZjVa?=
 =?utf-8?B?blpEd01pRVZmYys5bHozL0xBUjd4UzZYSzlKVDUrUXlOd3VZa1lxNkhMUmJQ?=
 =?utf-8?B?dnpsUkdVRDVTMmRPU2VUb0tFcTRVd2tkTWVOWndMbXkzbmNsUzh2NmUvOHdl?=
 =?utf-8?B?MnFTTG1CYTAyTEtTV1V6K3VEbHk5UkZCeVdjcElBZE5FSExWMTlYQzFzQ0tj?=
 =?utf-8?B?Z3lGNGs2Y2RuM3c1ZldWL2N1VlgvU2t6V2tSVDZSR2RsU2JqTnp3cVZOakFN?=
 =?utf-8?Q?oOeAGUY0zeUGTKgSnQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGxVdHYxZFRiSnlwaTJXa3YxS04wR00vRTcvcHpyeUdpWE9WRURBY2hReW9K?=
 =?utf-8?B?cTRQeDRYSnd1T05qWHJJcllZOTVOL1k1akJUdWFmbU1ObVF4VkgrV2p6MVVi?=
 =?utf-8?B?Z3JtVDIvQ1dPRlpnb2FscjZMbkMrNFlTNDRMSzZ3eVQ3d1BjSXh0TGhhaGdq?=
 =?utf-8?B?bFBwb3ZkM1VnamZ6a090VGxJcmZ4dDkrcC90RjYvQkRKeTc0S1pWMjFQbG9o?=
 =?utf-8?B?ZjlEQyszblhYVC9rOVlYL3lCbzZsblltby9mTS8rVkF5bUl3cUVrUmkxV3RE?=
 =?utf-8?B?Q3J0RFlhR3ZhYW9Qc1lVMHZFcEcwck9xaUVCV1p1M2xmVVFranNZV012eExL?=
 =?utf-8?B?bG52cmx5VE9KOVExVVpxU3I4V2lOQU9NdlQwclFCUitEdkN1Snk0VFdKanY1?=
 =?utf-8?B?Rys1Ui9IYm9sckdOQlI3WlByb0Zqc1Q3UzFOWjM1NmZWVFRZT0xlNktEQW42?=
 =?utf-8?B?RUhBbTlhYzhNd2w1dkk5d25aWXpiOWlkRFFCOVMyamJmQmJYdHYzKy9reFRD?=
 =?utf-8?B?T1d1a0o4ZGQ1ZEkyVWJYQmtNSU1Pa0hqbmNRNTRUV2hISUZ1OHVzSyswRXN5?=
 =?utf-8?B?MVBlNFlDUmF1VUcvWHhncFp3WkZGZzVnS1NPNkFEc2JadjljMnNzS0N5eXdY?=
 =?utf-8?B?RnZlNmNFUkNlR0NtVXFXZ1JTQ1pOUmViRGtCUnlxYnUvUmljbHUvMXpyTnlK?=
 =?utf-8?B?V05CQ050dEVBa0tyOW1hbEkwVVJNdlMrK0VsaWFyRk1ZM2JoenVYbm5PbGVD?=
 =?utf-8?B?c2w5K1ZHZFJhdmZsOFl6ZFc2WnFOVFdKV3k4WHlrbnAzVmZhWGdIZVJiQy9u?=
 =?utf-8?B?UDRIQm04c0NveW1DTm1MNENxWFpIZVI3dDBuMERPV3grZTQzQ2RIVW5FeXlv?=
 =?utf-8?B?NzUxN1JKWXJ3QXZ5RzM0dmRuaUtuWllvN0txTlUrTGVRRFp3WTQxbEpNcml2?=
 =?utf-8?B?bHlFVzFKa1lBMG5WVHRFVk95RVpWd25zclJONGRuVHY0ckMwSll0ekM1K0NO?=
 =?utf-8?B?QUtleDhmMzFMMWVjYU5FbTBaYTduNmc3UlFkVVk4cjRldTljZWh0UHZ2ZkRj?=
 =?utf-8?B?NitFZXlwZWZyVHhzaUNlZTlHK0NWSHBtR0NraFBtRUZrZTUvSWlHQ085VGpC?=
 =?utf-8?B?SUo2eXBuL1B0d1ZyOG9XZmhwLytrWDZ6elFBc1ppNUgveUZmbzhVdnZrTHhL?=
 =?utf-8?B?dmEwdis5K3M2UFZHRElpcXZFUjJjOEE4bGIvbWpJa1pnQUNnKzdzUzZ3ck8r?=
 =?utf-8?B?TUVCSXJSNE5FQTRwanBvTTEvMWdycWR0VjM3ei9jQkpka1BDZ0U3QmVOYmQ2?=
 =?utf-8?B?NWNMMkZydElhVWZCUmlYU0xMWUdYQzM3dDBpdHZRYmk5SmdrbWx3cG12YlFG?=
 =?utf-8?B?YWdKUkpVa2lXTWxhaHRhU1hNbTJ5T0dHUHp6VlFFMFJ2Nmd6U2dFK1dRL2ts?=
 =?utf-8?B?TVhXem1DOWlZbUlZTDVhUDRUcTFncEJITmhDQ0JSN0pFME9YbUh3bHFiWXYz?=
 =?utf-8?B?cHNSZUgzNmhrK2o3SWlLai9qL294dWRNWUpUaGxxcEhzS1BtVXdacjhOUVRQ?=
 =?utf-8?B?S3lUZGhhWHloWDdncjVMemJMUDl4S2lGZERrTkpIQmN5VExRbkZhQmtFZk00?=
 =?utf-8?B?SDZtMU5FK1RuaEJxYmFTcVczUU9Ca1NFU3AyWkNwaTR0WTUrZTZoWlJyMXZY?=
 =?utf-8?B?V2JlejI5anJtYVZVd0YyYXhEUTZzVlIrS2hWMDAvYzZYNjFQVDMveWtVV1Za?=
 =?utf-8?Q?m3yheNqaoTZ/8fa7qI=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecea67a-12d5-45c6-b056-08dd707173d0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8437.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 16:31:13.6556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8676
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

--------------RsxFFnWSRZjWfrU0kv78WLNL
Content-Type: multipart/mixed; boundary="------------vPURNWvwNWUCB7QhDjKZ7XN1";
 protected-headers="v1"
From: Shengyu Qu <wiagn233@outlook.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wiagn233@outlook.com, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
Message-ID: <8e38d8fe-c9ce-444e-988c-041514052c02@outlook.com>
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
In-Reply-To: <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>

--------------vPURNWvwNWUCB7QhDjKZ7XN1
Content-Type: multipart/mixed; boundary="------------Cy6AuL1jmZQKoOA3PPwUQ7Fy"

--------------Cy6AuL1jmZQKoOA3PPwUQ7Fy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

U29ycnkgZm9yIHZhZ3VlIGV4cHJlc3Npb24uIEkgbWVhbiB0aGF0IEkgdGhpbmsgd2Ugc2hv
dWxkbid0IHJlZ2lzdGVyIA0KRFJNX1BMQU5FX1RZUEVfQ1VSU09SIGluIHRoZSBkcml2ZXIs
IGFzIHdlIGRvbid0IGhhdmUgYWN0dWFsIGhhcmR3YXJlIA0Kc3VwcG9ydC4NCg0K5ZyoIDIw
MjUvNC8xIDA6MjYsIEFsZXggSHVuZyDlhpnpgZM6DQo+IA0KPiANCj4gT24gMy8zMS8yNSAx
MDoxMiwgU2hlbmd5dSBRdSB3cm90ZToNCj4+IFNvIGN1cnJlbnRseSB3ZSBoYXZlIHRvIGhv
cGUgdGhlIGNvbXBvc2l0b3Igd29uJ3QgdXNlIA0KPj4gRFJNX1BMQU5FX1RZUEVfQ1VSU09S
IHBsYW5lcyBhdCBhbGwuLi4uIFdoeSBkbyB3ZSBzdGlsbCByZWdpc3RlciANCj4+IERSTV9Q
TEFORV9UWVBFX0NVUlNPUiBpbiB0aGUgZHJpdmVyPw0KPiANCj4gSSBhbSBub3Qgc3VyZSB3
aGF0IHlvdXIgcXVlc3Rpb24gaXMuIEEgY29tcG9zaXRvciBjYW4gY2hvb3NlIG9yIHNraXAg
YW55IA0KPiBoYXJkd2FyZSBmZWF0dXJlcywgYnV0IHRoaXMgZGlzY3Vzc2lvbiBpcyBvdXQg
b2YgdGhlIHNjb3BlLg0KPiANCj4+DQo+PiDlnKggMjAyNS80LzEgMDowNiwgQWxleCBIdW5n
IOWGmemBkzoNCj4+Pg0KPj4+DQo+Pj4gT24gMy8zMS8yNSAwOTo0MywgU2hlbmd5dSBRdSB3
cm90ZToNCj4+Pj4gSGksDQo+Pj4+DQo+Pj4+IFRoYW5rcyBmb3IgcmVwbHkuIFNvIGN1cnJl
bnRseSB3ZSBoYXZlIHRvIGFwcGx5IGNvbG9yIGNvbnZlcnNpb24gb24gDQo+Pj4+IHRoZSBi
YWNrZ3JvdW5kIHBsYW5lIG9mIHRoZSBjdXJzb3IgdG8gZG8gc29tZSBjb2xvciBzcGFjZSAN
Cj4+Pj4gY29udmVyc2lvbi4gV2hhdCB3b3VsZCBoYXBwZW4gaWYgY3Vyc29yIGFuZCBiYWNr
Z3JvdW5kIHBsYW5lIG5lZWRzIA0KPj4+PiBkaWZmZXJlbnQgY29udmVyc2lvbiBjb25maWc/
IE9yIHdlIGp1c3QgZ2l2ZSB0aGUgY3Vyc29yIGEgZGVkaWNhdGVkIA0KPj4+PiBwbGFuZT8N
Cj4+Pg0KPj4+IFRoaXMgc2NlbmFyaW8gaXMgbm90IHN1cHBvcnRlZCBvbiBBTUQgaGFyZHdh
cmUsIGJ1dCBzb2Z0d2FyZSBjdXJzb3JzIA0KPj4+IG9uIG90aGVyIHBsYW5lIHR5cGVzIHdv
bid0IGJlIGFmZmVjdGVkLg0KPj4+DQo+Pj4+DQo+Pj4+IEJlc3QgcmVnYXJkcywNCj4+Pj4g
U2hlbmd5dQ0KPj4+Pg0KPj4+PiDlnKggMjAyNS8zLzMxIDIyOjI4LCBBbGV4IEh1bmcg5YaZ
6YGTOg0KPj4+Pj4NCj4+Pj4+DQo+Pj4+PiBPbiAzLzMwLzI1IDA2OjU5LCBTaGVuZ3l1IFF1
IHdyb3RlOg0KPj4+Pj4+IEhpLA0KPj4+Pj4+DQo+Pj4+Pj4gRG8gd2UgcmVhbGx5IG5lZWQg
dG8gZGlzYWJsZSBjdXJzb3IgcGxhbmUgY29sb3IgcGlwZWxpbmUgc3VwcG9ydD8gDQo+Pj4+
Pj4gSSBkb24ndCB0aGluayB3ZSBuZWVkIHRvIGRpc2FibGUgdGhhdCBpZiBpdCBpcyBzdXBw
b3J0ZWQsIHNpbmNlIA0KPj4+Pj4+IHRoZXJlIG1pZ2h0IGJlIHNvbWUgdXNlci1kZWZpbmVk
IGNvbG9yZWQgY3Vyc29yIGljb24uDQo+Pj4+Pg0KPj4+Pj4gVGhpcyBwYXRjaCBhcHBsaWVz
IHRvIEFNRCBoYXJkd2FyZSBvbmx5OiBodHRwczovLyANCj4+Pj4+IGVsaXhpci5ib290bGlu
LmNvbS8gbGludXgvdjYuMTMvc291cmNlL0RvY3VtZW50YXRpb24vZ3B1L2FtZGdwdS8gDQo+
Pj4+PiBkaXNwbGF5L21wby0gb3ZlcnZpZXcucnN0I0wxMDENCj4+Pj4+DQo+Pj4+Pj4NCj4+
Pj4+PiBCZXN0IHJlZ2FyZHMsDQo+Pj4+Pj4gU2hlbmd5dQ0KPj4+Pj4+DQo+Pj4+Pj4gRm9y
IHNvbWUgdW5rbm93biByZWFzb24sIHNlZW1zIG15IG1haWwgaXMgbm90IHNob3duIGluIHRo
ZSBtYWlsIA0KPj4+Pj4+IGxpc3QgYXJjaGl2ZSwgc28gSSByZXNlbnQgaXQuDQo+Pj4+Pj4N
Cj4+Pj4+PiDlnKggMjAyNS8zLzI3IDc6NDcsIEFsZXggSHVuZyDlhpnpgZM6DQo+Pj4+Pj4+
IGN1cnNvciBwbGFuZSBkb2VzIG5vdCBuZWVkIHRvIGhhdmUgY29sb3IgcGlwZWxpbmUuDQo+
Pj4+Pj4+DQo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggSHVuZyA8YWxleC5odW5nQGFt
ZC5jb20+DQo+Pj4+Pj4+IC0tLQ0KPj4+Pj4+PiB2NzoNCj4+Pj4+Pj4gwqAgLSBBZGQgYSBj
b21taXQgbWVzc2FnZXMNCj4+Pj4+Pj4NCj4+Pj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcGxhbmUuYyB8IDMgKysrDQo+Pj4+Pj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4+Pj4+Pj4NCj4+Pj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vIA0K
Pj4+Pj4+PiBhbWRncHVfZG1fcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vIA0KPj4+Pj4+PiBhbWRncHVfZG1fcGxhbmUuYw0KPj4+Pj4+PiBpbmRl
eCA5NjMyYjhiNzNlN2UuLmI1YjliMGI1ZGE2MyAxMDA2NDQNCj4+Pj4+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcGxhbmUuYw0K
Pj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbV9wbGFuZS5jDQo+Pj4+Pj4+IEBAIC0xNzkyLDYgKzE3OTIsOSBAQCBkbV9wbGFu
ZV9pbml0X2NvbG9yb3BzKHN0cnVjdCBkcm1fcGxhbmUgDQo+Pj4+Pj4+ICpwbGFuZSkNCj4+
Pj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3Byb3BfZW51bV9saXN0IHBpcGVsaW5lc1tN
QVhfQ09MT1JfUElQRUxJTkVTXTsNCj4+Pj4+Pj4gwqDCoMKgwqDCoCBpbnQgbGVuID0gMDsN
Cj4+Pj4+Pj4gK8KgwqDCoCBpZiAocGxhbmUtPnR5cGUgPT0gRFJNX1BMQU5FX1RZUEVfQ1VS
U09SKQ0KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+Pj4+Pj4+ICsNCj4+
Pj4+Pj4gwqDCoMKgwqDCoCAvKiBDcmVhdGUgQ09MT1JfUElQRUxJTkUgcHJvcGVydHkgYW5k
IGF0dGFjaCAqLw0KPj4+Pj4+PiDCoMKgwqDCoMKgIGRybV9wbGFuZV9jcmVhdGVfY29sb3Jf
cGlwZWxpbmVfcHJvcGVydHkocGxhbmUsIHBpcGVsaW5lcywgDQo+Pj4+Pj4+IGxlbik7DQo+
Pj4+Pj4NCj4+Pj4+DQo+Pj4+DQo+Pj4NCj4+DQo+IA0KDQo=
--------------Cy6AuL1jmZQKoOA3PPwUQ7Fy
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
scUnWnv8sErY943hM8MUsMQ5D0P2
=3DUrys
-----END PGP PUBLIC KEY BLOCK-----

--------------Cy6AuL1jmZQKoOA3PPwUQ7Fy--

--------------vPURNWvwNWUCB7QhDjKZ7XN1--

--------------RsxFFnWSRZjWfrU0kv78WLNL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmfqw0oFAwAAAAAACgkQX75KBAfJsRl5
JxAAkxckTMKxMgj2GBsB2kO5eNgF1GTDksm2UACSUw2H77k5R/6aR2X8gYhth3T+eKB065vXYGwv
c2yO1+MGLMtgSE8p/flPGq6F8I4nSup1fAgkwELpxHxHEa7hK9ELleMSkw9xlJYsQEVbKMCwvCq+
3ynbKQK1owdrrqnVoThquQVLDF9CKVw0Np+CtT2BKC8vdGewpTF5CDsvttBikyrkkMf2hfdQuRXu
wxEPXgCUzJJ65M3yBNaP1l5x7F4gXFi4q5lN76solGLykErrkp4nxH7JnMdCqSys13OOkGMns4cC
PS6DNzrj3iGiXM7d3e9SwlQW22j8zjDjGklNlZTjTqPXhzcvgDYHNq2txgRsSKhIp++1EkhEfExE
Yg1J5q3HveQbVsjvMKqfR31j1C/8zN0xcgI5gwLciuXIJbNK8XkbwVl33m4B8RFDmzCqZ9UEU89S
fHKM58j47unGaWEZJahQ9BzMW5oCBmgOecWiUn1hbCUyDt9tvO/tuvnRiy/nmcBAOV1J06UwxptY
CP+v/ZUJpXSjEPsldN5bkuWxXAZDSAUFnBoAR4LkoNvVv8uL97yyWh3gWDDpiG0egqnYD7oo7/bD
Hr65Zc/GB06HkL4cjfKLXzy8fq/KTApYgDcePX2bkdeevNevZbTAL4To5Ukr7msqexBKuP96Qe4A
9AA=
=tBHp
-----END PGP SIGNATURE-----

--------------RsxFFnWSRZjWfrU0kv78WLNL--
