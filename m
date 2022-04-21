Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A5C5094FA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 04:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C425910E739;
	Thu, 21 Apr 2022 02:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D852610E739;
 Thu, 21 Apr 2022 02:15:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Shij3nNZoH7lXfzarhcQ6DpbqKTT+QB1ikY+TMVfHiIZOceXx55rBb8hsPyQurRtPGjEeeeWjy0Sfr/Jv5ca4HhMsHVLvFl6cw7UqQdziOOj2GJZirX/Yz2OCH94C27qhGht1kxLOwiuPR7toB6fSPkrDKGG1rkNBRH9CrHZKIKqFUiKwQYXAxW7/evFPKP4PYSUKSZw97ffGo/2Z6k0s2Tc9YfIRoY9SFm4jNreJFoC/xJotb8wNtXaWaIeFpE/7//OwJ/30Wt+g7OtjLFLb6RxLHokMdI8oLbfNPIY47aET4oK9x6rKczNDMQDAlX9FJ+NMuLi5TwXqL9V+8nc6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKz0hvejwtApsAMTwIZc5p1MBRkIRWDnFfSYDZXUUPs=;
 b=lIhHr9c0Ly+5lXtteV8PqLi0gwr9xYmkR4i6SyPKxTQlxf1AcYmreIgZLBG6ood7O3rEtoMC0SgzlZdQE4rp2mJZwPXnEHbcP0TGXXjOiNxPZVP9u66ZEaIJ4zhotW152T/y49fpN94xe79wrcdhcZKE1OgDO6026JrBKYBGdT/82kZkyeEWBEBvHIz5fXuYzZ9zrYkh1cl5vj//yghC90sjcoJ4KRv2B+deSzYwKnbAthpj2hODK05q12g9FyhPO/ASYhCYG3YspNGqe8nw3VeKN53kTYwioxYGcSib+g3W6JGU7N1zummfu/Hbq6TLdSccgALOGveIkpOFy8lNNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKz0hvejwtApsAMTwIZc5p1MBRkIRWDnFfSYDZXUUPs=;
 b=IAqj4YuEurlqyDkExZNw499CcC5W3cVU0KUyNnBTdHl+0garEfDNI9wI7g/Q+uZ5I7wrWxTCd+thjMOYAAn9iAX5QONeYjmNMHD1JgMO2lWpYvgkQam6vvFq5j70iVfzDyz4EUUAYdzvWybsftQlMQTRPkwJGE9FfysCdivxtdE=
Received: from CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8)
 by BYAPR12MB2901.namprd12.prod.outlook.com (2603:10b6:a03:138::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 02:15:09 +0000
Received: from CO6PR12MB5473.namprd12.prod.outlook.com
 ([fe80::28df:431f:d965:e6ef]) by CO6PR12MB5473.namprd12.prod.outlook.com
 ([fe80::28df:431f:d965:e6ef%7]) with mapi id 15.20.5186.013; Thu, 21 Apr 2022
 02:15:09 +0000
From: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Lazar, Lijo"
 <Lijo.Lazar@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Thread-Topic: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Thread-Index: AQHYVJSHP8/0hJsFF022HGuI3b/QKKz4gPOAgAAAasOAAB8mgIAAB9e4gAAJlwCAAAiMCIAABHyAgAABxZ+AAAJMAIAAB2GAgACFlgCAAFFLAw==
Date: Thu, 21 Apr 2022 02:15:09 +0000
Message-ID: <CO6PR12MB5473F2A9C21F68886DDF140082F49@CO6PR12MB5473.namprd12.prod.outlook.com>
References: <20220420085612.1664787-1-KevinYang.Wang@amd.com>
 <00dfec71-cf38-d6d9-8775-0ae88f59224e@amd.com>
 <CO6PR12MB54733101E19842B59668482B82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <65ef352b-59c8-e802-5285-afc59e56fa9b@amd.com>
 <CO6PR12MB547340CB065269B1731812B182F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <572ed15c-b47e-e7b3-850a-cb0d5259af04@gmail.com>
 <CO6PR12MB54735D4B8E05AB1C17D356AE82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <71f3ac77-b6ed-e503-8e05-dcf9d2c2811a@amd.com>
 <CO6PR12MB547334A5A8E66A578D131C6D82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <075258d7-16af-a664-0406-2b2862efe05f@amd.com>
 <b5f6cd30-d7c7-c615-9723-68746e35b4de@amd.com>
 <6d1ec935-3b41-fef6-efe3-577f8316edd2@amd.com>
In-Reply-To: <6d1ec935-3b41-fef6-efe3-577f8316edd2@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-04-21T02:15:08.097Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a0466e9-7de8-4e4c-8dae-08da233cc26b
x-ms-traffictypediagnostic: BYAPR12MB2901:EE_
x-microsoft-antispam-prvs: <BYAPR12MB290134E9EE5A15E6FFB6EF2482F49@BYAPR12MB2901.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ks5dLWVISpw82s35ZmUaVsk0zHc7rA2tG/bweWSfXxQp9VsRlXzSJ4+oPI11AyYvQ6DkyM6g83iteXlnQcCjQS9s3y+3gIf3wbCNLFY8WIHf5srWXg1cClYtfBKZDOBwkYgzTnIDdpswoG+6nioZ5N/juNkUtvWWAMkOOa0owF1SdMEyaSQA9JV9048DxTlhVF4NrewS51+lhoz8ygjkMYjc8n54KvCU+OgPT4GTYxKAnhtUysYVqYDrSItqaylrPGVZk3g38V3TaeBRTBW5W7NAriNnqlFP08JuqwSVnfE+eNvZeLCMCmVRdsiwIi4MLzjoJUa/auehbJSvo9R1VhE7ZSng4E6XCF99rCkL6w7GaBR+SeUvs7gNCx7BXLwi/7tIT7ifI1qCuHQ/Bs5HO9V/QJX+vBPu3hryJAjs71O4mI/mtAqVMwupBwEGEaqfNy5CYYuvXqT34KQlP5OhEWqFVN/9BeZ/sGh45FLs7jVnLqlA8cSoxNrQnGYQTCf7XS/yXHzYqpr6YPmgIJsWtv+kI+eMi9a/qz5pEooL2n59NyfwEjVkjMtEuP5ZHY12nkMnOoKyAW9mQZ26ou+EUcvVOv6Owi0inrCUDmthkrV0H0viwMFRQ37KASg5WRutW/t9HKfr998NN59uWBPiNi7jccfEW7UjAjl5yH1KcUK66xkDtw5uppkvQdAm57tSlaQihI0/6mN0egyJIMXp+pIfyAlyVghIdwBeeqpUMTVysW1XDh1+RKrErLcmMitY46T+KHyItPvRLXvFAARWv8nFSUCETdtFNFxUf8ILwzA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(19627405001)(122000001)(186003)(86362001)(91956017)(66946007)(55016003)(76116006)(83380400001)(66476007)(66574015)(66556008)(26005)(71200400001)(508600001)(30864003)(7696005)(9686003)(53546011)(5660300002)(316002)(52536014)(2906002)(38070700005)(38100700002)(110136005)(64756008)(6506007)(33656002)(66446008)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PREXC3g8g/HvUpUe9sQqKFwsT/ylNCM8zh+VNz/lHh++G9g8Grb5xYnHnD?=
 =?iso-8859-1?Q?MlVGTBlmCyMj0/c4UVmBnSysl8CY9mm/MJfY6EqYNrBw9nA3zt/PAcCuaT?=
 =?iso-8859-1?Q?mNrhys2/fbZXExL+T9GAYGnKqHcnJ94Y6zB4a5dVj0bMHpafOCef+/lH+N?=
 =?iso-8859-1?Q?F5X8e+8jR9KLOktJEGLi3Pz4BXzQ23YmxFpMWWkSiJ5bRAkMBY1Y8qi2VN?=
 =?iso-8859-1?Q?smkMktWSiO5pUfKoXKU5OySigya77WUWDp8nDEYLkJ28PuabMZzS1vuazu?=
 =?iso-8859-1?Q?aYP4zlaQ6qxYiKInca+VzEfDcxtMjTpq3dKI0DAxsL9eh60g3BDXqhQgZP?=
 =?iso-8859-1?Q?oUb4HSyaWvySRtuZ+YkfKSbk43eZiFVoRojEm3fy/zzxJhp+mYBMRid6YF?=
 =?iso-8859-1?Q?f0qdSy6TQtJe2SBIXgd1FUT0nSYQj/XUfoy1rLHNl0JyhEEqz5pJ7r/LS4?=
 =?iso-8859-1?Q?4V0O44HDEMIyJwsM1qOd8kd9olh8yj625cxERlGJuLk/qUB49RkxBPqDVK?=
 =?iso-8859-1?Q?8GYHFKNb2h9IwhsYfbEm2V0jgftLJ+BP6nSEQHz3lZkWR1jhxcLGuSXePR?=
 =?iso-8859-1?Q?LoT4kfDxKq47egZ0ZvSB+dP9Dh4zDXwKKoqqLENjKgR0mjYSymeUYni36t?=
 =?iso-8859-1?Q?KtrbQbY/96V2uAV1lKx66HG3oLNciFyjq8JMSr845vTUAlFC6e/yWazw81?=
 =?iso-8859-1?Q?BMozS2ItsUr0ZD54m6XykiCRhAeS042uNAC60za879IngPsvPshIICC0L0?=
 =?iso-8859-1?Q?u7ZZKE6/NUAzSeWNo0R5o8GlYofDqKX25pwUrlicHIviJj0EcVkGn4Nyzo?=
 =?iso-8859-1?Q?TuHq2PQJS9pScYfU+KWz8l3XB2bF6v6151+a0PXSHwnQ6rma82Pun3frc0?=
 =?iso-8859-1?Q?alVplWHbMOWPDQbl4AiMrwN8DZUKlLhikkewjjTpKmFPPpMy0SAvg10OJq?=
 =?iso-8859-1?Q?5AJfEy8dabhGkmGcJk5KtY6etKy7Ts20kLC2uretp2EIOjjfRIg9FOD2me?=
 =?iso-8859-1?Q?QieEYl7AQUTr02CtqtEXMlTYJV/pQEX4edGrcTzeVc9IJGYhLPEt6Farv6?=
 =?iso-8859-1?Q?pW+Kf8St7EZgp4gXXIjlWsY2gKOzBkQApCnFkwJG/gt0xx7tAgWSo+hDcT?=
 =?iso-8859-1?Q?oLTL/jQA0P6WEUtZdT1lZhHvVdc9jCmkAYmvDvE2/xpW7Qj9EuH1ICr3Ud?=
 =?iso-8859-1?Q?N7CLI5WYOMPUHS8WJEgKO/yAn8DgwKHXpneeqKtZ/P6Ilv+WcRugzAHhxA?=
 =?iso-8859-1?Q?nx1TAiDZfxOvhIaq+JNJhsuk9DVyXjPlOauFKe6UcuBL1xow03n9ZpbO4X?=
 =?iso-8859-1?Q?70De85wZ9Nwyj3YgPbgnTx+cHy1Pb5NMsIzOKYWjp54MKzQbHo5VAECygW?=
 =?iso-8859-1?Q?ep9l7kfbbn0ANro7pf0BBSe1T5JWxo6pZJ2AuFKKS6OD1+z4F1o4NdckjE?=
 =?iso-8859-1?Q?3OR5DpEkuU1+ENzu2GrtNbWgNF57dz0kdr7CuRUwmlL3j/R7siOHBacSfN?=
 =?iso-8859-1?Q?uvRYidYXQbX/NA5eJcO4a5uMIk7c0rHU8MY8ZCdPJKN2WrAKHCD7VdS0lu?=
 =?iso-8859-1?Q?AbepEbJ6SRdiwtjy/b6nO2Tr/HLOhKvJnVqxyDCschVy01luTJtVRJ2K8c?=
 =?iso-8859-1?Q?NnNee9W5NTmaehjUZeJ175wLCXUFIYToaqzaLsBr9yhY5xvEpfUC8iKrXE?=
 =?iso-8859-1?Q?S/H1GE+AU4NcwaeMO6iwm91ZTHVtZIcYAMXau5XSOavGGYPwcdFirIA/f6?=
 =?iso-8859-1?Q?ipWJWYkpizbVsCCx/Z3aPxBvV2tn56870hKma+wk52wgiH?=
Content-Type: multipart/alternative;
 boundary="_000_CO6PR12MB5473F2A9C21F68886DDF140082F49CO6PR12MB5473namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0466e9-7de8-4e4c-8dae-08da233cc26b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 02:15:09.2872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SItNRgdTKxQdJ22mJp9cISAtcwwufjVEXXI5YYIupQA5zMU3bi+NYp/y496pKK++
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2901
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

--_000_CO6PR12MB5473F2A9C21F68886DDF140082F49CO6PR12MB5473namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]



________________________________
From: Kuehling, Felix <Felix.Kuehling@amd.com>
Sent: Thursday, April 21, 2022 5:21 AM
To: Lazar, Lijo <Lijo.Lazar@amd.com>; Koenig, Christian <Christian.Koenig@a=
md.com>; Wang, Yang(Kevin) <KevinYang.Wang@amd.com>; Christian K=F6nig <cko=
enig.leichtzumerken@gmail.com>; dri-devel@lists.freedesktop.org <dri-devel@=
lists.freedesktop.org>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freede=
sktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmallo=
c limit


On 2022-04-20 09:23, Lazar, Lijo wrote:
>
>
> On 4/20/2022 6:26 PM, Christian K=F6nig wrote:
>> Am 20.04.22 um 14:54 schrieb Wang, Yang(Kevin):
>>>
>>> [AMD Official Use Only]
>>>
>>>
>>> Hi Chris,
>>>
>>> 1) Change the test case to use something larger than 1TiB.
>>> sure, we can increase the size of BO and make test pass,
>>> but if user really want to allocate 1TB GTT BO, we have no reason to
>>> let it fail? right?
>>
>> No, the reason is the underlying core kernel doesn't allow kvmalloc
>> allocations with GFP_ZERO which are large enough to hold the array of
>> allocated pages for this.
>>
>> We are working on top of the core Linux kernel and should *NEVER*
>> ever add workarounds like what was suggested here. >
>
> AFAIU, for the purpose of ttm use, fallback to vmalloc is fine.
>
>  * Please note that any use of gfp flags outside of GFP_KERNEL is
> careful to not
>  * fall back to vmalloc.
>  *

That's weird, because kvcalloc does the same thing. If that were not
able to fall back to vmalloc, it would be pretty useless.

    static inline __alloc_size(1, 2) void *kvcalloc(size_t n, size_t size, =
gfp_t flags)
    {
             return kvmalloc_array(n, size, flags | __GFP_ZERO);
    }

Maybe kvcalloc is the function we TTM should be using here anyway,
instead of open-coding the kvmalloc_array call with an extra GFP flag.

Regards,
   Felix

Yes, I agree with your point, and in amdkfd driver code, we have the same r=
isk in svm_range_dma_map_dev().

Best Regards,
Kevin

>
> Actually the current implementation documents the behavior, but it is
> deep inside the implementation to be noticeable - at least not obvious
> while using kvmalloc_array.
>
> Thanks,
> Lijo
>
>> Regards,
>> Christian.
>>
>>> the system availed memory about 2T, but it will still fail.
>>>
>>> 2) Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc
>>> fallback path.
>>>     the 5.18 kernel will add this patch to fix this issue .
>>>
>>> Best Regards,
>>> Kevin
>>> -----------------------------------------------------------------------=
-
>>>
>>> *From:* Koenig, Christian <Christian.Koenig@amd.com>
>>> *Sent:* Wednesday, April 20, 2022 8:42 PM
>>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com>; Christian K=F6nig
>>> <ckoenig.leichtzumerken@gmail.com>; dri-devel@lists.freedesktop.org
>>> <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org
>>> <amd-gfx@lists.freedesktop.org>
>>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size
>>> exceeds kmalloc limit
>>> Hi Kevin,
>>>
>>> yes and that is perfectly valid and expected behavior. There is
>>> absolutely no need to change anything in TTM here.
>>>
>>> What we could do is:
>>> 1) Change the test case to use something larger than 1TiB.
>>> 2) Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc
>>> fallback path.
>>>
>>> Regards,
>>> Christian.
>>>
>>> Am 20.04.22 um 14:39 schrieb Wang, Yang(Kevin):
>>>>
>>>> [AMD Official Use Only]
>>>>
>>>>
>>>> Hi Chirs,
>>>>
>>>> yes, right, the amdgpu drive rwill use amdgpu_bo_validate_size()
>>>> function to verify bo size,
>>>> but when driver try to allocate VRAM domain bo fail, the amdgpu
>>>> driver will fall back to allocate domain =3D (GTT | VRAM)  bo.
>>>> please check following code, it will cause the 2nd time to allocate
>>>> bo fail during allocate 256Mb buffer to store dma address (via
>>>> kvmalloc()).
>>>>
>>>> initial_domain =3D (u32)(0xffffffff & args->in.domains);
>>>> retry:
>>>>         r =3D amdgpu_gem_object_create(adev, size, args->in.alignment,
>>>>                    initial_domain,
>>>>                    flags, ttm_bo_type_device, resv, &gobj);
>>>>         if (r && r !=3D -ERESTARTSYS) {
>>>>                 if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
>>>>       flags &=3D ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
>>>>       goto retry;
>>>>                 }
>>>>
>>>>                 if (initial_domain =3D=3D AMDGPU_GEM_DOMAIN_VRAM) {
>>>>       initial_domain |=3D AMDGPU_GEM_DOMAIN_GTT;
>>>>       goto retry;
>>>>                 }
>>>> DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu, %d)\n",
>>>>               size, initial_domain, args->in.alignment, r);
>>>>         }
>>>>
>>>> Best Regards,
>>>> Kevin
>>>>
>>>> ----------------------------------------------------------------------=
--
>>>>
>>>> *From:* Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
>>>> <mailto:ckoenig.leichtzumerken@gmail.com>
>>>> *Sent:* Wednesday, April 20, 2022 7:55 PM
>>>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com>
>>>> <mailto:KevinYang.Wang@amd.com>; Koenig, Christian
>>>> <Christian.Koenig@amd.com> <mailto:Christian.Koenig@amd.com>;
>>>> dri-devel@lists.freedesktop.org
>>>> <mailto:dri-devel@lists.freedesktop.org>
>>>> <dri-devel@lists.freedesktop.org>
>>>> <mailto:dri-devel@lists.freedesktop.org>;
>>>> amd-gfx@lists.freedesktop.org
>>>> <mailto:amd-gfx@lists.freedesktop.org>
>>>> <amd-gfx@lists.freedesktop.org> <mailto:amd-gfx@lists.freedesktop.org>
>>>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size
>>>> exceeds kmalloc limit
>>>> Hi Kevin,
>>>>
>>>> no, the test case should already fail in amdgpu_bo_validate_size().
>>>>
>>>> If we have a system with 2TiB of memory where the test case could
>>>> succeed then we should increase the requested size to something
>>>> larger.
>>>>
>>>> And if the underlying core Linux kernel functions don't allow
>>>> allocations as large as the requested one we should *NEVER* ever
>>>> add workarounds like this.
>>>>
>>>> It is perfectly expected that this test case is not able to fulfill
>>>> the desired allocation. That it fails during kvmalloc is
>>>> unfortunate, but not a show stopper.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>
>>>> Am 20.04.22 um 13:32 schrieb Wang, Yang(Kevin):
>>>>>
>>>>> [AMD Official Use Only]
>>>>>
>>>>>
>>>>> Hi Chris,
>>>>>
>>>>> you misunderstood background about this case.
>>>>>
>>>>> although we expect this test case to fail, it should fail at the
>>>>> location where the Bo actual memory is actually allocated. now the
>>>>> code logic will cause the failure to allocate memory to store DMA
>>>>> address.
>>>>>
>>>>> e.g: the case is failed in 2TB system ram machine, it should be
>>>>> allocated successful, but it is failed.
>>>>>
>>>>> allocate 1TB BO, the ttm should allocate 1TB/4k * 8 buffer to
>>>>> store allocate result (page address), this should not be failed
>>>>> usually.
>>>>>
>>>>> There is a similar fix in upstream kernel 5.18, before this fix
>>>>> entered the TTM code, this problem existed in TTM.
>>>>>
>>>>> kernel/git/torvalds/linux.git - Linux kernel source tree
>>>>> <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/?h=3Dv5.18-rc3&id=3Da421ef303008b0ceee2cfc625c3246fa7654b0ca
>>>>> mm: allow !GFP_KERNEL allocations for kvmalloc
>>>>>
>>>>> Best Regards,
>>>>> Kevin
>>>>>
>>>>> ---------------------------------------------------------------------=
---
>>>>>
>>>>> *From:* Koenig, Christian <Christian.Koenig@amd.com>
>>>>> <mailto:Christian.Koenig@amd.com>
>>>>> *Sent:* Wednesday, April 20, 2022 6:53 PM
>>>>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com>
>>>>> <mailto:KevinYang.Wang@amd.com>; dri-devel@lists.freedesktop.org
>>>>> <mailto:dri-devel@lists.freedesktop.org>
>>>>> <dri-devel@lists.freedesktop.org>
>>>>> <mailto:dri-devel@lists.freedesktop.org>;
>>>>> amd-gfx@lists.freedesktop.org
>>>>> <mailto:amd-gfx@lists.freedesktop.org>
>>>>> <amd-gfx@lists.freedesktop.org>
>>>>> <mailto:amd-gfx@lists.freedesktop.org>
>>>>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size
>>>>> exceeds kmalloc limit
>>>>> Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):
>>>>>>
>>>>>> [AMD Official Use Only]
>>>>>>
>>>>>>
>>>>>>
>>>>>> --------------------------------------------------------------------=
----
>>>>>>
>>>>>> *From:* Koenig, Christian <Christian.Koenig@amd.com>
>>>>>> <mailto:Christian.Koenig@amd.com>
>>>>>> *Sent:* Wednesday, April 20, 2022 5:00 PM
>>>>>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com>
>>>>>> <mailto:KevinYang.Wang@amd.com>; dri-devel@lists.freedesktop.org
>>>>>> <mailto:dri-devel@lists.freedesktop.org>
>>>>>> <dri-devel@lists.freedesktop.org>
>>>>>> <mailto:dri-devel@lists.freedesktop.org>;
>>>>>> amd-gfx@lists.freedesktop.org
>>>>>> <mailto:amd-gfx@lists.freedesktop.org>
>>>>>> <amd-gfx@lists.freedesktop.org>
>>>>>> <mailto:amd-gfx@lists.freedesktop.org>
>>>>>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size
>>>>>> exceeds kmalloc limit
>>>>>> Am 20.04.22 um 10:56 schrieb Yang Wang:
>>>>>> > if the __GFP_ZERO is set, the kvmalloc() can't fallback to use
>>>>>> vmalloc()
>>>>>>
>>>>>> Hui what? Why should kvmalloc() not be able to fallback to vmalloc()
>>>>>> when __GFP_ZERO is set?
>>>>>>
>>>>>> And even that is really the case then that sounds like a bug in
>>>>>> kvmalloc().
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>> [kevin]:
>>>>>> it is really test case from libdrm amdgpu test, which try to
>>>>>> allocate a big BO which will cause ttm tt init fail.
>>>>>
>>>>>
>>>>> LOL! Guys, this test case is intended to fail!
>>>>> *
>>>>> *The test consists of allocating a buffer so ridiculous large that
>>>>> it should never succeed and be rejected by the kernel driver.
>>>>>
>>>>> This patch here is a really clear NAK.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> it may be a kvmalloc() bug, and this patch can as a workaround
>>>>>> in ttm before this issue fix.
>>>>>>
>>>>>> void *kvmalloc_node(size_t size, gfp_t flags, int node)
>>>>>> {
>>>>>> ...
>>>>>>       if ((flags & GFP_KERNEL) !=3D GFP_KERNEL)
>>>>>>               return kmalloc_node(size, flags, node);
>>>>>> ...
>>>>>> }
>>>>>>
>>>>>> Best Regards,
>>>>>> Kevin
>>>>>>
>>>>>> > to allocate memory, when request size is exceeds kmalloc limit,
>>>>>> it will
>>>>>> > cause allocate memory fail.
>>>>>> >
>>>>>> > e.g: when ttm want to create a BO with 1TB size, it maybe fail.
>>>>>> >
>>>>>> > Signed-off-by: Yang Wang <KevinYang.Wang@amd.com>
>>>>>> <mailto:KevinYang.Wang@amd.com>
>>>>>> > ---
>>>>>> >   drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---
>>>>>> >   1 file changed, 11 insertions(+), 3 deletions(-)
>>>>>> >
>>>>>> > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
>>>>>> b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>>> > index 79c870a3bef8..9f2f3e576b8d 100644
>>>>>> > --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>>>>> > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>>> > @@ -97,9 +97,12 @@ int ttm_tt_create(struct ttm_buffer_object
>>>>>> *bo, bool zero_alloc)
>>>>>> >   static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
>>>>>> >   {
>>>>>> >        ttm->pages =3D kvmalloc_array(ttm->num_pages, sizeof(void*)=
,
>>>>>> > -                     GFP_KERNEL | __GFP_ZERO);
>>>>>> > + GFP_KERNEL);
>>>>>> >        if (!ttm->pages)
>>>>>> >                return -ENOMEM;
>>>>>> > +
>>>>>> > +     memset(ttm->pages, 0, ttm->num_pages * sizeof(void *));
>>>>>> > +
>>>>>> >        return 0;
>>>>>> >   }
>>>>>> >
>>>>>> > @@ -108,10 +111,12 @@ static int
>>>>>> ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)
>>>>>> >        ttm->pages =3D kvmalloc_array(ttm->num_pages,
>>>>>> > sizeof(*ttm->pages) +
>>>>>> > sizeof(*ttm->dma_address),
>>>>>> > - GFP_KERNEL | __GFP_ZERO);
>>>>>> > + GFP_KERNEL);
>>>>>> >        if (!ttm->pages)
>>>>>> >                return -ENOMEM;
>>>>>> >
>>>>>> > +     memset(ttm->pages, 0, ttm->num_pages *
>>>>>> (sizeof(*ttm->pages) + sizeof(*ttm->dma_address)));
>>>>>> > +
>>>>>> >        ttm->dma_address =3D (void *)(ttm->pages + ttm->num_pages);
>>>>>> >        return 0;
>>>>>> >   }
>>>>>> > @@ -120,9 +125,12 @@ static int
>>>>>> ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)
>>>>>> >   {
>>>>>> >        ttm->dma_address =3D kvmalloc_array(ttm->num_pages,
>>>>>> > sizeof(*ttm->dma_address),
>>>>>> > - GFP_KERNEL | __GFP_ZERO);
>>>>>> > + GFP_KERNEL);
>>>>>> >        if (!ttm->dma_address)
>>>>>> >                return -ENOMEM;
>>>>>> > +
>>>>>> > +     memset(ttm->dma_address, 0, ttm->num_pages *
>>>>>> sizeof(*ttm->dma_address));
>>>>>> > +
>>>>>> >        return 0;
>>>>>> >   }
>>>>>> >
>>>>>>
>>>>>
>>>>
>>>
>>

--_000_CO6PR12MB5473F2A9C21F68886DDF140082F49CO6PR12MB5473namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Kuehling, Felix &lt;F=
elix.Kuehling@amd.com&gt;<br>
<b>Sent:</b> Thursday, April 21, 2022 5:21 AM<br>
<b>To:</b> Lazar, Lijo &lt;Lijo.Lazar@amd.com&gt;; Koenig, Christian &lt;Ch=
ristian.Koenig@amd.com&gt;; Wang, Yang(Kevin) &lt;KevinYang.Wang@amd.com&gt=
;; Christian K=F6nig &lt;ckoenig.leichtzumerken@gmail.com&gt;; dri-devel@li=
sts.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; amd-gfx@lists.=
freedesktop.org
 &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds=
 kmalloc limit</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof"><br>
On 2022-04-20 09:23, Lazar, Lijo wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 4/20/2022 6:26 PM, Christian K=F6nig wrote:<br>
&gt;&gt; Am 20.04.22 um 14:54 schrieb Wang, Yang(Kevin):<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [AMD Official Use Only]<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hi Chris,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 1) Change the test case to use something larger than 1TiB.<br>
&gt;&gt;&gt; sure, we can increase the size of BO and make test pass,<br>
&gt;&gt;&gt; but if user really want to allocate 1TB GTT BO, we have no rea=
son to <br>
&gt;&gt;&gt; let it fail? right?<br>
&gt;&gt;<br>
&gt;&gt; No, the reason is the underlying core kernel doesn't allow kvmallo=
c <br>
&gt;&gt; allocations with GFP_ZERO which are large enough to hold the array=
 of <br>
&gt;&gt; allocated pages for this.<br>
&gt;&gt;<br>
&gt;&gt; We are working on top of the core Linux kernel and should *NEVER* =
<br>
&gt;&gt; ever add workarounds like what was suggested here. &gt;<br>
&gt;<br>
&gt; AFAIU, for the purpose of ttm use, fallback to vmalloc is fine.<br>
&gt;<br>
&gt; &nbsp;* Please note that any use of gfp flags outside of GFP_KERNEL is=
 <br>
&gt; careful to not<br>
&gt; &nbsp;* fall back to vmalloc.<br>
&gt; &nbsp;*<br>
<br>
That's weird, because kvcalloc does the same thing. If that were not <br>
able to fall back to vmalloc, it would be pretty useless.<br>
<br>
&nbsp;&nbsp;&nbsp; static inline __alloc_size(1, 2) void *kvcalloc(size_t n=
, size_t size, gfp_t flags)<br>
&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
turn kvmalloc_array(n, size, flags | __GFP_ZERO);<br>
&nbsp;&nbsp;&nbsp; }<br>
<br>
Maybe kvcalloc is the function we TTM should be using here anyway, <br>
instead of open-coding the kvmalloc_array call with an extra GFP flag.<br>
<br>
Regards,<br>
&nbsp;&nbsp; Felix</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Yes, I agree with your point, and i=
n amdkfd driver code, we have the same risk in&nbsp;svm_range_dma_map_dev()=
.<br>
<br>
Best Regards,<br>
Kevin<br>
<br>
&gt;<br>
&gt; Actually the current implementation documents the behavior, but it is =
<br>
&gt; deep inside the implementation to be noticeable - at least not obvious=
 <br>
&gt; while using kvmalloc_array.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Lijo<br>
&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Christian.<br>
&gt;&gt;<br>
&gt;&gt;&gt; the system availed memory about 2T, but it will still fail.<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 2) Change kvmalloc to allow GFP_ZERO allocations even in the v=
malloc <br>
&gt;&gt;&gt; fallback path.<br>
&gt;&gt;&gt; &nbsp; &nbsp; the 5.18 kernel will add this patch to fix this =
issue .<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Best Regards,<br>
&gt;&gt;&gt; Kevin<br>
&gt;&gt;&gt; --------------------------------------------------------------=
---------- <br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; *From:* Koenig, Christian &lt;Christian.Koenig@amd.com&gt;<br>
&gt;&gt;&gt; *Sent:* Wednesday, April 20, 2022 8:42 PM<br>
&gt;&gt;&gt; *To:* Wang, Yang(Kevin) &lt;KevinYang.Wang@amd.com&gt;; Christ=
ian K=F6nig <br>
&gt;&gt;&gt; &lt;ckoenig.leichtzumerken@gmail.com&gt;; dri-devel@lists.free=
desktop.org <br>
&gt;&gt;&gt; &lt;dri-devel@lists.freedesktop.org&gt;; amd-gfx@lists.freedes=
ktop.org <br>
&gt;&gt;&gt; &lt;amd-gfx@lists.freedesktop.org&gt;<br>
&gt;&gt;&gt; *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size=
 <br>
&gt;&gt;&gt; exceeds kmalloc limit<br>
&gt;&gt;&gt; Hi Kevin,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; yes and that is perfectly valid and expected behavior. There i=
s <br>
&gt;&gt;&gt; absolutely no need to change anything in TTM here.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; What we could do is:<br>
&gt;&gt;&gt; 1) Change the test case to use something larger than 1TiB.<br>
&gt;&gt;&gt; 2) Change kvmalloc to allow GFP_ZERO allocations even in the v=
malloc <br>
&gt;&gt;&gt; fallback path.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt; Christian.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Am 20.04.22 um 14:39 schrieb Wang, Yang(Kevin):<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; [AMD Official Use Only]<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Hi Chirs,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; yes, right, the amdgpu drive rwill use amdgpu_bo_validate_=
size() <br>
&gt;&gt;&gt;&gt; function to verify bo size,<br>
&gt;&gt;&gt;&gt; but when driver try to allocate VRAM domain bo fail, the a=
mdgpu <br>
&gt;&gt;&gt;&gt; driver will fall back to allocate domain =3D (GTT | VRAM)&=
nbsp; bo.<br>
&gt;&gt;&gt;&gt; please check following code, it will cause the 2nd time&nb=
sp;to allocate <br>
&gt;&gt;&gt;&gt; bo fail during allocate 256Mb buffer to store dma address =
(via <br>
&gt;&gt;&gt;&gt; kvmalloc()).<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; initial_domain =3D (u32)(0xffffffff &amp; args-&gt;in.doma=
ins);<br>
&gt;&gt;&gt;&gt; retry:<br>
&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; r =3D amdgpu_gem_object_create=
(adev, size, args-&gt;in.alignment,<br>
&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;initial_domain,<br>
&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;flags, ttm_bo_type_device, resv, &amp;gobj);<br>
&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; if (r &amp;&amp; r !=3D -EREST=
ARTSYS) {<br>
&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if=
 (flags &amp; AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {<br>
&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; flags &amp;=3D ~AMDGPU_GEM_CREATE_CPU=
_ACCESS_REQUIRED;<br>
&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; goto retry;<br>
&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<=
br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if=
 (initial_domain =3D=3D AMDGPU_GEM_DOMAIN_VRAM) {<br>
&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; initial_domain |=3D AMDGPU_GEM_DOMAIN=
_GTT;<br>
&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; goto retry;<br>
&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<=
br>
&gt;&gt;&gt;&gt; DRM_DEBUG(&quot;Failed to allocate GEM object (%llu, %d, %=
llu, %d)\n&quot;,<br>
&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size, ini=
tial_domain, args-&gt;in.alignment, r);<br>
&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Best Regards,<br>
&gt;&gt;&gt;&gt; Kevin<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; ----------------------------------------------------------=
-------------- <br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; *From:* Christian K=F6nig &lt;ckoenig.leichtzumerken@gmail=
.com&gt; <br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" da=
ta-auth=3D"NotApplicable">mailto:ckoenig.leichtzumerken@gmail.com</a>&gt;<b=
r>
&gt;&gt;&gt;&gt; *Sent:* Wednesday, April 20, 2022 7:55 PM<br>
&gt;&gt;&gt;&gt; *To:* Wang, Yang(Kevin) &lt;KevinYang.Wang@amd.com&gt; <br=
>
&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:KevinYang.Wang@amd.com" data-auth=3D=
"NotApplicable">mailto:KevinYang.Wang@amd.com</a>&gt;; Koenig, Christian
<br>
&gt;&gt;&gt;&gt; &lt;Christian.Koenig@amd.com&gt; &lt;<a href=3D"mailto:Chr=
istian.Koenig@amd.com" data-auth=3D"NotApplicable">mailto:Christian.Koenig@=
amd.com</a>&gt;;
<br>
&gt;&gt;&gt;&gt; dri-devel@lists.freedesktop.org <br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:dri-devel@lists.freedesktop.org" dat=
a-auth=3D"NotApplicable">mailto:dri-devel@lists.freedesktop.org</a>&gt;
<br>
&gt;&gt;&gt;&gt; &lt;dri-devel@lists.freedesktop.org&gt; <br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:dri-devel@lists.freedesktop.org" dat=
a-auth=3D"NotApplicable">mailto:dri-devel@lists.freedesktop.org</a>&gt;;
<br>
&gt;&gt;&gt;&gt; amd-gfx@lists.freedesktop.org <br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org" data-=
auth=3D"NotApplicable">mailto:amd-gfx@lists.freedesktop.org</a>&gt;
<br>
&gt;&gt;&gt;&gt; &lt;amd-gfx@lists.freedesktop.org&gt; &lt;<a href=3D"mailt=
o:amd-gfx@lists.freedesktop.org" data-auth=3D"NotApplicable">mailto:amd-gfx=
@lists.freedesktop.org</a>&gt;<br>
&gt;&gt;&gt;&gt; *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when =
size <br>
&gt;&gt;&gt;&gt; exceeds kmalloc limit<br>
&gt;&gt;&gt;&gt; Hi Kevin,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; no, the test case should already fail in amdgpu_bo_validat=
e_size().<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; If we have a system with 2TiB of memory where the test cas=
e could <br>
&gt;&gt;&gt;&gt; succeed then we should increase the requested size to some=
thing <br>
&gt;&gt;&gt;&gt; larger.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; And if the underlying core Linux kernel functions don't al=
low <br>
&gt;&gt;&gt;&gt; allocations as large as the requested one we should *NEVER=
* ever <br>
&gt;&gt;&gt;&gt; add workarounds like this.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; It is perfectly expected that this test case is not able t=
o fulfill <br>
&gt;&gt;&gt;&gt; the desired allocation. That it fails during kvmalloc is <=
br>
&gt;&gt;&gt;&gt; unfortunate, but not a show stopper.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt; Christian.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Am 20.04.22 um 13:32 schrieb Wang, Yang(Kevin):<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; [AMD Official Use Only]<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Hi Chris,<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; you misunderstood background about this case.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; although we expect this test case to fail, it should f=
ail at the <br>
&gt;&gt;&gt;&gt;&gt; location where the Bo actual memory is actually alloca=
ted. now the <br>
&gt;&gt;&gt;&gt;&gt; code logic will cause the failure to allocate memory t=
o store DMA <br>
&gt;&gt;&gt;&gt;&gt; address.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; e.g: the case is failed in 2TB system ram machine, it =
should be <br>
&gt;&gt;&gt;&gt;&gt; allocated successful, but it is failed.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; allocate 1TB BO, the ttm should allocate 1TB/4k * 8 bu=
ffer to <br>
&gt;&gt;&gt;&gt;&gt; store allocate result (page address), this should not =
be failed <br>
&gt;&gt;&gt;&gt;&gt; usually.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; There is a similar fix in upstream kernel 5.18, before=
 this fix <br>
&gt;&gt;&gt;&gt;&gt; entered the TTM code, this problem existed in TTM.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; kernel/git/torvalds/linux.git - Linux kernel source tr=
ee <br>
&gt;&gt;&gt;&gt;&gt; &lt;https://git.kernel.org/pub/scm/linux/kernel/git/to=
rvalds/linux.git/commit/?h=3Dv5.18-rc3&amp;id=3Da421ef303008b0ceee2cfc625c3=
246fa7654b0ca<br>
&gt;&gt;&gt;&gt;&gt; mm: allow !GFP_KERNEL allocations for kvmalloc<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Best Regards,<br>
&gt;&gt;&gt;&gt;&gt; Kevin<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; ------------------------------------------------------=
------------------ <br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; *From:* Koenig, Christian &lt;Christian.Koenig@amd.com=
&gt; <br>
&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:Christian.Koenig@amd.com" data-a=
uth=3D"NotApplicable">mailto:Christian.Koenig@amd.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; *Sent:* Wednesday, April 20, 2022 6:53 PM<br>
&gt;&gt;&gt;&gt;&gt; *To:* Wang, Yang(Kevin) &lt;KevinYang.Wang@amd.com&gt;=
 <br>
&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:KevinYang.Wang@amd.com" data-aut=
h=3D"NotApplicable">mailto:KevinYang.Wang@amd.com</a>&gt;; dri-devel@lists.=
freedesktop.org
<br>
&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:dri-devel@lists.freedesktop.org"=
 data-auth=3D"NotApplicable">mailto:dri-devel@lists.freedesktop.org</a>&gt;
<br>
&gt;&gt;&gt;&gt;&gt; &lt;dri-devel@lists.freedesktop.org&gt; <br>
&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:dri-devel@lists.freedesktop.org"=
 data-auth=3D"NotApplicable">mailto:dri-devel@lists.freedesktop.org</a>&gt;=
;
<br>
&gt;&gt;&gt;&gt;&gt; amd-gfx@lists.freedesktop.org <br>
&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org" d=
ata-auth=3D"NotApplicable">mailto:amd-gfx@lists.freedesktop.org</a>&gt;
<br>
&gt;&gt;&gt;&gt;&gt; &lt;amd-gfx@lists.freedesktop.org&gt; <br>
&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org" d=
ata-auth=3D"NotApplicable">mailto:amd-gfx@lists.freedesktop.org</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail w=
hen size <br>
&gt;&gt;&gt;&gt;&gt; exceeds kmalloc limit<br>
&gt;&gt;&gt;&gt;&gt; Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; [AMD Official Use Only]<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; --------------------------------------------------=
---------------------- <br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; *From:* Koenig, Christian &lt;Christian.Koenig@amd=
.com&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:Christian.Koenig@amd.com" da=
ta-auth=3D"NotApplicable">mailto:Christian.Koenig@amd.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; *Sent:* Wednesday, April 20, 2022 5:00 PM<br>
&gt;&gt;&gt;&gt;&gt;&gt; *To:* Wang, Yang(Kevin) &lt;KevinYang.Wang@amd.com=
&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:KevinYang.Wang@amd.com" data=
-auth=3D"NotApplicable">mailto:KevinYang.Wang@amd.com</a>&gt;; dri-devel@li=
sts.freedesktop.org
<br>
&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:dri-devel@lists.freedesktop.=
org" data-auth=3D"NotApplicable">mailto:dri-devel@lists.freedesktop.org</a>=
&gt;
<br>
&gt;&gt;&gt;&gt;&gt;&gt; &lt;dri-devel@lists.freedesktop.org&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:dri-devel@lists.freedesktop.=
org" data-auth=3D"NotApplicable">mailto:dri-devel@lists.freedesktop.org</a>=
&gt;;
<br>
&gt;&gt;&gt;&gt;&gt;&gt; amd-gfx@lists.freedesktop.org <br>
&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.or=
g" data-auth=3D"NotApplicable">mailto:amd-gfx@lists.freedesktop.org</a>&gt;
<br>
&gt;&gt;&gt;&gt;&gt;&gt; &lt;amd-gfx@lists.freedesktop.org&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.or=
g" data-auth=3D"NotApplicable">mailto:amd-gfx@lists.freedesktop.org</a>&gt;=
<br>
&gt;&gt;&gt;&gt;&gt;&gt; *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fa=
il when size <br>
&gt;&gt;&gt;&gt;&gt;&gt; exceeds kmalloc limit<br>
&gt;&gt;&gt;&gt;&gt;&gt; Am 20.04.22 um 10:56 schrieb Yang Wang:<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; if the __GFP_ZERO is set, the kvmalloc() can'=
t fallback to use <br>
&gt;&gt;&gt;&gt;&gt;&gt; vmalloc()<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Hui what? Why should kvmalloc() not be able to fal=
lback to vmalloc()<br>
&gt;&gt;&gt;&gt;&gt;&gt; when __GFP_ZERO is set?<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; And even that is really the case then that sounds =
like a bug in <br>
&gt;&gt;&gt;&gt;&gt;&gt; kvmalloc().<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt;&gt;&gt; Christian.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; [kevin]:<br>
&gt;&gt;&gt;&gt;&gt;&gt; it is really test case from libdrm amdgpu test, wh=
ich try to <br>
&gt;&gt;&gt;&gt;&gt;&gt; allocate a big BO which will cause ttm tt init fai=
l.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; LOL! Guys, this test case is intended to fail!<br>
&gt;&gt;&gt;&gt;&gt; *<br>
&gt;&gt;&gt;&gt;&gt; *The test consists of allocating a buffer so ridiculou=
s large that <br>
&gt;&gt;&gt;&gt;&gt; it should never succeed and be rejected by the kernel =
driver.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; This patch here is a really clear NAK.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt;&gt; Christian.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; it may be a kvmalloc() bug, and this patch can as =
a workaround <br>
&gt;&gt;&gt;&gt;&gt;&gt; in&nbsp;ttm&nbsp;before this issue fix.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; void *kvmalloc_node(size_t size, gfp_t flags, int =
node)<br>
&gt;&gt;&gt;&gt;&gt;&gt; {<br>
&gt;&gt;&gt;&gt;&gt;&gt; ...<br>
&gt;&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; if ((flags &amp; GFP_KERNEL) =
!=3D GFP_KERNEL)<br>
&gt;&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; r=
eturn kmalloc_node(size, flags, node);<br>
&gt;&gt;&gt;&gt;&gt;&gt; ...<br>
&gt;&gt;&gt;&gt;&gt;&gt; }<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Best Regards,<br>
&gt;&gt;&gt;&gt;&gt;&gt; Kevin<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; to allocate memory, when request size is exce=
eds kmalloc limit, <br>
&gt;&gt;&gt;&gt;&gt;&gt; it will<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; cause allocate memory fail.<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; e.g: when ttm want to create a BO with 1TB si=
ze, it maybe fail.<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; Signed-off-by: Yang Wang &lt;KevinYang.Wang@a=
md.com&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:KevinYang.Wang@amd.com" data=
-auth=3D"NotApplicable">mailto:KevinYang.Wang@amd.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_tt.c | 14=
 +++++++++++---<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp; 1 file changed, 11 insertions(+),=
 3 deletions(-)<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; diff --git a/drivers/gpu/drm/ttm/ttm_tt.c <br=
>
&gt;&gt;&gt;&gt;&gt;&gt; b/drivers/gpu/drm/ttm/ttm_tt.c<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; index 79c870a3bef8..9f2f3e576b8d 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; --- a/drivers/gpu/drm/ttm/ttm_tt.c<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; +++ b/drivers/gpu/drm/ttm/ttm_tt.c<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; @@ -97,9 +97,12 @@ int ttm_tt_create(struct t=
tm_buffer_object <br>
&gt;&gt;&gt;&gt;&gt;&gt; *bo, bool zero_alloc)<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp; static int ttm_tt_alloc_page_dire=
ctory(struct ttm_tt *ttm)<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp; {<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm=
-&gt;pages =3D kvmalloc_array(ttm-&gt;num_pages, sizeof(void*),<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; GFP_KERNEL | __GFP_ZERO);<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; + GFP_KERNEL);<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(!ttm-&gt;pages)<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;page=
s, 0, ttm-&gt;num_pages * sizeof(void *));<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn 0;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; @@ -108,10 +111,12 @@ static int <br>
&gt;&gt;&gt;&gt;&gt;&gt; ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm=
)<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm=
-&gt;pages =3D kvmalloc_array(ttm-&gt;num_pages,<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; sizeof(*ttm-&gt;pages) +<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; sizeof(*ttm-&gt;dma_address),<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; - GFP_KERNEL | __GFP_ZERO);<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; + GFP_KERNEL);<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(!ttm-&gt;pages)<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;page=
s, 0, ttm-&gt;num_pages * <br>
&gt;&gt;&gt;&gt;&gt;&gt; (sizeof(*ttm-&gt;pages) + sizeof(*ttm-&gt;dma_addr=
ess)));<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm=
-&gt;dma_address =3D (void *)(ttm-&gt;pages + ttm-&gt;num_pages);<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn 0;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; @@ -120,9 +125,12 @@ static int <br>
&gt;&gt;&gt;&gt;&gt;&gt; ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)=
<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp; {<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm=
-&gt;dma_address =3D kvmalloc_array(ttm-&gt;num_pages,<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; sizeof(*ttm-&gt;dma_address),<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; - GFP_KERNEL | __GFP_ZERO);<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; + GFP_KERNEL);<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(!ttm-&gt;dma_address)<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;dma_=
address, 0, ttm-&gt;num_pages * <br>
&gt;&gt;&gt;&gt;&gt;&gt; sizeof(*ttm-&gt;dma_address));<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn 0;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CO6PR12MB5473F2A9C21F68886DDF140082F49CO6PR12MB5473namp_--
