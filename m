Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA12C2F8454
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E8A6E471;
	Fri, 15 Jan 2021 18:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3456E120;
 Fri, 15 Jan 2021 18:27:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYFGB29jpH/J1Yyv1sjHNKDkNRyrRGI0i5aH40EOI508C0MJG2HFhNS33lF8wR/WKmhGawKipl/nirqpz+FtCq9heZ2BqOh5Yg4w8jjAzxMWvW+l3fVSlPrWAZu5CNXEdJIS5hm86+nSAfGPy7eIYOGcou4u4bgNAU+ArXS47THA2U/mEFEbpJUXcWgC+pDkd4bRVQvN2Tm+5FK85Q1AFtBo9AoCX2oSI8a4DH02Q6GlsQEsoEUPETXJiPYBspodtFaW/K40OJA0TsH+aiekD8rl6Bw8UxSVd4jsOuYe3agRKJlg1g2+9u84glxDzaXAFz4ADvXch5FuMYXzKgNrbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldIcf+ZP5ZWB8a73lQYKgI5n6OWztdvNjYmsovlIOCs=;
 b=Y5MCJwozgC185mZwLbwMGPrOHyOiHPwuyXxPRqD6wqPD2ZeeG1xGSpRBc2XFZe9ixVRFsqLEbgrKnPrU2zeRXHLOUB2ZCzVAcjW+snmz1cMpvjIovkI/9Wx2OGeqUKWt5ia6CCJdIomPoH5f/x1W0SxjebvDFJdLgYx/FlA295iihPWwRXzQwd8+Yd6BVnzkV66P/1e6HyPmZxyHgMHHbmseCo8H67LP1FlvZHZsS/29SptxNT9cBe8hQ4qJR7atQ77hWZus+ImbDe+xMqX3GDl4hRwwZvJyvh+AsyRw49Q2CZugnh1Yu0V8HUJbzuiVlH9loNRfQOEa9AVcpeLScw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldIcf+ZP5ZWB8a73lQYKgI5n6OWztdvNjYmsovlIOCs=;
 b=fuWa+iKk1VaFFocwO2TeBsevsHac2IT+DIDYDjlD/KGWNzqKOaZo+ADsoVXNE/dPX7K+V6KJiM4tk9Ze8yq3ifM4PP9HUBd1Fxg5Ol1KW3D8duhtHcyiD+AWQQJqGuBVZlFqX5tEYZwj7jfmC0YcZ5LLemzfEKlOnsduIB+7Cw4=
Received: from BL0PR05MB5186.namprd05.prod.outlook.com (2603:10b6:208:8f::18)
 by BL0PR05MB4963.namprd05.prod.outlook.com (2603:10b6:208:81::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2; Fri, 15 Jan
 2021 18:27:15 +0000
Received: from BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::59ed:18ca:252d:72f6]) by BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::59ed:18ca:252d:72f6%7]) with mapi id 15.20.3763.010; Fri, 15 Jan 2021
 18:27:15 +0000
From: Zack Rusin <zackr@vmware.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/29] [Set 15] Finally rid W=1 warnings from GPU!
Thread-Topic: [PATCH 00/29] [Set 15] Finally rid W=1 warnings from GPU!
Thread-Index: AQHW62p+Afh7eg9MAECAFEwSMWQpd6opAUIA
Date: Fri, 15 Jan 2021 18:27:15 +0000
Message-ID: <F914D9B9-6DD4-4383-9F7C-8D09FBFE96CE@vmware.com>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c64d446-ae5f-40eb-e5b5-08d8b9832f27
x-ms-traffictypediagnostic: BL0PR05MB4963:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR05MB49632CC95DC53ABA4F998F59CEA70@BL0PR05MB4963.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 55YQD4eKIG0BrVqfHEYsvlpT9AXPF4NQE5qmAs3RRe9Ejpm+oapZltMiNUHGxnN+ZhDy44ldF7uqE6wCxpV5KO/SO5cZaeyRPXTnGrNB/ll0Q6yEOJPkhIVxFjCJG4ZXceF+Nxj/s2L+Ixk/Z3gcOzG2sRISaOdl4k82XJliVUyEDg62yMIxpvUtnZ4o3tgWS8undD9vjrAXeKH9xSKJ61I+jUK3Wzqvll2cu4gOHLwRz54kn/c8kH0b0kek0s/lxZXq6wH0USNmWJfjCcly5qKbmzoPVzPSlnaXUCfLOq5aQThZ8n0L0LNgAIgaS0Dpo/v9/2ukrY9nlvPEL0t6+NMNXUurrNAkgqGBMVD0qjBc/wzdrgZOQKGmjcjBagxdoCokKodr5VpsKcxf6cbqGM6tNPToY759oiZm3fJOnw+gBB5B6Oi6JgLSc4pAVGiw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR05MB5186.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(2906002)(33656002)(36756003)(83380400001)(76116006)(478600001)(7416002)(6486002)(6916009)(8676002)(6512007)(8936002)(64756008)(2616005)(66446008)(71200400001)(4744005)(6506007)(4326008)(66946007)(186003)(54906003)(26005)(86362001)(53546011)(66556008)(66476007)(5660300002)(316002)(7406005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?zgyRXVh9UgWytDDFI4h3+SdRgEHw+d9OLuLLMHpjvKlr22XbD6tBg4P0VJ?=
 =?iso-8859-1?Q?MBkRg8mjRg8Fct7L/vBi8Vp3Gr5TKKaDAMMsi36wtW9XtQKlF+HH7y0KP2?=
 =?iso-8859-1?Q?9qyTkyLqdEVVvjiTv7S/W240RBKTbFrOMFtSHebz8b2+Elq38cFLR+lmAo?=
 =?iso-8859-1?Q?tjMnnBmWRvpuD7eP4tEU68waYBouWsJuhue3mgUIYOwLvX0wlWxnDpluBZ?=
 =?iso-8859-1?Q?yVjcUY7ZLP4WTfsKgs+ciELcST10DoZgCrwcohwL9CCGEDtMzAg9AL0eVW?=
 =?iso-8859-1?Q?dYc/bI2HstPQwRfei/WUvNlQmQXEOYsZkQ97sRxdelOQ3Kzx9Vj69csO3w?=
 =?iso-8859-1?Q?yOcNV13s7Yxtzw8w80q4lw7opde2+JEszf2bzt2B0veWH/jIad87+WjK6r?=
 =?iso-8859-1?Q?gN1ZyEwz5+KAuHBmFJyRIRr29qvFlagPVjwEjuUwwBQcnPgXNx7dDSkh5y?=
 =?iso-8859-1?Q?UoL0QixA5gkwtM/40BQIU7n/zXhYHIu5laGIkTzYboLuQysU8G5gMffTeT?=
 =?iso-8859-1?Q?5XWg8lqro4VUandVJ/nSqvdqZronfrPhHu3cAQibWpib51RrY0dgVQ3Fq+?=
 =?iso-8859-1?Q?r1sv4m/PNniyNKX1AFro862zN0uzFFqkYhK2W1ZjqWB4mEC/zhsltNQlAJ?=
 =?iso-8859-1?Q?TIxBU+sJvgqHUZ2d+DpQozh6ArARnjRpB/JD2eqhixYXBKKEGeXAsygSVn?=
 =?iso-8859-1?Q?J4jWTCwbMq+/QElOSWowhnnOyv9QBWDS6vkKqo+I98NFV3XtrFK/RNRJL0?=
 =?iso-8859-1?Q?ne5Ubfp6JAfigqZvlzdDQ+Garza+GvG2C7XdqCt6fAln9QLJF7hM6UNq01?=
 =?iso-8859-1?Q?1LUUGaEovr/uyZOhTG6MAti5NBaRVQMg9OVP9WvqUqFZx4tnIsPKziCPr3?=
 =?iso-8859-1?Q?njFPxnCOT75zBVdbf4nUMeOB9WfJU9F+h4mGkwVx6zP0RDnP7JgXZpYxD7?=
 =?iso-8859-1?Q?LSE0ywTmovs3VsNJ181r0kuj9aqCxwQFE7L0ZZwSmIeozxXhZtAHMJMcbn?=
 =?iso-8859-1?Q?Y38RiCXBqt5WAjhxCVwtKh1cFHOfiyBkUjJDKZ?=
Content-ID: <F862015D1103DE4C962AE3C7312A0F78@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5186.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c64d446-ae5f-40eb-e5b5-08d8b9832f27
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 18:27:15.4804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kATfeq4PX77bcOBXMKLtAaRo0gl/y7g0xq21YvKoHjoROW5bBGxAIsAbAmZMfRP4WxSqU8XC68n+pfq+ESm6Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR05MB4963
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
Cc: Jackie Li <yaodong.li@intel.com>, David Airlie <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jesse Barnes <jesse.barnes@intel.com>, Tina Zhang <tina.zhang@intel.com>,
 Jan Safrata <jan.nikitenko@gmail.com>, Gareth Hughes <gareth@valinux.com>,
 Pei Zhang <pei.zhang@intel.com>, Rob Clark <rob.clark@linaro.org>,
 Min He <min.he@intel.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Niu Bing <bing.niu@intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Kevin Tian <kevin.tian@intel.com>, jim liu <jim.liu@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Keith Packard <keithp@keithp.com>, Eddie Dong <eddie.dong@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Faith <faith@valinux.com>, Ping Gao <ping.a.gao@intel.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Zhiyuan Lv <zhiyuan.lv@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> On Jan 15, 2021, at 13:15, Lee Jones <lee.jones@linaro.org> wrote:
> 
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> Last set!  All clean after this for; Arm, Arm64, PPC, MIPS and x86.

Thanks! For all the vmwgfx bits:
Reviewed-by: Zack Rusin <zackr@vmware.com>

z
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
