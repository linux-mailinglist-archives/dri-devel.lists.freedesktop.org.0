Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPS2Eu+Tqml0TQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:44:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA0021D3F3
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BEF10E3B6;
	Fri,  6 Mar 2026 08:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="LgPyX1Yg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013019.outbound.protection.outlook.com
 [40.107.162.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A978E10E3B6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 08:44:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrIoAsYfKG29E6rnFz0LsQ9uPh3Blhq6JZEsLhqeokp1CQpOSu8JV+qDvvVruqDktWEyHYCSnJPKHWT8ydkmMMlFCQl+3YV93qhf2RUvfebEywKI67wjxpfq2xYvwDsNKVqd0Ob4nw0s88tCCVKDyRY2ilAuLgJw9yw9JXsLx2cLbLQINE8jANyFB8CK+4LkGohjqct0VPNvXGU/Eaul23cX+sRQ0i02QU+gDaQtsojF3xE+ngI/KDKS8Q4eZ7S7bye1VFSes4/6oo9/3pD/3swM3v22trg8EDXQWxf/Be5N7xAwIg2IUasygH4N26TjhxttPbgzV0DWXO3JF+VdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnRTR9KPewoeaSpuxHLaHlCnvmn8CLefGOOtkhjuIo0=;
 b=SZSopVBN2Tkx1iHESO8n9cGZSY3XX6ZN1cUTxbiCfiIk9iE5oXubWnuYRJPgMWCzPJWM+98JNQGC76G5ZTFNOiHEyIW1XGk5wvzkM02sj/U2p+2kWww3a+3SlIPA73s9Vc9LTGNTyTA/1YVMHReY+ms5Vi257ncs+rCXAdI6VOtBaNWVoUq/o1JeNjhkSlsrwg/5Zy5ie5D2CXghMoyaR50kUtHa6OZFTBoTkyOMJPCs642GPA4scZKjN40gQvx54pnZ6Kt56avxVnLdrAtDXHf/OlqC7Fvmmq7RqCwI6ZZoL+1NhD/tvrAxCA7irYRGnsIYaw7wvTPmeImhts38Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnRTR9KPewoeaSpuxHLaHlCnvmn8CLefGOOtkhjuIo0=;
 b=LgPyX1YgYIa0Ca0on0fm8oK0ZC1eVG/ah2bCpLJdIca5ur3Y25Hi2ZPmWxoBa0ZHPKPzrXboiTk7CqBadDoC0RLnfMEK/EbYgm6j0XKcavkaQBC3SMouWHML0GU2hiAAn4WGOnLo4vkbuP3SpDhuQ6QARSoyKCu1LL1yWv5LH5VWJ6xiu3dovATC7Gr/ylJbqU+OhPEzCblzgbvtU1iDqQw8lX6e2nEEHRBMz7foKcieLF1AnucvH2xocdWBExZWm0Ov3ekH7fiZ1+mHzjdTGmCMAP+GOD4Jct746e+42R+h2dPPRnY1GCWbk8zuXNeZ4shsfPSNmfI7PDw55lAO9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8357.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 08:44:22 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 08:44:22 +0000
Message-ID: <1a3d466c-c1b5-49f1-a9ab-1c827e906e91@nxp.com>
Date: Fri, 6 Mar 2026 16:45:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/9] arm64: dts: imx943-evk: Add display support using
 IT6263
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, imx@lists.linux.dev,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
 <20260304-dcif-upstreaming-v8-8-bec5c047edd4@oss.nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260304-dcif-upstreaming-v8-8-bec5c047edd4@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: d271bcb1-2f36-4f61-86cb-08de7b5c9074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|19092799006|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: suPOOSRtYsLMv38aoX+D79LGGtTVkwpYkPGYRJMyGgKVYGX3mDZfKQwVF6LFkQnJRpvfx/DRpGHjmBz9CU+OASLpHJnECNBbLGqwnENT6J7+2CrEiQD72YDgT8DeNSNbQDnCV8PBqSwphfDQzN8wd8757NS/1+63CFPmx3pNYcjHOWHoD2QylPOT0qGuxfmVaU4ZwQSMBBBsv8NjqmQGWvAanmlcR6Rf2S9YLdlGSE8UX0TizOCORUlboHc0f4js0q9MIeNDS9OF3ZH22d9jE6M0e9GXPPJDP/iWERalWF5NWRnHx8pMbyOU9YH41F8w928w9XvCWqwtFU/udI2rBdA7KwM3xNRtHUhFhb/2Fm/av8U2sDMhfwzBm5wz6X4TGJo5Cll85TnE3ao+hxKXBkWH4rrjOCoBBTt6Q0di0p4nHS1TIjtO2XiwCkIRQRWt6yhrGVTezd1U9gRRjco4+BaC77j2VZAAAUS6fTuzckeiM8jFtiAJHA/OtxxHlI/eGXUzsvuFs/GUgZye/DNeIi95eIlomNo9+B0J328zLGLn+WeZbD9oggxv+nuyrBC+RHjigXftRUQjokLsLQEpLO2+AVg7V5v3emQ3coPYDRDz9ULAE/JaovD2Fcoc1KoEGbeyLx4WUJLBk86G/4Weenit92WegbMHi0TpjXiYsNxkTXv99GDypJ1gkos87u5P68bR4X2QegW2JG+l60mUuF0HeH6QqHccmq/ZzvoQaro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTJCVzJ3Qkt2UFlmUGxxdkNXbFJ1Vk5ZeWhnUklsS3NXRGtRSWRuOUs3Yll2?=
 =?utf-8?B?SS9nTWQzWEZZM01TUEVSaEU4N21rYUZ5c2xvQk91ZlVtNDY0QzQvSG4ybTNl?=
 =?utf-8?B?ME01WVlxbk1xN3c1QjhrYjJoelVTWk8vUW9mdDBZLyt5clo3WGZ6b0ZDQUpD?=
 =?utf-8?B?M05BWTY2cVZ4OE9CNlJNeXRQOFl4QUl6L0ZwMzVmYWJmRGJaLzhVVEJBc2Rx?=
 =?utf-8?B?TENHa2lNQWFWWVhHWmE2ZFhHdEZUeDdZaFlYdllJZ0JRbVlHb2Z1WWRMWURR?=
 =?utf-8?B?L3JBbnVmVnNHaTNoV1VXT3pEMDJRc0pPck9vQUk1NVdxOFZNQlJMMDk2cTdz?=
 =?utf-8?B?ZytROVFxOTNOWlR2cy9BNjY4NUxuRHYwT3lBWi9iM3d1QTBJRzhHSG10L25S?=
 =?utf-8?B?eS9rVWlDdUpFTFVhLzkvanlYV3VXNTZaNGo5cFA4MVFaWXR1dlFXNDVXbWl6?=
 =?utf-8?B?UGxJME5WV3RVZ1pkZWEwcktHWWxZeTEwcnl5NWpKOWh0R21tZ0VFazFKeEIr?=
 =?utf-8?B?eVRFVGtrelRWRmFhU092MVlwVmgrZk5QTlVuSyt4cFhnZTRMQ1RHL2dSYWds?=
 =?utf-8?B?NndtTU9ucjJxQ2IrbU1pN3I5eHE1ZGJjcEJub2NoN2hrb05YNHMzSmJzQ3Ju?=
 =?utf-8?B?ZUUzZGY3dHN5Y2w5UkhwcEVCa3pPVEwzbjJzcFZYVmpkRFdXbHVGQ2sxVWt4?=
 =?utf-8?B?a0s1RlF3NTRaSW1VNzB1RGlYcTc5TXJJR05YYWI3UjJHeFpHSVFTRUJBWjEz?=
 =?utf-8?B?YjNyeXNlaktXZDNMNXhIMlp4U0VkdElydENEamJ4QTM5Qi9aRkt6RDBLRmNt?=
 =?utf-8?B?OC9BODU2MERNek9TNUNPNmozSjhxdHJtM2ZaNTlwU1hIaUxURDFPNDZxL3pn?=
 =?utf-8?B?U0lYRlFOK3dQbG9rYUZlWGJxQU1DRnN4Q2pVYmQ0MGc1cjRkNGl4MC85a040?=
 =?utf-8?B?elVrVGhDZWNnWmVrOEROcmgrVm1sNm1kOFFHekJqVUIzTnN4T2VERWJQVm5G?=
 =?utf-8?B?WjYyQkRDWCtqdm5NemRGMjZUeTUvVDBmL2dXYmJtdGZoU1hDZC90L2lXb3VR?=
 =?utf-8?B?UWphVjNGQXpEOFJyVE1xNUh3U3dRd1JKeXNzZWhWeWRZVFFhcFNROFFZTVVx?=
 =?utf-8?B?SVBuTjJXZTZDM3FKV1ZPTnRnRFFiMlJXWVI4OUU3UVo2UjdzZ3g1VTNiWEt2?=
 =?utf-8?B?TG1TSzJ4Ymt1UHBNaWpQZXI5NjE2RDM1SVFKK3VTb3ZSY0cvMkwzMnNkM0Jn?=
 =?utf-8?B?OFFlOEZXMExzVDVhajM5OTA0UHBsYUJJZEliNS9aRVl0N1Z5MldiemlaTDRN?=
 =?utf-8?B?cG5mdUo2MlMveTkzRzBWMlFzQVZqRGY2alcyZzZObFlwZ1JSR3N1UXAwRCtT?=
 =?utf-8?B?UHBoS3hBSGhJTkRzM2dRamRPT2JkQmxaWWpUWU5sVC81R0F5WnJWN0RWOWxv?=
 =?utf-8?B?UWticFFibUFvOEt4WTAwMWtoUncxazRieWxNNzU1ajd2LzVVWU1SMENUWjd0?=
 =?utf-8?B?R0VwRjIwSS9IcUx6cWsyY0JRT2ZGNmg5TXRvMy9HWndhV3ptUmtzZ2FCQU9y?=
 =?utf-8?B?WCtFbVhHUHhoNUdjTkRRQ3NnMjFBUWpjUVlWZEtvanB5NVZmdVMxN3N4dlY2?=
 =?utf-8?B?UDZXcnU3L3NMVS9tNTJ1K1NpQkkrM2NBMmpvalRwbFVRZlRCN2c4NEs4TUdE?=
 =?utf-8?B?cEJxUTZjYVoxUGFsL0dMZzNQOEwyUEhhVlVwcmZlOUhLN05CVHplU1M4UGs1?=
 =?utf-8?B?dzRsMlBJSS8rd3hicDRhZ0FZRjk5UHQ4YitMemVkTWNzelYzKzJ3Yy9CUG42?=
 =?utf-8?B?VUpIK3hqZm5nVGV0UE56bXRnam5QTmdob3ZVV1FKZGk1TGdXZWdpaFpWNVhs?=
 =?utf-8?B?OWU4MW9YbzBNc0JUOUc1M3p5RXU1OEhwMFQ5VkNQNkNxQWtCN3JmNmRxaUNp?=
 =?utf-8?B?NTJiSW5USENVR3poTWVGajdhSEc4dUtwUmxLb3BKTThoQWRoQnpOazEwalY0?=
 =?utf-8?B?SEpQSFZ3YWhTZDNmeTBFbU8vVGFUNTFGanBLL29IRzlFTG0xMm5nM2Z1WHJa?=
 =?utf-8?B?Zy9BbEk0VTZwc0dmTlBRTCs4WXVPUm5OcFA1RXhwQzdoQllUNWtkRWdVU1Zn?=
 =?utf-8?B?VDNRbXdJM0hlM0pjTUU2dWZDVmNVZG1TSjlPTHVpeHkwVjlBditxNDZQV3Bo?=
 =?utf-8?B?b2hmOWMxdXNwa21BbDYvVS9FV0lIZERScHdNcG42TXpVY1FCS0xzUlgya0hm?=
 =?utf-8?B?dnJQVmhBdlVudkNlaXUrTndCTDBlano3bWZFcGl3MFlKUTIxNllDc1BFb2E5?=
 =?utf-8?B?S2h0REdCamNpNzRsTUZsZW9kVk5wQm9oYnBqMkJMZzZvNnBiTUhBUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d271bcb1-2f36-4f61-86cb-08de7b5c9074
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:44:22.6669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJGwxQBz4n9/ulnbke63KTKMo4GwhDDbJZxy8KuJrjMcJGnb/e6pw+Oay3A36ZZ8o8dEWpnibnjEg6ya/tQL8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8357
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
X-Rspamd-Queue-Id: 9AA0021D3F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:laurentiu.palcu@oss.nxp.com,m:imx@lists.linux.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.nxp.com,lists.linux.dev,kernel.org,nxp.com,pengutronix.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.4:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.3:email,nxp.com:dkim,nxp.com:email,nxp.com:mid,0.0.0.1:email,4.196.180.0:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 11:34:17AM +0000, Laurentiu Palcu wrote:
> The ITE IT6263 based NXP LVDS to HDMI converter can be attached to the
> i.MX943 EVK board LVDS port using the mini-SAS connector. Since this is

Since the LVDS to HDMI converter can be attached or detached to the EVK
board, it would be appropriate to use a DT overlay instead?

> the default configuration for the EVK, add support for it here.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 86 ++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index c8ceabe3d9239..0b69450566159 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -55,6 +55,36 @@ dmic: dmic {
>  		#sound-dai-cells = <0>;
>  	};
>  
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		label = "hdmi";
> +		type = "a";
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&it6263_out>;
> +			};
> +		};
> +	};
> +
> +	reg_1v8_ext: regulator-1v8-ext {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1V8_EXT";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	reg_3v3_ext: regulator-3v3-ext {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3V3_EXT";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>  	reg_m2_pwr: regulator-m2-pwr {
>  		compatible = "regulator-fixed";
>  		regulator-name = "M.2-power";
> @@ -179,6 +209,10 @@ memory@80000000 {
>  	};
>  };
>  
> +&dcif {
> +	status = "okay";
> +};
> +
>  &enetc1 {
>  	clocks = <&scmi_clk IMX94_CLK_MAC4>;
>  	clock-names = "ref";
> @@ -217,6 +251,21 @@ &flexcan4 {
>  	status = "okay";
>  };
>  
> +&ldb {
> +	assigned-clocks = <&scmi_clk IMX94_CLK_LDBPLL_VCO>,
> +			  <&scmi_clk IMX94_CLK_LDBPLL>;
> +	assigned-clock-rates = <4158000000>, <1039500000>;
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			lvds_out: endpoint {
> +				remote-endpoint = <&it6263_in>;
> +			};
> +		};
> +	};
> +};
> +
>  &lpi2c3 {
>  	clock-frequency = <400000>;
>  	pinctrl-0 = <&pinctrl_lpi2c3>;
> @@ -258,6 +307,43 @@ i2c@3 {
>  			reg = <3>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +
> +			lvds-to-hdmi-bridge@4c {

Maybe, change the node name to be "hdmi" to align with the nodes in
imx8mp-evk-lvds{0,1}-imx-lvds-hdmi-common.dtsi.

> +				compatible = "ite,it6263";
> +				reg = <0x4c>;
> +				data-mapping = "jeida-24";
> +				reset-gpios = <&pcal6416_i2c3_u171 8 GPIO_ACTIVE_HIGH>;
> +				ivdd-supply = <&reg_1v8_ext>;
> +				ovdd-supply = <&reg_3v3_ext>;
> +				txavcc18-supply = <&reg_1v8_ext>;
> +				txavcc33-supply = <&reg_3v3_ext>;
> +				pvcc1-supply = <&reg_1v8_ext>;
> +				pvcc2-supply = <&reg_1v8_ext>;
> +				avcc-supply = <&reg_3v3_ext>;
> +				anvdd-supply = <&reg_1v8_ext>;
> +				apvdd-supply = <&reg_1v8_ext>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						it6263_in: endpoint {
> +							remote-endpoint = <&lvds_out>;
> +						};
> +					};
> +
> +					port@2 {
> +						reg = <2>;
> +
> +						it6263_out: endpoint {
> +							remote-endpoint = <&hdmi_connector_in>;
> +						};
> +					};
> +				};
> +			};
>  		};
>  
>  		i2c@4 {
> 

-- 
Regards,
Liu Ying
