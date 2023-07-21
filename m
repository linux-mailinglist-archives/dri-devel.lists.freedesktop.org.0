Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EC275C5FE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 13:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDAB10E65B;
	Fri, 21 Jul 2023 11:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3881A10E65A;
 Fri, 21 Jul 2023 11:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689939686; x=1721475686;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=D/AG4y3C9pTWmm/OqLabvRCgn520pOhZt+32kq936Wc=;
 b=RIItP9zH0g7BzF8WL6O4J36stseF1FiIVczZQpE4CiB5Hhrg7jWv1rNd
 mZjOiS8DkhDn2/ezx/sWFIduuPuHK9K9HWXlqGvbiBG7axFlWkOW9IMqJ
 pbm0fStXKlZtQMswJ5JOfa+jQKYIY0JzcbNFxaqB7cERYQk9VPDpqxhzj
 BR5AlmOFBnkudH8H+2xk8xYtgQZgzcEs3boZr72IHejFacO73w0KVtohh
 mN12LEw1ZyaEFiUPwflb9GYE0hLAYZYr42M5iW+/QX7iHJGSRtEH/oYaY
 ATj0FOPlG3zIV3e58goKV7pZgJAjNOvUf1Q2XHe1Bj/4D6SaY55c9rxSk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="369675720"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="369675720"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 04:41:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="814916775"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="814916775"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Jul 2023 04:41:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 04:41:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 04:41:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 04:41:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 04:41:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvbbDqt8YF8YVYzkuwlrnv1WWC/xMsAuQ1oMVcfkzP6Exry2EPOJw7Uc8ZkJXOdGkY5ZXP7X+UAiePyjhaTpIbUmeOQEz6brFy6iB+b9IhAgzNksGh8SuIazXRD1LIIZeJ7PWdPSvufJqhT9bxefR+r+XcqxUT9MmVZ37XAc+Ln9TEeQI5N95nXpOlb6HidKyD1Ihylb3wt3HThx47tHPthGJxyw3Ik7MAozTw4aeLQDAOoy6UMlkCF3rvQpD/IQi7JjXZK2T6KpxFMEecY5f4LyJbp7vGkPW8UKL7eWr//k5XUhdVCIh5XLwgDxiN37+XSvIoVLnBjdCwmCLc41zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8vsqbnVsch5TMaYOcE1zRzwMZ7gRI7jql8T9vho/XQ=;
 b=h4ACwj46e0J5Qhm7RAhSO6TIGNHcj3z4M51wH4TcysGaWQuwyJzAZrljidnaeItt0WkST8UBLhtyF1uWxj+/1A3QKD+flqicwYVHF2JwRn1o3tdPDK6meNfIwSOjF4hxIyUhuv+T05muP7K2CnQZ+6CMnAfFg0CYQP2+/Uz6MvP6M6Lu5YrNwtM04o4ez6jx7TGpxioBQ1aQFTmlUGd0t1BI2B8IQF4TU5aVh+J6jxPvGay1CIigIoK7ulTcJnOb6R1FUdGtVNK9QZ8oxbf+DJkt4K9R68apaucC/D0VhqljfklrRM1y3NrnBmNyxfU9QiV/1nIAzufnScniIXCCOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) by
 SN7PR11MB7537.namprd11.prod.outlook.com (2603:10b6:806:348::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Fri, 21 Jul
 2023 11:41:21 +0000
Received: from DS0PR11MB6445.namprd11.prod.outlook.com
 ([fe80::7a40:3f62:1e7a:5301]) by DS0PR11MB6445.namprd11.prod.outlook.com
 ([fe80::7a40:3f62:1e7a:5301%7]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 11:41:21 +0000
From: "Krzysztofik, Janusz" <janusz.krzysztofik@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, "Mika
 Kuoppala" <mika.kuoppala@linux.intel.com>, "Das, Nirmoy"
 <nirmoy.das@intel.com>, "Hajda, Andrzej" <andrzej.hajda@intel.com>, "Andi
 Shyti" <andi.shyti@linux.intel.com>
Subject: Re: [v7,5/9] drm/i915/gt: Enable the CCS_FLUSH bit in the pipe control
Thread-Topic: [v7,5/9] drm/i915/gt: Enable the CCS_FLUSH bit in the pipe
 control
Thread-Index: AQHZu8hEs+Fa0ER7kk+X6cXASqe75A==
Date: Fri, 21 Jul 2023 11:41:20 +0000
Message-ID: <4155037.1IzOArtZ34@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20230720210737.761400-6-andi.shyti@linux.intel.com>
In-Reply-To: <20230720210737.761400-6-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6445:EE_|SN7PR11MB7537:EE_
x-ms-office365-filtering-correlation-id: a907def6-8c55-4cd6-74b2-08db89df677a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wdc8InLgzFrt0okBZ/cHWw8j4k/00xMYVDxhmdb7I9eBs4VpYa3L2CPFGtos6HkKIlhuWNTfte53dpyr4yvOxA15Jhf/K4CgSJUH+RfgHY3ZErLq+lSK7SXte3MuQCSnbkT658KfMgAONZUDR04Xsk0FEEiTikMjp1Egr4Clul/Y0cjxCfY+ez7cE65M4Of1j8tsmDpsNbHQjxv9PZ/kt3RlhC8MifROo6Z9lXVbhN/HfnK2GOrNkMGCuX27yRVNGS0t4E7X8ALJ8xXmBVsku9kO/vsCngkicauweT8XKeHAA/6X494KNz6vZyn5QLCLdxHM/kpIaaij5GKOj9qwCfHgSAFKCOgYJVFMGRxchdRfsjofGr6SiT8Xl4dPExvIo/6S00FOxMHgQmvrjSStjYhyIIkaZiC8Bv1YigXO8F5BjI+Cf3et0y8Msdije6jpQbsogtyBDZn8JPoA4RodfRxMsHq1kkWn2Ps2m9pmfEibioQGSUpnvDh0GEWCH4dEtx0y3xlqqMt7jj312VAdbbbRlRmfbjKr6DOXT1dyhDevBey9p7M1sWy3ZT8sgdiX1VN3eboNPGSq7inpTZkN4efeNLoQWfDEaigYVHJPfOtiRN/Ql3saeauWnCKYgyEKNuwWewMF3om5+xOQltOaAioa94A4MVy4xrlG6xp0XLY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199021)(110136005)(83380400001)(54906003)(478600001)(26005)(6506007)(6512007)(86362001)(71200400001)(6486002)(186003)(38070700005)(2906002)(4326008)(66476007)(66446008)(64756008)(66556008)(5660300002)(316002)(122000001)(66946007)(921005)(91956017)(76116006)(8936002)(82960400001)(8676002)(41300700001)(38100700002)(39026012);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AIe0Od66erzjGlv56Qux/jm8MH3bH+TkGakcXTEdbyea+A6gro9JD3sMmsJI?=
 =?us-ascii?Q?pg2gudj6qdtzS6GraA6HEdxmSUNcZjyBuI8i75nLh5u5z6k3KQDMg7M6WB2W?=
 =?us-ascii?Q?zzbJgxxwp6N2CIVlVN7dcbEOQfW4Se2ivdIoNgVTr2S6Cj1YbqDZnQmk/LJZ?=
 =?us-ascii?Q?Z3ULIjDdtg+N+BT8J0iQ6cr5XC5hXmVbzZaXenzUSUgFT636a7HVfaWQjiOy?=
 =?us-ascii?Q?abSqNdtuc3sN46AfIu/AQBRPvTDJK3cgk71llH2WQZizbVr1RPWN3U1A04ID?=
 =?us-ascii?Q?ej6ObqwwyVOhpUBgsUATkI2/aqmUeScVOXfCQRqx3Y5GELIQiYs4Gce0/kg7?=
 =?us-ascii?Q?G0ckZAJ7dXEpwAPuSqlzNs1UCP0uK21OiQjjaaFRKs53+HFeQsh7qiEkC+Fk?=
 =?us-ascii?Q?Isgn12vq2NiQI8lUk5ytCPd616sBijW++0zMIbOANq4qdpon0in7edpbqRy5?=
 =?us-ascii?Q?U9B6UyZt1TY6TpdMuceOQexDEkGmYF9llD5YQw5qTj9hLw2aKXbksY34cVrC?=
 =?us-ascii?Q?BjOdSpp9f+zZTFSxtz/H2GH0/d/sL5U+c+rHZkpr5dHK9mX4OymRTh8hVlLN?=
 =?us-ascii?Q?cRoh5yH4mYixgLDTqQqZ7ilUwiUFxeAKGJJR0Q12XaFEGjRTPfwM5p+Mxu1Z?=
 =?us-ascii?Q?/CHV89byh3BpBnhCaaNbvmnJnZ3HDb8d1RiwQBduk7AH90dyHB5MzFPVXEcj?=
 =?us-ascii?Q?BMJQ4/csbZG2fJlsOKRWrw6aWLXs59wONUYW6noWUXP6iSxhjcvBthJ3msDi?=
 =?us-ascii?Q?Vx5pc9HRBbw/uPPBFO5Pgf8I1pZt9O8QyFvFEIzhf5d/2+WjuYnt+E1HLlym?=
 =?us-ascii?Q?FFodnMq7tBQpeTJHHyKFiQruQEGe79C3tf8OBp1zsAubaJvVtq/QVR1408XV?=
 =?us-ascii?Q?2OF80MArGC1QB6BmNONY/1RsvZmGZQ94MBcrHjzVT7tFMhxg7DaO8SlgE1N6?=
 =?us-ascii?Q?abTQKxy+M+SHdLf1fu4qW1UER8RB/u2KfS/P7Up3CKkYnPMOT43U7NJs8AHf?=
 =?us-ascii?Q?vU5CAqtouDoLmN6Zi/y/0FonA62hNlHFTZHnMJ+oZh+Wp82p6Rab4YibDIiH?=
 =?us-ascii?Q?tC+LSmrl6OGmehikkhXedAR6dckkZudQ0r7+t8k7nK8yeSjVSBp3AjPWa5zd?=
 =?us-ascii?Q?4O7R/YUPRZ20LtIojYB3z4VOrH2tzwz4mvopHI8NcigVV6P3+svxDUoGxn11?=
 =?us-ascii?Q?ri3VBLZ8+jso2VqxMTO1rWISpNn6C/dzzn1sUaoaaVV/ORtU/t4Ymy/AS7g1?=
 =?us-ascii?Q?ygyS3pNv22FOrrqKYXfiFr+9XdSkaDu6RhjYx4k/L+1cVBmj24K+0YjFcVao?=
 =?us-ascii?Q?hPux/sL8RyrPcNbAc/TS3cOAT7N2j1M02ueWXmHUSqx9dFR8xHhzgX+pCB+S?=
 =?us-ascii?Q?cpbMBUgSJsxVNfUrVNtWppJb3bnaesYuLu0B27qr5G0DlovisRiL0tCxFQWf?=
 =?us-ascii?Q?a3r+QoNyCb6oQKagbqBZHYp5hvpHuQvR7SaQqJPZ5Tnx+/m3z3ZQ+zNDxwvS?=
 =?us-ascii?Q?cBf2GvOFsgBf2/0HHrpgGh/Cq0cCmcIZpAKp3A1lgYVkdtXdcNWROL0BSM7U?=
 =?us-ascii?Q?wy8FmYh4zu0p+d3VNWRSd77VlHdWK8LxX4De2Tuprir6/eoQ3fD1iuO/ZliH?=
 =?us-ascii?Q?X50okbiyPtKm9CH0jGmNwu4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <823EED622C269D4198A5D1E9AD7B3623@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a907def6-8c55-4cd6-74b2-08db89df677a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 11:41:20.9522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wmLNQuRmzCJI24l/TYOT1rEapadKRMNigheJHpV05o9Nl/BlSRkz2cnpUaFl3eyMhN0ari+aujG1YJG83P5yUv1QtMmM7IEqUe8UazoCttM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7537
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

On Thursday, 20 July 2023 23:07:33 CEST Andi Shyti wrote:
> Enable the CCS_FLUSH bit 13 in the control pipe for render and
> compute engines in platforms starting from Meteor Lake (BSPEC
> 43904 and 47112).
> =

> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all en=
gines")

I'm not sure why you think that your change fixes that commit.  Can you ple=
ase =

explain?

Thanks,
Janusz

> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 7 +++++++
>  drivers/gpu/drm/i915/gt/intel_gpu_commands.h | 1 +
>  2 files changed, 8 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i=
915/gt/gen8_engine_cs.c
> index 7566c89d9def3..9d050b9a19194 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -218,6 +218,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u3=
2 mode)
>  =

>  		bit_group_0 |=3D PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
>  =

> +		/*
> +		 * When required, in MTL+ platforms we need to
> +		 * set the CCS_FLUSH bit in the pipe control
> +		 */
> +		if (GRAPHICS_VER_FULL(rq->i915) >=3D IP_VER(12, 70))
> +			bit_group_0 |=3D PIPE_CONTROL_CCS_FLUSH;
> +
>  		bit_group_1 |=3D PIPE_CONTROL_TILE_CACHE_FLUSH;
>  		bit_group_1 |=3D PIPE_CONTROL_FLUSH_L3;
>  		bit_group_1 |=3D PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/d=
rm/i915/gt/intel_gpu_commands.h
> index 5d143e2a8db03..5df7cce23197c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -299,6 +299,7 @@
>  #define   PIPE_CONTROL_QW_WRITE				(1<<14)
>  #define   PIPE_CONTROL_POST_SYNC_OP_MASK                (3<<14)
>  #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
> +#define   PIPE_CONTROL_CCS_FLUSH			(1<<13) /* MTL+ */
>  #define   PIPE_CONTROL_WRITE_FLUSH			(1<<12)
>  #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12) /* gen6+ */
>  #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11) /* MBZ on IL=
K */
> =


---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu usta=
wy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w trans=
akcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by others is strictly prohibited.

