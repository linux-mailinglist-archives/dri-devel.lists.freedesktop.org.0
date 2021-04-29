Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D58536E26A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 02:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29266ECA8;
	Thu, 29 Apr 2021 00:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC5B6ECA6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 00:14:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPyTGbg+K43urNwjal1S9/jTDSNkWqReH9009p+bM7M9m8ljaFTPAEw0BVE9ag/ssj5Xk6CxxMX7lHlz96tIR/eAdQPozgKwlYEfi6KzcWiinjjwaFAYGdhr+8dPvL3keoTUTucoXlrEJdFh6R58bBOhVsBlZi+iApb3vRZ5jCvgoByLbuLcFzHAIgG9Ai/rUYKwraNj4zs90xe60L5zhzohTvTtsskSgec9sS7H4lMWdyrkJIH9JfeVcYZca//AC6gZCocO4A7hMhhudf6B19j2Rttt8inoBivz81N82rRXbmVi0DVCrVsGyRt7WJ55pWmvhCsnUqPaTuYC3G73IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57yJDByir0quWUcWq5mHbIMTZ9K7cRztaeM5o7lDHtI=;
 b=eeu42gf6jnOaJFp1rhwc3r2krkxOpyrcgO95m9aFwyRys6+sW2XwMVBZ9te5E3QpRAxSiSVn9MyI4UIJNDanphja06Fg6hIOdNyrTdIOLOou5sAPMbf1yZ2sTwOyW6LW2g1vttCTP9/OQVofp4qJLIUOaDsZy05qDfDuM6B8fR3+aZS1jvaMQ7OssUyB2os7DmEeSbzM/RAQHY3T9kBsaYIMEncqOkrmEUYo+Dt4sRvxMwgSCVfAbKc5z9fU97z7e7MJrvMFLdBSMoADChUF0gR9zeEGRvai+OzgQdRzYMKcMZt1bvcIqLYH7QwlWOPVLmd7aUMYtjTlwnvDHntykg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57yJDByir0quWUcWq5mHbIMTZ9K7cRztaeM5o7lDHtI=;
 b=vjqHiVpONlurV/mE5IqxMV1oKMgPvcWU4iQSxB2cbQQubOl4NYylOJpnZ00f7cgkkb/nwCw8ji9DVz5E+JT7qCFf+z7brYG8z/5QTspmt9apfUja+8eN/kWZpy8wYfGXKjQgBj7usl3Ps5T2PH9OuBs7/VbHYp9BOEqZUFraNZQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4644.namprd12.prod.outlook.com (2603:10b6:a03:1f9::11)
 by BYAPR12MB4629.namprd12.prod.outlook.com (2603:10b6:a03:111::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 29 Apr
 2021 00:14:46 +0000
Received: from BY5PR12MB4644.namprd12.prod.outlook.com
 ([fe80::a8ef:60d5:b60f:9cb5]) by BY5PR12MB4644.namprd12.prod.outlook.com
 ([fe80::a8ef:60d5:b60f:9cb5%7]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 00:14:45 +0000
Subject: Re: [git pull] drm for 5.13-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Sun peng Li <Sunpeng.Li@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <CAPM=9txMo5f9QvPqdzt8g3CmUpyDFf2Q_0XS4V1FyjHX8WQPRA@mail.gmail.com>
 <CAHk-=wh3x4Q4pCkYe7__OAnvOyPqdZLN5ha0z4U035FwT5G57w@mail.gmail.com>
From: Mikita Lipski <mlipski@amd.com>
Message-ID: <e6532806-ba36-d5d0-6d74-488182787a6c@amd.com>
Date: Wed, 28 Apr 2021 20:14:41 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <CAHk-=wh3x4Q4pCkYe7__OAnvOyPqdZLN5ha0z4U035FwT5G57w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YTOPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::43) To BY5PR12MB4644.namprd12.prod.outlook.com
 (2603:10b6:a03:1f9::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.19.100] (165.204.54.211) by
 YTOPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25 via Frontend
 Transport; Thu, 29 Apr 2021 00:14:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 124f5457-0de1-424d-6f1f-08d90aa3cb4e
X-MS-TrafficTypeDiagnostic: BYAPR12MB4629:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB4629226848E8B4203141094FE45F9@BYAPR12MB4629.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: US5crqDUqG3I+q4zXOit35hoVkBPjrPLTynVKtD0oexq3hBagE2O8e/IPn5CQ+GQ8KaWhEEEduC2ode+Ll1RUJZd46XmM6PnFg5gF+38vMDUhLUVX8WoFXkar6Ca2kWVlMcUGyjtScZ2WXZF6UqAMwXVqv8ClLf2/Ytezs7VbqnES37wUqvjbwwbwhyML182QvlhUKjBRUrDNwy2eiSnsKECEp48OSLx3ayoCM7h9vCXqCT2W7ofYHnk1WFE41hCGB6TSNWcL819iz7HqcUcsBI6QWpmNNwClmQ8CR3rTi9lopy0tepI9L3IeQbDWsJ6PH/aVVkE14uYKq2aqRJv3ykD4MQ6jdGjAcyuvDcka+ZaO+tcdy0OmGx/JsZEsRVYXAQs37NC7bW+efzu6ZkP2w+qYEQFyDGT8ZWEJODBc3BrQuQgrw/bVUIUnEaQAkJW+FkUtpoZsvzgJsuQmQMMo/i4Numok7w5AXoWhULB4ILEw3IcF+IJaXmW/TdvQ7/Hl4bwc5F55TGD1muWzAfjUnW5PjQyE4n5NvVxpplHiTUDr77Wpgj0svpfNCc319N2g4kUbtV72c0llAnGLp7iUrD2RF12Yw5A/zVRgP03UI0OddxBBKRkgAS1RupsQ4wjfVbC0nX0bE5aN0sPbJe6Wa9jNij9P8DY8SjrPIEMcL43BOFioGa1ESiqDq9DY29FTGl7v/8DTK09tUpucoB7cYdedaJEv3VcsEE5KEwnfa17i0DclAkZKB5H9KBwO+IlSC8LW83wDNXAbW6bE9j6a0y8Xzjr6iq3gooLTvtnKwA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4644.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(31686004)(6666004)(2616005)(8936002)(31696002)(83380400001)(110136005)(26005)(66476007)(38100700002)(38350700002)(16576012)(478600001)(66946007)(2906002)(6486002)(6636002)(36756003)(53546011)(8676002)(4326008)(66556008)(52116002)(5660300002)(316002)(54906003)(956004)(16526019)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c24rSVlnSEN4ZUtBeEFXQmhJaHgzbXMwdWZ3b1E4ZHBQb09ZZ2t6Y0xpallV?=
 =?utf-8?B?OFYwNGFSekcwcHhaUUNacXhIS0ZyQlUzdWRQUXVIaWtLNmNQZmsxSEE4cWxB?=
 =?utf-8?B?NkhMWWlOeFJFRzhubWJzZVA4S1pBRERFMzFPVnhwTHhYUnY0V1dLU1dNOUtO?=
 =?utf-8?B?ZTA5V2JxWFFwMFF1Uk9SbFA0T0NiQXo1ZnEzSWsvNGt1SzBjYURtSCtVRkxI?=
 =?utf-8?B?S1JJaFNrV09SZ29JQTVZazlwWEdrS3BjdkR4aHk1dEpPU2VUY29MTGdTdndY?=
 =?utf-8?B?OTNnaGFCTTJ3T2ZNMHdSTVlIR3dkVWxMVFhMY1didDNLM1lWQm1Fb2YxZVU5?=
 =?utf-8?B?L2Zmd0RmYlRyd3VHWjZ6UVBwbWZYd0RXaEtPRGRMc1lXRDhUVVpuZHJhVkxs?=
 =?utf-8?B?V2ZBMEZZRytQRmY3NXhHSXFTZmRwRURuNXRIdDFuSXNxMUFibWRsTkhJK2hU?=
 =?utf-8?B?Q2svWUYvejdTcTlRQ05OL3h0TU5xc1Q4QWdNNjk3RitUdDBVRHhLVnBqdklV?=
 =?utf-8?B?VVpaY3FuZ3pjUjVGbWV2RnJlNXNZTm4zQWxkYUpJeEhzbWRuVkpLS0lwSmJH?=
 =?utf-8?B?c0FWVmVHTmR5T1RKKzZXaWxXMVdvWGpTdm1samZTd1BaemNJcFNiL0JGMWhF?=
 =?utf-8?B?NGYxV1ZTV3kxdVlBYUM3cUN5eDNUMnZGNk11aFhPR05rYXUralhtS2JWRnF5?=
 =?utf-8?B?Rm5nRmIwY0c2TjdOSVowWWpIeXpNMktjSEJFRmEzcmxTNnVFVHU5MFFmMXk2?=
 =?utf-8?B?dnd5TEUyWTlTQ3RtaDQ5T2EreGRDMkZycjFyWGw5R3B3V20yUEMzTWVmQ3ox?=
 =?utf-8?B?RnZ5WVZlcnJCYmkwZEFicXAzQ3E0M0lUYndubldpVVNZTExsRlJCNUVCdE1V?=
 =?utf-8?B?RjZub2dmOVhmSnZObTd5VDI0NndNVmRPZ3lBRkhabUtxMnVsS2JBSWtUM2I5?=
 =?utf-8?B?U1VMMVV3VWRWdWhEcFc1T3VVNThwVXl6dlhNL2xZK1ZtRlV6ZXcrLzlKbW15?=
 =?utf-8?B?S2xiTTdVcnk4emk4TkVRKys5U1JFaGN5aVlVdDJJU1pPL0FrdjBwZk5vUGI5?=
 =?utf-8?B?RGlCM2kweVJvRkJZRzJaMWsrdVJKd1NUZFBidHVqdkQ2TDdCR2RGZnhUK01k?=
 =?utf-8?B?UlJ3dXp1RUNEUWRZZGF1TW9QZkduaHFGZmJ3cXRiajZ6bDVHQ0pTc2p5THVo?=
 =?utf-8?B?Vm5rd2NaRGN6SGtFRi83UkROOEF6VUY2OVJqaWhuU3gvdmFLTkkydUd4VkN4?=
 =?utf-8?B?WVRObWRIT3ZrbzNrZW9MWjE5QnVtYjVaN09XZC9iWUsrcmFGV3J4RU9KdXpp?=
 =?utf-8?B?N09vRUVQS1RzQ2x6MFA5TWxZb1JINVZraXl6cFRSd2tlT2JrNVVVUUU5MnBk?=
 =?utf-8?B?T2RhaG5IZFNKRnpJYW4xcHpDU2R2VG9ZejVVTjNCbEkrcUc2Z3FkcVAxa0JB?=
 =?utf-8?B?bm5GK29DR05UMUdENmhGd3ZUL2pBZEZ6Zm9DTUlEczZLcE5ZVFhiSlBQOG5q?=
 =?utf-8?B?YkxMWFpwd3BoanRRbEc2d2Joek9BMTBzczRjTHFmVDd4SFI3alZWcmZOSEF2?=
 =?utf-8?B?OC8yRWZxOTVBYzV1SEVMNndnVktHakw3eHFMR05QOTNHbml5b2N4WkhieTJ5?=
 =?utf-8?B?eXVYZGR1SjVtQVVOV1ZBOTMxbVlZM1pjQTVyY2dlNTltdDJwbVd4UUdMajJR?=
 =?utf-8?B?UWNnZjAwdGxqdmEzdGdxYm5Kam1uUlJYS3drbWloV2VvMTdtWC8vSWZSdWJE?=
 =?utf-8?Q?qp/agmSyxTkqPgHapQ8BVoYVsMJnyOjV3I7Y8Go?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 124f5457-0de1-424d-6f1f-08d90aa3cb4e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4644.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 00:14:45.8167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YurF0yl8/s3IVM9e8pM7FRIYeBy/cUd2PGigcqmcxxWRyfetjTT82nTEaaa45vH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4629
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

The patch to fix the warning is here 
(https://www.spinics.net/lists/amd-gfx/msg61614.html)

I guess it just didn't propagate all the way to the release.
Can it still be pulled into 5.13-rc1 release?


From: Mikita Lipski <mikita.lipski@xxxxxxx>

[why]
Previous statement would always evaluate to true
making it meaningless
[how]
Just check if a connector is MST by checking if its port exists.

Reported-by: kernel test robot <lkp@xxxxxxxxx>
Signed-off-by: Mikita Lipski <mikita.lipski@xxxxxxx>
Reviewed-by: Nicholas Kazlauskas <Nicholas.Kazlauskas@xxxxxxx>
Acked-by: Wayne Lin <waynelin@xxxxxxx>
---
  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c 
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 656bc8f00a42..8bf0b566612b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -3030,7 +3030,7 @@ static int trigger_hpd_mst_set(void *data, u64 val)
  			if (!aconnector->dc_link)
  				continue;

-			if (!(aconnector->port && &aconnector->mst_port->mst_mgr))
+			if (!aconnector->mst_port)
  				continue;

  			link = aconnector->dc_link;
-- 
2.17.1



Thanks,
Mikita


On 2021-04-28 6:21 p.m., Linus Torvalds wrote:
> On Tue, Apr 27, 2021 at 8:32 PM Dave Airlie <airlied@gmail.com> wrote:
>>
>> This is the main drm pull request for 5.13. The usual lots of work all
>> over the place. [...]
>>
>> Mikita Lipski:
>>        drm/amd/display: Add MST capability to trigger_hotplug interface
> 
> Hmm. I've already merged this, but my clang build shows that this looks buggy:
> 
> drivers/gpu/drm/amd/amdgpu/amdgpu_dm/amdgpu_dm_debugfs.c:3015:53:
> warning: address of 'aconnector->mst_port->mst_mgr' will always
> evaluate to 'true' [-Wpointer-bool-conversion]
>                          if (!(aconnector->port &&
> &aconnector->mst_port->mst_mgr))
>                                                 ~~  ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
> 
> and yeah, checking for the address of a member of a structure benign
> NULL doesn't really work.
> 
> I'm assuming the '&' is just a left-over cut-and-paste error or something.
> 
> Please fix after reviewing (I'm not going to blindly just remove the
> '&' just to silence the warning, since I don't know the code).
> 
>                  Linus
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
