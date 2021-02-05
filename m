Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D51310CF9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 16:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6979C6F450;
	Fri,  5 Feb 2021 15:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CE36F450;
 Fri,  5 Feb 2021 15:10:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbTttNHSESaaZUpJ/f93BNfdXxqcQQA+AJSqxT/KunxfmA8MpeZ2ulyqnWWIqUXgsB1BBLGHgEJS33sIdHbGCgLlh0so/j8TzdZe2vt9AmZcFNplNc13+xIc6YJ04y2j50wVBgAMvzmVNoHkQ2adspiwvE5uswlO5f5KFONVpTiP/KWvth8ujNdtUsqEfMsceDC0xD6ImE5I6nsSODKaJmDBLtxCAEGvKsiSQA7yLEykUFRo82SbTS0W3+8zswNNAOhCVVv97Co/HT0POJffdDa6poVfGBppncNdK2jzBtkpGWEUNz39pYpt/FX8ydG5uq13E4/MTDVj07oD97300g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JlgB8xynwVZp1CTB8t+l4u4FcQgjL3O3RwPLvPSUds=;
 b=DT0oWZ4GD3geiUm+6te8mdTTBkfsClheUTjYu8xeYSQtEDWIcTwIJKwkvb2BYNO8jLLFcJwqTXBZbeg/0NHt+FcNK+zUc5IqhvPlwMF23SfVfOPKyHnWLvaurtFUO+BdrueylAm8MlS3mBhc/jv+EyKgm490Hw698H4zJzmx2DX8mChz2udofn1dpiGcTiHMxfEmRwH7hZqtF+WJJ9bA6okLpVNR6vGErlTAmPk8/wHc0pDTa/2KSHkZGfLSje7z1CLrZHEpT2jbXxf4KSvcZFVykrR7DI9SDdOsngnYfN6PKVO33hJlnpqmFyxAOddbWixYARlQvAxoXbNrQrkigg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JlgB8xynwVZp1CTB8t+l4u4FcQgjL3O3RwPLvPSUds=;
 b=tPTqf8zQyyte7ADnItoCSSc3Qee8A4WiZfeoyiqQeNnDNBn0PuXCBrG6xA91hm8QfoyF8jNk9ApwTMX5SH/rqEpd6o1ZPLG1GPdIwGk+e5fcnvrG51nrx/IizWtgWDdaUfHl23twVppHnLgUzaaGagQcjzStdtp2zhtSCFtXbzU=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by BL0PR12MB4915.namprd12.prod.outlook.com (2603:10b6:208:1c9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Fri, 5 Feb
 2021 15:09:58 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::b0c4:9a8b:4c4c:76af]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::b0c4:9a8b:4c4c:76af%8]) with mapi id 15.20.3805.026; Fri, 5 Feb 2021
 15:09:58 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu, Leo"
 <Leo.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/amdgpu: share scheduler score on VCN3 instances
Thread-Topic: [PATCH 3/3] drm/amdgpu: share scheduler score on VCN3 instances
Thread-Index: AQHW+wQ3bbjgIx4y0UCZwUSOIKWA5apIUrqAgAECQQCAAEpaD4AACBGAgAADMb4=
Date: Fri, 5 Feb 2021 15:09:58 +0000
Message-ID: <MN2PR12MB4488D99BA44F40D090C3F6E6F7B29@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <20210204144405.2737-1-christian.koenig@amd.com>
 <20210204144405.2737-3-christian.koenig@amd.com>
 <036c900b-df46-5259-dbd2-d882f9a7341b@amd.com>
 <16461e0e-703e-207e-35c3-b6b71429410c@gmail.com>
 <MN2PR12MB4488DFD306A90EE9F1F44F9BF7B29@MN2PR12MB4488.namprd12.prod.outlook.com>,
 <73693127-79ae-1628-b9f3-b37a5262f164@amd.com>
In-Reply-To: <73693127-79ae-1628-b9f3-b37a5262f164@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-02-05T15:09:58.099Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [192.161.78.237]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a566f7e1-7523-44e8-9bf5-08d8c9e81a78
x-ms-traffictypediagnostic: BL0PR12MB4915:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB4915B1178F93A92055B296F4F7B29@BL0PR12MB4915.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X+lKfAppr8u6grdrJx8wYplINbYpCt3HNJdSmaWG7BzLicjVyW3nCoPAUYU+OX9TnwHVrkOeSlunJXP8l3T0Q2DO2+kAd69Ja3c/0GWzM1OYVhVe/EJ+yuBniKtuHdHoeywo5eRqYxlBniPqVsqXDn5EFNpan3K87KtHcIOorLFit3nGfAYIfgL1Ugnon/zLueiN5HrYcqkT0FIvdUUKLXyXnJIqgALeiuZXzMFf3rx72X7lESF7soiHF2rvozNQSZwM+M1pcywLg/djGqMtuhR3uO6um4OlyCt3zWLvTUCWFF9Io0ewwFyKZaoWDH8dhGjX56VZoIQSU6FoL0CsXWtxEan5LiVRYiiNWZgiBA6A6ddx9hHGNDe38oMPDXDzPYgQ8V3djNbx407bV/oBABbgKD50dPnVDsqeDmAmJl/oZjim3QrajscKv5f7h2ZhcI2v4jmrDKVE3pw+Sbh6I750Ju48idsHp3v3t+16skzSDueUyyA6GFM6iJxH+y+7MyIsnTlDu9EZHHj5wxGFRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(71200400001)(55016002)(76116006)(33656002)(86362001)(66476007)(66946007)(66556008)(26005)(66446008)(64756008)(83380400001)(7696005)(52536014)(9686003)(186003)(450100002)(19627405001)(110136005)(2906002)(8936002)(316002)(478600001)(53546011)(6506007)(5660300002)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?EtfZiqTPXtuY34LwYNNN/qYNv7T9gbnYgPbDCpkUT9nQH6VIl0+TRztDT1?=
 =?iso-8859-1?Q?w9K1IeG/95S8kKYGA7C4Mh4m1iQ4ZYSXKXlwIp3+G6cZbxaTBS+lxNlH9Z?=
 =?iso-8859-1?Q?L2q5owWWL9a/f95TGi2db6hN4ila2eso4Ukw0f3PLxoHN3cOTVs6H2sl14?=
 =?iso-8859-1?Q?gj1sR+rAgSpn3YnAYR1XHI2wifEU8oGyLP01jpT1Wyk2Iwo3FX0MjIjdP5?=
 =?iso-8859-1?Q?qNWEpABB/t9Lumy7zVxSYxA1LSVOAJAL4ALEPC+4qe4JuG0pyQ+lmpEmNU?=
 =?iso-8859-1?Q?iBM/J0hnFp5rxFVxabZ6zwpQzukg/qBpZ/usUM1z0xdRaEz8joMEmKiBWB?=
 =?iso-8859-1?Q?n6yUg9yLUcfMnHsnNlPGlsfwehV6QKX1lZQDANABqYnV2jxpAHCPTwgzi9?=
 =?iso-8859-1?Q?GBESTckiQkR1Nn/xIHAl77FXRCS+CdiwQ3AbloN1yq0O+JwjE0FXT8Dl15?=
 =?iso-8859-1?Q?JRcYRaeRiUT+RAOrb2GYgx3U/syBa3PAJ4ux8P/t0nNUvJ6SSAAZs/wMQi?=
 =?iso-8859-1?Q?BH/qwxa540O12brWchIOjxMp+ka/xQmQX5lUlSCAW7wSSzTvdv/aPBR57B?=
 =?iso-8859-1?Q?NWPmeUfj91qP0DAetVSRJBDvfpFPqeNBiwEcYD/uWkqHTOFSU4TynBhpSa?=
 =?iso-8859-1?Q?GlLn1lyg2vyM2msS5SYye9ixuQMQX82l8ontMV9u6jDpWPDYz3E5Hoh+6p?=
 =?iso-8859-1?Q?t45bMZ4wayu8l0tp5sJdUihdd4GQrmcnloAba36wcL2Q0FpSbHnxbphYrL?=
 =?iso-8859-1?Q?i7xE9WrT0X1q/tm8NNCatMuBkwRTkZi17kNU3zLhv0cUhsCEaOF9Mg1UQb?=
 =?iso-8859-1?Q?CNRynfZmf5mzXDTPc4zJgJ9cP6UX06fZBXxvnkjbL5M6LPpyq3wvRMgmDp?=
 =?iso-8859-1?Q?nQD+MfJvvEVsJ7Dzz4GKNwC1ycMuTbq69NdNKL/4K6UywyFsN43mdNUHDk?=
 =?iso-8859-1?Q?GDGTDuoTYuRojIRUlUV5txd3O9+PMeUoe2aJgvONSX8SjtdrUIdDSqGtVx?=
 =?iso-8859-1?Q?p8L/N9q4J6exNp9N3qiKR6vRsTWSwBcyEWJOK46QNrSSAlWa8+qK18/bdl?=
 =?iso-8859-1?Q?CB2V30vt8LVvT8JysvgGph7bvmfVw3s7Pa6HqAzuxTyGK6a8VQT4IsH+uq?=
 =?iso-8859-1?Q?+NLB7fwwZMgCeaHS9PkfRGdIVJkcSK0QFgHlDfzoPjdMtlEi8sfitUf1Ci?=
 =?iso-8859-1?Q?WPR5D+4aEyCGtiVlcUMFj+1OKpMhhD1IdOS9toGVHSPEwB8XWi5nR+s3AM?=
 =?iso-8859-1?Q?Vwzg/civh1CxYSpifESAREg/DO7g/+2zjozWNz9IDZAF5MRRuiwlFej3d/?=
 =?iso-8859-1?Q?SozxD7hOEoOFn48LvQ5ACvDMAYhFBoAfMxZ+geWjWgPZX6XYcCFW8kuEyB?=
 =?iso-8859-1?Q?diix6NGSDD?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a566f7e1-7523-44e8-9bf5-08d8c9e81a78
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 15:09:58.6314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rreGeM7WSqcbZw41aG8cEP3zR6fmHYNmIdaBtOUx5+PuYPTJ3ZySEADByrv3c6X1v1A6OLHyELp/cnMoMBvIlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4915
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
Content-Type: multipart/mixed; boundary="===============1656575747=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1656575747==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB4488D99BA44F40D090C3F6E6F7B29MN2PR12MB4488namp_"

--_000_MN2PR12MB4488D99BA44F40D090C3F6E6F7B29MN2PR12MB4488namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

I think the virt team probably wants it in amd-staging-drm-next so they can=
 start testing it.  5.12 is getting pretty tight.  I'm not sure if there wi=
ll be another drm-misc PR or not for 5.12.  Rebasing amd-staging-drm-next i=
s turning into a challenge.  there are always a lot of regressions.  I gues=
s that is an argument to rebase more often so we get better internal testin=
g of it.

Alex

________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Friday, February 5, 2021 9:53 AM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Liu, Leo <Leo.Liu@amd.c=
om>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-dev=
el@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/amdgpu: share scheduler score on VCN3 instance=
s

The alternative is to wait till drm-misc-next is merged into drm-next, then=
 rebase amd-staging-drm-next on top of that (or directly drm-misc-next) and=
 push then.

Would give us at least a clean history. Question is rather if we want it in=
 5.12?

Christian.

Am 05.02.21 um 15:50 schrieb Deucher, Alexander:

[AMD Official Use Only - Internal Distribution Only]

Good question.  I think push it to drm-misc-next for upstream.  We can carr=
y it internally in amd-staging-drm-next for internal testing and I can coor=
dinate with drm-next.  I think the amdgpu changes are pretty straightforwar=
d, so shouldn't be too hard keep the merge straight.  I dunno.

Alex

________________________________
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com><mailto:ckoenig.l=
eichtzumerken@gmail.com>
Sent: Friday, February 5, 2021 4:58 AM
To: Liu, Leo <Leo.Liu@amd.com><mailto:Leo.Liu@amd.com>; amd-gfx@lists.freed=
esktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@lists.freedesktop=
.org><mailto:amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.or=
g<mailto:dri-devel@lists.freedesktop.org> <dri-devel@lists.freedesktop.org>=
<mailto:dri-devel@lists.freedesktop.org>; Deucher, Alexander <Alexander.Deu=
cher@amd.com><mailto:Alexander.Deucher@amd.com>
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
> Reviewed-and-Tested-by: Leo Liu <leo.liu@amd.com><mailto:leo.liu@amd.com>
>
>
> On 2021-02-04 9:44 a.m., Christian K=F6nig wrote:
>> The VCN3 instances can do both decode as well as encode.
>>
>> Share the scheduler load balancing score and remove fixing encode to
>> only the second instance.
>>
>> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com><mailto:chris=
tian.koenig@amd.com>
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



--_000_MN2PR12MB4488D99BA44F40D090C3F6E6F7B29MN2PR12MB4488namp_
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
I think the virt team probably wants it in amd-staging-drm-next so they can=
 start testing it.&nbsp; 5.12 is getting pretty tight.&nbsp; I'm not sure i=
f there will be another drm-misc PR or not for 5.12.&nbsp; Rebasing amd-sta=
ging-drm-next is turning into a challenge.&nbsp; there
 are always a lot of regressions.&nbsp; I guess that is an argument to reba=
se more often so we get better internal testing of it.</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Friday, February 5, 2021 9:53 AM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Liu, Leo &=
lt;Leo.Liu@amd.com&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.fre=
edesktop.org&gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freed=
esktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH 3/3] drm/amdgpu: share scheduler score on VCN3 i=
nstances</font>
<div>&nbsp;</div>
</div>
<div>
<div class=3D"x_moz-cite-prefix">The alternative is to wait till drm-misc-n=
ext is merged into drm-next, then rebase amd-staging-drm-next on top of tha=
t (or directly drm-misc-next) and push then.<br>
<br>
Would give us at least a clean history. Question is rather if we want it in=
 5.12?<br>
<br>
Christian.<br>
<br>
Am 05.02.21 um 15:50 schrieb Deucher, Alexander:<br>
</div>
<blockquote type=3D"cite"><style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<p align=3D"Left" style=3D"font-family:Arial; font-size:11pt; color:#0078D7=
; margin:5pt">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Good question.&nbsp; I think push it to drm-misc-next for upstream.&nbsp; W=
e can carry it internally in amd-staging-drm-next for internal testing and =
I can coordinate with drm-next.&nbsp; I think the amdgpu changes are pretty=
 straightforward, so shouldn't be too hard keep
 the merge straight.&nbsp; I dunno.&nbsp; <br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Alex</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Christian K=F6nig
<a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:ckoenig.leichtzumerken@=
gmail.com">
&lt;ckoenig.leichtzumerken@gmail.com&gt;</a><br>
<b>Sent:</b> Friday, February 5, 2021 4:58 AM<br>
<b>To:</b> Liu, Leo <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:Leo=
.Liu@amd.com">
&lt;Leo.Liu@amd.com&gt;</a>; <a class=3D"x_moz-txt-link-abbreviated" href=
=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a> <a class=3D"x_moz-txt-link-rfc2396E" href=
=3D"mailto:amd-gfx@lists.freedesktop.org">
&lt;amd-gfx@lists.freedesktop.org&gt;</a>; <a class=3D"x_moz-txt-link-abbre=
viated" href=3D"mailto:dri-devel@lists.freedesktop.org">
dri-devel@lists.freedesktop.org</a> <a class=3D"x_moz-txt-link-rfc2396E" hr=
ef=3D"mailto:dri-devel@lists.freedesktop.org">
&lt;dri-devel@lists.freedesktop.org&gt;</a>; Deucher, Alexander <a class=3D=
"x_moz-txt-link-rfc2396E" href=3D"mailto:Alexander.Deucher@amd.com">
&lt;Alexander.Deucher@amd.com&gt;</a><br>
<b>Subject:</b> Re: [PATCH 3/3] drm/amdgpu: share scheduler score on VCN3 i=
nstances</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Alex how do we want to merge this?<br>
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
&gt; Reviewed-and-Tested-by: Leo Liu <a class=3D"x_moz-txt-link-rfc2396E" h=
ref=3D"mailto:leo.liu@amd.com">
&lt;leo.liu@amd.com&gt;</a><br>
&gt;<br>
&gt;<br>
&gt; On 2021-02-04 9:44 a.m., Christian K=F6nig wrote:<br>
&gt;&gt; The VCN3 instances can do both decode as well as encode.<br>
&gt;&gt;<br>
&gt;&gt; Share the scheduler load balancing score and remove fixing encode =
to<br>
&gt;&gt; only the second instance.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Christian K=F6nig <a class=3D"x_moz-txt-link-rfc239=
6E" href=3D"mailto:christian.koenig@amd.com">
&lt;christian.koenig@amd.com&gt;</a><br>
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
</blockquote>
<br>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB4488D99BA44F40D090C3F6E6F7B29MN2PR12MB4488namp_--

--===============1656575747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1656575747==--
