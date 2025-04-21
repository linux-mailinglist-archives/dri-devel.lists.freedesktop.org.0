Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F06A9520C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 15:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8429810E0CD;
	Mon, 21 Apr 2025 13:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Q8QF+TUi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010010.outbound.protection.outlook.com
 [52.103.68.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9391D10E0CD
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 13:54:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdWYN3CZryBI6UFq5fTEbePuc9XelhRT/sjg2QDXJ4lo0o0ycNnRUy5/AwS6EVfKh7SOcimwdHiq81Vk05aj/ubCaD0q9IFN3NnQ4PI/Yeuea9mTOdcQADRsIkxOaJqQ0XhUaSUvm1U+0FWnFbGgAGCIih313uj00ptZtEUJqAdHBfGXXiJJuUoH+8oCSaeLXjujyZmelLZqcanYzFJ3Xp4+eF4j4GVfhbi6wDpk0EDJzmAfrTO1w1gikysNMiYptCFt+fJX/vTGYJfxRBVql+Zx3ua7bFpHCxKJ3JyWV/c/4rV79o7jghGi3lN39X4Pl2RoFtxdXFu2MlVJxc56mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqSHStR6QEJCbTVTIknGm0ADF6fDsYmMVh/1b07LDpU=;
 b=fdBMkhcluZtJrT8KPyzdcP698yMKG78q8mO691EfsAeDUyaN4MpDg3wGskA3sffSEq+zjzQ8RauLbX/tnBQCzlFBTNYlhAENGPphPw4o3NhIynYEknw8Gboy640OBsDtM+7a7nObtztVY3QOyUFAD0fsGlVBH+VRE1esLvuN/P5ofED4F3A61Wx3aEdMrGLVQX38aaTzeFDFWGzRpVqQvqdwooLUMe2Z4yl+DM4HYbCv8V5S/8V7Kp89/Pa4IK8H/lsOzWA5TWgwJgkkPyTeSuuPvATjdaQmE43toVenJ8+fzbdI5M1PZBA2/YjZmtShxXG1hgfVEKhgU9NjQ3Ljog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqSHStR6QEJCbTVTIknGm0ADF6fDsYmMVh/1b07LDpU=;
 b=Q8QF+TUikvEDs/xaa1aKajtQ9g/TlxkHLGCEsov/gB9P1RKrNSgUlVk30jQEDv2zufohKTwpdZ/uDEl8E6zpBsAvFHFlTzyAkCb1caJ7/LKE0nGFdqY80Q0ffW0DFkJjqL18E6xTUY47h/VaRlu4z5zRWH3is+rhA64rEf/aKtvzGjCKWpQoZCKf80h72BmMAlKW5GVNCRY8c4q9Q5T6epFvmMrLyQzNx4FpgcyZWLu9rN8g74z/7yKj9TTyMkDBhVz3BZ1gdTd0d9b8JQqA850z278VNb6nKDmf+jfq4ZCbm9zoGR/K9/fyIBBByoDsvO/lQbgPgFQKvznX+wSCFw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB9820.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:13c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 13:54:45 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 13:54:45 +0000
Message-ID: <PN3PR01MB95973648BB4FECBB2E24C5C7B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 21 Apr 2025 19:24:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Use proper printk format in appletbdrm
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 airlied@redhat.com, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, tamird@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Hector Martin <marcan@marcan.st>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597D506487C3133B0358CE5B8BC2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAY0hRvNCi0y6rlt@blossom>
 <PN3PR01MB95978C5635B676286A9F0EB7B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAZDApE-Wm_NlbMx@blossom>
 <PN3PR01MB95977FDD2F4DF6D9E198C516B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB95976BAC455F10F6D75B9C84B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAZM0svrO2MiNAdg@blossom>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <aAZM0svrO2MiNAdg@blossom>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::10) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <daa7101e-12ae-456a-be80-fec0e127eb77@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB9820:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a8033f-9dac-4dea-a98f-08dd80dc12b2
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|15080799006|7092599003|461199028|6090799003|5072599009|8060799006|19110799003|3412199025|440099028|12091999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3kvb2tPK3p0SGRob3BlaWFieWptYWFsTnRBRkdSOThGTkkzRU51NFUyZlkr?=
 =?utf-8?B?T3BET0doR3NTWDROYS9xcDlkUGxveDVuMFZpTFNkSm81b1NDakFsUFNDZjQy?=
 =?utf-8?B?T0tHaVRjb21ySFNNSmFxVlA1WldVdkMybmxDNHZuSjdrZXJnZ2lMOGc5ZkRP?=
 =?utf-8?B?SGMvNjcrRXhrTUJDNjBQUitRVmNLZjhvN2pZRHZmd0oxZk4wSVpSaGtON2VY?=
 =?utf-8?B?OGFsYUdkS2dhaDRNZGlxdTFEN21vNmt4ZWpJb2lQSFczVUgvRmZicWlPTG5z?=
 =?utf-8?B?a1JqdWtrWEwzWmJZUllxT3E5dnFaS1FzM2MvOXROVXVPaU50T1BsK2poM3Ir?=
 =?utf-8?B?WnV4NEh3WDUvVjNzTXJYbzhBbkxDcWZKa25qem05RkQ1cnBGZWQ2S0ZSZHF2?=
 =?utf-8?B?aDB0MmFwQkR6MmZhb3hlNzh0WElENUUzRE4wMDFVWW1oUFRxa2NEa2Nrdm0w?=
 =?utf-8?B?K1phaXV2a2VrRis5a0hZMmRyazV2c0dYR0VtWnJaT3ZQT2ZjWjlDK3Q0RUs2?=
 =?utf-8?B?NUMzTmgzZWNkT2tnL1dhb1pVSHZicUlZM3FBV3ZRVDR0ejlEQkJWNzBlWW1z?=
 =?utf-8?B?cSsydkRBN2ZiNmljT0NCMEhOQ1dTY05pTEF2SUEyQ005Skk3OE9EaFpvM2xD?=
 =?utf-8?B?ME5YdTRSZXdWc3MzbGRURnFRRWEyZjA4VENmVERPbXAwTVpOVmdvOHZDYkVE?=
 =?utf-8?B?SHpLdDZtY0xnM0dKNFVWc1puNUNDTDVBQi9kM2o0d1EvTlZsYnBaK041MnY4?=
 =?utf-8?B?R01SYWt4ZXZUbHRTMktoTVN0UkFDQTdtQjA3WnYyeVRRK1RHZ1ROL1Frc3VU?=
 =?utf-8?B?QTkyK1ZqRytpQ3F6TXZESStUaVlJdDRyTFY0VVkxVkRrTHF6aVhsQVo1UzFW?=
 =?utf-8?B?cEg1REptaXBzQjRFTmp3NmRPcjIxM2g0djRDYm1ldVhNZ3VONi9wQVBFWDBr?=
 =?utf-8?B?SkNNSllpclQ0ZUFlOHJDM21YZFJnT0FSU1h0Z0VSOGVtdjhKd05HbGxZL0Yw?=
 =?utf-8?B?cEx4Z2wzNEw4MnBScGEzQVc5TmFmQWJ1U0ZjRStrSGxudTZaWHM5SDdTa0pp?=
 =?utf-8?B?LzhOa1VNS2wrNmlVVE1NY01OSC9FeXF2WUZjRzNsRS9PVWZvdE5hcm9vRy80?=
 =?utf-8?B?UEp0U05GeXI5NXZQRXdDeWdRcTI4V2FUZ0lIRGdZUjg0bEtDU0NVS1BRT3ln?=
 =?utf-8?B?TW5NcWJ1Rld2TEwwemR1NkxQelYzMHlkaXdrQjhlelEvWDNOOUd4K3FlTHJu?=
 =?utf-8?B?UDgxZ0Z1SitDSzJCZkVVKzBlSjFPOGhOYTAzVk95Zk1wZkI3YVZ5V1V2MUpo?=
 =?utf-8?B?NksrMzJyRlJSRHdsVndaMjBScVFwa0JxMVlLeFpGYVRXTVN3RG5nU1RCN2hr?=
 =?utf-8?B?TjlPaEgzeU9lalk2MkJSNERzb3BvN1Z0M093ckFkZ002RERzWjNzWHIyQ1Vt?=
 =?utf-8?B?TVdOVmx1RDVoQW1TWWRaZlJ1MndoZ1ZPalZtWHdEQSt0ZUt1Q3pWUFdyaGdu?=
 =?utf-8?B?RVpWUzdUL05oTWVZc2Z4Ri9nWjhUdWY4cEU0TXQ5dEliZzZvNGJkMWo1eStJ?=
 =?utf-8?Q?RW9HBQdJOdLQLTIN6kK+0KyR8=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TklHU29kMmRPOWdTdUFmNkd5Tk1LeVlkNU9Xd0t5bkE2bHRNYmYzN05VMmtI?=
 =?utf-8?B?VDhLSmVJUmVnMnA5NjRKc0hUa0RLZWt0cVNtNzU5R1RRdHNzN3ZaUEVXc29N?=
 =?utf-8?B?ci82czFKRWtMNTFBZFVJL0RsbG9KNWJCSFR5MWNKVjluRFRhY3hSSWNwM1lY?=
 =?utf-8?B?WkRDZ0cxU1IwMjNzNXBIbldMcnJPSzk1anVSQUFqWk03S05GSTQ1VkZoY3hX?=
 =?utf-8?B?cnhzaVZubkpULzBPTklyY20rSnB3TlFVNXNlaDJDNjBDdXlwS1I5ZlFOaFF6?=
 =?utf-8?B?bEpwS2lEeVUvUHFpbXZ3K0FOdXB3cy9QUkptVzVkVWtSeTNYVmJNNTNXVFBC?=
 =?utf-8?B?cTFjcU5hTHZPN0Z2ZzVHWVNkVXVROUFMMS9kb2pQQmtjWDVrZWtpNFBaMzBk?=
 =?utf-8?B?LysxaGpGclQrcy91Z2JabkY4MkZabTMwV01lWXNzQ0ZPNGE2M0lUbDhhTlN0?=
 =?utf-8?B?R25DYUxBbXNzNW5TLy9lM2tMb3RWN093TWFrYTZQdzFRc2RjSERUSlI2eXdy?=
 =?utf-8?B?ODZLUHZwN0JMYmFxVDJKZVVRYklnUjQ1a1lZWEloa2hnN0YzdTFOUDl2UVJT?=
 =?utf-8?B?U3hlTTRLbnI3dXBZVkplTkVCZmdUV0FjQlB1TDlncCtocXJySFVKRllDNXlo?=
 =?utf-8?B?SlhvTVhGdWdpajIxRWl5Si8xYzdPZzJUUzFlY09IdkRZWDAxczBidkJZUVFw?=
 =?utf-8?B?Z0J2ZmFDbE45KzhvUHMzSW9kcmh1VlBTU0E1OXYvNFBYTmhpR01CSWszSCt2?=
 =?utf-8?B?SnRSK2JNNllRSG9MaDl6Z0g0cWdnRTF0YW9RMkp3bTY3TFZWcHU5Rm9XWExV?=
 =?utf-8?B?MXNXTXJRTUpQOFBuOTZGZFpoaDlkZU5BcXdwKzQ2VlA3amVTU0s5Nk41WjR2?=
 =?utf-8?B?bldXRy9NQTZpU1JHdVZZL2FmdWI1VXM2cUxJSmwreEZMdk9YTUQzeUhqQUNN?=
 =?utf-8?B?bzFUWGFWK2hWMW5zN0sxb1pBRlZLSEpqTjI4b0F1aVBicGFtemVZY1FvU1Ft?=
 =?utf-8?B?NVdrZHFJOEQzUFNrL0pvWTBYVVpuK2twWk1NcGF4azhHVzNHQ2xUMi9LeTR3?=
 =?utf-8?B?T2RtL20vTVZSVmQ3Qmo4aU9HcWlHeUQvQmNqR1NlTmhWeTlIcGFqQmVZREtj?=
 =?utf-8?B?eHdqNzQvNlZud1FhamZQWm05eG4yYlVnN0hwYTB5Qys3Q2xPVVg3VnlQZDZL?=
 =?utf-8?B?NHkvYWRqQ3JoSXl5U0FWTi8rakxHNnkzdHJ0YkRUcnpDOWs1WUMrdFBkVnF6?=
 =?utf-8?B?Z2dMbDlhMVdRUWR3Um9XbjhhUFE4SEZOSjRTUHhiR2drTjV1bVJ3UzF6TW1v?=
 =?utf-8?B?R00vTXpGalFxUkdScG1xTkFoWVoyYmN1WjRBcitGakFmYllQVTl5eHo2WDRv?=
 =?utf-8?B?NURBZjBHenhuMGRVTmZoSWJLb2FycU95d004cFhydTlHVlBlc0FZWm5xeDZE?=
 =?utf-8?B?N3BxOFR6R1FvVVlWZE1iSVZOS3RWUGsrekZSMFFENU9DTXpHV0V1NEFhbTVx?=
 =?utf-8?B?SkxpWGd0dWpwS09jZC9nVGtBcXBjMWxsaW9PTk1pNStibDJqSW9UU0J6SFJp?=
 =?utf-8?B?bE1TU0hheUg4akFxNUZtQTlOMCtoeUpKaGJSdTlGVEFQN2hDOTFZYzV6U0cy?=
 =?utf-8?B?Ti9LcC9CQ3gwclNzOXFubndkS2xGeGZZMmJqYVEzUWFlbE1JVzhrUHdtQUtP?=
 =?utf-8?B?QWtoNVAvWTl3WXdZalBHb3JmZGhkNnpBTUVxVVVsQmprVFE0cmFiVU1pL0dv?=
 =?utf-8?Q?2r6JhIr2lcutNU1TJ1n+qjJJLhH2KZWZC8chzFx?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a8033f-9dac-4dea-a98f-08dd80dc12b2
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 13:54:45.3625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9820
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



On 21-04-2025 07:19 pm, Alyssa Rosenzweig wrote:
> I didn't realize this was so subtle with the backporting. I don't think
> I can take this on, sorry.

Any change needed or just because some other maintainer manages this? Although Tbh, I really don't care about backporting since T2 Mac users are still using patched kernels provided by us. I'd rather free my mind in getting this done.
> 
> Le Mon, Apr 21, 2025 at 06:40:23PM +0530, Aditya Garg a écrit :
>>
>>
>> On 21-04-2025 06:38 pm, Aditya Garg wrote:
>>>
>>>
>>> On 21-04-2025 06:37 pm, Alyssa Rosenzweig wrote:
>>>>> On 21-04-2025 05:35 pm, Alyssa Rosenzweig wrote:
>>>>>>> Can I have a feedback from some DRM maintainer on this? AFAIK merge window is over for some time now. It's been more than a week and last time when I submitted, it just stayed in the mailing list without any feedback.
>>>>>>
>>>>>> DRM hides the merge window from committers so that's not super relevant.
>>>>>>
>>>>>> I am a DRM committer and can pick this up if necessary but it's not
>>>>>> clear to me what's going thru with DRM vs elsewhere.
>>>>>
>>>>> All the three patches are intended to go through DRM. IIRC Petr, the vsprintf maintainers had requested for that to be done.
>>>>>
>>>>> The relevant patches have been Reviewed-by Petr as well.
>>>>
>>>> OK, will queue this today.
>>>
>>> Thanks!
>>>
>>> Also, Petr has requested them to be backported for 6.15
>>
>> To be more clear, he does not have objection for backporting to 6.15. Although its your call. 
>>

