Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B627700AF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 15:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A4710E0B1;
	Fri,  4 Aug 2023 13:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE61C10E0B1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 13:02:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcrTvndqXB34CAPZCZQJA0CBn5M+ejmuj1jH+KZxFfiSxJn9KkcUcnJ7U2+z5KoH/7rWp5R3G8xUdW043QG1sGiXydl+XE+dVwsZ4K2PMq5ma1w9KgbcHQH3qxQYaxSoo+Tz2MnOEoOviEmJr0Y4pEvq0uQa7/TdAMZxml2Tdrxqo426SXSSoUa4GjhKAafQzwe9OGhahcrLyKe9pWA5n5iCORaZJbWC5wE/l1APK7ByMce4JhCkIpHH/7B5eSGbtxfgdxOSqWwRduXCxzCC6wATWV4aLhCNSD+DUEQPg+2Scr5pErM0cdREkdrl5pIO/cJR4FvMI+TDd1fmzvFXZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLfs3yDJBn5VaAublMAJW7YFRkzylsv+cv0DuuVyIVw=;
 b=h1vSjRr3Tvk/q5hUO9mLoTTjzQO2wr9V3dXenUEoVAjFzJ9eg5c8w/rQ0+b/pW5/luWjNJIy1dnoZQCajx45V3BGmJnx3XSbaW8gsebQ+MtUzGTttwuxSVJRvjIsKR/gGcezCRoCs0IeK7sOdHA21rNY419oF2Sv2hbN46G69GrpnyQ6SXuXKOkWNSmS3meCDpnc9Nm/wZSwv/9mjX19DPAP0N0TA/z3vXfqyk4NfHSaodkZCeBIO0MpJiODQZ4LotdYGwxx4zl9v1gMXUknWmUu0zQN5P4RrU4wnHvl7/2Bz0UhtpmVPwNLGvajdFTl5Umm018AarF1iHVYiIecrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLfs3yDJBn5VaAublMAJW7YFRkzylsv+cv0DuuVyIVw=;
 b=YXptN9IiLXb25eHTvNvfDXYqCb09tIS2rWy0CK7bcPVMROOC6gj/RNBuLNgnF2xPbbhHHyF/XzMzo9a2Mc7TOdBc0fvxt+XJFcOByJCThYsXQNHaVwh5lGXfHAc6PIDkpoWV4YD+dS1AA2MoezzJyGFOP6pu+xoStnnBYCg1oxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PAVPR08MB9353.eurprd08.prod.outlook.com (2603:10a6:102:302::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 13:02:41 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 13:02:40 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Fri, 04 Aug 2023 15:02:32 +0200
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: add jasonic
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-feature-lcd-panel-v2-1-2485ca07b49d@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691154158; l=903;
 i=michael.riesch@wolfvision.net; s=20230425; h=from:subject:message-id;
 bh=NNT4mO2IGbInfYVXv0P0B02ajpPPrb3nP1cWnAqLhsE=;
 b=6Kq9DeQCVqJ420YUbagyTkLtIrhvBgqKAeSOiTPNtXMRuT/V/FJ/+tDGl+SDka91fEiq9cl5n
 Ebd78t85ngzCpGLZ26r2gwLLtaV0xPrMhfmBRHSo6+MN7oNnV9RVS8R
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=1QQdXA2QbwdxaQn/VQK0hz04C8IBYhDowbK0hlNU4Ng=
X-ClientProxiedBy: VI1P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::36) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PAVPR08MB9353:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb07372-4233-4aa8-b716-08db94eb15e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eYvUvdFq3EyNHnaMFG5EzZZldrjo1EuY25ktDLDRXmSEWJ1we5WgdZPHI+PyOhE/OKXjrRdphh3vScWuUQYgllZ83wXY+h6+uEFc2I7fb+m+VUVA6gdRUHbspJloMjYFsiKbaMhXm9LsqiRogwA0N3k5ip96dwnmz1bJwkCdCH/9Z/iEKYt1z1SG3FdvZFyGNQ6xBLaIi3Fm73QOvwwrXJ39p98icHw291O0Pr8jI7DGTC4R7gv/tgPjTn38OAcD5auyh1uGoyhXVHRyQ5eekfmOt4GMlhC3c4Kn8qSKGAW/FTR3VGlIStb2mFkM5N+PfDm+TfCtiaeQWnDPRfzIp4hktPi+QPgL2ZwBtIed0SMft2G4349uAsSP3e13ep9EvkEG10hDE1pSgy6nkskqGA5gyUfW6pNqzgYW7OQEp3gpGdO9r/F79W2jUWmpI4Q6dlHrE7NBFE0E6lbn/TEVuNw6WU+h2V+HH5QHU59tdV+MDDQTQC/IR0mMbvvt12Er0rEwUVSIUqRZF7T1qugNHRFb0oAmjTm/yIBHq2LxWLFeL/KC3gH2EbYKwVBNQU4j5tsqVUa8OaY22zVzFBBbL0ayZ/zQoBZYhz+1hFiouSk25AJQGy7wwyYlUcd076D/lLm6aNJ0QPbxfVsSCP4aKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(1800799003)(186006)(451199021)(2616005)(107886003)(8676002)(26005)(6506007)(4326008)(2906002)(66476007)(316002)(4744005)(6636002)(66946007)(5660300002)(66556008)(44832011)(7416002)(8936002)(41300700001)(6666004)(6486002)(6512007)(52116002)(110136005)(478600001)(54906003)(921005)(38350700002)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WldITVFsVnRlMUxDQWFGbXFpdHhVVVdZK04xWmFnYVFwUTlTTEFaWlZMaU14?=
 =?utf-8?B?eUdLbXRGR0lyMnBwM012Tys4dElocU95SVdQaU9xTkVQQ0N6QzdzRlVma2tB?=
 =?utf-8?B?S2VMZ1VLRzRBMUMrUWZDUjFMSDVvYjdnQUhSSkdraGtpY2J6RldCSE9FdU5i?=
 =?utf-8?B?N2owWHQyYUtORVhjZnUvOVZDcFlTVVQ4Z0dlOHV3ZlRLdDgyanZvZlA0Qit2?=
 =?utf-8?B?L2ZoK0VtbGx4VnVaaDlLQjRlT1A5L3BqcEJyQk01R1NIcVdqdCtLWWV0dHF3?=
 =?utf-8?B?Q1hLUUJXaVVRWWxXeHlqWmt2RGhPRkwyQnovdzFLL3FaZlRRQVRKcUpEbVJU?=
 =?utf-8?B?RStWRDBkREs3Z2d4ekZ3T0dpcTk4bWIyUGxNaFBQZVNmaWFmekF1cGE0R1gy?=
 =?utf-8?B?UXVzZXplY3Y1R3VpdUhCQXYzbUFFK2NYcWZRSmNmQ3F0aTc5VmhXSGRJUWN6?=
 =?utf-8?B?cDRDY0J5RjAxYnFCVWZkd3k1OTI3RzFobm5FbGlSSVJaYVRBV1RJYm9nN1Z5?=
 =?utf-8?B?MlQxKzZjL3dLdzFxK2c4YithbFQrU1llbEhxaTZPdkpkeUtjSG1OSXpCUHdo?=
 =?utf-8?B?L2txV0YxbnNhYUluVTJKZ3l4T0pjZXlOZjFOMGZYakFzOXZ2N3hia1ppektY?=
 =?utf-8?B?Q3EyejcwQlViZ2M1OG54bVJlL1VVMkRGWFdiTTVOa2JFUkZ0eWlwVWhEbXNy?=
 =?utf-8?B?YTIyZTliWVRXVVBpVzZLSkllUVBvaE9Zd3ZJZGo4d0ZEeFlNYjUwQ3lxVUxU?=
 =?utf-8?B?eUFFL2h5Vm9QTitrSVVhWWtsQzZBRDV6Q20zM1pRdFhuQ2N0ekNIRENDOTFQ?=
 =?utf-8?B?anZqNHMwTWFJNTBwREtuS1ZxMEVyQ1JhZGhOMXA5d1pIR1VFcTB3M3AyczFq?=
 =?utf-8?B?MXo3ZGR2bis0bmFGWXNKQmQ1RFdNb1NLUTZNVFhoYjVsTkw3M1F3U1Y1dmFu?=
 =?utf-8?B?RStTTml6UFFaamU3UEgyTUNLL25QODdsbWlwSkhTUmVBSDNHdVIrQXJFK2xI?=
 =?utf-8?B?cmFXU2JRZVFsWmFjeFVLUVRnUEFMdkZLUHo0MDgvaW13SlFmLzNPZFR0RGZV?=
 =?utf-8?B?dWZXdDY0THdLVDJJelFlODlkNXIzN3M2VHdldXB2UFJGY2RqWEFQRW1xVGhD?=
 =?utf-8?B?aXJwSnpEM2FZWFRFbzB5UnFBZFdKWUNBR2xPalpjY0h0M0x2Qk52a25kbDNS?=
 =?utf-8?B?UDhFTnZFQ0svNTRSRlpPWjlCMHkxOTVzZWlEQ2lBbzZ6MkwrVnZJcTBJcWI5?=
 =?utf-8?B?Qm5lcFEydHdkbVcwWHZPS29Scjljd3VpZmNqUTB2VWp2UldJRHUwUzhUQ2dt?=
 =?utf-8?B?ODBkblV1MFJFTitITXl1NFZkVFdjQzlLR0E1UTM4SnN6aVpzQTNVNEVadWhm?=
 =?utf-8?B?bnpscW82QzRYbU9GMXl1OGFtcE8yejJuQmZCN2sxZVdIME5lRFp6eDJ0eTRy?=
 =?utf-8?B?YVQrQkx5L1BhU2dnNDdCS3N1a05YRlNpSlQzeTMrTWpoVjRuK24yVUxmNUVp?=
 =?utf-8?B?dytROVRWVDZpekMwdHNpQlA5cDViWWtvc2c0bGQ1RVBFeVUzd1VnaTFQMTNk?=
 =?utf-8?B?Qm94c2FMQ0xPaWJKTkNMcVhMaWcvUS8yUWFxRVo5Nm9Fd28vMC80VFhsYWlv?=
 =?utf-8?B?RWtHTHhpZ2I2RStMbTdwbXJBcGpld0VGME5zbUdzYlJrb293NkFYMElJZTU0?=
 =?utf-8?B?TEVnOVA2VlVFWlhleXZOWE8zemhpYnRtWDVGT1V0QWlEK21RQ3JOVkNGcWdH?=
 =?utf-8?B?STQ2Wjg2RGVqcDkySEtkMC9ueS8rZDY5UnJpdDNLNnNndmRLenhFUjNic2NN?=
 =?utf-8?B?dEEzVHRvK3VuNmQ4clFOdzVKdS91ajRiSkRBK2x0RUl2cTBSZE9YeWM4TlRP?=
 =?utf-8?B?SXB4TDJUM2pqOXZhYUE1ckpYK0F4TXpveTFhSFVYejVQOU9YQ2toR1lYTG9O?=
 =?utf-8?B?Tk5VRkFSL0ZCQUhrdFNLbXFmUXJLQnRUdXJhQ01zT2RFeHNzZDdPYURjekNi?=
 =?utf-8?B?citVZUFobkQ3Y090SHV5a2kwK093anhCUWZRaG1PTVkybElkUzduK1VFaXlV?=
 =?utf-8?B?djJFYy8rc21seEtsSEdWSkhoTTZYRnZSY1Y2N3pNY25lb2t3WEtPK0xFVUVw?=
 =?utf-8?B?eUNjMjNzTlF6NFVXNmRvdTZhMGwxY0JJYUJDRGxReTQ4ZE5TT0VReU5tR0I3?=
 =?utf-8?B?MlE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb07372-4233-4aa8-b716-08db94eb15e0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 13:02:40.9223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2T0YLKo2taF9UC4GjMqaOwuLDXOo95bjrkD+IFNbj2z4fRLwvFpwqjQ6qtH+xqcYhFcHWhqbx2iJ9qUgocpDYTWAtrQ48dJKqq/sYN+PZc=
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

Add vendor prefix for Jasonic Technology Ltd., a manufacturer
of custom LCD panels.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 1e2e51401dc5..1dfafc339ddd 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -677,6 +677,8 @@ patternProperties:
     description: iWave Systems Technologies Pvt. Ltd.
   "^jadard,.*":
     description: Jadard Technology Inc.
+  "^jasonic,.*":
+    description: Jasonic Technology Ltd.
   "^jdi,.*":
     description: Japan Display Inc.
   "^jedec,.*":

-- 
2.37.2

