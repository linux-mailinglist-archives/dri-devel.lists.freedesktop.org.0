Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C907700B2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 15:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE1C10E6F0;
	Fri,  4 Aug 2023 13:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5461E10E0B9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 13:02:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+pMCnDOMlSpxUWpo7XLurpNBQOqhb+MvrkAFVkTbEGgiAbFRxXP4zvdV3BAODW0R2FK0s2kRyIUe+M3sgjfMY3D2+7Gq6uZFxINov50lahQTSBGV3QnTmHf9zf4RUw00ce2GyMFWl9g/fcjR1n5hxmsO6SlCklzLbafVLphrpeKS6j1zB2e08wM01fBs4s5RyxIWn8qrub9xWSiVtgwVsk0pSzFN6yyoOeNi+3GQ2V10UVw9EeLK7X1dtS9scglec6fLC9bBSmtYz6uVrqWGsO0YcaqUdDks5czIePWntNgwM3ZcPdj5ljBSFvVzdpIawsFx+shjco416n3I/S+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cfs25SoIA1lJLPzEDczISElbO2Pb9TFTNrbuhT3hvww=;
 b=mug5SN1Gg6tmb1VxorWBjnXb07K2itNc7U3+gVZ6WADY9il2V22crrCMpUJdSEG9xEoXWlrXZmx1BRO282YFf5Ek3jNDZAodZku6uYmHHMmGWQwGl3gs+lEefFi2Af2856hwpTfiOLSpc5fE3Smb82jRYacB+qBIBHhd/g/L4kQlJMykTwpen8zlgbNm/HYsWwwmwemeQ8GyxY8T/NB8KPvukkTVmo/Qesj0gvx/1iQiDvyfriEvUs5082Q5FH14jMGK0F6Db7hLYRVF85Bi3TH+dBIfOo8nXDKntlcnFBZUTaEe6j0GEwP+xq29VO0atjk+SHzQNMPIaT76nQnCfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cfs25SoIA1lJLPzEDczISElbO2Pb9TFTNrbuhT3hvww=;
 b=0onFNfc0iyVUREu7E/TxeRvmySb5fiGX33I8TYhqM4H2IcK8VP3m+KXlzl4K3vBDprpFOXoXB2YndegXE1fN0MzTW29pQd0s9GiY8vs+lKLdIXhSN+lSy1ZzlivAtPT8e/ZV9KN5p1E0TawrtmiUmjwwrpAZ71KrrjeyW4hfI7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PAVPR08MB9353.eurprd08.prod.outlook.com (2603:10a6:102:302::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 13:02:42 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 13:02:42 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Fri, 04 Aug 2023 15:02:33 +0200
Subject: [PATCH v2 2/4] dt-bindings: display: st7789v: add jasonic
 jt240mhqs-hwt-ek-e3 display
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-feature-lcd-panel-v2-2-2485ca07b49d@wolfvision.net>
References: <20230718-feature-lcd-panel-v2-0-2485ca07b49d@wolfvision.net>
In-Reply-To: <20230718-feature-lcd-panel-v2-0-2485ca07b49d@wolfvision.net>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691154158; l=864;
 i=michael.riesch@wolfvision.net; s=20230425; h=from:subject:message-id;
 bh=t4jI8y96vLpvw9DbvyWsZGH/BKAA5Hwc8wpncPgHrp0=;
 b=Uh0QeNsbFI7szIGvFWry0f7r/UO5FlOuVy8Jf5c4NbnbTJB4Z/lMr++a8gXqk8nAE+2IpGFpg
 hMmd82uECniDUj0+qVWIxANd/PTk7DvqiVY42vATlVplWWcbXBw6twD
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=1QQdXA2QbwdxaQn/VQK0hz04C8IBYhDowbK0hlNU4Ng=
X-ClientProxiedBy: VI1P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::36) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PAVPR08MB9353:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e6ecb5-32db-411a-e13f-08db94eb1676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YfC2f/aWDd+tVvkYOCmhnL/awVtpqt6gMcVO4NXRfbnVmRFBtVLe23PavufZompjxIJUaRpxnJdQqhs0ky8D8x0dOvZTCP/+9yNdkfWnZFVIRVWihDdPPITYUfCLROeBv7juUjtsWiI0wU1E2ygGtk3qQkcGD1Sy1XNi9PGnYnFsUzg/V7yN5f37oO2qTYsi4uAxXrRsoLsFtZP6Pg6Xbtco0RvTyJElTfwFmeW2joIPqMX5aVrUW6HpRbO+ez7JVU1QTIhatQRbKImGgXMdyE2gvm1AKr9+w0g+r/woq0maZUD7Wc/RIPiEPQ0qORyGbEO+0esISFA4nzAjseYXbHvhz99ZBcgOcnBLn9aFglxiE8kSo3KlzDENzSjNfH/ri15yvsFMJKAXjCwvB71F+jS198OSfRiEATUg6ZzOx1I3GMHNDNXPKK3hAr3eWsYtbEMxlHbxQ5edjqbBEzEH20C+LqhugDx/PiEQNrBNGUYPcKY276fOBeFFIKvVeXDwfDlpijaWft3J3q35pukuUu0riX/y+e7wG52fF2ho0IEMsizqXWD+fX0YIOXQI3LoyXA3c3yNf3k+wo7yHTxShDbl8towbdTeKXvhHK8PMBQMEYwiV2bT4OOBa/KEiSkS7NIe7yKDnGfpFCto2M9cOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(1800799003)(186006)(451199021)(2616005)(107886003)(8676002)(26005)(6506007)(4326008)(2906002)(66476007)(316002)(4744005)(6636002)(66946007)(5660300002)(66556008)(44832011)(7416002)(8936002)(41300700001)(6666004)(6486002)(6512007)(52116002)(110136005)(478600001)(54906003)(921005)(38350700002)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU5KRWl2cHBtL21sMmhJNUxGdVpld1dDbDB5UUJiZytMdEZBU3BMbG5UY1dM?=
 =?utf-8?B?dnFMTVN4dGt2T0ZFOEhBdXM0Z1p6a3psZ0gycHl4RGZqMDVQdkVHazdXc0tN?=
 =?utf-8?B?ZHQvUjdJRlhNMU9BcHhiNlYxOWdSbzdaM091eEw1NEpva3JKM0VkOFBYVnBN?=
 =?utf-8?B?ZitUQXdpUVFXQU1OOUZ5d0NwOU5ZNXBiZEtKUFZ4QmNCeldSMFhPL3BMN1Vz?=
 =?utf-8?B?Ui9IWUE1T3VxZWlwNUwrbUIzbnpEUVR6Y0ZhdkUvVmZRbmgxRUN3aUplYU9w?=
 =?utf-8?B?RmpsMUVmL3RBR0hTRHBRVStiK2dpZ2lyMUdyZ2Vwd2dUU2hxdEtpNnBNQ1Yv?=
 =?utf-8?B?TEZoRThDcGlZNTljckx1bitTdjRnVENCejZCWFVydldBbEVVS09SVTZWdTZ3?=
 =?utf-8?B?SnI2YzdWYWtkZnBVVXVpQ0YrSkxDUTVvb281UlpKVnVPSHVjaGhvNXdvVUtK?=
 =?utf-8?B?dTNDS2pvZkJUNHpiZEZLeWd1bHBWR2JNc01ManF6bWZ4OFhMT2tpdUxEUzF4?=
 =?utf-8?B?TThUZlRwNEw2eGJXaFoweDYwRVpzYVpQOFdqWWh5MjZCUEZTTXJuMFQvc3pZ?=
 =?utf-8?B?eWtNaHJ4dERmV0tvaDJPTmRDMHlLZnh3dEN5MjBybjh2NkZTSmFoa3ovT3cw?=
 =?utf-8?B?YksrdnhrT013bmd0dXNKK3dzRityOXpqTzUySHRORzFDWU83dlFNRzFzUG1F?=
 =?utf-8?B?ZkxCcnY5U0JZcVJ4TFRMSFV2cFpKSVVjMVVwTjlrcTJBNmxUY3p3eW5Nc2pp?=
 =?utf-8?B?VmpqREFJSU5Wa2djM2R0N2ZWWlA4WEhyTGdoUE9tdEdmYnZIM3B2N0s1U0VD?=
 =?utf-8?B?VkJuS2g3dmQxeWRnUkNGaUwyQVJPRnJiOE9FNFpmR1dDRjRPcFN5K253S01L?=
 =?utf-8?B?U2FRTDhwNXBndlpCWC9RNUtteFdLVmdRU25EOG9zekR4Rjd1VjNpbHRnVFFk?=
 =?utf-8?B?dEw3T1EyeHpZaDk1STE0ZWxxc3VSc2JWQ25uNUxMWWtxbE04dys1dmNlc1hL?=
 =?utf-8?B?dVZ5aGxTMWJZc1JHVGlsem55aUlSeWQ5K2Evbnpab1FSVDVPZmVSc1oraG8r?=
 =?utf-8?B?ekk1UDVFSllYQnI1SFJoNU1YWmNMUHBpblBlcTV1QVRYRFQ3Z0tsdHlEQUxm?=
 =?utf-8?B?UjRhazlWbTNsOUtaQ0p3VEk4eFVtck5vVFJjNFVpZHAzcDNBbEVyb1hzMlQ2?=
 =?utf-8?B?SVdzTlNxQTlqbzFEYWE0RVkxbmU3M3pjakNEWEtMZUJYa1BxNDhZVkV6VW1u?=
 =?utf-8?B?eUVnUDdCVVFjZ3NEbXQvalQ5T3M2NEJRVkN0NnhoejN0c1hYaDFJSDNHRTJa?=
 =?utf-8?B?RXRXWCtETGMweGdaWWh5WDZJaHBzdHZwSUhpbEphQUJoRDVQSU9OVnBtQnNy?=
 =?utf-8?B?RGRIUmdWWFU3bTEwV3JVQ1dGR2hTMHBSUndSNXJpVlMyS3MrT3lMc1lHQ0Rt?=
 =?utf-8?B?Z2NNV0hPMW52aEFPTmNHemQ4ckFxZ1VvMTZJYWRkdHRSRnZzZGY0c0JudHdV?=
 =?utf-8?B?ZTZnMUdwZmUrYU96SmpGMDNlSU1Gb3FmNC9HNXE3c3pjanJkaXlhS0dEdlZL?=
 =?utf-8?B?TmpESWVVS1ZZVHZhU29PK0JReC9YV3FMZC8rVHNieXc3aC9mZGNlSUdpeXk1?=
 =?utf-8?B?UWJIcmlpc3JzR0c5bFlwSEdLR255dXJpWGJJMEZiRnFJZWhJcmZDdzJsaDE0?=
 =?utf-8?B?TlVvZWkwUVJEVmlPVFNIdmxZdTJzOWlCVUNjWVQrNmZ4NjB2RVBrVDhvZ1M0?=
 =?utf-8?B?QUJsT2RvWjRuV1h1eE1MZGtjT0sxNUQya21tUnNnNzY3K2FHMC9hdGtqa1lY?=
 =?utf-8?B?Z1pXM3U5QVRQRm4zaWx5WUM4Q1FUU2pVTVhSTk9jQ0tIYjJwYkFzVW1zK244?=
 =?utf-8?B?TFhrRUFMT0E4V1JCNUFoSzAyTE10SXRsWSswUEN5YTZYdXBoVkhtc25zb3Qv?=
 =?utf-8?B?S293MXRUWERJUWVlQUN4aURQMllnbG55dk9zMUJqTzdhQ3pJSmVlL244RTF0?=
 =?utf-8?B?RG11NE1pM3I4cXJLc29LazZ1QVF1MGVLNW9HNmtUOU9jN2F5d3dGNVZBckVw?=
 =?utf-8?B?MCtEOU1oNmZLUklXMzd5RjlwNGQ4L245anJCZ2VGN25uTnpKcUhFNGdVcDVG?=
 =?utf-8?B?U3gweEZnRXpJbDNzM21vN1QvOG1kamZweFFiUFBIc1VpS1NuSHFCTVkwVHow?=
 =?utf-8?B?a2c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e6ecb5-32db-411a-e13f-08db94eb1676
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 13:02:41.9289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnL9OnjKOCtVcMK48XRRvKI1ovHZ0wpy5TgZ05iQhx1KzF61nWsg5wwZgGI5xAAgxwTlEZCPfhb63Ml4JamN3jcc7BVUVFNvG05CBsENSjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9353
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible for the Jasonic Technology Ltd. JT240MHQS-HWT-EK-E3
display.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
index 0da4c7e05097..ef162b51d010 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - edt,et028013dma
       - inanbo,t28cp45tn89-v17
+      - jasonic,jt240mhqs-hwt-ek-e3
       - sitronix,st7789v
 
   reg: true

-- 
2.37.2

