Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AD6JM9Bd2nLdgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:28:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D46C686E7B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3466910E2BD;
	Mon, 26 Jan 2026 10:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XGRWhCq/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013055.outbound.protection.outlook.com
 [40.107.201.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113E910E2BD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 10:28:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jclz2MwefR39Q75/RLnsXQjrOouDYr9jRaW6p56wugRTNAClByVO+eaHL/q40Aig88lHxKY/pf2bsFTRyFzwjnf959P7bfWNV+cG6GJalCrVrVVNt5M3PCdPCjeuTJuTcr9fOrlfLvJqX+dtyn1aL4jZMpmE5hUIwNax4mMh4EzoHzvixG+apa5kzkMZKmIKakm2IE9t/kWtaKgmPqCRp5Q7ZaMazn8QGT5aZx5z8DHGEvjMd9wO5fsI0aVD9DsixeZ13H4gKmlihiRHL4UycVHmmohxGn6wNv3cZG4BLvAyJaX7WJv53WTRIwNe6ZghtHRD1689acYRB6pwkG8g6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVSFEzAkpN7nwNpqEL8m0zmEy0VVgoft68rYzvCkmtA=;
 b=XEjNdaF3TdQqd53j2FXdcU9gkyDxewHuKTrvPyixko7b29ZOidvulz+zOrAElKl+bhP3Cfdp/HpE4B4c52cyFccF+9xfMvIS81HrTq28jrI8/swhE2cF4WrwnT35Iv0+gNC87pIkLHjj2IGrjTPEIBbIfW1pnLseMaZHF3eCcIRMglj+ZRaJy+L85ojcZQyo94TxzbQHRGeJF149+LtB/fIFMqZK2gdK1P/R8L7vm0MkGtXtgcUo9LEueKjXJlxIKvaebl7bUpXFSJanQhqPY6rr4bxYkEErqXqBg4RzzXc29YKWSW8Y/pVZb4KdtcPP3qfZcmzBURm34VHThEhiNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVSFEzAkpN7nwNpqEL8m0zmEy0VVgoft68rYzvCkmtA=;
 b=XGRWhCq/q6GZQboxe5+0mLP6yDY8fJqH5giTun1UQYUvbUrDn0DYL5c4/Cylhtu+ePU74MHqKac8f1QbdLZsfpioX17BSAfFDoVWpKwVeAfeLNsO78qcIkZrL+0ZlyXrT2KZesWt12mf9uDMj8IeGyh5WqH8+6Wnk/+PKMFcVasUBuFkLZCsMWyoCauP+BdMLWVEfxlVV9EF5qGkuz7TdbIIotEYaXrIk7gvPHSmL1+nRSanoD/5fVNtOehZzdSeAu40h1nHFXl0hZShFHbD7O+FNvYN8MijbIN7pPH6ywhbB/EZ5m8g3nVJ3FLYfeFhYl+AEb0ZEPeEA+KQIdzsaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Mon, 26 Jan
 2026 10:28:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 10:28:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 19:28:21 +0900
Message-Id: <DFYG7MT5JINY.1T8ZZ4ASIWXU@nvidia.com>
Cc: "pengfuyuan" <pengfuyuan@kylinos.cn>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Helge Deller" <deller@gmx.de>, "Hans de Goede" <hansg@kernel.org>, "Lee
 Jones" <lee@kernel.org>, "Sam Ravnborg" <sam@ravnborg.org>, "Zsolt Kajtar"
 <soci@c64.rulez.org>, =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?=
 <ville.syrjala@linux.intel.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v1 v1 0/4] [RUST] Framebuffer driver support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
References: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
 <ed48e82a-cb94-477f-83c4-b2d87ae3cde6@suse.de>
In-Reply-To: <ed48e82a-cb94-477f-83c4-b2d87ae3cde6@suse.de>
X-ClientProxiedBy: TYCP301CA0034.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4239:EE_
X-MS-Office365-Filtering-Correlation-Id: a790ff07-8a62-4172-61ec-08de5cc5a2c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WldhTk1XOHRBUEJKQlJZUDhFWDNZM2lDbUpSd3IvMWdjTnFpQXN2WGdzQVM3?=
 =?utf-8?B?VldWNnpVRUpVaTRLRDVqeWJvRXllai9MTUtVdTJZUEFobWtoMGNlMU50dStR?=
 =?utf-8?B?OXg0OXNKK3N5bG9tczZhcDhXd1d1bjRlWHJMSFRIWE5RMjBuVHpVMExIdUtm?=
 =?utf-8?B?MlFDQWdxcTYvV3RzZ05QdXI4eWFLaUFNK3Q2VC9UWXlETDlCSkJrRUUrbThO?=
 =?utf-8?B?SHBjSFFxa2ZFODF5a0o2Z3RRNFlxa2RNQ0dVUSt4ZmtCTSsvYzBKTjdmZUJk?=
 =?utf-8?B?UStpemI1aVgrbmk3aWJvMTBXK2Y1NjhqUCtyQWJXWStrK0tobWZJc2U4TnZz?=
 =?utf-8?B?ZzRGekNpS0JENzNMRGpmRFJ0clFITVViOW00QTc4RkE4YVhPb2Zyd2hZVUZa?=
 =?utf-8?B?NWlpYWRJSzFlM0lTOURWczJZdlJhakQ1U2F2ckZ2TDBxd0MrdWl0b1QzMmx1?=
 =?utf-8?B?ZmhmSWJiR21YOVpFTTZlcURXUXVaM0pBTTdxNmZPZ1MvMmVQN0dOVkwvNUpn?=
 =?utf-8?B?VFZxNGVtcTZKclZRUlhHRDJjSUJncUJabUtMbmQ2SWRDb09BUnp0dFQ2S3NH?=
 =?utf-8?B?dWVRSG1WMGJ3VUc3TThRZ09pVDgxZ3NsUGNDRk9jV0hTdmk5U0ZUODdNcHlO?=
 =?utf-8?B?dW85U1oySUp0bUttOGhxdjNDNWJRajl3aEUxRVV4cUlucDBSdTVtNk8xdnhk?=
 =?utf-8?B?UVBCeGVDU3B6aTlVTjN6aHFNczVpY1hBdVBwS0s4WVl0a0p5TURZcHhVRlQ0?=
 =?utf-8?B?ekVMVHdkZWhlT21oYkUrUGhHcEJueDNQdHVSUDJKME1EZHRRWklPb0RRMUU2?=
 =?utf-8?B?ekNMYVdtK2t2WHhieE1zL0lsTWpBZmZrZExUVFNxOFpxblhGaDVrd0M3VHJi?=
 =?utf-8?B?TjZKZWpFblc0UGFGVHdIbVJXS3E5Tlk2TGhhckpyT1lyMXF6eWtac2c5RjIx?=
 =?utf-8?B?M1UxOXk4U3N2UytnbDB6U2thaWEwSzVhNzg3eXQ1WjZFK2dSWUE4aGg5ZVR0?=
 =?utf-8?B?cGxyZ0tkcWdBWE56VjRjeGUwOW5KeUpnbTJsUDlyVkt4RUtuTjJncjB2czhr?=
 =?utf-8?B?eHZ5T01SRXI4RE9jK3VUbWRGSENZNUFpMHZZNCtYd054bWxwajB2Y1NuWEla?=
 =?utf-8?B?SU9NS1NkdnlXQVpUWjZMUHNMQzViYzhWS0ZmWSszMjlsRFgvYWZsKzJzeDU4?=
 =?utf-8?B?LzJkbFdEQ1Y4bWNGbmVuRFpUOE1XU2lUNzNiTjVlYmVhcjRSdlpTcjF3ZC92?=
 =?utf-8?B?K0Q5OHRSRmtLK2Q4TnZJMThLSjNCRWJ2TitKd0VpZE9pTUowTzhRN0lyMnEy?=
 =?utf-8?B?UDJsLzFseTVKRUNVZk9DS2R3UUQ3TmJIdXFLOU00SUI1WlVZK1NrN2tsZWdL?=
 =?utf-8?B?elp6ejdlNkN0Tm9XMWw5RVgzcE5jZXdydmcyWTNhSDFieWRmN2NTc0pHbkUy?=
 =?utf-8?B?SGxJZW9ZbExJZDFPRHBvZ0hHb2JpcGhjMnZMamVVRG5QOFpoTHZGYm1QRFJv?=
 =?utf-8?B?enBVZllJcFF3dm1iYVBncHRiUVBSeDlCdGJNTVl6ZmhEb1h1SlFHWkJwN0c4?=
 =?utf-8?B?WnlLRXRtL1kwVWZBT0NjazZNakYxOXpidGNwTEJCZGkxekZPQWlHNGxXdzhT?=
 =?utf-8?B?YkFmRjZWVEo0ZXZpbXIvOG9JVnJCbkNXVUZVWGU1andCVGV4Z3ZndXI3VHN1?=
 =?utf-8?B?cFpmWlZaT3hnanNnMFZLQ1JDaHFKREhKSTdMMnJ1VGdDYlQ2YU10bGlpdW13?=
 =?utf-8?B?WGszNEswbHBHbnZhNStCMXRlSmRuclpDZWcwTTVBVG5UU2cxRFRKdmVVcjh2?=
 =?utf-8?B?ZWNCM2h3bzZ5NmRrU290SEV1YUh4eWdPaXVjV21JQ1IyOU5yTXVQM0d5c3Q1?=
 =?utf-8?B?QjZZUElNb3Z6WVg4NGdoMUUzNXRPRW1vdWxWcVBoV1hmWm9pWUYySi80c0ti?=
 =?utf-8?B?SlZPckFUOFJKZ1FPUHFCNkxPY3k3V3lWUFJXWG0rRnE3YUxDRzZ0eWJjaFpS?=
 =?utf-8?B?RDVmcUIyRW4wZXNud2pxdlFnRUlvZCtoVUI4M1ZMMnlmNE9aZmhOYmQ2QzRO?=
 =?utf-8?B?WE50bExGcE9Eb3VDdGtWN2RQUjA0anY2dnZwOXp1WE01aEhlaVV5Rm1nMGs3?=
 =?utf-8?Q?9wEc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDJTOXZDUnV0a05CQ3Vma09tcERIUjlmekNsQ24yQ000eW82NXhBVGJ5UWhj?=
 =?utf-8?B?Sjg2dmVQNHpubW5CdC9xTFdqb1Vha2swR0txbXVWdm9HeVNFZm9KQ3FKMjFm?=
 =?utf-8?B?SHdwMDBGRHlvcDd1WDgySGlKeGN3VnNWV2pRRXhwd1E2TGtmM05HaFdsbXFa?=
 =?utf-8?B?UThUbkFvNndEOTRqUk91ZU1RT1JaVTZhdU14bU85aTNpVWRjejhXWllKU04v?=
 =?utf-8?B?OU84U0EyY3E5OWVlYTRYWFVhSlVadmRyRldpTEkrTFFTcGVGaDQrdDJTcjZ4?=
 =?utf-8?B?eEF5RzlVT0pNd1dualhxZVFXamVzclNvRXVLZ3BtQ1NXcElpeXNXOERneUZQ?=
 =?utf-8?B?a0QxaVR0TXZVcHdtOStrMnR2L3VHZXRiVHBXR1ROdEs3WGNRenZoZW1WT2lZ?=
 =?utf-8?B?V3BWM0dtMU93SDJPNEJuK0JFMDErQ0tsMjhIU2J2aUZKNkdBNVo0Z3Vzb0tH?=
 =?utf-8?B?TElXbWpTVG9ybUw1WmZOMmVFdXZyNklPUDB0cHNEQ2tRTzZXTVVINC81K2Fi?=
 =?utf-8?B?dzV6aUQ5eWw4VjJYeDVCMTZkMC9lSnVhUytZcnM1Y25ucUZtK0JpbVUzMHpZ?=
 =?utf-8?B?TmtlQ1kyVEdVWEJaRlU3bEorRnJYYU1LaUwrbjAxKzFmRzN5M1pSdXR0dE03?=
 =?utf-8?B?ZnNSYWY3YUM1VVFTanRPclZUeU1jK2xJQnhoMldNcUE4dG5qWEtYUjZkNm9H?=
 =?utf-8?B?YThIUFZLbE5DZTIxVGsycWhSSytMbFVBQVBIRURGZlNCc3hKOHJ2ZXN0U09j?=
 =?utf-8?B?a1AzOVowRmc0eml4RDBDVzJQUXNQMXcxTkkrVE9hSWppVGh6RGRaUHNGWVhl?=
 =?utf-8?B?OFc2RDZXZEVSRnh4bmpEYWordWhDUVcwY1NWMUd1NFY0ZW9zTTk3N2JmYklp?=
 =?utf-8?B?VEdBVlU1a1g2UmhtcVFUSTI2b3BFV3J6OU5XWkpNYUdPQWhveFltazhUUjZ1?=
 =?utf-8?B?MjRKbTV2VmJ2amp0S0NnR3FXQ2dBL1E4K2pkMVdrSUs0T29CeDlUYXQvWDlV?=
 =?utf-8?B?MDZOUHhEZjNGS1Y2M0E0VTFIRWpoWUwxNDFQekUvNE0wd2RvNXhMVTA3aEpJ?=
 =?utf-8?B?SHpSeVE0MCt5ZEtXSXBPQjZkcXVVallaQnNYeWo0czRLamNTMmd1ZU01ZTA1?=
 =?utf-8?B?Y2RPZWN1NVNwb0ZZMlcyaDJJYXFYV21NM0xWU0F4MXk4dWVEems4aDZYYVdo?=
 =?utf-8?B?dmlMMFV5YW5vazRSa2g0LzJGZlpxZHVONHc1OFd2V1NZN2VOT0ZCYnhERDBX?=
 =?utf-8?B?Wldsd3Z0MUtZOHVhNEU1aS81YTVndEVqRFJhdlBLblFleXN1MUVQSUNhN1dU?=
 =?utf-8?B?QkFKNXhoMjRLNTJzWjBScUIyR1R4QWMwRFRNTGxHbFdtQ29vRk1SM0Z5M0tZ?=
 =?utf-8?B?S3paMGV3N3ZWOSt4aTlKb3JnNkNjZ3VBVlNiYjJvUzVqZ3JTK3RMYWEzcU1Q?=
 =?utf-8?B?RTJSdlVobXhaZzN3WXBJU0JXYkQ3TW0ycFEzcHpkaGUzSy95b2RQeDd2M3FP?=
 =?utf-8?B?Y1pheXRLSytXNjNnSFNxZkQ5bGw1U0hscmFoWlV0M2FwMW9xNFhvZjJaZ1Ix?=
 =?utf-8?B?SDV6eFI0OTdqY08zUjkxbXhVamY3ckFYaTg4RC9KbDRHU1VPOGNGZkxJM3Qw?=
 =?utf-8?B?MEZWSHZGMUcrTXRTaE96aGtHeitQdGJIa2tnNUw0bGt3OTVnUXRhbHlNUWZ1?=
 =?utf-8?B?SkFLbUU5MnVpdVdQVGNBajN3TEwzWnpOS3hmNllEbUpHcWI4VndqN1BLcitY?=
 =?utf-8?B?N2krQXZRYXR1d0t4T2hiaUNpaUZMemJEZk9KYkE0RnRBSnlvS3FYMUVmNmt6?=
 =?utf-8?B?alR1SVluQkxlVVFoWkNFeXY1YUhnaUg0QUZBZklhdmFZZGxxUHNpUzZNNmlG?=
 =?utf-8?B?RHd0Um5Gb1cydCtWb2UveUh6YWRCZWljUDl5dFRNbXZkWkxWR3ZrdnlMSkd1?=
 =?utf-8?B?U1AzZ0N1cDV4UzBMbDUrbkFON3ZYakxwWnpCOVpqYmpsaGlwUkVjbkZESGZF?=
 =?utf-8?B?emFLUHV0SDlsS2NoQjlRREFydTBiRDVYbEJaL0NUcWk5dVkzNk92L1M4TXZs?=
 =?utf-8?B?TEYzNHh3eDdzODBPeU96amZia0dQNHlrY3laRmoyMFRHTWdjTUVLUWliZURa?=
 =?utf-8?B?c3psS1VhcHlIR0srd1huWVVORFFIODc4d2ovYzZlVUdlZ0R4byt5UnEyR3c4?=
 =?utf-8?B?VW93enFwVVBsUExDRHkwTzVudnRDcFNjQ2htYW1SOUc3ckg3d1ZGQTYxRlFO?=
 =?utf-8?B?UVNFeStjays1LzExNkY5alpiUmQ4U0R0K014NlF0eGpkRVI4Yno0a3F0R09Y?=
 =?utf-8?B?Z2FSOFBUYmZMZXlla3JTNjl2RDBXRnVNc3FhcnZ5K0RITnowUE9QWXpib282?=
 =?utf-8?Q?zynTl9uCicQmJgN1U87BnWMEOBUr4R4fb7qa1F/KFqC07?=
X-MS-Exchange-AntiSpam-MessageData-1: 2HCIxzUnDYg7qw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a790ff07-8a62-4172-61ec-08de5cc5a2c8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 10:28:24.8044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOg/MV41rJ94mrJmD8QwwyF+uvdnOWMtGDkF0b2RHjPiUyowhxoA2V3OROvM43LKLhSqIL9sG5y4lW6ujfn43A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:pengfuyuan@kylinos.cn,m:dakr@kernel.org,m:aliceryhl@google.com,m:daniel.almeida@collabora.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:deller@gmx.de,m:hansg@kernel.org,m:lee@kernel.org,m:sam@ravnborg.org,m:soci@c64.rulez.org,m:ville.syrjala@linux.intel.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:tzimmermann@suse.de,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kylinos.cn,kernel.org,google.com,collabora.com,gmail.com,garyguo.net,protonmail.com,umich.edu,linuxfoundation.org,ffwll.ch,gmx.de,ravnborg.org,c64.rulez.org,linux.intel.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D46C686E7B
X-Rspamd-Action: no action

On Mon Jan 26, 2026 at 7:01 PM JST, Thomas Zimmermann wrote:
> Hi
>
> Am 26.01.26 um 09:17 schrieb pengfuyuan:
>> This patch series adds Rust bindings and safe abstractions for the Linux
>> framebuffer subsystem, enabling framebuffer drivers to be implemented in=
 Rust.
>
> The framebuffer subsystem is obsolete and has been deprecated for a=20
> decade. No new drivers accepted. Anything that really wants fbdev=20
> already has a driver. Can we please let it die?

This, and the patchset is also obviously AI-generated.
