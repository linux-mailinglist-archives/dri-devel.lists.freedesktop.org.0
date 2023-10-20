Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765227D10EC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 15:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D34910E5B5;
	Fri, 20 Oct 2023 13:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2081.outbound.protection.outlook.com [40.107.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E7210E5B9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 13:55:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eR/z2W85Sru0go5IHajwh0MryfZCzR1NhlaDIyPjVJqtey/A09DtoU2szBRKrD8mk64xzSSpIrZIdnPqm6kopTH0BEzZWtE0i9/XLNA1sXvwNb8hi0nSKuY+NLBJox++8wXaUQOm0L+0kILJlb3n/gJ8N62xcM2HZ8qzA4MPjyUt2ddeuJCm8bYJnUPGSRZk2HOSL76fnj7SStDyvQ0YVV5zQflLCqk0R4LVI63f6OG2+qoOIwtNLplB3MKqTo+GJKc/htMUu6K/26XsoE+wLiH87G9vtex2qMQMROzWIyK9Gy2ruk5qx20b6TULRmyvVpafVlAJ1Lki1EMqW2vySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LL5ABtSNgLi+dQc5aNO33BNZWlRE7efVTD/efBxKMJA=;
 b=A8iNCisvXO3q8aJ6wgVsFqrkdEmB9Ewmu8eOFOjtpyHNn4jN4lKqhtW/A/aIRLmjJHPtARYTGkuNhS9eb7NnM8R7g0eLt3w5uAI9EdvCObecVZpJpECKPK81hvOhssyKzLBCLuoCzpGnqmx5mNyzHAbddgYsKKzM/056I0XKBhwpKHJ6qkzR5aV/r1uyfAOty0ID1GRt4FEzaO4sXnDdaMIzV5Nb21yuOOzzkOFJUCYFHf5QxEL8OKi9FsZZRAsUMjV9uGUwuzaRJIP8F8AeOuA69R/wLdgc/6/k9Y01JhukJPoKQM1meUoCEUW1VGRSdvq+rUs0ouZ4TxQWHR8mtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LL5ABtSNgLi+dQc5aNO33BNZWlRE7efVTD/efBxKMJA=;
 b=U+u5LeHcAj/U/tJMRFnYGpwH1QPP/y+Ee7ehj1CLcldMCo8W9WnT4TivcN6e67CfZfUbINYG2glh9//Xf/j5F3NjzxVOi8cbosWntxnutQjNbME6HKUNKwdPXRvFG7fQ7c2j1ASb8t0fVntYShqH6VuRKdpxkTYeEVnKe1mBAzI=
Received: from DB9PR06CA0001.eurprd06.prod.outlook.com (2603:10a6:10:1db::6)
 by DU0PR01MB10283.eurprd01.prod.exchangelabs.com (2603:10a6:10:323::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.16; Fri, 20 Oct
 2023 13:55:03 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::e2) by DB9PR06CA0001.outlook.office365.com
 (2603:10a6:10:1db::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24 via Frontend
 Transport; Fri, 20 Oct 2023 13:55:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.24 via Frontend Transport; Fri, 20 Oct 2023 13:55:03 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Fri, 20 Oct 2023 15:55:02 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 0/1] dt-bindings: backlight: mp3309c: remove two required
 properties
Date: Fri, 20 Oct 2023 15:54:32 +0200
Message-Id: <20231020135434.2598578-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Oct 2023 13:55:02.0812 (UTC)
 FILETIME=[05FC65C0:01DA035D]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|DU0PR01MB10283:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 85acf0fb-cb88-43ea-5880-08dbd17428e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PdDaQt3VaTktGXviICuX5/WWJr0vPku4nFZ3HTO1h0FNICNynrA+91mQvDdichPBy1rAPm1dQCbctJ6G5ypwdtSr/6MluPFnZoa0Gc1h1RRonXbQEWMdvteZw/e2f33I/3aQ8hUl+sInInUBOqmWZ2V/0NLgyk1q6Fs3Bt8QLdjOVMdbeqaHOsjuTlwKGtDYlxpyxfroRjQ5iVLoRMQBKW4g7mv3WNd5VM7Hyn8XyqK21tUbejnCcExrOuwXGF50HODkpWkUq7FK/l1Orvl0HGUeJdhhDYS4mauFlD+AuXLgfcHZBy+RFg78HHt2zO2MwUMpT4I+9InvQa/TYU250zMOciM1tGVPVakVawYJzWsjXxBQ3cxbCnQ9nMB7ElBHJ6XFV4SRukQQqQeEZPuZ9qvYRj8FWwB6cN/x1fMg4BPN3V2eK7KOHRGwP49FTqbdXoCpxWkF/gaZsPoJc+GVjGn/sAAxS9C/NbLjShosUhk8PpHP9oS5IGKxDEqDe3eN4P4U8nZAZyffGnfQ06FHSjIm04q4GqW7NCMjUT0MRL3y9Ahtgoc/Azo+PxJoVAs9y74l33ZyXkl8qL3UnsnOVhaTKyrRhrBGcuJVj0p3kviZvk/qND0JyiPZwwCMDU3cmSOYkSqDJg56fOANAFHrUZfJbznv8LEkZ3/lqEpQssaTZIDewXYtbqaDRUV02AQO9oeFOvU81UhKsCt2u2+L/3pZsXVm4PhIUgITlfLrI6SiE1gdnLhtdNh8OyurLw84
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(396003)(39850400004)(346002)(376002)(136003)(230922051799003)(451199024)(82310400011)(1800799009)(186009)(64100799003)(36840700001)(46966006)(8936002)(36756003)(86362001)(4326008)(82740400003)(47076005)(83380400001)(36860700001)(81166007)(6666004)(107886003)(70586007)(336012)(26005)(1076003)(2616005)(41300700001)(356005)(316002)(70206006)(8676002)(5660300002)(110136005)(2906002)(4744005)(478600001)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 13:55:03.4534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85acf0fb-cb88-43ea-5880-08dbd17428e8
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB10283
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Flavio Suligoi <f.suligoi@asem.it>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch remove the following two not-required properties from the
"required" section:

- max-brightness
- default brightness

Other changes:

- improve the backlight working mode descripion in the "description"
  section
- update the example, removing the "max-brightness" and introducing the
  "brightess-levels" property

Note: the "brightess-levels" property is present in the last version of the
      common.yaml file, so it is not decalared here.
      For this last version see my patch:
      
[1/1] dt-bindings: backlight: add brightness-levels related common
 properties
commit: d5272d39995f4150062a67e6f2cef556edece740

Flavio Suligoi (1):
  dt-bindings: backlight: mp3309c: remove two required properties

 .../bindings/leds/backlight/mps,mp3309c.yaml           | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

-- 
2.34.1

