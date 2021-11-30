Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAD4463AA7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 16:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEAA6E027;
	Tue, 30 Nov 2021 15:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6966E425;
 Tue, 30 Nov 2021 15:54:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuMmtapOCSTQVJr1GTLXeg8L7Qpk55+yb5e8GI9Dmb1+lVdbr4+x1l7jSm8yfLkOrMpzBq3EX2M2YbWZL6TjA+Nj2T0EznEu1WuU16TlTWjBQc/4rNfaqu8kUpUx6j2u6XsZ1tNMxV5cwhfRI6FPF9qBjsLRSe6F1DS8on2CiDeQs5k7LDwYp+h4dmsddWZdV8WGlsFYQ43ahVudq7VVXUHc5u2oFPBNC7QrpooJUWbXfbGXzKmPJggqOES24y4z39JuOwp2Iq62kr0yTEt87NaZ7hEQgQx/kGGhp+lU1W4JpSkPOlQu5zvZ94eKf3c1wGksfSIsqbPsILAl1358hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+Ycfr5O11dO/ST1sWdKws/ONRZgb6Pevx6+zq8CKNs=;
 b=XkYp4Q4CFsuuXuTqMLxXdyId7UIRhbgSGZk8kdTY9jGiTQS/q/aEcH4bkKSmEpg7uC2Ck/85JoVkQsg3wQKtoMm7HdsjGQrs3NPqO6A14y/YSaqlWkIvMZWe6UeONxGTd4MJodPoDaeTw/hILZx9TN67s53E/5+bLBCMehTq/QS/6cW+h0UYp3NtmmWJXbrUG0tnnTa6fa83bLFZbJkAh6RMTiv8rgEbuJ/7HxWJt5ZvMtzynqhs6euInLxXdsObLEqNQotIwebds123nqRo8emCMJGnu5DVuHobcru31FGTJdBjTbWL3hTsfytSQy668dnv03Jgah7o+1jLp792Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+Ycfr5O11dO/ST1sWdKws/ONRZgb6Pevx6+zq8CKNs=;
 b=MwNlMMbh2VVuuuypk7NjVZHustQPtiZ/7hJUpWetm6LEd5L0907f4rs+DER2/0BPDASvA1zjU1uRDzR5Ec//y8mC525ebqRCcNSTqZDPMl2XZzKmv0/D3ENPz/hRISN1gT1UvEN2Iz+TeLM/0PJCwX7NwKwSGuLJqrPn7D5ron4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (2603:10b6:208:ab::22)
 by MN2PR12MB3520.namprd12.prod.outlook.com (2603:10b6:208:100::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Tue, 30 Nov
 2021 15:54:00 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3%6]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 15:54:00 +0000
Subject: Re: [PATCH 6/6] Documentation/gpu: Add DC glossary
To: ydirson@free.fr, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <1254252919.1503545635.1638218918877.JavaMail.root@zimbra39-e7>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <3bfcb46a-6d7c-fb11-4b78-d068a620baa3@amd.com>
Date: Tue, 30 Nov 2021 10:53:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1254252919.1503545635.1638218918877.JavaMail.root@zimbra39-e7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0162.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::17) To MN2PR12MB2896.namprd12.prod.outlook.com
 (2603:10b6:208:ab::22)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:56e0:6d60:d1f5:d5c:27fc:61c]
 (2607:fea8:56e0:6d60:d1f5:d5c:27fc:61c) by
 BL1PR13CA0162.namprd13.prod.outlook.com (2603:10b6:208:2bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.9 via Frontend
 Transport; Tue, 30 Nov 2021 15:53:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17800fc8-37fb-4b3b-9f56-08d9b4199feb
X-MS-TrafficTypeDiagnostic: MN2PR12MB3520:
X-Microsoft-Antispam-PRVS: <MN2PR12MB35209A6400CBF8F2EB8A2CEC98679@MN2PR12MB3520.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MRZ4EMHWMra/Wptw77DDy+sL4gxbwFlRU5AKH/Tv9IqkTelHEeBOIQnOt8qifIOQjmkJExkDdaThKBjXew0MHm2D064MHP0LX3suVB1tTWNkGMY6SRpxQsYYUWZjjaapj9wVS27sVzzJHzaxk/cGIJpeyBBBjDG1g2x3JLNWyHGsAqW/Mgl1GpKBMwSGgpwqOh5ZLmEtu9/jn/dVbmKFcl4n56i++y1RkAqx1YfQa5CSGdZmjX/aWiDxsP9vnzcwNsEe2aYIXMA8rmqnOnlfl4JRHjHvxvhXcDkdtcgeft6FuK2MXf3/jLd4IDswr2fpw3v/I0+iUBoWtnBlpV1G4FYlV51M3ycSu4+oyMg0Iil0Q5jU+WvLaYDjOpuSooTWBI2TtviwPmoHwBF6/sqvyugEYJaxo0UcB2msp6bGTcT8ba9+6l3RilvT5zRyY1LfJonIcXWMXs8kcpr4Q04dHFXRlSDq2sZeleIwd0ULVi+s4Ns/Ml7znRXN5MUUx0Xn6DrJbSb9F5x+ENnX0+Nb/eo0/7fQ7TBesTiEHeYC474MD+BE13o2LgvwlRJnh2cCgOAaoyZE3RqC3TC9Y6hm4oZAMFs28RSUt+MxEnRRgeljIzbsiVyPIVNuGhM0I/5Cp7W9+V0Vi+ZL4+/Wjto3biUWXFPPZ349vuJR+an7O29FjjQO7kxLbT0fcUrnm41fU2m9BMZhhVjEXFAljhjKraW61DaIEi1f4L+eCl6TyB6LAzESfcHJDtIJSQhDel/jBOtgIIXCA2lHQJAx2PtC2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2896.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(186003)(110136005)(5660300002)(66946007)(66476007)(66556008)(38100700002)(53546011)(2616005)(508600001)(6486002)(31686004)(7416002)(2906002)(36756003)(316002)(8936002)(8676002)(4001150100001)(31696002)(4326008)(6636002)(6666004)(43740500002)(45980500001)(15866825006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z251ZmJYYnNGTHFLS3VQMzJEQTltMThLOWJUWjkzSzlwYnJqWG8yZ3NxVUFX?=
 =?utf-8?B?a00yK3B2L2lQRkhKcFlRZGhuRkppOGUvNmUvamlrLzlReHFtUjl3b2NYVW94?=
 =?utf-8?B?K2V4UWprYUd4cFdJbEVhWktpS0Zrc3pMelN3akhwNG5NMHBmOWYwT0l2Qnky?=
 =?utf-8?B?bERKeDh0VDRJNkEvTWFzYWJ0ek81RHFFa0w0TWdSZ2hIU2tjRmFLYW8xRlU4?=
 =?utf-8?B?bnhBZnpHZjJodDYxbkkxRld2LzFyd1VVUFl2d21UeG5oUEdsNERLakhGcG00?=
 =?utf-8?B?ME5sS1VjaFZPOG1QVnlVMnhpRUdJL2JtMnE4VE1XSkpWc3JldkNuRXZmZlp4?=
 =?utf-8?B?SmFNRTJDRml6NkZEa3ZmdXlNaUltRVdLQWgzR0hQbFhEMzdYWW9TdWljc0J0?=
 =?utf-8?B?amNGYndjMUQvanlDTUhSV2N3OUhBOHJIMlo5T25yWFdQclA5SmNFaXBsYzBW?=
 =?utf-8?B?eWVHZmdDMUlTVW9BKzJ1U0s5N0M4YlFRN3BoUnJUL1pCbkdBZDZrVlVYRzZ4?=
 =?utf-8?B?SXZyNGlmOFVJcGhocEI1c1k4NGZQRGNVY1RxOXJKcE1hdDBTVzBEQzFZcGJi?=
 =?utf-8?B?VlNqL1FVUFBoUnFqb3hxRHIyRklKMGZEckRGZU1zUHpMVi9DTlJBTHBlQkdp?=
 =?utf-8?B?OHZYOUJjWU5pVEt0THdHM0Q4RzhmL1RTUUpnamhzcDlzK0VoUWlIbEdmd3Y0?=
 =?utf-8?B?YVluWnI5VHZsTWpraTVvbTNYR2o2R3VxVDVrS3FaSXJhYlNkZG8vckRNbHdR?=
 =?utf-8?B?K2kvYXczV1hIUGdZazB6Ulg3OFBDa2pSU0dtNUQ2QkZ2RXV5R0xOSDNiMTRY?=
 =?utf-8?B?L1Z0cHZaRUtLWVM5V3pLZ2lUNVl2VnduOC8rRUorSUswTU9kRG5tNm9kYTN3?=
 =?utf-8?B?Z2hXQUJnanZsaXMxbDRJQ2k5eUNXdjhsMnNZbkF3QmdBNjY3R0hmMTV2aVpL?=
 =?utf-8?B?SFBVYWNpV3EwZ00zQldHUlgzUElZbE45TGlNRHJ4QWI5aXZGeUc0ZUpYT0l0?=
 =?utf-8?B?UlVhSDdNRW5mclNGNXpUYlZBUzdia01vTlBtaUFKWFBtRXRyYkozYlowaXJH?=
 =?utf-8?B?NlhmaU9MVm9kVU9udTFFb2JxM1VEYVE4VTFzV2UrWTV5T005R1d3RWVMTzBh?=
 =?utf-8?B?c0VNWUdDT0sxd252c3lTczA5REpWTjIvVkwzQ3BIY1BVcm5jYnlKNnlaR1ZZ?=
 =?utf-8?B?Y0p1aXp0clhDeXorWnRRM3RtVTBTVmVSM29zclZCKzZqbEFVclhEU3ZJU0dI?=
 =?utf-8?B?bURTUlBOTStHTVhNQk9CNzMvT2d4OFVPcmJHQ2hXcUZiRXQ3QUFCTThFV1FG?=
 =?utf-8?B?Qk53cXA4YmFJekNVWjFZM3duWVYvVTVZWWUwSFRpTXN5MURBUVhSUlFzZWRQ?=
 =?utf-8?B?UkxzOUIwL21uSSs5VEt3THBlcS8vZ1dLWlVCQlVpckJ2bEE1OUMwSzBRZC9x?=
 =?utf-8?B?MGV1S05pY2c4TjZkbHNCV2k4MDhCN1IxYzRCaTREci9RQmtGeTJKQmJtVk9W?=
 =?utf-8?B?S1lqaU5iS0RmamZmYWdhUnpyRkpGdmFjcGVLUzBVYW1Eck8yWGl5RC9MYnQx?=
 =?utf-8?B?dTZzSEVMTjI2T0Q3UElJNm5WUzNJZFZGTG9pY0lPanh3Z1hUeFZUYlREbTVw?=
 =?utf-8?B?OUR3RWt5SE5nbnpEOTFkd1ZsWWxyMENmVzV4QjIrUlJURmNkZS9QVWltOWww?=
 =?utf-8?B?VUdQVFJ3VFJONTFsb2IrOExGY0xvWXpGS0labUUxOUR5cGpTdnJqVUY4K3Jp?=
 =?utf-8?B?dTVWS2ZkbHNsN01oUVZLWmhubFJRU0JnRm5OcHVFZG8vZ3VyL2tyVlJUQjM5?=
 =?utf-8?B?VnQ0SE1QRlJFcmZmOEFpM2NBcWF1UHJMenUycUQ5NEZDaGszT1dmZUt0cHR1?=
 =?utf-8?B?SUNnMmE5bFR4YS9yOXRBalVQR2s0cU9qcEVmcHZ0Ty9jemovRDVQdDRPamtE?=
 =?utf-8?B?WG9rS1F3ZWtTeFY5c2dScG5aN3Q0U2hPaUwxdkpTWjJjZUFYYU9lRVZVcG5H?=
 =?utf-8?B?cENlT3BTVzJsYWpHMGl1cmpucGc3Z3NmMXptSFVyQUlWV3dUVVI1NkdJcllB?=
 =?utf-8?B?YUo5YnpFWGI1SE9BN1dhdGFnNms5MUxMY09GZ3VRVER0ZDRBZ1NiQ25mckJ0?=
 =?utf-8?B?WEJzaC91WksyNXRBb1VFTW5YY0lrZER1M29wMzJnSlNhN1doQkpsTzBua1lF?=
 =?utf-8?B?MkdHK3F5NDFqaHN3aDF2cDZ1SkdkaHZidm9pSlpmSUtyVzVkQUVleUZOLzIx?=
 =?utf-8?Q?At++fZFHh5luZ02YrfcH3s3GY3OAqVoDZ0rbPqyszQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17800fc8-37fb-4b3b-9f56-08d9b4199feb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2896.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 15:54:00.1945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+SAgJuZisW88610HFgjQEuW2LnL4k3DlNlek0pj2EhgrgmE89FF4eaqRJINrT1h0mY06f7ymztlzX4asgfSyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3520
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mark Yacoub <markyacoub@chromium.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Roman Li <roman.li@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Roman Gilg <subdiff@gmail.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 nicholas choi <nicholas.choi@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-11-29 3:48 p.m., ydirson@free.fr wrote:
> Hi Rodrigo,
> 
> That will really be helpful!
> 
> I know drawing the line is a difficult problem (and can even make things
> harder when searching), but maybe it would make sense to keep generic
> acronyms not specific to amdgpu in a separate list.  I bet a number of
> them would be useful in the scope of other drm drivers (e.g. CRTC, DCC,
> MST), and some are not restricted to the drm subsystem at all (e.g. FEC,
> LUT), but still have value as not necessarily easy to look up.
> 
> Maybe "DC glossary" should just be "Glossary", since quite some entries
> help to read adm/amdgpu/ too.  Which brings me to the result of my recent
> searches as suggested entries:
> 
>   KIQ (Kernel Interface Queue), MQD (memory queue descriptor), HQD (hardware
>   queue descriptor), EOP (still no clue :)
> 
> Maybe some more specific ones just to be spelled out in clear where they
> are used ?  KCQ (compute queue?), KGQ (gfx queue?)
> 
> More suggestions inlined.
> 
> Best regards,
> 

Hi all,

I'll address all the highlighted problems in the V2. Thanks a lot for 
all the feedback.

Yann,
For the generic acronyms, how about keeping it in this patch for now? 
After it gets merged, I can prepare a new documentation patch that 
creates a glossary for DRM where I move the generic acronyms to the DRM 
documentation. I prefer this approach to keep the improvement small and 
manageable.

Best Regards
Siqueira
