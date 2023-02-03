Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B38F689E1B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 16:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315C010E06C;
	Fri,  3 Feb 2023 15:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222C410E06C;
 Fri,  3 Feb 2023 15:24:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfTkD0Jj7nsaKKtmedGlAKIp6szlf/290yrcDkcyQBwInsbPnh8fPuS/90J8MAprUwuNAAomjRhxRw41Bgm2ydkkjzQzeX7glBvV+s6y4IpX0pEMD+PBGevk9AbRCETVVvJIeQonHilLQkbMW981ih1OjFswxmjfj+6J74VSDySpDfmT/if5MUOAcMOiNCuqdHTMMvZXpzc8s9sQn5Howu3ewke3fo0WL9BM+q/0DRIu9uZsk5OsVisTAeX+omnfUgqCmUMrxXoDAHninCU8c+9nuKO6q++4CEyFhGak0JkEv1DDqPopXGN/nuya63f1xWMgxEaOtHQN6XzJR3JuFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ky38Etflykw0yXk2vgcVMh1ZtKp5fpB7tZUNbhEYAMo=;
 b=nCk7ihJwVpgvuRYfpOvFNlV8rJttx26j3UndZfEQLIF8vj9H6AIisIqBfMa7tsiluFbsso1fuVyP5iJdhNNILgxCh2Lb7im29vtGTkIGDKJSdxcA+KYGMhuzO3PA5GUJJfZDJ2wBkL9GdI63EacmcLGMvQN85gkfCsR5Iy226PWbsuNJqVBHHROMqICNDRzQGpVpnGbH4FmejRa3QRPdlWkMia4uu9ofWy/mNhPwchUbijz7eiYM0rGhwNj6yzYKAIcxwuENJHJk9/F5stQxNWsLeSNpEQUfwOp6YtBc8AH3SQJmFjThbxUh/PwUmZCi3ea8R1/e2qnTQu2UirTlRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ky38Etflykw0yXk2vgcVMh1ZtKp5fpB7tZUNbhEYAMo=;
 b=gHa2Gr6zHsjAKIdlC91Dzx6d+4TwB6FyLHiZJPpA92j5anJ9aSoFUglDT/rLFYDNX9/k+dN+nKshsoGlgda5RZ07i+qrI/VJ7w1fCpcUqeRMmDh+KGsi0f7hx6aY7ETOFyZ5XhSD/fMvNRS/XkZFUxWaPmlX8DCb+fuB7eb2kKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) by
 SA1PR12MB7126.namprd12.prod.outlook.com (2603:10b6:806:2b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Fri, 3 Feb
 2023 15:24:55 +0000
Received: from DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::b63d:60d7:923a:4ee9]) by DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::b63d:60d7:923a:4ee9%5]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 15:24:54 +0000
Message-ID: <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com>
Date: Fri, 3 Feb 2023 10:24:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es> <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com> <Y90l+DY0rSaMvN1U@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Y90l+DY0rSaMvN1U@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0096.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::35) To DM8PR12MB5431.namprd12.prod.outlook.com
 (2603:10b6:8:34::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5431:EE_|SA1PR12MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: c0fb2662-cbe8-43cf-7776-08db05facd4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7pZhnafuxiOtBfIRshB3lTBv1N1lO7HPLPjqKO6QbbftxyC+EnYZJeUHaDHZBdSQyHgJOHfBUB42nFrVHcekIWS29ZGDlBBBfgYBayj6t7kXGl66b2iQkCLdxwAh5+yHN5dAkaRyXezsNEmEb95TbeCSnPPqETYbTVV1wk9TiX09MJf2cUqlMzYl7EzEbh1NRvTrnp+uQxsvCtMFrHzUmNAUPIsDBzhVkYWys/U7QZ78BX/okdMauOP7pBFa0GqiFcGAJ+MuNU3X++xmKsIL/4wU4Ws++/i8o3HGnRDGMbFtaLyefGdbZs/aPkSLpZww3Z7lGaa191g4Tu0AwVijzW+U9jpuvEZm0H/eHpQCMPfYrK0mHWsftZJXAVWG2TGJD+nXXpZREXoOfEjfSS6LjZU2gjTio1ZvtBAMF61vsFYvgKOKnFWQQS/XriMSSvDTKEIQNi4juTwbrCHQSjhxdV4ptdX/YrWdL+6GJ4uHHoP0n4AKbOd5seIaXvGWKLkGzplLkG/GiQCrBibbOevdFQkiKHlt6KHuAEHATXLmSCXwM+jGOxgrBvCD2u6T8Gen82sT9ywMwDVZieO54U+g6RDWs4faGOjSSk4nD1785pkXFm4ktLEFy2RbfFxBdpAH1hb3sh3ShzkDLlWIdIiFYkQbnzU6SZZ3plpxHDQz1cddmg75xPDbOsrp/9YdOHhtBdLU+ZZrD2cSIW0/m5zujjhAElrL26WEk+ukEJGUve4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5431.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199018)(2906002)(36756003)(44832011)(6512007)(26005)(186003)(6506007)(53546011)(2616005)(66556008)(31696002)(4326008)(66476007)(6916009)(66946007)(316002)(8676002)(86362001)(5660300002)(54906003)(478600001)(41300700001)(8936002)(38100700002)(6486002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blBXaEFTOEtVbmFMclNHRVlsTDczTjBaME1SRExWdm5nb2JHczI5QnBQZjM0?=
 =?utf-8?B?aEY0VFBKV2h4SzlrWHV5eXNvdVJFL0hEWEhmaW1sbkFBeXQvbEJiV1BqZ05o?=
 =?utf-8?B?VEUvcmxDMkZKL0hJclIreDZZYXczMExGRVhJM2lZUnNsM2ZMOHYyS1B0WXc1?=
 =?utf-8?B?RE9Vb2lsOTVqVzB5NFNHQVRJNlFONXQ4SFk3bVM4Qjc1MFNuSkJFdWxPei96?=
 =?utf-8?B?Qy9OMGtibFoyT0xGRlBWbTYvYUwvZkNjZ2l1Q2xzS3h4bFN4MlFlcyt0blJC?=
 =?utf-8?B?N01SNng2YmVHdjN2WUN0V1Njb2tZcko3ZWsxRDVGMERUWG1rRGdzOFZJeCtG?=
 =?utf-8?B?eWJmVnJKaUZzemxpVG9VbU5MVWpwZGgrV2lmeW1PVThjc2pKZGw2dkNxazNH?=
 =?utf-8?B?QXB3V05IU0JYUVk3Y0YvQlpSeHY4dW12elRuSGhTdXJUNDlTcTZVNk55dXEz?=
 =?utf-8?B?ZldXN1dYODVHbzZLMVZ3YVRIK24xWExHNS80WUxERWR1MENHNHZ4ejVXdDZH?=
 =?utf-8?B?QmE5OUtwOEFValhLUHNaM1FXMm9wQkpIb2hadG10UmtZL0REbExyRnBHY3NU?=
 =?utf-8?B?bm1kckdKdTNxbnBpcllMNFdQQWpjS2VjSkhQZkZIcytVSjJXZXFjN1kzRWo4?=
 =?utf-8?B?UDJhbHdTaXlicC9zejROMEdEUXBoZlpYRS9rdllma01YaFY2dUJKWGQwSmx0?=
 =?utf-8?B?LzQzRlFwY05oUG9RdWQySktQcC8vNGVzd2ZhcXRwdkNHVXcwTnp0YU4vdW1B?=
 =?utf-8?B?cG9ta3dIb3ZxQk5VcXFKTDAxYW1aWDJ0V09tL01RWlIxVFJXdUN1dS90UkpB?=
 =?utf-8?B?eENySGpzUXgyNTl3US9zNk1EVkcvWC92ZzZEQkQ0cENVdGxZcjNRUmUrb2Nr?=
 =?utf-8?B?UGNRVjZIUHlhNUxsWG02TVZkOTNBYjRiTDM3empVN0w3UHFSOTJuUTd4aHkv?=
 =?utf-8?B?MDhwZDNrSFZSOU1HM2ExeVpFTEFjLzV3cXc3eHBtZnFtYzVwQis1aWlUZHdY?=
 =?utf-8?B?Um9mOVFYcVkvRU1WajJNbmdBZ2FJSEZqa1ZGWTVsSzUyQk9xY3FyMiswU2l4?=
 =?utf-8?B?eXkrUU5BR0lEZlpMeWdkMDI3K2h5dUpNR251OTFjK3pleWhzdlQ4TVhMZkYw?=
 =?utf-8?B?SUVpOVA4cXFVODlwSFVUZHU0cStXdndUL0k4eU05V2p1WVNlMmdBSUFJYXNk?=
 =?utf-8?B?eVQ0TzRzZVg2YkRaZVZ5WWRtOERRWkNPcDJRTHl6NTk2VklQMkR3Q0k4cUNr?=
 =?utf-8?B?Y0xLb29BWGlpSmg3OTJ6b3UwNE1RTlUwYWUxWjZ0cGpndlArejFSaVE1VFNM?=
 =?utf-8?B?UjZGbHdaMVR6Um1TOVFaaVJwSUY2UlRwV1ZTSFZlZEpWZWlZb1d0WUVQYU5p?=
 =?utf-8?B?blEzcitwdFdHeEdFMFBPQnVXSDNyWUFQakJ4aHNEZTJPaU5CalcxSHJWLzlF?=
 =?utf-8?B?MDF2cFRVZXVVc2E3aWdZMXhra0JhakFtMzdrQTJseUwwTGIweU8wOTAyZnFi?=
 =?utf-8?B?U1Fib2pCVCtUcDA5a2twMmFQNUxJRmx3Tzl3ZVZLemxsT1VBVm0rTHNzQXRw?=
 =?utf-8?B?MUkwTXVFcW51ZTl3dGZRUWlTMXRhcm1DSm04M0NQY2w2MFJRTnNVYnJjR2xs?=
 =?utf-8?B?OHVkNE50RmpiSEg4OFNRK21jemRqMUY1UEVNMEdVN3Zha1lQVGlyZWsxNzBK?=
 =?utf-8?B?UUh3RUNNNHFWbytMeDhTRUNCUGpjTE9VOFU1VWJlclJjalhmcDI3ZkZvUUtV?=
 =?utf-8?B?KzZMcWpoU1M1NTFiTXY0d1F4aklOcVk0WnJSRjNNWkZEMVExYWRDZ3pSK1pp?=
 =?utf-8?B?MDk1RzlZY2JVQ250SWtKYkZHL2crL1J3bDV3dnpFMkpnYnVUK0plWk1YQXha?=
 =?utf-8?B?U0lKMUZyakx4cGF5S3k5eUNPNEhCakdTOTZyckNHVXh3dWVDdG1UVkdnd016?=
 =?utf-8?B?d0FxSUlUakY0K0lVeDNxN2ttZU5XY1BiNzd2Z1o0b3kvanlEOVRtenhIQlpS?=
 =?utf-8?B?RWxGc2FBQ2VaMDVqSkxPRWZVbVJQK0twVFJHdG00S1krcllGdFUrVlRyZk9G?=
 =?utf-8?B?UzVSb21YQ2ZPT2RaZDhXbjFrWkg1MENSZGlCbXFxajVIRWRhenNDK3hJNjZ6?=
 =?utf-8?Q?Y0azed5TbPcXbECQ8Bwz4MHDN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0fb2662-cbe8-43cf-7776-08db05facd4c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 15:24:54.8610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8h+OVQBKxw1lKoJP7LN4qPzhwAULKGb/fDJxR6TqSyembgLIJqZpRldMsRW9Upy9Qutc63Hx7KVtK6HT9D6Qog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7126
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
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 amd-gfx@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/3/23 10:19, Ville Syrjälä wrote:
> On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote:
>>
>>
>> On 2/3/23 07:59, Sebastian Wick wrote:
>>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrjälä
>>> <ville.syrjala@linux.intel.com> wrote:
>>>>
>>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
>>>>> Userspace has no way of controlling or knowing the pixel encoding
>>>>> currently, so there is no way for it to ever get the right values here.
>>>>
>>>> That applies to a lot of the other values as well (they are
>>>> explicitly RGB or YCC). The idea was that this property sets the
>>>> infoframe/MSA/SDP value exactly, and other properties should be
>>>> added to for use userspace to control the pixel encoding/colorspace
>>>> conversion(if desired, or userspace just makes sure to
>>>> directly feed in correct kind of data).
>>>
>>> I'm all for getting userspace control over pixel encoding but even
>>> then the kernel always knows which pixel encoding is selected and
>>> which InfoFrame has to be sent. Is there a reason why userspace would
>>> want to control the variant explicitly to the wrong value?
>>>
>>
>> I've asked this before but haven't seen an answer: Is there an existing
>> upstream userspace project that makes use of this property (other than
>> what Joshua is working on in gamescope right now)? That would help us
>> understand the intent better.
> 
> The intent was to control the infoframe colorimetry bits,
> nothing more. No idea what real userspace there was, if any.
> 
>>
>> I don't think giving userspace explicit control over the exact infoframe
>> values is the right thing to do.
> 
> Only userspace knows what kind of data it's stuffing into
> the pixels (and/or how it configures the csc units/etc.) to
> generate them.
> 

Yes, but userspace doesn't control or know whether we drive
RGB or YCbCr on the wire. In fact, in some cases our driver
needs to fallback to YCbCr420 for bandwidth reasons. There
is currently no way for userspace to know that and I don't
think it makes sense.

Userspace needs full control of framebuffer pixel formats,
as well as control over DEGAMMA, GAMMA, CTM color operations.
It also needs to be able to select whether to drive the panel
as sRGB or BT.2020/PQ but it doesn't make sense for it to
control the pixel encoding on the wire (RGB vs YCbCr).

> I really don't want a repeat of the disaster of the
> 'Broadcast RGB' which has coupled together the infoframe 
> and automagic conversion stuff. And I think this one would
> be about 100x worse given this property has something
> to do with actual colorspaces as well.
>  

I'm unaware of this disaster. Could you elaborate?

Harry
