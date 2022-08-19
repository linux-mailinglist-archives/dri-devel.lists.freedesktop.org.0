Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 419C4599EBF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 17:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377FA10EB43;
	Fri, 19 Aug 2022 15:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54DF10EB43
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 15:44:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/f1J7mmhOt1gdvW9otBoB77dGmLxE+vpaAwXhxXAwWOzKFMt/mpXaSeoIzal7hpo59dSPLcl9VdkkH0VYxTbbmtWg76yQO3ZMk2/Ea5/7Y5UG0Z8cem5eEvELU6wgpR5TV9LJ+DDNHlY/TB5Z/aNz1Bkr33sJCsQuk0xQBeUyHhto+3en7lZIu4HUIEVKpJVveqIZpqYkYNcCWIAaeyim68A871EMXK+EIUTcuYK+xZALC8mqqWqMrDxpxP+JoZBc3Tt/Wm5hcDdd24YIMl0mFDIpfa9wE64W6R33d5SGAsNcOHdrUVPgKQc8QwgHfHyISxUCj5tUUB8ru5QRjY9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atJzWRywLxptaEdQSpxn+mZzRZChjcN3GhSDRRhcacQ=;
 b=IFmheScl6FXXoeDhvSE6DggFV6iwDcqJapueBF8UQqTujLXwq00D7p5N/Ek6VgV5glzYvFpCFkI78+Pn/pgCmf8pUuYB2kWHfB/C9dNPas8DJbvFLCGKiGHQYitVNO1q3hm3ObL2hLNsv4NFScHWTXogfBtzY3TPE8X13uO1U6aTtoq/sJM6u/BH46/rJ1C7kgbsv18RD4+Ebj9k6gzuFfn4Mnj6T9GC0xwfhWDkzS3K2Z6CmlLcmu9ik637pnRzBP/+v/sWyw3f0YZosM0GNYLnvd0Joq2qArfKsBx0M4drlYph/gO1BndF0UQeHq/hWFAc9F1RpFoJSgtoSeVgsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atJzWRywLxptaEdQSpxn+mZzRZChjcN3GhSDRRhcacQ=;
 b=Hq1X2O81Fsd7IUw3xjDXwG/UL/9Neg6OawgwuH2N2BA26ydv9Li4+eTZ8kRsFpzpBfB24fb+YKXwP4uo62KcqAhTVJLy5esvRCec7lqe5ypp22HJ2xvpoSD1yTYSWa6iKsusQ62HbggsYdoOxk3eGrP2PXE805wrLUNKeTF5DhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by SJ0PR03MB5695.namprd03.prod.outlook.com (2603:10b6:a03:2d3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 15:44:45 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c%3]) with mapi id 15.20.5546.016; Fri, 19 Aug 2022
 15:44:44 +0000
Message-ID: <50dd9b7a-8f48-0799-57f6-048d20de8dcc@synaptics.com>
Date: Fri, 19 Aug 2022 23:44:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] [WIP]: media: Add Synaptics compressed tiled format
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20220808162750.828001-1-randy.li@synaptics.com>
 <20220808162750.828001-3-randy.li@synaptics.com>
 <CAAFQd5AKjpJ+fPAeCqdNnJbS4R7SdaHkfyW4qG1xXr-sE801pQ@mail.gmail.com>
 <13d37c15-79f3-4e16-8cf4-fc37846f4a04@synaptics.com>
 <Yv7HnHE7bLmgq5D0@pendragon.ideasonboard.com>
 <6da7faf329128312f0862f555d1a855437ae99f3.camel@ndufresne.ca>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <6da7faf329128312f0862f555d1a855437ae99f3.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a817180-cf56-4a3c-b8f7-08da81f9bd13
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5695:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vuUox6D0wejFPOKSqC6litEYqba7vlznPknKXBSfJy+WZK8M15nLU7qvQxOSmzB7x8op/JOf1Wup8iEmLeCxMt78cY5pXXcPp9DcFWqnkufti5GVUtf6XF/uup/QfRKUTpeMDAvw17nAsTpkD8mrXFOSlZDGsZHnucaQIjtRZdPDpKgmbrzDMGXo6B6e09/iXBp+JeVsF5oz0TZ0Q6xb2vpRZaSxUGTdFSzlUr2BFBw4XJ3XWEESFmrt1iB5S4fLTM8BJv7nQwWgIPP2psColbYXTOhOckCWuO455QGLzxXdcaFz4DO4RZUdRkBIaoJ2uJrvC/GIjRZ5an8OLB3dusg955RMfgy7llyTGhdNM4jiYmVLb4wLpptuwC1ZDn5hoAkwfHeyxfjNOcLvAfbThvFjFCccwkQlZUtC0IXrE7z5MoRgVCwLztzxXcXOUdr5VUr2CmM/VGpG0/yzPGFpsXC7R1284QQMKh19EXUwRfLSPIYm4pH0PF4Z5dG9AHPihOVi3taUm2XOyqYvKZ5e+Wo5l1xusbXVhBCkZk6VoECQuTjye6IAnRalgLWeHa7ukgLIg9aPxrtjd19Gzb9lFJ2ed/BGJRjio+JsyGA6SxE4Gk5Q8I1buBU+f+cXL0gbBIznPB+1clk8dV/Dk1OUYz5KEuQGEngF8TqDAec28HxUdN3jLBjMvXuKSZgQe1VXV7PZWM/LXFQQlgEG4BVdgA4MyReFJvyiTXYSFD7W/nXVWPl0wGH3RP7YNxGBosaWXNuoYuCFPHpa55NCvwo4fPaForEWUvcYTRvFiB6KKMZVXANo20PJcDsnq0T/7hudZmLrhOIZlBI1pad1gv14ad0PmE9c8w6+kUyrr6ZYxv8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(376002)(366004)(346002)(39860400002)(36756003)(2906002)(41300700001)(8676002)(66476007)(4326008)(31686004)(54906003)(478600001)(6666004)(6512007)(966005)(6486002)(52116002)(53546011)(6916009)(26005)(316002)(6506007)(66574015)(186003)(2616005)(38100700002)(83380400001)(66556008)(8936002)(5660300002)(7416002)(31696002)(66946007)(38350700002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkZEZ3dMdTIvVzAySk4wSS9qM1JBckI0eWpVYlNHUzN0NW1YUXVkTFhSVExk?=
 =?utf-8?B?WEl3RnJuTWNxaHNaZk9BZTZBM1JlTHduaUZ1U3hJVzExVnZwK0ZmMGpaUUF3?=
 =?utf-8?B?ekxSQUxiOXMvcERLdU1hYVU4TU5IaUxmdDJSczZYQ1FDZmVXNTNpYnRwVVI4?=
 =?utf-8?B?SlZFZ3ZqRTcrK2xPVEJndjJmR1lsemF3MW1peEtYb0dqbDdYY01JeGtlclFv?=
 =?utf-8?B?OWN5ek9rNUwvakFYdVJoNTJmVzRQb2lVSGlXK3pHZWxyUjIxZWVQQTZXekRa?=
 =?utf-8?B?RkdSQlA5Qm9jeEIreWxWc1h3THVWKzRoaDFHUCtpVWhRSEVIRVRLVW1LVnl1?=
 =?utf-8?B?NUlvVlJwcFgwR2w5ZWV2aGZ6SmZqVVpBQjdsalV3VDJzejg0anRITmg4SEls?=
 =?utf-8?B?RkxRMXBzeXdiMVNvdTQ0bU9JUWxYbWhVbnVBaVdOejhYZDRoYXgrTmNESzMr?=
 =?utf-8?B?UU5hdE12RzBTcGVaZzZRMVV1a2R1cGFvaEFRYm0zSmU3cEJ6MFgrWFZ3TzJq?=
 =?utf-8?B?aWhkYnNONXBpWlEwQ0d1L1Jha1hZUkZUUEtzVGUzaGVSeFBFZThBRGZrMUR5?=
 =?utf-8?B?dThaUVRsNk5nbkhQZDNITEZrL3ViaUN6QUozUUFzenlwVWtmVUdKSmdLczlQ?=
 =?utf-8?B?WWw3TmN6dHJlRnVvNW8zeHdLdzhaUUsxeTc0VzFSdWdUeWpPbDdGV05VQWg0?=
 =?utf-8?B?SWZDWWo0LzAwTm5xUnk3ZkoxQlorOVJFanBRVFIra2tWZ1U2TVhUVmczMVdJ?=
 =?utf-8?B?Q25KSHl0cnY2YzZQV2hQVmVlV292YUtlZjhoM0cyMkozQTZoSmtPdW10RzMz?=
 =?utf-8?B?b05FaGhjYnQxaUV3YXhKVHBJTDBjbUJUN2tJdG5Nb0VmSlpYYnIxZUdkbEx4?=
 =?utf-8?B?RmVEWlovSmxzME42OVREdDIzTm9oeFBaUC9ablFSbVd5QTdmVlhzZ3hHbmpS?=
 =?utf-8?B?SVVqU0hFU0hXVUx5QjVkY0hiUnB1WDcvRUFWSzBaVmxSc2NHNkdqR0Uyc2xF?=
 =?utf-8?B?dkFpNlZqM2JxTmphTFVHR1ZQMC9CVU9mTEVzR3hJczR3UVBGeVNDVXM2ZGlq?=
 =?utf-8?B?THV1dGkvTDE3YlJ5enlpbGRIaUpuTVhMeTBPYkJPS2t6b2Evb09OblcrR3or?=
 =?utf-8?B?VVVZc05OaDBSYmpBalYzaWIzaVBYVktKZkpHREtPNVA4M2ZnV0MzZUVxNUFk?=
 =?utf-8?B?NE13cEp3ajJDRTlXNnV3TlJHSzFkajkwd3pBY0MrOExTaWppTWNac25RckZM?=
 =?utf-8?B?Sk8vcDBRMVViRHdzaGUwUVZGNWR0MVI3MkVvL1RMSHJJU09zVTRxMzd0bkp6?=
 =?utf-8?B?OXFORWdHRlVyZDhaeXZwUGx4clozZ2c3Z0tiRTQwNk5JK21rbkozWDBNbVAz?=
 =?utf-8?B?VXZjZHNIbWNVbUZmaUhqbFNnWVM3WkMvUGVzWUlaVmp5alFrYndRZHNnMUdM?=
 =?utf-8?B?R1pyb0RBeWZPMC9CS2FwU0QzVWF6bS9sU0FWZWcrVzdWeHljejhuZkZOdFRQ?=
 =?utf-8?B?eENmMnZ5ck9POFo5czBpZFJ4SmNYNkR4VzliSE55NXM5SDEyTVRHRWMxM1Yw?=
 =?utf-8?B?ZGJ6NXhuMUNqa00zMHdpYmJHQ0g1Qk9qa3dQNTBoMlNXSng0UkNPVUJYcDBv?=
 =?utf-8?B?dGdJbHczQmdONFNmcjNha1QxNFhRYTJjV1dqd0xHVEFURnI2VnhRWWxZRUUz?=
 =?utf-8?B?QWlLUXArWWRiMExmc1RiZ1BtYnBldk1OMlM0aGUzYmpFdFhidVptR3NMblVW?=
 =?utf-8?B?ZE5WZ3VPT3M3YlJaOTRuYzJUZUtiVWtBOFVGc1ZCQjViZzY0aTNUV3g0anpH?=
 =?utf-8?B?SmZlNk9DYlpDUXNsc0NGUXg1QUlBOHJaVFYvYWtGVUZ3dm1EcUlRNmU1S0px?=
 =?utf-8?B?Zi9zM3JOV0RIU001LzNjNGU2bWg2cDNzSmxqSjYvVm5GZ0FYMURwM1h5dEh4?=
 =?utf-8?B?MjRSV3BuMjhnNVR3Mk5KNTRodmFpNjdXSDExTjFLTDFXR0J4dW5hMDArbXNI?=
 =?utf-8?B?YVRmS0U5SlpCUGEyNmhPRUQxUWxXT0NKT3Nnc2k0S1Y3clBNSzQ0RTdIODNn?=
 =?utf-8?B?cUhBeWZscVdNdFF4ejQrY3NSdk55aXZKcEdVM1ZBdVF6MmtnQkVCa0FOb01s?=
 =?utf-8?Q?dtBXAIAVs7vSgMrtSiyedy8qP?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a817180-cf56-4a3c-b8f7-08da81f9bd13
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 15:44:44.7091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GqGJ3SLLOdI3J+CTnpyLelKYH2K8DVOqgEoTg9suv90lw4LF/WagoT9EUdMIaRqaUOSc0fD6/cUoaGLEgSVgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5695
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
Cc: linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, ribalda@chromium.org,
 linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
 jszhang@kernel.org, ezequiel@vanguardiasur.com.ar
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/19/22 23:28, Nicolas Dufresne wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Le vendredi 19 août 2022 à 02:13 +0300, Laurent Pinchart a écrit :
>> On Thu, Aug 18, 2022 at 02:33:42PM +0800, Hsia-Jun Li wrote:
>>> On 8/18/22 14:06, Tomasz Figa wrote:
>>>> On Tue, Aug 9, 2022 at 1:28 AM Hsia-Jun Li <randy.li@synaptics.com> wrote:
>>>>>
>>>>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>>>>>
>>>>> The most of detail has been written in the drm.
>>
>> This patch still needs a description of the format, which should go to
>> Documentation/userspace-api/media/v4l/.
>>
>>>>> Please notice that the tiled formats here request
>>>>> one more plane for storing the motion vector metadata.
>>>>> This buffer won't be compressed, so you can't append
>>>>> it to luma or chroma plane.
>>>>
>>>> Does the motion vector buffer need to be exposed to userspace? Is the
>>>> decoder stateless (requires userspace to specify the reference frames)
>>>> or stateful (manages the entire decoding process internally)?
>>>
>>> No, users don't need to access them at all. Just they need a different
>>> dma-heap.
>>>
>>> You would only get the stateful version of both encoder and decoder.
>>
>> Shouldn't the motion vectors be stored in a separate V4L2 buffer,
>> submitted through a different queue then ?
> 
> Imho, I believe these should be invisible to users and pooled separately to
> reduce the overhead. The number of reference is usually lower then the number of
> allocated display buffers.
> 
You can't. The motion vector buffer can't share with the luma and chroma 
data planes, nor the data plane for the compression meta data.

You could consider this as a security requirement(the memory region for 
the MV could only be accessed by the decoder) or hardware limitation.

It is also not very easy to manage such a large buffer that would change 
when the resolution changed.
>>
>>>>> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
>>>>> ---
>>>>>    drivers/media/v4l2-core/v4l2-common.c | 1 +
>>>>>    drivers/media/v4l2-core/v4l2-ioctl.c  | 2 ++
>>>>>    include/uapi/linux/videodev2.h        | 2 ++
>>>>>    3 files changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>>>>> index e0fbe6ba4b6c..f645278b3055 100644
>>>>> --- a/drivers/media/v4l2-core/v4l2-common.c
>>>>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>>>>> @@ -314,6 +314,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>>>>>                   { .format = V4L2_PIX_FMT_SGBRG12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>>>>                   { .format = V4L2_PIX_FMT_SGRBG12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>>>>                   { .format = V4L2_PIX_FMT_SRGGB12,       .pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>>>> +               { .format = V4L2_PIX_FMT_NV12M_V4H1C, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 5, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2, .block_w = { 128, 128 }, .block_h = { 128, 128 } },
>>>>>           };
>>>>>           unsigned int i;
>>>>>
>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> index e6fd355a2e92..8f65964aff08 100644
>>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> @@ -1497,6 +1497,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>>>>                   case V4L2_PIX_FMT_MT21C:        descr = "Mediatek Compressed Format"; break;
>>>>>                   case V4L2_PIX_FMT_QC08C:        descr = "QCOM Compressed 8-bit Format"; break;
>>>>>                   case V4L2_PIX_FMT_QC10C:        descr = "QCOM Compressed 10-bit Format"; break;
>>>>> +               case V4L2_PIX_FMT_NV12M_V4H1C:  descr = "Synaptics Compressed 8-bit tiled Format";break;
>>>>> +               case V4L2_PIX_FMT_NV12M_10_V4H3P8C:     descr = "Synaptics Compressed 10-bit tiled Format";break;
>>>>>                   default:
>>>>>                           if (fmt->description[0])
>>>>>                                   return;
>>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>>> index 01e630f2ec78..7e928cb69e7c 100644
>>>>> --- a/include/uapi/linux/videodev2.h
>>>>> +++ b/include/uapi/linux/videodev2.h
>>>>> @@ -661,6 +661,8 @@ struct v4l2_pix_format {
>>>>>    #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
>>>>>    #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
>>>>>    #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
>>>>> +#define V4L2_PIX_FMT_NV12M_V4H1C v4l2_fourcc('S', 'Y', '1', '2')   /* 12  Y/CbCr 4:2:0 tiles */
>>>>> +#define V4L2_PIX_FMT_NV12M_10_V4H3P8C v4l2_fourcc('S', 'Y', '1', '0')   /* 12  Y/CbCr 4:2:0 10-bits tiles */
>>>>>
>>>>>    /* Bayer formats - see https://urldefense.proofpoint.com/v2/url?u=http-3A__www.siliconimaging.com_RGB-2520Bayer.htm&d=DwIFaQ&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=lkQiuhx0yMAYHGcW-0WaHlF3e2etMHsu-FoNIBdZILGH6FPigwSAmel2vAdcVLkp&s=JKsBzpb_3u9xv52MaMuT4U3T1pPqcObYkpHDBxvcx_4&e=   */
>>>>>    #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
>>
> 

-- 
Hsia-Jun(Randy) Li
