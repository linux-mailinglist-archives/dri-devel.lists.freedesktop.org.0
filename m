Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A953949E46A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B829B10F072;
	Thu, 27 Jan 2022 14:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20081.outbound.protection.outlook.com [40.107.2.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD49910F070
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 14:16:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gow80xqdq7KapSfVvK6/A5QAE8pY6hM4oZ8wEj+iimbDONGsYy1hswTYt4ZPOTSzEgMsRQvpVFNGmt/rHNbWYQyam2ufQGTrbJp7MJXCTDb1k0DjYyedjhe0TGaPThv4wWjMLwCkxrbMrK1f92CmnBOuYq+zbwwKDPbBY8QKX6MKeatTZ3u8tazBTN95ZOKkfW/G+OTEE74B5+jGaDS2u0zu8i7yWjIkKC9yG5kVDSG4mUC+xr6Q3OxHfN3ryxuvN2am8/VWiqomlyyGnoEZ3DpzYSAJ+QEOBGJw9ybtyfZaJArKnH4ONg46eaGVr4iBBWuK1Qao/OHNvVYjjVAjNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oB74yXfDIeGcK8yzn1eMZjHkfXzaaAs8xa26bHOZTb8=;
 b=aCvVASbhAm1il+LULk3JxjGjpyB2Zynr+KDDngpaRZF6B4lGuT/G8T0D1K++E5HcS5256BabqSK8wK8XlZmP/t2KHmFYbmRHYrER7WjZCMxiWyKLwMtd5tnh0tBkyp19OkI5T6yZxvijkSMqwyapH6w9L1QOgn8TX2iuKC6P+NPdOxo55FT1UGd1V5FuMGxcQIZML5okeV9Vn18Ghb3m8JrcLqSSXj0cE8G+lFvA//cUGn+RJ79ifwWOA+0m72wOpusXcOB/6Ra7Puu61X5NEmkL9mi213WCbjfIVkf5AndK65fpenHFyXZ83p+JgMSBvNmf243xWzvnTqJixTKNWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oB74yXfDIeGcK8yzn1eMZjHkfXzaaAs8xa26bHOZTb8=;
 b=nFJBUY2IrDZHEU7viByXIQWMLTfhq3GLvyPCIK1lSbfveXujOpJjsgWLi/m9+xi4S2DzPwLRaQshSumri2T8xyOON3qViDpnY51z0qkV4OpOM0Hwj3HuuquP5Maov00s2uK1o/pt+qyJhxcImJbs+fRMQDgwE2UA0vy57e+JGVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com (2603:10a6:3:e1::23)
 by VI1PR08MB5391.eurprd08.prod.outlook.com (2603:10a6:803:138::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 14:16:25 +0000
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56]) by HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56%3]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 14:16:25 +0000
Message-ID: <d0a0ddcd-43d0-fd48-7c9d-c4232b818212@wolfvision.net>
Date: Thu, 27 Jan 2022 15:16:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 00/27] drm/rockchip: RK356x VOP2 support
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20220126145549.617165-1-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0071.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::22) To HE1PR0802MB2426.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a50c0bbe-26f7-4209-5d2b-08d9e19f99e6
X-MS-TrafficTypeDiagnostic: VI1PR08MB5391:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB5391C4773E6952A62C854B73F2219@VI1PR08MB5391.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p6aLt6XhVS5VCZ3gsZSZP3F+8ielFa2dSnlw8Nee3Hj1tF1/Kn3+kcFgat011SUkrR2sjkESylRSaUIdhgzCJn2/gGpTFS6sVqFtaQbXCa5wPPNytKz514z2iEP5nCV9u/nKAB8lHFtHEuM0dOJ/YZ7FgLgcpUipeE0sXgPmbAuch8OWAsEgD23eoDTtToXZIvVyA7ouDpiDr2X4OycHG5DijFjtkPpFTLSL4DASVNtZp7KZX/O+gJdbqz2Oyoawbm48vYXF/g6iiQBlLblJtGYBiUh96SmmgV+jBRX4FUYfRhyjNqTmTlM6BpATg0H+7hHXTOgOmUPcL+Ci1HSe9L2KEAfi/ktydWj4fxh9BDw9gScKg+5MB3r1OjxTqtkclc+Au+3gKqsCopoJBDwRv0+ixKabei4E2HJClbo3TLD67zeAodYFqCPXJwwKv+Q8ivk8i6epc5EmSU+RQxJugku5GWSNKEv7BkHsPqIAZd8qGTMXrlOQI537OJgrtpN7qzGvxziLoGycEX+r39+tykYK/jTalU0Lw03up/+y/mJC8NApvt10q42og9rGsE7ZZr0V7F/FXMul0mClajcT/l52Jik89s9uTcsFOdH3h0NIvkPOL37tOzMUCCJ1dVBMuA9o4R0CrQo6OvhZBGv0lstDDlL6UJlEV5gkUtZ/aWJjFPQc/MdBnoIAeiabh4hXxC+Jd0nIzFVJJyO1OJS5xcbU37Eydq12Wj/NW78vZ/Mt/gC4l5564j1Xvy7tcaEp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0802MB2426.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(36756003)(5660300002)(7416002)(44832011)(508600001)(31686004)(6512007)(2906002)(66946007)(66556008)(38100700002)(52116002)(86362001)(31696002)(316002)(54906003)(66476007)(83380400001)(4326008)(8676002)(6666004)(8936002)(2616005)(186003)(53546011)(6506007)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnVEWVBWMUMyV0hJdld4NnJEQlBMRlFnaHJsRlJ0aG5uVnZ2TjA2R2hkMy9r?=
 =?utf-8?B?ZG94MEZjZHl5OTFtbUp6K05DRjhOV0xTdmtCVEtPQW40UUsrbVpQVUV1T3dq?=
 =?utf-8?B?NkFQL085ZU5xcEpRQkpHTGVTQWIzV3FweDZZcjFCREpyckd2MzVvQW95SE9B?=
 =?utf-8?B?ejd3TVRwOXBadmMxUS9yaWI3alBRajNtZ0dwQk5IZnU3bzlxUHY1MTlLalZt?=
 =?utf-8?B?eGhNTHk3eGNkZ3cwZTNUczR6Y0lhLzMrWTQzaW94Q0YyeitMWWlZYTdhSG1F?=
 =?utf-8?B?cVB4OUtxTFlkR0FKWnZFclRVYWE1WXYrc2RuYUFHREUreUN1dWJEeWc5VVpB?=
 =?utf-8?B?ZVB0Lzc1ZWhBeitVWHM4czJETXYvSXNvRi9NRG9IVUtRL1ZJTWRXOWpaMGJh?=
 =?utf-8?B?OVdhakhuR29mYS84TVhpZUZrNW9HZ3hWc3RBT2U3TnQwd1hmbGNGY3kvZHBj?=
 =?utf-8?B?eFBXNHJVUE9BbXRPWmtpUUlMbTl1c0E2eXBoNXRhZjh5OGtNVWlLQTZBVUVy?=
 =?utf-8?B?V2ViYnFLVG5zVERzRFZ4bEJFWVV1bmNTZFMzY0VtS25kaENIZ0FLbXlQblNY?=
 =?utf-8?B?K08xRWlVYXhqNjBCUWR5RURteUwxMW1wZkFPVk95VEk3TkRRc0QyMnpqanN1?=
 =?utf-8?B?TUtkYW5BaUtaMGwwdTI2KzRqa0dxTzZwZWFpOUZ2cTkzOHNRRjNRRXFSZFFQ?=
 =?utf-8?B?UEZmS0kvK0w0VUZ3aFZNanFqMDkzQjNnK29DTnlKdlhkUE5UQnhrbXNuUkNW?=
 =?utf-8?B?L1dWSTBUMHNlbjlib3h4S2Y4amkxLytQWG5GSm5Rdk5SNXBtMXFxT1ZKcy9o?=
 =?utf-8?B?TkNXRGZobDdnaFpJL3ZGbGR5WXdSLyt5WXJCdW8vVTh5Z0FZaGFSZ3BJang2?=
 =?utf-8?B?SWpQdDcvOU8vd1FyN0pwaHJKS000NTZTSXVEbVNFemg0NURBb2hFSHlWZGdZ?=
 =?utf-8?B?dDkvSkZBYUg1ekxQelhZSGVoZG9OTVFsbUdHb21TUzBiQkpZNGlWUG1rR0I0?=
 =?utf-8?B?UHRaQlJOQ3h5dXEwOVA2NEpXRUJIMGdJdWhodmtvZUpaY0txR3lCZWxKSHBS?=
 =?utf-8?B?UG5WSzZFZ1J5akNlbkJidzN4ditLbW5PODFwMGxrSjVpUzV3QUN4cXoveStD?=
 =?utf-8?B?ejhLT011OHFONlcrd1QweWFQWGZBM2Y2VFc5TEwrOHVhWVBzMU40aGgydE1X?=
 =?utf-8?B?L3gvYU5xQmZzbzl1TFAzUmlRQ3RnT2FyNWhkdlIyMmFCM0pmclNrckNGZnlO?=
 =?utf-8?B?OFJxYVZrNU9lRTNZWW13Rmh3eDFUZSs5TkJyM0NLNXBkcmJKdloyNkhxTEpr?=
 =?utf-8?B?L3NibDZ1akd5UlhuTldGUVhtUGN2eVVQY0JwVFF0amJxdFZ6WFRDb3grRDFS?=
 =?utf-8?B?Q0xtdERzSTNHVmlsaEhYYlhTbEZ2RDhyckVzVWFkUTdpUU1HUzcwZkdUaXE3?=
 =?utf-8?B?UUpjNEwyNGVYOEFlMjRRQ2FwMk5tUngyc0tDU1FvR05Va1BRaVlaQ3RzcElS?=
 =?utf-8?B?QWdjUWxwNHB4QTBOWWwxSUo1amRwclc4UVlmOUZuWTRKSC9USEYxSFRLYnpZ?=
 =?utf-8?B?TnJwbVkzRmpGSSszbHo5K0V1aEt5R1BhQkZ5d1p0QndNZHArYklONW9yMGJ4?=
 =?utf-8?B?QjQxaW9kQUxScngzMzJmODdIOXc5NmpQcGJsb0NWS1JzbzRUM1N4czF4M1Fl?=
 =?utf-8?B?ZlhjdkZRR1pnYW1BMXpPV2w4NDhqZjVQbkxRUVFNdTNqUjkvRTVBM3RFajN1?=
 =?utf-8?B?RFFrR3d3QzFwKzVpcERlTTA5SDR0WFVOckV6Ymgxb04vUjQyY25henRBam13?=
 =?utf-8?B?SnVJaXdwRi9SbG94Wkt2NUFOT3FveDAxbGhKaWlsZDBZbGpFZ2h0cGd5NHJv?=
 =?utf-8?B?Ym0wTTIza2tJa0tXL2ZEWFhmaHhLTE9ETVUxdWZEUHE3eTlFN25OYlgwd3VI?=
 =?utf-8?B?YnpKamlCV0VueEkvaW9WczJ1QUxzczY1MTdqYkVsWUV2SUFYaWl1czZJa2V5?=
 =?utf-8?B?eERZbG5ReEo0L1cyYWpTZU1kekJkd1Z6eVYzWXNzS3ZwV04xcmsyS2tOTjg5?=
 =?utf-8?B?RHplTHAzc2pMNEJiTjBtbXFFblR3WlQwd29YSHliOEQxN213dE01ZHJrbFNz?=
 =?utf-8?B?Zkc1VkJmM0J1SnpIamRacjJVckFBV240KzQ0NmFmL0VMQ1FHc2QrbUlVRmpN?=
 =?utf-8?B?THJoQnRBWnBDdDdFanJKcXo3RGFiTXN1U3UvK21sN1JzM0J5Q2c0YXNONDdl?=
 =?utf-8?B?MkoxYnhxWkhwbmd5a1prckZzN01KVDdtbXQyeFc2bU01QWxOT25oM3JvTkNa?=
 =?utf-8?B?WEdpeXVCTFpaVGRwc0g0QnQyTEpWWFFzeER5bitYZFYzTXh3bzAzYkVUdU1s?=
 =?utf-8?Q?f5/mYH2ZrRtEYmT0=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a50c0bbe-26f7-4209-5d2b-08d9e19f99e6
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0802MB2426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 14:16:24.9102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28FWqEjOMsfC2/hPhOAkF87Q3njtDee+FsBjzVfnuxqVTb0Fb656utgpmTx8qifGY6kT5ECzIZJDOwgJ4IHUNybFYjtb5m3hvmOAxZbmkWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5391
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sascha,

On 1/26/22 15:55, Sascha Hauer wrote:
> This is v4 of adding RK356x VOP2 support. Due to popular demand I added
> a changelog to each patch, at least starting with changes to v3, I
> didn't care to add the older changes as well. I hopefully integrated all
> feedback I received to v3. Additionally I added some patches to the HDMI
> driver to support resolutions up to 4k@60Hz. The patches are mostly
> taken from the downstream kernel. Some have been send to public lists,
> but were never applied upstream for reasons I do not know. The patches
> are a bit more intrusive than needed for my case, but are present in the
> downstream kernel for a long time, so I decided just to take them
> instead of stripping them down to my needs. With these patches I
> successfully used the driver with 4k@30Hz. 4k@60Hz doesn't work for me,
> I hope this is due to my low quality cable.

The cable might be the issue indeed, at least in my tests 4k@60Hz worked
just fine. On a RK3568 EVB1, using

$ modetest -M rockchip -s 69:{1920x1080,3840x2160}-{30,60}

and a HP 27f 4K monitor:

Tested-by: Michael Riesch <michael.riesch@wolfvision.net>

Thanks for your work and best regards,
Michael

> 
> Sascha
> 
> Changes since v3:
> - added changelog to each patch
> - Add 4k support to hdmi driver
> - rebase on v5.17-rc1
> 
> Changes since v2:
> - Add pin names to HDMI supply pin description
> - Add hclk support to HDMI driver
> - Dual license rockchip-vop2 binding, update binding
> - Add HDMI connector to board dts files
> - drop unnecessary gamma_lut registers from vop2
> - Update dclk_vop[012] clock handling, no longer hacks needed
> - Complete regmap conversion
> 
> Changes since v1:
> - drop all unnecessary waiting for frames within atomic modeset and plane update
> - Cluster subwin support removed
> - gamma support removed
> - unnecessary irq_lock removed
> - interrupt handling simplified
> - simplified zpos handling
> - drop is_alpha_support(), use fb->format->has_alpha instead
> - use devm_regulator_get() rather than devm_regulator_get_optional() for hdmi regulators
> - Use fixed number of planes per video port
> - Drop homegrown regmap code from vop2 driver (not complete yet)
> - Add separate include file for vop2 driver to not pollute the vop include
> 
> Andy Yan (1):
>   drm: rockchip: Add VOP2 driver
> 
> Benjamin Gaignard (1):
>   dt-bindings: display: rockchip: dw-hdmi: Add compatible for rk3568
>     HDMI
> 
> Douglas Anderson (2):
>   drm/rockchip: dw_hdmi: Use auto-generated tables
>   drm/rockchip: dw_hdmi: Set cur_ctr to 0 always
> 
> Michael Riesch (1):
>   arm64: dts: rockchip: enable vop2 and hdmi tx on quartz64a
> 
> Nickey Yang (1):
>   drm/rockchip: dw_hdmi: add default 594Mhz clk for 4K@60hz
> 
> Sascha Hauer (21):
>   drm/encoder: Add of_graph port to struct drm_encoder
>   drm/rockchip: dw_hdmi: Do not leave clock enabled in error case
>   drm/rockchip: dw_hdmi: rename vpll clock to reference clock
>   drm/rockchip: dw_hdmi: add rk3568 support
>   drm/rockchip: dw_hdmi: add regulator support
>   drm/rockchip: dw_hdmi: Add support for hclk
>   drm/rockchip: dw_hdmi: drop mode_valid hook
>   clk: rockchip: rk3568: Add more PLL rates
>   dt-bindings: display: rockchip: dw-hdmi: Make unwedge pinctrl optional
>   dt-bindings: display: rockchip: dw-hdmi: use "ref" as clock name
>   dt-bindings: display: rockchip: dw-hdmi: Add regulator support
>   dt-bindings: display: rockchip: dw-hdmi: Add additional clock
>   dt-bindings: display: rockchip: Add binding for VOP2
>   arm64: dts: rockchip: rk3399: reorder hmdi clocks
>   arm64: dts: rockchip: rk3399: rename HDMI ref clock to 'ref'
>   arm64: dts: rockchip: rk356x: Add VOP2 nodes
>   arm64: dts: rockchip: rk356x: Add HDMI nodes
>   arm64: dts: rockchip: rk3568-evb: Enable VOP2 and hdmi
>   clk: rk3568: drop CLK_SET_RATE_PARENT from dclk_vop*
>   clk: rk3568: Add CLK_SET_RATE_PARENT to the HDMI reference clock
>   drm/rockchip: Make VOP driver optional
> 
>  .../display/rockchip/rockchip,dw-hdmi.yaml    |   29 +-
>  .../display/rockchip/rockchip-vop2.yaml       |  146 +
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi      |    6 +-
>  .../boot/dts/rockchip/rk3566-quartz64-a.dts   |   48 +
>  arch/arm64/boot/dts/rockchip/rk3566.dtsi      |    4 +
>  .../boot/dts/rockchip/rk3568-evb1-v10.dts     |   48 +
>  arch/arm64/boot/dts/rockchip/rk3568.dtsi      |    4 +
>  arch/arm64/boot/dts/rockchip/rk356x.dtsi      |   86 +
>  drivers/clk/rockchip/clk-rk3568.c             |   14 +-
>  drivers/gpu/drm/rockchip/Kconfig              |   14 +
>  drivers/gpu/drm/rockchip/Makefile             |    4 +-
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |  293 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    3 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |    7 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |    2 +
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h   |   15 +
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 2665 +++++++++++++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  480 +++
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  |  285 ++
>  include/drm/drm_encoder.h                     |    2 +
>  include/dt-bindings/soc/rockchip,vop2.h       |   14 +
>  21 files changed, 4039 insertions(+), 130 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
>  create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>  create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
>  create mode 100644 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
>  create mode 100644 include/dt-bindings/soc/rockchip,vop2.h
> 
