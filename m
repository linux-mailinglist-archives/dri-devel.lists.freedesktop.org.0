Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9426390095
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 14:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E85C8990D;
	Tue, 25 May 2021 12:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DDD89AE6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 12:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ariy+oGvuo7FIK+Jao9jE+yndSKmYZek9SZ2Bxn16G4=;
 b=j3Hau/VhceybSt87h2IUvWr5RchZS4oECwa4MiNFYOHZcDa8TwGWUxUtuhOoZX8BaKmmhWgeG9yHIqmQK6Ri63nOOrBTJ3ZkKNRV2vq64rQt2/Lvw41aTFB/04orTvG5GUM8TwHFjLyQn2E5ER28XW90PsR6ERHIIV3pNH48InE=
Received: from AM6P193CA0073.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::14)
 by PAXPR04MB8656.eurprd04.prod.outlook.com (2603:10a6:102:21f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Tue, 25 May
 2021 12:08:47 +0000
Received: from VE1EUR01FT013.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::34) by AM6P193CA0073.outlook.office365.com
 (2603:10a6:209:88::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Tue, 25 May 2021 12:08:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.81.10.179)
 smtp.mailfrom=topicproducts.com; ideasonboard.com; dkim=none (message not
 signed) header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 13.81.10.179 as permitted sender) receiver=protection.outlook.com; 
 client-ip=13.81.10.179; helo=westeu13-emailsignatures-cloud.codetwo.com;
Received: from westeu13-emailsignatures-cloud.codetwo.com (13.81.10.179) by
 VE1EUR01FT013.mail.protection.outlook.com (10.152.2.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 25 May 2021 12:08:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.105)
 by westeu13-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
 (TLS12) via SMTP; Tue, 25 May 2021 12:08:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMAIC7b8X7qVSlUvxwa3sWQpyLGEzvRlvw2RLFU6qHBd6JHrt9lsqvw9+Wy5rnXRoytoegxC2sfQ1UMYpCc8cpv/Txl1q/uigMoa2y0W+d7XAM3WI6C3cP7aRuusf/3I9EGcj+FOBUAVDkR127OBIb9sNjoIU/5ZAs3QUOjfn+pX6OkRvdM+/VoM7TophNkyJXcNZ4PZjOUSl6QyAhE9zH29Y2FbDjMYRkQwhsy7U9/Ptz78crHpBsFTiOch1roTNQYTIxGiwcBTgVCPTq6BgItUkMKqqftZ9jsBj2yoCCXQlHHmreP8gsItYcDZSbYtCy5hqdCvhxyWowJu770OPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1Bj2zZp8z4YrZOLj7j/EvZAnnsZ2Ll1uB3IeYViip4=;
 b=HvwVH5HNms4R7jIIYXILAKQ8ufJb2gSOiTuGdc8dK0tlQjBN7d7eaVTqxNCOXbIq+yuVddYUpNb7OnMafcKVDGV78mfJqRvWVy1AeMEbkxxwVFSkcmPvb4AjNUApiohie7TEsoTOFrogq7sFlEtI3UkCld0B4OX3YVcIZ7pZVEFjke3OwRwJcfsRMCA2a4y2GpVNKLxbOX5uV2/ED5G9pf4YEsXVDUTN/kLHsvWsb+vXRcvSnVDlzj55UrpJlu0HUjBlKPzqpSh/otBcb4LuuWiBmu9mkNMIdzcpjUhMQhR32VGNIH1GshV+ay8zgN5caaCgtyVbf5+IiIU3ywKE4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl; 
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: ideasonboard.com; dkim=none (message not
 signed) header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DBBPR04MB7740.eurprd04.prod.outlook.com (2603:10a6:10:1ee::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Tue, 25 May
 2021 12:08:44 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::4980:418c:fea5:bed6]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::4980:418c:fea5:bed6%7]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 12:08:43 +0000
Subject: Re: [V3, 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84
 driver
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20210505100218.108024-2-marex@denx.de>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.d251689f-a6ba-486d-bfa1-070ac0c167d5@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.81349e00-3f39-4654-ab28-8c85568d0c51@emailsignatures365.codetwo.com>
 <f61c710e-cd12-f1cf-d05b-759fd2c0e8b1@topic.nl>
 <61fe258a-c89b-ffa8-2773-0e7eef35b612@denx.de>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <27f1e433-3290-c5ea-d338-83906ef10b3f@topic.nl>
Date: Tue, 25 May 2021 14:08:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <61fe258a-c89b-ffa8-2773-0e7eef35b612@denx.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR04CA0125.eurprd04.prod.outlook.com
 (2603:10a6:208:55::30) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by
 AM0PR04CA0125.eurprd04.prod.outlook.com (2603:10a6:208:55::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Tue, 25 May 2021 12:08:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e07a59a4-3517-476c-e698-08d91f75d94d
X-MS-TrafficTypeDiagnostic: DBBPR04MB7740:|PAXPR04MB8656:
X-Microsoft-Antispam-PRVS: <PAXPR04MB86560C188E96C29AAAAAE60E96259@PAXPR04MB8656.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rkfCsUhLo4aqGclP8GjCijyBOA5W2EdQYS3EkOSJDgWMS0cvij2Pxt2WmlVkOfCvK4Ll7DmAxDdjZqTuVM3ImXTva4aQ+mvRVLjWH6jiwCThOELbUNo3YG03M+cvmRvV1ys30OD/JkVxxyaebbrb7+/ftRh/dUQI4v9r6PqACi4rgPV2Fi7r2XG8Ft3kgD532ZATM56bviCe8AWQuznKrja+1QpDRvYazblTLLH+H2NtnwxWYZsPldf/LKclBf3xKHBYxby/Pg2roKxovmcIZM6tbDmHgu1G+hIStdInwmcqwEWVpUPd8P/gUWDqquZvraKOE8KXqv6xlBoq5n79xHdVOIV7hsiKq1UoX9g5EUpgK/k/7IxELHA7IuiVZ7emkpXkG+15AlaA3KU4IJMcB2FkLzRRm1XmR3KqCWYqFd6D0ypBaas/hI1Am3fprrtVcmgiUqzFqOh+dAT7JpayzN0JfitoKaSlVvkixCc5hN2V6LwA+3JM+v0Pxx/NsQYvxX7lyLh7Uob8CInbvlFYjbyN30J27pDQe9tSA3petZTNS4aw8b1P8QctXBgWPqkAdV3JKiCwXdZlhsFfVnGtw8XVLhSgrrOMKuqd83iv6f3mw+VUagOM60AVzmQy1IHKm3SYG8t1cTq+ZQ1uG4boVCqkhxrUfC513OIw11QeTqXqXk3bXCe3Os3+6k9RU9ryS8qLjinFvkuTTCnc3eZb/g==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB8PR04MB6523.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(376002)(396003)(136003)(346002)(366004)(39830400003)(2616005)(6486002)(38350700002)(5660300002)(38100700002)(186003)(54906003)(36756003)(316002)(16576012)(31696002)(53546011)(16526019)(52116002)(26005)(7416002)(42882007)(4326008)(66476007)(66946007)(2906002)(31686004)(36916002)(8676002)(8936002)(83380400001)(66556008)(478600001)(44832011)(956004)(83170400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SAdvk9ecpjADRWMhnDkB+16z65tbYqV8UA6r0qLs48NVuGD2zmE5JK78vaZK?=
 =?us-ascii?Q?qfy9l5HjkA4pdvT6dPSyLNDQ0dbFdcEr2Pfr0g1gKghUjmFEZ3C1hav9NKNh?=
 =?us-ascii?Q?t+V99scOF5/mAZoGQY0a+kJJ/58JLz5DNIWqC2xmOSbSrbmVhEZYw8inyIeV?=
 =?us-ascii?Q?AUCI9lvAUhVofMIfBjYMEi0kgSOwRvkjCGiOH2LtGjuR+lbIyYZSqYzkpuUw?=
 =?us-ascii?Q?ifXhj/sZWGBts00CwHuNJzNz2dr/T8CXPYKmDO46BoD1JlhmmlXxwKv/e3OD?=
 =?us-ascii?Q?/afugjPWNjIE1Fh+JmPugUeVvq8tH6W5zd5vaivo1z7kO/i9ggVxAXiq6TvX?=
 =?us-ascii?Q?FwA8CW26rcY9DInUHKsn/oDJ4AHKSkGnTMnpv6ywLnUsuYTOnucQYVs+KyIF?=
 =?us-ascii?Q?EP080SBM5GyhRAbB3RwqCKhx0IV5Mbe8Ag/ga4WR3OrMEhzf4Wat5xuWBdhQ?=
 =?us-ascii?Q?/qSONTPUyx73NYEQgYvZ/MTOUVQjvNUAhortH7rLbnNnHQongAhd4gUYVGgb?=
 =?us-ascii?Q?v54lCqEP6adz/4F3XI5MVWyRrUZ+m4BFCSN+iJTqTveSaqHi6SY2VGWsMqo9?=
 =?us-ascii?Q?xesTp95bUzRois6fYVM6oW/kYMFFuTaqVsiIKVumGZtDyckPYGhTC2VVqRls?=
 =?us-ascii?Q?/gSqzivEJONQwcpVZ9xjnaT8nDgkJRrvu8MSkCUa6GZB0NSuFhXn9YQBvQmn?=
 =?us-ascii?Q?NMYuWlnlijmgd/p421vPS3nzhULuzeP3uRI171Gn+KZrfjHWrPrDQPPgSBfN?=
 =?us-ascii?Q?YumdNEhaQL12f1BdAGkcN4pYp4ue9XGTwkm3z4cMYpK5RWv0QnaQYoal5aXF?=
 =?us-ascii?Q?C5lVS8p/Lq3cu6ClIzP2rP2qr9RtVPhM9YWREnTgxuSLpb7xZaNKXEzz1Qur?=
 =?us-ascii?Q?6JcmbBzpt8V73OW2YErmzAQo055D6Tzv0JW4tiurg1UC4m69vHd3IK3gNfyi?=
 =?us-ascii?Q?vKkxEvUNpQohCI5BRZniRGllbDYj7e3gp4LUDrAzXq2Mi7YIT4LUiBPSMmLT?=
 =?us-ascii?Q?Xkgp3+EmIcpsNopX/sK7ddCSQT2VBWmPdKKvXAKzyQ3HV8kKenEkp84Y6Rw2?=
 =?us-ascii?Q?oi2kaq+8liACPzD1HrBx4XUjhlQ6GlBJSPBTkBQJ0Xji9MGCiM2NdYdBsemH?=
 =?us-ascii?Q?8GYEWdhUT0L5SNN42hmta+SpojAIIB4GLZy+YzCluhwc00FII5L43HXt74Wd?=
 =?us-ascii?Q?LECSSCHeq7jkboDJatCZmknzNXrLLP9E4MsqW+93T/jK7kMdniwk/10TCPwC?=
 =?us-ascii?Q?xmVtGCmkccCm+ucOi2fqfLKcpbIkEUXb2zge1rNbcMTcF3cHlqPrnzaQ4QQ5?=
 =?us-ascii?Q?YFyrBf74G5kX7kzHACqmuFYo?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7740
X-CodeTwo-MessageID: 2a5278d0-94f2-459c-b27f-5910b857c626.20210525120844@westeu13-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR01FT013.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: bf7725c1-cb4e-4fe8-d077-08d91f75d777
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EmU10AeqMOgeE2QqT2BQMVeWH3dveRP6dWv0mcpciiWzQGDiKYeMFV1BzFIZxbR6Hkh1T417PW0Rppu+Smq4kCrN3xbsyQWHcjUv0qphjsW6TO/WQlURFzDGlHNidzVcxNujewLePa4CkNwhtvAMoTZTYfHTRwaVNTjkh3XCtXKSE0E9hyJH2LBoqqJuSByI6o+xsKGRhPYc5WFkPp7UaoDmRDmn8Cck5JB6f8gZwpowPzOAS+NavfYxsc/3nYsHR+zdWtljEtmsNJH4+jSlJVnwzSkahKOUtEbCqWbyCs6m+jmqg6nPNaZywh2Yp0MGShFJAD5LpoiT6+o8kgQ+ODuxXcrO914JnSmjZNdyIsS2BMkwAxav/JtAS11BZEK6adygppo71Z14vnlHKPni5s2475mnI6aH4jNmZSlKQGOe12AQkL41x/lOpYAJ+RQgSA8ku2lB1rgr2w4E8UxnUKQSJ+OBr4RdkQYVpbHCjtRcnIvLqugwwC7TqJc7KCDcKG79DIT0XRlZBm37qxJmaReo41i1jf4ZLyetKyuQad183J8LmsLTkdauNQUPnakSkUIl8WC9Sm+8psA9IHToPIRoj72yL4dLovGyk6tCeGe0HpwYUaLeHnduwiKpkkhpOV0YtKu95YShEO9jbnP7O7sZ1qpF9avs1KI+QlF4wZhGQlsAItqMmPldxXkr2KAEq+7ZKg0uY1tGaF2sqpx+J9A7DxFjFxzyOXTPLYnkGvX/PqqnnP4cjuB11pPQROviOBp/ZvgOgzytueMAHm8JVj7iSiSf4jgVlSrgKHPB3oCQCjTv/+nbuVUzL9a4pGBS
X-Forefront-Antispam-Report: CIP:13.81.10.179; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu13-emailsignatures-cloud.codetwo.com;
 PTR:westeu13-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(346002)(376002)(396003)(39830400003)(136003)(46966006)(36840700001)(31686004)(7596003)(70586007)(70206006)(7636003)(356005)(83170400001)(36916002)(956004)(44832011)(336012)(54906003)(186003)(6486002)(16526019)(4326008)(8676002)(83380400001)(42882007)(16576012)(478600001)(2616005)(8936002)(316002)(53546011)(31696002)(7416002)(26005)(5660300002)(2906002)(82310400003)(36860700001)(47076005)(15974865002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 12:08:46.3343 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e07a59a4-3517-476c-e698-08d91f75d94d
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.81.10.179];
 Helo=[westeu13-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT013.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8656
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
Cc: Loic Poulain <loic.poulain@linaro.org>, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

See below...


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topicproducts.com=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
On 25-05-2021 12:53, Marek Vasut wrote:
> On 5/17/21 3:23 PM, Mike Looijmans wrote:
>
> Which system/soc are you testing this on ?

On a raspberry-pi 4 at the moment.

>
> [...]
>
>>> +static void sn65dsi83_pre_enable(struct drm_bridge *bridge)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridg=
e);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Reset the chip, pull EN line low for t_rese=
t=3D10ms,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * then high for t_en=3D1ms.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 regcache_mark_dirty(ctx->regmap);
>>> +=C2=A0=C2=A0=C2=A0 gpiod_set_value(ctx->enable_gpio, 0);
>>> +=C2=A0=C2=A0=C2=A0 usleep_range(10000, 11000);
>>> +=C2=A0=C2=A0=C2=A0 gpiod_set_value(ctx->enable_gpio, 1);
>>> +=C2=A0=C2=A0=C2=A0 usleep_range(1000, 1100);
>> Taking the chip out of reset here is not needed and may even disrupt=20
>> things, as the DSI hasn't set up anything yet so the clock may not be=20
>> running. I'd move this all into enable and get rid of the pre_enable=20
>> call. Similar for post_disable.
>
> I am still waiting for someone to confirm the behavior of the DSI=20
> clock and data lanes in pre_enable/enable() . The datasheet says the=20
> HS clock have to be running and data lanes must be in LP state during=20
> init, but I don't think that is guaranteed currently in either=20
> pre_enable or enable.

Neither is suited. pre-enable may have nothing, while enable has the=20
data lanes sending video according to the docs. So on many systems=20
either this driver or the DSI driver will need changes to make it work=20
properly.

On the raspberrypi, the DSI has the clock running in pre-enable, hence=20
putting everything in pre-enable instead of in enable makes the chip work.

Alternatively, one can modify the RPi DSI code to start sending data=20
after the enable calls. That also works on my setup, with everything in=20
enable.

The major point here is that you should pick one and only one callback:=20
pre-enable or enable. The GPIO reset code as well as writing the=20
registers should be done in that one method.

Same for (post)disable for symmetry. There's no point keeping the chip=20
awake after a disable.


It's pretty likely for a DSI driver to have the clock active in order to=20
allow the panel driver to send MIPI commands and things like that. So=20
everything in pre_enable makes sense.

I don't know how the platform you're testing on is behaving in this respect=
?


>
> [...]
>
>>> +static void sn65dsi83_enable(struct drm_bridge *bridge)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridg=
e);
>>> +=C2=A0=C2=A0=C2=A0 unsigned int pval;
>>> +=C2=A0=C2=A0=C2=A0 u16 val;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Clear reset, disable PLL */
>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
>> Writing 0 to the RESET register is a no-op. Has no effect whatsoever,=20
>> just wasting time and code.
>
> I would rather keep it to make sure the register is initialized.

Why? It's marked "volatile" so the regmap cache will not touch it. On=20
the I2C level, there's absolutely no reason to do this.

>
>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Reference clock derived from DSI link clock. */
>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
>>> + REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx)) |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_RC_LVDS_PLL_HS_CLK_SRC_=
DPHY);
>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_DSI_CLK,
>>> + REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_RC_DSI_CLK,
>>> + REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Set number of DSI lanes and LVDS link config. */
>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_DSI_LANE,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_DSI_LANE_LVDS_LINK_CFG_=
DUAL |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_DSI_LANE_CHA_DSI_LANES(=
~(ctx->dsi_lanes - 1)) |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* CHB is DSI85-only, set t=
o default on DSI83/DSI84 */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_DSI_LANE_CHB_DSI_LANES(=
3));
>>> +=C2=A0=C2=A0=C2=A0 /* No equalization. */
>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_DSI_EQ, 0x00);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* RGB888 is the only format supported so far. */
>>> +=C2=A0=C2=A0=C2=A0 val =3D (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC ?
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_LVDS_=
FMT_HS_NEG_POLARITY : 0) |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ctx->mode.flag=
s & DRM_MODE_FLAG_NVSYNC ?
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_LVDS_=
FMT_VS_NEG_POLARITY : 0) |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_LVDS_FMT_CH=
A_24BPP_MODE;
>>> +=C2=A0=C2=A0=C2=A0 if (ctx->lvds_dual_link)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D REG_LVDS_FMT_CHB_2=
4BPP_MODE;
>>> +=C2=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D REG_LVDS_FMT_LVDS_=
LINK_CFG;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_LVDS_FMT, val);
>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x05);
>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_LVDS_LANE,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ctx->lvds_dual_link_even_o=
dd_swap ?
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_LVDS_LANE_EVEN_OD=
D_SWAP : 0) |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_LVDS_LANE_CHA_LVDS_TERM=
 |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_LVDS_LANE_CHB_LVDS_TERM=
);
>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 regmap_bulk_write(ctx->regmap, REG_VID_CHA_ACTIVE_L=
INE_LENGTH_LOW,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &ctx->mode.hdisplay, 2);
>>
>> I think this ignores the endian format of the data. So this would=20
>> only work on little-endian systems, right?
>
> Likely, can you double-check that ?
> Some cpu_to_le16() could help here then.

I'd add a small helper function that does the endian conversion and=20
register write, e.g.

static int sn65dsi83_write16bit(struct sn65dsi83 *ctx, unsigned int reg,=20
u16 value)


>>> +=C2=A0=C2=A0=C2=A0 regmap_bulk_write(ctx->regmap,=20
>>> REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &ctx->mode.vdisplay, 2);
>>> +=C2=A0=C2=A0=C2=A0 val =3D 32 + 1;=C2=A0=C2=A0=C2=A0 /* 32 + 1 pixel c=
lock to ensure proper=20
>>> operation */
>>> +=C2=A0=C2=A0=C2=A0 regmap_bulk_write(ctx->regmap, REG_VID_CHA_SYNC_DEL=
AY_LOW,=20
>>> &val, 2);
>>> +=C2=A0=C2=A0=C2=A0 val =3D ctx->mode.hsync_end - ctx->mode.hsync_start=
;
>
> [...]


--=20
Mike Looijmans

