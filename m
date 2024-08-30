Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634D396641A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 16:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D6410EAA6;
	Fri, 30 Aug 2024 14:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="c2HVjQDt";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="LCd8PIg4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1153 seconds by postgrey-1.36 at gabe;
 Fri, 30 Aug 2024 14:22:47 UTC
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9390310EAA5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 14:22:47 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UDnahA029488;
 Fri, 30 Aug 2024 15:03:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=lNb9yNQ0eEyR/zbVp6KnMpu8lc5T4MYdudmCL1Rpd1M=; b=c2H
 VjQDtX/VMWtNW/MrLeC5iAOC/6VYtzg+O/yLTAu6j9GOVp+iYbEaEz9WTwZYhcrC
 ZdWrLLpcBCMFvV5Aqw+jcixBpehDDAa4bEDm+wpgkiVGngxcwQivhsOoBIcbtAwE
 hZPRphJz0b7VnjkiG6BgnyKMmxFLwow845n9HMAyWhsGlLJJvZqtEph47R9KL2ht
 sNpSYmCQDmmz1D7aaCMryh/AxoUloXCElHokQMkZM1rieGMe8iRFZn+uiT2Z/5NR
 7WQyeIm932GuxxgdnkcHWsE0XyKD1sAj6W6IuuqIzTRCLvroO8wBpNROnOXTALUX
 rE99arCieDP2KlCNpuw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4177kvn9ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 30 Aug 2024 15:03:15 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 30 Aug 2024 15:03:14 +0100
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.42) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Fri, 30 Aug 2024 15:03:14 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAfhCnmzyfXrWU+hmgRqTXgdfhRQtsJArKBZXICOKKCIWoiRG0HTvL3QRGhqOM64+qjL2Z5h0ynBjb58KBWqwMn/6uPdm3n6C51nqVCo40wjqimMobXGBFc7DNwu9c3gi19pv4AUOnD2zBkjXFg5pVd3SmjhFpO9x50HmQ2XlXvo9HNE+CBSWrRBusyvXh2XrglVMakUHs1gmB+xGdnOTvd76mRH2IMZG2dUJNd9mT3Le6I0fq4VaippQ7hK438tyu37rqtlmvGdbc5OkYFxvGy2mguTY4sG1zEd+ZmzykX0qciyUkOC9WdAfmeSm4RDqILG1wBe3gF2eq6UfAmpgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNb9yNQ0eEyR/zbVp6KnMpu8lc5T4MYdudmCL1Rpd1M=;
 b=l2+wiMIapiDy8iHv6TE26CbHJcrUbpCnkzO+4CubNDEFbq8UKHZZTGJHBqgWamfPuVR6yWFP727u8ZtO7pC7MpGUzelT7Tj6Uacw7U/zrE2QX5jDpjdNJhnydqDbTSlSs4UG/wFwsCHNy4eqhEbpvLxryy4GyHyul9NtwoKC9npnu2aZZsmz/SQopcU7xdmODAUvHllkk/ey3q+uF9RDhyBneqRUfrxRf2D8Bx8zETwUNPFTk4cSU466PzKBce9uBonfPfNjQC1Cj4h3lb+NjTr9PENM36sGJEt1yEtbqZfPTN8a0KDM7IceGa+LOZ/+bfKNJG/+/oB9GUEsPKGWhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNb9yNQ0eEyR/zbVp6KnMpu8lc5T4MYdudmCL1Rpd1M=;
 b=LCd8PIg4NjA7u5T0MXg3ifjLBm58ynNt418bwQuGtnHnLCfR0ty2S3lSsUbWJKgSl9W/zURMYBYUnY/RjQ+GH2wh5VVMHQ3d1TbC7tcbaE/SJHP/rfRC39eFBA+fL7IYW1APJtdYHHkIeniDGJYgxGT/+TF/o7Y0I4lVQGKlU/A=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWLP265MB5867.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 14:03:12 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::db1a:5e96:699f:8757]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::db1a:5e96:699f:8757%6]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 14:03:12 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, Matt Coster
 <Matt.Coster@imgtec.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>
Subject: Re: [PATCH] drm/imagination: Free pvr_vm_gpuva after unlink
Thread-Topic: [PATCH] drm/imagination: Free pvr_vm_gpuva after unlink
Thread-Index: AQHa+UwcGN9gt+LUvkOIDStkvzixGbI/1zWA
Date: Fri, 30 Aug 2024 14:03:12 +0000
Message-ID: <3282c2daa8b89daaf40a385a184c821cdde549c1.camel@imgtec.com>
References: <9f26a943-1573-43a6-a919-d6425d9df34e@imgtec.com>
In-Reply-To: <9f26a943-1573-43a6-a919-d6425d9df34e@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWLP265MB5867:EE_
x-ms-office365-filtering-correlation-id: 36d0e1f4-3b47-4be9-e8f2-08dcc8fc7c91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MUJiS2xPc3hHUVIzcmEzQlFJV2luNndkTXpjbmNhdXU0RzFqb1VWNWJhTDZo?=
 =?utf-8?B?Vkxud0UzQ1p2MVMrbmJ1enN3Q1VDMG9vWWdGRmxuQStIM0FNdnFZbjVGNzRV?=
 =?utf-8?B?dURodkJncGdGSWFpUEsyNXNkeHBHQVNiUkpUclRmOW9weTJiSk14eVlMbTk3?=
 =?utf-8?B?cmp3emJDYkYxOExEUzl0b0hBa2dwUmxva094TUdlejhnTklQQXdmb05Cb011?=
 =?utf-8?B?c0N1MDBRV2EzbFpxY0pzTUJIZ0s3bXQxZDZQNlA3cjQ3aXhteTc0UUtibDkx?=
 =?utf-8?B?N2VCUXk4SDdpcTNmeWVIN0JQNURzVFp4NE1wR0tna0xDWWEzNC8vRThOeHNy?=
 =?utf-8?B?aTVERXNkUDlENEdIbVNhV0FkaW10UDV2UVFsVG9uUHR4Z2R2TVVVdnBIR1JU?=
 =?utf-8?B?dWdKVnJnUWpBeTFSUmJXV1hWNUs2WU5BSzVOa2xHdVZzNEJVMTEyamU4VzEv?=
 =?utf-8?B?TGRRZ1BvR0lMeDlZVDZmR2w0a1RSK24yeTNoYURUMVpOV3JzaGFrWitNcnUz?=
 =?utf-8?B?cnl6Umlybjg2MTVkdEpyMU9xd3BvN0dwdERNVXFYMlJDZ2dhTWxuT3U2ZFc2?=
 =?utf-8?B?ZTFIdjlRTlNOYVFYaW1GcmZRSUpHSnRHeUlGODcxYUFSZ2lsbDVGN0EzWHpX?=
 =?utf-8?B?VjF0YkhLOU9qTm83VmhyVUlwZUQ4YzNyVGVOelh4Q2RqVm1DN3JoU3BNaXJU?=
 =?utf-8?B?alpxZXRYaEdXMGEzVEZONDNTQWZKRVZkbFRDNUc4aktvcExUWE4xV0l6VHdN?=
 =?utf-8?B?N3dOcHpmZlB3WUFhZmRCWWlCUG9CV3pqTlVzS2hhYWg4eE1aSHpXVmdoVThE?=
 =?utf-8?B?TUhEbFhYeXBiMVh1SnVUWkU1Q3RjQXFNWk95K1hrZ2M3UTBJKzVqYW1aSGsy?=
 =?utf-8?B?ZUdySUVsaWN1WC9ieUc3UXFidmhpZDR3aTlXUkFNWDA2dE9jRG5kUGo0S09i?=
 =?utf-8?B?TGtBZG5JNXJpaTYySUQ5cFc1WnZTSUl0NVZrNDJFZHNOMk5PVG55SEk1K1Na?=
 =?utf-8?B?dkhQbk5MelpiYk5BeEZaNDRmbDI0QmdaMnFML2pCQkloM3h3VHQrL2l5cGRV?=
 =?utf-8?B?RVk5U3JrWUE2NWR5cWsyRFV0S0NxTWxYaVVqTEFwRUkxTktORnYyV21VYkJw?=
 =?utf-8?B?TDVuV3JGcjh0eVR1Zlp0VWhNTEIrWGFINnBJMVU5YWFWMnpQSWt0cFM5RUVP?=
 =?utf-8?B?WFlURmZoelpxalhaZUlOaUgzcjk4b3VvZ1VrZUtMSWViNk9iR1lFRkxEOHlQ?=
 =?utf-8?B?eVZDNkZySjl0dzNOU041U1BvVkF1MTNjU1RuRE1YQkEyRnl0dm5QNm1FbTc1?=
 =?utf-8?B?aW0rSWw5Y2NFWUxaYTNNSGpKR01nLzZnYzRQZllHb2FvRU5kQ1VrK2tNU25H?=
 =?utf-8?B?L3VEelJPck9KdWdYbDFWVk5EMjNkSjlLQk4wUEZiaURiUVBRRzN4ZzIrZVF4?=
 =?utf-8?B?a0dqczY1cnhQdGdnOVRwQlA3Mzg0MTFIaUdIclZET1o0Y1RUejVLS0RUSEFL?=
 =?utf-8?B?WlNVcXNhaEg4QkJmRGVtTVJXTzJuUUhsRFpGQnBlOWpqU3pvenZ6S3RXemVt?=
 =?utf-8?B?Q2hMZkttSEJ4OC9VOU50UzZvL0FXcW9aZGNlRGFoWkJ2eE1oLzN0b3NtaDBl?=
 =?utf-8?B?b0JVRGpHZ0xWNlpkb0FtVU40eW9uSjNMREpUeGNDblZoWmQ5RmluTHVpQURo?=
 =?utf-8?B?QWlOck5RMmpWY0drUFlLd3VPeEVvOWMyZkZlSncxdExRN3VBbVQ4NkxRd3JO?=
 =?utf-8?B?QThIcHpUb3Y2RkNFeFBwMW9HckJZMUVNZGE2VFFZbXhWaEg5SmpLNjB3UzEv?=
 =?utf-8?B?WHNQMUZIc2ZZQkNBNFJYZTE0WjBBMzZ4MlJQM25HTW5ZV3B0YWIxTjNFOHRJ?=
 =?utf-8?B?eU02M2J3M2p6Mnp6SStaSUZuZW5JblFWYkI5eEtYM3c3U0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dm9IQVhlY0hKb1duK0FwRnhFYkdWL3ZpTnQ5QVNzcWJHZ3JqdUg2K2sxdjc3?=
 =?utf-8?B?S3BlYWNqM3NxZGk1a3ZFNGRKRTdpMTdOZXh3dEZjZ2RHb1hBdFdmYlR3RDcx?=
 =?utf-8?B?YWJLNzlzYU53WGRzM2JvbzdhZzFvaHdMVGRrUlR2RTA1VHp6WEFpSk5VK2RV?=
 =?utf-8?B?YjZZTnRuRjRrVVVPYTlJR1d3ZDJGb3VGbGF2cHBwcGcxcHdlSW95eFMzS1pH?=
 =?utf-8?B?MVdQcy9IT2hlRzlFamFQR2doSlVWcDMxM3RGRitaUnhKQWM1WkpEc3J1RS9T?=
 =?utf-8?B?RUZlbXdCZEF4NzQxaHBVc3k2emc1QU13alhnVFRPejc0K0ZxbmxncXR4eC9Z?=
 =?utf-8?B?RzkySERNQkxoTEloL0d5dHRIUWlTMFhOZHJuMVcvVlNBVWRxN3p0TVl4K2x0?=
 =?utf-8?B?TVAyVnVCU0F5MU9ZR3EvQVhpdGQxMHVtVUdOOFpmTlZqTzlldzd4UUFWNC83?=
 =?utf-8?B?cGUrVDAwTVB5SS94cW1yekJITG9xWU84YTBLQ2I0ZkRNODlHTXJSSjVyUVpM?=
 =?utf-8?B?MEJFc0s0MENRdTFSOXArTGRRSUUrbS9qT0FybUxGV1p5OUtUN2hYVUxDa1E2?=
 =?utf-8?B?cGNXNjNKSmNIZlpYakR1S0w2dTdOenJUTTJLTHR6c0pPUHlLY3Jsazgrb2RK?=
 =?utf-8?B?Z096Z3k5T01OTlc4emVEUFFXMXhGN203aG9Nc2FqbU11VWw3RHRpeTk1T2E2?=
 =?utf-8?B?K1J4dUZ0V3pHa0hmcGJzb203OGtJRFUyTGtXUDIzNFVMY1k3QXhDS2hmR3g2?=
 =?utf-8?B?Q3BhbG5YdmhldGVUcWJaUDRLSkVOR1B4N0tCdEJOT28zY3R0eGszd1hQYmZj?=
 =?utf-8?B?cHVUdlJldVVXMkhHS1ViWk9PUUhJLzZqaVYvNWNXT3JrMk80OWdqWnZsbnVl?=
 =?utf-8?B?UkZ0UVRyVk1hdkg2QzlBUG1tbXZHaDJPQk92QzA1cE4vVEpZK1NnMHVXeUN1?=
 =?utf-8?B?QUllc2pwYTF0SHNUejhmdStDYU9GNHVRenEzTHFpVVIrZHVQTTBpZkJ4V0NG?=
 =?utf-8?B?N0o2VlErc3pyREhuZ0lLWS9RamNmRTVmamRMd2VKUm53d29QMHE5b2VKQXVh?=
 =?utf-8?B?NC8yNXcwcnQxZFVYZmNnTThwNGl2SzJUM1BrK0xGNElrUk44QWJTbmZXYytj?=
 =?utf-8?B?TldvVzJ4d1ZNWTgyTEM1am5kTExTZUVCTkNzYVV3eVA2ZUdhcWVteHdvTVZP?=
 =?utf-8?B?LzllVGx4ekVWcVREdmZWNWR6RS9rUVB5N3VleFlDVEhtM1d5SlRXTldQODhr?=
 =?utf-8?B?WGZpcGRGWFNNTEpHUnpxMElsUk0yYVJmM25yWWh0dWQyQzN5TmNqMHMwcHRv?=
 =?utf-8?B?MW5PTFhZbEMwdjhsSXZqdWg1YlNpdDZ6RmN4MDloMjY4a3RwZ0hjaWdTNCtK?=
 =?utf-8?B?dCtSTGFyVE0yZHJScnJ0Y2NGT2NrWjNNUVhXYUlxei9uSFQvQ1hoRUlxaWpZ?=
 =?utf-8?B?WGdiSTU1NUJTcTZWTkRZQS9OSEFpUCtJaEMyRFJvaVJWRGFEVWZqbWI1R0R4?=
 =?utf-8?B?ZmFzQlVFTEtxUThkYkNPZTRHQk5EakdPRXlWcHN2bE1zVFE3NDZ5Ri9hN1Zq?=
 =?utf-8?B?NzlTQzBlTTZjMFljUjJRdFFPOHhrcFZYdHQ0ZTRwMXJLdXpMVWhvSWVNanNX?=
 =?utf-8?B?RXhUMDV3YVBBTkdSK3JTTUhrbllBU0hQc2FGTVdZQnJMV1pmOHJHWmNlYU5D?=
 =?utf-8?B?c21rUmk0TDgveUlRWHJIZkxnVlo2VFRrUmlCU1ZXK0cwWG1LLzBOdnlmNjNY?=
 =?utf-8?B?M2NaWUM5N0poWmFENFJpQllmWUZSM0o3UGdZWENzTHR4aWdkYS9qSzhnQllv?=
 =?utf-8?B?bVZETkpkdWRaUXNIQXhHZTlLdjVmaW4rZStVc25UYmxtRUFjWEhCU0ZVYi9T?=
 =?utf-8?B?YTNQL1ZkSE5NUHh3bGZSM3p1VFlDNzliSzM3R2ovUi9rczZkSTBRR3VJSFVh?=
 =?utf-8?B?b0dSU2J5OUtJcWk0STJGeVZ3NXZEK1d6dmw5NmJSU3BtVlljdCtMaG9YbmF6?=
 =?utf-8?B?eEpxRFQ3T3NpV0tTWURGNkYycHhFVU9xVXYyeklXSzl6czd5bTRzbDEwaS85?=
 =?utf-8?B?TWoycUkwVEl1TkM4Z3JhWHoyVGphN0VrT09JUWdVSEZ1ZVpQVk54em55VW9M?=
 =?utf-8?B?eFRJNzlXWnFHeGtkdHVnSW9yZXdmVjZFbytlQXF0RjVYK2ZBTFF2TUt6U0xa?=
 =?utf-8?B?T2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <85CA086AFAC86341A2716464D231ED74@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d0e1f4-3b47-4be9-e8f2-08dcc8fc7c91
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 14:03:12.6857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P6xfIbpxWJDME4xNOd4f+2edFZKvTNM/X57JARSxaZJgahgT5lXBDSz9ZMFSmk83anNm44Pcu3Oy95omkscqjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5867
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: EaGl7R5ZiNJyVhl7mzgm0FSayBdtcsWf
X-Authority-Analysis: v=2.4 cv=bcM5U/PB c=1 sm=1 tr=0 ts=66d1d123 cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yoJbH4e0A30A:10 a=WnR_qW7rlZcA:10
 a=NgoYpvdbvlAA:10 a=r_1tXGB3AAAA:8 a=VwQbUJbxAAAA:8 a=D5HEgjaEW8drC41IaaEA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: EaGl7R5ZiNJyVhl7mzgm0FSayBdtcsWf
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

T24gV2VkLCAyMDI0LTA4LTI4IGF0IDEzOjEzICswMDAwLCBNYXR0IENvc3RlciB3cm90ZToNCj4g
VGhpcyBjYXVzZWQgYSBtZWFzdXJhYmxlIG1lbW9yeSBsZWFrLiBBbHRob3VnaCB0aGUgaW5kaXZp
ZHVhbA0KPiBhbGxvY2F0aW9ucyBhcmUgc21hbGwsIHRoZSBsZWFrcyBvY2N1cnMgaW4gYSBoaWdo
LXVzYWdlIGNvZGVwYXRoDQo+IChyZW1hcHBpbmcgb3IgdW5tYXBwaW5nIGRldmljZSBtZW1vcnkp
IHNvIHRoZXkgYWRkIHVwIHF1aWNrbHkuDQo+IA0KDQpSZXZpZXdlZC1ieTogRnJhbmsgQmlubnMg
PGZyYW5rLmJpbm5zQGltZ3RlYy5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogTWF0dCBDb3N0ZXIg
PG1hdHQuY29zdGVyQGltZ3RlYy5jb20+DQo+IEZpeGVzOiBmZjVmNjQzZGUwYmYgKCJkcm0vaW1h
Z2luYXRpb246IEFkZCBHRU0gYW5kIFZNIHJlbGF0ZWQgY29kZSIpDQo+IENjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJf
dm0uYyB8IDQgKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3ZtLmMgDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5jDQo+IGluZGV4IGU1OTUxN2JhMDM5
ZS4uOTdjMGY3NzJlZDY1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRp
b24vcHZyX3ZtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5j
DQo+IEBAIC0xMTQsNiArMTE0LDggQEAgc3RydWN0IHB2cl92bV9ncHV2YSB7DQo+ICAgCXN0cnVj
dCBkcm1fZ3B1dmEgYmFzZTsNCj4gICB9Ow0KPiAgICsjZGVmaW5lIHRvX3B2cl92bV9ncHV2YSh2
YSkgY29udGFpbmVyX29mX2NvbnN0KHZhLCBzdHJ1Y3QgDQo+IHB2cl92bV9ncHV2YSwgYmFzZSkN
Cj4gKw0KPiAgIGVudW0gcHZyX3ZtX2JpbmRfdHlwZSB7DQo+ICAgCVBWUl9WTV9CSU5EX1RZUEVf
TUFQLA0KPiAgIAlQVlJfVk1fQklORF9UWVBFX1VOTUFQLA0KPiBAQCAtMzg2LDYgKzM4OCw3IEBA
IHB2cl92bV9ncHV2YV91bm1hcChzdHJ1Y3QgZHJtX2dwdXZhX29wICpvcCwgdm9pZCANCj4gKm9w
X2N0eCkNCj4gICAgCWRybV9ncHV2YV91bm1hcCgmb3AtPnVubWFwKTsNCj4gICAJZHJtX2dwdXZh
X3VubGluayhvcC0+dW5tYXAudmEpOw0KPiArCWtmcmVlKHRvX3B2cl92bV9ncHV2YShvcC0+dW5t
YXAudmEpKTsNCj4gICAgCXJldHVybiAwOw0KPiAgIH0NCj4gQEAgLTQzMyw2ICs0MzYsNyBAQCBw
dnJfdm1fZ3B1dmFfcmVtYXAoc3RydWN0IGRybV9ncHV2YV9vcCAqb3AsIHZvaWQgDQo+ICpvcF9j
dHgpDQo+ICAgCX0NCj4gICAgCWRybV9ncHV2YV91bmxpbmsob3AtPnJlbWFwLnVubWFwLT52YSk7
DQo+ICsJa2ZyZWUodG9fcHZyX3ZtX2dwdXZhKG9wLT5yZW1hcC51bm1hcC0+dmEpKTsNCj4gICAg
CXJldHVybiAwOw0KPiAgIH0NCj4gLS0gDQo+IDIuNDYuMA0KPiANCj4gDQo=
