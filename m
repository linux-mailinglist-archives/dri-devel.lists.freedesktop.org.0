Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A94A68627
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 08:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B8010E2E3;
	Wed, 19 Mar 2025 07:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="kPYyRtH1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023088.outbound.protection.outlook.com
 [40.107.162.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC1A10E2E3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 07:52:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/5WZLSax/VzQmKOjXH6qUBbaHmNvHwrwyFbJLdheRSj5KnYczNLPVZGU3oj4Hwb0d5hdb+C3AILH/CTH7eV19nI2lmJbCXWtL7nuD2wxT1xN8N/KCDjKcr/iFXaE8zH3qnhTdySwYq3deleU2S6pxAZ1hLjCpxadHj+07FiL868fOz9FeHRe4oXbJCIw2eJ7Loy8/+sKtuqONTrxZ7UK2MgrBM/txy15a4AFheit7+obUJAb/3j8QZCtCeFisDpB9wtwEVGq/uqE0+4ERQWCQERJh6S3pWdivSlnKJuhzsRr52pyARtBGu1j/p4TTBWEiVdIvrBeZ/RycvgdYCFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPESzy1K3lUPYi4FWormCWCnOZcrfT7AR8cTem0xXjI=;
 b=tsS4eT6g2ZMQdwWNo+9AA11Q1HWG9+hBpTDckH7tPg5BysiXDTE10GxsMnQXTLohUJjVzfaDOh5q/gBDBr/rQ/EAZ51BbCc8m0n6zBgGbPagx8nXJT1ox/dxNw+7+/Ka4FzCvDGgQnmaaBk1R18g9+BoPxeGp+t8zA1RKDxeoPWqLQ1R8nhLI0mEiyRqPrVJobTR1aMz01upuSIeNB0wolbQK+RXGZBBsIe9zKOCkN3FyiMMn8Gg6O0/z1JqgY+X+GgiZB0NyhTuxHb4RQBY22JK1D0+4XafuBdZHGMT/bNC55hNEOUgqL/Il/oU8LHOIFHBLpkMPaTgzIgG9yjbug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPESzy1K3lUPYi4FWormCWCnOZcrfT7AR8cTem0xXjI=;
 b=kPYyRtH1jyTUOq1VFiD8F4CN8TzAOf05etqiMf9Qbxo33jMmDZ9jNK5DTpDIDk9Lu/uV0Q3PnW1Jew0UA1gDyiCXpcQ/ygBlJcvsK2r89vwG0EQ29KbpEC7PDpDcJ0JAnl0ScssAqszaCjwAx5J5/OvpwhPzTROiOHHnt3DkDS8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DB4PR10MB6288.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:380::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 07:52:41 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 07:52:41 +0000
Message-ID: <15acbb84-efa1-4ca6-bbfd-a4c3f17a7d19@kontron.de>
Date: Wed, 19 Mar 2025 08:52:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: imx8mp: HDMI display blank/black problems
To: Saravana Kannan <saravanak@google.com>, Adam Ford <aford173@gmail.com>,
 l.stach@pengutronix.de, marex@denx.de
Cc: mailinglist1@johanneskirchmair.de, johannes.kirchmair@skidata.com,
 Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 alexander.stein@ew.tq-group.com, andrzej.hajda@intel.com,
 catalin.marinas@arm.com, conor+dt@kernel.org, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 kernel@pengutronix.de, kishon@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, p.zabel@pengutronix.de,
 rfoss@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, tzimmermann@suse.de, ulf.hansson@linaro.org,
 victor.liu@nxp.com, vkoul@kernel.org, will@kernel.org
References: <20240203165307.7806-1-aford173@gmail.com>
 <20241025080544.136280-1-mailinglist1@johanneskirchmair.de>
 <6d039ecf-0e48-415a-afd8-6bfce60081ae@kontron.de>
 <CAHCN7xKevGWipBSch6gKVeJRT9Zb8QTchhxg3c=96XhnAvnjZw@mail.gmail.com>
 <CAGETcx-LGZ1k-seh4LkvCobsxUk67QK40swiQvH6Wrzs0Log0A@mail.gmail.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAGETcx-LGZ1k-seh4LkvCobsxUk67QK40swiQvH6Wrzs0Log0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::14) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DB4PR10MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c18fe7-8968-4bba-263d-08dd66bb0682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUo0L3BnaHVvTGNRQ0FJODdXd3ZSdk1vbng0elRkdDZ1elpLd3FNcWJObzBY?=
 =?utf-8?B?bHp2d2IxR3lCYjNmempWaGI5K1lDZkl2blNYcHdtNmdLYWM3ZldRUUFPQmtm?=
 =?utf-8?B?clRYMmNMZGN3TzhpUWNJV0FEdWd5Q2dhRG5iNWIxZ0tQbGw3c2E0a2NTUkp4?=
 =?utf-8?B?NVVnZzVNMVhhVWlrWnpjL08zUDhGdFlPQmt2UHQ3SlQ1cTJSNlVPTk95ZmRK?=
 =?utf-8?B?eHJKcW5ENVd4eHBtMitGZnRKUXBsNWNVd29zU2pTNVR5WjRkSjdoYUQ1REda?=
 =?utf-8?B?M1VJYkd4cnJLYWpyVWZGNUd6ZHVOWlhXR3hudTZXQWt0UWw4dFdPcEVEN2ZR?=
 =?utf-8?B?MjgvUzcvMW5VQ2RxUlovOHg5aVFkN0cxVDVLYmZ0K1c1UCt5ME00bGFEYVJ3?=
 =?utf-8?B?VFJFMDM5cFI4L0o2cTNJU1pXMWtqRk41Y3NvdFRGL2ZSU2lDY1YyVWZhM1J3?=
 =?utf-8?B?aE8wTnF3NGJOYkpuV3hQaXBjMzkwOW9sRlZQT0R2dGJBRDRPTWxvQlFzcUts?=
 =?utf-8?B?NkhET2RYNzduOEdBc1UzajR4ZkozS1ZqVEFJbUQvOUVOUWhsZEdIZkhoTFpT?=
 =?utf-8?B?Rk51WnkwSkROTG5JTGZrV29mTEt2bTZxZVpYbm0rQmdTRGc1aG5aODIzTEZB?=
 =?utf-8?B?alFBYWxMWkJuazdhTXdxRHhMT3lHNFM2K0FjMkN6Q25xMVNMR0Fkbkl1d1BI?=
 =?utf-8?B?UTV3TzB0bVZLWUVqZWxpVjZlOS9JengxcURDR0w2Sjg4OWgwVDJRMitzSnRY?=
 =?utf-8?B?WWtQRzNNYkxYazJ5MUpLN2FrY05PK1h4YkcvM1pxV2NqOWRFaUsyckZmdXJF?=
 =?utf-8?B?ZU81SnZqRDEwK2ZobzZRTnJMNDNpbHlXS28vSU44VUU2UHBGV1k2L2krSWpL?=
 =?utf-8?B?cUgzMzQ3dUFEdm5vRVFnbkxuTG10K253dWNaUTlZRkZvV2ZybmhLVXdMRVBT?=
 =?utf-8?B?NnBKZldPY0xrN0c5Qy8yS3ZzYmR1UFg1L0lid3FoajJEcHZQb3pieFdVRG02?=
 =?utf-8?B?aG9HVUp6bU9nOFB1UkN4a0puUHB6TG5sZmJBSmlsdEhEamc2aDNNKzJyTmFE?=
 =?utf-8?B?VnIvZnNnYWpZcDV3dmljKzFIOCtXdDlsUCtsNWRsdy9UejlaUWkrMXNTbmZE?=
 =?utf-8?B?UHlHMXZlRDJ3eEg4ME1tam52STU0b0ZwYy9TWHo3S1FqelZzV01Ud0U4Z0tY?=
 =?utf-8?B?U01oVzdTMTFFU3lmRkJjbEhQOHE1VStEQlplZXhQQnlsSTV6QzFZQjNqQkZD?=
 =?utf-8?B?N0h0MlVCSXBtYXJCL2tGTUZZYzBrNjRnck1VajFtQUpwUjlSYjcvdUJibS9m?=
 =?utf-8?B?MzRTVnBFUXA4a3NBTmcweHdlZnRYb0EwWUFDS2xMUTBDMXZScGRqRGRLZnZa?=
 =?utf-8?B?N3gvWG1NWUlqYnNnR3NNcm9QYWRGVE4wbVZPbm9QMHl1LzA4TVlqaFVNemtY?=
 =?utf-8?B?WHB0cDI0M293WWEreE9hUlpOakw1bjNUVjRvV0RjSlhkbzJTdFBRM1lXbldu?=
 =?utf-8?B?bVo2QThaWSt2NFlNOExFNnMrZld5dTF4K1pRTTN1UGVRV2d5NmVhalEwYUlB?=
 =?utf-8?B?SmM3dVFuSEtsdU5HZHVqaW10dEVZd2JSVEdsVHRTOFYxTmNHdXR0ZjNEQWs5?=
 =?utf-8?B?V3FGNHN5eWdRclRGMDc1YkdFQmpJY0hBdjRnbFNsK3ZjMWxhUnNsQkY0ODNx?=
 =?utf-8?B?aWVoZXBGZmN0czBJU0FkS3d3NU9hRCtDQWovZTdXU201MFQ3VllrVzM0OXFV?=
 =?utf-8?B?ZkRxU3IvTXcyRUZLMXZOTVJGY1VVUzM5ZUJnWUtkVzl2SjNMR21IanhPRnpr?=
 =?utf-8?B?dXg3MGY2R0Z3Q29JampybDQ3b0plUVNKSmtKN0N5NzJ6MUNaLzBoK3p6WGRw?=
 =?utf-8?Q?7F8FLaCl4JZNe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVVTN29kci9FZVlMM05Jdi9xRytyY2RFcWpuOElLMTVYd1lQMEVFaXpkSERW?=
 =?utf-8?B?L0lHb1hQZlJIUkFwWWdIeFhWRUhJbU1yYmJaWERNWHdtc2xXM2cxT2hjZE9N?=
 =?utf-8?B?Qm92VExVZTMzNzVSak1wN3M4NURFSU95Q2lLNTh2SkZ5R2xsZWx5M0NYVTlN?=
 =?utf-8?B?NHI4L3NSRUtPVU9Sd0VRL2hSektHVTJjK3prZlJRVGtHbUdCQ0xEL0VtKzJh?=
 =?utf-8?B?VlppM29rNEtOTnl6dW9Ua1FWTkhJS1RKOW90T3RmVmpDd0djdTErb2JIenl4?=
 =?utf-8?B?OERyODJUTSt4ZEpVV1VRYzNRZWZEZzdwNktTRmFQMG9DNnNFcWp3SStTTjAr?=
 =?utf-8?B?eGh6OXB3QzN6dmlPZ3J0YWJ0SGRPL3YzcGswSjlHSEJJendOQnZNUnFMRUw4?=
 =?utf-8?B?Q29uUGNzRmNlNk85UzZmdytMd2JFVmZlY3FyWGMraGw5OEJiQWk0VGl3OWh5?=
 =?utf-8?B?OTlia2hwS3ZHMEVJeHNEYUJVeXhVa0JOSjNyQUtDaTZETkkxbDFGdk5XMzdx?=
 =?utf-8?B?eXNMZVJIT0ZrSXM1V2dTNHMyRnB3c1g3TlN5M2VRY1dDRGlSL0pQS3E1K21n?=
 =?utf-8?B?VTN5Y0FPUzhyWXM5SkV4VmYvUmU0YjY5RTFxRXFMYy9ON0prMWpOZmNIVWhr?=
 =?utf-8?B?Mit6ZytFVkxDMEgveGgyOGxQL2tsZ1VOTFVlTDVSRGZ4MHBtYm5UWEFLUldu?=
 =?utf-8?B?b0poa01CV3U1STB3Q1FnVWR2OU01QjJ1VGFxYkNTYkhvYXNYMjZ1eTczamd3?=
 =?utf-8?B?MDlzZGRaM3k4VnNWWnJ0UU9CR3hwaUI3TlJENzE4SXQwTHBBb1R0bVEzTVRt?=
 =?utf-8?B?SGo3VU1idGZ4WEFlT0ZNd2FmaGY1U2YzMFVEOWNTV1lkdlhLVGZjWUxjZ0ho?=
 =?utf-8?B?N1VyWW1YMnlvRDEzU1FqUkFWeFIvYW8vcGh1bVdwZmVqaFJ2NXBkU3VzWlUw?=
 =?utf-8?B?elBSMm1JSXFXVFRGbTVGOVBEZjlQaE82UnREWkNvTWFsZVlvS3dSd0pSS1lF?=
 =?utf-8?B?dE5zdEZwZkdkY2tudnE0SDVJK1BNOXNoaFIyMmtST0xCb2g3c1JCN0VWOVpG?=
 =?utf-8?B?KzRHL2lYQ0pGSXd2R3NhVUNGME1hdE96eFAwNUswWFRtUVJMK1d5Y3dmSVpn?=
 =?utf-8?B?K0E0bjI4ZUVpaUhYRmthWjNOL0ttR1RzTnBISThMNG5WUHBJMU5JT1c2cGNu?=
 =?utf-8?B?RXBqdUIxZ3REelJlVHBZMUtYMWpIWEtjeHgrdnAxcER4cGVmdVBURmVjU0Vo?=
 =?utf-8?B?dTBjUjNuWTRCQzFIYzg2TmpyUVZIa1F4STRnY25FNk1FSE8wUDdaNDhnSXBR?=
 =?utf-8?B?K3B6eGgyTVZuaVgvS0pKSFR4YjVON0NEOVRkZkJtWTBuWGNZaW5uNk94cUhB?=
 =?utf-8?B?NENtTGc5WnNOVTUySHNUT2ZsNUg5YUQwQkZuL2s0TFlFYm9na2ZOTWZlRjlo?=
 =?utf-8?B?bmppVzJIbE1seFZzbWhObisrdEFXTUttazhpZWtFbDZoZUtKV1NHWmc3WFB2?=
 =?utf-8?B?dGtrSlU1TEVSYklONmFZN2ZBMUN1d285TXQzZEliWXZXTjRPWUVDc3dIRUtN?=
 =?utf-8?B?MGdraWJzdUJGRmc0N1p2aTBxQXFjbkJOQVh6YS9ybE5OcTVCTTViSSs2STRQ?=
 =?utf-8?B?cEdHU0dTYndLS24xcXlTcUgxYU00akZDTjE5T1VKdlVhSy94VG5tQzIwNVNp?=
 =?utf-8?B?MWRWNm9zK2Y3WHhIeFREeGRoNWV5cGlnTmdtYWhOVEpyd2tFMndGcjZ3NlY0?=
 =?utf-8?B?MC9Hb28wQnQ4MGF1VUdUNnVIdTJOeDcwdGVTcDdPRnJxVXVtb1FBSS93TU5J?=
 =?utf-8?B?WllrTWYrN1p0TVJqdEhpcXZHZ1ZCY01CTkV0blMxbEN1RnlwSWZNQW1CVXR2?=
 =?utf-8?B?RnRDSFdKSUduaEpIOHRmelgzVFpNYzJJbGtaaTVkbnhiam9wWEtncGhrZSta?=
 =?utf-8?B?dlpDOEs5NVcraGsyNmxNeWJnRGpiTlhJSUwxQVM3Zm9zTUJBYXg1d3NKUXBm?=
 =?utf-8?B?NElDa3p5ZTQ5UTR0ZmR4dlN6bXBPK0lzMlRENnhOa0pTYmRwcElPSVpiQk1S?=
 =?utf-8?B?R1UxckthK25oM0htTlhNTWZjbUR0ejkxcVhqd1Q3eTVhcUtaVTF3eUFIT0dN?=
 =?utf-8?B?ZWZTbCtza1c2NWh5SjJYc1k0akpFTldNci9GS1RubUZ6ZVljR2hXMk9uWVJG?=
 =?utf-8?B?N2c9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c18fe7-8968-4bba-263d-08dd66bb0682
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 07:52:41.3083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DftqVdmch4m7BE0XZPpLvNfNT3XTIrcptXdyzl2FA30OoU740hdmogXLy5BTTHYYy6+NNHpJQOGnYifzwTqASpgTSyb7ULfSf6lhUW0cJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6288
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

Am 30.10.24 um 9:20 PM schrieb Saravana Kannan:
> On Wed, Oct 30, 2024 at 10:28 AM Adam Ford <aford173@gmail.com> wrote:
>>
>> On Wed, Oct 30, 2024 at 4:01 AM Frieder Schrempf
>> <frieder.schrempf@kontron.de> wrote:
>>>
>>> Hi Johannes,
>>>
>>> On 25.10.24 10:05 AM, mailinglist1@johanneskirchmair.de wrote:
>>>> [Sie erhalten nicht häufig E-Mails von mailinglist1@johanneskirchmair.de. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> Hey,
>>>> We had some problems with the hdmi on the imx8mp and wanted to leave, what we found out about it, somewhere for others to find it.
>>>>
>>>> The problem was that our hdmi display sometimes stayed blank after hot plugging and sometimes at startup. On older kernel versions 6.6 we did not have the problem with the not mainlined hdmi patches.
>>>> We tracked the commit down that introduced the problem for us. It was the following “driver core: Enable fw_devlink=rpm by default”  https://lore.kernel.org/lkml/20231113220948.80089-1-saravanak@google.com/
>>>> So we switched back to FW_DEVLINK_FLAGS_ON via kernel parameter. Don’t really understand what the problem with RPM is.
>>>>
>>>> So, this information is just for reference. Maybe someone has an idea what is going on here. And how to fix the problem in a more proper way.
>>>
>>> Thanks for investigating and sharing your results!
>>>
>>> I'm seeing the same symptoms and previously found out that this is
>>> related to LCDIF underrun errors. See [1] for more information.
>>>
>>> Adam has also started this thread: [2].
>>>
>>> Anyway, knowing that this is related to fw_devlink=rpm is really
>>> helpful. I just tried with fw_devlink=on and wasn't able to see any
>>> issues anymore. So this confirms your findings.
>>
>> I was off in the weeds thinking there was something wrong in timing
>> and/or a race condition around the PLL or something.  This is good
>> news.
>> Please forgive my ignorance, what does fw_devlink do?  Is there
>> something we can do in the driver itself to force its behavior?
> 
> fw_devlink figures out supplier/consumer dependencies between devices
> and creates device links between them. This ensures proper
> probe/suspend/resume/shutdown/runtime PM ordering.
> 
> fw_devlink=rpm vs on means "enforce all of these" vs "enforce all of
> these except runtime PM".
> 
>> adam
>>>
>>> I hope that some of the driver framework and runtime PM experts can help
>>> to find out what is actually wrong and how the correct fix might look like.
>>>
>>> I'm also CC-ing Saravana who authored the change from fw_devlink=on to
>>> fw_devlink=rpm to see if they have anything to add.
> 
> When fw_devlink=rpm, you'll have device links created between
> consumers and suppliers with the DL_FLAG_PM_RUNTIME flag set. So
> before your device is runtime resumed, it'll make sure all your
> suppliers are resumed first.
> 
> My guess is that there is some issue in the runtime PM handling in
> these drivers. I don't have enough context to provide further insight.

I bet you are right. I tried to have a closer look but unfortunately I
didn't make any progress.

The drivers involved are lcdif_drv.c, imx8mp-hdmi-tx.c and
phy-fsl-samsung-hdmi.c.

As we see a "LCDIF Underrun Error" with fw_devlink=rpm my first guess
would be that the suppliers of LCDIF are maybe turned on in the wrong order.

Lucas, Marek: As the main authors of these drivers, do you think you
could help a little with further debugging? Any ideas?

Thanks!
