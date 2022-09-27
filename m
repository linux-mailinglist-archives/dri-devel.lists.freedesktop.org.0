Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 217725EB7C4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 04:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4CE10E89C;
	Tue, 27 Sep 2022 02:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3526B10E894;
 Tue, 27 Sep 2022 02:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664246200; x=1695782200;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M3qZw6mT9Cw08IXnPdhHlH4gL4IHg4vb5ddXRH38mxI=;
 b=hBH9tDNqvEuEK+JJ+khTQROCeZfG4dvi7Gq5riHlvqHmmxwFppIPIRyU
 /mcDavRrCh1ZJ2pgxWic5OuPtq260cvsauTngsr/O99bOLVDUXJV8ixf7
 xpSa12Fw0sA6Gy/GfMwEAlhBTZNr/Yl1bM0+fhLmsw1WGjZoqUPZidDak
 b8g4YzIxVJFWhgGFTmk5UWQNQrlra+s5prKdzE4/4YfFuPcsT7P5OqzaM
 +o2Q7kBUZmXWIwX8gNXrc6HMiKdIT2411Vcf/JjUVjGFUBauybDIA/tSn
 LFQ51E/eDLWJaaRV+1vBLZMRAKqKDHHDFkReqU73oKQ+tI42uc1x3oJLP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="284317265"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; d="scan'208";a="284317265"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 19:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="572483376"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; d="scan'208";a="572483376"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 26 Sep 2022 19:36:27 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 19:36:27 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 19:36:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 26 Sep 2022 19:36:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 26 Sep 2022 19:36:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZxk2lmBm6bguWTHrclSx7f9tqv1SUsDhJda71HcHIuXEXKnjc9vDLkfULQNmTJl1zePO6345FKKp3aHRqemCUpgKrNT0VOXiZI5hrAti4GX3m9Lhm+RCj68hhedjvDxrdUHW+KnG/MHNKcNeFJk1zaUNGj2YQd8Q6rquBTleewolhewST2w11F9znQWbc7pTY+iXjQMgRj3zCFMJGpKaFVSQPw/5e9k8Kf5QgztUJEwsccJvpiOjqagBm8PZGcKSMuBJibKSG0KnMNHyz9aBPdpCFBxg5H2a6deHO6Wyk954vy8zPx5IeX/tf/B/Xubb7dQgjzvKU5kKS+ZXiviaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3uJsj0/95aMlhbQPSsXFGQAFwdD/I/AvdewlL0pPtQ=;
 b=KD124N4xtzEbi4rLygcj0QxniuLG7eEYCJby6RLsok1woU8Whci4WQMJO8X0dkSjp8Sq85i8krWydx9ajssCZ0vF/nEBqHBIuDLYanUv0EOcyk5HnXDH+478WwVvPhapvLAIoCfmD+SPy4IUZrypBjo1YCcJwhUqnFgnTnHEyUaGgnJq4DZ6kjvgu0yGE7llKrf8SGlmZkXo97lZhtsg+YTIL1lPRkPYepJMFcytMnCMomakxD6RO5SmRIiBOisEHo2y1ZN0mvL+y0WUc7gpzswtqRONqaxNUOJe7caz94g+WJdM4kb2NtAteZn7b+Eh25usUpbzAzTh4VwbfXKPkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR11MB1633.namprd11.prod.outlook.com (2603:10b6:405:e::22)
 by SA2PR11MB4953.namprd11.prod.outlook.com (2603:10b6:806:117::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 02:36:24 +0000
Received: from BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::6d4e:976f:7d77:8fbd]) by BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::6d4e:976f:7d77:8fbd%6]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 02:36:24 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [RFC v4 06/14] drm/i915/vm_bind: Handle persistent
 vmas
Thread-Topic: [Intel-gfx] [RFC v4 06/14] drm/i915/vm_bind: Handle persistent
 vmas
Thread-Index: AQHYzYlZYE9JsqcGuESsch4wG/g76K3yl56w
Date: Tue, 27 Sep 2022 02:36:24 +0000
Message-ID: <BN6PR11MB16331BEF9028F43443AFA23F92559@BN6PR11MB1633.namprd11.prod.outlook.com>
References: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
 <20220921070945.27764-7-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20220921070945.27764-7-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1633:EE_|SA2PR11MB4953:EE_
x-ms-office365-filtering-correlation-id: f4f45cf7-95cd-4788-473e-08daa0311232
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ww9agRDWw84iVmWZ9prVAZxY+0uuSMsJh4WuG7JKWO8lQRzcduOxmRHObOEuEYaKNcoDvEEAgnywznl9WRZudauUma3eo8eH3hvgu7YUuKUzSYjr4lLczEt950dI/GibkXl1u5KFnR4ZphkmMn7Slfakft0P8YDKewALNqxc+oB7E12zOzdVf9nQdqVJU+RylO0sXiWrvKQSljU9B2jc+ETImZiZp6vvMa6p17p5ksxC/Mf0DYeC8HbowICC7Ku7iOEuoyrfu6kM3TuG4ir/GpP6dTXfXE7O+RSENocgNuTyUqgMecP1NBLKkDwJM6IwANGQVFytbC9Di2ZjcOPSdW7Y24knGk+8iHmmcJMgEPcdrmtWt5vBcO8q1xj8YPrzouV8/tNFDJccEaPyBowYGbwcQX7tg3Eswojb7JmcVPXFtZocFP6QqhvymCszRwy7iLi9vOcflhD2E5crwUzlGw8btN6SEncAu8wtaunG4+Q1DC9ZpyzDUOxlkdC+RwP73+8W6Tt7wYBE2N0V8CCX3iw72CLiLIy6HsfMDz5z0b1yMHfzaLojgh9wGBGOmhxwa3E9wor2fPr/TqCy5CE2yuuyeoRKhh/nd9nhfkkAPhT08JPMYp9qJvvBUtO3Iw1U7mU+kWI1xtfJArtdpPqfsg8JhdpTmBZL0uR1GQrIlLVjphGEqPR1cSAgrS01423KyYKikcvvGU3Ht6QWERbuRkKj34ilFM1TXbJypI2IbBsQkEhZvAhzF3pXxofnpefK4wt7L128aHlSLyxWY8R2AA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1633.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199015)(82960400001)(122000001)(38100700002)(38070700005)(64756008)(4326008)(76116006)(8676002)(66946007)(110136005)(54906003)(66556008)(66476007)(66446008)(316002)(5660300002)(30864003)(2906002)(8936002)(52536014)(186003)(55016003)(83380400001)(478600001)(26005)(6506007)(53546011)(71200400001)(7696005)(9686003)(41300700001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i5lNut/TAe6DOm0Px6f7pcONyjRpwBH8tfjwEUBF/n5znvkbPnxH3KkdlbCq?=
 =?us-ascii?Q?SrldKIXbBUk0a8P7ClPa6D6JZkO7IYLEkACUN1hBj5FO1L9xKs7wazwxfoav?=
 =?us-ascii?Q?06IwC6Otd7yJAQegqO2LNbNerj3OierhG81obzenBB2WOuOrZVYaHtuYMd8Y?=
 =?us-ascii?Q?ZLpKBynXjIXH65zxgvEHM0f4kU1nqT+54irqJ6JK+TDoWN/55NAvWgbM/FtM?=
 =?us-ascii?Q?G/5/H9PZaBoLMbJu+AN7jGT8OUcX3dFOJipOViOmKSfYT61qCLxY6TTdpMtf?=
 =?us-ascii?Q?ByMXUrTLvxBv3EOvtAwNmSwyjwWp3BZ++mzxD2GYK79prLlne7oVyP9Fv/kz?=
 =?us-ascii?Q?EjlpGNgNbmfy42GR0+crxVeXgBjs9vYsSJtUomKpglb8Xj4BsqYLlGpzCEVb?=
 =?us-ascii?Q?BSPsMBbcM6OpWE0WzGhH/V4e5wCbLFU+o3AuhU98cOlnYx5P7utaaiEeP71H?=
 =?us-ascii?Q?IftyuZ1ziyCIBIJ8iZQMSSKh7TzhABSg7T+9sd++YemK4892pavKcZ0+GFcw?=
 =?us-ascii?Q?pU9PAOlk9Ic5bY04kgIS6Rb24bOxm3EC7lMx5zH1Hrc/SA0JHWlMckr2Sdt/?=
 =?us-ascii?Q?BF/j1IGBfu4k9widn0R8sgc66brfyUpaamC9qRiCCJghsAtlXLO+G3FcVtcH?=
 =?us-ascii?Q?UPwPrsu9j9hvDfbC/FowXg1Nz722X2mQ+fqKuY3sB93CcNK/m/pzIzurVD5T?=
 =?us-ascii?Q?vIM/OtmGRUpxEvsjeJx1dF9x8EK4/vqC8H8ZhS0RKY84A171tlpXB2Xi8+Fe?=
 =?us-ascii?Q?X8ZH6g7U4BJkWTDfYeiPt5s/1L6iFTq3cpRdEgPxCq1fHllR7Igr/lf8lIbv?=
 =?us-ascii?Q?deEXGR4PqasZNU4f0VeZMzqTi5Dofyi3sTb4QWB2NRbd+7yQbuGcQbjxSr3x?=
 =?us-ascii?Q?pLjAJzG+aKyoxqPiAnukTwDE5T4dK7vFfFWOvpvDeMEhr7e+ByIJnbMl/rw1?=
 =?us-ascii?Q?KCuu+PBRq+ViJ7yDbSrxZBfomuNl7dG1bi+bjyByrHueDrDBXZJg+axibri1?=
 =?us-ascii?Q?LwXDT5RdtkTJYmdxSEIVRyXsoHXMgS9FbkguPDfwS6lfR6jCi9irnKh2iX4f?=
 =?us-ascii?Q?CSu8MOG/9T0LZfhTJPn8LTK+lsu2gEycQ8hA7mVHVvJ9QOz3tNHpw1zmmF2y?=
 =?us-ascii?Q?GAUlmFE1Te2WkZRk/nQHn8/h5+jJcHYQzXlLlmeJFJjErAIDAjhbMVkINrqg?=
 =?us-ascii?Q?StIpOWsFuq3AH0pWbR5rMbzzuxE2Z19Pp/rdmkVukbI+5V9JX3xaBSzofywy?=
 =?us-ascii?Q?ytQwZ3rBIJAJiA6RHGsJA1uireDp+YKECdf8EtecfM7v5JZ7jVUL8pckowzB?=
 =?us-ascii?Q?+njN7cVQccI0VXV2NpKMd4/eN+1jdMUpK3NkWJg3PgnbE7c3diNKLh4Cny+B?=
 =?us-ascii?Q?erT0uZm1qpushR4D7tIczMbHKT46c4pEzrJiOdqlnf4TbMp9u0T7ELy4Zuu8?=
 =?us-ascii?Q?7iY1gdLq/UwqG67QJANRwZB0irVhPJhy3HbXR4PEEoOJ6EOBjXYvLof+w//y?=
 =?us-ascii?Q?All5L9QKCDI1ybVBhQ7lEAzHdYnfuxLNDJk6i6a0vpVkecAsnUwj2sYiYDlC?=
 =?us-ascii?Q?d44trioCNoaeVbNmy/0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f45cf7-95cd-4788-473e-08daa0311232
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 02:36:24.5316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ubKLT6zMG5Ge6BbS2jF3WLJSy607dhbtqVvB1SL8v0tqLsWB3ML9resIeqoms7rgGZ5/+EahbxQbSBkiwM5Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4953
X-OriginatorOrg: intel.com
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
Cc: "Vetter, Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "Hellstrom,
 Thomas" <thomas.hellstrom@intel.com>, "Zanoni,
 Paulo R" <paulo.r.zanoni@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Regards,
Oak

> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ni=
ranjana
> Vishwanathapura
> Sent: September 21, 2022 3:10 AM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Zanoni, Paulo R <paulo.r.zanoni@intel.com>; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; Auld, Matthew <matthew.auld@intel.com>; Vet=
ter,
> Daniel <daniel.vetter@intel.com>; christian.koenig@amd.com
> Subject: [Intel-gfx] [RFC v4 06/14] drm/i915/vm_bind: Handle persistent v=
mas
>=20
> Treat VM_BIND vmas as persistent across execbuf ioctl calls and handle
> them during the request submission in the execbuff path.
>=20
> Support eviction by maintaining a list of evicted persistent vmas
> for rebinding during next submission.
>=20
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel=
.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  .../drm/i915/gem/i915_gem_vm_bind_object.c    |  7 +++
>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 +
>  drivers/gpu/drm/i915/gt/intel_gtt.h           |  4 ++
>  drivers/gpu/drm/i915/i915_gem_gtt.c           | 39 ++++++++++++++++
>  drivers/gpu/drm/i915/i915_gem_gtt.h           |  3 ++
>  drivers/gpu/drm/i915/i915_vma.c               | 46 +++++++++++++++++++
>  drivers/gpu/drm/i915/i915_vma.h               | 45 +++++++++++++-----
>  drivers/gpu/drm/i915/i915_vma_types.h         | 17 +++++++
>  8 files changed, 151 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> index 7ca6a41fc981..236f901b8b9c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> @@ -91,6 +91,12 @@ static void i915_gem_vm_bind_remove(struct i915_vma
> *vma, bool release_obj)
>  {
>  	lockdep_assert_held(&vma->vm->vm_bind_lock);
>=20
> +	spin_lock(&vma->vm->vm_rebind_lock);
> +	if (!list_empty(&vma->vm_rebind_link))
> +		list_del_init(&vma->vm_rebind_link);
> +	i915_vma_set_purged(vma);
> +	spin_unlock(&vma->vm->vm_rebind_lock);
> +
>  	list_del_init(&vma->vm_bind_link);
>  	list_del_init(&vma->non_priv_vm_bind_link);
>  	i915_vm_bind_it_remove(vma, &vma->vm->va);
> @@ -181,6 +187,7 @@ static struct i915_vma *vm_bind_get_vma(struct
> i915_address_space *vm,
>=20
>  	vma->start =3D va->start;
>  	vma->last =3D va->start + va->length - 1;
> +	i915_vma_set_persistent(vma);
>=20
>  	return vma;
>  }
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c
> b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index da4f9dee0397..6db31197fa87 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -296,6 +296,8 @@ void i915_address_space_init(struct i915_address_spac=
e
> *vm, int subclass)
>  	INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
>  	vm->root_obj =3D i915_gem_object_create_internal(vm->i915, PAGE_SIZE);
>  	GEM_BUG_ON(IS_ERR(vm->root_obj));
> +	INIT_LIST_HEAD(&vm->vm_rebind_list);
> +	spin_lock_init(&vm->vm_rebind_lock);
>  }
>=20
>  void *__px_vaddr(struct drm_i915_gem_object *p)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h
> b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index 3f2e87d3bf34..b73d35b4e05d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -273,6 +273,10 @@ struct i915_address_space {
>  	struct list_head vm_bind_list;
>  	/** @vm_bound_list: List of vm_binding completed */
>  	struct list_head vm_bound_list;
> +	/* @vm_rebind_list: list of vmas to be rebinded */
> +	struct list_head vm_rebind_list;
> +	/* @vm_rebind_lock: protects vm_rebound_list */
> +	spinlock_t vm_rebind_lock;
>  	/* @va: tree of persistent vmas */
>  	struct rb_root_cached va;
>  	struct list_head non_priv_vm_bind_list;
> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c
> b/drivers/gpu/drm/i915/i915_gem_gtt.c
> index 329ff75b80b9..b7d0844de561 100644
> --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
> @@ -25,6 +25,45 @@
>  #include "i915_trace.h"
>  #include "i915_vgpu.h"
>=20
> +/**
> + * i915_vm_sync() - Wait until address space is not in use
> + * @vm: address space
> + *
> + * Waits until all requests using the address space are complete.
> + *
> + * Returns: 0 if success, -ve err code upon failure
> + */
> +int i915_vm_sync(struct i915_address_space *vm)
> +{
> +	int ret;
> +
> +	/* Wait for all requests under this vm to finish */
> +	ret =3D dma_resv_wait_timeout(vm->root_obj->base.resv,
> +				    DMA_RESV_USAGE_BOOKKEEP, false,
> +				    MAX_SCHEDULE_TIMEOUT);
> +	if (ret < 0)
> +		return ret;
> +	else if (ret > 0)
> +		return 0;
> +	else
> +		return -ETIMEDOUT;
> +}
> +
> +/**
> + * i915_vm_is_active() - Check if address space is being used
> + * @vm: address space
> + *
> + * Check if any request using the specified address space is
> + * active.
> + *
> + * Returns: true if address space is active, false otherwise.
> + */
> +bool i915_vm_is_active(const struct i915_address_space *vm)
> +{
> +	return !dma_resv_test_signaled(vm->root_obj->base.resv,
> +				       DMA_RESV_USAGE_BOOKKEEP);
> +}
> +
>  int i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
>  			       struct sg_table *pages)
>  {
> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.h
> b/drivers/gpu/drm/i915/i915_gem_gtt.h
> index 8c2f57eb5dda..a5bbdc59d9df 100644
> --- a/drivers/gpu/drm/i915/i915_gem_gtt.h
> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.h
> @@ -51,4 +51,7 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
>=20
>  #define PIN_OFFSET_MASK		I915_GTT_PAGE_MASK
>=20
> +int i915_vm_sync(struct i915_address_space *vm);
> +bool i915_vm_is_active(const struct i915_address_space *vm);
> +
>  #endif
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_=
vma.c
> index aa332ad69ec2..ff216e9a2c8d 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -237,6 +237,7 @@ vma_create(struct drm_i915_gem_object *obj,
>=20
>  	INIT_LIST_HEAD(&vma->vm_bind_link);
>  	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
> +	INIT_LIST_HEAD(&vma->vm_rebind_link);
>  	return vma;
>=20
>  err_unlock:
> @@ -387,6 +388,24 @@ int i915_vma_wait_for_bind(struct i915_vma *vma)
>  	return err;
>  }
>=20
> +/**
> + * i915_vma_sync() - Wait for the vma to be idle
> + * @vma: vma to be tested
> + *
> + * Returns 0 on success and error code on failure
> + */
> +int i915_vma_sync(struct i915_vma *vma)
> +{
> +	int ret;
> +
> +	/* Wait for the asynchronous bindings and pending GPU reads */
> +	ret =3D i915_active_wait(&vma->active);
> +	if (ret || !i915_vma_is_persistent(vma) || i915_vma_is_purged(vma))
> +		return ret;
> +
> +	return i915_vm_sync(vma->vm);

Hi, I try to understand why we call vm_sync here. As I understand it, each =
vm has many vmas. The vma_sync function wait for a single vma to be idle, f=
or example, wait for all the request/gpu task using this vma to complete. W=
hile vm_sync wait for the whole vm to be idle. To me vm_sync essentially wa=
it for all the vmas in this vm to be idle. Isn't it?

Thanks,
Oak

> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
>  static int i915_vma_verify_bind_complete(struct i915_vma *vma)
>  {
> @@ -1654,6 +1673,13 @@ static void force_unbind(struct i915_vma *vma)
>  	if (!drm_mm_node_allocated(&vma->node))
>  		return;
>=20
> +	/*
> +	 * Mark persistent vma as purged to avoid it waiting
> +	 * for VM to be released.
> +	 */
> +	if (i915_vma_is_persistent(vma))
> +		i915_vma_set_purged(vma);
> +
>  	atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
>  	WARN_ON(__i915_vma_unbind(vma));
>  	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
> @@ -1846,6 +1872,8 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
>  	int err;
>=20
>  	assert_object_held(obj);
> +	if (i915_vma_is_persistent(vma))
> +		return -EINVAL;
>=20
>  	GEM_BUG_ON(!vma->pages);
>=20
> @@ -2015,6 +2043,16 @@ int __i915_vma_unbind(struct i915_vma *vma)
>  	__i915_vma_evict(vma, false);
>=20
>  	drm_mm_remove_node(&vma->node); /* pairs with i915_vma_release() */
> +
> +	if (i915_vma_is_persistent(vma)) {
> +		spin_lock(&vma->vm->vm_rebind_lock);
> +		if (list_empty(&vma->vm_rebind_link) &&
> +		    !i915_vma_is_purged(vma))
> +			list_add_tail(&vma->vm_rebind_link,
> +				      &vma->vm->vm_rebind_list);
> +		spin_unlock(&vma->vm->vm_rebind_lock);
> +	}
> +
>  	return 0;
>  }
>=20
> @@ -2046,6 +2084,14 @@ static struct dma_fence
> *__i915_vma_unbind_async(struct i915_vma *vma)
>  		return ERR_PTR(-EBUSY);
>  	}
>=20
> +	if (__i915_sw_fence_await_reservation(&vma->resource->chain,
> +					      vma->obj->base.resv,
> +					      DMA_RESV_USAGE_BOOKKEEP,
> +					      i915_fence_timeout(vma->vm->i915),
> +					      I915_FENCE_GFP) < 0) {
> +		return ERR_PTR(-EBUSY);
> +	}
> +
>  	fence =3D __i915_vma_evict(vma, true);
>=20
>  	drm_mm_remove_node(&vma->node); /* pairs with i915_vma_release() */
> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_=
vma.h
> index 6feef0305fe1..aa536c9ce472 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -47,12 +47,6 @@ i915_vma_instance(struct drm_i915_gem_object *obj,
>=20
>  void i915_vma_unpin_and_release(struct i915_vma **p_vma, unsigned int fl=
ags);
>  #define I915_VMA_RELEASE_MAP BIT(0)
> -
> -static inline bool i915_vma_is_active(const struct i915_vma *vma)
> -{
> -	return !i915_active_is_idle(&vma->active);
> -}
> -
>  /* do not reserve memory to prevent deadlocks */
>  #define __EXEC_OBJECT_NO_RESERVE BIT(31)
>=20
> @@ -138,6 +132,38 @@ static inline u32 i915_ggtt_pin_bias(struct i915_vma=
 *vma)
>  	return i915_vm_to_ggtt(vma->vm)->pin_bias;
>  }
>=20
> +static inline bool i915_vma_is_persistent(const struct i915_vma *vma)
> +{
> +	return test_bit(I915_VMA_PERSISTENT_BIT, __i915_vma_flags(vma));
> +}
> +
> +static inline void i915_vma_set_persistent(struct i915_vma *vma)
> +{
> +	set_bit(I915_VMA_PERSISTENT_BIT, __i915_vma_flags(vma));
> +}
> +
> +static inline bool i915_vma_is_purged(const struct i915_vma *vma)
> +{
> +	return test_bit(I915_VMA_PURGED_BIT, __i915_vma_flags(vma));
> +}
> +
> +static inline void i915_vma_set_purged(struct i915_vma *vma)
> +{
> +	set_bit(I915_VMA_PURGED_BIT, __i915_vma_flags(vma));
> +}
> +
> +static inline bool i915_vma_is_active(const struct i915_vma *vma)
> +{
> +	if (i915_vma_is_persistent(vma)) {
> +		if (i915_vma_is_purged(vma))
> +			return false;
> +
> +		return i915_vm_is_active(vma->vm);
> +	}
> +
> +	return !i915_active_is_idle(&vma->active);
> +}
> +
>  static inline struct i915_vma *i915_vma_get(struct i915_vma *vma)
>  {
>  	i915_gem_object_get(vma->obj);
> @@ -406,12 +432,7 @@ void i915_vma_make_shrinkable(struct i915_vma *vma);
>  void i915_vma_make_purgeable(struct i915_vma *vma);
>=20
>  int i915_vma_wait_for_bind(struct i915_vma *vma);
> -
> -static inline int i915_vma_sync(struct i915_vma *vma)
> -{
> -	/* Wait for the asynchronous bindings and pending GPU reads */
> -	return i915_active_wait(&vma->active);
> -}
> +int i915_vma_sync(struct i915_vma *vma);
>=20
>  /**
>   * i915_vma_get_current_resource - Get the current resource of the vma
> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h
> b/drivers/gpu/drm/i915/i915_vma_types.h
> index 6d727c2d9802..d21bf97febaa 100644
> --- a/drivers/gpu/drm/i915/i915_vma_types.h
> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> @@ -264,6 +264,21 @@ struct i915_vma {
>  #define I915_VMA_SCANOUT_BIT	17
>  #define I915_VMA_SCANOUT	((int)BIT(I915_VMA_SCANOUT_BIT))
>=20
> +  /**
> +   * I915_VMA_PERSISTENT_BIT:
> +   * The vma is persistent (created with VM_BIND call).
> +   *
> +   * I915_VMA_PURGED_BIT:
> +   * The persistent vma is force unbound either due to VM_UNBIND call
> +   * from UMD or VM is released. Do not check/wait for VM activeness
> +   * in i915_vma_is_active() and i915_vma_sync() calls.
> +   */
> +#define I915_VMA_PERSISTENT_BIT	19
> +#define I915_VMA_PURGED_BIT	20
> +
> +#define I915_VMA_PERSISTENT	((int)BIT(I915_VMA_PERSISTENT_BIT))
> +#define I915_VMA_PURGED		((int)BIT(I915_VMA_PURGED_BIT))
> +
>  	struct i915_active active;
>=20
>  #define I915_VMA_PAGES_BIAS 24
> @@ -293,6 +308,8 @@ struct i915_vma {
>  	struct list_head vm_bind_link;
>  	/* @non_priv_vm_bind_link: Link in non-private persistent VMA list */
>  	struct list_head non_priv_vm_bind_link;
> +	/* @vm_rebind_link: link to vm_rebind_list and protected by
> vm_rebind_lock */
> +	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>=20
>  	/** Interval tree structures for persistent vma */
>=20
> --
> 2.21.0.rc0.32.g243a4c7e27

