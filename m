Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4979A39B0EC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 05:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FF66F574;
	Fri,  4 Jun 2021 03:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5146F574;
 Fri,  4 Jun 2021 03:31:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAprqKscAOF9IxiUoeRu1LaMhYg/BHMq7iNtgux2JnRvYHVwYsBgdZMau+It6pZ4xDMLzQ42/tjwdhvyTapDHP6ItzVzA7uEsKWiqBtgCHL99sFg9fGUgYW0+cDtQNwb1vM5bgroXSHr+21Lt8n33K3gtKgT1QWFa1zZq7w94YzgZU/7p0xcc3eBHBDb3JHqyTpzuZxtrQLDS705fxuO7jHx7BAgBM4Hx+rDVP8UK2l3w/m4U+D9c9KxjwLwquLpd6rWSpPJIkmqkENj9sp7gBvt2IIoVNjKcLE2VItYdeTwItzEvruChOveb5+Mr56mWfqB3fc0PQtLqEXqaDIRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/1VsQYbpF2tbdOF9icFEXlI7r697TJ4yrxv4A7wUb8=;
 b=DdjZQkvdem7vU4puNSDksRTWE8bFzZk4q0LUv1MKWHD1DqLB775YqT6WSzRb4PKiSwWtRuN865r28/3NUkKmxJ0VlU8nH1UM4gZAJuBzNfSX82/3KOGw3Sw9THMQ+upA1/6mTk2SiVW0B1jiPdNFtD6saa2xggcSaZsvzmjuUjvjP5osmYTowHCFDbZvbKD672Ig2++eYaWEoMkv0slpgatun/a9D/DXcZoUCoFt+IixR1SiYqj18/RmdNf2RtT60zxAGJTf2I8KWrrWLxIWiDFpk8io7y8n9N2KKK1iyBlGe0ksHIsO6NtstMKfay7OmflhmZtQbSV+kr9h+V95Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/1VsQYbpF2tbdOF9icFEXlI7r697TJ4yrxv4A7wUb8=;
 b=WAqzy+TO85kaLWf6CCJyQTHLrWkoK6JNyKw0C5n/2Px7vrTuitxNSyNah4yvWb6JZojkEqunEm53kNgP9DisFhcMoFJPmq/h7nc3a+xzoXKiHO0Cl04lHscIaaWjTFD8oFBkemoO3GE1QitQdXyu4bJh+HigfiKzGni+SWoFFLY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4398.namprd12.prod.outlook.com (2603:10b6:806:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Fri, 4 Jun
 2021 03:31:11 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4173.030; Fri, 4 Jun 2021
 03:31:11 +0000
Subject: Re: [PATCH 0/7] libdrm tests for hot-unplug feature
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@gmail.com>
References: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
 <CADnq5_Nfs_j9XE1Siou2wGYuwd5cvTD1T7m9gFpS9z74D=AuAQ@mail.gmail.com>
 <CAPM=9tznFeKrL-La1RqCtAib4N+Stf=2epQYabrm=vYnds6LwQ@mail.gmail.com>
 <CADnq5_OJt6YUixqhfkvVq6RKACNYtEHNKb8wY1h+7d6G1a3P3Q@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <191942ca-0773-758f-130d-17c0ad326fc2@amd.com>
Date: Thu, 3 Jun 2021 23:31:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CADnq5_OJt6YUixqhfkvVq6RKACNYtEHNKb8wY1h+7d6G1a3P3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:9a04:1ebc:cbd9:a420]
X-ClientProxiedBy: YTXPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::36) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:9a04:1ebc:cbd9:a420]
 (2607:fea8:3edf:49b0:9a04:1ebc:cbd9:a420) by
 YTXPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.27 via Frontend Transport; Fri, 4 Jun 2021 03:31:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d11ed66-bfa4-4874-7f34-08d9270932ea
X-MS-TrafficTypeDiagnostic: SA0PR12MB4398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB43988164998972C2ECFA2244EA3B9@SA0PR12MB4398.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9fICE7diukxt33Ueawl5Fj+UgYUnmD6ve9GXjPs60jrWCAJ/PF96C+8EC1w6SYXXTE/qadIPQksFXiX4nTe2HYb5VKO5v32s3IYifmFVCoJJbKGMf9YDpeGqqFAVhGfsqKnsMeczb0ahJHYi1nem6oTDWHScgr7SRTzKXkRsKNtFatvFOct2fDQ6sQzYv026l5T7UlBf7oRcK/c6Zx08FgF0KjxNtBTRM7+sZ34am4Zh+3XXtLpS3CT2Z03MGShn9zOBfbrJIS0bkJlwZGnaCOo9c/8IsePF5ALpY034Gq3VoVxbgdrJ+8CLqW0ShRQ+yJCZbySS5fG13b3OVyoxbzs2QxZCua/ZhogMERrX8LqL6dm6k4LloBAinj/Mn0WvYyy1rWmO14jxdi5n1kLPd3JgrSTq1H8chDhPzVAEZUxdCZEmBVFxfjjpitWBFqMK21n1CkfwnG4gFG/JHRDhUvl0X+1iCPSXRxcutmDN0wcRqzmsij92gdGSP1s30MMm+/RsD8qKPWXWSRQuWreyIidBzFcRRSsq7VAcOPgBt7a/YzmM4Wxb3XQWe9fCfU+0TgGl4N7EVyC4I2DNl3mfwNqFjiANN7xlE71PnZxdEc2GH5VgfZb0QB9aTKUPiakUgHBrxGyQoPK+jA3x/x8fFHSt9qUdLNyfUYvMsAVbeVuK6ZjMv/CpvLpmyLM4WAxOI57M8KlECLG0bw6ovQ9l0Cv6BmU+Ff6oTyCXtxIbGjY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(966005)(2906002)(36756003)(186003)(478600001)(16526019)(4326008)(54906003)(6486002)(110136005)(8936002)(5660300002)(316002)(44832011)(66556008)(66476007)(31686004)(86362001)(53546011)(2616005)(8676002)(31696002)(66946007)(52116002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aCtwR21yWXlxU01RcG4ra3k5YjhCdkhaZ3dkNFk2eFVsd0hDZHU0YWR4cDJP?=
 =?utf-8?B?QVhuV0lkYTd1b3ZuTkN6OHFWaVNzekZYUEhBam5lWGx1Y1RqZjJZc2NtSzFH?=
 =?utf-8?B?enZ6Y3F2UDFCSUdTTVlqQWc1THZKQmlVSTV5SGpaclZydVZ1RGhFd0gvQ05G?=
 =?utf-8?B?RmtmTDN1ZGVYbXphc2ZpdzhkckxMUFNzMjZvNExTR0ZHTCs3RmxXWWJMRTh6?=
 =?utf-8?B?eEdEVGIxS0pVaGhlcWU0Qjg0a3ZhN1JsNTdwY3JmL2xKdTg3c2llU29RZnZJ?=
 =?utf-8?B?eHRqdkNNczV1Mm90RFVYNDRwMUJGekgrRktwdmZQUzBwSUdqQmxCQmovc2hU?=
 =?utf-8?B?cVVrcVFrZEpCbk03ZlJLYktTOGdSTmVST1k0SGxPODU4SnlUVkdpUjBrYW5n?=
 =?utf-8?B?eUJRQzd5L080NllVNFMvNmxBcXYwTUlHeXE0djNEU1Q1V2lHam00YjNjOHNp?=
 =?utf-8?B?SnRDc1h2ZjZLSklQamF5cDZKaUhzMVZnaG9GWDhibjJwYndsVlUxVlkwSWNO?=
 =?utf-8?B?d2tuZ0JaYXpIa01MZmdOY05ObmNsQ29iMWNTaE5qZFd4NHlSZDRKb0U0NUo3?=
 =?utf-8?B?UVVBZWtYaTVsa2ozeEdac1VKMVRqQ0REK1ZuZVFLd2puNDhRcDBrcEZOUStL?=
 =?utf-8?B?RWN5cS9nRTZsNktJcjhRVE93Z1JWZTlFM1dsRlhiK3ZyZUxteUtuZjV4SVJR?=
 =?utf-8?B?WkNya0UxVFBYODJCMTFGMmNPZm9Xajh6MEE1WkFLRmVOSDdOZHRLTTRqYjVO?=
 =?utf-8?B?azBBMzl0dGZFM1loQUJCQ0hjSTY2blI5UUxDNUFSV2tGOVVMMTR1ZzYxQW9i?=
 =?utf-8?B?Q1hZRE16SE5WbU1ibm54bTFweWo1QTlnMyt0UnNYN2x2YnpNOVNMM3hSQStt?=
 =?utf-8?B?ZlpidytTNnJxeWxmUU96R0cyd2RQSlRxNmNZVkVraHBlbS9GTUhRMlFhQTZV?=
 =?utf-8?B?OGkwMVhkYTlTTDFWZktLam01WEtWdGpwU01adDJKdVJYRlZQalRITU95THVq?=
 =?utf-8?B?d0NxbkRUUTQ1eml1bFFiNjhVNFBEVlBwaHFya3BURkVYdUN0VStIZXE2c25L?=
 =?utf-8?B?QkhDMnlDY2pjNEtQajdlQ3JlZk10cXdGYVlCbnhXbVVYbTdqVnRrUWQvNzJk?=
 =?utf-8?B?VWpieWVuQ3M3Yk50aUxBQTVTTU9YT0NlT215dk5BZzhRMkVDakpDQXF6amwx?=
 =?utf-8?B?V3FNTlB4OGc0L0lRbTRVK21tSGtxeERPcmRvSzdYaG5TbC9TN21aWXVrNGps?=
 =?utf-8?B?b2lUSWFESitvSWFlNU4rbEhKcHBBbkp2ZXJlTE1sUklNZ0w3MDBNSTgxV3Rt?=
 =?utf-8?B?NzJaRm1ZeVA1cWliYis2VTNZamR6bnNDR1Z1ajdEUkNXaXlwd01hZFora3Rl?=
 =?utf-8?B?SUJEUVRVTFpzRnhkTWdkbHBqZzJNNmtQSnpwdGtaWnlPYm94dGpnOVZTQkZL?=
 =?utf-8?B?RERFeldqbnJOLzBVeEpBQ25HVkZDNFhKQVJvWHBIUlVOZU5tNFFOK3VvOUYx?=
 =?utf-8?B?K2Y5c01ENklKbmE2akxtVjJOLzJPZExlaG5nTEpmUFlVeHZxc3d1blJVYjEx?=
 =?utf-8?B?ZnpmS2M0dTFPbFN6S2QxOHBOMTBFaXpPMUpOOXpMeGdlR21URHdrMmZQNDB4?=
 =?utf-8?B?ZnFpVzh0Z2lXMTAxUUZhTnVHd0M0eCtCNjZrQVg5U1VoZTRGMkZMRk9KNFBH?=
 =?utf-8?B?NWtQSC9NcTBwRmJGSGZBc2lSdDV0bjg5elEwU3lMN2FaWWViRGQ5cG40NVZo?=
 =?utf-8?B?THNuZFhvSDQ3U0JxYm1lT0t5dTJReXNSUDYxb0tub1dJdEl0MUdDSnRGZEV6?=
 =?utf-8?B?SVhlTml6ay9sUDFja2Q0Y0poRmx1bXFnem1iY0szV09UWXdHQjloL0pCbDR1?=
 =?utf-8?B?TGNlaVNrNk9Md1p4VUJMOEx0dWNqMWJVc1ZTOTNCVC9nc2c9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d11ed66-bfa4-4874-7f34-08d9270932ea
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 03:31:11.4901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7gm2njYq8psEXIMPlyHMefjSoFZE27WM3UaoMTY85o5MVvjb/Iu40orwTTFPDtjtP3WTjWQFyzWxVbZtz1JLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4398
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-06-03 10:53 p.m., Alex Deucher wrote:
> On Thu, Jun 3, 2021 at 9:37 PM Dave Airlie <airlied@gmail.com> wrote:
>> On Fri, 4 Jun 2021 at 07:20, Alex Deucher <alexdeucher@gmail.com> wrote:
>>> Please open a gitlab MR for these.
>>>
>> I'd really prefer these tests all get migrated out of here into igt. I
>> don't think libdrm_amdgpu really should have tests that test the
>> kernel level infrastructure.
>>


I am also a bit confused now what's the policy about libdrm - is it
being slowly deprecated ?
What tests should go to IGT and what to libdrm ?
The kernel feature itself is strictly amdgpu specific and not generic
DRM level feature - why then it's not a good fit for amdgpu tester ?


> We are providing equivalent patches for IGT as well.  There are some
> teams and customers that would prefer to stick with libdrm_amdgpu.


Here are the patches in my cloned gitlab repo - 
https://gitlab.freedesktop.org/agrodzov/igt-gpu-tools/-/commits/master
and I sent today for review to igt-dev@lists.freedesktop.org too.

Andrey


>
>> I know some people at AMD had issues in the past with igt because the
>> i might have stood for intel back in time, but at this point I think
>> we should be moving past that.
> I don't think that was ever an issue.  It's more that some teams built
> a bunch of infrastructure that used libdrm tests and haven't had the
> resources to switch to IGT yet.
>
> Alex
