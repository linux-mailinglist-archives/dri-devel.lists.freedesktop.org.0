Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC8B398C90
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B326ECAC;
	Wed,  2 Jun 2021 14:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2068.outbound.protection.outlook.com [40.107.101.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE0A6ECAB;
 Wed,  2 Jun 2021 14:20:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfDbmgj1l6BQ/GAdn1Ll2TBJBE2YBKcKEllnV3ly4WSTE+OXWgorOUgrOBupxqNyvIykENvuxf6n7Tsed8ULfIBpgFtYxe6/Vfw+EGvPn+nr4cYJHM7Vn5IaWJOC3w0pDBy1EkpBMJwsWtBH1Mh927XF50WB2A/JFcqfhcljzZ++43678KRlfX/nXvBFd+9xjHoyq0zRVYXDOHfjctA88GLeR5HrpDykzIEFVJWRsQYMVTmuFm9zim5zFKr+uvp7NDKIvZzB/WJfjigxuOB++OkXi4kzvmqBEdqpH9EMqpqb/wrXiwxsmibdZY4Fa7HeP/ug9eFpMgZmodc9L3YEzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/D8PS7oCwMI02rRdXON0VbaYOboBuS8kyPox86zVtA=;
 b=WZAi+JdQt3EfwbBLsfFkPTlOBowTkTamlLAk/i7mHf0j/Kko9ObK6pWGsm8KTewMRpkJ3dmafFFuRxRvXV+48YmfE+jAoaqBz9oZ2t7+1nelQRxwheD6+CH2VwU8J4FwnU5yi67LkHEW2KylsPBLXjFV+WPtP8/FePhxS2M/RSNU4o5PhtTClcEwrimQLm/tx4GG3NFhZ1QUy1Sqk82EMIwDnqKw8i19nbr1FHz8CsBzvUlAjQFsd/GrxnT+C9+9AqA6NCkyMdNl9KuQkd4p8zRXJ3TM/tdupoYW8alrgu/Wm9cPexME4+zwiS/e+xx+Dr2APiS76KAfkwf+6dN05Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/D8PS7oCwMI02rRdXON0VbaYOboBuS8kyPox86zVtA=;
 b=Moe/CmaOHluvZ28VEBNGmTJu+p5/W9DSpnGHUXWE8u3gUzGujaNSCyHmRLfriUx1gWljTWL0TXjk6T19PVFrqMZZPupw84X8gWHWyR48/Dc79vqNCocyfUt0E00NgkRjijRvmfdL36U9iW/dNaR3jtoNzfvBKecvB1XTtNNxjiY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4749.namprd12.prod.outlook.com (2603:10b6:805:e8::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.26; Wed, 2 Jun
 2021 14:20:43 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 14:20:43 +0000
Subject: Re: [PATCH 0/7] libdrm tests for hot-unplug feature
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
 <CAKMK7uFoLmOFCTkPMm4mMSScF0xa+MnHvY2FVmfBUM8b8S0_PQ@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <de4b3521-42f7-7fc2-7271-e4fa3cd91708@amd.com>
Date: Wed, 2 Jun 2021 10:20:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAKMK7uFoLmOFCTkPMm4mMSScF0xa+MnHvY2FVmfBUM8b8S0_PQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:8571:b12a:bb3a:4df6]
X-ClientProxiedBy: YTXPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::36) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:8571:b12a:bb3a:4df6]
 (2607:fea8:3edf:49b0:8571:b12a:bb3a:4df6) by
 YTXPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27 via Frontend
 Transport; Wed, 2 Jun 2021 14:20:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69c73cdd-6b39-43de-9c16-08d925d19b2e
X-MS-TrafficTypeDiagnostic: SN6PR12MB4749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4749771117F9D55E8C6AFD5FEA3D9@SN6PR12MB4749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OTVytDbbWPSeh1UtSgDbAGuiQYYEVhqZAjTjnRq7FTThNxcTHrDHUJlKjiWxQfltuzCcN0BpDRLRuaGCAODGKMPLblMiEVsgVIyhlPizq5PfovSG4/amD4vXba2gHw7vvXHiAKXj/TsFX/zlF0bweeMDjBtS4slTQLUB6Vn4Sgj28lCZMGBc4FCO6k7jLn7OygvTZJyleSlpm0E/AEb892Bu3mwu+SfcVevx3wBr7QmGlLl+HhdV7fG+BCvwpToeyVu8RHDzP4MwuhuklN4ubOyzJh28VFknLlXHmfT3z+eXT0bviAUb5kPOvgntAMke4QokkTY9ikyZhPrWRARxU7DD41bAH+tjyV2KxbtNatWzs1uopK5NmNji7mi9YGgGbgXQvpmEoemu7q5vVru+mBw2Q/igL6BHbATEUMx8EVApRTRnHIwKBWHhq14dPZWY3HXEm4N6qag3rrcm7hVdaUfqVQUKEFUv4gzoY5sdxYahwUHBpT30ytrkDAfjHCXFkimMyJwdiwEcaWUThn5hDMBr5Vy5EoGjK6ieWzzBL0+HJlXptxLIKB3zEbg6zVkCzyn+jKhVnyVcs894DUH2lbZyEAPLu3D1QSA/mqQ9kOg7PhFQur1XP6x+BvWNFXhG+GeZgBrMsemX8gdIBjy7PfMp+Jtn0hMq1e74iTo8Z8N+o8etEk8P2rEHs129us32TQSF/f2K0CiakcyxUjK5in8h+RailOkiJNoIqQUtdK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(86362001)(38100700002)(8936002)(316002)(6916009)(8676002)(36756003)(54906003)(66946007)(66476007)(2616005)(52116002)(53546011)(5660300002)(31686004)(478600001)(966005)(6486002)(186003)(44832011)(4326008)(16526019)(83380400001)(66556008)(2906002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U2t3VFpDZ2I0Z1l2QmtVcjFROGZPMkxRSENOSDZ6aVRpZkd2cW9zWFNUN0tS?=
 =?utf-8?B?elBCL0FSbko2eGU1dzdaRW1FZEFGNjJHeDM4LzhYN3YvQnVxZ082WXdtRnpm?=
 =?utf-8?B?ZnF0QnNVQWF5OHNpczcrNVU5TzRWdHFubTZrN1FYQTlnRlAvTk05RnNRaHZR?=
 =?utf-8?B?NmVYVUR4OFNKUy9sOUhLdXRKTDUrWWo3STduQ3BpYjl0VHA3bEttUzJ0Z091?=
 =?utf-8?B?Ym02K0FWT29iUFFmYlE4ZW53SzlqL2lvNDFERTlSTC9PYktMRjl4eVNaZENK?=
 =?utf-8?B?eWtzdzAxTStBRW8walgwVmFXbkVEaVEyVnp0Skh4UE9zSFlteWZja2RnOWRj?=
 =?utf-8?B?eTlkWUV1NmFxZGJGbW9HTzZuZmRxM2hpaWFBMDVPenNHalY0bWlvcFJsSmdD?=
 =?utf-8?B?dHR6NGlvRHdHSFMrTGR2WXFoVjZ6YTNHd282RlNKQ1hFdmFRRU9BcUdxcG01?=
 =?utf-8?B?Z2x0M3Y2Tk42VVFJdDU4OWFkZERyVmd5cUZ0L3N2UlpPNTFiUC9kTml0S2ZP?=
 =?utf-8?B?ZEtIWXFoZEM3THVTeXZNUFpHZ3k0dDI1Syt3MVYrcGowaFNVRjlKb0lscXAx?=
 =?utf-8?B?TnVUdGhXOFBCWHhRd2JzWWZDaHF1eVdvcnpmVThtc1A1T00xZ1A3eWFjMzVi?=
 =?utf-8?B?RXVRN3hIa2loWlZyWng2dk1GWUFLTERTbWp2aEQ4b0ZPZU4zNE9yWkExZ05w?=
 =?utf-8?B?V2xMcytkQm9xSTNETFIvcGlHeDIzTFJBRGZGNUJnVVZiYTNYTmdCd1V6dlpx?=
 =?utf-8?B?WVcySWZrSHc0eDhXeXpyU1ZFRlVzeFk1WW03RTlTb0kzOWdpS2dMc21Fa2l3?=
 =?utf-8?B?enhTMk9yRVVyVE43SXAwV201NWVhZXRaYUVKRmlvRTcxM2VXUG5udktaN2JY?=
 =?utf-8?B?dGFtRDFENzc2MkNFb1dZS2RGQ0VSeUxqV0I1RkE1NXVPaysrdVFML0Q2MWhJ?=
 =?utf-8?B?bnRIVGlnQ0ZOaTZ3VGFneVE1cGhzeENCb1Z6TWNaNW9QeExZR0kwTFEyWDJm?=
 =?utf-8?B?R3dXSE9ZeXRZUndSZzNiMFBMVnU5RWVXRUxKRmJoK1lhYlU3VzAvc29rMHlu?=
 =?utf-8?B?TFVDSnZYVzZxTVVIZ3ljVkpTRlFQenk4bzZJWDhQYzVrRFNCdVhRMHFlRldw?=
 =?utf-8?B?S1NjMTlUZTcyZjdlMllhS3BraDNrNjJlaFRvbEpHTUlsdlFEMmVGZG53Z21t?=
 =?utf-8?B?VWFadTE2emR0dVhUNG5peW9Fam5XKzhxZjJzY2xMa0lpemZGd3lFbTRUMjV2?=
 =?utf-8?B?bHVtY0VZR0tFSitMNHpnVEdpTVZwdFViVVBCdnZ4UnlpaVFsLzc1MTR5U3My?=
 =?utf-8?B?dVhlcjk0M2hZVHZjRnFnMFREV0daUGdKK3RGNDZIWXB5UkU2SGFlV0dNa0pr?=
 =?utf-8?B?K3ZKOWRCTkNjVU1YQWdBSGlGTGtLWmhDNXVUOEo0NUFBbnNBdDJaNkVvWHRP?=
 =?utf-8?B?K0pUcnZZck9ZL3E1dytCZnZQRWYwS01EL25kdlpVYWlmQVdGV2ZxZStIL2lz?=
 =?utf-8?B?K2FOc3IrbnZGbUVhTzZhNlBmUEkra0hIOE5xN25DNmpNaHcvaWJYd0hPL3hy?=
 =?utf-8?B?MHFlME55aWpzT2hvZ2ovdEgvRUFmRnBodUlYMjhlcGtDWmV2RFdTSUttb3FH?=
 =?utf-8?B?MUFmVTlsTXBHODJpVmtLQWNLK1duRjlqaUdFTW5hKzFpNjk5a0p6WDNQdXR6?=
 =?utf-8?B?cmZLanI2WmJGR3gzY2FPU3VPQlQvSHVXRHF6UnpBRVQ5eVA1LzNLS1N2SHVm?=
 =?utf-8?B?SjlVUjJmUm5LYkEzcUJCaTZiaW04WHJ5SldpK1VWL25RaHhNVTlJQUpkWlFy?=
 =?utf-8?B?WDBRYU5FL051RmRvcEJHVUx1UUFLQXhndGZEODRrUlZIeVpNOTltMkF5RWwy?=
 =?utf-8?Q?guBaOGhmGP/t+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c73cdd-6b39-43de-9c16-08d925d19b2e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 14:20:43.6428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHnKRGU5OWabOf888zrxoT3Rw+moBFa17ZqEl+gelWTyJtAAbVfz1bKgJNKK7vHVn0Pfsb70WVjmBYq+sX5R8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4749
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-06-02 3:59 a.m., Daniel Vetter wrote:
> On Tue, Jun 1, 2021 at 10:17 PM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>> Adding some tests to acompany the recently added hot-unplug
>> feature. For now the test suite is disabled until the feature
>> propagates from drm-misc-next to drm-next.
>>
>> Andrey Grodzovsky (7):
>>    tests/amdgpu: Fix valgrind warning
>>    xf86drm: Add function to retrieve char device path
>>    test/amdgpu: Add helper functions for hot unplug
>>    test/amdgpu/hotunplug: Add test suite for GPU unplug
>>    test/amdgpu/hotunplug: Add basic test
>>    tests/amdgpu/hotunplug: Add unplug with cs test.
>>    tests/amdgpu/hotunplug: Add hotunplug with exported bo test
> Given how nasty hotunplug is I really think collaborating on igt tests
> on this would be best for everyone ... do we have to keep doing
> parallel tests here for amdgpu?
> -Daniel

AFAIK as far as AMD goes a lot of developers use libdrm for regression 
testing
while developing their features and also QA as i can see from some 
internal ticket
specifically opened for failing to pass libdrm tests. From my bitter 
experience with
GPU reset - features which are not part of a common use case such as 
device loading,
mode setting or commands submissions tend to very quickly break as 
people develop
features but never test them in those uncommon use cases - this is why I 
feel it will be
very helpful to include those tests in libdrm.

Also given that this is libdrm amdgpu code it fits naturally into libdrm.

Regarding IGT - as you may remember I have them there too - 
https://gitlab.freedesktop.org/agrodzov/igt-gpu-tools/-/commits/master
I hit some compile breakage on debian platform there which i need to 
resolve before i will submit for review there too.

Andrey


>
>>   tests/amdgpu/amdgpu_test.c     |  42 +++-
>>   tests/amdgpu/amdgpu_test.h     |  26 +++
>>   tests/amdgpu/basic_tests.c     |   5 +-
>>   tests/amdgpu/hotunplug_tests.c | 357 +++++++++++++++++++++++++++++++++
>>   tests/amdgpu/meson.build       |   1 +
>>   xf86drm.c                      |  23 +++
>>   xf86drm.h                      |   1 +
>>   7 files changed, 450 insertions(+), 5 deletions(-)
>>   create mode 100644 tests/amdgpu/hotunplug_tests.c
>>
>> --
>> 2.25.1
>>
>
