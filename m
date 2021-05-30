Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFE93951FB
	for <lists+dri-devel@lfdr.de>; Sun, 30 May 2021 18:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E1C6E12A;
	Sun, 30 May 2021 16:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5226E12A
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 16:40:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrRzWdE4nVUGa9JPOFnq1aoDB0y6p90qusWZGjOBDIPK1Ut7MY3VwEJpRYFzguViDOK8fxed3r3Dv1ABXgmZN+7/6zSo91CxR5Qzqk6DLk0+VpzKOzjhaZXNdzX6SDNWKxhEjIniQUU8bvFnx4EbLQzLDj1JG3psMR5LH6m65YCsHe4HFt2n+RXjmkCO36RNZZf8ly/9sz7hOK8GGF/bvYY3VrQ0q8LWMpZcj6NYTFgrYFiEoyZOxf+FKVA9m4MT71hY2DGuEyp7eo5n989kq5pl1u9prFUlOXPbobxdUwAFpCnOryiktYcCch0XRqVLwBi9HUyOinFgsxnaSMgCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsWmNSEWXqmCgQhjkna+drDwJorMUKz3A1VnAo+8RMM=;
 b=kvfmdC+/JNIOTvioFRUmhrjNMR0bWqthqAhU1x5LpwWnNrl/xb+yTgBy4sq/jaIbx4Dz9smfDr8a6J4J7qM8Cr8OqOJMyQNBF6AbmZP/Uu1uQE0/NOBMilIe8Qy91zOTeLVNA5cLVGfoqSn0gVeS5brhEdugpAx4L37XavhNDbjU/cEV2WitF6noJ7cIJ07LFLaQCI8nTK5C6z6cQiI3atLc6cF40hKpOOA0o2d1FSkeouWdHLPI4q/NGNDl1wOIH4h7C3mCBbTXDWzHf/87kWUDEDlhQdensuIwUQsvu8LFLHVJrpgqyNp5iqYzv0eV9SKpPTZh0IR3z+Bkjl8f+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsWmNSEWXqmCgQhjkna+drDwJorMUKz3A1VnAo+8RMM=;
 b=jbNOQTx59r5lZhynFZDPJwPjxJXsdN7Fv4k/jNIYR9NuWYVmeuP+2eGG53JZnpSffjcuEr+YhsMbpE4u2tiI2pOBNH0UtOP2q8GDpYyeNYN0Zgc6UaZVqJMmly8oKnT3FwGzQ/hbYMQzwhRBFQZARSfcIy4Ut+SOfx6sIsZdz9M=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Sun, 30 May
 2021 16:40:51 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.030; Sun, 30 May 2021
 16:40:51 +0000
Subject: Re: ttm_resource_manager::use_tt
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Zack Rusin <zackr@vmware.com>, dri-devel <dri-devel@lists.freedesktop.org>
References: <3ed92523-df06-87cd-f926-e632b780f69b@vmware.com>
 <b743342e-5151-110e-e29e-bf89a34d085a@amd.com>
 <54e4bb04-602b-b1d3-7361-8badce45206a@vmware.com>
 <60c9d566-608e-95c1-59d1-4d5051c1997e@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d6035638-cbf0-e17f-c8ce-abfd76e7a0cf@amd.com>
Date: Sun, 30 May 2021 18:40:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <60c9d566-608e-95c1-59d1-4d5051c1997e@shipmail.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:7459:84a8:a215:bca8]
X-ClientProxiedBy: PR3P251CA0007.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7459:84a8:a215:bca8]
 (2a02:908:1252:fb60:7459:84a8:a215:bca8) by
 PR3P251CA0007.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Sun, 30 May 2021 16:40:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90d2cd7c-5a0e-40b2-3571-08d92389af7b
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4899ED9660789BEAEA279F4D83209@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o1Lig/W1V3eX+ETQZuBiesp3jrde56u1K8VKoo/j4YzW9EGyKS/uSU3eCL+06+Af3zJ1To4NZSPtXDxje42pCDVi0RKK41JPSKDhxvp9Lt2IA8CdN3ASuFtfa+3WXefiVUO+b7zO9D17ip77VRPBFk+qNBBe0glV3v0nQq8Wb/ZyxXyH0rm2DOri66uqa8nImGajy9Bsh5uyzfZqkEnlHRNW9719yQ68TGoYvlyuyOFn8XNaBfuzJEJ0pEaXqBPNPl/Uqw+TQbRUU3uUNlv7dJ3q6u4nwOPJqLhlfZl4tLgbCh28IlhJzo5WXD/V3QE5DN/yfkJ4aAGoft0FXtDGGXFbg6VCh5JWNef4+1fbC5T6OSpwakqE7y3q+6jq0oz62z0+LMyuwls8NYb9P1BdBe+a3jWflT+POYiHFq9JS5sStiyckrnuy/B98AMmmAtbtkkQccuM265b5zQnspa+E9zRtQMiIcne5UU4kQ4s7YqtbU2QLymoyBH85Q6l3xHYrnC257iDjqIEMpsf7Vhh81hVW/mSNX1ZKgj+iKITTlJjCjtfxbDUPp++oivUTNUippPf2WZo4rB4FCrqmJyjiDiOcD/GfeJUt6jL/ieYpFTp73uQrqPGlTfvQfL8pRZ+k5Rf4W78yD+kweXhh1lRhVa6n/X/ozmiQbQhrrsfmgpVXVh5KWUoqAA+Ajk7Rjwl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(110136005)(36756003)(8936002)(16526019)(86362001)(31696002)(2616005)(66476007)(478600001)(38100700002)(66556008)(31686004)(5660300002)(2906002)(186003)(53546011)(6486002)(66946007)(316002)(8676002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VVJHTUpQakR5NnJuZ2poa0ZydlI0MVRTa3RVeTE3WjA0NFp2bWlnV3NZR1hT?=
 =?utf-8?B?ZWhzeDcrYTM4NEVQMXlSM0craVRidlE4MExib3ByM2FBU2gyVHlzY0FyYkN2?=
 =?utf-8?B?ck9yaDVvbm8vNVoyaTFuRU9NVWpiTkFOK3dsRFRRTmxiYTB6WmdyT25SMnc2?=
 =?utf-8?B?ZUR2VFJ6UE1PQ3o1NTFJaVVkSWxmaWE4aE1WQk00aGFaTVZYMkxTUHJzUUQ1?=
 =?utf-8?B?ME8yUDRlaEVoOUFTaXcxa1JHc0UzUFJ2MloyZk03ODZKTlNDaCtHS01vQTc0?=
 =?utf-8?B?ZDBwdzBjQWdTbjEwanhmVVBLTXlUekdwUEFJVGpxakFzaEpLQTJtL3hhMTB2?=
 =?utf-8?B?YVVsbnBZVUpxcnBKQU1DcU5OeFR1RHNXTmFSUGtGNXlxNngrcStsUDBjL1hD?=
 =?utf-8?B?dDlEa01oVVVBQjRCSnF2MkZrUVpMTEhrTERnRVBycFVpd2tKcXdnaCtvazdH?=
 =?utf-8?B?QmhoTXdKZlcvdEh4NkE3WFh1WHdNOS9BZ0RHWVYzQzliS1VUbXdzRGhhZEE1?=
 =?utf-8?B?M2JSRzBHcTlPTW5CSHlZb2N4eWlwVlBvVy9PdGMvSnlZVGpFNGVOdmVaanQy?=
 =?utf-8?B?TE05Rnp4S1pyRDREeXdGZHZLekd1MmxsR2FTQWMrYkdJc2FjRTZLYlFmUEo3?=
 =?utf-8?B?SmF0WjZlVExaVVpMTzA5K3RtN1E5dXhWNXVsSTg1QkliS0RCQ3JXdEU2TVV4?=
 =?utf-8?B?RllsNGMyc0xIZXJjUG43bkJSazVCWWhETEh6UUJGL2NVcmVBVmNUMDdjU0Ez?=
 =?utf-8?B?RzVtK1I2bWdBTkFobjdOWDBDQklTRVNTa3VLaXg5cGFoQURSRUxmYkJtbUZD?=
 =?utf-8?B?M1d0RkRpN2IrbWt5RllQYVlSd0RseUR5VzhUWHhyY1RPclRwY0REak9lYUor?=
 =?utf-8?B?MXJGenFOTFRNN3pBRzQ0d25vK0VIdGZzMXYwd3Q2b202UXA5VThVT01ZMm5M?=
 =?utf-8?B?MnRzZ3YzdGN6M2xlYk9wc1BiRmQ0b2VmaU00T1dTUE9VWGVmdUtJTmdydDRE?=
 =?utf-8?B?UVhQS2JPMjJjczJRSE1YNjBjZUd4Mjc1MVJoS1dKa0NEeEJsd3o0THJXYjly?=
 =?utf-8?B?OHltcVQrWVR3VEJUZDBuaCttT1NodWpCQnNKYVV4cytkOFU2MDJOTWp4S1R1?=
 =?utf-8?B?bGlNTTRrWnc5RGtRaUN6Uklka0dqcklVTSsxZ3VYWXcwbGhLc0xEeDhsV1FF?=
 =?utf-8?B?bGVRUWdJelNqYkZERzB0bldha3Rxd1BDSXJRRitKTS9IcmFPWDVsblhGTDZ6?=
 =?utf-8?B?UUtROUVCS2dzSklSVGxmbDI2S20vL084UHhKLzVyOEVXaVg1M1l6WTJYNzFl?=
 =?utf-8?B?OU5Bai9yTVo0eFVKQnlzWnhuaU9FdDhScHQrN0gzRmVVY3pNRDlpSFRXdklw?=
 =?utf-8?B?aWdOVVJPZWJxSFlLamZCUXQ3MkRtY0NacDJ1VFRTWmNiL25wSVdoZFJ1V1NV?=
 =?utf-8?B?bzhjazVpM2FraDJCR2J1UnV5MVFIZG9Zd2V0Q1o5WHYxSE9xaGxId3ZueCta?=
 =?utf-8?B?SndwMkJ5b2NlUkV0R2tkODZQQUhtelhRY09pUS9aMzZtUS9Lb3c1WUhkZTN3?=
 =?utf-8?B?RldFSHY4UkliZmErekd3bXB5bnZBUWovbWNCZXAvZUlVd3M4NVQ5dUhKNTRR?=
 =?utf-8?B?TmlpZFlGTWpIRTU5dlpQNnFCNE4vLzdVVkgxYUd2azFRTjZNSGFEbmdHNlBC?=
 =?utf-8?B?VDVCbEQrRXI4SFNFVWFEaVh3NlNuTFlFeXovT3VST1dVOXlaVHY2RUI4M3Iy?=
 =?utf-8?B?UUl5RGk5ZU5CbFlUUE9IbERHbSs3dlVDNU5LU0I0eGkzVkFlSHBNTVUvQmZX?=
 =?utf-8?B?RmJHQ2V4Y01hbW9GRlpqa0ppZ1NlNWMvZzVoWlhSNldwbnhaeFhUamlnOUtm?=
 =?utf-8?Q?enAFLN4Tiv9CR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d2cd7c-5a0e-40b2-3571-08d92389af7b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2021 16:40:51.4053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +nriuFRtTiXbM8hWzFMvYJoVaY/SI2kskqv51YdASd96Up2E+IVwyDw+wWxxCt/t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899
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



Am 29.05.21 um 17:23 schrieb Thomas Hellström (Intel):
>
> On 5/28/21 9:30 PM, Zack Rusin wrote:
>> On 5/22/21 3:13 AM, Christian König wrote:
>>> Hi Zack,
>>>
>>> IIRC that was for the VMW_PL_GMR type, wasn't it?
>>>
>>> As far as I have seen that backend was just giving out unique 
>>> numbers and it looked questionable that we allocated pages for that.
>>>
>>> E.g. when you set that flag then for each allocation we also 
>>> allocate a TTM tt structure and a corresponding page.
>>>
>>
>> Got ya. Yea, it's a little messy. I think it's correct. Those unique 
>> numbers are just identifiers for the bo's but the actual memory for 
>> them is regular system memory (e.g. we just tell our virtual 
>> hardware, here's some guest system pages and here's a unique id that 
>> we'll be using the refer to them).
>>
>>
> Yes, allocating pages for that memory type is correct. The main 
> difference to other hardware here is that on other hardware those are 
> bound to gpu using a range in a translation table. With vmwgfx they 
> are bound using a slot with a unique integer..

Ok that makes more sense then. In this case just drop the TODO.

Christian.

>
> /Thomas
>
>

