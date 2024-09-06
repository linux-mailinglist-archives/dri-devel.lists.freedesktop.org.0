Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F9E96FC7A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 22:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA6410EAEE;
	Fri,  6 Sep 2024 20:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="Ud0GCsTa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2125.outbound.protection.outlook.com [40.107.22.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAF610EAEE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 20:01:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NThFI5QD+k8DRTnDy3uEBT28zKHygY+O9fWL6mlF7DzYOyY9e+KcOCdC0FbM5+PwdlqA9WRN5je2W9tHgz3THmNhGHs4i9D6hy2maf+0rEAAa0naRq55u4SpkNuQBV6/fxLjRWDaCo9e1qRq0MyynPTdGRYwtW2eQ/eZLtVDjinEKNGqoEaHQoYKu0/4LfZQjQaW63O0421j4SwZSivmpohA6c9jHW255A1zC6oAb0Fsg35r83gLhz/jDFQ+HKUYdk2V4h7SEoZVol/MAgO308aQFL3K7GFsAmIRHUsnwpQBUJMEujp6uhzyjpfHAwOVFJ1WxGyppVhZl+0sFwKUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwNJqQ1ftLT2XAp0Lckwzg/atiYCuhWrWJziEuOSf88=;
 b=CEnsCv4GNUdKgZkhJ/ksJR9utoWQuLsgQmhjrKB8g2bL3i5Xi5u+n11oauC+ZQV01IAHFCK7+vbwCpBbkLoSWvHPNxM5JeA0+oJUAdlZ6U1sLAA3GtIJaaXLqOFrZTYmMcPycq458/dsQhE7HGv+zuREK+xOomqbcAYwJ4RTTbZZRLPnoEyBvfg+WAJOqo3bVhMSZio0Fff5O1hHz7rz5lc8MG1cJ7ljOyFZeh3fVwTDH4Nk9CMmIp0wJ5PW6q5wGBd7HqJuOPPr8IOyaDexMOUOQEA0u0Z2DHCCvH7BUzGR1qpSWCImGv/2zQgdM+8I6IWWO/msaLl+rzlKebrMXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwNJqQ1ftLT2XAp0Lckwzg/atiYCuhWrWJziEuOSf88=;
 b=Ud0GCsTayf8zTOPRRhWOU5nPqJkdRRsbKTWFkPpl4+fhY4O1Nf+GFN4ireVysreZxmrbqY6jFCP0D4KsgU/IGSrJ7ohdHq/X0J7O26R0gh8jQLgFxekRH12bkVZ3AvfD3P2XfkC4cJSIK6jBRQyOben2porrNc21oKQUTqbf1sQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS8PR10MB6389.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:536::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 20:01:36 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 20:01:36 +0000
Message-ID: <01d578b9-e42e-4767-a33f-b0892a602e23@kontron.de>
Date: Fri, 6 Sep 2024 22:01:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: i.MX8MP IMX-LCDIF Underrun Question(s)
To: Adam Ford <aford173@gmail.com>, imx@lists.linux.dev,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
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
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAHCN7xLL4hrTK1OqsqUa78cdp9ZcG0sC+cO5QKC3x_Y9-QVzSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0228.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::9) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS8PR10MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 28488c5a-1e17-496c-18ef-08dcceaeb68b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aCtYaVA2TVA5dURBaFRCdG9TSXhLaE5UMGNLaklMZ0dCM0FjNDRYSEFxckY5?=
 =?utf-8?B?UGlVczBid0NoOFQwWkdlQXkvWi9jQUNKWWtqeUYwb3ZnOWlRQk9lTXM4bDE2?=
 =?utf-8?B?RTFqYVEwUkFkQUVUVFExZlRkNXk0SStqUGFHYVhYcnd5N1pwbVhWa01hdHlz?=
 =?utf-8?B?SEFwS3RLMmZCM3JnTVJFUGlHUGwxR0NsT1paWmlZNW44elBGRkF1dFRpM21I?=
 =?utf-8?B?ekMxTTZlWXg4eVFFNDk1VEFSSXp3dk9idzhFUXdOQ0dvY204YzJKNTFsY2dU?=
 =?utf-8?B?byt0dmMvUTRiMXhZU1J1MmlLU1VqV0p4SWp1c25JVVIzVUlQZ3RvWVpCc0Fx?=
 =?utf-8?B?ZDNqRk9CRDJ2Nm93eFpmWW5MSTVrRUVUOUtvWWJnajNGM1FZV0pNalhmOEJa?=
 =?utf-8?B?VSt3WVF5cS9ieGdIOXR0UVJCdW5rME5wVFlMNGIzeWZZeGhCa09YMkxlTmhk?=
 =?utf-8?B?Z3dtckRsV0pzQTFGUHRXRlNBQzd4NTVzRzdFcktHeXRwdUErNVRPMDBZNnEv?=
 =?utf-8?B?emFObWNqSUNwRzJhbDcyZ3dnSDNYMFducS9SZUVxb1VodjVzUlZ3dmFmNHZD?=
 =?utf-8?B?d3JCcHcvYUVndFlENkhRUFpGV3p3MnZndVJpaVFKazZFQ1lleWUrdjBIRVEx?=
 =?utf-8?B?elBqVDRYb2NXUktYeEVCZVZkMlJCZ3FyY1k1Vnc5V2s2c2NEb1VUWitlVDc2?=
 =?utf-8?B?RlBJRWs2cE9QTERIdk5Xa3JDN3BmWTkvQ2gvb3ZIWlQzMzlzWmVFek8rQjRU?=
 =?utf-8?B?a2s3ZEZwRmVmTnF4c05oWnlJZTJHbTF5YW1JbzZyeEp2TGV4eFhVaGlGL2tG?=
 =?utf-8?B?WklSMjR6R0JqK25UWGZ0VjZlREZBUUhpdE45YlRYY1ExK0FreTFtUFpyazBh?=
 =?utf-8?B?OStHZXRKL0V6VlZRaDFIVmF2OFlZaGVjU0ttalAxUkxvb1djL1RCcWxPV1d1?=
 =?utf-8?B?Yno2S0d6Qi9wQ2xMSnVGc0N1cUZ4akFaTlJnMzZFMllBbzVmZERVRDZDeHVE?=
 =?utf-8?B?Y1h4VVg4RCtHeERSbUE2KzBCcGNyWkRvaUlCNVpwY0NjbDhtYTRqTHJFSS9w?=
 =?utf-8?B?NUUycjd2RkozMXQ3UGk2Ri9BcW5IL0daSitoOWlzOVRmM3FnZ3lnL0tRODVn?=
 =?utf-8?B?Y21ETENOSS9FU0hHSFFpZGFzdGlDQmpULzZsZjdSWU9TeG5sN21oRlJKRDNN?=
 =?utf-8?B?UkJLSzJ1czBMYmhCRlo2TDYwR0Qrd01PYXBZblZHbVlVcmoxRFVNYXB3d2Js?=
 =?utf-8?B?c2hMTnRobVM1em80VlppWGZRNE5JRmJWM3RONkRZdEtwU0sxdDV2d0lZVGNz?=
 =?utf-8?B?NXNIRWhScTk0RTRoVEtKMHlmenphMUVMUyszajhFSHkyRE4vRWtWSDNjaHJN?=
 =?utf-8?B?SmdMOWEwZ3ZHanBFbDRsU0dTUjQ2bWlWZHptSU4rNVkvd0JPNTdNZnBRRXpv?=
 =?utf-8?B?SklOZGdveURnUHNVeFg1Ny9hMzR5dnVLZUlYaW52VzlsQzJqOHN6WnF6UkhD?=
 =?utf-8?B?T1BFUy9DN0doeXhBV0tTUTVYa0hoT2x0WGdHSTk2M0V5MHBZR2tlUmhTVEJC?=
 =?utf-8?B?SExXZE4vWEcxZkNIdDJwaVcvVjFCRWIzeE9mNWppSmg4aDRHOFd1NFIrYkZE?=
 =?utf-8?B?ZW13dXFBM2hWamhQUkdISk5oTXV1Um1PS1lRbkhUUlJ4eHlBTlFrZWhxS29Y?=
 =?utf-8?B?S3N4QlJ0aFZpUmhFUkpGZ2hlVDE3K21mSVFZYlkrajZIL1dNWG9YU0pzTFMr?=
 =?utf-8?B?Q3J0Mk82YTFRWE1mcVNIK2puMzh3RVhYRU5CWFJzMUYxSlN6VnNHcUk4aUFt?=
 =?utf-8?B?VGRGWXJjUG1nN3FuRExaN2p4c281NnFyN2RZSmF3ZXhMTnl5TW14Zk5FNmQr?=
 =?utf-8?Q?3V6SCyI3dgQ/I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elIzdW44NzN6SFQwRDJsdTRJMGtvbzI3bUY4SjU4aUVHS25OUnpLTGt2emg5?=
 =?utf-8?B?SS9pdXVmblNvc3FTV3NDdUpBMFJnV1R2REdUa21nUFZJQzhnTGZDYkFCZnFQ?=
 =?utf-8?B?L3NxN0xZWjFhRUdQRkE1NG04NEg1NnJRcG9Ya0ZoSXhNN1cra2VRbm01aktX?=
 =?utf-8?B?ZlBBNEowL2hvWlJaWktEUlh6YnVNaDFUeDBRM0NkQ1g2ajExN1c0NzExMlJr?=
 =?utf-8?B?YUZZQVJNSGt2S2xyVENxUzlMN2dmOUxLSWNUcEZER1RRSUl4QWdtL2poVk5o?=
 =?utf-8?B?dXFTRFd2c3JmWS82UmFqTXdiRWtZbVJhTlAzbkZRaHRJaDhrY2FpV1pEN1B1?=
 =?utf-8?B?eDlmZHp4NGUzQ1BKelpWbHRlWmV6R3d0RWo3S1F1VDB1TkZhcnp2OHE2YjhQ?=
 =?utf-8?B?ZEs1TUhuVWNxZzZ4emlNMXV3RWNCZFM1SU8vU0gwNEkrNUQxNVV0UThqSHNK?=
 =?utf-8?B?NGtEdVNETWtHbHZjN2FpcnRUTWJzcUFVU3pPWnFESithSkxGMVUrUzl6engv?=
 =?utf-8?B?LzV5UlhQcGtuS3BsOTVIVXhybUozYW9Ebk1JRE1YWCtabkhwVnVUM0tZVE1K?=
 =?utf-8?B?bkZiT3M3WDN6NUdqTjlBVnUweEF0cnZuckptN251UEZiclluZWczakpOdHRH?=
 =?utf-8?B?aEdrOEtWTVhpdldtZXJSQVhxalJRZDB6akJJaUZMNFJ1T0kwNHo1R2dNVzVt?=
 =?utf-8?B?UnVETkI1QzJRUzFjYnEzZWtOT25YV29oWTV5ZWNSSkdKRGpTZ2k1VVgyL1NE?=
 =?utf-8?B?OG5sdFZpVkFBWUc0TGM3cERsNlAwQ3NHT1dvL2YxbFBxc2lMYUtDTGhZMzZP?=
 =?utf-8?B?Ri9ld254M1pnekc3RTZYb2lXVlhBY0Y4QXFDcEI4SHJQaGhTRXprZ2RPclVE?=
 =?utf-8?B?U3ZCOGQ0c2RTcDFLWHczTEtyU0tWeUFoK1RQcTJ5WVExQmR4RWlDNllhZThR?=
 =?utf-8?B?b05URUdXUWpPZE1nclBHakQyS0d1NjdPTzFreHlBbXVQd3RCSElyZ3FlZ245?=
 =?utf-8?B?UnpQNzNEcFpuTEVRVjYxWFRKRU40cTJoWmM2bzJZNjhYd2hocWp5SEVobXlw?=
 =?utf-8?B?TVo2WDFMK1JPT3VmNmVabkdDaFhTZjF6cHFuYmREZzdHMk0zclpJZWxRNnBx?=
 =?utf-8?B?SlIxc2xKcGdYNGxwd2I5OGlUSGxPUlB6elNYcTZPd1RUVmVGTW9ocDc1dFRn?=
 =?utf-8?B?RVVHZGQvbVZBckV2S2o4b0VlbTNsemlpT2JmOGZld0JWQkJlb21TTU1iNFlh?=
 =?utf-8?B?SjlYWHFpOHBEUFJaVEo3ZmNGUXRneURXYkZVcVdwcWpvVzVBZ1FuQ09HVmtB?=
 =?utf-8?B?dE1pYnRhZkljSC9PdjU5ZHhlYWJwZ3E1NXBxaTVaeVRyZzYrdWNVUU5Ia3R0?=
 =?utf-8?B?RmlEWE9uSlByZWtPVHg2UkMvT0Z5aWVRaVllQ3Z2b1oyYm1mOENDenEzd2hN?=
 =?utf-8?B?V2p4OFVLVUlRcndVeUE2MzhoQ1YzN28rUjYzUXYyTGV2dTNibUdna0RkWGUx?=
 =?utf-8?B?TTNUV2JjRTZGYW96aDBPQmRhZDdPM25aOEQwVEc0Tm9QVm0wbW1VYWhpalRS?=
 =?utf-8?B?NzFXdmRLejR6a1ZRb0N2VVpsYXozVmppVEozUmFaRzRwcWdkODNtM3I3NVVE?=
 =?utf-8?B?TXhuQXpmcGhoT3ZlbFp6QUFIeEJZQndxMFJGdU5jZVlBV2pHS3JISnJlcDJw?=
 =?utf-8?B?ZmJlVnNVNDRZTE1EUFY4a1M3TGI2TDIrRDZURTJGbWROMmowK1JFaithZkFZ?=
 =?utf-8?B?Tk1sYXF1NmMzd0UyeVFCU2QzOFVOVGxzcTBpU1NoMW43dERBWmxxd21CNjRN?=
 =?utf-8?B?Ync3SmIvdW95eCtyVDQ5ZUVoMHlobDRBNC9tUzJyRlBKWDlmVE8yQ3JZSkh3?=
 =?utf-8?B?VnpLWGdRT2pRTW5xU0NwQ3dTaTdQeVVlbFBLM05NZW83UW1XNUcwRmI2OVNJ?=
 =?utf-8?B?U0FXMTY1TGFuamhqMkNmOHNVMmFxdm1qWGRRdm5vNmhUUjBXSktwWnRydVVl?=
 =?utf-8?B?UlBrVXFTR1c5S0M3YjVxcXVvbUhVeS9ZdHRheW15c0FzL3MzeXFTN1pRSGRn?=
 =?utf-8?B?TmhkSWFBeHk1UmlmelU3RXE1RWVTRXlRZ01FTVRtaVM2djM1Z3dmMmFhM1Zk?=
 =?utf-8?B?THp4QnFtbzJGRzBUaTRTSzRrcWxQUmM3SXBFaHJRUW1zdGk2aXUrWVYwY0cv?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 28488c5a-1e17-496c-18ef-08dcceaeb68b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 20:01:36.3081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pQrLDyFpHHjI74sD+7pfPwM1si0hcKgzmsV8Zzb+RdNXJNG9O5N2pBNlrZ6C+6l/LtvsY+XMBqUbR9tlWzyoqgzh0PRdqABc/2SwH424v8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6389
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

On 06.09.24 3:46 AM, Adam Ford wrote:
> I have been testing various settings on the HDMI out of the i.MX8MP.
> 
> I noticed that sometimes my monitor would not sync, but sometimes it
> would on the same resolution/refresh rate.  Frieder noted the LCDIF
> was sometimes underflowing, so read up on it a little bit.
> 
> In the comments of the LCDIF driver, it's noted:
>     Set FIFO Panic watermarks, low 1/3, high 2/3 .
> 
> However, in the downstream kernels, NXP changes the threshold to 1/2
> and 3/4 on the LCDIF that drives the HDMI, while leaving the other
> LCDIF interfaces at the default.
> 
> When I increased the threshold to 1/2 and 3/4, it appeared that
> several resolutions that my monitor was struggling to sync started
> working, and it appeared to sync faster.  I don't have an HDMI
> analyzer, so I cannot verify much beyond knowing if my monitor can or
> cannot sync.

For me this change doesn't seem to cause any improved behavior. My
monitor still fails to sync every few times I run "modetest -s" .

Also we have a downstream kernel based on 6.1 with backported HDMI
support and I don't see the issues there. But I need to make some
further tests to make any reliable statements.

> 
> Could the threshold and underrun cause this monitor intermittent
> issue, or would this be something else?
> 
> Does it make sense to have a flag or device tree option to override
> the default thresholds to change the panic level?
> 
> adam
