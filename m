Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30541B9854
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 09:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D9389D5E;
	Mon, 27 Apr 2020 07:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750109.outbound.protection.outlook.com [40.107.75.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D4E89B03
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 06:17:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3f1TqztJ7qdzvktdu8ecqEWQTkbk2lJJ77/CwxHCZX6t7M6PGNutfUwTTDSVoUB4gFTzMaPh+P+ilek9OQQYfTVQQwJlMnCuHvS1jHyMB8NUHqCX4Ix1ujGtfsoMdC68N/pRJ/czw8txSJYIea7ckVWarE5XBjOsKDceYFKDkpKVFwwV0z2KAMZFntGeesIsbi0LEFirk9hMhvJXj9jmrdG7O7f8jB8PjcW0oSJUMPUbVf4JUQ0KeqBkru8iGOno5UKoVheCrmXCVq2fzH0z0WvwfUSx3ogEaASvT0JU9KI4qshX0z1G1YTaCwFs2+4wy6mCEjN/LdSEDShKY8wYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1vEZx+ii7oiAmIQAPtzDrPHycucDeLrHLIwYEbM2PM=;
 b=b62GeAZN9IOLtxkj64uVUExxQbUJ5sI6BmT9XtM0Su2h6ZWIkCyN8HwvIHyrUvyRob2ZVEDgg5rEiIx3XvDJz3B2JQFDDyEP0L/lVauwFTVHj4ejeRtZCkytQ5QpSXaIbcS23JL+igkdZd1+L2qVpHstwP8HKCjtA/Y71YuUR6Jk+7iO9TcaOIJYEaSQFMVFVzhRC+GxEzYsdpD2CKnstZvAyUWHrtj5qhGCKkcKY/XLwQdVxWVFUwdgl7FmwXi16AN/cSTAN/JsR24ULozcx7jbI+J2UACwymbwXzU4WlRJBeBfODW0r4MokuhcVTLcGzAAty06hPQ2JS/IC6zVhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1vEZx+ii7oiAmIQAPtzDrPHycucDeLrHLIwYEbM2PM=;
 b=XrY2LCS6GfA/L1T5ZnsV4z5y9krDBoQe0qRkifPycopfTUYIRGiHKvXorCgs8QovP7uYRbmPYRsy73lBsPfL7s9g7w6YNxCliNUAquHF09lQXceA8clWQhrBQPfvfUK47b9U0v17Q77PGqqWN4GNuLFycrHID1oMKP9rWOwXsBk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=xji@analogixsemi.com; 
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6518.namprd04.prod.outlook.com (2603:10b6:a03:1d4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Mon, 27 Apr
 2020 06:16:58 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f%6]) with mapi id 15.20.2937.023; Mon, 27 Apr 2020
 06:16:58 +0000
Date: Mon, 27 Apr 2020 14:16:49 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nicolas Boichat <drinkcat@google.com>
Subject: [PATCH v8 0/2] Add initial support for slimport anx7625
Message-ID: <cover.1587880280.git.xji@analogixsemi.com>
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK0PR01CA0068.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::32) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK0PR01CA0068.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::32) with
 Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.2937.13 via Frontend
 Transport; Mon, 27 Apr 2020 06:16:57 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d9987d7-da09-4710-1d6c-08d7ea7296e2
X-MS-TrafficTypeDiagnostic: BY5PR04MB6518:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB65181628BA1065A5C29816F1C7AF0@BY5PR04MB6518.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0386B406AA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(376002)(136003)(346002)(39840400004)(396003)(6486002)(81156014)(8936002)(5660300002)(36756003)(8676002)(26005)(2906002)(6496006)(52116002)(110136005)(54906003)(66476007)(66556008)(66946007)(956004)(2616005)(7416002)(6666004)(4326008)(186003)(16526019)(478600001)(316002)(86362001)(107886003);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6r37cKsqOBSADQm3oRKxMO4TFzmoaBSy3HIJMItwLBiLYRiravaJuWsH3lBoj+kL+9pAEZw9P/btBs1ZT73AFD18L8NZfhQktv6//V8cg+6DE6IsoEwm1Q2pQ3H/MH3hPpheU+Pe0CIUE51ERaaeel9v+cGWgCTS0LpfpHd0Q+vJ/QOctbZA4zXoj9DqOyDhl6rwy/YXDKY9OvOdyn3Fj2Axz2t8kaqJJOiKmW/A2nwfMXdjsll401tDXGUA6gBRLJSty54ZPdglXXdLesocGwzIb8WHAmC41pFsY9DF/64qhDo2JNOS0wGJIWnp2WRO3ryu83D7J8keqORFrBoTbOBYcKbJV3Y9BV+Xk7JxLpD81FNHDW7UKgx99vlXPsfSQlvJd9cQiVoMH6XWJn3APXxtnQhp3HUTpLcN03IkZ72cA3qhbl5MDlxMb3u/9XAD
X-MS-Exchange-AntiSpam-MessageData: okjFoQJuHGc3/j0K6wILkYRH3rpIwO7NtmGqjWPZxQ5J5AA4Al2MTtUuU1Eiz8rWpFUxdQqtv+tNbZsNddR2yZHWDpyQN9hhn1ZbeEix8pthb7WvzRcgtEsfzbzmEBDTNO0WOgkpQOAwm+FIxuCKppjITEg/rafoEFa+vKkxm3GSkfZ/EAmXygdjy3zVMh5CmznymFT+nOGaIMWZZ/0xZ1s1NxPO2O7PHTHAe9mPFtTmDhHP0c5Eh4G5WYMiWp7+PXkX+GPiCKCmWapSEHTeeGHg5LTCLbmTFNi/m6w/rAtb8UolMQbURIbBL3wbe230hHGyu9Ee9bpYpwxUhLruVxWMPtZAMIqfSZiFD+z8TlyY+D7eANbZ3To2vT+7+UmnPg7nd5nL7BZ4FPpy0WrGDwhyfmUsjJRHucr6RhOnv7W4Ty1bQsP+KDDaJc8v8HBAiDkBeui5nzzEJqpWT04DTA2HGBU9Ey17rqXiT50DWuCblpCnL4koPU6cq2vPkQZh76LFoWlIxwIEkB2Sf73cOLp3P5T6JCiL6ymttAsUvxGH8deF8dcjGGY6iSdzDbArnB6wfMrieDdgZBbYRTyFXXc9DQi2oo0PFlRvbTEoC6r4gIJZtBe7hzz3r+BbtCKFD1U/6RpLie0u5AJiyLP4B4NcLT+KOHuPkvMz88nyF7bHHrLbl4Xj+14V9HOhbYaOsCBIR3GJhuzdeNETm98MUG20o76ZgnDhfiFEQDSWOieg2YjXxoWodrCx+Mku5m20MPhEwzCO5DMiZjTdtyPAy9Mm12yEOCSM3Q2apkJ5tAb01bbw+08JIfIQ3EhCKQD/
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9987d7-da09-4710-1d6c-08d7ea7296e2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2020 06:16:57.8391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1P2Vfr6OvtDR/Im5DrRd9+iY4glaLTb2lhPlh03BXjJTrhSl6dLOLP5y9ZA4xN8ExPT/PdU1mdkhvNaHMF3VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6518
X-Mailman-Approved-At: Mon, 27 Apr 2020 07:21:44 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sheng Pan <span@analogixsemi.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

The following series add support for the Slimport ANX7625 transmitter, a
ultra-low power Full-HD 4K MIPI to DP transmitter designed for portable device.

This is the v8 version, any mistakes, please let me know, I will fix it in
the next series. This series fix several coding format and description.

Thanks,
Xin



Xin Ji (2):
  dt-bindings: drm/bridge: anx7625: MIPI to DP transmitter binding
  drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP bridge driver

 .../bindings/display/bridge/anx7625.yaml           |   91 +
 drivers/gpu/drm/bridge/Makefile                    |    2 +-
 drivers/gpu/drm/bridge/analogix/Kconfig            |    6 +
 drivers/gpu/drm/bridge/analogix/Makefile           |    1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 2158 ++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  410 ++++
 6 files changed, 2667 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7625.yaml
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
