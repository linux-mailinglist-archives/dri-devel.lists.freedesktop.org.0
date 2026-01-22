Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ6vDLvncWkONAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:02:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965C064250
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1ED610E96C;
	Thu, 22 Jan 2026 09:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sAIHtwmt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767AF10E964
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:02:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdmWO87X6xrk16TiCJIQsgdolAjXcUi3IysfQjW7g/bhPZjpLl9/f5Jobg7NDxmPL/wR88cU1umweYVMvSdv/zmjB9zUYIIWQoN9N7Wqq2rU8Qf1mKuLhvCPm5dsy0tCe4M039SulGWRSafqiEelr9NlO05f4UEXrgKomJx9Q8RH7CgcAY7Q/j452T8oW2MmcOWv6fTRM42wk71AoRLY+ocNnk9n4aG0raYFGIkDmvh29AwQEQrN6oA5DUXSGb6ngj9Mpum3S3uDel6ilLaD/xy1uydNFS/+HddTfvYHiYuwFSDkuwEoRIBM1HZ8MXfBJ6ii4cZYgMi/DpiTkE9biw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubB9zz1L61YLYrsKGuGpOrlXI1sJyCpHxG8KI3nmEAc=;
 b=d560yoEnzdCpRtVi2OQnDlgWoiIJRp8CHOpPyLtczG+rK+mxpeSVWngY8wm4fCIvtY6wJxUIo143RMUofOYXgUW2/4HCjhaia0lxpFj38lyEZsZBZ0U8GsvoY1gQlKrY7fr6FNpOtQu2zoZMnl8X/s98sw1BKcVEjqoLH3EyTxBFHEpZpMLXsooshTpibz9/QTQjVvNm9Ts5DSVHQNzhbpaAOdfV2qQY8dlnTazUUHTMZxyYS8vWMOdUPC7rql+gr0URihE5vDPNjm2YWyB3E7esFt+w67iMU0cT7hm2sKPXInMMI++6sGQOtDLqV3fhqeffHNt/6gyM2cNDx6n8JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubB9zz1L61YLYrsKGuGpOrlXI1sJyCpHxG8KI3nmEAc=;
 b=sAIHtwmti/pMfNwehU6V4osdt88EzeWqPBPZgRZDvtSY8IUiG6Bxu7BOh7egjv7Pye7aG0qZhqgVAk34ZNioyyRlJt5K72Of7vYfYZzHRDs2lI9uIC2HzEEidPCjFa4arnwNGjuAqKC0pMEtGfuq9vvfU5xolt+v4wDwPIYrBAbm2nXnjU1Bbhgf7Z5cX3/mvuBxdSOwkkIAUDydErn8dIea2T7ho3faqYKP18Nmzb10+xWKmxIDTpP9Xe5fZT2tGsCGAl0gE9l4mpMi7XfM0G+GrqnBBBHzjWrhdzMuTHO7HcExQxyTlirui/UKGHP9+YhB85JvVRwQu0nvTa8rIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by PA4PR04MB7872.eurprd04.prod.outlook.com (2603:10a6:102:ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 22 Jan
 2026 09:02:42 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 09:02:42 +0000
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
Subject: [PATCH v7 7/9] arm64: dts: imx943: Add display pipeline nodes
Date: Thu, 22 Jan 2026 09:01:45 +0000
Message-ID: <20260122-dcif-upstreaming-v7-7-19ea17eb046f@oss.nxp.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
References: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0010.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::14) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|PA4PR04MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 29cbf5bb-9a4a-4c0a-6176-08de5995000c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|19092799006|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVJ3NWEwdnZwMmpCeUJNQUlYUVhpWmVycDNDQXNuOVk2WHdId3EvejZYSzll?=
 =?utf-8?B?aUI5bzlsMmlsdkJPMTRKcThMVXFRaWJtNVprQjRhM3dsTkFYV0NDZFVxclBU?=
 =?utf-8?B?QzhwODJhWWN2MlBja0oxdUZuSDJwQlR0Y2Jxd2paOGoyL3RyTEtpNVJEOFli?=
 =?utf-8?B?MzdYUXd4dDdFNFN2aldPNHNZUC94c0swR2NTSGFBVWJEdzZsT05QbGhPbVo1?=
 =?utf-8?B?aHF1Zmt3eEliOEl2YUIxSkQzRG96V1FTQjRIRHg5eEZMVDJmanMwcUl2UytZ?=
 =?utf-8?B?dGQxU3R3Tmp0Yi9iUEpTSkxDNVNiQVhJMUVXTGowKzBCWmYzRkF5ZE5Tdlo5?=
 =?utf-8?B?TzR3ZG1Zd2FRRFFXOXY4OGc4MTBCc0RCUGJFZEFHbVFYRXBiNzJXUDhpWWNm?=
 =?utf-8?B?dHphNkFQeGdtQVZibktmYS9xTUxQQ29ZaWtDZ3JCMTRTRFczZ0djNlRYRi84?=
 =?utf-8?B?S1I2SjNJbnR2WWQ4eWJvRTNJWG93K2daVXgzZ0FYZlBzaXA2SFNHN3JvV21C?=
 =?utf-8?B?MjZ2d2RZQjJQZThyL3B1VHNUcXd1dUtRSGFHNC9wOGJ3TkgrSUsyYkU1K1JO?=
 =?utf-8?B?aXBnVUdpSEIwNG05c3gvTVRlYjlCUkdCQ1FlZmdveGlaeTRMbzREbVBDZGNy?=
 =?utf-8?B?Z2J6UWRBQ1ZuY2x2RnhNK0xVVUd2cjRKdS9PNDlQS2t6a3BTSDUwdlRMd1VF?=
 =?utf-8?B?eWtEVTZQc3o1QVR0bzJSS2cvTjhoeENNU1g5bi9NZyt4VjNlaDN6dGJxRkJt?=
 =?utf-8?B?VVB2Z2FpLzRXeTE3SmZQdUV5SFcrdTRpVjFvNGVuR1FjRElienBkWG1nY1Zu?=
 =?utf-8?B?MG5JYmVuaDhaWjNtTXlGMG1Ca0NoV1AySFlGSnNMVWFraWlpYzNPU1JvRUx6?=
 =?utf-8?B?MXhGQ2lkRGNiODRhcUpXaTdqMVYyQURoRXpUWGJCWmxDZ1pJZ1FCZGEwNWZ3?=
 =?utf-8?B?UmVHSVdqbFdHYVdWY0NQMDB5QmU1T0h1bUJWOUdzV3AvL1F1U2xWd0ZYVXQr?=
 =?utf-8?B?ZXJ4ckFhMTJxdWxSTFdYaU11c1ZtWW1IdzNPVjJXSExVU1Y5V1F6ajFjQ1Iz?=
 =?utf-8?B?OEtITk51UU91Z0MyVFVLZGhoNGdRWlE3Tm82bVAyYXp0a2x2MHljSkFBSEND?=
 =?utf-8?B?R1crN3ZIUUhvakNGWnJISDFPdVdXRk5Ga0N2dzh6WCtRR3FMMDlEUzk4aWRF?=
 =?utf-8?B?TnJteXFzakR4Snp1bVNUSjhhcjdlaUdxYldJVWFUYy9lVVdNcFN3U2prcTAz?=
 =?utf-8?B?K2lMZk1VNDRTaUV4eXlhcU81WmtOZFRtZTBWRVVHanA1NHlWK016TU1jcFNE?=
 =?utf-8?B?L3hpc3VHKzVSZGJHdjV6WWRUbXJYQWlBak0xbFdkUnlDTFBPWGdsQmM1K2lU?=
 =?utf-8?B?bDZPQXVTckhWZ1NwMFRXQnBPQm93Qlp6NTFZaHF1SEsyTW9VY2pic05nb2NU?=
 =?utf-8?B?dWU0ZWEwUURHQXpTM09iaTI3Y0NZcldyWkZkcjZmVUxPSnFTRTFZUmN1aWpp?=
 =?utf-8?B?OElVV0JMMkZYbU9SQzJqL1dxeFBSYWZROXVGWk5tbFllR01IakVOUVY1TEtm?=
 =?utf-8?B?ZkhrMzNrU21mVk9xczRRUTgxUWJnaGJRNnYrZDdwcGg2MC9OclB1NFNNNlla?=
 =?utf-8?B?dEdhTzZUOGR5b3U5U292T2xIWnNYTEtscHJMUVNnUFNXaHF6RHdCbERuYzI2?=
 =?utf-8?B?SXZZaE55VGJZOFVhTFZoT1JiMkt3ZW9SMjV0L25DRHM1T2hDZUxvc01Vb2l4?=
 =?utf-8?B?aWEwR0sxYzZGSVFFWXVJbFduNkpnUEFwak55Sk8yVXhOb1ZibXpsN3BHL2pK?=
 =?utf-8?B?S2M2RjJweC9KQ3hrVyt6b1dYZktGbEVzQjR3L1I2NlhqYkxxR1ZQMVNUdkxH?=
 =?utf-8?B?cmdQRFdjM2pleDVoOWlneFR2cnRKbUtBZzMvSW13cy9iNHNvSU0yNlFZc2RH?=
 =?utf-8?B?MlA5UGRlcGFTOWVSTXdRVHdSOWt1YlQ2djNNSkRTcDYrYXRBTWQ1NUtmMG5I?=
 =?utf-8?B?L2JUdlY0aGM3QUFwTldKcjdBYmllRUd6TVpoczNsMWZ3QmNGZjQ2WHhXT21T?=
 =?utf-8?B?NFVjbnNoanZmc2ZHeEVmcm1CSlp2KzdsSmFrQm9MS0pvcURnaGF6eUlJQWdn?=
 =?utf-8?Q?Chow=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWhRRkE3Q3lBU2prV05WVm1MeDRtQXVJVGRmOUswMHJiNlZlL1NhSTJUM1hl?=
 =?utf-8?B?VGp6b2JnMjkvclNyR2ZKQVlIMUZYRU1OSjlEMzg2clhyV29Kdy9FUGlEV0RF?=
 =?utf-8?B?enpwbkRBOUdOWDNwNEN2VlZNQkpWZTN5eVJuRjA0THEvWHlxaGtaUXFWKzgr?=
 =?utf-8?B?cnRlYlk4c0M0eHVud25LeVh3MHVsU3hxR2lya0ZKanR3Vmx5Z05aeW1jMFhN?=
 =?utf-8?B?ODNOUUdjYktYTWg0aXNsSEVEQzhXZVY0am9ZM2s1dS9iZWkwT3dyUXhaRHVT?=
 =?utf-8?B?VkpnelZybVZSUFlNNjA0cmtMMXhwWVRUUHFkQ2kza2FaRDkyTFcyTHRSMnlm?=
 =?utf-8?B?RzdsM2NzRm1ydElOME1KSXBEa1V3bjhHYTU5aWx1Y1h6cS8yODBWb284NSty?=
 =?utf-8?B?V09YQmVwalRlSCtqVmcyeTFyKy9wc0tQSFpkUEZEYzR0QW9BektqaEpRSmVi?=
 =?utf-8?B?ZzRqWFdzS2pSWUJndHBFYUlvTmlncjBXeFdwdkVGVHZTaHAwV0wzdHZuQXBV?=
 =?utf-8?B?WHA5M3pBWDg2NTYrU21lNUNyRTgvVnErcTNIRVZmRi9sbXFReG15UXByQjFq?=
 =?utf-8?B?L1dncHRKSC96TDVwTUwzSFI0RElybkNwdE1XVnZ1THlXVEFDSklLN2ZiVDVt?=
 =?utf-8?B?WDVGa3BzUzhCeDhDeS9lZ0NIQXp2STJaeFAwN0YzdW9PeGNVelI4QlA3ZW0z?=
 =?utf-8?B?U1AvQVBYUERUeit6OUNsbUhWeUJxZGhKMGU1QTJNVnRQZHloVlFBYXcxV1JV?=
 =?utf-8?B?VFBVQ2p5TDFnekpsY3lUSkE2R2VwMHdSMkZLckdaRW5WSTB2NGpCcjlwbmZj?=
 =?utf-8?B?Skx0elBPZTdhN0pQVDFTYkJ1UFI0MDB2SW1tTVg1UDN4WEd6NmsyNUZvRjlN?=
 =?utf-8?B?U1NwWmI1ZDYvZUxkQmpoSWt0SnoxbEpvajI0SDd6UDNyT1dWU1VzRkZ1ZTZh?=
 =?utf-8?B?cmxSUEtrdUFqbUJjdDVoSDRCaVc4QnB5VC9uLzRnTU1XRHFNWU13M2MrRDU3?=
 =?utf-8?B?WXVqTkljQkVKU202UWlCZWFob3NLWGxZc2lVdjgydVpaSTVvRlBjdWEvOTIr?=
 =?utf-8?B?dG5uZ2hKeVFJUlV5UFNGU3JuRzVnL3BTQVRkeW9CcldLTFA5b2hCd1NrK2VW?=
 =?utf-8?B?TzVOQ1hFM3hZWkxpQmlhM0prZVdESHBINDA5M2RucTBuTFRHTWIxbzFEak85?=
 =?utf-8?B?Uk12c3V3T3FzWDVqbWxZK21jL0ZVNWp2YjNWaFhVSnh1Ykp2S0FMN2x2bDlo?=
 =?utf-8?B?UnQ5eEFnM1Q0UVBCWmZyaTJHOUZxTklwMVhQSlhvQmZXdG50QVIwbWl0d1Uv?=
 =?utf-8?B?NTRGV1BXcDluV2tHOU1LWjBnOXFwdVZQL3BmUjZaRnlXbEF5RlpPZk1mTjBM?=
 =?utf-8?B?VXBnVFlVQWdlcVVLY3VQUkwySSt2SXdzaEVHb25xd0VpbVJRTjNaaE9HMUJi?=
 =?utf-8?B?OXRaZFhMZEtNMDV4NXkzTGpzR1kvakVFeFpXOGZibzhoVkxBU0YyOVp2TDdo?=
 =?utf-8?B?bnYzbTBsS1gyZUNnaVMvWnlBQ3RZTG1HaTlUN2tsMmFTb0p3VHNobGcrcHU2?=
 =?utf-8?B?WjVGOWVISVd5V3VNOHpLa2FsME5NVjd0REZsS1JZT0lONjRDNE4xajhyVjlD?=
 =?utf-8?B?YWJCRUhZYjltTFB2dThoNzlMQVRSZmVUdDJ4ck9UT2gvM3BvQ05ITGpDSHRI?=
 =?utf-8?B?Wm8yTEVNWkl5YmJWV0VFSFF6eGxwQThOUmJwN0pJWEhkbHFGUkhUSTJZdWJu?=
 =?utf-8?B?bGJ6L01sWTFsNHpRb282U3ZXZDFIM1NyZ0lNTEhmUmxCTEU1KzJqVHgwYTVL?=
 =?utf-8?B?S1ZZdVcxamNwbUJFdGRnSHNLTXNZQ3ZaRHdMOWdLdUZ4VWNGTFI3anB0WUlH?=
 =?utf-8?B?UUZjM0tKWUExOEx6RWd0RXcxQXpZSlpSTjA5MU9CNVlweUtJMEpna2M5SlhB?=
 =?utf-8?B?Y2J3M0FqOXNTakFtVFM1QkpqSEg2QXJBMENXc0pIR3dzSVlVT3MwVzdkd20y?=
 =?utf-8?B?eFRXZlQ2Mk02Tjlhd3ArSXZ6NTZvaTBxSlltS1dKN2lWOTJMejM5cFpFQk9C?=
 =?utf-8?B?U2p4NVhyOUpNUTJVZkYyQjdZZThVN1A0UEJMTlI2SnZKaExKK3VhOXZFeHJz?=
 =?utf-8?B?Z1VkMUNyMmczYW1TcHgzL3U1K2VLMnhyVnJ6TU1oSnVmbTNwdmVkQ0lmcEU4?=
 =?utf-8?B?THhpL2cvRFA5enpqR1Z5ZUN3RkxKM05palZ5SGdia2JrbVdZeEhBMlZEVXkx?=
 =?utf-8?B?Q0cxWDRrTUFGUXNjeG01eTNUMklKdCtwMFNWOFhwM0tjYTFjb1FzaVdKajRH?=
 =?utf-8?B?Z0l5aElBUmpDaUpVWW1RckdLdXVycGU2N0NaZmcvWnN2NGtnbHJodVY4MDBj?=
 =?utf-8?Q?x4R9GsHvKE8yecn8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29cbf5bb-9a4a-4c0a-6176-08de5995000c
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:02:42.0750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5sVAplM8/CUIZ6r56FBbUfgUDq/TjVb4r6do0hF1p841SORH6+MwM6P4xvoy+7pTY0uSh/hGPD7puHOXZ/pTkw==
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
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.0:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,4b010000:email,4b0c0000:email,0.0.0.4:email]
X-Rspamd-Queue-Id: 965C064250
X-Rspamd-Action: no action

Add display controller and LDB support in imx943.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943.dtsi | 53 ++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index 657c81b6016f21270a1b13d636af72c14ab4f8ef..9a91beef54e8680a31db06b3afab4a20d780dc94 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -148,7 +148,7 @@ l3_cache: l3-cache {
 		};
 	};
 
-	clock-ldb-pll-div7 {
+	clock_ldb_pll_div7: clock-ldb-pll-div7 {
 		compatible = "fixed-factor-clock";
 		#clock-cells = <0>;
 		clocks = <&scmi_clk IMX94_CLK_LDBPLL>;
@@ -174,9 +174,60 @@ dispmix_csr: syscon@4b010000 {
 		lvds_csr: syscon@4b0c0000 {
 			compatible = "nxp,imx94-lvds-csr", "syscon";
 			reg = <0x0 0x4b0c0000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
 			#clock-cells = <1>;
 			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+
+			ldb: ldb@4 {
+				compatible = "fsl,imx94-ldb";
+				reg = <0x4 0x4>, <0x8 0x4>;
+				reg-names = "ldb", "lvds";
+				clocks = <&lvds_csr IMX94_CLK_DISPMIX_LVDS_CLK_GATE>;
+				clock-names = "ldb";
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						lvds_in: endpoint {
+							remote-endpoint = <&dcif_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+			};
+		};
+
+		dcif: display-controller@4b120000 {
+			compatible = "nxp,imx94-dcif";
+			reg = <0x0 0x4b120000 0x0 0x300000>;
+			interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "common", "bg_layer", "fg_layer";
+			clocks = <&scmi_clk IMX94_CLK_DISPAPB>,
+				 <&scmi_clk IMX94_CLK_DISPAXI>,
+				 <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
+			clock-names = "apb", "axi", "pix";
+			assigned-clocks = <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
+			assigned-clock-parents = <&clock_ldb_pll_div7>;
+			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+			status = "disabled";
+
+			port {
+				dcif_out: endpoint {
+					remote-endpoint = <&lvds_in>;
+				};
+			};
 		};
 	};
 };

-- 
2.49.0
