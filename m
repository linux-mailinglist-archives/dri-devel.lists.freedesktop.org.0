Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FF56F4264
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 13:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D8C10E506;
	Tue,  2 May 2023 11:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635A110E502;
 Tue,  2 May 2023 11:14:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaPkFTFfY5C07iqKxJgGTY15X1t0vrLHm4LS2/2SGLOs5fKFi/2IBFG+Ll0zhgv/p/YqoUfqomrA9bwI2FUupafWIs1lm1xVASkP03tcvCpML4Ao3q5xl0GgAkxHmMzt7HfiYcvRBU3MeLpGLZ9OJZBMeUl0nOfw9KN3FumAFGiXQXGUyl2XxwN5lsYtPzcl4JtXIKoypVVJ/MwYd1/8L123gVI1cI5R0p3A0LMGjIJIZ0U4lY97nNZoTZmgIVEu/MyQREcy2qS0qejMyZV+4gJIZX04u8NQ8S/NE89zwnjmNWOJjdExPF5fY2UMjXRTMAUOLb6+CE6w9SHcVjkP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8g74r33PKy7yqtLbENzxJQq9NSaXOBc+OGM4uzzg7Y=;
 b=K/jVjAL5BHDjFDWT5voihK9bftyYQ+yk2Dp4VnfcjWNibZi8xO0CWQ0HCZyMu/gamKiODA6eU1ZNeqp66HBTa7Q8kmWTPyH/catsH8+ro8TFwon5ID2WBIwgnO7tX1iN2Jk/62AGFYwn0kC8+4aB78i+7RX03Zvj6qzl/MMVzxzq7G3GEnEzUGjSLl3X/NHuDWwjXChLnB3fAeznIGg2jvLowUAuhtFkUKSKQ88qpej94KHixYDcLvEcITh78p5//XzGJVu+0gaPG1Jus83cciciWtISebFZ6GoZd+foKKat5v7ZvVLrTTj4mkErOpuoX9yfhe+w0HgOMlL5WOMv7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8g74r33PKy7yqtLbENzxJQq9NSaXOBc+OGM4uzzg7Y=;
 b=2NRBFxMg3BLIdEtpNSKNRm/ml3B+SPgKofrEWTBLIWe7D2EQ0x/XFC/tJy/uu68zvnW80nFy4BUYSl7/+ShAwl8QgMUiCFdpczfXULG2YEwVJ++GJiQo0LfRN5LTg0m+XIkUA5HIISmQcVA9QjTo2lH/xl0MtPgKneDDNjMMKQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB7969.namprd12.prod.outlook.com (2603:10b6:8:146::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 11:14:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 11:14:34 +0000
Content-Type: multipart/alternative;
 boundary="------------z226YnVJdpm5no1NspfJ0VK7"
Message-ID: <fcca2934-a556-797c-535d-a66fc67bbe30@amd.com>
Date: Tue, 2 May 2023 13:14:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
Content-Language: en-US
To: =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>
References: <20230501185747.33519-1-andrealmeid@igalia.com>
 <CADnq5_NXj4W44F_etRQ7HWdVTnf5zARCM3Y_o3EiwWiHj8QMpA@mail.gmail.com>
 <6ab2ff76-4518-6fac-071e-5d0d5adc4fcd@igalia.com>
 <cb3d2590-a1f8-fe7e-0bba-638ee80719af@amd.com>
 <CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com>
X-ClientProxiedBy: FR3P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c979c0b-8f95-470c-4e48-08db4afe6889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N1BonNnii8xFyRRnvI+ce8gJJUYcwthAVJPx76XDfAtOC4R15kZnkx0bg1r5zbz/USQo/9yZMrZNEs8Y/hVbT1DKwxWCHeTqXJwAdIhRJsi7gqovcBDQmWR76Z8vqtzW+vK2Ayc+Wf47t7xwTrTurZ2vqhMCA2XMBkuAyzFW4alaTr+1Y7vS7820UosyuzR9gr9AfTdhgvbezTBDqAueF5taBG0VjIXy7PZH7VBJGf2fQ33HXWEwMz6+HKZ2T89m8vzYo5MQYwYuLObJ2dZoFfP1kL7QuFDbgea84KTL8pj1xCqNx5y0Dl0z/aeSfvdqidpk3N07ymy7MJnABpKa79qxu6pl7px/CcjQFBa2iGYZqZjS6waxfcr8Sncf1vrRtpjpNB8gZayqiFvr24WdKKig59juo542ueEYUPN25wdR/lwekeJxb+0rWI4hJYEnGa8zABr572vrij4TaOewkuP1Nvvf/3TkCVUqG8FfPNkqaBvI+iuPhGYxsUQOBUgf1kJSnay8AJ9a4fzFaFlUmMT5FEVB5sO3JfColip+LyKdSntxO6ngVX7FQAy4OaDbpithHUNXR0FXTHBNcql/VctfkqvAoO6wfMN0PQnwTTKWA8tLqkGFR14lUI5SZbOudm8G4wJtQ/voqXg4LiPC2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(451199021)(478600001)(66899021)(31686004)(36756003)(7416002)(5660300002)(38100700002)(2906002)(30864003)(8936002)(8676002)(86362001)(316002)(31696002)(66556008)(66476007)(4326008)(66946007)(6916009)(66574015)(41300700001)(83380400001)(6506007)(6512007)(186003)(53546011)(2616005)(6486002)(54906003)(6666004)(33964004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2s0dWt0ZUtMWlRXR2V4WVFFZVhFdGN4NjVxWmlmWncrWHVzdUM1T3ljMWhT?=
 =?utf-8?B?Qmk3dTlQYlAxa2tTYXRhcXBEenZTVGxjVzdTYnNrQjRGc0hhc3FsZmVCcXYr?=
 =?utf-8?B?S2VZdjh3SWxWeVFuejc3Z2tJWU5UTzk0QXlTNEJHQjgzT2xxUWwwMlIxTkFL?=
 =?utf-8?B?Mlkvd2FDUFF4NzVJQnNvWmVhb0tVald0aDdNKzdUc0FaR0ZLM2xESUNmNnNz?=
 =?utf-8?B?SEZDZVJlUHB1R3dESHcvdUtjT0JBdVRzWTNVVCthYjJUU3ZvTEZqV3BZQ1A5?=
 =?utf-8?B?bW9qTDJZaDRaNEN1TEQ1ZVk0QmxkOTZJNVc3alM5SWZEVzZPYXpGWlFIWTht?=
 =?utf-8?B?Sk5XWkl1K2d2Wld4S0o2dU9RTWg0NHcvWG5qOWZ3S281Ty9KS0h2T3pvbXdO?=
 =?utf-8?B?NnVjdmo1eU9yWmtoVGNra0ZwKzFNU0M0Q1ptaG5USkxqV3FkaGkvL08wenJa?=
 =?utf-8?B?Ui9MVDBjalV3a09XOWRSYlN3UFp5UU5qRVlQeklyeVpqakZrMG14bkNVd3BZ?=
 =?utf-8?B?c1RjdEtaUlAwWHluZy9xeDVibnE4T05CbkRBVWVpZC9HQnl3QkFTcTlNbzgr?=
 =?utf-8?B?MmticWNHd1VVN3o3NzRLaHVEQkNDWjMzbFF3aG5nVTV2dUY3bXdLLzhvTEV2?=
 =?utf-8?B?MUdQS1lEbUtXSnR3NEY2TWtsdXdXcEoyMjFRV3JLRGFMdVZFdlNQSEFZcERL?=
 =?utf-8?B?U1QrVXlpTnlUeWpuUXJVWE5GcU9kN0VSbHZ5a0s3MlhJdVZWaG02MGFuM2pT?=
 =?utf-8?B?OHQvN0l5bXIxMS9kejArSXllT2RUOEhTbWxIZGYwWDJxVHRwcjR0Tk1IaGcz?=
 =?utf-8?B?UklxZ3QxMllBY0dJcE5UT01GZGY3Tk40VWozNFEvK25KczAzay9QSlNsUFgv?=
 =?utf-8?B?Y25ybGgrVHJoNDlkMzFranUyOXpxdEp2NHVNU1VHcjRnYnZGa2RXSW9ucjBz?=
 =?utf-8?B?cC9DSDBOQlhuMkZseDhrbnRQWUgxQ0krdnlsOC9QZjdOUWpCNTBqV1RuNXZE?=
 =?utf-8?B?SDBpMzhhckxOWlAvdW9wREtpZXBnQkJLbGJBdTZKVzlkTFoyS0ErNGNBUWNm?=
 =?utf-8?B?R2o2YjQxWncrUVZBSk52bzQ2K0tTUWN6K1ZGSkkzcHFOYmt6dzVDVDNjZmZX?=
 =?utf-8?B?TmlqYWZ0dThIN00zbko2c2RXUENMS0ZhU2Y0aDhxUjk3bUNGTHhMK3ZGNDdK?=
 =?utf-8?B?T29hSzQ1eVhFcWljMG5qYlNXT0R1SUpMelhUUlA4N2xrdFNWbnNLa0Z1ZkFP?=
 =?utf-8?B?b1hsM1NKaVltcUZ6UnpNRzNjclkraXB1WnN3RndYb05FTS9QZzBxMFpRQS9O?=
 =?utf-8?B?aWJKWS9haERmZlJzL3lLaElzK05FdFJ5TzhnaGZnSXVqLzRacVhuZ2hXMkp0?=
 =?utf-8?B?R0JaeFBHWVByejRSK05wMXpjUnljY1ViQk0zU20wa20zVGkrVEhkZ21aWms2?=
 =?utf-8?B?L0pxOUtlU0ExYURmVCtjdTh0UVBGbUNhK3ErZHdxUjczWDVSM3RUMGZFMGRj?=
 =?utf-8?B?MUdUWjI2TUYwWWpIZi92TWVMZytRL3ViQTNNb3Vya0FBNXhTK2dYUnVUdEdl?=
 =?utf-8?B?aDZoOWtFM2N6dTRiYW5RdERwaWNDZTlIWS8yM1J1cDRZVTBxdnZ6UFFCdjFE?=
 =?utf-8?B?WWVzTkpvZTluQ01CY3J5SlExZmp3ZEtjc1RHS01sOGZ1ZGJPNkx3by8vVlFz?=
 =?utf-8?B?dGp2MDhTT0lzVDJlRnF6Z25qdDU0Nnk1WjJ4UlpmdkQxWmo3amFWOEJicGlu?=
 =?utf-8?B?dlFjUlA4MGZMeUlFT2kwQWc3OTdYU0hta2N1eWR4R1pRU09WMUdxNklVdStv?=
 =?utf-8?B?UzFMYS9RQmxYOUxpc0JZSXpCMjdNMkYwUmxXV25Jd0ZTS2Q4UkVBSms3VVN5?=
 =?utf-8?B?S3QzWXlKVGY4RFVUd3FEbS90NE02TjRFMm4vWVhEaFRScExWSnhlRHIwbG5N?=
 =?utf-8?B?bU9zdWJlTWEyeHRsaDEvSGo5ZTMvOVdFOTJYMjRiZlc1dHNtTFFyT04yaTV1?=
 =?utf-8?B?eitDUldpUE1rTUUxSkdSRW05RUZxSmRWeE9uTkovTzh5RDJ5MEluY0kycUtM?=
 =?utf-8?B?ZVcvZFM4eS9vWW5NZ2ZzQWVMZzhGdG4wQTlOamhVQUJOdW9QRnBKUCtxOE9K?=
 =?utf-8?B?U1hRdmhlZUJRNkNjTlhvR1hQSHNuVWtwbGtyb2U5M054VzVGYTBUQU1HeUpK?=
 =?utf-8?Q?FCQrl4YvsI0JgnE6ZJf+rchKmEj+6lc1sy3PpSJAzdBG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c979c0b-8f95-470c-4e48-08db4afe6889
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 11:14:34.0825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqWi/e659sfOrfGymsKnWi2p1TpSdnWsjlUDXRuwqjHvDf9jQHsV2yniVI4OHdko
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7969
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
Cc: "Pelloux-Prayer, Pierre-Eric" <pierre-eric.pelloux-prayer@amd.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org, linux-kernel@vger.kernel.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------z226YnVJdpm5no1NspfJ0VK7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Timur,

Am 02.05.23 um 11:12 schrieb Timur Kristóf:
> Hi Christian,
>
> Christian König <christian.koenig@amd.com> ezt írta (időpont: 2023. 
> máj. 2., Ke 9:59):
>
>     Am 02.05.23 um 03:26 schrieb André Almeida:
>     > Em 01/05/2023 16:24, Alex Deucher escreveu:
>     >> On Mon, May 1, 2023 at 2:58 PM André Almeida
>     <andrealmeid@igalia.com>
>     >> wrote:
>     >>>
>     >>> I know that devcoredump is also used for this kind of
>     information,
>     >>> but I believe
>     >>> that using an IOCTL is better for interfacing Mesa + Linux rather
>     >>> than parsing
>     >>> a file that its contents are subjected to be changed.
>     >>
>     >> Can you elaborate a bit on that?  Isn't the whole point of
>     devcoredump
>     >> to store this sort of information?
>     >>
>     >
>     > I think that devcoredump is something that you could use to
>     submit to
>     > a bug report as it is, and then people can read/parse as they want,
>     > not as an interface to be read by Mesa... I'm not sure that it's
>     > something that I would call an API. But I might be wrong, if you
>     know
>     > something that uses that as an API please share.
>     >
>     > Anyway, relying on that for Mesa would mean that we would need to
>     > ensure stability for the file content and format, making it less
>     > flexible to modify in the future and probe to bugs, while the
>     IOCTL is
>     > well defined and extensible. Maybe the dump from Mesa + devcoredump
>     > could be complementary information to a bug report.
>
>     Neither using an IOCTL nor devcoredump is a good approach for this
>     since
>     the values read from the hw register are completely unreliable. They
>     could not be available because of GFXOFF or they could be
>     overwritten or
>     not even updated by the CP in the first place because of a hang
>     etc....
>
>     If you want to track progress inside an IB what you do instead is to
>     insert intermediate fence write commands into the IB. E.g. something
>     like write value X to location Y when this executes.
>
>     This way you can not only track how far the IB processed, but also in
>     which stages of processing we where when the hang occurred. E.g.
>     End of
>     Pipe, End of Shaders, specific shader stages etc...
>
>
> Currently our biggest challenge in the userspace driver is debugging 
> "random" GPU hangs. We have many dozens of bug reports from users 
> which are like: "play the game for X hours and it will eventually hang 
> the GPU". With the currently available tools, it is impossible for us 
> to tackle these issues. André's proposal would be a step in improving 
> this situation.
>
> We already do something like what you suggest, but there are multiple 
> problems with that approach:
>
> 1. we can only submit 1 command buffer at a time because we won't know 
> which IB hanged
> 2. we can't use chaining because we don't know where in the IB it hanged
> 3. it needs userspace to insert (a lot of) extra commands such as 
> extra synchronization and memory writes
> 4. It doesn't work when GPU recovery is enabled because the 
> information is already gone when we detect the hang

You can still submit multiple IBs and even chain them. All you need to 
do is to insert into each IB commands which write to an extra memory 
location with the IB executed and the position inside the IB.

The write data command allows to write as many dw as you want (up to 
multiple kb). The only potential problem is when you submit the same IB 
multiple times.

And yes that is of course quite some extra overhead, but I think that 
should be manageable.

>
> Consequences:
>
> A. It has a huge perf impact, so we can't enable it always
> B. Thanks to the extra synchronization, some issues can't be 
> reproduced when this kind of debugging is enabled
> C. We have to ask users to disable GPU recovery to collect logs for us
>
> In my opinion, the correct solution to those problems would be if the 
> kernel could give userspace the necessary information about a GPU hang 
> before a GPU reset.

The fundamental problem here is that the kernel doesn't have that 
information either. We know which IB timed out and can potentially do a 
devcoredump when that happens, but that's it.

The devcoredump can contain register values and memory locations, but 
since the ASIC is hung reading back stuff like the CP or power 
management state is dangerous. Alex already noted as well that we 
potentially need to disable GFXOFF to be able to read back register values.

> To avoid the massive peformance cost, it would be best if we could 
> know which IB hung and what were the commands being executed when it 
> hung (perhaps pointers to the VA of the commands), along with which 
> shaders were in flight (perhaps pointers to the VA of the shader 
> binaries).
>
> If such an interface could be created, that would mean we could easily 
> query this information and create useful logs of GPU hangs without 
> much userspace overhead and without requiring the user to disable GPU 
> resets etc.

Disabling GPU reset is actually not something you can reliably do 
either. If the core memory management runs OOM it can chose to wait for 
the GPU reset to finish and when that timeout is infinite the system 
just hard hangs.

That's also the reason why you can't wait for userspace to read back 
state or something like that.

>
> If it's not possible to do this, we'd appreciate some suggestions on 
> how to properly solve this without the massive performance cost and 
> without requiring the user to disable GPU recovery.

The most doable option I can see is to say instead of resetting the GPU 
we tell the OS the GPU was hot unplugged and disable system memory 
access for the ASIC to prevent random memory corruption.

This way you can investigate the GPU state with tools like umr and only 
after that is done we do a hot add event and start over from scratch.

The game will obviously crash and needs to be restarted, but that is 
still better than a full system crash.

>
> Side note, it is also extremely difficult to even determine whether 
> the problem is in userspace or the kernel. While kernel developers 
> usually dismiss all GPU hangs as userspace problems, we've seen many 
> issues where the problem was in the kernel (eg. bugs where wrong 
> voltages were set, etc.) - any idea for tackling those kind of issues 
> is also welcome.

No idea either. If I had a better idea how to triage things my live 
would be much simpler as well :)

Regards,
Christian.

>
> Thanks & best regards,
> Timur
>

--------------z226YnVJdpm5no1NspfJ0VK7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Timur,<br>
    <br>
    <div class="moz-cite-prefix">Am 02.05.23 um 11:12 schrieb Timur
      Kristóf:<br>
    </div>
    <blockquote type="cite" cite="mid:CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com">
      
      <div dir="auto">
        <div>Hi Christian,<br>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">Christian König &lt;<a href="mailto:christian.koenig@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;
              ezt írta (időpont: 2023. máj. 2., Ke 9:59):<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">Am
              02.05.23 um 03:26 schrieb André Almeida:<br>
              &gt; Em 01/05/2023 16:24, Alex Deucher escreveu:<br>
              &gt;&gt; On Mon, May 1, 2023 at 2:58 PM André Almeida &lt;<a href="mailto:andrealmeid@igalia.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">andrealmeid@igalia.com</a>&gt;
              <br>
              &gt;&gt; wrote:<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt; I know that devcoredump is also used for this
              kind of information, <br>
              &gt;&gt;&gt; but I believe<br>
              &gt;&gt;&gt; that using an IOCTL is better for interfacing
              Mesa + Linux rather <br>
              &gt;&gt;&gt; than parsing<br>
              &gt;&gt;&gt; a file that its contents are subjected to be
              changed.<br>
              &gt;&gt;<br>
              &gt;&gt; Can you elaborate a bit on that?&nbsp; Isn't the whole
              point of devcoredump<br>
              &gt;&gt; to store this sort of information?<br>
              &gt;&gt;<br>
              &gt;<br>
              &gt; I think that devcoredump is something that you could
              use to submit to <br>
              &gt; a bug report as it is, and then people can read/parse
              as they want, <br>
              &gt; not as an interface to be read by Mesa... I'm not
              sure that it's <br>
              &gt; something that I would call an API. But I might be
              wrong, if you know <br>
              &gt; something that uses that as an API please share.<br>
              &gt;<br>
              &gt; Anyway, relying on that for Mesa would mean that we
              would need to <br>
              &gt; ensure stability for the file content and format,
              making it less <br>
              &gt; flexible to modify in the future and probe to bugs,
              while the IOCTL is <br>
              &gt; well defined and extensible. Maybe the dump from Mesa
              + devcoredump <br>
              &gt; could be complementary information to a bug report.<br>
              <br>
              Neither using an IOCTL nor devcoredump is a good approach
              for this since <br>
              the values read from the hw register are completely
              unreliable. They <br>
              could not be available because of GFXOFF or they could be
              overwritten or <br>
              not even updated by the CP in the first place because of a
              hang etc....<br>
              <br>
              If you want to track progress inside an IB what you do
              instead is to <br>
              insert intermediate fence write commands into the IB. E.g.
              something <br>
              like write value X to location Y when this executes.<br>
              <br>
              This way you can not only track how far the IB processed,
              but also in <br>
              which stages of processing we where when the hang
              occurred. E.g. End of <br>
              Pipe, End of Shaders, specific shader stages etc...<br>
            </blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Currently our biggest challenge in the userspace
          driver is debugging &quot;random&quot; GPU hangs. We have many dozens of
          bug reports from users which are like: &quot;play the game for X
          hours and it will eventually hang the GPU&quot;. With the currently
          available tools, it is impossible for us to tackle these
          issues. André's proposal would be a step in improving this
          situation.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">We already do something like what you suggest,
          but there are multiple problems with that approach:</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">1. we can only submit 1 command buffer at a time
          because we won't know which IB hanged</div>
        <div dir="auto">2. we can't use chaining because we don't know
          where in the IB it hanged</div>
        <div dir="auto">3. it needs userspace to insert (a lot of) extra
          commands such as extra synchronization and memory writes</div>
        <div dir="auto">4. It doesn't work when GPU recovery is enabled
          because the information is already gone when we detect the
          hang<br>
        </div>
      </div>
    </blockquote>
    <br>
    You can still submit multiple IBs and even chain them. All you need
    to do is to insert into each IB commands which write to an extra
    memory location with the IB executed and the position inside the IB.<br>
    <br>
    The write data command allows to write as many dw as you want (up to
    multiple kb). The only potential problem is when you submit the same
    IB multiple times.<br>
    <br>
    And yes that is of course quite some extra overhead, but I think
    that should be manageable.<br>
    <br>
    <blockquote type="cite" cite="mid:CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com">
      <div dir="auto">
        <div dir="auto"><br>
        </div>
        <div dir="auto">Consequences:</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">A. It has a huge perf impact, so we can't enable
          it always</div>
        <div dir="auto">B. Thanks to the extra synchronization, some
          issues can't be reproduced when this kind of debugging is
          enabled</div>
        <div dir="auto">C. We have to ask users to disable GPU recovery
          to collect logs for us</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">In my opinion, the correct solution to those
          problems would be if the kernel could give userspace the
          necessary information about a GPU hang before a GPU reset.</div>
      </div>
    </blockquote>
    <br>
    The fundamental problem here is that the kernel doesn't have that
    information either. We know which IB timed out and can potentially
    do a devcoredump when that happens, but that's it.<br>
    <br>
    The devcoredump can contain register values and memory locations,
    but since the ASIC is hung reading back stuff like the CP or power
    management state is dangerous. Alex already noted as well that we
    potentially need to disable GFXOFF to be able to read back register
    values.<br>
    <br>
    <blockquote type="cite" cite="mid:CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com">
      <div dir="auto">
        <div dir="auto"> To avoid the massive peformance cost, it would
          be best if we could know which IB hung and what were the
          commands being executed when it hung (perhaps pointers to the
          VA of the commands), along with which shaders were in flight
          (perhaps pointers to the VA of the shader binaries).</div>
      </div>
    </blockquote>
    <blockquote type="cite" cite="mid:CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com">
      <div dir="auto">
        <div dir="auto"><br>
        </div>
        <div dir="auto">If such an interface could be created, that
          would mean we could easily query this information and create
          useful logs of GPU hangs without much userspace overhead and
          without requiring the user to disable GPU resets etc.</div>
      </div>
    </blockquote>
    <br>
    Disabling GPU reset is actually not something you can reliably do
    either. If the core memory management runs OOM it can chose to wait
    for the GPU reset to finish and when that timeout is infinite the
    system just hard hangs.<br>
    <br>
    That's also the reason why you can't wait for userspace to read back
    state or something like that.<br>
    <br>
    <blockquote type="cite" cite="mid:CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com">
      <div dir="auto">
        <div dir="auto"><br>
        </div>
        <div dir="auto">If it's not possible to do this, we'd appreciate
          some suggestions on how to properly solve this without the
          massive performance cost and without requiring the user to
          disable GPU recovery.</div>
      </div>
    </blockquote>
    <br>
    The most doable option I can see is to say instead of resetting the
    GPU we tell the OS the GPU was hot unplugged and disable system
    memory access for the ASIC to prevent random memory corruption.<br>
    <br>
    This way you can investigate the GPU state with tools like umr and
    only after that is done we do a hot add event and start over from
    scratch.<br>
    <br>
    The game will obviously crash and needs to be restarted, but that is
    still better than a full system crash.<br>
    <br>
    <blockquote type="cite" cite="mid:CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com">
      <div dir="auto">
        <div dir="auto"><br>
        </div>
        <div dir="auto">Side note, it is also extremely difficult to
          even determine whether the problem is in userspace or the
          kernel. While kernel developers usually dismiss all GPU hangs
          as userspace problems, we've seen many issues where the
          problem was in the kernel (eg. bugs where wrong voltages were
          set, etc.) - any idea for tackling those kind of issues is
          also welcome.<br>
        </div>
      </div>
    </blockquote>
    <br>
    No idea either. If I had a better idea how to triage things my live
    would be much simpler as well :)<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com">
      <div dir="auto">
        <div dir="auto"><br>
        </div>
        <div dir="auto">Thanks &amp; best regards,</div>
        <div dir="auto">Timur</div>
        <div dir="auto">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------z226YnVJdpm5no1NspfJ0VK7--
