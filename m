Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B68C5C458BB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 10:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F78710E328;
	Mon, 10 Nov 2025 09:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="GwVV8IVq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1906210E328
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 09:13:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ixk+JvzlYGoi1eu7IGdxJ7QkEkx5iwH9ZimfFjlhTtwMpvLxV6/m4HsJFslopPlqa7jvrHQP2L7Jo45mKLE5xRscKYezjh/HclbDTNTL1sccNcKMxQL7ztpOPjwsa5nizvR8LtEOkxuq01OjBBLmqDvkMcDeA31/w/oPxjtLPBDzaV8xIkl0NheRj+r6mQuUmdWWlkBNIyGoGpekBBQ5H26TnQpZi6akctxw86pA+rNVZTe/NnqkzoWQhUyyHYPHfhyxyS2W/GbndUKc4KtXMj69Aa8DiuqfE4sXWOUcewIHrquXkgCRqdsG7BPVNKHqT08gCbiMOi9XyhOOISX1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2t7AAZ1Rje6eWEWcEGdoBWDIc1KivwHFWU4maR0dxg0=;
 b=XXo3Q83mgulWDGJR1WI6tV22jS1i7LHXxAqWMmQmwc+9HqbXeeDA7/MkE4R5Pnc5taYQ2F8fEJNA+QdC5B3zYsI+hazfoXjZjyBR/61eER+CNnooFbYkx4HLSrBOXpkBDB8R+9syiBwpE+x5BgOuaToUK2STI6LeA/is6uyKJxgSvPahjf7rrU7+x419EtOIFsQntE37BPNkxIZ7d60Q/BEEpf2jwANSTLM4D3pPwRWsWzfFM3QhIqf7OIgN1Zvd3Z2l+tEsgzv8+k2bSOFu1Dg9stjkeGEbWXAcOT9vI/5h79X+Pj3VSxfsHOo7gzl3j+Kj8IG4OgngQ0KgYY8zfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2t7AAZ1Rje6eWEWcEGdoBWDIc1KivwHFWU4maR0dxg0=;
 b=GwVV8IVqGCRJfmZOV48xVlS94K41bh8/NoYEWRSWhYH/Bi4lUgttDqrQHukJCMBWIxTVY/O7fLEQrvDTSh+oR0seOiHMfiZ9/MgAmVZ5I0GvK4Gj3AUsdV63EJwnc6GYk3/A+CbCco3JOZA44rs09wmlHC/kdW6h7Ba880n5lq8MVQV2pfCNpn2MEnVJWpaQZs+koUa8vANyq8N7FamWw4GEhB8X3Sz+fOx+tlB7Ui79LFY9V/qjEb52paSvpJ8vT/2dXPfrPzUch2sOD7DaZuN4KYCl+ENm7lakIFJy7GSDwNrdKH44vANwLj0bnFUP3itBrWIjB7SxkLHyDPvo9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV2PR04MB11957.eurprd04.prod.outlook.com (2603:10a6:150:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 09:13:34 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 09:13:34 +0000
Message-ID: <42eb2d42-47b0-46b6-92e9-c59473113c2d@nxp.com>
Date: Mon, 10 Nov 2025 17:14:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif
 fallback
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: marex@denx.de, stefan@agner.ch, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251013205155.1187947-1-festevam@gmail.com>
 <4bd512fd-b3df-484a-8a04-a1ed066c42fa@nxp.com>
 <CAOMZO5AGRejEwNvkH0Di0HVi8QPduTeCSud+_GqOkD4tqEcsdA@mail.gmail.com>
 <37b8d968-a725-404e-8fd4-84c2a0bb464c@nxp.com>
 <CAOMZO5B+VcGxx9Xa6FFXxeka0qcqBmATrartguqMLMDK4fGduA@mail.gmail.com>
 <da41c891-db89-436f-a262-61dfd33d57f9@pengutronix.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <da41c891-db89-436f-a262-61dfd33d57f9@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:3:17::24) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV2PR04MB11957:EE_
X-MS-Office365-Filtering-Correlation-Id: f745d9cf-6ff6-4672-ce2e-08de20396c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|376014|7416014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmtUSUpJTG9EOHppdUNDUkFZMjZzbUplTXF2UWxpKzRBeVZFTklLSFM5L0VM?=
 =?utf-8?B?SWpLb1JXdlhHYXF0NGhTWWVObmxSalNtWEhUTUlScGZwdGxhcGRuMEhiTkpj?=
 =?utf-8?B?NGFVajBJa2I5S1pHdUpTMHlOZ1E5ckdUakgyd3o1SlBzLzRTSjYwTGc5Vmlk?=
 =?utf-8?B?OWZDNXBHcXBpSEZ5Q3h1Y0dyV1VRWE85V0JlQ3hOTTJybHJrblhzSWJrcnUz?=
 =?utf-8?B?VXlMcmhVTVkrbFc3Mk5KNDdvTDBDSXVSYm50dUdLQUVYa3JkdVdmZzYyaVRp?=
 =?utf-8?B?cG14QkJIcGpYVllIUDlLVVJoVGtjVDVLUUNkdW12ZER0dWJmR2xvODRZSG5S?=
 =?utf-8?B?d0FDOXVmUnZNNWdTSU5rMExDclFIV3E2WmJ1cTlxK2lrWXoxSyt1anpTTTgz?=
 =?utf-8?B?QjQ4SG04MHZOQllGRXlrRWtNZkNLQmFScmZJcU5VL3hURGMxTkZZU1BqMWh1?=
 =?utf-8?B?MUxFaGhVeHhZdWx6UC9ncHE0OWx3c0NnVGxYUDVuK3pqQ2VGNFl0QmsreFFu?=
 =?utf-8?B?Um9xbHlOTEljaEp2bmkxQmJtOFFVb2daOERyeG42OFlvOUpqOVRHQUZ6RkN5?=
 =?utf-8?B?bmFUTGFGZzhuN1B0eGJmSFVXdkcrT0ZWTXI2TzhabkNLdzgwL2tjZVZPK3ZP?=
 =?utf-8?B?R01ZVDdNQUdhbFlPdlZ2eHdRVGFmSVNuS2lkZ2x2WCtCRnlMV1ZpSC8rbEdn?=
 =?utf-8?B?K3RZM25UV2F2dTIrcEhUVlFBQlpwWUs0QjMvVFhRcG1DdFk1dFVJQWhjcjd1?=
 =?utf-8?B?ZVQwY0lIaE5aYXU5alI3KzA4RHp4eWkrSEhlZmZvQTZLR1VEN1c0bUl0U2tB?=
 =?utf-8?B?THpXOTNPTmR2M0lVMUF4aW90R284VU5QWHgwbEV1cHQ0TkFFbzZIb0ZtK1Ra?=
 =?utf-8?B?MjJUS25rWXBoS2dsbkkxeVhSN01uSEl6WExIbStXbFRod2pxVkhFVVl5YXV5?=
 =?utf-8?B?Q0pFYTBHYTlwbkc4VU5EV3BlZmNlV2xtTkNTRFpCSUQzNGdpUVM5MVZtV3kz?=
 =?utf-8?B?QlZ1aFJGWlpMWkgvUmFhUGhpdWUxVTdhOS9xTE8zc3dZZDdSTXFYdDg5cTQ2?=
 =?utf-8?B?aXFPOWphUGptbklMeVFCOTBkVWlLbXQydFZYaWlYbHJIdmdLakFac3hJUHhn?=
 =?utf-8?B?ZTBuVFlqRVJwdjZCa1BuM3dqaHlHNm9oSGNhT2M3Wks4SDRpQTJ1SThxZGtu?=
 =?utf-8?B?YUJ2QU04U3lCNEhsUXJ6dFhQUWU2TXVuMjlKQjY5U2Q3bmJkN2M2NVE5VXd5?=
 =?utf-8?B?UEpHSURDcUFKRWxqVEFTVndhR1NrL2I3TnlIc3hYSnY4am1MS0JnblhFQ3VJ?=
 =?utf-8?B?ZkF6ejQ5R1h3a1dheU1Oa1U1T1hvQ2VmbjlDTnM2QnYzOFhoaFQ3MHhPeXkx?=
 =?utf-8?B?Z252SFVzVWVvem9NZ3U0OGlMTm5HejFRSWFvRTVCOFpZeXJUamgxZkdzUmRH?=
 =?utf-8?B?akJ0NCs2bEFKL1JhU2N6UEg3S0lwMHN1N3pnTk9DdUFhWEk4K1UwYmVFNDVp?=
 =?utf-8?B?OS9HajNHL0JiazNDMGx0Z1ZaUEhrWTYxZTlENmxQS1VHcnF0WVRSUlNZRDkr?=
 =?utf-8?B?WVpyaVRLQlE5NTh1Q2Z1NkV2NWtUZ1Bod3FEZWhwR2EzeS9XYklLLzIwRGdz?=
 =?utf-8?B?OXJONkNDT1E2OWoyWldZbXM1dldDMDlLVTRyeTc3U0V5Z2JwZ2d3WGpCUVM3?=
 =?utf-8?B?THVieVdiSE9mMnlLcCtvaTFtbHFnOWtwNmE0ellyTEZOby8yUXR2cFRUUHU3?=
 =?utf-8?B?ZkVRMFUyNmN5L1YwdmtaWlNTL05lZUFFNWIzRlBSMnp5WUtDdlVKd3dHZVRZ?=
 =?utf-8?B?cEVZNVhRN1I3NUNmVmxSZjRsMzVqSlhCam9QNHpMWjlFc3M1dXBSWVliZC9Y?=
 =?utf-8?B?SDdiaGZMaEZYN0dMa3IwcEQwY0hMOVdRR283eHd4eTNPVWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2dJTGUrY1UyMzFhMWNCNVhDa2h4VVg4UmFlVU9laU52RG5oQjBqRjZ5Ulh2?=
 =?utf-8?B?UTVyWlN0ZjltYkxqRDEvKzBSZjFlUE8wWmd5UHBUei85VGtXaHRubktoWkNM?=
 =?utf-8?B?Q2tadGxvdEZ2dlZYWEUrcGR1ZThpaFR0ZXFCZVpUcjVqa1BsekFjUm5nNkFj?=
 =?utf-8?B?QklXNkpEQzQ0T0lXUkRkOEJqTmJqeGdIK3o3Q1lPZW1JZUtsZFp1eU44Q1Yr?=
 =?utf-8?B?ZXV6dnlJRk8yVWZuVUUyNUVscDJmNW42UDM0UUpadUhIMUdaT1N2N2xOejR1?=
 =?utf-8?B?OE0rUG5ISjFHRXY2ZG0xeXBweWc3WGxOcXd2S0lrZkUyNDNJM3hzZzBua202?=
 =?utf-8?B?VWRxM1hQL3ZsYmhFaXdWMCtocEU4cjBiZ1VOR1FOK2RIblZpNGtiRjhQY1VY?=
 =?utf-8?B?TGw2ZUhWQnpsL2h1dnZCV0pTUFprbEJ0ejZOSnlTcnJlR3V3UnZzcEtDem5w?=
 =?utf-8?B?ZHVHWjNMNThwdmRycUdFNUxrVXFIUTNWRGhPUWxOM1RWQUdSbkYzMldiZWVY?=
 =?utf-8?B?MGp4UzRnMlVOYi9HdjROQ1ZOTW84UXp4NzZQVjYvU0krMmU4SFNrQnZwYXJ4?=
 =?utf-8?B?YjhhQWp6Uk0zOWE4MkhqQzlndGFpV1BoM1NXL2VicGJ6ZUNhdThuclR5Z1JK?=
 =?utf-8?B?VCtCVnN0b1BKUlVnRGV4T2VWb3BrQzI3MDlYdGRoWFRCYlVrTHRzYTdQMjYv?=
 =?utf-8?B?ZXpNMDZYSWluNXVPR1BUMGdMWHdIWWUvdU9TRjBIVG93alg0SWJxdFpzcS9U?=
 =?utf-8?B?U3p1RHBneEt3UGVQVHRQZDBDNWNsNlhNWE9ROUpGckE0Q045KzZrTk5IMWtv?=
 =?utf-8?B?amRjSVNDRmZJYlZFbmlQV1RWVUE4TG1uMDdmR0ltSEMyTWF5aFdTb05MU0Vm?=
 =?utf-8?B?Qm8wbEFwZDZvRmNSeWo2cmtEUUhqeW00YU5PSkpEMG8wTU5DSjRZaGZNRlBY?=
 =?utf-8?B?V1VpbExVUW4yQ25FQnFoaEdhT25Dc3dBaDVCRnROaGZFTHdtOVNkY3g2QUc0?=
 =?utf-8?B?YTMzbCtOVXE1aXQyTFZTRGkvQ1A2RTM0ZkZSRDErK2lZR0J5bytJTGpkLzhu?=
 =?utf-8?B?a0VkOXhDelFlZjFrRURhRC9GOEVaZXV6VEZJN2x5RE04QXhtM0QrenVCRW9s?=
 =?utf-8?B?SWtWeXBnTjF4NVJTaFpBNGRKUnd5M21NbEkzRUM0dXNqRTYrL1BOMW1wdjVN?=
 =?utf-8?B?Yk1MWkRFM0J5S2JoajRHQXh5ZnVDRytEWHg2MjZUdHZSaTJ4SlAreXFiRmU4?=
 =?utf-8?B?Zk4xS01CZ252Yk5waEhtcENod2phZzR2NEtVWnpLN0liK3BsYTFGWmRiakZG?=
 =?utf-8?B?OFVGNDRKMTN4Y21tSXUrV0k1RjFnNkRxNmlVbGdhSEhCRWlKeTliTFNodzVz?=
 =?utf-8?B?dkRiOHUxWHVkd2E0YlYxK3BsTE9JL21jdUJNcXpsc1pqeVdUd3BHcjZ2K1BK?=
 =?utf-8?B?STNSdzg0d3VKYzVScG54SENTM2plS3o0TDZyblRpVXBSTGl1UUhDRFgxc2la?=
 =?utf-8?B?SWZwZFpOblZ0SktpRFlvQ3k2cVVCUm13MTA5eUwvbGh3VjlTeVlLazNPTFRD?=
 =?utf-8?B?KzEwY2JKY1pvQUxOMmNBNXA4ck4ya2VleW53ZWN3dTVYdDNTTXY5SDJmdk1V?=
 =?utf-8?B?QU8wei9LY1B1alV1QkxDTTZ5alR3VmpUZ0J2cjU4WnNuUy9tb2VJd1BneC95?=
 =?utf-8?B?dEQ5aG51RCtuQXFPY2FpWEZMcWJWeDlPMExjYWRjcXZPQmhyaEdad2VyNGtW?=
 =?utf-8?B?azVLQjUvVDBOVEFKTmxtdEFGaUgvK0hBY0RSd3Frako2eHpLa01YVEwvbTJ4?=
 =?utf-8?B?WnZLWDdjY1d4WnJBSk5sU2xkWjNDSlNJdzljSWRPY3NsWWxOTmJnZDNTZUVU?=
 =?utf-8?B?RzBTRU1kVE1tdGFiZ0thSVA4bnlveTlMUDVDRS96SW1ySFNOOG5PMVVKL1NW?=
 =?utf-8?B?b2NEOGoxbDJtQzd2UkdRZ0RYVm54eFZBZ1RZdDNoc005OE1jZnhsUU9IOFh1?=
 =?utf-8?B?Qlp4WmdwOENwYjR1aUVqSzRzZnMrNXRDT0ZaZGdQd0dBT2JxWWFDYWI0Y2x3?=
 =?utf-8?B?UTZZNVBiaDYwWDNIZWNGdXIyY24vYXJxMm8rVzJyMUVmUlgzbFNxVWRZVDgy?=
 =?utf-8?Q?F7n9wgkoSSOJBrNXzShuexjRL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f745d9cf-6ff6-4672-ce2e-08de20396c8e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 09:13:34.3100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CaQt+l6OUNd1ejzKm2Rm7GJ2sQsVT/zzWqP2qnC34av0eyeX8sj/6NR9mam7aOldXH3p/GNkAeTL+AnQqwRtmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11957
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

On 11/07/2025, Ahmad Fatoum wrote:
> Hi,

Hi,

> 
> On 04.11.25 21:44, Fabio Estevam wrote:
>> On Mon, Oct 20, 2025 at 11:53 PM Liu Ying <victor.liu@nxp.com> wrote:
>>> On 10/20/2025, Fabio Estevam wrote:
>>>> On Tue, Oct 14, 2025 at 1:12 AM Liu Ying <victor.liu@nxp.com> wrote:
>>>>
>>>>> Strictly speaking, I don't think i.MX6SX LCDIF is compatible with i.MX28 LCDIF
>>>>> because at least i.MX28 LCDIF has the version and debug{0,1,2} registers(at
>>>>> 0x1c0, 0x1d0, 0x1e0 and 0x1f0) while i.MX6SX LCDIF hasn't.
> 
> Thanks for pointing this out. In my opinion, these registers are auxiliary
> and don't really change the compatibility situation as a functional driver
> can be written without their use, evidenced by the Linux driver doing just
> fine without using these registers.

DT bindings should after all describe hardwares and in theory they should not
consider software implementation, that's why I said 'strictly speaking'.

People may argue that potential software would access those "auxiliary"
registers and hence i.MX28 LCDIF is not a fallback for i.MX6SX LCDIF.

And, to me, register at 0x1e0, i.e., HW_LCDIF_DEBUG1 is not that "auxiliary"
at least for Linux, because Linux DRM supports getting current display scanout
position to generate accurate vblank timestamp.  HW_LCDIF_DEBUG1 actually
provides the interface to read scanout position.

https://elixir.bootlin.com/linux/v6.18-rc1/source/include/drm/drm_modeset_helper_vtables.h#L448

> 
>>>> There are some DT users, such as Barebox that matches against
>>>> fsl,imx28-lcdif, so we cannot remove it.
>>>
>>> Hmmm, it looks like software projects like Barebox don't really follow this DT
>>> binding.  Is it possible to fix Barebox to avoid changing this DT binding by
>>> this patch?  I'm assuming that Uboot has already been fixed.
>>> What do you think?
> 
> I am sorry my prior feedback ended up stalling this series.
> 
> There is a lot of regressions happening due to upstream DT changes and I am
> just trying to raise awareness. Another example I stumbled over today:
> https://lore.kernel.org/all/91f764ab-bec1-4791-b01b-3ba0803ce8f8@pengutronix.de/
> 
> 
> I have submitted a patch[1] to barebox adding explicit i.MX6 SoloX support,
> so, having expressed my opinion above, please proceed as you see fit.

Fabio, it seems after Barebox is fixed, you can fix the LCDIF compatible
strings in imx6sx.dtsi?  I don't know if there is any other software project
which is taking fsl,imx28-lcdif as a fallback for i.MX6SX LCDIF...

> 
> [1]: https://lore.barebox.org/barebox/20251107210033.2229781-3-a.fatoum@barebox.org/
> 
> Cheers,
> Ahmad
> 
>>
>> Thanks
>>
> 
> 


-- 
Regards,
Liu Ying
