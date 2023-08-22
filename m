Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83291783D57
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 11:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0079810E2EA;
	Tue, 22 Aug 2023 09:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A596D10E1CA;
 Tue, 22 Aug 2023 09:51:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grQowNtdQT6UI71j0qVxOVFe5gSr4nH+D6EcXXvrvgfXXF39hEbFhz1cYKGJNUHYwcBfx9fW53/hyk4bhnjnMlwlG6K8/8e/b/jo0vTz2/KxtpP7d4TQPZZiU2NM1qAQqkgxYdVC2Hgg99N4ImEQ+7JEtE4CT9WYZQTbqZHleHyQ0JjJCwo/esROTSa5ntl++mXvlb/EtzXoFFebeZ1+vnuOUhUSc7NaEOywzvhRO+YNqr+sjh44+MkgPzakGUOcRNY/uPMiZOeZW9QE/xJsefWtuyiJTYg/kESgmxPc8rMdbN3ZF59QkdpmsWtBK5LIZT7sNeCAMYSYQmHUyYzzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmO8dKs7nR9NanTG1GYuqp2zU3Sy6T6wEpGoFf0ydgc=;
 b=h1eXO9fZgtX3zJJb/PQomRGeZbViEC9raNOxTZ22LyMIJ76kjAGM5Y72W0GowxlXvfC/oPhvrkSIAM/A753tYBvLvjRLHzUkOiVDpUeq11Cb1zVfrL0dEsjQKgNEL4zBjXENFrrpm0P2fFHl3N5+l3cZzoHQfbZzWmgGEh3ePR5HIxqAutARiQ8FF1Xq2OML+jDaxxeU1vMyyFWf+8TRVa+FZeon8p5hbiDdNS3jCxcwYVk+I693rApxafe5Ne0Yhhk+nEwWeLdj84IAqY9FVPgqnbN2rnMHZaXo1h3c7AWy/8JB7piePsVJH1r+iU1CKsy1SrB4Q73XT+RswC+/OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmO8dKs7nR9NanTG1GYuqp2zU3Sy6T6wEpGoFf0ydgc=;
 b=4k3IPu/YIaVvfKxDU0RhuGh6nvnaB//wmwjYJqZIku+nqBBMbET23ssUGAu7ihwS2rxIJYOcNK1gf+SEtVCQAj2ENJJkZ0A9Orl6ucEKpfnpUj77tjW2mY3U02WlCzpcAMgqFHsuTvCh99NI5CTWFoyUv3GNwlUJhQuonx0qOp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB5784.namprd12.prod.outlook.com (2603:10b6:510:1d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 09:51:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 09:51:18 +0000
Content-Type: multipart/alternative;
 boundary="------------vdZ6absWZb0iA9LTneVKfUT2"
Message-ID: <2498b1a3-6597-c112-82cd-58b44ca188f0@amd.com>
Date: Tue, 22 Aug 2023 11:51:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Content-Language: en-US
To: Faith Ekstrand <faith@gfxstrand.net>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
 <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
 <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
 <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
 <ef4d2c78-6927-3d3b-7aac-27d013af7ea6@amd.com>
 <a80be2c1-132e-5ee1-4278-47655916494a@redhat.com>
 <0d5af79a-ba3a-d4be-938f-81627db65b50@amd.com>
 <a3937c17-eaa5-e0e9-e0ac-1610e0652982@redhat.com>
 <1820cb54-5f1e-d2e6-38fa-7161465ed061@amd.com>
 <9072642e-f4f6-4ff1-e11f-9bda8730750c@redhat.com>
 <85107169-8a24-441f-6631-d99472d810f0@amd.com>
 <CAOFGe94JC8V2GS5L2iCaD9=X-sbbcvrvijck8ivieko=LGBSbg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAOFGe94JC8V2GS5L2iCaD9=X-sbbcvrvijck8ivieko=LGBSbg@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0239.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf2c12e-48b1-43f0-5972-08dba2f5551a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +CW0rBVOaw+KqCdCZLEm80yT/8OMegNgSgu4lVc0IDFXOChwFbcDSYTD/MeFh1nLuaqeqDOF3sMkL42ZzKwieEznbRr5yQmVoUk/mMxk0wVowCTwQY47SomgbirOKZb4yND28ggQPJ6CY661mTa7hb0sSKB6IMq5o+lMgNTxlf9rKQzt83dp8UsH9nPDdJzzKP44m8bmhWhBtH9eTZG8UvOFrb583Ez2znZC4LJ/mchJqnR7PGRG5MEF575WZtH3kKf5KYJvWOTL0b9/3TXqxVMU3DjzxNi/PGBkPdr46And1zLp56/2EDTZnh+OHB2KF9vhmLKyMT2DRfYQyf1U6hhZpbY137Bbedcv6XZW9enLTeZH9z9WWqSmJ2lr34e6LgzgbH9x+mhfTL8RND91upJExkLKyU08xgWqtJkqBpXKSHh4d1gSdH1icnGPKUJU77znNbPennuIhqCc9KlBL7LhoPv0qxhpikRejzPptZ+XH4yV0axKw7nsVHwWlleuJLqxvRiuQmurqPhTEX6SYGaWI60Rl2bQBXx7+oJqozDiPNAqKNTzM9GpM/ibfrS18CnIRrakK56J+JDlIqcnt54oyr31gFBXpFphxSlDhG43IlZP1f+0hGsOHN1qoBP22cbYj3p8Xh9HnI2Am6c9lQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199024)(1800799009)(186009)(2906002)(66574015)(7416002)(53546011)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(26005)(33964004)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(4326008)(316002)(6512007)(66946007)(6916009)(54906003)(66556008)(66476007)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXhFWU5mRzk0Zm9GM3lLNjVmZDJPV1BOcGdGcXMzYmFQUnVJOFpWdVd1eE5l?=
 =?utf-8?B?NGViZkRHdXgvUGNRNWVQK1AvOWJQVEt6V0t4OG1SYnVSUENPOEtPVzhHc3lv?=
 =?utf-8?B?VnJ2eG45VzhsSzJiQUxUc0dnMXBqS3RsaGJWeFNqcHBDdC9vNXZtdS8zV1M5?=
 =?utf-8?B?YXVDU241TnNWU1VVMy9Iem1wMm13SEJ5Y0lLaTRhM2E0Mkw1N0F5ZEZRc3pv?=
 =?utf-8?B?RGVFV1IrS1lxaW1XeW1sNGtkcXZNOUdYanQ2Rk1MSlFCNFAwNS96ZE5EbTFS?=
 =?utf-8?B?QWpWNGdLbmY3SFhNZHFVc2kxc2M5eStPWTFma2x0S3Y1c09LdC9PcEFkd29K?=
 =?utf-8?B?aWJhZWhZSU80cXU2cGxTclR0L3hrNmZVRjNjT3dxVzkyMEFPQmRpbmZoR0pC?=
 =?utf-8?B?ZHRoUVRETEl2RzR4cmFha1pVdUx1SmhPc0FPZ1pzdStxZmhNUXB3bTJUMzQy?=
 =?utf-8?B?bUVRR0J1MEdvd1NWSVhlaXpzWUwzNVpGQTNXT0g3bkZwSW1ldGowY0VZZzBh?=
 =?utf-8?B?NW14UDRBSUwxaEtqUFMrK0UzcXRxQVVGOEdoM3oyUWNPZGc2SWlYSkQ3V1dy?=
 =?utf-8?B?RmJrQmdjQ2M5OFNkbHBVeENxT2FhVUNHTlFwWk53eENyaEk3czgzR2tKeEs4?=
 =?utf-8?B?UDR0Y2tXb3EvdTAyRmVNb0J2Z0VWZnJpV1VMd3piUTNSbnE2WGdtdkdFTDVw?=
 =?utf-8?B?bjNGSHRMTG9WRmxnc21xSHdrb0trdWRGQms5YmhHWE9oODVyblV4azg0QlB3?=
 =?utf-8?B?WWZuSFI4MkswcVFPM0ZUaEdRdTFFWDFaaUI0Ujc5aUJjMHUzUTJSdDN6dVI5?=
 =?utf-8?B?eGNnWnU0OEhKYjVBSm5pZHJ0VVowZC9lRFN6ZFVJYnhkR3JHS2ZBYUJMSmpJ?=
 =?utf-8?B?TEFaYjBoVWtLaC9YaUFkYTFNRC9BYlcwZlNRMmR1VVFDYVE3R3NidWtUNG1w?=
 =?utf-8?B?QjlQUVpocTNPQ3Z5eUtscURscGJMVDNlOThVVnpDWmVUazlBblFud2hKcmgy?=
 =?utf-8?B?YlZYU2FBQUxjc1o1cHMyZWFISjl2RWI4SVpvcG5nSml2RW9jVmRSd1pmdjhH?=
 =?utf-8?B?SXRnS0phbGRZNkt5NDgwdTJ3OE1neGhoUUszOU1QZG9keGc4K3RoZXM4TE9a?=
 =?utf-8?B?bGFYM3V5YUVPKzZ5OTdvVmdBalFJKzUvVXhKZ01UZFF1ZkFacUVEdDk4Qk52?=
 =?utf-8?B?OGc1SnFpb2R5NUl6VzNEYmRuMHhWdmRlMm1BamhDcWIrcGJZU2lDRVpxejR3?=
 =?utf-8?B?eWljMU04ZW82ZVhGUFVFQm9XajY2eFdQZEx3dmNsOWc0Y3lESnpkNThneWtE?=
 =?utf-8?B?N0pna3N6SUZab3J2NEoxNkhrU3hhbzMxQU83bWZaTDRuWEJ1cHNqcHdpVnZl?=
 =?utf-8?B?S25wd1NFY3ZLUzNycUZTN0pETjc1b25XcUFGMEJROGZQOXN5NFBlTHZKVEhh?=
 =?utf-8?B?cGxGRm1hOHpTeVkyWGNObGt1ZWNsYWdsdWZ0ZTJJS1lYY2lGNS9FUlVJTzVu?=
 =?utf-8?B?aTFCUXVzWWlLaUtuWjg5bmdUUmhqYmRMVUZGRDVGQzZZc1FqcHFCaU1Bb2pH?=
 =?utf-8?B?NHdsWmI3S0pVOTRYQ0ZnQW4wVGJUVGM5eUJqcEsrRE1aYmtCTGN6bnl6d0kv?=
 =?utf-8?B?OUp2V3kzaHdFK3hpVE5NRTdUKzA2ZWU0UzhPY2V3bTFMcXJTRCttTExGZVJ3?=
 =?utf-8?B?ZEQ1L2lJcDZRSlhSTHFRZWVJajJjbTlSV2RpaU1vZnprdUhDdVhFSHUwd2dp?=
 =?utf-8?B?MnZyOHVGOC9vSmoxQ2E1SWpXMU4zbmFQRVRTZ0hUUlFHdWZqUW5VZ1RmcHVV?=
 =?utf-8?B?UFdYRGtxd0w0bEFHQnBnQlFzNGZJTkxLUXBvbStGMGc3NnR6N01YcVZwbHQx?=
 =?utf-8?B?WTFnd3U1cUNZcmlDWm1yMTBXdzh2eStkUkFwOG52SkRWTnAwRERuSHp3RU5C?=
 =?utf-8?B?OGg4OEtmdG5qUTZGbkYwcFJYZ0VaT0NJSmtxRlcveU5qMllQT3p0TDZ3UFdM?=
 =?utf-8?B?R2hrOGxtVXJ6ZHFJSXVnMUxCazZkV1dHVlNIUkd6ZUpFZFJIT1JNV3hNT3JU?=
 =?utf-8?B?cTZ0eTJiV3VZUXc4ODI5bHJqV3ZHblcwSk5iZXlKZGdJS0VmZm1HOGU5ckh6?=
 =?utf-8?Q?a8C4U/+TsvgLku4hBJynY4hmQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf2c12e-48b1-43f0-5972-08dba2f5551a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 09:51:18.2735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12Rr+1V8pbL0pxOxzjxXDKv+sCAkabkr51dMkUQsDGYD7e8X5aPCtoVddPDXLQDN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5784
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
Cc: Matthew Brost <matthew.brost@intel.com>, robdclark@chromium.org,
 sarah.walker@imgtec.com, thomas.hellstrom@linux.intel.com,
 ketil.johnsen@arm.com, lina@asahilina.net, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 Danilo Krummrich <dakr@redhat.com>, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------vdZ6absWZb0iA9LTneVKfUT2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 21.08.23 um 21:46 schrieb Faith Ekstrand:
> On Mon, Aug 21, 2023 at 1:13 PM Christian König 
> <christian.koenig@amd.com> wrote:
>
>     [SNIP]
>     So as long as nobody from userspace comes and says we absolutely
>     need to
>     optimize this use case I would rather not do it.
>
>
> This is a place where nouveau's needs are legitimately different from 
> AMD or Intel, I think.  NVIDIA's command streamer model is very 
> different from AMD and Intel.  On AMD and Intel, each EXEC turns into 
> a single small packet (on the order of 16B) which kicks off a command 
> buffer.  There may be a bit of cache management or something around it 
> but that's it.  From there, it's userspace's job to make one command 
> buffer chain to another until it's finally done and then do a 
> "return", whatever that looks like.
>
> NVIDIA's model is much more static.  Each packet in the HW/FW ring is 
> an address and a size and that much data is processed and then it 
> grabs the next packet and processes. The result is that, if we use 
> multiple buffers of commands, there's no way to chain them together.  
> We just have to pass the whole list of buffers to the kernel.

So far that is actually completely identical to what AMD has.

> A single EXEC ioctl / job may have 500 such addr+size packets 
> depending on how big the command buffer is.

And that is what I don't understand. Why would you need 100dreds of such 
addr+size packets?

This is basically identical to what AMD has (well on newer hw there is 
an extension in the CP packets to JUMP/CALL subsequent IBs, but this 
isn't widely used as far as I know).

Previously the limit was something like 4 which we extended to because 
Bas came up with similar requirements for the AMD side from RADV.

But essentially those approaches with 100dreds of IBs doesn't sound like 
a good idea to me.

> It gets worse on pre-Turing hardware where we have to split the batch 
> for every single DrawIndirect or DispatchIndirect.
>
> Lest you think NVIDIA is just crazy here, it's a perfectly reasonable 
> model if you assume that userspace is feeding the firmware.  When 
> that's happening, you just have a userspace thread that sits there and 
> feeds the ringbuffer with whatever is next and you can marshal as much 
> data through as you want. Sure, it'd be nice to have a 2nd level batch 
> thing that gets launched from the FW ring and has all the individual 
> launch commands but it's not at all necessary.
>
> What does that mean from a gpu_scheduler PoV? Basically, it means a 
> variable packet size.
>
> What does this mean for implementation? IDK.  One option would be to 
> teach the scheduler about actual job sizes. Another would be to 
> virtualize it and have another layer underneath the scheduler that 
> does the actual feeding of the ring. Another would be to decrease the 
> job size somewhat and then have the front-end submit as many jobs as 
> it needs to service userspace and only put the out-fences on the last 
> job. All the options kinda suck.

Yeah, agree. The job size Danilo suggested is still the least painful.

Christian.

>
> ~Faith

--------------vdZ6absWZb0iA9LTneVKfUT2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 21.08.23 um 21:46 schrieb Faith Ekstrand:<br>
    <blockquote type="cite" cite="mid:CAOFGe94JC8V2GS5L2iCaD9=X-sbbcvrvijck8ivieko=LGBSbg@mail.gmail.com">
      
      <div dir="ltr">
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Mon, Aug 21, 2023 at
            1:13 PM Christian König &lt;<a href="mailto:christian.koenig@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">[SNIP]<br>
            So as long as nobody from userspace comes and says we
            absolutely need to <br>
            optimize this use case I would rather not do it.<br>
          </blockquote>
          <div><br>
          </div>
          <div>This is a place where nouveau's needs are legitimately
            different from AMD or Intel, I think.&nbsp; NVIDIA's command
            streamer model is very different from AMD and Intel.&nbsp; On AMD
            and Intel, each EXEC turns into a single small packet (on
            the order of 16B) which kicks off a command buffer.&nbsp; There
            may be a bit of cache management or something around it but
            that's it.&nbsp; From there, it's userspace's job to make one
            command buffer chain to another until it's finally done and
            then do a &quot;return&quot;, whatever that looks like.&nbsp;</div>
          <div><br>
          </div>
          <div>NVIDIA's model is much more static.&nbsp; Each packet in the
            HW/FW ring is an address and a size and that much data is
            processed and then it grabs the next packet and processes.
            The result is that, if we use multiple buffers of commands,
            there's no way to chain them together.&nbsp; We just have to pass
            the whole list of buffers to the kernel.</div>
        </div>
      </div>
    </blockquote>
    <br>
    So far that is actually completely identical to what AMD has.<br>
    <br>
    <blockquote type="cite" cite="mid:CAOFGe94JC8V2GS5L2iCaD9=X-sbbcvrvijck8ivieko=LGBSbg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>A single EXEC ioctl / job may have 500 such addr+size
            packets depending on how big the command buffer is.</div>
        </div>
      </div>
    </blockquote>
    <br>
    And that is what I don't understand. Why would you need 100dreds of
    such addr+size packets?<br>
    <br>
    This is basically identical to what AMD has (well on newer hw there
    is an extension in the CP packets to JUMP/CALL subsequent IBs, but
    this isn't widely used as far as I know).<br>
    <br>
    Previously the limit was something like 4 which we extended to
    because Bas came up with similar requirements for the AMD side from
    RADV.<br>
    <br>
    But essentially those approaches with 100dreds of IBs doesn't sound
    like a good idea to me.<br>
    <br>
    <blockquote type="cite" cite="mid:CAOFGe94JC8V2GS5L2iCaD9=X-sbbcvrvijck8ivieko=LGBSbg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>It gets worse on pre-Turing hardware where we have to
            split the batch for every single DrawIndirect or
            DispatchIndirect.</div>
          <div><br>
          </div>
          <div>Lest you think NVIDIA is just crazy here, it's a
            perfectly reasonable model if you assume that userspace is
            feeding the firmware.&nbsp; When that's happening, you just have
            a userspace thread that sits there and feeds the ringbuffer
            with whatever is next and you can marshal as much data
            through as you want. Sure, it'd be nice to have a 2nd level
            batch thing that gets launched from the FW ring and has all
            the individual launch commands but it's not at all
            necessary.</div>
          <div><br>
          </div>
          <div>What does that mean from a gpu_scheduler PoV? Basically,
            it means a variable packet size.<br>
          </div>
          <div><br>
          </div>
          <div>What does this mean for implementation? IDK.&nbsp; One option
            would be to teach the scheduler about actual job sizes.
            Another would be to virtualize it and have another layer
            underneath the scheduler that does the actual feeding of the
            ring. Another would be to decrease the job size somewhat and
            then have the front-end submit as many jobs as it needs to
            service userspace and only put the out-fences on the last
            job. All the options kinda suck.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Yeah, agree. The job size Danilo suggested is still the least
    painful.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:CAOFGe94JC8V2GS5L2iCaD9=X-sbbcvrvijck8ivieko=LGBSbg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>~Faith<br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------vdZ6absWZb0iA9LTneVKfUT2--
