Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB6C382D53
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 15:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C686E060;
	Mon, 17 May 2021 13:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60057.outbound.protection.outlook.com [40.107.6.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7F46E060
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2L28EttEbJ/UOj/7WTIcqjqV080BkpTjbcynIbTxkw=;
 b=CnF6hT/2l+zBmKg1n7XGp2/PHWx6w8bui1Mml1vlwtDpd22C+wIUMTfhFiHjFKnZGhfw3hM6ju0Jd6dCd2TTEODy6dyBnfOwyAbrm6XpXi/qnHGk38vPOKBoVFQGXP5YHczhDDZePY5Hbx8iIddjkiKbCGPIZtpn3wncZrjqnWk=
Received: from MRXP264CA0021.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::33)
 by HE1PR04MB3148.eurprd04.prod.outlook.com (2603:10a6:7:1d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 13:23:18 +0000
Received: from VE1EUR01FT028.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::c5) by MRXP264CA0021.outlook.office365.com
 (2603:10a6:500:15::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Mon, 17 May 2021 13:23:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 52.166.56.231)
 smtp.mailfrom=topicproducts.com; ideasonboard.com; dkim=none (message not
 signed) header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 52.166.56.231 as permitted sender)
 receiver=protection.outlook.com; client-ip=52.166.56.231;
 helo=westeu11-emailsignatures-cloud.codetwo.com;
Received: from westeu11-emailsignatures-cloud.codetwo.com (52.166.56.231) by
 VE1EUR01FT028.mail.protection.outlook.com (10.152.2.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 17 May 2021 13:23:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.106)
 by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
 (TLS12) via SMTP; Mon, 17 May 2021 13:23:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1xhWQIJHBK7u4COGQloV29PmrDvS8ZNze11pIxBwZeQPQ1V5NxXq3rY8+9S1VyYyv2WRzfumRflNePYOmA9Ge/L/4blDkRTiHE26oL4QOvdH+Ox6f/e7Qrz+RzNxJgNdeM2GhYDskYkYkGvzvUDQvFmW6Nw4hqxIj7L0fx7aAX+TWjg8m2BTNIM5PvASveGlIirNrh0Aqom4TyopkvZ3ppg3YkJHowSYGUSjYun+6qx0nhQct5cmNddg5m+kgPHYzy+JgfRRYi2iSwpBHxCXCQUbiBbScETkS01XVeX5eoRkS8m9HEGNomhk+xd+4KaDR+n2ZbUOh8o/oD25MkUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRf7+57SRNoQzAYY26WkmUyX7IbL7gTdnva0FUZ8Eh4=;
 b=E/Qmg3TA8Im1YD8jH73Z2UDjEeCiF5DifGzl3y0EPiivPdvruZWF/Cof0toBsQx2vll6xpLvehCisn7aN11mtpKzeWpx2rOUJtVTm/HHxCvehi4Ikd83ecbbDu7KmlLSt7yZIePbmXlYAoy2nhGmsvIQJQha4nBGG1YCZItyyjW1RHnAlHZuO1hzQyTz46MJ1n1Ay7ne6kySnRvXjQ6BNTsME3+BmQ2b6WZ1uMXuCoF+gR+SkwhgcKoUNsuPbZAApN1SRfryYF8Nls0bE3IpCnjTrtJ8+Cm/mg9CThUjuB8F1KmfAr9ytUNAs13LM1KXPuy1aHWcGHyfdjUy00se9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl; 
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: ideasonboard.com; dkim=none (message not
 signed) header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DBBPR04MB7596.eurprd04.prod.outlook.com (2603:10a6:10:201::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 13:23:14 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::4980:418c:fea5:bed6]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::4980:418c:fea5:bed6%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 13:23:13 +0000
Subject: Re: [V3, 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84
 driver
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20210505100218.108024-2-marex@denx.de>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.d251689f-a6ba-486d-bfa1-070ac0c167d5@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.81349e00-3f39-4654-ab28-8c85568d0c51@emailsignatures365.codetwo.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <f61c710e-cd12-f1cf-d05b-759fd2c0e8b1@topic.nl>
Date: Mon, 17 May 2021 15:23:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210505100218.108024-2-marex@denx.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM4PR0302CA0008.eurprd03.prod.outlook.com
 (2603:10a6:205:2::21) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by
 AM4PR0302CA0008.eurprd03.prod.outlook.com (2603:10a6:205:2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.32 via Frontend
 Transport; Mon, 17 May 2021 13:23:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1e67b0a-2629-4633-d33f-08d91936ef38
X-MS-TrafficTypeDiagnostic: DBBPR04MB7596:|HE1PR04MB3148:
X-Microsoft-Antispam-PRVS: <HE1PR04MB3148A1F0ED0023A67ADED659962D9@HE1PR04MB3148.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: AWAXLYhhLiV4IkmLd+mbJGa5YEUwm7PIg/OvsZ2WzAqRuWznNb5oxNwtl8Ikz36AAuzzwhPliKhTaQzIS+gdXuAXQqLk4enDtCNTtx7elk4ybrc2Fb2h9dhgL4i30sTnLutOSUe5kaylXfS2LitGHWtrONhoL8Bjsz0B42aU6BfyPeLic+lT5wEul8ySdl/dw5KwFIwa42zeghdrH7TMobu+3K13OG7kH8RuXuY1w2fEwumy+1QH8y/xx7rPIroFliJNTqBO3YLmVk3bsmaa9zeKFTtze6GlFnJlbwfEDgLI4MdpJoMM8tVkKmnzIboLLrHk8jt+XXoF0Pr8TqY2o37l0ugoA9i/cTs9R5mIqHQo+p8hPUMwntKeT/5bpP+9sQr9N9RR/JBVwegLREv4nSMaqiMHuoRLvqW+Snv5JEzXwmVxg51fchH/CG4MOUM2FH/ojawODyJ74RAZ+8NrdLsAlhXA8r3xnMQnon8GIk5CgmCw44jVbfyTItrZu5GUIzl4JOpya2qX43eMyL5KNl95Gg4Xmt9rK1reJpRjCrWcyvsVLl8i1kjPs0I7R6i/SC9SkR1dVu8g12AK+mLDdJtGAQ0cJEHz8uV33TdvXYVND0SgNOIQVna3+ZcjGSJoDFXH/ebSxLqqclE9kS5cUJFjO5hUZi2XhRa2cYTXwgzfogHtHEYBy2fDLXWmDCgpjAVvquEjG5sm0V2z5DbTSN4Rv3ivGNWzmORHz50rqaw=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB8PR04MB6523.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(346002)(39830400003)(136003)(376002)(396003)(366004)(52116002)(83170400001)(54906003)(31696002)(31686004)(2616005)(7416002)(83380400001)(44832011)(30864003)(8676002)(36916002)(66556008)(36756003)(6486002)(16526019)(26005)(66946007)(956004)(42882007)(16576012)(38100700002)(53546011)(38350700002)(316002)(478600001)(66476007)(4326008)(5660300002)(186003)(8936002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R1g2QURYZ3ZqbEozNmkzclZ1eGhyTWRSUkNzcDArMm80T05kTEUzdmZOcHNX?=
 =?utf-8?B?bjhGV1pYZU9tSHJvN2dKekVLM3E5S1IzaW96cE90TlZmWnhpZFVvcmNJOW9K?=
 =?utf-8?B?Skt2RzBHZkoycXc2N1U1TTc2WWRHL2JhTEdmVzVyODZpOTVuRTgyVDM3SzRO?=
 =?utf-8?B?VC9FS0ozVCtLRU1IcUw4QzRleU9QVUg5L0RReEtPc1NCRkNXaWNvV0JDV2wx?=
 =?utf-8?B?aUtqY2hnb1R5Wk91WHR0R1NWRmMrd0lMOEk5bm9PZVl1WUdtcW5ORlkyb1Vo?=
 =?utf-8?B?MVFqMG5Eb1Fkd28vME4vMmRJMzhrbCtXU0VPWDFtQ1dYSmV2Q2Z5UDhwM2VB?=
 =?utf-8?B?MTUwS2hGMGNGTytSbzVXaWFRUnFZdGtZVlk0MGdBa1l1SFFocnVqN0M0VGtn?=
 =?utf-8?B?NFlYV1FBVldJQXBXV1FHNkkyMkdVMnJRdGQzblc5VkZJZXFRU0puaGIwTFN0?=
 =?utf-8?B?TkRtR0pTbFBqNTUvY3hoQ2xMMmtUdzVJZ2lPMXIxQkJ6Y3IwY283ZWxqQ3dx?=
 =?utf-8?B?SGJzaGpnTjZhd1lwaTljSE5nOWd5Q1BiYkR2Ukl2NVdseS9oVE4rTS9RY21W?=
 =?utf-8?B?bFdpUndGbGdrVE1DN3dhNFdYYWwyY3UrVDE5UnBPUzRSbC9jZ2FjM2ZVNytk?=
 =?utf-8?B?UExqajRJZHI4cXphQ3paZFVodmEvYWZFM3NaS0Y5MzQzcDVpV2JWckdxYmZH?=
 =?utf-8?B?OGlsaWlBSFV0VUR4K0hTNWFaOUhKdlloclVMczluQ1QzaU5YZVY5VjNsR2JW?=
 =?utf-8?B?VGtETDdwOGZTQjg5cWFvRUovQUhQRDB1R1JwdjFVa3N4SzdrTmdNMWQyQkRp?=
 =?utf-8?B?OVFuSi9DeWZnaGlYWFZqUGs1S2h6WlR0Y24rOHA2QVBBRHAzWitVQVJ6MlFG?=
 =?utf-8?B?NGNkNG9KRVd3UTdlRmlSejhGQWhOc2E4d21kYk0yQmFQeUJOM0Vvcm0zQS95?=
 =?utf-8?B?MjJsK2hwRmdpdHVHNlJPZWhWa29tODB2YjRNTG81Y2UrbFc1Z3ZERU9OcXdO?=
 =?utf-8?B?Q3E3dXhXZTNIMUlrdXhESTZabjZNTEJ0cVNkdlZmY1F4cVA1dlY0WUN3Mjc1?=
 =?utf-8?B?QUpIaDZzUStEbDFtdGZqWWp6UFM3ODBhNmc0WDFnRzBjYkFLUVpSZ1llaEt4?=
 =?utf-8?B?eE53V1hKK3JKMXc3U0dlWTRyS2gyVi9zTTdTZDNKZnppanVkQTBHVjFyUDZG?=
 =?utf-8?B?VWs5VE9Vd3lMM3BHUlY3RHprY3FrZ20wYkZDMDNZNjNERGFreVVTL2xLSlhV?=
 =?utf-8?B?NUd4R091QS81ekpKTzg5Sm03amRQL0tUTVpIS3lwVHdnM3dUVkhVckFXZUJS?=
 =?utf-8?B?RkJJSDYrVVFSU21OYlRhalBWcG5LZjhXRlhFYmt1Nk1RR2FkdmtRZnRVT2hF?=
 =?utf-8?B?dDJyelJoY3ZFTldmSEppanMzU3gxOFU1Z1ZmeE0wYVlzdm9oWWhqMmE5TVlW?=
 =?utf-8?B?SGxPVGcyRWF4T3kxeGd6Y2txblBsajRRSk96WXYvcmJ3RDU5WjBWMFlkK29D?=
 =?utf-8?B?ODlSS09zSTVtZXB0WlJKYlNKUjg5emJFRFJEdXQ5Z1o3ZkRqU0dPUFJPWGxX?=
 =?utf-8?B?WVZoUlhGTWJickxrMTloakZRdG13RGVmd3VvTmF6RzRaa2Y0REhNSDR2eVRu?=
 =?utf-8?B?RWJTbms4anJLTzQrU1pVVnBSNGgrZG14dTB4TzRZZS9QLzFUSHhpMVd3eHF0?=
 =?utf-8?B?emtvbXMwRTZXVkJuRUovbGYxOTdaR2RobWV0VkViUWJaMEtZOFBpOXhUeDRL?=
 =?utf-8?Q?nqXs8vdZVAmD4DqGEFYe2w4JTE5WSi85HQoTJhb?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7596
X-CodeTwo-MessageID: f3e1daa9-9891-4df1-a93c-a5e2be6e2d0d.20210517132315@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR01FT028.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9fb450e4-d8be-41ad-fa89-08d91936ec3a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2UNBskCwLte6G46f6bAhHRbXxHpEvxsBseGYSuklVyWgq8Y6c/k7LrZyuVUHOLTFSJ1NV9ZS6yhhIHA1LJeFIkuiYjI/xqqmHccxfRVl5viaUFPRM1kVwAvybSJ4/V0/FP9BzFXE2oYDzSWNH3GmecoOP8V89Zjexv6pCJjaCXSVcElDvcmsa6GQ3MjhHFn9wxpDPYmddybw968n7q+X3M2llO1HTNpgzvLVI0Cq6LTCc8FT6JKeEIxAz+maN+7Wx40rPmyIaQXTdB+npc89r4ZrrUgThMng+jKJbEDX1O8t0PC2KzgRhLH/2zpaYjeYbrVFtUwRb150ev5l3MysmzEAVx507jUr+IRN9Ov9hO6V+VJUlPNhLw4xjoeHQ4u8wt7mrikDSepDiAeEWA5RubbOmPrduaVNq6zVYZ0AkygaVf2iSj8vsYNbIslNSQH/60ugupNynGAf3AmvI3kv7KllMXOYTqCh4G8R/u/jmzjaLJv/u6XsXiq2j4j/U3DRoE+kZTKjD2ScoiefCC0JgeJ28Fqo7QQ1L8h6F922EAf2w68Ag8pi50wvKvV2hvRvC2qKbwaKWfzQ3zPrAqa3Aq3ugzDjVQTjrpvwev+QK+rl9Nd8xw0cUyNvqX3ICVkTFb1Q9dlB+inY2nsu3ICc3ovLwHAoxOD1hJIMV8OFhFL3g4z2a5qVDsHE+MEtLJzdkKnTe/pHnRn5jSTHa8bTYe0r8Wv7FzgLhEIooKKKc0dGrVUxIsuGQaKSzFbK+JTC6plWtB1jsPPdcpqYBrXJGw==
X-Forefront-Antispam-Report: CIP:52.166.56.231; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(136003)(396003)(39830400003)(376002)(346002)(36840700001)(46966006)(70206006)(15974865002)(70586007)(7416002)(44832011)(316002)(36756003)(6486002)(30864003)(82310400003)(8676002)(53546011)(336012)(478600001)(36916002)(54906003)(16576012)(8936002)(36860700001)(31686004)(2906002)(186003)(16526019)(7636003)(7596003)(2616005)(356005)(956004)(42882007)(83380400001)(4326008)(31696002)(26005)(47076005)(83170400001)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 13:23:17.7720 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e67b0a-2629-4633-d33f-08d91936ef38
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[52.166.56.231];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT028.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3148
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

Hi Marek,

I'm testing your driver, some remarks below.


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
On 05-05-2021 12:02, Marek Vasut wrote:
> Add driver for TI SN65DSI83 Single-link DSI to Single-link LVDS bridge
> and TI SN65DSI84 Single-link DSI to Dual-link or 2x Single-link LVDS
> bridge. TI SN65DSI85 is unsupported due to lack of hardware to test on,
> but easy to add.
>
> The driver operates the chip via I2C bus. Currently the LVDS clock are
> always derived from DSI clock lane, which is the usual mode of operation.
> Support for clock from external oscillator is not implemented, but it is
> easy to add if ever needed. Only RGB888 pixel format is implemented, the
> LVDS666 is not supported, but could be added if needed.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Cc: Philippe Schenker <philippe.schenker@toradex.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Valentin Raevsky <valentin@compulab.co.il>
> To: dri-devel@lists.freedesktop.org
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
> V2: - Use dev_err_probe()
>      - Set REG_RC_RESET as volatile
>      - Wait for PLL stabilization by polling REG_RC_LVDS_PLL
>      - Use ctx->mode =3D *adj instead of *mode in sn65dsi83_mode_set
>      - Add tested DSI84 support in dual-link mode
>      - Correctly set VCOM
>      - Fill in missing DSI CHB and LVDS CHB bits from DSI84 and DSI85
>        datasheets, with that all the reserved bits make far more sense
>        as the DSI83 and DSI84 seems to be reduced version of DSI85
> V3: - Handle the dual-link LVDS with two port panel or bridge
> ---
>   drivers/gpu/drm/bridge/Kconfig        |  10 +
>   drivers/gpu/drm/bridge/Makefile       |   1 +
>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 639 ++++++++++++++++++++++++++
>   3 files changed, 650 insertions(+)
>   create mode 100644 drivers/gpu/drm/bridge/ti-sn65dsi83.c
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index e83b8ad0d71b..32204c5f25b7 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -278,6 +278,16 @@ config DRM_TI_TFP410
>   	help
>   	  Texas Instruments TFP410 DVI/HDMI Transmitter driver
>  =20
> +config DRM_TI_SN65DSI83
> +	tristate "TI SN65DSI83 and SN65DSI84 DSI to LVDS bridge"
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	select REGMAP_I2C
> +	select DRM_PANEL
> +	select DRM_MIPI_DSI
> +	help
> +	  Texas Instruments SN65DSI83 and SN65DSI84 DSI to LVDS Bridge driver
> +
>   config DRM_TI_SN65DSI86
>   	tristate "TI SN65DSI86 DSI to eDP bridge"
>   	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Mak=
efile
> index b00f3b2ad572..7bb4c9df0415 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_DRM_TOSHIBA_TC358767) +=3D tc358767.o
>   obj-$(CONFIG_DRM_TOSHIBA_TC358768) +=3D tc358768.o
>   obj-$(CONFIG_DRM_TOSHIBA_TC358775) +=3D tc358775.o
>   obj-$(CONFIG_DRM_I2C_ADV7511) +=3D adv7511/
> +obj-$(CONFIG_DRM_TI_SN65DSI83) +=3D ti-sn65dsi83.o
>   obj-$(CONFIG_DRM_TI_SN65DSI86) +=3D ti-sn65dsi86.o
>   obj-$(CONFIG_DRM_TI_TFP410) +=3D ti-tfp410.o
>   obj-$(CONFIG_DRM_TI_TPD12S015) +=3D ti-tpd12s015.o
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi83.c
> new file mode 100644
> index 000000000000..471df09a1c07
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -0,0 +1,639 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TI SN65DSI83,84,85 driver
> + *
> + * Currently supported:
> + * - SN65DSI83
> + *   =3D 1x Single-link DSI ~ 1x Single-link LVDS
> + *   - Supported
> + *   - Single-link LVDS mode tested
> + * - SN65DSI84
> + *   =3D 1x Single-link DSI ~ 2x Single-link or 1x Dual-link LVDS
> + *   - Supported
> + *   - Dual-link LVDS mode tested
> + *   - 2x Single-link LVDS mode unsupported
> + *     (should be easy to add by someone who has the HW)
> + * - SN65DSI85
> + *   =3D 2x Single-link or 1x Dual-link DSI ~ 2x Single-link or 1x Dual-=
link LVDS
> + *   - Unsupported
> + *     (should be easy to add by someone who has the HW)
> + *
> + * Copyright (C) 2021 Marek Vasut <marex@denx.de>
> + *
> + * Based on previous work of:
> + * Valentin Raevsky <valentin@compulab.co.il>
> + * Philippe Schenker <philippe.schenker@toradex.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +
> +/* ID registers */
> +#define REG_ID(n)				(0x00 + (n))
> +/* Reset and clock registers */
> +#define REG_RC_RESET				0x09
> +#define  REG_RC_RESET_SOFT_RESET		BIT(0)
> +#define REG_RC_LVDS_PLL				0x0a
> +#define  REG_RC_LVDS_PLL_PLL_EN_STAT		BIT(7)
> +#define  REG_RC_LVDS_PLL_LVDS_CLK_RANGE(n)	(((n) & 0x7) << 1)
> +#define  REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY	BIT(0)
> +#define REG_RC_DSI_CLK				0x0b
> +#define  REG_RC_DSI_CLK_DSI_CLK_DIVIDER(n)	(((n) & 0x1f) << 3)
> +#define  REG_RC_DSI_CLK_REFCLK_MULTIPLIER(n)	((n) & 0x3)
> +#define REG_RC_PLL_EN				0x0d
> +#define  REG_RC_PLL_EN_PLL_EN			BIT(0)
> +/* DSI registers */
> +#define REG_DSI_LANE				0x10
> +#define  REG_DSI_LANE_LVDS_LINK_CFG_DUAL	BIT(5) /* dual or 2x single */
> +#define  REG_DSI_LANE_CHA_DSI_LANES(n)		(((n) & 0x3) << 3)
> +#define  REG_DSI_LANE_CHB_DSI_LANES(n)		(((n) & 0x3) << 1)
> +#define  REG_DSI_LANE_SOT_ERR_TOL_DIS		BIT(0)
> +#define REG_DSI_EQ				0x11
> +#define  REG_DSI_EQ_CHA_DSI_DATA_EQ(n)		(((n) & 0x3) << 6)
> +#define  REG_DSI_EQ_CHA_DSI_CLK_EQ(n)		(((n) & 0x3) << 2)
> +#define REG_DSI_CLK				0x12
> +#define  REG_DSI_CLK_CHA_DSI_CLK_RANGE(n)	((n) & 0xff)
> +/* LVDS registers */
> +#define REG_LVDS_FMT				0x18
> +#define  REG_LVDS_FMT_DE_NEG_POLARITY		BIT(7)
> +#define  REG_LVDS_FMT_HS_NEG_POLARITY		BIT(6)
> +#define  REG_LVDS_FMT_VS_NEG_POLARITY		BIT(5)
> +#define  REG_LVDS_FMT_LVDS_LINK_CFG		BIT(4)	/* 0:AB 1:A-only */
> +#define  REG_LVDS_FMT_CHA_24BPP_MODE		BIT(3)
> +#define  REG_LVDS_FMT_CHB_24BPP_MODE		BIT(2)
> +#define  REG_LVDS_FMT_CHA_24BPP_FORMAT1		BIT(1)
> +#define  REG_LVDS_FMT_CHB_24BPP_FORMAT1		BIT(0)
> +#define REG_LVDS_VCOM				0x19
> +#define  REG_LVDS_VCOM_CHA_LVDS_VOCM		BIT(6)
> +#define  REG_LVDS_VCOM_CHB_LVDS_VOCM		BIT(4)
> +#define  REG_LVDS_VCOM_CHA_LVDS_VOD_SWING(n)	(((n) & 0x3) << 2)
> +#define  REG_LVDS_VCOM_CHB_LVDS_VOD_SWING(n)	((n) & 0x3)
> +#define REG_LVDS_LANE				0x1a
> +#define  REG_LVDS_LANE_EVEN_ODD_SWAP		BIT(6)
> +#define  REG_LVDS_LANE_CHA_REVERSE_LVDS		BIT(5)
> +#define  REG_LVDS_LANE_CHB_REVERSE_LVDS		BIT(4)
> +#define  REG_LVDS_LANE_CHA_LVDS_TERM		BIT(1)
> +#define  REG_LVDS_LANE_CHB_LVDS_TERM		BIT(0)
> +#define REG_LVDS_CM				0x1b
> +#define  REG_LVDS_CM_CHA_LVDS_CM_ADJUST(n)	(((n) & 0x3) << 4)
> +#define  REG_LVDS_CM_CHB_LVDS_CM_ADJUST(n)	((n) & 0x3)
> +/* Video registers */
> +#define REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW	0x20
> +#define REG_VID_CHA_ACTIVE_LINE_LENGTH_HIGH	0x21
> +#define REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW	0x24
> +#define REG_VID_CHA_VERTICAL_DISPLAY_SIZE_HIGH	0x25
> +#define REG_VID_CHA_SYNC_DELAY_LOW		0x28
> +#define REG_VID_CHA_SYNC_DELAY_HIGH		0x29
> +#define REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW	0x2c
> +#define REG_VID_CHA_HSYNC_PULSE_WIDTH_HIGH	0x2d
> +#define REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW	0x30
> +#define REG_VID_CHA_VSYNC_PULSE_WIDTH_HIGH	0x31
> +#define REG_VID_CHA_HORIZONTAL_BACK_PORCH	0x34
> +#define REG_VID_CHA_VERTICAL_BACK_PORCH		0x36
> +#define REG_VID_CHA_HORIZONTAL_FRONT_PORCH	0x38
> +#define REG_VID_CHA_VERTICAL_FRONT_PORCH	0x3a
> +#define REG_VID_CHA_TEST_PATTERN		0x3c
> +/* IRQ registers */
> +#define REG_IRQ_GLOBAL				0xe0
> +#define  REG_IRQ_GLOBAL_IRQ_EN			BIT(0)
> +#define REG_IRQ_EN				0xe1
> +#define  REG_IRQ_EN_CHA_SYNCH_ERR_EN		BIT(7)
> +#define  REG_IRQ_EN_CHA_CRC_ERR_EN		BIT(6)
> +#define  REG_IRQ_EN_CHA_UNC_ECC_ERR_EN		BIT(5)
> +#define  REG_IRQ_EN_CHA_COR_ECC_ERR_EN		BIT(4)
> +#define  REG_IRQ_EN_CHA_LLP_ERR_EN		BIT(3)
> +#define  REG_IRQ_EN_CHA_SOT_BIT_ERR_EN		BIT(2)
> +#define  REG_IRQ_EN_CHA_PLL_UNLOCK_EN		BIT(0)
> +#define REG_IRQ_STAT				0xe5
> +#define  REG_IRQ_STAT_CHA_SYNCH_ERR		BIT(7)
> +#define  REG_IRQ_STAT_CHA_CRC_ERR		BIT(6)
> +#define  REG_IRQ_STAT_CHA_UNC_ECC_ERR		BIT(5)
> +#define  REG_IRQ_STAT_CHA_COR_ECC_ERR		BIT(4)
> +#define  REG_IRQ_STAT_CHA_LLP_ERR		BIT(3)
> +#define  REG_IRQ_STAT_CHA_SOT_BIT_ERR		BIT(2)
> +#define  REG_IRQ_STAT_CHA_PLL_UNLOCK		BIT(0)
> +
> +enum sn65dsi83_model {
> +	MODEL_SN65DSI83,
> +	MODEL_SN65DSI84,
> +};
> +
> +struct sn65dsi83 {
> +	struct drm_bridge		bridge;
> +	struct drm_display_mode		mode;
> +	struct device			*dev;
> +	struct regmap			*regmap;
> +	struct device_node		*host_node;
> +	struct mipi_dsi_device		*dsi;
> +	struct drm_bridge		*panel_bridge;
> +	struct gpio_desc		*enable_gpio;
> +	int				dsi_lanes;
> +	bool				lvds_dual_link;
> +	bool				lvds_dual_link_even_odd_swap;
> +};
> +
> +static const struct regmap_range sn65dsi83_readable_ranges[] =3D {
> +	regmap_reg_range(REG_ID(0), REG_ID(8)),
> +	regmap_reg_range(REG_RC_LVDS_PLL, REG_RC_DSI_CLK),
> +	regmap_reg_range(REG_RC_PLL_EN, REG_RC_PLL_EN),
> +	regmap_reg_range(REG_DSI_LANE, REG_DSI_CLK),
> +	regmap_reg_range(REG_LVDS_FMT, REG_LVDS_CM),
> +	regmap_reg_range(REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,
> +			 REG_VID_CHA_ACTIVE_LINE_LENGTH_HIGH),
> +	regmap_reg_range(REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW,
> +			 REG_VID_CHA_VERTICAL_DISPLAY_SIZE_HIGH),
> +	regmap_reg_range(REG_VID_CHA_SYNC_DELAY_LOW,
> +			 REG_VID_CHA_SYNC_DELAY_HIGH),
> +	regmap_reg_range(REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW,
> +			 REG_VID_CHA_HSYNC_PULSE_WIDTH_HIGH),
> +	regmap_reg_range(REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW,
> +			 REG_VID_CHA_VSYNC_PULSE_WIDTH_HIGH),
> +	regmap_reg_range(REG_VID_CHA_HORIZONTAL_BACK_PORCH,
> +			 REG_VID_CHA_HORIZONTAL_BACK_PORCH),
> +	regmap_reg_range(REG_VID_CHA_VERTICAL_BACK_PORCH,
> +			 REG_VID_CHA_VERTICAL_BACK_PORCH),
> +	regmap_reg_range(REG_VID_CHA_HORIZONTAL_FRONT_PORCH,
> +			 REG_VID_CHA_HORIZONTAL_FRONT_PORCH),
> +	regmap_reg_range(REG_VID_CHA_VERTICAL_FRONT_PORCH,
> +			 REG_VID_CHA_VERTICAL_FRONT_PORCH),
> +	regmap_reg_range(REG_VID_CHA_TEST_PATTERN, REG_VID_CHA_TEST_PATTERN),
> +	regmap_reg_range(REG_IRQ_GLOBAL, REG_IRQ_EN),
> +	regmap_reg_range(REG_IRQ_STAT, REG_IRQ_STAT),
> +};
> +
> +static const struct regmap_access_table sn65dsi83_readable_table =3D {
> +	.yes_ranges =3D sn65dsi83_readable_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(sn65dsi83_readable_ranges),
> +};
> +
> +static const struct regmap_range sn65dsi83_writeable_ranges[] =3D {
> +	regmap_reg_range(REG_RC_RESET, REG_RC_DSI_CLK),
> +	regmap_reg_range(REG_RC_PLL_EN, REG_RC_PLL_EN),
> +	regmap_reg_range(REG_DSI_LANE, REG_DSI_CLK),
> +	regmap_reg_range(REG_LVDS_FMT, REG_LVDS_CM),
> +	regmap_reg_range(REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,
> +			 REG_VID_CHA_ACTIVE_LINE_LENGTH_HIGH),
> +	regmap_reg_range(REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW,
> +			 REG_VID_CHA_VERTICAL_DISPLAY_SIZE_HIGH),
> +	regmap_reg_range(REG_VID_CHA_SYNC_DELAY_LOW,
> +			 REG_VID_CHA_SYNC_DELAY_HIGH),
> +	regmap_reg_range(REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW,
> +			 REG_VID_CHA_HSYNC_PULSE_WIDTH_HIGH),
> +	regmap_reg_range(REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW,
> +			 REG_VID_CHA_VSYNC_PULSE_WIDTH_HIGH),
> +	regmap_reg_range(REG_VID_CHA_HORIZONTAL_BACK_PORCH,
> +			 REG_VID_CHA_HORIZONTAL_BACK_PORCH),
> +	regmap_reg_range(REG_VID_CHA_VERTICAL_BACK_PORCH,
> +			 REG_VID_CHA_VERTICAL_BACK_PORCH),
> +	regmap_reg_range(REG_VID_CHA_HORIZONTAL_FRONT_PORCH,
> +			 REG_VID_CHA_HORIZONTAL_FRONT_PORCH),
> +	regmap_reg_range(REG_VID_CHA_VERTICAL_FRONT_PORCH,
> +			 REG_VID_CHA_VERTICAL_FRONT_PORCH),
> +	regmap_reg_range(REG_VID_CHA_TEST_PATTERN, REG_VID_CHA_TEST_PATTERN),
> +	regmap_reg_range(REG_IRQ_GLOBAL, REG_IRQ_EN),
> +	regmap_reg_range(REG_IRQ_STAT, REG_IRQ_STAT),
> +};
> +
> +static const struct regmap_access_table sn65dsi83_writeable_table =3D {
> +	.yes_ranges =3D sn65dsi83_writeable_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(sn65dsi83_writeable_ranges),
> +};
> +
> +static const struct regmap_range sn65dsi83_volatile_ranges[] =3D {
> +	regmap_reg_range(REG_RC_RESET, REG_RC_RESET),
> +	regmap_reg_range(REG_RC_LVDS_PLL, REG_RC_LVDS_PLL),
> +	regmap_reg_range(REG_IRQ_STAT, REG_IRQ_STAT),
> +};
> +
> +static const struct regmap_access_table sn65dsi83_volatile_table =3D {
> +	.yes_ranges =3D sn65dsi83_volatile_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(sn65dsi83_volatile_ranges),
> +};
> +
> +static const struct regmap_config sn65dsi83_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.rd_table =3D &sn65dsi83_readable_table,
> +	.wr_table =3D &sn65dsi83_writeable_table,
> +	.volatile_table =3D &sn65dsi83_volatile_table,
> +	.cache_type =3D REGCACHE_RBTREE,
> +	.max_register =3D REG_IRQ_STAT,
> +};
> +
> +static struct sn65dsi83 *bridge_to_sn65dsi83(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct sn65dsi83, bridge);
> +}
> +
> +static int sn65dsi83_attach(struct drm_bridge *bridge,
> +			    enum drm_bridge_attach_flags flags)
> +{
> +	struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
> +	struct device *dev =3D ctx->dev;
> +	struct mipi_dsi_device *dsi;
> +	struct mipi_dsi_host *host;
> +	int ret =3D 0;
> +
> +	const struct mipi_dsi_device_info info =3D {
> +		.type =3D "sn65dsi83",
> +		.channel =3D 0,
> +		.node =3D NULL,
> +	};
> +
> +	host =3D of_find_mipi_dsi_host_by_node(ctx->host_node);
> +	if (!host) {
> +		dev_err(dev, "failed to find dsi host\n");
> +		return -EPROBE_DEFER;
> +	}
> +
> +	dsi =3D mipi_dsi_device_register_full(host, &info);
> +	if (IS_ERR(dsi)) {
> +		return dev_err_probe(dev, PTR_ERR(dsi),
> +				     "failed to create dsi device\n");
> +	}
> +
> +	ctx->dsi =3D dsi;
> +
> +	dsi->lanes =3D ctx->dsi_lanes;
> +	dsi->format =3D MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
> +
> +	ret =3D mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to attach dsi to host\n");
> +		goto err_dsi_attach;
> +	}
> +
> +	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
> +				 &ctx->bridge, flags);
> +
> +err_dsi_attach:
> +	mipi_dsi_device_unregister(dsi);
> +	return ret;
> +}
> +
> +static void sn65dsi83_pre_enable(struct drm_bridge *bridge)
> +{
> +	struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
> +
> +	/*
> +	 * Reset the chip, pull EN line low for t_reset=3D10ms,
> +	 * then high for t_en=3D1ms.
> +	 */
> +	regcache_mark_dirty(ctx->regmap);
> +	gpiod_set_value(ctx->enable_gpio, 0);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value(ctx->enable_gpio, 1);
> +	usleep_range(1000, 1100);
Taking the chip out of reset here is not needed and may even disrupt=20
things, as the DSI hasn't set up anything yet so the clock may not be=20
running. I'd move this all into enable and get rid of the pre_enable=20
call. Similar for post_disable.
> +}
> +
> +static u8 sn65dsi83_get_lvds_range(struct sn65dsi83 *ctx)
> +{
> +	/*
> +	 * The encoding of the LVDS_CLK_RANGE is as follows:
> +	 * 000 - 25 MHz <=3D LVDS_CLK < 37.5 MHz
> +	 * 001 - 37.5 MHz <=3D LVDS_CLK < 62.5 MHz
> +	 * 010 - 62.5 MHz <=3D LVDS_CLK < 87.5 MHz
> +	 * 011 - 87.5 MHz <=3D LVDS_CLK < 112.5 MHz
> +	 * 100 - 112.5 MHz <=3D LVDS_CLK < 137.5 MHz
> +	 * 101 - 137.5 MHz <=3D LVDS_CLK <=3D 154 MHz
> +	 * which is a range of 12.5MHz..162.5MHz in 50MHz steps, except that
> +	 * the ends of the ranges are clamped to the supported range. Since
> +	 * sn65dsi83_mode_valid() already filters the valid modes and limits
> +	 * the clock to 25..154 MHz, the range calculation can be simplified
> +	 * as follows:
> +	 */
> +	int mode_clock =3D ctx->mode.clock;
> +
> +	if (ctx->lvds_dual_link)
> +		mode_clock /=3D 2;
> +
> +	return (mode_clock - 12500) / 25000;
> +}
> +
> +static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx)
> +{
> +	/*
> +	 * The encoding of the CHA_DSI_CLK_RANGE is as follows:
> +	 * 0x00 through 0x07 - Reserved
> +	 * 0x08 - 40 <=3D DSI_CLK < 45 MHz
> +	 * 0x09 - 45 <=3D DSI_CLK < 50 MHz
> +	 * ...
> +	 * 0x63 - 495 <=3D DSI_CLK < 500 MHz
> +	 * 0x64 - 500 MHz
> +	 * 0x65 through 0xFF - Reserved
> +	 * which is DSI clock in 5 MHz steps, clamped to 40..500 MHz.
> +	 * The DSI clock are calculated as:
> +	 *  DSI_CLK =3D mode clock * bpp / dsi_data_lanes / 2
> +	 * the 2 is there because the bus is DDR.
> +	 */
> +	return DIV_ROUND_UP(clamp((unsigned int)ctx->mode.clock *
> +			    mipi_dsi_pixel_format_to_bpp(ctx->dsi->format) /
> +			    ctx->dsi_lanes / 2, 40000U, 500000U), 5000U);
> +}
> +
> +static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
> +{
> +	/* The divider is (DSI_CLK / LVDS_CLK) - 1, which really is: */
> +	unsigned int dsi_div =3D mipi_dsi_pixel_format_to_bpp(ctx->dsi->format)=
;
> +
> +	dsi_div /=3D ctx->dsi_lanes;
> +
> +	if (!ctx->lvds_dual_link)
> +		dsi_div /=3D 2;
> +
> +	return dsi_div - 1;
> +}
> +
> +static void sn65dsi83_enable(struct drm_bridge *bridge)
> +{
> +	struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
> +	unsigned int pval;
> +	u16 val;
> +	int ret;
> +
> +	/* Clear reset, disable PLL */
> +	regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
Writing 0 to the RESET register is a no-op. Has no effect whatsoever,=20
just wasting time and code.
> +	regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> +
> +	/* Reference clock derived from DSI link clock. */
> +	regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
> +		REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx)) |
> +		REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
> +	regmap_write(ctx->regmap, REG_DSI_CLK,
> +		REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
> +	regmap_write(ctx->regmap, REG_RC_DSI_CLK,
> +		REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
> +
> +	/* Set number of DSI lanes and LVDS link config. */
> +	regmap_write(ctx->regmap, REG_DSI_LANE,
> +		REG_DSI_LANE_LVDS_LINK_CFG_DUAL |
> +		REG_DSI_LANE_CHA_DSI_LANES(~(ctx->dsi_lanes - 1)) |
> +		/* CHB is DSI85-only, set to default on DSI83/DSI84 */
> +		REG_DSI_LANE_CHB_DSI_LANES(3));
> +	/* No equalization. */
> +	regmap_write(ctx->regmap, REG_DSI_EQ, 0x00);
> +
> +	/* RGB888 is the only format supported so far. */
> +	val =3D (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC ?
> +	       REG_LVDS_FMT_HS_NEG_POLARITY : 0) |
> +	      (ctx->mode.flags & DRM_MODE_FLAG_NVSYNC ?
> +	       REG_LVDS_FMT_VS_NEG_POLARITY : 0) |
> +	      REG_LVDS_FMT_CHA_24BPP_MODE;
> +	if (ctx->lvds_dual_link)
> +		val |=3D REG_LVDS_FMT_CHB_24BPP_MODE;
> +	else
> +		val |=3D REG_LVDS_FMT_LVDS_LINK_CFG;
> +
> +	regmap_write(ctx->regmap, REG_LVDS_FMT, val);
> +	regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x05);
> +	regmap_write(ctx->regmap, REG_LVDS_LANE,
> +		(ctx->lvds_dual_link_even_odd_swap ?
> +		 REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
> +		REG_LVDS_LANE_CHA_LVDS_TERM |
> +		REG_LVDS_LANE_CHB_LVDS_TERM);
> +	regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
> +
> +	regmap_bulk_write(ctx->regmap, REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,
> +			  &ctx->mode.hdisplay, 2);

I think this ignores the endian format of the data. So this would only=20
work on little-endian systems, right?


> +	regmap_bulk_write(ctx->regmap, REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW,
> +			  &ctx->mode.vdisplay, 2);
> +	val =3D 32 + 1;	/* 32 + 1 pixel clock to ensure proper operation */
> +	regmap_bulk_write(ctx->regmap, REG_VID_CHA_SYNC_DELAY_LOW, &val, 2);
> +	val =3D ctx->mode.hsync_end - ctx->mode.hsync_start;
> +	regmap_bulk_write(ctx->regmap, REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW,
> +			  &val, 2);
> +	val =3D ctx->mode.vsync_end - ctx->mode.vsync_start;
> +	regmap_bulk_write(ctx->regmap, REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW,
> +			  &val, 2);
> +	regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_BACK_PORCH,
> +		     ctx->mode.htotal - ctx->mode.hsync_end);
> +	regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_BACK_PORCH,
> +		     ctx->mode.vtotal - ctx->mode.vsync_end);
> +	regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_FRONT_PORCH,
> +		     ctx->mode.hsync_start - ctx->mode.hdisplay);
> +	regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_FRONT_PORCH,
> +		     ctx->mode.vsync_start - ctx->mode.vdisplay);
> +	regmap_write(ctx->regmap, REG_VID_CHA_TEST_PATTERN, 0x00);
> +
> +	/* Enable PLL */
> +	regmap_write(ctx->regmap, REG_RC_PLL_EN, REG_RC_PLL_EN_PLL_EN);
> +	usleep_range(3000, 4000);
> +	ret =3D regmap_read_poll_timeout(ctx->regmap, REG_RC_LVDS_PLL, pval,
> +					pval & REG_RC_LVDS_PLL_PLL_EN_STAT,
> +					1000, 100000);
> +	if (ret) {
> +		dev_err(ctx->dev, "failed to lock PLL, ret=3D%i\n", ret);
> +		/* On failure, disable PLL again and exit. */
> +		regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> +		return;
> +	}
> +
> +	/* Trigger reset after CSR register update. */
> +	regmap_write(ctx->regmap, REG_RC_RESET, REG_RC_RESET_SOFT_RESET);
> +
> +	/* Clear all errors that got asserted during initialization. */
> +	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
> +	regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
Just write 0xFF to the IRQ_STAT register. Then there's no need to read=20
it first.
> +}
> +
> +static void sn65dsi83_disable(struct drm_bridge *bridge)
> +{
> +	struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
> +
> +	/* Clear reset, disable PLL */
> +	regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
Writing 0 to the RESET register is a no-op. Has no effect whatsoever,=20
just wasting time and code.
> +	regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> +}
> +
> +static void sn65dsi83_post_disable(struct drm_bridge *bridge)
> +{
> +	struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
> +
> +	/* Put the chip in reset, pull EN line low. */
> +	gpiod_set_value(ctx->enable_gpio, 0);
See my remark on pre_enable, just move this bit into disable.
> +}
> +
> +static enum drm_mode_status
> +sn65dsi83_mode_valid(struct drm_bridge *bridge,
> +		     const struct drm_display_info *info,
> +		     const struct drm_display_mode *mode)
> +{
> +	/* LVDS output clock range 25..154 MHz */
> +	if (mode->clock < 25000)
> +		return MODE_CLOCK_LOW;
> +	if (mode->clock > 154000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static void sn65dsi83_mode_set(struct drm_bridge *bridge,
> +			       const struct drm_display_mode *mode,
> +			       const struct drm_display_mode *adj)
> +{
> +	struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
> +
> +	ctx->mode =3D *adj;
> +}
> +
> +static const struct drm_bridge_funcs sn65dsi83_funcs =3D {
> +	.attach		=3D sn65dsi83_attach,
> +	.pre_enable	=3D sn65dsi83_pre_enable,
> +	.enable		=3D sn65dsi83_enable,
> +	.disable	=3D sn65dsi83_disable,
> +	.post_disable	=3D sn65dsi83_post_disable,
> +	.mode_valid	=3D sn65dsi83_mode_valid,
> +	.mode_set	=3D sn65dsi83_mode_set,
> +};
> +
> +static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_mode=
l model)
> +{
> +	struct drm_bridge *panel_bridge;
> +	struct device *dev =3D ctx->dev;
> +	struct device_node *endpoint;
> +	struct drm_panel *panel;
> +	int ret;
> +
> +	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> +	ctx->dsi_lanes =3D of_property_count_u32_elems(endpoint, "data-lanes");
> +	ctx->host_node =3D of_graph_get_remote_port_parent(endpoint);
> +	of_node_put(endpoint);
> +
> +	if (ctx->dsi_lanes < 0 || ctx->dsi_lanes > 4)
> +		return -EINVAL;
> +	if (!ctx->host_node)
> +		return -ENODEV;
> +
> +	ctx->lvds_dual_link =3D false;
> +	ctx->lvds_dual_link_even_odd_swap =3D false;
> +	if (model !=3D MODEL_SN65DSI83) {
> +		struct device_node *port2, *port3;
> +		int dual_link;
> +
> +		port2 =3D of_graph_get_port_by_id(dev->of_node, 2);
> +		port3 =3D of_graph_get_port_by_id(dev->of_node, 3);
> +		dual_link =3D drm_of_lvds_get_dual_link_pixel_order(port2, port3);
> +		of_node_put(port2);
> +		of_node_put(port3);
> +
> +		if (dual_link =3D=3D DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS) {
> +			ctx->lvds_dual_link =3D true;
> +			/* Odd pixels to LVDS Channel A, even pixels to B */
> +			ctx->lvds_dual_link_even_odd_swap =3D false;
> +		} else if (dual_link =3D=3D DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
> +			ctx->lvds_dual_link =3D true;
> +			/* Even pixels to LVDS Channel A, odd pixels to B */
> +			ctx->lvds_dual_link_even_odd_swap =3D true;
> +		}
> +	}
> +
> +	ret =3D drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &panel, &panel_=
bridge);
> +	if (ret < 0)
> +		return ret;
> +	if (panel) {
> +		panel_bridge =3D devm_drm_panel_bridge_add(dev, panel);
> +		if (IS_ERR(panel_bridge))
> +			return PTR_ERR(panel_bridge);
> +	}
> +
> +	ctx->panel_bridge =3D panel_bridge;
> +
> +	return 0;
> +}
> +
> +static int sn65dsi83_probe(struct i2c_client *client,
> +			   const struct i2c_device_id *id)
> +{
> +	struct device *dev =3D &client->dev;
> +	enum sn65dsi83_model model;
> +	struct sn65dsi83 *ctx;
> +	int ret;
> +
> +	ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->dev =3D dev;
> +
> +	if (dev->of_node)
> +		model =3D (enum sn65dsi83_model)of_device_get_match_data(dev);
> +	else
> +		model =3D id->driver_data;
> +
> +	ctx->enable_gpio =3D devm_gpiod_get(ctx->dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->enable_gpio))
> +		return PTR_ERR(ctx->enable_gpio);
> +
> +	ret =3D sn65dsi83_parse_dt(ctx, model);
> +	if (ret)
> +		return ret;
> +
> +	ctx->regmap =3D devm_regmap_init_i2c(client, &sn65dsi83_regmap_config);
> +	if (IS_ERR(ctx->regmap))
> +		return PTR_ERR(ctx->regmap);
> +
> +	dev_set_drvdata(dev, ctx);
> +	i2c_set_clientdata(client, ctx);
> +
> +	ctx->bridge.funcs =3D &sn65dsi83_funcs;
> +	ctx->bridge.of_node =3D dev->of_node;
> +	drm_bridge_add(&ctx->bridge);
> +
> +	return 0;
> +}
> +
> +static int sn65dsi83_remove(struct i2c_client *client)
> +{
> +	struct sn65dsi83 *ctx =3D i2c_get_clientdata(client);
> +
> +	mipi_dsi_detach(ctx->dsi);
> +	mipi_dsi_device_unregister(ctx->dsi);
> +	drm_bridge_remove(&ctx->bridge);
> +	of_node_put(ctx->host_node);
> +
> +	return 0;
> +}
> +
> +static struct i2c_device_id sn65dsi83_id[] =3D {
> +	{ "ti,sn65dsi83", MODEL_SN65DSI83 },
> +	{ "ti,sn65dsi84", MODEL_SN65DSI84 },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, sn65dsi83_id);
> +
> +static const struct of_device_id sn65dsi83_match_table[] =3D {
> +	{ .compatible =3D "ti,sn65dsi83", .data =3D (void *)MODEL_SN65DSI83 },
> +	{ .compatible =3D "ti,sn65dsi84", .data =3D (void *)MODEL_SN65DSI84 },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, sn65dsi83_match_table);
> +
> +static struct i2c_driver sn65dsi83_driver =3D {
> +	.probe =3D sn65dsi83_probe,
> +	.remove =3D sn65dsi83_remove,
> +	.id_table =3D sn65dsi83_id,
> +	.driver =3D {
> +		.name =3D "sn65dsi83",
> +		.of_match_table =3D sn65dsi83_match_table,
> +	},
> +};
> +module_i2c_driver(sn65dsi83_driver);
> +
> +MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
> +MODULE_DESCRIPTION("TI SN65DSI83 DSI to LVDS bridge driver");
> +MODULE_LICENSE("GPL v2");

--=20
Mike Looijmans

