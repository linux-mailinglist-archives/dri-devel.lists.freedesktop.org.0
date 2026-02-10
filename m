Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIW+JUDqimk8OwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 09:20:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6E51182C8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 09:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87FD10E388;
	Tue, 10 Feb 2026 08:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=amlogic.com header.i=@amlogic.com header.b="F2Z7R7Kf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11022095.outbound.protection.outlook.com [40.107.75.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FE810E4BB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 06:06:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLzOrlGR5n/qct4GewrADDVtQOxKFqN07Bko2S0vuqfVglRewObsxktmFdtfJWr3xf5zJnihUsNQzrGe9BSCSNyeX4r2xe0QBqqItilcpJb1wrymLr+7znp7Gutq6Hiny1g/maMVQBFa+6BG9X6wXy7URrd1VYoZp6VeA2qxkfWWw6qXgA6gI8LNzK6EzZXCv3PP8fYpxYCedfYkw7pMaggLz0xkFK4LjYeJ1HoJNJ1DHTDbK8oxdnyhm6ixEUQv8qeLa8az4Xc0dP7hcpuvWP8i17BCdX3ZLz7g8dVQRk5wYQRdPUczAF/P+Muik0FLiFcS8IVsmS5zKYYnVINqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZuilx63nf/QJ0AyvKiKHeLNBT2fh6XWd6qn8nlfPY4=;
 b=UeoYZkctQPCqETiuovQfRC99Jz4uEI79WyL3AODSR+Mw89KrDCX6Fp5bNvRSx4grGT+GculRP3ZTtjzkVW3VE2sTCtvTzuPPgHpvZjYlD+waHFwRc0qJXHroONClVAszscbCztOTBeMileKaKguEEYIrdagVH+wqTiXpIZ6x39DnYqRaoe7i+dgDNOdwRfSMxKRvE+7xjXUKyLHeniDzbyUX1Pt7KRu82CJlSlzMiJbvxHvGqyXBpC6ieo437AvANC2QpO8Q674eub79RROxPBaJLJwxBCS+P9Q2FDFWul8htGq+rEiwDDKKFQF453nEhAt2kCduLuJTyxAQU6f/cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZuilx63nf/QJ0AyvKiKHeLNBT2fh6XWd6qn8nlfPY4=;
 b=F2Z7R7Kftj6gM/XWzmzsbUVJY2bIWhRK1G75b4wW7XQWTBrXQB/E0TrywwP/ZzieTrmtp/kULBky/cF/uWldG7tjeTqXOh2lX0lb2dnfrbE5z5maGZBbd3NZ9+Rz002+/PR9OzexVMYScmYPKINCSeYcKfmRadQtE9XmCbv1JgN4Hcu3vr/ClmO/qxoXyf08MH7AqgdfXRb//skfSd/KvJUVdt5zUQoBnhxYe+4Rz7bX0E5VjGJh0ec32rrYybajpmyxfAx2OoXRey+71RjLeKjMjtUCEhcchP/dzKcpsn4i57jDoWe7/2U6TIQkBZ73+5YtPyFS6GsQFfgBHWfcxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com (2603:1096:400:33e::5)
 by KUXPR03MB9642.apcprd03.prod.outlook.com (2603:1096:d10:5f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 06:06:11 +0000
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::db31:7a14:6203:fb96]) by TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::db31:7a14:6203:fb96%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 06:06:11 +0000
Message-ID: <1a93d6ad-7f09-467c-9b2d-9e706f66adaf@amlogic.com>
Date: Tue, 10 Feb 2026 14:05:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for Amlogic
 S4
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: neil.armstrong@linaro.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <2967a475-9fbe-4d20-a27c-04676c74d03c@linaro.org>
 <c94987c4-dd46-4eb5-a56b-8132c0c9a118@amlogic.com>
 <CAFBinCA374KQiKn=_M5JNfY+Re_uw_40A169G=pU2-MghmUV2g@mail.gmail.com>
From: Ao Xu <ao.xu@amlogic.com>
In-Reply-To: <CAFBinCA374KQiKn=_M5JNfY+Re_uw_40A169G=pU2-MghmUV2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KUZPR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:d10:31::16) To TYZPR03MB7155.apcprd03.prod.outlook.com
 (2603:1096:400:33e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB7155:EE_|KUXPR03MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2f1a51-dc6d-48dc-53f6-08de686a7d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|42112799006|1800799024|14052099004; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWR3TTVETDlCRi9ibEk5WndDbG1oQUhXaXVwZjBoeDBnWUY3TTR3cVFMYzcy?=
 =?utf-8?B?bDYvUnVyR2pEeVJWT01xVkNNU3J5SE15elRRK1RWNmJYNmdMQlJBcVZhQ2Nv?=
 =?utf-8?B?ZndvcXhtaDZ0Y2lneEhzYnBJOUp4d0cvUEl4UmhJU3lja282eG9Fc1VRU2RL?=
 =?utf-8?B?UmVHQ3lUTzU5WGlEa0p5d01KN3VkZVZ4UjlkWldlbkI5aUYzdEl6WmdtVmRB?=
 =?utf-8?B?bnBZTUxuN0NTclFYME5ZbzVSU2lyRW03bll3eUF5NkJpTlgwYXNGeVlubklS?=
 =?utf-8?B?dGtyZVRLbzZIaTVGQ0NCeXQ0UzVnQnNyWlZ2SjVjWnVUaGM2RURCUGh4bHdq?=
 =?utf-8?B?Y1c4WHI4amdHV1BMOVZHZm1BdW1yNFVRaFhTVHFvNHdjNE9kTVdOOVpxRGF3?=
 =?utf-8?B?a3hCRGt6ZXN5MFNmZVFiOW4wSTV4NEdVdnBpZXd0djNzNklESnBMdy9UMGNL?=
 =?utf-8?B?emlCdDR3dytocEIzSHpvRFRGSkU3aDRUNTFWVW9CUlp6b0tETHZCbXZQUktT?=
 =?utf-8?B?b3dxNTBkbW5NTm9XNlZ4RUhBd20yWlp3T29FRjFmQWRVRXlONVoyYVdRUjk1?=
 =?utf-8?B?WVJKUlRaWDZ1d1hNYUVKMEpBZ2NFTlpnT1lMOEhEaEpBejFQWGljaWVKZzAv?=
 =?utf-8?B?TnNrRGdtb3pKMHpUeUFlVSthZGFWYXZqZUIydWphLzh6c3VjdXdnQjdSMnVn?=
 =?utf-8?B?QzRUeSsrdlp0YzNRRGNGZWN3U2xhY0hJNUVCSzNlMUZRSWtSK0tnSmREbFhJ?=
 =?utf-8?B?Tjl6RWllVWFHZGJkcFc3dWFTR1Q0Vk9PbTJIQzZ5STBSRGxReVZJU3R1MG4y?=
 =?utf-8?B?QXFPN2ZSejltRkxxM2ZwemJqNnRlZlR4NHUra0poMXVuNzFjV2tPQ2FzWUJE?=
 =?utf-8?B?eDEyZkJZckRQSWs3NXdyYVppZ2dsMGpiVEsxZGMvc3NqbEJSNXJENXVkeUQ5?=
 =?utf-8?B?Z01rZ2cvTW5XazY4YUd3L3BHZmdNWWtlU1lJV1o1N1dWcC92Z3hQWURheUgz?=
 =?utf-8?B?UVhTRlk0WFF2VFlqelcyOCtqYi9Ed2g1Wm15UHl1YnExb2pEWDVKQS9wY055?=
 =?utf-8?B?a3I0UHRrVWF3T1RlM3N2QlhpdWhEMnF4V3pNd0tIVE44ak5ZN3F0TW5vS0Qr?=
 =?utf-8?B?U3B0b3p4MHA3OEI3dGZwVVNpejR5dVRORnJTbEx1QjJaWEtCVlBNaDl1eUdR?=
 =?utf-8?B?QUE3KzgwYWEwd21GTlFkL3pQdXJpMTBkSldqWkZSV0o2bmw0bzdWNE5NU3E1?=
 =?utf-8?B?TlkyRkZVTTBaVHNtSElPMzEyaCsvSWNwNmlEamhydC9iN05MOVlLb1N1WmdO?=
 =?utf-8?B?TEZVcXhndDlqWC9MYlkxR3ZKUHZBVGROM2lyUUV5UGNPNDhCSTJXSERYcnM0?=
 =?utf-8?B?RWtTUkxqR20wUlhUY05jc3M4MDVMcVVBaDBYYjJtNEhPaWlka0lBeW4zbHpl?=
 =?utf-8?B?eWpCTk92aHFTNGVGc29SQW5RYVlWazhoa3hQZzFMaTRjK2RzZC95RHJGdmJx?=
 =?utf-8?B?SElmTEM5YXR4WnRNeEExUzdRdVFwRHEzV2JWYUZTWDhHaGJucXZtaDdSVWZ2?=
 =?utf-8?B?OUMzYUZ2Ti9RUFk3K212aFRRVU9NenhDNlozK25Ydzh3MXVQTUtaZExyZWk5?=
 =?utf-8?B?MG9idytsRkEzRTdNRkFGaGxvdWZKU1dkRlorTGQvOWxqN2lUSnNIVHdYRUNi?=
 =?utf-8?B?YjRzVnhvRzZ3eDV4bHpSRGlsWXhNY3d1NnRMazJKQXAwcW8zanh4b1U4QWor?=
 =?utf-8?B?RVczTTIvNmhibXQwbjkyV3ZlSzVscU9hOFhQd1lJckpoWkcrV1hXMWRYRTRS?=
 =?utf-8?B?TWtPelcxcUhjTncyUit4MFNSS2ZqMGtMcU0rYVQvbllCRzVCemRmWGtUTGhH?=
 =?utf-8?B?R0FoemYzT0xacTUrdy9sdmVVQTdlOGtVdk8zTnV5QlB2MzAzeUtNQ0Y4ZkVB?=
 =?utf-8?B?RFN0VUNOUEN5TklwQmdCZXZobkl0MjV6VHZYdjVQekZQUGxnYXZvS2poQWE1?=
 =?utf-8?B?UWVyL2NPUlUwK0k5dDR1bkptK2tEZmN1WEVJOUVSemNnK2hBaEZpb2YyZUYr?=
 =?utf-8?B?TkxVNTZvOE9xUXZXTEtmZWt1MGVpd2JpSkM5Y2wzVkI2Q3p4QTV3aVkzWDFx?=
 =?utf-8?Q?6Z0g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB7155.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(42112799006)(1800799024)(14052099004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2lFcEYyUStNczVqNDFDcXMwc1RpMVRXV2tJUW5VQldyeklEYTlRUFZvZjZ2?=
 =?utf-8?B?Vnk5VWxtOE1PMTBCKzNMeEljSmhaejh5T2JUL0RTaUJOWGZyU0ovaWc3Y2I4?=
 =?utf-8?B?QXNweDhWclcyTXR6Mjk0L04zN3RsYjdvTE5GRHpQVHhOblJTMEljNTVHbFZx?=
 =?utf-8?B?RitiTkZjcXYzcktCdVltRzd2UGk3MHR1a3VFVWRDZHMzU2IwcTNMdWpMZ3E2?=
 =?utf-8?B?KzhoSGQ3U2dCQjhYcHdNSEdyY0pqZHl6OW5PZ1hYank0Q0ZEQ1RvVU0zR2Rm?=
 =?utf-8?B?Tll1cHV1bnZlQ0ZIKzBZQkNlSDhEMlpkdkl5T2ZUanA3ekwzV01FUm5KYTk3?=
 =?utf-8?B?Z2VURHlpTzR0dzQ4SFVYb0FCeTNrN2dSZC9pVTNLK1NUdDlxUHJVUEZXNCtN?=
 =?utf-8?B?dVUrdFRETmRyaXExRDBieWJVbDg0dzNiMW9DOUg4bDBaTWhOdTBrd3RzWkha?=
 =?utf-8?B?WGg0WEdKZHVka2x1US8ydlBHUHRTc0VrNHRacXgraXNHdnczanN1T0dCcHRr?=
 =?utf-8?B?d3lDWktQV1AwQXp1K2c0WlJuWGxtQlZlOEk4Q0piQXNYOHk1b2JQVTBFb1lL?=
 =?utf-8?B?WW1KRUtZQ2V5VjJaQ0RQWHFQMUpXWDlyM0xMZ0RNN2d3NmNJVDBzZFJGUEpp?=
 =?utf-8?B?U0tWUlEreHY2RWxqdE02TmVCdTlYMDR1NHFzYUZZRitReEJOQlpVcEIwbFVQ?=
 =?utf-8?B?U2lQcUtxdE5xeFpXVFNtd25HTWRiMVFhSjVnNzFNRHV5d2paQU5XZ3M5S0k3?=
 =?utf-8?B?MHhISnQrTnhRaFprRzVXSWN3cjRUUjRLR0J3c3B1SjRHRERmaWtzUFFzMGJa?=
 =?utf-8?B?UXRLazUrWm5ENlh0ZDBHM21TdzRMSEV4MVMyZWhTanpGVDZwdE92bVh3T2VI?=
 =?utf-8?B?SGFYcXBqOHlGejFKRXNoMjBsaVZjUS9maU5tK3owNk1EazYvV1hOYVZSNDk0?=
 =?utf-8?B?aE1hcDgwVnY2dkFMYXorSEMweDRoK25ZSFhRamx0elVmeEoyMGtQTTYzcEZS?=
 =?utf-8?B?a3hXZE92eUwxb05vRkp3Ky91ODV5MDBmTmxINnlrTkNJU1M4ZktxVnZKdzQ3?=
 =?utf-8?B?MUM1VDhCM3c5YVpIRUQyWjkyYit1d1d3RFcxRnBQSmRnWnF5SkNJTmZZOVVy?=
 =?utf-8?B?YzlXakYyemRXcHhTaTJrdDQ4SDl1anpYUlhIWUdseTRSS3Rtcmc5WWtyRHl6?=
 =?utf-8?B?dWRJUzBjTXdLV1libHFsdGducGY5dElMUlVJWFVkMDNUbEtGZkVzSCtTUFlx?=
 =?utf-8?B?Tk9YMllwVnJvUHBWZ1poYmR5SWRWVllMNkpiaWJNZHRIVU84UVdVdmtzVzlW?=
 =?utf-8?B?eGdNYWJ3STJpMTV1blc0VmZMWTZ5T1FNZm1wdEtNVE91TUx5QkxueXYwenpL?=
 =?utf-8?B?dmU2cnFwMi9kd3p2c1hvc2xIcTd6THJQKy9TVUtSZ1JycUhaQjVQdWpJZVRC?=
 =?utf-8?B?WWUrTEIzV2RTZ0xjVm8vQUdrNmVNYTRCME92R2ttWVlNMzJiUjlsL2ZsYjdV?=
 =?utf-8?B?R3owanRWaDNlS3BCbEFzNnEvOFZwc0VPWjhybU9oQUx4NnVWNDEyVnVNNlNW?=
 =?utf-8?B?RkQxMG55ZVRKVmFvcUp1SjhrT2xRV0g1clBtL1RJWWU5WUhRRUh2SVJYTlRo?=
 =?utf-8?B?RnVYOFVpREwvWW8rNlgweWozL2o1NzNOWEZTSU0xT0tQSURCUTdYbXMrUDI5?=
 =?utf-8?B?Y3N1Y2M2TkVKaWpSaFJYeVlxcEQ4SU5OZjlDUmV6RUhFaWtrN1FGbCswdHF5?=
 =?utf-8?B?R2x5Y2dnb0pETzd5OVVYclBHVUgxTS9hSlhwV1o2ZGYzcnYzRi9US0J6Z3li?=
 =?utf-8?B?NDQ2Slk5TUd1Y29GYzFaN1hpZWlRcGQ1Z3RDQ1duVHR4RFdtbUJ4WWphaDl4?=
 =?utf-8?B?c2N3bE91THc3N3Mxb1pyRmRiZlFhNk14cmZmQWEzdGJSUE9uVjhFSWJpdHpj?=
 =?utf-8?B?TTlBZUQxT0hjL3A5YmdJRzNNVG1IdlI5Y3JRR1BBTnJoTHFGNEhsL3lwczBV?=
 =?utf-8?B?SCtjUE1kSkdiZ1lWSXZNa2tqZ1M0c25MYmlKemhyYytwWDhzc2dHOHJ0SGps?=
 =?utf-8?B?WjE1Yzl6aHRnTVZWOHp5TFpUN0RjL1EvMG5MYU00NHlySUl1OWRDNzZkeTVq?=
 =?utf-8?B?QytKNThucU5GUURSbVgzVjZRYVVzWFY3VmgvLzdZMm9VZ2tTa1JTYXJSZlp0?=
 =?utf-8?B?RGpMK3BNV1NJY01KMjVvYnBtOCthR2xzRFVpQWxjbHp6VTZKWjhlakc3ZXpT?=
 =?utf-8?B?bWZWeGNSQ0hEczJlS3lpRTBRbVpFdXppSXJZMk5uSFVMZEJ1VFdiS3JueXZt?=
 =?utf-8?B?d05pVHJyQWd3NnkrbmZFeTU4S1VRejAxSkN6RmtTMk8yb1BCN0E4QT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2f1a51-dc6d-48dc-53f6-08de686a7d55
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7155.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 06:06:11.4778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlMbdgE6rizzO3MTkp3/HVRHdmdLWv4rb3/YkCXjudd89t/tHEkbRjV05JXk20PHRueNkpfGvnJgpcjtx5rtuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR03MB9642
X-Mailman-Approved-At: Tue, 10 Feb 2026 08:20:08 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[googlemail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:martin.blumenstingl@googlemail.com,m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:linux-amlogic@lists.infradead.org,m:martinblumenstingl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ao.xu@amlogic.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ao.xu@amlogic.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DKIM_TRACE(0.00)[amlogic.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,khadas.com:url,amlogic.com:mid,amlogic.com:dkim,amlogic.com:email]
X-Rspamd-Queue-Id: 2B6E51182C8
X-Rspamd-Action: no action


在 2026/2/10 5:26, Martin Blumenstingl 写道:
> [ EXTERNAL EMAIL ]
>
> Hi Ao Xu,
>
> On Thu, Feb 5, 2026 at 12:56 PM Ao Xu <ao.xu@amlogic.com> wrote:
>> Hi neil, martin, jerome
>>
>> This email proposes a refactoring of the Meson DRM driver to adopt a
>> component-based pipeline management model, inspired by the ARM Komeda DRM
>> driver.
> First of all: thanks for working on a plan on how to move things forward!

Hi，martin

     thanks for your comments.

>
>> The current Meson DRM implementation tightly couples drm_plane and
>> drm_crtc logic with specific hardware blocks (OSD MIF, AFBC, scaler,
>> blend, postblend), which makes it increasingly difficult to scale to
>> newer SoCs.
> I have to admit that I'm new to this part of the DRM driver /
> subsystem - so I will probably ask some novice questions.
>
>> The attached /vpu-block/ file describes the proposed VPU block pipeline.
>>
>> This implement introduces a generic pipeline framework where:
>>
>> - Hardware blocks (MIF, AFBC, SCALER, BLEND, POSTBLEND) are modeled as
>>     independent components with well-defined capabilities.
>>
>> - drm_plane and drm_crtc are responsible only for building and validating
>>     a pipeline, not for directly programming hardware registers.
>> - Per-block atomic state is separated from SoC-specific register layouts,
>>     similar to Komeda's component_state and pipeline_state model.
> I have two questions here:
> - How is per-SoC register access managed?
> - How are "common" (shared across multiple - or even all SoCs)
> registers managed?
>
> It seems that the komeda driver uses komeda_dev_funcs for the
> per-variant access.
> However, it's not clear how this scales as only two mostly identical
> display controllers (D32 and D71) ever made it into the driver.

I would like to first describe the current state.

    In atomic_update and atomic_disable, register values are derived
    from the property information and stored into the priv->viu and
    priv->afbc structures.
    In meson_crtc_irq, the previously saved values are then written into
    the hardware registers.

In future SoCs, we may encounter the following scenarios:

  * The register addresses of a given block may change. For example, on
    S905X2, the OSD1 scaler registers are located at 0x1dc0–0x1dcd,
    while on A311D2, the same OSD1 scaler registers move to 0x5a00–0x5a0d.
  * A block's functionality may be reduced or extended, which can
    include changes to existing register bits or the introduction of new
    control registers. For instance, the OSD MIF block previously
    required canvas configuration, while on T7C the canvas mechanism is
    completely removed.
  * An entire block may be removed or newly added. For example, GFCD,
    which internally integrates AFBC and AFRC hardware modules, is
    present on A9.

Register programming is performed through RDMA hardware.When RDMA is 
available, the flow is different.

    In atomic_update and atomic_disable, register values are written
    directly into the RDMA register table, and there is no need to cache
    the register values in software.
    Once all register writes are prepared, rdma_config is used to let
    the hardware flush the RDMA register table into the real registers
    on the next VSync.

On a given SoC, each internal block contains fields that determine which 
register set it should use.
This information is SoC-specific and must be provided by the SoC description

>
>> This is achieved by introducing four core objects, as shown in the
>> attached class-diagram document.
>>
>> - meson_vpu_block
>> - meson_vpu_block_state
>> - meson_pipeline
>> - meson_pipeline_state
>>
>>
>> The atomic flow is structured as shown in the attached commit-flow document.
> The public A311D datasheet page 304 [0] shows that CVBS, HDMITX and
> MIPI_DSI are part of the VPU block.
> Those aren't mentioned in your flows. Is that because they are "after"
> POSTBLEND and would therefore be part of a future refactoring
> approach?
This proposal focuses only on VPU OSD and video-related blocks.
Encoder and connector handling is a separate and much larger topic.
I am currently investigating how to reuse existing PHY and clock tree 
interfaces for that part, but it is intentionally kept out of this 
proposal.
>
> Also RMDA is shown in the same diagram as part of VPU. Neil had to
> work hard to implement it back then for AFBC.
> You haven't listed it in your diagrams but I assume it is going to be
> part of the implementation as it is/was mandatory for AFBC.
> Can you confirm my understanding here (or clear up my confusion)?
Yes, we will add RDMA function support firstly.
>
>> The intention of this proposal is not to change hardware behavior, but to
>> gradually restructure the driver to improve maintainability, scalability,
>> and correctness of atomic state handling across different Meson SoCs.
>>
>> This is an initial proposal intended to gather feedback on the overall
>> architecture before converting existing code paths incrementally.
> Making incremental changes sounds great! The meson DRM driver is too
> big to "just" copy it and make modifications (or even modifying it
> directly with one huge patch).
>
>
> Best regards,
> Martin
>
>
> [0] https://dl.khadas.com/products/vim3/datasheet/a311d-datasheet.pdf
