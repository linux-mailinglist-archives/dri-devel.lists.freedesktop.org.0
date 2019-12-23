Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AB3129A94
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 20:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2519B89D8E;
	Mon, 23 Dec 2019 19:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8102F89D8E;
 Mon, 23 Dec 2019 19:53:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jsi3CgyELwbzg7VwBj4mJO9cjc7i7WE8OGg33OEPgI1RRcAXO9nh1fH4WZWVPfbRJaGLBW3E2IWDPdG+FnWVVOepWrmE/3uqQ6FyoEmseQx6gdiLAE3yZPYTdUKVf2+zyt+afluXVin8gSRl+PT3aUsZWKs4gln30Vafalq+q9L+0HGzfR07Km7puZ70hW7OH4Rz/tCa5GOPrnEKEanceU/YiK60TvGem3j7JhjFs1qOImI+SG+jUVUh3JoZHccqEmIprfYdmPs7bC6UCTgIbrKTrM9M0JUk10tIHL8vaZQQZY++EYMFwqbtoEYt3dX3aejT1RmB5NU34h+ViWeLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E0k1V4mWRD8T6d7xDRXRgP5XQZCOmmSrSshdQ1AJIk=;
 b=Ji199+jZl73lsOC1ye1+39Vl/bpmAEsVwXI3dT+/GjwkYWT83pmFxFDy0OgACkVjDbczar96UEdGJxRUnqI+s1cy9ljLlbHgVBPf/h7kZbX0RBLYmNErZWNk6Ae7ANRt4nbxJLZqtzsTxlivwHAuLsoekXO8SQIrZNE8lLA4ldUx6h4rpN9oXc9foOYCLAhkUd8sD0u/salAF2zwh4pPUytImoYIbxcZ0g5TUQPanLH6SyYT8A6+T7E76K+n6JInMdm116UftmOjZ/1MTllbScK0iozRpsfuA7tejx9MI9DTNKaSFLVAX28y9qb1L8xADpP13SNZIhn+vBdhtXoS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E0k1V4mWRD8T6d7xDRXRgP5XQZCOmmSrSshdQ1AJIk=;
 b=3+5QeihxzK1lU+/xURh54/3VcFnvW9X4eRwqxLm8AoTGmYwr9apa+Nx7d8encMB5wfoSCUYsQ63Z331J+hhwq2aRvLTcCRDJFthwijxCca6KU1/Cju6NFf1tpKX3KvePEnDJcQaSQq8cH6bUHNNmSfK2a6Eq4XBngX5jgNk7wMA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0248.namprd12.prod.outlook.com (10.172.76.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.15; Mon, 23 Dec 2019 19:53:20 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d%11]) with mapi id 15.20.2559.017; Mon, 23 Dec 2019
 19:53:20 +0000
Subject: Re: [PATCH v3 2/9] drm/dp: get/set phy compliance pattern
To: Animesh Manna <animesh.manna@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20191218235324.GI12192@intel.com>
 <20191223170350.15531-1-animesh.manna@intel.com>
 <20191223170350.15531-2-animesh.manna@intel.com>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <2bf4630b-52f3-138d-9061-766275cbfbe8@amd.com>
Date: Mon, 23 Dec 2019 14:53:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
In-Reply-To: <20191223170350.15531-2-animesh.manna@intel.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::48) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [10.4.33.74] (165.204.55.251) by
 YTXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 23 Dec 2019 19:53:19 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ada9b6fa-c9a9-43d7-d678-08d787e1c2a1
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0248:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB02488676117CE8FC45009A128C2E0@CY4PR1201MB0248.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0260457E99
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(199004)(189003)(4001150100001)(2616005)(956004)(66556008)(53546011)(36756003)(478600001)(26005)(2906002)(8936002)(81166006)(81156014)(8676002)(52116002)(66946007)(16526019)(186003)(4326008)(66476007)(31696002)(16576012)(6486002)(31686004)(5660300002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0248;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BWCJtEJDPTKOpI+SWc/rs8mPImzaafvGc4WqI5Nl7JdRgf1hvoPeumc+upLKZZ0oBk9WHUGWEuXkkzlrBqjqf0i0hiTtJjfN8BclPTKopKstm0ivdYDq3Sgn488y7hF2ikPt45hlHamkHmGtbaoyxlUeKakmrgWzYIeiAUrHAMMiaD+lJTNY0SzE2bBEGorGv9q1oLxqsRgrbciU7Y+pt2G/sp7BYK/Y31vXEkT0M2nP2Dadj3Z0FxkomtD8XAcYytMERsyRDWMqpq4yS1i1tOVNUAmVgfPm5yPo8MynmdCmLeoDgsqGdzUYvjszbnsIYgOWrZMuuAuqfSrNK+57Wz+B7p2fBpVVHi1Miq5p4TTfxmvdSMX/UF5VdggC+740QRLYWlHne0FnvFYz8Hy7emdzD9Z8avLtE+3qmVZ/sI8oWQcD0uqL8yokyzlDEhr5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada9b6fa-c9a9-43d7-d678-08d787e1c2a1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2019 19:53:20.1610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTyzXY2ugBwgvBZUlQfqy/qp6N+eC2/vZtGG3VdVHRE0PcXDC7y8IbG2h1EvUygM0YbUPHoCI6CwVrQH9xvvfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0248
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
Cc: jani.nikula@intel.com, nidhi1.gupta@intel.com, manasi.d.navare@intel.com,
 uma.shankar@intel.com, anshuman.gupta@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2019-12-23 12:03 p.m., Animesh Manna wrote:
> During phy compliance auto test mode source need to read
> requested test pattern from sink through DPCD. After processing
> the request source need to set the pattern. So set/get method
> added in drm layer as it is DP protocol.
> 
> v2: As per review feedback from Manasi on RFC version,
> - added dp revision as function argument in set_phy_pattern api.
> - used int for link_rate and u8 for lane_count to align with existing code.
> 
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 93 +++++++++++++++++++++++++++++++++
>  include/drm/drm_dp_helper.h     | 31 +++++++++++
>  2 files changed, 124 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 2c7870aef469..91c80973aa83 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -1371,3 +1371,96 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
>  	return num_bpc;
>  }
>  EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
> +
> +/**
> + * drm_dp_get_phy_test_pattern() - get the requested pattern from the sink.
> + * @aux: DisplayPort AUX channel
> + * @data: DP phy compliance test parameters.
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_get_phy_test_pattern(struct drm_dp_aux *aux,
> +				struct drm_dp_phy_test_params *data)
> +{
> +	int err;
> +	u8 rate, lanes;
> +
> +	err = drm_dp_dpcd_readb(aux, DP_TEST_LINK_RATE, &rate);
> +	if (err < 0)
> +		return err;
> +	data->link_rate = drm_dp_bw_code_to_link_rate(rate);
> +
> +	err = drm_dp_dpcd_readb(aux, DP_TEST_LANE_COUNT, &lanes);
> +	if (err < 0)
> +		return err;
> +	data->num_lanes = lanes & DP_MAX_LANE_COUNT_MASK;
> +
> +	if (lanes & DP_ENHANCED_FRAME_CAP)
> +		data->enahanced_frame_cap = true;
> +
> +	err = drm_dp_dpcd_readb(aux, DP_PHY_TEST_PATTERN, &data->phy_pattern);
> +	if (err < 0)
> +		return err;
> +
> +	switch (data->phy_pattern) {
> +	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
> +		err = drm_dp_dpcd_read(aux, DP_TEST_80BIT_CUSTOM_PATTERN_7_0,
> +				       &data->custom80, 10);

Using sizeof(data->custom80) might be safer.

> +		if (err < 0)
> +			return err;
> +
> +		break;
> +	case DP_PHY_TEST_PATTERN_CP2520:
> +		err = drm_dp_dpcd_read(aux, DP_TEST_HBR2_SCRAMBLER_RESET,
> +				       &data->hbr2_reset, 2);

Same here, using sizeof(data->hbr2_reset).

> +		if (err < 0)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_get_phy_test_pattern);
> +
> +/**
> + * drm_dp_set_phy_test_pattern() - set the pattern to the sink.
> + * @aux: DisplayPort AUX channel
> + * @data: DP phy compliance test parameters.
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_set_phy_test_pattern(struct drm_dp_aux *aux,
> +				struct drm_dp_phy_test_params *data, u8 dp_rev)
> +{
> +	int err, i;
> +	u8 link_config[2];
> +	u8 test_pattern;
> +
> +	link_config[0] = drm_dp_link_rate_to_bw_code(data->link_rate);
> +	link_config[1] = data->num_lanes;
> +	if (data->enahanced_frame_cap)
> +		link_config[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
> +	err = drm_dp_dpcd_write(aux, DP_LINK_BW_SET, link_config, 2);
> +	if (err < 0)
> +		return err;
> +
> +	test_pattern = data->phy_pattern;
> +	if (dp_rev < 0x12) {
> +		test_pattern = (test_pattern << 2) &
> +			       DP_LINK_QUAL_PATTERN_11_MASK;
> +		err = drm_dp_dpcd_writeb(aux, DP_TRAINING_PATTERN_SET,
> +					 test_pattern);
> +		if (err < 0)
> +			return err;
> +	} else {
> +		for (i = 0; i < data->num_lanes; i++) {
> +			err = drm_dp_dpcd_writeb(aux,
> +						 DP_LINK_QUAL_LANE0_SET + i,
> +						 test_pattern);
> +			if (err < 0)
> +				return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_set_phy_test_pattern);
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index d6e560870fb1..42a364748308 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -700,6 +700,15 @@
>  # define DP_TEST_COUNT_MASK		    0xf
>  
>  #define DP_PHY_TEST_PATTERN                 0x248
> +# define DP_PHY_TEST_PATTERN_SEL_MASK       0x7
> +# define DP_PHY_TEST_PATTERN_NONE           0x0
> +# define DP_PHY_TEST_PATTERN_D10_2          0x1
> +# define DP_PHY_TEST_PATTERN_ERROR_COUNT    0x2
> +# define DP_PHY_TEST_PATTERN_PRBS7          0x3
> +# define DP_PHY_TEST_PATTERN_80BIT_CUSTOM   0x4
> +# define DP_PHY_TEST_PATTERN_CP2520         0x5
> +
> +#define DP_TEST_HBR2_SCRAMBLER_RESET        0x24A
>  #define DP_TEST_80BIT_CUSTOM_PATTERN_7_0    0x250
>  #define	DP_TEST_80BIT_CUSTOM_PATTERN_15_8   0x251
>  #define	DP_TEST_80BIT_CUSTOM_PATTERN_23_16  0x252
> @@ -1570,4 +1579,26 @@ static inline void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
>  
>  #endif
>  
> +/**
> + * struct drm_dp_phy_test_params - DP Phy Compliance parameters
> + * @link: Link information.

@link seems to be from a previous patch version. Please describe
link_rate and num_lanes instead.

> + * @phy_pattern: DP Phy test pattern from DPCD 0x248 (sink)
> + * @hb2_reset: DP HBR2_COMPLIANCE_SCRAMBLER_RESET from DCPD
> + *            0x24A and 0x24B (sink)
> + * @custom80: DP Test_80BIT_CUSTOM_PATTERN from DPCDs 0x250
> + *               through 0x259.

Missing doc for enhanced_frame_cap.

> + */
> +struct drm_dp_phy_test_params {
> +	int link_rate;

Is there a reason you're not using u8 here? Would be nice to keep it
consistent with num_lanes.

> +	u8 num_lanes;
> +	u8 phy_pattern;
> +	u8 hbr2_reset[2];
> +	u8 custom80[10];
> +	bool enahanced_frame_cap;

Typo. Should be enhanved_frame_cap.

Harry

> +};
> +
> +int drm_dp_get_phy_test_pattern(struct drm_dp_aux *aux,
> +				struct drm_dp_phy_test_params *data);
> +int drm_dp_set_phy_test_pattern(struct drm_dp_aux *aux,
> +				struct drm_dp_phy_test_params *data, u8 dp_rev);
>  #endif /* _DRM_DP_HELPER_H_ */
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
