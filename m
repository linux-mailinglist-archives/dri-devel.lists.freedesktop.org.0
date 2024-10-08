Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A90D599599A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 00:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA4810E5F6;
	Tue,  8 Oct 2024 22:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hFDXIqwg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D1E10E5FC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 22:01:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKPbWREgm9rZ9hZAfSUNZAcfYEyrJ2apUDOqB6sCNlenNd7V5AuTAk2i4i807+JqxFIOX97UVGs+K9WcMZKrCD5r0w5jlyULHmQbfxYeoM1QZvZXmoCXMiX2QU1DawujQvY8XdVnOezn27UUlL85UeGpdbUKcGQ23AtceHK0qQDlSa3eFXFiBbcFedEL0rXO2Tm+nrCmgI0/G70E92l0djVLe7i5HUm+qW/AB/IM4cFHpj4w/uzww0fVT9bh0zUMkIWelVD5Zbc1WwOpdNs62wFH4z+yiAytfX6qL54zVdaLQNB0CQmZc0uw3bQw75FV61+lDLbhO7+aSYnChqCV3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/UHI64uQ/7YAhY4Mwez3N0JXuj8VcYkeHiqU5fsTA0=;
 b=aWCl1eeUhMGfyBjSCCePBfVm885hHmP88b3+rv8CgLXsZ72DTo7RrNHNKpSgtrP/MRTaLGga9QJQy7gnQ4mtnzByTOZNV9a9FrYosupId1fwklhIgYvDiheUN4ujBGeLhe1JtCp2nlOR+eYfOYhXdNBbbMWMbZMPPzkbaOlLQR6CScxrWRLHr+5hP/cFcliEio2F5g+2VyZakxJW/A2F1SxYjV+H2fQzyqAjcHt+pHcdxojs+nRQGxV/QGSap2pKHmtyhfiPFw5GjM8A9MomPZ7PvZKLVYmL95paVZj/SEb0ghmeXWFt9CfcPJEm6H8UwHrG/CmySridSSAiTFozSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/UHI64uQ/7YAhY4Mwez3N0JXuj8VcYkeHiqU5fsTA0=;
 b=hFDXIqwgrGqYHP+0MDYboYlFR02Ls4sjpK5/u3UQ6JznsI12Y9fo1W3KbhQbOkeJXvoZEUmjY6E482/OGjSdPOZwzLOwfzTR1CnA0bifODuRSjwQwkYd4dvsU2eOcbclsp2Nd67C5ymFOhB7a77LqkFP5K0mJsM8b1CYK4TCGbdaVNFaF4kRPcT6znOrxlBnOrSaWMfexdDnDJHadTB03/6WPrX5c4tP42BpHqmxDnEDi76P410jBtfHN0Y+3kYZPWfj1VxCXFS+P0iuxVGk38PDp6wPMcK3ZCcjDhQWix+Nu8/bNC4GzA4bVjEweuL1Xy6oKFWgVS2DveJPsGKtOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9667.eurprd04.prod.outlook.com (2603:10a6:102:242::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 22:01:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 22:01:24 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/5] dt-bindings: mfd: convert zii,rave-sp.txt and child
 txt to yaml format
Date: Tue, 08 Oct 2024 18:00:56 -0400
Message-Id: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJirBWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAwML3arMzPjKxNwcXfMkEwsDoLClhbmxElB5QVFqWmYF2Kjo2NpaAMK
 QY8laAAAA
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728424880; l=3488;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=bl2N5BNg6z2MoNqVtX40BcViKkYtOEHdGXrDOJuHa04=;
 b=liYKjn+qCtzFLsHkc77ufJNhrbuWyQ7utJYZUInPWykU0Otz7t3ULWNv88Db+mpJHhYrJk8ad
 YNzTTaC4CZSCyJSx9qt1HMEa7s+1dzqrMwNNq9HruIOznwc+sUwCNhA
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9667:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c36eed3-10f8-4d91-32a8-08dce7e4c052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0ZHamN5bTBiNlBHL0M2amNpaVhmUHkrS2ptRnNoRXhDTE5pNHpFMlV6QjBS?=
 =?utf-8?B?VGFSMkU0bExFdklVd1ZBR2EzZTFicXZwbmNiMVc2eHRhdG4wY1d3SS8xQkpm?=
 =?utf-8?B?SVYwdE1XbTQ1N1lSWC9KdnV2TFJ4Z25IUStVWU9CejJ3QUppbFRaWXNkUVhC?=
 =?utf-8?B?NmdocC9CYmZsMXBYVUtIa0FEZFZhalJ0ajAzTlZXbkdGSkZ0cFhETTdxZWlY?=
 =?utf-8?B?M0U1bHZCUldFdVlOWjJXNllZN1pvUlRCMStoZUFXYjJ5MUw1N3VMaXYyblha?=
 =?utf-8?B?bEFoZFovM2xlb0V0bFFEZHh2NGxFWHVYOXNYc1gxMGxmSlVNVlNYbW1makha?=
 =?utf-8?B?V2ZZS0VlczlCZWQ5WERRK1g2SGcvQ0FxaVBVWkRuaG9YVUJ2a21tcmtub1FN?=
 =?utf-8?B?RkZoTkJreUVBSUxham4xeFpyT0dKbXZHYzdZV0ZTYUx1aGlBeE40STVlVE55?=
 =?utf-8?B?dWNPVlQ4MStzYzE2SHBTZldQdVVuTWp2czd4ckg5RHNWcTJpS1ZkOFVyelZ1?=
 =?utf-8?B?ZVdlNGxIOEV3TEF6Z1d6K1R6VmozbTZTWENWUkYzL29mcjI5UmFVWTBYa0xp?=
 =?utf-8?B?VHBLTG1GcU5iRzBodCtnNDVDQkFkMVdNY1V0RjNsT1NxZFkzd2F4UnBvN1cw?=
 =?utf-8?B?a1NZUVBpeTlCYXZtR0Q1dVdpS0M1YjZaQnJZTXNaWUZRZ0QvMFRzUHlrQXNY?=
 =?utf-8?B?STBWY2QrVnFDYXJPSVEyNStpY1NNRE1ZeWpqSS83eFl1ck54Qys4eHpRckRt?=
 =?utf-8?B?MEkzTVpFNkJpVzVjUmFjWEJ4NHV0Y21JdEhBaG1MclNTbVZUMDd6S2JKajlM?=
 =?utf-8?B?M3V6UVpvcG8rZjlSMXREbFBSM3BGUTBVV21JTVVWNHEzeStBb2JwTUkvQWtB?=
 =?utf-8?B?c245VSsycHZBQzVsTnFoY2RCV2NGOEV6ZGQvNVVRbUtHTU1yZThGRTY0SXRI?=
 =?utf-8?B?aXIrVUJNOTRXK0ZkMHVFODVIQkM4NGc1OGNvMCtTYmlFTnFVWlNXdGkxU2Jx?=
 =?utf-8?B?OEtiS08ySVJLSjFBZ2RqVVkwdERjT1E0VUhETnJhWXlLYVZkQW1JRXBOK09J?=
 =?utf-8?B?dDFnTFhOMGpLcHVxZ25EcUtTdTQ2SWh1czRlWENLQUxzT0dxd1U5d2FhZFRr?=
 =?utf-8?B?Q1cya0tHOFRDUjh1UWVzcEdLNTF0ZDE1MXFHR3FIZDYyVDhzdGx5eUFPTzVF?=
 =?utf-8?B?SDV5LzhDWTR1a0FaU2VMUWgzTUhlTjE5R2gyc0g4K2FGNCtqbm5Xa2dVVnlD?=
 =?utf-8?B?bHlaMlBVL0wwM21NSDRScjFrM2NFMzcrbzFraG02cmZ5TWo5NGxjNHl5UC92?=
 =?utf-8?B?c0JIblpKQmtYclcwTHNUUHhJbDBYdk0yZGRpcmpFNzhSUUJxbytMVEFsL2RM?=
 =?utf-8?B?S2ZIWEtNdng4anp6MFhVWTBHVkFDZy9ObmxTUUpsNUt1dkZkdndPQ0RUdXVz?=
 =?utf-8?B?SGpkRnhpck5IclBweFpQTUxYNzFVUmlpc2Q3R28xejNRTzI0MitUWW9Lb28v?=
 =?utf-8?B?NWRPemdKOWhudGE2U1J4MHpENFpJMmwzbExkRnRUdjBOZk5hZ25OZkkrNHFI?=
 =?utf-8?B?M2Y2bG8vLzBqcG9MMlBaYUZ3enR4ZlplU1NrN3pSQzBOTXJiZ2FheU53S2Zr?=
 =?utf-8?B?eUxDVVJGSk0yNlZOKzhURERRYkozblFFMWpFaFB1SUNMcG1lRHdtdkFMR0Jm?=
 =?utf-8?B?SENieVlxVllCTy91c1lxUk5sYlRzRTNlYkExVmlEMktjUmhWYXBENjV4K2JI?=
 =?utf-8?B?RTRsaWV6aml4OGZjcmxrSURYS1R3cVJVWHFUVmVpYkJRUjBzdXZPak1RSFA3?=
 =?utf-8?Q?52SCuEBU9xLz9LdNODHFLQ9bdglAYOSWCME6A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHJ0cnRDalNKUkRKSzM2UVZybVI5YXpmQ0F1TWhFWXBsQTc2NjhSdm5jOXNG?=
 =?utf-8?B?UC9aUDBOK1NjWWpEeGc4cTA2dVdBRlZtMUdNNXdmUE56clN2djVUb0J0RXc2?=
 =?utf-8?B?a3o4U2VLaVBkSmh2emRTLzhDNFJIaVhpWUN4WFI5eFRBVDdQeDBMbFFwRmVh?=
 =?utf-8?B?M2o1c2l2TFdtQ25lUEZmcnNuYUc0ZFJwN0JlNGFBMHAyeFNFendkZUw0TFJM?=
 =?utf-8?B?MUpaajdva3djZ0FVVk5KcW1lWnIxNmg0UlUrV04yVmEzQ1RXUTgwa0t1R0lk?=
 =?utf-8?B?WTdxY2R1NDBHUmUwNm0xWXJ5MHlibDZJc2FBTWtjbnR6YzEyd29lSk9kZzh1?=
 =?utf-8?B?L2RNTDRHUzRFODVmcjhPdHh6RFhFdDI5RUF5RUNqUy9sQnV2MzdKMG5yaXJ4?=
 =?utf-8?B?OXArRyt0SUZzYTZEWWVxOFJpOXgrUnp1eFRzZHQ0OVM0RlFSeWxEc2k0YjNt?=
 =?utf-8?B?bVorZHNaVUhuZFlXQWJBRUFiMmRaUzRmMWRLTm5NQVQ1UWRacjJhZXVpcS8r?=
 =?utf-8?B?KzVFRk9na3ZkMUttYUdoN0Q3WVMxRjdBTUdKb1BpZUtqdTFzNFJyUURGbHlw?=
 =?utf-8?B?QkdqMkJLOTBEblpBeVJIak8rbWxSWHdGWTJvai83WDZxOU1DcFBOaWZuVWlM?=
 =?utf-8?B?U1c1WnFPczBzMERhMUkySExUTUtqMGExWmFXaElEMUErcjREZU50ZlVYU0R3?=
 =?utf-8?B?elQzTGJqcWVUbldYSml2bjdzOTBLaXpRaWg0WWN5VnVDUUFEOFFpVSsxNXM0?=
 =?utf-8?B?aDJrQ2s4VVBJaDdXUmJZNXdsTUxTUEtZcktTQjQyWE9UR2F0Y3M1QzVMQm5W?=
 =?utf-8?B?RURNd3BlMEdUbDdzanJFUzBPTzBwS3dQSytLTjYrT1Q5dHVXdlUrYjNMUGl2?=
 =?utf-8?B?Njd0Y0N0NFBhS1hHOURacVI0dHV5djRPaVJ3dXZ3UWo0SEFmdEIydVRIS0RR?=
 =?utf-8?B?UnpaMHVqazhJYXBVdmZvbnBCRkVzdWQ3bGtadkZjWU9kKzZhK2hiZ0llSzFs?=
 =?utf-8?B?Nm9Ed1VPZlo2SjJtY0lzeGxueCt3c1h5N0Y2czhLY3dHMC9iSkdTVXg1eGFx?=
 =?utf-8?B?MW1UdjlseEhQelh3cnZPU2gxOVJ4Z3ZXeFVKdFczMUxUOWk2dU1UejJIQ0Nl?=
 =?utf-8?B?Wk8wY1lGRE1mVlVkMmVkRUJhdlpYa0FaTnNvaGxvSFlqblVJWXpyVGRhaVht?=
 =?utf-8?B?TEM5ZkhqQUU3V21pWitET25PUVpRL3dXRmN1d1pJUVFsLytXNXFOaU0vamFx?=
 =?utf-8?B?Vmh0N1JZMXJCdGU2OUc2ZWxURlY0YmtFd2JhK3dVRktMYjB4ZzFSak14RkdN?=
 =?utf-8?B?OW92M2ZkUWM2MFR3U0FxZUhDTWJROFdhajB5akVqTlFEc0NFekZNVFdkRWF6?=
 =?utf-8?B?bk1Zald3cVdYY2IzU1laeGRMR0NFTTRRQXBISmNPeXpoMGcrL0I4eTdTZ3RG?=
 =?utf-8?B?SEIzV3h1bGR0T1pzRzQveVZxdVo5MERpelZGeUxIM2dWcWdsVHdsNGhBVDFw?=
 =?utf-8?B?OUpjYkYwN2Z3Y09uMFlhUlVhS0FWTnRFUWpscy9BOWJ6TlI4SytkQWFkemRz?=
 =?utf-8?B?RUlFZHB2OGN0VndjKzdZRWlueFB6TmovQXI3cGFMSmpudHByd1NQalZXMUI2?=
 =?utf-8?B?bkd4Mk1EVDNpN1llUkpjbjFuZHpUaTdNQ2NHWlhoR1F0THFiTzQrcUFMZUxy?=
 =?utf-8?B?NWVjcTNGS1JlRXhaMklod01NY0NPMUJZMkNONklTQkUvSG1wNHd5VnVHb0xn?=
 =?utf-8?B?bDZwbGRWSGgrUVk3QTE4Q0QxOFRjTWtKTCt5ZlN5SkFjTS9jZXdWUUhMU0g5?=
 =?utf-8?B?cmZ3bUE0RWFxNGRyZzFrTG81S3JGQjhNWlVGWnZPcGQzZWtlQ3MyK08rbHV5?=
 =?utf-8?B?ZElqNXlaQzQvWWpYd2lER3o4azEyU3dCcjhiVVJvOU9mMFpXU2pnaDFYUlR4?=
 =?utf-8?B?Z3lrTS9TTksrZXdZc0NEMjNtbmRSZmRURTJ6RVBUVTkxTkpoRm91dEN4Qk5h?=
 =?utf-8?B?ak9rTUk5TlNEZFlHSGErTUNwWDltazd1RGVZelFGM2s5NGhDd3FDeEsya3Mr?=
 =?utf-8?B?dS9mWlVCcklERFRQTGxlM1drN0g0Ynpkb2grWHJZM1pJWmdPWkQxTUpYVC9O?=
 =?utf-8?Q?Cs+Q=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c36eed3-10f8-4d91-32a8-08dce7e4c052
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 22:01:24.5948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wka9H7hoKPmAQ7ocQn5S891AChNk6XOBsKUaUXMBCEn+DFmLUeBspLQ7kNqTJlTaLT0yzx9XCYFHywfGypheeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9667
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

Fixed below warnings:

arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu: failed to match any schema with compatible: ['zii,rave-sp-rdu2']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu: failed to match any schema with compatible: ['zii,rave-sp-rdu2']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (5):
      dt-bindings: input: convert zii,rave-sp-pwrbutton.txt to yaml
      dt-bindings: backlight: convert zii,rave-sp-backlight.txt to yaml
      dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt to yaml format
      dt-bindings: watchdog: convert zii,rave-sp-wdt.txt to yaml format
      dt-bindings: mfd: convert zii,rave-sp.txt to yaml format

 .../bindings/input/zii,rave-sp-pwrbutton.txt       | 22 --------
 .../bindings/input/zii,rave-sp-pwrbutton.yaml      | 36 +++++++++++++
 .../leds/backlight/zii,rave-sp-backlight.txt       | 23 --------
 .../leds/backlight/zii,rave-sp-backlight.yaml      | 36 +++++++++++++
 .../devicetree/bindings/mfd/zii,rave-sp.txt        | 39 --------------
 .../devicetree/bindings/mfd/zii,rave-sp.yaml       | 63 ++++++++++++++++++++++
 .../bindings/nvmem/zii,rave-sp-eeprom.txt          | 40 --------------
 .../bindings/nvmem/zii,rave-sp-eeprom.yaml         | 54 +++++++++++++++++++
 .../bindings/watchdog/zii,rave-sp-wdt.txt          | 39 --------------
 .../bindings/watchdog/zii,rave-sp-wdt.yaml         | 47 ++++++++++++++++
 10 files changed, 236 insertions(+), 163 deletions(-)
---
base-commit: ba5c58f259ba6a60856db98052e0c79729acfe99
change-id: 20241008-zii_yaml-7b4802029873

Best regards,
---
Frank Li <Frank.Li@nxp.com>

