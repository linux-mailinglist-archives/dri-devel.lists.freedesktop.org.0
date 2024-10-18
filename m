Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA619A363C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 08:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332EA10E8A5;
	Fri, 18 Oct 2024 06:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FCBIKO6N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012052.outbound.protection.outlook.com [52.101.66.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949DB10E8A5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 06:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhNOoFO1cDRzs7We8cYgS+U6mPYc53yXoKMYiNQ6H4VSgKnWVb4RkFNeKI7A0t7Y3gWKSEB1MZETWlebEtH9j8haOO4b9qPDj9LZc38lQH/1lc3Dx+cKo04seWh7nVs0r8CmKnhuSf0hs+li81jqBnIUrJ/jzBDNXawmMQp19BGNcwDCzILk5AVcmHnH9IWg7aXGCukWpIXuyVWW3Mxt6/DOTeBHugz0dsN0go9jpkP6vne4pnsqry9KL1gG9UJ6cNnrQXEuEgLYgwbOasJw6L62x+1CG4p40JUzV+w+S+VB/rcowxr7zqsYEuxjvYO7UwOHmmHxduxwEhuG5zvvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45oLJ7adZGbIde6EXmFOudq8v1HN+zKzDRayoLpvkd0=;
 b=aYTX21I4tdLBhvjNMx5BhdkOjUgP4dsGX8fv/i44Rid5gpQgexe0fp8Y3WAfnI0ChFB5bUtXak7V/krLwV9Rq1XGudLERaaX6PwhAFxx0lXLp1jjJYrNflO3y3kryOAkUtmJ6LllQZnEmze/HgO57uE7hEmO74E2Rqmx+22A0yXSJJNEmut21E/UcFanWNaFgupxS5M87qyOlLi6yiRKpFzA/2pB9ifxqEcoXfFSgJ/UmalqoA2f3qIx2TiS5+56YjXpgqY7eaDYW0cQc/O/XZ7knnwRovAaoHBDn8BIQvEnpbFhrNMZywDud+9Odo0M9ewc5ICqmxdxKJIyPOehWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45oLJ7adZGbIde6EXmFOudq8v1HN+zKzDRayoLpvkd0=;
 b=FCBIKO6NQq6sE9jXgf619I3PdPyOz/iaUcohJ2q31v2uq8QTwRWRu67eIMPt4Uswc2JiQx/0WiiUZg8/cMVsI+XuhyNMHbFRS3TIn2ELHeUooTXuNVzMURgqekQ95+sU0hDlhwtqD/XqRp81yhMWtxZhkUTFqGHaZ/EtWGwRGLQOLi1JXdTMDjCbOdMWWvj0OxxF8laT8LAUWY915fdJyZXSeE0NZwj0rQEiZaWeZkYLMxNIUv/C8aCehVC/z4fvI6JOlqnjpvF4J8kqx5FbljOWjrOUc0b698ob/tnZdSOQJ3H6tTzf3wSQlRZFYVxfQlmZq283arq6NmCjnGkgjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8679.eurprd04.prod.outlook.com (2603:10a6:10:2de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Fri, 18 Oct
 2024 06:58:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 06:58:23 +0000
Message-ID: <77a40d03-6c31-4db2-ae5e-c5fc33a7142c@nxp.com>
Date: Fri, 18 Oct 2024 14:58:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
 "y.moog@phytec.de" <y.moog@phytec.de>, "marex@denx.de" <marex@denx.de>,
 "isaac.scott@ideasonboard.com" <isaac.scott@ideasonboard.com>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-7-victor.liu@nxp.com>
 <cr24b75meaq25dcs35rffzmyrfu44sajy7r6jilyvavsbs6guw@ncr7rvu2yyft>
 <78fb51c5-4568-4f91-a25f-e4ea4bfbd7ee@nxp.com>
 <TY3PR01MB1134604CE56ACC47DA0464E89867B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <3je6mbti3v3qmm5yieb753yjeu6iynjmwg277wzspltj7jkwct@rnxxbdeikfrd>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <3je6mbti3v3qmm5yieb753yjeu6iynjmwg277wzspltj7jkwct@rnxxbdeikfrd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0029.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::16)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: 989a66c4-ad82-4faf-03a1-08dcef42419a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmFPRU1uL3B2eVE1R0g1cEIyQXo0RXFUelR0WHRRU2FYdmY2b1M3NVppWlpx?=
 =?utf-8?B?MVFTYlZnNjdQRGoza0hTejlKN2lBSTAxUjUrM2VDVFE4a2xPOVM4bnVzaEJL?=
 =?utf-8?B?TEFaRTJQVDF6cGhIeXhwVHBDZ2U4TGRMaGFCelIrcmExYjZ1cWVzWjZiYm8r?=
 =?utf-8?B?OVJJNU5zNlU3T1VIQlM0MWYvZEVQVnB3Tmw0YVhoTE0rTk02NVd6RzRQMWtw?=
 =?utf-8?B?TzNjK0N4ZkNJWS9sMUMvWnVBL2pWd2lGc0tiSEE3aFVKRUtzTDhyUUdzSE1P?=
 =?utf-8?B?cXlnSGRQdlozaHk1TTFIRG9KTDdwVHAvQzk3R2NSYnQxeUFtSUVpRXQxOFlB?=
 =?utf-8?B?T2tyRW1UUExVdmtHVm83NVB0UkpWT1RLajZZUGVoQ2pMOU9CVDNHQ3FFckc0?=
 =?utf-8?B?aXB2dUs1WEhnRm95Rk1RVXBDeDUxL0ZkazF3eG9zV3ZwcUJ1Uk1CVlhqd3VM?=
 =?utf-8?B?eHd1UjlhamNNLytLUCtZT09nRjFISG9XcndBdUM2UG5mZmZMUnRXNTArWkZ3?=
 =?utf-8?B?djA4aEpqTU1yVlpudXhwK3d2UzAycmhuY2VNNE1GRk5SSGdzaXRMUnU4YmZP?=
 =?utf-8?B?QjJ2ZGJOaUNMbmJqTGNkU3h6bTRTUGJ5ZVh1LysySFBPVWZlelBoakVMd3Jk?=
 =?utf-8?B?T29nL3BPdmJnd25vdEhLd3ZFWkkzR2g1ZFhmUlVEU0JNbTF1Ny9nT3BUR1FZ?=
 =?utf-8?B?Qi84SEdpa2Nuc28xbjJYc2ZRUFVpWENLc2V0S1E3NjA2YVBnSzFBRGR3ZW9H?=
 =?utf-8?B?bXBteGY5empSdDN2TXNmU0RQVG1ZRVV2eUNMcG1BSGlDYkppT2YyN3dwU1lj?=
 =?utf-8?B?OGlFTTJUZzIybElCT3c1ZTJXQzl6OFQ2Vms0Z1hFOVpOOXNDWTNsT0RYb0dP?=
 =?utf-8?B?UnBXTVRRQ21XbVU5b1RaeWpyVHNndXBoVFhmKzRadE1uWTA5d0dnRWlCa0J4?=
 =?utf-8?B?WldzSk82SHZ1TGV6dDdzTW1XTzU4MVZDV3ZQdlJTcTBYRWVjVVltY1J5K3BT?=
 =?utf-8?B?WGwzREQ1NHQ0QW96MEYvVFUwdmNabHlWUXN4Mmkxc01TVjlycGp3cTZ4K1RB?=
 =?utf-8?B?bVBIeSsyL3JDaVluWGRJeVhOZ1RnZEc1OGc1MTBXWVJSanRkWlA2Nkx3eTNV?=
 =?utf-8?B?MmxqSFpkN2lxTXZMRGhGVkdtRmxNVHIvUVZJWHRkRlVNbW0wV1U5NWh5U0FQ?=
 =?utf-8?B?UU1YS0lMUzBJVG85VXVFb0lGMjlqclpQb0pvekRpMHEvekFnUUJ2eGptRmFT?=
 =?utf-8?B?K2F3N2ZHYVVldENzZzBpWWJZdHE2K2RWQ1BKcjBvbk5SOEFObUp4TGlkaGJ5?=
 =?utf-8?B?blVZczdSMDV4ZUJmRE1GOHlOMlF5ZFZFaU02V29uSE9XN0QydldhTHVHTEZN?=
 =?utf-8?B?N2hPbnlCV0RxZXljUkxXeUs2bEdMaVowU09DU0RFZjNuYjMzSUUvWm84MHFQ?=
 =?utf-8?B?SmlnL3pNdVU1ZDFHT0prRFk1VWQyVTA2VE0vYkNFYmwraHpEV1Jxb1JxR05y?=
 =?utf-8?B?TUZVRHpxYkxvRE5YbXMzWDk3ZG12S0Y0ZG5vNzJWd1A4NVhLM25TSzJNc1lS?=
 =?utf-8?B?MEFnV2ZLQXpGaHBCYUdoalFiMU1mMEFUZUdYQ3FjK01KZ1JKc1BLSFcyMlpj?=
 =?utf-8?B?TmhPeU9GZllORm9YaDlCbktaN2JpRmJUWSs3ZTY2K3NvTUl5dnpsUU1URitj?=
 =?utf-8?Q?7/cymSiIJWAadXKLc9UZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXlybDhpd3Y4Wlg1Q1lpdXZ4WU1kUE9aaDJSWUtjZjN3V2YrMDVTMmg5RGJT?=
 =?utf-8?B?RTNrNlo4cldaQ25URHNabGMrNjBSaTZ5OWdLa0k0VDlsbEcyOFRWT0hwRXl5?=
 =?utf-8?B?clc4L29QOVRnYWw2dmQvTklSdk45bHBpRnhJci9UNlRTNG1VZWE5QmdyU2xL?=
 =?utf-8?B?TjViMDNCRFhWOHRrVVQ4OEtSZndCQ2FCczZSc2I2Q0lXVUJwNGVlK05CMVdM?=
 =?utf-8?B?d0VGcVBEL1RjTVB1dkZkTnEySGtUVlk4cmFIOEFsenRpUzJjUFZKQkVsSGs4?=
 =?utf-8?B?NjVaekdOSUNPY0VIVy93aTZLcUF6b0pncFBvQk9PYzFpSTF1MG4yZUVWaWxl?=
 =?utf-8?B?bTJiMUdoRm5xYmMyVk9CUWZMZmp2dEpJblpZRHJLcXU5SmpjeHk5bEZ4dndI?=
 =?utf-8?B?QjI3bjRCN1hIb3I1c1k3Zkdpd21FTGxXSmd6Rktickk5MVE3V0Z6azJBYis5?=
 =?utf-8?B?MEZLSzFpRWNKcmw2Q0VIcTM3VGFhaUlmQVJXWEk0VHVVeFlhZHBpcjhhTzRh?=
 =?utf-8?B?S2ZjdHV1cDd6LzJ2d0tSd3NsZll5SGpkelZlUzNma1lnWFZCU0xzQk9nd21i?=
 =?utf-8?B?eURhRTkxWXllbVlSVk5UTjVOSnRrNGI1ZVVuejhrcUpDbWZlRVMyNU5CcCtr?=
 =?utf-8?B?WUhMd1lBOUtlN2dvM05mWHltVXYrN01NZkhwdWVMQlpaN0M4dUxwVjlTdi83?=
 =?utf-8?B?VlVpVFF6TmZmOWxqYmV6QW1kVmc0QzV1UUtMZTFMTXRkSE10UmxqQTVkdDlX?=
 =?utf-8?B?SnRvMXN6TzIzZjRQVG9ya0orRHMwQXFjWGJqeFY2M2lmN2R0eGJzTmdpM2N6?=
 =?utf-8?B?QnNFV0Vva29oRnJWTE9hYzVhN285MDAyWDlRaThvMTh6WnpsV3o2WWZzdE9L?=
 =?utf-8?B?U2JCcVd3Um9DKzRsZ1BIOUdKb0p3ZHNYWi9Wa0g4ZS9nS1lYendTalR5RHNI?=
 =?utf-8?B?cStTQ2NXUDdMcTdaT2ZQZjBqN0tvMjd5Qy9hY0dFSjc4SE9LODRnbUdyRkR4?=
 =?utf-8?B?YlVUQWZpcUxJZnh0K0xkRERsWWYyTVVLT0JOZHE4eWxwYzlHdTZTSGZLdHJa?=
 =?utf-8?B?OXNQQjhJZlBUNnY4dFM2bFE5azcwT2JlUUlkTzBYWG5DVDhFK3VTak1uejN5?=
 =?utf-8?B?WEtRL2FkNlBxNU5FZWdGR05Sc09FU0o3dlZ5TUlMUnBhdVR6Y0c0VVY1N1Qr?=
 =?utf-8?B?TEV0bTI3b3VPU1VLOUp6eG9DMjRSTXpoQWtHZGw4TjdFUXNVY2dMU3ByaFFl?=
 =?utf-8?B?dlQ1bFNVZEtzY3ZSK0hJNk10UXpOL1g0ci9MakZwcTRkYWtuZm9ZaHlkOUVa?=
 =?utf-8?B?bExCemFwZDVvd0lad0I2R3VyTWVWZk1HSk9lTGxqZUVDN1VQeVBlZU1pSWM4?=
 =?utf-8?B?ZlQwd3ZqRHRQaXY2NTdZVitWZVNsbFdnUVRhZ0RGdFdCaldNbHVFK1grRVVw?=
 =?utf-8?B?eW1OM1RvME5Wa09JVkljMEVMM2E5MnBpMHg4SFhxVDN3eDNic1h4eVNOM3Uy?=
 =?utf-8?B?azROdVJnWVJzSnMwbyt0YldsQXlrSVd1Q1dBKzkwUVRuZGxiR3RIdThIME5L?=
 =?utf-8?B?ZWdLSUJ3dmk5VXBtekJkMVdRYml4bGx5b3hBZk5oNEM1SFBtek1QbEdEaWNu?=
 =?utf-8?B?ckVmTys2V1QzMVJLK2VOL3hJUW1rdWpza0E4bGVWTEdObUthSThpaFVhanhT?=
 =?utf-8?B?bXB1d1BQWGRwa3lad09DMGlhemQ5Zk1TYTNDTFNtQXRuMjFjbUM5VVVNcVc2?=
 =?utf-8?B?ekJYQ0laczhianBvRW5kNzBwczlKc1k3TzhpMjU3dFlKU3R2VHB6d2NSUFJN?=
 =?utf-8?B?bDdVQ1E5eFQ0S3UzOXpoZ3NORTNaWWszaFN6WjZCaXVPOW9Md0pVU3hKQktq?=
 =?utf-8?B?UFVveVRyWjBOOVJOWStyS004VTRVYTJJaUM0dVpkMXd2dGR6N0JqQTZlWWhl?=
 =?utf-8?B?aDYyUlp4ZXI2K2xxZVhHMXFMK3lvQlpHZ3hCa0Q3R21NUlM3U0FsZ2pNejZI?=
 =?utf-8?B?ay9zK2N6RVpBNkJPZ0U4RUNIck8wc0IrUi9sNUtYcDNVUXFxY3lJUndDQlhB?=
 =?utf-8?B?dGxOWHJQOVAzN0ZGNXIyYjgxYVVxNUl5Sms4anVCZERSNXBDN1FrZ29oQ3Jz?=
 =?utf-8?Q?4tOgXy9dp6fL0p4nPNehyaPGP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989a66c4-ad82-4faf-03a1-08dcef42419a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 06:58:22.9362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3VnsnGd7VJEzOj5B/OVpy6zNBVuQKQYxJnDjtdIPq2rfPEBYCLy3tfbPek9c9Ai7Mv18+jlXxS5gDp740pb8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8679
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

On 10/14/2024, Dmitry Baryshkov wrote:
> On Sun, Oct 13, 2024 at 10:48:54AM +0000, Biju Das wrote:

[...]

>>>>> +static int it6263_bridge_attach(struct drm_bridge *bridge,
>>>>> +				enum drm_bridge_attach_flags flags) {
>>>>> +	struct it6263 *it = bridge_to_it6263(bridge);
>>>>> +	int ret;
>>>>> +
>>>>> +	ret = drm_bridge_attach(bridge->encoder, it->next_bridge, bridge,
>>>>> +				flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>>> +	if (ret < 0)
>>>>> +		return ret;
>>>>> +
>>>>> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>>>>> +		return 0;
>>>>> +
>>>>> +	it->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
>>>>> +			       DRM_CONNECTOR_POLL_DISCONNECT;
>>>>> +
>>>>
>>>> Please strongly consider dropping this and using drm_bridge_connector
>>>> in the host driver.
>>>
>>> I can't afford to make i.MX8MP imx-lcdif KMS use drm_bridge_connector currently.  Maybe the Renesas
>>> RZ/G3E SMARC EVK Biju tested v1 patch set with is also not using drm_bridge_connector.  I hope we can
>>> leave it as-is for now.
>>
>> Renesas platform use the drm_bridge_connector_init() helper to create a drm_connector for
>> each output, instead of relying on the bridge drivers doing so. It attach
>> the bridges with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to instruct
>> them not to create a connector.
>>
>> On Renesas platform, it exit from here
>> if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>> 	return 0;
>>
>> Maybe it is good to have both cases to start with. Add support for both cases now,
>> Later when imx-lcdif KMS start using drm_bridge_connector,
>> we can start dropping bridge devices to create connector??
> 
> Do we have a timeline for this?

I sent out a patch series to make i.MX LCDIF driver use
drm_bridge_connector just now.
https://patchwork.freedesktop.org/series/140148/

-- 
Regards,
Liu Ying

