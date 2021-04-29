Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3A236ED49
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 17:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245836EEC3;
	Thu, 29 Apr 2021 15:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AFA6EEC3;
 Thu, 29 Apr 2021 15:21:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtULzXP0r9SXGKxgehbOndVl+PmHjvzqg9WQDG0R9HhsTzORLki41e8W/sbaUwyL+Li3hkcX83jNLBI3zHsDwRex96UEgeFH0mcqWDENcE14M/YyGpRwyTgwwLioB0eU6L8H1iWTnPx6UX2cBH2wqjGN2J3d5iD7MGPuhVdQxvD/w0FMjutmLviCFxvwXNOEHAfsZyAeyjD1jxagIc5lBHxJxtl+wtZAVL4ZT3TXpiHhS5+654pXudawWU0NMka+jeOIJRSLkfx2IP6296WtQSSVxIiOX+qXuEWEob7l1Igj7/rnDX+l//mCU9eTiBbQSODj03fjqDx+cdcpXKVDNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAx3WlbCOk7GFsybFtHxKAXlIAT1E+bYBfY5WtJXkMg=;
 b=BV7ql9g+QuWxGhQWtcgzxOHr+AImRawEy8XOt9AUT2y9Fan/djUEnGDCPBu8JZXWhaKY89u0VLeuND8TI8q4dnv8dzrPEJElSSrJvKQR/h6NUpHCobzyPI7SUPmrUJcgarBRzwimztN1ydVaxJP1MnyPnuAeIsCueXiNAHF/KiAVb/rqyiNv+bVyA6XtXCUDW8juRPhmZqdTgKhEGEvq3VXyxvzsafUBwyPWpTxROnvkrPNKlUb4fBVUhGOUxqHt+PVqcRD9ClT4Y9AFofyCuze5ZIXhfDXU1dZSGFhr/t942opZIXRDooqAv/DxMkEwoOFrY3XeJL6n0oJfEoWCRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAx3WlbCOk7GFsybFtHxKAXlIAT1E+bYBfY5WtJXkMg=;
 b=NkBmv+q9xqAjYTYPX/yE3lPFbrpgkETtQoilnS7hu5dsh4frscRvUrP7gkjnqwq8Zx6d0i3BtphcjhSP1BwCr3KDvP5Re4iCETCfHylFr8N44Bk7Is1MMbfHA/5TsnuIQRRU6aqTBi79usntLr9CykkKpJx16WNsfWvqPiwv8KA=
Authentication-Results: yeah.net; dkim=none (message not signed)
 header.d=none;yeah.net; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 29 Apr
 2021 15:21:42 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4065.029; Thu, 29 Apr 2021
 15:21:42 +0000
Subject: Re: [PATCH] drm/amd/display: Remove duplicate include of hubp.h
To: Jiabing Wan <wanjiabing@vivo.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
References: <AB*ANgDFDju3UB4GeQss-4rk.3.1619709495070.Hmail.wanjiabing@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <72012864-b24a-8697-def3-99d91f3bf89a@amd.com>
Date: Thu, 29 Apr 2021 17:21:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <AB*ANgDFDju3UB4GeQss-4rk.3.1619709495070.Hmail.wanjiabing@vivo.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8299:a26e:a76a:ba4]
X-ClientProxiedBy: AM0PR06CA0109.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8299:a26e:a76a:ba4]
 (2a02:908:1252:fb60:8299:a26e:a76a:ba4) by
 AM0PR06CA0109.eurprd06.prod.outlook.com (2603:10a6:208:ab::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Thu, 29 Apr 2021 15:21:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7ea21a4-ce7a-42ce-48ab-08d90b227e2e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB447071A6DD6B03F6AD94868B835F9@MN2PR12MB4470.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6OYGsYUkNc9T1J5xfGlqJyNlHGrXQQVnbo1qxEeohSSrNX8QrIN8OJ9xZiIvIMFtepvhpYdfWOARWNzFiuSZnvszEq4YGV7jduYIL2x7WU7Ovl6tFqI18OdpBxcAHYVTmC2vxEdZG41sNZXQUrWy8WeKXaotkv0y/8nT8etBsMFXhh9puYwF4RW1tO15MVqdImP2LFUodtFD/8jbKgZGEhybzN2ElFTUTz4a1d8gNDkyiHhUpP6sRzSfWp/naNVYMqko7yfyIvu287X3anl+ccJNx6BqFNjEGdo9r1/xiR8abW9BY8hL1lm1Qk6TiUCI+7pLYPypov+mCjBwZw1UAW8FFNpr8eYPWYBrSr5gfTSF+aivLXTYVMy7sACHHB/aQhZ7MrVttik7N9CCEgDMPEeDjtQFOpwuGOrgINg9VhgdxIhQ2HvWIeN+JO+Gq/gn3+ECQQEqyUHw70jremF2RsKU0o88+3o5vTZBKKEKjeUpTZZzMhW14eOab3AQunoPbcSLI4ARpAHe8sRih/1RpeNLJrijqrYvDpjRXWwDb1taGzge6hyJP44eBj5IrtTjsN4PHOD/+1xctk2JhE8qvklZ4tbaXb1n9sLy4x7eHp03h2dZ201+Q22EOz7HFjMoDZk6SKzkZRe5pLPwV7tYPJ2b+yT6XDQVVsLR/pztLeBNYudikr2zlc3p8ije3y6+BPciOwf7va+8jDnsO0AZqLv+51cAtbCqCivUEBuBzQT8Cg0OUtQV6X7h8GkGQCJVjyP0fS1hS0kfXcnJ2J5h1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(8936002)(86362001)(16526019)(110136005)(38100700002)(54906003)(478600001)(36756003)(66476007)(66556008)(45080400002)(186003)(6486002)(8676002)(66946007)(6666004)(2616005)(966005)(2906002)(31696002)(4326008)(52116002)(5660300002)(6636002)(316002)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NUU0bDI0cGl4eHB6V2Y1eW42OGk1aS9tb0duVlJUQWZMRndkVzM3MGtsektD?=
 =?utf-8?B?WmxsbW4rQjdibTFIMzRFaml4UG9MbFhBYUlybWR1UUFsbG1tbHI2RGh3d0hT?=
 =?utf-8?B?VDlEN2dkVkE3SExyelJGR3JQZjFRUWlmV2x3aUJmSUJEMExyQ2ZrSFlmb3VD?=
 =?utf-8?B?WlNITEZSS3FvNWQ5NUlySmNwQUFiU3h6NVB3VGgxNHBmNGpQS05ZL1dhUEdH?=
 =?utf-8?B?YmcxOTFMMXIvbzJCb2pxb0RwMEtkenhHSDhtdFp6OVJISW52RHR0QmllSGFP?=
 =?utf-8?B?UmpDRkpXalROTUFyVmVhUlh6MnlXd2JrUTR0ZVIzWFo1eHg4KzhGaGlTVjQz?=
 =?utf-8?B?ZlFmQWlwVVB3aGgwV3QrUzhoWkt5ME52a1VHb1NkcmJZNFdHelc0b3Q5VGF5?=
 =?utf-8?B?MklOdXpUem9EeTBEd2VkcGdwNkozS1ZPWTZRUDdtRS83NkYxTDRUelJuZ1ZM?=
 =?utf-8?B?U3dnOGFjbkJiWlZ1M3ljbHJTd04xU1p4ajA3QU1IYmdQanBnOXFkcXlXR005?=
 =?utf-8?B?eTRFM1BQbndJdTNOaStGNmdvNjB0bUVCOUhKdXRxZWx1clE0YlMvUXZlaDlp?=
 =?utf-8?B?eG4vQ2U0N1hGaWdTZzkrODBneVJvZnJxR0UwaFZ5MlVyNHhWTFVjVWp3eTAz?=
 =?utf-8?B?RmNheHRkdURWaTc0RjFrWUhKY0lHN0tPTnc2K2NvcUVBT3JSZ2U1eDcvU1dk?=
 =?utf-8?B?UStUVFBSR0YyakxLbkNsT09HOHljNUlYaUVFWXl3bFgyQTJUNHZHVnNtYVJo?=
 =?utf-8?B?TG0yQ3p4TjVFR3RVWXREaG9XMWUwSDJpdmQrR3lDUnRrOVU3ZHMwbS9FbFpV?=
 =?utf-8?B?bjN3R3dpMWlNS0o3djZ1aEx3UC8rL1FTRXprbzZ0MWdvLzdFc0JuQk9QaXQx?=
 =?utf-8?B?YmtNYmczQU5MTlg3WE9FTGRpU2VhRkFsU2dTYzlNN1RYbzNhR0RYMlVLbHo0?=
 =?utf-8?B?WmQ2UG5zcDVTbmd5Vm1tQS84UHRRRDJxcllXMm84YXp6NFd2alViOWkxSmZv?=
 =?utf-8?B?UGpDT1BzajhoemNERVMrWU5nbjZUcTY5UWxJSnNhK1V2aHh3OXNiVnpYT3l2?=
 =?utf-8?B?L1hQaDY0NXk1Yk9iQ0JEUU9CZVpiSjlRTDIzZEc1UVUyeDVBNUxJaTVvVEYv?=
 =?utf-8?B?RHdIMDJ3UktaMkVSNnRZMUN1SE9EME9VbEFOOUtOYUxyOVMxS3oyNVI0Ui9i?=
 =?utf-8?B?emFvbmxEMVBMcFRwT2dlVUVnK0dzMzFZYnU2RjhITGRWUUpIUmMrM00vYU5O?=
 =?utf-8?B?Q3Y0TWE0NzUvOEw4S2p3bFNQSnBiM1Bra0JDYlhLOVBHcHBnMk5KK1ZIQ0J6?=
 =?utf-8?B?eWttWWtHaGxkR0V4MUQwSXI0TzRsZTExZERFakpTUm94cE5WQkcxY0JWTFhv?=
 =?utf-8?B?Rmd5ZVowKzRiN09VVG04cnVieTdaQWc5Z2tyZjQwZ0ViNzdrZmpNOFFJQ3Bt?=
 =?utf-8?B?TEpQemxhY3NXZVlGbUxRbXNDUEhjUm5nM1V2VDFvaGRtNkE2K2ptMGhsMGpa?=
 =?utf-8?B?NUl2eVJFaWFqeHdnNEI2d09wU3J1dVhkTjVXOXJnOCtiRmZVZUdNcWZBcVRM?=
 =?utf-8?B?K3lGK2dlU3BCYnpkTUFvQ2J0ZE1jNFAvTDhKYjZCNEhvS1RKSGI4WXlZY2NP?=
 =?utf-8?B?dDBOZW0yODk5eXhsRW5jTjN1b1R3RTNMS05YN29hb1hOczBSUlZhcmxXbHli?=
 =?utf-8?B?cDhMa0JUaTFPdE9UNnBvY3RPWXZCM3VJbUVOUFI5NTJ1R3NURkZIenY2bjc3?=
 =?utf-8?B?enIvMWZtOHhjQmpwdUFxMlE5TEJuUE5KajRUNW1rYnp6cUZOSWkzaEUrSWZz?=
 =?utf-8?B?ZzJiN0NuYVJtWDJ0WTAzdit3WkpsYVNaYXIwYkFpMW45NExqSVFpUXlxRG9K?=
 =?utf-8?Q?88ynOr2drSKYI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ea21a4-ce7a-42ce-48ab-08d90b227e2e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 15:21:42.4911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3zI0+pVnNfmfs9jToIT+zjQr4NQOGDcHs5AEHAINuUr5pR24nGPtlWj4UffbCSn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470
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
Cc: Anson Jacob <Anson.Jacob@amd.com>, Eric Yang <Eric.Yang2@amd.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, dri-devel@lists.freedesktop.org,
 Chiawen Huang <chiawen.huang@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, kael_w@yeah.net,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Well if you are bored we quite often have the problem of unused fields 
in structures.

If your robot could find fields which are never read, that would be 
quite helpful I think.

There probably will be a lot of false positives for things like padding, 
but maybe that yields something.

Christian.

Am 29.04.21 um 17:18 schrieb Jiabing Wan:
>   
>> Is your robot public available?
> Sorry, I started to write the robot just one week ago.
> It is not strong and complete enough so it is not public available now.
> But I am still working on it. If complete, it can be public available.
>
> In fact, this patch is catched by the script called checkinclude.pl
> in linux/script. The robot just run the script and catch it ;).
>
> There will be more scripts in the robot and I think
> it will be public available soon.
>
>> btw, applied to amd-staging-drm-next.
> Thank you very much.
>
>> Thanks
>> On 04/29, Jiabing Wan wrote:
>>>   
>>>> Nice catch!
>>>>
>>>> Are you using any tool to identify this problem?
>>> Yes, I have a robot including many detecting scripts :)
>>>
>>>> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>>>
>>>> On 04/29, Wan Jiabing wrote:
>>>>> In commit 482812d56698e ("drm/amd/display: Set max TTU on
>>>>> DPG enable"), "hubp.h" was added which caused the duplicate include.
>>>>> To be on the safe side, remove the later duplicate include.
>>>>>
>>>>> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/display/dc/core/dc.c | 1 -
>>>>>   1 file changed, 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
>>>>> index 8f0a13807d05..dcaa6b1e16af 100644
>>>>> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
>>>>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
>>>>> @@ -58,7 +58,6 @@
>>>>>   #include "dc_link_ddc.h"
>>>>>   #include "dm_helpers.h"
>>>>>   #include "mem_input.h"
>>>>> -#include "hubp.h"
>>>>>   
>>>>>   #include "dc_link_dp.h"
>>>>>   #include "dc_dmub_srv.h"
>>>>> -- 
>>>>> 2.25.1
>>>>>
>>>> -- 
>>>> Rodrigo Siqueira
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsiqueira.tech%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C99075b6ba68a4c6d4f9108d90b220472%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637553063002111816%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=U5VbADSJ8HJ%2Bq%2BPCGYmCuwks61s5GZtCI4n%2BdjT0LXc%3D&amp;reserved=0
>>> Yours,
>>> Wan Jiabing
>>>
>> -- 
>> Rodrigo Siqueira
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsiqueira.tech%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C99075b6ba68a4c6d4f9108d90b220472%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637553063002111816%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=U5VbADSJ8HJ%2Bq%2BPCGYmCuwks61s5GZtCI4n%2BdjT0LXc%3D&amp;reserved=0
> Yours,
> Wan Jiabing
>
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
