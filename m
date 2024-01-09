Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14455827F16
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 08:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535C610E366;
	Tue,  9 Jan 2024 07:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658A0899D4;
 Tue,  9 Jan 2024 07:16:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJC4Cl5niSEn4XyewwUkoMdpHNzvG0UNpdQSvXr/dAB7/O5/kitiUx+kLBO2l8Lep58GNlpe4GIdnCxUthg9q3r1Cvk1cqIQF+ah0Kw+TeQ9HlGgigawP4mu+AVx2UmDoRG4pKnZQtDK8nq7slQnitq3YGyzblD1sMGeO+etmbrPZv80uP6Zkdbk2FtEqWyb+NZSTU0B5UN8jJXsfbO2HvIfh4CC3WoeJ1UbF1Tcds72E1cIzrgnqpaOOVgrIRd3aFsx8hjwkMMu7TPK0TeywPv3WbrfF/mUQsYyvcSFQRZSeKbNPyvsjypkGatuDMYdFbohBChXJZDuwsT2jnD4OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4B4HXS0Any3dtnzSlYxkwGkWT+7JgBN/1wCFpPIqik4=;
 b=k+IaIm0O+zb3cjA3D8k0e+GRGjpqCEf8OnXDG5ioys2LgP74X4N5CehWUNEQ7TivMgUPJNYTsfltExpuFZgEZY1b4hxsuAkSWshff9R+MqVWHxkj4d8nfWlsTH1AUcEqojxOigkhjOxu1r0cmUAmUB3egOHSOQ9Nh/qyABsbjTYFoAlj6EIyU/uxkd648WlJopisqz6/sbVi8FMqjkOLFyNVQkjPu2NhvlUgTyOpSqReP5vJsBQJl6XMaE0TYIqZQ5UU3WzarU9Ph6p3G+Otam+sw1+xvHAGAk1J69yUPLzGmtWhi94dakiW1Cxx1l3yzAtWYp6suOUGdZ+9VCSDhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4B4HXS0Any3dtnzSlYxkwGkWT+7JgBN/1wCFpPIqik4=;
 b=WIHbz1V4Kueoa7Oike5Bd8U763OgvPq9jUBKOdzN+ULxmxPVe2owY9QNmtmpF2ePTZznQ+LT4tb8WgVyvrOmK9Zs+Ee8/m2fFmQ+SxStw1CgJecgtn8mJIMystOX297AzggCF1Um4j+7lZvIGUuuREV1+nDR1RhL6NZI+mUQj4k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 07:15:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 07:15:59 +0000
Content-Type: multipart/alternative;
 boundary="------------BMstbln6oo6DnkPiJQzsOB1m"
Message-ID: <32ffe817-498b-48ba-bc33-3fc0fa3fb8dd@amd.com>
Date: Tue, 9 Jan 2024 08:15:53 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogUmU6IFtQQVRDSCBsaWJkcm0gMS8yXSBhbWRncHU6?=
 =?UTF-8?Q?_fix_parameter_of_amdgpu=5Fcs=5Fctx=5Fcreate2?=
Content-Language: en-US
To: =?UTF-8?B?5p2O55yf6IO9?= <lizhenneng@kylinos.cn>,
 Marek Olsak <marek.olsak@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>
References: <xrg6qu5muv-xriqmgzqig@nsmail7.0.0--kylin--1>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <xrg6qu5muv-xriqmgzqig@nsmail7.0.0--kylin--1>
X-ClientProxiedBy: FR4P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::20) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB5676:EE_
X-MS-Office365-Filtering-Correlation-Id: 07612bf7-21a5-41bb-bb43-08dc10e2d42f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PtGCCvowDrjMq0PjzE+6oOeo3Z9IaaXzLqmc5S0feKirSnfMX3ls7LZXTv5dnmLFyY3mr5sDtVRDQyg+Lom0Fh3kgj1WusJxa1UVOPlppti8P4kf7eGArEaWqewStakj4IZos1/FhKP6dTsTR0UvvWB1WUdE1rhcmaPPHIZaq99HuZy4X1/yQ3S2FI7UdNoaZQ2VZd36mNeUyh+23iZCR/yR5Nizi4IXfg9Janr+D2EacLL4ae+0xuIAFzZou5+mx4YZckqS61qxfysxkQuXk9JMRT3WmQ3Hh9Fc3nee1QctvM2UF4FI7pyQLfY/2E2uVPjVZDdHN1zJ9mUPezjwmN+dUbeuW9lsQMUzNj68uQzg6bVnVppoN2u6EA0EF0hVDoDiVMZ2RK1VWHYJSqyNMnypt9Fqg+3yXU5OEf90L+abAofQaVFm1v0atVpEN0l6Db8O133NfShYkTP+zWWcXwKdSRuRGkSy7uTkunHnJotKmsxraLtM0JipP03h5pByal2WxdiDm9KJ/s7IdlmlY17L8xsVbXTNlniY/3eQ+fZ8YCiIBGCbxI3DhXGT60Meta1w39XKtGPNUuhXKza0QgZPp4maoQTQ5qbevdu5CJeuBr0Rv/MmGL26WO+mNv2RgWLl6XFXyOPDi2Zlnv3v4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(26005)(66574015)(5660300002)(6512007)(38100700002)(33964004)(2616005)(31686004)(6506007)(6486002)(31696002)(6666004)(478600001)(66946007)(110136005)(66476007)(66556008)(316002)(8936002)(36756003)(224303003)(41300700001)(86362001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnhzUTBPVTFMQ3RzL0phSTNDeThnNVphZ0p3TnZOZXFVUkQwRU5oUnZ3VjJC?=
 =?utf-8?B?WkNzc3JEUDJ2U0xqOU5TSVN3dk0zemVUN0orQzArd0gwNTNOYlJKT2QwdFdn?=
 =?utf-8?B?NjZZU2VBVmlvcXJPd1FrSGtzK0cwdEduYmUxUThrVFU4UVJjeHB5eitnRTZP?=
 =?utf-8?B?dnp2dWZRbHlSYkNERVE4V0ZQeHRGZ1dKNm56K3k3ZHpYNmJNZWhlRUhTWlJU?=
 =?utf-8?B?eU1OdjRJUkEvNmxTUUhRZEtMSzN5cW51Z0VWTXZzYlg5c2dvMU1ySDhPV1kz?=
 =?utf-8?B?ODQ1MHJCbUN6NUtvYWU5N3FlTzhKUmQ3UVpURTVxajhqbmNDRi9ralhDTlNj?=
 =?utf-8?B?cEQ3WUdienFhL2c2R0JRQzl4cUdYckdHYXZQWnBtb1A1MHUxNVJONzJKNmNx?=
 =?utf-8?B?MUFSdVVDeUVoY0lBbHIyUUY0NytjenY4VG13UHA1b01EZ2hGaCtibldWa2hs?=
 =?utf-8?B?eTNFV0R0VXFvc1BkTWd0OWxvQTJGZHpSbDVwUDNZWkxLUjZSdUVjUUZKUUQ1?=
 =?utf-8?B?OGhxNkhBQUZOcGNnUWZFdUd6cVBuL3lJQXlMR0hMZ0xrTy9ab1FQSTFOK1NU?=
 =?utf-8?B?RUQwS2lDd2pjbm8yYi85UUpydTBRVTlkOHloa0lLbXZxdE5UUVorQmRHYS85?=
 =?utf-8?B?TUpENHhZZ1Frd0VoWmlueWRHVnBPMXg2YVd3WXZkT3VmUTNvRnVPTTdXakpK?=
 =?utf-8?B?OWNmM3BrUUk4Ykx4cEdza1NaRVo3NFBWRlFaQkt2T3l2Wld1YVlHbDNiMmdo?=
 =?utf-8?B?aFZqT0FSTmJDSytiSnNDdDJEaktsQnY1eXphSTlJVC94SVBYTE9qNC9yY3NM?=
 =?utf-8?B?bThqTUxXL0NnVklWcVNPMnVYeDNOQWhKcHZxRVpET1UyMGM3QjFsRHgzQUFa?=
 =?utf-8?B?V3NRK3ZjNm91c3UrWHlYdFVKazJKZVJlRmxpdEVkdEFKYUFuTDJEYm9MaVpr?=
 =?utf-8?B?LzgxamNNUlowUVI2TjlJOGxIY3IvNzZCNjdyaWhzUS9IczRPb0EvMzFuUzc2?=
 =?utf-8?B?VCs2RkY3SVpPc3NpdUV4WlA3SzdjZTZ4MmRvMm9CdFBtU1JuTlg5RVh1Z1VK?=
 =?utf-8?B?T0Y3ZXZHSUJwSFJ3a3RscFJpUHZqeXk5Wm5NcHhrSWYwZEw0b1ZBYi9JT0t2?=
 =?utf-8?B?RjFtREFRaTBpYzl4MkZvOXJDMGVQcUkxL1BOUmlTU1NiZ2xHTDNWeE16b2VG?=
 =?utf-8?B?aHRtbGxDNHMvQTR1QlJFMExqV2d6MXJlbUF5K2tFd3JONDVLN3JONVgzMkhq?=
 =?utf-8?B?blVFaHRMYkdXVHpscXYxS0lQeHdRWDJCNXBDaTNKcHhsdy9yQ3k4Mi9oMy9C?=
 =?utf-8?B?YWtzc2dYdVpsLzYycnB4TlhhRmlDU2cwbVNJM1NGcTZSbVpXNDNuRVorWDJG?=
 =?utf-8?B?OThhNVhyTTVFSjdldmpNSTFFakcxeGF6V3Q5TWJTSEFBUkxvZkZOdXRjejZr?=
 =?utf-8?B?OFR0TzlLYmI5Q0t0VGZWVHg0MGlDTmNuUlpEN3VFVGU2VHFWS1ZRTGd3OVBU?=
 =?utf-8?B?OFFUT2QvZTdtQ0luTVVRRmw5YVJqUEtlUy9LL0lyQU9PNWNhTHlvbFNrOXB3?=
 =?utf-8?B?UEowUnY1RnRUdzZDSHVLWjR3TGQ1clFsM1hpNlJudnU1VWtxZmpwL0pTekda?=
 =?utf-8?B?QUV4MDNyVlZkQU04aHYxWmhuM2NuSHE4dERjR24reUhpMzErbm5WSFNpai9x?=
 =?utf-8?B?M0VCNks3Y2U2QmcxNyttMXYyZUQzbUVQalJlREpST0tOSlZKcTFLdk8zS2lR?=
 =?utf-8?B?QjFLTnVrRjNkb0dWdlI3Z24yTkNVd2VONmR1VTFwWTA5aGxDeUhHUDB0RjVl?=
 =?utf-8?B?T2dMQ3VGZjRYcU5DY1BYaEM5MWtXMXpaeXE4YXN0YnJ3RXhQK243NFNaNEtT?=
 =?utf-8?B?dEJhZHQveTVGclEyc2dlM1NQdkw3TGg5SjVFMkNiZzZhUlNLTERsTmdlWTZ5?=
 =?utf-8?B?cXV4Qmo1N1I5VDcrT1FybmljTWRoc3VKay9obHMwdktTbkxDNG05bThQM1Q4?=
 =?utf-8?B?TThibFFaOENOcmRYRTFXejlUcmVTSW1PTDh3TUo1YVZhcm02UUFqeDJ6SU5X?=
 =?utf-8?B?bUVyMnZmeHhWOEdtTVR3bjZUYWVJQ2hjK3lDQzI1UlMyRE0xa3BFNnZWUHIx?=
 =?utf-8?Q?62vUp1p8JnfWsnEDnQgwQCFgQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07612bf7-21a5-41bb-bb43-08dc10e2d42f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 07:15:59.4435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHfBTkDeztdUvndFegla5tRWR1qptvyNB+m+2jD9ftEL/YMOq1TJUzHJaSuQ2164
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5676
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

--------------BMstbln6oo6DnkPiJQzsOB1m
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 09.01.24 um 02:50 schrieb 李真能:
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

Well that's nonsense.

How the kernel handles the values and how userspace handles them are two 
separate things. You just need to make sure that it's always 32 bits.

In other words if you have signed or unsigned data type in userspace is 
irrelevant for the kernel.

> You can refer to the kernel function amdgpu_ctx_priority_permit, if 
> priority is greater
>
> than 0, and this process has not  CAP_SYS_NICE capibility or 
> DRM_MASTER permission,
>
> this process will be exited.
>

Correct, that's intentional.

Regards,
Christian.

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

--------------BMstbln6oo6DnkPiJQzsOB1m
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 09.01.24 um 02:50 schrieb 李真能:<br>
    <blockquote type="cite" cite="mid:xrg6qu5muv-xriqmgzqig@nsmail7.0.0--kylin--1">
      
      <p>When the priority value is passed to the kernel, the kernel
        compares it with the following values:</p>
      <p>#define AMDGPU_CTX_PRIORITY_VERY_LOW&nbsp;&nbsp;&nbsp; -1023<br>
        #define AMDGPU_CTX_PRIORITY_LOW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -512<br>
        #define AMDGPU_CTX_PRIORITY_NORMAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
        #define AMDGPU_CTX_PRIORITY_HIGH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 512<br>
        #define AMDGPU_CTX_PRIORITY_VERY_HIGH&nbsp;&nbsp; 1023</p>
      <p>If priority is uint32_t, we can't set LOW and VERY_LOW value to
        kernel context priority,</p>
    </blockquote>
    <br>
    Well that's nonsense.<br>
    <br>
    How the kernel handles the values and how userspace handles them are
    two separate things. You just need to make sure that it's always 32
    bits.<br>
    <br>
    In other words if you have signed or unsigned data type in userspace
    is irrelevant for the kernel.<br>
    <br>
    <blockquote type="cite" cite="mid:xrg6qu5muv-xriqmgzqig@nsmail7.0.0--kylin--1">
      <p>You can refer to the kernel function
        amdgpu_ctx_priority_permit, if priority is greater</p>
      <p>than 0, and this process has not&nbsp; CAP_SYS_NICE capibility or
        DRM_MASTER permission,</p>
      <p>this process will be exited.<br>
      </p>
    </blockquote>
    <br>
    Correct, that's intentional.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:xrg6qu5muv-xriqmgzqig@nsmail7.0.0--kylin--1">
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
        <div style="background-color: #f5f7fa;"><strong>主　题：</strong><span id="subject">Re: [PATCH libdrm 1/2] amdgpu: fix parameter of
            amdgpu_cs_ctx_create2</span> <br>
          <strong>日　期：</strong><span id="date">2024-01-09 00:28</span> <br>
          <strong>发件人：</strong><span id="from">Christian König</span> <br>
          <strong>收件人：</strong><span id="to" style="word-break: break-all;">李真能;Marek Olsak;Pierre-Eric
            Pelloux-Prayer;dri-devel;amd-gfx;</span></div>
        <br>
        <div id="content">
          <div class="viewer_part" style="position: relative;">
            <div>Am 08.01.24 um 10:40 schrieb Zhenneng Li:<br>
              &gt; In order to pass the correct priority parameter to
              the kernel,<br>
              &gt; we must change priority type from uint32_t to
              int32_t.<br>
              <br>
              Hui what? Why should it matter if the parameter is signed
              or not?<br>
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
              &gt; 2 files changed, 2 insertions(+), 2 deletions(-)<br>
              &gt;<br>
              &gt; diff --git a/amdgpu/amdgpu.h b/amdgpu/amdgpu.h<br>
              &gt; index 9bdbf366..f46753f3 100644<br>
              &gt; --- a/amdgpu/amdgpu.h<br>
              &gt; +++ b/amdgpu/amdgpu.h<br>
              &gt; @@ -896,7 +896,7 @@ int
              amdgpu_bo_list_update(amdgpu_bo_list_handle handle,<br>
              &gt; *<br>
              &gt; */<br>
              &gt; int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,<br>
              &gt; - uint32_t priority,<br>
              &gt; + int32_t priority,<br>
              &gt; amdgpu_context_handle *context);<br>
              &gt; /**<br>
              &gt; * Create GPU execution Context<br>
              &gt; diff --git a/amdgpu/amdgpu_cs.c b/amdgpu/amdgpu_cs.c<br>
              &gt; index 49fc16c3..eb72c638 100644<br>
              &gt; --- a/amdgpu/amdgpu_cs.c<br>
              &gt; +++ b/amdgpu/amdgpu_cs.c<br>
              &gt; @@ -49,7 +49,7 @@ static int
              amdgpu_cs_reset_sem(amdgpu_semaphore_handle sem);<br>
              &gt; * \return 0 on success otherwise POSIX Error code<br>
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
    </blockquote>
    <br>
  </body>
</html>

--------------BMstbln6oo6DnkPiJQzsOB1m--
