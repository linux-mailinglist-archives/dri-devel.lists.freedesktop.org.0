Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAE63319F8
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 23:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC026E895;
	Mon,  8 Mar 2021 22:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770051.outbound.protection.outlook.com [40.107.77.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E366E893;
 Mon,  8 Mar 2021 22:07:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyI6IWSRcNcUE+hcgv+Uc/wbfoC12Anr+LakUuAUjl7Z5CIAGS3u5uS7aO7T5bA12muesVwHxQQ/ijwluhvkhXzT+6N8gwfBkZG+ny2q44dlyiuEAlkLULWkmYyzbqBToHh/E4edNcTr6uc7I4IG8JyHDQgU3soUhmd2VBEovK90Ms+oKjSzqB+df/5DqukKVWnrYH7JX2X3HIkfropWnbkHGZuaXHTc+EBkCI/9KdLaS29uUrdM+pkT6LGqMnGY7X8YEo/PvjAX20M8JjHvlUOQNj2hK7gAZT8tGk+SjMRKKJ3oOvtzioVPCi/o7nnb+KIsd9NnXzGUWxQwQmFamQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9W6LUZcP7D6wWuMPOkB+gbx5ZOq0RmiI0VU6ZcyA6o0=;
 b=X/cv8A3lKwKk1h8MD+yqAG1Hv5ALiHk6AzQ3W0STCyb0Nb3fGZyBsrX3KV5o5RJkDAGVaDLAMTi7+c71mpTAqQVjDfbGgr1Bf86Upi1wsdOll4Mb0NGmMhAGh7lpsIwrXe0hO/qpManlILEZ8N2RYOXsI4VmWTNIZp7Yn+DWrz+TnjhF2dLrkTsLjRnQ4mbmDlCzrlWanKSpsOUPI0b3204e/+hY5yTuPUB25Q4WHSgtDzugLdff+X96vSkSK5Mwjk5SK/AEW7yybFIpwOKWc4zfyGFVirgjhEEO+zdwEjOXHl+c8bBjaav1pzXzGWqPCma9sDvNZE+boTnapSZC0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9W6LUZcP7D6wWuMPOkB+gbx5ZOq0RmiI0VU6ZcyA6o0=;
 b=wFSu5W0PmSEEaMYv3ushkkxNnZG954o8/1x+TpSQNU4dT9/mufycwGNJTh6IHRUAl4M6337nAuTjgKHv6Rl41CoBfGL4leunYK3hXOarcQXPVTH2447m8QoZp7JoyFzwmyhFYtHY8PGyIJy9ia/EXsZTGUQYiYjhx9UvY04BjkU=
Authentication-Results: rosenzweig.io; dkim=none (message not signed)
 header.d=none;rosenzweig.io; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW2PR12MB2348.namprd12.prod.outlook.com (2603:10b6:907:e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.25; Mon, 8 Mar
 2021 22:06:57 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::8c0c:5b9b:fec6:e12b]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::8c0c:5b9b:fec6:e12b%3]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 22:06:57 +0000
From: Harry Wentland <harry.wentland@amd.com>
Subject: 2021 X.Org Foundation Membership renewal ENDS on THURSDAY Mar 11
To: Xorg Members List <members@x.org>
Message-ID: <191dfbd8-b58f-46ee-0159-4c8250812a2a@amd.com>
Date: Mon, 8 Mar 2021 17:06:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::25) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26 via Frontend
 Transport; Mon, 8 Mar 2021 22:06:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c41c5239-803a-44d9-b739-08d8e27e7cad
X-MS-TrafficTypeDiagnostic: MW2PR12MB2348:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB2348DAE6BFEC36513574C99F8C939@MW2PR12MB2348.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: shNaz+7euXHyLAaFiYLmfo7Q+JLhbWlY1i5wRMWbwrWte2ygP6V7ulhEkKVyjBI55paW7UDvUrJAGRZfeR2O79k8jDujvOgs2XVTXgXqNejKIJeC3ELviinK0+wgqeFQdarYTHA4t+1MRo85NZt0E0tyXRMiA6VrSU+g9eGTFfSqTeTyjoArRGn1W57K5jep/9/QInMsnZnfLUgDkz4CccTkHNY5sjjZUaUpO8wxnYdcMvcpf+m78DdbQIUBD+N5jcHQxF1I0HNuA95JuX9UPWadKzS5b/0fuKG1gXAf4XvMBaHyfoD3k7hXeB/A1gvtw/1BzvEcfVsXT8K4AHsJxB9AXNgrLGxRgwpGBc5RAbjHBzsFudxicFP+o7FJxG1kTqyfIcfL2ghS+0M0fQrjdV784v4phXdiAPpIHLD/SIVifyhec1V9sHafk89WjwHhDQqQFxnA/BT+n+47Kldl6cxLTO41erWSGwTfnCqbTm63wkkBnPMKQdPsLFdXugiM+TzeB0ApfcysnR2yYLOHEvEbOAchwk5a+031u+OK1r1fWaoeKV+bHgYZslwZDFtleRIZAuuB1chlFseRUaHcEK/QeneypS0jfzkTSHTYT8UmU/SuhBVVnfg+gicGBg55hzJN0ZaqbLicN8UL76EF1ANDQ/d6m3gEIQNKfMkSd9vXigJjZ4Jk/xmhoFhodqyT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(316002)(36756003)(44832011)(6486002)(956004)(52116002)(16576012)(31696002)(86362001)(54906003)(2616005)(6666004)(31686004)(7336002)(66946007)(66476007)(26005)(7406005)(7276002)(5660300002)(186003)(966005)(6916009)(478600001)(8676002)(4326008)(8936002)(2906002)(83380400001)(66556008)(7416002)(7366002)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d3pwZEF6Yk5BbGs3aHhZaXhrR3VxTVJGNHYxblF0YzNiZU92ejUwR2JwZ3Z5?=
 =?utf-8?B?Zk5CTnYxS2JlZHRkbzh5MCtlcGhoNG1lc3laZlp5bHFrM21JQ0E4MExDTFh6?=
 =?utf-8?B?STl4Uk1UbWlrWlQ1bHh1VWVPRmtRNTFCcXpUMmlFRVhXUVZuUHZoRVFkcm5O?=
 =?utf-8?B?SXZBQXhBSlZsOFZTRFh4SVF2a1F2dkpqc05kMWlmOVdscnhDcXc1U1VFYzRw?=
 =?utf-8?B?WWhHVmN2SGQwb2lnVWJFMUxmNWxsNC9ONWo2TjNxTGlNM2NGMDJFNzZ0UFJD?=
 =?utf-8?B?c1RsL0p2TUxXUVI3THF6RU1xa0Y0OVFnaXFzMkhaditFQXVMZ3RVYzRLVVpr?=
 =?utf-8?B?NFpsclRNbDIwdnVZSlpTNzA2Z1R3STlya05DWGUrVEs1Ni9YTS83NzNaY2lk?=
 =?utf-8?B?d21lWXpja1FzS0VUNWlhakdBZTNyb2t6ODdPeE1iNUdOTk1GMkNGUCtnYjQz?=
 =?utf-8?B?aURmSXRaTy9IYWZPZDlCR0J2NFBrcWpMSUU3ZTY2dG9rWXQrSmpUOTJSMUJa?=
 =?utf-8?B?TGRFaXJ0SU00S3ZHZTBiSnhpZElMem44V0ZERXg0NzZUejNhbGJWWEt0YUdx?=
 =?utf-8?B?TjRtREd3dm5ZOU03eXRheENPM01xazh5Tk55ZnVLcWZHUWd2VjJDNUgxbEJX?=
 =?utf-8?B?Z2pTcG81N0pxOVRndW0zK2lZMENENFVqZjVKaXdCSm9RaTB0RG9UYjNVelZD?=
 =?utf-8?B?Wml6SW5uRlZwM2pZNXNIYTdEVzJQOTVpQnViR1REc1ZlVUxOUWJ1N1h6WFVC?=
 =?utf-8?B?M3E5VFlyT0xob0NPRHNILzl1WlBBRFFGb1Q2VmJkbEZWQnhjM1lGc2EyVUhN?=
 =?utf-8?B?QmNYS0VvdjRwU25mSnJaa1Jrc01hRFBvbkVpQkNjZTVXQmoySjJldTZ4TnhV?=
 =?utf-8?B?bFNseXFOUmtSUkpjWStCYXZwa1g2RVYyR1NSVjNXKysxR011MFgzNnRpOTly?=
 =?utf-8?B?L3FHRFZGR0hqUkVnL1Y1WWxPQ1ZSTUU3cjB5akl0b3VoNzBta3Q2ZlBlRjJL?=
 =?utf-8?B?OVdZS1FHR3JYd1doUGJKOHZUMmJZUWV5UTRTQmJwemhwMG04ZkZsTE1IVkN4?=
 =?utf-8?B?T1c1UWN0OTN6VmhVOERkUUI4TzdNcGpyS0lmWmhneXlpak02aEMwN3p1MHlG?=
 =?utf-8?B?K29MdHB4OHY0TXp1UFQ0NUxVZUlEbExDSnIxNEFRdm1BODhYd3MzRWdpUkVs?=
 =?utf-8?B?ZXF4VWE4di9TU2RXbVFKc1lkRy84bzlFQ1BjMFl3ZUJIdzlXQ1VxL0RiMnlO?=
 =?utf-8?B?OS9qdm9rZURVVmtybmJ6cDVUcmRpbjdZd2pNY1htYUI0SnA5OVpuZGo4RTZo?=
 =?utf-8?B?NTdhRzQ2aGZkUHlFSWtyaFprUlpDS3NPQkZYOVpKVWlxSnl6WXFld3Z2SUpw?=
 =?utf-8?B?L2hqYnh1VkZidUdELzFpbHJDcVlORTNhUFFvRlQ5WVp5cTFpeTNQK0hWUTF2?=
 =?utf-8?B?dTJsMUY3d2xnRkp0dlFFWTU3c3pKNGRDZHFZNVp5S0phTVBuV0tnUGpYeGxk?=
 =?utf-8?B?cG1XbjErVTB0VW90L0VLK3ozMEhubGJoZFFWY0FTTkdjV2dQMFFsM2E0WlY4?=
 =?utf-8?B?aWprZW9BZ2E3QWhzVXkwelgrZE84RjV3Z0RkN3hMelJqakVPQ1IvMElZa0dL?=
 =?utf-8?B?VDdGWWxWbFRSb1hNdUtSOHE5aDRJRjJnR2srTFpNZUYvSXdFdlo5cmZ3L2tL?=
 =?utf-8?B?QTRrZk1PT2o4ZzJKazRNcG9EVURLKzJoTExYbmlnLy9Ec3pEalU1a2NUcENQ?=
 =?utf-8?Q?rYR2DKRSISq5xAjxU3NYLy11GBIvJ8h3jTKLg05?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c41c5239-803a-44d9-b739-08d8e27e7cad
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 22:06:56.1776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjZLckJncA4XK98JH8m+o4YAaaHhRIL8KE0d1WHi7BTsWrDaJ4+6uzrMep+WABwRWazIcPUDLhUWxSEjC2Asug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2348
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
Cc: "xorg-devel@lists.freedesktop.org" <xorg-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>,
 elections <elections@x.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The nomination period for the 2021 X.Org Foundation Board of Directors 
Election closed yesterday and the election is rapidly approaching. We 
currently only see membership renewals for 59 people.

If you have not renewed your membership please do so by Thursday, Mar 11 
at https://members.x.org.

The nominated candidates will be announced a week from yesterday.

There were some hickups with our earlier emails and we realize some of 
you may have not received them. To ensure you receive this email we're 
BCCing any member that has been registered as a member in the last 2 years.

** Election Schedule **

Nomination period Start: Mon 22nd February
Nomination period End: Sun 7th March
Deadline of X.Org membership application or renewal: Thu 11th March
Publication of Candidates & start of Candidate QA: Mon 15th March
Election Planned Start: Mon 22nd March anywhere on earth
Election Planned End: Sun 4th April anywhere on earth

** Election Committee **

  * Eric Anholt
  * Mark Filion
  * Keith Packard
  * Harry Wentland

Thanks,
Harry Wentland,
on behalf of the X.Org elections committee
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
