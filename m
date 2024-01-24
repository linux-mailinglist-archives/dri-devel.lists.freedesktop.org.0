Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C447783AE8D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 17:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392B110F033;
	Wed, 24 Jan 2024 16:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D694B10F033
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 16:41:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnW7f80NoREBCpomjkXKHXnJ9eHU2aAzH1PhUbBNDFrovHvGvaCHGUtUMZ4MFukOUUHPROrbVl1/5lca5F3Yu45jvIM4lr+1mv6eSN+LHC6c8KM8XWj9zoWTAv4AyXibB2DTl3SiawTJbufpLGJHt9jdk+uRhEgeh89ODhQiDf3enydeiDPBRjiVWrEjgg1Gr3Ai5ViWhUsDjmSfSLvltWB3vlIwECjb1AuytWFdXHtKqI/oN8+fKBwaaFY/FtpG/jiqN9DZV/py3L8SCpTevUWu2M7nUbS9XqDsqjU1+/32meJL4hVeaErfYoP2vfY406AMCcoJTcf6GNqD3sp+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HELMzti4bf/InIKMGl8gqwoqy6vIg9/XkedshmNc4mE=;
 b=GQVAm1qcSzoetWI6H+ub9CnQNVPlKPRWPn4ywNwVeAzeCllRcOmPU8cGiNeC8EPZ9nIfrGCM6yUUHa2zHSFVPO6uyorT7cDpqkOprGRdQaxseAveijBTS89eY5gVqd2oSS23zjR/adNlJYWiKA8n9ZvnTbvaix/+vp8CIRuM2XMIYDw9/dOfYcCaBWaqjZF5pzyID3pPZAyImmrM8PGf5Am1Lqgp1wQvjCbiZisAek7fe49lYSks1nTg4NsIaDFE4zHC9MSM988Tcu7W6JeI9NnD2lxoKj2vxGi+HKotfNDYWttE5gx64FaYfWC9pv4F3ieBNpzchdJGZceGrWjMvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HELMzti4bf/InIKMGl8gqwoqy6vIg9/XkedshmNc4mE=;
 b=jveuhRfDayVAZrPa+1XD7VRJ4g3EhyBd/himMbV20uGOoZXLiQ7UoJrWCw/D9ArHdGxVVZR5YKj10uH7/8GFdjEsLHyMJckX6hNcfOsHgwZElg97auoyv67LjXt6a79DHZsHq2xdhUaHlNcJinJf/odU+FQjnQ3y6LURcvsTzmQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB7441.namprd12.prod.outlook.com (2603:10b6:806:2b9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 16:41:52 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba%4]) with mapi id 15.20.7202.039; Wed, 24 Jan 2024
 16:41:52 +0000
Message-ID: <a51ddb8c-cf11-4394-a2fe-ca855749ff02@amd.com>
Date: Wed, 24 Jan 2024 10:41:49 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [git pull] drm for 6.8
Content-Language: en-US
To: Vlastimil Babka <vbabka@suse.cz>, Donald Carr <sirspudd@gmail.com>
References: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
 <2faccc1a-7fdd-499b-aa0a-bd54f4068f3e@suse.cz>
 <CAOVeLGRxXfs4wxSmB2ULZS72NvJkWQvZyPRz0rAmQyFtL39ekw@mail.gmail.com>
 <0a782904-bb19-4111-979a-31b52aa44ca9@suse.cz>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <0a782904-bb19-4111-979a-31b52aa44ca9@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0200.namprd04.prod.outlook.com
 (2603:10b6:806:126::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 476861ab-f9b6-408f-eeeb-08dc1cfb5e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dp76r3AzCKSt37xNGtv8tiLJToit5rg00GlZbJb/JP8C37pi5dZzej0KfiP8r0sywaRQebf89iz4k8i17gg3UGEjJ/E19HsWMwAIKkJeyRg7JDAdIzryWrFD+dEnYOLUhz1+3qKx4CF++w+WLTMRkpqoHBHNtWuAe4oKkS4jeMWDPgxqX/sfG/zNDYBhxmnLRJoIFReaVUAW9ZQSKbR5vH2aU7J6Sik9Ji4KnU7dc9rFx+zP/kaM6Yba7afqUq+HUhziz1EcfZbw98bAfd9m0lBk/+jypgm2k776HnTBOrbSyIQbSqwP9dxVJhjU7dYadUSAhcvgei2aF1UMM+vgibmdEXJohK3PV5NLSrw0srceqOCV8K/GOx9samVuFX5imm4/iLZwvla7c2qvkw8BcDU3vxYVHV9bg6ytcn94xyGNdEHCh6te/b/JIbr6hWRJCzFmZge6MFDzZ3od6KpfvQ9xF0t0F2RJR//At3+qI79/NUTn5rtpBBbpL4euMX8wKFHWNTAiw80MBLx4r2QVZHgMrZWZdVs77sEECyHSQ1r1ahY2vKJEmysR8rB2TM8ZotUyttH68iXpEytTUErdRrOb9IrzyngzsiNa1SPr+2bBy1vV4FFcpUfAVHAdN7srNg6Gs6OzQnsD67pT6mFgMNfYqe/KzCoJK8P/JCBx53mnanBeCkPTjdltv56LzLVZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(8936002)(4326008)(7416002)(44832011)(8676002)(2906002)(5660300002)(110136005)(66946007)(2616005)(83380400001)(66476007)(26005)(66556008)(316002)(36756003)(31696002)(54906003)(53546011)(478600001)(6666004)(966005)(6506007)(86362001)(6512007)(6486002)(31686004)(41300700001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2VraE9OaFp5M1NwRWp0R2FJSnRremZmbjhvUG5Najkrc3YvZ0NaYlpoWXJ5?=
 =?utf-8?B?b0Rnei9QRUtyVi8wbGQ1MFR2QXpkYXFuOWpFbktlVkpYLzlxdXkrWlZBeWhk?=
 =?utf-8?B?NnVyTElqQ1pFN3hGQ0JQZ3AraE5yd29ZRWZaQnhzeFJaaWcyRFV4bVJ0Z1h2?=
 =?utf-8?B?MTBYcmZRYWUzV2owVDBwTnJCdDFQeDZOcm9hdGx2b05IUC9wV1h4STU4U0pm?=
 =?utf-8?B?aDkyS3dwUG1CaWdwYTRzMXlDY1BLNkZEOWtseXVCZXhYVmlpZE5yVmczbGpT?=
 =?utf-8?B?Q2psOVlGc2d1eUptd1JvZlZoZXF6M0dIQWdjNCtIOUIyQ2VTYXQxYVdYM2JJ?=
 =?utf-8?B?RFpSbUxCeHRrV1J5bXNyMUR3aHZsTHlCN1NNWGlLRUF0bEV2V0FPYWpJQnBL?=
 =?utf-8?B?Qis0alBzdVRLSmRxYUtrUlc0Y2JCSnc3bFZseWJQclB0RUxIK25ITU80T0Q2?=
 =?utf-8?B?S1Rib0FHYk1GM3B2WndEcnZaS3kyVnBMWmZEQ2NCUDlNRWxnVG9SaSs0OXND?=
 =?utf-8?B?UjFNT1YxRGdmOGowcFZBdnlZbko1Mkp0NWphZzdEQ29IMGRYUGNEODdoVU5I?=
 =?utf-8?B?VHIxOGtacWUyL2E4Tk0vMG9Qdm5udEplcUsvdVdpaFNqd0k4WW9DWXlxc3lk?=
 =?utf-8?B?Y0lLM0MydnEvVVBjNk4vK09Cb1VCY1YrTXp3Q01lVDZjMVNXYUN3bFhLZHpJ?=
 =?utf-8?B?NkhuaGJBSVhxbUVmWVJPaVhKN2xOWTlad2hKemFHMUZnNllHVytXNzI3TTZB?=
 =?utf-8?B?SXk3TS9RbXBUVGVwSjNnb2dsSTZHbGdGV0FCTzJaUVdQUmt3dFVCRWJLQ0lJ?=
 =?utf-8?B?TlVSbXpGN1FqOHdPVStaTU92YVQ0V3ZtQSs3TXhOOVBubElmNDk2LzJZak9W?=
 =?utf-8?B?OG5lODh3VTdHTTRMenpXQUxmQlFLTGZXWEJKRWFrSHpONGJ3Q2JwSFdTT0JX?=
 =?utf-8?B?RkZhZUVqbEtzTm1JY0RqcVJ6ZVBJVTFORGdZdE93OVRXdld2UXVlU25EMTUv?=
 =?utf-8?B?dVpyQyszUDBkRGd6UkFCaGlodWpjMHRlZ0hZdXRIdGVobGNITkluKzM4TTcr?=
 =?utf-8?B?cjdFeEhsbWVmYldHY0tHYWhFclNqRDFUWDJUK05hZTBjSnc3NUNYSjRIZERY?=
 =?utf-8?B?VDdBQ1htdlJNMU1tN1dsUndab0cza0ZkaTRleitlSk50WnpOTE00REUzNTMv?=
 =?utf-8?B?dDdPZ2tTM0F4R3dvOFFEUlpPa0QrMnp2TmVWTU8yWEE0d09ycnRIclFxemJN?=
 =?utf-8?B?bUxnZmRIdlU1SnZYajIxbk9sRzViY3NWdi9mVkdpcFl0R1A4OXhYUHc4bThI?=
 =?utf-8?B?RkRDSFFpSGF3ZDBNa1hwak1qSWtBZmJTME13YkNlTmU1WmhlRXNEc3BQcklR?=
 =?utf-8?B?eFNGdGd3RUVZRThGTlJqcUh3ZDR0anZYSS9tRmt0bEFKZEg2aG1qckFoTlQ5?=
 =?utf-8?B?M0dFLzFkYlV1aXhBQUFQZnBKcFdQeDhuUzlCdWorMXg1Q1lQUUdxd0RSayt4?=
 =?utf-8?B?eFVpUVltT1pXaWVHQXh1eTRROTdra0cxYU9oRWkvUmZXQ1RWbHByNUY3a0VE?=
 =?utf-8?B?Y1BGZzkwZHpERVlXQmdpM3hRUDFMNk4vYnFlZFlFWjJBOVF3ZWFlNGlGc0cz?=
 =?utf-8?B?Ry9WQVZUTUwxcDVoNkZiQzBhcm5tLzlvbk1KVEFvbStmQW1BR005SVRmck9U?=
 =?utf-8?B?TE9lZlROd2s0UXpJa0JnQ2lQRlU2cXVFSEYwWm96NFJLR0s2U2VHZ2xSQm1C?=
 =?utf-8?B?VGRXTEhzeXJZcFI0eDFnVk55U3lETmpIdVZlMDU4UzVlNitJb2ZuUnJsaWZV?=
 =?utf-8?B?ZkpGS3l0c1AyY0VwbWUyamlyeFNSNGdMU3ZWbS9OMHUyRmJmM0U0MWhxRjFJ?=
 =?utf-8?B?T20wYXhEZW1RUXZMcXhXdEFSRTBDcFhFSEloTkFWOXhWVlFWMk1CaldubGgy?=
 =?utf-8?B?elV4U2lnZkF0TjVwcWFyVDdJMHFPSE1GUVFtemhVaDc5bkxIelZBQnhDUFJM?=
 =?utf-8?B?emRRbGFzSWVkeityank1TlNDbkhHSmpmSkFWaC92V0o3WWNnOEZxMWpHWjRI?=
 =?utf-8?B?S3dTL3dGdzlSellodkZLZFkzYmRPTG9aOTY5QXR1YmZoRHhlb0h0QzExUFZP?=
 =?utf-8?Q?YpTy+Ji2Ws3zbsYmVmEts/Ig4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476861ab-f9b6-408f-eeeb-08dc1cfb5e09
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 16:41:52.0929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: veIcETW1jjVlB3hhcldlN90+zQqrxu6sSPH7ym8grU78NGoZvHop7Bh4qNmrTC887KvSQOh63ZQUSWwvg9152Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7441
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Dave Airlie <airlied@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/2024 10:24, Vlastimil Babka wrote:
> On 1/24/24 16:31, Donald Carr wrote:
>> On Wed, Jan 24, 2024 at 7:06 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>>> When testing the rc1 on my openSUSE Tumbleweed desktop, I've started
>>> experiencing "frozen desktop" (KDE/Wayland) issues. The symptoms are that
>>> everything freezes including mouse cursor. After a while it either resolves,
>>> or e.g. firefox crashes (if it was actively used when it froze) or it's
>>> frozen for too long and I reboot with alt-sysrq-b. When it's frozen I can
>>> still ssh to the machine, and there's nothing happening in dmesg.
>>> The machine is based on Amd Ryzen 7 2700 and Radeon RX7600.
>>>
>>> I've bisected the merge commits so far and now will try to dig into this
>>> one. I've noticed there was also a drm fixes PR later in the merge window but
>>> since it was also merged into rc1 and thus didn't prevent the issue for me,
>>> I guess it's not relevant here?
>>>
>>> Because the reproduction wasn't very deterministic I considered a commit bad
>>> even if it didn't lead to completely frozen desktop and a forced reboot.
>>> Even the multi-second hangs that resolved were a regression compared to 6.7
>>> anyway.
>>>
>>> If there are known issues and perhaps candidate fixes already, please do tell.
>>
>> I am experiencing the exact same symptoms; sddm (on weston) starts
>> perfectly, launching a KDE wayland session freezes at various points
>> (leading to plenty of premature celebration), but normally on the
>> handoff from sddm to kde (replete with terminal cursor on screen)
>>
>> Working perfectly as of the end of 6.7 final release, broken as of 6.8 rc1.
>> Sometimes sddm can be successfully restarted via ssh, other times
>> restarting sddm is slow and fails to complete.
> 
> Big thanks to Thorsten who suggested I look at the following:
> 
> https://lore.kernel.org/all/20240123021155.2775-1-mario.limonciello@amd.com/
> 
> https://lore.kernel.org/all/CABXGCsM2VLs489CH-vF-1539-s3in37=bwuOWtoeeE+q26zE+Q@mail.gmail.com/
> 
> Instead of further bisection I've applied Mario's revert from the first link
> on top of 6.8-rc1 and the issue seems gone for me now.

Thanks for confirming.  I don't think we should jump right to the revert 
right now.  I posted it in case that is the direction we need to go 
(simple git revert didn't work due to contextual changes).

Let's give the folks who work on GPU scheduler some time to understand 
the failure and see if they can fix it.

> 
> Vlastimil
> 
>> Yours sincerely,
>> Donald
> 

