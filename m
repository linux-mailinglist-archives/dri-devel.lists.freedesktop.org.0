Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C9F82806F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6707A10E3AC;
	Tue,  9 Jan 2024 08:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56ED110E3AB;
 Tue,  9 Jan 2024 08:20:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpaRgh05USpJ/wx3gEUfnjwsTDPjmQVA9LLcrVbAai79xxY9iULjgAN4UB7OTQyKr/rM9lvbtr9EWTFQCjsHICnqeFJo7JOaqe7qCB73aNTGlJSg+Mzyg7eD5yVJcO5pMMI3bftylmSkVTvyqGgIs1KhhsIh6Uyi6/fcY7JHkZX+POklAKwxxbkv570Qilq90noSnuMRuhtkjJSgOdu1DcrmsT+efFtRBOkCmruv0aSLbE9B4zGgUHLcRVN7/8YbGpkCKQaYHKpI9MZ2JPBa96y/wVQkxnca2FnZ1BU7gyh76/IaQx16WCaiWOx/9lGwXR003aUU2TfCj9YXDREcmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FJH9xDx53LIfwIUvOH51we5BJ4CwDZzVofix6uLXAk=;
 b=l7PItu0ZqA9+P7VKE6eIFHAnim6kdIm66fZDfQzEE4qaexUhR+iXO2n+o2Tf1wlIdVUbZqqWxa3BYYDmnGyPzgxwAv27FjHLnJRhW4zORy6PUCsSxptGGaIoE80qtSBYfbuv/Vq6mJ7AIr5QkP5wBsFK4lStvxluyFRCswCul+d0brPPkGdS2z57dCxYpFOKgRTHtYe5fMTVY4Mq6Zc7kcjbehSb2DkcdmYMy4wTr/OwT/oFZaKC0c0G+bZFxqRcHD9mouxdWIKSAJC74Sh7qV6B9nc6fr94baMgOq8dZ9lbatAr2eGjiyJYK+7QjEPOhIgugcaYTs4WGDDfBcotKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FJH9xDx53LIfwIUvOH51we5BJ4CwDZzVofix6uLXAk=;
 b=woAKt2VQEazSUeHQab1Nfmu2XJhsJId3kJaYf3DkGhXkTA3u7+BCxT96UjNZcvvS5F2ytrg5/y4T/D2iPZ+/b5U0DmzkgIfdc1vt8vrWiK68+Qz3wMOO8pRJW4mzgq7n4gqZy0NIqv2+5aN5j4PCgG11+pbu96kSpTnQhhgQYj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB9055.namprd12.prod.outlook.com (2603:10b6:930:35::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Tue, 9 Jan
 2024 08:20:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 08:20:16 +0000
Content-Type: multipart/alternative;
 boundary="------------9c0tmmiApwu0kw877Dgrsec3"
Message-ID: <dd7d81bc-a965-4b44-9884-2d59d4b04103@amd.com>
Date: Tue, 9 Jan 2024 09:20:11 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogUmU6IOWbnuWkjTogUmU6IFtQQVRDSCBsaWJkcm0g?=
 =?UTF-8?Q?1/2=5D_amdgpu=3A_fix_parameter_of_amdgpu=5Fcs=5Fctx=5Fcreate2?=
Content-Language: en-US
To: =?UTF-8?B?5p2O55yf6IO9?= <lizhenneng@kylinos.cn>,
 Marek Olsak <marek.olsak@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>
References: <1uy9gy5eaet-1uyc0ts8e2e@nsmail7.0.0--kylin--1>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <1uy9gy5eaet-1uyc0ts8e2e@nsmail7.0.0--kylin--1>
X-ClientProxiedBy: FR0P281CA0266.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d650ac6-3b1b-4168-c441-08dc10ebcf3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uImzFu3jY9vysNjwnIFgGF04VW1768yJYkI+JPMy+BbCw8KsBxL0LgaNDgC3/FCF5OdnlczCwcMfrUFZkWf6//S6w1vtqDFdCVy1giHq81qzfx4Ey4XXoS8JIG78UHfAvKhHrQyhGBPdppbKCnPi41Y3/22+asZkntwMd3s42Q0rsubG3h06adhNfi65vZ6zAlcOUEys2BjA4IgnbGUU7uWEQzZnDZu/QK53OO8s2eF55FH0Ed7HmpY/NFDKbm3pk0ZrFCkwjPi7tkTg0N0QdBd3SRN7Am8xHMydKB67wtn1+4wc8DJ51nmMRRmQ3DZetCBo+rAF9I528DSAJUC6KZ2MMjE0Vlgzsytw3/qpEgzV8zy+UdQ2SYHx/DxEzJGzw65lvRqhtDnjSEFVvgVHqivVmyG6s3ie8S4m7DmpCHB3yGYVWZ/DD//2q/i/+HI+Vqr5w9tZoQVncnQI4Mb4xbBeJrq6aDAK3t0HJvBJrNDRAMgSGanVoIAmUdLa1k0U/vkwcyGggPBOaqLg6ddk4IdVBrxR4uY7YsXchbLJ0hMLvFTz8M1vaxx2EamY2T51x1ZDt2sPW1BTgKKR+clEPNBkdCwAPE9gTerme78PtGSmu9ktgMq/zokKxbmwWfSN1por219JXuMo5ZeH1GXBAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(376002)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(36756003)(316002)(8936002)(38100700002)(83380400001)(6506007)(110136005)(66574015)(5660300002)(478600001)(6512007)(33964004)(6666004)(26005)(66946007)(66476007)(66556008)(6486002)(2616005)(41300700001)(2906002)(224303003)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFZBVFFOVmVBNzNPcExoN0U0NmVraFRBbWUzWmZybnZFQUdUQXhSam5taXE4?=
 =?utf-8?B?d1dmdlBXZWRoUnVYVkFIL1Z3bU56NjloREpCenhPMDZOc3E3Si93cVRINWhY?=
 =?utf-8?B?U1lxOHZGMFZKQ3RONnh4aDJTclVEVktCM25FMzh5VFVjOVg1a3l4QkpuNDJ5?=
 =?utf-8?B?bFkzUkc0U0dBWllTV0w4d1ovQmlIRTdTOHpYa1FMdERjcnhVMDlhdHNVVGR6?=
 =?utf-8?B?V2Ewd0FLMGRKZy9sYzZoTEI3SUp6blRpZzdJd1BiUHJtc1FBcTFlaGJlVDJj?=
 =?utf-8?B?MStFcndCajhCWk9oMHpoQWtnT1pWZHN1NGEzNFVSQ01pcGZZcDBxR1UzMzV0?=
 =?utf-8?B?ejBUQUFmc05vSHVVRTVTNE9GZEpZK0lXYWFFc2dFd0xadXRTNlE2bDU2SVFH?=
 =?utf-8?B?Q3l2aWxaWWJWOGFKbVRCSzdIelhoVFFnRnllYlg4SXNHV2VPSE0yQ0F3QXJl?=
 =?utf-8?B?elAwc0RHakRmNUgwd2VTazZHUVlxaWIrdThBLzcwV1BIa2lWazl1VFpsUWV4?=
 =?utf-8?B?N2NZaS9pb2FqY0trbnAyUEp5TnM3TzBQWDlTTnB1cXhpb1J1VWdHVTcrZDFY?=
 =?utf-8?B?Z0kzWE5TS1Z2OGNnTjMxMGUrb0ZRZk5hSzBZdnl0djRGN0Y0UFBrYVZiKzVF?=
 =?utf-8?B?NGtGKzRkMWo4NDNadVozY00zNlAyNFZGKzU3MWVCcE9IY3dOdnlld1ZGeTRV?=
 =?utf-8?B?akZBV01jQTdUMGIvSkplNURZVEdrcFF2OTVyQm1KUWQyNkVKTnRvQ096dk5t?=
 =?utf-8?B?QnFBWDVwZjVYaFJEUjc4S0orNTVSNUFFN241dHNLblFRSmxUSnVlUXlWMmRZ?=
 =?utf-8?B?d3ZCd2hrODlJa1hnUDIyOTBEWkxFdHlObGNxVDNFaTFFTW9sUnlqTVFhdlA0?=
 =?utf-8?B?M0tDNnN6UW1EUCtldXFVSUNoY3VlYkJYYlprRnZwWEEzcDZ2WEFLbmVKdDRN?=
 =?utf-8?B?YTBYK3dsWEoraXc3d3pSMVIrSURxM05wenJ1M05lb0pHaWM0TkVKNjNJQ3ZV?=
 =?utf-8?B?UzB1anJ4OWpMVTR5TzJWVDI2c0pQY0xXNDhybjFObVRiVWUzeEk5cURHL3Ri?=
 =?utf-8?B?bGszRk5MWmVpNWlzNEgySGdhMXV3a1l0WVJ3NFFRYkFyYndWTk95VjlabDk3?=
 =?utf-8?B?RzVRaHRjenBPY1VNOEc1bVJyWk92ZTFuL0F4dUN1dlB0T1R5OFMrRmxXU3cr?=
 =?utf-8?B?enlmM2pNVUFNUHpWYmJvbVdWNC8zUURPdkR6YmRmeWR6SVdyVXhwWUdnUmxw?=
 =?utf-8?B?NEVMYVlCS3dKNEkwbGNqNkpPWmlSU0VPTGxoSHZ6UnhJcEFHeXBjTkJtMzJH?=
 =?utf-8?B?YThQczI5QnNDUVJTNERrRlRGcHBWQzF6Sm1XNFlyKzdNS2c2UDN6RVh3M3ZT?=
 =?utf-8?B?a1ROM3FZMnJ5U05XOTVYTEpsVWF5NjArV2xmYVl1cHgwNUMvcndQa2RrS2o3?=
 =?utf-8?B?NUo0MzhqTlhxNGZJdm5EU2ZJMXNrSUYwNWhabmlROWFNQVA2TDQ1TGJNdFN3?=
 =?utf-8?B?Wk1DMEFDbndMRTY1NHBZb3FnT01KZ0g2UWljTVZUK09VU0J4QUkzd0tWL2F5?=
 =?utf-8?B?RHlPRHlOVzRyS1FGbmQwanV0T1RpYm00bmRpbmN1M2VsMnE3QXhJaFpXZUY2?=
 =?utf-8?B?S2oxRW01bkdXV3VudEtDdC9MRWtOVkZ5RG1VRkhEbmNtVUU1M2VJbWxDVDd2?=
 =?utf-8?B?djRUY04xK2VXQ25OdjByWHl2aUVkYXF0Q1RNS3d0VFVieHpHdFNma3dLaW9s?=
 =?utf-8?B?RitBWmMvWWVVWTU3aWRNZnZJNWlRSklqZnZQaXlqc25TVnBqVGxsVk9EM0U4?=
 =?utf-8?B?aWNhOE10MGFoYWpFWWp0V0pGalE0V1p6NjQ0U1c5bXBkdDB0U1o3dnBqL1F6?=
 =?utf-8?B?a0hGaDcrdldwRWRqNVpTaWkzR1hMUC8yUjFzL2lMOTZ1Mkdncko0SkFBZEFE?=
 =?utf-8?B?ek1HZEhyNzU1RmtqdUhmQTBHK2dERVllTHI5R0RCTTV1ZFEzMFlhSlJFcXJL?=
 =?utf-8?B?REJmVFdYMy9taE1jSlhqUG1PWmpKajBWQVpacGNRdzRRS0ZKSVB1b1FrWmFz?=
 =?utf-8?B?QXR2OUY0ZTM0UlVzRHhyc2UrMHF3bUF3d2tkUmxxQ3JLUWxEZUpkRk1IMEtr?=
 =?utf-8?Q?tHu5fhEcTw820p7ZAE+kdfW1y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d650ac6-3b1b-4168-c441-08dc10ebcf3d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 08:20:16.2633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bv7w6nmrYizSH2lWh7+ZGtZiU6oYhaqVH6fA7twxC8ALPaZ3dRgOi2fEOijH58qK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9055
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

--------------9c0tmmiApwu0kw877Dgrsec3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 09.01.24 um 09:09 schrieb 李真能:
>
> Thanks!
>
> What about the second patch?
>
> The second patch:   amdgpu: change proirity value to be consistent 
> with kernel.
>
> As I want to pass AMDGPU_CTX_PRIORITY_LOW to kernel module 
> drm-scheduler, if these two patches are not applyed,
>
> It can not pass LOW priority to drm-scheduler.
>
> Do you have any other suggestion?
>

Well what exactly is the problem? Just use AMD_PRIORITY=-512.

As far as I can see that is how it is supposed to be used.

Regards,
Christian.


>
>
>
>
>
>
> ----
>
>
>
>
> *主　题：*Re: 回复: Re: [PATCH libdrm 1/2] amdgpu: fix parameter of 
> amdgpu_cs_ctx_create2
> *日　期：*2024-01-09 15:15
> *发件人：*Christian König
> *收件人：*李真能;Marek Olsak;Pierre-Eric Pelloux-Prayer;dri-devel;amd-gfx;
>
> Am 09.01.24 um 02:50 schrieb 李真能:
>
> When the priority value is passed to the kernel, the kernel compares 
> it with the following values:
>
> #define AMDGPU_CTX_PRIORITY_VERY_LOW    -1023
> #define AMDGPU_CTX_PRIORITY_LOW         -512
> #define AMDGPU_CTX_PRIORITY_NORMAL      0
> #define AMDGPU_CTX_PRIORITY_HIGH        512
> #define AMDGPU_CTX_PRIORITY_VERY_HIGH   1023
>
> If priority is uint32_t, we can't set LOW and VERY_LOW value to kernel 
> context priority,
>
>
> Well that's nonsense.
>
> How the kernel handles the values and how userspace handles them are 
> two separate things. You just need to make sure that it's always 32 bits.
>
> In other words if you have signed or unsigned data type in userspace 
> is irrelevant for the kernel.
>
> You can refer to the kernel function amdgpu_ctx_priority_permit, if 
> priority is greater
>
> than 0, and this process has not  CAP_SYS_NICE capibility or 
> DRM_MASTER permission,
>
> this process will be exited.
>
>
> Correct, that's intentional.
>
> Regards,
> Christian.
>
>
>
>
>
>
> ----
>
>
>
>
> *主　题：*Re: [PATCH libdrm 1/2] amdgpu: fix parameter of 
> amdgpu_cs_ctx_create2
> *日　期：*2024-01-09 00:28
> *发件人：*Christian König
> *收件人：*李真能;Marek Olsak;Pierre-Eric Pelloux-Prayer;dri-devel;amd-gfx;
>
> Am 08.01.24 um 10:40 schrieb Zhenneng Li:
> > In order to pass the correct priority parameter to the kernel,
> > we must change priority type from uint32_t to int32_t.
>
> Hui what? Why should it matter if the parameter is signed or not?
>
> That doesn't seem to make sense.
>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Zhenneng Li
> > ---
> > amdgpu/amdgpu.h | 2 +-
> > amdgpu/amdgpu_cs.c | 2 +-
> > 2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/amdgpu/amdgpu.h b/amdgpu/amdgpu.h
> > index 9bdbf366..f46753f3 100644
> > --- a/amdgpu/amdgpu.h
> > +++ b/amdgpu/amdgpu.h
> > @@ -896,7 +896,7 @@ int amdgpu_bo_list_update(amdgpu_bo_list_handle 
> handle,
> > *
> > */
> > int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
> > - uint32_t priority,
> > + int32_t priority,
> > amdgpu_context_handle *context);
> > /**
> > * Create GPU execution Context
> > diff --git a/amdgpu/amdgpu_cs.c b/amdgpu/amdgpu_cs.c
> > index 49fc16c3..eb72c638 100644
> > --- a/amdgpu/amdgpu_cs.c
> > +++ b/amdgpu/amdgpu_cs.c
> > @@ -49,7 +49,7 @@ static int 
> amdgpu_cs_reset_sem(amdgpu_semaphore_handle sem);
> > * \return 0 on success otherwise POSIX Error code
> > */
> > drm_public int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
> > - uint32_t priority,
> > + int32_t priority,
> > amdgpu_context_handle *context)
> > {
> > struct amdgpu_context *gpu_context;
>

--------------9c0tmmiApwu0kw877Dgrsec3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 09.01.24 um 09:09 schrieb 李真能:<br>
    <blockquote type="cite" cite="mid:1uy9gy5eaet-1uyc0ts8e2e@nsmail7.0.0--kylin--1">
      
      <p>Thanks!</p>
      <p>What about the second patch?</p>
      <p>The second patch:&nbsp;&nbsp; amdgpu: change proirity value to be
        consistent with kernel.</p>
      <p>As I want to pass AMDGPU_CTX_PRIORITY_LOW to kernel module
        drm-scheduler, if these two patches are not applyed,&nbsp;</p>
      <p>It can not pass LOW priority to drm-scheduler.</p>
      <p>Do you have any other suggestion?</p>
    </blockquote>
    <br>
    Well what exactly is the problem? Just use AMD_PRIORITY=-512.<br>
    <br>
    As far as I can see that is how it is supposed to be used.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:1uy9gy5eaet-1uyc0ts8e2e@nsmail7.0.0--kylin--1">
      <p><br>
        <br>
        <br>
        <br>
        <br>
        <br>
        ----</p>
      <p>&nbsp;</p>
      <div id="re" style="margin-left: 0.5em; padding-left: 0.5em; border-left: 1px solid green;"><br>
        <br>
        <br>
        <div style="background-color: #f5f7fa;"><strong>主　题：</strong><span id="subject">Re: 回复: Re: [PATCH libdrm 1/2] amdgpu: fix
            parameter of amdgpu_cs_ctx_create2</span> <br>
          <strong>日　期：</strong><span id="date">2024-01-09 15:15</span> <br>
          <strong>发件人：</strong><span id="from">Christian König</span> <br>
          <strong>收件人：</strong><span id="to" style="word-break: break-all;">李真能;Marek Olsak;Pierre-Eric
            Pelloux-Prayer;dri-devel;amd-gfx;</span></div>
        <br>
        <div id="content">
          <div class="viewer_part" style="position: relative;">
            <div>Am 09.01.24 um 02:50 schrieb 李真能:<br>
              <p>When the priority value is passed to the kernel, the
                kernel compares it with the following values:</p>
              <p>#define AMDGPU_CTX_PRIORITY_VERY_LOW&nbsp;&nbsp;&nbsp; -1023<br>
                #define AMDGPU_CTX_PRIORITY_LOW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -512<br>
                #define AMDGPU_CTX_PRIORITY_NORMAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
                #define AMDGPU_CTX_PRIORITY_HIGH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 512<br>
                #define AMDGPU_CTX_PRIORITY_VERY_HIGH&nbsp;&nbsp; 1023</p>
              <p>If priority is uint32_t, we can't set LOW and VERY_LOW
                value to kernel context priority,</p>
              <br>
              Well that's nonsense.<br>
              <br>
              How the kernel handles the values and how userspace
              handles them are two separate things. You just need to
              make sure that it's always 32 bits.<br>
              <br>
              In other words if you have signed or unsigned data type in
              userspace is irrelevant for the kernel.<br>
              <br>
              <p>You can refer to the kernel function
                amdgpu_ctx_priority_permit, if priority is greater</p>
              <p>than 0, and this process has not&nbsp; CAP_SYS_NICE
                capibility or DRM_MASTER permission,</p>
              <p>this process will be exited.</p>
              <br>
              Correct, that's intentional.<br>
              <br>
              Regards,<br>
              Christian.<br>
              <br>
              <p><br>
                <br>
                <br>
                <br>
                <br>
                ----</p>
              <p>&nbsp;</p>
              <div id="re" style="margin-left: 0.5em; padding-left: 0.5em; border-left: 1px solid green;"><br>
                <br>
                <br>
                <div style="background-color: #f5f7fa;"><strong>主　题：</strong><span id="subject">Re: [PATCH libdrm 1/2] amdgpu: fix
                    parameter of amdgpu_cs_ctx_create2</span> <br>
                  <strong>日　期：</strong><span id="date">2024-01-09 00:28</span>
                  <br>
                  <strong>发件人：</strong><span id="from">Christian König</span>
                  <br>
                  <strong>收件人：</strong><span id="to" style="word-break: break-all;">李真能;Marek
                    Olsak;Pierre-Eric Pelloux-Prayer;dri-devel;amd-gfx;</span></div>
                <br>
                <div id="content">
                  <div class="viewer_part" style="position: relative;">
                    <div>Am 08.01.24 um 10:40 schrieb Zhenneng Li:<br>
                      &gt; In order to pass the correct priority
                      parameter to the kernel,<br>
                      &gt; we must change priority type from uint32_t to
                      int32_t.<br>
                      <br>
                      Hui what? Why should it matter if the parameter is
                      signed or not?<br>
                      <br>
                      That doesn't seem to make sense.<br>
                      <br>
                      Regards,<br>
                      Christian.<br>
                      <br>
                      &gt;<br>
                      &gt; Signed-off-by: Zhenneng Li <br>
                      &gt; ---<br>
                      &gt; amdgpu/amdgpu.h | 2 +-<br>
                      &gt; amdgpu/amdgpu_cs.c | 2 +-<br>
                      &gt; 2 files changed, 2 insertions(+), 2
                      deletions(-)<br>
                      &gt;<br>
                      &gt; diff --git a/amdgpu/amdgpu.h
                      b/amdgpu/amdgpu.h<br>
                      &gt; index 9bdbf366..f46753f3 100644<br>
                      &gt; --- a/amdgpu/amdgpu.h<br>
                      &gt; +++ b/amdgpu/amdgpu.h<br>
                      &gt; @@ -896,7 +896,7 @@ int
                      amdgpu_bo_list_update(amdgpu_bo_list_handle
                      handle,<br>
                      &gt; *<br>
                      &gt; */<br>
                      &gt; int
                      amdgpu_cs_ctx_create2(amdgpu_device_handle dev,<br>
                      &gt; - uint32_t priority,<br>
                      &gt; + int32_t priority,<br>
                      &gt; amdgpu_context_handle *context);<br>
                      &gt; /**<br>
                      &gt; * Create GPU execution Context<br>
                      &gt; diff --git a/amdgpu/amdgpu_cs.c
                      b/amdgpu/amdgpu_cs.c<br>
                      &gt; index 49fc16c3..eb72c638 100644<br>
                      &gt; --- a/amdgpu/amdgpu_cs.c<br>
                      &gt; +++ b/amdgpu/amdgpu_cs.c<br>
                      &gt; @@ -49,7 +49,7 @@ static int
                      amdgpu_cs_reset_sem(amdgpu_semaphore_handle sem);<br>
                      &gt; * \return 0 on success otherwise POSIX Error
                      code<br>
                      &gt; */<br>
                      &gt; drm_public int
                      amdgpu_cs_ctx_create2(amdgpu_device_handle dev,<br>
                      &gt; - uint32_t priority,<br>
                      &gt; + int32_t priority,<br>
                      &gt; amdgpu_context_handle *context)<br>
                      &gt; {<br>
                      &gt; struct amdgpu_context *gpu_context;<br>
                      <br>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------9c0tmmiApwu0kw877Dgrsec3--
