Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD006734A0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 10:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB2910E8FA;
	Thu, 19 Jan 2023 09:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2063.outbound.protection.outlook.com [40.107.105.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1585110E8F4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 09:41:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHzYel3meF5ObbpYLcjIExpljo2IcVVw9G+A0A/luKi/UGu3MM42BvzpdXtnAwyCXwrc2joSzV89i1zK1GG6t4RTdAMZ3nKZUUJjUUXHMva+z2QsnEA4KYesoBgF9J3ILQCY7Qi1BZItRHuXQnU2r+K+WVF7gvKTsA926AadSBGTw8Xvrq3z/97zD8Rt8xW/Eop/wLCkotGN2o8QV4EvY/MAV1jOCJjZEpxTepsR/YyNT2k0bVQpm5cqQJHKMt6sueLDuCPmOoXPV4zlM9ZA/ve9gyrOLi+miz+50I4vcr7sve05g5//CYhf2MtBBcFmbEicVi/qYn8K9v3nCjCbGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CISKX/vsBtaSMGSEH3TdGRMeox1hacdAqTYRSSciPQk=;
 b=SdCsta+YkP8LgwjKzkxbK+DgzV0Uaz1SGreuE6nlWfITQRq1vrEt4W1vOFloV9Z2HU57WTOs+bkcupLM6ukDTPJ8t4/6FDKzUwxCuhdgzhXo6HMWcsPgYx0kdmnbAUgSthB1IFac15YKoZrns6vFPoh9zAUkhgg3ePYwbdFkGHtasij6AiQYZuna4LGHzhizJoC5abwp5alvw0cYfKtq9XmQ9iO53FHHqwiGy6bJNSncecTc1OwGIoIA4rBao+sZ9YTjTH2iSjK986PeDb7E96pKHGzEZylEFrz+pwfH/KbArpFxjP2P875KkeRwiWOJr2rD25+FMXTeLppUcFPFiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CISKX/vsBtaSMGSEH3TdGRMeox1hacdAqTYRSSciPQk=;
 b=2xS85j2ZlPNMvt0LlFbKPW3lKbCOVn+keE8/P88qINT0S7a2JdFYHm4gXmchARmOQ/ooG9AHfm112x3VOUf3F5UJJ/T8qMnDbnq3AmAlaP6noYuOiOABPtLnedFKu5UE70HKRq0u5J0jiII3C6RRnxGFxsAltijcqNKWjfEAXsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU0PR08MB7389.eurprd08.prod.outlook.com (2603:10a6:10:32d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 09:41:45 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219%2]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 09:41:45 +0000
Message-ID: <2800aedf-db4a-2927-2011-e1124dc6e725@wolfvision.net>
Date: Thu, 19 Jan 2023 10:41:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/5] drm/rockchip: vop2: use symmetric function pair
 vop2_{create,destroy}_crtcs
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <202301010414.gzia8KzY-lkp@intel.com>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <202301010414.gzia8KzY-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P18901CA0015.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::25) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DU0PR08MB7389:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c7bdab-4e79-42b3-ef89-08dafa016109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C1pxWGFNetVJd2w0UGNa0fj7wnVjBQXRmd8n8FfCubPofCJ5L412wiesDo92c/QpILndUtqKUHtlZgw7LINvgHP4z7xEcWDammTzzqx1Dt0t1IlyalDs9ulX2wEUpwy4Mb0AafMFYTG+n0fXmD6odmVgRq9SWfCZsCKhke4D2+BMd1zCJGKLZpDltacam7oA+NXI5OiF0gggEhOsGKuMZur2+Bt85PhFi6QGXgqlqRCtof1v+XMZ85geG6iDmmkjfZ9z+mOOjhZ0B09/GjwjeRDc3GBeOecEC15qUZGszyJqTZXfDecX92vgac+KAqon3GTj1h8OGqk/84AWjPtqlNT+kcCUQCOVUtlVtcTWZC4msGt/uSEx+7XLMdre1CHA/bng5fUUf7qC+aCFga7i/yGfgcKwCx1GA6Xp64tub+AX+4MMnlW24xp87MSCLNXadRB+6l+S5PaDOVJa9pKAbFdNDTPehwAGn0fEWapj3fHUKa+x6YNs8DDgkQsj7jqxEMVdeAhOKHcwVf65hh1LJZxlRIVGpDWPGastICttvxGLowqdcWIBoBMDuoD0Sfb9h6GnWokCBWLUTm15n3BOd+8D45tRh3mLKHOnImAV/PZLOGvSZxyvfa70/NtVCnXg5vL5XNMFzRsuFskxjgxk6HFY2WpBkWNe0IO38Ir+8fp/DZYoE2YhqY5gKP8y85bOWS2Ie/FSbvn39aJtL1fZ6vxNXPb+SDNWhKoURuO8CWUJMr/OjKH6jdBakwyQsNpQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(136003)(39850400004)(346002)(396003)(451199015)(41300700001)(4326008)(31686004)(6666004)(8676002)(8936002)(66476007)(66556008)(66946007)(36756003)(4001150100001)(2616005)(2906002)(44832011)(5660300002)(7416002)(54906003)(316002)(966005)(6486002)(31696002)(86362001)(52116002)(186003)(6512007)(478600001)(53546011)(6506007)(83380400001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1Zma1MzR3JFTjVwWUZBdHdPMnphRkhBdEdURm1TWHZlNzJYWncyZUloczdT?=
 =?utf-8?B?MzRMd3FoeWdjWVkxN1kvTzdWZk9GVmVhRkFCVGR0b29nSEpCK01LbXRHbzF2?=
 =?utf-8?B?Vlo2a1I2VXpudUR3ZnFvVjErYUpMZ0kwNFVxWlRlQnBLdHBwU1lqaUZKUGJn?=
 =?utf-8?B?UkkyTGthcllPWGh5ZGNTc1Jabk5mcEdyRHowdmZ6VkRIZ0loTjkyVjF1RGdR?=
 =?utf-8?B?RUZEV1VsZkF6ZWdqaWNBNGZDaW13ZzhxSCtHKzRRMnpudG5NTThKdDRWQkZC?=
 =?utf-8?B?U0dRamx2RVp5ODlQT0FCeTlOVEM4KzBEQjgvU282QWNOLy9uSVZxL3JIcCtH?=
 =?utf-8?B?Q1U4MXU1NmJBcEoxYVFjSjFScnI4UFhYODFtSW10UExobUFrbkJURlRPOEFG?=
 =?utf-8?B?eG5uM2xLaEZmeE15OVdhN1UzUUNxNWNjM3B1ZGk4SXQrcUF1b3dJUDBtQjRN?=
 =?utf-8?B?Zm9naEF0bEo1R0pqZml4dy8zNFBEcGpndWhLMElMZWJUMnMvZkJPWTl0WGFz?=
 =?utf-8?B?a0pxeGRBUHdGcXlDOUYzK2tsU2JzU2xjKzliREtRR2RkdlVZN3lSaGZXMkl1?=
 =?utf-8?B?c0VSN0oyejhwWFd0MTkraS9XYnYvdTJTV09peXNUcC9mRUlmUnJjc1BtNmVK?=
 =?utf-8?B?TkFUcFdJdG5MYm5RWUZRM1VPelkrUFRMRnJvcGRUT25Za3pLRlgwL0xsQncr?=
 =?utf-8?B?dTBiLyt6WHhHenZsQTd5dUU3bXdXUjRLeWZpdU92UEV4UDA0MTZWOTlFUVZ0?=
 =?utf-8?B?SkRuL1p0Z3JINHVUam9RenZybmdQajBHd2pkZE81ZE1EQ3QyNGdUN0llUjJC?=
 =?utf-8?B?MTQrcXphQXI0YnFyaFYzcG56M211T2Q4WGNucytmc2hxaGNKZlAxUEowWGcy?=
 =?utf-8?B?SmpmYWFmYXp4MTYxY01hbUJ5RXRENjFCU2pKOFp2U1pwMDRMcDNZbGg5aGVE?=
 =?utf-8?B?MVhPRHZTUm9MQ2RsbE1VK3c0TzFDbzBKUVVBcXVqTUllNHRWL2ZDeWFoTE5L?=
 =?utf-8?B?d3h6L1NJejhkeVRuUkk2Z0FWSXNBa1QzY1pCK1JOYWlCbXExdTNWSjFMYzN6?=
 =?utf-8?B?TkZVWms0Wm9SZC9ldnBPUUJKSTRPaTNNc2pjajlsbERWcTlGUDg4emorZmg0?=
 =?utf-8?B?REJFeDhQWmNLeE8wOVFQY0VQblRaMFpkL2twZTZVMitnc1cxUmtBN2p1aG9N?=
 =?utf-8?B?WXNURmNna1M5WlEyN214S3o4Z1g0d0R1V0dwcnZ4cUR3Y2tlTDJJMGNQYzZj?=
 =?utf-8?B?ZlhEblNoK00wN3lMaTdOOG5Bb0dHWXJjdUVnL1U1d0Zxc2hlWm5WdzA1a0ps?=
 =?utf-8?B?VThMRU1HVEtpejdBTXJaTnRzeHdkWUFnR3dpNE9aTDEzZHhJMjFMdnkvR01l?=
 =?utf-8?B?R3NKRFlwdnJBYVhRZVRlQ2hpMmhtVDgzSkVQUXlpVElOemJlWjhXd0ppb29S?=
 =?utf-8?B?b2VaMklyUUNKdkZnTVB6ZUU0aExyQ3cwclNvQmZWWVRFbzBzejdFa2hPUzNz?=
 =?utf-8?B?V3A5aE1yNDN6Yk5qVzdMRUlRUWYvQ1hIUjc2RDhDeUo2ZFNrNUtFZTdRRHRT?=
 =?utf-8?B?b1dWM3UzREhkejlqNWtLNHYxSTlRSEJWL3NteXZlQTNxYy9EQnZsWnhNMTZP?=
 =?utf-8?B?Z0k2YzVsME4yMHhWL0Z3dWUvRnRKalZVTWFmbjFsWnNyTE5ZTWh4T3pDQXoy?=
 =?utf-8?B?TUZSbFZLNlF2YzU3ZDkwNy9DSnlrcmlkQ05KZHJxQ25CakF4ZTk5M1J1dE9B?=
 =?utf-8?B?UmZVQXBzY2t6a1NhMHhpaHNuc3Q4YTFRQmxRNGZZTUhic2NnWlYyWDB2VXZw?=
 =?utf-8?B?LzAzOURuOUd0TG96TWIrOVZibTduZDhnU05ENm5xV1R4d1RHV2RhTjhIWlFD?=
 =?utf-8?B?MUsxMHRZMlVtd3MwOUpGaTVDSU1Zb2RUTGxBaGltTm9PQkE1Zk9pU0cyRU81?=
 =?utf-8?B?bUJPY25haWtCcGtZbnRvK2pSNlBkb091NXR2VktGdXlRblNoTlNZTUR6aElD?=
 =?utf-8?B?K3VNcHpmanV4REdBR2lXYUlWU3Npa2h0YTV6dnlFNzhPQnV3SVJQNEh5OWlE?=
 =?utf-8?B?UGppNFVOQVNPTHN4czdBYkVoSEFIOFBjSDB2RU9ROWpYRnBjY0pZdklnQmNF?=
 =?utf-8?B?dVNUNHNtRjRSZkZoTjRWcEdwMkRjUzFuVmhicWpQRkFRYVZmam9OcnA0UUxj?=
 =?utf-8?B?S3h4M05IaEU0U1ErLzhRSWdyRnJkM0lvYllBMU9naGUySm5Cc0hvcnVmZGdk?=
 =?utf-8?B?YlQ0T1dTVVdmdG1qRmFFOXB4Yk1nPT0=?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c7bdab-4e79-42b3-ef89-08dafa016109
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 09:41:45.7080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4L8dt9TjJmIdsi2/4mFZG/NpYgd+APePC5wvXzEAlqUUIJsLSp3H2l5fV5I5lUjPXCdpwU01OYTtUk5nuLlhrnOi/GtFUccWNTNje+rGW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7389
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
Cc: Sandy Huang <hjc@rock-chips.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, oe-kbuild-all@lists.linux.dev,
 Sascha Hauer <sha@pengutronix.de>, lkp@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

On 1/3/23 09:07, Dan Carpenter wrote:
> Hi Michael,
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Riesch/drm-rockchip-vop2-add-support-for-the-rgb-output-block/20221130-220346
> base:   b7b275e60bcd5f89771e865a8239325f86d9927d
> patch link:    https://lore.kernel.org/r/20221130140217.3196414-4-michael.riesch%40wolfvision.net
> patch subject: [PATCH 3/5] drm/rockchip: vop2: use symmetric function pair vop2_{create,destroy}_crtcs
> config: parisc-randconfig-m031-20221225
> compiler: hppa-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>

Thanks for the report.

> New smatch warnings:
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2330 vop2_create_crtcs() error: uninitialized symbol 'possible_crtcs'.
> 
> vim +/possible_crtcs +2330 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> 
> fb83276e59f2d6 Michael Riesch 2022-11-30  2249  static int vop2_create_crtcs(struct vop2 *vop2)
> 604be85547ce4d Andy Yan       2022-04-22  2250  {
> 604be85547ce4d Andy Yan       2022-04-22  2251  	const struct vop2_data *vop2_data = vop2->data;
> 604be85547ce4d Andy Yan       2022-04-22  2252  	struct drm_device *drm = vop2->drm;
> 604be85547ce4d Andy Yan       2022-04-22  2253  	struct device *dev = vop2->dev;
> 604be85547ce4d Andy Yan       2022-04-22  2254  	struct drm_plane *plane;
> 604be85547ce4d Andy Yan       2022-04-22  2255  	struct device_node *port;
> 604be85547ce4d Andy Yan       2022-04-22  2256  	struct vop2_video_port *vp;
> 604be85547ce4d Andy Yan       2022-04-22  2257  	int i, nvp, nvps = 0;
> 604be85547ce4d Andy Yan       2022-04-22  2258  	int ret;
> 604be85547ce4d Andy Yan       2022-04-22  2259  
> 604be85547ce4d Andy Yan       2022-04-22  2260  	for (i = 0; i < vop2_data->nr_vps; i++) {
> 604be85547ce4d Andy Yan       2022-04-22  2261  		const struct vop2_video_port_data *vp_data;
> 604be85547ce4d Andy Yan       2022-04-22  2262  		struct device_node *np;
> 604be85547ce4d Andy Yan       2022-04-22  2263  		char dclk_name[9];
> 604be85547ce4d Andy Yan       2022-04-22  2264  
> 604be85547ce4d Andy Yan       2022-04-22  2265  		vp_data = &vop2_data->vp[i];
> 604be85547ce4d Andy Yan       2022-04-22  2266  		vp = &vop2->vps[i];
> 604be85547ce4d Andy Yan       2022-04-22  2267  		vp->vop2 = vop2;
> 604be85547ce4d Andy Yan       2022-04-22  2268  		vp->id = vp_data->id;
> 604be85547ce4d Andy Yan       2022-04-22  2269  		vp->regs = vp_data->regs;
> 604be85547ce4d Andy Yan       2022-04-22  2270  		vp->data = vp_data;
> 604be85547ce4d Andy Yan       2022-04-22  2271  
> 604be85547ce4d Andy Yan       2022-04-22  2272  		snprintf(dclk_name, sizeof(dclk_name), "dclk_vp%d", vp->id);
> 604be85547ce4d Andy Yan       2022-04-22  2273  		vp->dclk = devm_clk_get(vop2->dev, dclk_name);
> 604be85547ce4d Andy Yan       2022-04-22  2274  		if (IS_ERR(vp->dclk)) {
> 604be85547ce4d Andy Yan       2022-04-22  2275  			drm_err(vop2->drm, "failed to get %s\n", dclk_name);
> 604be85547ce4d Andy Yan       2022-04-22  2276  			return PTR_ERR(vp->dclk);
> 604be85547ce4d Andy Yan       2022-04-22  2277  		}
> 604be85547ce4d Andy Yan       2022-04-22  2278  
> 604be85547ce4d Andy Yan       2022-04-22  2279  		np = of_graph_get_remote_node(dev->of_node, i, -1);
> 604be85547ce4d Andy Yan       2022-04-22  2280  		if (!np) {
> 604be85547ce4d Andy Yan       2022-04-22  2281  			drm_dbg(vop2->drm, "%s: No remote for vp%d\n", __func__, i);
> 604be85547ce4d Andy Yan       2022-04-22  2282  			continue;
> 604be85547ce4d Andy Yan       2022-04-22  2283  		}
> 604be85547ce4d Andy Yan       2022-04-22  2284  		of_node_put(np);
> 604be85547ce4d Andy Yan       2022-04-22  2285  
> 604be85547ce4d Andy Yan       2022-04-22  2286  		port = of_graph_get_port_by_id(dev->of_node, i);
> 604be85547ce4d Andy Yan       2022-04-22  2287  		if (!port) {
> 604be85547ce4d Andy Yan       2022-04-22  2288  			drm_err(vop2->drm, "no port node found for video_port%d\n", i);
> 604be85547ce4d Andy Yan       2022-04-22  2289  			return -ENOENT;
> 604be85547ce4d Andy Yan       2022-04-22  2290  		}
> 604be85547ce4d Andy Yan       2022-04-22  2291  
> 604be85547ce4d Andy Yan       2022-04-22  2292  		vp->crtc.port = port;
> 604be85547ce4d Andy Yan       2022-04-22  2293  		nvps++;
> 604be85547ce4d Andy Yan       2022-04-22  2294  	}
> 604be85547ce4d Andy Yan       2022-04-22  2295  
> 604be85547ce4d Andy Yan       2022-04-22  2296  	nvp = 0;
> 604be85547ce4d Andy Yan       2022-04-22  2297  	for (i = 0; i < vop2->registered_num_wins; i++) {
> 604be85547ce4d Andy Yan       2022-04-22  2298  		struct vop2_win *win = &vop2->win[i];
> 604be85547ce4d Andy Yan       2022-04-22  2299  		u32 possible_crtcs;
> 604be85547ce4d Andy Yan       2022-04-22  2300  
> 604be85547ce4d Andy Yan       2022-04-22  2301  		if (vop2->data->soc_id == 3566) {
> 604be85547ce4d Andy Yan       2022-04-22  2302  			/*
> 604be85547ce4d Andy Yan       2022-04-22  2303  			 * On RK3566 these windows don't have an independent
> 604be85547ce4d Andy Yan       2022-04-22  2304  			 * framebuffer. They share the framebuffer with smart0,
> 604be85547ce4d Andy Yan       2022-04-22  2305  			 * esmart0 and cluster0 respectively.
> 604be85547ce4d Andy Yan       2022-04-22  2306  			 */
> 604be85547ce4d Andy Yan       2022-04-22  2307  			switch (win->data->phys_id) {
> 604be85547ce4d Andy Yan       2022-04-22  2308  			case ROCKCHIP_VOP2_SMART1:
> 604be85547ce4d Andy Yan       2022-04-22  2309  			case ROCKCHIP_VOP2_ESMART1:
> 604be85547ce4d Andy Yan       2022-04-22  2310  			case ROCKCHIP_VOP2_CLUSTER1:
> 604be85547ce4d Andy Yan       2022-04-22  2311  				continue;
> 604be85547ce4d Andy Yan       2022-04-22  2312  			}
> 604be85547ce4d Andy Yan       2022-04-22  2313  		}
> 604be85547ce4d Andy Yan       2022-04-22  2314  
> 604be85547ce4d Andy Yan       2022-04-22  2315  		if (win->type == DRM_PLANE_TYPE_PRIMARY) {
> 604be85547ce4d Andy Yan       2022-04-22  2316  			vp = find_vp_without_primary(vop2);
> 604be85547ce4d Andy Yan       2022-04-22  2317  			if (vp) {
> 604be85547ce4d Andy Yan       2022-04-22  2318  				possible_crtcs = BIT(nvp);
> 604be85547ce4d Andy Yan       2022-04-22  2319  				vp->primary_plane = win;
> 604be85547ce4d Andy Yan       2022-04-22  2320  				nvp++;
> 604be85547ce4d Andy Yan       2022-04-22  2321  			} else {
> 604be85547ce4d Andy Yan       2022-04-22  2322  				/* change the unused primary window to overlay window */
> 604be85547ce4d Andy Yan       2022-04-22  2323  				win->type = DRM_PLANE_TYPE_OVERLAY;
> 604be85547ce4d Andy Yan       2022-04-22  2324  			}
> 604be85547ce4d Andy Yan       2022-04-22  2325  		}
> 604be85547ce4d Andy Yan       2022-04-22  2326  
> 604be85547ce4d Andy Yan       2022-04-22  2327  		if (win->type == DRM_PLANE_TYPE_OVERLAY)
> 604be85547ce4d Andy Yan       2022-04-22  2328  			possible_crtcs = (1 << nvps) - 1;
> 
> What about if win->type is not equal to either DRM_PLANE_TYPE_PRIMARY or
> DRM_PLANE_TYPE_OVERLAY?  That's what the checker is worried about.

If I am not mistaken this issue is present in mainline and my series
does neither introduce nor fix it. I can add a patch that sorts the
issue out to the v2 of my series, though.

As of now the driver only supports PRIMARY and OVERLAY planes, therefore
the current state is safe to use. But maybe CURSOR planes are supported
in the future.

Rewriting the two if's into a if/else structure and setting the
possible_crtcs variable to zero in the else case should do the trick. If
there aren't any objections to that approach, I'll spin a patch.

Best regards,
Michael

> 
> 604be85547ce4d Andy Yan       2022-04-22  2329  
> 604be85547ce4d Andy Yan       2022-04-22 @2330  		ret = vop2_plane_init(vop2, win, possible_crtcs);
>                                                                                                  ^^^^^^^^^^^^^^
> 
> 604be85547ce4d Andy Yan       2022-04-22  2331  		if (ret) {
> 604be85547ce4d Andy Yan       2022-04-22  2332  			drm_err(vop2->drm, "failed to init plane %s: %d\n",
> 604be85547ce4d Andy Yan       2022-04-22  2333  				win->data->name, ret);
> 604be85547ce4d Andy Yan       2022-04-22  2334  			return ret;
> 604be85547ce4d Andy Yan       2022-04-22  2335  		}
> 604be85547ce4d Andy Yan       2022-04-22  2336  	}
> 604be85547ce4d Andy Yan       2022-04-22  2337  
> 604be85547ce4d Andy Yan       2022-04-22  2338  	for (i = 0; i < vop2_data->nr_vps; i++) {
> 
