Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1133A5108C1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 21:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7B410E1FF;
	Tue, 26 Apr 2022 19:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A24A10E1B9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 19:13:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DE8FlDWswzu5EDDDp2DjED7hYtfdDvR7KpgG/zrL0mSSg3ubZG9mcRolA00Yo7fveHnS94hpGi/3iNBw6dplFa5Jf9M24Rq5vYLUdfYgcmhZ6SIf7VK1nFBESaHqcXs8GQdIC7QlAf8coCvHxWX5m55AA6fwBtPuuw4psEMySc4WXs9No3z8kP18zorzBSFvqyzCKo28IAGC6saMfpbWH8d62mPZ2UkfMffdoY0kPGk0LMvJZrh5nKoZ1C/7UEYleZrm4H8MTq08ikB/ntvfKBMjoMqFAj5Zk187G/jjHLtARoqUtarZtKlLXBZy430c9nzTNI9GCFpMMJb/4S40Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DBEsFJ0+yFJA19N1znnygUz5vvo+lHI9g46t3jRF1s=;
 b=ZzF3tfVILyQeHFkjQ3xNUCbrHlHvhpKQsnnIOKGDwztgghGh18gakq12O5pBBxRvLX/r23Pgp9gxn0DHsUtgt+vUlZGQzKTMnkm0BE23lFRRFunCLTsGJuTkEhV6JemFb2Dy088A1keeZ0b8/qNrJfw83go1NLWawD8Sl3Z/CHs05dgVd/s8mDMfTamXjCGcSIe+m6W3JKZ0IZegDYtCbUtxPdhkVwwbG0hzlqmwxnS2IhhiDY5tdbehDYN7tp4zoPKM7OXVbpoq7bVyiKRhTY1lUrE2UaGmkg+YDPSTyl52CBylUfB2oupb3OW8M/6YpevQZyzT8BsDrIrNx695iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DBEsFJ0+yFJA19N1znnygUz5vvo+lHI9g46t3jRF1s=;
 b=seAQ//eaXlmKkDTUGerhFnPViFFgJApPkCLW3G0OE5P/JgaQQoo2CEQqujwDD7a+0FbW5bWYcjELRKQLIWz90MJt2HcTiP6Ftfy889s6CN93yAYPWNlO7d0DiKmrKGtQsFKJUpDRQoAbKu+RGUxP73i4gHqrUbQLiMh4yp2z2eI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by MN2PR12MB3791.namprd12.prod.outlook.com (2603:10b6:208:167::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 19:13:33 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 19:13:32 +0000
Message-ID: <6ad4c0d8-7a49-601a-df25-edfdf8813460@amd.com>
Date: Tue, 26 Apr 2022 15:13:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] drm/sched: use DECLARE_EVENT_CLASS
Content-Language: en-US
To: Chia-I Wu <olvaffe@gmail.com>
References: <20220412204809.824491-1-olvaffe@gmail.com>
 <CAPaKu7RwUwuQEGBB87CQysOFzPHbzjhW6we4dq198UsOWdoJyg@mail.gmail.com>
 <a7a60651-04a8-4c34-e487-c7908e223124@amd.com>
 <CAPaKu7Tq57HEuGSAQ3EjceyAU+MxOaAFE5egKEf_xWTzpDC_rA@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <CAPaKu7Tq57HEuGSAQ3EjceyAU+MxOaAFE5egKEf_xWTzpDC_rA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0148.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::27) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb4eabf4-d5be-4e13-7878-08da27b8dae1
X-MS-TrafficTypeDiagnostic: MN2PR12MB3791:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB37917373328440E0EE3594BFEAFB9@MN2PR12MB3791.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J8MK8vYyOjYKExZSBPsegqa0H/447bgnEi2bBjAyDNKwh0BoTSxopu82pdB3pRRunp2LDsQeyQmV4wFv+dLzcOQruQnER88e55RExoaFrn9LJ03/qiQd/7lSTmG0PptDguisIGf40HZbWT+qz6qT7FIvyhe9BaYGmu2YXrTcsdGRuYd5rFhg8tB8KPurjj1KR6CqtLZpmPPGGNAKcigJKTJIUt8jPjTXmPsWKknKb8EiuPkTnfMxmdqTBFNJ6h6s0In3bnmc8mgVzhfoYeAuLqt2zzHbS3u+gRSvikS4fkDj7U5YoZWl53dcvf9Dz8fFhK1qqj2htHi8096mgjNOxHTOukpdOGTbjijrsZHDetpAmZx/VdMbP8noPEc6QuV88oIfzIiUGmcExJMoChUX2Z6KFs154kNIwfatAUoSDtmSzhS/yL1qrsPROMiKlxmUEXyORO1VDr0fBFLJOWGbXdjBMt5o800rOy84BD+ko0aGn1NvxLu7Yy5NriQTbJv/bKoc5G4q6ivWYZxhepoY+25tU9APEbAO1+e38abzyNojwPxyohsuXGvmvffkL88oSR/b+rS9Mjhp93ghItERBDmvYMMxFOypy7Z5KDGXVwj3UZnIBMoDUg4tGlhc7wGGiuJ1LHwJBADR5rpe1Z780I5BKAHtE89J7U14sQaL9Vyt2Ts7Sur9aOdraW+dtFRDTBEKTQFKpxPO/+F7A5+EoAAUzNvZ8lhdXGMVgVgjIBQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(186003)(54906003)(6916009)(8676002)(66476007)(31686004)(36756003)(4326008)(53546011)(6506007)(316002)(66556008)(8936002)(5660300002)(66946007)(6512007)(2616005)(508600001)(6486002)(4744005)(2906002)(38100700002)(44832011)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ry9wOU80YllBNkhkR0VEVUF3YmE5NXVuN2k0UjBGSUh1TU1OdEZZWEcyNFpt?=
 =?utf-8?B?QTJuaVVMN1p4REFubkd5ekhDRTdwM0NFM0NsNTNpclIxZ1REanJteHBqTEYw?=
 =?utf-8?B?WHN0ZGR6b0JLWnJLRU5tNzVPQlVkVEh1ejA2akZNdVdkVjJWYVE5anRUejky?=
 =?utf-8?B?QkZVSHF1aWk3Y0k3RitDY3kvcmJWZElPZXJSZG4zQnQwZkxUZXRzR3FwTTNG?=
 =?utf-8?B?dUx3TjAyYU5SMFNOWUxnVnhUdVRqVnVzWkFzNzdiTHAwdHZQd0p5WEkybVpD?=
 =?utf-8?B?c1Y2cjVzdlBUK3F4Y0NCc3hUYzFFdTFCSG5TanFrdjk0OWtRWjZqS2ZYREht?=
 =?utf-8?B?ampIc3BydU5BL3NpS0JKOVR6MUFyd1BIc2pMblNhWlAycUFBVEFiUklRdkFS?=
 =?utf-8?B?V3IxSTY5K0V1MU9UeWdIeTVGQnNMbTdNQ3d6SDNBWTAxUkVZcHNaYXFNSUpr?=
 =?utf-8?B?dmUvZXFwWGQ5T0JCVldPaUh1RFh6OFV1cUo2ckI0Lzhtb3U0dGhqQ2JNRlB0?=
 =?utf-8?B?WFNIZlBaazBtY1NIK2dlVjM4QlNuaU5sajRTQXgrU29YbzdmRmJHT2U1MEg3?=
 =?utf-8?B?ano0VmxmV3dXTXNiSnNWNDFVZGhlZnB4WFVRZXgvejhnSzdpakd0eVcvMHpE?=
 =?utf-8?B?MUFlS3AwQ3lCOXpKbjhaNXdXSXRiWkFKVXNabHNOdDVWNmg1ZEtXbTFXOGhF?=
 =?utf-8?B?eWdBVXI1SjJqMlUrRjBIb2x4TDB5Wm5nVzhjLzBFeFZiNlFWM1F3ZHlyNFpo?=
 =?utf-8?B?Z3h6NlBzbXRibTZ6dnRXbzY5eFFSQWc5S3NoaXVWdTgxL29qekc0dnM3OUZG?=
 =?utf-8?B?S3c5Y29vbzM5Mld0akJkVFJBY3drT1c1WTdRdDhCelNrdGhMTmU1VnlsS2k2?=
 =?utf-8?B?TnBZdU5ZYmkrRDh6YU5MRjhXOXN1WC8vYmdKUTVmVVc4YWw5VVpIRkkvOEE1?=
 =?utf-8?B?NWtiYzQraWp2Z09zMDRsL0RaVWVoOFNaenlCT2s5SU5Yazk3elVDOWxHZGh2?=
 =?utf-8?B?dTlmclVBejRpL1RsSVRyUkJydWdzVkxkNGU3aGhNL1hGN1Z2dk12aU1RODVG?=
 =?utf-8?B?TDBQOHpQZU9WN3RvbjJvVEhBV2drZXcvWnJtT3V2YUM0RUZKVGhyWVFMcXlJ?=
 =?utf-8?B?ODYxSzRtbTlCTzd5UFRBeTBvOWpLYXU4TXRTVGFJOGQ2NmRYaHVHOHd1Y1Rp?=
 =?utf-8?B?QnhicE5yTXJxcWVrV29IbmQ1akxQRmM2UU9td0d4Z0xvR2o1c2V2cG4zT21L?=
 =?utf-8?B?U2FHZG81aEFpUEx0cUUvU0lMTjRnclZCNW1oWjJEdTBQeVZrZ1NtYUhGTys5?=
 =?utf-8?B?MjF3cEo5WHhLNEF2R2VUSExDd01YWmhFWHQ5RStLaVVtS0dhOVNidDZzL1BZ?=
 =?utf-8?B?ZXhrL2cvR0thREkvWjRMN3c2TUlkckFvNkVBSTBINllMYzUvbTlISVRIOVFt?=
 =?utf-8?B?SXR4MDZUTW1ENmhoblh6YUZJbmxhQnBqTC9OUVJCS0dGQUcxWjlrNzk2Tk5h?=
 =?utf-8?B?c0xuNTFvRDRBVWhUZFlsMzZrTjZFd1V6d041b09Sb2k3TXN5c3BSZVA1ZndN?=
 =?utf-8?B?RzdpeTlqNFJqUmIzQnFzVnZSOG54ZVlxWGw3cStBbms1dW9MYW5sK3ZyVGV3?=
 =?utf-8?B?blBqUmRiWng5cDFWcDBnZVpnYi92cENQMkJZaFdyVFBudmQ4SDBNcXpkSmxV?=
 =?utf-8?B?a0lDNVIweDJvTjIzSndxU2NTNTJibEQxOXQ1bG0wMXdwNDJ0RGs5SVhMdlBR?=
 =?utf-8?B?b2pndzVmRUUrNFBoM3hUdzhHKzNBM0wxa2JlenlHVGRNaDVoUlBqZUlDVEdW?=
 =?utf-8?B?cGxQYW9QdzhLYnVuTVFRankzbWJsRGMrSjVzS0pGM3gwOXV1b003YnBkWnZL?=
 =?utf-8?B?TzZ5V1FidXZ5Y2d6NHdCcGxldWwxKy8rQkJqQkZScWtFaXE3OVFPdDM3cG1h?=
 =?utf-8?B?R2hEY1N4MUtDSDlheDNZK0RvS2NNSHhIMjVhOG42VEs1emtZQ2Fna3Nqc0p5?=
 =?utf-8?B?Rlo5Y04zanZwSjRRaE5MRG0rcUFuTjdxYU95ZkFIVmE3SnBicjdFMGRlbmQw?=
 =?utf-8?B?UDFMMlRGMWFGVWduNEUzaFBocGd6Tnl5VEwvaFh6cjhCYUx4a3VubVV3NWEw?=
 =?utf-8?B?VVBocitvbFZnQzRaZXM5MWhtRlArRzVQU1RzQWZQZVZERHRxVFltK1pEeWR3?=
 =?utf-8?B?Nk5ZOEU4Y0ZEZ3pOTnQ3Wk9TZi8wWG9kYlpGLyt3ZjRJM3AzTW1LNGlQTmor?=
 =?utf-8?B?U0w2ZEtyeGhHYWxpbUNXY2pDdTZzZVYxRlNPeExHSWJNTmFSbjRYNGhCL2l6?=
 =?utf-8?B?ckozNlBTL045djZkb1g4SDQ0VVFuOTdaMGJybllsQkZ6RFRrSGhFYk5ZcmVO?=
 =?utf-8?Q?LhNSCQRsn6WOmC+oxaMHc7kV3BclqF0dX3wyF9Kz4gtFt?=
X-MS-Exchange-AntiSpam-MessageData-1: Gr67X/sMJf3Sbg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4eabf4-d5be-4e13-7878-08da27b8dae1
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 19:13:32.8677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2B5fd8K+qFnpHmxlIurX4nIuup26TlxLezDT2uOhHYDOToq6XWEHvXSp/rk3x9rav2TaOmWiet/nT5l0teGRIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3791
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
Cc: David Airlie <airlied@linux.ie>, Rob Clark <robdclark@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Done

Andrey

On 2022-04-26 14:52, Chia-I Wu wrote:
> That would be great.  I don't have push permission.
>
> On Tue, Apr 26, 2022 at 11:25 AM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>> It's ok to land but it wasn't, do you have push permissions to
>> drm-misc-next ? If not, I will do it for you.
>>
>> Andrey
>>
>> On 2022-04-26 12:29, Chia-I Wu wrote:
>>> On Tue, Apr 12, 2022 at 1:48 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>>>> drm_sched_job and drm_run_job have the same prototype.
>>>>
>>>> v2: rename the class from drm_sched_job_entity to drm_sched_job (Andrey)
>>>>
>>>> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
>>>> Cc: Rob Clark <robdclark@chromium.org>
>>>> Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> This series has been reviewed.  Is it ok to land (if it hasn't)?
