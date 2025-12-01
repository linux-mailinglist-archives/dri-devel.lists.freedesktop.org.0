Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FAFC98400
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 17:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638DD10E069;
	Mon,  1 Dec 2025 16:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="URknUD6z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011006.outbound.protection.outlook.com [40.107.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7514F10E069
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 16:31:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jy4QD3ZScuNPSnbIEVU1YTVr8cMGK4v/cPzaScoGsaZ0o2L9fLNUEwNxJnehZg5uVUS/c6XN/M1yxuoXPcGBHapx+ELJUdwCmLH5Nq8KHrQ5pE31HUc+Q8NScJHLdXXNYdc4iFetTmcB4feHXg3gUg4yhQJjBpxZCOZ4e4UlNfnQa3E97cXqnsA9Tj0LpuDv6mmkfPcFWqKoU3puTMI7jXZeZmBtHicnlMMXKPvD3Y1+DB14DV4vggIPAM4gpWVhlCBYps4exqOLGZz+rl9DQ72eRU3odiirvwaugrszZZnhmt99rhjpv0kXG4yHeT4pcEEvt45L12hGBEU3A8VzzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MByC5Sp5WhZsz7ZTxJas9o7CPOVqF5PRwoKhkEt6qTE=;
 b=VR+UGxAt3QEqYRuko8C/uNbUDgcAuUzwVjlR/d54knyqBpDXi7Ij1AhTlhbpZIkIO7KBk++4Jx0JnZgHKQY31oFGSpq0gAXiQtT2zrbbr4F94UAhtZjqOWoTfByGDsLqeSH/UpM9oh4TnJ9soHAKBnBw/8B4xGK9WLqxhPhp6Y76lU2MEdu0ceDpku1L/p91QBKw7PVO3HGosij2t9WdCzIRr2yU6h6xNNqV7J4H2zzKjJMYM2D2y5Q0puueCB9MQ/D/KxLSUP8VQnKaHfqXkluuqM8BMZ3NR3ySftyinozwAxQOZ69trmCspxpzeiaDN4I4dNpNKmO64PqwpRXg7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MByC5Sp5WhZsz7ZTxJas9o7CPOVqF5PRwoKhkEt6qTE=;
 b=URknUD6zOSgFfzJFC5HAddCNVF4sIgh191b37zBKHl6Q0h+m5GRFBxjzX/CQyYr0Fbp7YC6G9P7Aw9KbaO/NLvgrHMdYYINQsFiX9dDRq3J5WpTfepu5DSUqPyelwv7jnuK4wLG2lAqfJs8DEcNGOrDqqsouZc83dicqh+TBZxA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by MRWPR04MB11519.eurprd04.prod.outlook.com (2603:10a6:501:76::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:31:51 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 16:31:51 +0000
Message-ID: <f8af1ebc-c002-4f14-95bc-082474d8f187@cherry.de>
Date: Mon, 1 Dec 2025 17:31:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] arm64: dts: rockchip: Enable HDMI output on
 RK3368-Lion-Haikou
To: Heiko Stuebner <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, cn.liweihao@gmail.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20251021074254.87065-1-heiko@sntech.de>
 <20251021074254.87065-9-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251021074254.87065-9-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0037.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|MRWPR04MB11519:EE_
X-MS-Office365-Filtering-Correlation-Id: fd0ad5f6-24ad-4420-aa6d-08de30f721c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|1800799024|366016|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEhBVnp2L01zdFZ6VnBicXErZmZyNmFHcmdvcTR2dkJYejYxQWtrYjFkRVlw?=
 =?utf-8?B?TUo2TTNkMTRnOXhDZUFZaXZidzVLNGNXeWI1SWQzdTEyTFp4SldHcms4c2hr?=
 =?utf-8?B?R0RXN1BwVUVVaVpsQXhyNTRPNlhoRmlIeGVUK0p2bFYrVFVLQzAxY2xkOUNy?=
 =?utf-8?B?SFd2MEFhazgrRXNHNEhnVXJ1QmZUcDBNdE5NQmVmbEw4Q1dGdkJ3R1hIdkR1?=
 =?utf-8?B?dGthb0UzeE1pbGdZdjc2UGVPUlprN0thQzk1cjhFZUQ2MS9GNjV0eVQwTWhD?=
 =?utf-8?B?M045bS9iT0w1SkIvZVVkSHI4UHZUZG9wMlFieHRBU3BlWmpoYTZiZkNyNmlj?=
 =?utf-8?B?dExWTEVUcUdpUGpVQnNmVWZGRm9aT0dZZTNtRkdVS0tWb1I3VGVlM2xEZUdU?=
 =?utf-8?B?YnhSODZmWG9pbDJtLzZmWjk5T1N3a2QyRGVKLzVUQ3Z2UDFUK2lZdENiTlRr?=
 =?utf-8?B?OEU2c3VvNTBXaGFsd0JDNms5d0hTVVNZL1NuajFldFF6QmRFSUVYdVk1emwv?=
 =?utf-8?B?NkI1RFBRb2FONVh4MDZJU2JpSUdreGhhSUZjdmJmYUFJWEp1YU90c2ZzS1dy?=
 =?utf-8?B?dXJwY2dYcXU1YjdWek96OHVuUmFnRy9aVVIxSHJreHBjOGtPbkYzaHZ0OXVB?=
 =?utf-8?B?b2hEN2ZVd1daOWpVVnFWY051MmJlaS93UTJEUTVaTnN0bnVaTk80b2pEN3d1?=
 =?utf-8?B?U3FmeTBvVGhlTzFBYWY5MDJxa1l3cHB6aHlWZkdEc0hrVDNrSnVrQUtoQU1p?=
 =?utf-8?B?WUlPZjlJS0lPbUUwWFBqUk8zd25DUFJxS0pMV0l1N2F3WWV4NEVIRm9DRFc1?=
 =?utf-8?B?MHVPODFwR2pUNUgvMnJpTzA4SHpjeTI4dm5iVDlmamp6eHR5N3dqQXZMS1F6?=
 =?utf-8?B?K3JMa1lIWjl5dnVzMWVyUTVIakRCMy91Slg4b0UwbFZRY3lYSTR4NEVQRm1E?=
 =?utf-8?B?NlB5b3ZvRUFXUDhycXdDQ3dzQ0V3bWJZTWhqRlhNY1A3dHVVNHpCUm90Y29K?=
 =?utf-8?B?YnpVVGlDWXhqR0xGMDl6dTVuTWhOSFJUQytyYzRFVXB5cTc4RExZM1pUcThW?=
 =?utf-8?B?RWF1MTVWODdPYktCY0ZOVTJEYS9CTk1CMHJzUFdtMkJiclZ3aGdzMjVkc2ZF?=
 =?utf-8?B?SU1hbWhhWGY2UDlxYU4vRTlQMWM5ZkJiY2t1a0w3c1Nzc1lYMTFjNWw2TFNL?=
 =?utf-8?B?YjN5YTZCVmsyU1dxbStqWkVQbnU3eUhlUU5FYm55SW15SWowRTB5bks2ZVVN?=
 =?utf-8?B?SzY5ZkJ1KzhiNm5qUkxaN3lGdEtMWFpYQ2xGdU1MMUpZaUkvOXhkb2hEeXdv?=
 =?utf-8?B?dy9ZTTU4cjlDckZFc3ZEeXZab1Z0bkY2dk0xNi9Bd1FVSVBzQ2VydmpnUzhY?=
 =?utf-8?B?ek5JZDBGTGxINW91bXYraWp1NHN6N1Voaytab2NGbkc1R3ZuZEEyenFhaUQz?=
 =?utf-8?B?QnJEeDdLVnUzbUhLZFZjajNoM1orL3J1K3RqVGw0T3dPVS83aHZjSm9xWUhz?=
 =?utf-8?B?UFRIS1MzbkhmTVdtL2hycENSc2pqM1d3OU4xM3lJZFZmNjNNNy9HYzlxSnR4?=
 =?utf-8?B?TW9CVkRZa2RPZFEyTzVOVmplN24yNVRXUmo2Q1pibWllMDFHUFh0aW83YTZO?=
 =?utf-8?B?cGFDYWFoMlZuNXBQZjRaQUFEM3lralNHWXZWQ3FRWlBLb0ZiY3M2WDNvOExG?=
 =?utf-8?B?RHJLVFVTL29wVVB3a1VQOWVDaHNvYWJQaDBuZEVWMHBlUktObXVIQysrSVFj?=
 =?utf-8?B?V1NUdXhJZTdzc0Iza1hiQmZNbU1wUURVb2FBVmZTbWl4djFyajdlbHZvV09R?=
 =?utf-8?B?clNabERmRDdvemcwMXNRKy9Kc1pxYzJtUlB5Nk1CaHdsUUNkMndrZjFhZ2g5?=
 =?utf-8?B?aFRjek12ZG0vVHJDeE9EVTU3ZEovU0JPVm5VM2JJVUJNdk1iUXpZbnNRdnZn?=
 =?utf-8?Q?G0OeHnB+8wOUiHxXHDUbl/uzAzinJOC4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(1800799024)(366016)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmNIM2xXUWQ3V0d0eGtLbEE3MkpnYjRzMkZSRDNwZ3Y5am95RmN1V0hKRWVK?=
 =?utf-8?B?NVhHbzIzeVVyK2dhSVV2WFNtYnFpQjJqNFQzSVpuZUtVbSttenBWYUl1RVM2?=
 =?utf-8?B?RzVLeTBYKzdyUkhOdmU0MnhPRW40QWVNUXNtbEhid0RDTFZGUVA0YTZ2NlJH?=
 =?utf-8?B?MHQreHphaFlkRjJvaWdOaFhGY1d6MkhYWlcrOUpMUmU0YXFrSmhUSnRwMDFn?=
 =?utf-8?B?MjMyZ2VuRjZuRDgyZHhIMUpsNyttUGVQdFZRSkZTZTJWM1RWbzRoRkJRN3Bv?=
 =?utf-8?B?bjE2d1VaaDQxc21XWmRXK2J4UUh0aktUd3JoWjlxNTNUazZLTXkvbU1idWNz?=
 =?utf-8?B?bTFtTWhyODBST01nQlk1YS9hNnh3emRucDh3bHcwTWRyeVl2bzFmQnV2MGVj?=
 =?utf-8?B?T2FlUmZXbXorMXdINzR3ZVJEQ1pvdndQZ1d6MnVaKzcycllIM3g3SHZWZnln?=
 =?utf-8?B?Rm83bWJNSWlYcUhnOS94WHlsTXQ4cEVBS0M3SVZ0SVFqMmNJRFQ5aS9NbENx?=
 =?utf-8?B?WldLWER4Vm9BUnczZ2R0TFpDRFJvclZIMzdGNmRsT1ZEZGlXZzlvWkZiV0NW?=
 =?utf-8?B?YUxmSWpsUWdqVktCS3B4Yi93WVpVdlBBeGdSVFN4THhOejcyWnoweDBsMUc1?=
 =?utf-8?B?QVRWaE1ONm51aHdHUGFwWDhjTlJUOUt0bkU1dkZDZndGcEE1eUZsK3RMK2Zl?=
 =?utf-8?B?OElqRWE2QVVtTCs2Vk1DdGdjejlRc1BFbGk0WHVMcTltSXZ5YXlmbDIzMFly?=
 =?utf-8?B?MWZQNFhhVWVpNHViaWsyVXVaRlcyY2tEckdJTGFsYlN0R0k3N1pPNWV3bXRo?=
 =?utf-8?B?R2NCL003TEl3VjVFaXJ6dWpndXlKd1B2UUlVYWs1VFVEWkVoWnFxY1crWUZm?=
 =?utf-8?B?elI1SzZCcnJrQnVLbTQwN21sWk02TmltR3VUTTQ0ZFlYaHBIUW1KVjB2dDV6?=
 =?utf-8?B?dGVFUTdsTnhxSll6aU1DMGhzZkpuNmt0aUx6S0UvcWtWYzNveUxwY0lCS0NS?=
 =?utf-8?B?d2o0UHMvVTZKNTF0bmlCbEtIWVNaV3VCTkY4R1RDbGFISW5uSnROaTI2QWFy?=
 =?utf-8?B?MW5EMURGTjdUTnBPNDI1YzRGaUF1dmhuTEZtNU5XQ0NLTStrTHM0dWJoOFZq?=
 =?utf-8?B?ZzFaRXdJQVNnKzIyUnpXaTREa0pyOWloS0RLY01sMmxSQU5vNE4zbE9KOXhn?=
 =?utf-8?B?N2N1N2Fsb0h3WjVwd3AzTmF2bzNSYmx3WFZ5WVM4L2VzV2dDUTdwUmpqeGVZ?=
 =?utf-8?B?NnppWnVzOGptcUErd0grUGdDRG1VUHBRN0s4a3lTRXl5SXJOV3BaenFMaGNU?=
 =?utf-8?B?Z0Q4eXB0eDFSUWhkckpsakZTdDhKd3RudkpBUmdIdFptN0gyaVVQSzdKOFFr?=
 =?utf-8?B?bkJRblA3V1gxaFAvdjVpT0cxd2FYL1RiQlREODZFNjhEclcrSG92WnpWeTlM?=
 =?utf-8?B?by9KSmh3enEvcC9iZXJPVXFvNnJLSVlYOGVBREF3enNqT1RtbUk0T3FZMSts?=
 =?utf-8?B?bjNOdGRjYUF0cmkyUzJVY0E4K3JKTXVWUHk4K2FsZlZPVVlUOWl5MmJFZkxH?=
 =?utf-8?B?Yzd6bzQ4OWI3dGFiS3BSeVBEUWJndzJDeW1CM2NjU2t2V0wya3AvMitGUG42?=
 =?utf-8?B?c3FlcWV2NUVmSFlLK0hyWmJoK29DSTlDZUVOUXFLanNQbDcyVG43THdWQXI0?=
 =?utf-8?B?SHNrRFMyRHBVbUJ5WitpcTFNSHFCZVh0YnZUN1V5eEtBOSt5UWxFbVBoaEw4?=
 =?utf-8?B?Q3hiMXh4ckkxWkxqaTlBbWMvN2g2ZU1WcXB3M1pkOFVyY00ycHYwbGRZZmxm?=
 =?utf-8?B?OU1SaiswMTJzUEVjQi9PUmNpZzFsRmkwU3B0eW1mZkZ5c3FqRGVZWHRRazJi?=
 =?utf-8?B?RUhKYUNKNGFXWlpkRnFkUmh4UlY2RXBTWmM2cm16TTIxQjlNdnpIOHpGUFZ4?=
 =?utf-8?B?WVBEZXl0b0JkL1A0bW5zdHh6MWtOdGdXdUdQTnc4bTI3Y2l2Qnk3ZmR2bkUz?=
 =?utf-8?B?TGc2c2s1Y2hjQlJ2MmNJK0loNVUxRHlnVDczcW9rdGpQenlvekdwRVRlUE9W?=
 =?utf-8?B?b0k3UjFpeGxEemtmSEkxNW5lVE9ibmk0VjhLR092YUdRUTVxNmdlbjdjaVhB?=
 =?utf-8?B?Y3IvV3VYcWxiK1FnRGFxN2s0MjhNNnJzWE1pcENCVi9DRTFjRjZzMWtnQ3lm?=
 =?utf-8?Q?V6qKdT/lNT/NmbKoxo27Kb4=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0ad5f6-24ad-4420-aa6d-08de30f721c9
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 16:31:51.6277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZnpN1wL6zFwB0m8UAA7y9EwPileaKro4JLSWJGz9dKLG306CQkhjuXAuonyC15JAQ+z7tqvc0AsQYfysRS5t0+8SLuiYGekqHFY6d2yxhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11519
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

Hi Heiko,

On 10/21/25 9:42 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Enable the VOP and HDMI controller on the Lion-Haikou board.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   .../boot/dts/rockchip/rk3368-lion-haikou.dts   | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
> index abd1af97456a..a8eb4e9c2778 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
> @@ -58,6 +58,16 @@ vcc5v0_otg: regulator-vcc5v0-otg {
>   	};
>   };
>   
> +&display_subsystem {
> +	status = "okay";
> +};
> +
> +&hdmi {
> +	avdd-0v9-supply = <&vdd10_video>;
> +	avdd-1v8-supply = <&vcc18_video>;
> +	status = "okay";
> +};
> +
>   &i2c_lvds_blc {
>   	eeprom: eeprom@50 {
>   		compatible = "atmel,24c01";
> @@ -101,6 +111,14 @@ &uart1 {
>   	status = "disabled";
>   };
>   
> +&vop {
> +	status = "okay";
> +};
> +
> +&vop_mmu {
> +	status = "okay";
> +};
> +

This isn't alphabetically sorted (see &pinctrl right after) but I think 
it's rather pinctrl being in the wrong location than vop* as all the 
other nodes seem to be sorted properly, thus:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
