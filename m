Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0651D532A97
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 14:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B74310FC3B;
	Tue, 24 May 2022 12:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2399E10FC3B;
 Tue, 24 May 2022 12:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653396339; x=1684932339;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MCYaWRdzjwFNNNKdJh92CEmQ4mlI55z/p6Xv+JrRG/0=;
 b=hTvtls8OEQh06sYuZaOxA+7Oa+wfIlpUDMYxDqMXn10T2sXyE2qe0+ZY
 BagqHdD50U6cYDNk/gpIves7kVP+nechhcZ1w5qdOl67MOY+6raaQyXJ6
 KqtXYYdwZB/oK5cgNi9wPnCj1QMEAmv8mrt+pysiEEspx7NPvbyNFI7CT
 RWluV9BQ1u0rEDpAdaubxidcy6sYN1YtoZRnXu52xA4QDDHDZN6zqV6j6
 oihKb8fPs0P8iN7j6movkKuTuCeIVd7F6HacryXtXRORr733iKXNw8SZH
 Kv62bCBFc7Uf0JFbiMUeqbno9r9f5pWNRZWyV2Rgu3eenAQstbQnmLHob Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="273515237"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="273515237"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 05:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="629871456"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga008.fm.intel.com with ESMTP; 24 May 2022 05:45:38 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 24 May 2022 05:45:37 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 24 May 2022 05:45:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 24 May 2022 05:45:37 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 24 May 2022 05:45:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myDTKtDlb0C1tILhXDLx5J5FOusUWQWQaKUioOppPpJ5rcqtF6NlEmdwAQaaJxn/P89IPj4iOY0FeT1DYuNyX/zcZs74HqXlDS4Gvp56DbARoxKk/Kls1/mpllAYORN1C1EC058Q5f/9JEG39RgD7BOgRRschp2pOUJyBxkZtKo9bwEfpe1oEGlwihmZsqVjdMvjVaPYeghkmz2WFwMMK1A6h8SjC2Ivuxvxt+8eg7ujjl5zhm2nCqbFLHgxhsvCtrUpECVfpGZIslF9OAM9YiaP+9zNq3oRCQUDkNmIflNahsFTLnP8h9KGSJ0bG5wsz+mE4liOVU6To+pgjJyeKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhtfVTP8nUlKXwkLRbqnlLXXdaSYuhYSI0Ky1zkYdFU=;
 b=h3y475tcrEfwjBi1oAije24h1/W42N3wPfjPIPRilr47UPa7I5gQnIUKWfPY5VNnOLWwlAS7YHvDNFGDHIeUHdTMsYdRwfQ9RpS+zF8gfVuTj9Ss3fTkLwi8hOlGanAN48ZBKXTx6TvOXcTH9wnkYAR/Exij9emdo/oK1g7/qozUWyo6n0mo5Hm24b4YkGoBlYc2AyzRZAC9gMM5X4RXWyAWawqtxnNbUaoi9oZnei1EsUL6LuPfT/vOcWz9dZ4mawPefJm7wtbhbt+2nzUrzCqMOta1Lg1wxDT+QNpEz77hxGIYmh2VaX+dvRBLfnNT5WhI1jYruhM13amHVpHIDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 DM5PR1101MB2316.namprd11.prod.outlook.com (2603:10b6:4:5b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.13; Tue, 24 May 2022 12:45:34 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::2df3:4862:e431:2f20]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::2df3:4862:e431:2f20%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 12:45:34 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH] drm/msm/disp/dpu1: remove supoerflous init
Thread-Topic: [PATCH] drm/msm/disp/dpu1: remove supoerflous init
Thread-Index: AQHYb1oR9hUtHnkEBk2ZkmUIvFiNt60t+YDA
Date: Tue, 24 May 2022 12:45:34 +0000
Message-ID: <DM5PR11MB1324AC13BF045B9FDCE702F5C1D79@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20220524103534.2520439-1-vkoul@kernel.org>
In-Reply-To: <20220524103534.2520439-1-vkoul@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80799064-a942-44cc-2f1a-08da3d834bc9
x-ms-traffictypediagnostic: DM5PR1101MB2316:EE_
x-microsoft-antispam-prvs: <DM5PR1101MB231648B8B89A4C64197EB8A1C1D79@DM5PR1101MB2316.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0AAD6/XWoPbdZjqI92EPfxFzcMfdc8D881DKhwoywmaezpmuyZZ+Vnh/kyt/6vwScUCAts91CP9QfjwkmoCMaZ4oiqvK+QorcERgxfRx0bLampVOZPTFgxm5qT3i327zAcR9/eztGhAAApzTuxmneRvwPaICiKnm86j5SFNfWdHLEim2RW9e+pHaBBo3bg2nEbcD8EcvBmOPD3tO/7yIucBL2RNHyRkZQOaATQw0oeFKgyFIynR2wcM13sSsH1kpisFYV62RiMCPNGrXVq/zCcEc4pxR9cC1F8CHQcIUiIxdcIbcNpOvqLLjz4+nG8wb4B6T0dC5GSk+ub6w6ZlfQYenkHf98r9FIQVsCK8sF/7nlZKrzqMIydm6fXAtXS8xR1Ir1zq/fGnz14sS6WDlOQ2GtpvQtJJsgJhHcrUzNlyOt43g30MiXrZIlgP1rax0bHhCNHIZEj0AE5If0EHlptl4CbsIiuy3kU9CQ0kNM2rucMjnB5JUcS9eJTn9XfkvYe4H5IjlUBX+2S7LaSB9TaGqW/xB9U8KBVrjIW80WbMYesG04vEUnDhAf6SJVyJvcxD5Utt8z30KX47OZo9E6onXTKCbxZP/K5t6DayIsUofR5JV4qREUm2p3FqStJvGgASEE/pqp3XrxS6/9Av8ouaUCdl7o9pPGyOk1mJJlcCWA1ftDIpKyXowHj1SkvJQ/vUe8UYJQh1TNaOP9UZfWQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(9686003)(71200400001)(508600001)(55016003)(52536014)(5660300002)(6506007)(8936002)(33656002)(2906002)(7696005)(8676002)(38070700005)(4326008)(316002)(122000001)(54906003)(110136005)(38100700002)(83380400001)(82960400001)(186003)(76116006)(66946007)(66476007)(66556008)(86362001)(66446008)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m848bgEQQGsuQfDplAmrqKGQINljbwujBeodcz54ZdJ60YYpf1trLzvw1blP?=
 =?us-ascii?Q?QGawqvjotYJe1C/fMY1Mdi6M6sJpbWRfLf/P/D7TId6CtG1ycxNGQFINXSm6?=
 =?us-ascii?Q?AAKaHC2jZrAdg7HBoqO61P4PpsragNH5KFcePqU4rpiAM9zll/Hq3UsgviMk?=
 =?us-ascii?Q?+rgcDAVhgjBq9soaxRF7RLN1fbq3wpRXi8N3EpSkmW6OkypbHeKENOP8binb?=
 =?us-ascii?Q?dUAyi37wdG3w8ElJRy+bc0zdGPfEJN86oIb4RFCIHvQI/ePXz+fsfNNZCGb2?=
 =?us-ascii?Q?d7KxwBrYAmTYrk95btx887DzKQ47yJ9EeSYnGAKYOuXLRU3rPkZvSRy2rrdR?=
 =?us-ascii?Q?TOFz+Z7thgzYVJ1Tj+NmzE0lyrw4vjai58i2Cp4oO9tVSWQGwpsd/GCSoyHL?=
 =?us-ascii?Q?XQFnBwQ09I7c4K0RrxcxoGfR8pRXXABJDZRNMWsi8xWpbpeqS64lTuEBm5I+?=
 =?us-ascii?Q?PTMnV6YxDkoR7gW4y4jOLMGV/Io9N7KK+guU9V+VcfsN23rMNuKDIZy5OmSs?=
 =?us-ascii?Q?wavouV7J8QuJ9+qtTEpy2bwTGS2DAuA7weDQ/rOz5xKe0joW/MgLSH8Gk/Au?=
 =?us-ascii?Q?1qUup3dAFDBBFxgTJEQVTR0W7CqOz85Q9db0863Rrzui2c0Eu90geU0dCoWx?=
 =?us-ascii?Q?hMthSG47Rj3sIfcWj405N1QPIPQsjLQ4jHfTMqnQpAugiLCVgrPV+0fXKx23?=
 =?us-ascii?Q?url7Q8ZS5vUPdjD9V/q5UiC3KXgzDRgNib8CZcsgNvsfJRdCBMrYcmryfIxn?=
 =?us-ascii?Q?kb5pPBIxQr9ANw+OkEmx/hGfBQ/xSjK6z7Y69Fucdc71ZSn2T046LPHRkcIc?=
 =?us-ascii?Q?Bc/ic58j7SBhOXarNx23TE5Ii2pmUOYFIyQSJFO3URpQTI/oS0K9/2x7U+GN?=
 =?us-ascii?Q?AxqwWmVYcKadSZOwdKlv8o33usVEDxwkHNvpDgiMSpCWPV2l6dkMJVjX3dm0?=
 =?us-ascii?Q?gy7I83k38y7Prk0ZbMz8eXJT2MCx95tZzs9aH7F7EfV+mPToZcVcHoM8igpA?=
 =?us-ascii?Q?rSMxSOfsbXUEYtiQpWr2ydQc/tzjLs3A8ocXu1WxOikz5pXF4Sycs15PHLVo?=
 =?us-ascii?Q?IDGBuWxfB5pRyAEmlnRBXgsKwvZCatBPVBX074q+Eh7jZsWBOYjm07sC59je?=
 =?us-ascii?Q?vMYD6FLArwCPf9hi2IvhGSzL8KPMtTsk1sx/6G0bMgMu4dkxxrbGGe6VIB7E?=
 =?us-ascii?Q?GiolQv6ywv0A03lGm8zLZ8nWWjdxfl1SVnpFND5K/WTeNiholDw8Sr+jgBDx?=
 =?us-ascii?Q?6E4X2VfoxmXjaefFYL9efndlyz/nSg+EQIjOIWj8cVqBUMZugmmCq1RjAfhZ?=
 =?us-ascii?Q?CaFay5piKGf6ONr3TLOZ+84rUWjk94QA9amcwhiheCxN6640lRpseF9yA5jg?=
 =?us-ascii?Q?4xMZB0TPtC9x6+pgdFK1XxngPsD/u1Xm9+Am2a1r3kz+6m1ZTw3n+JmyRxRE?=
 =?us-ascii?Q?vSKxjxqhZm1gGwFGNHJ/wqH/krj9UEBtVAWCKv64KWY5sMHOxy1wiLDN7/HV?=
 =?us-ascii?Q?amgryzCSxYEIn1o10Lia5psYjLTbBgs+IJys32/nB3VS8MvdFn60yAiUf2nV?=
 =?us-ascii?Q?5Y1hM0I8hVdpy2TrOo1K05wC+BjxCvLwiBvYvLSOJeKkkpOEvOXJ6p4mM1e8?=
 =?us-ascii?Q?6S4YQCmo2lC2amp7hICthN6DkCToefy8f7YeW+WEUH5BT99P/i7ecww3bZNF?=
 =?us-ascii?Q?q3rvqFoROTTFTBRkGhyIbaUyvEjFCNPTyVz/X4Ls5HnFgW7QQN0dDR1of0Ue?=
 =?us-ascii?Q?9AouLxLx4w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80799064-a942-44cc-2f1a-08da3d834bc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 12:45:34.7207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q8fXvHf9uDlbHW9qOHOTmbrkUc8f/rj3kQuVV0zdLBl6SQw+cKCfempQAJ1KzhAtrEo3soS4HtGfFHFgxdikIRMENPnlXOGf3eQisp7+AvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2316
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
Cc: "Liu, Yujie" <yujie.liu@intel.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Bjorn
 Andersson <bjorn.andersson@linaro.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Vinod Koul
>Sent: Tuesday, May 24, 2022 6:36 AM
>To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>Cc: Liu, Yujie <yujie.liu@intel.com>; linux-arm-msm@vger.kernel.org; Abhin=
av
>Kumar <quic_abhinavk@quicinc.com>; dri-devel@lists.freedesktop.org; Bjorn
>Andersson <bjorn.andersson@linaro.org>; Vinod Koul <vkoul@kernel.org>;
>freedreno@lists.freedesktop.org
>Subject: [PATCH] drm/msm/disp/dpu1: remove supoerflous init

s/supoerflous/superfluous/

m

>Commit 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in
>encoder") added dsc_common_mode variable which was set to zero but then
>again programmed, so drop the supoerflous init.
>
>Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
>Reported-by: kernel test robot <yujie.liu@intel.com>
>Signed-off-by: Vinod Koul <vkoul@kernel.org>
>---
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>index 51f24ba68375..388125c8bda1 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>@@ -1798,7 +1798,6 @@ static void dpu_encoder_prep_dsc(struct
>dpu_encoder_virt *dpu_enc,
> 		}
> 	}
>
>-	dsc_common_mode =3D 0;
> 	pic_width =3D dsc->drm->pic_width;
>
> 	dsc_common_mode =3D DSC_MODE_MULTIPLEX |
>DSC_MODE_SPLIT_PANEL;
>--
>2.34.1

