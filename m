Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F62414CB0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 17:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1926EC0E;
	Wed, 22 Sep 2021 15:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FB46EC05;
 Wed, 22 Sep 2021 15:07:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzpADjqdZgY7l7lbNzuJu3NQ7BBfaEdObJjikGbHgmybUnNV15ye4rLGqH7H4bXwwslvy1l+3yTs5lXWm6JyzOdQ9eq7V8HrUPvhzM/jGb6PXD+qEMqdyWvj33DA0vIRTsfrbO/3DzJtIoDRfc3g44vX1GXLHgr5NA+72tNiiyTWZNo549UOiW77devldJTK5KFB+RKJtVL7vpBT8451qcJNThNOpZEbIjr8RMWbfVul0dpDv7bG4Wch+mfpg+8M4XVEGw65Cch1voa308dLXE232u5W7Gf2nAEqk3lJSFzHUQmoiihbkEPkFJgocVZozWAoHvCWdPdxooSRzUhSjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=J1Mvm8OzyJRcxEhDYAOFHILNyMgAYW9hUPfAO3wfAY8=;
 b=QQW6ep2Gk8lw4hJLcxok2jdkz0a59gqMikZmG7ayQIgBtSZw6kVniqQEIK+FDd4BUscctUm/Zzqlgnhb4tFgvKy5zE0LtXM7AI6+DrfC2qvYT83tP9Li+b4yx39YWEoV4bfNC4gNqmcrZ+ZEmI2X6u1Ro+bTDBaQS2Whb1ogj4mffhNNmND5vpzExeGIuNcxpFJdDPdC7RSeroLuRVAlPfj+2R+KzhYXO7YEbHAViUU38M3ABNUcJiw+gHPwlKrIP5f9mUsdguffyBn9jntgeIL694ycPkJYUbFtI5at0vSye2iepr58LjBGdJ7BquGdWTNJTZy6P9xJ5pxhq4M17A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1Mvm8OzyJRcxEhDYAOFHILNyMgAYW9hUPfAO3wfAY8=;
 b=IfoBpWi/CxrEAqxp+/Xgf6+f852dmd/Boy3f933T4tJX24ocUbYCSPDadNntLlF6xOoDVCtIKpgqrs7V+r62V2oRJ29KZutMlX8Myizd2NVmy7HlYcDfRjFxAwN6FUn5DjyIrs1/2LH7K0E6pg7D0elXY8Coh43TVSEitjcntMM=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5412.namprd12.prod.outlook.com (2603:10b6:5:35e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 15:06:59 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465%9]) with mapi id 15.20.4544.014; Wed, 22 Sep 2021
 15:06:59 +0000
Message-ID: <a13d64b1-7b24-5fd5-41d3-b55d2bd388e0@amd.com>
Date: Wed, 22 Sep 2021 11:06:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 sebastian@sebastianwick.net, mcasas@google.com, jshargo@google.com,
 Shashank.Sharma@amd.com, Deepak.Sharma@amd.com, Shirish.S@amd.com,
 Vitaly.Prosyak@amd.com, aric.cyr@amd.com, Bhawanpreet.Lakha@amd.com,
 Krunoslav.Kovac@amd.com, hersenxs.wu@amd.com, Nicholas.Kazlauskas@amd.com,
 laurentiu.palcu@oss.nxp.com, ville.syrjala@linux.intel.com,
 jeremy@jcline.org, Brian Starkey <brian.starkey@arm.com>
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
 <20210915170127.31377385@eldfell>
 <4ed51ca0-ca98-cf84-33ed-ab172e3548d3@amd.com>
In-Reply-To: <4ed51ca0-ca98-cf84-33ed-ab172e3548d3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR01CA0128.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:1::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 15:06:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4e1e693-762d-465d-03d0-08d97dda9fbb
X-MS-TrafficTypeDiagnostic: CO6PR12MB5412:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB54121BB885453F83EBB1B0608CA29@CO6PR12MB5412.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wWfe10nNRSjDIJUjpbNvq3hy2gSBXepo3ClSHBA4Jn8S/IRIewDZvClbMsd8Ks/rW5xqocDc6nsyweFTt9FR62f0cw1nf7WJgVWEx26x5OntAsaSPRST1Tdnue5+GSQobfvt4iRHnPiJzrpynW6B4kAOZANWVJfpPk31bMWPPzj1f9i0EgyuWgkCjbhs/yf5hg2o4lF9695X/YL6EcukMyI4MHBawJgRQk2W8IFUGWEdu0VrOhzo9HtfyZpz/kHJ49g0hgLjx4OsORABpYTf/AJ71h6S8sq7vuwJksKv53fva3Rvf+OyJr6PKe3Wbx+foZepDUdl/JLDeTBbdSE4LTf+fPpmZaD98MKxC++uzgiAjGG0JPXKaDplVH4jXrCIN4s0BXokKvdOmt6hUseTq/PeTjwzBWvlRMTieZsk85Q5uMS5vuPhGipL2lo6dD+jTRzDHd6zW5k1vRJdR+NKxkMo22jcs4zW5AAVIsuMwpm/gKyLBn8/iqLEDpkG1t+mF/81YTfF6q6htyuYtWWoj5B0Ey0v3/hJukI4BQtLJgA/qKuKApfbEd3SlI9Kyc6Voy+XbwATkFBoQYXLEpo/jjHxzydK4Eo3UuXG6X+N83Jfv16sLuApr0y5DSDc3Zj2KoJKitL48issuDcREDsXAH/vd1759ocrWfXO+URxHf1eJM7gtJnqpnb1rp3PPw5dUFrp82LXpA1HZ2jvp/qC/TtgB0Dj03dgbxzvw381rO8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(956004)(38100700002)(86362001)(6916009)(16576012)(66946007)(44832011)(2906002)(6486002)(83380400001)(31696002)(26005)(53546011)(508600001)(316002)(66556008)(2616005)(5660300002)(66476007)(6666004)(31686004)(8676002)(8936002)(36756003)(4326008)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REgxSFcyS3JtSEcxUmNOMmNHMlhINUY0eGhsRm9CZ3BtaUJaVVFxRWNxNzBU?=
 =?utf-8?B?NzNjcHRnRGlJb254TGJ6OVdCUzh5RTk1dUF6Wk1sUkVOcmQwdTV1amIvUUhq?=
 =?utf-8?B?Qk9kVUZLYU9QMEE5VjZsM0Y5ZnpUdEdLS2Nza3NSL0FUcU8wM0RDcW5oNk1L?=
 =?utf-8?B?b3hwSUhKeU8zMXR4VEMvT1l3T2VCZ3lmRm4wRDlOQTJJdjMxZjVaTWlLMHdu?=
 =?utf-8?B?elZOdXhtcVAybVRFZS9rZTFGM1A2MjlocDBDendMSjQ2cEJuZWYxVTFDcERV?=
 =?utf-8?B?dGM2cDVhNEZZMWlRTUd6dVBjQUZpcFV5dVRxeGdXMGFTbjJnd3llWUMzSlVp?=
 =?utf-8?B?WXZ1a2IvNmREVzVGYzdoYzN3WThYT2JDd2RnNnBMblVqNWprTlFiSEd1alRy?=
 =?utf-8?B?OG9yRE1SL1ZrMWg4YXNEbnRCZkFGcUxsdk1Dd3hWaExTZlNid3NDNEF2cnVp?=
 =?utf-8?B?bjRPNmJzZEM1S1dpRlp0eTFOY0dOQXovbElxNk0ybVY2alJ4NlRpdDViR0NH?=
 =?utf-8?B?blk1NFpLcGgvWHBRaTdQVmFzaXl6SWFyY004NzhndnhWQ0NjaVVLYW9KUjBw?=
 =?utf-8?B?eVRQQmNobVkxV0dRNlhGYnhxWDlOTThndG9vazlEMWV2dnhyMHVyajBsZkh6?=
 =?utf-8?B?ZHhnQ1BRUzFpOTV4QVVJK0thZm43RjUyeDJ3MzVQM1lTOU9iRUhpbUROQS8w?=
 =?utf-8?B?VityQm9iV0dBeTNGQndyMXBmRHBBaHZqS0Z1T2JYRnluQUVTRHJtRVB6MlRH?=
 =?utf-8?B?TnRjSUZJclJaYnQzOVRxSkZmZjZMTEdyc0czNUZnYk9lY2VxM0IwNUl3Zmxl?=
 =?utf-8?B?YWlxWXM1SVE1YkdSWUVhelJabkh4RW05c2o3UlR5dlNXbTFYenFSc3lUamQw?=
 =?utf-8?B?b0c0R21MVVNlQWtHc2FuU3ljd0N1T3pCMmdhMXZOWS9GRWlpdVQ5YjVsS0xK?=
 =?utf-8?B?REVlRzFHcWpicnY3eEZYZ2lLdVpTdkMrSVdyd2NBckRrVHRxdjBNR2Z0Qm9P?=
 =?utf-8?B?ZzBNMXJackJXM1krVzV4amZyOGdWaEtFYldmeExER0hiK2d5WS9ZTzJzNktI?=
 =?utf-8?B?K3phNG0yS2gyZ29SMlUzeFR5cWc2OWZrMS9RYy9OTEdKcHEvQ2ExL21XZG5W?=
 =?utf-8?B?bWtwbmhGT2N2aHE2bW5ZYTVIUnlVb2I0c04zb0dGR25iMGVRRUhZUFQ3ckor?=
 =?utf-8?B?azdyNUxJVkZIWXAyUWRGanhrRkR3SWZsZ2duaC8wcDF2bWcvRmhVVW1VY1hH?=
 =?utf-8?B?Z0dMc2dQa1JrVGF1T3VXZmI0NVM1UGs0OWdsVDlISkprOWdtcU1zdXJ6bEVI?=
 =?utf-8?B?SmM4OFhtaWV1VHlFMHcrc3paOFJ4SzRiYzRERTFsdWc5VmZtcVVCeXJrNDF5?=
 =?utf-8?B?U3Y5UVFRbTZRWUZzM0tGWUM5WkdoVkhTbTI3QUdyTVRndzN5S0s0OU5MdERs?=
 =?utf-8?B?U2VublpwL0NoTTJ5WWFiQmp0UEpBSTA0aS8yS040TEt5ZzEzRjlBcExjSnFl?=
 =?utf-8?B?RHEvbU5lRVdVYzN2YTRha0cwL1hUclJSTmtObEthWk9nL20xZTBkbGQ4cU05?=
 =?utf-8?B?NVFaZ1g0UVQxckl4ZlFXVHFqK2RyNkNETXBsMFBrWFN1dXNBOERUQzY4eElC?=
 =?utf-8?B?QjczaHdhaUFSTWgvMkw4WDhMZ0hIOXF0djVZUDIvLzlSckZkQUtqdWI5Sm5t?=
 =?utf-8?B?TTVpMWJBN2dLTHcvNS96THJaQ0diMEZjeERibWJxVFZxTUozbmYyOXk1YzN4?=
 =?utf-8?Q?Tt2RQJ3PnfE15k9sLQ1Q4Pz7aDdwgpCONkcTPCV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e1e693-762d-465d-03d0-08d97dda9fbb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 15:06:59.1068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLaLRjzkmun5/QNinldbR3hnfgDk+bQgtb/Axk91Q7hXNUqWKc2Cf3a+GuRWJj31zQt5TrEpW1XyNiL+bMZxew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5412
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



On 2021-09-20 20:14, Harry Wentland wrote:
> On 2021-09-15 10:01, Pekka Paalanen wrote:> On Fri, 30 Jul 2021 16:41:29 -0400
>> Harry Wentland <harry.wentland@amd.com> wrote:
>>

<snip>

>>> +If a display's maximum HDR white level is correctly reported it is trivial
>>> +to convert between all of the above representations of SDR white level. If
>>> +it is not, defining SDR luminance as a nits value, or a ratio vs a fixed
>>> +nits value is preferred, assuming we are blending in linear space.
>>> +
>>> +It is our experience that many HDR displays do not report maximum white
>>> +level correctly
>>
>> Which value do you refer to as "maximum white", and how did you measure
>> it?
>>
> Good question. I haven't played with those displays myself but I'll try to
> find out a bit more background behind this statement.
> 


Some TVs report the EOTF but not the luminance values.
For an example edid-code capture of my eDP HDR panel:

  HDR Static Metadata Data Block:
    Electro optical transfer functions:
      Traditional gamma - SDR luminance range
      SMPTE ST2084
    Supported static metadata descriptors:
      Static metadata type 1
    Desired content max luminance: 115 (603.666 cd/m^2)
    Desired content max frame-average luminance: 109 (530.095 cd/m^2)
    Desired content min luminance: 7 (0.005 cd/m^2)

I suspect on those TVs it looks like this:

  HDR Static Metadata Data Block:
    Electro optical transfer functions:
      Traditional gamma - SDR luminance range
      SMPTE ST2084
    Supported static metadata descriptors:
      Static metadata type 1

Windows has some defaults in this case and our Windows driver also has
some defaults.

Using defaults in the 1000-2000 nits range would yield much better
tone-mapping results than assuming the monitor can support a full
10k nits.

As an aside, recently we've come across displays where the max
average luminance is higher than the max peak luminance. This is
not a mistake but due to how the display's dimming zones work.

Not sure what impact this might have on tone-mapping, other than
to keep in mind that we can assume that max_avg < max_peak.

Harry

