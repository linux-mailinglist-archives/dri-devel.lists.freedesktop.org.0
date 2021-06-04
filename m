Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C39FB39B465
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 09:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E296F5C0;
	Fri,  4 Jun 2021 07:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39E26F5C0;
 Fri,  4 Jun 2021 07:55:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4LVR9+O/WkDQR7LWqTDsh/+m4kTkbcVYAzgD3CamlFM5XAq6wRPRkou4m6zJJs3kB0uHg7syZxxU3TKThelrXe2MX2Ec0ZaJmzni4pKSuh9U8paqbiJNjQoJb6jQ1a3/IuGtwVgeD+FS6v+lrHclV4Yj9OvSEg5dI/L5rVTsPDHYaqq9zxMQMIH+wNT/AyLFWLau9oCpjHYz3K3UhvnVMVuZvpNFRYcguoKoI/m98k98Bk9LnjBPy0ynZJbKrxpvbWSfp477SXNz+SlniSoEQK+7N+iLcv0umSzWESnxyI+OrqEHA3IReVXuGgV0Xw5DLfk71pI2oPWL12eEZqurw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhHmq0iAJ7Cffhwf62bmw/SelIQFqD5gujRd36KkDmw=;
 b=b11rYvHJd7Tuff8asO1d02UiYkyquq66QUN6E4AdGWTbXv399StZ93/1oOaeTxkNda3UionIubqF7NGrbR+KSS2s2/XGNkduhlxiC8hJsWiedBeaWoCuvZ4SnF5XPshnOfphStbZFjtI+yJEH9ZfbGb5F/ZP+qyEKSJaR6hQy7JrRaSnGeUZnyiDElRkpndjtPZ9EGKW6auBYckzCXeP2L79G5f+aW2W70Y0cSSIBzuRKKnwbzv5WXWo9PfurkfFVo38pYMjYxq5LbUuFJob7ENaWOlYj4shk8xe/PWMMYJsySLVpzYwgJXIZH2xYi8/NUI3IWDehRPGgLKpg/hcMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhHmq0iAJ7Cffhwf62bmw/SelIQFqD5gujRd36KkDmw=;
 b=h2waKS0FlIoRqCPYhIf7Wh/m6r9HAC/TDZlXCjGyBGiAQtFPNwQF7VdKz84KGlrYJ7rKrA6QGLpWa0GwWt887o2aqtOgJjbqnJcEGZiU2FeAWeHaM04uxtj/hAEucNJVpFMjQg1uIiACNaBnN1OUZ6tO0I9W1bm97xM5wMXO7a8=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 07:55:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 07:55:46 +0000
Subject: Re: [Intel-gfx] Merging TTM branches through the Intel tree?
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <a29eaef9-2457-1393-6757-40956811daf8@linux.intel.com>
 <a6965639-acf6-b5f5-482c-2715e7fa69d4@amd.com>
 <b4c18e45-98c9-ce7f-b22c-c00c795844c2@shipmail.org>
 <baf4f828-76c8-6b47-5bba-9b9c8e7b307b@amd.com>
 <YLfQplT8H6PdCCLX@phenom.ffwll.local>
 <c50fa98f-3735-fe04-d3f9-8a7a08a7562e@linux.intel.com>
 <CAKMK7uE+fB_+UG668O=QMXwQ9_Xb--KhzehT77HLfBoWve-zLg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <68e6057c-df17-64ce-3116-cd5e79578795@amd.com>
Date: Fri, 4 Jun 2021 09:51:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAKMK7uE+fB_+UG668O=QMXwQ9_Xb--KhzehT77HLfBoWve-zLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [178.202.40.45]
X-ClientProxiedBy: PR2P264CA0042.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.137.54] (178.202.40.45) by
 PR2P264CA0042.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Fri, 4 Jun 2021 07:55:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4810ecf0-23c2-4ddc-3c8f-08d9272e292a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41429C4AE61F21BF09428B82833B9@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uUdIGXNC/8jBKn5U6gXBe8tFdKg8Gab9Ez88LWHvxMx1rZ3/Lw/2mceQ2LJMzb7/I1h30/1YrzuplUIwruM08QON3PQMoofSX9Ce/pDmZthkbZpqQB3jpiYTZLhKBU9qFovmdDteotIjSG9ZbF+745/rx3Ah9XQZLq50o6Qd21vSgkQRaIQAS7QY7xJP2w3yTpxHJEzVIZID2tOCdchkyFRgJljuayDUmM2cDgl8QfhZzwiIGndWrohGyypbPBAo3iRL0DVV+DSwyNkINutc7Yuee5z7XhPtNAb4SOWMghCv9AoFYa0COdPt18hxSHPVOPZXDQWgVVAcfIdfNLKKty7tACP9WviwtKwS7sLDIADa38cKg019FAYkipW1i4HRNwqhDqbNP73uUUITw9tH1LAxoHTN0wfPpI7VPbunw+Vb1tctKaYqqPeFHjmvvDNWLcvwnbWHGmozHhkF+o/Yr+xxsvsdccM/s0zMseJES0e1rFn9zC8T+mn+iAqnzSqxNJuEU3sKou33HMDW7MCeoPQh/n/1JyZXilaqpAqd14JhmMV+xuAJgqfArQv2q+eOXG8hUcsadsF/9KuWYtYcq+ztm9kZeQ+fruBMklegst476tcF5sDh+LEHlTs4lR4flOqFF3SZ+81tnkuKZwSyajCAThSifYggi5kMWC1i+2C9LVUf53pdCQ0Eb5e8nVeh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(8676002)(4326008)(2906002)(6666004)(16576012)(31696002)(16526019)(66574015)(53546011)(5660300002)(186003)(316002)(2616005)(110136005)(956004)(38100700002)(6486002)(86362001)(66476007)(66556008)(8936002)(31686004)(83380400001)(36756003)(66946007)(54906003)(26005)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ymo1Z2E3UVQxN0FQdHdVK2NJYUR6bWNDM1d0NTVpbG5keGlXdGtSamxvRUdS?=
 =?utf-8?B?ODl3eG9FKy9Xc3RES2N3ZlB4aXpKQXBPcGJneGtRY244TGZuTUVBdGhOOHZG?=
 =?utf-8?B?QkJGMDRDalorT3ZsaGVPVnJBcU5meU5neTJBci9uQkhvUk9EcXY3dU5kbjM2?=
 =?utf-8?B?d3RJamhrK3JnNjAwRlhRRUlRWGd5M08yYzFhZDVRN2VhWHY3a1EyK09yeWZ6?=
 =?utf-8?B?WEFuT2NuR3lka2F3SGFPSVNDVENHT0dnU2FJYXlOQzI4NkJ0cnIrUXZSSTlW?=
 =?utf-8?B?eGVkOFppOFRhb1ZlZW9mUFFKMXVxcitESWE1YUNJTmd2Z04vK2NpN0lodlg0?=
 =?utf-8?B?RmRlNkUweVlLaGF5eXlwUkVwejUwTU9xTjZRdkErVWJqMWlFb3lMSHlVOXFJ?=
 =?utf-8?B?dEw3MW9JNEJsSG5PZjRsMk9JazNqcHlCYVJvTmw1aFNXQmlKNGxhbGE2ODFx?=
 =?utf-8?B?clRoVWVKclQ2dDMzZUFiNXMzQ3M3eWNQMFBSZHp6aHRBZGdTTFkyZkx4WFJr?=
 =?utf-8?B?QktJRi81RU4yU0U3VDZmbjhLaXozRUlHd3R1K1NJREJaYU1BUVREdldUWDNQ?=
 =?utf-8?B?SlUrRHAzL1dUZTJaOFdNU1hYNUYxNnpGZzdKNVM3WmRscTJjSzhBK1BJbWpz?=
 =?utf-8?B?bUNEYktEZngvMUhIZXdUb0lqQ0FxcWVhdWVZaW5tK0g3ckJTQVhqRDdaNlRH?=
 =?utf-8?B?aGtsSVB5Rnp2NXdqNTZBR1VtODlLS1l2VkdNbEYrcTJZN1pHSXFUSXBDRVNT?=
 =?utf-8?B?ZWt0OTNYNzkvN2pKbzkzRzB5WFJGNWJlKzhodzJ3MWNhSWRYTENUK1FTUFdw?=
 =?utf-8?B?NDlFWjNjZnhsL2lFeldiblprQVg0RDBQT3pTVXd4WDhmUG1sdi8yY080ejJK?=
 =?utf-8?B?MnlBYnRtTklqYks2dlpWRk5rZWkxV0dPVzJzaXNMU2d6dHRvRkN2cUhKZUNo?=
 =?utf-8?B?d1ZkUUFoNGxzUmpSb2w4R29zODlRM0VLZERldlI1Wk0xejh0SjgyYnBuRC96?=
 =?utf-8?B?SzNIcDRZM1E1dXd1T0RTdklEbGlrdlRlc0tBUHErb0pHL2NPLzYzeDRNMzI2?=
 =?utf-8?B?Qkl5SWQ5b3JxcnpvNGFYZDc0MWZjT3ZVTjQ2dmp2Sk1WWS84OUIvN0lJUGJB?=
 =?utf-8?B?cmdtdVB6Z2xGd01rKzBodzBDWGtkRVhEU2JZbjZrK2huOHRWQzNFT012UW14?=
 =?utf-8?B?bnQ4YTVvQS9QaDM3U0FQQ1I1YlFnRGIxbmUxc2pwZ0xUV2oyRVRTQkdHTjJZ?=
 =?utf-8?B?cks5M1ZVVlZja2ZEK2xmN3g3eFEzM3NhbmE3K1NZTWFMY21YKzB6NHZTZ1Q5?=
 =?utf-8?B?WjFsQ0ptSXh3NXJwMGVORkJuenFMRzhiMEVuenJFaGxGM0JiSkVQS0s2S3hn?=
 =?utf-8?B?S2tTbTlQc0t4VDB6UEp4aXFUZDUrcHJuMVlDVmY4d1RHck9vN3loU3hGNGRJ?=
 =?utf-8?B?RzA4VEFTb205QU91WE83dlpaZFNxbXZsMkpwTVlYZE1KamR5MVQ0VSttUCtr?=
 =?utf-8?B?UG9iR29IcG1Fdjk5VHQvTXFWeXZlTDdWb28wRnBMemhleGZqKzlHYm1YUm1P?=
 =?utf-8?B?akViWjZEb3Z2VmU3VmxQeWd5MXhiNnpSYUtaWVpOT1U3aEZ1VFU2YzVoOEZs?=
 =?utf-8?B?SVlEa2ROZDFUUHhqMTBqQXdmbkx1UWJDTHZtTjkySUZGRGFGbzFQTTNHY1pi?=
 =?utf-8?B?VWMwNTlIOUltUkNFemlWb2VGdlVuZXB6ZGFOWjJmV01ZVTVRQXR6eWVUL2J0?=
 =?utf-8?Q?nfT4CWmvHInhy+lyKcmUdHvjuXOKq40kBaX+PU/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4810ecf0-23c2-4ddc-3c8f-08d9272e292a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 07:55:46.4217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysU8/RMxQoqUgkFBkeH1EjE72P2yEEhZT8tbrZ3iIxJxhwCyH1grk0FmSVASikg2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.06.21 um 09:36 schrieb Daniel Vetter:
> On Thu, Jun 3, 2021 at 8:50 AM Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>>
>> On 6/2/21 8:40 PM, Daniel Vetter wrote:
>>> On Wed, Jun 02, 2021 at 11:48:41AM +0200, Christian König wrote:
>>>> Am 02.06.21 um 11:16 schrieb Thomas Hellström (Intel):
>>>>> On 6/2/21 10:32 AM, Christian König wrote:
>>>>>> Uff I'm just waiting for feedback from Philip to merge a large patch
>>>>>> set for TTM through drm-misc-next.
>>>>>>
>>>>>> I'm pretty sure we will run into merge conflicts if you try to push
>>>>>> your changes through the Intel tree.
>>>>>>
>>>>>> Christian.
>>>>> OK, so what would be the best approach here?, Adding the TTM patches to
>>>>> drm-misc-next when your set has landed?
>>>> I think I will send out out my set to Matthew once more for review, then
>>>> push the common TTM stuff to drm-misc-next as much as possible.
>>>>
>>>> Then you should be able to land your stuff to drm-misc-next and rebase on
>>>> the end result.
>>>>
>>>> Just need to note to David that drm-misc-next should be merged to drm-next
>>>> before the Intel patches depending on that stuff land as well.
>>> Other option (because the backmerges tend to be slow) is a topic branch,
>>> and we just eat/resolve the conflicts in both drm-misc-next and
>>> drm-intel-gt-next in the merge commit. If it's not too bad (I haven't
>>> looked at what exactly we need for the i915 side from ttm in detail).
>>>
>>> But also often figuring out the topic branch logistics takes longer than
>>> just merging to drm-misc-next as the patches get ready.
>>> -Daniel
>> Daniel: So the thing we need to get into TTM is the iterator-based
>> move_memcpy which is more adaptable than the current one and needed to
>> support non-linear lmem buffers, some bug-fixes and minor changes to be
>> able to keep our short-term-pinning while on the LRU. A necessary evil.
>>
>> Christian: it looks like you have landed some TTM changes already, in
>> particular the &bo->mem -> bo->resource change which is the main
>> conflict I think.

Yes, I thought that pushing this with Matthew rb should solve at least a 
bit of the conflict.

>> Is the 10 patches self-allocation series the main
>> remaining part?

Yes, exactly. I only need Matthew's, Daniel's or your ok and I'm good to 
go as well

>> That will probably cause some conflicts with already
>> pushed i915 TTM setup code, but otherwise will not conflict with the
>> rest of the TTM code I think, which should make it possible to bring in
>> our TTM changes after conflict resolution with what you've already
>> pushed. The memcpy code is pretty self-contained.
> I think in that case topic branch on top of drm-next (once the ttm
> bits we conflict with are there) is probably best, and then pull that
> into drm-misc-next and drm-intel-gt-next. Merge window freeze is also
> approach, so without topic branch we'd be stuck until like -rc2 when
> drm-next reopens. I guess Maarten can do the topic branch logistics in
> drm-misc.git for this.

That approach sounds good to me as well.

The amdgpu branch had some merge conflicts as well, but nothing we 
couldn't fix.

Christian.

> -Daniel

