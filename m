Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EB1760B99
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790D710E3A5;
	Tue, 25 Jul 2023 07:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0711.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::711])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E6A10E3A5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 07:23:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hs2Y1R+qmMcD/v3e4P2AbwZ/H0qafb++lp/TWoJz3p4ji7RzDjU51puLGZr+tK+esaAqtrwW6BWDwnznmant7+NPEkNsPc9sA1Sasw1+Tum1U6PI5tuFuR7R6ELu81KrudBAYfH0fEbajLrPZcx/xn6JFsVxfxIGDaQyc3D6CnDUGOlqdCAatb2ZSNMpT5lUpvr2bq9HViCckThh5Oo7VJsjzTfAdVD6vx0EAo+ELrSpfn1JBo5xRf7LH4uq70zb70JC3cZmrvER2dqARSWM66qCoJQBGXagMdl965MICKY38g/sYSxf/MQSqoHl2Cmgwt9atBV72f0eJLg1jpPB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNtvj6kKHA/O682OTwGzZZh+j5Uwn9D7WfTdmyVNOMU=;
 b=gEez5268SyOH4FDAR8VZJRkJjWlsGNBDkYJZSU31wgtPcY3+Ft94O+zCHc1MNQ1x2yzU+Rq05KKX1FwZbDI5BPqMbNR/YyJWYtxWgap12V/9gi9eeuvYmEdrw3X9P3pj3M3+mRvZbQ0MkbkbfVeUm0XncLPxPXLICKpW4d6NfW/6tXb+ky0LzKSlMCKrdCDVLk/kdozy2VmyYp0R3ApDZHBVVAEsSExZm9jNGD4RcgKYwTfO8yWvGz5HkOy9Pe9V7Cz2z1X9xr7mFFghQuFGmna9wGQv2/cEjBmnXj/xYz7wR5S7WjPeSsTrV1ZPRO7xyb+gxW74kb3YrPCty0pq5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNtvj6kKHA/O682OTwGzZZh+j5Uwn9D7WfTdmyVNOMU=;
 b=U84JBLPVULwkpFTI+G+/i4P15PMhjlPZQcYqz8mlxYGaC4k+qfzzWRILs+3NvCKPlz143+6WSuo6sPbtIkuw1oi7e6fXHFeDe7zXa9lt5UlqQrskURvUfZPJjuyCvV7NRkXoCJfTOTv1BtUdO9Dh32bfGj4SBBmdkPiE8hW1p8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS1PR10MB7935.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:470::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 07:23:36 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0%6]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 07:23:36 +0000
Message-ID: <c6a76777-156a-78d1-5a77-d67c67af11a3@kontron.de>
Date: Tue, 25 Jul 2023 09:23:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/4] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
To: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221216210742.3233382-1-l.stach@pengutronix.de>
 <20221216210742.3233382-4-l.stach@pengutronix.de>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221216210742.3233382-4-l.stach@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::13) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS1PR10MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f0bfba7-b39d-438e-40ac-08db8ce00f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EwnGBEWg33xhE5aNqp+Kh7jDUU0NKgtogRKLETzN3BAmo0EPlpRxser0fr8gZD/e39HEAAsfP+kzIpmpbyLN8j2+jQMP31dgx1g6SyajXQvL/6BPA98bFN4y6DcrRWKsCfhq5ZqeTf22OvTwSzWPbNMvA5kUEWcUjOAF+jp3GbBxQnanUMVmqddbJaHHOwg7Vrfgmp2hE07G5Td1dzIxmtAWusnWSPzYYhTgMVa7/dhpdtF5FjrycvAXsoyIi4DE4ackKcIl0oQ+isckTzjK+gU2SOe2v2w+0gHa66SD1mGwLfbe2b2y6dXtyMsw9xX4FRj4H98ol9UG45oVb8P5bRFhPill0HhBrDwX/+EEm8/EAYz356+k1Up81Hv41dd9u9CAUDqNzaHAauZ+W9QEsaR0A4Sq8ETmmFPsVFmOWaHTU1S4Zm6B8Ll/mWxtN4KUHGRFzMI4KeYVkwuEGqZ5EoitqwOgkbnxT+tCq9C3vJJGT6lyOyvEwlLn2tqVL3IHyED5HlZiKJG/cqi+ER93AcIAdcDDsK+V20XJ/O3OUMr4PjvemzpxiqzTg/kmtD2w1hQRm6b7p3uzSXKDMIP6P6gKfUwEj/A6duvAVkCj05IZVDVUGAD3cq22Y5bUHIRVXqmrCwLiFiIqjfBe2soCXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(451199021)(36756003)(31696002)(86362001)(31686004)(2906002)(110136005)(54906003)(4744005)(478600001)(38100700002)(26005)(186003)(2616005)(6506007)(53546011)(41300700001)(7416002)(44832011)(5660300002)(6486002)(6512007)(6666004)(8676002)(8936002)(66476007)(66556008)(316002)(66946007)(4326008)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmk2REYwN0RyZ0psS0RMNkpaMytwL3o3cE1yL3J2dGpHQThHV2RVcXhMOGNX?=
 =?utf-8?B?alhrTkZXNXRGVkVnT1hGdjU1TTFRK3hjYnlvOXBVZWJja1Q2VEgyeDhhU0JF?=
 =?utf-8?B?VDFXeCtkQXZzYVFPOTJFQ1hIT2FOYVd3OHU5VHFiS3pVZUFZOU9MeWtzaTdD?=
 =?utf-8?B?NFcxalR5QWNiMUtKZy93VCt2UDhHUUcyMDlmdDJkbGtCVnd3YzJXZ2ZDWHNJ?=
 =?utf-8?B?U3JVeUVwSWRQRjdMWmNaVG54MWd1RC9scFJqeXFSKzhGMXFnU0tlQVVYTXA3?=
 =?utf-8?B?dWVaL1o4djQ3VDF0ZkFjS2wrbDZkWC9ZR1JOa3JVeFlGVkU1K0cwNm1zSDRC?=
 =?utf-8?B?N2xHS2pFb3hWRUdvVXpoZkZMSDU5anpiQm8rSlBjL3FMU1VZUUNKeUkzcGRt?=
 =?utf-8?B?Qy9IK1drbE9Ua0kzK2N5eTBIcElKQkM2MUxVdU5LdkozTXg0V1lzZjgyR0I0?=
 =?utf-8?B?bkR3cC9SWWdvN0xBeXdSdHB3Z2FlTVlMczZOa0xQaS93a2orY0R0MGdtNStq?=
 =?utf-8?B?Mmg0cm9WUDd4dDgwK0tLL01WVHdEREt6eEs3OE1uNTJRRGZnU28zcU5KVDY0?=
 =?utf-8?B?MDlZTWV6NjAya3A0OGZNN2p1TnAyeUc4eHg1RHUyenNrdVRuU3lOd2llVGdM?=
 =?utf-8?B?TTFtNTZNU1l1V0NDUUNWS1AzREVMRTJIcVRocHh1czc3UDB0cGFUUjBxdjQ0?=
 =?utf-8?B?ajFJd3psVm1PVE1NcytuWHdhenlTdzRsSWZzSXRiTVo0djFlTDdiTWFxR3JC?=
 =?utf-8?B?UUZ0Y2lEWWgvTWk2UytadHJYOEgwcTExSGkyRWZUa0lvS3NFdWxyVlpSWG8z?=
 =?utf-8?B?SkxudE1OeDV6UzZzZjNmc3JyekFaM3dKTjY4bktGb1BKVUdvUEorUTRxZlhx?=
 =?utf-8?B?VFptbU1qZnkxUy9tVmwwaldvOHlnenlTd0FhbERac2NGNGl1YndJOTF3RFA4?=
 =?utf-8?B?dnAzalkxVldMMm9JUWdBMHJRZTA1Y01SK2RxeFJ2c0oyWDV6QjVqRVBwR1dR?=
 =?utf-8?B?c3VoTThuV2M1RGVMeXdyVVhLWmROZ29idzZ4ZGVMWDFMV0FJR2w0NHVpbXJt?=
 =?utf-8?B?ZnAxZm9OR0hhT3BLRGRMUmxXWWhWK0VTbXBvb3ViNkoyTU5oVFg3RWNBanVT?=
 =?utf-8?B?UUtmWmozeGc0aHdCd3k1VW1YUDcvRU1tcjJ4TGlEVXNzVTArZ0xwaER6U3Rz?=
 =?utf-8?B?dUdnSmpzOEpmTmlkdzl0Skg2STQyd2FhWnJEWWl2RXhwaERzQ1NNcTNHZHY0?=
 =?utf-8?B?MXJZMkF3Y3Y0a1hDQVRqVXdvV2N1Zmtxd0J3ZjRqZ0pqa001RTBtdnFXNjZ0?=
 =?utf-8?B?UnovR3owK1hudGR4aGd0Z2Jac2FvcEJ4VGhXVW1WakdkVjE4OGxwdElKNEZp?=
 =?utf-8?B?Y0lsNTRUd0l4eDhTTFUrR3lYQm4zQ3FJVHpLdWx2L3lLUHBjK3hTRXdIVGRm?=
 =?utf-8?B?UG9wSmNtQWZ5WlRZM2ExaGNTVkdoc1A5UkI4UWFqam01eW1CQnh5cy8zdWI2?=
 =?utf-8?B?b1BxdXVyT01QeEpGNzE2enNrdUlwZFpxc1EyRDlDVC8ybXhQdXZVQkFCbzZv?=
 =?utf-8?B?ZGNoUlRna2hvdWVVVDdZUVljYVBzVEw0cWhXNGluZGJVUkJlSnRBOFNMMlFC?=
 =?utf-8?B?Mi9oZ21idndEK09Dd0RGdDFORGgwNGFFZ05MNlN1UldmL1AwWXpua3c3NDV4?=
 =?utf-8?B?MzU0bFR3RXdHNHNQUWZTdG9reCtqUSs2Qm0rY2pJSlFXRjdDMG03Z1c5bU9l?=
 =?utf-8?B?OThMU0hXbktocjVQeFFmUldPUWJCd0UvejZqNXloQU1uaGRONTVpci9IRjIx?=
 =?utf-8?B?QkQ2UHliSisySjM4VlQ5MmlpRm51VlVRNzVzSnJZUzBTbmgxZjBldEpJOTJ5?=
 =?utf-8?B?OG9aMVJWelhmN1JrWVh4Q29TVFAwVmd3VDVXLzA3RENPRXZVbURQeFhPaW5M?=
 =?utf-8?B?L2NPWFRzc2RpeXNTR0I4RXFJNm1hZUs2NUdUWDNtTVdPRDA0VjJuU0tubXp5?=
 =?utf-8?B?VUdXSFpqTFR6OHhVSFNxSDNXODl1ME9PN293akNpTERxTE0vSFQ1Nk5IYlFF?=
 =?utf-8?B?L1pEQXhLSXB6cjJjQjlJaWFXU0p0WlQxYXAyTXpTUzhUNXlEY1VWM0xQV2tw?=
 =?utf-8?B?RFNyVEhrM2dPR1JkdXFTRHNtcDBLUDNWZjIxQkNCa2Fubmw1dHZkY2xsUFN6?=
 =?utf-8?B?UFE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0bfba7-b39d-438e-40ac-08db8ce00f4d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 07:23:36.1283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXfmEno1fWZ6X/9E63oVU9YPpQf/w5MOOfRLQbTFT4qy0bt1Ef5eWU+/FaE1p+9noeaofIYmIafTQeqq5Oi3cRBGV5b6I10RzhyrdjojRCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB7935
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org,
 Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, Robert Foss <robert.foss@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16.12.22 22:07, Lucas Stach wrote:
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC. It has a
> full timing generator and can switch between different video sources. On
> the i.MX8MP however the only supported source is the LCDIF. The block
> just needs to be powered up and told about the polarity of the video
> sync signals to act in bypass mode.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Marek Vasut <marex@denx.de>

I tested this on our Kontron BL i.MX8MP board. Feel free to add:

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Lucas, any chance that you can revive this series and bring it over the
finish line?
