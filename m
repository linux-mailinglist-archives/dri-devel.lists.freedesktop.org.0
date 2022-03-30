Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D624EBCB8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 10:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AA510F762;
	Wed, 30 Mar 2022 08:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02olkn2096.outbound.protection.outlook.com [40.92.44.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8338C10F5F6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 07:48:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPEtAj8Wu1sy5rrWsGdeqnjNjq+W9W6fa9E30ZdrO4IYAuNMoLYRXw11UTkYLzG80C3YhP5tVdvQeDMwMclmSmKXEkIfcSqhdJ+9f1Nl3uqJWk2BSaIsiE7qIrAHYmuhWdRvyHUToekLW/lTHPwuDPjC24SZjBRwII1bgwQH2NbZnJAPg1H9C59hitw6D6Z230Sgpb2T7+/pCq8UkdOx3eLgfeLnAl9I4x6D3cXYGSkeYyi/ziEGJuytOonrQYpuB563unkwLxU91FsQevYq6neFLjNZ6XSOjt9BVbU8XL8JWY+bCWhIlFD0tA6pBmosMt/eHOzHn45u3bY0TnOFxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQKjm73/kZ3wNWjYou2OK7oExRp7XkWBQWe4/xeYbCk=;
 b=jTLtLfJj489JnTf2p1RNmGQmy+Uq0cqh6RdWkpYzlH/RPZErccTi0VoU8NYSwla8LSyFMqE3t0udGhjCUz5VgVn5kBKuS6RIuGTFrrexNEf3gH1VzDsDN70yByVXjgoP1ucey+Ig6dXnBqdrwYg51+9OIllUWj/wR0V5Jhmzp12ftfUn1HlhmN3gm3Tt/0gBe6Ot3/I/615zC+O9/7iVuIF7mpFeekOXpA0glEoemKpBALG3DmdBNBOd5yw6HLyZ6KFHH+5Hq/hloHo7dYjlZCFvEmYPki23yIjpsiYH8uI1gG9dpuSE1X5hK5t8tQ6tHfDCgA7tsmj5lSHvt8LazA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MN2PR02MB7024.namprd02.prod.outlook.com (2603:10b6:208:205::23)
 by BYAPR02MB5781.namprd02.prod.outlook.com (2603:10b6:a03:121::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.17; Wed, 30 Mar
 2022 07:48:19 +0000
Received: from MN2PR02MB7024.namprd02.prod.outlook.com
 ([fe80::4039:c3e8:1ac1:b46c]) by MN2PR02MB7024.namprd02.prod.outlook.com
 ([fe80::4039:c3e8:1ac1:b46c%6]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 07:48:19 +0000
Message-ID: <MN2PR02MB702476D340C5220423604826D91F9@MN2PR02MB7024.namprd02.prod.outlook.com>
Date: Wed, 30 Mar 2022 13:18:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: marijn.suijten@somainline.org
References: <20220330071759.ftcs2fhr7ehrfsqs@SoMainline.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable
 qcom wled backlight and link to panel
Content-Language: en-US
From: Joel Selvaraj <jo@jsfamily.in>
In-Reply-To: <20220330071759.ftcs2fhr7ehrfsqs@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [aaVB0Sb0Yny6xzOjWPOmI5x0weRF4pUoMBPbfW0FP31pSHndSC8rmYYetl+M4i9K]
X-ClientProxiedBy: BMXPR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::28) To MN2PR02MB7024.namprd02.prod.outlook.com
 (2603:10b6:208:205::23)
X-Microsoft-Original-Message-ID: <ac25c1b5-5998-e462-fff0-daca8dc5b2ad@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c3bd860-ba82-45dd-7424-08da1221a825
X-MS-TrafficTypeDiagnostic: BYAPR02MB5781:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5JBgab3bvGNi0+fiIYdsccgg2No+jB7/O0tiWoNKwxuDBa0cgQB7mV5U0+sBCYa0GjwQxVGFW9otw8/Gjjs+LZymfMbHE2kzU99Ez+BJ+CaMyhGmbrWaCsNF+KLJF+SSH1IwqJDkNYd4foXaRESLXcwisA62zmsnlDbz/+HdaLa+0oyWBC2KXPfBl1zB3G58qeObWrciRWC/oy1XWKWpD0NMSCzhuQ91UIId96LMUMIHyByHrO18L0wTpR4Aj1eJmSOiOtAyHEhMlzT+0L61iTb0D1Su6ih3rXAKVY+OZG8Hg5neoAFlUJ7vVWkL6IONVnTfqMTLQuWY3jy95C33SPgObwMw47NvipQ3RxFyubPcMKu53XU2/J173K/yWROz2LepCKxLix1XM+/ADxqDowP0cQ9vb1cCfT8LKIkCNI8ngrjO9XDuKM7iIvXGrKysU+4CscGbndY3YM8XAmh4pXkiDLT2c6lIBYNH3dfq1m7J0G8J5BbHADTsGOgQ9ceBbDf8MCr/IUgLXanN21YNx91EYm+rSCfGxwEN+Mu7CHfkzdxHW/FQZeVHFJMwHCQO6pStdpe2ids4vK752gfxA6cf3s2MeDDsWSYoJ7t188E=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnpXdzZlY3lMRFJLeEpYN3RQaVEzdXJ0bDNFNGN1eUkxSGw5bkNjaWlDbHo0?=
 =?utf-8?B?UmM4bnhEYThlRDdacHJMeVhCcEYxLzgzWkZPYUFISHZ5TDJhTDhHY2U5SEdD?=
 =?utf-8?B?a0pCc0FXczl3S3hBdDNKUDNFSVNFOWREQURmRGM0K1JpQVpKd3BGSHpQQ2Zl?=
 =?utf-8?B?azZZZWdIbFZIc1RVbTV5T0dVRGZaV01EUXptdGx5L2hhZE1zbDRCQjRvcmlo?=
 =?utf-8?B?TFFCbjZpUXExRHR3US9BdHY2S2lkbU96aTFra1NhZjJxdHc1WHY0SEJKNXFH?=
 =?utf-8?B?YWUxK1djbERJcmgzemFIa3RiRXZTN2JGZGFVbFE3Mk9PMmJMV2lyTkhIWk5G?=
 =?utf-8?B?TkJzeCtoY1lrbXFaeTN1Nys2TURrUkZEL2prVXZkVUlQY2Ftc1RYdHVibmhu?=
 =?utf-8?B?RGdRSzJZZnpQOXpVN014bG9temVkSXlBWGpHNzZidHNPN2lKdkx3eHNrZlY5?=
 =?utf-8?B?MkxNRGpvRWk1NUFFakU2TEl6dGNVMzRieHZCOXdIdDdGdnRzS2Q0N0Zkc0Zz?=
 =?utf-8?B?MG9ONitMQzh2UWgwRUcyc2RwNWEveCtBUHF3dE1iMVlkaENoMS91L01tL29m?=
 =?utf-8?B?UW5PbnQ0bU9ZNXVnLzlaTzRDZGRYTU9ia2UwejRzQUpOaWZQblB5V0V2MWFa?=
 =?utf-8?B?Qi84TGRMT2RrWlkwdlBsdE02YUlabFpaaWxRYS9pNitSUGNGbVQvcmhnNVY4?=
 =?utf-8?B?QUE3Y3VKUnVnV1lXLzdraXRIZExvejFzVnBDendBMWEraUQyd1dBeEIxNE44?=
 =?utf-8?B?dFhCRk5kd201Zm44eFo3L0pEQzAyb2lEaW5WYzdPSmRaQXEzMEZOcWhzZ09t?=
 =?utf-8?B?cThFN3JIN2gyMEIrbnBDUW1pVGpraU5lamVmVWlULy91UmMydVRnMnBVSGpi?=
 =?utf-8?B?UWordWtMWUFESVBWdUpvaExpcFhWbHg2M1Z2a3lDOVg5TmhTbUtzRFNYM2NV?=
 =?utf-8?B?d1lLQnc1RXBqUlhiMHdyMmNZWU1QdVU3aHZzSExFWXVvOTExWWtHRDlPT0VX?=
 =?utf-8?B?d01zTXZmeUdqa0pSUm1rMzJxOENEWFhHUVB4dW9VYUk3bzE3dG1kY21KRjFU?=
 =?utf-8?B?Y0hkc0V3NGRya1UzVHpwQkRvdkg2R0VWTEx5RWN1bWNXTFQzMlQwZnJJZGxz?=
 =?utf-8?B?NnJ2ejNJVFVaNG0vdXo1K3ZpZGpSRjUrOGhXOGtidk56M0ZzeHZTU0Jac0V6?=
 =?utf-8?B?bDR1NjJXbE92WDZkbnQ0TG9kQ1FzWU5YTGpCQ0JkNWJxNHFwNndBTGRpcURT?=
 =?utf-8?B?S3ZmQllWUDBGQUYxNk4xclRtVFE4ZWFhSlpvWEV3alpkdDdNUVFvelBPRVcy?=
 =?utf-8?B?b0o2eEhTUis3MmVKZzVrVkh0VEVMU29RNkk4dUtEWm83S3BtYkpOR21qcVhU?=
 =?utf-8?B?VlhVOUFKWEpSRFVhN1dtYXNiSzJTNXp2d2tCVDVRcU5PcjhRWEsyWjQrTWNT?=
 =?utf-8?B?L2xUOFIxVjlaMXI1N2xuRy8xWWF4R1g0aExLRE54ZWVwcDZWY0FEeDk2SExk?=
 =?utf-8?B?TkFHNVRZeTFOM0Zxd1MrbGJ2N3JXUmVSajlrWHZLMHhKZ3dZZ0E1WU1zZ3FP?=
 =?utf-8?B?c2ZUckZxWjFkS1dhR3B6M2lPTkJXVWRXNVhWdGwvanRHcG9lYThGVk4wdnpY?=
 =?utf-8?B?SWQ0c2NvTEVHd0JwMHBGMEplUmU1UW00Y3dLQk1QVUlncnJuVGJTKzI0QVk4?=
 =?utf-8?B?eHVIeUZTeVp1dnhuTk9MZ2VUZXhmbTdzb1dwbVpITHpjVGcvMURMOThBT0ZE?=
 =?utf-8?B?NlJYTVB5Z1BWZEwxSSt5bDNCdElqcUx5aGNGL0huck12L1I2NjF1NzUxTjFa?=
 =?utf-8?B?UnpTaytHOUx4VHZzbDh5NTgxWDRSOVFvSVl4WHJtMllydGR4WjF1cEgxdk05?=
 =?utf-8?B?ZTRoYnAxbnlEVDJDNzZWY3ZGWlBrUU8vUGxmNkd1TkZRZGw3R2IyN3BsTzVJ?=
 =?utf-8?B?OHdXdVpPR2l0Si9aVWFsM1dvL0c2NFRnWVMvaXZaQzd6RGh2dThsdFJVcEJl?=
 =?utf-8?B?WmtYbUU3Y253PT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3bd860-ba82-45dd-7424-08da1221a825
X-MS-Exchange-CrossTenant-AuthSource: MN2PR02MB7024.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 07:48:19.4186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5781
X-Mailman-Approved-At: Wed, 30 Mar 2022 08:28:04 +0000
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
Cc: amit.pundir@linaro.org, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, agross@kernel.org, thierry.reding@gmail.com,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 sam@ravnborg.org, sumit.semwal@linaro.org, jo@jsfamily.in
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marijn,

On 30/03/22 12:47, Marijn Suijten wrote:
 > On 2022-03-30 12:26:39, Joel Selvaraj wrote:
 >> Xiaomi Poco F1 uses the QCOM WLED driver for backlight control.
 >> Enable and link it to the panel to use it.
 >>
 >> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
 >> ---
 >>   .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 13 +++++++++++++
 >>   1 file changed, 13 insertions(+)
 >>
 >> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts 
b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
 >> index 798fc72578a7..3ebb0f9905d3 100644
 >> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
 >> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
 >> @@ -231,6 +231,7 @@ panel@0 {
 >>   		#address-cells = <1>;
 >>   		#size-cells = <0>;
 >>
 >> +		backlight = <&pmi8998_wled>;
 >>   		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 >>
 >>   		port {
 >> @@ -314,6 +315,18 @@ vol_up_pin_a: vol-up-active {
 >>   	};
 >>   };
 >>
 >> +&pmi8998_wled {
 >> +	status = "okay";
 >> +	qcom,current-boost-limit = <970>;
 >> +	qcom,ovp-millivolt = <29600>;
 >> +	qcom,current-limit-microamp = <20000>;
 >> +	qcom,enabled-strings = <0 1>;
 >> +	qcom,num-strings = <2>;
 >
 > No need to set both nowadays, the driver will even print a warning in
 > this case:
 >
 > 
https://nam12.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinux-arm-msm%2F20211115203459.1634079-6-marijn.suijten%40somainline.org%2F&amp;data=04%7C01%7C%7C2104b54ac0f54308dd1208da121d706a%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637842214894184949%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=GYmzHoy6tTAE7ZNTqclfCZH5Fnu%2Bh5d5JHOwsm4wVro%3D&amp;reserved=0
 >
 > Sticking with qcom,num-strings is probably the right choice here.

Ok. Thanks. Will fix it in the next version.

Regards
Joel

 >
 > - Marijn
 >
 >> +	qcom,switching-freq = <600>;
 >> +	qcom,external-pfet;
 >> +	qcom,cabc;
 >> +};
 >> +
 >>   &pm8998_pon {
 >>   	resin {
 >>   		compatible = "qcom,pm8941-resin";
 >> --
 >> 2.35.1
 >>
 > .
 >
