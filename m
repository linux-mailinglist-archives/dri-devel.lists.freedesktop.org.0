Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F276985D2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 21:46:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5776210E2AA;
	Wed, 15 Feb 2023 20:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B62010E2AA;
 Wed, 15 Feb 2023 20:45:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glV2+NlPOqOehe86A1c8Pvi3fdmg3coecCeEA/xSAVORuk/bFyJ3ZVj2TXQ7Lxh4zov7TLGR9978BQwrdgV0zEm4dKlSNCxVNA06zhePfB/9xAjpk7LTVVrdZIHaSCBfN/q7a8zwYEui2F4l6+P7IqvbCV44cBWU16QqDpuPQz61z1rGz5KtXLoWCPd9Ca+B4Odu5CcoJsH/7eAnBNo6RZnKFHLZUBzGgDJvK6mLyJIohMpPWnUMM7SAgHmytVoqo8CEuO6f4RhUBEHlBOMIstvx7LKHVl/bd6eqbAZB96OnvyaES9K1M7el2tMRG473zDpeYihPBVJy6iAffJn1lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0z1vHSIJlc8bJrYSdR+cYv1R8uJXc0LB862vhJkLGw=;
 b=khCrJXU/0FTbFW+ZIWg3vwb8MpfYKTXlCeYU59797b1xU3hErchKcuE0RGdWwCw2IacRibqj6SOYc2c7LiQJCf2WAe3hR5nYYQKrlg8Ldx4yMvuxlKT0mxHGGx3uqNKiR5xn4hrHjn2tuG6m49cE9OUD9amXrXNcH4Zq3bE7gwecR2baRtE6oR+bBsKH7IRwMUp5/+RSEm+ghPc2sxkILiD57y21JkZULjlyxLCb1NjfCUCIvbRd2nPQMFDPI7pLUqEHQVcCpwVpeciLqNgwnvld7CqeJjN32lb6Et+QTWIH6k4u5w7ll0Y+CgoHfWaH6d73X39kdRua5jyRV1RLag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0z1vHSIJlc8bJrYSdR+cYv1R8uJXc0LB862vhJkLGw=;
 b=G8k210uSGULJ/aoZPXKsk8AiegvuLW38jwqOL6sOpzwxfWUIecGLHiiJVJ3SLDxHrnz4OaUM6DkidL19KaguONH7pLa/zVvHJUDzUSa5nIRsZ0Dajt+qwO3r7l5rmm8vXDjdIogiLU6njg7Dut+YQfTNZLQr8GKMgF4ZvAulid8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH0PR12MB8098.namprd12.prod.outlook.com (2603:10b6:510:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 20:45:50 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%9]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 20:45:50 +0000
Message-ID: <e2e9aa5d-044e-1d20-033a-ffabc569a105@amd.com>
Date: Wed, 15 Feb 2023 15:45:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es> <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com> <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com> <Y90vrEa3/1RbaGOV@intel.com>
 <CA+hFU4wuM_xHniFyRT+jouQ3k_S3UJsRpAtd1Lgx9UVLtrqZrQ@mail.gmail.com>
 <98d1d22a-1c29-5271-1eaf-89c962eb9678@amd.com>
 <CA+hFU4y=N3bR-vXXeLP0xTe0-HJPgF_GTbKrb3A9St-z2LignQ@mail.gmail.com>
 <549abc92-e862-8a6b-d4ad-8cd6cc854591@amd.com>
 <20230215114000.41df70d5@eldfell>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230215114000.41df70d5@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::14)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH0PR12MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: a3c2005d-0498-4da1-50ac-08db0f959f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uli45RDyX5OStQ8GUfuFnhGV/v3tlPqepUpH1soMzYaTkcOz7u48YhzrDJLRLSd3XStb9PFge5dC/st2Xljjec2XHsBepFLdr0zoaTm8kotThgSRlX+tNIpsTG9zJQChvVwU5Av8yuB4kq34YMFrJ/5UbV1TxfwvIRFbR/VhTRgl3iY6eNtHMrjN6PfIf/2SKdRPBzUQI4GC2ynDcylXyXWyY910C1cKJ5TrhbAOkqyZK2Pkr+vnCns3w0evUNxImCFe6Qe2IRL2bdRhEr7vbzEO8XI5Yk6qFoLQOvZtILq1f10tO/HEAc2A5cdLar8cmdg0Gf2JKgU3Cz8a2DSpk6n4i2DaH4hY+a3KaZU1Mg9nMW+cB9z3vpFTXbiRqNTtvP5gUax2LuwJri0ghbpej7iqnVw5Ilthosvnf0hXTq8Z6GHliS2ROE+Dab85Ge3Qzvap0UQltei2FnZbZ0ntpiVoLbdd1PQbwRBEAHrjzpYXhH489o0AQ3Sxk9S0H3PjRoVUSphlP/o+vgVeMkkH9fJVJU1FWyXleM6xUXJwbXksRudewNngP2x0zceTl/ULmyAsAb6Q3Vy44w7mcFD0WIni4c1/p+dbmZbrw6i/RnHv2BZoMJEhBQwyrQbxV2a2/S3uukXLVszNJH5xymiopBDvcsEGg/LQKu1F+/FaFTuQ9HJLMNbG4vuD474I9kWyJM4m7b2TvUCBpt2yq6WO39d+w/7IodY5G4WdX8FP4aU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(451199018)(31686004)(36756003)(38100700002)(6506007)(31696002)(186003)(86362001)(2616005)(83380400001)(66574015)(53546011)(54906003)(6512007)(478600001)(6486002)(6666004)(966005)(316002)(26005)(66946007)(66476007)(8676002)(41300700001)(66556008)(4326008)(6916009)(5660300002)(2906002)(30864003)(8936002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEZPNWxJUHh0cnFnaE5XYmJIcUlEclpTcEhMdm1NQlc0ZUFUbVFlVGMrS29Y?=
 =?utf-8?B?ZXVZaCtwckcwamQ4TVBSdHEzU2NjVFpkZWpZdURqbzNWSmhlVmEwU2YyeTRB?=
 =?utf-8?B?ZUtxOE0xMjFwRjVtL3lmZlJ2MExraEMrQm5wd2c1Y2QyTGtpUUdhTlhyZUh0?=
 =?utf-8?B?U3hpclVuUU9YckxSMng0N2EvRndHc3dTbWJNbHU5SCtRbHR6L3kwbWRrWHlX?=
 =?utf-8?B?SUp4SU9peS9XVDA1bElaSVkwNUphY1NYSWR0T0VIMkhzTFdqK24xb0pRT25l?=
 =?utf-8?B?VTR0R0IwbnpDbUhTUytGcXRVbWhiWUFOYVlzWDllTkRZaU5EM1JSakVlNmNv?=
 =?utf-8?B?NW9Nci9vZ1NRNzRLS2pZbXhtTFpVZG9YZG5OMzY5eUtZK00zVHJ3UC9KT2pC?=
 =?utf-8?B?WEZsZDRxQWRKQnp1WVAvMHZIOHkyQldTME9qWG5seDdZN1c5d1NwbWFjQ28v?=
 =?utf-8?B?bG1PbGwwUEt4cExKczRwb25BalZ4ZHZFYnc0Q0FmQWdSQVJ6UmhHeTNYR2Ft?=
 =?utf-8?B?S2ovbzR1ZHR6VUxDOG91RGNEVncrWVo1K3FJTUozY3BtQUdueTJaODU3SHJF?=
 =?utf-8?B?a2pXbUduSlg4bCtOejJpOHRlL3JrejVZQkwzWHpxeUs1Z2xWWDNhcVE1VFRC?=
 =?utf-8?B?U1VLR3hVOFFPVmsxRHZzTlhtMzJMN0F6VGwrTkNkN29uSmhtd0VaRzBHM2Nm?=
 =?utf-8?B?UkIza3dHcmRtNys1cXljaGVPRUhhQmtTZE15Z041L1dzaUlDaWdySmZvQmhn?=
 =?utf-8?B?NllsZzNDMk9KaU40S0kvaHM1c0lTTjY3UTFVZW9ZeGpFNzVBOGoyRmxXNldS?=
 =?utf-8?B?aU5Ud3JJQ2g3Zkk4cExBWVRWcHRyd2RhdWdPVEVxWWY5Mk50S01JTzcrSUNw?=
 =?utf-8?B?RTEyeDhmSktwU3lSMVZRSnp2Q28wWXZUM1djemw0WFF4YWc0dWFJZFNiVCt0?=
 =?utf-8?B?U2Nua3lUbHN6L2ZmcHZ2VmdOdjRMb2IzM1dvTytBWWNzcW9oTzdjUFpQeUFX?=
 =?utf-8?B?eWhNME1CRDNmZzlmUnNHQTdiTUJEc2llNmJqZnhmSHIvY0M4QU16enJRYjcy?=
 =?utf-8?B?V1FlbWpzY0JsNkd5VUprcXRqMCtkSDRudlFlajhSUUlqWkJiZElSMmlBbkJ3?=
 =?utf-8?B?cmIxOXBsYmljSTNLWXJ0Q1ZRTGJVbndHT3NmandCSFhTNVVNV1VaOTEvcFhX?=
 =?utf-8?B?YWVjSmhYVjdCd3NmWVhHOEVlU01HSjJ2dmYyNDRVVVMyNjBtQnM2NmlpNGlW?=
 =?utf-8?B?M3dUM3BaUHZmQVZybHpvaGVWMWM1YVJ2RXlTQWlIc3VGTldtc0ZQNGFodklo?=
 =?utf-8?B?UWIvNzA3TmJjR29LZEpCbEthSm5uNStQWDMxUy96MkQzZEVlY1ljQjljMEdq?=
 =?utf-8?B?Q2FyYlhRVlJXbWI4UmJudlpRbE5rTkxTS0x5MHR3d0tsL05yWFJsTi9Kb3lY?=
 =?utf-8?B?eGx6Q1dHUk1WaUkyMkhrVzVBdWcvWW81SHJ2OC9HQk9acUFndU9XZUdPSFJZ?=
 =?utf-8?B?SDBYVllnQlRCaEttZVhDblNsQSsxM3pqRCtWclNWVkZyUk4xMVZjTzRNZW5J?=
 =?utf-8?B?SFpxY3N3UWxUZG9JMlV0c1FMbXlFMDc3VlErTHRlandBbTJJYmhwVzliNmRk?=
 =?utf-8?B?QlJ5TnR0NXAvcVNobFBjZEpBcFA2UHlHdVp5N3RhSXNHeS9pZnJlUDZzTndH?=
 =?utf-8?B?VnM3eUc3eXpTaU1CdUl3U0N1RjR1T3VkdVNzRFBod0toMldiTHFVRzUxSmJB?=
 =?utf-8?B?d1UrVUlKL1gxN29CNExwbW90SER1YkdCK2U0cEx1Z05SUXVTcWl0cGdVQ1gz?=
 =?utf-8?B?bUsweFRkQnhBNnN3UGIvdlh3SHdOaG4wTWV2Y2tPNGRzd2V5bytzY3ZzU0Qw?=
 =?utf-8?B?Z3lLMGRxZnJ3ZmJzaHY3WkVFNHBIemsvaERGT3NQVkpVakZnZzFyLzRTOG0r?=
 =?utf-8?B?S21SUFZrZUlFUHIvL2hSYUQ3dXJpLzNqNXhOR0JmZEVPaFd2QVlDN2VUaC9T?=
 =?utf-8?B?RVpzMDhmeUtaeXpHaW1uRVJ6b3c0UDdoN0hHYytOYnVFbTI4dnhoLzJ4N3E2?=
 =?utf-8?B?UEhmRUdJem1YbDg3UDR0SmZkcFgrSzI2dXRIOGZPbFVONlIrQkMyZ1Fib3BU?=
 =?utf-8?Q?m3fiTeqRYv21tRTC9f8eeyNys?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c2005d-0498-4da1-50ac-08db0f959f90
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 20:45:50.6211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XE0vb5SNl17R285hPVmw2OaDEnZoK/6CbSLI1QwO8XeBHT+zD3nOxxUZBvBSSN1jcKk38IusEPnR7O/kk+xRig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8098
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/15/23 04:40, Pekka Paalanen wrote:
> On Tue, 14 Feb 2023 15:04:52 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2/14/23 14:45, Sebastian Wick wrote:
>>> On Tue, Feb 14, 2023 at 5:57 PM Harry Wentland <harry.wentland@amd.com> wrote:  
>>>>
>>>>
>>>>
>>>> On 2/14/23 10:49, Sebastian Wick wrote:  
>>>>> On Fri, Feb 3, 2023 at 5:00 PM Ville Syrjälä
>>>>> <ville.syrjala@linux.intel.com> wrote:  
>>>>>>
>>>>>> On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote:  
>>>>>>>
>>>>>>>
>>>>>>> On 2/3/23 10:19, Ville Syrjälä wrote:  
>>>>>>>> On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote:  
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 2/3/23 07:59, Sebastian Wick wrote:  
>>>>>>>>>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrjälä
>>>>>>>>>> <ville.syrjala@linux.intel.com> wrote:  
>>>>>>>>>>>
>>>>>>>>>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:  
>>>>>>>>>>>> Userspace has no way of controlling or knowing the pixel encoding
>>>>>>>>>>>> currently, so there is no way for it to ever get the right values here.  
>>>>>>>>>>>
>>>>>>>>>>> That applies to a lot of the other values as well (they are
>>>>>>>>>>> explicitly RGB or YCC). The idea was that this property sets the
>>>>>>>>>>> infoframe/MSA/SDP value exactly, and other properties should be
>>>>>>>>>>> added to for use userspace to control the pixel encoding/colorspace
>>>>>>>>>>> conversion(if desired, or userspace just makes sure to
>>>>>>>>>>> directly feed in correct kind of data).  
>>>>>>>>>>
>>>>>>>>>> I'm all for getting userspace control over pixel encoding but even
>>>>>>>>>> then the kernel always knows which pixel encoding is selected and
>>>>>>>>>> which InfoFrame has to be sent. Is there a reason why userspace would
>>>>>>>>>> want to control the variant explicitly to the wrong value?
>>>>>>>>>>  
>>>>>>>>>
>>>>>>>>> I've asked this before but haven't seen an answer: Is there an existing
>>>>>>>>> upstream userspace project that makes use of this property (other than
>>>>>>>>> what Joshua is working on in gamescope right now)? That would help us
>>>>>>>>> understand the intent better.  
>>>>>>>>
>>>>>>>> The intent was to control the infoframe colorimetry bits,
>>>>>>>> nothing more. No idea what real userspace there was, if any.
>>>>>>>>  
>>>>>>>>>
>>>>>>>>> I don't think giving userspace explicit control over the exact infoframe
>>>>>>>>> values is the right thing to do.  
>>>>>>>>
>>>>>>>> Only userspace knows what kind of data it's stuffing into
>>>>>>>> the pixels (and/or how it configures the csc units/etc.) to
>>>>>>>> generate them.
>>>>>>>>  
>>>>>>>
>>>>>>> Yes, but userspace doesn't control or know whether we drive
>>>>>>> RGB or YCbCr on the wire. In fact, in some cases our driver
>>>>>>> needs to fallback to YCbCr420 for bandwidth reasons. There
>>>>>>> is currently no way for userspace to know that and I don't
>>>>>>> think it makes sense.  
>>>>>>
>>>>>> People want that control as well for whatever reason. We've
>>>>>> been asked to allow YCbCr 4:4:4 output many times.  
>>>>>
>>>>> I don't really think it's a question of if we want it but rather how
>>>>> we get there. Harry is completely right that if we would make the
>>>>> subsampling controllable by user space instead of the kernel handling
>>>>> it magically, user space which does not adapt to the new control won't
>>>>> be able to light up some modes which worked before.
>>>>>  
>>>>
>>>> Thanks for continuing this discussion and touching on the model of how
>>>> we get to where we want to go.
>>>>  
>>>>> This is obviously a problem and not one we can easily fix. We would
>>>>> need a new cap for user space to signal "I know that I can control
>>>>> bpc, subsampling and compression to lower the bandwidth and light up
>>>>> modes which otherwise fail". That cap would also remove all the
>>>>> properties which require kernel magic to work (that's also what I
>>>>> proposed for my KMS color pipeline API).
>>>>>
>>>>> We all want to expose more of the scanout capability and give user
>>>>> space more control but I don't think an incremental approach works
>>>>> here and we would all do better if we accept that the current API
>>>>> requires kernel magic to work and has a few implicit assumptions baked
>>>>> in.
>>>>>
>>>>> With all that being said, I think the right decision here is to
>>>>>
>>>>> 1. Ignore subsampling for now
>>>>> 2. Let the kernel select YCC or RGB on the cable
>>>>> 3. Let the kernel figure out the conversion between RGB and YCC based
>>>>> on the color space selected
>>>>> 4. Let the kernel send the correct infoframe based on the selected
>>>>> color space and cable encoding
>>>>> 5. Only expose color spaces for which the kernel can do the conversion
>>>>> and send the infoframe  
>>>>
>>>> I agree. We don't want to break or change existing behavior (that is
>>>> used by userspace) and this will get us far without breaking things.
>>>>  
>>>>> 6. Work on the new API which is hidden behind a cap
> 
> Hi,
> 
> I agree on all that, too.
> 
>>>>>  
>>>>
>>>> I assume you mean something like
>>>> https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11  
>>>
>>> Something like that, yes. The main point being a cap which removes a
>>> lot of properties and sets new expectations between user space and
>>> kernel. The actual API is not that important.
>>>   
>>>> Above you say that you don't think an incremental approach works
>>>> here. Can you elaborate?  
>>>
>>> Backwards compatibility is really hard. If we add another property to
>>> control e.g. the color range infoframe which doesn't magically convert
>>> colors, we now have to define how it interacts with the existing
>>> property. We also have to figure out how a user space which doesn't
>>> know about the new property behaves when another client has set that
>>> property. If any property which currently might change the pixel
>>> values is used, we can't expose the entire color pipeline because the
>>> kernel might have to use some element in it to achieve its magic
>>> conversion. So essentially you already have this hard device between
>>> "old" and "new" and you can't use the new stuff incrementally.
>>>   
>>
>> True. If we go toward a new color API that gives userspace explicit
>> control of the entire pipeline it is by definition incompatible with
>> a "legacy" API that touches the same HW.
>>
>>>>  From what I've seen recently I am inclined to favor an incremental
>>>> approach more. The reason is that any API, or portion thereof, is
>>>> useless unless it's enabled full stack. When it isn't it becomes
>>>> dead code quickly, or never really works because we overlooked
>>>> one thing. The colorspace debacle shows how even something as
>>>> simple as extra enum values in KMS APIs shouldn't be added unless
>>>> someone in a canonical upstream project actually uses them. I
>>>> would argue that such a canonical upstream project actually has
>>>> to be a production environment and not something like Weston.  
> 
> That's an interesting opinion about Weston.
> 
> Harry, are you perhaps assuming that Weston refuses to use experimental
> UAPIs from downstream kernels, or where does that come from?
> 

As a kernel display developer Weston looks to be an enablement vehicle for
new DRM/KMS and Wayland APIs and has little usefulness to me as an
end-user beyond that, unlike projects like sway or gamescope.

Part of it might be my naivete as I've heard mention of embedded projects
that are based on Weston but I'm not aware of these projects and who
uses them.

There is a hint of frustration here as the line-of-sight for landing
features for users is fuzzy (to me) with Weston. I don't want to put
the work on Weston down and appreciate the level of discussion and
design around compositor development (for color and otherwise) that
I've seen from you. Long-term this is definitely the right
direction.

> I think there is a lot of gray area that has not really been discussed
> for Weston's policy. One thing is certain that Weston does not want to
> go against upstream kernel policy, but that's a problem you need to
> solve anyway if you want to use downstream kernel experimental UAPI.
> 

I can appreciate it on some level but on another level there is a real
chicken and egg problem with new feature development that requires kernel
and compositor work. I can appreciate the initatives from, say wlroots
devs, to cut through this. Often implementing a solution step-by-step
with full vertical integration can teach more than lengthy discussions.
Again, maybe there is something that I'm missing here that is obvious
to you.

It's a difficult problem and I would think I'm not the only who struggles
with this.

>>>
>>> I agree that it's very easy to design something that doesn't work in
>>> the real world but weston is a real production environment. Even a new
>>> project can be a real production environment imo. The goals here are
>>> not entirely undefined: we have color transformations and we want to
>>> offload them.
>>>   
>>>> I could see us getting to a fully new color pipeline API but
>>>> the only way to do that is with a development model that supports
>>>> it. While upstream needs to be our ultimate goal, a good way
>>>> to bring in new APIs and ensure a full-stack implementation is
>>>> to develop them in a downstream production kernel, alongside
>>>> userspace that makes use of it. Once the implementation is
>>>> proven in the downstream repos it can then go upstream. This
>>>> brings new challenges, though, as things don't get wide
>>>> testing and get out of sync with upstream quickly. The
>>>> alternative is the incremental approach.  
>>>
>>> I also agree pretty much with everything here. My current idea is that
>>> we would add support for the new API in a downstream kernel for at
>>> least VKMS (one real driver probably makes sense as well) while in
>>> parallel developing a user space library for color conversions. That
>>> library might be a rewrite of libplacebo, which in its current form
>>> does all the color conversions we want to do but wasn't designed to
>>> allow for offloading. One of the developers expressed interest in
>>> rewriting the library in rust which would be a good opportunity to
>>> also take offloading into account.
>>>   
>>
>> Doesn't libplacebo hook into video players, i.e., above the Wayland
>> protocol layer? Is the idea to bring it into a Wayland compositor
>> and teach it how to talk to DRM/KMS?
>>
>> I wonder if it makes sense to somehow combine it with libliftoff for HW
>> offloading, since that library is already tackling the problem of
>> deciding whether to offload to KMS.
>>
>>> No doubt all of that will take a significant amount of effort and time
>>> but we can still get HDR working in the old model without offloading
>>> and just sRGB and PQ/Rec2020 code paths.
>>>   
>>
>> I would like to get to some form of HDR including offloading by adding
>> new per-plane LUTs or enumerated transfer functions as "legacy" 
>> properties. This would likely be much more tailored to specific 
>> use-cases than what Weston needs but would allow us to enable multi-plane
>> HDR in a more reasonable timeframe on applicable HW. These new
>> properties can educate an all-encompassing new DRM color API.
> 
> I think Weston should be fine with those legacy style KMS properties.
> The problem might be that the required per-plane operations are
> different than what KMS can express.
> 
> I have designed the Weston internals to carry the highest level
> information about an operational element like a curve set to allow
> everything from enumerated fixed curves and down to an arbitrary LUT,
> including falling back to lower level description when necessary. E.g.
> if there is no enumerated curve for something and it doesn't match
> parameterised curve either, Weston can always fall back to a LUT if
> precision is acceptable.
> 
> There will not be inference to go from LUT to a higher level
> description, so all that depends on applications using the highest
> level description they can, which is what we are designing into
> color-representation and color-management.
> 
> That does pose a challenge for Weston's color pipeline optimiser, but I
> do very much want it to get there. Converting everything into a LUT is
> losing precision and performance.
> 

With Weston and the new Wayland protocols you're looking at solving all
color-and-HDR-related use-cases, which is definitely needed at that
level. For HW composition the use-cases I am interested in are far
narrower.

> However.
> 
> I am not in any hurry to make use of KMS color pipeline off-loading
> features in Weston. I am approaching the API problem from the
> application direction: what do applications and compositors need from
> the color pipeline, and not how to expose everything of all existing
> hardware. This does mean that it will take a long time before Weston is
> ready to provide guidance on what an off-loading library API should
> look like.
> 
> That's my opinion: I need to know what I want before I start asking for
> it. Maybe someone who has a strong background in color science and
> experience with video systems knows what the answer will be, but I
> don't.
> 
> Still, I do need to be able to drive a monitor in known configuration
> and correctly, which is why the "Colorspace" property discussion is
> relevant to me right now.
> 

Makes sense and I fully agree that the first (and immediately important)
step is driving a monitor in a know configuration and correctly.

Harry

> 
> Thanks,
> pq
> 
>>
>>>> We should look at this from a use-case angle, similar to what
>>>> the gamescope guys are doing. Small steps, like:
>>>> 1) Add HDR10 output (PQ, BT.2020) to the display
>>>> 2) Add ability to do sRGB linear blending
>>>> 3) Add ability to do sRGB and PQ linear blending
>>>> 4) Post-blending 3D LUT
>>>> 5) Pre-blending 3D LUT  
>>>
>>> Sure, having a target in sight is a good idea.
>>>   
>>>> At each stage the whole stack needs to work together in production.
>>>>
>>>> If we go to a new color pipeline programming model it might
>>>> make sense to enable this as an "experimental" API that is
>>>> under development. I don't know if we've ever done that in
>>>> DRM/KMS. One way to do this might be with a new CONFIG option
>>>> that only exposes the new color pipeline API when enabled and
>>>> defaults to off, alongside a client cap for clients that
>>>> are advertising a desire to use the (experimental) API.  
>>>
>>> Yeah, that's a bit tricky. I also don't know how upstream would like
>>> this approach. Not even sure who to talk to.
>>>   
>>
>> Agreed, I'm also not sure whether this would fly. airlied or danvet
>> might have an opinion.
>>
>> This thought was inspired by "Blink Intents", which is a mechanism
>> how new full-stack features land in the Chromium browsers:
>> https://www.youtube.com/watch?v=9cvzZ5J_DTg
>>
>> Harry
>>
>>>> If we have that we could then look at porting all existing
>>>> use-cases over and verifying them (including IGT tests) before
>>>> moving on to HDR and wide-gamut use-cases. It's a large
>>>> undertaking and while I'm not opposed to it I don't know
>>>> if there are enough people willing to invest a large amount
>>>> of effort to make this happen.
>>>>
>>>> Harry
>>>>  
>>>>>> The automagic 4:2:0 fallback I think is rather fundementally
>>>>>> incompatible with fancy color management. How would we even
>>>>>> know whether to use eg. BT.2020 vs. BT.709 matrix? In i915
>>>>>> that stuff is just always BT.709 limited range, no questions
>>>>>> asked.
>>>>>>
>>>>>> So I think if userspace wants real color management it's
>>>>>> going to have to set up the whole pipeline. And for that
>>>>>> we need at least one new property to control the RGB->YCbCr
>>>>>> conversion (or to explicitly avoid it).
>>>>>>
>>>>>> And given that the proposed patch just swept all the
>>>>>> non-BT.2020 issues under the rug makes me think no
>>>>>> one has actually come up with any kind of consistent
>>>>>> plan for anything else really.
>>>>>>  
>>>>>>>
>>>>>>> Userspace needs full control of framebuffer pixel formats,
>>>>>>> as well as control over DEGAMMA, GAMMA, CTM color operations.
>>>>>>> It also needs to be able to select whether to drive the panel
>>>>>>> as sRGB or BT.2020/PQ but it doesn't make sense for it to
>>>>>>> control the pixel encoding on the wire (RGB vs YCbCr).
>>>>>>>  
>>>>>>>> I really don't want a repeat of the disaster of the
>>>>>>>> 'Broadcast RGB' which has coupled together the infoframe
>>>>>>>> and automagic conversion stuff. And I think this one would
>>>>>>>> be about 100x worse given this property has something
>>>>>>>> to do with actual colorspaces as well.
>>>>>>>>  
>>>>>>>
>>>>>>> I'm unaware of this disaster. Could you elaborate?  
>>>>>>
>>>>>> The property now controls both the infoframe stuff (and
>>>>>> whatever super vague stuff DP has for it in MSA) and
>>>>>> full->limited range compression in the display pipeline.
>>>>>> And as a result  there is no way to eg. allow already
>>>>>> limited range input, which is what some people wanted.
>>>>>>
>>>>>> And naturally it's all made a lot more terrible by all
>>>>>> the displays that fail to implement the spec correctly,
>>>>>> but that's another topic.
>>>>>>
>>>>>> --
>>>>>> Ville Syrjälä
>>>>>> Intel
>>>>>>  
>>>>>  
>>>>  
>>>   
> 

