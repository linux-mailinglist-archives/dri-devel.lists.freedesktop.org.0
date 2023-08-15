Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D377D42E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 22:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F1510E294;
	Tue, 15 Aug 2023 20:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FB110E294;
 Tue, 15 Aug 2023 20:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692131697; x=1723667697;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=G1q0IoSLaOnvQWcQ6rqLASC5XZ5RLBvYGXWdCDYzV6Q=;
 b=eTNm9HvPZXdEth+TIDBzvfMETb2H02xvsXyo7U4Fb9v+pnHYqbaXALLs
 8+vqedxoJ/uqhUDwbolyOd4f/ogbx7cslSON0sy3nEXO/snk7LImhD3Gx
 oAdFTxBjKyPDH/uP3Ig/RXqX5vFJG1GaG6DhafMx+PC3E0FrZ8UTre2i0
 gQivlLzvMdriSAmK42WkZcsWLXjQyFeJ/HNON8BOT3WGuYA4+5gCPe+Yl
 pLboDZiB/bbdZ+g9I6Oxsan8vrNjar0JYHnrxH0l8QmYcobAmdBBrnoMb
 FyRzXytzfupRGtBp0Zbg49ht9+Y9NipRdi2x9Y+Y+4Ff8G9BCI3ipm8q/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="351957482"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
 d="scan'208,217";a="351957482"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 13:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="768943052"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
 d="scan'208,217";a="768943052"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 15 Aug 2023 13:34:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 13:34:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 13:34:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 13:34:55 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 13:34:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enyPHTNjd36iR2TLB9K3vtDik7iSaWwUwd5+r5NpqV41ypNf2VyYYkVYW2W8STAw4n6xP3lK3GXrKKwVUmF52zsWhEiFMbBmKW4CyM43uQoJh2phN4Q1yFz8i+AEGF2Ne7pU065Nx9WDRoAZVO13vS4GO8tiItXnIX8Gusb4m5nIbhx1j2PvhZqVEYyD2WPetunUu4ySdSZf8Px6J9LOWVGLayLjxegbcJ7C4nw4UKOJ7Wl7NPKpD9VrN9Ep1RuCpGG52fqtYJ2bE9Hhmo4UnV+KksrcwHmoW+6LaHL7cHo4qBZYx1sksE2UE6ttaE/4zPdRLJbwj2B4xkVAf2uuTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCBBHmMEh2WIQYCKtR4czJy6BTJC4jx4/vHt4yLvT+A=;
 b=liHM2Pq+ZqKbiEA+I1C1dT1ud1kphij+QUSP1U2nn6O0bd6QcHSmL8kNKpcmsmmq6q4yG3t0suXSX8mWLNpfsI41RLjzHbO3l1ZDaCc7tQ/y5G08Ll6i09ZXuvx0llQbasyHXv3l9+M02p2PUZYeIt2qAXvlLo9UsbCSCITiwOecWvBe32Ai85jcxQ5eD1T0PEjDKncvulKlwja8uP++IkBqTfwiPwUDN3vBK9hnvVZTziHx4EBrMAncH0K8aycOdAiMmekL4Im5G8Z8jSGtjP06Ma1xfKaJbwPEkgDPJRz77KTtYU50fHjNTYsIH9O3BBcQFUoUFHK5FJnt4QjtOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CO1PR11MB4802.namprd11.prod.outlook.com (2603:10b6:303:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 20:34:48 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99%3]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 20:34:48 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, Felix Kuehling <felix.kuehling@amd.com>, "Philip
 Yang" <Philip.Yang@amd.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: Implement svm without BO concept in xe driver
Thread-Topic: Implement svm without BO concept in xe driver
Thread-Index: AdnPImk6MOYV1wEITTKbUW99JKTN8AAlN1TA
Date: Tue, 15 Aug 2023 20:34:48 +0000
Message-ID: <SA1PR11MB6991F9E3107C963BDF95E04E9214A@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <SA1PR11MB699192A66D7A2CC7305A59569214A@SA1PR11MB6991.namprd11.prod.outlook.com>
In-Reply-To: <SA1PR11MB699192A66D7A2CC7305A59569214A@SA1PR11MB6991.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CO1PR11MB4802:EE_
x-ms-office365-filtering-correlation-id: c3ff0213-6cfa-47d2-57e6-08db9dcf11e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zkIdyqjQNOw43RWPIuDuUfK2wBQHNIJSMsSY0ZoQuAEWFj6/M+NQhnG72NAza/XA2SuNxhfphqhj5VdlWcyhmgQFQpyygatyXfmudc5VvjDbmQ3JgdUh7/VzzP8YBIEH9TVJT+OgPsyVwMofCp70QL6JpBtDYIy06mhPAeT68nnq1B7rdWnFGqR69NdTBI9ztMJotWYvQS9vkN7xDpZpFof8rHHLUt9fY+6zX7io1iObRv+sVn3jp2nW849rY1FAGE1R8pEiFZoOQRmvnHmDtlTwTp5PBDzdELo38AG5YH0X8sGQmiZtNMRULgP0MmrQdHG2v/OtLxL9kVKjkyA2AoZm/XGCZET3blqCFhwx8QMPlKie88KMPPdHR8acINyCzXVAEqc1ngigzrQDLXuCmXBdJV8hzrRUZzAt/181t9IwfKnfr2pR5Asw4SvKQpYWteexjdS0L79zZqfSXqr2DSDJvLEI0g+ian0fLki9FnQLNlXXwLu1uLVCzHe+loQlvlmj66oUnnp6O6D1WXj4nXLCzxlLQ47dmWRsYvpfGK3IbhqMcPmrvfItwnBPkqvmx0skrbcTXVnfz1yGr5GKT4L7dI45ZKSVnFLNPGjIJ/gpuvFKJr5mR3+R0O4Zr0rAFL05hxPcNpdDdlO9vld+kw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(366004)(136003)(346002)(1800799009)(186009)(451199024)(26005)(316002)(5660300002)(52536014)(83380400001)(8676002)(110136005)(66446008)(66476007)(38070700005)(82960400001)(53546011)(122000001)(38100700002)(921005)(55016003)(2906002)(2940100002)(478600001)(71200400001)(7696005)(6506007)(41300700001)(66946007)(64756008)(86362001)(76116006)(66556008)(33656002)(8936002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Q+/CYqDFfeXhaAolDCYkI7Jld6ocgR0MgLZI/rCApStfwExyofAGbqOvBv?=
 =?iso-8859-1?Q?H7brM7CzIHbEAZxsqK9AdJrk57IF6kmVIUjuUk0bqURnaAzf/4DGfBfxK0?=
 =?iso-8859-1?Q?IYImCd/VtiF+mLGTtrXC/c3yTy8CcKcB4VPyGoKlsyCWQrc2MYxEGy5hJj?=
 =?iso-8859-1?Q?fFrCw44WdR+kc+KMRmbSYzoFCWuo7h/RUNdkQqDtW7O8jtyRTbw6+VVyo8?=
 =?iso-8859-1?Q?NJuLXKa67SI2aVtVcEQ6UT9UmfVqcGykoLcAOdaLn7uKARLi/gBSQVTi4A?=
 =?iso-8859-1?Q?DIYaz1rdkiOZjJD2fSit+mIXQhiGHMPtz8wfshYM7aqu2fs/vee+JxUoZK?=
 =?iso-8859-1?Q?NdnVU3ngTw9GCUB3ljob2sNlM9LaVhOf8szBeWydtceBLtO0tawQXf1hpM?=
 =?iso-8859-1?Q?Xl4Mw7RtDqBaTlhylRX3v6P2Y7jYQeU/daftv3iUZioxt3x1g0C+NWvM6m?=
 =?iso-8859-1?Q?Xecgz5T/5fWUU8vnKqHwLsmum2M2IKiVIcITQjUfQGY6dJAm+Gxfovw/Ms?=
 =?iso-8859-1?Q?WkaHXbwitS1JBiPJR7+CdHZy+Zo07YlqIXsI1TIAyd0gBUu6Wm3O+Es6QQ?=
 =?iso-8859-1?Q?wkSIEwFTNTpOffwjN1tYt0wsvw/ApLs05w2o57GKAbMrOB4QvPltVwB/rC?=
 =?iso-8859-1?Q?7k8Ljzr7L4dRm+15KHgOWvh5PLv9TALvlztvUmA4DZ/1ahyFfErlHjW9IS?=
 =?iso-8859-1?Q?WtITCSGXM7HMBEwSrmzqnx1FlRuBHEzCVtbpdBd1MdO8YqNhstMlYtulHV?=
 =?iso-8859-1?Q?vqW4kok4HGx5h7GctF6CF5kyCLQUPMulW8JMjEwJ3JVeLT4kmei81Ykv24?=
 =?iso-8859-1?Q?yyWqxHvuqIM5II9DgeApiWUJfaBzVp/l2SctJsJ/0vR4T/9qrCt8BPjIJk?=
 =?iso-8859-1?Q?gAbjdA6i1JqoaQjDI6SOAfT4nqohnBrTUVZTlegJxt8QRnfjfEB5ZC/DVe?=
 =?iso-8859-1?Q?V9K1ydbSk4WYXWOkecmG2b23R9CPx06WdXB4f1d9/ryayld7FZn+rSCBLl?=
 =?iso-8859-1?Q?o6MRjqhA1kuQpciVWWD0tcsvWVfOASH1M9LWnUEuffl3Kb4DH5iExGXn2a?=
 =?iso-8859-1?Q?LHkCYwQ29JWik2pvKKu4XMUVsEKQvTJPTOzfCvjZ9K7vhsjEP+rSdYzM2R?=
 =?iso-8859-1?Q?VEdoFJKi5JSVvkirQt98lkIKSKL5/CHy5achcBvBKq+wk3SSQ735rzSH5/?=
 =?iso-8859-1?Q?ncEW4Ezf9kznKK0tjm2rIARj23jEW0Fdg4jVqQM+CJzngrlYfBrxm2y6RM?=
 =?iso-8859-1?Q?/++D0oO600m8RLTTF/OHJ8pN9iJd6V+5HF9zJbxIyCT2NfCp6pIytAYYRB?=
 =?iso-8859-1?Q?r5v4I+tjzbFCu8jEWmAduLJYpyVABzD2sScOmXyyAsAZHhEGkeKqMJ2pnN?=
 =?iso-8859-1?Q?pEK8fiY2alWAokXASxHGdQC4z8Kc+Wo2+N0n4gjBs1aKcMlUbt+ZRMlksN?=
 =?iso-8859-1?Q?2drijP3dCY6qXWRRFgkW2byy5e5u9yGMdhUudkESiSmFG00s8rw+Jxzhv0?=
 =?iso-8859-1?Q?HAwuSyIhTEj0pKFl5NwkL63LhYUx8i0ZfWIdOvJw1NnsvUtALJRrnPczlU?=
 =?iso-8859-1?Q?2RcevRxfNYA4xTc5+D0UzzD99ybhddwNAMh06c3SlSQ42Aem6Y7ED5IN6E?=
 =?iso-8859-1?Q?WUwsVHGNO7HNA=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SA1PR11MB6991F9E3107C963BDF95E04E9214ASA1PR11MB6991namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ff0213-6cfa-47d2-57e6-08db9dcf11e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 20:34:48.6828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RVKQojAbkESBl7U4ebgKb696oRjAuoK8klTk/f4FqAK6W4+XGSOQNsfoB6MddXQb8axiohlRysrD7cpCWjzHJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4802
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_SA1PR11MB6991F9E3107C963BDF95E04E9214ASA1PR11MB6991namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Also + Christian

Thanks,
Oak

From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Zeng, =
Oak
Sent: August 14, 2023 11:38 PM
To: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>; Brost, Matthew <=
matthew.brost@intel.com>; Vishwanathapura, Niranjana <niranjana.vishwanatha=
pura@intel.com>; Welty, Brian <brian.welty@intel.com>; Felix Kuehling <feli=
x.kuehling@amd.com>; Philip Yang <Philip.Yang@amd.com>; intel-xe@lists.free=
desktop.org; dri-devel@lists.freedesktop.org
Subject: [Intel-xe] Implement svm without BO concept in xe driver

Hi Thomas, Matt and all,

This came up when I port i915 svm codes to xe driver. In i915 implementatio=
n, we have i915_buddy manage gpu vram and svm codes directly call i915_budd=
y layer to allocate/free vram. There is no gem_bo/ttm bo concept involved i=
n the svm implementation.

In xe driver,  we have drm_buddy, xe_ttm_vram_mgr and ttm layer to manage v=
ram. Drm_buddy is initialized during xe_ttm_vram_mgr initialization. Vram a=
llocation/free is done through xe_ttm_vram_mgr functions which call into dr=
m_buddy layer to allocate vram blocks.

I plan to implement xe svm driver the same way as we did in i915, which mea=
ns there will not be bo concept in the svm implementation. Drm_buddy will b=
e passed to svm layer during vram initialization and svm will allocate/free=
 memory directly from drm_buddy, bypassing ttm/xee vram manager. Here are a=
 few considerations/things we are aware of:


  1.  This approach seems match hmm design better than bo concept. Our svm =
implementation will be based on hmm. In hmm design, each vram page is backe=
d by a struct page. It is very easy to perform page granularity migrations =
(b/t vram and system memory). If BO concept is involved, we will have to sp=
lit/remerge BOs during page granularity migrations.



  1.  We have a prove of concept of this approach in i915, originally imple=
mented by Niranjana. It seems work but it only has basic functionalities fo=
r now. We don't have advanced features such as memory eviction etc.



  1.  With this approach, vram will divided into two separate pools: one fo=
r xe_gem_created BOs and one for vram used by svm. Those two pools are not =
connected: memory pressure from one pool won't be able to evict vram from a=
nother pool. At this point, we don't whether this aspect is good or not.



  1.  Amdkfd svm went different approach which is BO based. The benefit of =
this approach is a lot of existing driver facilities (such as memory evicti=
on/cgroup/accounting) can be reused



Do you have any comment to this approach? Should I come back with a RFC of =
some POC codes?

Thanks,
Oak


--_000_SA1PR11MB6991F9E3107C963BDF95E04E9214ASA1PR11MB6991namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:785545619;
	mso-list-template-ids:-1229917000;}
@list l0:level1
	{mso-level-start-at:2;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1
	{mso-list-id:1060176832;
	mso-list-template-ids:260495024;}
@list l2
	{mso-list-id:1520854713;
	mso-list-type:hybrid;
	mso-list-template-ids:-1783088106 269025297 269025305 269025307 269025295 =
269025305 269025307 269025295 269025305 269025307;}
@list l2:level1
	{mso-level-text:"%1\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l3
	{mso-list-id:1794131315;
	mso-list-template-ids:912432556;}
@list l3:level1
	{mso-level-start-at:4;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4
	{mso-list-id:2144037335;
	mso-list-template-ids:1697430470;}
@list l4:level1
	{mso-level-start-at:3;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-CA" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Also + Christian<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Oak<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Intel-xe &lt;intel-xe-bounces@lists.freedesktop.org&gt;
<b>On Behalf Of </b>Zeng, Oak<br>
<b>Sent:</b> August 14, 2023 11:38 PM<br>
<b>To:</b> Thomas Hellstr=F6m &lt;thomas.hellstrom@linux.intel.com&gt;; Bro=
st, Matthew &lt;matthew.brost@intel.com&gt;; Vishwanathapura, Niranjana &lt=
;niranjana.vishwanathapura@intel.com&gt;; Welty, Brian &lt;brian.welty@inte=
l.com&gt;; Felix Kuehling &lt;felix.kuehling@amd.com&gt;; Philip
 Yang &lt;Philip.Yang@amd.com&gt;; intel-xe@lists.freedesktop.org; dri-deve=
l@lists.freedesktop.org<br>
<b>Subject:</b> [Intel-xe] Implement svm without BO concept in xe driver<o:=
p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi Thomas, Matt and all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This came up when I port i915 svm codes to xe driver=
. In i915 implementation, we have i915_buddy manage gpu vram and svm codes =
directly call i915_buddy layer to allocate/free vram. There is no gem_bo/tt=
m bo concept involved in the svm implementation.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In xe driver, &nbsp;we have drm_buddy, xe_ttm_vram_m=
gr and ttm layer to manage vram. Drm_buddy is initialized during xe_ttm_vra=
m_mgr initialization. Vram allocation/free is done through xe_ttm_vram_mgr =
functions which call into drm_buddy layer
 to allocate vram blocks.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I plan to implement xe svm driver the same way as we=
 did in i915, which means there will not be bo concept in the svm implement=
ation. Drm_buddy will be passed to svm layer during vram initialization and=
 svm will allocate/free memory directly
 from drm_buddy, bypassing ttm/xee vram manager. Here are a few considerati=
ons/things we are aware of:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l2 level1 =
lfo3">This approach seems match hmm design better than bo concept. Our svm =
implementation will be based on hmm. In hmm design, each vram page is backe=
d by a struct page. It is very easy
 to perform page granularity migrations (b/t vram and system memory). If BO=
 concept is involved, we will have to split/remerge BOs during page granula=
rity migrations.<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0cm" start=3D"2" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l2 level1 =
lfo3">We have a prove of concept of this approach in i915, originally imple=
mented by Niranjana. It seems work but it only has basic functionalities fo=
r now. We don&#8217;t have advanced features
 such as memory eviction etc.<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0cm" start=3D"3" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l2 level1 =
lfo3">With this approach, vram will divided into two separate pools: one fo=
r xe_gem_created BOs and one for vram used by svm. Those two pools are not =
connected: memory pressure from one
 pool won&#8217;t be able to evict vram from another pool. At this point, w=
e don&#8217;t whether this aspect is good or not.<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0cm" start=3D"4" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l2 level1 =
lfo3">Amdkfd svm went different approach which is BO based. The benefit of =
this approach is a lot of existing driver facilities (such as memory evicti=
on/cgroup/accounting) can be reused<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Do you have any comment to this approach? Should I c=
ome back with a RFC of some POC codes?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Oak<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_SA1PR11MB6991F9E3107C963BDF95E04E9214ASA1PR11MB6991namp_--
