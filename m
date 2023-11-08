Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB737E5B2B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC0B10E175;
	Wed,  8 Nov 2023 16:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D701910E16E;
 Wed,  8 Nov 2023 16:27:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDoQWN1+vIfY59nJ9y5VkeFYDpOV0+WsSCeD1WwrVEAssUbKBww9qnxrM3b1COT08OX4Srmz85Lb3E62o/xzN1xk0U90XW/DXnY800Is7FeFggrBXPLJ0qiKhBrKi/t0nbEr859bZOYgrezraghhOXaxswlsdzM9T2U2eVuS7AtjlR+B2xM/H52kXxqShVWU6fe3+cufueomqgYiRK8xdxOZofiFjgDRQ7LmXRjGC+h3+yK5yeUGEUk0HdNX/xb1AQnpx0is9VUG7u5chYcJqfmgBrCE+QciY6rYAEfto1452iwQ8JGyD6Z9J291o+VoL3PmrHOrdy3gJvlYpn/nVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFAen+eV4rVipGr2ruW8ukB5XIjBougklT/FfeJEfkU=;
 b=LpxwV3wS0xPwDaMXnaHMYTVydqXOyvUjEoZMO7tYoS1UT0jqTINU72zfsPQWWmuxRSBMafR1oDqbx9TdKgPc36guz49JMJwHXcVW/ElkP5QooWk27EaAm+Jhcxbzfk61VE3KVuQh24FWeKtVz4BWfvCBuY/COZMfAgZ4u+Q4PMyXTgyIn7YhusnFiz4xLfGvAq2SNYQaEiihrKzeRHbD1dIiUdHOPGpUQIdfzcpQ4QOZa99JlWVl7SudO6nbnqMJdYMWqs8W5Kj2l6L/0K9vqokhYrspCh7s37MjrlD1ojoeBqi5G9QAFcmzak2pFsHLUo4IBzGKztUtgX9cXpL14A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFAen+eV4rVipGr2ruW8ukB5XIjBougklT/FfeJEfkU=;
 b=VTQkY6DCOJPQPcwpPq+o+GmuVnK0Zbr5i6ftRdvvY0a8tIbElUMkrerotBxjiHjdMzl9l+kOS9jWEP+Qp1Ku5V1WIQow16Cr43yvU0YlOG7ZM2MZ/4AlV2xBrx/OP/bWgKiBUlzYYx3fuiYTxOcyzYEHhLRfo4oguOEfNH+RBFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH0PR12MB5281.namprd12.prod.outlook.com (2603:10b6:610:d4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Wed, 8 Nov
 2023 16:27:40 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%4]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 16:27:40 +0000
Message-ID: <43a56f81-ed15-4f44-ba38-2896df405f84@amd.com>
Date: Wed, 8 Nov 2023 11:27:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20231010161322.topz6zfealkxtwjj@mail.igalia.com>
 <c80abc42-3197-4476-b33d-88c795b2e55c@amd.com>
 <20231020133658.4cff9f42@eldfell>
 <bc7aa628-4d9b-4141-a001-535e67d173dd@amd.com>
 <20231107115543.7fa6e5f2@eldfell>
 <f013a0b7-eed9-4b2b-a6d0-4678c46bef84@amd.com>
 <20231108121601.163e58db@eldfell>
 <CA+hFU4zFz1NyDRzgaeaWVEw9GU-Lm9D=oDsOABnOpMsNHQfdzQ@mail.gmail.com>
 <6c574ff5-8890-4acd-a873-7cb2fb48ce7f@amd.com>
 <20231108181731.4fe6f5d3@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231108181731.4fe6f5d3@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH0PR12MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e22ee8-3a10-4703-473c-08dbe077a088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NSIBvnrEsVXxYRgtFQR7NF+ESXRRZDO624ZwSFWO1ecBPx7lq1JzGqxGF+pvl+BYm1LdOtxqcMLlC5bLbS9Q/c+L/aNUCLdkf382wfd9a/AtRtp5vTXKKzj1tXC5zkGqgyHhRt+fs8Nz2RSlpRGtZ/Qveu0fgvt/D1lcx/yOYu2zjgLIqMIXvxzP0mKtbxsgwAPb57Th/RWrnwjrW3+fQ6ohTLAkhx5tu31FpkOIXTQXdMQ7w8+D5tAFu4AAvbkLnSntP80v2oK/KN5Z4E8YME7QDEDPCxLBpdeO8rfAZV9R2XnHHFLxD+dtGoo32aMDoXqAA9pOBpOS6U5BhPJiR1aP5A6ax+XCW/pH2gFhgd+qbOPTyc61XfdwuRnQGyro30W5XEuCigfWQhMn3dr1lDEDrKsDVcpg7ALmsWMjb6wvYkopNHtnaXJuJ3NbGiqEnIt/9IMMF5XKjyP9VH/nI/vO4/sNb+hnHahjm2N1HRxdDS52w2tj+3XkSlF1dinqDHGjFNcvu7fZaNWpdmuqMPYQjwWgraKsT2OgUjzKg3Q02gdDTL7i9eBrxEacDEm4vbAML1/FiMX/xx7f0XpKHGBK9CL4plEuW0d+jcKCIIoonlOXq0PEjDcJmb5cr0L+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(39860400002)(136003)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(66899024)(6666004)(36756003)(66556008)(66946007)(54906003)(316002)(6916009)(66476007)(31696002)(86362001)(8936002)(478600001)(38100700002)(8676002)(4326008)(966005)(6486002)(6512007)(6506007)(53546011)(44832011)(41300700001)(26005)(2906002)(83380400001)(4001150100001)(31686004)(2616005)(7416002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUQwSTVRaHVJZHhLOEJ5K0FtYURzK0U4UzBNQkJTU0F1cnpyUlJza00rODV6?=
 =?utf-8?B?RkxYbVlzUFRoQVVEM3hVN1RwQUFwNjI0QjJTU3l2MDdyRzVlaEROdDhnYWhX?=
 =?utf-8?B?Sjd3TnN2eGVWR3NOZDFKbll5VEVKcFF4NWVUM3pVWnJCUTZtOEhrYnRrSkJD?=
 =?utf-8?B?cDg4OTBLbHVSWEtnQUxCN1JxcEZpa1lSd25lakhqZjE4ejk5R2Qya1QyU2k0?=
 =?utf-8?B?Yk9RZDRhaTBhK096WllJVldTUE9sWTU1bE1pZ2RYOE9FbmgrbkVlWGVJM2FN?=
 =?utf-8?B?SFRTM1ZZRXdXTmY1aEgybUg5MHJsS05aSWtYTmxxZDkxMStmMHhORlZaOHFs?=
 =?utf-8?B?MUZHZ2wzTWU0TjI0UTNwaGhYNCtmY0haQjhmQkVQMUFtTmEreFJGUGdIOHpT?=
 =?utf-8?B?OGJ2c094MzlFUUduOStvU1NvaVB2RTJpSWtDK29EeVZyejBqUEdCeWNyak8y?=
 =?utf-8?B?Vjh0dkZrcks5anJTWlNycEV3TFlEbDRLRjk0Q2FpWWNXMlNPT1BTZUhnMVpX?=
 =?utf-8?B?Y1R3UkpFQXpHcDFqQ3ZHZjBPMzlNbjR4ZjZIUUtTYlVDdHJoem92amMvUDJV?=
 =?utf-8?B?MFR2bExIV1ZYS3F1QkNvUDJ3dDUzRUgrOEE0YjhRSFl0VkVlZGRYbWRtSnJY?=
 =?utf-8?B?aERuRTUwK01HYUN3QkI4eHE4MFZTTEFreHNqNGlIR3o1L3hJektsejk1QzU0?=
 =?utf-8?B?YlBJQitrVllnOFM2eGEzR0ZGQWtlVG9yN25PSS8vT0JjQmJmdmEvYk1KbURo?=
 =?utf-8?B?UkRqaklRbU45cDdIOEsrakpOdGZSUWRZdWlrTEM5VkRqTGhZQ01FVDNEMnJ5?=
 =?utf-8?B?b2NLRXFabThVdkg5OGM4L3Uxb29YRzMyaE9aaVZjeHZYTGtycGs2cHN3SjR4?=
 =?utf-8?B?c3czWHJEbWhKd0xuc0FjOC94TGZMU0J2cksyaDlPVHVRN2g1ckIzbDRCOVA2?=
 =?utf-8?B?QnpTbjBGV21RbEViQ1F6VUhibnh0eHdrcVBuNldBVzlpVU1GQk9Sb2NPVE9W?=
 =?utf-8?B?RkpHTE9ZenNBQVN3RnlmTjRUMWZyZnpiajIvWmNCSFZOZ2JubVI0ZWVsVGFY?=
 =?utf-8?B?K1FrNm40SVA3TzZMUU8zMlF3Mzh1Ui9MMERncXJZZVhaZ3hpL1dXU2loK01x?=
 =?utf-8?B?bDBkTUFQZHA2QW84Wm5CcExnU1o4YVhPVGE2Ny9FQzhGd0JHcDRockNkOVcy?=
 =?utf-8?B?emhlVHYyWVFySUZVd0hCVEYxbWwzeU5jcURQNGROTzYwYU8vNmIzWkFpeUp5?=
 =?utf-8?B?cVl6NUFNZjB4Y1Q0TXB5UGIzanBrejFCempOTFZDNkZ2ZjdhbWZZRE1RQmUy?=
 =?utf-8?B?NWl5Q29HWmp5RmxDMlArWU1Pb2hHeTBILyt2cXdaQ1VZQy9JbW9WUWtkL004?=
 =?utf-8?B?enFIL001THhhdEtzTkxFUlF0Y1lVOS95S0xwZFMvZWFXOU5yemNZaVhodDlr?=
 =?utf-8?B?M1FiaXZWb0JGQlBZWkVCUnY4dUNpci9CNTVETE14ZnYwaEJFM1Y2RFhWZlEr?=
 =?utf-8?B?bEJ2UHlIQ3VwTVVqWnJuZTdJbVFrQmZwVzR6THRxOHFNbHNxTGx1bWNFUGsv?=
 =?utf-8?B?ZzI5aWtDU01URnZTd2FlS0E0bStMVFlVYnJjcUVFOUNLZjN2USs1RmhCQVYw?=
 =?utf-8?B?MkFlbE5QaHdKbXdzaTJYMnBHTnVEQzNudkI2RS9hUitrNWZ6by9vV0lzZkZ4?=
 =?utf-8?B?WE5aWGROOS9UWUN4TjJyS1hzM1gxZVY4a0ZlYlAzaWtwbHo0OEJDUTJEYUEw?=
 =?utf-8?B?RjlkSEZVZ3AyK0laVzhVOHg2emFMVTRsTGM4VXZGQXB6WlVyWGs4bXJJZVlX?=
 =?utf-8?B?QzMrOUU4UFhObSt4SlVvaFhkb2M5VEJZbFlJNHo1dFdtVWsyNDl5S3dRNFg4?=
 =?utf-8?B?Zm9mTHRoR0hHTnI3Qm5MQkNaREtHYUlpcFhiZUExaGVyU2lyV09HVFBpT1Vq?=
 =?utf-8?B?bXpKK1hjRUdxZjdpa2hFYUNOdTZ6L2xYMlZKQTJMSWwvQnpNRFdqQUc1VE5N?=
 =?utf-8?B?YjZjeldNWndtazkzWDVaUUxnM3dISmxqRHBKcHovdjFXd1RGWHQvU2E1RUts?=
 =?utf-8?B?RWtnQjlOMEFpcG8xU1ZMMUFabkpqV29zdlUvTVMxTFpHazJaVS9wNmJzL2Q1?=
 =?utf-8?Q?cm7w2x2Tonj6ZS5vU2/d6N8bK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e22ee8-3a10-4703-473c-08dbe077a088
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:27:40.3168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRxz0+FMPAsZRkwojlV6G5WeItYOwEmK7fqvStNGc7FUhCbbIh14W1uL+SbYeFmkl3Li1MJ7bRPO2NF3zQdTxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5281
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-11-08 11:19, Pekka Paalanen wrote:
> On Wed, 8 Nov 2023 09:31:17 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2023-11-08 06:40, Sebastian Wick wrote:
>>> On Wed, Nov 8, 2023 at 11:16 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:  
>>>>
>>>> On Tue, 7 Nov 2023 11:58:26 -0500
>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>  
>>>>> On 2023-11-07 04:55, Pekka Paalanen wrote:  
>>>>>> On Mon, 6 Nov 2023 11:19:27 -0500
>>>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>>>  
>>>>>>> On 2023-10-20 06:36, Pekka Paalanen wrote:  
>>>>>>>> On Thu, 19 Oct 2023 10:56:40 -0400
>>>>>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>>>>>  
>>>>>>>>> On 2023-10-10 12:13, Melissa Wen wrote:  
>>>>>>>>>> O 09/08, Harry Wentland wrote:  
>>>>>>>>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>  
>>>>>>>>
>>>>>>>> ...
>>>>>>>>  
>>>>>>>>>> Also, with this new plane API in place, I understand that we will
>>>>>>>>>> already need think on how to deal with the mixing between old drm color
>>>>>>>>>> properties (color encoding and color range) and these new way of setting
>>>>>>>>>> plane color properties. IIUC, Pekka asked a related question about it
>>>>>>>>>> when talking about CRTC automatic RGB->YUV (?)
>>>>>>>>>>  
>>>>>>>>>
>>>>>>>>> We'll still need to confirm whether we'll want to deprecate these
>>>>>>>>> existing properties. If we do that we'd want a client prop. Things
>>>>>>>>> should still work without deprecating them, if drivers just pick up
>>>>>>>>> after the initial encoding and range CSC.
>>>>>>>>>
>>>>>>>>> But realistically it might be better to deprecate them and turn them
>>>>>>>>> into explicit colorops.  
>>>>>>>>
>>>>>>>> The existing properties would need to be explicitly reflected in the
>>>>>>>> new pipelines anyway, otherwise there would always be doubt at which
>>>>>>>> point of a pipeline the old properties apply, and they might even
>>>>>>>> need to change positions between pipelines.
>>>>>>>>
>>>>>>>> I think it is simply easier to just hide all old color related
>>>>>>>> properties when userspace sets the client-cap to enable pipelines. The
>>>>>>>> problem is to make sure to hide all old properties on all drivers that
>>>>>>>> support the client-cap.
>>>>>>>>
>>>>>>>> As a pipeline must be complete (describe everything that happens to
>>>>>>>> pixel values), it's going to be a flag day per driver.
>>>>>>>>
>>>>>>>> Btw. the plane FB YUV->RGB conversion needs a colorop in every pipeline
>>>>>>>> as well. Maybe it's purely informative and non-configurable, keyed by
>>>>>>>> FB pixel format, but still.
>>>>>>>>
>>>>>>>> We also need a colorop to represent sample filtering, e.g. bilinear,
>>>>>>>> like I think Sebastian may have mentioned in the past. Everything
>>>>>>>> before the sample filter happens "per tap" as Joshua Ashton put it, and
>>>>>>>> everything after it happens on the sample that was computed as a
>>>>>>>> weighted average of the filter tap inputs (texels).
>>>>>>>>
>>>>>>>> There could be colorops other than sample filtering that operate on
>>>>>>>> more than one sample at a time, like blur or sharpness. There could
>>>>>>>> even be colorops that change the image size like adding padding that
>>>>>>>> the following colorop hardware requires, and then yet another colorop
>>>>>>>> that clips that padding away. For an example, see
>>>>>>>> https://lists.freedesktop.org/archives/dri-devel/2023-October/427015.html
>>>>>>>>
>>>>>>>> If that padding and its color can affect the pipeline results of the
>>>>>>>> pixels near the padding (e.g. some convolution is applied with them,
>>>>>>>> which may be the reason why padding is necessary to begin with), then
>>>>>>>> it would be best to model it.
>>>>>>>>  
>>>>>>>
>>>>>>> I hear you but I'm also somewhat shying away from defining this at this point.  
>>>>>>
>>>>>> Would you define them before the new UAPI is released though?
>>>>>>
>>>>>> I agree there is no need to have them in this patch series, but I think
>>>>>> we'd hit the below problems if the UAPI is released without them.
>>>>>>  
>>>>>>> There are already too many things that need to happen and I will focus on the
>>>>>>> actual color blocks (LUTs, matrices) first. We'll always be able to add a new
>>>>>>> (read-only) colorop type to define scaling and tap behavior at any point and
>>>>>>> a client is free to ignore a color pipeline if it doesn't find any tap/scale
>>>>>>> info in it.  
>>>>>>
>>>>>> How would userspace know to look for tap/scale info, if there is no
>>>>>> upstream definition even on paper?
>>>>>>  
>>>>>
>>>>> So far OSes did not care about this. Whether that's good or bad is
>>>>> something everyone can answer for themselves.
>>>>>
>>>>> If you write a compositor and really need this you can just ignore
>>>>> color pipelines that don't have this, i.e., you'll probably want
>>>>> to wait with implementing color pipeline support until you have what
>>>>> you need from DRM/KMS.
>>>>>
>>>>> This is not to say I don't want to have support for Weston. But I'm
>>>>> wondering if we place too much importance on getting every little
>>>>> thing figured out whereas we could be making forward progress and
>>>>> address more aspects of a color pipeline in the future. There is a
>>>>> reason gamescope has made a huge difference in driving the color
>>>>> management work forward.
>>>>>  
>>>>>> And the opposite case, if someone writes userspace without tap/scale
>>>>>> colorops, and then drivers add those, and there is no pipeline without
>>>>>> them, because they always exist. Would that userspace disregard all
>>>>>> those pipelines because it does not understand tap/scale colorops,
>>>>>> leaving no usable pipelines? Would that not be kernel regressing
>>>>>> userspace?
>>>>>>  
>>>>>
>>>>> The simple solution is to leave previously advertised pipelines
>>>>> untouched and add a new version that does include scaling information.
>>>>>  
>>>>>> If the kernel keeps on exposing pipelines without the colorops, it
>>>>>> fails the basic promise of the whole design: that all pixel value
>>>>>> affecting operations are at least listed if not controllable.
>>>>>>
>>>>>> How will we avoid painting ourselves in a corner?
>>>>>>
>>>>>> Maybe we need a colorop for "here be dragons" documented as having
>>>>>> unknown and unreliable effects, until driver authors are sure that
>>>>>> everything has been modelled in the pipeline and there are no unknowns?
>>>>>> Or a flag on the pipelines, if we can have that. Then we can at least
>>>>>> tell when the pipeline does not fulfil the basic promise.
>>>>>>  
>>>>>
>>>>> The will always be dragons at some level.  
>>>>
>>>> Do I understand right that the goal of fully understood color pipelines
>>>> is a lost cause?
>>>>
>>>> That every pipeline might always have something unknown and there is no
>>>> way for userspace to know if it does? Maybe because driver developers
>>>> don't know either?
>>>>
>>>> By something unknown I refer to anything outside of basic precision
>>>> issues. Doing interpolation or mixing of inputs on the wrong side of a
>>>> known non-linear colorop, for example.  
>>>
>>> I don't think that's the case. Hardware vendors should understand the
>>> hardware and exposing everything that affects the values is the goal
>>> here. There will be a transitional period where the pipelines might
>>> not expose every detail yet but that's fine. It's better than what we
>>> have now and should become even better with time. It would maybe be
>>> helpful in the future to have a cap, or property, or whatever, to
>>> indicate that the pipelines are "complete" descriptions of what
>>> happens to the values but we can discuss it when it becomes relevant.
>>>   
>>
>> I agree, for the most part. But how do you then define "complete" if
>> you exclude precision issues?
> 
> If someone can develop some kind of precision indication in the UAPI,
> we might be able to answer that question then.
> 
>>>> An incremental UAPI development approach is fine by me, meaning that
>>>> pipelines might not be complete at first, but I believe that requires
>>>> telling userspace whether the driver developers consider the pipeline
>>>> complete (no undescribed operations that would significantly change
>>>> results from the expected results given the UAPI exposed pipeline).
>>>>
>>>> The prime example of what I would like to know is that if a FB
>>>> contains PQ-encoded image and I use a color pipeline to scale that
>>>> image up, will the interpolation happen before or after the non-linear
>>>> colorop that decodes PQ. That is a significant difference as pointed
>>>> out by Joshua.
>>>>  
>>
>> That's fair and I want to give that to you. My concern stems from
>> the sentiment that I hear that any pipeline that doesn't explicitly
>> advertise this is useless. I don't agree there. Let's not let perfect
>> be the enemy of good.
> 
> It's up to the use case. The policy of what is sufficient should reside
> in userspace.
> 
> What about matching compositor shader composition with KMS?
> 
> Can we use that as a rough precision threshold? If userspace implements
> the exact same color pipeline as the KMS UAPI describes, then that and
> the KMS composited result should be indistinguishable in side-by-side
> or alternating visual inspection on any monitor in isolation.
> 
> Did this whole effort not start from wanting to off-load things to
> display hardware but still maintain visual equivalence to software/GPU
> composition?
> 

I agree with you and I want all that as well.

All I'm saying is that every userspace won't have the same policy of
what is sufficient. Just because Weston has a very high threshold
doesn't mean we can't move forward with a workable solution for other
userspace, as long as we don't do something that prevents us from
doing the perfect solution eventually.

And yes, I do want a solution that works for Weston and hear your
comments on what that requires.

Harry

> 
> Thanks,
> pq

