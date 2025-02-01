Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A721EA24B5C
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 19:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078C110E2AA;
	Sat,  1 Feb 2025 18:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="m21r2QGQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazolkn19011026.outbound.protection.outlook.com [52.103.64.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A140310E235;
 Sat,  1 Feb 2025 16:36:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6li4MSznI57vUuxoC+5SMay8HBeuJGiJhoRJXZ7grAakVv/ze+//ziOfII3vzhblMpANFLvINRlEseA+3n+v5zWfywrqji439BWpCLPp30JRu31xeLgJ2j+CxL5tCsvfiHR+ts4UgMyI2Q2ekiqQlQp6TBoaQeqeeWr5G1YcqYuWw41QBsa7kYGEJRlgPc7dWrCZcenWGB3LY2bnGlKo8dRSOaN8V0oLzyakAeWGZl/RDFYnqK6UyyPLyQOM8iE6VxEQAqB3MW63w2iQjTZ9JCzUhT0PwxkxIxanGJvn6AxJ/HI2muu6X5ev5myFFI0uEEl0b+qV5S2ikmyFL45Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqB5khuB1/StrvgMm9/+qXKto6BzBpCmB+85S6XZbOc=;
 b=gMpCzElXse31HElfw8BINQsW5Gg2GU2Ev7J8tTYY/WboNIFWtqfl5KFc+yCaArhL48X4mzZDUEyT1UCM3Q1Ojngh/thSLR7FEAnpQtuYLk9kAwoI6kTzqOWksPEkNDJHykAf4LoBQf7UbljXgMfJcJRepvywUNE7iGJr8LpeIt9VUwqNOYbF7XkQIW+asiDK55nW99y4i3Wow7MSrxKnT5seZGD1XcEcYWXw0XjtkFzbefY5bDgm8d/VBGEzHqEJcXm+ebk3Sj0nhntOXskYNDkywVfhAw4VZFdwVv8AHME74NJ0Idde2JoHmlcPXOqoGjQbTDaeCWxGKuUm5DbKIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqB5khuB1/StrvgMm9/+qXKto6BzBpCmB+85S6XZbOc=;
 b=m21r2QGQDJnlzehdmOoAGRqIbBxHU2pCNfX05bkpYbR7rZ6cdF6xTFUwXGlVVnTXYcZWemfv3nulXsy+yrkh0ZKxlJUfodO60lJxUdrkbu/tQ0B/1dFtQr9ayC47naBX8McSsCVR4HrP88rN7kSxaQ4UWLbWHBNGHbNzQAR+VjraRuPRgixfWjCLEkKSq9623IcTIQkTuyDdZyTz3OE31ePiLu3onO8ytqaFpuF1iCKNCH0A8QnmtTQ2goMaPE9D/3BtMI+bs1fU/tlTXAr15iHepWlkq620DFjdZW99OTkGwR0Ry0OW7K25wYNYIrSkje972GLL1aUtUn0LSQuBLw==
Received: from JH0PR06MB7180.apcprd06.prod.outlook.com (2603:1096:990:98::11)
 by SI2PR06MB5092.apcprd06.prod.outlook.com (2603:1096:4:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.11; Sat, 1 Feb
 2025 16:36:50 +0000
Received: from JH0PR06MB7180.apcprd06.prod.outlook.com
 ([fe80::aee2:8a4:1168:95ad]) by JH0PR06MB7180.apcprd06.prod.outlook.com
 ([fe80::aee2:8a4:1168:95ad%6]) with mapi id 15.20.8422.005; Sat, 1 Feb 2025
 16:36:50 +0000
From: poscat <poscat0x04@outlook.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: poscat <poscat0x04@outlook.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] amdgpu: fix edp brightness control on some HP laptops
Date: Sun,  2 Feb 2025 00:36:34 +0800
Message-ID: <JH0PR06MB71802D5284E7D0D8E057F72F8AEB2@JH0PR06MB7180.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::15)
 To JH0PR06MB7180.apcprd06.prod.outlook.com
 (2603:1096:990:98::11)
X-Microsoft-Original-Message-ID: <20250201163634.1745907-1-poscat0x04@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR06MB7180:EE_|SI2PR06MB5092:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c2c3252-df7f-453c-9ab2-08dd42dea01e
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199028|15080799006|5072599009|8060799006|5062599005|7092599003|19110799003|1602099012|4302099013|10035399004|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pIaXb8FDLNjl9oOhoHz9j7gFolkvjsoqLyN+VTrrPbctONG6MTYB2us5E4Ct?=
 =?us-ascii?Q?ejJyE94eEUdF47nGKfBjzRCcDFpcMhP93GLr8smFcjpbvzpXp/eVwbRBbMgk?=
 =?us-ascii?Q?wdUYN6j2dOA52ZIhylVrqN83OsfAEac7Iulm3gFqbgXTzonHk7wK7c/5H+Pf?=
 =?us-ascii?Q?F/HMl77wygzPSdgRn0O1X60fox2KOqCgRxde6kMpZJ8gf9fmp9cTVTNMnOEf?=
 =?us-ascii?Q?lxRoz67yNrpaVNzj5cjO58aRqoUkP4sXmYnSfhdGy+y5OBMJBeCs+U9fdT3G?=
 =?us-ascii?Q?zF1vvP7e6n1IQitks6rhzQFN6J3FXoVmZQjZF8XEJ91EeVFo7pEmoYuPc+8Q?=
 =?us-ascii?Q?0S0/4eeFfdbsMNTvPHAx1oKhZ+yUYi38aWree4JLTw/7h/oARHTb4yWmNfkA?=
 =?us-ascii?Q?nsHMX02ufoj6J+kSB6wp8kW8vXhZFIpNKPEhTPAHXbMN7mP5Dxbd4qOf4asf?=
 =?us-ascii?Q?hnFuAvuWdCnUY10NTNCYZe2nTfZ7ksx5UvaQ3MihOAqNuPNeuGJKNe61WyKe?=
 =?us-ascii?Q?tCDlsCVDX2uikzdpc1li4YJq2oEi199jafQlje1egioZ5030Xpw3imTBNOho?=
 =?us-ascii?Q?LCeSOCZq6o/Jf9BBCyS2WxIgeon7Bsew0ql0Igjk6jjnHcHtM9uoTOh3dK9L?=
 =?us-ascii?Q?oPWJzy5//oax6U4KbaIxfoylzeN6LiYuon7NaHS9RY1/kzWYMT3+4UAuZOSL?=
 =?us-ascii?Q?9MJy90Pzic2v+MtRqnZKnnwNd4WP/bVmifsFw74emn3bt68iH4n3Q0Vg7/Da?=
 =?us-ascii?Q?dLUd1DKfm4Ru/+Pr+IV5buAxAbJlk+jIE6EIuWV2tLX5yy7t/tIr/Y3hm6gw?=
 =?us-ascii?Q?hWlnPay9iKkRo4LhkYC9iTOq2DAcHe14HpjmpiMmaxe5WKidcRt5lWjIn7hg?=
 =?us-ascii?Q?oVuZ4DF+KE515av+ITowsH3D81DhyR82ulaHIm9zE+li1QzzzNdcmx64TMRJ?=
 =?us-ascii?Q?vJi3iZtw8wKT4Ohj7F0ycD3mNPjXlJWqcB4SsYAfUkdzR8/U+eCHZXjaxrLe?=
 =?us-ascii?Q?e4zjD5aBMHvW0WNp1RPGd8hEEeQGLyPosX4mxj1a0yG29Q8vdf7zV35PagUL?=
 =?us-ascii?Q?Rso/WGXUYDvMu2qf67VBVPjd0kU9venLhwhoZrkYyI0sOKYre4g1tJ9gnefJ?=
 =?us-ascii?Q?XOdUzoLHdErFKGM5RZ/VF9EaM1nc/0GKtlt5+mqBmjsSumEHPgyRZ/M2QFeI?=
 =?us-ascii?Q?PlGE4ptAj1X+2klm0UQoz/2njHW/FNKzegc3ebaYknHhXfoFs9peJYwBsBF4?=
 =?us-ascii?Q?3B8+X3e8T53cwHYMFeIp?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xT/zvOmwiAv3XRmWqBYT2aE7TrBZdnBD9fA6jM9ZpvT8Mpsmd5aE2eZXRR7o?=
 =?us-ascii?Q?dWdrogKxYvwPJX/7Eijy8g809lX5pkUEVVUfNUwZ2jSJQZ/Co1VInN3TCHRi?=
 =?us-ascii?Q?fe2eTI3EznSdN/oGLge1S78boFFUEXifRmagj10rL3ymt++GOMBeB7p9B9aO?=
 =?us-ascii?Q?Io03dbz0uZG8NjWmH5PhqvFgx5H/eZSCQNliCDHIMvNzG4nhNrVNbVq5+EVm?=
 =?us-ascii?Q?LBzpSXgs/zBVWyQgIL2s28S1fivqcX6jRQngqR8L+Yrpx4zVSGgnkI7oU2tM?=
 =?us-ascii?Q?yl1nITJ2w1oeIzU9S4k7CaI2bHfdfopb0xV3A8d1i33cAZn7Zy5ZlJJ0Z8HZ?=
 =?us-ascii?Q?pu4xmhTutnTlCTYBnWytoPGaD9i2iUItTWPWlSQuzyYMoAPZbGpTjgZJyYXb?=
 =?us-ascii?Q?Rs0wbuiFWBHK6uRHIx0OC1FwXGdle2jzgs5O7y3rSKqxxxcOTILkNlOJjoIY?=
 =?us-ascii?Q?rRY9nCHG+NaK5pYYIN40bd6EGXLqZPbqdDXiILmTm3HtKrOoUi3qptSdcuec?=
 =?us-ascii?Q?cIhu/euqKwzC7w33vmBa8XnZYYaDE50/+IDM6TqBO4nSl9iFhr3JjIv4Zw5B?=
 =?us-ascii?Q?qmURjzqq5+B8kKYKT8pRP2lt2NkoKXqxDsWVPN3PLGs/SWp3ZOW+oAwIC1Oo?=
 =?us-ascii?Q?3teAF/Sm7CScJYKjQKaHTIYS980mc0DgFVtSNMcLHz9LX6t57dTncWMF45E9?=
 =?us-ascii?Q?9E1RictmtHfMFxpq51gbIdSALK/RQxvjPObS4LHYYhoIsR7yOhoDrXnWFO7X?=
 =?us-ascii?Q?HEi84ZIM2J3yNmF0N/8JPS0onpZ1jowmUyK8StJGYRiKeMpqJguQA8cW9PMW?=
 =?us-ascii?Q?fTZA2LDGagiDkpZkFSEvWSZR4YgPeC/zI/zHJmtzvzHyy+3sCtO66SYx1xOm?=
 =?us-ascii?Q?ZvuUVUCX/+lSdEAiu6NToXZZZ5n+btyQXQ9abaliTHC7V2DC6YK22rU/XmxL?=
 =?us-ascii?Q?Kg7VJ7c+psrbMalzZrrLqNrR3rYRD18+Md3E/YWpwjNvpZDE+kLURcArhrOm?=
 =?us-ascii?Q?mr1PUiTiwIs4q+YYWcmQhpuJ49qm76rhIJj4TxBY8NJd/R54OD1ixA7MvWaI?=
 =?us-ascii?Q?Qjcko1nZfE1qG/KSDr3u3eH+XwNKzNBNuBYGq54Ono8UexiFL75mPqtKhnSR?=
 =?us-ascii?Q?tiHTaBpndvoMNhObRkeL/J5Wa0nK9HKVCPpgaVV/1cTk5ovvlfk8F93lC9qg?=
 =?us-ascii?Q?f2DBCyuHsEBT4VFPa9RCI+wH7qsX26jsohKzDO++oR8L67TZoylGH1YvgAOH?=
 =?us-ascii?Q?3Ig6s6yFB2llnjdbhfboXTfV49L10YHp15eS2hsdKyAIYZnjqRSzsszrn7+a?=
 =?us-ascii?Q?5YM0pM1KbMAi/MWjU8MmN5z9?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2c3252-df7f-453c-9ab2-08dd42dea01e
X-MS-Exchange-CrossTenant-AuthSource: JH0PR06MB7180.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 16:36:49.5658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5092
X-Mailman-Approved-At: Sat, 01 Feb 2025 18:02:57 +0000
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

This is a workaround to this issue:
https://gitlab.freedesktop.org/drm/amd/-/issues/3701

Signed-off-by: poscat <poscat0x04@outlook.com>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
index f9961a6446f3..a82fe9f8193f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
@@ -173,7 +173,7 @@ void dcn31_panel_cntl_construct(
 	dcn31_panel_cntl->base.ctx = init_data->ctx;
 	dcn31_panel_cntl->base.inst = init_data->inst;
 
-	if (dcn31_panel_cntl->base.ctx->dc->config.support_edp0_on_dp1) {
+	if (true) {
 		//If supported, power sequencer mapping shall follow the DIG instance
 		uint8_t pwrseq_inst = 0xF;
 
-- 
2.48.1

