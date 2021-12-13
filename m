Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C1847240C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 10:34:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92FE10E6FE;
	Mon, 13 Dec 2021 09:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1528810E6FB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 09:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639388068; x=1670924068;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w730D4l3HZndNPKFe5UzXAPyY1xZZehyKXiT3KjCHxE=;
 b=jTw9NU9FHXWlL18+xdRl8WvI8jTa1eOJjFR/5s8yTWOzK6Im8FJc5/bn
 56ZHUVJ5115Tx+w7s9qvZIqm30Qem8zwMO1VWkhWZkTQKUZdlzg5OWbJc
 Zqf0v+058Mdh/MhN/SsgBpCTlDBHCUHFM64ukTQo78EzAaLpuhW0uoUPe
 rs9TVD2+TfubfiL3pSyImJZcG5WRiyG/O6DhEyTIlr0qDGHBCqvAFK3C0
 g4CATeh+ojskH0oThY18Pep44OISCzUQsED2ZrmS8kV9XU8pNIas0Ro7x
 MmE5BId6BF4Nj/rCanB+Ot9viJ1YkaAhlLyz4+oQ2Hr6LB6fpysTPUlYP g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="324966624"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="324966624"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 01:34:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="544720739"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 13 Dec 2021 01:34:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 01:34:26 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 01:34:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 13 Dec 2021 01:34:25 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 13 Dec 2021 01:34:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2Nr8MpcGxWYZoH3UFNeaU2Cx/QAGghgSiG7BS4G79R61IwNB7YiwnxDl3spqKioxsxQHdpOKgHiZCwlCoCsgIBvNWjBQ4FyqKSNeZC6hD7zrXNUQNeGpbg7XUZ9T+fDLu4WJDToOjiUNakEMyZJXHKC1hgyIyxOCDL3w/A+A+LSpyENHPTgR5mQ/xcVDi/Hd86DBoQD88oNlwNLeqEaJDBmFe1svgM1kHsdWs2UaLHY8AcwhBbyIH0pJHZP04pvN75Z67R+b0I//544ccpBHiR0l0Du4S8SJinfzg6TZ/ytIFppSIoy4QnFM/zlY0uD8ZQcVx2rEwS+Dc2V2iSGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLomXsCjR+tOsITFIit0rdQWCzLe8/L+QWQPbr8gBVg=;
 b=ST/Ro1Sf83auv8LZIQ0uz9esoMK7RhiDJiOsy3z7xwQiKEX2qa/OzmJAgiV6JmGDa0hr+LvRe9FqZj9RJ5gYNBEXhEJD8w4SFHifV6hxkxKdVr3MvlRjTL3mYveXK1ySbKK3GfkjPZ3OZ2gvQpKIwCLFWRoN3XXVtuygHDkbCj5GyYYsPUaH/B297Hu5jG84nb540k2e2dnbA5qaM2YfIbxYFHjaMoUnPcsbDlh4NnkVg1V2NWh2VS6W5KrirG6PcE/BT7v/5eTKMKI/ah4fd7zoDbAUEIK0HISlpt7UqUOPpDHWpTGTdUvEeKQn7wcBwHEblF6OZkUrB6klBxHUHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLomXsCjR+tOsITFIit0rdQWCzLe8/L+QWQPbr8gBVg=;
 b=RfTGv+s/u8nqK8j/Fxe4UGyqloWvSU+6KWjo7Hd3dxqjHXpQZU8dBGFaY1Rb07USdNuWgwRqda5x6Il3ezJIt5dv5+1sY24yctiCBUiVEKR6C3M8FUHh7QGMacQvUmyr50KQMI9ueSw2I0aTxykOxLjhr82zRDt5ajBRMp03YD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM4PR11MB5421.namprd11.prod.outlook.com (2603:10b6:5:398::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.15; Mon, 13 Dec 2021 09:34:24 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::a94a:21d4:f847:fda8]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::a94a:21d4:f847:fda8%7]) with mapi id 15.20.4755.028; Mon, 13 Dec 2021
 09:34:24 +0000
Message-ID: <9c33b64a-65cc-2894-bda6-95f27eb2cfa0@intel.com>
Date: Mon, 13 Dec 2021 10:34:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH v3 3/7] drm: exynos: dsi: Convert to bridge driver
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, "Robert
 Foss" <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>, Michael
 Nazzareno Trimarchi <michael@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>
References: <20211212181416.3312656-1-jagan@amarulasolutions.com>
 <20211212181416.3312656-4-jagan@amarulasolutions.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20211212181416.3312656-4-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0122.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::8) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
Received: from [192.168.0.29] (88.156.143.198) by
 AS9PR06CA0122.eurprd06.prod.outlook.com (2603:10a6:20b:467::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 13 Dec 2021 09:34:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a36ec20f-6524-4373-87d3-08d9be1bbfa1
X-MS-TrafficTypeDiagnostic: DM4PR11MB5421:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM4PR11MB5421AC90B0A9382C499AB9DAEB749@DM4PR11MB5421.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y/eDSQW86TAJzI5mPlRz59qcd9Nbyy+R/umFL6XC+/QpB4tEsbachGKRigtCihrqwvE5C8dY9RIcKMv2Hlu6OYZcZdIPcWUIw2zLDYw+nBLZl6qOhRIu9BsjHs3imaqBD+EPWcDa2nPHJG7wEE/3unwhucXTXh583XQmW+39k7TnV0CAQ47D0rAvBvf05HxUseQvdgEggiNn6w243uEqxKgcJcAMH2doK14wC0lBmHw6p27T+gW7PRrwwNF9y+MVG2hoxsah5U4LscYXCIBsin44bsu1qU6gSLqLqfJCYrqJrUtyBpgmAVcjGMW2g65tS1MB31CfdEcoOcTjGwGUePCPiSjKRYpTiw8MXwU8e57ryJhoK+FWC5tK8t/OnN2125rZ0MX0+eI151VTRoQE4ScT547fRuhVURiTgnIHTQxfoxRypoF9vIz5OrdukF20PrnWYQiS4OsmYQLAnYtGQSjSGPFgZ4NhN/M3QusU3hP3L9AnSoRyn7fPssVP31/jDcavBdd1839+H/63SWRff6+PunPmULJCToEk+2zo8AUDh3fLSvMbc8QR58GDPF/Cr7HMxr6n3vcrD7g8tFEcVBE3EW4fgGIxuiaqEdX2UKYeTyfX9XC17+7o5PTxedoLvFIsdWNRV9/Umx2C6rLGLQeIXaEXxeA97K971dVyOlnaBvQCAvY532MpcQgBe9m3FV39zvJF5HfrrnlYLZhJ84BRPrFC80f5PKkEQXKrusg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(508600001)(53546011)(186003)(38100700002)(2906002)(86362001)(8936002)(31686004)(36916002)(16576012)(44832011)(66476007)(5660300002)(66556008)(110136005)(4326008)(956004)(31696002)(316002)(6666004)(36756003)(66946007)(7416002)(26005)(83380400001)(2616005)(8676002)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGRjQXZJSDV4RldjS2crQ1VBQS82dHdIOUdKbGEvb3BHYXZNNjZvdXhvZlh5?=
 =?utf-8?B?dllRVFB6bVJVRnBuL04xRHlPRHF4dERKbThPL3NUV1pWaGE0NzV1V1VmVHdR?=
 =?utf-8?B?cSs0ZTVEc3N3UU1NeFlUVkV0a3dXOVRzMVRFNS9QTS9RUTFzVW9kSzA3RjhO?=
 =?utf-8?B?TzNsQTVuTXFKTTlGbmI2bUU4dlZYaitZMERMYnhvZVN4ZU5XMUpIb0FlMWxs?=
 =?utf-8?B?TXdPTUVMRGIvQ3Z0cnd4Uk9wVzdwNTlRcmJBaUJ3aGwvbks2dmpQb3E4TzNN?=
 =?utf-8?B?MWZTT1A4K0x2TUcrdlRTZTJVcjBzMjAwcjdOS1JPejJVSk1Ca21RR3h3cmhF?=
 =?utf-8?B?bHFrT090VSsrMGcwNURLV21EbEJNVU9QcnFWTDIrMkpCVGdPUGswOVg5V1Jx?=
 =?utf-8?B?Y1pFZi81bi82dWxQZWU2SmRWNlc2eE1ocEVPb1hUaHc4MkVhV0dKaVJkVDd3?=
 =?utf-8?B?UGxGSlhQZ3Z4WTMxUUdGNk5iREh1Zi9kOUt0VFV2QllGaHc2V0tCamtoeW9M?=
 =?utf-8?B?S3lXQ2IySjdsMlZSbk1wTyt5eGt0cWhkOEtqSGVmUlFEOXd1LzBpeEtkQkRh?=
 =?utf-8?B?eVhhVGlXdEVGa2JvUnlLbng2ZFViM0RIZHJaSVdyR2hGL29vckw1MjNrMUVs?=
 =?utf-8?B?S253b3ZiL0daSWFMRGxWdG84Z01NcVdWQWRROGlXNGYyWE1mWTV2OGFUOG5j?=
 =?utf-8?B?MTJudjVtTmxHVGdMZlRFa1FMOW1nRnlhSFBTRWtRa1NsRmRHelVQOWhsTFAz?=
 =?utf-8?B?RXpqWmZ3ZnlnM1FaWHI4eE1kVkFsc2VDSUFuekRKQU5qL21mbjNNNVp1aGtC?=
 =?utf-8?B?dTJYNVVMUmZyOVRnalFlNXFIWXdsaXZLWU5GRjVWZ2tVeUZRR3ZSeHlUa1FW?=
 =?utf-8?B?STM0RHdpcktFRDExbnJ5U1dyWm8zV1ZaQVk3TSs3ZUtITURidWI1bjlvcE1V?=
 =?utf-8?B?Vy9FSnp5enprRWtWK0twR211NlErWHpSNUxkN0J6SEFJeW9FdnZSOFBXUlhP?=
 =?utf-8?B?Z2FYa2J3YjRFdEU1cUd2NWtLRDBMa1F3VU5qYW1iOG9MbVkrd2ZtWmJmdDk2?=
 =?utf-8?B?TWU5dVYrZEV6dG9aSmNsNFZtbmRXelJWZFlCNTRPRmw2TFlWblFXUU54UnZp?=
 =?utf-8?B?S0NKbjRUWitFUHR6T1NiTTRrNitMemZHOXd1T2d3aHNsZlM3V2xZSHJyTStz?=
 =?utf-8?B?cGlCUEowSXJuR2JLZGNGNWorZVhxQ2Q5QWtMRFB5MDJla21JT1ZXOVlySnFL?=
 =?utf-8?B?UWhNcEhZWUtnREJqN3lQYUdmSEVNTmEzQ2ZnTHAzWkNpYkRvQkhQc0YrWWRj?=
 =?utf-8?B?T0VCNnZScTY2MmtDcXo5YWI2U0VxU1drNm81K3JrZkc1d2FSSk5wU1c2VjlX?=
 =?utf-8?B?SVRXTGczeVU5MysybW1kODJVTEl4TW52aTZyRDdySklIUitwcUltdlh4VGYy?=
 =?utf-8?B?dGpldytPK0R3WlVTaURPR2prQ0NyTmpCN2crZWkrTWJXeUlISHN4WTh3VDEx?=
 =?utf-8?B?VHVHSDVWQ2pBUFNFTXNFNGxqdjJLUlo1eUQrQUZxbVpMK1ErcEgxUVUwNHdV?=
 =?utf-8?B?UzdvVDNtUzJkMW9PVHBpSEVtbTRzeWdzUlR6UVNkS0VibnVJYk5nWFYvaEFv?=
 =?utf-8?B?VWxoUnFObXRaSDRlUHhBRFVVdFR6Y1RBYytzaWJSUTFxQzJBd2ptMExtcjhh?=
 =?utf-8?B?RGExb0pGbmR0WW9nVHQxRW9RU05qOFJacWEzNkFOZXJSMXNvNElBVStSK3JR?=
 =?utf-8?B?RHUxOERXVFB1QXQwTWxMMW9hVGNZQnNTOGFteXBhMEpQNU52YUZPdm44U2o3?=
 =?utf-8?B?N2E2ZE1DOHl3RzdYeGk0citDUHRLdmhkU0xCWitGK3o1VmtPNFplY0VveERE?=
 =?utf-8?B?WkJsWC9ySzFTUXRxaXd4TFA0cVN2MktVL0U2bW1sWlZreFZMdTVhcGpkb1Rm?=
 =?utf-8?B?YVNJU3BYeTBQRUJXMjh6d0ZHam51L0VpQkh2MWFlblE3c2RQcTBrRHpNekNm?=
 =?utf-8?B?QWtWbjh5RXR0clFlREZ3WndJMEY2WDdtcldEWWo5VVVtcUpXVHdCNUF1aEZh?=
 =?utf-8?B?Nk9oaUxqbG40enF0a0JselZHUUx1Qk5Fb052NmNPMSs1S2MwU0lKQWF5dzM2?=
 =?utf-8?B?ZDJudUFpZVVQa1Q1clFNdy9EQnlpVkFSYzhqU3V2NXhuOXpCeEJ0TW5sL3A0?=
 =?utf-8?Q?Ad8uBZxFOEXPARdYxU3p6kw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a36ec20f-6524-4373-87d3-08d9be1bbfa1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 09:34:24.0103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JspPZF5KvfugMSEi3KkocdIfXg/xzNnOP/KB5z7FtAwRUNZqaScTpeJba0Pa9P05ApXe5BV2FSgLhrLn0iiAgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5421
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
Cc: linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12.12.2021 19:14, Jagan Teki wrote:
> Convert the encoders to bridge drivers in order to standardize on
> a single API with built-in dumb encoder support for compatibility
> with existing component drivers.
>
> Driver bridge conversion will help to reuse the same bridge on
> different platforms as exynos dsi driver can be used as a Samsung
> DSIM and use it for i.MX8MM platform.
>
> Bridge conversion,
>
> - Drops drm_encoder_helper_funcs,
> bridge_chain.


I wonder how it will behave on setup with two bridges after exynos_dsi.


>
> - Adds drm_bridge_funcs and register a drm bridge.
>
> Convert it.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - move bridge add in host_attach
> - move bridge remove in host_detach
> - use flags, bridge in drm_bridge_attach in attch
> Changes for v2:
> - drop bridge_chain
>
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 82 +++++++++++++------------
>   1 file changed, 43 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index d1039628b6f2..1450187c1edc 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -259,7 +259,7 @@ struct exynos_dsi_driver_data {
>   struct exynos_dsi {
>   	struct drm_encoder encoder;
>   	struct mipi_dsi_host dsi_host;
> -	struct list_head bridge_chain;
> +	struct drm_bridge bridge;
>   	struct drm_bridge *out_bridge;
>   	struct device *dev;
>   
> @@ -289,9 +289,9 @@ struct exynos_dsi {
>   
>   #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
>   
> -static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
> +static inline struct exynos_dsi *bridge_to_dsi(struct drm_bridge *b)
>   {
> -	return container_of(e, struct exynos_dsi, encoder);
> +	return container_of(b, struct exynos_dsi, bridge);
>   }
>   
>   enum reg_idx {
> @@ -882,9 +882,10 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
>   	return 0;
>   }
>   
> -static void exynos_dsi_set_display_mode(struct exynos_dsi *dsi)
> +static void exynos_dsi_set_display_mode(struct drm_bridge *bridge)
>   {
> -	struct drm_display_mode *m = &dsi->encoder.crtc->state->adjusted_mode;
> +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> +	struct drm_display_mode *m = &bridge->encoder->crtc->state->adjusted_mode;
>   	unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
>   	u32 reg;
>   
> @@ -1376,10 +1377,10 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
>   	}
>   }
>   
> -static void exynos_dsi_enable(struct drm_encoder *encoder)
> +static void exynos_dsi_enable(struct drm_bridge *bridge)
>   {
> -	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> -	struct drm_bridge *iter;
> +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> +	const struct drm_bridge_funcs *funcs = dsi->out_bridge->funcs;


It will blow up in case there is no dsi->out_bridge, the same case in 
code below.

Beside this the conversion looks quite well, I hope tests will pass well :)


Regards

Andrzej



>   	int ret;
>   
>   	if (dsi->state & DSIM_STATE_ENABLED)
> @@ -1393,52 +1394,53 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>   
>   	dsi->state |= DSIM_STATE_ENABLED;
>   
> -	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
> -		if (iter->funcs->pre_enable)
> -			iter->funcs->pre_enable(iter);
> -	}
> +	if (dsi->out_bridge)
> +		funcs->pre_enable(dsi->out_bridge);
>   
> -	exynos_dsi_set_display_mode(dsi);
> +	exynos_dsi_set_display_mode(bridge);
>   	exynos_dsi_set_display_enable(dsi, true);
>   
> -	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
> -		if (iter->funcs->enable)
> -			iter->funcs->enable(iter);
> -	}
> +	if (dsi->out_bridge)
> +		funcs->enable(dsi->out_bridge);
>   
>   	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
>   	return;
>   }
>   
> -static void exynos_dsi_disable(struct drm_encoder *encoder)
> +static void exynos_dsi_disable(struct drm_bridge *bridge)
>   {
> -	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> -	struct drm_bridge *iter;
> +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> +	const struct drm_bridge_funcs *funcs = dsi->out_bridge->funcs;
>   
>   	if (!(dsi->state & DSIM_STATE_ENABLED))
>   		return;
>   
>   	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>   
> -	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
> -		if (iter->funcs->disable)
> -			iter->funcs->disable(iter);
> -	}
> +	if (dsi->out_bridge)
> +		funcs->disable(dsi->out_bridge);
>   
>   	exynos_dsi_set_display_enable(dsi, false);
>   
> -	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
> -		if (iter->funcs->post_disable)
> -			iter->funcs->post_disable(iter);
> -	}
> +	if (dsi->out_bridge)
> +		funcs->post_disable(dsi->out_bridge);
>   
>   	dsi->state &= ~DSIM_STATE_ENABLED;
>   	pm_runtime_put_sync(dsi->dev);
>   }
>   
> -static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
> -	.enable = exynos_dsi_enable,
> -	.disable = exynos_dsi_disable,
> +static int exynos_dsi_attach(struct drm_bridge *bridge,
> +			     enum drm_bridge_attach_flags flags)
> +{
> +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> +
> +	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge, flags);
> +}
> +
> +static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> +	.enable				= exynos_dsi_enable,
> +	.disable			= exynos_dsi_disable,
> +	.attach				= exynos_dsi_attach,
>   };
>   
>   MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
> @@ -1460,8 +1462,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   
>   	DRM_DEV_INFO(dsi->dev, "Attached %s device\n", device->name);
>   
> -	drm_bridge_attach(encoder, dsi->out_bridge, NULL, 0);
> -	list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
> +	drm_bridge_add(&dsi->bridge);
> +
> +	drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
>   
>   	/*
>   	 * This is a temporary solution and should be made by more generic way.
> @@ -1499,13 +1502,14 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>   
>   	if (dsi->out_bridge->funcs->detach)
>   		dsi->out_bridge->funcs->detach(dsi->out_bridge);
> -	INIT_LIST_HEAD(&dsi->bridge_chain);
>   
>   	if (drm->mode_config.poll_enabled)
>   		drm_kms_helper_hotplug_event(drm);
>   
>   	exynos_dsi_unregister_te_irq(dsi);
>   
> +	drm_bridge_remove(&dsi->bridge);
> +
>   	return 0;
>   }
>   
> @@ -1591,8 +1595,6 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
>   
>   	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
>   
> -	drm_encoder_helper_add(encoder, &exynos_dsi_encoder_helper_funcs);
> -
>   	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
>   	if (ret < 0)
>   		return ret;
> @@ -1612,9 +1614,8 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
>   				void *data)
>   {
>   	struct exynos_dsi *dsi = dev_get_drvdata(dev);
> -	struct drm_encoder *encoder = &dsi->encoder;
>   
> -	exynos_dsi_disable(encoder);
> +	exynos_dsi_disable(&dsi->bridge);
>   
>   	mipi_dsi_host_unregister(&dsi->dsi_host);
>   }
> @@ -1640,7 +1641,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>   	init_completion(&dsi->completed);
>   	spin_lock_init(&dsi->transfer_lock);
>   	INIT_LIST_HEAD(&dsi->transfer_list);
> -	INIT_LIST_HEAD(&dsi->bridge_chain);
>   
>   	dsi->dsi_host.ops = &exynos_dsi_ops;
>   	dsi->dsi_host.dev = dev;
> @@ -1708,6 +1708,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>   
>   	pm_runtime_enable(dev);
>   
> +	dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
> +	dsi->bridge.of_node = dev->of_node;
> +	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> +
>   	ret = component_add(dev, &exynos_dsi_component_ops);
>   	if (ret)
>   		goto err_disable_runtime;
