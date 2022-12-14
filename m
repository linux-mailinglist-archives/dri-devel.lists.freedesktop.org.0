Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5740B64C572
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 10:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A08E10E23E;
	Wed, 14 Dec 2022 09:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2119.outbound.protection.outlook.com [40.107.13.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9040C10E384
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 09:02:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7zevuTUgaEVF4wFr2qiDHAEiGcsoHUFEZmRyj1YEPHUAZSPqzL8NECu6ZiQuJqI64YdfVoeeHH6W+RTD8szpDNPJhf2jP0d166IwDPwrY7/qXWHiqywYBfwI7SCcRvNDcE1Bb4xs5DBW7lxBpFUzlNRVIuwf6n93/pgGFRLAoEGiaZeXfdL2mXrnfmw67T4gb4fRM1v01xsb82R0GRpjRym43t0zg3+lsHkYTmOQxcpanG7k4E8nyJ1piaGdXZYL1uLljLjZ/chDXV4jjk6Y+210zc1GNZDesQmB9zs9OFHKP+fVMYd+MUNBcpdy7iuWWvqVXPdZDTP2DAH3+hmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8/JGnOde5tZfqa9KyNZNFbAQ3mccfP3xWYZFwmFlnQ=;
 b=bN04U5gs0dWMpWZFbUQQFZ7LiLdpn+VHNImvVGTQkUD/7X6IzBHNwWXwvgSXJR/hSatmnO+rjjlEcKXfBWrmKlBNtcNHhmmWi7jTpFRmgD/l4nJ5NFag7e3Ssf0TMrX5fpHWRlmeMmzqYOwm5D2vBQoQG39sfTvEWEadcsCe/Mr5XrUQiTnxNqhKE7N+UCBmyncBg5oUtK8AIF91VFLQ5ybW5FmSK3oC47yRckWoZ+GAWqxGW2AkScwqjuBfpji8cR+0uM6mknwfGS20WMuxEjnr+jH/M3kCJXjXxyuRpHizEqL/H6w5/byToMWZ8I2CGmaiR29Rn0EppMJGCZO0YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8/JGnOde5tZfqa9KyNZNFbAQ3mccfP3xWYZFwmFlnQ=;
 b=Qn3BRG2OTcxPoim2RVo+ovbJ4M9ir5q2hGX6E3DCaaSAWdV+slVKuowSUc0dB6318HcWCXU+UWsUoQBGAeMYLseHoAj4kHAdCG5QhFQBARzQVLtwltNpJLHJ865X//k84AGumTFq47yudLdUZH5AO9Ky1KklFWRpXjBnj9mFqj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by VI1PR10MB3280.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:133::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 09:02:26 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 09:02:26 +0000
Message-ID: <511befcd-d56a-0ac8-75d3-afce3b9f9e72@kontron.de>
Date: Wed, 14 Dec 2022 10:02:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 2/2] drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE
 bits
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20221212145745.15387-1-jagan@amarulasolutions.com>
 <20221212145745.15387-2-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221212145745.15387-2-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::16) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|VI1PR10MB3280:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ab86307-7f01-41b2-8bee-08daddb1ec00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fn1Fu6oBCykqFzwWG8sJZ19puwc+kNTSSMrpFYvcjESB10/+TJHGkHt69EsHd5sCtBuFqtsNqsyM9rmMMi1CeUTchzxwJz8ioO1sRYGRTOAeMSveSfCfKDKZvNsjRQ1mnekzaufEriQ0EymZ7TMZA4jpA20F0phsVkhPsXfZzpW0JvBoEnUDABK1mHpuCBylygJbDMH3rycrChWEvwGrKZxTcjgYy1NdseNNImtq94HAeevxIYnNJSuBrKZCfDcKsxXotdAn5nBDBBQN6XBaak1mIZ7FaObD9xvki18ZQnBxZRJ9O5btlJEfXH3lBAM3jEsvpnJ9ML3CdB+08+/qyeDAuCRwmZwUsIco7JHonIfO+CuKCQAq0Rgu2rnt2PXu6x+D1s+fHUzlpA6GTt67E0ItVn9AQJBYRVEN1irc1DExhnUwZtZwI/8VfXKMQ5W58TAcTLmNdy8hsZIDenEaIAKBu8fLq3Ho7rV04rgcmwQLFX5NRRBevt/URWkFgy8AqEnnW1sQiHfJp5tfzHl0qd4nuaHdzbjt4O28ZH6lHdWNemI4tphmn2jX/eLIu710i+Ihs9FV1tqUGArUbT2fqMrRHPzqbihK8fMlzg05If+WSt4xn5++Vs5k5EQNDS8+9J23fKoxiCOU6ASXsjs/K0Guk0pEQdP1tG9WQBE8xOtU8FBNPcI9GeBj1azqPtIgjlgJ6GiQzbdbaJ2PkDDUbTeGBokGyLzU4pzc2CgJGeY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199015)(86362001)(31696002)(36756003)(6506007)(53546011)(6486002)(2616005)(6512007)(5660300002)(4326008)(66476007)(8676002)(54906003)(110136005)(4744005)(316002)(44832011)(41300700001)(66556008)(8936002)(2906002)(186003)(478600001)(38100700002)(66946007)(7416002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0FaS2E2dlBBQVhDNVFxbWZBZGNlREdJV2JaQmxoa3I4dExRYnIyNG5HVnhU?=
 =?utf-8?B?ZnJzS0hLeU9NQ1V5WC9JbzUzbm03UGNCWjR3T2Z2Zmlra2w1dlNWUkNvNkJH?=
 =?utf-8?B?dlo1VjBGTEp2SFdMWGVuSmNhYXRqTjFHSVEyaWlyRzlLSTdxVEorbkNhUTBa?=
 =?utf-8?B?eU1xSkpWcjFmVkpvb200RWdtSlcxSnlUUWxKaFpNM09tbDlIYXZzZXE2TDJ2?=
 =?utf-8?B?TUZKVU1qakN5M1ZhYUNDSWU1bmcya3dXc3UyczQrU2tia09yNDd5dXJuMk9l?=
 =?utf-8?B?bVBrN3Qwdzc2MmpKeGFZbWNmclBmamE5UXBVblYrYjZqZEY2VGk5bDZ1MENF?=
 =?utf-8?B?eFd1cEJibFZ3MG1YNGREZVQ5K2s3cmNic2RqVmRzUEJNd0hqYWMvSUl4dWpF?=
 =?utf-8?B?d2dpanFYSjN6NGtmWUd2M1pmKzhoYUdLaHZINHlaWFlwREVmQVlTZzJjUEZo?=
 =?utf-8?B?MUxpU1huTTJYZ283ZHo3V2xlM3JhbXdKeEtsUVpoYWwvM1crcmNGMHpjYkt6?=
 =?utf-8?B?ZjkvaDJtWW01a0VaZjBqV0RxZXc0TGtvTHFCdCtRSXI0T3BHYTV1dXBjdW9E?=
 =?utf-8?B?cmM0amNFWm9Db2ozODJTZnZmWkI0ZjRKNSt6azdpWU9qelU3TjFVMlUrUnpC?=
 =?utf-8?B?SG00VFFSY2R4SHhFSWlqYXJCNmUrRjFpK3hJQmdRTjF1UVlUZzNVYjdFTFF0?=
 =?utf-8?B?SzRKMTdMZU1ON1FtcWtpSkE0RzNKUkx3Vm1tWjVDbkN0L0tKOUhzZ3pRVks1?=
 =?utf-8?B?czFLOFlNdHl3cmI4S1ZockhpNzl1U1B6RklmUXEvcUdVcFcvSmpWYWNSWHZ1?=
 =?utf-8?B?NE54Sm5rdXRqejVMRkg5R2NZTlhZKzVJZDcyQ1kzcFMwa2tsUUE1L3l0TWc4?=
 =?utf-8?B?Q3E0SDZqTW5YL1h4U2d6aVk2QzlmdXdEZFJUMzk5eW5qbUNYczN1T2JmaGgy?=
 =?utf-8?B?bjhnWk8yMk9Qc0hKWitEcS9yTmhaWis3UytCTlRVSXp5aytCNHlDYjVtMU5s?=
 =?utf-8?B?QUVVSHo5L3U5OXhMNXZ6RFdSaXByTGFvVCtpL0VZYy9QMXhnVzVtT2poY1dy?=
 =?utf-8?B?aVZ4WVp4aEhLT3VqTTVLbHIrVTZTblVTalRLcGtSMkJFK011OWNGTlRLRlJs?=
 =?utf-8?B?SS82eWpFU3JvcUdldGVOQ1l4L09GbjRMalUyRWI1SmowcGsxSitBeU1zTWFv?=
 =?utf-8?B?THAxbCs0T01SaU5HeTAvblZyRit5YytVTjZFMmZ0bXhkR0djNDc2Uzh2bmhk?=
 =?utf-8?B?TnlCb1crT1VPdE84WDR4K0RlYUFsSjk4YVdNbVVNS3hVTlRXQTZ0ZDYySkww?=
 =?utf-8?B?ZENVTVJRck9idXBSdTJvMTZXZkRaL0pzOVJaUGpZS3ovdXJxeXc2Y1ZpWEVE?=
 =?utf-8?B?Tm45SE5NckpMN2FQZXhRdk11UFJQRGhsNFYyTXJGd1JtRDJhSTZGbXJqMjln?=
 =?utf-8?B?RU5qMWQrT1ZsWmZSSVhXU3MxeU5DUmdRTEtVb1E0YVRReDAzU0UxS0VIQ2Rp?=
 =?utf-8?B?NUZpMDZ5MldOWGZrVW1ERGdkTEVSNFcyc2hUNTlNUGNJdXlzUUUzK0l1NGNC?=
 =?utf-8?B?MVBXcnFwaGk4bmw0a2NtaFlKTHN1QUtxY01wa2pkc0M1S0lCSEFKaE5ocFM5?=
 =?utf-8?B?Nml4Qlh3UFNHTTljM21IWEZmL0VvbXh2S2tUTTVqRE05VXVIblpWMTFCdkZ3?=
 =?utf-8?B?c3pTVTdQWVd3OTVLdEgyUi9LbUMxOVRDNThZM1BqS25vVUxwUnMyd0d5ZE5y?=
 =?utf-8?B?RUo4bDdzMVZWajJBN2hUeFZwT0hpYjNwdkZNL09Wa2NZRFQxZDlwM0pPa3J3?=
 =?utf-8?B?d0UzNW00dkZmVFZjdkpONWR4Tmo3OEFiTE8rMG1lNEo3OFg4QXBxemdObXNi?=
 =?utf-8?B?bGNTYmxLYU1ITzRreDdwc1psSWtKL2VHSlQ5Y29odHZCcjYyaERQNWhoS1Q3?=
 =?utf-8?B?d0dhRE5DdzZsMDBIS0VSZzdKUXl4RkRLN1UzS21JQ2swTFQ0cHNDQ25Ybklj?=
 =?utf-8?B?dno3aDdpWWllRU5YNGo2NkZJSXVUQWtXUi9tR1ZqM0tqUzQyeVF0LytKUkZG?=
 =?utf-8?B?UzB1aXFPeXZOQzJud0prd3NrYnhjVU1WdHVsZldwbVQ1S3N6NENBVnJKRFU3?=
 =?utf-8?B?ejlvYXZPRE0veTJiWkhTWmhBN1VFTlljVnRabitnUjRVeVArK29UODVkNUk0?=
 =?utf-8?Q?L33vt0hu8eHhs2ZZnX21X6eOZDGAnoekFXw+edoNU2ra?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab86307-7f01-41b2-8bee-08daddb1ec00
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 09:02:26.5692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eq/EqktFl6jtoZMZd28UP+yuDjblpeMrma4yA66KI3W/jT+pfECb/JLUgpAkLQu3U1i1djGdmaK8sadrUyhwJDghSiyCOQJtGRAg3s+9XJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3280
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.12.22 15:57, Jagan Teki wrote:
> HSA/HBP/HFP/HSE mode bits in Processor Reference Manuals specify
> a naming conversion as 'disable mode bit' due to its bit definition,
> 0 = Enable and 1 = Disable.
> 
> For HSE bit, the i.MX 8M Mini/Nano/Plus Applications Processor
> Reference Manual named this bit as 'HseDisableMode' but the bit
> definition is quite opposite like
> 0 = Disables transfer
> 1 = Enables transfer
> which clearly states that HSE is not a disable bit.
> 
> HSE is named as per the manual even though it is not a disable
> bit however the driver logic for handling HSE is based on the
> MIPI_DSI_MODE_VIDEO_HSE flag itself.
> 
> Cc: Nicolas Boichat <drinkcat@chromium.org>
> Reviewed-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
