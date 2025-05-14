Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000CBAB66C0
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 11:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B6610E3B1;
	Wed, 14 May 2025 09:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="BvHAvyy/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010022.outbound.protection.outlook.com [52.101.69.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907F710E28C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 09:03:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Po5pvWh8FZQjk0s4tgIb+yE0tbsCdCk6RG9px4X+Va08hnNaGm2U5jbU6cMq9z+VVZYKb8Um0XpG8aVT4MBEetcqaiUeM/aT6oAEaMZV17OxmX3ZnYG1V6WAUOgYKf/T8F6RsVDA4uuSRs2UstRGFGdPWjWdH2mpwIyemnK3bjA5uFELTFPajGiB+Y1p1tOnJVCdECNP9eywaJGYEoaTVnKazRZRs4S4AvnfhYlUTz7mIas5VK/RXfzv1RTtNlKsLR5u8WFC/9Kp2tF/RbpFIYzg99oao1u4rSwLqgP6AnGXkjeN+vy5+Tny8GluB6bZGRiy6xHmV+39IFKbPD3ELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8Fn+aByEzY/p8B1wuBIq6rKQpVW9+3LWgKzTEdNyko=;
 b=EE1WVtnDJqqW2X1VDQbqUEUb4GcX4NNKl8qQMFs8lMFuZl7acoGzdBXms+d4V8J3TFx9SuuxenrXFcHyGvQrSfwM1tMGH/U3z6ivCZ3FAOnZX8FLKcRnVjh0ckDQUDdbTcux0XfmZgu3WEwekao6cHgnxPdpjEQ3bruMW9QpPnkCF0Oj26fWwAGQwg44pNeH8mEquNlsJz81Aj0nfMPoq27lzsMGtlTk76KsQXpoH2JOgtlB1+MjFQC1GolSLp80KXRE/oPJL/CuVm6XqMGYZfKV4WjENDfCTsDOmSQlThdF6aLf+3NksGTVuz1+MQt7yfvwZZ9hLuQHe5Nsb9M6+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8Fn+aByEzY/p8B1wuBIq6rKQpVW9+3LWgKzTEdNyko=;
 b=BvHAvyy/tCTX+coApAq5lzvrOzXau81eogoUos3mXQNUqu3DXwS2baEEM003rR5OIhlBmdr7aRqu/5qHPf9BgkxVjUu6HRgou90UcTroRAbZg218NaU9NWEboZfmb2I7TY2Lc++wOCbN39c7u52fy/dCQaAP4oesh4/17sqK0T24++M2UVchoY12BNSgwpEgfM7AfkBGHKG0kDGz9ftpf+d3hV/a8OiGQrbRNxesClvi1Py9Y2eXP2L+C/sejHYbAVve+Vm0MJicX/75ilBuQQ+4IG49L98On5lOiV7mPo3uHZ27mMXPfumnRsC88H5voeLfsoWSORUbhzkS+VfbOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7776.eurprd04.prod.outlook.com (2603:10a6:102:c4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 09:03:45 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 09:03:45 +0000
Message-ID: <63d611a4-9e08-4ba8-bc4f-9c1845b628b3@nxp.com>
Date: Wed, 14 May 2025 17:05:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/19] Add Freescale i.MX8qxp Display Controller support
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 Frank.Li@nxp.com, lumag@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 u.kleine-koenig@baylibre.com, francesco@dolcini.it,
 dmitry.baryshkov@linaro.org
References: <20250414035028.1561475-1-victor.liu@nxp.com>
 <9253e2cb-8e39-4b3b-adb2-48a9693a6e5f@nxp.com>
Content-Language: en-US
In-Reply-To: <9253e2cb-8e39-4b3b-adb2-48a9693a6e5f@nxp.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:54::24) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: bb2124d1-a12d-473c-630c-08dd92c63b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWF5ZHJGbU53emh5K3lJUEtLN0NKTFRYdHp3WTk3RlU2NDNaQnJQdEo0WFlB?=
 =?utf-8?B?RmFIdnVXUlVrVUtOakNyNjVVV2NZejZRRHBDZWs4R2FqNWh3ZWdzbzgvQkpT?=
 =?utf-8?B?OFFMRk1KR2Mwam02V0NZY29IMEJXZTJUUkNSb0ZjNWY0QksyNUZkejZqY05F?=
 =?utf-8?B?dnNRQ1BlZ3hwQnlUWUppTkU5MjVBWXFhQnFEdnpHcDYzOHdHTFJSZGZWeU5n?=
 =?utf-8?B?MTVWSWFKRUhXTHFLQmxnUXpvaU9kcnU4RTlxSW9YNUZISWpSSmlzbXR6SWF1?=
 =?utf-8?B?T08xMjNia2JYVktjNTZQOWZ4dGFhcGlCRWI5Misxb1RSWlU2QTVXSFN2QmlT?=
 =?utf-8?B?dzUySGtMblkrS1pNSlFBYVZLZGh2Qk9iR3g3ZTF0K2xWb2FQeGhiQ3RDNjlN?=
 =?utf-8?B?ejRJYmFWcTJySEVOQi9qeVNaTFc2a25nWDNQTXNqckpUb1E0d28wNmNSc2dH?=
 =?utf-8?B?UU54aE9lNjBoNzY0ZURhU3J6MmhuVlhIMytodmp0ZE5ZSlZVSXAxckxiL2RN?=
 =?utf-8?B?emtGcmo2UmVxODRSNEZ2WVhmQit2NjVrRmZFenE0M3RoVWJaWGpETzY0WkVo?=
 =?utf-8?B?RkZLQmhqTGVPcVZkYllSNUhMMEc5d0JXQ2JmdmdKeTZqWHlMU3RERkRiL0t0?=
 =?utf-8?B?VGxtZnZuUDU3cmFPNHVnZnhIOXZRUzU0aE9BRkZEVHZZZHdVQlRsUnBQUFdk?=
 =?utf-8?B?RlUwamRxU1dXM3JpczhkVVg0S1hYTllTUGR4MnJLa05VSGlBWEhRVWg1TmJr?=
 =?utf-8?B?WDVPY0hNNkdMbUF1WGRoMWo3YWNraDhYYUh2a3FtQ25jOHBJMFJtbEw5d293?=
 =?utf-8?B?Q0U2eXViZk42aDBQZ0kxSWFrSnpJYklhOGZNUm50Y3FUMEt3d0Uxb3cyYno5?=
 =?utf-8?B?U05MLzhQdjh3Y3FYU0xBdkVkdHRqWnFrR2hpc1IvRE5nUkt4RlloOWdndnFv?=
 =?utf-8?B?c1JtOEJCUCtQSHJKQ1kya1dnNXU4U3kzOWhpQTlQNm5JeWNTUnVkZE1pSVRO?=
 =?utf-8?B?bjVNNVFSWktJd3IrTERwSXZDZjBRNjFwbW5WTm80LzVEUHlRMjEyblR4Tnlp?=
 =?utf-8?B?VEVUbGNUWFROc0w2SDJ0VkpFQ1dwbERibkZRUWowUE1Kdk9lU1FSN2xYMHh1?=
 =?utf-8?B?MjM3aUhKcVpQb2RNZzZQOERjWjZxNm9BMCswV3FTeFI3WmttTEhYd0xpSVZw?=
 =?utf-8?B?RlR6K1V4dVhaWDBPdDZHWXBqN0ZyRWc3K0ViN2FneU1kbEtCUnZ0SFdiSFl0?=
 =?utf-8?B?ZWpSdWlEaC9NVk0yK1BSdFpNN1crNHZldFNwa3lDbHlTVW4zbS9lb25hOG8x?=
 =?utf-8?B?MHUxVXJpdFJYVGRRc3prSXpsMDRsWHFEWDl2UW1NNStkTlVaWDBMcTVzUUl3?=
 =?utf-8?B?YlVEeG9YVGV0enJkdFRNSGorTURlc2VMQm9vd1htZUEwVXhCZldEZXV6S3NB?=
 =?utf-8?B?TDUvQWFxakRjajNWYlJpYy9ZWVBqRkdVcHFXRXM2ZkJiZDRtZTFSUjZzSXZZ?=
 =?utf-8?B?L0dqTWdSZUxySzNrKzg2WkJLOWlmSjJ2Qm1wSU5uNzdsWTJQVGFxakJVS0Fj?=
 =?utf-8?B?TXdXRHpOUFBlQllzelJ2TElJdGpSVzFHQjFnalZVdWVXelpPNGhWMWY5MkpK?=
 =?utf-8?B?ejNTSVFGV1F5S2VWYXFXcG1FcDIzOW1OY004eklYN1AyOFM3RWJOd3pZMWtt?=
 =?utf-8?B?RGV5aWE1N1ZGNWRZcmI3WGJ2ODJnOCtUQXVWTkMwd3dBNFVkMDJGN2NIK2pV?=
 =?utf-8?B?U0I1NUFWUTVTeU4xNTREenZlamJ6K3hOY2RWcFU1RTlvb1NRVllSMEFSTVJ5?=
 =?utf-8?Q?OugiRV9Tp9or72hlqy395Kf/r6E6RcfMB6AcA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enhDYTdQQU5ORjF0WFJiOFpuR3NEYzFqRWc3MGtWTEFwZ3RDbVpxaDhsdkcx?=
 =?utf-8?B?b3E0UmYrb0ZOYndYN1F4VlhwSUZwekFySzZXbWtESTZZclZXOCtaZ1RTOVg5?=
 =?utf-8?B?WmVsamt4blF4VXVoaStoTDVSZmhiMjRJSlBOZzEwQ1BBUTgyQXVzaVdYUWYr?=
 =?utf-8?B?d2xRM0NQdXNZZWx3VlAwRHZmNitwd21uU0ovbmpTS1IzVFpqRm1BT1VyNHI3?=
 =?utf-8?B?UnlnZE0vYjREOW5aaGVTV081Z3pvdmlEZncrM3lvenB5MDVXekxxbklvUTF4?=
 =?utf-8?B?ZURGYWhESU9pRmhrVjBoV2lSQ3VXSmtzSFFaUDMxQjV2bUMxcGZZK2EzRUtE?=
 =?utf-8?B?UDNvRVc0TjhvMmZxb2NsUjJHQ3lqN3JTRXhxTVRUbERpR05BeVlKTzBTMHNZ?=
 =?utf-8?B?RHpORjZPYVNSbWZtRXU5NGJ6cWg2SXJ3UEZ0Y0ZSTlkxbE9ySDRrUVpUR2Yv?=
 =?utf-8?B?Sko2dGt1TTR0ZlUydzFsbGdqRWxYeGdJampOaXhTYUZXL2hnYjV6Z0ZvVHZk?=
 =?utf-8?B?U291NWErTTF1NzF4OVN2MGhDTWY4akFvYU1ZVFlZVXVSbUw2UlRhWE5lRWxt?=
 =?utf-8?B?bm51SElCMy9SMVVuWGpDSjdqK1B5bnk2TnYvMUk0eVNrdTFXN2lRcWdmd3I3?=
 =?utf-8?B?R2ZKNEpYV1N6VjlFcEpocGhtdEdnSWxZZXA1Wm8wK3F4aEhSQWU4Uk1jVlhX?=
 =?utf-8?B?N0o1U3ZsWjdkUEpVSi9RSy9OeVJ1ajJTYUtsODVlZDFOQXoxTXhPOVptNGRp?=
 =?utf-8?B?ZzlwS1BMSmtGdEdwM01PdTQzcmhUUmo0cmh4SVZrbFlXSHowN0htRVRjNFFD?=
 =?utf-8?B?Snh0cmdjMVVNVVVMUE5sWEc4R3F6WUErTzV2cXV4SThOQ1luaHVJNWJaUVFG?=
 =?utf-8?B?R2F4QlN3aHMzbVZaYklGcE9wWVJHMmVJWmdZZmI5SGxrOHVtakszeFBiTUxi?=
 =?utf-8?B?SU43OVk5Um5CVlJkbjZmdXVEbngrNEJ6eXVkMEhsYkFZUHBYVWN5ZXBFaGt6?=
 =?utf-8?B?eVhaZE05M3pHZnl0Sk9oNlRHUU5wbFFTb0UzTzdUZmk3QU9paTkxeFcwV1A4?=
 =?utf-8?B?U3lBK3JINGp1bXBhUGNmOXpPYmdxZ3Z5WXVBNGR5UFZsVDVyZ2JUcEtZaDV6?=
 =?utf-8?B?NnRBRXQyS1VhWVFDWlpDVlZOTTdFcW11RDM3Mnl1eFYxMEM2aXAyVHZmM1g2?=
 =?utf-8?B?WFhidExoUlFVNWx4dFBrYmx2MHh1bHlHWUJ3ZmU3OXpYWUcwUTdUcVZ2Zjhr?=
 =?utf-8?B?bnBYOU44YUZvRGtpcUNKTnJ5VlByWWQ0ODg0QmZ3VmNkaTRrVEl3WVJmWGJD?=
 =?utf-8?B?R2QwNXc0N2pNK1FGb0tCMTFyK1NDL3N0VGF6cmd2OTRwMWhQaGZ5SDd4MWsv?=
 =?utf-8?B?R0d0YjVmbW05elczb05vd1RoOEE3dTBHR3pkUEpuQVQ2RUd1ZDBlbEZOZ2VY?=
 =?utf-8?B?Y29LbHE3SUNEUm1NcmJpaUFkZFJQaUVOaUJDODZYeEFmQk94V3VZWjhvN3Zm?=
 =?utf-8?B?OURVeDJxVnpta2V3N0dEQ005WnhobDc0ZERIVUZ1TU5TQVErRGRXOVd4U2tl?=
 =?utf-8?B?aDQ5ekEzZnJ2bDlDWVQ2QmNBRnRVeWE4bklsMmZheTRnYzdQSHpCcHp1VG1T?=
 =?utf-8?B?eTJrNVBnb1NteFpYWnVqeG01dysxWS9CaWJpcHhINWxlSmdNTGxsUWJjaHNw?=
 =?utf-8?B?cDk4UXpQZXJSYm9UM000UnI0eTF0N1RTY2dtY3Fnb0ZqVXFrdXhKamdtYmJo?=
 =?utf-8?B?N1VOb1owYnZSN25sM1NRYm81ckoyWG9xK2U2NmZPakl1cTdCS3MzSFNRT3J4?=
 =?utf-8?B?U0lyck15dHpKMDhCY3hsS05IaUc1WWFVbFg4V0FxN2w0UWdWeStnL2hVYXJt?=
 =?utf-8?B?em1xdTJsci9jK01qZEFYWDdqQzloS21QV095eG1VNXdkNlFMaXNlbExraUUr?=
 =?utf-8?B?dE1Qd3hVN3ZubjNqWjRiOWlxSjUyckQ2M0M5MHdUTzdrS3grVkgxbzByQVdI?=
 =?utf-8?B?MXdNSnZjcFY0Uk1rYy9ZVDRMOXBVUk5uQUNyT2s5blFlUzdoZVpzcDU2RGRr?=
 =?utf-8?B?K2NQWnJKUUVJUUhYQjJCRE5zRUhlN0EyQ3U1TGpDUHlGTzBXZEM5T0c3T016?=
 =?utf-8?Q?Rrk2h5u95TF3TkozLKG4jzTsp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2124d1-a12d-473c-630c-08dd92c63b58
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 09:03:45.5748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ove0ZMsy6eOZvUgLE3D0c5YP8p5xuuOhSxOk9lTIMsuOWtpg0bRJNu99pJ00bcmTIfJ2Mar/6BxQZB5FPR7OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7776
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

On 05/07/2025, Liu Ying wrote:
> Hi Maxime, drm/misc maintainers,
> 
> On 04/14/2025, Liu Ying wrote:
>> Hi,
>>
>> This patch series aims to add Freescale i.MX8qxp Display Controller support.
>>
>> The controller is comprised of three main components that include a blit
>> engine for 2D graphics accelerations, display controller for display output
>> processing, as well as a command sequencer.
>>
>> Previous patch series attempts to do that can be found at:
>> https://patchwork.freedesktop.org/series/84524/
>>
>> This series addresses Maxime's comments on the previous one:
>> a. Split the display controller into multiple internal devices.
>>    1) List display engine, pixel engine, interrupt controller and more as the
>>       controller's child devices.
>>    2) List display engine and pixel engine's processing units as their child
>>       devices.
>>
>> b. Add minimal feature support.
>>    Only support two display pipelines with primary planes with XR24 fb,
>>    backed by two fetchunits.  No fetchunit dynamic allocation logic(to be done
>>    when necessary).
>>
>> c. Use drm_dev_{enter, exit}().
>>
>> Since this series changes a lot comparing to the previous one, I choose to
>> send it with a new patch series, not a new version.
>>
>> To follow up i.MX8qxp TRM, I changed the controller name to "Display Controller"
>> instead of the previous "DPU".  "DPU" is only mentioned in the SoC block
>> diagram and represents the whole display subsystem which includes the display
>> controller and prefech engines, etc.
>>
>> With an additional patch[1] for simple-pm-bus.c, this series facilitates
>> testing a LVDS panel on i.MX8qxp MEK.
>>
>> Please do NOT merge patch 14-19.  They are only used to facilitate testing
>> the LVDS panel.
>>
>> Maxime, patch 1-13 have already been reviewed by maintainers, can you please
>> consider to land patch 1-13?
> 
> Gentle ping. Do you think it's ok to land patch 1-13?
> I may try to push them to drm/misc if needed.

I've applied patch 1-13 to misc/kernel.git (drm-misc-next).
s/irq_linear_revmap/irq_find_mapping/ for patch 11 before the push, because
commit 4d90cc80aa1f ("irqdomain: Drop irq_linear_revmap()") drops
irq_linear_revmap().

> 
>>
>> [1] https://lkml.org/lkml/2023/1/25/120
>>
>> v9:
>> * Rebase on v6.15-rc1.
>> * Collect Rob's R-b tag on patch 6.
>> * Collect Dmitry's R-b tags on patch 9&10.
>> * Collect Maxime's R-b tag on patch 13.
>>
>> v8:
>> * Drop instance numbers from display controller internal devices' compatible
>>   strings. This means switching back to patches for DT bindings in v4. So, add
>>   Rob's previous R-b tags back on patches for DT bindings. (Dmitry)
>> * Get display controller internal device instance numbers through register
>>   start addresses of the devices in patch 9&10, instead of compatible strings.
>>   (Dmitry)
>> * s/shdld/shdload/ for IRQs in patch 9/10/12. (Dmitry)
>> * Drop dc_plane_check_no_off_screen() from patch 12. (Dmitry)
>> * Drop id member from struct dc_de from patch 9. (Dmitry)
>> * Add dc_{de,pe}_post_bind() to patch 9&10, to avoid dependency on the
>>   component helper's way of implementing component binding order. (Dmitry)
>> * Add dev_warn() to dc_lb_pec_dynamic_{prim,sec}_sel() in patch 10. (Dmitry)
>> * Drop lb_links[] and dc_fetchunit_all_fracs[] arrays from patch 10. (Dmitry)
>> * Collect Dmitry's R-b tags on patch 11&12.
>>
>> v7:
>> * Drop using DT aliases for display controller internal devices and add
>>   instance numbers to display controller internal devices' compatible
>>   strings. Drop Rob's R-b tags on some DT bindings patches. (Rob)
>> * Drop using typeof in macros and explicitly define variable types in patch 12.
>>   (Dmitry)
>> * Add a comment for disable_irq_nosync() to explain why _nosync in patch 12.
>>   (Dmitry)
>> * Inline dc_crtc_check_clock() in patch 12. (Dmitry)
>> * Use global drm_dc->pe in patch 12. (Dmitry)
>> * Drop dc_crtc_disable_at_unbind() from KMS driver in patch 12. (Dmitry)
>> * Add kernel doc for struct dc_{crtc,drm_device,plane} in patch 9/10/12.
>>   (Dmitry)
>> * Define common IRQ handlers separately for each IRQs in patch 12. (Dmitry)
>> * Rebase this series upon next-20241220, so drop date entry from drm_driver
>>   and correctly include drm/clients/drm_client_setup.h.
>> * Fix regmap_config definitions for display controller internal device drivers
>>   in patch 9/10/11 by correcting name field, correcting read ranges and setting
>>   max_register field.
>> * Get instance numbers from device data(compatible strings) instead of OF
>>   aliases in display controller internal device drivers in patch 9/10/11.
>> * Collect Maxime's R-b tags on interrupt controller driver and display drivers.
>> * Trivial tweaks.
>>
>> v6:
>> * Fix build warning by expanding sizeof(fu->name) from 13 to 21 in patch 10.
>>   (kernel test robot)
>>
>> v5:
>> * Document display controller device's and some display controller internal
>>   devices' aliases in DT bindings. Hence, drop collected R-b tags from some
>>   patches for DT bindings. (Maxime)
>> * Replace .remove_new with .remove in all drivers. (Uwe)
>> * Select REGMAP and REGMAP_MMIO options in patch 9.
>> * Fix patch 9 & 10's commit message to state that display engine driver and
>>   pixel engine driver are component drivers instead of master/aggregate drivers.
>>
>> v4:
>> * Collect Rob's R-b tags on DT binding patches(patch 1-5).
>> * Replace "fsl,iram" property with standard "sram" property in
>>   fsl,imx8qxp-dc-command-sequencer.yaml in patch 6. (Rob)
>> * Use regmap to define register map for all registers. (Dmitry)
>> * Use regmap APIs to access registers. (Dmitry)
>> * Inline some small functions. (Dmitry)
>> * Move dc_fg_displaymode(), dc_fg_panic_displaymode() and dc_lb_blendcontrol()
>>   function calls from KMS routine to initialization stage. (Dmitry)
>> * Drop dc-crtc.h and dc-plane.h header files and move relevant defines to
>>   appropriate .h header files or .c source files. (Dmitry)
>> * Drop futile "else" clause from dc_crtc_common_irq_handler(). (Dmitry)
>> * Drop dc_drm->pe_rpm_count. (Dmitry)
>> * Drop DC_{CRTCS,ENCODERS,PRIMARYS} macros and only use DC_DISPLAYS. (Dmitry)
>> * Drop drmm_kcalloc() function call to allocate an array for storing IRQs.
>>   Instead, put it in struct dc_crtc.  (Dmitry)
>> * Call devm_request_irq() to request IRQs, instead of using drmm action.
>>   (Dmitry)
>> * Call devm_drm_of_get_bridge() to find the next bridge. (Dmitry)
>> * Select DRM_CLIENT_SELECTION due to rebase.
>> * Select the missing DRM_DISPLAY_HELPER and DRM_BRIDGE_CONNECTOR.
>> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
>> * Drop unnecessary private struct dc_*_priv from DC internal device drivers.
>> * Set suppress_bind_attrs driver flag to true in DC internal device drivers
>>   to avoid unnecessary sys interfaces to bind/unbind the drivers.
>> * Make some fetch unit operations be aware of fractional fetch unit index(0-7).
>> * Take DC interrupt controller driver as a standalone driver instead of a
>>   component driver.
>> * Replace drmm_kcalloc() with devm_kcalloc() to allocate an array for
>>   struct dc_ic_entry.
>> * Call platform_get_irq() from DC interrupt controller driver to make sure
>>   parent interrupt controller driver is probed first.
>> * Use DRM_FBDEV_DMA_DRIVER_OPS due to rebase.
>> * Replace drm_fbdev_dma_setup() with drm_client_setup_with_fourcc() due to
>>   rebase.
>> * Replace drmm_add_action_or_reset() with devm_add_action_or_reset() to
>>   register dc_drm_component_unbind_all() action.
>> * Request interrupts in dc_crtc_post_init() after encoder initialization to
>>   make sure next bridge is found first.
>> * Trivial tweaks.
>>
>> v3:
>> * Collect Rob's R-b tag on the patch for adding fsl,imx8qxp-dc-intc.yaml.
>> * Combine fsl,imx8qxp-dc-fetchunit-common.yaml,
>>   fsl,imx8qxp-dc-fetchlayer.yaml and fsl,imx8qxp-dc-fetchwarp.yaml
>>   into 1 schema doc fsl,imx8qxp-dc-fetchunit.yaml. (Rob)
>> * Document all processing units, command sequencer, axi performance counter
>>   and blit engine. (Rob)
>>
>> v2:
>> * Drop fsl,dc-*-id DT properties from fsl,imx8qxp-dc*.yaml. (Krzysztof)
>> * Move port property from fsl,imx8qxp-dc-display-engine.yaml to
>>   fsl,imx8qxp-dc-tcon.yaml. (Krzysztof)
>> * Drop unneeded "|" from fsl,imx8qxp-dc-intc.yaml. (Krzysztof)
>> * Use generic pmu pattern property in fsl,imx8qxp-dc.yaml. (Krzysztof)
>> * Fix register range size in fsl,imx8qxp-dc*.yaml.
>> * Use OF alias id to get instance id from display driver.
>> * Find next bridge from TCon's port from display driver.
>> * Drop drm/drm_module.h include from dc-drv.c.
>> * Improve file list in MAINTAINERS. (Frank)
>> * Add entire i.MX8qxp display controller device tree for review. (Krzysztof)
>> * Add MIPI/LVDS subsystems device tree and a DT overlay for imx8qxp
>>   MEK to test a LVDS panel as an example. (Francesco)
>>
>> Liu Ying (19):
>>   dt-bindings: display: imx: Add i.MX8qxp Display Controller processing
>>     units
>>   dt-bindings: display: imx: Add i.MX8qxp Display Controller blit engine
>>   dt-bindings: display: imx: Add i.MX8qxp Display Controller display
>>     engine
>>   dt-bindings: display: imx: Add i.MX8qxp Display Controller pixel
>>     engine
>>   dt-bindings: display: imx: Add i.MX8qxp Display Controller AXI
>>     performance counter
>>   dt-bindings: display: imx: Add i.MX8qxp Display Controller command
>>     sequencer
>>   dt-bindings: interrupt-controller: Add i.MX8qxp Display Controller
>>     interrupt controller
>>   dt-bindings: display: imx: Add i.MX8qxp Display Controller
>>   drm/imx: Add i.MX8qxp Display Controller display engine
>>   drm/imx: Add i.MX8qxp Display Controller pixel engine
>>   drm/imx: Add i.MX8qxp Display Controller interrupt controller
>>   drm/imx: Add i.MX8qxp Display Controller KMS
>>   MAINTAINERS: Add maintainer for i.MX8qxp Display Controller
>>   dt-bindings: phy: mixel, mipi-dsi-phy: Allow assigned-clock*
>>     properties
>>   dt-bindings: firmware: imx: Add SCU controlled display pixel link
>>     nodes
>>   arm64: dts: imx8qxp: Add display controller subsystem
>>   arm64: dts: imx8qxp: Add MIPI-LVDS combo subsystems
>>   arm64: dts: imx8qxp-mek: Enable display controller
>>   arm64: dts: imx8qxp-mek: Add MX8-DLVDS-LCD1 display module support
>>
>>  ...sl,imx8qxp-dc-axi-performance-counter.yaml |  57 ++
>>  .../imx/fsl,imx8qxp-dc-blit-engine.yaml       | 204 +++++++
>>  .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  41 ++
>>  .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  44 ++
>>  .../imx/fsl,imx8qxp-dc-command-sequencer.yaml |  67 +++
>>  .../imx/fsl,imx8qxp-dc-constframe.yaml        |  44 ++
>>  .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 152 +++++
>>  .../display/imx/fsl,imx8qxp-dc-dither.yaml    |  45 ++
>>  .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  72 +++
>>  .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 141 +++++
>>  .../display/imx/fsl,imx8qxp-dc-filter.yaml    |  43 ++
>>  .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  64 ++
>>  .../display/imx/fsl,imx8qxp-dc-gammacor.yaml  |  32 +
>>  .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  39 ++
>>  .../display/imx/fsl,imx8qxp-dc-matrix.yaml    |  44 ++
>>  .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 250 ++++++++
>>  .../display/imx/fsl,imx8qxp-dc-rop.yaml       |  43 ++
>>  .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 ++
>>  .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  83 +++
>>  .../display/imx/fsl,imx8qxp-dc-signature.yaml |  53 ++
>>  .../display/imx/fsl,imx8qxp-dc-store.yaml     |  96 +++
>>  .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  45 ++
>>  .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 236 ++++++++
>>  .../devicetree/bindings/firmware/fsl,scu.yaml |  20 +
>>  .../fsl,imx8qxp-dc-intc.yaml                  | 318 ++++++++++
>>  .../bindings/phy/mixel,mipi-dsi-phy.yaml      |   5 -
>>  MAINTAINERS                                   |   8 +
>>  arch/arm64/boot/dts/freescale/Makefile        |   2 +
>>  .../arm64/boot/dts/freescale/imx8-ss-dc0.dtsi | 408 +++++++++++++
>>  .../imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso | 183 ++++++
>>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  34 ++
>>  .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     | 240 ++++++++
>>  .../dts/freescale/imx8qxp-ss-mipi-lvds.dtsi   | 437 ++++++++++++++
>>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   7 +-
>>  drivers/gpu/drm/imx/Kconfig                   |   1 +
>>  drivers/gpu/drm/imx/Makefile                  |   1 +
>>  drivers/gpu/drm/imx/dc/Kconfig                |  13 +
>>  drivers/gpu/drm/imx/dc/Makefile               |   7 +
>>  drivers/gpu/drm/imx/dc/dc-cf.c                | 172 ++++++
>>  drivers/gpu/drm/imx/dc/dc-crtc.c              | 555 ++++++++++++++++++
>>  drivers/gpu/drm/imx/dc/dc-de.c                | 177 ++++++
>>  drivers/gpu/drm/imx/dc/dc-de.h                |  59 ++
>>  drivers/gpu/drm/imx/dc/dc-drv.c               | 293 +++++++++
>>  drivers/gpu/drm/imx/dc/dc-drv.h               | 102 ++++
>>  drivers/gpu/drm/imx/dc/dc-ed.c                | 288 +++++++++
>>  drivers/gpu/drm/imx/dc/dc-fg.c                | 376 ++++++++++++
>>  drivers/gpu/drm/imx/dc/dc-fl.c                | 185 ++++++
>>  drivers/gpu/drm/imx/dc/dc-fu.c                | 258 ++++++++
>>  drivers/gpu/drm/imx/dc/dc-fu.h                | 129 ++++
>>  drivers/gpu/drm/imx/dc/dc-fw.c                | 222 +++++++
>>  drivers/gpu/drm/imx/dc/dc-ic.c                | 282 +++++++++
>>  drivers/gpu/drm/imx/dc/dc-kms.c               | 143 +++++
>>  drivers/gpu/drm/imx/dc/dc-kms.h               | 131 +++++
>>  drivers/gpu/drm/imx/dc/dc-lb.c                | 325 ++++++++++
>>  drivers/gpu/drm/imx/dc/dc-pe.c                | 158 +++++
>>  drivers/gpu/drm/imx/dc/dc-pe.h                | 101 ++++
>>  drivers/gpu/drm/imx/dc/dc-plane.c             | 224 +++++++
>>  drivers/gpu/drm/imx/dc/dc-tc.c                | 141 +++++
>>  58 files changed, 7928 insertions(+), 6 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
>>  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
>>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso
>>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
>>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
>>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-cf.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-ed.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fl.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fw.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-ic.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-lb.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
>>
> 

-- 
Regards,
Liu Ying
