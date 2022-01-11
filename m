Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A1A48A971
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 09:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD8510EF19;
	Tue, 11 Jan 2022 08:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBAE112201
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 08:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641890119; x=1673426119;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ihrvz0rwuq2diEIDRUnDfRWxBR2Jt/ke++Q0hzU6cso=;
 b=Jr8K9muZrMpABiSe+d5m9tjlXITPHBIR6u+7aa/tZZysKH4r2GwaRshA
 gNsFg2Ct8n5o5X+FON/W1wkoZYeAji4AiSklqRTjeerGEA38i92ho6778
 6pkOYYj6BHKOqGFVmPsIq3w62YVtPmXJZxir4bd/P1r7lZ4xn3bEDIiZp
 l/w7xjydX95x2yxRwfZLUrmS9l3+e7UUz3acT4ID3jq9sKSOSWWctbRFQ
 lQFkd2hhhbYDg7+Ii4PxK2PMvAjWcmbuYUaTanK8sY3U5m89t2EsQ3IiR
 R5ETVBDScIbYEKCdOp6e5ssmKQdPSS6MvUquMpX5NX3gmpNeF3xPdiRVw g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="223417709"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="223417709"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 00:35:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="515018507"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 11 Jan 2022 00:35:18 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 00:35:18 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 00:35:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 11 Jan 2022 00:35:17 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 11 Jan 2022 00:35:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrEoR/3v0D6xqRBIJl2dSfyUkJHcA60LOqiHVs0Qu8nK43v1XhQvLd6GqXV/4WajSDBN8dgzsx4MXrjPhAItfKZsFvuYuWRQ7GFF2d6isz3Rb862u2Ct6yJHwSFryQlL+431QgDW1A+9QdGEJvtvgI9Vzp8/mRCcacZCk/HEAAiWaMptMkKuO19dzGbddpcZqexTeL0dm4IWdggKvWvARhIpz0l32LRKZXsQDUKuLPk8MyKfd01qrHFrI3yUWqmbY3ED+b4S/OcWZTEKloBa3+VS5MTK+/z0liYkyiHvCxozuu58U9wlZrhpGSczI4EjmvvhzJRyyoVABu7bL7aDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeBsVdox6Gk3h/ogtB1mktG9LIqFk2XE+903y4h7WG8=;
 b=Z6Ss5ElaxRqGdl7/SL/BTQOK72niSm9lW4tZtHh6RfKtd/8zn3SMkQqLPlVs3OctwvpHHpdjmlLamDcssqv9uRzX2Z+Hb5P6+98Z+q2b0KRL3JR3apF08ukLRRtPUh1ebH4O4uS3VvSmkoph5YptIFrOMlvTXq0y2NcPQ6k7y8LwKaDUtotZmcmWyzYGKuTInFsMF5lxeBIO0L0SheTJ1+77QJ9o2ExcOUOjpgj+Eup8cddC5lyz9ORlquFI4TBGVGSUkiTXZMh1SpeuBcXLzFlZkldXzIJ/B9KaDFoxZEPMplCFKw0CWKmJMm5TMpEEIFjWSXFFKN9McKf3XgtFrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM6PR11MB4641.namprd11.prod.outlook.com (2603:10b6:5:2a9::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.7; Tue, 11 Jan 2022 08:35:16 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d%3]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 08:35:16 +0000
Message-ID: <9912c743-8acb-c59a-760a-a9b79ed48784@intel.com>
Date: Tue, 11 Jan 2022 09:35:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH 1/2] arm64: dts: exynos: Link DSI panel at port@1 for TM2
 board
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>
References: <20220110152714.58220-1-jagan@amarulasolutions.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220110152714.58220-1-jagan@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0172.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::15) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4871341-0247-4a4b-e13b-08d9d4dd4aea
X-MS-TrafficTypeDiagnostic: DM6PR11MB4641:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB464184DE4ED3DA6B87C484C6EB519@DM6PR11MB4641.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OP0Ei44XodrN79Kled8jw5ZFRKVXDU1yqkulf+zo+nnYrtpCj9/fPqvfBsb1HDF81Ni+l9nGaZOIdNBUafNxJhXtHb5nMFwxCh/mm6595COtYdY+OeDxYRmuwbIkU7BXFREIYujAQnO/VZqwwuxPmK8ZRKOrLhDccERlW+71tByNN30VfWDmuriv96M63mcBQdlRfbFDduplX7MlqUqB3PEEUKP3YCnECiMJ++5GkbOvAKnafkFC95H+zJzegnmmsNeFwB6veSjlmzQVfZXPv94oFePIn3vdeSyvYGO+RUbozF0RjI+6Z107AzX74zjWbfc8WFYLyO9z6UK5ZujyABGqenjBUaMpLo0M5viJTJZkyy0T9wIfLYN6Z1rQ9wcd4WwBrFggCVgGkGEdbSx3sPuUL+k77WDnkCZXp9YMKMTwxuwS1TTNBXEiJbKchqCIqC8Tip94FXcCwD/qIlKESPiiY96Si4FJtN/mQx3bKDPfaHhYwiq5CjhwvX9dr7Rmrpdt8kUk3LOt3nLsyI0KlHLgtzf764dyuaKikwOooiHKfBfw06nbNB/8+RRTDlEWay/dRTAWfvHe8VsMYmFCBf5iK4GC+EtUDV5Hi+bAGhvuPC7nMVcz+fLTUJ3kN9Huun56J/VAbRgPB/qbEmTxTxptMfy6vjW26h4xIeaYcOdJMqss230lt49fT+5k2p4/q0yFiRUSUh3IcqlLlNlpLdBpFTAMk6iLdoCDKOp8o2f8D8NEunsJwttFKwmFdFcz4jEQ+/K6eFDe/PO0J7L6UC1fYUjVLJvSEV3f1UmbeeDHKqUUQlqPyuGxiN7Uae1b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(4326008)(110136005)(6486002)(5660300002)(36916002)(2616005)(44832011)(2906002)(8676002)(8936002)(508600001)(186003)(66946007)(66556008)(26005)(66476007)(966005)(6506007)(86362001)(53546011)(83380400001)(38100700002)(6666004)(31686004)(82960400001)(316002)(6512007)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1d4R1RobWZxdElBdHJLSWFMZVVUcm9vcW1IMW9nZ0xlK1ZUWE5EOXE0VXlS?=
 =?utf-8?B?Rmo4VndZTFdTZ25Oc3NqOUs2UnpGWnpuZURqRUdzWjNOdmROcTlpcnJ1MlVK?=
 =?utf-8?B?SjlDTURhQVUzeFZTUGlLOFpGc1l3Mm9yZ2xrdlkxckN0MVhMOGR5cE9FNXhr?=
 =?utf-8?B?Yk0zZ2V6ZWFsU2ZuaGhnUFNTWDU3UHhHeUxwY3YrbXozeW1vdVFWT2xRS0Vo?=
 =?utf-8?B?K2paSWZ4TlpGY3U4ZDIwWGhYRWViVVBWcUdIYTNOazZ0M2RMV0VGd2M5LzRD?=
 =?utf-8?B?MXhFSUhOQ1hZRGxJMFlhZ25wTjFMa1hVNlB1dTc4OHNOQ1orQllLanFnSWZv?=
 =?utf-8?B?WCtleVY3dDExUEdGTkNLT2xqY1c4ZkltQjhoK3RTUkFGTWJiZ1FCUno2SzdM?=
 =?utf-8?B?N3hiM3hPNzhuK0xTL2JRNTc4OUJlRVZPdFV6clJoOVNXN1pLcnkzNmxMQVN1?=
 =?utf-8?B?dnZ3bERJSEp3ditGTnhSMUp4TDR4YVVrWE1xaWRNczN2aFZBS3NDNDBjb3ZW?=
 =?utf-8?B?TUxJcnZyVFNkemlOdzk4aGVIUXBPRk9ZMHVNZEpGU1BSTElZSHE3UDc5OWts?=
 =?utf-8?B?b0JrdjhGb2U2S2FQL1RwcnZuQnJtcTdQbmJBUmR6ek1ZK0V3Q1JCUkdqUDNi?=
 =?utf-8?B?N3VkQ2VZcnRSaEV6ZFFUanV1M055bVMwV2drWElLS1pGQW9iS0RFRWlOaldt?=
 =?utf-8?B?L1d0N3FyMGxKRkxOcEZCbk5pVHFBL3c5QW1oaFJBdU1MWnpPVEE4UHF6S3Uy?=
 =?utf-8?B?ZXM3T0lCN2ZqZllVTEc2NHVEcGI3RFNVM3Fzd2greWtUSXI1US9rODlyQ0RP?=
 =?utf-8?B?c0NYVnUwaU10OWlpcDFRVHhzZUdFcWtQbWMzTmozTUhkaTZHZTlSS0hnM2FF?=
 =?utf-8?B?Z3c0VnNza3F2MU9qNFM3aUhRWUoxb2hlOW01ZFJ1dTIvODVjU1UyaEthZUJr?=
 =?utf-8?B?S1JpWG1mb1lYNFBBdnZyTktuZ1NTM2twZ21lZ2NQTWUrVTlkVlRVc3ovUkQ2?=
 =?utf-8?B?UTRVazN0YXRYbnZzbjRXMzdodklwZm5DSFpnSURZRmtrWUx1VTlTOU14ei9Y?=
 =?utf-8?B?Tm90SzZBV3ovSVNBT2NmQ1daYUwxRmsrbDUxNlpUMUJld3JRQStBdEF0OEhR?=
 =?utf-8?B?blM1QmlwN3RqOHBUb2E1c3FwQlp0VzRoVjkvSjVSTS9FN0tEV1BsYlJBNTBU?=
 =?utf-8?B?OGFGVmwzWW1hVmR4NzhuNERObm0va05vR0lnTXY0KzZGL04rK1lqTG9ZY3dM?=
 =?utf-8?B?NXl3aXYxMjlUelZxazR3MHRkaXpXbmdWU1hYOU1BRHlBVWpPMSs3bm5PWWxV?=
 =?utf-8?B?ejkxeVBCeFZnZFIrbVJRWm91eVpDY2NNQ1JRL1hTdk5KMklIOE1xdDkydXRr?=
 =?utf-8?B?aHh2TE1GdExIaTRDOTByNHlKUWtQNVBDbFoyaklTcXkxZWRCQTZDd2p2UU9v?=
 =?utf-8?B?c1hjcURTT3VWeXlqMXVXRTFMZ0doMW9lTENCZmFUcGUrbnNyY09vRERTNTVG?=
 =?utf-8?B?YXJWOUs4elVIWFJadkt4MnRQNWdGNmZqbVJ4cHBxQVNlUTBLQW14TUpRek1O?=
 =?utf-8?B?OS9MR3hMVWtvcFQwR2RveFFoL0Irc3FFU2FtdkQramZWRmNFWTlRRXpJL3B5?=
 =?utf-8?B?b29ER2xqQm5sbTJ5TFdITExpWGEvSHN0MUpmcUZWQlVkNHdYRnkzWFJEdjcv?=
 =?utf-8?B?bHlsNGNJYXZVUDBvVmd4T2pTQ0tpS3RlMFRzUmw2RkJRVEhaZFpnL0FVaC95?=
 =?utf-8?B?ZmNYeWpVOUVSa1JiWTdZV1dpVTRlNk0xYlR5RTY1SVp2UVFCN2xRdXUzNjhB?=
 =?utf-8?B?VHIzbndjUjd0dlBtUDkzV2MrMzRFT2RFbnVHRFRqN0hKaGRLajAybktabUo0?=
 =?utf-8?B?REhpczJ5RzlreTBpUnlzU2Y0NmNMbXVoQjhUd0Vja2p0dTYvL1JYQTN2RkpH?=
 =?utf-8?B?TytNNG82Q2h1YVU1a3huZDBmRUR6TThYcUN4WFUwdjJ0RlpMRjFlOFYyVTFp?=
 =?utf-8?B?SXZwa2laZDV2ejRrUEFDREVHUS94UDNjeUI5bXhJY3A2MExDSnZpS0ZtbElh?=
 =?utf-8?B?NFR1dlNOVURDQS9SUzRWM0dZc2dyTi8xeXdQTDhucTY5bHZtaXhkU0NSYlp6?=
 =?utf-8?B?ZzdZbDJnUEIwa0hRL3BoOEt5enpFeWFKMG9YY1NxMXc4OWJadTBncXNSc25Z?=
 =?utf-8?Q?K5A2CTNGV93uIzomJX00Rnc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4871341-0247-4a4b-e13b-08d9d4dd4aea
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 08:35:16.1747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pR1cinFeyqfHUBIDB24BXgev05tDWcG7tKDZo+0j4dEX8nudMGsURq5Obc4NpdgsevXMdqjpJNc2qPQ03RzHZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4641
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-amarula@amarulasolutions.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+CC: dri-devel

On 10.01.2022 16:27, Jagan Teki wrote:
> TM2 board DSI pipeline has input from MIC and output to
> s6e3ha2 panel.
>
> The existing pipeline has child nodes of ports, panel and
> MIC is remote-endpoint reference of port@0 of ports.
>
> Adding panel as another child node to DSI is unconventional
> as pipeline has ports child. However it can be true if MIC
> is added inside port node like this.
>
> dsi {
> 	compatible = "samsung,exynos5433-mipi-dsi";
> 	#address-cells = <1>;
> 	#size-cells = <0>;
>
> 	port {
> 		dsi_to_mic: endpoint {
> 			remote-endpoint = <&mic_to_dsi>;
> 		};
> 	};
>
> 	panel@0 {
> 		compatible = "samsung,s6e3hf2";
>                  reg = <0>;
>                  vdd3-supply = <&ldo27_reg>;
>                  vci-supply = <&ldo28_reg>;
>                  reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
>                  enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
> 	};
> };
>
> The above pipeline is proper but it requires the DSI input MIC
> pipeline to update.
>
> This patch is trying to add panel at port@1 so-that the entire
> pipeline before to panel output is untouched.
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> index aca01709fd29..e13210c8d7e0 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> @@ -53,6 +53,16 @@ &cmu_disp {
>   };
>   
>   &dsi {
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +
> +			dsi_out_panel: endpoint {
> +				remote-endpoint = <&dsi_in_panel>;
> +			};
> +		};
> +	};
> +
>   	panel@0 {
>   		compatible = "samsung,s6e3ha2";
>   		reg = <0>;
> @@ -60,6 +70,12 @@ panel@0 {
>   		vci-supply = <&ldo28_reg>;
>   		reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
>   		enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
> +
> +		port {
> +			dsi_in_panel: endpoint {
> +				remote-endpoint = <&dsi_out_panel>;
> +			};
> +		};


As I already wrote in Exynos thread, DSI host has already parent-child 
relation with the panel - DSI host knows well who is connected to it. 
Adding another links between them is redundant and has no value added.

I have already answered in Exynos thread[1] how could you deal with the 
issue, you have.

[1]: 
https://lore.kernel.org/dri-devel/e541c52b-9751-933b-5eac-783dd0ed9056@intel.com/


Regards

Andrzej


>   	};
>   };
>   
