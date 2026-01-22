Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKyfDL/ncWkONAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:02:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3ED64257
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DC910E95C;
	Thu, 22 Jan 2026 09:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="K/dsE1kh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010047.outbound.protection.outlook.com [52.101.69.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2E910E977
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:02:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jG4aKbptm3YBrFoib5J2/jYGdFBMn0t+l0EWufvNv8VR8f06Wygp8PdF7YrHAnBvkosZwWq2caXw4dFsM83jHD+NfrO6Xn0y7tx1qw+0i5zntvgfxGOOblbeEOoQ+5D1zPn9vUOFR5F47PtZtxzzim/QyFg+YHvDnFyHhxx1AjG1BZUjYh9u2KFj4CK932bU11j0JtgbJy6oSqQJtWSFA9s/UCBaab/KEZjfxpDQUo5am+VVhw9kd+46x6Bhjy8sZNZSgqDa9YJDgVOEBMe0HDYz8/ivU0n5XBksQYHiQBsNjR2dmoJzSvMST9iCKJpw0/kYJd8FYQ3b2Qswltk1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7+4FpYko/eJ8qt9PyN/lvkPjEVuDP1aryptjsKR82M=;
 b=l2E/RwMX0Q/F2RUntkiUr+yz2tducId0hRGY7yrY7Fu2MEp3B81Pik1dTEEOUQUeb00aaVHO5pS61TCNYVZcWPD7OAm2RjnHTuRzybXGv9sc0VG4TsvQthqpEAjg0jcd4RXoWhP6zdbX+qkIkTY3ilZ1xTlMHC3LHFpEz5FUBYqub0h32pbqJblzoQCT3mz35Bsql5MUssYXXqktRvaYh8RRPr6ASRDI1LX/r1cYBunV7vdAF6enkuBKJK3GWCy178WJWuw7ArwYZU1KkX177lYYK3oRd//+RALH9/3TOry4kFrXNp87rc+o9qvNnmRyKQDmFIyD8AXO2aA5Rj3/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7+4FpYko/eJ8qt9PyN/lvkPjEVuDP1aryptjsKR82M=;
 b=K/dsE1khcBH1mJX5jujcirHO6G/Td5uobLaMkjafDZ8hYJO8VqC2xmD5ZwQ+ANQ2fwP41dxIdz/KpQYoXPOt33doibk37tmHg6soqIvokSK/FO3LOmwmRJqk3p5n7wQE+JI1VAI17Wd7bvEPW6zh/U24qGMBa5EckbVub75ANy0RzHUzjQdfwSBZGA+E6ZjKkRZDFun9S/AAxdJkcA+jr5U8UpMKO7h8MwiO6r5N+mUtqDbRcPEISL6w2CeqYxOFn3df1UZpNz3eSOw7iHNyXJybjKBYgC5wXP8Pjd8pH5+AGaP82meGtuUrLCT97CYZl+YiJXQmIpToI8dAAxs5zA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by PA4PR04MB7872.eurprd04.prod.outlook.com (2603:10a6:102:ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 22 Jan
 2026 09:02:44 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 09:02:44 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 8/9] arm64: dts: imx943-evk: Add display support using
 IT6263
Date: Thu, 22 Jan 2026 09:01:46 +0000
Message-ID: <20260122-dcif-upstreaming-v7-8-19ea17eb046f@oss.nxp.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
References: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0028.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::16) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|PA4PR04MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce3523e-e9d9-4776-bfa2-08de599501a7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|19092799006|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bStlQU9WdUI0VnJCL1VlQ054R3ZhaW41UHdDZlh0VVdWVTJvbnlYdUhNSlFr?=
 =?utf-8?B?YWNCZTMvY3pXZDBkcDdZRnFYQ1ROZXdoVVJQb3NEYU1lLzRhaHpTckZYcERi?=
 =?utf-8?B?cnVsOEhXQ1p0VWxseENhZyszNWJ5VHU5SFYwRjR3V2lmVXJNRnpwR2huS2hk?=
 =?utf-8?B?ZGtXcXJRaGZDbGlBZ0FRQzllM1JrUURVVVhhOXQ2enRmQm5ETjBQSjE1WUFU?=
 =?utf-8?B?aXdReGlCNnNGMERycElydUpLUVp1TzVERzMySjJoQk9KT0wyVURlTG9uR1Zt?=
 =?utf-8?B?RWlmTW1RT0hGUklpZzJQTzdxcTZEMTZtOGRqMGdxQkc4Sk9WUlBoK0dRUk9h?=
 =?utf-8?B?aWRnODlUNnZhL1BIeFBBUFB3MDNnaHFVdWI3bDdvVXBoQTNMenhlejFWdG1Z?=
 =?utf-8?B?dzE4dEdtdndwSTdrSEVrSjY0S0ZJYUZabTRQemg0OUxlV09YSWc5NGVmRWR2?=
 =?utf-8?B?dkxKQ3c0anhFYk5UVjZMZE5PekRaTGJ3bWZhdG5EUFA5WjU4VnRkRk4vV0N2?=
 =?utf-8?B?T2hxelUxTTBJOHYrS3NUK2tRQmp0QmtHcGtpVFltbXB3eWR2anJpeEI1dTFj?=
 =?utf-8?B?c3ZSTnIyc3BJT240NHZTSXdxY3pVbHVpdkRJUnpwZGRjN01Ib0xSTzY4ZWRs?=
 =?utf-8?B?Q1liNEdKdFY1SHVEOGJONnFaOHgzalU1OVNZb3BkVXpOeHQ3MGJhMjlqcS9K?=
 =?utf-8?B?UDRWaUdQeHpLNmpNSHJQQit3RW1KVi9jN2lmd09SZEpNY01jTEp4eVorcnZo?=
 =?utf-8?B?aEhoZTIxbkI0V09xYTRPVWd6NVRLLzlPSVpmVlFETVlzN1JSblBlU2Z3Z1VD?=
 =?utf-8?B?bTVNUzBTWVJWVldhTk5raGczVmNuVG5VZFdETWlrOU1NUWZlQmRvc01Nd0V4?=
 =?utf-8?B?OThzM3YrY2hZUkFnK2hQUEEwNjdIbW5XVDFCaC9RY3I1N08vdUx5eVNuMDdD?=
 =?utf-8?B?eXFqVXJaOUkrV05EZmo1ZVJvWTJWYndXbUxDL29BMnFvOTZ5K1ZkcVRYQkxl?=
 =?utf-8?B?dVpYM2xaMmRla2FwT21lbkNlZzlGTWgzelZuRmdMeXppYitiU1U0YklkcWgv?=
 =?utf-8?B?MnlLZ2tsUFJmb0NoalpveEMvY2F3cmxVTzVyODE4UjBQZ3p2Z2JheEpsbld1?=
 =?utf-8?B?NVBneWdJQzF6bFpRV3NsU0s4NVQ2bEdUcWFJZ0poM3Y3V2gxeWl5K0hSelI5?=
 =?utf-8?B?bFA2a0UvWUZhbFc2NTYxdlg0eHBJRDh6cjAwUGIrSmJpS2svaUsreHB2TE1W?=
 =?utf-8?B?WVFmZWZVYmNsSVc3Z3V6T3c0OEpOYlhJZng1cml3bUNmZEZxQ1cwTnBDUHlq?=
 =?utf-8?B?OHE2TW02MHRlM0dNL2htaWV3N3lpZ2dOMFVsNWRLRHh1ZWRCVWxHM1QybXQy?=
 =?utf-8?B?bzFIWlRLNHpxZlU0L2tSN3kwZS9MendjaVhyT0lpR0RMS0Y4K3VETDJHQ29L?=
 =?utf-8?B?SDkwcFV3SzF5cS9EQ2FHdE5nZkZ3STJDcVc4UjRQYVZaOUpYcHVsVGFwM21u?=
 =?utf-8?B?d0lEWHBkbW5UTWxxMjJCUm5oLzJZVHVUWWVhS3hVSTNCS3Q1akF6ZDV5NkRp?=
 =?utf-8?B?MXdJamVOZ0VSTTZZdnJvTjlIZjl6RzU4ZXpWM3ZKdEtJSnRWc1F3L21jdm1y?=
 =?utf-8?B?cTNqREtqZUpWSkI1NXE0OGhnZzlJR0JaOTl4dEtwQXoxUWFXWGh3WDdQWjFQ?=
 =?utf-8?B?NUF5T0NVcU1FL3kycEM0eGp0RWhEeERaM0ZJcVFzOEFtendvQWlkQnVxcDZG?=
 =?utf-8?B?Q1VLeENGU0w1TGxFSGhFY3lsU2t3TmIwbDVxbHk2STZxcUt2TkFhNEJ0WGxy?=
 =?utf-8?B?MGhpdTdDYVZWRXpMcUo1d0c2SFR4YUR3NHh3aDZ1VDNvbU00Q09Yb2xFVndL?=
 =?utf-8?B?NnQ3VGdENjdrNzhtQmNZeHN4cjgzWmN0Mk5rRGRkdmUxQmZQb1N2TEZQbkt4?=
 =?utf-8?B?WDdETTBCd21YejZkakVSclIzQmcvbnlPQk5VOGVMRXBzQ2Qxa0duUnErazJt?=
 =?utf-8?B?aDNmR09Ldkp3QU9WUEp6QXQ5WmFab05FZEdpUms4aGhSaEd3Y1lacE1scE4r?=
 =?utf-8?B?ckN6eEhHNUZZd1BEMXl3cldqWXo0c3BrdUhCZmE2VldTRlJBYlpkL3RUank1?=
 =?utf-8?Q?knlg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0xjaE16MVM2TXJXMXhEdkNQYmJUVzRJWk9DeCt3NGJBNE9yVmZ0NnpBQnJN?=
 =?utf-8?B?ZVQvK045dVA4L2ovSUFKVVh4VXlDd2F5VkxwdVhFYXVUWWcwR3BZdUtDeE9m?=
 =?utf-8?B?QnphTkU2UGY2TC9EY28xK01lWjhWWDkvYTgybGdTRmQzcUN6YkNBQzI3VUd4?=
 =?utf-8?B?UzZlVHlVczAyRnNnK1dKME1JQ3pNcEh6dXkzMVpFQkM4QVg0ZktQYjA4YVBQ?=
 =?utf-8?B?VnB4WEk3T3JaNmlzVTB2aDFITHRUM0pCUThTVFJZZE1GcTJ3WXdmYmY2SGF3?=
 =?utf-8?B?NlFsenlMeE1qVGQzd2VnTVFKdytDQ3dpWmovOGVUdE0yQ2JUVy9JbTVrZnBD?=
 =?utf-8?B?RmVPNzl0NGVCV1ZCVFZYQU5zS3ljWWlsdGdHSnNWUDRobjhHRTFvMXhxVmVv?=
 =?utf-8?B?QkFSY3dtMUlGN2hSclFxblpxbm5aanVrR095WFduTld1WGZqMlM1VlJPcGtE?=
 =?utf-8?B?TmlzWUUySnR6OWNlMFRWYzdtTzlnOG81VkpCSU1jZTRSeEpvOHBzWnVNdFRn?=
 =?utf-8?B?akV4aXJScHpBT1c3dmpOOU1oYVFTbDJmbkt2ZFNjR1gzbERaM2hzL2c1YTBU?=
 =?utf-8?B?Vng2MTR3T1FlZU9teHF2NldDTzg4bDFYZWF5NFQ0cVozZWdNOWRDWGZBZER3?=
 =?utf-8?B?VWRVVE14Rzl2VkZhQUJqcVhZdHJuOU1TU3Myd0pmdlYxdG9vZUlpYTVhSEFm?=
 =?utf-8?B?UGFFc1hnVGNDOW5CN3IvRkhQaXNDM0NvbEdCeVg2UjE2aDliampVbEg3TG9K?=
 =?utf-8?B?dGY1bkNDZTk0akpwenJTY2FKZnpzMElIS3c0OWVveXBBYlQ3OWh0K1NXUW1S?=
 =?utf-8?B?OFRLVkVkczh2WnpPRENRRXRMK3VjaUJ2a3hrcytUdENyWkdCT2lIOVBKTUlt?=
 =?utf-8?B?WHFNaHlSeitaV1EyakJEYnRPakwxeU5WZjhYM1V1eDloWUpNLzdDNENteVJY?=
 =?utf-8?B?ZGtjYkpWbVJZbVRyZXBMeHk3d2ZaNnJLUU0zRzlCVjFwY1pTbWxxYVZLVnF6?=
 =?utf-8?B?bzBmRkV3MnFWQzJ2cENMMDgvMTNhVjZ2dHduQ0FIbDQzQ2JwTXRrZHJVZWMx?=
 =?utf-8?B?VFFQU3NVSmIwQWZNZFRoMkxvNDEwd1F1N1Vjd3Nva0RsU0E4YnZ2bHhzTUlS?=
 =?utf-8?B?UVZIVVRNK0t0cXBOWGRaclpvdGlCR0FKdmxUb3lvczdRN1AwNWZkaHZPRThV?=
 =?utf-8?B?c1hGbGZRMWM4MzR4eDRpSXpsV3gzUlVyK284UUEyNHZ5OG9NalA3eWJjRG03?=
 =?utf-8?B?ZVc2M1JtNmliZ0ZOcDYwZ2hBRjJXbnRadVlicURaZlI4Mzlya3gzTExVRGpG?=
 =?utf-8?B?dWpNdCt5dzBZUmRvYkVmUUQ5cGdwM3N5TW5XMlIwRHRpd1BVWGpJNWJaNHdp?=
 =?utf-8?B?MEY4clNVM0Z3NCttYUN5YVlGN094Z0d2c2szaWlQMFJ1VkVrcmptamV4UkUw?=
 =?utf-8?B?eFFRdjJtRjN0TXNZaVEramQ5VmpVUEZJcnViRnN4ZlhiblpzQ3ZCWTcydDBY?=
 =?utf-8?B?aFFtVWNMeHFYbnFoVW11SXFkMlQrTFVEYTlYamo2Y1RyNENSSW1jUFNjdzVR?=
 =?utf-8?B?SHc5YXlFZ2Z4Tm8rTm5ncFY4UUdpWHNzcGJlNm81YUNMM2ZiTk9KelcxT0FF?=
 =?utf-8?B?dlNheUJBZzhaandrdE9SVFJscWs1WnFQVXRmUzBsWjVaWmhhS0VYZDZDK2ta?=
 =?utf-8?B?dVVWN1dVWkQxRDFNWHpaM2NERGtlaFF4UjlQcWtKK2RrMVdjcVRHWUxxV0xa?=
 =?utf-8?B?KzVKeHRKb3J3R2xYbGZTSyt3NExwS2NWYWN3Tko0RC90ZE8wcjJSUWEyMUxF?=
 =?utf-8?B?dkF4RktqL04xYjlFMlZVdmlaQjB4UUJhSHZKRVBlbXRVZFhKRmNYdGU5VkxQ?=
 =?utf-8?B?RDRSbWt5b3ZoaHJSQ3gwWUVFak11dzAvczRpVzJ4TGNCeGJBdi9heFRKU3Vn?=
 =?utf-8?B?ejRnNy9sdmx0ZGNiWi8rc0pCa0hkTnpYc29DdG9OeU5hZUxEY1hzV2I1L1Jm?=
 =?utf-8?B?cnZaM2tqMXhmTnJVQnpGcS8xcXRXRUVNdkM2ank3dkJpUHV4a0xRZENwU281?=
 =?utf-8?B?Mkd5aVNRUG85L1Rad3I2MlNyaE5RZ2dWMmQyTHh6SXlUNEhJaUNoTmZwbEtH?=
 =?utf-8?B?ZnhGNmM5QlhER2g3dmpuSnRGVGNLN21wMXo3UERiS24wTWgrVWRUQUJHaHdL?=
 =?utf-8?B?N0s5Z1cvdUNmOTBza3RKVHlHWDBibmNMQ3hGQ0grUkhsMkUwVmx0QzQ0eWVS?=
 =?utf-8?B?cFFDazlqRnYvZVJDYkhDczFzVGVSTWx1dzFhMHRqTTEycHNndkF1aWJKcjJB?=
 =?utf-8?B?bVI5VWl3Z1dkcHhvTFlpU0lpb1R3ellHbFArekZQUDIyRk8wNmhhbk1BVHZO?=
 =?utf-8?Q?vbwcBH3UQ3zLkNEc=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce3523e-e9d9-4776-bfa2-08de599501a7
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:02:44.7422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrOJRF2J/UYshQI5agx3hl5ar0oowsxXb6hIgMPgTaHXJbr2+3bbVlodd+Jf8y9gTeQwjSSYQYFGP70El6R7ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7872
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
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:imx@lists.linux.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:Frank.Li@nxp.com,m:laurentiu.palcu@oss.nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[lists.linux.dev,kernel.org,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.0:email,4.196.180.0:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim,0.0.0.4:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.2:email,0.0.0.3:email]
X-Rspamd-Queue-Id: 5F3ED64257
X-Rspamd-Action: no action

The ITE IT6263 based NXP LVDS to HDMI converter can be attached to the
i.MX943 EVK board LVDS port using the mini-SAS connector. Since this is
the default configuration for the EVK, add support for it here.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 31fa9675cee13709d6774ea3a8464168b7fead44..70f26949916ce16da3ba0a9682acf9354bd4a449 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -53,6 +53,18 @@ dmic: dmic {
 		#sound-dai-cells = <0>;
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&it6263_out>;
+			};
+		};
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -146,6 +158,10 @@ memory@80000000 {
 	};
 };
 
+&dcif {
+	status = "okay";
+};
+
 &enetc1 {
 	clocks = <&scmi_clk IMX94_CLK_MAC4>;
 	clock-names = "ref";
@@ -184,6 +200,21 @@ &flexcan4 {
 	status = "okay";
 };
 
+&ldb {
+	assigned-clocks = <&scmi_clk IMX94_CLK_LDBPLL_VCO>,
+			  <&scmi_clk IMX94_CLK_LDBPLL>;
+	assigned-clock-rates = <4158000000>, <1039500000>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			lvds_out: endpoint {
+				remote-endpoint = <&it6263_in>;
+			};
+		};
+	};
+};
+
 &lpi2c3 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&pinctrl_lpi2c3>;
@@ -225,6 +256,34 @@ i2c@3 {
 			reg = <3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			lvds-to-hdmi-bridge@4c {
+				compatible = "ite,it6263";
+				reg = <0x4c>;
+				data-mapping = "jeida-24";
+				reset-gpios = <&pcal6416_i2c3_u171 8 GPIO_ACTIVE_HIGH>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						it6263_in: endpoint {
+							remote-endpoint = <&lvds_out>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						it6263_out: endpoint {
+							remote-endpoint = <&hdmi_connector_in>;
+						};
+					};
+				};
+			};
 		};
 
 		i2c@4 {

-- 
2.49.0
