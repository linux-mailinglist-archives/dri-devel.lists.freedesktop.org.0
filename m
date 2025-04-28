Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45507A9F212
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 15:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDFD10E066;
	Mon, 28 Apr 2025 13:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Pjgf20Ef";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011038.outbound.protection.outlook.com
 [52.103.68.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD78210E066
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 13:21:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhfGezglWBPK1UrZ+MZo+zbevqMMxubnrQXaGndrUedscvrKU592dnzj6VxqHKLLpdp7gOIkLr/aLSKrUqD/IG5zLWDfbANnIsJr1a8KqqqzWuIYzUyYzOx2RlDIFwcH+T8UIVC49/PUXIgZ9kVX4RbStMKDAocjF2QazgKDi5h3uL7BvC1+0FFvjKDcv0B/STskR3rVQ6jnZSAt8mAPYVH68RZnxMxmfP0bQ/2fRwVd0Oxbk+1NOhbM0YeWgn5NiZoBcp6KgqZO8gZxT2L3SCR9bho7isQfIDHMndc4rv9hDy6uAgIQQz6a2LdyeuAkbGUCEHGlq1Dtjw7P2ZgdWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wi++58aweF6lUhWXjIZkLPNXcNXU5IKP2H/9muuuKF8=;
 b=R4mRDHRzBbteMviR1QtaPO4WudNpltEEs67JPiIMJKvUDZBQn4JBO0ACVZVG6D2mvnSegfs0tZnSvZi43xx25rF2JTTwswEM2GOq6WhRQnhAKx47YqMXIw49+TpKgnlGVLfZbLHquNuBZmplbAmSZh7sXkN3BM3kZYIdqEeEeTJi7N3k9IWXp2VurminCJ2yfcvMiR14PkAXmArQfLjGfGVJbh1UEwre5cgR79W2vGfarJzuRyxhzvnM2yYQM6xR2/ETunXZUU1eyuO6aBGlYvd7j5+5eWm2KUCtdejr84gBjMILHYta9eGVGyStB90F1IVCHkdnMEF7+1GmCxUN/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wi++58aweF6lUhWXjIZkLPNXcNXU5IKP2H/9muuuKF8=;
 b=Pjgf20EfgAN3FDDUnSyBCyUz3MyWJWnhYRaBRbqkij8g1k1JVJKAgqHNgAPVg580x5pJsIfE7RvAqpXJaKukUkbDYIe0U5vsJxcTmnI8AXACDHDbRSrCgrXLsgcObld/7oomFDByEjkrA98b7R88sy1qUoqur2JL2WUtJfmBVoL6WJpzxwv6IEcN2ZK9x7o2oBthP7kfNHbWXtpqVePYLz5T1x1XIYs2tdfij95ONxq+UDZFjBSS25eSXfwoBABdwkX5gVbxOUbuYb8PMeh0AVthTD7OGrx+8/60oU5NdmJTp9ZHwXw+ewhGM/PZ6UogTOqD0PY1YO6uUJnS5IO95Q==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB6353.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:4d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Mon, 28 Apr
 2025 13:21:39 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 13:21:39 +0000
Message-ID: <PN3PR01MB95971490B4D66F9CB2393E55B8812@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 28 Apr 2025 18:51:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/appletbdrm: Make appletbdrm depend on X86
From: Aditya Garg <gargaditya08@live.com>
To: "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Lizhi Hou <lizhi.hou@amd.com>, Aun-Ali Zaidi <admin@kodeit.net>
References: <PN3PR01MB9597FC692410388F94BE6981B8812@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
In-Reply-To: <PN3PR01MB9597FC692410388F94BE6981B8812@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0243.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::6) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <eb1aff1c-81a9-41f4-9f34-a615bcc321fa@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: f815570a-e2bc-47f8-70ef-08dd86579c08
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799006|19110799003|5072599009|6090799003|461199028|15080799006|7092599003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjd0RGxPZ3F4LzcwaWJsYnNJWlRUVU5vaW1JeTNYYkZ3YmlLQXVSS01ISWdp?=
 =?utf-8?B?ZmpibVFQYWE3YWh3N282TXVOL1lvd0tOSmFaSjJMd1pqaFpmSkd5V1pmM3JW?=
 =?utf-8?B?Zi92VEcwSVlTSkJZZHo1V1dIWmc0NTdCUFd3dXFUUlhRV0k4czk1VnpQblYy?=
 =?utf-8?B?alFqM0RLQlV1bmtVUXJTeWhpcDRyR3hUMi91L2c4eU11TytHSVRBMFhOQSti?=
 =?utf-8?B?VlMrVXNUU2NScHJPZnV3RXhGTzFkZlA5eXJEaXpaL1JYYUFGcDJYWlVJb3F6?=
 =?utf-8?B?cFd3TUlSTXBIK1R5b25uUm9ZSDZSSStoQjRnZlRJbHZ5SzBkNUNWRTRXb0FE?=
 =?utf-8?B?RWxOQTFxTDl1WjRsSlRiemhPOFRJYkd2c1dzS1JyeDVrQVFpaStFRjlPTmNC?=
 =?utf-8?B?Y0RIcE1LUCtpYVpyMDlEbVg2Y2lMRUNVbHB6Y2Y3UVhOVkVzOG0raHQ5VHd6?=
 =?utf-8?B?ajRtakU4alc0clhMMGFNZXdTRk15U3Y3bzNHUTF3WmtEUm42Z1U5SnZIcm1T?=
 =?utf-8?B?dWtCQzdKdUdUREJUbTc1bGxHNjQzR09BZzQvY0hDaUkvMzFoT0tyYWJrYTB5?=
 =?utf-8?B?d0g0SU8xY1N5WFUvblV5a2ZERG1hb2t4S1pRRGpibWN1U3lvOWxWeXQ0cUNq?=
 =?utf-8?B?eTdxK3I1S1dTS2pQY3RNMGtVVXd1SDY3bnQ2NTIzWkNOK0hDNmRtVk1KMjVR?=
 =?utf-8?B?N2phd2NRS24yY1Nzd0tINkwwckFjZWxpODhNZm91enEzODZ5M2hLOTlWVExo?=
 =?utf-8?B?N0tpbFkwL09NdmdZSUk1SmFLcmgyN1pJdVZvdUtzaXh3dTZIWmdqN0xUbk9C?=
 =?utf-8?B?UzFmdCtmZmlvQmdndm5YQnVzdW5qL1ROVXpSSHZuTzgyNlg1d0tsa0QwYXNq?=
 =?utf-8?B?UzFTeStsdmhEcXJXa1ZaRU00MzlhWi8ybitHTGJhc3YxdE83dERwQis3Z1Ra?=
 =?utf-8?B?Mk1hblFDcHhCWUwzWVZaWGJ5M0pGQytBdWQraXI2ZDZSaVZYMXlkSkZnWkpi?=
 =?utf-8?B?WmtLY2JONEVZcFV4cUgzWm5YNTlwS2FKWjByK0RQd3ppa1gvNnBpTnZVVGc0?=
 =?utf-8?B?NW5wN1M5MW82NUlBNTY3T2RtdEtqc05OMWx3Wk13eXdhUFBwbkJoZFY0clVG?=
 =?utf-8?B?bTJiczFERXdLMXA1Ym83ZlJ4dkwrM3RCNzBBNVF2UUtQWWdSQmszM3dhUWVL?=
 =?utf-8?B?V0MydjdOMlRBMGtBdkN3QnVWS09FczFVQ1JtVC9SY1pacElwM0NYVGpaN3pE?=
 =?utf-8?B?Qzh6eU9iMXlXYWtjOUdOK20wR3dtd0ZkemxZMThOLzUzSWk1SG41a0RTbEU2?=
 =?utf-8?B?MU9naWhzbm9xUmFvZ0pOb1hDSjRwYlB2OXhPSUlwZlQwb3F4WWozMEVCUCtR?=
 =?utf-8?B?Y0lML0hOamtRSzFaVzlaa2ltcy9lczlwQ0o3UFU5TFlUVWQvRGdpcWNzRjZ2?=
 =?utf-8?B?eE1LcjY3QUdiY1dZQ1NzUFQvY3U1ekRSYitVMld4dm1MWnJSa09wL1pGZ0pK?=
 =?utf-8?B?N1ZPYVU5cHFqSEJyTFZiT2VMbkxtOVZieFFXck9JM2JQaHRBbWNhQ00vTjNZ?=
 =?utf-8?B?M3lvdz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTQzb3R0VDJua0VDMjFrNGI5Y0tVYWhOclhERDRDY3A1ajI4V1RLUEpaTlBH?=
 =?utf-8?B?UDVnVzVGSlNsUjRTV25oNVk1ZmRIRFluKzdHSWlub3NCcGE2RjU3N2dYcXJh?=
 =?utf-8?B?eFQybTZFMVFrM0lnWVFUVHYvMjkvMzNWa2dCMExtdkIyZGxrelQvMHVCU1N3?=
 =?utf-8?B?SWRyR1FOT3hkd0tVY3ZFb1FFbnFXUW0xU1BiOHpnLzZqNnRGZldGVmxSNWJv?=
 =?utf-8?B?aUtQdmtTN3B5TG5TTmFWR1dxbmlZUFZzUTNwU1g0UEl6VkF4Y051YkMzc2Fz?=
 =?utf-8?B?NFNDTXY4RlpzQ1dld01uZUFjZWwvVERLOXY5aTBBalhxV20zckFNK0dycWhn?=
 =?utf-8?B?NExvaEo3RFd0ZmdkYmE0ekV3Nnd3SzV2aHhSR2IvSjlNSHZLTWU5d0JnMVp4?=
 =?utf-8?B?Q1Vjai95YXZqQ05USWlFQ0xUZkpSazJFdlZPSW9LcXZvZk0wZUNzblBFVnZ2?=
 =?utf-8?B?NENyOHdvMU5nRGdhM3QxNDIwNXJlZ2l2WGRGNFVJS3oyM2VPd0lCUWR1cDJ5?=
 =?utf-8?B?MGE0QzVhY1dnK0hQM05QSy8vRWdPdEVUbUxPSUNzYTUzYmtzS0FCc0N6WkRx?=
 =?utf-8?B?SDJGSzhqWXAwQTBhZHNrNXlDcTRleXNuTnFwcDZZRmVLYlR6NXk3NU55dkZ5?=
 =?utf-8?B?ZEJTeTNQSVRCYlcxdjVJYVExNktsOUt3ZDRxdzc4UncrZkpsQ2h4dEVkN3I0?=
 =?utf-8?B?ejVnazVqajFibWFydUZsOENSMnJuQmlvbXdJUmd0YXo2WHJaNzUvN3QvRHNy?=
 =?utf-8?B?eUs5QlAvVDNXc0lYR29ub2djc2ZkVnd5U25NdW4xRlFzQnAwKzlwb0lqcDln?=
 =?utf-8?B?bWR0cGZrZ2twZERsOEoyWE1SRkJ6SHNsRVhMN0N6K3NRVENGeVZzaDBKRGl0?=
 =?utf-8?B?Qy9lNW5QbjVsVUhSSExycVJQVWR5N3Z5SUZXeWlVaUp2THNzLzh2UDlwVXZ1?=
 =?utf-8?B?VDlMTm51WXhiUkJVRzNRcFpCTGtDOXFFSnF2RldIRE8xVTNoUXRMSUlsOElT?=
 =?utf-8?B?MStpbVNCY1lRQ2lLVm1rcDdpSTBPWUEvdmNsZ0Rzc1oxUWpnckpaMENOR1RS?=
 =?utf-8?B?amRtSytGanJQMDlSMUpvbEJiWkxkUHZOUnYvNzdVTi9kWmVaNVVYY0NXS2hP?=
 =?utf-8?B?M01OU05UT2hrTWk4MFpUdVhPTTdBbE11ekV3TzR6ZmE4anVxM2g0clRSZlNW?=
 =?utf-8?B?NHBhQ2tXVHA3RmtSZDM5WXJ6WEx3MjNxREhJWGxVRXB3OEVTaDFDYTlSNTVu?=
 =?utf-8?B?bnA1Zk51aVNEeUgxUWN6NzVZUlJtYmI5TVlCMUozd1VvT2Y1VXQ3WE5UQzM0?=
 =?utf-8?B?M2IxVzdQb04vQjZYRkgwN3RybkNOUkc2Sjc0bFkxQkhpZncxQWZySnhDSTZY?=
 =?utf-8?B?RlFXdjJGQTFjMmtRUmpyc216TEl0Q0FPSzNjaEJJTjBUTm4rNS9adWpwQmRY?=
 =?utf-8?B?cWFGVGJPRTJuT2VnRWJ6Q25iZldTRm1IamVaSGxYMndWNHRnMFM1VERmT01z?=
 =?utf-8?B?OFExVEQrNStlbnFmaWhNY05LVVF1RWlCTjlHZHU3NFc5NURGRkI0OGQzT3Zh?=
 =?utf-8?B?ZkgrZlZBNFV3QytYUW5IRnlLRE84L0JlZE9RVWNxMU5rN1BHaFkycG9DVlNY?=
 =?utf-8?B?dS92Tk5BekhWcnlmdG8vc2M0UHM5UUIzSXhMRGdjc2hvNkVURE5sRkIyWFEr?=
 =?utf-8?B?SE0yYmVTQjZPVmdtd0tBZ2NiWXMvYzJEczFlenZTZjIvTzdBY3lCcWRUMXZY?=
 =?utf-8?Q?jLXWPvj2iyIsAkqPrIiz90A89j8bAxgkJyszEM4?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f815570a-e2bc-47f8-70ef-08dd86579c08
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 13:21:39.6797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6353
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

Ccing the mailing lists> From: Aditya Garg <gargaditya08@live.com>
> 
> The appletbdrm driver is exclusively for Touch Bars on x86 Intel Macs.
> The M1 Macs have a separate driver. So, lets avoid compiling it for
> other architectures.
> 
> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  drivers/gpu/drm/tiny/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 95c1457d7..d66681d0e 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -3,6 +3,7 @@
>  config DRM_APPLETBDRM
>  	tristate "DRM support for Apple Touch Bars"
>  	depends on DRM && USB && MMU
> +	depends on X86 || COMPILE_TEST
>  	select DRM_GEM_SHMEM_HELPER
>  	select DRM_KMS_HELPER
>  	help

