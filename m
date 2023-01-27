Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1504A67E0D2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 10:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BD210E435;
	Fri, 27 Jan 2023 09:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C644710E435
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 09:53:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jl9zd5ie7FEb5C3cwyw3djdtT7qIHghEW07ylQYUvx5nUbys7cR33uYUeDcu6rqrHX4JilvN3DygIVSHRXVLavCxFisAwimKYixc8tYQwlOwHWv2C5MnpVijoOga1SyKB1sQr5K/Kh6xwDFUu0QDjOlOrTgFrruvn1t5WQ3rjoTTQXEqkvKI3xRZ55grVOa0Emxsfg50T4p7DqMnOUSizf+4vS9WjPCRjH7DU1dtfPnpYHfduQOgjw2vwg01xYeBmfV/SDCCEn83QIQIIqE8rSL/49jOsApfkaw5fnpPcdmU/1HIj+TG/NzmoIQoPTV/Db1x2PW1hziPZHyKLAxhfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyHLbzgQc8XxjlvpxNGxEzxGGTcJNko+6vmj2frMFgE=;
 b=FPdkqavmo3pouqijOYS6Tay7BAeMaLiVM8sSD2RuFSBIGNqzo7z+sGc00XABX2tOE34WypP3H6FB5omfrsz3chRi2+/G15o/4e6HHqnDm/7ZBD3kjWi///NIhuObFww9ssNb3ZaE/GbH9NtK3yX+1G82hF5eSyv3aqoIoebiPlOkPGbyyABm3U8FY2QRkk5XjGaxuRa6+tcNp801c+b3mFeQY5yQBXN94tplUD/Oh1sBamkNdjq4eRu4xSRw2FCCu2X5UuM6Bs9KF5/dPkONcpAD59tDQAc386tWDdMoodIpLMHMOcfMAy8PZNVdMM77ru8jOIRFysuKNAs6D/WhjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyHLbzgQc8XxjlvpxNGxEzxGGTcJNko+6vmj2frMFgE=;
 b=sxn4ZQn9puF3cQXEzlHcVM8SYQ0H1HV9kd/H/9xKiQxArVXwBu7qA+yWSbEgY6NYySI9ZeGVXRd7cTHrZePOM9CESRctRk8KxH7lDZiOSbvCTOVxFq0y10KIq7wtfmPs7Ro/lePODfRGlfWUt2c+49MZoRppixjtlzNCOqwfiOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS2PR08MB8405.eurprd08.prod.outlook.com (2603:10a6:20b:558::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17; Fri, 27 Jan
 2023 09:53:30 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219%2]) with mapi id 15.20.6043.023; Fri, 27 Jan 2023
 09:53:30 +0000
Message-ID: <55af4c7a-b56f-73ae-3bab-537785d5d218@wolfvision.net>
Date: Fri, 27 Jan 2023 10:53:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 5/6] drm/rockchip: vop2: add support for the rgb output
 block
Content-Language: en-US
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230124054706.3921383-1-michael.riesch@wolfvision.net>
 <20230124054706.3921383-6-michael.riesch@wolfvision.net>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20230124054706.3921383-6-michael.riesch@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR2P278CA0052.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::16) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS2PR08MB8405:EE_
X-MS-Office365-Filtering-Correlation-Id: c55a0e56-0b9f-4289-ba5a-08db004c5842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zQSsn3RnF2HwTI/kXepHo3LZitrhWZoglCSweHAaXoJVg43fAMRC+79/CQiPJxaS2Zuh/QdtNSTse5DxoxtfJU4L4APeEBg16hRR2SN/8UNj1myDhF7Y3CBTsNNGJokdyxw2zLYXib+ZPmGdUS4axdqdGcIxYlwOTcD9Qv+NqFPoL0XSm/mc66WaPLr+W0VUqib/YfKr6hjM22JpbocD9MlN8OwxfhcrSvmsyfwggAEVVmcoxFKOGqdssULma6/RR+CZePykeU0Y4JdUuma+aa61T+YfcjKKIxYEg3UR72Pym53PqOdmX6jB7si3Xff7a/s+PSjZEdyJpQAtprdpmEMRN9QUA7TRiPdl+kcreLfMA1Se3QlIJtkny2TR82drkvAm/exYwMIobPomZ72v7vkedJoIUGm+W+YSK9cp3d29gmebkXucHhJ0Z5kVo7RZv3Ta5BY3oIwhRYKzR+lgWG1bAdH6jr9clNp91KxT5i4S9L1tj6B/BfIgR1AoLLvGEuDwfjfRIWP0butUipI/hiCHMUHKCBKNn+f9sKnygbRnBj1ZypDtRHPQMGnNoNdM9A8VyR1kXYLUV18RIEc59+SOSlJ7/j7m7qABsK0+p3Xd7IuSkPA5FnDK0E4ntTswJ/WdxmNkGyTjapXIxra1Z97i1Zka0wjiSen4X5X9P3r+9KwaHEkq/XnM1ozUuGIWGzFut+YPA7jXD6du+OI2U+LwZzcoHzvtHg9KXeMdV44=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(346002)(39850400004)(376002)(136003)(451199018)(6666004)(44832011)(6486002)(53546011)(6506007)(36756003)(4326008)(66476007)(66946007)(8676002)(31696002)(186003)(7416002)(66556008)(52116002)(86362001)(38100700002)(5660300002)(54906003)(8936002)(316002)(2616005)(31686004)(2906002)(83380400001)(478600001)(41300700001)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEEwTUluQTFVUWtRejJPWEtJZjhEUFhaTGE2M1hvVlAyODJvL1BoalJTZjZS?=
 =?utf-8?B?ZnpaU3VtR1JsMGo1OVBxMnZvamorWUF0aXJFbWc4Yys3YTR3UWVhYXNOOXkr?=
 =?utf-8?B?TGxxM1pVS01sbDExVHVXNlZDUTFGcmFISlpTVDZlTXhDelhKbjRIMGdEYytt?=
 =?utf-8?B?ZnBFWThGRjBUbTFVMlFxOVlDVGJJbWUyKzR2Vnd6RlJpZGlLNy9Wd1pmNEJR?=
 =?utf-8?B?K0cyay8ra04xcEwzTjhXWTYxbXBLS1hNZm5URllKL2ZQRzVkM2dZcGpId1Fi?=
 =?utf-8?B?UGFERzVyMkhkY0V4MmlHdjNpSjBSWHVJbjA3N1BSN21vZ1hCcisxRXliTVpM?=
 =?utf-8?B?bSs0c3JxQVdQbk5wQmN1blB1R292UjZwK0JwSVdDY3lDQWdONzBLSnh2bHNl?=
 =?utf-8?B?dERLR05VV1l0SnBvMUx2dmhwTGVXMHVTK3RjNlZEOE9waGxad3liYVBiMk85?=
 =?utf-8?B?QjBWRGQvaE9yaFBsSnlTS0FVa28wTm5hRkUwa09NNWpQY3R2angxUW41VTda?=
 =?utf-8?B?WGhEb1habFM2RHJoUGJGNzMyWjYzeEJpRjhRS2M3MTk2cTNVZWQ3WTdMQ0pn?=
 =?utf-8?B?b1dmY0VadjBjbHh6bDNXbW5ycjNvRDllenhidTBkenI0QVdDQlRZUVlHemlC?=
 =?utf-8?B?U0xsOWlyTUthTjlOSkZXVEQ1amRQYjZSTmdzL01RSjVncXlvcUxtUnRkWE1S?=
 =?utf-8?B?UGpOL3JlamdyRjcrS05mVGxOeFR5anNmc0xXOGhYNkl4cHFGazhLb2xKT1hZ?=
 =?utf-8?B?STd2ZC9vQVJIUlhzMXV0OVE0V2s1b0ZpelFZTFhnMWwzRjUwZyt4RjZobTFl?=
 =?utf-8?B?NlZvZjY1dHV5MjA0K2VZa3I5V2ZVN2lUTGNnRmZEdWhiRno3MFZhMStrdVQv?=
 =?utf-8?B?ditKRU9WcXhobWplTHZHMFFwZmhkTktLTUdtY3dYRjZVYmZRR3hnMmFEVWhC?=
 =?utf-8?B?a3lQak8wYis1MHAxK1laVVc3R091aFo2MTA0a1N6Q2RXTWY0dkFDOFJDUDYw?=
 =?utf-8?B?L2N5QUFwdktPdDE2dzR6SzUxV2JDMmNWZE52aVpDMjdveUNJSnlVeTMrRklI?=
 =?utf-8?B?blJMVFR1cFExVGdmSUlVQ3FQWldhNUZwblprd0ZWMlpVbEVTRXplaUk3a0JT?=
 =?utf-8?B?QkQyUWhnbmhOUGpzQnFCUWREdVRWNTdRNFZUa2dyeE1QaEcyQldiTml3K3Bh?=
 =?utf-8?B?bXJZbncrR0pKb0NPZ0p1THgwREw5NFk5RzAvMmRHVXZrWE1WY0JrZWI2MGg4?=
 =?utf-8?B?R2hmVVd3UGx4TlRBYTNqcFNoSkJ6ZllJK01tWVZqeXREUlBwU2pNUjJDeEVt?=
 =?utf-8?B?eGQraG4zQVdWQzYrdGJESVQ2UUs4Zm9rMlpybjU5V1FrSVVZUWtVdXRaUjJG?=
 =?utf-8?B?SVZYSEd2ZW1Bb0hIQUZOeGJqS0hSRDlzZm95R2xGWTNxQkhERXREU0s5QnRS?=
 =?utf-8?B?RXVjREZ6VjgzdkFaY3hpSzhtOERIM0JXUEVCdXVTTHpaSS9hOTh4QlRLbjF6?=
 =?utf-8?B?UXU0SmdjYVhvSWYveFYydDJUczZaeGxDRGNtZDdCMW9NeVYvb1lVN0RmSUx6?=
 =?utf-8?B?c2h4dEVHcnlUT1pOUTRmUG9lTkF3ajVVTFQ5clg1a0dkcUx2UTZNZlVJdnBP?=
 =?utf-8?B?ZDBlV29SV0NuYkpmTHE0UHhaVVBpL0kzZGZyY09XR3FMUTlZSFV0N0g1WFk3?=
 =?utf-8?B?RGs4Q2t5UXRVNkNOb01ZcGhlWUtvQ3QvVUd4eE5sbjlpaTNTdllLbEJTZVRN?=
 =?utf-8?B?Rzl6emxVMThVRHdYZ3NrZGxpanhWQ3VPOWtZemE3N0J6blhWSzgvUkZFVnkz?=
 =?utf-8?B?VWpqWHBZNFRtcXAyQ29aUlZOdUJJcHRpK3dvRmNsK2NaN2pXcSszS0RBS2dP?=
 =?utf-8?B?WTA4aU81cnR4UDVhT3N2QUh5S0d4V29JZlF0QmtmcVNXeUp6aTlxb1dGRXk2?=
 =?utf-8?B?SG1xbHA4TUNQSVU1OG16KzEzOVdFcXJiYTRTMnhYcURIUFlOQjJhTTc5QzAw?=
 =?utf-8?B?aUxza05Hcmp1ZkxsNDFwWG85c0tuOGdEUlNyWmVRaFJkaGk0YlNkQXZZWWZv?=
 =?utf-8?B?blkyTXBtNUpoaktlb29WejNqa3UxS1R0ck1PN3RNWWlmMXk1V3BLVE8zTitI?=
 =?utf-8?B?VzFIQTJjKzAwOVJuMlBMei9kVng5bGg5bEkvWVZHOHRJd2pFYkpjTGZiNjlK?=
 =?utf-8?B?d056akJjN05Nays2QlNXMVU5UHdSNE9NWG5wciszNGJsZGIwNjZyNEhvTlBm?=
 =?utf-8?Q?wP7AbmPPlk4V3K44+Q6v+6zPc9PhIIjwjW++a3NhaI=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c55a0e56-0b9f-4289-ba5a-08db004c5842
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 09:53:30.2589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AW7n/2/UJrHBbItKugJKltYBnjY96cb13ZFq/pda3yLONZ4RYBMjYgJ2k7NI/Hstgiyc3A/QUzXTyaNB9dgkU1Phrdu2TiUNAqeS/bDqews=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8405
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <sha@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/23 06:47, Michael Riesch wrote:
> The Rockchip VOP2 features an internal RGB output block, which can be
> attached any video port of the VOP2. Add support for this output block.

s/attached any/attached to any/ of course. Can this be fixed when the
patch is applied?

Michael

> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
> v3:
>  - fix commit messages (still assumed video port 2)
>  - fix condition to make 0 a valid video port
> v2:
>  - move away from wrong assumption that the RGB block is always
>    connected to video port 2 -> check devicetree to find RGB block
> 
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 44 ++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 06fcdfa7b885..f38ffd0ccd9f 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -39,6 +39,7 @@
>  #include "rockchip_drm_gem.h"
>  #include "rockchip_drm_fb.h"
>  #include "rockchip_drm_vop2.h"
> +#include "rockchip_rgb.h"
>  
>  /*
>   * VOP2 architecture
> @@ -212,6 +213,9 @@ struct vop2 {
>  	struct clk *hclk;
>  	struct clk *aclk;
>  
> +	/* optional internal rgb encoder */
> +	struct rockchip_rgb *rgb;
> +
>  	/* must be put at the end of the struct */
>  	struct vop2_win win[];
>  };
> @@ -2393,6 +2397,25 @@ static void vop2_destroy_crtcs(struct vop2 *vop2)
>  	}
>  }
>  
> +static int vop2_find_rgb_encoder(struct vop2 *vop2)
> +{
> +	struct device_node *node = vop2->dev->of_node;
> +	struct device_node *endpoint;
> +	int i;
> +
> +	for (i = 0; i < vop2->data->nr_vps; i++) {
> +		endpoint = of_graph_get_endpoint_by_regs(node, i,
> +							 ROCKCHIP_VOP2_EP_RGB0);
> +		if (!endpoint)
> +			continue;
> +
> +		of_node_put(endpoint);
> +		return i;
> +	}
> +
> +	return -ENOENT;
> +}
> +
>  static struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
>  	[VOP2_WIN_ENABLE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 0, 0),
>  	[VOP2_WIN_FORMAT] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 1, 5),
> @@ -2698,11 +2721,29 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
>  	if (ret)
>  		return ret;
>  
> +	ret = vop2_find_rgb_encoder(vop2);
> +	if (ret >= 0) {
> +		vop2->rgb = rockchip_rgb_init(dev, &vop2->vps[ret].crtc,
> +					      vop2->drm, ret);
> +		if (IS_ERR(vop2->rgb)) {
> +			if (PTR_ERR(vop2->rgb) == -EPROBE_DEFER) {
> +				ret = PTR_ERR(vop2->rgb);
> +				goto err_crtcs;
> +			}
> +			vop2->rgb = NULL;
> +		}
> +	}
> +
>  	rockchip_drm_dma_init_device(vop2->drm, vop2->dev);
>  
>  	pm_runtime_enable(&pdev->dev);
>  
>  	return 0;
> +
> +err_crtcs:
> +	vop2_destroy_crtcs(vop2);
> +
> +	return ret;
>  }
>  
>  static void vop2_unbind(struct device *dev, struct device *master, void *data)
> @@ -2711,6 +2752,9 @@ static void vop2_unbind(struct device *dev, struct device *master, void *data)
>  
>  	pm_runtime_disable(dev);
>  
> +	if (vop2->rgb)
> +		rockchip_rgb_fini(vop2->rgb);
> +
>  	vop2_destroy_crtcs(vop2);
>  }
>  
