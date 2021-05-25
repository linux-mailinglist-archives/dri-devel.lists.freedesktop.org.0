Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E5C390501
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 17:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB386EA54;
	Tue, 25 May 2021 15:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140084.outbound.protection.outlook.com [40.107.14.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09BB6EA54
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1F1slL7QdkD5Il/GkQjvi8hvi6peqbooUsbcW7DyOA=;
 b=XKk3I5xDy4vQl0GqxTwrdOrS7zUDOO3ZcTA8iIGlhauvbJpi0oraejCvmchNos5GwkVxvDK0TOXuIkQQ+vTxjQJtkiM5krilmlYoF3ZZFv6vLtf472hoRsZ9iFwWVDmzuBIAUr5rAgygvNfOWZyYSNoG1T8nOVUnDFEEhA7a9kw=
Received: from AS8PR04CA0105.eurprd04.prod.outlook.com (2603:10a6:20b:31e::20)
 by AM6PR04MB6006.eurprd04.prod.outlook.com (2603:10a6:20b:2b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Tue, 25 May
 2021 15:16:49 +0000
Received: from HE1EUR01FT053.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::65) by AS8PR04CA0105.outlook.office365.com
 (2603:10a6:20b:31e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Tue, 25 May 2021 15:16:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.81.10.179)
 smtp.mailfrom=topicproducts.com; ideasonboard.com; dkim=none (message not
 signed) header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 13.81.10.179 as permitted sender) receiver=protection.outlook.com; 
 client-ip=13.81.10.179; helo=westeu13-emailsignatures-cloud.codetwo.com;
Received: from westeu13-emailsignatures-cloud.codetwo.com (13.81.10.179) by
 HE1EUR01FT053.mail.protection.outlook.com (10.152.1.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 25 May 2021 15:16:45 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (104.47.0.59) by
 westeu13-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Tue, 25 May 2021 15:16:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BoH+IT2/7qGzF60YQ+1V5UXZqMyHcX7yzHkhkmeSwKZ/07OsK0EJlNuwdGP7FQttxuEAwDRUz4qvaLF7G+0hWoTglei43zskbAG15wZCNvmeQAdPDs8+Dd0S9z9xDvp0W9hbdhPy8Qq2BQWbvU3zRKeVErAKho3BSqKTPfAq2Qc2b/aco7xCB2YlIxx31OHis9YCUdHIRXqj+WDWUJ5Ft98P/gG+SxY0F2+s+A3weMsBzXkYrfNqhUFG48Mq9lp2nsL8JN9143zISmyu1JQDoAenKG7wWIxtad12/CqRZiaUtzHDWmsUG4NhIw4u0+U+fVd6F8XQfVIYN9Tc9imoYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4L9xekN5NuuaH0RoOxLQnmhpLvtNs3SQ6XoOQjGzbc=;
 b=C/EPZKMg4d6h0Os9dq0R1syWDYJSpuk7GD3VGAW5gs+rkM1R4JuyMN2PadjeXDqQXuW9P0XG4tX+Oiaj6Q08UootDX1c4FuSOCSgTdqTdfAsT/HfuYg6KZCFKYfNIdYb7rex/5VOQlHb6MZ1CyUtCrRbh3g3ZUIjHlGJwp39Oue7H1KwIPuTlidohloUEg4UulduOvgAWNdBV3oF4hmW+zyJHC65sonSgqyGRmL3zojQGg1sT0NBXxpltg60W0QSy/0uLxTpuhh2CWZirCa1p7TqnuobQHIfVyrmS4vpx7J0PWcnhIAKxu+VMvHSPPmZ53JTOUXE/GdHCCALvctfRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl; 
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: ideasonboard.com; dkim=none (message not
 signed) header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB7PR04MB4251.eurprd04.prod.outlook.com (2603:10a6:5:28::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Tue, 25 May
 2021 15:16:41 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::4980:418c:fea5:bed6]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::4980:418c:fea5:bed6%7]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 15:16:41 +0000
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
 <e977a404-1c00-a37f-fecc-9440eeb37ab9@topic.nl>
 <d86d0fea-83d1-69ee-9772-2605bbe19db8@denx.de>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <1916a049-e090-2044-4f74-ba26885ade4c@topic.nl>
Date: Tue, 25 May 2021 17:16:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <d86d0fea-83d1-69ee-9772-2605bbe19db8@denx.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR02CA0009.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::22) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by
 AM0PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:208:3e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 25 May 2021 15:16:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b61b2d35-4fc7-4c60-70f6-08d91f901c59
X-MS-TrafficTypeDiagnostic: DB7PR04MB4251:|AM6PR04MB6006:
X-Microsoft-Antispam-PRVS: <AM6PR04MB6006E1C6B774DD6A3B169B9496259@AM6PR04MB6006.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 4YOHkrxR+Ic6yx2e5tE9+OfOMHVjvmKH7Wmqo+u7ScKukn3bjt4igZyAGTxxwHv2pvmXlm6PdafwH+4EhXGHzusd0scwPSUEBiNycM69LcNbQZl/4o87s3jyGmcHMGhzcyAvbV2RiksiRYd5IGN9zhmgtiZudhWLFdLR21kpmYa9/v5yG8b3XJLNC5OKqb/qtJ/tnEwMMTgRdJHIEblBOZc/nd5+uhPp6JmRQem/TjwYXHOoSUjTPAipCHJuzd3N2AHtF7b8NNY9afFf/aEirU2EMaqJkqEmUK8r+UvrDj57aXEAd6pDGiIOX5IxDQr3sow5uqBjepRdUcqJtJgL0Ijze35aGzX+hLSRERt31z38SpAMUs7iCMEVOeuO7UM8cJ0NJfx4k6EnYEu9COw9W5QMSWq9y6hOx2XS8A4F11giQBDTVynsrGnK5NcDdn3iSNgoN8YIFu7n3f7AdyUaIgrjVHtaMhm0g3tNb70lg7vsrZqcme7Q+OE60AnUrdMfF/FVQEEKW5Fk6p8Od1qkoniO9c9Fb59bxx1+4xxgurVVRAoGKK9Xf2Piqc6gxwcz2f5yanin4sj89vKAwGV69CpwfNqIfC5mUlecc0FVJLel7FSWGvFEf5P1rYbA6SQrhB/+O8hy81zF5GMrRSryFJNv6e34N0R8EdCAc2Qo4E6bDOpQhRUsnaO1IO9DWRHEfF/NS6BXXbRPff4YEJwFYVr+0iP0VXz7415ZV4SobS8=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB8PR04MB6523.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(396003)(39830400003)(136003)(26005)(4326008)(54906003)(53546011)(38100700002)(44832011)(52116002)(186003)(6486002)(16526019)(36756003)(8936002)(38350700002)(83170400001)(66946007)(478600001)(42882007)(66476007)(7416002)(31686004)(2616005)(83380400001)(956004)(66556008)(5660300002)(8676002)(16576012)(31696002)(316002)(2906002)(36916002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UmpTbkt1NjZwLzlaaVpxNkxqQkF2ZmRlL0wyUW5zbWlKZEY3bmdidlBLWWkr?=
 =?utf-8?B?cWw0bHhVWkYrUWxVT0h4aUJObkhmTXI1VEw1Sy8xVDVJVXhJVlhTN3FwVlFE?=
 =?utf-8?B?ZE1ZZlVSYzhJNkRhOE44UkM4TUpUT0llb0gxbXhMOE84ZWFPWDMwRTUvTjk2?=
 =?utf-8?B?VldHOVllYXZuNS9sUGhDdFlBQWc5MWpPMmtaeUJXQ3o0U1JWKzFBVythRzZE?=
 =?utf-8?B?VU9LQTlLTU9CSlU1bm93cm5VVGgwblRvSGE4dUpFaE1FU05IUSsxaCtJNWxL?=
 =?utf-8?B?MzEvalpsZFBHVWFIWHRGY2xIZTNaRzc4bURYeTc1Z2o1SSs4KzFacWYveXdi?=
 =?utf-8?B?dllPamp2T1JBdXJnUXRucnBHOGQxMEMxaHA4MGVVWDh0WUUvMXc4Q0ZMc3R6?=
 =?utf-8?B?WUdkWmljenhUOHFaOVlMaG1UclRrQkk4RGxNMkpscDkra0RkZmlpQXF2ZU9p?=
 =?utf-8?B?ZngyRmNCK09IS2tPR01tSnY3Q3YyUytscGNTaUw2S3N2RE1uZ1Z1Mjc1R0hR?=
 =?utf-8?B?Vnh4VVVQem1EdjNmUlg0d2EzeVYyVTFNQnhoWTZxaTlkSmVNem9CWjVlUEVP?=
 =?utf-8?B?eWZiZkx0U2IzRXpxbVQ1ejJ2NjhIQ2NxVTViekJ1Zk5lZlpHQy9LNkJCc1FC?=
 =?utf-8?B?MW41NFlJaDZ1QVFBNU9PcU9sNGFnTU9xZHhSUk81d2NURUQvNUhqc3pRSk9r?=
 =?utf-8?B?QTFFYU85SW1WS0JzSFllRzFMdWFBZ2p2SStlUTlzV3ZxR1BhbjlIQkZIaVdz?=
 =?utf-8?B?b2E0TWFOUE9ZR2dNVnRVRU9YQWdVb0QzdkxVSXBPTkwxK24yWkp2WUtNaGEy?=
 =?utf-8?B?UmpUcDFtbjA2eXlXNmVDWGQ4WTFIV0VoRy9Kd2JuNndkTFZzYmJzZVRna1NY?=
 =?utf-8?B?UE5PMTAvMSt5NWprK2JVdjhER1VrcC94cjhaeTlnUGFWVlVlSVh1cVhqaDEw?=
 =?utf-8?B?cmkwRlB1Wk5PWTg3NmhjOWJpRXBvZHo2WTlUODVlWmZIZVUvWVNzK2Rzd3VV?=
 =?utf-8?B?V2plNlZKU2UzTjFWK1R6aVZ0RG0wMllIMTNPTXhwZW9BNEtEVmNrVWYzOWRm?=
 =?utf-8?B?OXNwaWQwVmpoLzl2VGJqaTBqWWwzU000MWRMY2IvMy82aE42bERESGwveDdu?=
 =?utf-8?B?WnpCWUdvamlqOTV6cDZhTDJ6SUNWY3N0Y3cxaXZqTU56NzJCYTRhcDNFeG93?=
 =?utf-8?B?ZkYwbmEwcnhyTWFicERvcm05OGMraGlBR0djYXREd0w0N2dWQzJPbDkyVmxr?=
 =?utf-8?B?dWFmb3Z6aFNndnlFYncrWTBmOXBwM2FDNCtiZENYbWkzWE02Q3Q4aVp1VXNZ?=
 =?utf-8?B?b3pRT1RkL3RvV1NUeElseWgwd1JFemMxK1Q5bDR1WjlhZHc5ZXd1QU1XNHoz?=
 =?utf-8?B?RjI5VTdHakVORDJVRThSdFdiSi9SSVZPQVBEY3NMWWYrL0dmcGdEWTY4OFM5?=
 =?utf-8?B?amw5RmR1NHVXOHVkV2V4Uzd3ZUo2UlVNWThoR1kwNExnTGxhQUw3Ulo3U1lv?=
 =?utf-8?B?ZnEyTmdOOS9jeUZlakFOa0ZhZzVXeFQxeWZJZTVWSmMxTzlzZVpSZTJPYnNs?=
 =?utf-8?B?ZlQ0cE9hNXpiSmNGRjgyN3BEN2ZuS1B6M0N2V2dsT0VzU2kyOGE4a1dMd0ZS?=
 =?utf-8?B?Y2VIamc3YmtzbGdReDUreWE4OS9sQU52bjBJa2RQdWJLa1FJeUNFankrRmdj?=
 =?utf-8?B?TjlnNVNHZWU1Zm1VL3lXR3FOK2I3WllJUW1BQXVHRXdmQ3c5VlR6cllsR2M2?=
 =?utf-8?Q?yeXvMQ3qEMLv5nb8KSp0CGCOLcG9sv+D4Vmgjhh?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4251
X-CodeTwo-MessageID: 582859bd-89dd-4ee4-bdc4-057488f57c99.20210525151644@westeu13-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HE1EUR01FT053.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: d4b94c5c-4732-48de-c8a8-08d91f901961
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /QcXHr1fpw3uS7avoUvGUO6K5KDosB+qfD47r3fGmSJzJ5yemgPFa2x06aKvdPWFMWQzEJ7WLRoRlGV+S5IKVlaHa3o79YB5fst0Gs8OaOv8wh9QXg2/DRjetvUbziSoYBQYXZyUY5unfBsRzG0xQ7pJ7sX/qP4E083HBXOnELhVtAETaNs6BXcioMC9Yu2PuSTi4FFfA+u3sEIoKqGA6L1mp7REGWK6m7vJP7rqtD+eVKBQAtNBM7y8PKRXJbHuf8rNUEcOSjiz3c1T5HvYnzWlwzWJkjLkkq0gGDWxcEv2W5ehhH7DzhFGgOqonEGuRaWVdU0EqKHkGjOKEHzyVIn4PIhxPtCCIoNSjHF9Ms3U7g6dthZD7DvT2mObUemAdEMnDLpaRCS6c3UjqRUH3ln7N3fGy7AfiIHzWEx9aiSxPvf5wCVXvt6WZqG6STUSEqYiMXWOxqKaM1AmzDmeAWEy7eOiLPbuhDn/i+ij64O5PokSuvf6Ymjp8+dZg1c3juxtMi0ZG0fBzFuwzMbCdJx7Ey2TtvJcQkTwzDt5svWaNmmgT80TKiDoGJf5fVMWbHNn12pjNOdlqyRZ1Wj3JS72+Zl7K7M2fZpCRMFUXZ5WlLbfrKNr55KCtCYZYDMtoeU/F6zIY7qWSvI5Jw/hCv7M4VXQMP2+mv6xF6F3cpLbvRIeddWuFniAiC7Srb49RKwzAaJGmv5UTklM6yPd1+x1rL3+iQEGc2c0gpkWrbQMOQln1tjJL0bIQE958DB77UoqfGSRE5sk4fZmWD5B2jc4xFxLk7TNR5WMGLNFaBtXZ8w5WpWWLXmU6lWDgzlS
X-Forefront-Antispam-Report: CIP:13.81.10.179; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu13-emailsignatures-cloud.codetwo.com;
 PTR:westeu13-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(136003)(39830400003)(396003)(376002)(346002)(46966006)(36840700001)(478600001)(70206006)(54906003)(15974865002)(7416002)(36860700001)(8936002)(70586007)(2616005)(956004)(31686004)(186003)(316002)(26005)(47076005)(36756003)(2906002)(8676002)(83380400001)(16576012)(83170400001)(44832011)(5660300002)(7596003)(53546011)(7636003)(31696002)(4326008)(82310400003)(356005)(16526019)(6486002)(42882007)(336012)(36916002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 15:16:45.7542 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b61b2d35-4fc7-4c60-70f6-08d91f901c59
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.81.10.179];
 Helo=[westeu13-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT053.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6006
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
On 25-05-2021 16:42, Marek Vasut wrote:
> On 5/25/21 4:23 PM, Mike Looijmans wrote:
>
> [...]
>
>>>> Alternatively, one can modify the RPi DSI code to start sending=20
>>>> data after the enable calls. That also works on my setup, with=20
>>>> everything in enable.
>>>>
>>>> The major point here is that you should pick one and only one=20
>>>> callback: pre-enable or enable. The GPIO reset code as well as=20
>>>> writing the registers should be done in that one method.
>>>
>>> Why , please elaborate ? It seems to be if there was no need for=20
>>> those two callbacks, there would be no two callbacks in the API in=20
>>> the first place. There is a chance you will get disable()->enable()=20
>>> sequence without going through post_disable()->pre_enable() as far=20
>>> as I can tell.
>>
>> The datasheet states that "the DSI CLK lanes MUST be in HS state and=20
>> the DSI data lanes MUST be driven to LP11 state" when the reset=20
>> de-asserts (goes high) and when the CSR registers are being written.
>>
>> Your driver now de-asserts the reset in the pre_enable and writes the=20
>> CSR registers in enable. This is the "least likely to work" option.
>
> Understood. However, it seems to work on iMX8MM and MN just fine.
>
> Is there a problem on the RPi, that the driver does not work on it ?

On the RPi, without any changes, the board won't output anything. Only=20
the test pattern works (using i2cset to enable it). There are two ways=20
to make it work:
- Use the current RPi DSI driver as is, and move all initialization code=20
in the sn65dsi83 driver to the "pre_enable" callback.

- Change the RPi DSI driver to not send any video data until after=20
"enable" and move all initialization code in the sn65dsi83 driver to the=20
"enable" callback.


There's also a bug in the RPi DSI driver that it does not call the=20
mode_set and mode_valid methods, so it needed workarounds for that too.=20
But that should be fixed in the RPi DSI driver and not in your code.

It's a surprise to me then that it works on the iMX. On the RPi it=20
absolutely won't work if the DSI is sending video data when the CSR=20
registers are being written. It does not seem to matter whether the data=20
lanes are in LP00 or LP11 state though, either mode appears to work.

Maybe the iMX is still in a command mode and doesn't actually start=20
sending video until after the "enable" callback?


Given that the test-pattern mode does work regardless of the data lane=20
state, it appears that the DSI input of the sn65dsi83 chip goes berserk=20
when the video data arrives before the CSR registers were written. It=20
won't recover from that without a full reset.


>
>> Both the reset and the CSR writing are to be done in the same=20
>> context. So either everything in "pre_enable", or everything in=20
>> "enable". Which one is correct is up to the maintainers, I also don't=20
>> know which is best. The other callback can just remain unused.
>>
>> If the choice is to do the chip initialization in "pre_enable" then=20
>> do all the de-initialization in "post_disable". If the choice is to=20
>> do the chip initialization in "enable" then do all the=20
>> de-initialization in "disable".
>>
>> If for some platform the choice happens to be wrong, it's a very=20
>> simple patch (just change the "ops" pointers) to change it and make=20
>> it work for that platform.
>>
>> Alternatively, it's possible to make it a runtime choice through=20
>> devicetree or so as to whether the CSR initializes at "enable" or=20
>> "pre-enable".
>
> That would mean you encode policy in DT, so not an option.
>
> I would suggest we stop this discussion until there is input from the=20
> maintainers. It could even be there is an API missing for configuring=20
> the clock/data/LP/HS modes which needs to be added.

Agree...

There's no easy way out here. Adding a "post_pre_enable" or=20
"pre_enable_clock_up_data_down" callback is not going to make it I guess...

> [...]


--=20
Mike Looijmans

