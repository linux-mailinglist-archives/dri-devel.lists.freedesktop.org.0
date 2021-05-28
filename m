Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DA4394787
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 21:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D652F6E0D8;
	Fri, 28 May 2021 19:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2066.outbound.protection.outlook.com [40.107.96.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46DA6E0D8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 19:31:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Riw6V9c5pljscsA4y32mgKa4uBdlnaxEbDuhZ6uZVrAdnu0ik9J7K8s45MJcHGGBdC2TLJuYvADuIrOOHsHX46D7xzeEgmz5Tp6QigS16+wh5+8svHzf/UyHq6EQkprn64kcpYxJPrXp03T17+fDn5LZn1bptSHXRFP9KctyxWyl7Mh+5MUtvItIqbXjgYCgLNrR0EVAXnCs8achKUhVEg5b94Hlx0vhbJ4+GHTqCk2HzmCcW7dW730PTqyzc2rib5LJUFD0wJKS8/Qwcp0UGFogUiaj1SYSYEQbXkNymPklXpxPoYVFQ4F1QaA0IvNJjdcwb6CROvxcure9twfXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7OxFGewGJRuQ4GwCwZZ8gSuSERp6CpJkXcqGs+kri4=;
 b=Vt2CgA5eWzGMgjhh17cOd8rarrxiPKxqHBxpnQlCeULWAye1ymF+GjBfL8N6vvkdOX4VtobymnJ4Qa8fFokVkG5YurMMtRXZl6gIi7DW+S6AcxvcOeGqbZ4ekmHLth9Hi/F6QZHn04rVZcfH4DW06ICRjPmpIA3qifhWsTMYFN1QbawpzGOhqJvwtbpfqHQgyNZDN7f8v8uAETtKH+sLFuARo5RMQ7QQndzpalsOz8vRwV5loKVALhBwHW5v5BFIZT8eFMpWKsoZ1SwIoqLNxE+lx8B2KYfn9SU7SmfvZrdO8LSXMzaBE7MT/CcN/ovaaXtFN9CD2qGPt+Evkj3gQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7OxFGewGJRuQ4GwCwZZ8gSuSERp6CpJkXcqGs+kri4=;
 b=c5EqSgf2IjWFB/h11mbmUGkCeDwn+TWDPEZ/CfcuJpMIvNwRE9y4wCPkNY5if5xdgCI4E2SsvPSnNu7xctCVGNvBYRLqmSOdGiQdyVy6c06z2LuNCNsg2thVPsudQ9tvPxWXHjQ/iTQnutwnWBW208h4Wq1PzwYPWItNxB2jUFA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by BL0PR05MB7185.namprd05.prod.outlook.com (2603:10b6:208:1c4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.9; Fri, 28 May
 2021 19:31:00 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02%7]) with mapi id 15.20.4195.011; Fri, 28 May 2021
 19:30:59 +0000
Subject: Re: ttm_resource_manager::use_tt
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <3ed92523-df06-87cd-f926-e632b780f69b@vmware.com>
 <b743342e-5151-110e-e29e-bf89a34d085a@amd.com>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <54e4bb04-602b-b1d3-7361-8badce45206a@vmware.com>
Date: Fri, 28 May 2021 15:30:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <b743342e-5151-110e-e29e-bf89a34d085a@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [108.36.85.85]
X-ClientProxiedBy: YT1PR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::47)
 To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 YT1PR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.27 via Frontend Transport; Fri, 28 May 2021 19:30:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff2d8e1f-06bd-4611-9b42-08d9220f1f6b
X-MS-TrafficTypeDiagnostic: BL0PR05MB7185:
X-Microsoft-Antispam-PRVS: <BL0PR05MB7185725FBDDBEEB7092B62A4CE229@BL0PR05MB7185.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: efTLPs1qiTowITwpZT0swWIh4sjSLyrEZEJn1brB4lgmM7hUIlGDddQXt2YG99SZcDvTlz4mOkpaMG2jGL8isYlWW7fPsTNCK9viaqq84gIifI7mwderf2jzI5SmguMTeQTgEq0xgzHQiIcOzKOkgmTQHasxmuVASOCPm90gwOFwBy0dPrgKnkIK0LYk3xep/fa8l5XdY1Hfu1gRtMjmbdGOP4dAFRW80+E2WHCl/gWIHUrVxr3d6Dhrf/+OjFyMIgQqEZAvs00tugCZK85TpqLTH0WNQHKjjLYNijQwHYvZ98Ndk9AYz5IFH7LHcEftw3NuLUz3YgN1/NqfRJUmJJN6NIio1S+udfZafggiC7mTTQmPWvCYlOhMnuvgGRPZxQ+5MlvJtdHBYuAYqsSbQOYXvz4nWSSm471+C9UI0VCbT8P5Dz+xjSUCAXn+1Ry4mJbKy9SSAk9OQJjt2sYDeMmcv0gWTC1znK5vbfNU55pRN9zCrn+Kvlc75MLTtra7NWg7SL6kg4I4nf+JbB+jA7uNGq75ySTjAkhsSl3l5YJBAYd4ePG4ok3kIfwI8r8AqdE7VfOK+gO0Y8oBYepeO5AAmBADOgrmU1ivWZlP7taacA6uNqq09OJWTZcksvVkiD8flSSTOEpUbCboURcTEbQeNQVZap0UUyYIntmxxkLQH01hUs5VbC6HbVBAQlYf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(2616005)(110136005)(86362001)(956004)(186003)(6486002)(8676002)(38100700002)(26005)(316002)(16526019)(36756003)(16576012)(478600001)(31696002)(66476007)(66556008)(66946007)(31686004)(53546011)(83380400001)(5660300002)(2906002)(66574015)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aU1LWFlqUG9FeXBhUlgrTXNsNHA0L2FkNjRoRmxBQVFUT01UQjZMWjN5eCtO?=
 =?utf-8?B?b3g4bWxKVUxrZEVzUkd3eWRDRldqSDhmcmMrUHQ3OE15c0pzQWZaY3VxUEM4?=
 =?utf-8?B?UnJYNW5CN0xQb015b2EzdlhZdTloODRwU2ZLUWVMWkozTmhwRE9CVDBxd20y?=
 =?utf-8?B?NzdJTDJreEVISXRTM2FTRDU3OEJaOHoyNGZKWDF4MGdlalpxV004TGtOZUZx?=
 =?utf-8?B?N0s3c2cvWFoxNUFRT3RkYnFMMitpQytYNGpzcHpmS2J0SldENFBSMVRNZTda?=
 =?utf-8?B?b1dpS2lCZHY0Q0NzcXB3YzcrbnI0YWVsVHZaaXpoa05xZkVGMEU3TVBrWUV5?=
 =?utf-8?B?M1pFTThHRncxZElHdGZyMkk2MmlUblNOb3JUSWw3ZnJLT2pUWGxBL2VIMnRJ?=
 =?utf-8?B?Umt2aGY5YlRhZytPdTEvdTlYODJ3SWhpTXl1bUpRbW9pMElTVWkzYzMzcEQ3?=
 =?utf-8?B?TU95V2dyNCtBK2hkS2xuRCtjK3R0Q2R3cElvNzlJZDJxV3FMeTJWdk1mbVRF?=
 =?utf-8?B?OUh3Vnd5Y29WbjdkMjNCbEV4b3p1QzVjYUNyYk1jVm5DVDJ4MWFJbW9xWEVr?=
 =?utf-8?B?bFRtL3JvN1NKcWRsa2dJNGI2MW1TNDRXOG9rUU5YL2xmZy9DSVJPSzhnbEhH?=
 =?utf-8?B?MjJnZGFXclhmQ1NaSnJ1cmZRVW9WdjZ0aFVxQjVpZHAzSDlJb3ZtazJlVkJl?=
 =?utf-8?B?VlpNNGQ0cFdZaHdpN2pUcWVkNTRndWZxTkpEL0NSRWhFZytTclc3NWFSaER0?=
 =?utf-8?B?TG85d0F1d1FMbVR5ck9MY3o0S3d1aGEwTmZVUGlJT2tSWWVzN0dGQklDL0xu?=
 =?utf-8?B?elp0dXE3R1lvUDBJRTJtYTQwcFVpZElYU21DRmI1dmxCb2hhenNDb3Y3NzlO?=
 =?utf-8?B?ODRCZ1hxbjZDVVhySHlUUWtvSHB2YW9rWGEvcDhkV0QvMXAwR29yRFg1ZlBD?=
 =?utf-8?B?UFdmM0pyNmpwODZmdmg4L2dpakIzbk5xMEs2Rlk2MDg1aGl2dlBtRm9hVEt4?=
 =?utf-8?B?UkZMaUlzTVY4WnV5MlVYU0E1MEJudmhnaWY0RjRxMjFoMGNjby91OGh5S0Iz?=
 =?utf-8?B?SHBDbWM4ZWlVMHZFZCs2NGI2d0tKK1lCK1lhU1RETitJUFpXT1lCYjJxcUhn?=
 =?utf-8?B?eGNjUW1aSUxmVkJEeGp6enBNdTU1Y2FyVk8xSzYvT1dualJtL2tWNDFEb0xz?=
 =?utf-8?B?N3A0a0hiek9WYjhsNk44cWFmOEwvWm1Vem0wbVUrUjdXM0NGN1FnMTgzWHVs?=
 =?utf-8?B?MWxkcHR4MmZhbGI5NGJIaVBJUmRFalh2b3Awam9BUE0wdEY0elRxS0hrMnZC?=
 =?utf-8?B?NnYwQkFBL2JxWFF6SUgyTk5LOFNOUEcrdWV6RnZxNTBCTCtTTXN6bkNvck1E?=
 =?utf-8?B?ZXFNNjZLa3ZnVzFwSVJkZ0RRenJOa3Q2aUgrZzNnanV4V09RcEVzUFBBZFBY?=
 =?utf-8?B?L0daRlBOczhZNXRWemFzU3BzQURLSUlpczBQK3ROampLZUxqWlNBRFh2VkdZ?=
 =?utf-8?B?Z3o0MVhpZWJhaDkzUHpXQys0Q3FZNllVaW1CSjJtZFJRZU12d1hBNFFhWnpl?=
 =?utf-8?B?bXorcW0rWStsRnV0eGRDSTg3cXBZVDEvZXBvSmcvL3lJZkNaVlNlc05YN1hj?=
 =?utf-8?B?VUEycG50eUZBQXhIYXZ5TXdDaFpnK1RMbGphWG9NMDZ0WE5DUXFWSDB5ZktW?=
 =?utf-8?B?ZHRRbEV5UXM3dmhvTzBiOHAvWUpzN1JUMFVKemFRYithK2YxTDhEUWhvUzBF?=
 =?utf-8?Q?PCekmqdQQ9Y5m2g2y2zFMaES6Y9QC4tDVstwB1Y?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2d8e1f-06bd-4611-9b42-08d9220f1f6b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 19:30:59.8744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+d9WOdnugziUeZ/FYd2+l0ip2K0iGT6UNh6qGS+4P9UwC+MSpZbWCc/9w49EwaNx5MzS94V29EX4X6JG1j5XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR05MB7185
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

On 5/22/21 3:13 AM, Christian König wrote:
> Hi Zack,
> 
> IIRC that was for the VMW_PL_GMR type, wasn't it?
> 
> As far as I have seen that backend was just giving out unique numbers and it looked questionable that we allocated pages for that.
> 
> E.g. when you set that flag then for each allocation we also allocate a TTM tt structure and a corresponding page.
>

Got ya. Yea, it's a little messy. I think it's correct. Those unique numbers are just identifiers for the bo's but the actual memory for them is regular system memory (e.g. we just tell our virtual hardware, here's some guest system pages and here's a unique id that we'll be using the refer to them).

Tangentially this also relates to a small issue with the rework of the memory accounting and removing the old page allocator. In the old page allocator we could specify what's the limit of system memory that the allocator could use (via ttm_check_under_lowerlimit) so the memory accounting that we've moved back to vmwgfx does nothing right now (well, it "accounts" just doesn't act on the limit ;) ).

We could probably add a call to ttm_check_under_lowerlimit in our ttm_populate callback (vmw_ttm_populate) but it is a little wacky. That's because in some situations we do want to ignore the limit on system memory allocations, purpose which we used to use ttm_operation_ctx::force_alloc for. I don't love designs that are so driver specific so I'd prefer to avoid using force_alloc that is only used internally by vmwgfx but I don't see a clean way of being able to put a limit on system memory that our driver is using.

Just to explain, our virtual hardware is basically an integrated gpu nowadays, so all the memory it allocates comes from system memory (with those unique numbers to identify it) and, especially on vm's that have lower amount of ram, we would like to limit how much of it will be used for graphics.

z
