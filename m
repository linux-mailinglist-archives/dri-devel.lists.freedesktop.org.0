Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBF63903D7
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 16:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBF16E159;
	Tue, 25 May 2021 14:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10047.outbound.protection.outlook.com [40.107.1.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D856E159
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 14:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzoOh82YjSjoHNah4+9mkdRj9R7q/ECkMT5RI9yI6Ec=;
 b=ALs3TY2ha0finfyz92JgN8nuyTDqHpQtuk9IC0//O9w8Dev13CFPYfLrSc7k0PqQXNywlhtX86EQAzMd1UK0XULfg/TDBIe/Wgtjd+cuhPVTI2gzgQHLQvs4Z1n5qCLxNuxZ2D+7DkOMj669nNz6s29IW7Byk7lBZQ0MkVbF4Y0=
Received: from AM6PR08CA0013.eurprd08.prod.outlook.com (2603:10a6:20b:b2::25)
 by AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Tue, 25 May
 2021 14:23:49 +0000
Received: from VE1EUR01FT055.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::fe) by AM6PR08CA0013.outlook.office365.com
 (2603:10a6:20b:b2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26 via Frontend
 Transport; Tue, 25 May 2021 14:23:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.81.10.179)
 smtp.mailfrom=topicproducts.com; ideasonboard.com; dkim=none (message not
 signed) header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 13.81.10.179 as permitted sender) receiver=protection.outlook.com; 
 client-ip=13.81.10.179; helo=westeu13-emailsignatures-cloud.codetwo.com;
Received: from westeu13-emailsignatures-cloud.codetwo.com (13.81.10.179) by
 VE1EUR01FT055.mail.protection.outlook.com (10.152.3.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 25 May 2021 14:23:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (104.47.14.57) by
 westeu13-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Tue, 25 May 2021 14:23:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9Jt8yQZ6P1baS4BFseWcABW2pLJL0fkXI/vm+MY6aWhiNz71tYTsc1weLqPxc0tQFPfFK7lqU/dr0rGl16olsVykY1tUlXTTicZN/9b/5aXNPWfKSkyVV7hQ2LnRu81P5w5e1wV7xKFB/c1kTo+YF1Hhf/wavBMQUpY1X/RK/+qJhTZAwgZvLe4I3eMsfeq+rNWCO/HnMcTsjW+PgycXLOF9OUYXLbO0QShXTPhizyaPasI46H6EPfIMdN95HfIeiQSPFF8WwdsTb+Mh9YN+uLAgq4s7nxaeAtakQaivs8ZkKj85IqvvMoMnQamgb7JOoI4+lur02j+b83JZQH1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hI3/GYiMKquTVVugdFgl6SdVKGBZM2dzw2hDYnV1wfA=;
 b=odkBjhgp86nBC5W/NKwPb/y+ZNwpMbR+lQVWB2WkSdGkt1FNWgp7wgDQgci2pJIPJHx8oROBsQUmEqawkaEjxlnKvjUx+d8CugLH8qkttsyLw3CM/v7oJY8WNu3Pg6HG2bC2p7YR+VYd2CnU6N+CWsRMw4a68oUSN0pwGmkcW/RtTphjf3iV6u0xk8DUBCVk5iiKImxpZd3Tly5E+2TFZlaYr0CjHm2VkXvVf3kcpeHkGRYSwGQwlqKiCb4lF0eNQWQqzfryS0Bb7gcGbEKMU66gVaBfsCep9UnPP4mBUpaHbYihrhHrCl2PlRp1EdYpowOOvN3tR/kicnto6RfGbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl; 
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: ideasonboard.com; dkim=none (message not
 signed) header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DBBPR04MB7978.eurprd04.prod.outlook.com (2603:10a6:10:1e9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Tue, 25 May
 2021 14:23:44 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::4980:418c:fea5:bed6]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::4980:418c:fea5:bed6%7]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 14:23:44 +0000
Subject: Re: [V3, 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84
 driver
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20210505100218.108024-2-marex@denx.de>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.d251689f-a6ba-486d-bfa1-070ac0c167d5@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.81349e00-3f39-4654-ab28-8c85568d0c51@emailsignatures365.codetwo.com>
 <f61c710e-cd12-f1cf-d05b-759fd2c0e8b1@topic.nl>
 <61fe258a-c89b-ffa8-2773-0e7eef35b612@denx.de>
 <27f1e433-3290-c5ea-d338-83906ef10b3f@topic.nl>
 <ecc4d3b6-4d74-02f7-e09b-1dfb3881b6e8@denx.de>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <e977a404-1c00-a37f-fecc-9440eeb37ab9@topic.nl>
Date: Tue, 25 May 2021 16:23:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <ecc4d3b6-4d74-02f7-e09b-1dfb3881b6e8@denx.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM3PR07CA0144.eurprd07.prod.outlook.com
 (2603:10a6:207:8::30) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by
 AM3PR07CA0144.eurprd07.prod.outlook.com (2603:10a6:207:8::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Tue, 25 May 2021 14:23:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78366d87-5c5b-4c84-5aa3-08d91f88b6dd
X-MS-TrafficTypeDiagnostic: DBBPR04MB7978:|AS8PR04MB8868:
X-Microsoft-Antispam-PRVS: <AS8PR04MB88689D214D416B3C210E6CD396259@AS8PR04MB8868.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: x/SStlgvxuYvyNbTP0QC1uPaY5dsX/45DOTbnjQvj2w02Fi13U8hG/tao+fx4PRkUu2yMlB5F58aWxNtxnex7u2/Db46iQUh9oM58lBuJZa/Q+ClqAsPhoplNBlkuqtYMkKQ3/lIuglzCSmy8KTmGXmPYZK4oH/XAPns8/IELvwtz2C0WJyVY1XU0dDPn+ZduPd+4YNz6zZFkmoq2R5oOkxM6yyMbXeor+nWVGeTyErh4TFlmXt670Vn8D0z85C3VRrpv93aNa/KkLv3JWDKkYtKwKFa7endba6LRVn9Sskxbw1CYXSQDj/msPPdbZ92jzhCyXhcYnwp/O945FhlIGJ126uCwOIguIZ1iHcLp7vjn/XBKFnedyxog4b/Wvqb2fm3DGw19wpTxv02FvuXBSqOYq4TKD8p0HNfdNIZu6l9IjtcuZF8rwVfIXKTR5oYeXOW3sD2owscx9Vm6Q9mIqyxU5t4/8rTThO65xXLfcrg1xHAIwyl35IKtyS3KOdl8L3TLAD+2tYvVnmtLTLZ1gvy7PKPEMobL5INSHkrAyfXipRZlU9DpvAbLYKpDQDljUoU4vv5aMKUOqWGJMNZ9ZOKKIELopwrToH1DVgOEaWeGdDZChDkNViY3BYMzaFlpluKJsr5qBBjO4pHnMzmIpP2LD+ttArl756g+8czwb5ZUuGKZpWQazYADwT8wP8ix8fKxBrW8/7hstxR97Efjgq96TxaicQPnirW6KOHVtU=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB8PR04MB6523.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(376002)(39830400003)(396003)(366004)(346002)(136003)(83170400001)(5660300002)(6486002)(38350700002)(66476007)(66556008)(38100700002)(66946007)(31696002)(8936002)(8676002)(53546011)(2906002)(7416002)(4326008)(26005)(83380400001)(54906003)(478600001)(36756003)(31686004)(16576012)(956004)(42882007)(36916002)(52116002)(44832011)(316002)(186003)(16526019)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/W4XCnFQViZ7zZpxdQT0InDvI/1IcZx8AZqEKqrxcjhtTiYNh3I6a3MnBNUl?=
 =?us-ascii?Q?rRD2YuuRZ66aMV9N9qkAv4RwjLyiYtBIC07Ih2J9qyDkio9p4gHJdKyKKAjP?=
 =?us-ascii?Q?dxHaE1CRSLtukye1aOS3eYJYLP8Vicoiocj7w8wkTTdnJhWfDwIaWKZUxMxj?=
 =?us-ascii?Q?Cw7VhvtdCjecJyWHlf6el6C2aUp20TEU+X4GpC7rAbfAvyX7p+tflVY7xENh?=
 =?us-ascii?Q?cUFgvHZpcp0mCa2wCQlhRuk3UKOt1YEgR+UOH66kUjlTWRmsVoRDc1Ar332X?=
 =?us-ascii?Q?oVFwX6KmEGZ7A57/31/ZxITgoV9lQkGBgenEfGOBW7kaNpP+HHduFL8Fr4Fh?=
 =?us-ascii?Q?kLxx8LAePirW3TMF+GXyTbrgYfy9e4SPkZPK5J4T9idIaJts4gWrD2dC0Scq?=
 =?us-ascii?Q?oP8AOj0kaSHeF2fmLD8s8XvY6FAJWA8fdnwf/k44WtPa9a+1gCLZKt0x7MWW?=
 =?us-ascii?Q?Ze4y0TdqjNn4ogOwgZcOpnhiDnozhxmtpgZqSlLBx/IKFRtP7zwnTO27Go/F?=
 =?us-ascii?Q?1ryRypfu4v+jlLrFp9jsZqKbfZLcaVB3BASj4EqxOGB7TvIlyIzfrUslNQ8E?=
 =?us-ascii?Q?jdk33b67BoAD5s+9wP3UrWng5yAAPGmfqA4YzTEAUNu52p8SPj82LCAwpS3A?=
 =?us-ascii?Q?TbVYtIeWj9QUKJAxKJlHV4RyJzLopoVtkKloTs30YsKYy1d1YvI6DuORItUz?=
 =?us-ascii?Q?GYJy5PGx9pn70JeOgOKVElyAFsTQQdS1mB5IygWWPXYihUJ7SBaT4V7VMxtg?=
 =?us-ascii?Q?UlQcdyuFZiRmWi5+XSilArww043nRbS0VH3aDE7CUKpFlRnNbAFaCtEKzqE7?=
 =?us-ascii?Q?RJlxzVEVXnQzFw5CWmn86zOjgUbmIiJFJSxtF55xAgVsTaUq6lzuOxWoduq4?=
 =?us-ascii?Q?8bWBD/w9HAOEoRvBXxi+1kjhI59Wd4sZgiAsjcpwnKozI8d8F7psmP5lsb0D?=
 =?us-ascii?Q?xEtC+5rE1P+n4nKRG7pGx0356feh2IcB6Xx6wbU88BrpWi8b2df3JywQLVs1?=
 =?us-ascii?Q?p8FAscx6+17FmqRPFmqoiFdcn1lCAFRlg4zFKRrY6YzqGnlhfJzDS2SA0amf?=
 =?us-ascii?Q?dea17cXZyKiJXBl0uF2QJCqikmKAtiHGRB5R6RPmelgdp7c8Z9fzl/NrgW70?=
 =?us-ascii?Q?/Z4WPWhyFIhkXeIu19G2P/HOYzcujfV8P/lPoNn0MzVrD5hdJa0apoSFqR/Q?=
 =?us-ascii?Q?Cl2mN+0oGHI+TpoRwz4mrf1t3S/uTb13D7bZSFcFhNSvwibyViCbqPYDXvrK?=
 =?us-ascii?Q?MiA8VKTO/udT4H/kq+/Ln4Ay01DmEEFMnCkX6ciMT9epDrFyPf6vqhQRhQ1t?=
 =?us-ascii?Q?otkMvZE78FdshQyNzr7K6eFq?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7978
X-CodeTwo-MessageID: f4f5663d-8bab-4330-a9da-e7230c9db407.20210525142347@westeu13-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR01FT055.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c2982147-9222-41e9-26f7-08d91f88b3b4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L7hHu/WKaospuc9TZjYpmMEVFwdh8M+Y2HqJHBDhF8BksufoYOOpU5sGK5f4VD+J8ONEsYD9rD77kjrqE6s1zJOym0Vu7uW5wpak46xG1ZDaGLqoB6lbq/rYAexi1Q5t1OBjXIa0NzBXA2mUsDAfVKdJMMAEk4tlCSKtZxJKvU+j6rom/pxjDHszZn5v8DZWir5MQ4pFTlsiKRueiHh+Q10UZLMCPh+4P6xKw9bGNz7rNlsL6v525Zy02bYtv++RGP8XTLcJ4VxmR8lPbgNRw73pNTTAblBGybSZ0m6HfRVM9g6DULmlQVU29UWEh3DgjbOLlAotYphaqUSL2nrUKDA9tuqiHjnEAt+aZMlOItiM4CPdHm4zeYoixstdL+IaEJEBfFz1eDSIDYfBa+PS7OCFaO9CGXLn+a2z+3wbpndGQe82TLU5wiUWdHvb7cVXxjWJZTdwwEr5GxZaGFRdvmX1KHbgriR5w5uQb9YnvQfh2/bveX8SAiDfR0TUXqwZkXBD7/6s7G5FGfiHyNTLvlTMxKR465d0cFXbtrF2kTLcGaYNJql/ACelgxW8LAOXEDGOoN7+spi4TA1NrpM9Iz2T/gaAlV2DsYFpR8lZ0sY/aJwvu5ZMlJfcAl8FZD++q5qkgO7asJ9s+CNahsimlElFQ+twIbxvFEezQ60KpFHFbJTn/wChUTzwXYnU+KD6nukSPaAIQtH2BGp61+sQ/U2B3w/UrtKmVsveUv8bum3PJUJnN4sK0vag88E8zRrd/XLoEGwsvZkVPyZQXPHrh902nzzR0hpwVHtKqtqouEdDZ5sxQznPsB2ZYI+kgITv
X-Forefront-Antispam-Report: CIP:13.81.10.179; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu13-emailsignatures-cloud.codetwo.com;
 PTR:westeu13-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(346002)(136003)(376002)(39830400003)(396003)(46966006)(36840700001)(83380400001)(2906002)(336012)(16526019)(7596003)(36756003)(54906003)(36916002)(31696002)(16576012)(36860700001)(15974865002)(42882007)(186003)(5660300002)(47076005)(6486002)(44832011)(31686004)(7636003)(26005)(70206006)(356005)(478600001)(70586007)(316002)(956004)(53546011)(83170400001)(7416002)(8936002)(8676002)(82310400003)(2616005)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 14:23:48.8541 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78366d87-5c5b-4c84-5aa3-08d91f88b6dd
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.81.10.179];
 Helo=[westeu13-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT055.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8868
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

Comments inline.

(Without this top-post, the company mail server will inject a signature=20
in some weird location.)


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
On 25-05-2021 15:00, Marek Vasut wrote:
> On 5/25/21 2:08 PM, Mike Looijmans wrote:
>> On 25-05-2021 12:53, Marek Vasut wrote:
>>> On 5/17/21 3:23 PM, Mike Looijmans wrote:
>>>
>>> Which system/soc are you testing this on ?
>>
>> On a raspberry-pi 4 at the moment.
>
> Ah, OK, it seems this bridge is popular on RPi.
> Is there some adapter board with such a bridge for RPi available ?

Nope, but about 4 subscribers on the RPi forum have created their own=20
PCB. I'm working for a company that did their own PCB too and my job for=20
them is to get it to work...

The DSI-to-LVDS bridge is a lot cheaper (and simpler) than a=20
HDMI-to-LVDS bridge. In hardware that is.

>
>>> [...]
>>>
>>>>> +static void sn65dsi83_pre_enable(struct drm_bridge *bridge)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bri=
dge);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Reset the chip, pull EN line low for t_re=
set=3D10ms,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * then high for t_en=3D1ms.
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> +=C2=A0=C2=A0=C2=A0 regcache_mark_dirty(ctx->regmap);
>>>>> +=C2=A0=C2=A0=C2=A0 gpiod_set_value(ctx->enable_gpio, 0);
>>>>> +=C2=A0=C2=A0=C2=A0 usleep_range(10000, 11000);
>>>>> +=C2=A0=C2=A0=C2=A0 gpiod_set_value(ctx->enable_gpio, 1);
>>>>> +=C2=A0=C2=A0=C2=A0 usleep_range(1000, 1100);
>>>> Taking the chip out of reset here is not needed and may even=20
>>>> disrupt things, as the DSI hasn't set up anything yet so the clock=20
>>>> may not be running. I'd move this all into enable and get rid of=20
>>>> the pre_enable call. Similar for post_disable.
>>>
>>> I am still waiting for someone to confirm the behavior of the DSI=20
>>> clock and data lanes in pre_enable/enable() . The datasheet says the=20
>>> HS clock have to be running and data lanes must be in LP state=20
>>> during init, but I don't think that is guaranteed currently in=20
>>> either pre_enable or enable.
>>
>> Neither is suited. pre-enable may have nothing, while enable has the=20
>> data lanes sending video according to the docs. So on many systems=20
>> either this driver or the DSI driver will need changes to make it=20
>> work properly.
>>
>> On the raspberrypi, the DSI has the clock running in pre-enable,=20
>> hence putting everything in pre-enable instead of in enable makes the=20
>> chip work.
>
> I think someone from the RPi foundation mentioned this before.

Yeah, he mentioned mentioning this on the RPi forum too.

>
>> Alternatively, one can modify the RPi DSI code to start sending data=20
>> after the enable calls. That also works on my setup, with everything=20
>> in enable.
>>
>> The major point here is that you should pick one and only one=20
>> callback: pre-enable or enable. The GPIO reset code as well as=20
>> writing the registers should be done in that one method.
>
> Why , please elaborate ? It seems to be if there was no need for those=20
> two callbacks, there would be no two callbacks in the API in the first=20
> place. There is a chance you will get disable()->enable() sequence=20
> without going through post_disable()->pre_enable() as far as I can tell.

The datasheet states that "the DSI CLK lanes MUST be in HS state and the=20
DSI data lanes MUST be driven to LP11 state" when the reset de-asserts=20
(goes high) and when the CSR registers are being written.

Your driver now de-asserts the reset in the pre_enable and writes the=20
CSR registers in enable. This is the "least likely to work" option.

Both the reset and the CSR writing are to be done in the same context.=20
So either everything in "pre_enable", or everything in "enable". Which=20
one is correct is up to the maintainers, I also don't know which is=20
best. The other callback can just remain unused.

If the choice is to do the chip initialization in "pre_enable" then do=20
all the de-initialization in "post_disable". If the choice is to do the=20
chip initialization in "enable" then do all the de-initialization in=20
"disable".

If for some platform the choice happens to be wrong, it's a very simple=20
patch (just change the "ops" pointers) to change it and make it work for=20
that platform.

Alternatively, it's possible to make it a runtime choice through=20
devicetree or so as to whether the CSR initializes at "enable" or=20
"pre-enable".


>
>> Same for (post)disable for symmetry. There's no point keeping the=20
>> chip awake after a disable.
>>
>>
>> It's pretty likely for a DSI driver to have the clock active in order=20
>> to allow the panel driver to send MIPI commands and things like that.=20
>> So everything in pre_enable makes sense.
>
> That's how the RPi behaves, on MX8M the DSI clock are active only in=20
> enable. But that might be wrong, see below.
>
>> I don't know how the platform you're testing on is behaving in this=20
>> respect?
>
> iMX8M{M,N}.
>
> And I suspect the DSI behaves differently than on RPi. And that is why=20
> I would like to get some clarification on what (clock, data, LP and=20
> HS) is enabled where from the maintainers.

Suspect so. As I wrote before, any DSI that adheres to the documentation=20
would never work with this chip. The chip won't work without clock and=20
it also won't work if the DSI is already sending video data is my=20
experience.


>
>>> [...]
>>>
>>>>> +static void sn65dsi83_enable(struct drm_bridge *bridge)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bri=
dge);
>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int pval;
>>>>> +=C2=A0=C2=A0=C2=A0 u16 val;
>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 /* Clear reset, disable PLL */
>>>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
>>>> Writing 0 to the RESET register is a no-op. Has no effect=20
>>>> whatsoever, just wasting time and code.
>>>
>>> I would rather keep it to make sure the register is initialized.
>>
>> Why? It's marked "volatile" so the regmap cache will not touch it. On=20
>> the I2C level, there's absolutely no reason to do this.
>
> It still does trigger a write into the hardware.

And in hardware it does absolutely nothing. It says so in the datasheet.=20
And even so, the chip's reset has just been asserted, so you can be=20
pretty sure it's in a well-defined state already.

>
>>>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 /* Reference clock derived from DSI link clock. *=
/
>>>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
>>>>> + REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx)) |
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_RC_LVDS_PLL_HS_CLK_SR=
C_DPHY);
>>>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_DSI_CLK,
>>>>> + REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
>>>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_RC_DSI_CLK,
>>>>> + REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 /* Set number of DSI lanes and LVDS link config. =
*/
>>>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_DSI_LANE,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_DSI_LANE_LVDS_LINK_CF=
G_DUAL |
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_DSI_LANE_CHA_DSI_LANE=
S(~(ctx->dsi_lanes - 1)) |
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* CHB is DSI85-only, set=
 to default on DSI83/DSI84 */
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_DSI_LANE_CHB_DSI_LANE=
S(3));
>>>>> +=C2=A0=C2=A0=C2=A0 /* No equalization. */
>>>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_DSI_EQ, 0x00);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 /* RGB888 is the only format supported so far. */
>>>>> +=C2=A0=C2=A0=C2=A0 val =3D (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC ?
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_LVD=
S_FMT_HS_NEG_POLARITY : 0) |
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ctx->mode.fl=
ags & DRM_MODE_FLAG_NVSYNC ?
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_LVD=
S_FMT_VS_NEG_POLARITY : 0) |
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_LVDS_FMT_=
CHA_24BPP_MODE;
>>>>> +=C2=A0=C2=A0=C2=A0 if (ctx->lvds_dual_link)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D REG_LVDS_FMT_CHB=
_24BPP_MODE;
>>>>> +=C2=A0=C2=A0=C2=A0 else
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D REG_LVDS_FMT_LVD=
S_LINK_CFG;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_LVDS_FMT, val);
>>>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x05);
>>>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_LVDS_LANE,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ctx->lvds_dual_link_even=
_odd_swap ?
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_LVDS_LANE_EVEN_=
ODD_SWAP : 0) |
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_LVDS_LANE_CHA_LVDS_TE=
RM|
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_LVDS_LANE_CHB_LVDS_TE=
RM);
>>>>> +=C2=A0=C2=A0=C2=A0 regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 regmap_bulk_write(ctx->regmap,=20
>>>>> REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 &ctx->mode.hdisplay, 2);
>>>>
>>>> I think this ignores the endian format of the data. So this would=20
>>>> only work on little-endian systems, right?
>>>
>>> Likely, can you double-check that ?
>>> Some cpu_to_le16() could help here then.
>>
>> I'd add a small helper function that does the endian conversion and=20
>> register write, e.g.
>>
>> static int sn65dsi83_write16bit(struct sn65dsi83 *ctx, unsigned int=20
>> reg, u16 value)
>
> That just adds unnecessary indirection and makes the code harder to=20
> read, so I won't do that. val =3D cpu_to_le16(...) looks good enough and=
=20
> there are already such sequences, i.e. val =3D ... ;=20
> regmap_bulk_write(...);

I'd think the indirection would make it easier to read the code, but=20
it's up to you really.

__le16 val =3D cpu_to_le16(ctx->mode.hdisplay);
regmap_bulk_write(ctx->regmap, REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW, &val,=20
sizeof(val));

versus

sn65dsi83_write16bit(ctx, REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,=20
ctx->mode.hdisplay);

--=20
Mike Looijmans

