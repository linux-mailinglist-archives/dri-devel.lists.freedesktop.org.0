Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FAA61926F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 09:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C0110E706;
	Fri,  4 Nov 2022 08:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB58610E707;
 Fri,  4 Nov 2022 08:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667549344; x=1699085344;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wOpnSuoU32B3PCEBobcSDipL3euN0VDwV+3RTLDshsA=;
 b=h7TKOTacAtsp9xrWu9f9K7YuytnaW3FhFVxg2fiBaHIdFGRuyPxy1xTE
 LuNMgLP4qvq8+RfNZHfpL+2xQs6p7Sw/HJo83BB1HEdckJpWHAycItVcu
 MSARCD0xV6zTFevH865JABkMtj9OJXIpvmGs7KUxx0RfY0GB4VT9eeIaV
 rLAWHHzTiPKgNPQlSaGI1Ot7FwERQWVX/ExsnsUF02iflvfuz3qRes0y9
 SlZ82pJuhg40p/XUdr+yjWL72869TMXBzgMNDYgiVMY0B4FOz4LLAC13/
 QoL8WIFOtyf/ScjOakgjrXeVUlE6IeFKC7fOg27vcMJW2qh71x9rVMsmx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="311647942"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; d="scan'208";a="311647942"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 01:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="760250567"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; d="scan'208";a="760250567"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 04 Nov 2022 01:08:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 01:08:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 01:08:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 4 Nov 2022 01:08:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 4 Nov 2022 01:08:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQnX7TtFZnvoqjHggr+YfGWJrhH1gHfFw59amP3CtEl0JbuDYUZb6aReVVrgnW43Tr72EQTzsakfqnJHsmaYqbA+gmCJ5BDx2rHXRvIXHsBk1zEw55ntBkeuGF8BKXZjmds9P2rJ4m5sfwWyKQSEnlMUXikN0VHkcLJBxo75TtIbIb4zFhAzwMCZ8zq09QC3191jQVXoaheik6WoT7mWKFkL/e6qkMrSqsa7L9AQk6Bp9/jA4sX3XC7rF3Hn51mV2zd7lfk+Y5jsove8rE8EuJ/2x786ZHF/RfxPYnD/kbigA1vLH1d0bbhEFXxlwT3r/pkV6k7hsCz+H56z1ZQV9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoKwD4gYLOQBa6QyML4Ff38hknYp6AwKryIoFU0NipQ=;
 b=iQRKbdKKOujcAGZj0vctTAH43AU13EWnvicXSQs3wxu4IhuZeXFp/cqOwJ36NeDNOZ0t+EiwKpURYvlzju9avfOotgjrNblNhwg+ysjFUvdJD0TwTvAcoLHs3MCPh7q1u67lhg7ahIkvWm/fgF6pAESBindnj58JfwFDdamDHEUp0JtRwETf7jytRXnvnhDBdsdAQtOACwqHzohmxoN71WsUnOLJscA28R2EKqTEZoRUknF8m5mbqlCFp+giXTJRrsMkZ8KlttH5A++c/52/J0K4siqQXv6Xx1ZqDA2PjjupIv0MyJE0dak5zBvFUoLybfrq1Mz8RV34Gqx8LIZsYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Fri, 4 Nov
 2022 08:08:52 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::68f0:b796:f277:5271]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::68f0:b796:f277:5271%8]) with mapi id 15.20.5791.023; Fri, 4 Nov 2022
 08:08:52 +0000
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/mtl: Media GT and Render GT share
 common GGTT
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/mtl: Media GT and Render GT share
 common GGTT
Thread-Index: AQHY7SPUKfDLO4HnMkeaBkwtJn5Rm64uXWwAgAARRQA=
Date: Fri, 4 Nov 2022 08:08:51 +0000
Message-ID: <CH0PR11MB5474D71566FCD0891C9907148C3B9@CH0PR11MB5474.namprd11.prod.outlook.com>
References: <20221031123111.1240326-1-aravind.iddamsetty@intel.com>
 <20221104070542.yh5ff4elpzqe2xj4@ldmartin-desk2.lan>
In-Reply-To: <20221104070542.yh5ff4elpzqe2xj4@ldmartin-desk2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5474:EE_|MW4PR11MB5776:EE_
x-ms-office365-filtering-correlation-id: e77051d4-cbd1-4b0a-cfe3-08dabe3bcf83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lW9YReVDeicUaHN7OlaBVFpXfL/HSZ8eFHJPcQcVCXDH/wCtrZeEH5hu4muITm/AiIm3dlzmjtY8VqBxZ+Jbz3Gk5YBUPTuoiNmTPqkyoFko/87WinFVPtPvCewdxQ7lJpTY0OA3PyEycRJlEFfo4NXH0rdCnxw8ATOcyQvuO2PsMbs0GpcOyhz2SngIFjyOLnDYXCzRONeO4eeswrixcRA5uxIs3XZ8GkgZS96JPLw2tr63oXY3fr1t1N1vTBagfUY2KEvAEyieMnRd9xu4CJRopF4mIxMbVSYdwU8h09jj8N5dkn7OEfKEeM1A/fH2+6le7Mr/kAr1LQOojatgVAQ7crXYYVr3GUNKhD/B3NVwKuKND4A3O3RKzBFTewbAmHHkryVzwzZVXczwKlYuugP7akpESSr9pz8xqrefqQrh1FMVxnH3OjVTqTZdBg4IzOdHrSUUWDWUF85AC9HJMzFxZxTXUbhBPCAz+IE5kpl8Sy12nBwB5q2pdNYlvZwKfILy4I4D0qqk6wyHduaOSMExkCtsI0iDUaLCKq0cx3RvJlTu9EmqgO/4plDjbyPdX30lbp1oDhye2h6dZegSK07SwjwApedNGJXGI7xkZJ3m+uwOFbvBapC45r8/9GEhijoMl2YcSJhhZodKBQg7itdAUcMtrrJNljIJ/TLrOdVcjGw+rjUcl7dvojD41TPIm5wTK/9q/EyWhnBGWSlLwuxTsJlcM6tjAWuoZ9c2tkY3yqsO4KyUykBNIUfBalKZWY5/3wwxYOzjzzFy/HElHQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199015)(316002)(54906003)(6636002)(71200400001)(66446008)(66946007)(45080400002)(450100002)(66556008)(76116006)(478600001)(4326008)(53546011)(7696005)(66476007)(6506007)(64756008)(8676002)(9686003)(55016003)(8936002)(30864003)(52536014)(5660300002)(186003)(2906002)(6862004)(83380400001)(38070700005)(86362001)(26005)(33656002)(122000001)(82960400001)(41300700001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?At6ZBNkduH6MsNrrWnHAjyWERqtgVTsIjleWHlaWXwUfrcM11/NE10bhO6/j?=
 =?us-ascii?Q?RzFQagDoxqo8g3VG7Vr853CRnWX7+J7esrgjdXg7Q0SJ+nRRXWWzKSOjd3lb?=
 =?us-ascii?Q?eFwSQAwnaxI047wI36FSQ3SYori2dzL+6kpaI57j+W29M9riGEs+wB7bNONY?=
 =?us-ascii?Q?0WKmEgBt03j95ga3Q6T6D3F71V209zX1kk357EdQUpS62CDPfSPBZzkiEXCK?=
 =?us-ascii?Q?ZrUOvuDZ/ahUHzYPeJUYk+5/5Hy3jXvh4TvmLcniMaUWeizHtfZ+xqiDxYOx?=
 =?us-ascii?Q?AfR2exdnNw9x9f9R7r+rWQfP98mHel/ECVJy/x8RqNEjvTJ7pHBx7X7W8vtN?=
 =?us-ascii?Q?CrDbXv2207LjR+yKqn88k2S5wCFNjjyV85TFpOG3s+r7+Ri3C+3dWgUJAQ/D?=
 =?us-ascii?Q?HNkdyVR7Uay9KHg0PNc+rkBD8XjM9e0hwyyLKLpUMwqGvTMQX+TDgYEO95G/?=
 =?us-ascii?Q?J4iODu09PN8OnGaOA9HyrqZ8ZI/ptYnKA4ptWlKy4Oh/2q/PBaN2svyMhnHQ?=
 =?us-ascii?Q?Od95IvuCRH79FW/MGOG0St1adibc7ndlC6yzoMDulXzypjRzp2NOlvNzQcjh?=
 =?us-ascii?Q?AVOzaJC5Pb7thOeQwzJPN0fnIn6TeJe3MAgtnfB6xKHwKdBEyKxjQJ8IcRJQ?=
 =?us-ascii?Q?iOq8Ry4gIzzRRmEnyfjmxbWn5sFfVSR1vaSlLwlot0IN/x+Xu2VhR4oJ1nYr?=
 =?us-ascii?Q?ub8bPHR+FGU2/ZdJwB1Cxmyxne0t6aJuVpwHF2XjyJBYhHvdV+1urYPx+Ju5?=
 =?us-ascii?Q?anVvOLeduHqx4M3bcq+GPc3+qWqSNr+cq+sfM4OR1XOqnMxRrI+17xScmXpA?=
 =?us-ascii?Q?l3j6xJt2Tkk0QHLqQH3HuMqYE2ot1AsXe47ueLk1gp/OEqEAMIBHYJ7bJIuS?=
 =?us-ascii?Q?+yc7hPTjN/9zF3bjTEG2GIya2mshxRufz/x6x8G/B8FWzRsXAwDXKuHiD15J?=
 =?us-ascii?Q?eu+mb2MThP8LC6JW1xMImJ5Ttq8ndG6H3vF8o1yLOZ5y85rqUuKop8MTE6K9?=
 =?us-ascii?Q?S7K+m7Nq6rWpxah16Z0wm73OJ95+EAeN4yrOKs7ILtcvgnSj8Ztkgppr9WHd?=
 =?us-ascii?Q?6rUIEUM8ELCoN7XG51YUTq9T2dfbd4nIGWAT4Un3QBc1YWqwdKnbXtGFGo6i?=
 =?us-ascii?Q?yLppB3ic6gaIlqufKE/QsCJw0bLyo5cwhGAj20tPhxw3wHCIZRBkTdbuT/bu?=
 =?us-ascii?Q?H6ViXnW/ZqezyfezvusDDZ8PqYQk8YzXJtUD6LeWy2ZhMyIwKxf4AULV4sBJ?=
 =?us-ascii?Q?NbN+WQrPzUXD0N1XI2Rdb6qnuxF1aL4rvCC38z0972603438t1xHsVzSIPtN?=
 =?us-ascii?Q?IGycMtoslRH0Mie1lRCoCIqRpGCmZDJVBhiGgF9sjVQpfQSpXDlh8bTwyzQv?=
 =?us-ascii?Q?5w4N0o+geQJwBeZ+FlSKkEeKc8ZLLNfLH9MhpEqYU/WXAGBCERrMZ2NKzWU2?=
 =?us-ascii?Q?rxIdIhJfTPlBi0dPn/zh+y4S+BBMKJRzjhI7v1I8WyVEZW9OmTzl+W+W8pFA?=
 =?us-ascii?Q?CWoIjE4Zdc26TcYhwHRq7O1YTZ9XFYZgZbQh3zmU/9gFxUakLttYA2/eNKof?=
 =?us-ascii?Q?HfiF/zFpmuW/cssRCmii6YfG31q5dot7m2wDx1BsuulcNpBWoQnunjAdSULY?=
 =?us-ascii?Q?Pw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e77051d4-cbd1-4b0a-cfe3-08dabe3bcf83
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 08:08:52.0060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vBf6QwErM0mtFIrfKrWf0Hq/6el9CSr+b/3XiQ9aXobs3c1Hwkw3S24OPle/rSynvDZ6KZnm6quBNHgH3HDPLJ700zhH5bVLwUTHgsbdId0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5776
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Friday, November 4, 2022 12:36 PM
> To: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Media GT and Render GT sha=
re
> common GGTT
>=20
> On Mon, Oct 31, 2022 at 06:01:11PM +0530, Aravind Iddamsetty wrote:
> >On XE_LPM+ platforms the media engines are carved out into a separate
> >GT but have a common GGTMMADR address range which essentially makes
> the
> >GGTT address space to be shared between media and render GT.
> >
> >BSPEC: 63834
> >
> >Cc: Matt Roper <matthew.d.roper@intel.com>
> >Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> >---
> > drivers/gpu/drm/i915/gt/intel_ggtt.c      | 49 +++++++++++-------
> > drivers/gpu/drm/i915/gt/intel_gt.c        | 15 +++++-
> > drivers/gpu/drm/i915/gt/intel_gt_types.h  |  3 ++
> > drivers/gpu/drm/i915/gt/intel_gtt.h       |  3 ++
> > drivers/gpu/drm/i915/i915_driver.c        | 19 +++++--
> > drivers/gpu/drm/i915/i915_gem_evict.c     | 63 +++++++++++++++++------
> > drivers/gpu/drm/i915/i915_vma.c           |  5 +-
> > drivers/gpu/drm/i915/selftests/i915_gem.c |  2 +
> >drivers/gpu/drm/i915/selftests/mock_gtt.c |  1 +
> > 9 files changed, 115 insertions(+), 45 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> >b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> >index 2518cebbf931..f5c2f3c58627 100644
> >--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> >+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> >@@ -196,10 +196,13 @@ void i915_ggtt_suspend_vm(struct
> >i915_address_space *vm)
> >
> > void i915_ggtt_suspend(struct i915_ggtt *ggtt) {
> >+	struct intel_gt *gt;
> >+
> > 	i915_ggtt_suspend_vm(&ggtt->vm);
> > 	ggtt->invalidate(ggtt);
> >
> >-	intel_gt_check_and_clear_faults(ggtt->vm.gt);
> >+	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> >+		intel_gt_check_and_clear_faults(gt);
> > }
> >
> > void gen6_ggtt_invalidate(struct i915_ggtt *ggtt) @@ -214,27 +217,36
> >@@ void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
> >
> > static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)  {
> >-	struct intel_uncore *uncore =3D ggtt->vm.gt->uncore;
> >+	struct intel_uncore *uncore;
> >+	struct intel_gt *gt;
> >
> >-	/*
> >-	 * Note that as an uncached mmio write, this will flush the
> >-	 * WCB of the writes into the GGTT before it triggers the invalidate.
> >-	 */
> >-	intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6,
> GFX_FLSH_CNTL_EN);
> >+	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
> >+		uncore =3D gt->uncore;
> >+		/*
> >+		 * Note that as an uncached mmio write, this will flush the
> >+		 * WCB of the writes into the GGTT before it triggers the
> invalidate.
> >+		 */
> >+		intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6,
> GFX_FLSH_CNTL_EN);
> >+	}
> > }
> >
> > static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)  {
> >-	struct intel_uncore *uncore =3D ggtt->vm.gt->uncore;
> > 	struct drm_i915_private *i915 =3D ggtt->vm.i915;
> >
> > 	gen8_ggtt_invalidate(ggtt);
> >
> >-	if (GRAPHICS_VER(i915) >=3D 12)
> >-		intel_uncore_write_fw(uncore, GEN12_GUC_TLB_INV_CR,
> >-				      GEN12_GUC_TLB_INV_CR_INVALIDATE);
> >-	else
> >-		intel_uncore_write_fw(uncore, GEN8_GTCR,
> GEN8_GTCR_INVALIDATE);
> >+	if (GRAPHICS_VER(i915) >=3D 12) {
> >+		struct intel_gt *gt;
> >+
> >+		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> >+			intel_uncore_write_fw(gt->uncore,
> >+					      GEN12_GUC_TLB_INV_CR,
> >+
> GEN12_GUC_TLB_INV_CR_INVALIDATE);
> >+	} else {
> >+		intel_uncore_write_fw(ggtt->vm.gt->uncore,
> >+				      GEN8_GTCR, GEN8_GTCR_INVALIDATE);
> >+	}
> > }
> >
> > u64 gen8_ggtt_pte_encode(dma_addr_t addr, @@ -986,8 +998,6 @@
> static
> >int gen8_gmch_probe(struct i915_ggtt *ggtt)
> >
> > 	ggtt->vm.pte_encode =3D gen8_ggtt_pte_encode;
> >
> >-	setup_private_pat(ggtt->vm.gt);
> >-
> > 	return ggtt_probe_common(ggtt, size);  }
> >
> >@@ -1186,7 +1196,7 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt,
> struct intel_gt *gt)
> > 		(u64)ggtt->mappable_end >> 20);
> > 	drm_dbg(&i915->drm, "DSM size =3D %lluM\n",
> > 		(u64)resource_size(&intel_graphics_stolen_res) >> 20);
> >-
> >+	INIT_LIST_HEAD(&ggtt->gt_list);
> > 	return 0;
> > }
> >
> >@@ -1296,9 +1306,11 @@ bool i915_ggtt_resume_vm(struct
> >i915_address_space *vm)
> >
> > void i915_ggtt_resume(struct i915_ggtt *ggtt) {
> >+	struct intel_gt *gt;
> > 	bool flush;
> >
> >-	intel_gt_check_and_clear_faults(ggtt->vm.gt);
> >+	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> >+		intel_gt_check_and_clear_faults(gt);
> >
> > 	flush =3D i915_ggtt_resume_vm(&ggtt->vm);
> >
> >@@ -1307,9 +1319,6 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
> > 	if (flush)
> > 		wbinvd_on_all_cpus();
> >
> >-	if (GRAPHICS_VER(ggtt->vm.i915) >=3D 8)
> >-		setup_private_pat(ggtt->vm.gt);
> >-
> > 	intel_ggtt_restore_fences(ggtt);
> > }
> >
> >diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c
> >b/drivers/gpu/drm/i915/gt/intel_gt.c
> >index 2e796ffad911..d72efb74563a 100644
> >--- a/drivers/gpu/drm/i915/gt/intel_gt.c
> >+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> >@@ -110,9 +110,17 @@ static int intel_gt_probe_lmem(struct intel_gt
> >*gt)
> >
> > int intel_gt_assign_ggtt(struct intel_gt *gt)  {
> >-	gt->ggtt =3D drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt),
> GFP_KERNEL);
> >+	/* Media GT shares primary GT's GGTT */
> >+	if (gt->type =3D=3D GT_MEDIA) {
> >+		gt->ggtt =3D to_gt(gt->i915)->ggtt;
> >+	} else {
> >+		gt->ggtt =3D drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt),
> GFP_KERNEL);
> >+		if (!gt->ggtt)
> >+			return -ENOMEM;
> >+	}
> >
> >-	return gt->ggtt ? 0 : -ENOMEM;
> >+	list_add_tail(&gt->ggtt_link, &gt->ggtt->gt_list);
>=20
> I don't think this really works.  You're adding to &gt->ggtt->gt_list tha=
t you
> just allocated above. I had this patch applied and noticed
> this:
>=20
> [  151.417250] ------------[ cut here ]------------ [  151.417251] list_a=
dd
> corruption. prev is NULL.
> [  151.417254] WARNING: CPU: 10 PID: 1780 at lib/list_debug.c:23
> __list_add_valid+0x3e/0xb0 [  151.417259] Modules linked in: i915(+)
> prime_numbers drm_buddy drm_display_helper drm_kms_helper
> syscopyarea sysfillrect sysimgblt fb_sys_fops ttm overlay fuse
> x86_pkg_temp_thermal coretemp crct10dif_pclmul crc32_pclmul wmi_bmof
> ghash_clmulni_intel kvm_intel video wmi ip_tables x_tables e1000e igb dca
> ptp i2c_i801 i2c_smbus pps_core
> [  151.417299] CPU: 10 PID: 1780 Comm: modprobe Tainted: G        W
> 6.0.0 #382
> [  151.417302]
> XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
> XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
> XXXXXXXX
> [  151.417304] RIP: 0010:__list_add_valid+0x3e/0xb0 [  151.417307] Code: =
75
> 46 4c 8b 0a 4d 39 c1 75 56 48 39 fa 74 6f 49 39 f9 74 6a b8 01 00 00 00 c=
3 cc cc
> cc cc 48 c7 c7 c0 57 5f 82 e8 96 9c 61 00 <0f> 0b 31 c0 c3 cc cc cc cc 48=
 c7 c7 e8
> 57 5f 82 e8 81 9c 61 00 0f [  151.417309] RSP: 0018:ffffc90005787b80 EFLA=
GS:
> 00010282 [  151.417313] RAX: 0000000000000000 RBX: ffff8881428fb778 RCX:
> 0000000000000000 [  151.417315] RDX: 0000000000000001 RSI:
> ffffffff825e0c4c RDI: 00000000ffffffff [  151.417316] RBP: ffff88813f6c38=
28
> R08: ffff88849effffe8 R09: 00000000fffdffff [  151.417318] R10:
> ffff88849e200000 R11: ffff88849ed00000 R12: 0000000000000000 [
> 151.417320] R13: ffff8881428fdaa0 R14: ffff88813f6c3f50 R15:
> ffff8881428fdab0 [  151.417322] FS:  00007fc71052d540(0000)
> GS:ffff88849f900000(0000) knlGS:0000000000000000 [  151.417325] CS:  0010
> DS: 0000 ES: 0000 CR0: 0000000080050033 [  151.417327] CR2:
> 0000555a8fad6858 CR3: 000000013b7f4006 CR4: 0000000000770ee0 [
> 151.417329] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000 [  151.417331] DR3: 0000000000000000 DR6:
> 00000000ffff07f0 DR7: 0000000000000400 [  151.417332] PKRU: 55555554 [
> 151.417333] Call Trace:
> [  151.417335]  <TASK>
> [  151.417336]  intel_gt_assign_ggtt+0x42/0xa0 [i915]
>=20
>=20
>=20
> I think something like below would do it (untested):
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index c1e23b4be8ed6..454b668108457 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -8,6 +8,7 @@
>   #include <linux/types.h>
>   #include <linux/stop_machine.h>
>=20
> +#include <drm/drm_managed.h>
>   #include <drm/i915_drm.h>
>   #include <drm/intel-gtt.h>
>=20
> @@ -1196,7 +1197,7 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt,
> struct intel_gt *gt)
>   		(u64)ggtt->mappable_end >> 20);
>   	drm_dbg(&i915->drm, "DSM size =3D %lluM\n",
>   		(u64)resource_size(&intel_graphics_stolen_res) >> 20);
> -	INIT_LIST_HEAD(&ggtt->gt_list);
> +
>   	return 0;
>   }
>=20
> @@ -1218,6 +1219,19 @@ int i915_ggtt_probe_hw(struct drm_i915_private
> *i915)
>   	return 0;
>   }
>=20
> +struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915) {
> +	struct i915_ggtt *ggtt;
> +
> +	ggtt =3D drmm_kzalloc(&i915->drm, sizeof(*ggtt), GFP_KERNEL);
> +	if (!ggtt)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&ggtt->gt_list);
> +
> +	return ggtt;
> +}
> +

Thanks for sharing it, I will try it out.

Regards,
Aravind.
>   int i915_ggtt_enable_hw(struct drm_i915_private *i915)
>   {
>   	if (GRAPHICS_VER(i915) < 6)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c
> b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 143359acde5a7..ea3b895dbe6b7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -115,12 +115,13 @@ int intel_gt_assign_ggtt(struct intel_gt *gt)
>   	if (gt->type =3D=3D GT_MEDIA) {
>   		gt->ggtt =3D to_gt(gt->i915)->ggtt;
>   	} else {
> -		gt->ggtt =3D drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt),
> GFP_KERNEL);
> -		if (!gt->ggtt)
> -			return -ENOMEM;
> +		gt->ggtt =3D i915_ggtt_create(gt->i915);
> +		if (IS_ERR(gt->ggtt))
> +			return PTR_ERR(gt->ggtt);
>   	}
>=20
>   	list_add_tail(&gt->ggtt_link, &gt->ggtt->gt_list);
> +
>   	return 0;
>   }
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h
> b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index cb1272702a1a1..f2a608c182c82 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -585,6 +585,7 @@ int i915_ggtt_enable_hw(struct drm_i915_private
> *i915);
>   void i915_ggtt_enable_guc(struct i915_ggtt *ggtt);
>   void i915_ggtt_disable_guc(struct i915_ggtt *ggtt);
>   int i915_init_ggtt(struct drm_i915_private *i915);
> +struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915);
>   void i915_ggtt_driver_release(struct drm_i915_private *i915);
>   void i915_ggtt_driver_late_release(struct drm_i915_private *i915);
>=20
> --
> 2.38.1
