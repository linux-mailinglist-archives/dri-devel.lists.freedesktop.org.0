Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B91563354
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 14:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E2B112748;
	Fri,  1 Jul 2022 12:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2044.outbound.protection.outlook.com [40.107.212.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A0B112514;
 Fri,  1 Jul 2022 12:14:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtDVvOzAmIYwelOn1LK89Pfc32clpLP6Mcp1Gp+VQElejRPVu1aFMEAsZUzZ3j3aI+dXH1Q3on2r8sdskHAA4spmkXKgjNvBlWTWySG1z7fXT8nNCaq3QlWYLd+Zbtf2hU/8QWWR7w12TGwPILgB4wzJx6YVhCeA8gSBcY1hoAiz0w09PviENtmu3zL9T+GKoII78sVXL6BbKUmloh5q+onOdoXVQQKGNH9CsSxFXg5loZISUU8Eqegn6a0nGx3f3q6I6XvSLZQIqHFbm/8ot8sSZZnFnX1eca1JjvSxojzsqRTRyalv0ePdMn/clHF41Lvib56eF17pay5YfQkPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vEcAPDcucA09PrRu8R4X8eOOrPxRinpOKVFHrcpCvM=;
 b=IEKoYbMgyElSK/CpO0hppqXQ19lBQGNzeNbdTfY+P43iYtReMP70vNFzl3qYiqCFWtO8xKi/hqEalWQfs2F8ZGiY27nE6rjQhvTmsO5895Af6/MGVGJHvexfxUpKMS5+P7ranJzRjJ2DgjcIDyZwx2qT/sPyWOAzegW++QEOY+Wiumbyv6lm4ZnHvjaU1jL+x/Eunl+9Z1xPmMAdAGRHYuWe8tnhxSayxNDmX2Im1o0LmVo26tqHO4Mte8AfCNCboAKbasS764sw+2xGG46CMUQ4J9lFq0FFaONvBpgxRC5DhPQ8qmMPFHPMoOgdaU5Nxcf0qKkPI2O13hB8w9hRYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vEcAPDcucA09PrRu8R4X8eOOrPxRinpOKVFHrcpCvM=;
 b=xv/5du6F66NZ1JQ129OKCUcxajFNduY2eD8TqFeT2QuAG3+sgpEPaXeJXude75rcb7cl89ydFG28r+1k/EvKcCfLMj1MEoxrOWcmAV3/98c7sw8pf4TYc7YB/t3orCytyB64rtCL5dwlf/bMzlJTUIVRLfJY+xTyc3TeI1FaPpw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 12:14:52 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::6d50:f6c5:cea4:1d95]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::6d50:f6c5:cea4:1d95%6]) with mapi id 15.20.5395.017; Fri, 1 Jul 2022
 12:14:52 +0000
Message-ID: <bcb2e808-6f1a-be17-6232-1cfc779a2bf1@amd.com>
Date: Fri, 1 Jul 2022 17:47:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V2 0/5] I2S driver changes for Jadeite platform
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
 <Yr7ft2cVTtKrghX8@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <Yr7ft2cVTtKrghX8@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0228.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::16) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41797e5d-79fd-4d97-567d-08da5b5b4d42
X-MS-TrafficTypeDiagnostic: CO6PR12MB5489:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P4VMhLShxDbu6df7hDakNK7DBIMy0M9GgTV5YF59RmdjvBJfCEZfl7Tu9XE5900W+eL+mj3hzFoTv9+3EPdkr2fRaROe4M0tF2EQRrX7Jk6Ac7tnNuuNsI+lFfzgqGn/QGnZDrtzkbtcuWZ6MEM7BHSmLsOzpiqWVc4bPkfdF9DnIFuShh0kjOWqMDQLCSspz/SgYRn627VMQdS9NqQxHfFb8xZezt5iVShthab/HZNNXztgWCxNIIMMWAU1hF9cmycA+MVZ4LxDJt7iCy9dAyQ7rwTVw0GPykLJrEma7khxRoDVKrVZlo+h7HzuUl/AxOg7wFj7jwYRUwP1hWiQZil1dxJCQM8vPCrzQoNuTUWj8pqbq66VYgPOniGM9Gkm+aEWlSWGFpPr5UIYDAjiJZWXus7e1yHTRJaAJGAbUJNhL5l1bkHptC1/E4FtFlQj/SyiCjmxzdTVOS/NmvPDU10Rfxbz3vFIIabFqs9alMH/nBxGnwzqjktrlLzzFEEAzDUcTzqPW+PWf3q6yqD0jbHuzBuzVTPRPx1NWEwTuygHxUuehAS0lxnS2GRu6va13gwn766jNN0/8/61mo146exGNCVcsK8TGsuLO4voJfu09kFIIT+OIm7t8N9XOnTYLWIUVQwWNEVUBMcxUrzmSs9H5YTniurQAJoe4zGHV9jQHucJ51iO4EzPq9CnJ7HsFaduEV7iRrmeDWFXBBNUkHDDqPHTt8dCGSwFvzx4WgAWOknwHOJ9Djbd64nrUWgo7wWvwZPOYehKBhcX6p6qcV7rCB7SXSStcRjhl3LLLaKO/GgzBaaKmranRLheVppq9F5z1QYohkZBcCvjQ/bvnBhk71wcIvujhkgzTPLCGQOTbNXjJVKy4XUJppvJ55A7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4123.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(186003)(66574015)(6486002)(6916009)(66476007)(66946007)(66556008)(4326008)(8676002)(26005)(6512007)(2616005)(31686004)(36756003)(83380400001)(6506007)(53546011)(38100700002)(31696002)(86362001)(2906002)(41300700001)(6666004)(316002)(8936002)(5660300002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzFMZG1KQmJ4RUdGbGw0VHo1cHNyNVRyQ1EyRUcwcDZ1KzM3QWF2SmxYbU5r?=
 =?utf-8?B?ZTRscnQ2ZlU4cHVHQm00N052MFNXTjgvTUxrcEIrcStjT0JnV0kraFY1MVl4?=
 =?utf-8?B?eFBXaWlsZlQ1eloxNVRJcXM2Q2x1UktWbTZoN2x5Tllxd2ZVNGt3TUhFWHJu?=
 =?utf-8?B?YS9DcUhPZmdFb3ROb2llWXg3RlRUb04xN2g4UWhyOEpRYk5yVXRseTJMdith?=
 =?utf-8?B?U3kwYTZlZUxadnNKREZ4N2xYTjlINkt1eFpvYmVnV3E3eXdGa3JGcGhybktC?=
 =?utf-8?B?WTZaeU9COTBoSCtDRTlsbmcvMHVCa0U4LzloZ1JoSnVrWVZvZ1NQN05JUWhy?=
 =?utf-8?B?Y1JCRkZGaTNYMmwzckdaVlY1OUlGNEpEQmtBbXUxK2FNcTcrYk9RNm9GcFV3?=
 =?utf-8?B?SHFmZ1hHdytraDJCcHZuODB1NW90SnpxS2pBWkY1TllsWUpDQzZhUkg3L0dK?=
 =?utf-8?B?d013aFJIcmtDWjJjN0lQemdWMXMzRDhKbFdIUjdFeFlmWGl2c2taTE4rMnNp?=
 =?utf-8?B?TVNkNXpONmxDY3BBVEpYOVgyNmI5NENiWjJ0dWt0VFJsNW5RK3F5d1A2VEFq?=
 =?utf-8?B?RzdNVzlNT2hEUCtlQmR3dkh3KytmakNKVWdjb1Uzc0N5YTJqcFhnWUNrOEc4?=
 =?utf-8?B?NmRWaU1jZEhYNlNOQnJrODl4eExFeGp6SjRlMTdwdW1VWjdESnkrazc3N0or?=
 =?utf-8?B?bzV0dFlWWEMxeUNTdVBTK2swdXQzTEd1TWpOT1pXREtLaWRqa01ZaVg4Yjh1?=
 =?utf-8?B?VmtLcnE5K0J1ME9Gd3ZqZUtxR0VmRXRFdCs0amhxWnFpZlJleEZWcjBxOG9m?=
 =?utf-8?B?K0ZXUVJzWVNvL1hYeStiYmI4VnpVMzFzUUwrSitVV0dVdnJTWmtNNXgxSThU?=
 =?utf-8?B?b0NZeERscGNtSWV0TlBmNmJMVXRtcTZqYlJBSVdaK1BxZGpDTEVZcHB6clZG?=
 =?utf-8?B?WnpHazRqQUgrY3R0eFZscmJ3bkhGSHBDeTVaQXF4UnBlUzgwQkpYZExGSEY2?=
 =?utf-8?B?bkNPMGJ5MjhIYjZGbmNpRVAzRzhtc0VjU2VpK245U29RVysrTktYNU9xSndM?=
 =?utf-8?B?cVd4MCtUSkxINkNNQXFBbUNXYTBmMk9FRkdJUU9wWDVxYS81YnJESS9idXR1?=
 =?utf-8?B?RlAxN2dOaXBvcVJKbEs0Uk1iNG5SMmFudDVoQU9mUXo5R3B3YkxMMkdodDVR?=
 =?utf-8?B?WnRkNkQvZHRpSkt0d1RtQWlsajlHTzA4OGV1cWlnaGdmalVKNks1SnlhWnVw?=
 =?utf-8?B?VEZsS3MyeDVYV2ozT2VUTngxK1E3VjRLRlBETENQb3VFL3d2ZFJETlhHT2hM?=
 =?utf-8?B?cUVFMFROTFR6MEwybGhJUE92NlJrV2ZWWE0yaDdZdjdBSXJ1ekVaVWhlYyt3?=
 =?utf-8?B?ajBDOUkwUjMwNTVOdGYySXN2OFFoR0dXRHRmR0svZmRVSjd3akt5cmlTc1gw?=
 =?utf-8?B?QXJ6K3g4ZU11em16WS9RN1FZR3pEQ2hXRGVmZFpnb29jcnlFQno1RU9MOERJ?=
 =?utf-8?B?eDJhTHhRdklTNjIyN0Y5bWxQMFZUMzdTQWtmVzRvS0FFclhuUFJzNkx2NGlS?=
 =?utf-8?B?akhYNWsrYk9FRVRRWFZlaXN1NDNrejlaYzZZZUhJZHZ6SVNqclQ4YjIzNTVl?=
 =?utf-8?B?V0hHS0lBVXZjYisyY2JPVUtCN1Z3Q3cxc1V1Tk43MFlDUGRxdDJyVFg5dFFW?=
 =?utf-8?B?RkhBRTNUcW12bTRXaWx6aXNNMkxMRElEVzZxQmpkdXJjUHBiZEhURFNFYzRt?=
 =?utf-8?B?Yk1TQk5ZZy8vaFljbStFNkI4eXVmNEpYZWpqTFBVbUhuTUNxelhYckNwemh3?=
 =?utf-8?B?U1dQdzQ3K0JNRzlxWGZONXZQNkFFWnMyU1ZQUHlES2pRbFo4YTBmUldIeXpq?=
 =?utf-8?B?M09ENHNDdjNtYmVjbjhBUzRuRWR1UlA4WVRHWHQ5N1UvUndWdVVJdUV1ZStn?=
 =?utf-8?B?bXlFb3dmTXk0TktOZ0hqR0xuOTRCTytTNGxRNDZKcWlHWEJLU08wejU5VFRm?=
 =?utf-8?B?SFhRQ1NkUHRsTFRNaGVXSzZrY1U4YUdDVEhjNU45UHZ0bzlrSnp2REtuenhI?=
 =?utf-8?B?OUNHZ2YzUGZ0czZJbmNMR1JXZGx1eVFxSkdiOEJPclkraU13b1JheTVvemJL?=
 =?utf-8?Q?/O6F7dUASMKKmjgS4MkKNTIz4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41797e5d-79fd-4d97-567d-08da5b5b4d42
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 12:14:52.5823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5O/lJFdgGCor3yvX1+osU5Vj/qEfo1N30dsORXEFJcdul152LnGuFWFY6rhoxtw+mGRa6KRy8FVQpM+8SQdJLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5489
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
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alexander.Deucher@amd.com,
 zhuning@everest-semi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/1/22 5:21 PM, Mark Brown wrote:
> On Fri, Jul 01, 2022 at 05:11:02PM +0530, Vijendar Mukunda wrote:
> 
>> This patch set depends on:
>>         --checkpatch warnings patch
>> 	--https://patchwork.kernel.org/project/alsa-devel/patch/20220627125834.481731-1-Vijendar.Mukunda@amd.com/
> 
> That's "drm: amd: amdgpu: fix checkpatch warnings", but it looks like
> there's no build time dependencies for patch 3 so I could go ahead with
> it and the DRM changes go through the DRM tree I think?
> 
correct. First two patches including dependent patch should through DRM
tree. There is no build dependencies for AsoC tree patches. From patch 3
on wards, it can be picked for upstream review for ASoC tree.

It's my bad. Patch series should be split in to two. one should go
through ASoC tree and another one through DRM tree.

> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.
I agree. will take care about patch commit descriptions.

