Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLu4NeIYqGmgnwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:34:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7138F1FF0C1
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632C710E9BA;
	Wed,  4 Mar 2026 11:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NTgP0Ck4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012029.outbound.protection.outlook.com [52.101.66.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500D910E9B4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 11:34:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8MIfY0QaeExkLeJKEKzDjYvUpINaRSK35DPA3EniHXcDRA0EuiOKq6du1TvortU5fBzJucbRrUgIL8tS8Xn/83dPWvW/N2Emt2XcM20TvOYmLfcvqxvPykIXXXdodeX/EGu22jG+3NVuc2HqlaaWo3tgwcWBGNDk8/kz86fSYoWnuWX+DIO7M4PW4dt5xxwi4Kqdn5XbTwRozAcCXrIf/3SpC7b6T3LxCrBOQvWfJcTkAcDak7nR5L/L4DJApTHwqalMzwKsBvvVUa4N1bmREB4etVitnT9/F2MjyjWuz1xX4gyRUsnk+jL0mo9o46c4OeEcxhQwKPkM8ILhCpsdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNXG+ait2nZRsSrx3nzG2yAV5zGXsK+gK6cL6TLSDuM=;
 b=S3/ngKzoDk7iK3FBTVTpqO1dN2K9CIXotd1R0KXny43y0STnHEPv0XCC5kGCn0kuZ/rTSFMrYFvyNG9bbkyngyz8FU+ef8ydBvwgwllpjCmz89XDEKiyFWqJ+Xs/VH1Qir7erMmB6o9z8m/wXTdXufGlaGf+cxqj/q1p3Sxgs/yliZkDOreQbqh+VeAbXccgFGSVOO5nrvBh1u+XZtFiOxLn9D4aPnOfLB/B2RVsv3+SdO7gq+NtiY7hGQTVJ4K7R/tOJm/lwGWFXgjVb2UgoxAUokj52/ffnd9GAGGdiw83XZ0a9qqZDw8J3ZR+iJLQD/i6DITTBjJBq8IXahhYnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNXG+ait2nZRsSrx3nzG2yAV5zGXsK+gK6cL6TLSDuM=;
 b=NTgP0Ck4TnGSSiRXIxcXR8tUaLMX3aLli65WFyDzq9dtx9H5A2ZrQa9Cf+Wf32zDAmqdajjRZV0z9tSCBU7jBpT1g5d/tsAqB3YdwgMvkzxxSuqUpltIGVcSAlmJ7IbOkpLKFYeVE0LFMuuM1tsTWoBecj+Kbv9BXQt6MS2d43wEiC+33Oq3ZhqU7RXRwwErlnH77pWSXqszyLM/OvrStRp4q8PKNa/l8SOfN4V9P+XQPHs3/LKRTqSlki3hHBj+wgBe192jl0CDjb6XBVeJMgw8f1Ehi0+CPxvc876NcTTQlUCpD9ffN1zpkeTmRwC/wpFUsONoxWBX5iwdP+LFag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by GV1PR04MB10522.eurprd04.prod.outlook.com (2603:10a6:150:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 11:34:51 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 11:34:51 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
 Ying Liu <victor.liu@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/9] drm/bridge: fsl-ldb: Add support for i.MX94
Date: Wed,  4 Mar 2026 11:34:12 +0000
Message-ID: <20260304-dcif-upstreaming-v8-3-bec5c047edd4@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
References: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0047.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::19) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|GV1PR04MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: 3473d6bd-34e1-495b-3a6e-08de79e20cc4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|19092799006|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: G3LDiOWNYeLeKWSKTgWDlvvFLWz1EnC+6WXHmHS9gQ79189cJTfFoKHVzES829eravN0GHIheMekcEQwSJ4R35PNGuCKAy1JRWEniP95kUT2H6rPvud5/zIrqfq/UajtFnD0UO9KZaCmV/rzYSLly7HEEIPM74GcgdPYjEwKuXLj/bSerpX7J9QsNGedP4M3jxHpD+lgXs+SoRwDDguXOu+16mBWpA21W3zjgcxpa/SquJZlTDB+DrPM6g+Cv7tTKi1VhBJLebgZ8/GFXpVhxpeWS9W1K9S5gwX5uQ2u+ubZ8DEf/eOjHal7Wvewlqt0qvLM4mEucMR5UqYKafqOvxK0unNDs5YhZ1cdOrRhXgARngPfTJsz00Q9T90iwv3gv5vRD2zFwsFG30ZPkF91nX0+NrXc+E5SMnsubjCbWuacQ509WGZuQzvfs8E/F8BVkPCRNJ0ktgsGfRtoXAPgHwSMyLKgYBpqy3rz88N1gp+E3Ob2e18cCeA2rdXFrxjM36gRbAf4c1bkUATc/ebB06UnVJAaCHspSyigq0K4d8ZZa3yq3rEb6raGJdqXppGlMqp3D8gB89SHE159mjJxYOkwSn+mWm2hDpLRK8eAkamM5UH1z7Q0paaMzK1rpF+NhE1TH4n80y7hk2tCPGh56qK16ftaf60YheCe62o3VGeRHt5t7VoUyp4sSZd8997mLcU5d9JPzP9ZWEBK4fsB9/a3gymAYrAJVeloxt19Ek4ZLdqqgkC8dxgoPkgSulfhrsikTmHq/eE9qZPfEC5Wzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(19092799006)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjI4eXZOalpRSmFVcDA5aTRWb1VRUTRMU2VjcmxXN2dDT1E4SXozRUVqRkZQ?=
 =?utf-8?B?Qk8xSkJUN3N1SjNaZnh6TTl5VjVlMndRVDM0UE5OM2xlOWdWelg4MWVSNUw0?=
 =?utf-8?B?OUhaS3J3Q0xkRWVPK2ZCYXRkdzBIbHFUa3JIWHVzNGhGcGhFSE95VmZlQmVO?=
 =?utf-8?B?ZktSRGh2N2xQdTFOeDhCK3NoNk5YUUJCZDlyVU5GWDV0REdvSzVZQ0xTdGJq?=
 =?utf-8?B?anJhY25jUjcxc2ZTU2ducXcxcmIxNkJOeGFlT29GbWNnWVZJUUxYbkF0VEc4?=
 =?utf-8?B?aks0UGVxREE3NUhycGJpdHlYN0xBYlQvV3FIdlpSN2JjMnNpL0ZIRUplbi83?=
 =?utf-8?B?eGtLb1NaaFp1TGZObzc5UW9sa2FDWUVQd1VvT2F6QUd0NkhNRVlaakhlV3JZ?=
 =?utf-8?B?ZCt4Y3EvalVpZUpUUU9SQVlJOXFLV2RDRjRLeG5BaXNwWWwyQ092eThpRWF6?=
 =?utf-8?B?ZmxtY3NMcmd6UjdtOXBpVDdBb2ZQS01LMVFKMzZqc2FiUyt4MHYzWUNhRnRy?=
 =?utf-8?B?cU1ORTMyQkNNVEVRbkFKNUhUSG9SZmcwU1hnV09wblppWnAzZFNSOUlmd2hJ?=
 =?utf-8?B?Ym00QkYxZXRXdXVESnN0S3pNcFEyNDFvdjMwdnNOTVFFYU9oVC9uN2hQUEZ4?=
 =?utf-8?B?ZzFEeDBsck5HUkRYL0hlUEtyQXV6MER5R0NRUU1HeDhvcjczdk1IUmtIT1Bn?=
 =?utf-8?B?SkJBb016Rk9IMG5IWE1ubEtqWlBUSG1ONjRSS1Z6N29lWWlwQmVvcGtzNWta?=
 =?utf-8?B?UWtnVnlXMDNFV0F6b0hBeGd1RnhDMnhUVnpGSG1oZEIwcEdFa3RqbVAwMzE5?=
 =?utf-8?B?VTdZcVNwWkhtcnRxWlQ4cytGRjZ3aTF3aWY2MTJQaElkVDFFTzVIZWlvVFVq?=
 =?utf-8?B?R1lsSmhyZDE0OHBXTHlhVWw1dXg2enR1WEtVUm9tbHc0dGxxdUt3QTBwT3JH?=
 =?utf-8?B?aEJ2eVdpaWlHQS9aQS9uakRIN1dsN2tXZmw3NjcyZHF3YXFidDByaTFXQjdr?=
 =?utf-8?B?TlZTa05BWVRyelZvdmlvemttZllXY2dBa0lrK1VkME1QVXZwUjRJSE5IOStv?=
 =?utf-8?B?ZUZUTTNJMkFGL25RQ2ZIWDB0b3hqQWdFSWM3Y29DaFkrWDJLY1RYTUs0c0J6?=
 =?utf-8?B?VFFZL20zU1gxbWQxYzJneGdQb09CSDhaS3dzMUd4VnZneFcyQWlmOG9oWFEv?=
 =?utf-8?B?NXpvaUVhTWNpdm5uamZnWkZLT0dMOWU1cDZhZVhGK2dLVXFlZjMxUW1ObGs2?=
 =?utf-8?B?TkNCT0s4SUFYNGpmZmp6VFlqZ3RTN0N4L1lCbExrc09DYVhKZE9iVEFRUzY5?=
 =?utf-8?B?ek9nRVVxREFqZldab0Q2S04wSTk1bnNoQkFJUFEvR1AwclUrOElRK0Ywblo1?=
 =?utf-8?B?VUlicFFxV3ZvaGlsc0gvZ3BpOWNYdUZQcjhGQzZjN0crRkZ5aWMwelBXUXZy?=
 =?utf-8?B?VzNXMTJYTGZZQ2Q1SzEvdHFhYisvUGo0WklPVzZnK0VjelMwcFcrd3NFT3Jo?=
 =?utf-8?B?WmNZT1RjeGd0clRhOEhTZmx6WGpTdmxIcWhoNDRxTmMzNHcrNUtiSnZFMjRI?=
 =?utf-8?B?ZUVveHBZZEpmZ2c2bWcrb1doVnY2bkF0dDByS2QwclhxNHhQbnliZlpuTm9M?=
 =?utf-8?B?TDZOd3ZUdDNuMnNjS1FaTzVxVnRhTi85Wk01MER5OFcxdG1zd2F2ckViS0Y0?=
 =?utf-8?B?L1V6VGZhaHJDTzI3UVAyZ084aXM1ZUtrd2syYmFDcGdFbDN4eEYxaWFPRUJJ?=
 =?utf-8?B?VUxNTHJRYmI0NXhSODdZUjIvYU8yWkpVYks2OTUrelh4bVlTZlZCMmNFYXlW?=
 =?utf-8?B?SmV6M1gyenBSWm5wYUJ0Y1lNZUhIOFNYcjJuTVZHQTE1M3VnajMyN0hZYXVn?=
 =?utf-8?B?WmlWWjdFbFlRM2NTalNQUVAzZklTMFdYek1YczhocnpHUFZLend5R08yMGlU?=
 =?utf-8?B?UzNLQVlYaG44QmE2VndsekRHTDlBUVY2bDEwRU5RaWgzRjREaXFuMndvVTZ6?=
 =?utf-8?B?L2J1VWFkVjhrOWNVNE9GWS9FVnpVdWFwZzBpSGM3cTQzWXNTbUN5d0ZqbUp4?=
 =?utf-8?B?UXgvSjI1aUtKeHRYVVhVcXQrRjg0NlJXT0EyNE9aMGUzNkY2aDJOcXZHaEta?=
 =?utf-8?B?cEE4OXBCQ3l1Qnk4UlpvcVR3WGlrMHIrWU41dUNtcnd1ZVlFYVRRb0Rpd1Vq?=
 =?utf-8?B?NWlGVndXZGFSbVpZZ3NaQStuSW9OZHBUOFlQNEJkWUJtT2xXbXlHZWJkeXdD?=
 =?utf-8?B?T0puTUNuUjlxRTg2VHowMXhtUzF3cklIL0JGcUF1c0NybHJadmVBS204K2FZ?=
 =?utf-8?B?QWVZSlZIM0dtUU1RZkxlVzArN1AxVDBrREoxNXVnTGZvNFVBcmNGbXo2WWs1?=
 =?utf-8?Q?7cq7GZ6A76xqmmzQ=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3473d6bd-34e1-495b-3a6e-08de79e20cc4
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:34:51.8539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/+HfGPNOOb6Nrvolbta2Ir8tJ4k7ruWXfb2ixSPBXA+up02jYNqe0xeqcbgyY+3mfWMAgUmLP3fPg7mStYXbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10522
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
X-Rspamd-Queue-Id: 7138F1FF0C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:imx@lists.linux.dev,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Frank.Li@nxp.com,m:victor.liu@nxp.com,m:laurentiu.palcu@oss.nxp.com,m:luca.ceresoli@bootlin.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[lists.linux.dev,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,nxp.com:email]
X-Rspamd-Action: no action

i.MX94 series LDB controller shares the same LDB and LVDS control
registers as i.MX8MP and i.MX93 but supports a higher maximum clock
frequency.

Add a 'max_clk_khz' member to the fsl_ldb_devdata structure in order to
be able to set different max frequencies for other platforms.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index d59f26016de26..1b8f65a817a25 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -57,6 +57,7 @@ enum fsl_ldb_devtype {
 	IMX6SX_LDB,
 	IMX8MP_LDB,
 	IMX93_LDB,
+	IMX94_LDB,
 };
 
 struct fsl_ldb_devdata {
@@ -64,21 +65,31 @@ struct fsl_ldb_devdata {
 	u32 lvds_ctrl;
 	bool lvds_en_bit;
 	bool single_ctrl_reg;
+	u32 max_clk_khz;
 };
 
 static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 	[IMX6SX_LDB] = {
 		.ldb_ctrl = 0x18,
 		.single_ctrl_reg = true,
+		.max_clk_khz = 80000,
 	},
 	[IMX8MP_LDB] = {
 		.ldb_ctrl = 0x5c,
 		.lvds_ctrl = 0x128,
+		.max_clk_khz = 80000,
 	},
 	[IMX93_LDB] = {
 		.ldb_ctrl = 0x20,
 		.lvds_ctrl = 0x24,
 		.lvds_en_bit = true,
+		.max_clk_khz = 80000,
+	},
+	[IMX94_LDB] = {
+		.ldb_ctrl = 0x04,
+		.lvds_ctrl = 0x08,
+		.lvds_en_bit = true,
+		.max_clk_khz = 165000,
 	},
 };
 
@@ -275,7 +286,7 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
-	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
+	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 2 : 1) * fsl_ldb->devdata->max_clk_khz)
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
@@ -384,6 +395,8 @@ static const struct of_device_id fsl_ldb_match[] = {
 	  .data = &fsl_ldb_devdata[IMX8MP_LDB], },
 	{ .compatible = "fsl,imx93-ldb",
 	  .data = &fsl_ldb_devdata[IMX93_LDB], },
+	{ .compatible = "fsl,imx94-ldb",
+	  .data = &fsl_ldb_devdata[IMX94_LDB], },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, fsl_ldb_match);

-- 
2.51.0
