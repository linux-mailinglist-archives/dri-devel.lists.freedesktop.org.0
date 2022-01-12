Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2458048C74B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 16:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471BB10ED17;
	Wed, 12 Jan 2022 15:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67CF10ED3B;
 Wed, 12 Jan 2022 15:37:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNT8XW9j5Biv+uij7GSCOBbp5smcODWutVje/xsIqwTlTbM/HR2H/45eAey0X2n9zD09rYWODVFxxzQarZ+OzTM2bFb2MUVvdvCBGCJ1nDvLHeVVqL9fKRiJD66l6hmEXO8ANkhKQ8krI40/od1TLmP8NZES5TV/TRswRVOXxrvGm4bvChefkL3Mkf6j0v0ElYis0uAXKhe4Ox+Pa4vAEdiL6Ki26PrHPmumYVDkOh505GhfGXBg1K1Kj2fcMCuQ4PtwfUVhPB0Eu5xbIIGPxFTaBeNi26QSczI0EpiI9O8N3QgwYsAprzyv+UD/AmMeA/+eX7Exfm+iSfTNy3YZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDj/xRoFADL+7xyX54XAMWJTyWwqBkVJ8lv7XUMQ7DI=;
 b=iOUibV9e1Qshicy+5WL1jaVlCL3m2+VpnHpHIZTISe9vF+j+Y1t6kqNCJxyzj+hXloOWJdysPjcWklo03d2pIiQDTnc+uHRdpCbRKJq5ScoLBtUKYgNiJquYB2L2SBjv7DPoGPIQgmqbAFWz9t02i0SQd1W761LxaRBEFC/AnxiKUIeaSXdAUvW5PyUjDVEuF2PeperfeOkgnxcDF0ftgjOr1j+Jp9a4EZgjWgslAEZZP9IXL4XATcdsUboQj+g+AhRm+a1SFJZmEIzQOL4/MOgcUiR3xUm4q1ufyV1aYgtXWyAaA6C1B5VERyRWC4suhQEIYctevwCFszvCY6v4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDj/xRoFADL+7xyX54XAMWJTyWwqBkVJ8lv7XUMQ7DI=;
 b=MkQeHXGvSzRjRIJroxEEtXFWzG3C1Sb4VE0jCPYRXnhx9cHKPTvr91zbaPHZLm9PlNTdMWRygyk7zy0O1p6SkLMSQMQJ+/Cki6qLAShBrmzDQ1Mm5yRh6j5qsXyWioLHAuPLIg9/2hCeLCq69KCEwOqyhs5NT25+6vKPY/omV74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL1PR12MB5256.namprd12.prod.outlook.com (2603:10b6:208:319::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Wed, 12 Jan
 2022 15:36:59 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52%9]) with mapi id 15.20.4888.010; Wed, 12 Jan 2022
 15:36:58 +0000
Message-ID: <4dace73c-c37b-2eab-c9f3-49349ef7c0ee@amd.com>
Date: Wed, 12 Jan 2022 10:36:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [git pull] drm for 5.17-rc1 (pre-merge window pull)
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <CAPM=9tz=_hRpQV1V3M-=KmVVEbr1K166qeb-ne64PHk9Sn-ozg@mail.gmail.com>
 <CAHk-=wg9hDde_L3bK9tAfdJ4N=TJJ+SjO3ZDONqH5=bVoy_Mzg@mail.gmail.com>
 <CAKMK7uEag=v-g6ygHPcT-uQJJx+5KOh2ZRzC2QtM-MCjjW67TA@mail.gmail.com>
 <CADnq5_P9n39RQ5+Nm8O=YKXXvXh1CEzwC2fOEzEJuS2zQLUWEw@mail.gmail.com>
 <CAHk-=wgDGcaRxUwRCR6p-rxDVO78Yj4YyM6ZsPRGiT2JOCoQ6A@mail.gmail.com>
 <CADnq5_OYO7kq+9DBnDvbSfpouFvdLB0LPSL6+f1ZPRBsV=qEqA@mail.gmail.com>
 <CAHk-=wiCCRG9Lwzr+Cur=K1V2GJ9ab_ket7EnG4RZhJ8jJM7xQ@mail.gmail.com>
 <CAHk-=wi8b-YKHeNfwyYHMcgR2vJh4xpSZ0qjkv8E8Y9V8Sv2Tg@mail.gmail.com>
 <CAHk-=whnWnB9yjVaqWNKjavSJxDOEbTAPwef=O7qjL8nKZgV6A@mail.gmail.com>
 <CAHk-=whSAYiO_TkKut6XckdQigFj39ft1Kcs2qJe5niHWPGdwg@mail.gmail.com>
 <CADnq5_OZR9Ft=WVVbpM_WUpFZurni4yVxGPpa4nDkhupmod_ag@mail.gmail.com>
 <6490ec74-7de2-c3a3-d852-31b8594110d8@amd.com>
 <CAHk-=whZW+Cy++vucKQd6Lrj7B1bhd1-pKkgV8xxPJr35Dh2UA@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CAHk-=whZW+Cy++vucKQd6Lrj7B1bhd1-pKkgV8xxPJr35Dh2UA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83bb1893-3491-45a6-c405-08d9d5e15ed6
X-MS-TrafficTypeDiagnostic: BL1PR12MB5256:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB525671AF0D0926C1BE38B09A8C529@BL1PR12MB5256.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gxAiKtoer8+WQCMoR5LA6/N6YaM92sSdy2KLqBlN9u+ccZsRNFDUr7fItupkkABu7yNCsflDOAFMxS8OwvD9tL0DPldIh1vm02LXU9E1d3xktJxVQH5fkK++E4JsoWuXTiLGTLPo6PBmuoIH68MzgBzDeJ3aK4MOPE8sG580l/hhn6YIeii3z7mYs1/YqAY6IKbZSy10YSozOHuaQMw1msOftJsrq9rD37sk3LThnEXvKpcoxuwEJBDvo8jpQ5Ifr29xtKCu9xLqVq1aRCW2Ec0fuj7OkXbsjmScnGJzJKQnxuv4uQcW8lhFfM7TNzyh7Y+1XsOgrjnN30eCEO26qyLMbge0ADbAiDa+gtNqi9cr++nq38XRxIv+35ekcahI8wstSUdZH4zYGSh4ego4ICO9oRWD0RtOdloQriJNE0OZ73vgpDYw3LaU3GA0Kzu2veRYpJFNIZueE8NpbeW7wLirApLGdWOlWwh/ucoaLBmDqTGJKIia2spuIh5T/CONd1BlDb3HxFaR3weuUpVq7j6zmJvCHPv/tS7vUoALIRSKvHW+ylwD0DqrhOvvkfWyMaLCyuUCweFxETRRkd/pyMV04CueZsygHDfBlsa8mKl3L1xX6hwQ2QGZF+gh0rKpKlSLbHWsSb3zlUuLdnK55XHUZMUlTnsJXfItCh+U/YH0LwbYSghzDJex7idLHNWQKslHbP8EnuH+rYA6BVjpD59+wAUt/KQafH75FbrYxzZC1Hwn6lwSSVqnwI7sm1dh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(5660300002)(6512007)(83380400001)(6916009)(53546011)(6506007)(508600001)(31686004)(66946007)(38100700002)(2906002)(86362001)(4744005)(8936002)(6486002)(36756003)(66476007)(66556008)(6666004)(186003)(31696002)(316002)(4326008)(2616005)(26005)(54906003)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L281azMrN2FPMzk5d0NhQXdwdHRWOWloYU5LM29ldWErMjg4WDFBa1FFb1Ra?=
 =?utf-8?B?TllvRGQvNzcrN3YvalptRVpUMmlHVTIremFsYzF3d2ZRNlUzY1BDYXByU3FH?=
 =?utf-8?B?T3JLSGxaMEpxRFRlOE9yekw1bzJUZGRGRjA2Z3hScGxNTW5ValNZQ2VlSTBK?=
 =?utf-8?B?YUlITmZBRGZVU05wc2FKNXlrM2QyZXNxZnRScU9FcWhPV3h4OGM2dHdFMlNh?=
 =?utf-8?B?UC9SdE9la1MwdnBnS3ltdkhyWkVXSE00YStDdWpuK3NaRE1LaUlSZzBSM2pZ?=
 =?utf-8?B?a3NsRW53N2IrUUgwMzlsTDZXOUs4R1B5N3BEcEo4bkhyK1ZVT1FuUDA1Mklj?=
 =?utf-8?B?R21xL0hQSzcwcTRQWG5BZVJyN3F4aDdRVExqSXN1aFpTRmhTU2dhRlVHcjNm?=
 =?utf-8?B?Z0NaeXFEbzcvZjlCNHoySVFwL0RRT0V5YnNVRTZCQzR1MThJY0phVzhDbVNY?=
 =?utf-8?B?NjhyeTdPMFE0WnVIemFQbGdYZVlKZ1E3S2VTY3QyRWdVT05TdEtGTktTb1ll?=
 =?utf-8?B?bmlyK1c2NlY2bThqUDdCcU9WaEwzWTQxL05KRU1XNzRsemxpbnhrb0RpVUcy?=
 =?utf-8?B?MGVUVTVCNkFub3VNczJxN21OQUtsdkZZZSt6N0g3STNibTBJZGxvczd6eWhj?=
 =?utf-8?B?MUQvUktUaTJjT0JuRmd3RHNPVjloN2M0L1J1NjVTUk5LTUZtS1QxTXdJZFFV?=
 =?utf-8?B?TUhYN3h4Sm02NytReXl2QlN1alRsL0NiTk9aYkNOcFdha2FIN0NkbStHNVJj?=
 =?utf-8?B?MjB2OG5DajNYcTNFUjh0blJnSUptT3J0NzJ5NndrV3A4ZDVvZzVwYXl2MEF1?=
 =?utf-8?B?d3JhRFFQMklhT3duQ001cGpWYS9NRWptbTB1cnJMdmJuSlZ5TW9TMEhpWTk1?=
 =?utf-8?B?UHRta0RiOVpZSnQ5NENhTTF4Y0ZnZTdLMlRJaWFLVVp2V1hOM25Mb1J0Z04y?=
 =?utf-8?B?Y25pdFRlektaTWswbkwxaDdwN2VsNjdwdDlrYy8xSTEvdFVpYlZWVW5sclRN?=
 =?utf-8?B?dFZxY2xnUHM5aHNGOWlqOWMxNHpraExoRkdRbXE3b2Q5MjAycmhWRnI0WGww?=
 =?utf-8?B?MytrZzRnSFVDUmo4TGlpRlJPdkFha240MFBjT2pjVHZ5d2xaUGdIRDZIeTNU?=
 =?utf-8?B?emtSenRwZXBJWFpMKzBVMDJVN1RSaUJOS01WcU52bFptTGJMZUdqYjlWcU5a?=
 =?utf-8?B?UFkyNDVQTjIzbGdlNEg5T01EZXg5QXFRbSs3NytFQ1hPaWxRNkF1alIrOU9O?=
 =?utf-8?B?YXNySzRJY3lWWTBFeG1uTG81UkZsQTdkSHkzTWkvckdsY0paYmNqdGpGcXFU?=
 =?utf-8?B?blFrYlBjdllaZTBFK2lLYkpSK3hod3dwVTl0MmdudVgxRGNzSEhHc25VSFJs?=
 =?utf-8?B?Y016UjMvdkFpVGwrdVdseGFqYVhodUZsa2ZHUlZDVWxka2srV2Z0dGZYZEFY?=
 =?utf-8?B?dVNSK0RtUllxdjJPNkN1d0dlUWZTR3RBL0YxYzlqYUJvNEthQytKeTl6ZkRj?=
 =?utf-8?B?U2NzcFlHbEtpUmI1TmU0NEJQTDZpMDJGZHI1bURNUTVWemtCeXp5bDZTSVB3?=
 =?utf-8?B?aXY3KzB3aUY3d2V6QkVzU0ZodEJ6cFp2bkVlVW9Oa3diRWFtUlkxZU9Qa3pJ?=
 =?utf-8?B?Y3ErOTI5TFBYOUNLUE4wbTlJdWc5NkNtSGJBSFVpTTFZZjBGSWh5cGJQelYr?=
 =?utf-8?B?Y2pBaE4yb1RzeG5icStuSVFkUUpGdG1RMlBDZngvb00vcDIrWTNWdDZocmxT?=
 =?utf-8?B?aXEzdDIvS0V4N1RyeDE3b3ZGVkZIeGVnbzJwU0U1NE5JN1N0eEpxeExqUVhX?=
 =?utf-8?B?V0orQ094eDNlWStTOUpXd28xeWdheVlmbzQ1cjRtSjFYUWtKWFFUdzBRR291?=
 =?utf-8?B?bWJnd2g2N2hBVm1rMUJ0UXZsSHBvK3V5aTBlay9xYlFwL3lLRmltMzg2T29F?=
 =?utf-8?B?MDNoTGZ2anVTbnFuYStpUU1NU0dNTVZHUzd0ZEM1MFJ3TzMwZnRIQ2g5KzZl?=
 =?utf-8?B?bFRzdllSbjBHRE1KWmgzUlFBZkE1Sm9ydW1Edk5VbVNJMDNDdmhOdEZUdzFk?=
 =?utf-8?B?Mk5XS3kyM3ZzRzJPaFVveVdEN3o0d3Q1RVFnTkNiRTR5T3dxS0ZOUkhIeXBP?=
 =?utf-8?B?VzFXTXNUallZT0xyTmhxbjF0Mko5ZW9NWUpNMVBEdC9lVE5Dc09VVUpsYi93?=
 =?utf-8?Q?uKVNf0IgcLr5wh9hAxECT6Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83bb1893-3491-45a6-c405-08d9d5e15ed6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 15:36:58.7626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WaXojJoGqrVa7yYdEFc8qTCy2XjyxOpMgteAO1RqPcyzmb/6k9EW1tuUvindCX6Eo6Q4AJJ8Th6cP36U16ssSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5256
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 meenakshikumar somasundaram <meenakshikumar.somasundaram@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, "Koenig,
 Christian" <christian.koenig@amd.com>,
 Mustapha Ghaddar <mustapha.ghaddar@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-01-11 15:51, Linus Torvalds wrote:
> On Tue, Jan 11, 2022 at 7:38 AM Harry Wentland <harry.wentland@amd.com> wrote:
>>
>> Attached is a v2 of the buggy patch that should get this right.
>> If you have a chance to try it out let us know
> 
> I can confirm that I do not see the horribly flickering behavior with
> this patch.

Thanks for testing it. The patch is up for review on the amd-gfx
mailing list.

Harry
