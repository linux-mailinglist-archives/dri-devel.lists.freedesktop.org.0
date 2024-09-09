Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D85970EC0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C1810E2DD;
	Mon,  9 Sep 2024 07:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="Ec7jXltr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2097.outbound.protection.outlook.com [40.107.103.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB4D10E2DD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 07:06:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ly2cFKVoplIThIkG+yFaOq8NGRjqbqMbKtId/Tqjtye/Aj9G+vAXB0gLGCDL9qqT60gLFvqbENuslU+IklA4Foz2P1IY7jUIjRHQr7KEYU2nTXXYz8Z2kOZVf1lblTUhp78mAx7b1GVxQIrhErvz4Fiqoyx2v48jO3+wK/TeI/V10JeAupQBK9WB3LbQIX8TRvIkIL0kXbzv4nmKYP3FWZ6jAUIjF5sLwknmBie1KI4ua9jVStxLFd/oEtkJIp/Vhn4E4XhoPiEGn/sBQnjvrLYnMlaK/Tx+bTxbnnp1USg2ZWsyxC0swS8zkHf2EnMOZ+rFvMg6/aH7zXYF5hhAng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzpSQPACIgB3vOQG3IcQ8oJtXdzmm0c1QFktU1A9JSU=;
 b=ljwVFwa5GEshY+1BphiGVzVsepQN1cT6Ag089CFH5P9OqULwvjzM36ITOajpsRpASY5jT7rgZt8SqLlAmqZUnOlS2HjR1Ptqxpqi6hND4ZGcSogjQRVQjHVoGf78DiVAL0HpX9+xL0i7CvxCdzB08pQri/poS162r4MzGuL1mB8FdjUOKHZUs5UOnEGYGRe/Db88POML2zuxtoNxmnXI6KZs89w5gMsRlFaVFxr/4Sj6vbXiDkOie3OAdqXFiXp3+N4rzG9N8iFyTsBbCXO1/Le4LjQdIF15lrE88Ukgz80xU/8x17j7rLZ9gFp5hBapTz7HmzpLYWwzHVAUNJeB4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzpSQPACIgB3vOQG3IcQ8oJtXdzmm0c1QFktU1A9JSU=;
 b=Ec7jXltrmgIUebQDNe4u7I/s6m95BfYRPdWQFogK192T/VLGk5r7WhZC8zmnva7bbcTIIVT/+FpPGiwkiskkVdcM7Byh0WfHLzWbxE9BlAmNB4nBwpoGse8fEhheaLCsoPlC+ExEWfYPiIoV3E8LcIqltz5ylzZCvzLsrPQlXhQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AM7PR10MB3858.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:17d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Mon, 9 Sep
 2024 07:06:27 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%4]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 07:06:26 +0000
Message-ID: <8cfd3052-c85a-4235-b9b8-6d2929e9e455@kontron.de>
Date: Mon, 9 Sep 2024 09:06:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: i.MX8MP IMX-LCDIF Underrun Question(s)
To: Peng Fan <peng.fan@nxp.com>, Adam Ford <aford173@gmail.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dominique MARTINET <dominique.martinet@atmark-techno.com>
References: <CAHCN7xLL4hrTK1OqsqUa78cdp9ZcG0sC+cO5QKC3x_Y9-QVzSA@mail.gmail.com>
 <01d578b9-e42e-4767-a33f-b0892a602e23@kontron.de>
 <PAXPR04MB84592D4026EE5EBFBCC946A688992@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <PAXPR04MB84592D4026EE5EBFBCC946A688992@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0253.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::8) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AM7PR10MB3858:EE_
X-MS-Office365-Filtering-Correlation-Id: 803cb710-5dba-4635-bcff-08dcd09debe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0svb2pjNFIwL0gyb0MzL3E1dlpObVNlYjBBUW5wcFpYb3hNVDJwNldXWUMw?=
 =?utf-8?B?WmhLanpWZVhaUVlVanZpVEdJSWxhUGhUVVNZVzlCbkZXajJFUHNZdW01cnh0?=
 =?utf-8?B?eVRTTXpLU2FYVGdMYmVna25yR3NaSHpCZ3M1NS9QUEN5ZVBVQnk1YTljNmN6?=
 =?utf-8?B?V1ExYldxT25KeDh2K3JjT3NzRnZ2MHg3T205WUZUVVQ3ZkVWK2tDb3MrV0R2?=
 =?utf-8?B?YVlCY1lVeERIcVdYRWlnOURSWk1mRUpTcXZRRklqWG5LRE9JaHl0TDVhdWda?=
 =?utf-8?B?VDh2aEVaMDI5RGNlMlR0aS9ESGFPUW5XTGJMWXVzb2Vxbmtia0lCZkdCeXB1?=
 =?utf-8?B?RVlpMUw4QnBEMTZKNjYwVUVMR0o0N0NSdjMxN0pQRjBQRmZPNTZXejVKMDB3?=
 =?utf-8?B?MlBHTU5lY0J4ZWh2RDFPUUhtSVlNSmdBcTlJTG5lbzVpNE8yY1krOEFMbytE?=
 =?utf-8?B?QjMxMHU0QWZPc09hanNrTkZmR1Y2aS9PQUdnak5wUThoTVYyVjRjTzdIQ1Vm?=
 =?utf-8?B?dmVQa1J3dkFsc1BDQ2ozUUp1UzhxNEorWmNVUXl2TEtMVlVHTXl5aWp1N3lZ?=
 =?utf-8?B?eS9ZN1JIZHBuODNFcWIyQ1ZmWk9nNHZJMVh0TVBrbTJTZmNmTUZTVWJjcFNY?=
 =?utf-8?B?U002RmNoeHdKUkVZblhqZGpWZ3RlN3l1QlovY3ExWkFIRk9ZVStxcUM4U2I1?=
 =?utf-8?B?L0Q1Zjgvc2N5WlZqY3VZdVNoVG5NbTd5eUNHRWx0czM3Z2w0eC9ucDNsaWtY?=
 =?utf-8?B?bzUwcXF1eGZQQVBhTUw4K0xoY093aWhWWnc2S0k4ZUUxT0FkNGZXMjVWdXpB?=
 =?utf-8?B?aVJuN2ZSOE9HQkN5TnZHRkxNUm1PdVozamdFTi81eHVJWndCVlBoQXRsWm9J?=
 =?utf-8?B?ZGhDUW1CNnBwTmpmTEl3N2t4cDRKYUpGb0RCWlRnNXYwZVphczhoaFA1Ylo1?=
 =?utf-8?B?eU8xeFVycGgvMFM4c3hCU2ZBK0JXZjZmWGdhYVRkZ003QnlaQzdXbFB0OFNK?=
 =?utf-8?B?cGxqejFZQmt1OWx6Mkd1ZmNZcWp5UVRSbkJENzNSc2tubzJKVzBvUHlDcGpC?=
 =?utf-8?B?bFk3YzFURlpLcnJuQ0tKUG9KcGExODc5QytpUEIwRnNCMUxlZVEreXc5bk4w?=
 =?utf-8?B?YXJaVDR3V3g5aHZjLzBXVHhwMVEzUTV2QWxlVHNXVFp1VWk5LzRMdUpVU3Z4?=
 =?utf-8?B?c1pLbDZOYzNmKzBwaTJVUTc4ekNNUEdXV0VneUdsaTZYOUdtaWNCcy9QNlE0?=
 =?utf-8?B?QVp4OUdVQ2JRMEhUeGRmandlQW53cC9GMDY5WlJXYkNmYUp2Ylk4WVlGY1JH?=
 =?utf-8?B?NEVhbUVQd01TYWx2Y0tXbURLckVoSVhYUWNVOWVMRUdPZWtORHlsTldMRFpv?=
 =?utf-8?B?ZnB0ZFdyM0l2R1UzaEEzZ2NZRE5JVEVtVEZpVFU4RThlYzEyNjEyTWovVW9M?=
 =?utf-8?B?TU5ldVZYOTlkZWZmaHpJa09FZXZZNUpPd3VqRWpSZTBpT3RDM3UzZVBudzlK?=
 =?utf-8?B?T09XeWxqQS9ubHRJaVR2MVl1WFcva2QwdG9BSFU0b0laR1BCbkRXZjBlK3hN?=
 =?utf-8?B?cllYbjBaQUdxaTNhbFBBTy92YkZaeTZOOWJEa2gvWElYeGxvNU1ZRnFEOUZo?=
 =?utf-8?B?RHY2dDBTNHJxL2U4SUM0RElWL25oczhWSG1PWmgyb1h1MkoreW5GVUhNNXZU?=
 =?utf-8?B?eGlvSjFnQVZNWit2Y1FNNzViNUM3VThCWGFyTFFaYlNnSEMxc29wOTJxWG9E?=
 =?utf-8?B?ZVd4OGppdXl1bHYyb2ZRdUNIckVVMlZ1T2Z3a0JHaG1OdVVoWCt4WXFkTUFM?=
 =?utf-8?B?a01hdEg4N092ajRlSnRnVkU1TGpXSUJRS3JEbEJSdndQSGNiN214eWlZeEt2?=
 =?utf-8?Q?lDRGCI11dyinX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020); DIR:OUT; SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WktpbHFmVzY4a0hqMWpBZEFMb3NQMzgyeC8zc0hKcjlDQWhIMDFPT0dYWUlp?=
 =?utf-8?B?eFNKazMrQURyTjQvOHVjclU4L2F5aGFsOFhLZFE2L3FMb0NLK1pGNEtUc1RB?=
 =?utf-8?B?KzVNa2tQTlluYkl4eFNldTJocmNBaDczVGFnM3RZSUtEaXdxai8zQVhqTXdp?=
 =?utf-8?B?TDVYdHZ3azdPVm5IRGxJVWk4Y3paUFF0bXB2MGViUDdwYUxrWjEvYUhWdXJr?=
 =?utf-8?B?TFBFTGVqQUZFYVlPdHZjM3R2ekU3OFptckVndXVhSTBnbU9lVjhUN2lXdXpL?=
 =?utf-8?B?UG5pYjRvazBKNnNkUTNIVEMwS0htR2kwQ3BscTFGcFl3UXY2ZHJybUJKYXJH?=
 =?utf-8?B?VmdYWWM4c0ZTSTk2ZzhiSmVVbVBEaDZNdFl4d01tSzUxRXJmY01wRURlc0No?=
 =?utf-8?B?UlNWS0hJR3JGdEFZYnlEREtHa1hScUhyc21MdlZmMDhFSGZFOU9BNjYrd1Fx?=
 =?utf-8?B?VklteFk0ZVJjYUlJcnROdnROajZjTUg0c2pGaWFxT2trWkRaVUcwTExicG9z?=
 =?utf-8?B?MGRET3VZUWpORGd0NGlSa3YyaVlhRDRaUFJ5Zm4zYndhUFhWTUJnTnRRTHVx?=
 =?utf-8?B?cHAwaE1Oc2pvdmNrRDJFdXluRVlyaUJIKzFzQ1N0SHR2SHlGWnJMQjJJTlFR?=
 =?utf-8?B?d1NVMHlNNWtQV0V3SEpXdmM5SmNQTXBCUlljSUlOaGxVcDlDbmRFc3lIdnFk?=
 =?utf-8?B?a0pHaDd1cmNzR2hOS2FqRVRkNWU5c2hmU1BsMm5ydlQ4Y0VpRUhleGloUDJJ?=
 =?utf-8?B?SDJLeFZVdkRiYXlMWWxrYmkyRmFwZU9jOEhaYXdsN2dEbWNvQW93K3lxOXNj?=
 =?utf-8?B?cTV3VkFEUlRsRStqRVhXQWRJZEt2K09iYXIxOGtpL3d1R1J6bU1lcDNpcFhp?=
 =?utf-8?B?V0x0MS9QZXB1TnRkZWxnV1lnQUlaU1Q2MTUrN0xQeVhZbytsVmY3QWtnVlNx?=
 =?utf-8?B?UXVtc2lPbEQyaG9qVE05N0dCTEkwSHRkU3M5c1BlVkNiTXd0dS9YRllUVzBk?=
 =?utf-8?B?RmM2SjFZN3ZOd3VLQkVyNlEyRVB0SW1PLzI0SWl4Q1ROQ3hidEs3M1E4TlY3?=
 =?utf-8?B?bFE4dm1jTGJDR1FiZUcvbHpGNXlDWjFqdE9WR1hsNHpkdlFkbzk2cjBGZ093?=
 =?utf-8?B?dHhacnArNkZSeEI2R04yYlJtbWozQWlMdG5oRmVtVWVBUDhwOXc4K21CVWpt?=
 =?utf-8?B?b1QzOGFpekFWbHdXeDlOcUNCVE9GQjJxYXdYVXlnQW1yRFNubERYQi9LTTBQ?=
 =?utf-8?B?ck1hWmpnY1h5NGVjZnB0WEdFc2VlSzIyNUs3V2ozVUc3ZEYwUUk2bFB0Nzl5?=
 =?utf-8?B?SE5aTnZ1RXBITHZPZWsrWndLRlZ4UDgzUGFja3RPUVZkeVBmU0psaGdrcy9H?=
 =?utf-8?B?ajFrODRwbFNsWjRjc0Z6K3pwenE5bzZVbVFLWklpVW1OWEFXbjI2Y1BBNGU3?=
 =?utf-8?B?UjRRMmJkaVNWNDhlV3FWY2U3ODBCc2loc1M5V29FR2RpOTlUNEd2aCtlbldr?=
 =?utf-8?B?YnpJc3pKVUFQRmhwTmI4Zkw2dnJoVzV1UThzb0xNZE9nTnYrN2ZTTzdsRytp?=
 =?utf-8?B?YWlWaUc4cThRaU5MTVluR0xMUUpCbW5ZZlFEbUZzazlNb1IxUHNGaVRWMG5W?=
 =?utf-8?B?TGMrSHRja05jTjZMeEIxSzNjdHU3d3hxTDErU0lWeDg5Wk9KbGp4ZzdrMXgx?=
 =?utf-8?B?V1g5VUdLSTFXQjVaeWhUWUt4aDVoeWN2a0c5RkVrNGlKSEZYLzE2ZURMSGlM?=
 =?utf-8?B?L2x4SkR6UTY1eG05bklHREdPNEEveHNnQzhNUWpJdmdLTk9JNEJacXZFYm9C?=
 =?utf-8?B?bGk2VXBWMnphZ3N2dGJhOTVMREZRMTJxVjNmY2NST1hPM2dhV2xKdS8zUjV2?=
 =?utf-8?B?MktjZEt6UG11dUJKUnFxTkR2djFGdTBJd0I4TzlvbWF6NjJoUm1UNXJEb2JO?=
 =?utf-8?B?YWl0WHo2M1hBK2xESy9uZTdJaEdsUEN3bFl0NVRkVEowZnVVTjl3TW1La2FY?=
 =?utf-8?B?eWpuUUhFb0NYU0dpUHFnYnZKT2x0bDU2ZFl3aWo2WExKR0I2aUh3Vnptdzk4?=
 =?utf-8?B?TVZNcmIzT3hnWEdqNUppcWQzUVpSY0JUY1lBbWtCKy9CL3MvdW9UQWl3bVlD?=
 =?utf-8?B?OGFuSUhlZjNsMjF4SGkzckVBNnVQUWZqN3dBZ3N4SllqRjJGZXVlalkrcHhI?=
 =?utf-8?B?aEE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 803cb710-5dba-4635-bcff-08dcd09debe5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 07:06:26.7832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQuLB5gcLtx8+uBk7cOpr/hTfmcXndK4V9eQnxz087xJGEh3K1pQeAa5LtyDblSxB1lhJYv9GPsX7MEgTO9AEgei4gsTsZgeYvYyBUjZFno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3858
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

On 09.09.24 5:00 AM, Peng Fan wrote:
>> Subject: Re: i.MX8MP IMX-LCDIF Underrun Question(s)
>>
>> On 06.09.24 3:46 AM, Adam Ford wrote:
>>> I have been testing various settings on the HDMI out of the i.MX8MP.
>>>
>>> I noticed that sometimes my monitor would not sync, but sometimes
>> it
>>> would on the same resolution/refresh rate.  Frieder noted the LCDIF
>>> was sometimes underflowing, so read up on it a little bit.
>>>
>>> In the comments of the LCDIF driver, it's noted:
>>>     Set FIFO Panic watermarks, low 1/3, high 2/3 .
>>>
>>> However, in the downstream kernels, NXP changes the threshold to
>> 1/2
>>> and 3/4 on the LCDIF that drives the HDMI, while leaving the other
>>> LCDIF interfaces at the default.
>>>
>>> When I increased the threshold to 1/2 and 3/4, it appeared that
>>> several resolutions that my monitor was struggling to sync started
>>> working, and it appeared to sync faster.  I don't have an HDMI
>>> analyzer, so I cannot verify much beyond knowing if my monitor can
>> or
>>> cannot sync.
>>
>> For me this change doesn't seem to cause any improved behavior. My
>> monitor still fails to sync every few times I run "modetest -s" .
>>
>> Also we have a downstream kernel based on 6.1 with backported
>> HDMI support and I don't see the issues there. But I need to make
>> some further tests to make any reliable statements.
>>
> 
> Downstream kernel has some NOC settings that not supported
> in upstream kernel, that maybe the issue.
> 
> If you check 6.6 kernel, you could see some noc related settings
> in imx8mp-blk-ctl.c imx8m-blk-ctl.c and gpcv2.c. You may give a
> try with those noc settings applied and see whether that would
> improve.

With "downstream kernel" I didn't mean linux-imx. I meant our Kontron
linux-ktn, which is based on mainline. I didn't test linux-imx to see if
the issue occurs there, but that might be one task for further debugging.
