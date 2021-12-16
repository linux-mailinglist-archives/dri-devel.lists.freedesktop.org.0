Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E998476BB5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 09:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54C610E2BF;
	Thu, 16 Dec 2021 08:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE5310E2B8;
 Thu, 16 Dec 2021 08:15:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahH0PCIlQuGzK8b5jo3XcaUWDuEs083wBKZIlwi4FyEYyxIai8iK5buxAzba22+EdMvk6FIv/cQ0H98tXxLIBT/b/FkLIeYcuRTu/x0WrPpdn06XmEYVG0SpU0Xc872wM1kuZtIv13V+wWRPhyHyDG9ow3eK+uR4As3RtyYnk2VNe8MU9qPUhOSexh99grRHHwVOTwPACIOrJ5Ndt08NbhRaMJirCRqmrVV2e2bsnPpvqUffDQ3cmzfy+JWHD+qipY6TCOCV/drwcIwG4X8Xn7jJe5eyLthjvVhFymslUMr9g51YSNbcVsQzlu49kBCrU14S6W5IOXss7GSgWexIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMsQQLgtaC0FO4+h/pmdzV6iFfDJt17pC6kDaM3ICcA=;
 b=C0kT9dpDL01c3MSlDt6HiWKvBkGuB2a1CnUxzmkFIAI+IeLwR1/rQaSZgLH1cNR4nfKFG85ddZowHnzAbV56f8ZVqUHs9teg6ChTJwE09AOOpmTALRXYQEh/Gr+h75Wqa08LKsQdeYQG+5QNTtCORED1Y7JiIS3ZiwHm1W5/Dl0n8vfPutzkBdrYyMlwfO8o0hLIPHtCRpSGiEVy+QY3djReki5Pnd9KBQrmvNH6dXKZ9ng9gvZOZUsW1MPWR41SLHr5WWCz7kRjmqyzzkm/48MNM1w0LvhpuZfDsEgnsTNVxTU/THtKDmPQgA2IQ6jeT9zLfdxnr6My6rVk1/K0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMsQQLgtaC0FO4+h/pmdzV6iFfDJt17pC6kDaM3ICcA=;
 b=A7kgdvthm5+iEM9TIsdIMTo2g7cglgSP92r15mrdf/l6T3VtpzXrr44eTXi9fplbzRbdRqIri1p3M9vE6Pa0ZAPlZepzjeTwdl9cV8JUwhFAkkiJK4AyP0OHJjr+eQ1QQ1WD1MUSlvep+EyPa5zgaF2NEda4sspZxAaxsAT6t0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4586.namprd12.prod.outlook.com
 (2603:10b6:303:53::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 08:15:27 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4778.018; Thu, 16 Dec
 2021 08:15:27 +0000
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogZml4dXAg?=
 =?UTF-8?Q?bad_vram_size_on_gmc_v8?=
To: =?UTF-8?B?5ZGo5a6X5pWP?= <zhouzongmin@kylinos.cn>,
 Alex Deucher <alexdeucher@gmail.com>
References: <q0npc15ith-q0npc15iti@nsmail6.0>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b0ec23d3-933b-d04d-26d8-ab3cd6363c48@amd.com>
Date: Thu, 16 Dec 2021 09:15:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <q0npc15ith-q0npc15iti@nsmail6.0>
Content-Type: multipart/alternative;
 boundary="------------C428A7FE6F5323675A36310D"
Content-Language: en-US
X-ClientProxiedBy: AM7PR03CA0009.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::19) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56bf5564-d4be-4f46-3125-08d9c06c374b
X-MS-TrafficTypeDiagnostic: MW3PR12MB4586:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB4586CBD8EE84500C1A1EAC3183779@MW3PR12MB4586.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: No8fx71XpKGMcMZCZObPVejnTpxqJ6N4gLH2uSg00HgrghNTpUHMj+PS0z3uQCsmKkZ/l+/c6/HTQqsjbKmnbMptj6a2zaodICFjZ7dnvxaa7BR/5JiwUkIKeW4PWCiXSfkGXzrTNyOLKUx6ytm/4Pv+fLltfUrHhlHlXOGlUhLEHzVRG3rj55pFfRFKCyO4IRa/RdiP0sgmhcJBOvXFgkQ718cn4wJcB1XYbNpWOaNHqYUpopUd5PeaBPHIbvRcnvYFMGXGDn6pVG3kZUU7eFFQwr5DB89c/yCdKJEGhhFyt7HWvscCttlvamvjIaNPH9kpnKw9pkS/t46/1On0N2S5b6gZa+wcrUy4w8Wh+K8EkILUN2L+UpQlzI1vcJk+E5njvCMt9OpzA5gvgIjyRaYJRvXVmcoufX1Jo63Hfuz9/CH/puWfPhuuRSIcQuCx9fHN9+8U3jp+kdR66RJXknXhDNTzrzl+C/LF8jIluZHaOsNRUZjG5aUNtrau4sk7Ojj2t4325XlMis2FA+Z4h4xQQ2GthCCSXyRINVj7RtKpCSf0NShMxiLKhCHHQ5tZWFt392VoTNf9FFK/5i70u3/YihyKS1HQYaWkAHxvU82PJBBQqbnbmemHbejv3FM/avmYjlwxf+QFCCvAw3PTxP4LENx0Km/HSN5qWJlBrexvA+//ch4T0FKbn+c+0lINWlDrwsDTYWlXWkLCpiIEiCW5kB7RZ6BbdcQRgUaBGvcB5+o8vStt8nblpKJgSjFtNBxmB6c+ZdBvmX1DNQRVPOE+++dUrXglQXNRJ1OtxJk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(186003)(8936002)(31686004)(36756003)(508600001)(31696002)(86362001)(6512007)(6486002)(5660300002)(6666004)(316002)(4001150100001)(6506007)(54906003)(110136005)(38100700002)(4326008)(224303003)(66556008)(66476007)(33964004)(66574015)(83380400001)(26005)(2906002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dExkRWtzNHg0NVY1a3FyWWdLcE9pVWxZY013M2tIRVEyeWVvNWFPOXc2eGVN?=
 =?utf-8?B?MkpmZk15MGZTOVVjOHdMbUQvK1VwRmx0VWRPelB1RXFLM2JXMStISkhsbzlv?=
 =?utf-8?B?M2ZGdjU4MmQxY0h4TnZlVGhSWWlYTVdKdFZ4OGNydjkyTm1tVXNENFVWbFE3?=
 =?utf-8?B?MUZOYi9pcEV3cERMY3JkWFN1bXJJdnYwZzJ2TkRuNFl6U1ZmK1luUjh6TWtu?=
 =?utf-8?B?bmRrR1JQZlFLSnFVMXBNNG9NYUVkZW1ZYllQYzdQbHM1ampjRklPOE5YUlVy?=
 =?utf-8?B?YktUTzBESk1CODhVSFJFN1c3M2NyV0d0eHhFTmhBMVFKOUo5bXJNZzRhZmdm?=
 =?utf-8?B?NHF3eCtTeDF3T3hDOGRBRTFOeFY1VUVDVEFOUkIzcEVsaUhSaFZ4NnFyRkto?=
 =?utf-8?B?MUZjTVhaaTBnYng4d1pxTEFiTmFYa3BHTko1eFVHZlpSanpuYytqZXN4dVIv?=
 =?utf-8?B?bmwyQ04xa1FrbE13OTZ6V1RXKytKbkZ6NU9wR0FQUXhNNmZ0a2tLZTB4d1py?=
 =?utf-8?B?WlFaYVBhampTMkQ0L3E1SzcrM0ZjZHdtTlQ1ZDIwYUZpUmJ1eW5ITEpSaEQ1?=
 =?utf-8?B?SG5tYkZ1Yi9ZSDAzTXhGdzB6L05LN3NUU2xKUy9zS1hYc0tWYlJxK3N3Njk4?=
 =?utf-8?B?QUpDL3o5aGtLR3JabUR5eDhxNUo2SWNobU5MOFhselBJMkk0ZDBCRFk3YjFx?=
 =?utf-8?B?Y0hFR2w1VnUzQlphU3R6TjB0VjczKzVYRkRZeFBxNTRxOElUWVo5SVMxWnZi?=
 =?utf-8?B?Q3AyQ3pEbjV0ZHBhNmJKR2w3U2Rmd0VRMjIxNEhPbXFXQ1d1MmsxMmRHSmg0?=
 =?utf-8?B?UGY4S2lHUmVFOWRGOUxwamFDNTI2dkVrdkNVK0VtaURHZXpVT043Y1R0b0hP?=
 =?utf-8?B?SmtGazZBbWxZMVJIM2crTGduVzZ4Ny9tTmlZLzE5RHJjdFhFTnorQVM0WXhU?=
 =?utf-8?B?NEIreE1jS01Jd2lsVGtvRFU1Yzl3TXNTNWtsejdWOG5PbkFhQnBtemt4bnVD?=
 =?utf-8?B?RmE5Nzh4aGtJOXNiUEhUcFVtUTdTYjljb2xleXZDbUs2U3BocFBuZ0JBWXpB?=
 =?utf-8?B?dXhvVXFVNlIySnU3NFd5UmRncVYzRU1YZk92OVFTMUdLVVJOeklINkphSHBR?=
 =?utf-8?B?bDFzdGc4NFFUNGR2QzlacElmQm1qV2FOd1VGQTVOcFplTmlncUNzRUsweXBa?=
 =?utf-8?B?Wk1FSGpjcXRwdklmRml2cWY2Z1poOTdKSVZuNlhaNmI1UnBkUFNSaENDaGVP?=
 =?utf-8?B?Y2hTaVJUTHVQQnRvZDlKT2lNMC81VFhNa25BamNOWEx5L2l4RmxFVGZkclpX?=
 =?utf-8?B?Mkt6SzRMM2ZTUThMQ0Q0Yi91M05zVDk2TjQwZlFndHlSUXpOZWhOSk1IS2Rp?=
 =?utf-8?B?NlVZTGdmTGtRZFJEbkNMVUwwemhKMldlSEtxYkZ1MjZ3M2x0bi8xditVa3dy?=
 =?utf-8?B?RHAxVlBmb1E4S0JFYXoweFZPNTBWUHNJNmZZNTlZYnVGMHh2bHhqYzZUNkFS?=
 =?utf-8?B?NFE4Zno1ZmVhajBxRjB2RVAzdDZ0RVVmQUlCcTNmV3FmYkxVMjIxZ3V4cTR5?=
 =?utf-8?B?MEZ6R05IeTZ4dWxmbUdBK2orMGVBaDRod3ArbjVqQ3JXUXNpMGdzY2p2MGhx?=
 =?utf-8?B?KzFQQWlMSGFwQjdZOW5vamxsb1RRTEo0aGZQTmU3OW5idVFLWVB4ZzlSdGk4?=
 =?utf-8?B?STFLOEdtNUpQcHVpMHVGNGxDUTM1RzlaMkRmNW9lTE9zamx0enVVUmIrczZk?=
 =?utf-8?B?elh3am9jc0tWbndaMno0aWNvTEpzK0Z3RDRKZ2NzVU5pS3c5UmdIYWZXSHE3?=
 =?utf-8?B?TW1hRjYyd3VyUEUyR0UzbWh6NnpNVTNQbW5sMks3dDkzL2cxaVYyYlpSTE9P?=
 =?utf-8?B?Y0FUeDFKZmIrSjVvY1VHODdlMkZpWitSK1M3eC9BeVdreWRXaGVteGcwV2Jl?=
 =?utf-8?B?YlM3dCs5ZzE4ZEZ0VExmcVNNbEE1K2hxRTE2aU5ZTmdLWThRajhwWjhDZ1pi?=
 =?utf-8?B?NmFiMjRwVnZZc056ODlSRk1wNWV2WnZnc3NmdGxia3lqT3pFQU9vekJaS2RJ?=
 =?utf-8?B?VjJudzVISHJwdXYvZHhMK05TMkowTkZIWWxwWHV3Yzh2d0N5RWNSSWMwcjRD?=
 =?utf-8?Q?TceU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56bf5564-d4be-4f46-3125-08d9c06c374b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 08:15:27.0299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 68MqEO1JixeCMipVZZgW8waYEuc7vzSP6pGKIYQg5TrRgsaqT3gJmIKl50fl2jZu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4586
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------C428A7FE6F5323675A36310D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Zongmin,

that strongly sounds like the ASIC is not correctly initialized when 
trying to read the register.

What board and environment are you using this GPU with? Is that a normal 
x86 system?

Regards,
Christian.

Am 16.12.21 um 04:11 schrieb 周宗敏:
>
> 1.
>
>     the problematic boards that I have tested is [AMD/ATI] Lexa PRO
>     [Radeon RX 550/550X] ;  and the vbios version : 113-RXF9310-C09-BT
>
> 2.
>
>     When an exception occurs I can see the following changes in the
>     values of vram size get from RREG32(mmCONFIG_MEMSIZE) ,
>
>     it seems to have garbage in the upper 16 bits
>
>     image.png
>
>
> 3.
>
>     and then I can also see some dmesg like below:
>
>     when vram size register have garbage,we may see error message like
>     below:
>
>     amdgpu 0000:09:00.0: VRAM: 4286582784M 0x000000F400000000 -
>     0x000FF8F4FFFFFFFF (4286582784M used)
>
>     the correct message should like below:
>
>     amdgpu 0000:09:00.0: VRAM: 4096M 0x000000F400000000 -
>     0x000000F4FFFFFFFF (4096M used)
>
>
>     if you have any problems,please send me mail.
>
>     thanks very much.
>
>
> ----
>
> *主　题：*Re: [PATCH] drm/amdgpu: fixup bad vram size on gmc v8
> *日　期：*2021-12-16 04:23
> *发件人：*Alex Deucher
> *收件人：*Zongmin Zhou
>
>
> On Wed, Dec 15, 2021 at 10:31 AM Zongmin Zhouwrote:
> >
> > Some boards(like RX550) seem to have garbage in the upper
> > 16 bits of the vram size register.  Check for
> > this and clamp the size properly.  Fixes
> > boards reporting bogus amounts of vram.
> >
> > after add this patch,the maximum GPU VRAM size is 64GB,
> > otherwise only 64GB vram size will be used.
>
> Can you provide some examples of problematic boards and possibly a
> vbios image from the problematic board?  What values are you seeing?
> It would be nice to see what the boards are reporting and whether the
> lower 16 bits are actually correct or if it is some other issue.  This
> register is undefined until the asic has been initialized.  The vbios
> programs it as part of it's asic init sequence (either via vesa/gop or
> the OS driver).
>
> Alex
>
>
> >
> > Signed-off-by: Zongmin Zhou
> > ---
> >  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c 
> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> > index 492ebed2915b..63b890f1e8af 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> > @@ -515,10 +515,10 @@ static void gmc_v8_0_mc_program(struct 
> amdgpu_device *adev)
> >  static int gmc_v8_0_mc_init(struct amdgpu_device *adev)
> >  {
> >         int r;
> > +       u32 tmp;
> >
> >         adev->gmc.vram_width = amdgpu_atombios_get_vram_width(adev);
> >         if (!adev->gmc.vram_width) {
> > -               u32 tmp;
> >                 int chansize, numchan;
> >
> >                 /* Get VRAM informations */
> > @@ -562,8 +562,15 @@ static int gmc_v8_0_mc_init(struct 
> amdgpu_device *adev)
> >                 adev->gmc.vram_width = numchan * chansize;
> >         }
> >         /* size in MB on si */
> > -       adev->gmc.mc_vram_size = RREG32(mmCONFIG_MEMSIZE) * 1024ULL 
> * 1024ULL;
> > -       adev->gmc.real_vram_size = RREG32(mmCONFIG_MEMSIZE) * 
> 1024ULL * 1024ULL;
> > +       tmp = RREG32(mmCONFIG_MEMSIZE);
> > +       /* some boards may have garbage in the upper 16 bits */
> > +       if (tmp & 0xffff0000) {
> > +               DRM_INFO("Probable bad vram size: 0x%08x\n", tmp);
> > +               if (tmp & 0xffff)
> > +                       tmp &= 0xffff;
> > +       }
> > +       adev->gmc.mc_vram_size = tmp * 1024ULL * 1024ULL;
> > +       adev->gmc.real_vram_size = adev->gmc.mc_vram_size;
> >
> >         if (!(adev->flags & AMD_IS_APU)) {
> >                 r = amdgpu_device_resize_fb_bar(adev);
> > --
> > 2.25.1
> >
> >
> > No virus found
> >                 Checked by Hillstone Network AntiVirus
>


--------------C428A7FE6F5323675A36310D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Zongmin,<br>
    <br>
    that strongly sounds like the ASIC is not correctly initialized when
    trying to read the register.<br>
    <br>
    What board and environment are you using this GPU with? Is that a
    normal x86 system?<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 16.12.21 um 04:11 schrieb 周宗敏:<br>
    </div>
    <blockquote type="cite" cite="mid:q0npc15ith-q0npc15iti@nsmail6.0">
      
      <ol class=" list-paddingleft-2" style="list-style-type: decimal;">
        <li>
          <p>the&nbsp;problematic boards that I have tested is&nbsp;[AMD/ATI] Lexa
            PRO [Radeon RX 550/550X] ;&nbsp; and the vbios version :
            113-RXF9310-C09-BT</p>
        </li>
        <li>
          <p>When an exception occurs I can see the following changes in
            the values of vram size get from RREG32(mmCONFIG_MEMSIZE) ,</p>
          <p>it seems&nbsp;to have garbage in the upper 16 bits&nbsp;</p>
          <p><img src="/nsmail/js/ueditor/php/upload/image/20211216/1639623655693645.png" title="1639623655693645.png" alt="image.png" moz-do-not-send="true"><br>
          </p>
          <p><br>
          </p>
        </li>
        <li>
          <p>and then I can also see some dmesg like below:</p>
          <p>when vram size register have garbage,we may see error
            message like below:</p>
          <p>amdgpu 0000:09:00.0: VRAM: 4286582784M 0x000000F400000000 -
            0x000FF8F4FFFFFFFF (4286582784M used)</p>
          <p>the correct message should like below:</p>
          <p>amdgpu 0000:09:00.0: VRAM: 4096M 0x000000F400000000 -
            0x000000F4FFFFFFFF (4096M used)</p>
          <p><br>
          </p>
          <p>if you have any problems,please send me mail.</p>
          <p>thanks very much.</p>
          <p><br>
          </p>
        </li>
      </ol>
      <p>----&nbsp; &nbsp; &nbsp;&nbsp;</p>
      <p><strong>主　题：</strong><span id="subject">Re: [PATCH] drm/amdgpu:
          fixup bad vram size on gmc v8</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
        <strong>日　期：</strong><span id="date">2021-12-16 04:23</span> &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;<br>
        <strong>发件人：</strong><span id="from">Alex Deucher</span> &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;<br>
        <strong>收件人：</strong><span id="to">Zongmin Zhou</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p><br>
        &nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p>On Wed, Dec 15, 2021 at 10:31 AM Zongmin Zhou<zhouzongmin@kylinos.cn>wrote:<br>
          &gt;<br>
          &gt; Some boards(like RX550) seem to have garbage in the upper<br>
          &gt; 16 bits of the vram size register. &nbsp;Check for<br>
          &gt; this and clamp the size properly. &nbsp;Fixes<br>
          &gt; boards reporting bogus amounts of vram.<br>
          &gt;<br>
          &gt; after add this patch,the maximum GPU VRAM size is 64GB,<br>
          &gt; otherwise only 64GB vram size will be used.<br>
          <br>
          Can you provide some examples of problematic boards and
          possibly a<br>
          vbios image from the problematic board? &nbsp;What values are you
          seeing?<br>
          It would be nice to see what the boards are reporting and
          whether the<br>
          lower 16 bits are actually correct or if it is some other
          issue. &nbsp;This<br>
          register is undefined until the asic has been initialized.
          &nbsp;The vbios<br>
          programs it as part of it's asic init sequence (either via
          vesa/gop or<br>
          the OS driver).<br>
          <br>
          Alex<br>
          <br>
          <br>
          &gt;<br>
          &gt; Signed-off-by: Zongmin Zhou<zhouzongmin@kylinos.cn><br>
            &gt; ---<br>
            &gt; &nbsp;drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c | 13
            ++++++++++---<br>
            &gt; &nbsp;1 file changed, 10 insertions(+), 3 deletions(-)<br>
            &gt;<br>
            &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
            b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c<br>
            &gt; index 492ebed2915b..63b890f1e8af 100644<br>
            &gt; --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c<br>
            &gt; +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c<br>
            &gt; @@ -515,10 +515,10 @@ static void
            gmc_v8_0_mc_program(struct amdgpu_device *adev)<br>
            &gt; &nbsp;static int gmc_v8_0_mc_init(struct amdgpu_device
            *adev)<br>
            &gt; &nbsp;{<br>
            &gt; &nbsp; &nbsp; &nbsp; &nbsp; int r;<br>
            &gt; + &nbsp; &nbsp; &nbsp; u32 tmp;<br>
            &gt;<br>
            &gt; &nbsp; &nbsp; &nbsp; &nbsp; adev-&gt;gmc.vram_width =
            amdgpu_atombios_get_vram_width(adev);<br>
            &gt; &nbsp; &nbsp; &nbsp; &nbsp; if (!adev-&gt;gmc.vram_width) {<br>
            &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 tmp;<br>
            &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int chansize, numchan;<br>
            &gt;<br>
            &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* Get VRAM informations */<br>
            &gt; @@ -562,8 +562,15 @@ static int gmc_v8_0_mc_init(struct
            amdgpu_device *adev)<br>
            &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; adev-&gt;gmc.vram_width = numchan *
            chansize;<br>
            &gt; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            &gt; &nbsp; &nbsp; &nbsp; &nbsp; /* size in MB on si */<br>
            &gt; - &nbsp; &nbsp; &nbsp; adev-&gt;gmc.mc_vram_size =
            RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;<br>
            &gt; - &nbsp; &nbsp; &nbsp; adev-&gt;gmc.real_vram_size =
            RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;<br>
            &gt; + &nbsp; &nbsp; &nbsp; tmp = RREG32(mmCONFIG_MEMSIZE);<br>
            &gt; + &nbsp; &nbsp; &nbsp; /* some boards may have garbage in the upper 16
            bits */<br>
            &gt; + &nbsp; &nbsp; &nbsp; if (tmp &amp; 0xffff0000) {<br>
            &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DRM_INFO(&quot;Probable bad vram size:
            0x%08x\n&quot;, tmp);<br>
            &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (tmp &amp; 0xffff)<br>
            &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; tmp &amp;= 0xffff;<br>
            &gt; + &nbsp; &nbsp; &nbsp; }<br>
            &gt; + &nbsp; &nbsp; &nbsp; adev-&gt;gmc.mc_vram_size = tmp * 1024ULL *
            1024ULL;<br>
            &gt; + &nbsp; &nbsp; &nbsp; adev-&gt;gmc.real_vram_size =
            adev-&gt;gmc.mc_vram_size;<br>
            &gt;<br>
            &gt; &nbsp; &nbsp; &nbsp; &nbsp; if (!(adev-&gt;flags &amp; AMD_IS_APU)) {<br>
            &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; r = amdgpu_device_resize_fb_bar(adev);<br>
            &gt; --<br>
            &gt; 2.25.1<br>
            &gt;<br>
            &gt;<br>
            &gt; No virus found<br>
            &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Checked by Hillstone Network AntiVirus<br>
          </zhouzongmin@kylinos.cn></zhouzongmin@kylinos.cn></p>
    </blockquote>
    <br>
  </body>
</html>

--------------C428A7FE6F5323675A36310D--
