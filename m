Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE47BDFC4A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0510210E88D;
	Wed, 15 Oct 2025 16:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="LYbUzcm8";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="UmYZIYqQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE04810E88D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:53:33 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59F3wseA2443484; Wed, 15 Oct 2025 17:53:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=chlmcbBIiKgfj5PP2wv5mnNiW
 3MWYPl3AVu/A2cYip0=; b=LYbUzcm8iVFdubDq0YTnjfWL3E26mEXDfhcaWD9cj
 vt16nkNOjVIxi07Wir5nxUhLf3ORGLntV/Ob/MruQb3wxWYUTCvKKRLW1AAOH9Q3
 C5NLvzHsAGVo0gsafGsWagCJ+vuIEJPH0xq6r1+AufB4tfvYOnxj5xFBaFLM0N/G
 F3COpwsZEELh1EfG1TXU2L/YaYfOJUD/yy/LABLTtEkNoAolaMIabxWKq751iwQZ
 uojv4mqFzCY4H8/XsxxfcPoPkziO48C5VATbBjgd6GSKHugp7kqb6yyldXINzuzZ
 YmxluYPy+JaC4CO3J4eDQChhzgtfYNDVLZLv+U73XGS0w==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazon11021126.outbound.protection.outlook.com [52.101.100.126])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 49qfarvfpy-2
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 15 Oct 2025 17:53:20 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBQ7rnciIw9n+8FqY+xej2LsuPWo9BdX4Vd/PlMBVrVrxQBfmzl8dFhEDlEQCe4u8CW0V9lcW1T+QSUQffOBs5rkKdXEK4uYWj0q0TovCrhF4SqosZ9wTpwJblk6IhuCXgDEsBFeIme+4i4XMp4nWxehbcR+lymR9futk8W8Ld1TKAml+GWC1LmlnUAYgQum7HgEvkv35nKEJQqvd0utcuRxeZ7rpAE155HGhvDxJsGjbrkD2NPYNDWfuP06f7713E81GY/a+dyGn2nP2r28RMvmEAG2ra64jh4LRokot1vsCQ+AhtFr/U4rQ89XJzu/Cy5QeSRyNsFM81risKd9GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chlmcbBIiKgfj5PP2wv5mnNiW3MWYPl3AVu/A2cYip0=;
 b=aWnoHj9PxuEC6K3408DfOlqeg5wJz6vqcpBuFkb1J0YHlrcRNAxmv4T2csBIwpMKNQ8wlFAtVdacPkB2bCrB9KByKa6qIvlGNF5wGtfzFhVi9KdUiKBBuqI1xUwozOCamRwQMgI2zV9DpnORiSLe8jW/mKJaNeUTCAFomc7qXH0mu5JlG4b5+L1cL4P6rbuTiWnWeZSstsVoFWznWf4vzOqi7pM1NBREGIQqLb8BMmkgefHHiNH1qEFVY3yCbiev3GbI30qKFGdcgRZmpXryCO7I81hNTeSU2kHg4Hm4vRCkFXCtsEHUFS6HOQvwfNGWCUnM1rIx4eaFdU0PeGvoLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chlmcbBIiKgfj5PP2wv5mnNiW3MWYPl3AVu/A2cYip0=;
 b=UmYZIYqQ/5XcJyMg9oPl1RATC5jCMDnXCveoet2tM4HZIbOCTgGV6pZxEKT1MZhbvewSpdEtKQYKvPtPnNVnEDZu0jp7yHu1LjB1M8USx4YDUUVgdxbBC4OHOGzBb7TlkxZY8PACJEpfq19M9MCS9RZYFU+smCdpei+rmIpODhY=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB2654.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:145::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.11; Wed, 15 Oct 2025 16:53:18 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 16:53:17 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona
 Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
Thread-Topic: [PATCH v2 3/3] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
Thread-Index: AQHcPfQ00A4XlUkelUOCPz9TJn4ifw==
Date: Wed, 15 Oct 2025 16:53:17 +0000
Message-ID: <c58d60e1-3666-4451-9866-2eca976c8862@imgtec.com>
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-3-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB2654:EE_
x-ms-office365-filtering-correlation-id: 5ec37b76-2597-4a75-2add-08de0c0b571b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?VlVKWVhxbko3ay9udnp6R1JTdmRaRE4yWFhxUE9IYmlYRjl6UmtONXVzY3lo?=
 =?utf-8?B?V1RHQTBYNElURDJxNXdrSDhyc2ZnZUovUCsxRFcwY2J4cDBYZTJHaXkwK3Zk?=
 =?utf-8?B?QTlvN1lCWnhaZWptMUNPSmZpM1I0NW1TdytXR2ZBZnh1bzVILzdoRUZLVVgw?=
 =?utf-8?B?SThPQ1VUTXI2MEhHaERPRXAvOXZMWDFoZC8wZHVqZ0hnbzZ4VncwSG1UcEg5?=
 =?utf-8?B?Q1hxUEFhWHIyRnl1THpkUWpGR0xYaWxLVDNjZzIxNnhvQmcwOGtKMEw0eUo4?=
 =?utf-8?B?L3BuTFZrNUluS2E1RlVBb1RnZGlGTjByN2xxZnlsSXZpU25VdnhPNDk1WTIy?=
 =?utf-8?B?YUcvN3FSUUdwaWMzUE10SHpaSzI5Ti9yL1d6amJoSjQwQkVUd1FVZDZlZjlD?=
 =?utf-8?B?WWdjQTFxSGFZQ1pZbVFoVWpXSUh2U2RNS1VBSFdkS1k3S2FtSXVlUU9vdEM4?=
 =?utf-8?B?dTU1VDR5dzhueWh0bUk5SXEzQWE2Ym5PM1JxdHFWeWl1ekRqS2Y5QlZSdW5U?=
 =?utf-8?B?d2ticmx6cEkwUUpVV3o5Ny9xclNSL3hwMTRCcVUzTzc5Z0NuSXdFaXdObUFD?=
 =?utf-8?B?ODBKK1ljRUR1SXFhaDkwUXV1Q0dwTjRadHRodjJacTBGTWNYZUl6YW16YnRp?=
 =?utf-8?B?UTRneUpLR2pVTExjQTRMeHNRYVQ1VjNCWllYVFlVMXFtT1ZHMXprS01ZTFVs?=
 =?utf-8?B?RG84TERMNVFrSjlRK0RlRUNqM2NtQ0tWZUhBSWpxamljdEdYSWN1YlYxT0Q0?=
 =?utf-8?B?dCt2VFFqckdDSy9ITk1aSWhvVXVGWlZpOTFqMWkwUTJtTk91WWtJQWxXb08y?=
 =?utf-8?B?elpEclh4bzV3Q1dQdlJCNWpTVWNSakorNTNHNGFmdkRWWUxudjhFWGRwOGlS?=
 =?utf-8?B?azJLUTA3M3E4ODlaRzcxSHUxM0Y0QzA4N2dRQXZXaGdQbjFIMzllR2hzY0xN?=
 =?utf-8?B?RGpHaTBiTlM4cHFxQ0tOYzBSMGlsNytHSEJVTW04UmoyTlI2WDVxVCtQRDVt?=
 =?utf-8?B?dGc4MU5ZV0ZEalB2QXZPMUdaQWZqZXJudnZQYVp4Z1VRUUNLUUpWYUlXOHRZ?=
 =?utf-8?B?cnFGT2NKMDg2V1QycG5vbmplRm9RWHB5Z01MVXFyNkZ5Yy85bzJnQk5HQVhI?=
 =?utf-8?B?V2FteGxxOTdWdzFHNjg2RzhaOWFXczRDT25FMVBVNUg4bjVKdzUwcXFsUG5W?=
 =?utf-8?B?cUY1NVpvWTJLK0FzazRHSEhWNGhVZXJKcExEeGlvSUVhWWY2dWNpaXpzZzQ0?=
 =?utf-8?B?RVVJcGUwdGVNaHkxUVdCamFQU2t2ZGNtajVEWFBQRi91MUVIOW9Sd0dpRjU0?=
 =?utf-8?B?ZVF5QnNSOXFjOHFLRllhK3p6Vm1yUWFuajI3cXdsU2lDZWc0UUk3YkRLR1RC?=
 =?utf-8?B?U2FGWXI3RGx4RFI3NCtsRzhJS2RPOW1NNmIxQVoxY2luYm5vN2l1ZWoreWRG?=
 =?utf-8?B?SlNvOGVIK0FXRnMyMW1YRk9zdXgzWlpqL3ZlUERHeXV1NDVEQlJpTFBTZTBI?=
 =?utf-8?B?Uy81UGMzYVBaS2huYkcvNnVVL0o2U3lYTXBlRW1wY2RCeExwdHk0eHpRaUEz?=
 =?utf-8?B?Z1ZEMDVWbVBYL3lIdVVBNlhuMUdIcy91bGwyeHpXanExby9WSHYwTU8zYW5L?=
 =?utf-8?B?R21yckdwNmtlUGpIUnBYT2o5T2VJNnhNVmRLSi9DZHBQSFpKUVc4Y1ZES1Ru?=
 =?utf-8?B?LzBHV1pMaGFFSTNEVy9oS2lQMEp3Z3lBRkhHK3lOZUFjdjEvSWo0RnNKaVIx?=
 =?utf-8?B?cmNnbkpUeFFLaEhkVkU5b212ZW91dDlwZ1d2SHVsWFRNemp2ZWwwNzhwNnl6?=
 =?utf-8?B?WXJmNWVORVFNUFRaaHM5OFNHMVBKV0t6UmloNUo3VUYvNlI4YWJiTHZoTlQv?=
 =?utf-8?B?M1JtV0h2TzRqM0pDdUZLUG5TNDlQQ3gzcUZiNTN4OUErYkxZaVM0SS9MbERH?=
 =?utf-8?B?UFRpMkRwVkcrSW1BRDVZU1dqRjA5Nlc4MTBSb29QMWQ1STdjV0RUUWJscWlQ?=
 =?utf-8?B?ZVdjcnBvd0NwSEY2bGxtRW05WWZ2UW5jL3RiK3ZCTHY3MTdsMHlzTlVLR3pj?=
 =?utf-8?Q?c9zVBw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0FocmIwYjg5blFYREtaUFZiZkhvMTg1OWZRR0RhaVg4Ujc5V04yQ003Ykd6?=
 =?utf-8?B?TWw4bFZuemRxaURyMUpvVFI1clNQelNRTGVOWTlmbzR0TEJFbGZGT3NFd2I1?=
 =?utf-8?B?eDh0SEUvOXZnWGI4dERnajJrVFV2dVVRckgveldzdHVXODNZTWhjR0luU3M2?=
 =?utf-8?B?a1ZKM0w2TE05bSthMmJxZW9PSGZvVEVodHVjdWxrUHZ0K2o2eHVvZU9MUDh0?=
 =?utf-8?B?Tm1JdjI4QXNtT0FORVMyOHczWkdRUkwzb0VWOXRyd1FPanQwQUVNOFJSc1dk?=
 =?utf-8?B?RXpwNU9NLzYzeTdNNTJRVkR4UHdVM3JlM2hBY2gwQkNVQVVkUlU2VFFsN1dD?=
 =?utf-8?B?WjE1SkU3YkVFRVdxZGxZM3UvY2t0TkRNQkFqR01MSlN5SURsenRQNVRJUkND?=
 =?utf-8?B?L0gvOUZUcGs5bFNjdUtKbUNpS2dabmQyQ1NaaFFlaHYybWpPS2lreWY4YVpr?=
 =?utf-8?B?eXJjMnNXd1ZtS3Z2ZjRCWklkbXI2TlFhM1RIZE9lK29TWlJVN1grZlgyQlR3?=
 =?utf-8?B?M2p5M0JLQzJzUldqNUhBaUt2Z1VVbkhLT3gzNlBMZVJOQ3p6bC9saWpHL1JF?=
 =?utf-8?B?MFpvM0VSeTJyN2hhNmtOb2VsOGhEelFvOFc2a09rbHdVS0NTSzl4ZUU3bVBI?=
 =?utf-8?B?eHRVa2tNUURmQWNpWmZocGVBT3dGSXRFZXBQL0ZqOWxRV2VOeVpmNUZ3UzI0?=
 =?utf-8?B?UXRLeTdCTG9SeFJXeTRyZHV1U3pESUNkckt0QUlmY0s3SXptN1NGRktLbm1a?=
 =?utf-8?B?OWYzd1IwTHNCWTg1cGRhbk9RbWIwcHFIRitLaXVYK1kvcTgxRUV4UlhibXRs?=
 =?utf-8?B?SGlqaDVmdDRhUS8xQXN2NmptTi9wUXVKKzJINjJCbU9maXRzVGMxS1lscUhG?=
 =?utf-8?B?SG1lMmsxK05rWVhoUDJpWkxNQjBrOVE5T3E2RnhLTHd4STBYM1BFckI1ZWY3?=
 =?utf-8?B?OGtLaGZUYUliR2d5NjVqZWx5TUxCQWZ5d1Zjck0wbnp2bWFxU3J5QUs5Y0tu?=
 =?utf-8?B?WFhxc3VOWStMRzBwTzRBdk9tZGpkalg2MzFCalRJNTZ5eVZXZTlzakd4ckQw?=
 =?utf-8?B?NlVONXlQWElxTldkWHpPUWcrK0hYVzNxYmI5RVRNVlhJbFpDdVFKclA5V044?=
 =?utf-8?B?WE5LRHZNa0o0Z2V3SW9mUmVyOUs2SUpsakxzc2dQNEtsK2Z0SWJUSkRoeGY1?=
 =?utf-8?B?cm1VeWwxaDE4djBnNjRnUnAvbW8zNHdYY2lJYzg2RFJrL0dJT1k5Q2Raa0wr?=
 =?utf-8?B?VGJKTkIyVHNSRlh2S3c1bzZEOE1TdGhuZTNMcXdCbGZBeHp2RjYvNVovRE5z?=
 =?utf-8?B?Vlp5c1Joak1KNFliNzZCWXUzN2RaNDdzay81N3hFUHpxUTl5TzgrbjlESll0?=
 =?utf-8?B?OGFaUDNyUXRkQUVnaG01Y3lZU2xBeW9GODM2cnZXWlNtNTBXa09ZczVlOTBk?=
 =?utf-8?B?TVV3Tm1veHJLZU9GWjZ3ZVJpZG1iNWI5blFYaS9kNnhCYWY3NWpIWTJtM1N0?=
 =?utf-8?B?VlhjY1NRbDJkKytpZkEvbi9RSmFNN0FkOUhCWGEvSzVuMHNERGMwemtBa3B5?=
 =?utf-8?B?SjFiQlQyNU1meEw3aFNtTmplcHFjbVF2ZFZGbEpKQXJrS1VNSlR4RFJsYjVl?=
 =?utf-8?B?dnpXOFhPcTZlSFY5Z0FtQ1JxSW9sQnNYQ0lXY3V2YXJSWkZGYk5HRlBqQmc4?=
 =?utf-8?B?U0RZcTR2Z1o5SWFHNGg0dGpIUkVESU9RMTZ4d2xyQTdYaXVuRExPUExZejNJ?=
 =?utf-8?B?SzZTczJlbU16UUJES0VXci80Z0JadVJueTRsdXhFbVFKWTJvbEI4bTg1OGtS?=
 =?utf-8?B?dENrdzl0SVZHZjdpNnUrdWdRWjFKR0hqYTEyMG0xUnVkazR6ckNyN0VQLzBD?=
 =?utf-8?B?VzhTbTB4VWpSYThORERvclNEZHROWXVmMmR3dmpTOTVQb2pZSFloSDlNSXJ1?=
 =?utf-8?B?emJ0dFJWaHlwNHBwZ1BBV0lscUthNHNrQm5KZjFjaTg0cTR3cDhZR2xxWDhk?=
 =?utf-8?B?RE1vTkd3eWs0UkwwSGRBeFFta1h6NVJFUG5DblJQa3NsUTV3OE10clBxbUpQ?=
 =?utf-8?B?YTNVNDhFREdvdGpTaEpNTVVtdE43R2VLdjh6OUVTb2haZ3FtQk1pVmRHS0or?=
 =?utf-8?B?eEhaRWg3NFF3WGJLWlF5TUpDdk04YjlwVWZYemVMVGNZVzZQTFJ5RUxpTmM5?=
 =?utf-8?B?eGc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lXyh6O8qxlljSjnh7nfVamgs"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec37b76-2597-4a75-2add-08de0c0b571b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 16:53:17.8355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ErtGospjuo/gLOFLvEXSi9kIOPCx/cOPh0Zqam0dQS7iFp8JN4amZlhxZZd0xkJwsvsBSRZQPZ0YwIaYODn1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2654
X-Authority-Analysis: v=2.4 cv=O+A0fR9W c=1 sm=1 tr=0 ts=68efd181 cx=c_pps
 a=A0iqGUCyZdlyWs06AcuuUw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=r_1tXGB3AAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=yC-0_ovQAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=HwmaPvt4cbKsgEULfvwA:9 a=QEXdDO2ut3YA:10
 a=G1mzZ1ZrHpr4-rqWUjoA:9 a=FfaGCDsud1wA:10 a=Rv2g8BkzVjQTVhhssdqe:22
 a=t8nPyN_e6usw4ciXM-Pk:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: DBNOrk7Qqw0w13bJrXNvu3zPAzTG2oUi
X-Proofpoint-GUID: DBNOrk7Qqw0w13bJrXNvu3zPAzTG2oUi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDEyMSBTYWx0ZWRfX9CP+WpbifPWt
 SOY6LtQIwnqeXO5dO5xFuo67e4sGr/8xZ6nTf73lxef2lx6Ye+RCZmF7GZ+h3ml+ng1l1LaTpRl
 unqUd6i0oJKqrVSqzJ5BVSmR4GmaaTFG3pfJ++FzI7HBj5xcjt8lrvS7TzPgDyEFVR3PkglndFx
 FZRSUp69f/sUSAQXVa7THim3hW/vJjWhLO8mQZ/WHxvhbW4q1zBNXy9uFdEZAPQ0V76lrY9UPjk
 bdF/hSh9gILIPSVl1qXpdrqSkf77gsxjt1BLDM8IRac4h/YZsYcZjo0NGAF4Z3I/GiK8VYUaYp1
 tjW249ZVaEfTK0GvdRZZDqs1Bf7iBrwZiu69ldKCTz8BBPTu4XuClq8++XrnvS539TBH+Mkhg9x
 0PvD6c7/Sv7pmAgcgSmogowYlsVUDw==
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

--------------lXyh6O8qxlljSjnh7nfVamgs
Content-Type: multipart/mixed; boundary="------------t5aTJQJ0wObcML2wK8ki9zY0";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Adam Ford <aford173@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Message-ID: <c58d60e1-3666-4451-9866-2eca976c8862@imgtec.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-3-marek.vasut+renesas@mailbox.org>

--------------t5aTJQJ0wObcML2wK8ki9zY0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15/10/2025 16:38, Marek Vasut wrote:
> Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77961 M3-W+ SoC.
>=20
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Same as P2/3:

Acked-by: Matt Coster <matt.coster@imgtec.com>

Cheers,
Matt

> ---
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Add RB from Niklas
>     - Fix up power-domains =3D <&sysc R8A77961_PD_3DG_B>; for 77961
>     - Fill in all three clock and two power domains
> ---
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boo=
t/dts/renesas/r8a77961.dtsi
> index 12435ad9adc04..aa7f5de61e787 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2455,6 +2455,22 @@ gic: interrupt-controller@f1010000 {
>  			resets =3D <&cpg 408>;
>  		};
> =20
> +		gpu: gpu@fd000000 {
> +			compatible =3D "renesas,r8a77961-gpu",
> +				     "img,img-gx6250",
> +				     "img,img-rogue";
> +			reg =3D <0 0xfd000000 0 0x40000>;
> +			interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_CORE R8A77961_CLK_ZG>,
> +				 <&cpg CPG_CORE R8A77961_CLK_S2D1>,
> +				 <&cpg CPG_MOD 112>;
> +			clock-names =3D "core", "mem", "sys";
> +			power-domains =3D <&sysc R8A77961_PD_3DG_A>,
> +					<&sysc R8A77961_PD_3DG_B>;
> +			power-domain-names =3D "a", "b";
> +			resets =3D <&cpg 112>;
> +		};
> +
>  		pciec0: pcie@fe000000 {
>  			compatible =3D "renesas,pcie-r8a77961",
>  				     "renesas,pcie-rcar-gen3";


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------t5aTJQJ0wObcML2wK8ki9zY0--

--------------lXyh6O8qxlljSjnh7nfVamgs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaO/RfQUDAAAAAAAKCRB5vBnz2d5qsOS6
AQC58finROGBZklurwGqPog0wnxLvu0xehR2fWzGyhqX0wEAjZ7e6d3RKb0WMlxM5K9xQHWcwGen
APEPN1Jd4H83uwk=
=FY90
-----END PGP SIGNATURE-----

--------------lXyh6O8qxlljSjnh7nfVamgs--
