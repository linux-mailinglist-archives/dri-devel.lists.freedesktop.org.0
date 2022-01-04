Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF13A483F64
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 10:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC80E10E527;
	Tue,  4 Jan 2022 09:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA6310E527
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 09:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641289990; x=1672825990;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bzw7+sx9QMNXCIrHh6ILC8GvvDb6Q6gJRxz4VK21qkk=;
 b=fIFs7aiuIFT5FfjwSGMQHek/BNfQMR7sd3RA3ipYxw7oPiTW510MrioT
 tWTJTJwcwMeVl/0/m1vQtagoY7AEZbs1nvRHsxYP2dz2iQIMrF8nTTn49
 68KX8vmcCv5htLs2BNPv3+AL85NXLMwtzyLUZ3UGlSGoSCzcqX/Qro4Ne
 Wky33lh/PdSPpKNAQbFyzhk8odUiHaozyGfbap22o5STyTZ6ot3vCZ9vp
 MxdQ1zY0x+sskioVCWQLxnpBsUKid+mUzzQd2Xdq2nC9ZdzRFAMXBWh1S
 bPrHHVC2q1/kqqB2CP1N16QwdFdB5krvOPaTCX3ykezU0yEfq3iy8Aex6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="229509595"
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; d="scan'208";a="229509595"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 01:53:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; d="scan'208";a="590627345"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 04 Jan 2022 01:53:09 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 01:53:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 01:53:08 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 4 Jan 2022 01:53:08 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 4 Jan 2022 01:53:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgEQNfnUtI+vi53EyH6gc9L+FJ/tLQ7BBLvNImE/j83ZdAu7H7M0CVVa8yt3XNEqlk2pUC8EviWU2KppVHQtx+Sa9rJLJRLA6HqKVhFo2WKvf/MUcKNEkwvHNABHdipYBz1lZRqGuemDaauenwjucOJRPH2VntltleT4YjScgD6NAzo0qZd6acbN5+/7e1RPGGgLjF6BTkVuTc1Yy4N2Okvb+zrenWY8zHM/+QSTwGY6Ex/DOoDA3o34sznCkgQMLyl/DymHLo1awRr/w1KlwqFOklLcDCNN/8aU3O9+ecde5AkS3f3LWzShtzM4jY+FdBf9MC45ZQk7YK9ApOeGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgyc+tPOkAH48yXgpWYShZIfXh/rvOtwujupFhu4maM=;
 b=SAsOykbGhvibD+/+/RM2GBgKb6sRP1ekT/q2y5/deTpW9Ne+7/F3/bi65Y0gtpgZ3SFn0wg2jILEyEOIWe/wBj7dSZJiwS6/TKQATzs504tYipqExHFfjOAeuYMC1QIDvDUhcY8rMr2JoyVttAKkpvqpnONto8qyYT1IpwAGWfcwoMYed0VwMWtck+bdH6C8S22g8en4UU6IF1K+HCpyXB5FrQJxrhtllThb680nc7kiewCSScswbOURZ6NWjvLTn2wtmvO4a1qbOtKBFoVGUm5UUFJVh7/wDdMGvstRkaesrlAbsDqwM7P7cTL2jm0XmQwf17HfNpFBLne0KMkYVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM6PR11MB3244.namprd11.prod.outlook.com (2603:10b6:5:8::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.14; Tue, 4 Jan 2022 09:53:02 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d%3]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 09:53:02 +0000
Message-ID: <2c69d44c-5e33-03d3-d981-425ee2167cf9@intel.com>
Date: Tue, 4 Jan 2022 10:52:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>
References: <20211210113617.196204-1-angelogioacchino.delregno@collabora.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20211210113617.196204-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0024.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::37) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82b92a88-d1c6-4742-329b-08d9cf67ff1f
X-MS-TrafficTypeDiagnostic: DM6PR11MB3244:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB3244248E2737AE57B8936B06EB4A9@DM6PR11MB3244.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uBxD4WCKozax5au/gLF9BwY/ent9KqR/8A3zPAEgj8bim/W6yAbxuk0qpbba0QGUBm30NbunDSHmPidX/D9k0OiFji13x0orAVYrKv46BndArlP/9qGy82ceUdPkaodopxZ+WfOYOq9Aq1DAr71ngnO1lnJHqe+1Hrm/Bc637zk4VnwPMqQ2ygvuCm0OLv6BD6NWZ/NdP5CanDdvz3MSPRMZLztjB6LBhO9k+irAuSJSzH0SFZ6tw0HbPhq2JIMwgwEJOgzch6n+pXIR4PTIPoWNeDiSLmkpdOlm8AYkO1IzPLcoe5XTaiHvZeU6YYQ2T3CnhRfvVKutySfnKkiIBUVuypQLIhHAgX1sh43txMn7rnvVYvBYWrwsh+obm3osAhYV0+VsqC8SLOcuSKwzwq38jN+aKWptgDLoSVmXgajdygJxEofh+SWHk39KzZVhJW9PsF5Nhu3//o5Uhg8j/r545WAXLKU3lvjPGvVQH4bX7SGiVpRkI6l4JNUo4TYikh1uDj4DYrjdHrMJTuX3Kx3LHVoAcBtnknpDXdB/FywHwjgK+DDFHCz6c6+x3qxA2VeKRsynJWzLFBcV5sQXi8PcDkR+WhishbrL4dtN7/rkSGNXKyyJlYcQ36KX7ti/mBnN8nrf2A6kLJzJDatXNMJji/55Dhvmpur2QBOURdeaY3nGxc666VpFRgQwKXThYnv6KidDXQacEAQqkc6Gr3D0il6x7F75wbjVwJzmNTs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(5660300002)(82960400001)(26005)(83380400001)(6666004)(66556008)(6512007)(38100700002)(6486002)(36916002)(44832011)(186003)(316002)(6506007)(8676002)(66476007)(53546011)(2906002)(8936002)(86362001)(66946007)(36756003)(2616005)(4326008)(508600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWNuV3lDTWkwRG83VVQ1dkx1d1A2eHBoL3pLUWw0L3kxSzY5S25PekZ6Skl1?=
 =?utf-8?B?bDJqd1RHS0VDZFoyaGxtNExnUWNMRkZoejVKdlhQSitJcmttZUhLN1VWRW9M?=
 =?utf-8?B?d1VqRUxYaWhkbUtIdzV5bCtvb3dDcGVVbjZSWGpzUzk3RmxjaStOQk1rZ3lU?=
 =?utf-8?B?R0hGUTZzY1VnMWY1K1QyMngyMFV5YnhyWkxpKzJ1b2hlWTBQYTNkZzZDVzND?=
 =?utf-8?B?Y09jZXd6VWlaUDJBVlhtWVBzOWloNTFEc2RsY3p0eHo5MTVpcDUzRGJjTGNu?=
 =?utf-8?B?bFplMVlLcTdmUUxDc3lTVlRia3NsRnZ5VGxXOVFZNkgza3dDbWpNOWtseFBj?=
 =?utf-8?B?TXpyN3BSK2x3K2wybUk5RHJxTDQvVG5SVTNkclI1V3YwY2Z1VTlDb05VSnk1?=
 =?utf-8?B?cmZPd29NWGg5VUtqZVVUaXBxM2R2VlNUamxQbHFRZTNSYkVNNzRuQm93R2Z1?=
 =?utf-8?B?dVFhM3VwVUFMdHJsVS9vWG52eGFYVFpTeFRmL1p2VjljZFA2U0JUNVo5Sjll?=
 =?utf-8?B?VElISDkxVGFSdVBQeDZ1MWNGU3p5Qm8yS3phZVp4UnZqNEhNdG1qTmpUaHlI?=
 =?utf-8?B?STdEdGt1ZWRmQUtubzRJYTBxU2hTYTdPZklYNUltcUN5aUgydlRrNHRxU3RX?=
 =?utf-8?B?OURSdERacVAzK2N1czRYSW1FWFA5US9pck1mZG9JMkdkL3FMbG4wbGpLQmdE?=
 =?utf-8?B?SFYrSE5pK2VCdUpWcUR6MU1YZUY5bldtS0lLK3NORFUzMGlaTUhMS1dRbm5N?=
 =?utf-8?B?WHVTR01WbmdPZXBBdHd6a0NBL0c4a1pvMnBNbjN3YkY5cFZKOVJDbjdLK05Z?=
 =?utf-8?B?UXVPc1BmT2ZVMDJ6cENhOGNwZEpGRFcrdm5kcDF3bUtNQkF5OEhrVGRBRS9B?=
 =?utf-8?B?YjMvZFJ2SStNcml6UEhKRVVKN1dXa3QwTW1aRFREUEhoMUpoM01BZ1NQWVU4?=
 =?utf-8?B?cTQxQ1ZQOEpRTUc0ZFRrKy8valQ5RGsyMFcyQ0RNY3JETEtrNFI5NmRic3Zi?=
 =?utf-8?B?ays3YWR5QzJmMGpnbnRSWSt3aE9hc0Y0R0tvaC9YeUFMaTB3NXphMkJUdG9l?=
 =?utf-8?B?ejFHRDBiMnZ2N3JNZGxvYVdzeXRwSlg0YWRhcG1WNU9NR0EzZUE3aWhXV203?=
 =?utf-8?B?V3pPSnM4cWdLN1RwU3BIaVdWNDdXdjBvU0VqbElmY1JjU1VYVE5zNnA3VThM?=
 =?utf-8?B?ODBJMWZYaURtN29xRlhIT2tDejNzdmhIaHNKRVlFMkpDTWRBUEhsclBtcDFW?=
 =?utf-8?B?TFE2ZlhFLy9DSXRWcEZJTlMzb00yRWJ2RmYzbjRmZUR2c283ZW5mbGJaZ1V0?=
 =?utf-8?B?SzZoMFVndTdXTkNMOXhzRnJWNWNsTi9EQ0o5Nlh6VmNnSy9qTVR2S0tIb3pN?=
 =?utf-8?B?V095ZkpPckJ2ckZLamdWblNhVWtOSFRhYkg4cnNhcXhoSEZ5bTJOYWM3RXpn?=
 =?utf-8?B?c3ljY1VObEtSRkFiN3ZzQlU4S01FSlpmbDhBd081V3hORXhPNnhFamVyVEts?=
 =?utf-8?B?bExieFBHN0xxcGFsMnZTaWFBemptTythVUw0dEcwazVjVWpFam01cENFR1Zk?=
 =?utf-8?B?OG45d1RWbFo4SnhaNEhNN0tldTVsKzZOYVYxVjMvMlZibWgyanJHbG5FdTY4?=
 =?utf-8?B?SzNSUnZHcjR4eXBuS1BXazNHSTZid2J3cmoyR1E4QnRYWEJPaGt0clh1NVlM?=
 =?utf-8?B?b0NoVll0VmlFdW9JbFZDTFpDczh6cENzZ2Y3RkdmTTR5RTVodFJWY0ZTdWFQ?=
 =?utf-8?B?eUdTZFQzckNxNW54UlQ4a0FOT0I5VXRJQkNYa3huaXJyeERFUVdIK3RBbkxC?=
 =?utf-8?B?NmlNYnVKMTVtT1NGYXpMbk4wcFYwSkNJZ1ZSSE4vdkloSzFCejJYZ3JSOUVy?=
 =?utf-8?B?V1lDWkx1WllGZ1pKWUk3RFk0NlVzTm9RUmZCQTVRUVRQdWxnbVBkQmlqa1Vw?=
 =?utf-8?B?TzBqRUFHWTZoTG5DVDVhY3VHdDNaRzZSMnY1WmUyVjd4dFZmT2RSRFEyc3hC?=
 =?utf-8?B?ekMwQ0FSeXNrL2d0VkZwL3FBdGlYUlBXOHFwOTRSWm5Ydkx6ZDlrUlVMOGVG?=
 =?utf-8?B?UU1Na2lYcUVEQUd3OGJHSzIzbFE0UzVnS0FWNmVQeTNocC9oL2libEJlakcy?=
 =?utf-8?B?RGZYNHR4a1Y4cFlsSGVicEpsYU1TS2J4MjFVbXN1ZStVMmQrMlpJNG5EQm5n?=
 =?utf-8?Q?dmyQDopBClCrJucyk0M7AcU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b92a88-d1c6-4742-329b-08d9cf67ff1f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 09:53:02.1107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCfPy73AHfsutXEwzd6ITXkjyNTwADfFDfn29D6qCig/ppNTo56QvQ9Cee3QFXJdJT2MG+048baMWq2MQgIW7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3244
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10.12.2021 12:36, AngeloGioacchino Del Regno wrote:
> DRM bridge drivers are now attaching their DSI device at probe time,
> which requires us to register our DSI host in order to let the bridge
> to probe: this recently started producing an endless -EPROBE_DEFER
> loop on some machines that are using external bridges, like the
> parade-ps8640, found on the ACER Chromebook R13.
>
> Now that the DSI hosts/devices probe sequence is documented, we can
> do adjustments to the mtk_dsi driver as to both fix now and make sure
> to avoid this situation in the future: for this, following what is
> documented in drm_bridge.c, move the mtk_dsi component_add() to the
> mtk_dsi_ops.attach callback and delete it in the detach callback;
> keeping in mind that we are registering a drm_bridge for our DSI,
> which is only used/attached if the DSI Host is bound, it wouldn't
> make sense to keep adding our bridge at probe time (as it would
> be useless to have it if mtk_dsi_ops.attach() fails!), so also move
> that one to the dsi host attach function (and remove it in detach).
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 167 +++++++++++++++--------------
>   1 file changed, 84 insertions(+), 83 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 5d90d2eb0019..2ff347da35c2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -786,18 +786,101 @@ void mtk_dsi_ddp_stop(struct device *dev)
>   	mtk_dsi_poweroff(dsi);
>   }
>   
> +static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
> +{
> +	int ret;
> +
> +	ret = drm_simple_encoder_init(drm, &dsi->encoder,
> +				      DRM_MODE_ENCODER_DSI);
> +	if (ret) {
> +		DRM_ERROR("Failed to encoder init to drm\n");
> +		return ret;
> +	}
> +
> +	dsi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm, dsi->host.dev);
> +
> +	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret)
> +		goto err_cleanup_encoder;
> +
> +	dsi->connector = drm_bridge_connector_init(drm, &dsi->encoder);
> +	if (IS_ERR(dsi->connector)) {
> +		DRM_ERROR("Unable to create bridge connector\n");
> +		ret = PTR_ERR(dsi->connector);
> +		goto err_cleanup_encoder;
> +	}
> +	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> +
> +	return 0;
> +
> +err_cleanup_encoder:
> +	drm_encoder_cleanup(&dsi->encoder);
> +	return ret;
> +}
> +
> +static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
> +{
> +	int ret;
> +	struct drm_device *drm = data;
> +	struct mtk_dsi *dsi = dev_get_drvdata(dev);
> +
> +	ret = mtk_dsi_encoder_init(drm, dsi);
> +	if (ret)
> +		return ret;
> +
> +	return device_reset_optional(dev);
> +}
> +
> +static void mtk_dsi_unbind(struct device *dev, struct device *master,
> +			   void *data)
> +{
> +	struct mtk_dsi *dsi = dev_get_drvdata(dev);
> +
> +	drm_encoder_cleanup(&dsi->encoder);
> +}
> +
> +static const struct component_ops mtk_dsi_component_ops = {
> +	.bind = mtk_dsi_bind,
> +	.unbind = mtk_dsi_unbind,
> +};
> +
>   static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
>   			       struct mipi_dsi_device *device)
>   {
>   	struct mtk_dsi *dsi = host_to_dsi(host);
> +	struct device *dev = host->dev;
> +	int ret;
>   
>   	dsi->lanes = device->lanes;
>   	dsi->format = device->format;
>   	dsi->mode_flags = device->mode_flags;
> +	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> +	if (IS_ERR(dsi->next_bridge))
> +		return PTR_ERR(dsi->next_bridge);


Here we have implicit assumption that port node (0,0) points always to 
the 'device'. I guess it is true for now, but could bite someday. Anyway 
improving it  would require adding some additional helper for getting 
bridge based on mipi_dsi_device and should be done in separate patchset.


> +
> +	drm_bridge_add(&dsi->bridge);
> +
> +	ret = component_add(host->dev, &mtk_dsi_component_ops);
> +	if (ret) {
> +		DRM_ERROR("failed to add dsi_host component: %d\n", ret);
> +		drm_bridge_remove(&dsi->bridge);
> +		return ret;
> +	}
>   
>   	return 0;
>   }
>   
> +static int mtk_dsi_host_detach(struct mipi_dsi_host *host,
> +			       struct mipi_dsi_device *device)
> +{
> +	struct mtk_dsi *dsi = host_to_dsi(host);
> +
> +	drm_bridge_remove(&dsi->bridge);
> +	component_del(host->dev, &mtk_dsi_component_ops);


Order should be reversed.

With this fixed:

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>


Regards

Andrzej


> +	return 0;
> +}
> +
>   static void mtk_dsi_wait_for_idle(struct mtk_dsi *dsi)
>   {
>   	int ret;
> @@ -938,73 +1021,14 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
>   
>   static const struct mipi_dsi_host_ops mtk_dsi_ops = {
>   	.attach = mtk_dsi_host_attach,
> +	.detach = mtk_dsi_host_detach,
>   	.transfer = mtk_dsi_host_transfer,
>   };
>   
> -static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
> -{
> -	int ret;
> -
> -	ret = drm_simple_encoder_init(drm, &dsi->encoder,
> -				      DRM_MODE_ENCODER_DSI);
> -	if (ret) {
> -		DRM_ERROR("Failed to encoder init to drm\n");
> -		return ret;
> -	}
> -
> -	dsi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm, dsi->host.dev);
> -
> -	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
> -				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> -	if (ret)
> -		goto err_cleanup_encoder;
> -
> -	dsi->connector = drm_bridge_connector_init(drm, &dsi->encoder);
> -	if (IS_ERR(dsi->connector)) {
> -		DRM_ERROR("Unable to create bridge connector\n");
> -		ret = PTR_ERR(dsi->connector);
> -		goto err_cleanup_encoder;
> -	}
> -	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> -
> -	return 0;
> -
> -err_cleanup_encoder:
> -	drm_encoder_cleanup(&dsi->encoder);
> -	return ret;
> -}
> -
> -static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
> -{
> -	int ret;
> -	struct drm_device *drm = data;
> -	struct mtk_dsi *dsi = dev_get_drvdata(dev);
> -
> -	ret = mtk_dsi_encoder_init(drm, dsi);
> -	if (ret)
> -		return ret;
> -
> -	return device_reset_optional(dev);
> -}
> -
> -static void mtk_dsi_unbind(struct device *dev, struct device *master,
> -			   void *data)
> -{
> -	struct mtk_dsi *dsi = dev_get_drvdata(dev);
> -
> -	drm_encoder_cleanup(&dsi->encoder);
> -}
> -
> -static const struct component_ops mtk_dsi_component_ops = {
> -	.bind = mtk_dsi_bind,
> -	.unbind = mtk_dsi_unbind,
> -};
> -
>   static int mtk_dsi_probe(struct platform_device *pdev)
>   {
>   	struct mtk_dsi *dsi;
>   	struct device *dev = &pdev->dev;
> -	struct drm_panel *panel;
>   	struct resource *regs;
>   	int irq_num;
>   	int ret;
> @@ -1021,19 +1045,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> -					  &panel, &dsi->next_bridge);
> -	if (ret)
> -		goto err_unregister_host;
> -
> -	if (panel) {
> -		dsi->next_bridge = devm_drm_panel_bridge_add(dev, panel);
> -		if (IS_ERR(dsi->next_bridge)) {
> -			ret = PTR_ERR(dsi->next_bridge);
> -			goto err_unregister_host;
> -		}
> -	}
> -
>   	dsi->driver_data = of_device_get_match_data(dev);
>   
>   	dsi->engine_clk = devm_clk_get(dev, "engine");
> @@ -1098,14 +1109,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>   	dsi->bridge.of_node = dev->of_node;
>   	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
>   
> -	drm_bridge_add(&dsi->bridge);
> -
> -	ret = component_add(&pdev->dev, &mtk_dsi_component_ops);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to add component: %d\n", ret);
> -		goto err_unregister_host;
> -	}
> -
>   	return 0;
>   
>   err_unregister_host:
> @@ -1118,8 +1121,6 @@ static int mtk_dsi_remove(struct platform_device *pdev)
>   	struct mtk_dsi *dsi = platform_get_drvdata(pdev);
>   
>   	mtk_output_dsi_disable(dsi);
> -	drm_bridge_remove(&dsi->bridge);
> -	component_del(&pdev->dev, &mtk_dsi_component_ops);
>   	mipi_dsi_host_unregister(&dsi->host);
>   
>   	return 0;
