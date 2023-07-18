Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CA27580F6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 17:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6B410E36E;
	Tue, 18 Jul 2023 15:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062.outbound.protection.outlook.com [40.107.105.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BA810E1BE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 15:31:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEORaMFUWMO0T6MNdRczWT0Bga30HWhfdmFW7k13er69cq7i5LIXhcDyIOVicw+9lDkQKagcD1IBO3i0Ns4bPv80P0FeiQ7XIy5fGiEF3IQ9K99odxXBOYAO1EbYXd2vkpt1zWpj9afJ39hlaE91npNMNk4F4teWID1c69JvMSlz6Fv8fWrYJQtOuzI5JwJ6oxVt8ubRSZjgUEIBfr91RGmSERJbMYRlIc5X+pNROH5VBo3ID59fumFJBrq8opcDrC0mLTBFwxkxbshSNskJOsO2ga7d2sTwE9dH2ZuiJFLX1upTQzX3KC9WYTPe5lTPhhKfey68UZKkGjr5Al1fFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pb8J0b+HocRhtEn0xCDTczFEyxLD13Ul2g38QRirNf8=;
 b=Zuy/s1xWb8fCSB66oNT9s/FSJHs/SIK6HXswf0TC+PLFnnbGkyXgp2lGelXynySVicy1KXBTo7AWHDMJBBQyvR95qp7aUIIjikKvLeQu5kptxgSyHyjUFRqaJbM32PuBfb/+JilLDHxJJg+N+mt0M4kPLxruyxbXxruQeeFNWSxkvYSTPUwAPQxHTkN+PZqQVUn35LsnR81J50ShHkUvPoXn1IwvUMKD1fzKg5YCMzbGTM4JQXmoYDHpv08vZDM7MGgJV+QxBH4uhCxdVP7xjA7XbYagBl4Ncyu0i60PFeVG4noQ6LZCVdQ0oOVHVLIUKvsKWpeVhjjiPe+PtkWujw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pb8J0b+HocRhtEn0xCDTczFEyxLD13Ul2g38QRirNf8=;
 b=NT/1izuvHp16ZEL2bBBoJLHYvgqzO5NnbH/XcWfgpW5okDOKdte2oBl5ctMzhNJMjeVtgMEvp1DMJxmGohKM4cbJLKOEuY0Bjnyj60+anzIvBcmwzA0lqqH+8ETOO8Bm83PTObT1O6QceaO0ZQcHClQq2GNAv1A0JyA4j3KVuUc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU2PR08MB10201.eurprd08.prod.outlook.com (2603:10a6:10:496::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 15:31:55 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4fd7:91a9:a92b:295a]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4fd7:91a9:a92b:295a%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 15:31:55 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Tue, 18 Jul 2023 17:31:51 +0200
Subject: [PATCH 2/4] dt-bindings: display: st7789v: add jasonic
 jt240mhqs-hwt-ek-e3 display
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-feature-lcd-panel-v1-2-e9a85d5374fd@wolfvision.net>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
In-Reply-To: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689694312; l=811;
 i=michael.riesch@wolfvision.net; s=20230406; h=from:subject:message-id;
 bh=tGeIwdn9vAFkllDPaAoK5b1eixQq8cAEyAN7no9veUQ=;
 b=ijXA8RFzyear/UMIfx16H/zlDTuVW6gUUuWuuBDqLXH6o60QSB6+A9WRSdbpb3n2dT6/Bmbh9
 3MkbTDM43RMA5xuxSqOwUzMSaj8lmVgsgVyRCXenbweEEgVymRze+Ib
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=G03kuYHL670EcdsWaNfVA7KnHWmkSpj98XziQm/hjbk=
X-ClientProxiedBy: VI1PR0102CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::40) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DU2PR08MB10201:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b3473e2-d78c-4739-b9b6-08db87a41e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gjMmq3dWLXmokIy37EgpeqisiXZrJfrZF/kBSWPPnXgGmvo9zT41A4eekrOn27+LfRZniqXirBY9yyzFIaVVBOueOOUFDe5Oc25OcjztdBiiDm9yHmeSp4kg10SY2qcSsmR9d4vM0iFsmHAhwrGE1zCgVYn10xPmTBo993l0zpzExQvIMFHgasbTol/CgNl+81l61UkmvnM9eNvfw96ajAd88QFluobAOeig4smaglhFABChrcBQj6hY9yRlAiih6pwYSH5p5Zppu7v86JiaMBY6CGUkhGJDbMsYv73+Dc0LTKokLT/li56R80NhPy0W2cTg++XZ4op+MbCW5cpZLwdrzQV4B1qWVufVYIXHI/5kUFTzhDjPWsIOv1dUMt3kuYfpH5u+fx6a1UVbhwUCz+YeqjJqlCIXyVOwc9Fh/gI9m0OaxKgfT1Qmu24GqDqdJNQlHs1i6kLbNmBoE7usQKj/8g4M6ENChIjI2hTmHT5FdYQHHHySEgrX90uXbhLhm8u0CE1W8WAfF8tvP7C7WZOASfobFY2jpiAgCqr7J8WFo1qG4sx2tJL6g/oFodzut6x6lQohk3Ip6BCV0D0ghub8lLn9jOGMLd8EI/vevVhjo2OK8NBDrdhtCUzlXXGQPvDPzSK0Q+4RhHxOFgsyjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(366004)(39840400004)(346002)(451199021)(6486002)(107886003)(52116002)(26005)(6506007)(6512007)(38350700002)(2616005)(86362001)(38100700002)(921005)(186003)(36756003)(8676002)(8936002)(4744005)(2906002)(41300700001)(478600001)(7416002)(5660300002)(4326008)(6636002)(316002)(66556008)(66946007)(66476007)(44832011)(110136005)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWFRV1FxUks4K3U5UThtZGtkck1FNTgvMisxcTFhYWlmMldnbm9pQUZQNHU3?=
 =?utf-8?B?ZFViU1Y3SXUwTngxVGFmblo0MjExekJrSGFRUnNHM3NRMG92ZUVwcHp5QVp5?=
 =?utf-8?B?cThrWjArYTcxTk9NT0lnL3k3Si81Tkprc1RDVTlXSDdoSk5vZXV6TXozNis4?=
 =?utf-8?B?RUczVk9TalE3VU81V0h1dDhlN3ZXNjVyMWF3NlYxdGlmeEE0Tnd5eDB4TDd3?=
 =?utf-8?B?dE04ZEZ0eEI4UXcvbWNobmVKT1R3TkxIZG1pV3JUcDMxcDVFb0RuYm93ZWpB?=
 =?utf-8?B?VmhZMjliZzUybExPUVNudlR0WExERXVIVTlxWWF2a3BiWFcrVGJqZGN6VmNJ?=
 =?utf-8?B?SmFNbytjbUpuRytLdUp4ajd3UzJCaUlwdnptS1d3ZGhmQXNxS2hrSlcwY1R6?=
 =?utf-8?B?aGhLWlpsSnoyek5MUFRkaHRjRUc0NmFDY01UZ2I1NUlIR3M2dFJyVC9RajAw?=
 =?utf-8?B?cW02eXIyQVQ1by84YUFzV0hvNm1XQktObVFtaFJFdGp1dmFtV3pKRXpIam02?=
 =?utf-8?B?Y2t6L2U5ZW9WelBzSWVaaUhhVUhzYkYrcTNMUTlzMWlORFhaS2JRSFRzdGNR?=
 =?utf-8?B?bGQ1L2g4TnNsbG44UGRGc0xuQjlabFhPeS81NVRGVGgxSThoRUxkWnVOWWlP?=
 =?utf-8?B?M1dpckQ3QVllYlMzblpnOVJ2U2NaZnlleGd5aFFhL05zakhlem9MWWQzb1hj?=
 =?utf-8?B?cjhHVElrUVdNdUJqTTJZZGZaQUJyMCtkQTNtVnVjaCtRL1F6eEluWU1US0hD?=
 =?utf-8?B?Uy9EaGtseXdJSHVFbVdxZVJyeC9wTUF1L2p0T3NxRGhVRjlqMVJuSkZNbVc3?=
 =?utf-8?B?ZkVhQUF5REFFMFd0a1R5cVBidERKd2JZU2dCbUxFTVdPVy9ldWJaQ212d2RN?=
 =?utf-8?B?VnkwUlpCQXhPcFFpK2cxeE5IUkl2Um1BUzVYMmhTT2VCdE1QL1l5THhHODMy?=
 =?utf-8?B?UVBvd3V2UkZzbzdRL1Iyd2JFRTE5WlZNMTUxaU80TkRrbWlZbHA4SHhvOHpS?=
 =?utf-8?B?dXhIclQ4czY5US9yOStSUWhraW45V0k4dC9NWWVMeTNObWk0ZXFtTHdGVEdv?=
 =?utf-8?B?OERQSC80M2FmL214bEZuT1poTzJxSW5IZDl0OS9oMDh0QU9CeTBSS2s4UUw1?=
 =?utf-8?B?TkJLZDUyUGs1amovNmx0MWdVbzdralRCZ0lnYnp6VEpoS05YbmdWbkY2c1o2?=
 =?utf-8?B?dmsxOTM0Y0NlVWRhV2NXWHg2a055YUxwMTNObW1TRHNMSkQ5ZTlKZkxOS3hI?=
 =?utf-8?B?dlQyeU9jL2xWbEJYU2dTcTY0anVCbVlNTXpZUmN6SStFdHBkYzhyczl5Yjho?=
 =?utf-8?B?eEJjQmFna3pBajIvVWVxSzdjME1QVElaNWxFZnRWWFNOdlZDWk9ZU2ZMYzJu?=
 =?utf-8?B?Sk1keURTWUZ6ODc2cytJMlVZZEkyTlhuZ015eVp1cjhLS3hhMVliaFpzMVBs?=
 =?utf-8?B?eVRtNTNhaXRjTjZrV1FKUUdTZEIya1hvK1hNZ05kLzJObXNyamJPWFFhK1hF?=
 =?utf-8?B?RG5haU90VU8zdTBhLzFxNjJnOHlrY21DSXRFL3orbmdybXFrQUhuNEY3WnpW?=
 =?utf-8?B?RVJCR3A3akJES3oyam5NOG9vQTh3ZTAvV25JQ1NBTlV3QmlQWHFxdG9OaVpS?=
 =?utf-8?B?OWxKY3Vzd1NRclBIakZWNllGeWtqMkZyTi8wcGxUeCtXTDdVT0JzSUZvMjRz?=
 =?utf-8?B?dnE1bzUvTHhVbU1VeTBiQ1VxaFpJcHZPVEdSTnpQQ05KQ1dpSUhLSUU2eThs?=
 =?utf-8?B?NVJFOEY0aFRBZ0wrWEZ6YzVZcS9reFJNZzdiZ21ZRlVIbVlRMkdmakZ5N1pH?=
 =?utf-8?B?T1A5c0RPNzc3c292QzRxdFBlTVdnRDRMZEVQd0czNUdteDN3a3dxTTJtdkpj?=
 =?utf-8?B?SFcwNzBKS3dLVGVIWVROZ1BTY3dPSDdyeHkxdWltaGZaSXdhRHFZeVJxNjNO?=
 =?utf-8?B?eVU3WVJLRjYzM2JzekJPM0JIVm9GYVpBcWNqRnd0SUJoVUZhRUU4QU1qQ2VZ?=
 =?utf-8?B?NDdCRXJ5K2doWFBmandSUnQwSEtZYnZUQysvRzNaT2tneVBvUldSSk5lM1NM?=
 =?utf-8?B?SjdtSkJEdzA5NDhVVmRacUJibzlqS1crK0J6SURldGR0eVRuellNQ011OE1l?=
 =?utf-8?B?cW1qZTJDTVhaK0xQcHVxamhEckVPM09tc3AwejhuU00zbWE3MHBJc1NIYWsz?=
 =?utf-8?B?L1E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3473e2-d78c-4739-b9b6-08db87a41e09
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 15:31:55.2386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LGZ51QGfcmoBsypOto8AWLqhHFVWavFyE/ruZW8EhcoFNLtzkw8mHYKoX455ocksneMS/qwe2iFiA1FoOEearWtc2cRmfz/4+9TnqRybtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10201
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible for the Jasonic Technology Ltd. JT240MHQS-HWT-EK-E3
display.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
index 905c064cd106..eb1a7256ac32 100644
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
2.30.2

