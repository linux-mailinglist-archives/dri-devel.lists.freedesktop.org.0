Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44162B175C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925A76E46B;
	Fri, 13 Nov 2020 08:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2122.outbound.protection.outlook.com [40.107.223.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0778D6E323
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 02:37:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQMD0+wyDqptNlU5vkuAb6pvTANVr5mKRcRhJoqvnorYLiNLzqLOHd+05LIaIBVlfcYheWnz8muH/g+q/V+oYXnocuE516halv4uLljh+U/IebpGibpwa+sPl4eJztP+xc+Q+6rMX8zMrI9dg3hKRZ4fTMGaUQ3ReYVXzoMR8MwbL/ATNBfOfogFFIUcqDSes8NuX0fRHTYJq+6pKi60yE8zOaXKM2AmeuaUfTix61dX+5UrvnA4KwgAOLgz7PbECA1fUpHPiWJIuz3UXNy64FbR7iDNnYowzeG9zOxAGanMt8WO6v9IhHYbJ48gDIk05hQaACJtXpLMO30MgMX/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V60Ver04efl+GXHzvP1SPQuH6bGqk4zoRTtIQmVequM=;
 b=EyHaequZVGEzUzEBZ9nX3KeAPNJ/eSv9LyJvKvXtuEP4AZpDh2Bdbory0fRWUE/qRPdS9MgPLfjwmjzIDTjpVZSAXohjibnzyp+T9VbKVgHK+6fgeY/jgYg9Ocpish8PEC1qklJYbeMqFQ6ChFr7UYa/UxodTA8t6fTjbhGRIrcvde1c7MrUAVEonfPzIFboKxQnW1HtxkOLsJhFbgwj8WJ7PEraMcOr7l33JvlRzqLQoAkds1Cp/Jd0iDrhCe1MAfJPma3Mo4yyHlQT6DNHfpKTGdXVTfDoJYF5+Yp4uUaAAGGFeKCml5j8svISbfs1F5zcD1j7dK4qjJNW1C3l/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V60Ver04efl+GXHzvP1SPQuH6bGqk4zoRTtIQmVequM=;
 b=1RYnVy8o2XfQ9Y4zAmh+BaGjjD4ttmZDqLyZNOqO4kdILAaQQkuu1KkQ8vIxMs1I+TdPaHUZu6Nnu9ZtFTTq4hClAK1xx2xmhu4Wi0C8/1i6dIv+nyvjaIaeO5wCERk/pAcVuJ3on2K0Sm7TLFgKmdvp0Tt+2E9OTBaOlafNl34=
Authentication-Results: siol.net; dkim=none (message not signed)
 header.d=none;siol.net; dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6802.namprd04.prod.outlook.com (2603:10b6:a03:22d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 02:37:00 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::c9f2:c0c7:45c3:6cfb]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::c9f2:c0c7:45c3:6cfb%7]) with mapi id 15.20.3564.025; Fri, 13 Nov 2020
 02:37:00 +0000
Date: Fri, 13 Nov 2020 10:36:52 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: anx7625: Add power supplies
Message-ID: <20201113023652.GB1948@pc-user>
References: <20201112083704.1173908-1-hsinyi@chromium.org>
Content-Disposition: inline
In-Reply-To: <20201112083704.1173908-1-hsinyi@chromium.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [114.247.245.146]
X-ClientProxiedBy: HKAPR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:203:d0::16) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (114.247.245.146) by
 HKAPR04CA0006.apcprd04.prod.outlook.com (2603:1096:203:d0::16) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3564.25 via Frontend Transport; Fri, 13 Nov 2020 02:37:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6f03d55-21fa-41e7-dd72-08d8877cff81
X-MS-TrafficTypeDiagnostic: BY5PR04MB6802:
X-Microsoft-Antispam-PRVS: <BY5PR04MB68024E53AF5FA1667E78968BC7E60@BY5PR04MB6802.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p8Uu93honlrJdnBiYkpD0Y6L7N6ygBNcgRHMxlCsGGLKyQm+mlJSIE45MvGdZu4lDmz3sB+1771Mdv5f8aNOKkrU6BT7VvRGxosr23yPDeAXdhb0p0ZQr6Sb+JBUqHYsgU/HLSmIkNOo83UXFTXiGbgLWTlYg6evXm6mx+D+szfjSIirtWaCCMNegZBkYYY2jDME0TCINLHF04t+ZOim1hcHHiiUYAsKOnR8tisZpGVndgoXMXZfnM3u04GGxrOusus7iH/9q9YXbigy1NofCPAIbjcczPnSKlbVUwFLuj3NbjxX0I4YSeSfwASrvk56PMlfwLIzl1p6qMcH7lZdFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39840400004)(376002)(346002)(396003)(366004)(5660300002)(1076003)(8936002)(6666004)(66556008)(316002)(4326008)(478600001)(4744005)(55016002)(8676002)(16526019)(2906002)(54906003)(52116002)(110136005)(186003)(66476007)(86362001)(7416002)(66946007)(6496006)(33716001)(33656002)(26005)(9686003)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: akPcdxUVJvczCSNxeUukE7YVG0kWkkpcG/E0lm+vSJrPlTyQRPNZ5PWOO2n45gw3V1lOLAfpXBiPuUKtw1cvIaC6gCxrI5/RSN28kqPy/7/f3ZFufH7+Qa8vud+/E/8C+k5ZM0iOSMbJW72K9fswK18AGjm7UQNkFyaFQmjYagm0G/piVQst/nU6MfMeOaOvCJbPtIpDRQGI38PVwyzdrktEqXm12chIWBMvcxILRVg3/u3kXYty76E+OXuRnOljHLrWIjvCBf1U3o4o8JW3kiwGOVjoRvNcwIbTyPiakn5RqH3yrCMnZDmBFPuMPsJZWWkyrciRjdcG1zK9IG0voKcxSKL5M5QPrYGhPBikuwyaNZ7J84vs1VfqCN9qn+4qiKr9SrJfrrzs+kxbU0r+StqG8MpxYoV4uf8s5U+x1mXcXh06sXKdUwd1FH3pGSgjvZ10MbOwbW8S0d2GaDbCWVV5RStDAMPJNyvmJs68dQT41sTJPCLJt9gYJ/wkjp85bHo2rxGtt5gXeS+meUfqgzWfCKUyxW7LFieFuVwXc+tywashdSmnlJ1fcvnHw/kxm8LxQCv5Whs+7KNLYBsVPnJxCxU7yysAEs2SrvXERlQxuKWd0llo8f1jThdf/CfSpF1YzDVq/TXh1R0yCE05Wa69025bzNN1v4w/k2UVDJvVdOq0dY0RwMU8fMVuPfRjFEAHcae/+a3dGGKDa7ykHTcDdeCZdAQaMOlyEBsj2pvGlMzFPotPeTYUy790pDEw+aiID1AucJA//k0qN5uYcjvoLqGpECi1ZETuOc9xPVt+1exvAOuZdZ2Gk5bM2pnnRXJlGH/FubVM64o2MAHwCx+E0/QA436Lt1EOHpnXVxFkHQ7wgSoxy4CBaWXuFGF5Qwn2zFDubLirklPDg6SsCw==
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f03d55-21fa-41e7-dd72-08d8877cff81
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 02:37:00.6983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywF92DfE13XbkEV1NjWxQSk0mUmR6gy4Eq0wx0OVxHq4/uHhpqlk+pNQlJxBmEzNwjs1iCA2prI8JLCGkQZncg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6802
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 12, 2020 at 04:37:03PM +0800, Hsin-Yi Wang wrote:
> anx7625 requires 3 power supply regulators.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  .../display/bridge/analogix,anx7625.yaml       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Xin Ji <xji@analogixsemi.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
