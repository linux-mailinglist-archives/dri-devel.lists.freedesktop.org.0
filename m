Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9C8803DFA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 20:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBB610E3CC;
	Mon,  4 Dec 2023 19:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 469 seconds by postgrey-1.36 at gabe;
 Mon, 04 Dec 2023 16:11:45 UTC
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D87A10E33A;
 Mon,  4 Dec 2023 16:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1701706305; x=1733242305;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=6u5YTk6DEWnxOgD5MmLMI0tZynO2Y2LILJcyXBleFHo=;
 b=er+ecDkHSmC9y25GO5ckD/rn/t0qfgDv2ICQ2m2aQqK6INTiM9YGqaZV
 IDt0j8W4oHZCxZdmQ75hBHtSx3r2UuWzDafqKRXle9NjNeZoC26HnTt7k
 FaOZ1YATgmmAOJbdq44UqxVEMvKGu7lyFD0Z4moyWxvMybkBA0znJocNQ
 XmXhZH86OKCRXNlvDxNkUd3OA0EVSKGYusV4VkmZMXcELXAS1FDffsq+H
 By4lDfEQusWZinNthF9AjzjrI6Ig931ZYRxE7fTQuTAwhp3W92fM+gro+
 nOuoH8jYz2L5bLq6G4eVkTK6hVx8xvwJeg6KoHQ387ntZqvhfp5T3t3ko A==;
X-CSE-ConnectionGUID: RXGd1JzjQQOCKEjLnb4CAw==
X-CSE-MsgGUID: eq3qDhoRR3abv5q6IcdtaQ==
X-IronPort-AV: E=Sophos;i="6.04,250,1695657600"; 
   d="scan'208";a="3967081"
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hgst.iphmx.com with ESMTP; 05 Dec 2023 00:03:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0sFAgg9jRoy2QVFOzupSWAOHQdfrN48V/hMO8KaSUEkDMHVAs2vBLjAbt/MTZcE1vpDMHjojo35Kfy6vPsxIBPX3nSfjcFfKN2L1smCkJsqgLr8do5za9h0Ovrr9lUcsXt8wz/C19P92LcBmingJ+ZsnszKhM5OwPce9gorfXqEjararANYfbS01KDnw2+3DfbaNtsp2TV6dmB0R494yZ8WX7T96rjGseC1n5L3OqPO9Mrvv2XrV4heqVEq94JRXkstxZoxSgTaTp7pfXeOuUTE9+o/gd2PaCJKHvJNWkSKPhALoERkheG9hyARqvHrQFP7bch0I9ZFMo0ty5mTCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJAqSE1DwdlYMGe5sd0S2Z9quPCn4sf/ygxCV+Ud63Q=;
 b=KteHXaRG4BsnEuil7/vEX7UM6VG/K10uxPA/D7CrelU1jCfVs86DOLPX4hnP6iKhVFCBH/kv2ydGpPLpWPwKfrZzk424tDXBtxwy0+3JLLh5S7jCKXNUgtBzvhhiXHBbyNOqfVWIPzj+rj1cZT+2KjskHTZ9IwgVHs8wJp+2IBygmkHcayw99wvy1eePXkt1vZK9NyMs1kUM7Eyr6z697OdNxCeMg9HCSaSYayQiMgbfGkGJaLO5+lgXFKzwXb9eTNvJgiYodjkpp9uJx+ELZKJoSGE0kEZG9kHLFgyUkKuTFfoaUFOFL7l3Jpfkm39O7E53wQJKwV3STIEPYskwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJAqSE1DwdlYMGe5sd0S2Z9quPCn4sf/ygxCV+Ud63Q=;
 b=sjAbVveGyjDKbd2X4DgAviSBf8LkFm+ResNdEXCIhmv7mv0setXog/ATyUizTvrLEKnTt5dJ/auJZVWjAn4wCJ9U00M1u8L4xdRzJgfXnGVDSDsxrXkgOBZH1KZLfeD6g5AKAsKojBHLcOWYwz9a4khnxkCP85ttV14N58B9K4c=
Received: from SJ0PR04MB7776.namprd04.prod.outlook.com (2603:10b6:a03:300::11)
 by SJ0PR04MB7263.namprd04.prod.outlook.com (2603:10b6:a03:29e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Mon, 4 Dec
 2023 16:03:47 +0000
Received: from SJ0PR04MB7776.namprd04.prod.outlook.com
 ([fe80::9511:64b5:654e:7a8a]) by SJ0PR04MB7776.namprd04.prod.outlook.com
 ([fe80::9511:64b5:654e:7a8a%4]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 16:03:47 +0000
From: Naohiro Aota <Naohiro.Aota@wdc.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Performance drop due to alloc_workqueue() misuse and recent change
Thread-Topic: Performance drop due to alloc_workqueue() misuse and recent
 change
Thread-Index: AQHaJst2DrltZgUPc0+0c5JqMqZ1aA==
Date: Mon, 4 Dec 2023 16:03:47 +0000
Message-ID: <dbu6wiwu3sdhmhikb2w6lns7b27gbobfavhjj57kwi2quafgwl@htjcc5oikcr3>
Accept-Language: ja-JP, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB7776:EE_|SJ0PR04MB7263:EE_
x-ms-office365-filtering-correlation-id: 14b1b8b6-3d5d-4b15-bfe5-08dbf4e29941
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vm+8YZI1X28OILC7M6WWiHOq8z3Oz6aJ9cfuK/9N8axIHOImG1m5DdK1qQXqXiI3vd6cI/fkagewknUyS4U4URTy+XOHaj/V0wganxERlMatItj7U3f+X6TbnwKc7k/RjrnN7rfWr+JcUY+CVtG3LCgSeSmA8pHlvzVgwnDqS2R4/lUxYPuvbFaISU0QZPgtyT4vntLvt3yKO0rfbTjOB+ymzSb5OeEk9ppGf3F+94Dx4AI1WgMBLyRBTnB6N77jDSqbdrsrWY9WjVZIGSKTfRvyOvhU5DeapF2HPeEitoCWLq2+SaktiO4dRIbldo1PfCcLG4SmE6fqQb+f8Opw0fJL/s/L6rG/0v+2jQXJTeaaKdyLb3TyvMCHpjJuuZ4ne8eEQuEhENfcqvYkTgeM+pMxWqV85MdtB050ctPDU+OjQx8mSr2qUZDHavhcswCENptCoCaK4bB70GI256HFdDb1stPpl448VrWu5K9UfzGHN+9FnCp6vuqhkrJETQ26l5UxP3+Z+XzMTgMd9GgrHYYwhWCz4ACkACQ3NPnXbdAe6CFGp29Qg4OU4mko3Ez7iSrOMz4/LLUBAnonsQpKrfrsfw5mEs4pjYPWcUNg5tydGUMagqjc5pMPcV+Ymddb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7776.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(136003)(366004)(376002)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(41300700001)(91956017)(478600001)(316002)(54906003)(66476007)(8936002)(66946007)(8676002)(6486002)(19627235002)(110136005)(64756008)(76116006)(66446008)(4326008)(5660300002)(86362001)(7406005)(7416002)(2906002)(82960400001)(122000001)(66556008)(6512007)(26005)(83380400001)(6506007)(71200400001)(38100700002)(9686003)(38070700009)(33716001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j+KsPRv8/bQqiQH0QsLGZctWR4vdyu7XJZy/rTLsOSO8nDndW/4PMwL/X8wx?=
 =?us-ascii?Q?wiwHtYoaIyXpY9cOS3SQl5/qD6SVd1AAEJKh9yMu+1zC2tE/5AWhwc/yHk0U?=
 =?us-ascii?Q?FE9vN9qpMMHr4TaSsPwJvq7wZfJc7YqzMX8U4sT9pEc02NKiddz5jlfoY5hG?=
 =?us-ascii?Q?hpgo7sV0u8VXoYBnm5mhvj82wnm+F+c1jLAzbhqlit2c7rLGWogAc8E5w+sP?=
 =?us-ascii?Q?KwlpTTuZ17Z+W8qdD9PrEBDxOmHveyWKzlvmLk4sl+7sBZXjU9YEqCF4LH6B?=
 =?us-ascii?Q?LlIUtBIpBSUJ8VCXL5Llx57+Pfu/17790M9o/gE/TNVhULM1QApswCHgY3oi?=
 =?us-ascii?Q?JXBwxfcPN5+6MMNmxFDAQoITn/ZguHzwIr4mSO2ZQjPA8B2FxjiezeNNOdKZ?=
 =?us-ascii?Q?JwMVCNZuTx3QJ5wfAQUwQiy636xPmKx/sXzZYu92KaW/npW+1Cynu6cpx0K7?=
 =?us-ascii?Q?Ak5g/82rLz/a8zgi8aeHvv5faeOYjBH73x29ECzro18TQQEmNdz+DtOB/N1z?=
 =?us-ascii?Q?LStu41QjqoforOGVF37mQ1TNYANwSRLUsbFo5izHFL0WRf0LJC6Owh1PByD4?=
 =?us-ascii?Q?ZERVA6I/OocOF0rw0r/shFdxSvKkVdksm4SSDSj4WXXgla8M86G7Ds39wmzy?=
 =?us-ascii?Q?Srh0esHApUQyHfkUbE7PFdrX3i2O7FKCoPzqwlI3gKVZgxv0YIl53E7x27Qi?=
 =?us-ascii?Q?r1jxfuAj5Jw3exmLTq58237fmDwib1M26HFUB0s0wi9BMoL4Ydp3J57FZfsl?=
 =?us-ascii?Q?9JfRuCDjepEC/VCXNWZprGC7suO9+T0pC3NHYiLwoFKmpucL5koyZ89NEh25?=
 =?us-ascii?Q?1a5C0yEujkylr+IJyTDBgP2ka/SKxbvmlcP3xMnTIq/tzS/a1rzbfR/v5Ytq?=
 =?us-ascii?Q?ATKjUvvLGaZOvCAotl8Meuts6O5B1iEUWcehHxxGzNcuZJgdeMzPlpQ5/xLU?=
 =?us-ascii?Q?imyy33+QODBx3IjTaP6aVoZ538Ox49wPWyaM3bUMgCyFYa+EUugTjrSjgnjo?=
 =?us-ascii?Q?N9+fgO7t0gUmclpg0SP2VZw7MesW/28nN/xkt5w+/vQi3uAPnk9zJtc66+fa?=
 =?us-ascii?Q?YzrIN3McFDWLN4XGOdzQGZ04yUHCjhD+izDCCP2xSramFCZst6sriRqmyRO8?=
 =?us-ascii?Q?uBc7L4Ic6Y5WJ41XwWtsTZP9lqOsjzMnwD0G0oH6/oEviMRgz+pqU/KXf/sh?=
 =?us-ascii?Q?5jtFxa8msulm5WpzakkAEY7ZGqlShgmR5ggeBM3vXyvQ1uBfpOfPdueWIJXE?=
 =?us-ascii?Q?IgpCWVHLoST/aNkMGQTNdHICl6MBvBRp+OW1Phl4eQDNW5bg50X2w8pL8btU?=
 =?us-ascii?Q?G5DM0wSdmZ9W/+OM7V6puTxQgASweFrLc7dN2UbESHCUZilu5XdLCnqnCe1n?=
 =?us-ascii?Q?tq52CRhHdEYeBBCBh+2HbmZZdqVezNt/LCgilXRwXZN4nSbk9aC1ym6M8ujf?=
 =?us-ascii?Q?KOGI6qCJ0jH3SQXk77FNP3NVhS2BK4tVZEBXS/FZTmZeFyKcrWmjSIxnWZV/?=
 =?us-ascii?Q?/I27lGBhsq7GBTkr5dFBu9/z/S3/DUz8kgeTrjWIsCIWk7ywjOwp2vT78S6h?=
 =?us-ascii?Q?6zAHhhPRpS+ZrN0sWt9gypmnUMbzYvHB7j/fYQrcX42Xg8TuDsLhVjH7A+dn?=
 =?us-ascii?Q?eg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <22F9E65C59846241A1DB30938AC4A5FD@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?4yUaCuEtjLOvaGDjN0S1vwBhvGpctH16i5NYJFA0pw2YDoI1S5/jpgleB4Sl?=
 =?us-ascii?Q?Y76wG+K8GzfsqIUoH58V4ogBgzPRn96CIOUXtyObv31sBu/Qng8TPv1MTiNy?=
 =?us-ascii?Q?80Gi+pmsywzUORH7l4Ktg18JawdvoAmFClqlO93GMSi+DWKUxYx5YOdSBGfQ?=
 =?us-ascii?Q?HRmm46HxW1YYM66yhsa0XxFmlBmjcrV0pDr4N4aTTsWVs71sBqimTXrwjpmv?=
 =?us-ascii?Q?0dA+YuqC/K3x+G4OCxAQV7AQ7vIvVouJqkS2e+Jxrs53jNUVSgzG2u459pcj?=
 =?us-ascii?Q?bXi+E2xyDr71RBUqXBwl4IdE3Vwon3qYYYQL1dUVXEI+cZJ19+3hCnINPqN3?=
 =?us-ascii?Q?b2s9NJ0f8APjhQKQ7xMg0CydcsJ/V0HkDwYmyBoVUif1vVoWTLla0fo6d2W3?=
 =?us-ascii?Q?pUJgVOZhNQw/NXpN2Kr/nEJrJoY42fagezjipvFwAIWo/T46fZYJWPMGgu+9?=
 =?us-ascii?Q?jRlG9JtWZxYVb9NNkYJNFfJ44/9KqaSGMUULxiLEEqLdnYnAM+Pu6wiwJsC+?=
 =?us-ascii?Q?SlxPGPYpDv4LPdSKdTWemoAg0y17vTamcxgL9tYHOZnk6i7POLrvxR6DE9o/?=
 =?us-ascii?Q?30H9yc05GcF39Hc0/HfaLUlBiC9MEbZVd4WFZLbeTYOBZdQ2x7LImeKFxl8e?=
 =?us-ascii?Q?MQ7ccN0fzGW5NKOZylbCANE/o8MMsjve0E9IQcERzgRj4Jv7SKFxjdtUZqGp?=
 =?us-ascii?Q?AK2gMVjwASLR9izMuqRef0Q66WoPExrx5dVx1gIpQbAUBa1EyHI9sOyr4W7F?=
 =?us-ascii?Q?3ikpJ634Su1l9tH/Hmizjg95G4FpEQ7QlHePXyPkJ9t2u4Rln3CHPquqVtFo?=
 =?us-ascii?Q?KUj8w7LyvpF52bp6JMBDqYE5lWsIbTvsiXV2ePlcF+pmNKmK2HwfDsZyUQJy?=
 =?us-ascii?Q?DePzFuKBaTXWGLaE5cLQIyQ9i8Z+e/hJq+sk9xV0BW/28+ububKioRGw4688?=
 =?us-ascii?Q?1JcgWJ8PU9oIgCoITcy6MJlDpOBYjHyfd7D50tXbWNvsaSqU+a/HAwOyW1Oz?=
 =?us-ascii?Q?CRXyh11/rV45hdszNnWFvoXS8QljU/bqpD2g4uBzP6rTQsnSfmE2Sq5tWop7?=
 =?us-ascii?Q?iZg6dm72vBSXfQZ81fxeq5/tJY2dHz5VAdbVOClNa4jktktIAlDrrVv8Y0+r?=
 =?us-ascii?Q?BtPYlOAg9J+GpZpx/2PaUUtfkptPvIB+yjm3sShY32y28B6GJ2MWyN8Ii46g?=
 =?us-ascii?Q?Hde0RlJc4n4vsilUj3JnZVOTCo0Tf7lraasNJhi/sJ6txDE2FgIzSWlN1ruT?=
 =?us-ascii?Q?TIbWLeFmUGyLryW8eYOZYSPIlx33/ioId24TmUN8HN/rtYgEJ+5sWFUvolOx?=
 =?us-ascii?Q?S88ClA4b3uYoDD31n8Fle2428J0xxsKYUSPE5fkwgS77+611ccKDc5A8LGCz?=
 =?us-ascii?Q?04feASjVaawHaxrvSDLcpTqsVo3c3Z9yOM5Ljhmp6mUMCOd/SQ=3D=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7776.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b1b8b6-3d5d-4b15-bfe5-08dbf4e29941
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 16:03:47.4049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OSCmkbRh8n8vcbIS1VZaFJ/iwoKklNFRq1yI+59VAycKCqtgB8CdeOIO6fVe7X6AHWwLpdqObwIgs8E8UvLmEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7263
X-Mailman-Approved-At: Mon, 04 Dec 2023 19:02:09 +0000
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "gfs2@lists.linux.dev" <gfs2@lists.linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "oss-drivers@corigine.com" <oss-drivers@corigine.com>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 "open-iscsi@googlegroups.com" <open-iscsi@googlegroups.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "coreteam@netfilter.org" <coreteam@netfilter.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
 "ntb@lists.linux.dev" <ntb@lists.linux.dev>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recently, commit 636b927eba5b ("workqueue: Make unbound workqueues to use
per-cpu pool_workqueues") changed WQ_UNBOUND workqueue's behavior. It
changed the meaning of alloc_workqueue()'s max_active from an upper limit
imposed per NUMA node to a limit per CPU. As a result, massive number of
workers can be running at the same time, especially if the workqueue user
thinks the max_active is a global limit.

Actually, it is already written it is per-CPU limit in the documentation
before the commit. However, several callers seem to misuse max_active,
maybe thinking it is a global limit. It is an unexpected behavior change
for them.

For example, these callers set max_active =3D num_online_cpus(), which is a
suspicious limit applying to per-CPU. This config means we can have nr_cpu
* nr_cpu active tasks working at the same time.

fs/f2fs/data.c: sbi->post_read_wq =3D alloc_workqueue("f2fs_post_read_wq",
fs/f2fs/data.c-                                          WQ_UNBOUND | WQ_HI=
GHPRI,
fs/f2fs/data.c-                                          num_online_cpus())=
;

fs/crypto/crypto.c:     fscrypt_read_workqueue =3D alloc_workqueue("fscrypt=
_read_queue",
fs/crypto/crypto.c-                                              WQ_UNBOUND=
 | WQ_HIGHPRI,
fs/crypto/crypto.c-                                              num_online=
_cpus());

fs/verity/verify.c:     fsverity_read_workqueue =3D alloc_workqueue("fsveri=
ty_read_queue",
fs/verity/verify.c-                                               WQ_HIGHPR=
I,
fs/verity/verify.c-                                               num_onlin=
e_cpus());

drivers/crypto/hisilicon/qm.c:  qm->wq =3D alloc_workqueue("%s", WQ_HIGHPRI=
 | WQ_MEM_RECLAIM |
drivers/crypto/hisilicon/qm.c-                           WQ_UNBOUND, num_on=
line_cpus(),
drivers/crypto/hisilicon/qm.c-                           pci_name(qm->pdev)=
);

block/blk-crypto-fallback.c:    blk_crypto_wq =3D alloc_workqueue("blk_cryp=
to_wq",
block/blk-crypto-fallback.c-                                    WQ_UNBOUND =
| WQ_HIGHPRI |
block/blk-crypto-fallback.c-                                    WQ_MEM_RECL=
AIM, num_online_cpus());

drivers/md/dm-crypt.c:          cc->crypt_queue =3D alloc_workqueue("kcrypt=
d/%s",
drivers/md/dm-crypt.c-                                            WQ_CPU_IN=
TENSIVE | WQ_MEM_RECLAIM | WQ_UNBOUND,
drivers/md/dm-crypt.c-                                            num_onlin=
e_cpus(), devname);

Furthermore, the change affects performance in a certain case.

Btrfs creates several WQ_UNBOUND workqueues with a default max_active =3D
min(NRCPUS + 2, 8). As my machine has 96 CPUs with NUMA disabled, this
max_active config allows running over 700 active works. Before the commit,
it is limited to 8 if NUMA is disabled or limited to 16 if NUMA nodes is 2.

I reverted the workqueue code back to before the commit, and I ran the
following fio command on RAID0 btrfs on 6 SSDs.

fio --group_reporting --eta=3Dalways --eta-interval=3D30s --eta-newline=3D3=
0s \
    --rw=3Dwrite --fallocate=3Dnone \
    --direct=3D1 --ioengine=3Dlibaio --iodepth=3D32 \
    --filesize=3D100G \
    --blocksize=3D64k \
    --time_based --runtime=3D300s \
    --end_fsync=3D1 \
    --directory=3D${MNT} \
    --name=3Dwriter --numjobs=3D32

By changing workqueue's max_active, the result varies.

- wq max_active=3D8   (intended limit by btrfs?)
  WRITE: bw=3D2495MiB/s (2616MB/s), 2495MiB/s-2495MiB/s (2616MB/s-2616MB/s)=
, io=3D753GiB (808GB), run=3D308953-308953msec
- wq max_active=3D16  (actual limit on 2 NUMA nodes setup)
  WRITE: bw=3D1736MiB/s (1820MB/s), 1736MiB/s-1736MiB/s (1820MB/s-1820MB/s)=
, io=3D670GiB (720GB), run=3D395532-395532msec
- wq max_active=3D768 (simulating current limit)
  WRITE: bw=3D1276MiB/s (1338MB/s), 1276MiB/s-1276MiB/s (1338MB/s-1338MB/s)=
, io=3D375GiB (403GB), run=3D300984-300984msec

The current performance is slower than the previous limit (max_active=3D16)
by 27%, or it is 50% slower than the intended limit.  The performance drop
might be due to contention of the btrfs-endio-write works. There are over
700 kworker instances were created and 100 works are on the 'D' state
competing for a lock.

More specifically, I tested the same workload on the commit.

- At commit 636b927eba5b ("workqueue: Make unbound workqueues to use per-cp=
u pool_workqueues")
  WRITE: bw=3D1191MiB/s (1249MB/s), 1191MiB/s-1191MiB/s (1249MB/s-1249MB/s)=
, io=3D350GiB (376GB), run=3D300714-300714msec
- At the previous commit =3D 4cbfd3de73 ("workqueue: Call wq_update_unbound=
_numa() on all CPUs in NUMA node on CPU hotplug")
  WRITE: bw=3D1747MiB/s (1832MB/s), 1747MiB/s-1747MiB/s (1832MB/s-1832MB/s)=
, io=3D748GiB (803GB), run=3D438134-438134msec

So, it is -31.8% performance down with the commit.

In summary, we misuse max_active, considering it is a global limit. And,
the recent commit introduced a huge performance drop in some cases.  We
need to review alloc_workqueue() usage to check if its max_active setting
is proper or not.=
