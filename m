Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B7D39E8CF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 23:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287336EA21;
	Mon,  7 Jun 2021 21:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB486EA21;
 Mon,  7 Jun 2021 21:00:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLTB3P8VBBZLhy+mDeFZxvMnndpOeqkYylkLBC1aAvxlNASXGTL60qttaQgkuU9nnDPaRIKXdK+iDVQHhxVlh218xIuvZab1m4Dt8h7u2S2pAOtQlcqKW9VOjMx2vDkEfs6vStnum4XXz1i1wPMwfNQHG1UHLf59J3aanSGgff2mUjaO4lUVHQqKur8/v0W/Q8haKp8zvNuxcN8Y8Vbv3FJ3DpIqCO++kArJUuY08Z2XoxSlTy9SyS7RU20sHogy1ifin5HQC4JF7CjZIBELcVpS52wC+1AKhoyqidau8jL1xYNpIUXHhJ4hhXeg8K6pHkPU9BQCA8qS7f47ViaV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBf3VsCbMR27RKvfOcJfahoomWxi9AKsquT0tUeRgkU=;
 b=SJA6RJVUbXjEjcxR3jeiU/pnEsCLnCqdphssSeUhX3s6G4hkWk6StZOd3l8Iz8Ghsi/ea0OYxgkVqFCi1hMqw3NtqWNV0ARKUQ2HW0aGxyTf5t5eFGbnoLk/ixUD70SZWS4AnmCdWrFQrPX3RFKUhnEWIBPZikv0HduHWZI2Q/70NKQUdpbbocAifSEtvq+gasKhSWC/N/LrjcrWBUdOXQE1+YCe1SmDiWD1Z80iiK1g/kAIkZ/pAyHOAVj2tAvAy1j+d5AUdsB5eRmZ5vDAbleTgz4bLqFhC1AKYYpuCweRdCcS/Wyd1S3BJ1wxigKI8YUxRozTdRKf0G+BpZ+f3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBf3VsCbMR27RKvfOcJfahoomWxi9AKsquT0tUeRgkU=;
 b=vLix2pJfOwGY+v19QMHERzkQboy4MeuGGNSIQcqfhNJXl0rc+5pw651zZTUpWQ5UOQaTt5bay2BBrMcB+TEqyqPGQjJNbMF8Gim4JjnU4IJMd9WQP7aG8gBm1yChzKnvNn2cQivijPZiu/vVn8cWZsiSnGzAM8NEZSrbwA5OU6I=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5426.namprd12.prod.outlook.com (2603:10b6:5:35d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Mon, 7 Jun
 2021 21:00:20 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753%3]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 21:00:20 +0000
Subject: Re: [PATCH 0/9] Enhance pipe color support for multi segmented luts
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210601104135.29020-1-uma.shankar@intel.com>
 <0909131c-1340-c93b-7b80-b661497ccf73@amd.com>
 <3a4ccb6211824ce199c7307079833b07@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <ae07bcd0-8184-702d-1e23-1bf436a80624@amd.com>
Date: Mon, 7 Jun 2021 17:00:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <3a4ccb6211824ce199c7307079833b07@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [198.200.67.154]
X-ClientProxiedBy: YQBPR01CA0135.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::35) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQBPR01CA0135.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:1::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.29 via Frontend Transport; Mon, 7 Jun 2021 21:00:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2313106-80c9-4944-b44a-08d929f742b6
X-MS-TrafficTypeDiagnostic: CO6PR12MB5426:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB54264DAFFB745AEA28F9FC608C389@CO6PR12MB5426.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tmizOziXgd6CnhGptu0QbMFUGrmY/Kaf0t47PGV7dgyM/CpyMAx7CeLr9RvMzyTitIo+pmgCGFKdzcJDZilCzqunKJGT+Y60H/JaDsQ6GhaHpZeYBVNH1RImmQ2J/PqHzSZ6zsYY1LfDeL3Jxg/BHwBwIFKONypEAk/yQ5c9nmO9bzUYGyv24TJ6ynX4qB5kZfxR/K/rKm2XQnd0aKvvL743V7lQ9Vua57MpfIgRI20j/E2zsrQ2Fs8HHfgyPx4NHuZYsS+6Y6vMBLl7zoLSxob0uxdJY2giOnKCNZy4SgpcR1eM3kc+VKLDFH+6Kb82tiJgs8+gXtFJ7CQbcZShOEMYV9X4yx7n5qtq3UpHHktqjll3X52Ctm2RM4dWHg2HoylUgChFnHmH3Kv5cI3FS6qNXp1idWc27BiqkhuIZJjyyTcKugrFmB9Aao9HccYeL1OyaJJTIMeEEj3yOCoZ/Pnapx+jbev5eeiN5R13EjqzNSJTmxNRiwhKCDmBI2AJlTc0ubm1KXzPnYT5SEQOjwaR/xPwZnUfVepnXXLgDLhf621oj6dV/mDxrpSEhIV3EyCE4Z04rH+/CgUxsNGP2p7BW19PoP3CWOQ25SGeSLqXUPnaLd9V1yFgaarLtyDLn/KTxWYWDH5UafnutvgWiCsylU9xUzoqdquzCd1NfcGs8QDdnSn4iOYQStFT47fX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(956004)(2616005)(36756003)(44832011)(478600001)(6666004)(31696002)(26005)(4326008)(5660300002)(53546011)(31686004)(110136005)(86362001)(16576012)(54906003)(6486002)(316002)(66556008)(66476007)(66946007)(8936002)(83380400001)(16526019)(186003)(8676002)(2906002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T0ZXZGxwUC9oMWZ3aEw5Qk5Lamc0RWlBdWJmNXNOOUs2ZnJVNCtBTUJDVnp2?=
 =?utf-8?B?QS90bWRoNVRhR0ppVFFuOGUrZysvLzBVZUk4aTBoeituVWxiNDFBdWZydmh3?=
 =?utf-8?B?Vm11ZzFRRVFnem1EcjJXSVJEZnFBUGNoeFBaVU55bFlpeTduM3pGQVpLSmZB?=
 =?utf-8?B?enhtZE1BM1BsNHNyckp6c0tFN0Jla2gyQ2NGeW4vbFBaMzQwQzJuY3lENXcx?=
 =?utf-8?B?TzhEOFhCS2w5dDBPWTFib1J2VXd5bTVqcDVuQUQ2V013NEcvRzltMlRGd0Fl?=
 =?utf-8?B?UHRWSDgwTmluTHhxTjdlcXhHVWpDMlhYSlBFVzRhYXhXSWttZmp5Q0dMWlp3?=
 =?utf-8?B?bmcxRzFmS3o5STlhYVN0Q3dDMWNWL1U4YTA5RHVJZGgxR21NTktOTGRlcjBF?=
 =?utf-8?B?NVNhUXBBZTNNQzFtTjJnQ1hJWjdualpwTFVnL0FWd0tzNWU4bDhwUEpXaGhL?=
 =?utf-8?B?Y0ZtZ3EvMUY0dmNVZE5NM1FCZnBQaUI5SFlFVU01RElCT2Y0cFF0Q25CNmxZ?=
 =?utf-8?B?SUUraXVDQ1NNQnc3YlNLMFlCM05xUWFISXArZVpwOU51N3QvZ1VLZFFhcGdx?=
 =?utf-8?B?TldCQWNLc0R5aUdyQ3FlWEY4azNsTzJmSlJaeVk2RXhlQ3psZmxxdFk5a2V6?=
 =?utf-8?B?RlcxMTlnYzJtVUo3VGZ0UVhmalNKTmU5RlVsakZxK1Z4T3l6R2s2Wk9BazNs?=
 =?utf-8?B?RkpVVFRuRkZMOVlZalIzM1l5dGxvczc1V3Rka3FJYVYrVXJZbmhaMVYrUTh4?=
 =?utf-8?B?dW5pa3pNUXp2NVRFTGQrZXlMTll4Sm5uaTFTWm8xWWNYenEya05wbkRFbi9o?=
 =?utf-8?B?c2MrU3hSdk5oTjVlREhXeGxIT2oxVXl0ODJIVkxhS3k5V20vTWovMTFRL1ps?=
 =?utf-8?B?ZTRVNytiNGdsKzFNNVp2K0dQS0kxVWE3OHo1eWFhZysyT0U0MDZNYng0SEpZ?=
 =?utf-8?B?TFh1ZWJ1c0prbVVhS2h6Nys1aVkvYjBDMHpZYWN4RXNFVmhDSHo1SUdOT0xT?=
 =?utf-8?B?UmJKUVNwNkdkbFlHbzlJa3RWZVJScGRvQ1VHd2VpVkQrVzRVSzlRaU1YUVdD?=
 =?utf-8?B?TmpETlRzTTRmSHh5UE1vQW9yUDMxdWlPdjlSa0cyRmpLcG11eEVFOTJMc01n?=
 =?utf-8?B?bzBlSHRyemxxN01wZThUTno3bFZMcWF4eG1xSTRzajZFY0NqcWxrMUZqMis1?=
 =?utf-8?B?Nzd4NWYxUFpCenpLaUpYa1Z4SkNRTktvZ2M4VjV3MFFGZHdNRlVtY1BtU3Jw?=
 =?utf-8?B?OXFEV0hNZTFSaWNOOUFqK0o1N2hCaTVsdUh3ZStJUWlFbXhMZGVDc3pEczhw?=
 =?utf-8?B?bUY4ZXJZVWxtSmlDb3FGcDF0Y2s3MHI2b053NDFQRVAxbTdoZ2xUa000UWgz?=
 =?utf-8?B?amtrOVZWVy9pQWI4VzUwa2lxU21JaGpDSjFZc3RrTVJQc2tCd2VzUEs1Z09S?=
 =?utf-8?B?aFZxZGNDYVp6M0cyWnk5NndEWnYzRmhMczBmaWorWHRpVzhmQklTU0Y0L3Fz?=
 =?utf-8?B?MG1IQ2FRMlBIN0NySS9zNnlpckR6L045em85Y1h2QnlubHo5ZWJHd09rS0Jj?=
 =?utf-8?B?SGg0YTROajZ4WUhiR25DM1dVWTBtWDBPTHg0ZDZ3WVpqWHR6c0oyckVEc3lU?=
 =?utf-8?B?U3QrckVkNFpNZUxGdW1pOVA0eXM1Mlhyd3BmSWk0dXY0ZGFObnJXaGF2QWRT?=
 =?utf-8?B?aG9nWkVicDRLZGhRakdKRnFrekRYTXNnMThLamRGUDIwZEhESHk5ZHNnR1hu?=
 =?utf-8?Q?2K6G5IIChl56wfI9osCkgdOy+1kSSK2WIgQ5/Wn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2313106-80c9-4944-b44a-08d929f742b6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 21:00:20.5643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iA3yCgYA690HHervwe9j66rBqMz65HpZAIS3kHonwoDnVIn6vuWd821aSfuqZH6gu/VBPetXyzo8LuaWFvVOmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5426
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
Cc: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-07 2:01 p.m., Shankar, Uma wrote:
> 
> 
>> -----Original Message-----
>> From: Harry Wentland <harry.wentland@amd.com>
>> Sent: Saturday, June 5, 2021 12:21 AM
>> To: Shankar, Uma <uma.shankar@intel.com>; intel-gfx@lists.freedesktop.org; dri-
>> devel@lists.freedesktop.org
>> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Cyr, Aric
>> <Aric.Cyr@amd.com>
>> Subject: Re: [PATCH 0/9] Enhance pipe color support for multi segmented luts
>>
>> On 2021-06-01 6:41 a.m., Uma Shankar wrote:
>>> Modern hardwares have multi segmented lut approach to prioritize the
>>> darker regions of the spectrum. This series introduces a new UAPI to
>>> define the lut ranges supported by the respective hardware.
>>>
>>> This also enables Pipe Color Management Support for Intel's XE_LPD hw.
>>> Enable Support for Pipe Degamma with the increased lut samples
>>> supported by hardware. This also adds support for newly introduced
>>> Logarithmic Gamma for XE_LPD. Also added the gamma readout support.
>>>
>>> The Logarithmic gamma implementation on XE_LPD is non linear and adds
>>> 25 segments with non linear lut samples in each segment. The
>>> expectation is userspace will create the luts as per this distribution
>>> and pass the final samples to driver to be programmed in hardware.
>>>
>>
>> Is this design targetting Intel XE_LPD HW in particular or is it intended to be generic?
>>
>> If this is intended to be generic I think it would benefit from a lot more
>> documentation. At this point it's difficult for me to see how to adapt this to AMD
>> HW. It would take me a while to be comfortable to make a call on whether we can
>> use it or not. And what about other vendors?
> 
> This is expected to be generic for all vendors.  XE_LPD is just a reference implementation.
> It's basically an extension of what we have for crtc color but designing the UAPI to have it
> more scalable for future hardware. The legacy hardware implementation which we have in
> crtc properties can easily fit in this new UAPI and this can help represent hardware better
> with more precision and scalability. Credits to Ville as to this is his idea of how we can represent
> hardware generically and advertise to userspace.
> 
> Sure, I will add more documentation to make this clearer. 
> 
>> I think we need to be cautious in directly exposing HW functionality through UAPI.
>> The CM parts of AMD HW seem to be changing in some way each generation and it
>> looks like the same is true for Intel. The trouble we have with adapting the old
>> gamma/degamma properties to modern HW is some indication to me that this
>> approach is somewhat problematic.
>>
> 
> The advantage of having flexibility in userspace is that we give access of hardware to
> userspace.It can then control things based on various usecases and not limited by just
> a subset of operations what we define (in the lack of such an implementation).
> 
>> It would be useful to understand and document the specific use-cases we want to
>> provide to userspace implementers with this functionality. Do we want to support
>> modern transfer functions such as PQ or HLG? If so, it might be beneficial to have an
>> API to explicitly specify that, and then use LUT tables in drivers that are optimized for
>> the implementing HW. Or is the use case tone mapping? If so, would a parametric
>> definition of tone mapping be easier to manage?
>>
> 
> Yes right, ideally this is what intend to achieve here. We cant have fixed tables for operations
> like Tone mapping as it will depend on mastering luminance values which can vary along with
> other attributes of metadata. Eventually this operation would be done by the gamma block
> (non linear luts), the values for which would be calculated and send by userspace. Thus making
> all this very generic. Also we can't do any color math in driver as it has lot of floating operations.
> 
> So here the trade-off is between having a UAPI where userspace controls hw, computes and sends
> values vs having just a fixed function operations with hard coded lut tables in driver.
> 
> Maybe we can have both the options in order to give flexibility to hardware vendors. We can
> document the usage of the UAPI we create which can help things co-exist. Userspace can query
> the supported properties and implement based on the properties exposed by the respective
> vendor driver implementation. 
> 
> My personal preference would be to go with generic option (expose hardware to userspace) which
> will make life easier for userspace developers. This will help use hardware for any color operation not
> just limited to linearization, CSC conversions and tone mapping. Also this is already done for crtc, so it just
> need to be extended to planes.
> 

Thanks for providing more background.

How would a driver handle this segmented LUT when the implementing HW
doesn't have 512 points, but uses more, or less, or differently
distributed points?

What about HW that doesn't support RAM LUTs and only supports ROMs?
Obviously such HW would likely not be able to do tone mapping in HW
but could still linearize the content.

Harry

>>> +-----+------------------------------+
>>> | x   |  2 pow x segment|No of Entries
>>> |     |  0              | 1          |
>>> | 0   |  1              | 1          |
>>> | 1   |  2              | 2          |
>>> | 2   |  4              | 2          |
>>> | 3   |  8              | 2          |
>>> | 4   |  16             | 2          |
>>> | 5   |  32             | 4          |
>>> | 6   |  64             | 4          |
>>> | 7   |  128            | 4          |
>>> | 8   |  256            | 8          |
>>> | 9   |  512            | 8          |
>>> | 10  |  1024           | 8          |
>>> | 11  |  2048           | 16         |
>>> | 12  |  4096           | 16         |
>>> | 13  |  8192           | 16         |
>>> | 14  |  16384          | 32         |
>>> | 15  |  32768          | 32         |
>>> | 16  |  65536          | 64         |
>>> | 17  |  131072         | 64         |
>>> | 18  |  262144         | 64         |
>>> | 19  |  524288         | 32         |
>>> | 20  |  1048576        | 32         |
>>> | 21  |  2097152        | 32         |
>>> | 22  |  4194304        | 32         |
>>> | 23  |  8388608        | 32         |
>>> | 24  |  16777216       | 1          |
>>> |     | Total Entries   | 511        |
>>>  -----+-----------------+------------+
>>>
>>> Credits: Special mention and credits to Ville Syrjala for coming up
>>> with a design for this feature and inputs. This series is based on his
>>> original design.
>>>
>>> Note: Userspace support for this new UAPI will be done on Chrome and
>>> plan is to get this supported on mutter as well. We will notify the
>>> list once we have that ready for review.
>>>
>>
>> Is this an RFC? If so it would be good to mark it as such.
> 
> Yes, sure will update the tag.
> 
> Thanks Harry for the feedback.
> 
> Regards,
> Uma Shankar
> 
>> Harry
>>
>>> Uma Shankar (9):
>>>   drm: Add gamma mode property
>>>   drm/i915/xelpd: Define color lut range structure
>>>   drm/i915/xelpd: Add support for Logarithmic gamma mode
>>>   drm/i915/xelpd: Attach gamma mode property
>>>   drm: Add Client Cap for advance gamma mode
>>>   drm/i915/xelpd: logarithmic gamma enabled only with advance gamma mode
>>>   drm/i915/xelpd: Enable Pipe Degamma
>>>   drm/i915/xelpd: Add Pipe Color Lut caps to platform config
>>>   drm/i915/xelpd: Enable XE_LPD Gamma Lut readout
>>>
>>>  drivers/gpu/drm/drm_atomic_uapi.c          |   8 +
>>>  drivers/gpu/drm/drm_color_mgmt.c           |  75 ++++
>>>  drivers/gpu/drm/drm_ioctl.c                |   5 +
>>>  drivers/gpu/drm/i915/display/intel_color.c | 454 ++++++++++++++++++++-
>>>  drivers/gpu/drm/i915/i915_pci.c            |   3 +-
>>>  drivers/gpu/drm/i915/i915_reg.h            |   7 +
>>>  include/drm/drm_atomic.h                   |   1 +
>>>  include/drm/drm_color_mgmt.h               |   8 +
>>>  include/drm/drm_crtc.h                     |  25 ++
>>>  include/drm/drm_file.h                     |   8 +
>>>  include/uapi/drm/drm.h                     |   8 +
>>>  include/uapi/drm/drm_mode.h                |  43 ++
>>>  12 files changed, 630 insertions(+), 15 deletions(-)
>>>
> 

