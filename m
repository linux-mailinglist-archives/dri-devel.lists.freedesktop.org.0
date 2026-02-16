Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNwQBRCnk2ln7QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:24:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA113148132
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116A410E406;
	Mon, 16 Feb 2026 23:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OTtvQBQE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A0710E13F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 15:02:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8inlipKWTETfhA0/w7AfP4Mdh/Vf4PWUW0xwYkN+bfesKddoV+uZHV7DBhBYUSz0MTYbhVnKRIMK8z/Y3Xx1zcFa8SLkzYXhdUJHoHuS1npXpjt8Jikr1Bp1gSg8pbbxfJfdnlOUhMUbcqfhauTf/pDeGksYvNMvhRjH8rOoZ5bT/e55Vzy57+i21QLGNUUDT8lKDu2Xx0tNqfpnYkNH8EX1eEirjUp5m+TQQcSSFVf6fXb9wsM/VOTX+sk+26iwHnzGCWqNP0FQzbrxqr+Gp1oSoJYP9Z18TTLpdlX9z3aP29KFIB3B9bkEyTtd+F4IE7xJ+9tR5HsYFfeO5tASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKzVFXh68BLbZsPa9jiihTw5vANIJn8C+vLJRIFBfbw=;
 b=WctqH0aNiM5VXFQuv4J5hJvCJSdaDql6vLoQ/rmqmXStKTITO9sbb+nQ86MUyPnXaaHHVx6B6SKYaMDr0U7VZ3BQWXaIf5l6xYMOaimqBsI/2LrRWeocE6BXsgfV7x6RBmta6fdD8fYcZqs9khKF3sRpG3hfx9XDkFVcs9InuJ6mNKbOMORt5suEppDGO/eZJodceLHfPv9iudDXMnHO28VZ4pk6eHjY8IckpgH8lwM78Sjmuu+sO5DrhO95gW0sAaceQ4w/uJjGts31kL9j+XiL4iQUB4Ek+KViDRPkdXIw1lh+ASANmKgvfcz7ajcQ/9FWpisZsiY+Lw7YtiN0NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKzVFXh68BLbZsPa9jiihTw5vANIJn8C+vLJRIFBfbw=;
 b=OTtvQBQE0682pKVQdC5GBZsXeMvmG9EVftr+o8wPh6tSeoyFog+VZtLvfUW9jthAsk9Er5+u42ViY1UUQbnhFazkGzKduEAByrHP4YXBYQoggvRzIeox958rfgxx+EMZ+UvwWPi4QYSN0ivo5EOCLYIARoLBY3bXoVLDTSSYL8CHYbTPx7hIB12OW4H8nAoW7liqsVwA3WUAa3bMWbJ3EHwIt8b7Q2VvPCJRDco1g1hoB90rMDkDQ9yXZzNwhh8P5kw1Zsrp0DX27AY/KvnV49WQlYDPQdh0DhaGmhJLUvAf7mZJifa5oNaMIeinI21oJhJc2Rh8FlDPJ2k9ZQXliw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by MRWPR04MB12380.eurprd04.prod.outlook.com (2603:10a6:501:83::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:02:26 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 15:02:26 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, chester62515@gmail.com, cosmin.stoica@nxp.com,
 adrian.nitu@freescale.com, stefan-gabriel.mirea@nxp.com,
 Mihaela.Martinas@freescale.com
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com, aruizrui@redhat.com,
 eballetb@redhat.com, echanude@redhat.com, jkangas@redhat.com,
 Larisa Grigore <larisa.grigore@oss.nxp.com>
Subject: [PATCH 06/13] serial: linflexuart: Ensure FIFO is empty when entering
 INITM
Date: Mon, 16 Feb 2026 16:01:58 +0100
Message-ID: <20260216150205.212318-7-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0005.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::16) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|MRWPR04MB12380:EE_
X-MS-Office365-Filtering-Correlation-Id: ec2d2ec6-2600-48ea-d7f0-08de6d6c6548
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0tZUmNFVzRCUUNUNWt4c3ZNSjFYbmtZZk9hbkNSR25YL0E1ak5vNXNpZjZy?=
 =?utf-8?B?VjZ4TFo1a1puYXpiclhCUm83MEw5eGhGODVmQnorRnNuV0g1dVdjRHlXV3lK?=
 =?utf-8?B?Q285alhkVmRiNk5RSCsrVUREalpwYVdIRnYxUlRySEJaR05QWE45Tm54bEov?=
 =?utf-8?B?YzNNTm1QbGYzNFBJOTQxRDBtK21wU3lkcU9NVkM2aVgxMFRTYzJOZ1NVSUJL?=
 =?utf-8?B?QjdwTXM4VEx1RjErMG9SMmZTNDA4K0E5eWI1dzRnYVdNS3QxUDFUY3hkODY1?=
 =?utf-8?B?NWhsa2pjVG92d0FxUi9DTWR1Nm9TdTVYRVRONGZ2N2k3ZEJhazFpalMxN2Ji?=
 =?utf-8?B?bnloTXNKYWNvN0JxMHROQXdOc1VIaHFCN1UwK0ZlWFo2VlQ1QzQyb2Nwcm9R?=
 =?utf-8?B?ZmVYQ1hhTUprWVNEWkFTRG1HTG9pRm0vd3F1ckhYcGdlNlBDVnZneDZUVWg0?=
 =?utf-8?B?V3ZSUVgyQWNvRW9xUVM5MVVhMVRkcCsrMHYrZFpPSmcvV3NKTG4vQWpVVVhq?=
 =?utf-8?B?RUE5OHpOUmRiNFBBMG0zNkZjM3k3M2REVHRSVitDVit0bTViM2pTRW9VMGpt?=
 =?utf-8?B?T2phYVhyUWhmRDJ0eUZudFV4cG96N2pScGU5Ly80djJzcHJCN29mRDhyOXJR?=
 =?utf-8?B?WnpSQ3FYbGd3dEFHWGtzSGxTMlFPRWFzaSsxR0lOaURWY21LbFpFdEwvL05M?=
 =?utf-8?B?NG9RQzVsNWRDb1ByZTdZNVJkYmRvVFpQUmJESjVGOStzdkVXNHNvN1dXQzh6?=
 =?utf-8?B?OHhXTlg3akdnR1k2UmVWb0NqaHhYak1rQnczWlkwd0tFc0ZTUE5MT3o2cUtG?=
 =?utf-8?B?NlRMbGUya1Bna3ZIZC9hdzdVR2drWXVzSW0zd1pvQkRtSzM5M3FLR1NJYTk5?=
 =?utf-8?B?S0JZcUxrQzRwTklzQ05DMXpaQ2Nja0grRkMyTU8vRkY5VGsrcHE3Qzh1VWx0?=
 =?utf-8?B?dG9QQ3IzWmRHb1NiaW04VVlkbHhkcUFOZSthaVhnbU9xZ1kvYVVDL2plUmR3?=
 =?utf-8?B?anlua2dFQm9kd0tVZW81Z0xjd0pRZ2xPSEpWUkwrRTlyNkpEKy9UVzVQOEpK?=
 =?utf-8?B?TjhpMDY1cjVLbGc4WktYYWFGcXByN1d6dEE3aEtiMnJyOGhQZFA1ZzBVQWVz?=
 =?utf-8?B?MkNWcDE1VytsTkVZYTJ2a3F2WU1wNXFCSWpVYUl3UTAzZlpleUdmN3ptTjcr?=
 =?utf-8?B?RHhCMEM4STBMdkgxQ1pzcFBxRnZuRzl0UVZSMEpneVAwc0ZzMjNXTGdrenhQ?=
 =?utf-8?B?ZE9iU0o4YWVudlJDdjNQTUdLTlovNU5Ta2Y2OU1mdlFETER1UEswVCt0NVlm?=
 =?utf-8?B?MEtkQ0ZGU2dxeWxOUEtUWHpwTVNIN2YwZjdVSm1wWXB0bzlHdGtDMXJ2MnQ2?=
 =?utf-8?B?aEVRbm1YeHVuYXdydmVNZm5lMHl6U2YzMUprclhXM2NGc1ptTnh2Z3l3VUFY?=
 =?utf-8?B?TTJhelJ0ZXRCQVRNeHQrdUtObmM3TEFxRFR2U0VmazFDS045VUlFYzc3akZY?=
 =?utf-8?B?cW9vOVpQeEczZnFRdWVmSTA2TUcvUEpuTVNybDMvbDhvVXBKWXFKanJhU1hL?=
 =?utf-8?B?UXRTMFRiY2JNMjNDc2l2dmE5bEZIZERsRU9WeW5ma25wWVlCbUN6MGdoU3JF?=
 =?utf-8?B?YWJqSWo4T291eWJxajZqanZ0NVE3b3RjaFRDc0hsR2FUWXIzNEVDSG1ra0tN?=
 =?utf-8?B?Mm9mZWQ2bDZid043QVZIS2FUMTBiSEpDKzNuZU0rT3RLT09KUnZ4WDllZW8v?=
 =?utf-8?B?WDlhS1d3QXhYeDE4OURhUGhUeThFMmtHMmo4cjkzdDR0bGtYZlJNdm9KWDNQ?=
 =?utf-8?B?R0JDcXUzYzUxOGgzUVdZR3ZHV0pIV2d5SXB3N29xTk9BN1J0ZXBBVUsxWk5y?=
 =?utf-8?B?YktiT1FqM1E4Wkd6YlJhTlNVRWNvZCtQWEdnY0lpVWFmNUZYYjFaNWZ1UU90?=
 =?utf-8?B?a3JDbnQvTFlwM3RDN2JXR0YwSUE2YmJDaGF1MGhTaWU1Z3BrWjZiNlpTRVR0?=
 =?utf-8?B?amNuRElnbVByckF6VjA4WFVnYkc2dlU1RmpFa3kzSTRFdkFXVXE2Q3VtdWRH?=
 =?utf-8?B?eGlUV2RGQ2phamJPWEt0VTdhNDJJazJ0U2JHMEMyb1RyVVNYdTdGTkV4VkEz?=
 =?utf-8?B?MVdtK0tWTzg1dDhzVmxJZ1ljZDZ3ZGhZZCtTVU1vcENyQThRbzROdG11L28v?=
 =?utf-8?B?M3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9224.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkw3Qkk4Y0g5THR2VEFDRGRVZ2l2UzZKMFFiNWgxME9tekVZQjBWUlZaRWVE?=
 =?utf-8?B?ZFhqZ1lheTArSTM4ZG8vakx1SGFic0FOQzA0cGRiZFY4TUlLbFFNcUh4YW9o?=
 =?utf-8?B?aDQwLzk2dVJQK0F3K2k3UnJ5Rlk0NTFZcld3OGNNWDdRN21OOGxHZWt1MW9X?=
 =?utf-8?B?NUJOYkFROEJLZngrK3FpQUNIRlVFcjc4L3NkS2EwcTFXN0dKVmgzLzdFVTdh?=
 =?utf-8?B?MHVyN2txeW9OWTA1YVFpV1RCdWQrOHZBV1g4cEFpZjM0b2NJTXFONlZ6OS94?=
 =?utf-8?B?bnBERVp3elJXYVJPVkFTaG15dGN3dm5ZTlNDejJkUVVQRSt0eG1EWUNxcytR?=
 =?utf-8?B?YkZPOHc5b1FqNlJaUW91dSs5aHlDYWw3dEMzYVlVMkJQU29ZVGlYQnFEMzhK?=
 =?utf-8?B?SU9nT1lYL2JmUWR3U2prUyt0K2FFODhMSWhaWXdpcHo4OGZQQnQrd08zcERN?=
 =?utf-8?B?a0hZYzVhNGI1MUs5RmxXTUhKNlAvbEdDalJhRTY5SW9kREZZQ1ZaL1hzSllD?=
 =?utf-8?B?eXBvMG9uckFCRFVGV283SDYwQ1dSQXUyclpOakJQSmlzY1NQU0duYnh6bHBI?=
 =?utf-8?B?L3NHMXNMczJqdEFQbkNtaSsrYng3VmxtTm4yZ3hGUHZXeVQvamFPcFBsV2dx?=
 =?utf-8?B?ODFxcURMd3N4Tk5DcnRuYWVTQXlpZGpCd1hvQXEyTWRZcjZSRVZHVU5wWHk4?=
 =?utf-8?B?cEFsWGhaOTc5aUpWajNSL25sYWxvOHZYcGRWMEFSY24xczdPRkljdVFMcWZY?=
 =?utf-8?B?a0xjUjZDMmlzby8wejJhZW1WMk80d21OdldTTnRJQ1hvdXA5bXJrdG9icDhW?=
 =?utf-8?B?cWtnK1NxVGNYNHlCSEt0OWpMbXZFdFNnYXFWdjRvOE8ycE5zNUk1M3JZQUt3?=
 =?utf-8?B?dktLL3lVbmJITUduckRvVE9LZ3BHT3QwNmt4anZkajR0aTdlTUpIUXoyUkky?=
 =?utf-8?B?SlN2WWJOWVQ2UGNwRVZsb2ZObUIyZWdJUmVNK0ozeTllZCtvcEtwMnQ1V2xU?=
 =?utf-8?B?cVQzVTNlSzZZWUdvaXFOOWVtN2Z1SStxUk1Zay84OWplVjczRSsvcm40Vncr?=
 =?utf-8?B?dU5sNmRRY0tSSm0wRjE0T2VQRFc0UHRFWlZ1NHRtUldpam1WdE1nUzgxVStX?=
 =?utf-8?B?Ty84MnF5b1FTWk9vczkzWkQ1bFByVk5BL2I2dU1GZlF5QW1MU014dWplcnRk?=
 =?utf-8?B?dWt6UXRZV3VlV2hGREo0NWIzUHhCVTRadkcyWVpINXBVTk1pZC9sKzI2SlNO?=
 =?utf-8?B?ZEF0bFh1R2xBSnQvSWpiVStJNTZCWFhuS01hTFgzMEJSSXdRdXEwNUlERXVP?=
 =?utf-8?B?dk5DaFFZNWlSNWNXWjMyMmtrb0l4dnZ3U2svYVkrN0plVXZTdEVMelJ6TlJz?=
 =?utf-8?B?b3FXNi9NYndTTGZjbHpLcFRudTVSQ0JKeS9qOW82TzdXRUQ3UENhY2VleDdR?=
 =?utf-8?B?ekhoRmQ2QUVrVEdNNWpCdXFvYjdSMXc0OFYvc241R3hIT3VMNG0xTXBVUUV6?=
 =?utf-8?B?WktESXJWL2swRE1qbXF0TlErbkVseXc2eVMyV3N2QzYxSGdrRklza1J3by90?=
 =?utf-8?B?eUs2cTZEKytqN01QSEVBcmxSKzQ3RnY5b011NWZ0UXkrVkU1Wk5NREh1cjNj?=
 =?utf-8?B?UWhPZEVGVXR3V3krOXZqRUVMdDViS0UweU9lOXQzQWVEZzRXbVBlcDF4dm9Y?=
 =?utf-8?B?eGJoVXE0eWFnZlZ2R1hqejNOcVdpeVJkRC92MXAxeGs4N3Z0UzJQa1RLV1l1?=
 =?utf-8?B?ZzBBVHl3MFl1OHRKaHdTV0IxSldzbVJ5T3hBQXQxZnAxanpESUFtOEtYclZR?=
 =?utf-8?B?NXlpQW1CZy85aGxhcE5OVzYxOTBXMVczWHR0bUNZY1FPbVBGQ1VLK3lERFVi?=
 =?utf-8?B?TStZR2xyeFRzVHNPUW52KzlMRUo0Slh5VmZTQllWaXJ1dUtnbUF0OGtITUtI?=
 =?utf-8?B?eU0yZEpFVTZlQlVCWnZ3UGw4YTJjOE1CTHVvUmRDNmg2YkhlVURXMUdJdEQy?=
 =?utf-8?B?ZjQyUi9lcnFTWnE1T3B6MEdhZWpqejM4RngydU1SbWZLeUFaNGo5MHdmTzRx?=
 =?utf-8?B?TkVVY1ByVTkvTlIyeFkyV08wTVdzYVg3d2wwVndldFpXV3NHK0pTWURFS3RX?=
 =?utf-8?B?M3UwRnhYSHR5U3hYK3NxbnAvM2xPTk9JWVhZTUJlbHFXeW5XZFUza3dQUno3?=
 =?utf-8?B?SnRmbUphcXR1VmpabHZtckFNTVNKc3FFVVhkcHJ6QTQ1cnk2VmV1N1JCSmVG?=
 =?utf-8?B?YmVmZG9zNUExZ2NjNXJ6cHh4WWVFVk9WeGMxV3V0MThNRUNuam5kQTBFM1Rx?=
 =?utf-8?B?VEp6VE9aWGxxSURhNzJWOGtGSVJKakZHNklENWZKbDdLRysyOGMrNkJrNURi?=
 =?utf-8?Q?Ux82asiLxqsVTteE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2d2ec6-2600-48ea-d7f0-08de6d6c6548
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:02:26.1991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ridMPomz7MvWI8PsA+/hO5aZBFS7xdJgWyXpl3zK9b8oqKB2emH+pSs+XA2153j/xogLjQLMZvEX7m8uR89NSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12380
X-Mailman-Approved-At: Mon, 16 Feb 2026 23:23:19 +0000
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
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:chester62515@gmail.com,m:cosmin.stoica@nxp.com,m:adrian.nitu@freescale.com,m:stefan-gabriel.mirea@nxp.com,m:Mihaela.Martinas@freescale.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:s32@nxp.com,m:imx@lists.linux.dev,m:clizzi@redhat.com,m:aruizrui@redhat.com,m:eballetb@redhat.com,m:echanude@redhat.com,m:jkangas@redhat.com,m:larisa.grigore@oss.nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[larisa.grigore@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larisa.grigore@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: BA113148132
X-Rspamd-Action: no action

In FIFO mode, wait until UARTCR.TDFL_TFC(number Tx FIFO) entries reach 0
before entering INITM mode.
Failing to do so may lead to undefined behavior, such as:
- corrupted characters being printed.
- the device is not able to receive or transmit any character.

In linflex_set_termios, transmission and reception should be disabled
before entering INITM mode, as already done in linflex_setup_watermark.

This patch corrects the behavior that was previously addressed by the
earlycon workaround, making that workaround no longer necessary. The
next patch will remove it.

Fixes: 09864c1cdf5c ("tty: serial: Add linflexuart driver for S32V234")
Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 drivers/tty/serial/fsl_linflexuart.c | 45 ++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
index 768b3c67a614..c1d069dc8089 100644
--- a/drivers/tty/serial/fsl_linflexuart.c
+++ b/drivers/tty/serial/fsl_linflexuart.c
@@ -3,7 +3,7 @@
  * Freescale LINFlexD UART serial port driver
  *
  * Copyright 2012-2016 Freescale Semiconductor, Inc.
- * Copyright 2017-2019 NXP
+ * Copyright 2017-2019, 2021 NXP
  */
 
 #include <linux/console.h>
@@ -74,6 +74,17 @@
 
 #define LINFLEXD_UARTCR_ROSE		BIT(23)
 
+#define LINFLEXD_UARTCR_RDFLRFC_OFFSET	10
+#define LINFLEXD_UARTCR_RDFLRFC_MASK	(0x7 << LINFLEXD_UARTCR_RDFLRFC_OFFSET)
+#define LINFLEXD_UARTCR_RDFLRFC(uartcr)	(((uartcr) \
+					& LINFLEXD_UARTCR_RDFLRFC_MASK) >> \
+					LINFLEXD_UARTCR_RDFLRFC_OFFSET)
+#define LINFLEXD_UARTCR_TDFLTFC_OFFSET	13
+#define LINFLEXD_UARTCR_TDFLTFC_MASK	(0x7 << LINFLEXD_UARTCR_TDFLTFC_OFFSET)
+#define LINFLEXD_UARTCR_TDFLTFC(uartcr)	(((uartcr) \
+					& LINFLEXD_UARTCR_TDFLTFC_MASK) >> \
+					LINFLEXD_UARTCR_TDFLTFC_OFFSET)
+
 #define LINFLEXD_UARTCR_RFBM		BIT(9)
 #define LINFLEXD_UARTCR_TFBM		BIT(8)
 #define LINFLEXD_UARTCR_WL1		BIT(7)
@@ -140,6 +151,17 @@ static struct {
 } earlycon_buf;
 #endif
 
+static inline void linflex_wait_tx_fifo_empty(struct uart_port *port)
+{
+	unsigned long cr = readl(port->membase + UARTCR);
+
+	if (!(cr & LINFLEXD_UARTCR_TFBM))
+		return;
+
+	while (LINFLEXD_UARTCR_TDFLTFC(readl(port->membase + UARTCR)))
+		;
+}
+
 static void linflex_stop_tx(struct uart_port *port)
 {
 	unsigned long ier;
@@ -326,6 +348,11 @@ static void linflex_setup_watermark(struct uart_port *sport)
 	cr &= ~(LINFLEXD_UARTCR_RXEN | LINFLEXD_UARTCR_TXEN);
 	writel(cr, sport->membase + UARTCR);
 
+	/* In FIFO mode, we should make sure the fifo is empty
+	 * before entering INITM.
+	 */
+	linflex_wait_tx_fifo_empty(sport);
+
 	/* Enter initialization mode by setting INIT bit */
 
 	/* set the Linflex in master mode and activate by-pass filter */
@@ -412,8 +439,17 @@ linflex_set_termios(struct uart_port *port, struct ktermios *termios,
 
 	uart_port_lock_irqsave(port, &flags);
 
-	cr = readl(port->membase + UARTCR);
-	old_cr = cr;
+	old_cr = readl(port->membase + UARTCR) &
+		~(LINFLEXD_UARTCR_RXEN | LINFLEXD_UARTCR_TXEN);
+	cr = old_cr;
+
+	/* In FIFO mode, we should make sure the fifo is empty
+	 * before entering INITM.
+	 */
+	linflex_wait_tx_fifo_empty(port);
+
+	/* disable transmit and receive */
+	writel(old_cr, port->membase + UARTCR);
 
 	/* Enter initialization mode by setting INIT bit */
 	cr1 = LINFLEXD_LINCR1_INIT | LINFLEXD_LINCR1_MME;
@@ -510,6 +546,9 @@ linflex_set_termios(struct uart_port *port, struct ktermios *termios,
 
 	writel(cr1, port->membase + LINCR1);
 
+	cr |= (LINFLEXD_UARTCR_TXEN) | (LINFLEXD_UARTCR_RXEN);
+	writel(cr, port->membase + UARTCR);
+
 	uart_port_unlock_irqrestore(port, flags);
 }
 
-- 
2.47.0

