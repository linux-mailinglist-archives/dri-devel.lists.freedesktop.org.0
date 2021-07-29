Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B72B03DAC36
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 21:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074836EE48;
	Thu, 29 Jul 2021 19:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF966EE46;
 Thu, 29 Jul 2021 19:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627588509; x=1659124509;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Tp04NA3NDX5qgyxk3HCGnlHNL+XtyU5aCOPquUjszcE=;
 b=q+sSjkvpZtgE0pNitmBwWHwjq7YDEGy+f3MaBSFey7UgxPWbBo0TLH8T
 Cv3smFdovB1Rtk6MEx7c+Wzyqcn6zRsBXU0tOzQmusu7dzDh+79DQGb6D
 NE6B1fVSvuHxwLh2VphPNbylRPKRM2URQwBf6QRLWWwwJbrMkm/KqH0RY
 gwFkPu9P+cRYmJDQD+TvNFhTtuNKIvqfkTUIH725CL9mQYrOmZ/73KTVX
 a+C+rk5EILxQe/lTgA9QEmelFhwA++3tBfDUedSBu2rHacn1rudhnF9VG
 11WzPlUFvQW7ADUu1F1eRXzV0U3xo/Nc20a+jCAC1IhVqA95+rdlCeSmy g==;
IronPort-SDR: 5a1UEMQVPSi+PvMMckP4k17fkSWQmU2kpczhILnnMEt6H9lmJYwgreUSWdKtyLjUIHQt/iLQLK
 KYNepfJatPSqtN5uviIoqbU0dY01Tjdy2YanJGxr/bGnvLDrlEOkANWlV2XlRZ7mtoSqAVHEoK
 PY6cav5qJqKPwr1GaKansSfpoNlVpcibzirROzp4y58AgY/miafzR49o+tgFOyHOT/p5rCAMsL
 EMHhBmNe2sI2xWrOTlsSIP6r9le1lQLRiWARlhbNJxexvZQZvK0QxmEND9ijjKLZzON/Hfwign
 0rS6WMe01BvluyldHesgmFUN
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="126466519"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Jul 2021 12:55:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Jul 2021 12:55:02 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Thu, 29 Jul 2021 12:55:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l43xN7mfOEJbYihiRK7ErUWp7FFh6IqjPwtM1TVbED3X2GrEq00nBRIm/RhG/Hvc/kXL2r3tudRlDJr3DZ09lt3A8AKgfAzWfs5P71q1QjB1mJ3chrwXz74liZuWcMfESZpaX4hSmfMnn2QcH/G7HhvbqjIHB10b5owHO+6CcEGyOa1tWMiFyBIxD9oM6VTYhS+IbY8rTJ4rKO1mIut81Mpy5ttcOpoRODCyfqWkPdSj4AGfQGtP/vNiIUPjpRluViapPQqasNitK66+R//PMS0vblDQbPmvSCLkoOpWuETx8zgZE4+GJVQAzrmGSiuVeDT7jG494LSj7fXhxaFSnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp04NA3NDX5qgyxk3HCGnlHNL+XtyU5aCOPquUjszcE=;
 b=cCbOS1Zy9N/ZhWhSVoPWP9ZSf/BCptlKlxy7dvX4kDYeQSI3xD60xmAqSjgdVzN/9YiYpRqjsaRWiZhHVgF4Q+yWFdU7hXrKilwGJd4yMj8ZNZT4NTMyWSTbZbBFXdrKyUfwxkTmReSLKXtLtRnxrdOp9ebLoP9hhA+Qz73fD0OyA/gB1IQeBe66aU6hqMhVCrfbUNLJT13sIPEn5vUYRMUSp/8bjY9neZte027bfipgJufPPoZWB3qONawjBLmCGgfyJOXadz+SDKahiV/PjlbEua6LWern0Ib0/sPVmg8RDhPcMKmzHNNJFfXiwbpVTiMWDXiSwamNtq4W5L0gHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp04NA3NDX5qgyxk3HCGnlHNL+XtyU5aCOPquUjszcE=;
 b=KfvCiQxxyXlSC5oPfJPr6GCLnqm+uFTWkvJge9F/vB2sNBN2PUP4wsbOTr9Skf90ZBx1cKYjHqgfBd7+KgFJgfGihfLXfujZnRwgmpDu7Y0emPNFpCgcxancpcy2razL6geV+vu4et/NdR17Q74XFaTlGlfzOrrrscE/z1wi/y4=
Received: from BY5PR11MB4007.namprd11.prod.outlook.com (2603:10b6:a03:189::28)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 29 Jul
 2021 19:55:00 +0000
Received: from BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf]) by BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf%5]) with mapi id 15.20.4373.021; Thu, 29 Jul 2021
 19:55:00 +0000
From: <Dan.Sneddon@microchip.com>
To: <sam@ravnborg.org>, <tzimmermann@suse.de>
Subject: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
Thread-Topic: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
Thread-Index: AQHXg+V9u4IBzc/SHUWKaqikrAmiK6tY0cGAgAGDewCAAAg/gIAAAfQA
Date: Thu, 29 Jul 2021 19:55:00 +0000
Message-ID: <38656c7b-d9ad-c704-515e-f56582742532@microchip.com>
References: <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
 <YQF7bKyeup8n3awU@ravnborg.org>
 <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
 <YQGdxtV0BGZ8VOpm@ravnborg.org>
 <2f04b986-6b41-62f9-1587-23818b841655@suse.de>
 <793514f6-0270-771b-fe36-f82edf4e5fd2@microchip.com>
 <YQGrMH36Udg3eKQY@ravnborg.org>
 <dcc5cd1e-d0de-bdda-32f3-623b85085756@microchip.com>
 <YQG5+/9lPexU3Dn3@ravnborg.org>
 <1df22406-2e91-c15a-49dc-1cf33522a142@suse.de>
 <YQMF8X7gwKE/c2/R@ravnborg.org>
In-Reply-To: <YQMF8X7gwKE/c2/R@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none; ravnborg.org; dmarc=none action=none header.from=microchip.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33722871-a0ad-4d3b-1c04-08d952cac014
x-ms-traffictypediagnostic: SJ0PR11MB4813:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB4813EF325024541ACFF3C5B4E1EB9@SJ0PR11MB4813.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:269;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tTY0uVuT7uY5jLGdoVBUOHYzueetCp0s4qm5oEgZV3rVAZHUg0lVbqu7F9BGbC4uXjX07jK+m1BQ5krV/d2eLVKBSqTptAGIDF6Nx/1CpMkMVQO4Kv3AkTj23Eogx9MSrPN6mkIH3ZNBkqjFdGY3ilYpnKhEx4JZXD9raU3i44dUK1SlHFtimbAZLmcszywbhMFRiGGfi7ni7T/pGewQX//m8zfQzOqq6wD26gNUoSFlrz92fdbOluyn6dL4gLcyBvVgqnuabu6JZSE6ENIAp95WtUzGDYEKX69HDAS045fWGHqDu+yhsJCmbMS8jwhUnhPU3J+c74c1zhJHRPTdmrNiE1APXCtqqT2KJPtDcrM2S2yT8gk0sMiooO0G/Iy0WIZV951miC77ttIk6QAA9RnrCFq73D7iRrCBGpbJeuLuakX9TJBXm2eJXM7Kip+8vHvU+ZuhsSe1S52pa14PnNumPnQ+0GmFzbE9yfcr/Nml+4HAqLWcqso3adaxI9RSRcvlBgkrW0WsAqWQNDgvQDxgUtfTjwN31c2XOBUqDolKioCxxUE+Dko16ri4fv2mMKAUSp6bL64LfxC47fAU2k2rZMz7NwB94+J3/naCG4K5dYflWgB+ezReERkMGMIcFB+E8uC0ITVBImfxFjXvC4AivZorQqEagC2NgFHitqijh9ao4Ns9xKmAQWmZ7V/m3YLNLSd6qiStK7MAxtRywoNBW9eq1zoGdr1CoOeYGMbOWFULf8JrW9O0ag/7BqBsWeJQ6eSHgLKb4hKw3QmtsA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4007.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(39860400002)(136003)(346002)(396003)(83380400001)(5660300002)(316002)(186003)(8676002)(76116006)(91956017)(31696002)(7416002)(478600001)(54906003)(86362001)(38100700002)(6506007)(8936002)(4744005)(6512007)(53546011)(26005)(122000001)(4326008)(36756003)(110136005)(66446008)(6486002)(66476007)(64756008)(66556008)(71200400001)(2616005)(66946007)(31686004)(2906002)(38070700005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXBNajdpVVRORW5wc1lxSDJoL1FSMHc4c3VCREZ1ZWlwSGhRc1R2d2RqUkcy?=
 =?utf-8?B?Y0JUeW1MbHp6aFM3RG9obzBsUk5FVFhwOGVjQStaU0EvbEQ0ZEJzaXRBaU9K?=
 =?utf-8?B?T2hDNlp1V3JzRXBBMGRCNHlVNzdWL0l6VytucDdnVk5VVkplb3RiMVpWbGZ1?=
 =?utf-8?B?cUp1YjR0cUMweEIyK3YxN2FIYkpOZlRGV1Uyd0FpQStTRDA3TGJtdCtaaW9w?=
 =?utf-8?B?L0lmckFiMnY1NytLQWNEVGU3REpGUVZQQTNmNnVESXU2YUlnTHRvVVg0ZU03?=
 =?utf-8?B?ZW04MFVFTUxFWk9Bbi91ZytNR2w1NENKTWhiU2tiQmFYNHFzbFNzM010d3FK?=
 =?utf-8?B?M2htYkd3WnRkaXQ3MTRDckZ4UC8wNGsvdWV4czdySlkvanFvWWZMdlJlWHFv?=
 =?utf-8?B?YUF6OUU3N3dudTU4S0dVeFhLWXhGS0hSUGNvb2ZtNmdDNFBzbjgrQVVwNE85?=
 =?utf-8?B?Wk50RVpYZnI3a3c0bVBVWWdxcklRc3pJSVo5NDViaGdSZENlNXF1ejZmWVVz?=
 =?utf-8?B?Vi9WQStiQmF4TEJvWFN0eUZFajhEY2owS3dRbmlDanlmSEpzWFd3bHlaazRw?=
 =?utf-8?B?bHhoZFl1aEFiRDZ0NkxlNVRKNzJpNnRzcnhRaFBDYjlVSmtweENyYVIwVDBM?=
 =?utf-8?B?eVZrTzI0bkRCRTF2SXMvQlJBWVJaZFhNaWgvWlVkd0lXTC9jTHN3N3hLT2th?=
 =?utf-8?B?U1dLQXJuWHp6UUp4NURLZ1Q3TnlUeUxZSXJ0bHo0cUJRbXRMaEw4QVJjOWRp?=
 =?utf-8?B?N0l5N1h6RTRCZUtTY0o5d1hHODBuN2o1M3FCam8xQmxGSFI4Ujgyb0xFMHFR?=
 =?utf-8?B?L2ZmOXc1ck1Hdk5IUFB5T09YRW81ZkNESHY4NGVLSjI0QkpzeEEvM3B0aDdQ?=
 =?utf-8?B?V1lDSWp3bDE2UDBzRTRmdTJSenRFYnRpQ2RyR3NTUG5LYzRDNlFERE4rNVBU?=
 =?utf-8?B?V1pURDExaWlVM3I4bDRzYjdLNlE4OWlhUXNFR1JqTWZFV0RiUHdaRjNrelpB?=
 =?utf-8?B?MU9JcGlFN3VDTnc1ZmsxQkQvNHd5aXFHczVnUElrdUdRTEJUenJ1TWloWlhx?=
 =?utf-8?B?S2pjVitOaFM3NWltNlgzQ0NHWERtT3N3Y3p5SVNETmUvZ0hnY0ZrWmZzOURV?=
 =?utf-8?B?WVNIT0MzUVo5WkNLeEt5RXFFdE5HcVlPMlBWcWhlM2RwaTVqcWFjbHFuVW16?=
 =?utf-8?B?QlAxRGRrUm9UL1JlWEhxTVptaDVZeXBHaTFIZ2M5ekNGRjZCYmtFTUpacDQz?=
 =?utf-8?B?MFNXS2FDWS9MZ2MwdnhTRk1yUkRmVk1BL0RXYmo2OVdlemh1TUxNa3BLdmNj?=
 =?utf-8?B?WHJ6N1Z2Q2M4cFhJZHQvU2dPWmhXYm9aSzBudjBnbUNSRWR1c0hxK1FMQmtC?=
 =?utf-8?B?a0ZDMDB1L3VwRU8zSnlpWkR2azBzTmN6N0ZGMWFwbFJ3Q0FIL09iWG5BeXQ1?=
 =?utf-8?B?Q3RNMmRTa0VrQWY2a2k3K2ZRUmVNaGFEVjZ6YjF5dTU5TGhSRWZabWIvdFRw?=
 =?utf-8?B?a05NOE5KRVN1QURTTnNNeUJVRUZDbGNDOVVEd0JFWWkySU9jcC8wOEFmMEsx?=
 =?utf-8?B?alp1dmJad09XRkpFQktldTdDc1luWk1CcGF1eENTbXY5UzhCYTdrQm5CRUNR?=
 =?utf-8?B?dm5IaWluRi9sR1kzQ2tqVGRobXhxeUEwNFk5ZVgvTVVLNWZXcytvZ1J0ZkJv?=
 =?utf-8?B?MXpUVzNxVlI2NzBrSDJGVUtIbngxaG1CaWpMV2FzSm1aQ09MYkIwaCtGMDJV?=
 =?utf-8?Q?+025ZaaBAIEfMSmb3mNYFuNztx23urXWvZIeBm2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CB98DFD5330FB45AC6A44E83C45D393@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4007.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33722871-a0ad-4d3b-1c04-08d952cac014
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2021 19:55:00.7701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0652+0qRmuXGFXCgW6lkdhW5OEomOJAit9Flq08OPcebm3YGa9vIp4m2kSkGiyiy11SEEF3c3FSQgSmkjrlQP+d+cIyJl0SHUcWDrQtJX7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, amd-gfx@lists.freedesktop.org,
 anitha.chrisanthus@intel.com, Dan.Sneddon@microchip.com,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 edmund.j.dea@intel.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 dri-devel@lists.freedesktop.org, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, tomba@kernel.org, bbrezillon@kernel.org,
 jyri.sarha@iki.fi, Nicolas.Ferre@microchip.com, christian.koenig@amd.com,
 kernel@pengutronix.de, alexander.deucher@amd.com, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzIGFuZCBTYW0sDQpPbiA3LzI5LzIxIDEyOjQ4IFBNLCBTYW0gUmF2bmJvcmcgd3Jv
dGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gSGkgVGhvbWFz
LA0KPiANCj4+DQo+PiBBcmUgeW91IHN1cmUsIHlvdSdyZSB0ZXN0aW5nIHdpdGggdGhlIGxhdGVz
dCBkcm0tbWlzYy1uZXh0IG9yIGRybS10aXA/DQo+PiBCZWNhdXNlIHVzaW5nIGlycV9lbmFibGVk
IGlzIGRlcHJlY2F0ZWQgYW5kIHRoZSBmbGFnIHdhcyByZWNlbnRseSByZXBsYWNlZA0KPj4gYnkg
Y29tbWl0IDFlNGNkNzhlZDQ5MyAoImRybTogRG9uJ3QgdGVzdCBmb3IgSVJRIHN1cHBvcnQgaW4g
VkJMQU5LIGlvY3RscyIpLg0KDQpPaywgTXkgZmF1bHQgZm9yIHRlc3Rpbmcgb24gdGhlIHdyb25n
IGJyYW5jaC4gIFdoZW4gSSB0ZXN0IHRoaXMgcGF0Y2ggb24gDQpkcm0tbWlzYy1uZXh0IGl0IHdv
cmtzIGdyZWF0LiAgU29ycnkgZm9yIHRoZSBjb25mdXNpb24hDQoNCj4gDQo+IEkgd2FzIGxvb2tp
bmcgYXQgZHJtLW1pc2MtZml4ZXMgd2hpY2ggZGlkIG5vdCBoYXZlIHRoaXMgY29tbWl0IDotKA0K
PiBKdXN0IG15IHNpbGx5IGV4Y3VzZSB3aHkgSSB3YXMgY29udmluY2VkIHRoaXMgd2FzIHRoZSBp
c3N1ZS4NCj4gDQo+ICAgICAgICAgIFNhbQ0KPiANCg0KQmVzdCByZWdhcmRzLA0KRGFuDQo=
