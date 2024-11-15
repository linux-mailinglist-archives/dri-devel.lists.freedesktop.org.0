Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40C19CFDA0
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 10:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C42910E1AB;
	Sat, 16 Nov 2024 09:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="TKqjruRG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2069.outbound.protection.outlook.com [40.107.249.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E305310E2CC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 12:25:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYh2eJh8nn+MdIc1KUXvQ6FDFJ37PKAyJx5IyDt3nH+W3ctoArzPPuwgeAqEx7ovXuB2l6pdETTT0/Fj/XVCD3sn28t/KzmrP50cw9CLAu1Yk5A0FmWsXMNvbYxGHzDDrIfIYqp/hfkK+x7Xmbmdcpspj+0NZAWvdQ4yQrJGvJaMt5rS5GlzLorlL3tTuE1QREC4BbHhQvFoCdUn4dJ93xBJWSkUEVSPgnreDqqOZntq9/KG7Zlq7klSwnthikq1LS5VDdg5hwdgD8eoqstvJ9HRQnCG6+CRc/xFDdM2pZioQU2BUNTYO2pBc8ECV1j93hlNMvpz/UFoLjKbT6Racw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljOk7e8baIliHveVz/CurL0+CAr+LHIykSIBhinzt8Y=;
 b=sFw4mZ70PfZ1+ogYl9/yg2RzsZrFwpIXHbC2K8saeZx7ysa4Mq8xmD07fqMcDN8BlL1UaVeyYWhxbRzNDlL/G2HLQWiyWWCv7q0aJzuJYz0ve3FM1TyL+eLYxG4tSVV9vKA4C+bTDOQzRnopH6H+ciiJIx62ngLIeRD8lfWTjCeyCX/p9xRb3+vO/4RPK+H6gXETWz94AYfjFjjGlmElacew+apCf6Ba3RzHT0b9cWcrEafuCUuWMTKRtuZ8sMlHzf/YuQkf7HZTEUZsGMnvE8MxrCEe7Jf/hBbikFnKw3eQAmxsqmp8n8my+lQuTR6++gKaya4pRf09g726A1+sRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljOk7e8baIliHveVz/CurL0+CAr+LHIykSIBhinzt8Y=;
 b=TKqjruRGmY2QwW+ixAl981MmdRmMte9TZQss54kDLecXDRzolpLmvxqSW7Xajgdkf3Q/d+SInG/em+5CkqUcJQQ71IUrmtNNHKyvuhEVTb7RGP/KxyGrO03NDPOdCzOYIfoSZa6VvynWEy4u8Ha8fKw3N33Ls4tBbRhrQvUY55Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AM9PR02MB7625.eurprd02.prod.outlook.com (2603:10a6:20b:43c::10)
 by PA4PR02MB6942.eurprd02.prod.outlook.com (2603:10a6:102:102::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.25; Fri, 15 Nov
 2024 12:25:02 +0000
Received: from AM9PR02MB7625.eurprd02.prod.outlook.com
 ([fe80::aad2:67d9:c82c:fbcd]) by AM9PR02MB7625.eurprd02.prod.outlook.com
 ([fe80::aad2:67d9:c82c:fbcd%4]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 12:25:02 +0000
Message-ID: <d7121d00-4353-2901-e87b-7fef7da5a35f@axis.com>
Date: Fri, 15 Nov 2024 13:25:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/bridge: adv7511_audio: Update Audio InfoFrame properly
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@axis.com
References: <20241113-adv7511-audio-info-frame-v1-1-49b368b995a5@axis.com>
 <nramdgi4pziet3ypwdi32zolnhdzualv4rpov372s4mfsakdhs@7qjro2oaef7i>
From: Stefan Ekenberg <stefan.ekenberg@axis.com>
In-Reply-To: <nramdgi4pziet3ypwdi32zolnhdzualv4rpov372s4mfsakdhs@7qjro2oaef7i>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0053.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::32) To AM9PR02MB7625.eurprd02.prod.outlook.com
 (2603:10a6:20b:43c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR02MB7625:EE_|PA4PR02MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: 8117db44-32d5-41b0-48e1-08dd05708769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWlDR2U3SHZ3TUp2WjkyS243azM4bHYvY3NaenZGZlAwbDlRYnVuM04zRzA3?=
 =?utf-8?B?WkpKWkhpNmd2SHJmbTJMVEdJekdhY0lsRkxwWUpzNUtJZlFmZG9lMlRMV1dB?=
 =?utf-8?B?K1VwN3pTSGk2RzN1UTQ3VEhWTDF6U21IcC9hRjZ6QjJRVkNZc0t5c3hXZ1Fm?=
 =?utf-8?B?a0FzNUYrd1U0eTF1QU5BNjM2RTdZSWRpN3RFTjlZVTViWjhrWlkrdVZJR0Qx?=
 =?utf-8?B?bmlIM1N1K05QYnpWd2NwKzZNNUtaa0FYUkpLd3hOS01FM0NUSWZHNXgwcm1D?=
 =?utf-8?B?clNLOHdwOHpmMlV3N1JLVjBFcSs1ZDNvVkhZUE1ZT01tNCs1MnQvcnI5ZWxr?=
 =?utf-8?B?ekw1L09HWHRUWkJwMHVTNEtQemtrdjhGdGk2UXpTaWtOZVduaDFNQ1hWcnhH?=
 =?utf-8?B?SlVHSCtHMlg4T29Yc1hKWnl4elllZ09MM2dxQlF5RDRDazhnYlQzS0pxUktp?=
 =?utf-8?B?NDFtUXkxN1l0V21iRzFmWVQ0Ymh0N3BIOE5PMlh2MWdURGFibkRVSnYyWkZW?=
 =?utf-8?B?R1pXZU5RYjhpSFFkYlBuc3ZaMHNQMUptZ1ZtREZ2OEJYRUprRUl0VFRobXVi?=
 =?utf-8?B?N1hEUGJ3UDVYWG9Ec3VnaUk3dHRyZ0huMWxSM0sxaGh1K0J6YlcvMzUvK1N1?=
 =?utf-8?B?cllleHErWlhqaVRuYmdOWUM3dWhqRlhySE9rbDg3cjhmeE5EV3BYWHFTeGxj?=
 =?utf-8?B?MjhuV0cxbGt1TjJaSm5BdG94WVlWSEg1OFNRK2liZWhOM1Nvd0xnMXdLcUxk?=
 =?utf-8?B?N0tuYW1lOS9SMjVrZmZEYmJLTDdxYjBneGRPS091Z1d2SXR6ZUI4WWNYb3JY?=
 =?utf-8?B?Y2JSOW1QWkIzVk1ka3JPVytjZ2RyWTNTU1U3dzhGZXRITENLOGRzMzBxalFG?=
 =?utf-8?B?ZUREVll6SlluaEd6KzhBTmpGbk1pZklPZXZSV05qNWw2TVdRZDFUMVJOSkVI?=
 =?utf-8?B?eTk1b3F5TmlxQnFVR1EzSkFjWFExU25pdWZ3MTBGaWVaYUpBU0dndzdpcHdN?=
 =?utf-8?B?Vm5tZ042eXNuU1U0SmZRTjBCZ2YwYk5JMXYwS2F2aXhka0Y4eEU5MHBtRmhJ?=
 =?utf-8?B?RVNmd3V4alZuZXlpTmc1VDFGeEVCRERyOGxVQkZLZVYrTXdKaWVDRDRSSFhu?=
 =?utf-8?B?Mkc4VFpNbTRrUGh6TGliNUQvdm0zWDRXNzZCa0NKS0tzcEliUUEra05wenB6?=
 =?utf-8?B?QlpaMG5aV1RJZmdIendkNENtYmx3SUxOcC9QcURHTk5zeEN6Y001eGRCUW9X?=
 =?utf-8?B?aHJDOTZXWUYzcHpIYWNPbnNKTm1IZUxLWnFDSDZRMVBJQmhJZnJwc2c1Z05K?=
 =?utf-8?B?aldmbUlXSmdncEJ1ZXFTL1ZYZHVjWTVBdThnOTYzNVBsTllZVUR2K0toaTJU?=
 =?utf-8?B?YmtGd0orV2s2WGhvajJsSUZTdWRFTVFmZHQrMTF6RTg3YnFqNGx6ZmNDcVk5?=
 =?utf-8?B?c2FrR1pIUnNrUjZyTFpSU0hMZ2hyTCtFV1E4UFdHcjBYZExXOWJPOHdja2Vl?=
 =?utf-8?B?RityYUN4WW4wbi8wNmU0bWdQdWpvbVd6eFdORHRJZGprQklVeXRZVVN4UjhU?=
 =?utf-8?B?cnRRRFB1b05obG9uY0FvS2NoV2Z0WnNEZXB4Q1BybDQ1MGxCT1R4ckVQVFVT?=
 =?utf-8?B?b2YrSUYzdkpjSCsvYTIxN29iOWFFTlltRFF4QUthVE15T3hTc1VERGF6V2JW?=
 =?utf-8?B?OUEyNHhUZVl0cDZpb1NHeVlSQTNvb3E4aklOSEEzVit0ZE1KYnNJNDhIeGIr?=
 =?utf-8?Q?YA47J2Da2BnfPdvSsH4rK5Q9ug5h7TCBLG5Oh+W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR02MB7625.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHQrQjcxaVp2VWdZVExNenU3UmlwZ3NlMU9BcU1kKzRpUkRIcUkzWVMvWmZo?=
 =?utf-8?B?blFHNWtSMEh5d1ozbk9HOTlLdVd2TzhGQ2p6SjRwV3pmRWdwNm53UGV4Ti9h?=
 =?utf-8?B?MXhYcHlTbllUSXFqT3hxWXV5N2VPWWcyVmFEVUIwcjBNenF1S3ozazF4dTdH?=
 =?utf-8?B?T1NiWDZ5QXlFcThCb0RVM0diWnI4aHZoSVl1aUZGV3BaSHlweTNBTkY1Wjgx?=
 =?utf-8?B?S3R1emJHck16TDVzZzdQaHBYV0Iwc2xHdUNmdHV6NU1NN2FLcUoraE1NbS9k?=
 =?utf-8?B?WTJZSjllY3h0NUltUi9uZk4xcDVKRElYT25xYlZsdVNrakZNdUVFTy9nRWRs?=
 =?utf-8?B?TTRHdXVJYnNIOGY0RThxdStOODV6TUpFNDBNd202V05hcWlDY1EyZEpLcE5H?=
 =?utf-8?B?c2FwUmxWY21iOXpCTloyTGU2T0FRSkNoaXVyVjRONnBHUVptUTJ0ZjhFS2lr?=
 =?utf-8?B?U2JORDU4Q3RHVWdSMHBFcnV0ejVUY1pTWFROUDlIcU5NK3lyNUxrNHplVGs4?=
 =?utf-8?B?VFBmcGhCWkFncG5WaEMxMktOQldmTDRPd1hIaU5kbGVuK1RaelNkd0craTNC?=
 =?utf-8?B?dmNlUENSRmtrSFJQeHl4K3VNUUdmSC9ibXF1bmZrYnJkZUVzYjlwdnpBT1Nr?=
 =?utf-8?B?dTZCODFNTWZzV3NLR0U1Z1dKeWRoSER2ZCtFQmpqM2l5S0dhYTJaRDBlRzd1?=
 =?utf-8?B?azBQTlQxeDR4azFoeTlrUENqYTcrdHlkMXBueWVvMzNIejFBSEJ3TFY4Ulpo?=
 =?utf-8?B?NjJqR0lsRThtMzRjd2FYd0dSR0E1WWE4NVdFUWJQYjZyNDloaitHTkw5WDFG?=
 =?utf-8?B?MFhnSlVNcnE4OFVoMGpFbmtySlhDT2V1QVNqOGQxQnVpKzFxb09zN09DOGNO?=
 =?utf-8?B?elF6TEJmSk11ZHZraU5CTFJMOCtjU3EwbjFRblJFWkc4eVhVMXB2RXNlQU9y?=
 =?utf-8?B?WlJWbWFsU0hMTWtFd2E1VUtJMEw0T3NEbVB6MHNNc0FLT3daU1BYdVZtdDA2?=
 =?utf-8?B?cURIOS9HUmxGOFMxWGFPVjR6ZDYyVGpiTUR1ZjV4N0xnRDk0ZHZCZzE1ZkUx?=
 =?utf-8?B?S0dvNGF0aG5qTnZ6VGtxVldFaXgzVTA2Y0I0SHpFMGYrbysvRWdOYUttUXI4?=
 =?utf-8?B?WlFhajJGMXJuUm1QWjhSemMybVBSZGt2ZkR4cUppL0N2ajJkY1FseHVMWENN?=
 =?utf-8?B?Wkw2MUJTZnliMWlFcjVzQ0NwZjFJSXdXcWJnZGhKTEtyRnJvVWdUTGF4dlB4?=
 =?utf-8?B?WGc0aHQvS1IrWnFCa2J5QldNQjFZYXU4SVhnNHF6MFpZcE40WHJsMERqQXFE?=
 =?utf-8?B?b2ZEelB6TXJjM0t0UnFoemRTZ1JCSzlqNW1vZW55MUpvNFNScEVTRWsxU3o4?=
 =?utf-8?B?WmUvMXM0RHR5aFJkTUZva3ppWmc3Y29adUh0UUQxQmY4elhJN2VzVmhlekZy?=
 =?utf-8?B?MzQ3N0pqL0RLZW96UFk0ZjRYNDhwY3BtK0tDQU1USnRRcXpRN1g0OGdJdThy?=
 =?utf-8?B?QzF3QmJRdWZKczRoWjd6cFlDRkk3SEIvMXpMVkhIYnNHZlRFK3VHT1ZJTEVk?=
 =?utf-8?B?Mk5vZXR1YU9IZktRa1pKdnJNNkkybUhsbTYveGxZRnRaWXhGM0R6a24wSlFG?=
 =?utf-8?B?MWpvZlptZEtKSnNEVlVHOWlPRGlJMDJRb2tKcndwSHF5T0xCL3hXalFBUHBZ?=
 =?utf-8?B?TGM3bjQ3engvdmJVUTJTeHp1ZytVU0dCN2FPbi9RS3ZMbGZ5emt3OVRUeUtC?=
 =?utf-8?B?R1ZZVkFZZ1AxeDNlV3dwQ2VEcmNLb25PN3IwRVVQUkEwUTRXamxEZ2laY2Mx?=
 =?utf-8?B?WXJCMmpGajVGSzU4ZDRqLzBhYUVLMFJtZWY3T05zRVB1U0NkZHN2WExQY3FO?=
 =?utf-8?B?QVlQUkZnajZIRzIwdGFOcTBsOVB1ZDhlTzF4L01hcjVaeWM2cUJEc1RrLzh6?=
 =?utf-8?B?bjlPT3NGZWhHcnBFTFc3cXg4cW5RS1lGbFhmZDczQmZ1aXZBR09CbGJicXRo?=
 =?utf-8?B?YWF2YUlOMzJLVDF4SGNpeEVDblNmU2lyN0MvdTlFbDdNTGloc1NhQ0s2ZEd1?=
 =?utf-8?B?YXhtbVl3YUFQUTlUTmhSM1JaM25JSUxMU3lKeFNsYWVZSVI2T2luVEVPcWZM?=
 =?utf-8?Q?Xnzk=3D?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8117db44-32d5-41b0-48e1-08dd05708769
X-MS-Exchange-CrossTenant-AuthSource: AM9PR02MB7625.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 12:25:02.6928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGTyaN9UMGAltUg43JroVozQehZyhxX9iZrMiMIojnL++c5ndiwF6M7R2dMxS7b+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6942
X-Mailman-Approved-At: Sat, 16 Nov 2024 09:51:27 +0000
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

On 11/15/24 09:16, Dmitry Baryshkov wrote:
> On Wed, Nov 13, 2024 at 08:38:11AM +0100, Stefan Ekenberg wrote:
>> AUDIO_UPDATE bit (Bit 5 of MAIN register 0x4A) needs to be set to 1
>> while updating Audio InfoFrame information and then set to 0 when done.
>> Otherwise partially updated Audio InfoFrames could be sent out. Two
>> cases where this rule were not followed are fixed:
>>   - In adv7511_hdmi_hw_params() make sure AUDIO_UPDATE bit is updated
>>     before/after setting ADV7511_REG_AUDIO_INFOFRAME.
>>   - In audio_startup() use the correct register for clearing
>>     AUDIO_UPDATE bit.
>>
>> The problem with corrupted audio infoframes were discovered by letting
>> a HDMI logic analyser check the output of ADV7535.
>>
>> Signed-off-by: Stefan Ekenberg <stefan.ekenberg@axis.com>
> 
> Missing Fixes tag,

Ok, I will add Fixes tag.

> 
>> ---
>>   drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
>> index 61f4a38e7d2bf6905683cbc9e762b28ecc999d05..8f786592143b6c81e5a434768b51508d5e5f3c73 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
>> @@ -153,7 +153,16 @@ static int adv7511_hdmi_hw_params(struct device *dev, void *data,
>>   			   ADV7511_AUDIO_CFG3_LEN_MASK, len);
>>   	regmap_update_bits(adv7511->regmap, ADV7511_REG_I2C_FREQ_ID_CFG,
>>   			   ADV7511_I2C_FREQ_ID_CFG_RATE_MASK, rate << 4);
>> -	regmap_write(adv7511->regmap, 0x73, 0x1);
>> +
>> +	/* send current Audio infoframe values while updating */
>> +	regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
>> +			   BIT(5), BIT(5));
>> +
>> +	regmap_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME(0), 0x1);
>> +
>> +	/* use Audio infoframe updated info */
>> +	regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
>> +			   BIT(5), 0);
>>   
>>   	return 0;
>>   }
>> @@ -184,8 +193,9 @@ static int audio_startup(struct device *dev, void *data)
>>   	regmap_update_bits(adv7511->regmap, ADV7511_REG_GC(0),
>>   				BIT(7) | BIT(6), BIT(7));
>>   	/* use Audio infoframe updated info */
>> -	regmap_update_bits(adv7511->regmap, ADV7511_REG_GC(1),
>> +	regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
>>   				BIT(5), 0);
> 
> Should the REG_GC(1) still be written?

The comment before this line states "use Audio infoframe updated info" 
and, before my change, bit 5 of REG_GC(1) was cleared by the line I 
removed. Bit 5 is positioned within field GC_PP[3:0] and that field 
doesn't control audio infoframe and is read-only. My conclusion 
therefore was that the author if this code actually meant to clear bit 5 
of REG_INFOFRAME_UPDATE from the very beginning. In short, clearing bit 
5 of REG_GC(1) is invalid since it is a read-only field.

> 
>> +
>>   	/* enable SPDIF receiver */
>>   	if (adv7511->audio_source == ADV7511_AUDIO_SOURCE_SPDIF)
>>   		regmap_update_bits(adv7511->regmap, ADV7511_REG_AUDIO_CONFIG,
>>
>> ---
>> base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
>> change-id: 20241108-adv7511-audio-info-frame-54614dd4bf57
>>
>> Best regards,
>> -- 
>> Stefan Ekenberg <stefan.ekenberg@axis.com>
>>
> 

