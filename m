Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CD4A27FBB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 00:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD4710E711;
	Tue,  4 Feb 2025 23:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="P3zclSQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2065.outbound.protection.outlook.com [40.107.105.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C0810E2DB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 10:14:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sk1KlnG33MpIcZ9IwlkN9CWkpg/LNPFGLXhEddqJ4zAN3mdip/lOl3Vmmj7myHf35j68iL8j//02gwwLrknJlYBaiUbK7beUKDSPTH8Es9vyk+5UnATYJacsOTV6YTJ+ifhcf2L5KoHKtby4+Jkkk1kDPJ53bVTt7CstezpXTKYDlp89nKN6kWIwYYzTbIXgLqseKs3IxN8/yeom4hMcZSi2Uk7Co+BzaH0SLWot8pyI+0GuSdHrwt6hfputgwcfL18Q1LNCDY1sPyPWBMGQXhg9RJEHv8lDoSC1BTR/8HyJO3XakhY/Yls8lpoRHdqug5i9/6ZtTDXq7LFAuKejQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dT0IWbztAsndbnZ8T7EkdBMb+tJbzCmLvhxyGg5OGmI=;
 b=WOrHlQ9ZPtgBssaAY5L3ZWr9VoH6eoX9YNnnXC6upOu1Z8chRuUP5plSzy0W3NIh3+sR/NTML+q/cORqydsJ5rnqA9LIPl13n1KoUBWXPxUa3uQ0UFHEP2wceddc8TGM0Anxx7IvI2e/6r+M1hOD9vSBGs80htSMj8c8D8I/Y+NUJknPrFeN4nlgxam7jGhPr2GXUM5sb9BPKybAQV/5LT9w10ioF4Rl7AZRm5h6FBxo4YEUTXVmmNv3gcljsyGUjiduiUuhWV9Q53ZZQWVeQmdy5JxlPlI+v+6t+AuFX+zgLHnFCAY/KCiLnka2Bb1Hpz8UJQ5WXszkqvt67g5Esg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dT0IWbztAsndbnZ8T7EkdBMb+tJbzCmLvhxyGg5OGmI=;
 b=P3zclSQUKnndwQlOXZHNm+yabjRwSKEfSGVoHaBOIawWGuxJVXdQol+RIZZp+SxUOFJbMEDlno9OjUM0EtKGXtGfTrYj+91mFMXI7ln1bvVR6ZbgLRUkOSTD/mi8sW8/UYIen0hPdf1Gw68Ch/r52vAu7qcAftWfO+LScjfVBbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV2PR04MB11215.eurprd04.prod.outlook.com (2603:10a6:150:279::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 10:14:40 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 10:14:40 +0000
Message-ID: <bfe9cb98-12ba-484c-95af-e5842edaab76@cherry.de>
Date: Tue, 4 Feb 2025 11:14:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: rockchip: Add HDMI0 audio output for
 rk3588 SoC
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Niklas Cassel <cassel@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Kever Yang <kever.yang@rock-chips.com>, Johan Jonker <jbx6244@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Algea Cao <algea.cao@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20250203171925.126309-1-detlev.casanova@collabora.com>
 <20250203171925.126309-3-detlev.casanova@collabora.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250203171925.126309-3-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0439.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV2PR04MB11215:EE_
X-MS-Office365-Filtering-Correlation-Id: db48eea5-6b6d-4e1e-7279-08dd4504bc23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEhBMXMrQjRCZzNLVHpCOUg3OVNtSkNNdWxNRTY1Yzh4eUlvR3NUQWZUQS8z?=
 =?utf-8?B?UlRvRk9wdithRCtsZnpZVjJhQ21maDl2UWFJNEh6bDNURHZrWHVxTUpyb0lW?=
 =?utf-8?B?Z1B5SU9GMXo1eHQ2T2tGWDU4Vms0djRvYm8yTVcwdGE0SmVYbVNKelhDMC9G?=
 =?utf-8?B?S3llc0w0M2t0ZTFFc1JvNHhIZUhmZjFRcGFuQ3E0aFp1SW1JSlo2Unczak9x?=
 =?utf-8?B?VVdJV2h5VzNCMlpERHBaNkVzMEJPRUYzWXBJTHB0MFZUZW9mNWhKbFdMWHp5?=
 =?utf-8?B?ZUJMcTZKZzV3RUNzMDlGTzdVejhjMlhTSjk0eGJnVVFTMnRLeWZiYVVaMnA2?=
 =?utf-8?B?OTlMMUlTQ2Z5TGhnem40M1lTOE41STZvT2xKcStWa1lrN1BXQkIxZFZJUFgz?=
 =?utf-8?B?UFErL0tFZ1Nhbm5MSUhtVkFpT0toWjhtYUtpQWNHQzc2bFBWSXdZU0VSeElt?=
 =?utf-8?B?Z0tVaERxbnZ4TDNZZGlQRTRKVzFkdll3S3Q0TzB3NFVYb1htRnc4R0JIUVg4?=
 =?utf-8?B?WjY0ZUZ1cFAwZktOcGxyTk1GeENaZ2IxR09mWHNyYzVHZ3lPV1pSOUNZeGYr?=
 =?utf-8?B?NHlNdkZzMXBTWGtsRXdEdEZtS2EwVXVmUmd5Q0tkUFE2UkdvY2l0NzRuNnFR?=
 =?utf-8?B?djZQa05EbEtxa1VKcVMyRyt3NUFjaWY1aXAzWmFJWVpDVWh2UFN0RjJkbEFT?=
 =?utf-8?B?NHBOL1pNTDhuS2NCc1RDNFFVczJneVFGUjlMNURDTTg2NjdLWnp3dlFKWlph?=
 =?utf-8?B?WC81TDNlSFRZNXpYUHJJc0FIYnF3eDdOQ2M0V3dxTFp4WkZjU2R4a2w3RlNS?=
 =?utf-8?B?b0orSGtYQ3RuL0thaEF1Ym1waVZtZjBVTVJHdDJTc2liMXJqdS9XeDJObWxk?=
 =?utf-8?B?UmhRdjZDajBvc2hnb0phVTlETDlSQlVBeERzZGdSc3lDN1YwZHZTa3NQMjFy?=
 =?utf-8?B?SE9LeHN3bUpweFNZSVRKRzhkaUprUVpYQVpoNElUdGtXTEJuL0J6UmlBWUk2?=
 =?utf-8?B?UGdWeGE2Rklka1p4aXRlTUg4aERubGNmd25vd3pKbkNnbDVnUFh3SlJwWkRT?=
 =?utf-8?B?MkRON3ZwUUl0SHVHeUEyUk91aStFNXl6cWxvWjl5SmVRSmx0ZnBjNkNFbGZF?=
 =?utf-8?B?UDMrUkVpd2xWSXVmNGVpS1EvRGM0dDVtcHFxa3NVOW9GTHN5UkREWUtPZHhL?=
 =?utf-8?B?Z0F6NGg5NzNWYWcrYnZlck5PQW01TlZqUzl1YkRDbVJNL2UrMFU0aEhzTTh6?=
 =?utf-8?B?VFRUU3NNUnNMUEV6MFVsVXI3TkhUYXAxR3N2dmJDSXAyN1NtaFVqc3EvcXBu?=
 =?utf-8?B?RTliMTlBOW96N1A0M2ZYNXkrYmVKMDFrTTVIV1JXdWo3VU1zQXBrQ1BkR3JG?=
 =?utf-8?B?NytLeFdGYWdWaUY1azBibUJZVFVoWDJDVEtpdVVVL3NCQ2NhVCt6NXlYKzZh?=
 =?utf-8?B?a0ZhMEUxUHh2S1VHWEJtRTZGaUJRTm9NY1UxRWp6cnY4bUhBOHlEWnZ5emlH?=
 =?utf-8?B?TENUbEY0STlmN0trbU1sdzBVQUlMMGJ3Q1liK1ZCVjhOWjdkMlVHS0t2bTBr?=
 =?utf-8?B?Vys3K0VDRVBGblQwNkNlWk00K2pDcW0xckQ5VXF2KzhXNkpkSFlqdUdWdnF5?=
 =?utf-8?B?bHE3bjArMFZxN1VvWnZXekhqcVdCSjBKcEkvWG0wdzM2cFBtOXJzcGR1MlVq?=
 =?utf-8?B?QlNqL0FLWThkZHBSZ0hQVkFhY2FIWkd3U3JWWTBOeW5tSEtvRjB5cURMMU1T?=
 =?utf-8?B?TVlLK1RLVUlLNThxU2VPZ1F0WTNneXNXS0pSblJvejBoUHd2OUlpcGtWNU9i?=
 =?utf-8?B?WFhRYmVUU2xGV2YzT3JoamxNbFhNMVNFbFhRSFdtNEpmc0d2OGxqMXkyUTlB?=
 =?utf-8?Q?WxPe79aflijbH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1lTTTVTcCt5MGVGQTMveU1NUnQ3OHN3TzhGRUozRnJDMGZ5eVpOaitrUDQr?=
 =?utf-8?B?b3pkaDE0TDUvejdYMGtGWDBhR3VxK09YQ1lQL2xMVVVQTit1MitFbWRoaThk?=
 =?utf-8?B?WXJ3Sm9mcE13clQ5dnBZZ3JHOTdwdkdjUzAyZndoL1kvOWJsYmpmMTMyNGZU?=
 =?utf-8?B?V3JVbHIrOTJNeVNPd2Vtdis5WHNQcTBiUi8rNnhNMTFLalVtQWVtQVVLZUIr?=
 =?utf-8?B?Q0MySlVWRElrYXJXS3dvM0FQZVRLa2Raa3E2VWlLbUtpc1R5YzZ0VTEva3Q0?=
 =?utf-8?B?eEIxY0FLbWJmcjB0aFFHMHloWURKek5kcUpLS1l6MXJhb2RvMlE1ZW95d1c4?=
 =?utf-8?B?bDNOWXpYamdwSUJMczdlQUZiWDh3ZlFyc2s4NWRkNCtOR1RtQXVWU0FzclR6?=
 =?utf-8?B?ZEdENDdnbCsyN0VSK3BHTXZsQlY3RE1JdGNhZHpuazNsZWQxWnB0MSs2S2My?=
 =?utf-8?B?L04yUTZYRlJ6Q21TZHdoYmgyQno5UVJUQy95RWMrWUFmRjg5dGpHZndSZTNX?=
 =?utf-8?B?ZjNUdmpVOW5PK0E2aWF6VkJSV0tEay91QUFXNUdsVEtQS0xTN0g3UWVXSWVV?=
 =?utf-8?B?NWhHSTJOV0tvSE95UHF4Q01hcklCc2RyUW93TVZ3M0xVME53RnRqTE1UWmEr?=
 =?utf-8?B?QUVJVVJYaDA2U0NJUmkvOEFpNW01RzJRYUxqdTBKQktyMUU1ZmVJVHduWExi?=
 =?utf-8?B?REhWbXB3aGxZbkpWM1VyejVjZFNDOXJ5Nml0a1lwdlpqT0Y3dEs3bTg3ekZm?=
 =?utf-8?B?b1lwOUpwQ2hqbWMyelZzb3FEM1FZY1lKRVU3T2QyZDljVXlkUEJRdXIwQ0ls?=
 =?utf-8?B?Ynl5dVpVMlpubjFVWWRkZjBhcmx5K0hsS3JXNXJuODhzeUxFZ0xRYllMWk93?=
 =?utf-8?B?RFp2STJ5aEtvQWx2eVdYWm1nQmx4SC9JYkFNY2JFbHB0QWczQTl2RXMwQ3R4?=
 =?utf-8?B?VDlGWU9Cb0tZL29QREhtSXUzbHJLdGhXOUZMdE1MVGNGM3ZpRzhDS2VCOG5S?=
 =?utf-8?B?dUt1eXg5RXBDL0U0TmIrSGtLZUJldjVESndKT2RmbHpDdHJQcVJERis2WXh6?=
 =?utf-8?B?Wng4bTlPK0JHWUZNRW12RzhiQ01iSkExVUt2RTZzaE9aWHRtRUEzRHJVZGl5?=
 =?utf-8?B?UlRYM243WjFpbEozejhoR2d2QUlad1luaG5YaDRNNjh5M2ZyTEFsL0Nuc21B?=
 =?utf-8?B?UnFBR1VQd0wrQncxNG11MDkyMWlOdStoT0pQL21Xd3JpTVZUc1krTlYzaFVK?=
 =?utf-8?B?SUk3Y1FPd2o1dUI2NHNCdWRSNW10N2tUVlJtak4xQ3hmbEZDK0hGSDQzZ2NO?=
 =?utf-8?B?ZWQxVjd0UzdmLzNzTkp1Q2F4bXZwSWVLNlp2ZFpDcHQ1Ymo0S3JxeUZUb3Zn?=
 =?utf-8?B?OHFDMWpGcG85dXJMaFMvdUgzZnRtOUQyT2ZmU3RNNDNmdUYrS1N6UWIrV3lz?=
 =?utf-8?B?N3pxS0tzOHB1c05VR0VZWUVRaTNESWhlWEhTM0NPYWhVSTR0Y0RIQytBVmZO?=
 =?utf-8?B?d0lHVUowVjRPbzB1SElvdGpXMnF0SDVUQnh5bU9OUjRzUnYwRE1DNDJVbW9X?=
 =?utf-8?B?TVpOSnpKUXFtZlFFK3hla3YyZE1ON2t2N2ZZZmVUaG9sWHFxS0p2TlNZSldo?=
 =?utf-8?B?VnJwaVpyY0xIQVJTam9vY2xlY3k5TjhQL2xYSnNMUWtXMUpiaTEwNlVSbkF5?=
 =?utf-8?B?K003bStIRTBucVJZUkVUY24xdzRRMFhnMnRKanVidTQwMU9EYU83cFE1S3Zo?=
 =?utf-8?B?UXlVYkhSTUluWURCeTg0MTBCQmk5UTJRYWFYc2l1TGUrNDE5Q1lmbm9paUdK?=
 =?utf-8?B?bm1vVEE1bjdjOGNSb1lWUXFYckcybWhzNmZLWFpSQVExVGlORkRudm9XbHh3?=
 =?utf-8?B?c3RuTTZQWXFja0E5T0ZWVUJ6VWVoa2daeEhiYk5ZNHY0aDA0ZHgzbDFIdGN0?=
 =?utf-8?B?U29ZL1ptbmRoV0RHRXhySHIrYXZpMUlTb002K3hGdEM2Z0ZNenl3WitmZzFK?=
 =?utf-8?B?ODVKWTR1VEoxR3NMbkY5d3QrcEJaYzBlMSs3UVdvallpNUFUZW1DQUphcVRB?=
 =?utf-8?B?ZFRhbk9oT0ZDVnFHRzlFZnRiWGwzSzhwQm02NEh4VTJGb2xrdHZvMzM1YVNz?=
 =?utf-8?B?aE5sTDRLTmtKZFowbE5TeGFSN2pVM2duRWZUTVJRY2p1cWh3dDYyREt0SGZ4?=
 =?utf-8?B?MGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: db48eea5-6b6d-4e1e-7279-08dd4504bc23
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 10:14:40.2174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNOLfZ03tjdkoWab+9l8F/dN8yKAP5rLTj0kmLUOR7y6hF2X9P0S8lRUxHkFmytkQpC9MPpFdwOx4IGde3HSo0crdcWsvpD+Pp8poHAXb0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11215
X-Mailman-Approved-At: Tue, 04 Feb 2025 23:37:37 +0000
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

Hi Detlev,

On 2/3/25 6:16 PM, Detlev Casanova wrote:
> Use the simple-audio-card driver with the hdmi0 QP node as CODEC and
> the i2s5 device as CPU.
> 
> The simple-audio-card,mclk-fs value is set to 128 as it is done in
> the downstream driver.
> 
> The #sound-dai-cells value is set to 0 in the hdmi0 node so that it can be
> used as an audio codec node.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index 8cfa30837ce72..767bdfc06b7ec 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -1369,6 +1369,22 @@ i2s9_8ch: i2s@fddfc000 {
>   		status = "disabled";
>   	};
>   
> +	hdmi0_sound: hdmi0-sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,mclk-fs = <128>;
> +		simple-audio-card,name = "hdmi0";
> +		status = "disabled";
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&hdmi0>;
> +		};
> +
> +		simple-audio-card,cpu {
> +			sound-dai = <&i2s5_8ch>;
> +		};
> +	};
> +

This is an address/bus-less device, so I believe it needs to be put 
among other address/bus-less devices, which for Rockchip SoCs is at the 
top of the DT? c.f. 
https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html

**I** would put it between the firmware and the pmu-a55 nodes.

Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger Haikou

Thanks!
Quentin
