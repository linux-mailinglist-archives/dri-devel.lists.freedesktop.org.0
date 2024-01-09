Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D66B0827F5B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 08:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E57410E34C;
	Tue,  9 Jan 2024 07:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2086.outbound.protection.partner.outlook.cn [139.219.146.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D27510E2FE
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 07:24:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPHhfrQ/MMjMqSvOodFrjanOxsMAetYTtKmjwOsH8z2UQFLDnavXfsjgNvR2cGfMR2LpLRHjt34q/o/J8U1TyrPQ1mywQZV1P+gzHCj12eHCxokC5X91qytXt9hf0hwPr99pRu6vNfn9qDeZOeEkE9pUF2mJBJJvMWuAjwRUO/jYN8f2+jJl/yY33lf/R1DwvVFUw57WW1yAbmAHXZeFiZpvgwrOIbUiuCBZh2kzNrHQwrdei5SQoI8lwhg7v2g3/RyWT4Y57Zsk9RqKQHdKXi4Zb5E+dHEEp23LE5x00dmqwrym0HLWjACQWg4bRA58Vj5QzCKbNXCuVb3SMQY6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tSI6bwsql5B2iKsJOZJuslOyuEHljrzwWiX3sGKD/k=;
 b=UVnDfe3OuJn81MEdzApqsExB5D6xL7u2NM8WbNWdlgTWBjpyst9z3OF98E7oGBshBjrGfko5uhmqUcPdApUzmvxXQAhmbo8XZeyqlT4fwlTvV1qs98SpcuiN14qlrVK7Lcg8CJahEndzzCk9jF0nPeHJDYuG3TA3x/fgx8NZNwPqp1miojj8DIdL/iYAHWomhxOubCXKfbacoHjIiQkaOlywDI/bVd/0mM6Ev4xDBHMnkB/XrlnGzBb8AQzHCxkm7c+9SIwMO52DJ8PC5FoXsc6KYJxHEs26lQfzYkBtH5qEFGIUiUM6Ftgpt3aflsbggmA0Wp1Tuy241XbIyjGs8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) by NT0PR01MB1133.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20; Tue, 9 Jan
 2024 07:09:57 +0000
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 ([fe80::85fc:7fb9:8b00:dd88]) by
 NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn ([fe80::85fc:7fb9:8b00:dd88%3])
 with mapi id 15.20.7135.019; Tue, 9 Jan 2024 07:09:57 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] Add waveshare 7inch touchscreen panel support
Date: Tue,  9 Jan 2024 15:09:47 +0800
Message-Id: <20240109070949.23957-1-shengyang.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::17) To NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1070:EE_|NT0PR01MB1133:EE_
X-MS-Office365-Filtering-Correlation-Id: 097b2250-45f2-4524-9847-08dc10e1fc6d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E1zSTqNPEo8Ulbqi2hXpZHM+nWxh1z74TgGoITO6tB8uk7/N1RFJwCcNwcQGAPcz77YG9/YQYXGC7pdN/hwwm9WN44m/B+XKvYAmIVZ/eoEGgRErNqFA4hJGlZmVTVIzifu7NGv6jLs7NT9QG4gVKyLeSUTbDfpqSE5ryjmBE9DZu3z2uCdNf2RltvxnRNuWN5qJ5R89ynT3l2gC/RkDtVvedgc5HFkXoIYx6oAMKv/Ezp4VyQ0mOc+nwP213yhsBa+buVkk/D69vi0MhQnThD5qloQkBbWILVSIB/47AGdUTZvifLMLoDcciStl2fyf4CmGHH1+iw/64tCE7pAmRSAAXsQ/c7pqygoL8Vick5ZDIlTy9BsfTIIiP/697nFsMRMJTmIfP6romffVgOt/SjW5gEuP3fewSgYFLV8+4ndvYyTe33dR725hMm7P5CoxAsGaSUwXf4/vThK47x9dX10VZiD7UZ75eVGHVdzOzK2qyilOB2Wm0uTMk6YTOZ0ZrqXkzZCRm6JU3lFYZUsrFmA6OZDlBYNLo+e4XssY9JRFphF7VSdGIsPSOE9/OkN3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(396003)(39830400003)(366004)(346002)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(66476007)(66946007)(4326008)(66556008)(8936002)(44832011)(36756003)(26005)(2616005)(966005)(6666004)(1076003)(508600001)(8676002)(41320700001)(41300700001)(5660300002)(2906002)(4744005)(7416002)(52116002)(83380400001)(40180700001)(38350700005)(40160700002)(86362001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C4m/yr4V5Ax9haXYVQprJJLrMYCriV9J99mqMM4Ez4IVQaszC4NCTs5igbmp?=
 =?us-ascii?Q?95hjnxQdwTbjXOhxi2tZ0Lc+vuNqs4Z1UHt11extpeBltxkAyHJgXHjt1rpq?=
 =?us-ascii?Q?hqPD4jC6o8iOZVnH2WahWs+TMyvC/j3RFnixQo/B89RzTK54icWdFi/kma17?=
 =?us-ascii?Q?ryuEDbOh95S1lc5cNTmbjuGeD8TGwGNxD3fuUD3LoN3l9j5ActIH7VFlm8Sd?=
 =?us-ascii?Q?Bf6cypFMwSqAUA7Txqf8tEjovIwHOqnnvFcswa+S39puLsAT627JWiUA8iOH?=
 =?us-ascii?Q?l5A5AjSVJQ3klqCf0o8xRa30ShfuTiIEEGbSpBV4pgZinnKnJjXcaIjGnrTI?=
 =?us-ascii?Q?OAuGaMXbTymeLYbSgKaYd2x+SEPutdksseK8K+UMzOkXKZlzHtnvIe58pQbW?=
 =?us-ascii?Q?Xwd9mX/Y3AvdrvM4vtAiwiHG56pWfzkvXcit9Crx60RgSwiN2RNRMQirkqQG?=
 =?us-ascii?Q?va9I91zzMAVA/gN1ttvajbP0uokGQOI7aqYuBXVRa8F/32hAATdG8PSIr+A/?=
 =?us-ascii?Q?dErAEbbrLdjeaV1gb282lCFWUMnZmKasalPuPjdzJqaIve+juk6/FXCVvluu?=
 =?us-ascii?Q?baO0V0vCkVR/VcJBwZFcB14th/Sj/YZVy/5WlNw3qZhMgHItTCLXuLG7f821?=
 =?us-ascii?Q?tMo0Z7L8W3LGEQI2b4RIWlGC/bp4zD8nE4BovrHjucTrA8tDEIEVaoMHt9bD?=
 =?us-ascii?Q?x62qEoypmHDGdBP+W/mPcxIfsy9hVdlyJIw/4Ti5fdQWF06ltI9a1MrILYAE?=
 =?us-ascii?Q?j0MlOkhcnBynnh2UgNKSZU1HpnLnOew5MCQwTOLdIIF9EolXApdOpXVo8Z2E?=
 =?us-ascii?Q?VeBKP7M0nbYJly/Z6A9zzgarjLaEsJdKJDU1V+20OSRRX9Rw3wNy5xVEiKty?=
 =?us-ascii?Q?j6qnUzra0M/1G444FOqrLm+Xzs2LQKkkbzkrAukk+1U4W/2atGyTSTNgwcVE?=
 =?us-ascii?Q?CWzE3KBKvPvN4hZO/AynbzorfspbE8MydSV2FVthbnXA9o9SNLjVleUpQOuS?=
 =?us-ascii?Q?CF/uzJlSViy+Ad8VGJOVIFpCOF3ZSKH/zFH2OmyeoxWgr5yfr5MJFPj32ou0?=
 =?us-ascii?Q?nn77xKeUGnjtgslh6sqY9IQdDD89yUfJl59WSS3SsXoT7TXBd7hRkoVfTohP?=
 =?us-ascii?Q?WIk24/DKEoqInMCuzU+xOj951jqZFOuJG8AJZYbGKyIqHM0tSmpkZliNht4I?=
 =?us-ascii?Q?feUrK8eDScQHNaa5pVJELdVQeMaOuA1lbSebr91GKDIh0chI/jhnVGE5s2Hs?=
 =?us-ascii?Q?yE2SWbxA06EIXtuTsLU7ggfF683jFcUbnrz1FIxeiNfYWY7S6dJsBuL0gwQN?=
 =?us-ascii?Q?Jzr9sJ+rw6a/kgZmsHk7R6WIwzlimcmNM2n0ENz/L1s2WoC+M8Wn6Oe4c42C?=
 =?us-ascii?Q?96iJUexIWRH0TvQn6MGmhhu71a+651A5g0kbseIjigFDyKQSWeoMbCD57qHH?=
 =?us-ascii?Q?Zfb+a1Gp5HrEFGlqct9vMHwgdCTljjidK4UFP2/2dA1fl4UqezI1RP8xn3ik?=
 =?us-ascii?Q?/Cqb7UtaDT7MGvgxi40xpEIbtvN7VRubQVg5VAnPWn3pzKp3Kzov/P+sAgAD?=
 =?us-ascii?Q?qvyxXO/924Ys9V02/4IJyGNzAgRQuG6cl4mcV+VhkUZV+vBiHSumdZL6ICyh?=
 =?us-ascii?Q?EJok0pD3IY7prklcHm2zyec=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097b2250-45f2-4524-9847-08dc10e1fc6d
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 07:09:57.0439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TlzVIVyFki9ph9Zn/lcTMkPiUgUTi5ZnAiTix4gHxR+/fS3151R7nM8nra9nMcKqKJyfEuHy8EDsTaDLTrYmoOYvPrs7jptrxRxPpUzQw14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1133
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, keith.zhao@starfivetech.com,
 tzimmermann@suse.de, krzysztof.kozlowski+dt@linaro.org,
 dave.stevenson@raspberrypi.com, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, jack.zhu@starfivetech.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, wahrenst@gmx.net, shengyang.chen@starfivetech.com,
 quic_jesszhan@quicinc.com, changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset adds waveshare 7inch touchscreen panel support
for the StarFive JH7110 SoC.


changes since v1:
- Rebased on tag v6.7.

patch 1:
- Gave up original changing.
- Changed the commit message.
- Add compatible in panel-simple.yaml

patch 2:
- Gave up original changing.
- Changed the commit message.
- Add new mode for the panel in panel-simple.c

v1: https://patchwork.kernel.org/project/dri-devel/cover/20231124104451.44271-1-shengyang.chen@starfivetech.com/

Shengyang Chen (2):
  dt-bindings: display: panel: panel-simple: Add compatible property for
    waveshare 7inch touchscreen panel
  gpu: drm: panel: panel-simple: add new display mode for waveshare
    7inch touchscreen panel

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 28 +++++++++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.17.1

