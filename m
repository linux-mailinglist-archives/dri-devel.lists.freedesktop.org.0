Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ABA6935F4
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 05:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FE110E088;
	Sun, 12 Feb 2023 04:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2054.outbound.protection.outlook.com [40.107.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0905310E088
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 04:07:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4vOreP1+q5uXj+67ScFCnQ9EYaebEx6O6Bfhy/k6c79P6DgAccdOfKlJlpLEcoX8ZnpKebZXxKkhmUVBBb0qbkjiA8/nGKcouc9znN+2jBjBwcEwnEJ3+AW5nPEDep2ynjeRXw1RDhniZnldIL0y9NRsO2ki/jpzh8sVVpnbd1PPQrsDgNqYtqivt70h8v6bzw4XswsWgv8kApaYE1UcO7076iDYuHgYo+8TffUTOhnVh71Aute7z5FoYfj5oHBpfcbMZBTt+3Z84Coho57Hcwc2Fd/hvDHhFdUd4xnNo0Bj1xqJ5qCWvTMehzbu0g9R9g9n7wVzps+TtufE4XsOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8yVXdU1aW+XeRYnc3vc9NN63uOPisSOnMWm8HsPQXY=;
 b=J2hYVzPguaA6hKTd6LZcb0y1OnvPAI5NUl+okb2v2dwbngJAcC1m61SjO+MSpsk8WFV3ScGTR0El/p8RwX0S6cQJj/BJF67jXw1F1vPvmYMLiNSLkb7V/8qjAAdPP2gxvifbM9dYqrxV2nOzFZ5B6i+eaM3do/iU8SvfHstP/hSUnJdjiUeGX55lE9xiigdHaXkeixoc51bFUYbfnLk3fnzPDEIWIF1HZIq0tyAwCqeBY7HL/LwiHpQjOrK0hzJXbWeS3zRkYNRvw4P0AFkfXgst6ZL9vnJ2biL53DWE4P3WdNq8PFcmhEasjWks/o7f23hkFHfY8cB+ROOxPn8FQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8yVXdU1aW+XeRYnc3vc9NN63uOPisSOnMWm8HsPQXY=;
 b=DCYvF6zKri/jTI9r1aNDP3kO2hXyXS6pAAD9WO/5pVKtoh+BY4cUUFPlcNMj5mFtCO9r5CmvkzmUuyflWO1SFi1ney+cuJGW7VN5o28A7gM7Nj6XvYG/lJ2GZRW/QjpXT60ZK5gyShsW7XHscBG/6KuBtzv5fI0kvssQvugbYuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB7105.eurprd04.prod.outlook.com (2603:10a6:208:19b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 04:07:40 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6086.022; Sun, 12 Feb 2023
 04:07:40 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: simple: Add BOE EV121WXM-N10-1850
 panel
Date: Sun, 12 Feb 2023 12:08:42 +0800
Message-Id: <20230212040843.231934-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230212040843.231934-1-victor.liu@nxp.com>
References: <20230212040843.231934-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::36)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b007c3c-d600-4703-5d97-08db0caeaeb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ee/ddKAWb2vqII9G4LQ4h1DidzZMG6zO3z99tIurymLnqBV+3bWF36ymZoDu048InM09Ct8CHgZZtrn0uUAcVBo0w7lM9cR1gJsyNIPpogbgWt+NYvNeHYqDBs9aPBC9ZjZPkyEpHDaVriaFnLgqgTBYLf1kH3OUgMlBdXCrTggTG3fg4IIshAdTurQOuS2Xm9+h/ozSJMiPrAdcKx9eJKuB2MJMPMyw6z/a7q8pRtM9eXbQQTg768OZFUm+jdC4+WxoQpGmSvPCc8TqU9hGfbssvASRRwMzhrVkB9ysr4Ne706RQFGON5uk/dTWZzhc5zFlM2S/Z7S3llKJVi4B5t+JD9FCj7W0iHyiDMj+xj3SqOnkgH8mQA2JwnwXUWYAUB2zuhAwK+X/oPs9xxRyvuEspOvMu786FVIpVCMvTpqgFuPBTSET/BVLoMRbH1kDCVNkNE+79XjrK/ftAY8+Ojdfd9zz+rfn9TeweYJT8KrO+S5ifXZcUNyTVNNoT7AZfb9kH5MFaQ4QkOgbGJhlPtVYhHULX5WkiI5to4rKla6f+FE/cYaNNN5Q/Es9bw/bwIV4GS2ml8ZcPtx09tef/Wl6owURRX/TeRGvHq3PE5IySueHW1gH69JInWa/mKa4OZm1pmuzSw6bBiKD9sCUSfh04ghsKL/Vw3di7CCskNCdlpOUsAnHNLRXBjNZbKAC8sO/lf8hLI/j+oNpZAzAX5HeWFYcCm/EkVSab/3NGjY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199018)(86362001)(316002)(2616005)(6506007)(6512007)(26005)(186003)(1076003)(478600001)(966005)(52116002)(6486002)(2906002)(8936002)(38350700002)(38100700002)(36756003)(41300700001)(5660300002)(66476007)(66556008)(8676002)(4326008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vxGokh8rtCIXNlKgG8snXH3o39eIArIoQb/eqzUylpDyiYhKQTOjMZ+dE4Ss?=
 =?us-ascii?Q?HuxeMB2YNiJpJ4BQxjobgjAlgIwtGrxvTAPfnyrylkqKzYCkGpS4AwoYYflZ?=
 =?us-ascii?Q?K2282wDs2wm6b+awtQOc5J5ISOmYmVmtjBdPvCkY4WPovn6aF/DYuodLTeOl?=
 =?us-ascii?Q?BAIANkg/3ECaAE2jbVl8JsnvdBy6lL6Yjqu2jjyGc3Sdcxooc05Hv4AtnuE4?=
 =?us-ascii?Q?onRCYUbzzfvwYyqIEWOcj1EFIhZTrHzWRCHF4wDDs1/fN3sL+WlbWIOpjHcR?=
 =?us-ascii?Q?x5K/0PfeKGjfaz4vQ9E5ZzBgQYUBJDNSr4Iynwy9ljMoh7i4YpQXB/lJv5E+?=
 =?us-ascii?Q?YmhO+0OVzNxmaiovEIuwivCQZjv73Hxb3XD/O/dGRiNJPnQMM11OtVcsDVhb?=
 =?us-ascii?Q?4YDA5OyIhsxflaxU3SueFICW1Wh+qe7jWCgulPHuP+bUJM64gHhdANEMSgaP?=
 =?us-ascii?Q?RJ+M4NWxztM3X+iidCCqd6deFbjCi8Y3DNGDI1mZlMMSOZn3fz7it+OIAfCQ?=
 =?us-ascii?Q?YLXEndPmsS8J79FBeR3a5Fa9Fjsl9kIIx0rtnVBAUkOThbTPG1nomXPAdZr1?=
 =?us-ascii?Q?/dCPY+kOzZ/8X1Ctp7U9LA5GKYUpgyUYA7G4jJw/nHQW9pOwBosvB5+54Xw5?=
 =?us-ascii?Q?N1SmULvHXhw1KgWyvPLCxB3pdFtszESKWKxSpHEu1Raj+PoV7ijKrwzqZtMH?=
 =?us-ascii?Q?5nlyb7pupnORmpNukEEp0aL5JXOoUEkNYDmORa+gVUoPKn8cpFLbdz/4BRss?=
 =?us-ascii?Q?i29cnR+VbTk3vWOk19JvfUn0yj44CYEMcW8Hb1EKQ4wVx5dmRQcHJHmt0r3c?=
 =?us-ascii?Q?ul6WCtmcMYRFC1EJWAByCY74dRax7J46KwkWay8sNm2pzgGWXvlPNrOOGwGM?=
 =?us-ascii?Q?A/BUrBsD5JfNBZAdU8ZL+D3l/HYegGw8UF6A67Axe9pWrfvegRaflS3DltQY?=
 =?us-ascii?Q?6PCFkgKSS3wv6RKEfR++mplDMlTq2HglfOcMY/8d4XVP8PZy5cxP5IwccnUd?=
 =?us-ascii?Q?nmDmJsXA0riBVMUZvlNWHf34kgh+csCEBJ+wPDlsX9Al2Bd77JRPZCg/FUrM?=
 =?us-ascii?Q?E87KFEWiR4nCd6DB8h0kQr9cqVkzpKheJsB6pE+KlJLgQwZtSzytZS/nnLu2?=
 =?us-ascii?Q?7l8G43k0RweE9bXmrT/4+Z23e+T7XjyFAJsz99VSCEocridBTIu4MTt0o8Ge?=
 =?us-ascii?Q?uorkq17+PabCQcEO4NBLiw8qGPabXvNuVrEFRSQoWNbizqr7htT0yr3x1iYl?=
 =?us-ascii?Q?0yywZrFQIyEZet1fq0xyKYoxwrDZb2mpB9nbaUi6kmhBb3W9baL/VDXXrKkC?=
 =?us-ascii?Q?/Fj0gyYMVk5FHmmuCidauM4juTyyWcgbfRNdWbJVle7EyfIAieaPtnSt582L?=
 =?us-ascii?Q?r3ly5i8Xw2iOqHM1ocCtH7H+S20V2I8MUYjStMG3/07nA9ND6ddm5T6IoVu/?=
 =?us-ascii?Q?Prsf2I1ehnYq0NosUXTcxxdu/eitqueU1zg8UVJjKOZbp29SlEVqUKwsxZ30?=
 =?us-ascii?Q?s7oUhQZ4ludep7Cz/+hDzhBtbAe+S+X1a9/uJRCHNUm6LTGPL7zz7f4iw7wa?=
 =?us-ascii?Q?mVcaqNwcqQy7w2XZVMXgdZ+/udakMQToZwxr8HGV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b007c3c-d600-4703-5d97-08db0caeaeb9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2023 04:07:40.1408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yn5j6EIu5AS3R7HLYu7I4SOIAp5UcQaM+tB/LUK+se0vzkMaqKhQJvfUA4xZ8HMcFgz0bUk6HkmGaQ1ihOm8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7105
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
Cc: sam@ravnborg.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add BOE EV121WXM-N10-1850 12.1" WXGA (1280x800) TFT LCD panel
compatible string.  The panel has a LVDS display interface.

The panel's product specification can be found at:
http://www.onetech.com.tw/files/EV121WXM-N10-1850ProductSpecification_20180801.pdf

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 18241f4051d2..e99306603096 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -77,6 +77,8 @@ properties:
       - auo,t215hvn01
         # Shanghai AVIC Optoelectronics 7" 1024x600 color TFT-LCD panel
       - avic,tm070ddh03
+        # BOE EV121WXM-N10-1850 12.1" WXGA (1280x800) TFT LCD panel
+      - boe,ev121wxm-n10-1850
         # BOE HV070WSA-100 7.01" WSVGA TFT LCD panel
       - boe,hv070wsa-100
         # BOE OPTOELECTRONICS TECHNOLOGY 10.1" WXGA TFT LCD panel
-- 
2.37.1

