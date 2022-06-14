Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 008E154B8E7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 20:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3E710FE35;
	Tue, 14 Jun 2022 18:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3391110F027;
 Tue, 14 Jun 2022 18:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655232143; x=1686768143;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=85tKtL/0P6dZWk+o0ew7f3Z8073pFgVlBKMqnzkreFM=;
 b=VGZLsfOIqiY+18nn7uiHxu3G0A0k51ZKdgTsoiDCQv6rr9v3qQatChDF
 deaoMaaAOCahEPWfqvtvXrord4dzW9Uw2IgX6EY+9l5BmG4kyPsMmKGaw
 30HC/1NTtl7T69J7KkXdxg89BH0XVDw7TpIcQU0Xs+xIOxImAc3YayiXl
 s96ksBr9QHIs5NelxgRPxNgShYybpIhv9kK0G7TnTskrj8Xi/q0sZaKVf
 pgvyergqPvquow+c1qMFSg6gxoMGhLxODxy4ZplgE+268ESIkzIWPA+8f
 fEXa18S0Kf6Jioc8fiiJt9pRjfWEhs1HV1mUIKwbCdeI/qWH5d3oUOBl7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="342672197"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="342672197"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 11:42:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="674045805"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2022 11:42:22 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 14 Jun 2022 11:42:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 14 Jun 2022 11:42:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 14 Jun 2022 11:42:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvHXfPJxQIC7J2KFW6ADl2FYfY8Tgi5/Aw229EoDrAMkt/mTH322JDUStcKwNg3BaSgWZYvpt/QdLnUYHkCRT0y9Bf9f5DMThEUsBEwhMVSGYtIMNcZF9T1UDv+S8zDAIENi6l5LaSDSgPjSFZXejgWESlbyjOKOJHuAgWhlci/RCAxpn5ZH1lsaVfNpjk4eYLD9/oRoBt2R1O3hbMB00H0mZ0oVSbnJzXkYPooyDlTCkjzjenEYXBkmAIKBICQ0amE8BObIeg27xJcSJVjKy8oTVUmB/59aME/N9CqvwK60N8AlBOnFIvOeyza69Qgc0NE67+iFfJ4f6X0QEm+9Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAvWhPuuM3ZJcYJ3umhdCQSPJj+1q14vClotITvMeMM=;
 b=LKp7emHB0SevfksDrUoJqeqKT6QZVPN99qdH6ZghCs1IoDE+Oz7obGLw/1/MZxKmxJ7NvEtuZccEwbNFr5FTUsKxjicg09Pa+LeHRC/kaoEnFJRxm+1AVe4L3O2zjwGC4N/JJf5iYrFFF9Y1CoBVUGY/LRFGKJqyyQZMwtqfdWHzXEVPjFWrEHTXT1C1KbG0u9xKeXKS7c6APepVvt0owZN5USL1Sf+VxTURPnrWa6aieWC4/u0b6GQPinbHbsmVcYgJaX2hZRg24vBWr5yiOZpbiUtrm38EIIVICtlqzm4roZCktMT6WO80607lr2May4U6BCrvtr33JRUgcKCmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2622.namprd11.prod.outlook.com (2603:10b6:805:57::31)
 by MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Tue, 14 Jun
 2022 18:42:18 +0000
Received: from SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::3453:49ef:9d4:b486]) by SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::3453:49ef:9d4:b486%4]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 18:42:18 +0000
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: RE: [PATCH] drm/i915/guc: Check ctx while waiting for response
Thread-Topic: [PATCH] drm/i915/guc: Check ctx while waiting for response
Thread-Index: AQHYdqU4+CNnQhe5hUi4/n/AkkLsu61PKjIAgAAk3SA=
Date: Tue, 14 Jun 2022 18:42:18 +0000
Message-ID: <SN6PR11MB26226F7B9926FFE0A2CBE56F8FAA9@SN6PR11MB2622.namprd11.prod.outlook.com>
References: <20220602172119.96324-1-zhanjun.dong@intel.com>
 <87zgiffbvl.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87zgiffbvl.wl-ashutosh.dixit@intel.com>
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
x-ms-office365-filtering-correlation-id: 846142fb-3e5b-419b-8b2d-08da4e359bfc
x-ms-traffictypediagnostic: MW3PR11MB4585:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MW3PR11MB4585F5699E8AD8F2E3150D278FAA9@MW3PR11MB4585.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UZMyxfr5JGRG3m1Hw/270E1I27c6iixZEELTU41FzMD3gyDlXxujxSenPo5U4RFMqIzY1aLoKywoPH2WyFe94Y2oT0q1WR2Mlze078YTpbvQydGIKwiw7bu17ZyAT6pe4MGilt2eGgw/KqpBdsdNAS3mFH8E9G9RSPlayGfgSV7h7XVSDngSQZw3z5PtOGwcoGGmszaNk4D9OCceI+ehdJxw4IsHescSPNTR3I8CPpH60zliX8AR2O14yS2UY6WiQtwn5mesmSpnbG6ZAZRmQnLp4N8RuqoktJbAnAxVhnL01F1c4MvahEH11ikeDRf8/nZRcRfuCqEvm0WviLYABxtbL4zR0bisp3f65xiD3lfGOxgLxTy4kWM2m3RFzVKa0ZmtRLADq+bqpF0ChT3+ljPIgq9u8mSFjtqY9TXtrKJ6U8fKpZifqmhLkD7Ntj2zDJCmiZmdpDWXUJ7c9qSDlpb6CVCvnWI5HUv5VAgI9gxVyd2AyNgOObrYMOC9CGJdDVF3oLs4syABz9oCtYG6VaWGmQkPkg5BGgPo0R0yX/dl6rY5HBH5om9yX61+XwCfZy+0Z4kZrzcuUgr+h3YZusHsDK9DefCiWz2J+eZ3NqEpok7N1/xekrWMDx28OzlkNTXoYMNKjWxTNq2NWhFhhyHKXVgtZ1n5HVa9Z15XU3GPKPmD8lF7wvuS8gGj1vng8RgumFmsH9EfPGgaa8cDzV/H3807txG48X21usn3SC4/l4vxauNc+cWHSAvlIiCO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2622.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(54906003)(6636002)(508600001)(71200400001)(5660300002)(52536014)(8936002)(6862004)(316002)(450100002)(2906002)(55016003)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(33656002)(86362001)(122000001)(38100700002)(82960400001)(38070700005)(186003)(107886003)(53546011)(9686003)(26005)(6506007)(7696005)(83380400001)(69900200002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gnwdAvRHpxiPmiDqEHCaoRZfDXmwcEedY0NPr/Z/LzMfQ9Mn9iD31yKFY5IX?=
 =?us-ascii?Q?cV2wyu6J1H2J8lULSmOtB942ZHprZENL5p8m4Tu/OhZeHKsQDdXIeiWcf05U?=
 =?us-ascii?Q?nidnc4eaaQhJDZ/uzXsrIv0PMo8olKibtNJ5NqPuh/7DMmEkptnikBvOO47A?=
 =?us-ascii?Q?zgLYz/bAyD075xequmHRcZbypozkEfgNC/GJ9+j6/N1WPYl/4XGmJgAVBr1l?=
 =?us-ascii?Q?zJk0E5WJgFETAKLDg1fUL29KoM78CfMWxz8J0DHanSqugOZkcub/SEqXsZPU?=
 =?us-ascii?Q?jHgSNQ2KhmsR/AizhWTFoZ/R3+b47QA9l6NEeCC3IgyOm/p02WuKfY5rAzwC?=
 =?us-ascii?Q?o+ZwwobRbclagplbuhYMfXXWkFuCOITk8wuoVGLFgHiE52AYeDyCW508A0m+?=
 =?us-ascii?Q?Q65bdi24wniaPB5P5wAU+gW4ETeDuzAx7ErDMhqL6TpIpUyNaq+HwRPN3MRh?=
 =?us-ascii?Q?Pj/wv68cHsQJnm2sr4bfrQRvwVvBg8tU/wp6WOlObGJfmJbInxiDnW2K888R?=
 =?us-ascii?Q?7IGqqpPp3zDdaTjusuAzidpGEwWQ66gFjTAAEak7AvH5s7a6u61bIp6OdwyR?=
 =?us-ascii?Q?BTo+dwHkOTypsOOGVJT382kI9aqm6HlqSExRGOPmOLOmar+dYPQ7FAMLNmT8?=
 =?us-ascii?Q?bgLaQzKgZs/uBwwwu2C53ptKQ81VY4UdMg/tSIjoxXcXxpQkj6btteeC+Tc+?=
 =?us-ascii?Q?YV6heQCLtNk+0mQbIuvwgDiYojxBNnL2C//aWM8329MWkox1B/XmnjLFTxH4?=
 =?us-ascii?Q?8NTJr3cPcf6/b/NoCNMA5CbMD+c5Pp2CRzLwQm9SQljEsLwN4dJKn9hyE2pM?=
 =?us-ascii?Q?q1qXfSkYtexHz0CzS8FGeDc9gPpRw4C01QNYEx0S3Z0gzx8J+UMFdGoJ0sR3?=
 =?us-ascii?Q?LmHE8oE9D6xmDZw6XEnGIK4blhnNA2wYUCVo2lkfT0H7tMn4RCUtbKQtr7Cc?=
 =?us-ascii?Q?88buKq05j7r4IXDJ4ylivkspaBbKyxwPpv0yxEBeBFDhBUfZfYYYwrEYb66e?=
 =?us-ascii?Q?DXp7MtE/NOX3qhYF8nUt6a4D7O8G1Wrwj1yzgui6+GnfpzjybYlkdYrvDOpg?=
 =?us-ascii?Q?gcg2I0PTzmHHmfx6qfZCI95BxUeW1VluawjCN+VYdD3zJXZREYpZPax2cUgk?=
 =?us-ascii?Q?Sy1voz8Pcw8lTd4z3zKE+U03ldJPHxhWzmxLZCNbPgDm3ZI/xzN64prnTjSL?=
 =?us-ascii?Q?mLuoE7iqcH3WlGzrj80b0HzhHA58YfFWXkyz8CiFeEqa5ZwWJBRGrwfjx0au?=
 =?us-ascii?Q?O4s4hlkXyCOaxqAYp+K2GIZKxsEsdk36WLCBxOn9KW3/W0iS6dC1wF57vCdX?=
 =?us-ascii?Q?6m4cbGmEme4qvZ9WcejBmzbzQluhJAW8eRezj2gbfaIU5IITCLF3hJLbZCtw?=
 =?us-ascii?Q?Y0qNPIJ8oiyy7/dPCWucQkL2oHbi1AXdFJov/aJypRHix2XkClyHK4EYGX6Q?=
 =?us-ascii?Q?0FbUM5kIe7UqaCjhDOqd+8uwJkfLHyZON7Ev5FBmFreeBY7Xv65VZiuxBB4D?=
 =?us-ascii?Q?wRO5viBUP/qTDtjH/7aSWhb8cOr37jQr5miCU/6vWtxrJwrmadz3nxMR9ubQ?=
 =?us-ascii?Q?8gOfYTrpijgVSLAf3hAXLcjneWuDF+P+PoNkUAWQesbNUnx1+evV5U6CLHM6?=
 =?us-ascii?Q?JWUKG/RrpmQAzccTWi3age7v0P+PUMryUAn5vRJ513EzZKz7uXK8sgsVMbFn?=
 =?us-ascii?Q?iF5NMnQwVt8STSOsVboxGBGqGFpkJrCfjKiLm/iwSi7pecTYlr9P82pRqmmO?=
 =?us-ascii?Q?JOLffnCf4w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2622.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 846142fb-3e5b-419b-8b2d-08da4e359bfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 18:42:18.2973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qmPP982+92fqaFb9co6UoIupvFk9lFF8fyqaIPRLeYajcl+qFCoUAHsvqSWfe3Ehyu8d6Hws9tO0AI5f/m33og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for all comments, I will update code and prepare for next version.

Regards,
Zhanjun

-----Original Message-----
From: Dixit, Ashutosh <ashutosh.dixit@intel.com>=20
Sent: June 14, 2022 12:28 PM
To: Dong, Zhanjun <zhanjun.dong@intel.com>
Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Teres=
 Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Wajdeczko, Micha=
l <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH] drm/i915/guc: Check ctx while waiting for response

On Thu, 02 Jun 2022 10:21:19 -0700, Zhanjun Dong wrote:
>

Hi Zhanjun,

> We are seeing error message of "No response for request". Some cases=20
> happened while waiting for response and reset/suspend action was=20
> triggered. In this case, no response is not an error, active requests wil=
l be cancelled.
>
> This patch will handle this condition and change the error message=20
> into debug message.

IMO the patch title should be changed: which ctx are we checking while wait=
ing for response? Something like "check for ct enabled while waiting for re=
sponse"?

> @@ -481,12 +481,14 @@ static int wait_for_ct_request_update(struct=20
> ct_request *req, u32 *status)  #define=20
> GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS 10  #define=20
> GUC_CTB_RESPONSE_TIMEOUT_LONG_MS 1000  #define done \
> -	(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) =3D=3D \
> +	(!intel_guc_ct_enabled(ct) || FIELD_GET(GUC_HXG_MSG_0_ORIGIN,=20
> +READ_ONCE(req->status)) =3D=3D \
>	 GUC_HXG_ORIGIN_GUC)
>	err =3D wait_for_us(done, GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS);
>	if (err)
>		err =3D wait_for(done, GUC_CTB_RESPONSE_TIMEOUT_LONG_MS);
>  #undef done
> +	if (!intel_guc_ct_enabled(ct))
> +		err =3D -ECANCELED;

Also, I really don't like intel_guc_ct_enabled() being called in two places=
. Is there a possibility that intel_guc_ct_enabled() can return false in th=
e first place (causing the wait to exit) and then return true in the second=
 place (so we don't return -ECANCELED)?

Is it possible to change the status of the request to something else from
intel_guc_ct_disable() (or wherever ct->enabled is set to false) rather tha=
n introducing intel_guc_ct_enabled() checks here. Changing the status of th=
e request when CT goes down would cause the wait's to exit here. And then w=
e can check that special request status signifying CT went down?

Thanks.
--
Ashutosh
