Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKdgOzjMqWl+FQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 19:32:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA1F216FCA
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 19:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882A810EC6D;
	Thu,  5 Mar 2026 18:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="fkXeXFLY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012070.outbound.protection.outlook.com [52.101.66.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E6C10E29E;
 Thu,  5 Mar 2026 13:11:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmebUp+NSg43P6DrMnWPOtkJ+NVm4CE5rLlAyevCbsoF51fOGJpgvpMX+6hYdIXWHI56aUmgzdy9RTQADPgKjSnJnYebhV9mS+l0koNj1yybjPwkUp0pjFsF+ZsXunA51aUn8vhVp/RPEvad2bmS8XzVEiU5a7f1ARONaXKU1t5a5oOQ6mFqVBP2itJ9KY5Cxs4wyEH3d3CdQtyRgu/u3oRwSU3IodKsTu3N6DIBzuwyKbkXw85lwah0E1XUn6o6ac4aI3OhJDnFZccaScJTMn9f8nj5GRD/wuySh8mz3s9ZQHX7rV+zZPP4hJj53Zv3Qnwx3DTc+cPCMv812dHvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hSMkVlElClTBfYcUftvSmxqMPWogkjljPOeeXcMdXM=;
 b=Eb98H7+xicR0fPOEvFkwucV/95bKRVuV8xg6oBgREjRvSvjhRMg3p499vE8rlgTnyrruwvCbnbBjBwWlDCNCdtUq8zTncwlO7cXFH2rkS+BI7lbDth4ywPcmlP6zcZB8i9UBF/VLO5BPig5t98RNJQ16TvA1reQF+/79KJZzGN/MJmtGQ0P4SOLPYDJhrhKuiyaOEMOuKyv6TsKXW0myp9d7PlzAA7dJk/5j8Mwc1rUWl514PJVeG/WmgtEfyJexhU6ktoIeNWpxwitR7Zzo6ddfIbjMfnpNc/WUZcwKpaQ2JiFCDnMu7gZOaMVTE3nz0dL4if5+Di/IpuV+qr9mxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hSMkVlElClTBfYcUftvSmxqMPWogkjljPOeeXcMdXM=;
 b=fkXeXFLYwibbaMffWdJVXYF0OpM67RbtwceJfGliKf0rGTeU5UEaQVfaHoGxl1bQ2PkIryyWYDt3iBXJS+tvu14P7W9YO35w98B39Y65loJpwQV2H7vRRYy+R9AZHL0InIFoSB3wOQtMr91aD1YC5p5doR+FmICR5jsuzqX96JQmbUGePk6l8xd+0/nHMdP9NgN1i5gnVunjfeuPStKJj5UJQNTNzOLCYcVbjlkRHEPalT0QxG2eI8YWtwNXBEto06SQRhE4ODNtK66OfDs9IUiNAO/ucSHuJThfhjsSs8FpghnttGKP7GsE+KVnDgQll0knSejdmstRq6vMl7n1pA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by PAXPR04MB8079.eurprd04.prod.outlook.com (2603:10a6:102:1cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 13:11:49 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 13:11:49 +0000
Date: Thu, 5 Mar 2026 15:11:45 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Joe Perches <joe@perches.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305131145.zvi5eor5kj4n3fu3@skbuf>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
 <20260305123843.i47asdrjychwlgdt@skbuf>
 <20260305130609.GB1659133@rocinante>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305130609.GB1659133@rocinante>
X-ClientProxiedBy: BE1P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::6) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|PAXPR04MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b571484-1da2-468e-505d-08de7ab8c2a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|366016|1800799024|19092799006|376014; 
X-Microsoft-Antispam-Message-Info: 2ljAm+k1rZ25I3N9CRhbmc7ttnAAErjLH/n/Ezqn/ICGIDT5mR229+H7KOi/Ch4IFO9csUA9KGhQoWdLrHOgEK2g+46wIUzR2r8ppFF+LUwyJpSYvOhdo55MTE3xNgDcOOPjhNKDKqgyyLaEZY94xyaTzloxmjPXfTimNa9gb3uGun+/R9gvpCrpeIExnDru5iAGeQRxK49a6ZPCi3FjP/iG7aLkRVPifB63M3m1P3vR6Mf0ohGa9lOntJRytJHE0qQSqEKLabnW1u4peybvoXkMd7VsbgZF2BEC5YpkkN9eubPzJJx2fUqhRuHsYjjJSXImCu5/uV3m7QaqnxxbKh/Q+vIfg/NVCI8me3Ehe7kYP7guYgaGs4iSOoZu2kfxwo2Fpwb+hn6xnppJ0nG/BGjuIYWXJN6C54PRne/EmsJYsycwzTonZXaj4Em/zGHEl4NleISmmmVO6N3VsWCb4EMJojnCQQopOeUPmudlKblmFbGWG/Txh+9p/IpMIycjQsJkfPWEBhpTMLajewl4ijspdte8zcUiDNuwAV/DNNCd45n8LGHnz6xlJ9rEPKud5E4ustL7tLedX5fwfoyUWJ8YTl3agyH+3fqR6OxAmQb0p4FlmkK43vL0ZskwOxGpYoZASK+9Db21u7sfkTBf3ehIJtZ2Yw49AUuyObrwYxPpkdyH+2vkanKjSNfkJSKu0TndKz3s+PpksKSVa5l5cfRnDEbWw/bBY8IbEza9Ke0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(366016)(1800799024)(19092799006)(376014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDNCVVJ4bHdJeWRjR0hpa3c5WU5xU0ZxMmZpOWFFWm1mQkswNTdUU3lUM0hq?=
 =?utf-8?B?VitCZDlEMlYyazVJVzRWTEhjL08xeG10SlJ3aTlkMDhlVU52ckE3Z3grSkt0?=
 =?utf-8?B?UjRSbHlVK0w1azJaRUY0R0Fyb0hESnVYSU94RXRuejVESi9xZ1puUUhVc2Vp?=
 =?utf-8?B?REt2MW04Y0hSQ3BSZFdUSm1vYnZFTUgxQktqZUlvZ2hTS2cvcCtMTnVMd2ZN?=
 =?utf-8?B?M2xhNG1IU2oxallRaDBPcU9OZHY4eGNTVFhYTjVyNFNUU25yZWNZMDdQUGM4?=
 =?utf-8?B?UUdPTXZRSFJibG1pUVE1dVBwZ1JPZ09lM2hCblBCVXJQSGw2ODJKVU1NdTZz?=
 =?utf-8?B?R0MrWjM0ZXVNclJpdlU5bjhjNjkzVGNNa3E0aWoyakJzbS9QdEZlR3AzdWRk?=
 =?utf-8?B?MTdpL3U3M2s4bmN1Q2VvaVlCUDh5UHFQWDZqNDM5VVRJdHZMVVhrWjB2UGNm?=
 =?utf-8?B?WnlkTkxWM3piMTUxemlpczhpL2ZCeEZSRTlFb1RtNU9jU2pTa0dSNnk2dXlU?=
 =?utf-8?B?VkhkTXlSZ3BZS2Q1VldZM2wrb3BnUmpDd0syTjVycW54UDl4am5QSEdubWMz?=
 =?utf-8?B?Q0pOU2VUQTV1UjJmcFZLRllDTlJTcTExRnUzSnJTYVpLM2ZnVVI4VUZxUnFy?=
 =?utf-8?B?R3YyNVRWelNwSG9wU2lVbVdFQzNNTTVLMFBUMm5INDNxbFErT0lncWJvVW1U?=
 =?utf-8?B?VkJMOWIybkxNaGFtUFZoZ3hMYTk5RFJ1azN5Znp2d2tDNWU3bFBZTjZoNDhV?=
 =?utf-8?B?MWlDdnp0WUNocFdDckNiWTRLVFp3bWtwcXBreEI3VXZoTlFoekQ2aU5VQkJJ?=
 =?utf-8?B?SThkby9FNnZ3KzQwRmpZZW1nY3R6TGpMK296WWtRWFNhNmdaVjQydG5BdUJl?=
 =?utf-8?B?b0lVQ1hrc1hoTkNFZzYrMms5RjlrK3NzVktvd2ErYWZHU0FQUmFGczUwUHJn?=
 =?utf-8?B?R0pnVG1kK2duZndnTEVhRlIwUGViSkFaclRUSlJqNWpjeUVOTGxKb0pvbEtL?=
 =?utf-8?B?MjVuQ2pqT3NwR0xyTklGTy8vbnhyNVhJZmZnc2JNREhBaks4NFpVUmt3MlNN?=
 =?utf-8?B?T3dFMmZRRE5HcWZXTmx1em1vV2ZsTzNMQnRrMnk3SC9XRWZRbSsyRTRIYTk5?=
 =?utf-8?B?OVhTTTFsY0FEK0UzZm9TQnpTd09MdGoySEJaNzdFZFAySGVmazdYTFdhZUpk?=
 =?utf-8?B?RnlUcWFjbktVSzg5L0VrQ091a2FwU1d4S3pwRC92VjNZM0dkenR6MzF1N25h?=
 =?utf-8?B?bkE3bm9vcmZIMCt5ak5mUnNIR05pVXY4RlJDL3lZQWpNZTUreVpBYkFvSnFD?=
 =?utf-8?B?eXFSa3RLcmNvelNsRzVLaERPaEQ5c0c5c2JLWkI0dG5oL0FEbFlsVEtFY2Qy?=
 =?utf-8?B?cTFGb1B0Sjg0VG44cnNtcjU0V2xKUEVEbUtYOEpEcm40ZEc3KzArSlR6UExw?=
 =?utf-8?B?TlRlS2FkZ3dpZTJ4OG00VjAyK1hFS3dFcFhvbFZQVTJ2dXNUWUgwUUxtMXhT?=
 =?utf-8?B?MVlUS2xBRVhtamJoc2pPOGJSSHdDN040ZXpyNFdUOTU1L213ZmFpVmhUV1kw?=
 =?utf-8?B?UUt1NHlvbXpDQ01EM21icysxRFcvaG1xZEdacVVsaEt5V2k0NVpoYkpYK24z?=
 =?utf-8?B?Z1dxby9FbWNhMnVya0pUNlVadjZTbm9oRFA3Tlk2Yy9kbzFDYWxMY1FEZ3BI?=
 =?utf-8?B?cmJaVlBBbEIxenZHZDluOWxNS1lQVkkrdVppMXRHTmFGRU9Ua1ltZGxNTHM2?=
 =?utf-8?B?cDdTWld5NUM1OE9aR0xYU0pLUFlpQW94bjNSUS9TQXQzUG01b25Ma3NxcmJh?=
 =?utf-8?B?VXdiZWh2VnNQM1JxV1dWMnZFTjVuSCtGT3hvZEt0WDV6L3pYZ0ZxUk1SOXh5?=
 =?utf-8?B?OWREOFhEdjRVZTd1RVMwbUhKZEFlMU1MVjlNV2Z3azR6MzhJYmh2VkVwd1NO?=
 =?utf-8?B?ZGRKcFdiZFFhdERpZDhaSkFqbTYwOUd4eFc1cUpRdUcrK2t2MzFyRjZOYnU2?=
 =?utf-8?B?UlFDdjBldHlCQklOeGNra3FRQi9NTVJ2QmErenNFTW01dERkZzIvNmNnZ1FV?=
 =?utf-8?B?MzRUU1VPV0dJVEVxOGJsS2o1TjhIeUg2U212OUZGZC9sdktiUG9jRXlWbk01?=
 =?utf-8?B?SHRub3RNN0g1QVFHTjIzeW9UOE1OSEVjY2t4WmRScGlRU0p2aCtxbnZDNC92?=
 =?utf-8?B?TXY1L2FUN3kzUmxRV01wUHlsVUthS090SHA2K1RDa1FSckFoTU82L2Vndy9I?=
 =?utf-8?B?R2docFBrQ056ZThSWjl1dVJPN2xTVHlwcFdEODFyV29MZXJ1S3ArTTNNbk41?=
 =?utf-8?B?VjdZOE51ZGNsb3JlaDVKdHMwUDZyek5YV2UvZHNNcHh4Y1NvRmd3YXNDc1Fq?=
 =?utf-8?Q?vbS1ruZ+oVkRNBxyDydtWxDDelbsI6sN2iBS81ZOdRbgB?=
X-MS-Exchange-AntiSpam-MessageData-1: aX3NTqYZlXUn3bTkuzVnmLUBxD0md3Dkmvs=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b571484-1da2-468e-505d-08de7ab8c2a8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 13:11:49.3216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrDkPt3rE/6HF4ol/kT/cCP8SJf++cKC9ty6FSnzt32w8+isdUX6uZ8cGubVG6CLj25Tso/9WkTlBciN7mL9Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8079
X-Mailman-Approved-At: Thu, 05 Mar 2026 18:32:21 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 5DA1F216FCA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 10:06:09PM +0900, Krzysztof Wilczyński wrote:
> > > What about
> > > 
> > >   F:    drivers/*/*phy*
> > > 
> > > or something along these lines.
> > > 
> > >         Krzysztof
> > 
> > I don't understand your suggestion. Is it meant as a replacement for the
> > keyword regexes? Your file pattern matches on:
> 
> I was thinking more along the lines of using wildcards, the F: was just an
> example.
> 
> [...]
> 
> > There are a lot of false positives, and a lot of false negatives.
> 
> Yeah, the "catch-all", for lack of better word, will not work here.

But assume it did, for a second. The intention of the patch, stated in
the commit message, is to match on PHY consumers, to review their API
use.

$ grep -l -r '\bphy_power_on\b' drivers/ | sort | uniq
drivers/ata/ahci_ceva.c
drivers/ata/ahci_imx.c
drivers/ata/libahci_platform.c
drivers/ata/sata_dwc_460ex.c
drivers/ata/sata_mv.c
drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
drivers/gpu/drm/bridge/nwl-dsi.c
drivers/gpu/drm/bridge/samsung-dsim.c
drivers/gpu/drm/bridge/synopsys/dw-dp.c
drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
drivers/gpu/drm/mediatek/mtk_dsi.c
drivers/gpu/drm/mediatek/mtk_hdmi.c
drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
drivers/gpu/drm/msm/dp/dp_ctrl.c
drivers/gpu/drm/rockchip/cdn-dp-core.c
drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
drivers/gpu/drm/rockchip/rockchip_lvds.c
drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
drivers/gpu/drm/xlnx/zynqmp_dp.c
drivers/media/platform/cadence/cdns-csi2rx.c
drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
drivers/media/platform/samsung/exynos4-is/mipi-csis.c
drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
drivers/media/platform/synopsys/dw-mipi-csi2rx.c
drivers/mmc/host/sdhci-of-arasan.c
drivers/net/can/at91_can.c
drivers/net/can/flexcan/flexcan-core.c
drivers/net/can/m_can/m_can.c
drivers/net/can/rcar/rcar_canfd.c
drivers/net/can/xilinx_can.c
drivers/net/ethernet/cadence/macb_main.c
drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
...

How can it find the above? I think you've severely oversimplified what I
am trying to do.
