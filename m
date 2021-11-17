Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A10454549CE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 16:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350006E957;
	Wed, 17 Nov 2021 15:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374476E957
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 15:20:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2MbbktVotFqSfe/m6alPNzz9Ga69/G053tD0W+zo3hT+lLSN0JY48QdJCPHGSlPHREcy1Iav1wgewC8ThDKMq6C3eHjyyh3jcGXX+RlwulbqloZbh4yAhdhCoMYWZyMlZj120lp3u+oerA4YK9iY3o2yE4Zd/aQKQRKsmiYjrI2zwARl6QN0vkz3huses9rVjHN7Ly07VQqtVG5LAN8vh+AW/+rKnu81xPqVhf+ac7Olks0cDw7aQA9UgHmFRKuaHuTz8cKZ56xQ/942mOclpz4+AEtM0h5AcR4OLgdLSet3hFBght2Sfddt4J4u+YZBdNTFpA91xTzRcmo8Bco2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ajcj+HLsxnJlzgQ91llsD9SJT3KYoBtNKV+pPBzQ4c=;
 b=Lzx/8QtWR/UoGLSOrC7bjaeHk00cVjZGY93hmbmyVh0OD0wyNB0fm6sdpSdK7DJvI7T0Z7pqbDI5YKQqiWk4ulf5GzZduIdqB8rz+rTK85s9vb+qdYX+fYiqeLCZYabkwi5j+q+iDegCohgxMmaG5WoHiMbV1pzVGN61gvURwHPwky7o8Crb6m+vFVwDaIvRqGVXdkAuOo0BrjgrCdQ2rnykGBX7rCuDEmzEfb6S1K39eorni35Ak7c+DAdyZitxuAEZuhhM2vl52L9s4L6AfF5naH5F2dE8m8pj/7H/8C8hdbQSElZ7x/2gAkWvpNL+4fbMARLqSLdVluEGKTRfcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ajcj+HLsxnJlzgQ91llsD9SJT3KYoBtNKV+pPBzQ4c=;
 b=a6lYamSGDQ+lbaMB30AFTSEOuLUPARJGb+qsTqPJBHmXXinwJvWfD2MOWE1MK3k7tgxD/nwSSr/RhYm2mbxR+YoPmCLn00dQn5sPB79X1gmQd1keIrlvs/rC5TsFpphLqSCa/6yQKrRRu9giID74pqru5/7sATwq/iJpbo7+Wao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DBBPR08MB4523.eurprd08.prod.outlook.com (2603:10a6:10:c8::19)
 by DBAPR08MB5606.eurprd08.prod.outlook.com (2603:10a6:10:1a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 15:20:38 +0000
Received: from DBBPR08MB4523.eurprd08.prod.outlook.com
 ([fe80::a9fd:7c7f:72a5:feda]) by DBBPR08MB4523.eurprd08.prod.outlook.com
 ([fe80::a9fd:7c7f:72a5:feda%6]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 15:20:38 +0000
Subject: Re: [PATCH 10/12] arm64: dts: rockchip: rk3568-evb: Enable VOP2 and
 hdmi
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <20211117143347.314294-11-s.hauer@pengutronix.de>
From: Michael Riesch <michael.riesch@wolfvision.net>
Message-ID: <bae5b273-afa5-fedc-2535-bbd031276d0f@wolfvision.net>
Date: Wed, 17 Nov 2021 16:20:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211117143347.314294-11-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0190.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::17) To DBBPR08MB4523.eurprd08.prod.outlook.com
 (2603:10a6:10:c8::19)
MIME-Version: 1.0
Received: from [IPv6:2a05:1141:1c9:7c00:2971:328c:3026:3149]
 (2a05:1141:1c9:7c00:2971:328c:3026:3149) by
 ZR0P278CA0190.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:44::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Wed, 17 Nov 2021 15:20:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45cc93a7-057f-442c-6d36-08d9a9ddcf4f
X-MS-TrafficTypeDiagnostic: DBAPR08MB5606:
X-Microsoft-Antispam-PRVS: <DBAPR08MB5606F65617D8DA41D9A0E1CFF29A9@DBAPR08MB5606.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ThhoTTsZa3Sxk+N9PiqZXqKYZNXjFNKvtxOf/aLPGPJyP4mhcPOcMYpMoiogVNpMxLZNk/+6DXAx88vdyOl1MHI4M3JxzfhFAWqnmXwx/v2P9Csg+9g4LTB7BAphoOxaq0HIwTehrXEMUH/4OrgVsxUIPGE7dM0Xh8GUa45tkixXq8f8k6kGIYJk5xoj2m291WwXN6kst8ZxG2BOqc7IJlsL+2AiCW32RKvJb00SLoMY9RM+HPa43FV9Abhk1/AsBPyXJWXyWceGkaP53Usrn2qPYhIEoZ8DK2mJe68+HZ0Trl2Eu3mu7U6QUH/zaBjERdpoAU615/Oc3Osq/NkqxZX03A3ZiRe7GcuQI8ANrnHr3PaEDvjfY4B5lCG9ObeLLjxnTyBoxayUiGUKGlIgWHmLR34nv8Q2bXSAVe5acWO80OaFd5thZgj2gDAn/uknlvyGwsz/2EMsSqCmJ+Efy2JkmbHuwWw5+0a1tcRgn5FEaykh4DkPGxcqJg3LWEyxtINxsZD5o4jsJu5WY+4misNLXNnfPGrKweKFSwm4sj8QmIgkxE82AsIa1qdE62rZCoa4QVCWQlUHpjqJgFnsn7uaftb1q9ManLTOOpln8q7bN9qqaYSweonbE2TbFJ0GSvxrfPluw3BmHnyjOyQ/Mf/EKy9FbNRVKp69ngUmUAvucxiHHz2qWcfnLBewH/qA05zs+r/zJxd1IEGLNmR484HgOTZ7pj9LRs4c3UA8iA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR08MB4523.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(6486002)(7416002)(53546011)(66556008)(66476007)(2906002)(83380400001)(44832011)(31696002)(8936002)(4326008)(52116002)(31686004)(38100700002)(86362001)(36756003)(508600001)(54906003)(316002)(186003)(8676002)(2616005)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGlyN3cxK3ovK2oxYkt0am1JeVdiMTRNRXA2TXF6ejRmNEltQUN4UnhkMnJD?=
 =?utf-8?B?WnNaZXlpNUxkWHRPS0czVE4zZDk4bUxBNzZlRDg1V05UQ2tWNCtLQW9BTko4?=
 =?utf-8?B?dFpIcDBLQ2Y0VjdQc2ZIdnFlanhYOXlqK1UrVEhncWlrTFJtSTBMM0NrVGV1?=
 =?utf-8?B?WDRvTG1zZk5lc2JTUEdueXREbFJYWWxUb2J0Mks5ZU5KT3ZSZ3ozRzVQYzdY?=
 =?utf-8?B?S2dmcjF6a2JjdWxheE1OejNJNkRSMVVVTExsMUhXYVFMeWgrek9Dcm1reHNY?=
 =?utf-8?B?Sit4VUN0cWk2elFySnMyejk1YkxvbWNMZmRhN1QxRktSMHNld0gzZW1xTlBL?=
 =?utf-8?B?bzJ1Y25uRnlDMGRWYzc4QThoZ0FkZitGSWtlVXRqSG9kWkZjTDNiWUhwWHFQ?=
 =?utf-8?B?SlQ2eElidkltdlM0MEg3SlhpUnJiNG9tTG9qSmxKOThGZ09YcjR4M1ZEL05X?=
 =?utf-8?B?cjJiSW5LWVpBWkxOOXN6UEs3dlpVUFp2S3I4WnJVeUFqajRJczErZTF2Mm9K?=
 =?utf-8?B?V2JJUDI5b0xhNTl6aTdpWjR6SG5UMmE5Ujk0MERNRDNzYW45MlUwZU4yRkF4?=
 =?utf-8?B?bm5SY3FiUG5DNWUyZ25zK3RCOExYU3NjV29zanRyY29jR2ljU1hXU3puVVFi?=
 =?utf-8?B?RTZVcjBUNmxveUtFUEZkRGFvSmFETzBvQ1JXZ0p0RDhRWm94Z1pTWGlKWEgy?=
 =?utf-8?B?ZFJCdkdITHg2L2xWbTdhck1ETllaMFJPejRvOUZ1b1V1SllCWVZCbnFQNXpH?=
 =?utf-8?B?U1d0a2F5SS84RkF6RXM2SkxSMmVJNHVuUndEUkpYUHdPd21XcjNVRUg2RkNX?=
 =?utf-8?B?ZTYzYnhZYVBlVzRCVFRsK1phSUJKNkJycExkTFNqcDlLNVAyTmFVS0VpM3V1?=
 =?utf-8?B?ckhaRExKYnp6WWRzMXV5UDIyVm9GLzIyNzloaU5haUU3THBNc1Y1SStGS2RU?=
 =?utf-8?B?TDg3QWpHME54SHdoYXRSQWlZQU9VTVVWNmttWDV4NGllS00wQ09tN25FWmNF?=
 =?utf-8?B?ek9INkVOekJpZTRkQzIzMVFDbnRjN0tLdlZWVHF2bitUb2hYcDdWKzJ2SmFF?=
 =?utf-8?B?YkdwN2w4RS9XMncxTHFHV3AyQU1SOElPVWUrdStWNmlySFNUUEpOUVRnQkMv?=
 =?utf-8?B?Qm5rdmFwRjZRYmJ6d1J1K0luckVjSkd0Z1hsWjVwNE9aYWJ1d3E2VFI0aVZM?=
 =?utf-8?B?TFVmQXpkV3lqUXVBR0ZvSVhnODBIYm9VUHBqcy84YUpkZ0xoMnhaMGFjb21v?=
 =?utf-8?B?Z3BmTVBINVBvNUl2eEt4WnhHSHBTc3ZHZjRxUTMvQkNyc0E1dkQvSXFRdHov?=
 =?utf-8?B?L1ByOVUyTy9mNm14MHk5TEVMakdiaWNrVnZaWCt4c2dCbzdUVDlZRnpwY0I4?=
 =?utf-8?B?Ym93US9UMS83NVdlc3FqamJtUkxNV2ppUzBlSzdvR0h3ZHVoeUx6UnBQemtr?=
 =?utf-8?B?Q3JXejgwUW5Mek95UTZuNjZYdEdqRVY3T3UxWnVZcVFzVTkwVXkvK0RxVVBx?=
 =?utf-8?B?a01SOTNkR0VKVFlrci9ZVFlGNmgwYTFuemZWMGtlcjFxQkFuZmQ5cHlDM3JC?=
 =?utf-8?B?UmZOd0xDSjFvTHFlZ2YwVWNNYkMvWmxEWDJoOTVicVhCZzcxV2RxVEtuZTZo?=
 =?utf-8?B?dGxmWjlvMklzcml4RFRwcFBaSFhLYVpRQ0hnbzlvdTF6MGdVTW1VZkNZZ0to?=
 =?utf-8?B?K1F2Z0laRVE5ZU9XMGd5QzNXWHlUSEF2QWY0ak80eUtSS1cybkNoTVJLbnNa?=
 =?utf-8?B?TGdiS2d3dDJXU0ZOMndiOUltMVZwTC9ZT1ZZQXplZWxKUy9sRHdudUw1SFkw?=
 =?utf-8?B?Mis0V25jYisvSlozTzg4SjVkenUxc3YwSWdlcmJNNUNIQW9KaHVYMzNkV2ov?=
 =?utf-8?B?OG9FUnpqWVN1RTVob3drYnc2bW1vZ05kQnJZcDBCeEI5bEhRSkg4T1VZSjBL?=
 =?utf-8?B?V01TM2xleExMUXFEQm9lU3ZGZGhSZG5qZGpoY3hKNjdDd1Yrb0lub1lwSi9i?=
 =?utf-8?B?TXBCeFNoQlpyVGlhekV0dkUvbHBVWHFjYUl0ZVBrcGpwTUFZbkFmaXludnVJ?=
 =?utf-8?B?dkVNWGc5TXpzaTk5SGRZSWR6WmpHclFoeW4wTEU2Vmo5c2wvby9rdXN0Vms5?=
 =?utf-8?B?U2c3YThTdDFIN0MyUitoa2d5ZjhSTG5RNUtJYmxEQzVpMVJPb2NNemxNZ0to?=
 =?utf-8?B?cW1VYzJiMWM5WlhwUmZjZ0JHNHIzQ2FyZE1heU5jcEV6L05GL1VaVlFSSzVk?=
 =?utf-8?B?N1VFSHRRSWhGUlNmRE91c3dqbEd2V05XVnRhN0ROQ0Z5ZjY4dVBVTUl6WTE4?=
 =?utf-8?B?aEpKUERqanBsTjc4OE9LL2NldXBzc09IdHN2eHZxTkx1R2diQ1FNQT09?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 45cc93a7-057f-442c-6d36-08d9a9ddcf4f
X-MS-Exchange-CrossTenant-AuthSource: DBBPR08MB4523.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 15:20:38.1580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhS2XHuwkxxPYhlqddW40yoLvG/ekY1IhUbKk+FiWMhpLmviTFNQLEjSCt1UqLQD7Y3oEbH82KM/v4wGPWNvkoKRjlAv0aTlftIZPrfsnEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5606
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
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 kernel@pengutronix.de, Peter Geis <pgwipeout@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha,

On 11/17/21 3:33 PM, Sascha Hauer wrote:
> This enabled the VOP2 display controller along with hdmi and the
> required port routes which is enough to get a picture out of the
> hdmi port of the board.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>   .../boot/dts/rockchip/rk3568-evb1-v10.dts     | 24 +++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> index 184e2aa2416af..156e001492173 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> @@ -106,6 +106,12 @@ &gmac1m1_rgmii_clk
>   	status = "okay";
>   };
>   
> +&hdmi {
> +	status = "okay";
> +	avdd-0v9-supply = <&vdda0v9_image>;
> +	avdd-1v8-supply = <&vcca1v8_image>;
> +};
> +
>   &i2c0 {
>   	status = "okay";
>   
> @@ -390,3 +396,21 @@ &sdmmc0 {
>   &uart2 {
>   	status = "okay";
>   };
> +
> +&vop {
> +	status = "okay";
> +	assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
> +	assigned-clock-parents = <&pmucru PLL_HPLL>, <&cru PLL_VPLL>;
> +};
> +
> +&vop_mmu {
> +	status = "okay";
> +};
> +
> +&hdmi_in_vp0 {
> +	status = "okay";
> +};

Minor nitpick: This should probably be sorted alphabetically.

Best regards,
Michael

> +
> +&vp0_out_hdmi {
> +	status = "okay";
> +};
> 
