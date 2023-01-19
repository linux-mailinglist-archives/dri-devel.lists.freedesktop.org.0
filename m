Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7C0673E54
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 17:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FD710E025;
	Thu, 19 Jan 2023 16:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7EF10E025
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 16:14:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dACqw1HnyWmM5AtAMFwYw1EF/Y8J/etsebDps+q6ltm7bfyGzsp+BDWnjn7g/FWaO6c84XUs8oDoSb0i7KsfnfvoMXRLGthXx7X+XeXY8I9HAunc/MXfmIDqz8xMzF4/wwBrXsm60qfh7GurGR5LH+EejK3w8a8/tegQgyB5Lf6KNuoa5wqARkdSJE1rCb01+ePGS7kpFvv2d4VL00J1d6+dAU2xkDk2SC57kok5EFgMLVOUSeJcvDKDJ5//P7UPqoBwk04CiPzluXqyL0qUtkcC6etmotnHfnwBMdlo0ymEu3TIzek8q5O3vS5WQa9fAwxo5505TYq8uABrO8PZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3Bz2r2ka+bL1NORbJAMKGCPTh/P9Cs5yaxSXNOvFrQ=;
 b=dbpVdxBJT40VfRanEkDZvMd9y5WRJKAM4e/p6A99BKk/Wj3wp+BG9cNDB6frl2C7l3UY5cjMGOAhjp22pgJLTIwVK7Ka2OoRUyrJ0blYbCs7GecJI5tp+ZmJC2DUhujrllqBdhzp9+PQgsLxnSIiDHmF1H4PW/uEriWE2fQzyfywQY5v8xntekgCLovzRBIQl5x2mbXNAKqXgEvyGBcE18vGtFhcEdkfSF8TqMFQ6GiTEN7RAPXpTZZ3BCZrUMOiJz7ZHVieTMDDXBl5FjoZIl5la+joTBVlYODv1PyFET41UHKhR8Y3V4MVxx0BDAdKuRgMQAVNYX41VekQf4cDbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3Bz2r2ka+bL1NORbJAMKGCPTh/P9Cs5yaxSXNOvFrQ=;
 b=yrrAeivEjVnBZ/A85EqXPlhmMfc7ba/ryZ3SjnDwIzu+m8rt2puylZMhBU+wS9JQeSQJDf00Fx6mTRYAQXfzUhEMPpkLsZuKcqe0Ugy8PTgfv/Qkn7PXrBlNXtD1IFN8SMqCVkpZhm55r8IGIlvw9qLsWWvykjS5eH5LNv4cIhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PR3PR08MB5786.eurprd08.prod.outlook.com (2603:10a6:102:85::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 16:14:10 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219%2]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 16:14:10 +0000
Message-ID: <6e7844f0-2a41-6542-9a0c-4837233f1251@wolfvision.net>
Date: Thu, 19 Jan 2023 17:14:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 5/6] drm/rockchip: vop2: add support for the rgb output
 block
Content-Language: en-US
To: Sascha Hauer <sha@pengutronix.de>
References: <20230119143911.3793654-1-michael.riesch@wolfvision.net>
 <20230119143911.3793654-6-michael.riesch@wolfvision.net>
 <20230119151734.GH24755@pengutronix.de>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20230119151734.GH24755@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0140.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::33) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PR3PR08MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: a7445ae7-8199-4251-61aa-08dafa3832cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5r6bbRBGzSLprzfo4bLrobejxq+UT4z3m0ZjHee0X7ex18Brqj5FTZ4y8x+elCko/R7NoUwNgoFl5Kh85D5myh7rapsYoU9NQ6aC6XmP17XraBJsLvf7PkgC+wiZ27E55ErP+eCW487MECLFmAOgA2d1OuqJwTz5M6iYFG0+jxRHYjhTjs8vsKYx3BqJs3JayGhbEsVEREcdHDt5QZE4AFFrh3iULU3u36pstWWah5z3eu2ECWQ/kZwILs85QJso+imY+/7cVr1b1JHf2LenIHqCR3WsDekdaO8mIs8pTVbgpWtigcvERoyiXM428uWpVJZlfkKtOm7B8pbveuauAV1VjYm7LLn7Iiwt96XRJ9oTYSECuNsmrnSuX6AkXlah61HDsrmCa6K2FmmqiOPfKaCqUTRqBC/vpandy7cviicV87O0S6BdUxRb2hogCaGmAN5DqCC55eBYvdK8NtOOF1PLx20Jdv7TPe2xOkC1lLmwoynx3Ldz39oc3/GPjvYLI6vTmnq1OAU8TYJGbQyD1YrOA+SwQEClpTY3ZZQrsfnRBSwQ1bCXzb3JkqsDnhAjRAwfYv35Ll/r6P4BgAs3hed5MEpGYYTswGbjEFQth/N7H8WHWiFsdGOuOVzlilaPIx32xS7HxcdFferO3lsGeybiW//aQBX+qQJWA2GPiiIUIjHHz54he7Nuxq3iuFU8yEJEIj0yGHV9W+MfI4Ub/Bx2pg6+DTvyOq1XoJMkBgE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39840400004)(376002)(396003)(366004)(451199015)(36756003)(5660300002)(41300700001)(6916009)(66556008)(66946007)(4326008)(7416002)(66476007)(44832011)(83380400001)(8936002)(478600001)(6512007)(6486002)(186003)(6666004)(53546011)(6506007)(8676002)(2616005)(316002)(52116002)(54906003)(31696002)(86362001)(2906002)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk5uajhHdkJIV0lqanRGVEpNZjJteERBQ3BocE5KTEFmVUovTlNGMmpxMHFy?=
 =?utf-8?B?anNWLy9xUlp2ZWsvd2NYSDV2VHdkL2swTG1Jcy9KVTljeERZYXJRQkJaZU9X?=
 =?utf-8?B?M2ZEdFp4UG15MlNMQnJXNGw1RXN6QmNySWhFSnU0c2VQd2VGVUlGVFRaNFpQ?=
 =?utf-8?B?KzA2MVY1eldrc1RwOEd6SnYrOHlHYlBOVzZvWWRQTm1ESFRBVU1ZR3RMNUV2?=
 =?utf-8?B?WGRWMndMVTQ5V1NOdVJGV0wyZ2dxcHFQVG5URENJTkRzcTUyMFNRUjVoN1p3?=
 =?utf-8?B?Rk1vOTgzaHlBeWVFL3lBYWtJem8wMlE3dGV5UE0wR1Q4NkJZR0tNblZpY1Vw?=
 =?utf-8?B?QjVhZWRUOHNiSURlcUtRWUpnenZ0YUhuMGlsd3JLNXFvT1ltSTA5V3hsdkxY?=
 =?utf-8?B?RmcvVVRYNHVUZlhEQnhGV2RIS3BvSW9wcTJqMWNneTMyL2Z4citXb1lWSDRG?=
 =?utf-8?B?VlowTmh5MHZsOExCdUFBVVAwelRCZFl2aVRZbEN4M09lWUtVS3FTV2Zxb0Jm?=
 =?utf-8?B?b1ppZ3hYenUzYnVMbWJhV0E5SUFmYjU5K0tTNUVmWm05bWc5eWx2MEtpaVF1?=
 =?utf-8?B?b2l6RGRJZnVXY0NwTnVlbnV2VncrVGoyVFRkdGJwaFVpWis0K3Y5NkNyTk9T?=
 =?utf-8?B?VUowdXZEQmhVK0MvaGc4SjMzVHdOZ2ZzTDVoL3JmNTFHWFlQb0xCNVIvVGRL?=
 =?utf-8?B?OFMwL2pWeUFqUkw3Vllaa3MwYmJzaDZCS3lEdWI4d3dLVVZtN1dzc1h3V0Nn?=
 =?utf-8?B?SnpVM29FUThxNHdscWdzZklrU3g1bmY5MzBkK3FaRGlwdjhzRmtmcTZBVS9B?=
 =?utf-8?B?emQyakx2SmlVVUJLSmFPSTBUTTY5K1FmRXlkRHRNb1ZpcUorbnl4TkF5STlz?=
 =?utf-8?B?YWRQZ2xCNmVQcHFsQ0gwbWxzWEt2TWFlaXM4bFRhVWdnazhLeVpPZlFSTndY?=
 =?utf-8?B?ME1DOGo2a2FOdlVTRnU5T0F5Y1hCQThNYlZtVVpnSU5uYStRMWpIalpaVlBJ?=
 =?utf-8?B?TmNrZElaVTBtN0MrNGZXWlBIMEE3TG5JUkY1aVlMajhoOVRzbFZFaHZIM3Qw?=
 =?utf-8?B?UkZkZUpER3pkc3Bxb0RyQnZDMVl4UnMvb1g1Vng0UEhsOEJGWnNrUmI5MTB6?=
 =?utf-8?B?TU1CNElTVnp3MFpwMDB0dWZuQXVVUFY1dGs3SERvc2RlRFdsVElhamxkb0Fj?=
 =?utf-8?B?VmlJVkF0OURwL3hETWQ3S0xEWHA3M0E4VEc3WnZ5VFlIc2N5Q0xVcnIyaXU3?=
 =?utf-8?B?Nm9qMHdXVHJoSWpibS90WFF6dzJuYWhaOXlNOUJFYXJpRkZpMTVmamRMVjlh?=
 =?utf-8?B?UVE3OGNzNWJIUEJmT01jMUNGZ3dwUVAvNDZKeXdhU0hmLzdZWjB4NTJKb0gw?=
 =?utf-8?B?UldvUWJoRkhkRmk3OXBESlpSSkMrcEJ4WEFJTXp1cWFMbkVDYWFoWUNWU3ZQ?=
 =?utf-8?B?QnhoMVpsMnRjSXJRd0ROcXlXTzY5ZmtMQjVwbTU2aWY2dmpHZHh3TlkyUTVa?=
 =?utf-8?B?d01zVXRBRDlNeDVnN1Y0cXFuY3UzQmxja05ncUVSTUxhODNaRUpNSDgrM3RR?=
 =?utf-8?B?NlA1UVZKbEtLRFVIczB6dm04VCtLUXgxVXVQblVhRjhJRlptdTdZTzJTdDA4?=
 =?utf-8?B?UmN2YXlsYmdWUUxRRUNVbHJiYTlGZ0dtdUFzTFd2Z0I0KzJ4SGg4MXFJcFB5?=
 =?utf-8?B?TnoxZWRqamVYUVp2SGE0MGNCaHkxd0NvVlNLZjFoZkxjbTBPM0Myc1F5WHF5?=
 =?utf-8?B?czhMYkFub3pLckpib0lneEFkODJkYlB0L3l6di9ramhrb2kwWmtqaEt4STJS?=
 =?utf-8?B?eGd2Y1ZPWDZJcjA2Q0VjbDhqMXdJM2J5M1hMR1RTLzdZU0tMdHFIMFNJcFFN?=
 =?utf-8?B?cXFMc0tJUk9zTDJnZkdGZ3NCY1doYlQzMWpma2x6Rm5DWHo4a2VLdUFoUUJi?=
 =?utf-8?B?Z2NQWnkvRWkwcElOQitCRUFpOWh0cnRUSVlIU0F0dVVUTTI0S0lBK0xCd080?=
 =?utf-8?B?Z0NBWXp5bmdmQjVNVFEyWU02QkpPNVVuTDVsZEF3VmN1bEpjL1JBQ0xBSFlw?=
 =?utf-8?B?NUEySFNlV2hoNm9kRU9YbE1BT3VzTVd3MW9xaWVrcUNZMVQ0ZHhBOUtpMWpB?=
 =?utf-8?B?Z1k0eHBMZlBvM1dkL20vUTdmNkhxYlpOUEZFNHM1ME9rZkNyNmZNWWxTUklh?=
 =?utf-8?B?N2J4YXFhem95c3k3cEorTkk3MVZHNWRFM2IrVXo2dFYxMllYZEh3bVQrRGx4?=
 =?utf-8?Q?+bqutDQ5MskqIMyiYUVO1iKSaLGfC5Uhn24y5xAxk8=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a7445ae7-8199-4251-61aa-08dafa3832cb
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 16:14:10.4597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W00t7krhLiCBHXJQnfN50iOG9HVVWzBAusnUJgGOrGean2tniTSlhgGpkOKaFcUS32NTmjYEspK/pzhDAb7IFKVBR2i1mM19O33xg9Ft3Ks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5786
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha,

On 1/19/23 16:17, Sascha Hauer wrote:
> Hi Michael,
> 
> On Thu, Jan 19, 2023 at 03:39:10PM +0100, Michael Riesch wrote:
>> The Rockchip VOP2 features an internal RGB output block, which can be
>> attached to the video port 2 of the VOP2. Add support for this output
>> block.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> ---
>> v2:
>>  - move away from wrong assumption that the RGB block is always
>>    connected to video port 2 -> check devicetree to find RGB block
> 
> Traces of that assumption are still in the commmit message.

Oops, this needs fixing of course...

>>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 44 ++++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>
>> +static int vop2_find_rgb_encoder(struct vop2 *vop2)
>> +{
>> +	struct device_node *node = vop2->dev->of_node;
>> +	struct device_node *endpoint;
>> +	int i;
>> +
>> +	for (i = 0; i < vop2->data->nr_vps; i++) {
>> +		endpoint = of_graph_get_endpoint_by_regs(node, i,
>> +							 ROCKCHIP_VOP2_EP_RGB0);
>> +		if (!endpoint)
>> +			continue;
>> +
>> +		of_node_put(endpoint);
>> +		return i;
>> +	}
>> +
>> +	return -ENOENT;
>> +}
>> +
>>  static struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
>>  	[VOP2_WIN_ENABLE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 0, 0),
>>  	[VOP2_WIN_FORMAT] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 1, 5),
>> @@ -2698,11 +2721,29 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
>>  	if (ret)
>>  		return ret;
>>  
>> +	ret = vop2_find_rgb_encoder(vop2);
>> +	if (ret > 0) {
> 
> '0' seems to be a valid vp as well. Shouldn't this be ret >= 0?

...and you are right of course. What a stupid mistake.

Will fix these in v3.

Best regards,
Michael

> 
>> +		vop2->rgb = rockchip_rgb_init(dev, &vop2->vps[ret].crtc,
>> +					      vop2->drm, ret);
>> +		if (IS_ERR(vop2->rgb)) {
>> +			if (PTR_ERR(vop2->rgb) == -EPROBE_DEFER) {
>> +				ret = PTR_ERR(vop2->rgb);
>> +				goto err_crtcs;
>> +			}
>> +			vop2->rgb = NULL;
>> +		}
>> +	}
>> +
> 
> Sascha
> 
