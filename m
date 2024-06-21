Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C78EE911B01
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 08:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D5C10E24E;
	Fri, 21 Jun 2024 06:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ghvwrqzo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9A110E24E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 06:11:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hw8HDRlPXKgGR0wZ6ppwwQGWWuL02w++2B8mtJpsN+Q30HoT60ikG5KHtgw6oPNdzwEvHNFwGuuhORMejzrgJlPSMNgmMw0F+ZAx8CFjS0CJTylALz+o9Z+sFsKoOqh3ko0zm9gsisUJY9fE/0VBUvtN4TdqXwVQFWoA5+lh/RjIH0dXlO9SoNO5EeEIYMGNd4XCP3OEZh0sflMG97J20yjH9KvxcgneEqwYDkxp70eIhRbXhtAwOyjr/o2r2XnAqrUMm9Oi2LvMIgLRFgVcQfaIFvm6FrukaXDWbNfSCoVC08TcSdg3tJ0IsBnyflI/tw+bFHA1LlKguNUI6wTzYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtBUdWMJJTxlR7KQNqWlCBgQ0UISPwyW2AWv3DaKteg=;
 b=mEt5AWOgK8B01hvIOeyXwmKlblRHLwzEz7eRN70BadCo/5XFWxRd4W//Io6ZiZbXZKEyYIGSmESPGia3ZH6lkGF22lwh/wbZT8LjqPTcxI3C1gQxGQKZbSL4gKtWHlJcocicxwNMu3f3IaCCrlKbMdvFeMgAxhsXMdlFmtrRdsCCVUmpiBRM66m4v61XjpQekBZvFZ/cYu43kHyabwxskOmFokDvQjRSqLxt7mRz+f9jgAKe6Q/Y8XyAN3Sq/3GFHxnxY6IZMh8HjAUR83CbZEJK2oQfyrW+sSDryjZBTpY48YMUfI5XqFhM5YNl6mkPYwCL6C4jaiaQQ+oicxtQvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtBUdWMJJTxlR7KQNqWlCBgQ0UISPwyW2AWv3DaKteg=;
 b=ghvwrqzohMjyyb8YHcrCW8R1yr7zIReeUQLWvZh3lQiK/3Ho48XjWtpjh8T3XFQl/M/X6zZs5WRMAdweqi5WrlFaLnVKStfMuFvLZf5uMmi/zspa/Dy9zSpOjeYp++ovXAlA/jsLl26Xq5JCGVNwItGamXq0qyNqGoafSKHh8gw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by SA3PR12MB9132.namprd12.prod.outlook.com (2603:10b6:806:394::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 06:11:53 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::27fc:3ca2:d76f:6f47]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::27fc:3ca2:d76f:6f47%6]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 06:11:53 +0000
Content-Type: multipart/alternative;
 boundary="------------W00y1vFqksdLT2QiFWIJNV5l"
Message-ID: <f0158a5f-6f1b-1544-90c9-8d5f7bd3b981@amd.com>
Date: Fri, 21 Jun 2024 11:41:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v14 00/12] Improve test coverage of TTM
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
Cc: dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <cover.1718192625.git.karolina.stolarek@intel.com>
 <462151b9-be3a-4a77-8455-c879623ee1ab@intel.com>
Content-Language: en-US
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <462151b9-be3a-4a77-8455-c879623ee1ab@intel.com>
X-ClientProxiedBy: PN3PR01CA0129.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::8) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:EE_|SA3PR12MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: 8292930c-a7e1-42fe-d570-08dc91b90b8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2R2cnFCTTU2ZkJ1a2pTbG12Y0dKRGxRY2x3N0RMa0I4UkRSTHdxdG00K2Rp?=
 =?utf-8?B?NkNxS09pbVh3OHN6Mi9DcC9pOGNmKzhkek9Yb2YzUyt6SlNZUDR0UHF4Z2hp?=
 =?utf-8?B?ZmQ4VmtPTFh5bGdCdStwbXNaNlR4K2FRaXRyVUR5UTNDVjBZdFQ0S0ErbFRQ?=
 =?utf-8?B?dzY1cEZEdmZvOHdvY1Zua25yZStLNDladXVBS3hmbmFDUDFvQUZSYU5YUEg1?=
 =?utf-8?B?MmZxOU41RXVEQ3p1aml1cW5yVGdLM2dvVkJSSDdiYkRSYjhIc2dBcXJWOXU3?=
 =?utf-8?B?VTJyeG5nNlVsallaaHdQZ0ttcmRheGxRbXM2WTJ4Kzg2cmtmRzNGZVpwUzRR?=
 =?utf-8?B?d2w1c2JMdmJzTGQwSXlMakJDbTFaaHkxU09UZGZjR3pEQTJqa01mS2NjS1pz?=
 =?utf-8?B?WStVVnNXRmMydnpadDI5ejBMTXdVRzExeFUrL0hNYTBBZVAzYlNRd2hndXg3?=
 =?utf-8?B?ZUlZc29UNmJLMitzMkxGdGN5THR4aC9rS09pQjRxYmlITUNqSjBWMmdhejdD?=
 =?utf-8?B?YVFiVWlTa2wyZjg1clBQaUtVOEpabVVGVmtmR3RsUXMySFBDazFvRndaVHlK?=
 =?utf-8?B?MnMrVmQraWJJUEFnMGVsQnBwR1A2aXpwUTZQNnNoblBOSkRxR1JSWnFscm9k?=
 =?utf-8?B?c0c1M1p1ampQSjhjNDdXWEtaZWg4OWl5cHUzMy9DQjdXSmZ6UUNINEZ6TVhE?=
 =?utf-8?B?TmgyQVpZekdMcHN1R0EvUzZDUUs1bUU5VU9XK3VQdE1xcGFhZmVGSkliSyt3?=
 =?utf-8?B?ZnYveFYrZ0dmR0xkb1RmdHNQV3krL1Y2Y3FwU3JvTk4vTTY3M2QzMWVEZWsr?=
 =?utf-8?B?dWhPakVSTXNPSHo1aGRzVlhNam1zOHpkdWtRbVA5aEd3SGg3aW94d2tlWmxP?=
 =?utf-8?B?Z2xqYUlIM0QwZzhGZitZQmJHRDRPWDNnbmtxWjdjZ0k1cWxuZXlVcjFGd0Iv?=
 =?utf-8?B?TytkQ3VFUTk0U0lveUxFcG1JUExNSkpiQ2FRcU4yR1R6eEp2RzIwU1JwU1pS?=
 =?utf-8?B?empPdVdhbVpLNEVrUkxQOEJuTFZYSDFTWDRlcnBGSnA5RnJ5T292bFRkb1Iv?=
 =?utf-8?B?QndhdEtRb0lLTnYraisxOHBpQVZ1WTF3N0hHNkxTR2c4cXZaMEU3ckR4OUs4?=
 =?utf-8?B?TTBEcFB0VXJXK2RFSWdYUUV5aU40UURzUzJVL2l1clRKbW82K2JxMEs0SExo?=
 =?utf-8?B?ZTBpamhCY1lzSHNtckErVUdsT3lwRnh5eGowd2RiSmlYRi9TN0RJYWpia2kr?=
 =?utf-8?B?NzF3UFNtNEdzWVlaSElIVWd5OU9aM3BISFk1S2JDU0NOQ3NCb0NMcnR2ZXg0?=
 =?utf-8?B?azhKNXo0ZlJkRnJXOEkwNm1jNjdPakF2bWl4eVJETlJ0SktIdTdmMUYxWm5Y?=
 =?utf-8?B?Nm5VSnVjdlFkR2Ywb2J6NTY0d3BjUzhZV1ZrMGw4QXRJY093d2l0WnA1aGEw?=
 =?utf-8?B?bUlLaEJod3crdGZuUnFheW9PV1I0YmFyMWMrd1B1NHJrOFNZeHQ1QWtlQVY0?=
 =?utf-8?B?eGxSdE9iQjB6dU5TeG1WaGNmRHIrZTZwcTkxOS9iMkw1eklua1A0di9qaXNl?=
 =?utf-8?B?eFRlRDRHeldvWFVwc2YxWVlsVHNYTWh2YnYzNHFsUGJlS2FxaXVwTG5xUldQ?=
 =?utf-8?B?cGsyYjAzcVdIMnJhbXhMbDdxY2gwR1VxcHZyV2VEOWFIcmhSMTR2dnNUTGc1?=
 =?utf-8?Q?tOaoFRJk0yqgVDBucJe5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUFFc3ZKcDNvWHBLU3F6cUI5RGlGTEpYckJtRndxNEp2bUhrYnk0SVFFN1lM?=
 =?utf-8?B?VUtNMy8ydkEybXA2bEpZT1hCT1hybU5SeTFmaDAyeTh2ZmNwa042Y3pFQmdh?=
 =?utf-8?B?MWh5MUYwVkdaV3g3cXRZdTZaUGZ6ZStRM3RiMVFPamszVDB3b2hOK1FUZUho?=
 =?utf-8?B?b0xPaWVDK3ZRSjI0aXBKNFlmLzhIRzVUREhsQWdrblMwY0xhVGVKbGFKck8z?=
 =?utf-8?B?Z21IZndBaTZzL3dRUCtYeHRLYmRWUjJtSEEwQlVGYXo5RVRBWnZLckE0cGZy?=
 =?utf-8?B?M3BkRkVHWHRBMTV6YnI0MjV3c0hHaDFkTWtSMW1uWUVRTlVodUlzM0xyTE1i?=
 =?utf-8?B?czgrK1JGWjMvbFhLLzVlUnUwY2hxRldOZHg2N0s0dStrMXVBa1Nra0toN1Uy?=
 =?utf-8?B?S3hIVUZjR01rUjZ1OUh1QS9kcmZ3MlVKOGpnSHM3SU9CSkdtNHRpTHR6M3M0?=
 =?utf-8?B?TjNEZ0ZFWUh1N0h1bVpVbFBKaUI4YzN3c2FtVkpWVlRSNUV4UElMN1gyTTVz?=
 =?utf-8?B?dEFXZHRxR1hwYXdaVWUyOGkwM0RKSnVsQ3RGMlc3QllFTStQbFZobEpxajRP?=
 =?utf-8?B?Ly9MSHdpYTlzY0M3UUMrYUtmbmNVYWtOSEs0UkRhNHMyV2k2K21SUU5LWWo1?=
 =?utf-8?B?WGtPTDJSaGtjKzVxVVBId21vT3p4eldtdHRlNWhnV2Y0YWNVNk9GVHJUU29H?=
 =?utf-8?B?RjNrckF4T1JkZHlBcktiZjA2TEMvNGZ3V1lrbWZWZ1VuQ0N5b1loV29qZW9q?=
 =?utf-8?B?K1FnUjVmOWJUSmxSQUQ5NHBzQ1RkWFBkazlkRXQvZXlwZWJNdksvUUlSSU5p?=
 =?utf-8?B?L09saTdEcGo0NHhjUmdCbDhLOUJubit4OUN3Mllyd1lJOE0xYjVZakc2Y3E0?=
 =?utf-8?B?K2g0SXFZUmR5c0xYUnV5MkljVnhqQXcvaW1Fc0NNMTlnVlBrWURub1Mxczlv?=
 =?utf-8?B?RkROT2I0ME54ZE50emlKMm9oUVhEY0NraHJidDRMaFU1a0RSdVJoN3JKSXRK?=
 =?utf-8?B?eFVCSWRDMlVYOFhWRnEvNk1Vcyt6UW1JUzM3Y3JBV2JrcTJUelgwaHllUVhO?=
 =?utf-8?B?WFltcFRBdWljbmdsc1lUZHVyNndJd3RJdVgrdTRHNmN2Zm1MT045ZVVtb3FT?=
 =?utf-8?B?eFl6c3MrWFFmRGdiMU5kVUsyd2xkeERGQTd2SW5sNWhTY3hUdGlweDZ3RmVq?=
 =?utf-8?B?UkJjVXdNS2ZMUFF4SU9FTzBCUnpBL0cwRi9nUk5KZ0x4WEM4dGtOMnhldHpR?=
 =?utf-8?B?cGJBQ000czZMZ25MdnVtNDY2OFBaOVI0RHZ1S3lhVmNUaXpmNVdlcks4VWYx?=
 =?utf-8?B?SzV6aFhvamlka1BPYVZTR0ZaOGRKcm1IaGk2eld4aWQwRzB0RG9ONks5Umdj?=
 =?utf-8?B?Q05LQUZTVmMvY1hXd0VLbXlzcnNLSkk5WmtmUFVpMkpKcm05VjFteU01bzhs?=
 =?utf-8?B?TUZZS0dycVlTM3EvTXJOQ3oveWJUUmFCVEVXY1pNS3EyN0YzdklJS2pNUWlY?=
 =?utf-8?B?QUFwUWRnOFJQb1Q2eDY5ZTNLSUpQekxqR2g4VU1YYzM5QTNtVFhzaUFZcmQx?=
 =?utf-8?B?MWRreGkrVG1lMDhmZkZVaEdTaHRhK1dHMytpTmYwRE1VdHQ2WTQxdXJaMGJn?=
 =?utf-8?B?ZGRtWWNaZVV6QzhhTFBGcm1HMWE5L1laK29hY1IwYml2L2NIQXpjVmx6SFlu?=
 =?utf-8?B?QVR5aUFyRGVOcWtHQzJYSHVkTTNXV1N3YmE3a2JYZXpRK1lKaEJDd0tYYWNx?=
 =?utf-8?B?Yzcva2NuWStHNnZXNGRYR2dJNXp0WG9hUDVoVkRRcFBVRjhsRkVzYW5RZGpa?=
 =?utf-8?B?dkVsa0taUVdDVnFMSVUrbHdnMkt2VHBVUXlwdmVTTHBvV2ZDdVFmd1VrSjZT?=
 =?utf-8?B?K2M2R0E0YzBlUU9yVVg2Ni9lemE4VjExVmwwVUlROHlvdkllb05JMHNQQ3o2?=
 =?utf-8?B?elNMWmhkY2ppVHgzbExOS29MbGpmd2lXM1cxd2Q5dGxhaTY2RWlqL0lRUkFn?=
 =?utf-8?B?NnRHWk84QWpFR3l3U3hKcXloajRVdUUrVnZLNmdGb290ODhvNXBKNUFQZVBk?=
 =?utf-8?B?aTdBdWhub3lZSy82Ni9LcCtDTHhRYmJ1VTRrc0Nxa2JoakthMHNHY0tSZkxv?=
 =?utf-8?Q?7FGjk6B61yA9mg+DLrVR15y0X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8292930c-a7e1-42fe-d570-08dc91b90b8e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 06:11:53.5884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BUPn6+PjLRO/4eyT6Q1CuJAcn0kJ/sRetHX1h8MiTSBCGbuDbSQ90//f5XS9qi/qqVFHxZd+ms/+0muF/8ydGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9132
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

--------------W00y1vFqksdLT2QiFWIJNV5l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arun,

I still don't have commit permission. Can you please help to push this 
patches.

Regards,
S.Amarnath

On 6/20/2024 2:38 PM, Karolina Stolarek wrote:
> Hi Christian and Amaranath,
>
> On 12.06.2024 14:02, Karolina Stolarek wrote:
>> Introduce tests for ttm_bo_validate()/ttm_bo_init_validate() that 
>> exercise
>> simple BO placement as well as eviction (including the case where the 
>> evict
>> domain also requires eviction to fit the incoming buffer). Prepare KUnit
>> helpers to handle such scenarios and add a mock VRAM manager. This 
>> series also
>> includes some updates to the helpers and more definitions used to define
>> "special" memory domains (e.g., one that can't allocate resources or 
>> is busy),
>> as well as drive-by fixes for the tests.
>>
>> There are a couple of areas in which this test suite can be improved.
>> Suggestions for future work can be found in the TODO file.
>>
>> Use kunit_tool script to manually run all the tests:
>>
>> $ ./tools/testing/kunit/kunit.py run 
>> --kunitconfig=drivers/gpu/drm/ttm/tests
>
> I collected r-bs for all patches in the series, they apply cleanly on 
> the top of drm-misc and drm-tip and all the tests pass[1]. Would it be 
> possible to merge them?
>
> In other news, we enabled TTM KUnit tests in CI for Xe driver, the 
> results can be seen on patchwork. For example:
>
> https://patchwork.freedesktop.org/series/134956/
>
> (see CI.KUnit step)
>
> All the best,
> Karolina
>
> --------------------------------------------------------------
> [1]:
> $ ./tools/testing/kunit/kunit.py run 
> --kunitconfig=drivers/gpu/drm/ttm/tests
> [10:49:50] Configuring KUnit Kernel ...
> [10:49:50] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=um O=.kunit olddefconfig
> Building with:
> $ make ARCH=um O=.kunit --jobs=8
> [10:49:53] Starting KUnit Kernel (1/1)...
> [10:49:53] ============================================================
> Running tests with:
> $ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
> [10:49:53] ================= ttm_device (5 subtests) ==================
> [10:49:53] [PASSED] ttm_device_init_basic
> [10:49:53] [PASSED] ttm_device_init_multiple
> [10:49:53] [PASSED] ttm_device_fini_basic
> [10:49:53] [PASSED] ttm_device_init_no_vma_man
> [10:49:53] ================== ttm_device_init_pools ==================
> [10:49:53] [PASSED] No DMA allocations, no DMA32 required
> [10:49:53] [PASSED] DMA allocations, DMA32 required
> [10:49:53] [PASSED] No DMA allocations, DMA32 required
> [10:49:53] [PASSED] DMA allocations, no DMA32 required
> [10:49:53] ============== [PASSED] ttm_device_init_pools ==============
> [10:49:53] =================== [PASSED] ttm_device ====================
> [10:49:53] ================== ttm_pool (8 subtests) ===================
> [10:49:53] ================== ttm_pool_alloc_basic ===================
> [10:49:53] [PASSED] One page
> [10:49:53] [PASSED] More than one page
> [10:49:53] [PASSED] Above the allocation limit
> [10:49:53] [PASSED] One page, with coherent DMA mappings enabled
> [10:49:53] [PASSED] Above the allocation limit, with coherent DMA 
> mappings enabled
> [10:49:53] ============== [PASSED] ttm_pool_alloc_basic ===============
> [10:49:53] ============== ttm_pool_alloc_basic_dma_addr ==============
> [10:49:53] [PASSED] One page
> [10:49:53] [PASSED] More than one page
> [10:49:53] [PASSED] Above the allocation limit
> [10:49:53] [PASSED] One page, with coherent DMA mappings enabled
> [10:49:53] [PASSED] Above the allocation limit, with coherent DMA 
> mappings enabled
> [10:49:53] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
> [10:49:53] [PASSED] ttm_pool_alloc_order_caching_match
> [10:49:53] [PASSED] ttm_pool_alloc_caching_mismatch
> [10:49:53] [PASSED] ttm_pool_alloc_order_mismatch
> [10:49:53] [PASSED] ttm_pool_free_dma_alloc
> [10:49:53] [PASSED] ttm_pool_free_no_dma_alloc
> [10:49:53] [PASSED] ttm_pool_fini_basic
> [10:49:53] ==================== [PASSED] ttm_pool =====================
> [10:49:53] ================ ttm_resource (8 subtests) =================
> [10:49:53] ================= ttm_resource_init_basic =================
> [10:49:53] [PASSED] Init resource in TTM_PL_SYSTEM
> [10:49:53] [PASSED] Init resource in TTM_PL_VRAM
> [10:49:53] [PASSED] Init resource in a private placement
> [10:49:53] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
> [10:49:53] ============= [PASSED] ttm_resource_init_basic =============
> [10:49:53] [PASSED] ttm_resource_init_pinned
> [10:49:53] [PASSED] ttm_resource_fini_basic
> [10:49:53] [PASSED] ttm_resource_manager_init_basic
> [10:49:53] [PASSED] ttm_resource_manager_usage_basic
> [10:49:53] [PASSED] ttm_resource_manager_set_used_basic
> [10:49:53] [PASSED] ttm_sys_man_alloc_basic
> [10:49:53] [PASSED] ttm_sys_man_free_basic
> [10:49:53] ================== [PASSED] ttm_resource ===================
> [10:49:53] =================== ttm_tt (15 subtests) ===================
> [10:49:53] ==================== ttm_tt_init_basic ====================
> [10:49:53] [PASSED] Page-aligned size
> [10:49:53] [PASSED] Extra pages requested
> [10:49:53] ================ [PASSED] ttm_tt_init_basic ================
> [10:49:53] [PASSED] ttm_tt_init_misaligned
> [10:49:53] [PASSED] ttm_tt_fini_basic
> [10:49:53] [PASSED] ttm_tt_fini_sg
> [10:49:53] [PASSED] ttm_tt_fini_shmem
> [10:49:53] [PASSED] ttm_tt_create_basic
> [10:49:53] [PASSED] ttm_tt_create_invalid_bo_type
> [10:49:53] [PASSED] ttm_tt_create_ttm_exists
> [10:49:53] [PASSED] ttm_tt_create_failed
> [10:49:53] [PASSED] ttm_tt_destroy_basic
> [10:49:53] [PASSED] ttm_tt_populate_null_ttm
> [10:49:53] [PASSED] ttm_tt_populate_populated_ttm
> [10:49:53] [PASSED] ttm_tt_unpopulate_basic
> [10:49:53] [PASSED] ttm_tt_unpopulate_empty_ttm
> [10:49:53] [PASSED] ttm_tt_swapin_basic
> [10:49:53] ===================== [PASSED] ttm_tt ======================
> [10:49:53] =================== ttm_bo (14 subtests) ===================
> [10:49:53] =========== ttm_bo_reserve_optimistic_no_ticket ===========
> [10:49:53] [PASSED] Cannot be interrupted and sleeps
> [10:49:53] [PASSED] Cannot be interrupted, locks straight away
> [10:49:53] [PASSED] Can be interrupted, sleeps
> [10:49:53] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
> [10:49:53] [PASSED] ttm_bo_reserve_locked_no_sleep
> [10:49:53] [PASSED] ttm_bo_reserve_no_wait_ticket
> [10:49:53] [PASSED] ttm_bo_reserve_double_resv
> [10:49:53] [PASSED] ttm_bo_reserve_interrupted
> [10:49:53] [PASSED] ttm_bo_reserve_deadlock
> [10:49:53] [PASSED] ttm_bo_unreserve_basic
> [10:49:53] [PASSED] ttm_bo_unreserve_pinned
> [10:49:53] [PASSED] ttm_bo_unreserve_bulk
> [10:49:53] [PASSED] ttm_bo_put_basic
> [10:49:53] [PASSED] ttm_bo_put_shared_resv
> [10:49:53] [PASSED] ttm_bo_pin_basic
> [10:49:53] [PASSED] ttm_bo_pin_unpin_resource
> [10:49:53] [PASSED] ttm_bo_multiple_pin_one_unpin
> [10:49:53] ===================== [PASSED] ttm_bo ======================
> [10:49:53] ============== ttm_bo_validate (22 subtests) ===============
> [10:49:53] ============== ttm_bo_init_reserved_sys_man ===============
> [10:49:53] [PASSED] Buffer object for userspace
> [10:49:53] [PASSED] Kernel buffer object
> [10:49:53] [PASSED] Shared buffer object
> [10:49:53] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
> [10:49:53] ============== ttm_bo_init_reserved_mock_man ==============
> [10:49:53] [PASSED] Buffer object for userspace
> [10:49:53] [PASSED] Kernel buffer object
> [10:49:53] [PASSED] Shared buffer object
> [10:49:53] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
> [10:49:53] [PASSED] ttm_bo_init_reserved_resv
> [10:49:53] ================== ttm_bo_validate_basic ==================
> [10:49:53] [PASSED] Buffer object for userspace
> [10:49:53] [PASSED] Kernel buffer object
> [10:49:53] [PASSED] Shared buffer object
> [10:49:53] ============== [PASSED] ttm_bo_validate_basic ==============
> [10:49:53] [PASSED] ttm_bo_validate_invalid_placement
> [10:49:53] ============= ttm_bo_validate_same_placement ==============
> [10:49:53] [PASSED] System manager
> [10:49:53] [PASSED] VRAM manager
> [10:49:53] ========= [PASSED] ttm_bo_validate_same_placement ==========
> [10:49:53] [PASSED] ttm_bo_validate_failed_alloc
> [10:49:53] [PASSED] ttm_bo_validate_pinned
> [10:49:53] [PASSED] ttm_bo_validate_busy_placement
> [10:49:53] ================ ttm_bo_validate_multihop =================
> [10:49:53] [PASSED] Buffer object for userspace
> [10:49:53] [PASSED] Kernel buffer object
> [10:49:53] [PASSED] Shared buffer object
> [10:49:53] ============ [PASSED] ttm_bo_validate_multihop =============
> [10:49:53] ========== ttm_bo_validate_no_placement_signaled ==========
> [10:49:53] [PASSED] Buffer object in system domain, no page vector
> [10:49:53] [PASSED] Buffer object in system domain with an existing 
> page vector
> [10:49:53] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
> [10:49:53] ======== ttm_bo_validate_no_placement_not_signaled ========
> [10:49:53] [PASSED] Buffer object for userspace
> [10:49:53] [PASSED] Kernel buffer object
> [10:49:53] [PASSED] Shared buffer object
> [10:49:53] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
> [10:49:53] [PASSED] ttm_bo_validate_move_fence_signaled
> [10:49:53] ========= ttm_bo_validate_move_fence_not_signaled =========
> [10:49:53] [PASSED] Waits for GPU
> [10:49:53] [PASSED] Tries to lock straight away
> [10:49:53] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
> [10:49:53] [PASSED] ttm_bo_validate_swapout
> [10:49:53] [PASSED] ttm_bo_validate_happy_evict
> [10:49:53] [PASSED] ttm_bo_validate_all_pinned_evict
> [10:49:53] [PASSED] ttm_bo_validate_allowed_only_evict
> [10:49:53] [PASSED] ttm_bo_validate_deleted_evict
> [10:49:53] [PASSED] ttm_bo_validate_busy_domain_evict
> [10:49:53] [PASSED] ttm_bo_validate_evict_gutting
> [10:49:53] [PASSED] ttm_bo_validate_recrusive_evict
> [10:49:53] ================= [PASSED] ttm_bo_validate =================
> [10:49:53] ============================================================
> [10:49:53] Testing complete. Ran 102 tests: passed: 102
> [10:49:53] Elapsed time: 3.305s total, 0.002s configuring, 2.635s 
> building, 0.572s running
--------------W00y1vFqksdLT2QiFWIJNV5l
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:DoNotOptimizeForBrowser/>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ascii-font-family:Aptos;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Aptos;
	mso-hansi-theme-font:minor-latin;}
</style>
<![endif]-->
      <p class="MsoPlainText">Hi Arun,</p>
      <p class="MsoPlainText">I still don't have commit permission. Can
        you please help to push this patches.</p>
      Regards,<br>
      S.Amarnath<br>
    </p>
    <div class="moz-cite-prefix">On 6/20/2024 2:38 PM, Karolina Stolarek
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:462151b9-be3a-4a77-8455-c879623ee1ab@intel.com">Hi
      Christian and Amaranath,
      <br>
      <br>
      On 12.06.2024 14:02, Karolina Stolarek wrote:
      <br>
      <blockquote type="cite">Introduce tests for
        ttm_bo_validate()/ttm_bo_init_validate() that exercise
        <br>
        simple BO placement as well as eviction (including the case
        where the evict
        <br>
        domain also requires eviction to fit the incoming buffer).
        Prepare KUnit
        <br>
        helpers to handle such scenarios and add a mock VRAM manager.
        This series also
        <br>
        includes some updates to the helpers and more definitions used
        to define
        <br>
        &quot;special&quot; memory domains (e.g., one that can't allocate
        resources or is busy),
        <br>
        as well as drive-by fixes for the tests.
        <br>
        <br>
        There are a couple of areas in which this test suite can be
        improved.
        <br>
        Suggestions for future work can be found in the TODO file.
        <br>
        <br>
        Use kunit_tool script to manually run all the tests:
        <br>
        <br>
        $ ./tools/testing/kunit/kunit.py run
        --kunitconfig=drivers/gpu/drm/ttm/tests
        <br>
      </blockquote>
      <br>
      I collected r-bs for all patches in the series, they apply cleanly
      on the top of drm-misc and drm-tip and all the tests pass[1].
      Would it be possible to merge them?
      <br>
      <br>
      In other news, we enabled TTM KUnit tests in CI for Xe driver, the
      results can be seen on patchwork. For example:
      <br>
      <br>
      <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/134956/">https://patchwork.freedesktop.org/series/134956/</a>
      <br>
      <br>
      (see CI.KUnit step)
      <br>
      <br>
      All the best,
      <br>
      Karolina
      <br>
      <br>
      --------------------------------------------------------------
      <br>
      [1]:
      <br>
      $ ./tools/testing/kunit/kunit.py run
      --kunitconfig=drivers/gpu/drm/ttm/tests
      <br>
      [10:49:50] Configuring KUnit Kernel ...
      <br>
      [10:49:50] Building KUnit Kernel ...
      <br>
      Populating config with:
      <br>
      $ make ARCH=um O=.kunit olddefconfig
      <br>
      Building with:
      <br>
      $ make ARCH=um O=.kunit --jobs=8
      <br>
      [10:49:53] Starting KUnit Kernel (1/1)...
      <br>
      [10:49:53]
      ============================================================
      <br>
      Running tests with:
      <br>
      $ .kunit/linux kunit.enable=1 mem=1G console=tty
      kunit_shutdown=halt
      <br>
      [10:49:53] ================= ttm_device (5 subtests)
      ==================
      <br>
      [10:49:53] [PASSED] ttm_device_init_basic
      <br>
      [10:49:53] [PASSED] ttm_device_init_multiple
      <br>
      [10:49:53] [PASSED] ttm_device_fini_basic
      <br>
      [10:49:53] [PASSED] ttm_device_init_no_vma_man
      <br>
      [10:49:53] ================== ttm_device_init_pools&nbsp;
      ==================
      <br>
      [10:49:53] [PASSED] No DMA allocations, no DMA32 required
      <br>
      [10:49:53] [PASSED] DMA allocations, DMA32 required
      <br>
      [10:49:53] [PASSED] No DMA allocations, DMA32 required
      <br>
      [10:49:53] [PASSED] DMA allocations, no DMA32 required
      <br>
      [10:49:53] ============== [PASSED] ttm_device_init_pools
      ==============
      <br>
      [10:49:53] =================== [PASSED] ttm_device
      ====================
      <br>
      [10:49:53] ================== ttm_pool (8 subtests)
      ===================
      <br>
      [10:49:53] ================== ttm_pool_alloc_basic&nbsp;
      ===================
      <br>
      [10:49:53] [PASSED] One page
      <br>
      [10:49:53] [PASSED] More than one page
      <br>
      [10:49:53] [PASSED] Above the allocation limit
      <br>
      [10:49:53] [PASSED] One page, with coherent DMA mappings enabled
      <br>
      [10:49:53] [PASSED] Above the allocation limit, with coherent DMA
      mappings enabled
      <br>
      [10:49:53] ============== [PASSED] ttm_pool_alloc_basic
      ===============
      <br>
      [10:49:53] ============== ttm_pool_alloc_basic_dma_addr&nbsp;
      ==============
      <br>
      [10:49:53] [PASSED] One page
      <br>
      [10:49:53] [PASSED] More than one page
      <br>
      [10:49:53] [PASSED] Above the allocation limit
      <br>
      [10:49:53] [PASSED] One page, with coherent DMA mappings enabled
      <br>
      [10:49:53] [PASSED] Above the allocation limit, with coherent DMA
      mappings enabled
      <br>
      [10:49:53] ========== [PASSED] ttm_pool_alloc_basic_dma_addr
      ==========
      <br>
      [10:49:53] [PASSED] ttm_pool_alloc_order_caching_match
      <br>
      [10:49:53] [PASSED] ttm_pool_alloc_caching_mismatch
      <br>
      [10:49:53] [PASSED] ttm_pool_alloc_order_mismatch
      <br>
      [10:49:53] [PASSED] ttm_pool_free_dma_alloc
      <br>
      [10:49:53] [PASSED] ttm_pool_free_no_dma_alloc
      <br>
      [10:49:53] [PASSED] ttm_pool_fini_basic
      <br>
      [10:49:53] ==================== [PASSED] ttm_pool
      =====================
      <br>
      [10:49:53] ================ ttm_resource (8 subtests)
      =================
      <br>
      [10:49:53] ================= ttm_resource_init_basic&nbsp;
      =================
      <br>
      [10:49:53] [PASSED] Init resource in TTM_PL_SYSTEM
      <br>
      [10:49:53] [PASSED] Init resource in TTM_PL_VRAM
      <br>
      [10:49:53] [PASSED] Init resource in a private placement
      <br>
      [10:49:53] [PASSED] Init resource in TTM_PL_SYSTEM, set placement
      flags
      <br>
      [10:49:53] ============= [PASSED] ttm_resource_init_basic
      =============
      <br>
      [10:49:53] [PASSED] ttm_resource_init_pinned
      <br>
      [10:49:53] [PASSED] ttm_resource_fini_basic
      <br>
      [10:49:53] [PASSED] ttm_resource_manager_init_basic
      <br>
      [10:49:53] [PASSED] ttm_resource_manager_usage_basic
      <br>
      [10:49:53] [PASSED] ttm_resource_manager_set_used_basic
      <br>
      [10:49:53] [PASSED] ttm_sys_man_alloc_basic
      <br>
      [10:49:53] [PASSED] ttm_sys_man_free_basic
      <br>
      [10:49:53] ================== [PASSED] ttm_resource
      ===================
      <br>
      [10:49:53] =================== ttm_tt (15 subtests)
      ===================
      <br>
      [10:49:53] ==================== ttm_tt_init_basic&nbsp;
      ====================
      <br>
      [10:49:53] [PASSED] Page-aligned size
      <br>
      [10:49:53] [PASSED] Extra pages requested
      <br>
      [10:49:53] ================ [PASSED] ttm_tt_init_basic
      ================
      <br>
      [10:49:53] [PASSED] ttm_tt_init_misaligned
      <br>
      [10:49:53] [PASSED] ttm_tt_fini_basic
      <br>
      [10:49:53] [PASSED] ttm_tt_fini_sg
      <br>
      [10:49:53] [PASSED] ttm_tt_fini_shmem
      <br>
      [10:49:53] [PASSED] ttm_tt_create_basic
      <br>
      [10:49:53] [PASSED] ttm_tt_create_invalid_bo_type
      <br>
      [10:49:53] [PASSED] ttm_tt_create_ttm_exists
      <br>
      [10:49:53] [PASSED] ttm_tt_create_failed
      <br>
      [10:49:53] [PASSED] ttm_tt_destroy_basic
      <br>
      [10:49:53] [PASSED] ttm_tt_populate_null_ttm
      <br>
      [10:49:53] [PASSED] ttm_tt_populate_populated_ttm
      <br>
      [10:49:53] [PASSED] ttm_tt_unpopulate_basic
      <br>
      [10:49:53] [PASSED] ttm_tt_unpopulate_empty_ttm
      <br>
      [10:49:53] [PASSED] ttm_tt_swapin_basic
      <br>
      [10:49:53] ===================== [PASSED] ttm_tt
      ======================
      <br>
      [10:49:53] =================== ttm_bo (14 subtests)
      ===================
      <br>
      [10:49:53] =========== ttm_bo_reserve_optimistic_no_ticket&nbsp;
      ===========
      <br>
      [10:49:53] [PASSED] Cannot be interrupted and sleeps
      <br>
      [10:49:53] [PASSED] Cannot be interrupted, locks straight away
      <br>
      [10:49:53] [PASSED] Can be interrupted, sleeps
      <br>
      [10:49:53] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket
      =======
      <br>
      [10:49:53] [PASSED] ttm_bo_reserve_locked_no_sleep
      <br>
      [10:49:53] [PASSED] ttm_bo_reserve_no_wait_ticket
      <br>
      [10:49:53] [PASSED] ttm_bo_reserve_double_resv
      <br>
      [10:49:53] [PASSED] ttm_bo_reserve_interrupted
      <br>
      [10:49:53] [PASSED] ttm_bo_reserve_deadlock
      <br>
      [10:49:53] [PASSED] ttm_bo_unreserve_basic
      <br>
      [10:49:53] [PASSED] ttm_bo_unreserve_pinned
      <br>
      [10:49:53] [PASSED] ttm_bo_unreserve_bulk
      <br>
      [10:49:53] [PASSED] ttm_bo_put_basic
      <br>
      [10:49:53] [PASSED] ttm_bo_put_shared_resv
      <br>
      [10:49:53] [PASSED] ttm_bo_pin_basic
      <br>
      [10:49:53] [PASSED] ttm_bo_pin_unpin_resource
      <br>
      [10:49:53] [PASSED] ttm_bo_multiple_pin_one_unpin
      <br>
      [10:49:53] ===================== [PASSED] ttm_bo
      ======================
      <br>
      [10:49:53] ============== ttm_bo_validate (22 subtests)
      ===============
      <br>
      [10:49:53] ============== ttm_bo_init_reserved_sys_man&nbsp;
      ===============
      <br>
      [10:49:53] [PASSED] Buffer object for userspace
      <br>
      [10:49:53] [PASSED] Kernel buffer object
      <br>
      [10:49:53] [PASSED] Shared buffer object
      <br>
      [10:49:53] ========== [PASSED] ttm_bo_init_reserved_sys_man
      ===========
      <br>
      [10:49:53] ============== ttm_bo_init_reserved_mock_man&nbsp;
      ==============
      <br>
      [10:49:53] [PASSED] Buffer object for userspace
      <br>
      [10:49:53] [PASSED] Kernel buffer object
      <br>
      [10:49:53] [PASSED] Shared buffer object
      <br>
      [10:49:53] ========== [PASSED] ttm_bo_init_reserved_mock_man
      ==========
      <br>
      [10:49:53] [PASSED] ttm_bo_init_reserved_resv
      <br>
      [10:49:53] ================== ttm_bo_validate_basic&nbsp;
      ==================
      <br>
      [10:49:53] [PASSED] Buffer object for userspace
      <br>
      [10:49:53] [PASSED] Kernel buffer object
      <br>
      [10:49:53] [PASSED] Shared buffer object
      <br>
      [10:49:53] ============== [PASSED] ttm_bo_validate_basic
      ==============
      <br>
      [10:49:53] [PASSED] ttm_bo_validate_invalid_placement
      <br>
      [10:49:53] ============= ttm_bo_validate_same_placement&nbsp;
      ==============
      <br>
      [10:49:53] [PASSED] System manager
      <br>
      [10:49:53] [PASSED] VRAM manager
      <br>
      [10:49:53] ========= [PASSED] ttm_bo_validate_same_placement
      ==========
      <br>
      [10:49:53] [PASSED] ttm_bo_validate_failed_alloc
      <br>
      [10:49:53] [PASSED] ttm_bo_validate_pinned
      <br>
      [10:49:53] [PASSED] ttm_bo_validate_busy_placement
      <br>
      [10:49:53] ================ ttm_bo_validate_multihop&nbsp;
      =================
      <br>
      [10:49:53] [PASSED] Buffer object for userspace
      <br>
      [10:49:53] [PASSED] Kernel buffer object
      <br>
      [10:49:53] [PASSED] Shared buffer object
      <br>
      [10:49:53] ============ [PASSED] ttm_bo_validate_multihop
      =============
      <br>
      [10:49:53] ========== ttm_bo_validate_no_placement_signaled&nbsp;
      ==========
      <br>
      [10:49:53] [PASSED] Buffer object in system domain, no page vector
      <br>
      [10:49:53] [PASSED] Buffer object in system domain with an
      existing page vector
      <br>
      [10:49:53] ====== [PASSED] ttm_bo_validate_no_placement_signaled
      ======
      <br>
      [10:49:53] ======== ttm_bo_validate_no_placement_not_signaled&nbsp;
      ========
      <br>
      [10:49:53] [PASSED] Buffer object for userspace
      <br>
      [10:49:53] [PASSED] Kernel buffer object
      <br>
      [10:49:53] [PASSED] Shared buffer object
      <br>
      [10:49:53] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled
      ====
      <br>
      [10:49:53] [PASSED] ttm_bo_validate_move_fence_signaled
      <br>
      [10:49:53] ========= ttm_bo_validate_move_fence_not_signaled&nbsp;
      =========
      <br>
      [10:49:53] [PASSED] Waits for GPU
      <br>
      [10:49:53] [PASSED] Tries to lock straight away
      <br>
      [10:49:53] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled
      =====
      <br>
      [10:49:53] [PASSED] ttm_bo_validate_swapout
      <br>
      [10:49:53] [PASSED] ttm_bo_validate_happy_evict
      <br>
      [10:49:53] [PASSED] ttm_bo_validate_all_pinned_evict
      <br>
      [10:49:53] [PASSED] ttm_bo_validate_allowed_only_evict
      <br>
      [10:49:53] [PASSED] ttm_bo_validate_deleted_evict
      <br>
      [10:49:53] [PASSED] ttm_bo_validate_busy_domain_evict
      <br>
      [10:49:53] [PASSED] ttm_bo_validate_evict_gutting
      <br>
      [10:49:53] [PASSED] ttm_bo_validate_recrusive_evict
      <br>
      [10:49:53] ================= [PASSED] ttm_bo_validate
      =================
      <br>
      [10:49:53]
      ============================================================
      <br>
      [10:49:53] Testing complete. Ran 102 tests: passed: 102
      <br>
      [10:49:53] Elapsed time: 3.305s total, 0.002s configuring, 2.635s
      building, 0.572s running
      <br>
    </blockquote>
  </body>
</html>

--------------W00y1vFqksdLT2QiFWIJNV5l--
