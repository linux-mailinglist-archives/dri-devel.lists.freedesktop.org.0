Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D541C8AFBAA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 00:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3B710E833;
	Tue, 23 Apr 2024 22:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="OiShPOtK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AUS01-SY4-obe.outbound.protection.outlook.com
 (mail-sy4aus01olkn2143.outbound.protection.outlook.com [40.92.62.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD8811351D;
 Tue, 23 Apr 2024 18:00:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J50pC2FWS675cy5dLo2ot/n0VurY8047ozhPng2Jv3sAcF+aCpjg+qfc65+0f7MtG8o33X1IbUHu/oNTXQAhmCSiVprShrx//EG0c1Kz9eGrjD1Oh7nC97d7HizojTjeuPyLJf/hWAttIhdtvIMP+08HRgpPgU/1JQoKdusSJM4NHeEwz7UyLpPNqqhsXST0fF97Fa6WVjNNk3KsdUnZ1oAQhQbSTrmbI1vTAKmL+FSdLklxXCJRhfHQYn+hjjDHSBLszAAATBjp+FwXSMMDO8D2lFH4WGum/iexoo6ohg7FN159F+ZP+yhTvuB+NGM8C39Y2DqubcINMLasIGYJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faduL2iMx/0YzC3unOxhh7uvKQOReainYuSFlIFmDr4=;
 b=PTJR3iJV1Te0pXpnwfBoJ0X7Undw6lyPdTSebTaY+0+QEIckS4CW91+K8TIdmT0YGSn02IbDsI5/HfSif6Nj5kbNBeatwbVwhmi2Ot3y/H2bC1cDfgTr7bRMMqX4qmjLnGUrPcGTx2pBQwhs8Nbc4lNpe9zQ+tO5xiJdF00en+wH6H5vCB1Blm4xN7Dcja5fQDQtqLk00vm8+gUafVaBk/nFdzsGlFBE0CNuLQrLu9qhtO0Bq/MYX6nYZWJpzRVOgAUW/o42t8ufqjzVASEk87b09WVV8jG4K563QtCHzd1K+FGqLS/QqKfrVg1tQQbY8tExqZ4Zvx7D4ZUSOSagVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faduL2iMx/0YzC3unOxhh7uvKQOReainYuSFlIFmDr4=;
 b=OiShPOtKs5EaMdOm7/LdJSDjw6fpikVnqZdZpwqRtkBI024wt4QU+kLHKyekgirrGorszpo88YksxffbfWEdJq9rTA1OfOiTApm3gTMJO6ggmL2ynIA8tgrXLlBrEXbGSx+NIc5A+KbcPDXPLcJCuN13SYnvwTY1Kp7r2D4EfuWtmBxRAOfvi1CXmPAJv2mZ2vQBV60QpWoUi7F747GF5J0XXJuAHw/HGuQMahMwDnningghI+G/oJT3pzpZJC+I+cntHDZeo4r3VXhGlQZmNldOB0Pa/DGj+85lDcbLxVf5HrWqnOXNNliSZtHloJWfIaBK1nbC0lValg339iZxmg==
Received: from SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:88::12) by
 SYYP282MB0974.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:73::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.22; Tue, 23 Apr 2024 18:00:49 +0000
Received: from SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM
 ([fe80::eec7:3528:ae72:1ccc]) by SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM
 ([fe80::eec7:3528:ae72:1ccc%5]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 18:00:49 +0000
From: Moody Liu <mooodyhunter@outlook.com>
To: angelo@kernel-space.org
Cc: dakr@redhat.com, dri-devel@lists.freedesktop.org, kherbst@redhat.com,
 lyude@redhat.com, nouveau@lists.freedesktop.org
Subject: Re: Add working backlight for "ada lovelace" missing case.
Date: Tue, 23 Apr 2024 19:00:21 +0100
Message-ID: <SYCP282MB0461C8165AF5AB2A4A119123D3112@SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412194901.1596-1-angelo@kernel-space.org>
References: <20240412194901.1596-1-angelo@kernel-space.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [BqmqiGXxwnGrIYTlCYaX5HuJPbY7OFhs]
X-ClientProxiedBy: PA7P264CA0071.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2de::15) To SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:88::12)
X-Microsoft-Original-Message-ID: <20240423180022.6242-1-mooodyhunter@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYCP282MB0461:EE_|SYYP282MB0974:EE_
X-MS-Office365-Filtering-Correlation-Id: ad46edbb-29da-478d-f09c-08dc63bf4e30
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199019|440099019|3412199016;
X-Microsoft-Antispam-Message-Info: 3hyTwz424J4fbcbOyoY2OXbKyZDUTkoQZMaqRF3J4zcRPXr3SQXqeXxrb+0nBjXzUeg5KFHpP3PVtrfcvPbvzjMIfnDlMZRhdtwl0wQRHDtie4QNqIf20PDscylwE+PcKlJdma5guuOSqHcRmReYOJmAyP7hQrwAGs5uo6tjNhl/sncyQ8SKtOTrBnKwdwiq1t07zCUcsRiFLj094UvlOD/kyZGA+2GVCspKoyw8Y2oY3ACfId3iDM1jTmhbNnLGJQ9LMQgXAiX/ZZwhFJwDlQCXfdGO1CfcKPQblmECDuA6FK0pVzT0TZFZBQxTl1YFtLNlNbVQoak01dI0pPaC0EbYu6wR+bVb1G8OEDPlRUyeXp+4glfeeELiZmqeJEJOUFAaUEGCasHJGSd1z5I3xdjh3wIo7TQi7LKr1OEIxOcEqqcCR1ZncKobduBmOy3l3LppFlQNj8wZtqzJIGNEQ+eaNG3pcc0dnHMbmFjjg7a6L9L3zbzcvDYOaFBS8k7tFgr3vqrdCltpabIniA5Ytu2CQEOLCt4U2oTSVdARscuMqaTlX5TOhK5if9TnHRFN
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG4ya1VEK1Q5Ry9mOVY4c2lwZnJnaE1UTVVXUlJjeDI1V2NPOGZlMi9VUHcz?=
 =?utf-8?B?eHlHSzNSRnl0cXRNUFhqL25Qd2tUNGV5ajhzWWl4TS9ZSnRYTlgwcDQ1Nkpn?=
 =?utf-8?B?VE1XdjdIamkwL1ZzU3RpV1NrUEJNY3lGUjhXaHFsdUNDYzU5dU5KZHUwS2o3?=
 =?utf-8?B?b3dTOGRNYlhFa1Zwd3c5MDc4V3pTVUllNTBQdmd4VEd5d1poRlNUNHVocjhN?=
 =?utf-8?B?NTlDS1hGN3hJanRyQjdrOEtxVnZKSThPcURGVGlkdnl2OWNseHRjdFpGZkJR?=
 =?utf-8?B?TStlT1U4Nk1kZDNEeXV1RjNsN0ZFM1ZKbDNFQkdLWFgzclZURGw3Y0NiQ2pn?=
 =?utf-8?B?ZSs1WXFCamVZUzRCTDVnVkU1bGl2WUQ4ZU9ZcTFDM0dueHBrWllydm0rUGlF?=
 =?utf-8?B?OFRYTnFHdlRrUDJ0SXN5YTd1Ym9qbmxXS0dIK2hsMjNQTlFER3J0T0lmcmZm?=
 =?utf-8?B?cjlOR3d5YXZwV1czOVQvbU5kdk1zUkxRT0Y1TDVva253eXhtbUlKdWtvOXZY?=
 =?utf-8?B?VzBzRExRMFBScnU4UnlGN1JUNVBtNW9UQ0pRQXFGNUJZanNSaEg0RDJLYlRC?=
 =?utf-8?B?VlpJZlNJZGZGZmo1UXBoRkdmOXRUTjZsNHlSbHVRZk53KzJud3JVZm5jQ1lB?=
 =?utf-8?B?NXhUL3RWMFh1VC83cnlqMkFBU0Fjc1hwR1pOU3Q0T0lRRTExK3Q0bXh2alVz?=
 =?utf-8?B?anVHSk5kamZHYklKalpweUVUUUNHSHRlYUY3NDZUMXpBcytndUNnOURORlBn?=
 =?utf-8?B?TU93L1BPM2NMZEE2ckhSY2VpWDNpWEVKU09tUzRDMW4rbWQ5R3lZYXRUSEJC?=
 =?utf-8?B?Nkc1REt3Vk55eXZTQ3hzMXoxQUlrMXZwaVFValR2bnk0MUpicWtudEtoWG9H?=
 =?utf-8?B?MXZJSkRyc1h2cGVRN1RKd1lKWjdmdjVhNmFzdE4xcXFhT1Z6SGlPV0tLQTNv?=
 =?utf-8?B?MFFmYWZYbHAyaCtTaXV4UlVaT3JUS1Z5V2k3cmVRRkYwUUVNR0ZJMmwvWWRn?=
 =?utf-8?B?QmRQSkc3OWFjVndPTTJRcWJ0MzUyM3hlK0NHU1ljaTJXSTFOSDhFVTZIRTho?=
 =?utf-8?B?eFp3ZTNJdURvd1Z1LzNWSjN0bFBvKzdsUFdjQk9kOFJTa0Vwb054Q1ZWWlAv?=
 =?utf-8?B?cGNWbDN2TFkwZFFpNEEzcEJsd0VZYjUrSVQ3MCttR0NyWDgxN3JWVTk3WHlK?=
 =?utf-8?B?bko4ekswYnZObmRndVhSMVFXSXg1dU1qcFRCQk5jSUl3end3eWcxYlVRemYr?=
 =?utf-8?B?SG1CMStRSE56cUR1dWpXVmRUZVdTbmtwZnJhRnQzRjA5eWNiem5uU1hyK1dI?=
 =?utf-8?B?MHp1Z3l0SmJ5aEdaWEdBdTdGRjhTanpWMHJxeXkwKy9LMysvaG9YS3pURFlO?=
 =?utf-8?B?bTM4dkl6c3NES1FkZkhtYkE5REJ1MStEL0tUa2w2WXZ1VjBuMGkwbFlZeC9p?=
 =?utf-8?B?L3F4ZGV2eHF1T3IzemxGalBDMWZORUxCRllNVGUyMitSaDgwMHZvR3dGRnAv?=
 =?utf-8?B?TGY5aTJYUkRPZWJ6MElSS0tmZ0dEMEI2MnRPSFYwdTJZVVRscEtGdVVPZ1Zh?=
 =?utf-8?B?aHNzaVZvMGtDQ05ZcDZES3dDZTdOWnRkcGxoZVlXcktoSm9TNzdyaElvM1Nm?=
 =?utf-8?Q?N1FuKwGjHCxlCGmm3hmWrdCYUNLON6qlM9it48hr8qFc=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad46edbb-29da-478d-f09c-08dc63bf4e30
X-MS-Exchange-CrossTenant-AuthSource: SYCP282MB0461.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 18:00:48.9268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYYP282MB0974
X-Mailman-Approved-At: Tue, 23 Apr 2024 22:22:29 +0000
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



Hello,

I would confirm that this patch works for my machine:

  01:00.0 VGA compatible controller: NVIDIA Corporation AD107M [GeForce RTX 4050 Max-Q / Mobile] (rev a1)
  01:00.1 Audio device: NVIDIA Corporation Device 22be (rev a1)

  System Information
    Manufacturer: LENOVO
    Product Name: 82WK
    Version: Legion Y9000P IRX8
    SKU Number: LENOVO_MT_82WK_BU_idea_FM_Legion Y9000P IRX8
    Family: Legion Y9000P IRX8

  Graphics Platform: Wayland
  Processors: 32 × 13th Gen Intel® Core™ i9-13900HX
  Memory: 62.6 GiB of RAM
  Graphics Processor: NV197
  Manufacturer: LENOVO
  Product Name: 82WK
  System Version: Legion Y9000P IRX8


Moody Liu
