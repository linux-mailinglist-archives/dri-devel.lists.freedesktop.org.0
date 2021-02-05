Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F545310CB8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 15:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C54B6F462;
	Fri,  5 Feb 2021 14:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4AD6F460;
 Fri,  5 Feb 2021 14:50:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EikK8ij+BKakS8ObewaFYadh3nLMs8oHQqKjd9CuMzC2fZvbi5q8DRnr+AJCduA/8VNLxjnGQtEJdHjRQvuK9X7C2pssjRzXUJ7RJ5w+EcTOGSmYqmnkzbCk77xwuZH+totavsTXveALVCveMV5PYNImKUE9NJKxfu3hv6Qo18OQf7qGbOniZ6FhegEHbV0FGzVz8FUEkZYhDc6DiyDnoKjrJa7zVMzyZ8MyZEmjHUsyRJyyrZIbDrBB1SV1//oLpaAho69Z1Nay152e1FiiQ/93l1xZtCLgRECFR/9tnQZz8rB5QYBXF6zFWg0uM3/LFt1S5WJxkLxbdxVx0b0m2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOEACuIn27zc1f5LBTnDVyWNFjD2A/+zoFo8cCrASlc=;
 b=Z4DZ6bDBwOlCf8IRSoQ9YHUOCN9rKXUsZ0+R2oRzs+v6zNJCcYvWGDI2bmuW4Vw9T/JvF+VNnobAfTO8LXlmeqEEhnjRulWeEhg8aWWyffhbkuZ/P9aILVMg9jcGR+0h0YIOsSAeU5A63r8i8w45cmLGN/y3p5+4bV1P49yHm/oLBmY5qh29P6I2Oh7sDM+xQiXXxC+9pgnWOivsMUmaVs5OzSxAKmY7kM4v6VfYcKwsdFTREncm+dWniAXwrTA/XcJWTGCcOBEu76ssDd0AQ4RMZKEsbYDX6nK0RorvIF/TKBvuhgdihdybT5BVU0x5N3BA4hzk2RbglTQ08g+quw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOEACuIn27zc1f5LBTnDVyWNFjD2A/+zoFo8cCrASlc=;
 b=tOZfaJPSkJKHQSM4wTu6GDJ9ZKjk3z7eQTS+y8Fl5Kvx55EYzK9BKsDOMBWf9nSKe7LZIF/QhgqYBjgGOHsfXmPmcKdQzz7/GFFaQ9K1FE6BN+gQ8wSN3ClRnc40AolT5f7j/Sk2nJ8qjKFos8Ar52NIBcfL1IjucvPy3o4q5eI=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4341.namprd12.prod.outlook.com (2603:10b6:208:262::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 14:50:42 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::b0c4:9a8b:4c4c:76af]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::b0c4:9a8b:4c4c:76af%8]) with mapi id 15.20.3805.026; Fri, 5 Feb 2021
 14:50:42 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Liu, Leo" <Leo.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: share scheduler score on VCN3 instances
Thread-Topic: [PATCH 3/3] drm/amdgpu: share scheduler score on VCN3 instances
Thread-Index: AQHW+wQ3bbjgIx4y0UCZwUSOIKWA5apIUrqAgAECQQCAAEpaDw==
Date: Fri, 5 Feb 2021 14:50:42 +0000
Message-ID: <MN2PR12MB4488DFD306A90EE9F1F44F9BF7B29@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <20210204144405.2737-1-christian.koenig@amd.com>
 <20210204144405.2737-3-christian.koenig@amd.com>
 <036c900b-df46-5259-dbd2-d882f9a7341b@amd.com>,
 <16461e0e-703e-207e-35c3-b6b71429410c@gmail.com>
In-Reply-To: <16461e0e-703e-207e-35c3-b6b71429410c@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-02-05T14:50:42.379Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [192.161.78.237]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 670db7de-6775-444e-5ed4-08d8c9e56999
x-ms-traffictypediagnostic: MN2PR12MB4341:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB43417F7585CEF18CD7D1833FF7B29@MN2PR12MB4341.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WzqC/DpCxobgc35OZK911TvMlABStk4hO6sh/oBJCkx71oTk1vck7xfYR25ok10RpztI2/oO1MAZfIShU3noCCMIoavzxKKsJc79+l5laRUh+tMpOnyjfxQQB4C7E0mB3rpnH3rihFnyzr/tOmXXDfMj3xrRwsb688E43aA/en0oqKdvnEO6KWhNq5qPnaIgENdR6wZG+7OmQhrWR3N5I6dVgrSG5iY5E5YbJrrRc4CO/yH7B73CndcceI+9nYwb2smyPVpV2sJpkEemAWd10vqEbRvMbmPp+UrmvRjYYyYGtzQGWrYuGd38iN5jSUbeS5hSVl4sBESTXeV6jOfM4P/9jGEAzja9q8yMBzRfCcG1/xgWnaJ8Hwvqb7mkqOvCuIo+DQmfxGC0HMPqePIhoGa8BfPvMW2HLqaLb0kieMXI+IAIvXtF1vi7JlXrLGv2lvhOVTXILw41BdHF3qcELwEVMnfOT+9WzlXENspezCMXJTVS5AZPavhfgV+9TkmsoUGsBpvnWqpqgql0JDTSjQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(26005)(186003)(55016002)(53546011)(83380400001)(8936002)(316002)(6636002)(9686003)(64756008)(110136005)(5660300002)(8676002)(52536014)(19627405001)(478600001)(86362001)(66476007)(66946007)(76116006)(33656002)(6506007)(2906002)(7696005)(71200400001)(450100002)(66446008)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?zp2xgSnLiorETl0GVtCiTC6I+AwBtbq4Io7NRYP+uLmkxJwe9VqA6E5fBv?=
 =?iso-8859-1?Q?xBR7oEpvh6btni5TmwwIpsp71ePjqX7I/ol6aoadO4NAupIuvRQJdB9Z77?=
 =?iso-8859-1?Q?rskciblbInzUeKVpb44+5jzwmo/fOYwjIgXtxwXJdcBrVG4xxREVgiXkGe?=
 =?iso-8859-1?Q?Fg8XAK9XrHxiQvAVkgF2YOHz3lstM84U/fKZuNH2Vw1UV8eaHvluKQjjkn?=
 =?iso-8859-1?Q?PMOC7GpLIYBgLdVHgPrJa07FhFn7wV/HAmcy29ZuGs50I0hUzWrZyaSBJL?=
 =?iso-8859-1?Q?H1TSNPUSk0k/43Kg7eaf0OWtjc4fo1Tp99lWBxuIQlmL3LoyMgbIB7gOHO?=
 =?iso-8859-1?Q?Q6ribh0MEdllXxWTFPpEKUpBM0ehpFCIg+XIEQIEWtAmDO1ZgVXu2kND8+?=
 =?iso-8859-1?Q?lIJ3UXBPzj9BFZ+mStkLNjdLCnG4hU5d421IqQUJZmjq8Y3TFj/1a9RM6X?=
 =?iso-8859-1?Q?qWiUbXz3XbY2HkiBUQr+DOheo3Izl4WOkJDY6iyL9qrJear8qwZNaxryGk?=
 =?iso-8859-1?Q?hdsOi9kVOXfaAWa1L6mVgig3IhOb6EhlT53mARB2JuuQidDD8Lh8G7betO?=
 =?iso-8859-1?Q?1FPmCKWsCAeD3CX1WldmcK5MVrpbdaQWQYAvLOksN6DhUhNRh1Yxe9cUyZ?=
 =?iso-8859-1?Q?Q5X+Z9bngFoouddgCYs3Rg2d8KeCPbATuwlyfagOXhIOGiJ2fhPf5EeyGN?=
 =?iso-8859-1?Q?PWDM+cNKRO1QluqqHDsJkIENld/skBHC3QHf2GRzilHqhGVJaNLMw7uS8a?=
 =?iso-8859-1?Q?hO6bJQPo0HdZWawSQhIRf+QqhX9FRrL0Lm89hBt80MqVatc4qYh0F2PE/i?=
 =?iso-8859-1?Q?tKZLhFxw2UZxVnyP6SKV0TgLoWlBD4w857moaKa5jGa0kbHfNk4chyIaM7?=
 =?iso-8859-1?Q?OFDHQyOSu9f27MrdOUKYooN/Uzx9pl6cRQiTAL+oygoDxnzKZCvVVd+e6l?=
 =?iso-8859-1?Q?UCFCO83CkWtnImkrHV/dMVWl6zaaU1RI03Hu6i8KqJgZP2ZfautcRA2iZY?=
 =?iso-8859-1?Q?3LkCjsY9JDkF0zU6sqiROF5X4xV5V+fKlab5ZZXJKpWCRu1ssvL+aNAoH4?=
 =?iso-8859-1?Q?bAMfrlJ0fe2bo11zeruHtdm9sIvgpdqLA9544yvUrxugaxsXUUR1/CJVWO?=
 =?iso-8859-1?Q?oKQVyEOVFaVnZ8DQ5AaaFqiwLlzD1GUC1czB7n+9I0DtJN8qNkr2+4Q7lB?=
 =?iso-8859-1?Q?INJcQ3toM5w9w2/gv6COShzN8jga2liM/KGX0rwaq/0tX8ZqC4kfvQfccY?=
 =?iso-8859-1?Q?WBEwBRJsC3z5e03cbo7g07VTZZCKNKb+T++X99yNnX+TNriVP9eowiENWQ?=
 =?iso-8859-1?Q?sumYkJZ1ylMI4x+gnUb9vboU56GkXwHrjaBxJ+CPpFxoLLgrph6L3rsdaQ?=
 =?iso-8859-1?Q?Iz0/vg60BN?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670db7de-6775-444e-5ed4-08d8c9e56999
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 14:50:42.8441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 240z2JZCv1iFUvJGdXvzMb0PhMmz+64V7xvXJymTsSeOu+L7ddOVaKCGrAz0I8nR12M2Mew4VHLnJIFwHzulGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4341
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
Content-Type: multipart/mixed; boundary="===============1412815911=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1412815911==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB4488DFD306A90EE9F1F44F9BF7B29MN2PR12MB4488namp_"

--_000_MN2PR12MB4488DFD306A90EE9F1F44F9BF7B29MN2PR12MB4488namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Good question.  I think push it to drm-misc-next for upstream.  We can carr=
y it internally in amd-staging-drm-next for internal testing and I can coor=
dinate with drm-next.  I think the amdgpu changes are pretty straightforwar=
d, so shouldn't be too hard keep the merge straight.  I dunno.

Alex

________________________________
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Friday, February 5, 2021 4:58 AM
To: Liu, Leo <Leo.Liu@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@list=
s.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freede=
sktop.org>; Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: share scheduler score on VCN3 instance=
s

Alex how do we want to merge this?

I've just pushed the first patch to drm-misc-next since that needed a
rebase because it touches other drivers as well.

But the rest is really AMD specific and I'm not sure if the dependent
stuff is already in there as well.

So if I push it to drm-misc-next you will probably need to merge and if
I push it to amd-staging-drm-next somebody else might need to merge when
drm-misc-next is merged.

Ideas?

Christian.

Am 04.02.21 um 19:34 schrieb Leo Liu:
> The series are:
>
> Reviewed-and-Tested-by: Leo Liu <leo.liu@amd.com>
>
>
> On 2021-02-04 9:44 a.m., Christian K=F6nig wrote:
>> The VCN3 instances can do both decode as well as encode.
>>
>> Share the scheduler load balancing score and remove fixing encode to
>> only the second instance.
>>
>> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h |  1 +
>>   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c   | 11 +++++++----
>>   2 files changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
>> index 13aa417f6be7..d10bc4f0a05f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
>> @@ -211,6 +211,7 @@ struct amdgpu_vcn_inst {
>>       void            *saved_bo;
>>       struct amdgpu_ring    ring_dec;
>>       struct amdgpu_ring    ring_enc[AMDGPU_VCN_MAX_ENC_RINGS];
>> +    atomic_t        sched_score;
>>       struct amdgpu_irq_src    irq;
>>       struct amdgpu_vcn_reg    external;
>>       struct amdgpu_bo    *dpg_sram_bo;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> index 239a4eb52c61..b33f513fd2ac 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> @@ -171,6 +171,7 @@ static int vcn_v3_0_sw_init(void *handle)
>>         for (i =3D 0; i < adev->vcn.num_vcn_inst; i++) {
>>           volatile struct amdgpu_fw_shared *fw_shared;
>> +
>>           if (adev->vcn.harvest_config & (1 << i))
>>               continue;
>>   @@ -198,6 +199,8 @@ static int vcn_v3_0_sw_init(void *handle)
>>           if (r)
>>               return r;
>>   +        atomic_set(&adev->vcn.inst[i].sched_score, 0);
>> +
>>           ring =3D &adev->vcn.inst[i].ring_dec;
>>           ring->use_doorbell =3D true;
>>           if (amdgpu_sriov_vf(adev)) {
>> @@ -209,7 +212,8 @@ static int vcn_v3_0_sw_init(void *handle)
>>               ring->no_scheduler =3D true;
>>           sprintf(ring->name, "vcn_dec_%d", i);
>>           r =3D amdgpu_ring_init(adev, ring, 512,
>> &adev->vcn.inst[i].irq, 0,
>> -                     AMDGPU_RING_PRIO_DEFAULT, NULL);
>> +                     AMDGPU_RING_PRIO_DEFAULT,
>> +                     &adev->vcn.inst[i].sched_score);
>>           if (r)
>>               return r;
>>   @@ -227,11 +231,10 @@ static int vcn_v3_0_sw_init(void *handle)
>>               } else {
>>                   ring->doorbell_index =3D
>> (adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 2 + j + 8 * i;
>>               }
>> -            if (adev->asic_type =3D=3D CHIP_SIENNA_CICHLID && i !=3D 1)
>> -                ring->no_scheduler =3D true;
>>               sprintf(ring->name, "vcn_enc_%d.%d", i, j);
>>               r =3D amdgpu_ring_init(adev, ring, 512,
>> &adev->vcn.inst[i].irq, 0,
>> -                         AMDGPU_RING_PRIO_DEFAULT, NULL);
>> +                         AMDGPU_RING_PRIO_DEFAULT,
>> + &adev->vcn.inst[i].sched_score);
>>               if (r)
>>                   return r;
>>           }


--_000_MN2PR12MB4488DFD306A90EE9F1F44F9BF7B29MN2PR12MB4488namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Good question.&nbsp; I think push it to drm-misc-next for upstream.&nbsp; W=
e can carry it internally in amd-staging-drm-next for internal testing and =
I can coordinate with drm-next.&nbsp; I think the amdgpu changes are pretty=
 straightforward, so shouldn't be too hard keep
 the merge straight.&nbsp; I dunno.&nbsp; <br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Christian K=F6nig &lt=
;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Friday, February 5, 2021 4:58 AM<br>
<b>To:</b> Liu, Leo &lt;Leo.Liu@amd.com&gt;; amd-gfx@lists.freedesktop.org =
&lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.freedesktop.org &lt;=
dri-devel@lists.freedesktop.org&gt;; Deucher, Alexander &lt;Alexander.Deuch=
er@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 3/3] drm/amdgpu: share scheduler score on VCN3 i=
nstances</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Alex how do we want to merge this?<br>
<br>
I've just pushed the first patch to drm-misc-next since that needed a <br>
rebase because it touches other drivers as well.<br>
<br>
But the rest is really AMD specific and I'm not sure if the dependent <br>
stuff is already in there as well.<br>
<br>
So if I push it to drm-misc-next you will probably need to merge and if <br=
>
I push it to amd-staging-drm-next somebody else might need to merge when <b=
r>
drm-misc-next is merged.<br>
<br>
Ideas?<br>
<br>
Christian.<br>
<br>
Am 04.02.21 um 19:34 schrieb Leo Liu:<br>
&gt; The series are:<br>
&gt;<br>
&gt; Reviewed-and-Tested-by: Leo Liu &lt;leo.liu@amd.com&gt;<br>
&gt;<br>
&gt;<br>
&gt; On 2021-02-04 9:44 a.m., Christian K=F6nig wrote:<br>
&gt;&gt; The VCN3 instances can do both decode as well as encode.<br>
&gt;&gt;<br>
&gt;&gt; Share the scheduler load balancing score and remove fixing encode =
to<br>
&gt;&gt; only the second instance.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<=
br>
&gt;&gt; ---<br>
&gt;&gt; &nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h |&nbsp; 1 +<br>
&gt;&gt; &nbsp; drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c&nbsp;&nbsp; | 11 ++++=
+++----<br>
&gt;&gt; &nbsp; 2 files changed, 8 insertions(+), 4 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h <br>
&gt;&gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h<br>
&gt;&gt; index 13aa417f6be7..d10bc4f0a05f 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h<br>
&gt;&gt; @@ -211,6 +211,7 @@ struct amdgpu_vcn_inst {<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *saved_bo;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_ring&nbsp;&nbsp;&nbsp=
; ring_dec;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_ring&nbsp;&nbsp;&nbsp=
; ring_enc[AMDGPU_VCN_MAX_ENC_RINGS];<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp; atomic_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; sched_score;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_irq_src&nbsp;&nbsp;&n=
bsp; irq;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vcn_reg&nbsp;&nbsp;&n=
bsp; external;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo&nbsp;&nbsp;&nbsp; =
*dpg_sram_bo;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c <br>
&gt;&gt; b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c<br>
&gt;&gt; index 239a4eb52c61..b33f513fd2ac 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c<br>
&gt;&gt; @@ -171,6 +171,7 @@ static int vcn_v3_0_sw_init(void *handle)<br>
&gt;&gt; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; adev-&g=
t;vcn.num_vcn_inst; i++) {<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; volatile st=
ruct amdgpu_fw_shared *fw_shared;<br>
&gt;&gt; +<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&g=
t;vcn.harvest_config &amp; (1 &lt;&lt; i))<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; continue;<br>
&gt;&gt; &nbsp; @@ -198,6 +199,8 @@ static int vcn_v3_0_sw_init(void *handl=
e)<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; return r;<br>
&gt;&gt; &nbsp; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atomic_set(&amp=
;adev-&gt;vcn.inst[i].sched_score, 0);<br>
&gt;&gt; +<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring =3D &a=
mp;adev-&gt;vcn.inst[i].ring_dec;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring-&gt;us=
e_doorbell =3D true;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_=
sriov_vf(adev)) {<br>
&gt;&gt; @@ -209,7 +212,8 @@ static int vcn_v3_0_sw_init(void *handle)<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; ring-&gt;no_scheduler =3D true;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sprintf(rin=
g-&gt;name, &quot;vcn_dec_%d&quot;, i);<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgp=
u_ring_init(adev, ring, 512, <br>
&gt;&gt; &amp;adev-&gt;vcn.inst[i].irq, 0,<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_RING_PRIO_DE=
FAULT, NULL);<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_RING_PRIO_DE=
FAULT,<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;adev-&gt;vcn.i=
nst[i].sched_score);<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; return r;<br>
&gt;&gt; &nbsp; @@ -227,11 +231,10 @@ static int vcn_v3_0_sw_init(void *han=
dle)<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; } else {<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring-&gt;doorbell_index =3D <br>
&gt;&gt; (adev-&gt;doorbell_index.vcn.vcn_ring0_1 &lt;&lt; 1) + 2 + j + 8 *=
 i;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; }<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; if (adev-&gt;asic_type =3D=3D CHIP_SIENNA_CICHLID &amp;&amp; i !=3D 1)<br=
>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ring-&gt;no_scheduler =3D true;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; sprintf(ring-&gt;name, &quot;vcn_enc_%d.%d&quot;, i, j);<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; r =3D amdgpu_ring_init(adev, ring, 512, <br>
&gt;&gt; &amp;adev-&gt;vcn.inst[i].irq, 0,<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; AMDGPU_RING_PRIO_DEFAULT, NULL);<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; AMDGPU_RING_PRIO_DEFAULT,<br>
&gt;&gt; + &amp;adev-&gt;vcn.inst[i].sched_score);<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; if (r)<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB4488DFD306A90EE9F1F44F9BF7B29MN2PR12MB4488namp_--

--===============1412815911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1412815911==--
