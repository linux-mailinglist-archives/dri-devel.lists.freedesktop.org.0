Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B9583872B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 07:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43FD10E13D;
	Tue, 23 Jan 2024 06:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8623710E65F;
 Tue, 23 Jan 2024 06:16:19 +0000 (UTC)
X-UUID: e38220c8b9b611eea2298b7352fd921d-20240123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ZNDHw9MT9AyiCTU9i/+FfWZh9uCC/rbX1C6oORAarZY=; 
 b=nxeioleq/KmxQs0D3v7AUfeizKdBkpwCrnXt9YiisKjZnLQB14HADclpBUaF5NB9zLZfNT6rfZulcdSFxk12FQ1AoL651kMsW7yKGO7dPej/EpNaIcsxwGbaHgtAu9GdlfKzRxS+4t13e58B94v42aGvcqUGAQQCwFRPBD0l+4c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36, REQID:ce110975-141b-48ca-b864-6d74edd5c257, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:6e16cf4, CLOUDID:f9b0772f-1ab8-4133-9780-81938111c800,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e38220c8b9b611eea2298b7352fd921d-20240123
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1926833074; Tue, 23 Jan 2024 14:16:04 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 23 Jan 2024 14:16:03 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 23 Jan 2024 14:16:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jf8UD5tAAhycGFkKO/qZXl3eZhMSfLmhuaokkxEDDjVVLaPxLOMmxXVBYozov+1YqbHLSCi1NydpmIt/meYL3FkqsoxhYUjAi6qNZNlfTb0uC9dfkVjVy/vtdRhSnSoFdyQdiFrFvZsYuy5ftHF1IUpj+CVoen6LIjVaDvJAvoZL+K96GqnUw02SRcE7goa28WZbPb4xoa5krCpprGi3bO188hTDb4zYtdFRBnQZg3Bl+SNv6CiQ/I0W7Opm/2nygWUgCZ12x27P2m0xR/JHL4uEXSFpFdlntgHXsoq3vEbDnxbYzG70Ql5lqtF+4ORcDBPwJSKWgBcsYOFR7CUnjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDB0u/GJzS3T7WwLtFDtirRx4n+HPrX0Q8O91XTjkRg=;
 b=X/7uU+Co5IvPe9e37jQbfmV5TrtpsPXplbZUMMOaOsZ09cUBrasNoORzBYRQN8IrNgV6ZpSNo88wq0ywuKIoUwSui2R3TkZHuBrXdfuC6fGCdHPo9Y0uwyr3hU5Rm2IymoJItoetKlJNCOfBMsiDvzs4Kb6/CJRBT5IsjpC7tsixb6uTacJUPg0eD5/56q6ruUXTc6OztuUnPqX8eEdIF6TtCUBViN4ddPDBp6+GXWxkZ98z9no4/rRrx03eYaGetFBQVZP59krP8XPCHQf/vWFAY1oVleYE7txJiNgt8XR1LSy+0URrKSlFV0faXSk7SzSy0TgcBRfeg1SIf9pvHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDB0u/GJzS3T7WwLtFDtirRx4n+HPrX0Q8O91XTjkRg=;
 b=aItbUImR7KwttlqBNhnGQvJpaeM9xgguui+r8+tlWuV+hVXH6Xi7qojgOZ3OMjJrkqz9kbBZ8cOlRxPu3Ppga9cgUT5qM1ng4TjsajJKVvyBnwPCovMPolIDuJfblwjOME6DhAsmUMpYjEHmc5NTUxI7numqszHuT2Qo4NmPotE=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7669.apcprd03.prod.outlook.com (2603:1096:820:e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Tue, 23 Jan
 2024 06:09:06 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::d006:ec9c:ff42:ff60]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::d006:ec9c:ff42:ff60%5]) with mapi id 15.20.7202.031; Tue, 23 Jan 2024
 06:09:06 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "maxime@cerno.tech" <maxime@cerno.tech>, "daniel.vetter@ffwll.ch"
 <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Thread-Topic: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Thread-Index: AQHaTaau1JBuNr0KqkifWFu/qedV2rDm6fyA
Date: Tue, 23 Jan 2024 06:09:05 +0000
Message-ID: <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
 <20230307145613.xvhru3fpcudlpazt@houat>
In-Reply-To: <20230307145613.xvhru3fpcudlpazt@houat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7669:EE_
x-ms-office365-filtering-correlation-id: 722b04c6-c86b-48d8-9f6c-08dc1bd9ce25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DD1Z3UaNKef19FydhDJmYEpgOiIzpTY+kF7MN6YwFEuTu9Rh5eKoTl7UaoVMaHBbfwy+HGFhwvhOzQBtouFi9MMItb/QveP2GnBZBSiUDsBzX6QYGSatHMKXQS19+y8faWTrtU8gLvseCMH/BqzKBQfBguH8PL2u+RDLW+AgSj9Die0xYHHOqpaZ7FZ5sE+ENKGeEIEkDQbm8iOmZ7SijRnPYjRBdJIphV4x87colbJp75SG7Cizl+NX09W9YoHILKrL+qltFZnTyvVZcjb/V0BYHbmGJ4RFsKaiocmx5z8W8KxRjYngUCZSc+36OdghaLUSWekrg1v0GrrVPiuWwFtx3Ib9uVRFHELPrfjmpTo8PRMT1dk6K2zcd/sXNDaGw6CXhq1euekD0vX3C6SnoydzsF/jDc5Nf9zPAlXpYLNvLYDz4c4fu2RtWdV3dQ30l66HXEIFBmzA+WJatdXklLXiB2GDTD31gzAZKUaky/75JCcGZpGYhTRUqZM7lStNPwJs6lwMmdh4Llj+OHoK7PCsqMxuyz/iwjEqAh5yJ5Fe+G1vVuHFwPQrVKznw2PE+0kTxuDWVZiwybNRc8JLhx8xjHBXMZKscb5ZcTOTrpLgY38OcNyQRpIyFk+tZYsX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(396003)(136003)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(83380400001)(86362001)(71200400001)(2616005)(26005)(122000001)(8676002)(4326008)(8936002)(6512007)(2906002)(38100700002)(41300700001)(5660300002)(7416002)(478600001)(6486002)(66946007)(66446008)(66556008)(54906003)(110136005)(66476007)(316002)(6506007)(64756008)(76116006)(38070700009)(85182001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2tWWHhoUkJ5WjFkWGpvN2xhUGpqZFN5TC93YzBXT0IzSWVyak5rYlZNU1dB?=
 =?utf-8?B?cHl4QVlWTU9ZSHpCbFhqOVNaR2FBSmNmeTl0U1RkOHMzTjlySGQyUVZZc1du?=
 =?utf-8?B?ZWJrMUhKMXRCYmpFMXBIRlJ3YWdwTyswcUhnL1Ntd3Y3UmFXdC9tWTM1MXhZ?=
 =?utf-8?B?UFhXYmhvbmp0cTljTzZFSUszK3pXZkhGcHh0RFJZMk9LYTdhYVFnMndQV3Br?=
 =?utf-8?B?d1BUL0t5VGRMTDVwTjhJWWdGaDk0RWYzNWxsLzliNzBHSHY4WjJFaHNOdWV5?=
 =?utf-8?B?bnd3WktuR1lNT1RnSHliNGhmQmxDa2xCaTh6bXdCTkUzdUpYZk9zTVVxTm9M?=
 =?utf-8?B?ck1WcjVTRmUzT2YwaXVlakVJZkZVT0NKcHFicjdmK0RjdVVocEdXV2x1VUIz?=
 =?utf-8?B?SzdtSFBEWUQybFViSmc1VU8zRnErdHRzWUREU0ViUXkzOTFRYlFTN0g4Sm5z?=
 =?utf-8?B?TDdYZG9UYVphSDhQeGlmZjhOVlR3QU5zYVRBQzRkalhLMU5Dd2FPOFdxTEZl?=
 =?utf-8?B?UTFzVFlFd2xCUUR1T0puZTVDNTdsNkVSYTNzSXhlalpNbXpFaXc0ejFyek1R?=
 =?utf-8?B?enU1L2xESy8rWndEQUNlMEo2YzZYK3ZmYWdGSVVVd3RSdlJ2OFJNQkxBUHhr?=
 =?utf-8?B?Zis4R1VyRlNlbVhGOStxRTZ0TFVkY3Y4VkF3QWRmRTk1V2hoQU53amtpU21j?=
 =?utf-8?B?M0lSbWk2UFBHQ2ZQSU5YRzY0emh3U3hiNnM5dHBsaXVGVEtrZUg5Z09CeEJJ?=
 =?utf-8?B?aUVjYTlWekd1bGVBK2hsMy9xTHIrckhwUkMyNEk1QW5DNFE5cGUxUVJra002?=
 =?utf-8?B?MGsrWVh2bXcyZExrWTd5T2dQTWpLYjBJV2tyd0pRcUJnVkQwR0xoaGk4Q1gx?=
 =?utf-8?B?SlQ5c0tuQmlIUEk0OHRLTjB4UmZDSXZicVBIUXRNemlMa0w4L3hsM1RWdklx?=
 =?utf-8?B?b1RnTTQwVWdLVDdFV3BlNVNRTG96QTNXT1VUQ0pEWGpJTTBJSFkvRFdSNndq?=
 =?utf-8?B?MDFMVDVUZlU0Y2p5TEhFTzVtZTczQkwwTTRzQXFLb0FKcytnMTRTK2pxcWU2?=
 =?utf-8?B?UzdDaDhYbUNua0wydEJjUkZleFF0WnlwTlZuSXdxMHpocjk2YnExWmRoc0dn?=
 =?utf-8?B?VFpreXRaeUFjeEd2aHkxT0dsZThEd3BHTHJwUHh6bkd1Q21qR1BmRW10M3M4?=
 =?utf-8?B?dlFsSUo1Snp1enVoZUhQczVEQzdQOTQ5K0dRaXNvM2hVbVdaZWM0S1pGQ3RP?=
 =?utf-8?B?Y05oZWxManFhemFDS0UyVENDaDZwMkh6MjNHMjM4ajFDcXdUaG4wRzdIT3lm?=
 =?utf-8?B?czVld1RXNzVQc0l6TDFpdG90SHBxcDZGTk92bGtzOWZvOTJxVzU2ZVozYnhQ?=
 =?utf-8?B?eHNtTVhCSXI2NkFTc1pJMktLQ1ROcHNKLzI3dHpQMVN3YmpkekJNa1VMd0wv?=
 =?utf-8?B?SEdyTi8yYUEwRHdiRlVlenFlRXhUL3BKV1h5T0hsbFlqdDFVaVVpZ0hQWmVO?=
 =?utf-8?B?Y3YzVlJRR3RFYmk5akZDekQzdkZwczZVRHQ2dlYreGRxa2VDeEpUU3BaQUdN?=
 =?utf-8?B?RU9TVWZmWnpWU3VCdFZKZ3BFRXdoK1dkWHJzUUxJSnVCZHFQdG9lS2RNMnI4?=
 =?utf-8?B?RXpib2JDOWRFMDlMa1R2N3gvMzRCcW5XamtLTEo3ZXBYUEVxV0p1SFg1eDNi?=
 =?utf-8?B?K01ubTVxaG1VQ1pMYjRGUWF3V0x5MjF4ZnpWYnZNc1p0dllyZDNzNzJVTzlZ?=
 =?utf-8?B?am94UVNNdmVIVys3UkRTZ1hZNmJEdWdXMGp6MHZlanNLaENIWkppbzFpV3ZD?=
 =?utf-8?B?L0pFZGF3a3BGOFV6Q3J1d3FOdjhuT0syWlZNRkdPQnJzVE85dWV5VDNHY1ox?=
 =?utf-8?B?Nm1QSTBpVTBjbmcyYUhEa1ZzQ0c2QXBqbDBJc2ZhZExHUmhnUEhHaVZXanhE?=
 =?utf-8?B?enJwYUVSZ1h3V3NkUm9aRTNrMFNBS2g5d2lhTmsxUWNmRHlVTHp4VW5TajdP?=
 =?utf-8?B?WmJJWUtlaDFvclI2emEwaS9hU3J1T3BuZHNqcyszSDZrek9vcFFkOWludWN1?=
 =?utf-8?B?Q1hUS0VCZDNLOTI5TFFjNnc0TkVGYncrbkE5R3NINWtscUtGTk82MXYyT3B2?=
 =?utf-8?B?YlV6eDBZVko1WXAvZzhLMDdiQi9yT1ltb2NFdTJEY2QxaG5HMnFjRjRFN05R?=
 =?utf-8?B?aXc9PQ==?=
Content-ID: <A6927029EB2E954E880589887E9FB932@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 722b04c6-c86b-48d8-9f6c-08dc1bd9ce25
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 06:09:05.9569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z3DCtS9pLTiLvpUwDDS9J09eTwRk+kDeSebgiwYKYBFmrHNsTsPlwr+guGG6rSnOhtbg6NJqIQ0/XyHIvMs5UVv+9tRyGi48oVnlG1kphC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7669
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_668568219.171700220"
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
Cc: "fshao@chromium.org" <fshao@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "michel@daenzer.net" <michel@daenzer.net>,
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "mikita.lipski@amd.com" <mikita.lipski@amd.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_004_668568219.171700220
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO01heGltZSwmIzMyO0RhbmllbCwNCg0KV2Um
IzMyO2VuY291bnRlcmVkJiMzMjtzaW1pbGFyJiMzMjtpc3N1ZSYjMzI7d2l0aCYjMzI7bWVkaWF0
ZWsmIzMyO1NvQ3MuDQoNCldlJiMzMjtoYXZlJiMzMjtmb3VuZCYjMzI7dGhhdCYjMzI7aW4mIzMy
O2RybV9hdG9taWNfaGVscGVyX2NvbW1pdF9ycG0oKSwmIzMyO3doZW4mIzMyO2Rpc2FibGluZw0K
dGhlJiMzMjtjdXJzb3ImIzMyO3BsYW5lLCYjMzI7dGhlJiMzMjtvbGRfc3RhdGUtJmd0O2xlZ2Fj
eV9jdXJzb3JfdXBkYXRlJiMzMjtpbg0KZHJtX2F0b21pY193YWl0X2Zvcl92YmxhbmsoKSYjMzI7
aXMmIzMyO3NldCYjMzI7dG8mIzMyO3RydWUuDQpBcyYjMzI7dGhlJiMzMjtyZXN1bHQsJiMzMjt3
ZSYjMzI7YXJlJiMzMjtub3QmIzMyO2FjdHVhbGx5JiMzMjt3YWl0aW5nJiMzMjtmb3ImIzMyO2Em
IzMyO3ZsYmFuayYjMzI7dG8mIzMyO3dhaXQmIzMyO2ZvciYjMzI7b3VyDQpoYXJkd2FyZSYjMzI7
dG8mIzMyO2Nsb3NlJiMzMjt0aGUmIzMyO2N1cnNvciYjMzI7cGxhbmUuJiMzMjtTdWJzZXF1ZW50
bHksJiMzMjt0aGUmIzMyO2V4ZWN1dGlvbg0KcHJvY2VlZHMmIzMyO3RvJiMzMjtkcm1fYXRvbWlj
X2hlbHBlcl9jbGVhbnVwX3BsYW5lcygpJiMzMjt0byYjMzI7JiMzMjtmcmVlJiMzMjt0aGUmIzMy
O2N1cnNvcg0KYnVmZmVyLiYjMzI7VGhpcyYjMzI7Y2FuJiMzMjtsZWFkJiMzMjt0byYjMzI7dXNl
LWFmdGVyLWZyZWUmIzMyO2lzc3VlcyYjMzI7d2l0aCYjMzI7b3VyJiMzMjtoYXJkd2FyZS4NCg0K
Q291bGQmIzMyO3lvdSYjMzI7cGxlYXNlJiMzMjthcHBseSYjMzI7dGhpcyYjMzI7cGF0Y2gmIzMy
O3RvJiMzMjtmaXgmIzMyO291ciYjMzI7cHJvYmxlbSYjNjM7DQpPciYjMzI7YXJlJiMzMjt0aGVy
ZSYjMzI7YW55JiMzMjtjb25zaWRlcmF0aW9ucyYjMzI7Zm9yJiMzMjtub3QmIzMyO2FwcGx5aW5n
JiMzMjt0aGlzJiMzMjtwYXRjaCYjNjM7DQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KT24m
IzMyO1R1ZSwmIzMyOzIwMjMtMDMtMDcmIzMyO2F0JiMzMjsxNTo1NiYjMzI7KzAxMDAsJiMzMjtN
YXhpbWUmIzMyO1JpcGFyZCYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtIaSwNCiZndDsmIzMyOw0KJmd0
OyYjMzI7T24mIzMyO1RodSwmIzMyO0ZlYiYjMzI7MTYsJiMzMjsyMDIzJiMzMjthdCYjMzI7MTI6
MTI6MTNQTSYjMzI7KzAxMDAsJiMzMjtEYW5pZWwmIzMyO1ZldHRlciYjMzI7d3JvdGU6DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtUaGUmIzMyO3N0dWZmJiMzMjtuZXZlciYjMzI7cmVhbGx5JiMzMjt3b3Jr
ZWQsJiMzMjthbmQmIzMyO2xlYWRzJiMzMjt0byYjMzI7bG90cyYjMzI7b2YmIzMyO2Z1biYjMzI7
YmVjYXVzZSYjMzI7aXQNCiZndDsmIzMyOyZndDsmIzMyO291dC1vZi1vcmRlciYjMzI7ZnJlZXMm
IzMyO2F0b21pYyYjMzI7c3RhdGVzLiYjMzI7V2hpY2gmIzMyO3Vwc2V0cyYjMzI7S0FTQU4sJiMz
MjthbW9uZyYjMzI7b3RoZXINCiZndDsmIzMyOyZndDsmIzMyO3RoaW5ncy4NCiZndDsmIzMyOyZn
dDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Rm9yJiMzMjthc3luYyYjMzI7dXBkYXRlcyYjMzI7
d2UmIzMyO25vdyYjMzI7aGF2ZSYjMzI7YSYjMzI7bW9yZSYjMzI7c29saWQmIzMyO3NvbHV0aW9u
JiMzMjt3aXRoJiMzMjt0aGUNCiZndDsmIzMyOyZndDsmIzMyOy0mZ3Q7YXRvbWljX2FzeW5jX2No
ZWNrJiMzMjthbmQmIzMyOy0mZ3Q7YXRvbWljX2FzeW5jX2NvbW1pdCYjMzI7aG9va3MuJiMzMjtT
dXBwb3J0JiMzMjtmb3INCiZndDsmIzMyOyZndDsmIzMyO3RoYXQNCiZndDsmIzMyOyZndDsmIzMy
O2ZvciYjMzI7bXNtJiMzMjthbmQmIzMyO3ZjNCYjMzI7bGFuZGVkLiYjMzI7bm91dmVhdSYjMzI7
YW5kJiMzMjtpOTE1JiMzMjtoYXZlJiMzMjt0aGVpciYjMzI7b3duJiMzMjtjb21taXQNCiZndDsm
IzMyOyZndDsmIzMyO3JvdXRpbmVzLCYjMzI7ZG9pbmcmIzMyO3NvbWV0aGluZyYjMzI7c2ltaWxh
ci4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Rm9yJiMzMjtldmVyeW9u
ZSYjMzI7ZWxzZSYjMzI7aXQmIzM5O3MmIzMyO3Byb2JhYmx5JiMzMjtiZXR0ZXImIzMyO3RvJiMz
MjtyZW1vdmUmIzMyO3RoZSYjMzI7dXNlLWFmdGVyLWZyZWUNCiZndDsmIzMyOyZndDsmIzMyO2J1
ZywmIzMyO2FuZCYjMzI7ZW5jb3VyYWdlJiMzMjtmb2xrcyYjMzI7dG8mIzMyO3VzZSYjMzI7dGhl
JiMzMjthc3luYyYjMzI7c3VwcG9ydCYjMzI7aW5zdGVhZC4mIzMyO1RoZQ0KJmd0OyYjMzI7Jmd0
OyYjMzI7YWZmZWN0ZWQmIzMyO2RyaXZlcnMmIzMyO3doaWNoJiMzMjtyZWdpc3RlciYjMzI7YSYj
MzI7bGVnYWN5JiMzMjtjdXJzb3ImIzMyO3BsYW5lJiMzMjthbmQmIzMyO2RvbiYjMzk7dA0KJmd0
OyYjMzI7Jmd0OyYjMzI7ZWl0aGVyDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt1c2UmIzMyO3RoZSYjMzI7
bmV3JiMzMjthc3luYyYjMzI7c3R1ZmYmIzMyO29yJiMzMjt0aGVpciYjMzI7b3duJiMzMjtjb21t
aXQmIzMyO3JvdXRpbmUmIzMyO2FyZTomIzMyO2FtZGdwdSwNCiZndDsmIzMyOyZndDsmIzMyO2F0
bWVsLCYjMzI7bWVkaWF0ZWssJiMzMjtxeGwsJiMzMjtyb2NrY2hpcCwmIzMyO3N0aSwmIzMyO3N1
bjRpLCYjMzI7dGVncmEsJiMzMjt2aXJ0aW8sJiMzMjthbmQNCiZndDsmIzMyOyZndDsmIzMyO3Zt
d2dmeC4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7SW5zcGlyZWQmIzMy
O2J5JiMzMjthbiYjMzI7YW1kZ3B1JiMzMjtidWcmIzMyO3JlcG9ydC4NCiZndDsmIzMyOw0KJmd0
OyYjMzI7VGhhbmtzJiMzMjtmb3ImIzMyO3N1Ym1pdHRpbmcmIzMyO3RoYXQmIzMyO3BhdGNoLiYj
MzI7SXQmIzM5O3MmIzMyO2JlZW4mIzMyO2luJiMzMjt0aGUmIzMyO2Rvd25zdHJlYW0mIzMyO1JQ
aQ0KJmd0OyYjMzI7dHJlZQ0KJmd0OyYjMzI7Zm9yJiMzMjthJiMzMjt3aGlsZSwmIzMyO3NvJiMz
MjtJJiMzOTtkJiMzMjtyZWFsbHkmIzMyO2xpa2UmIzMyO2l0JiMzMjt0byYjMzI7YmUmIzMyO21l
cmdlZCYjMzI7ZXZlbnR1YWxseSYjMzI7OikNCiZndDsmIzMyOw0KJmd0OyYjMzI7QWNrZWQtYnk6
JiMzMjtNYXhpbWUmIzMyO1JpcGFyZCYjMzI7Jmx0O21heGltZUBjZXJuby50ZWNoJmd0Ow0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjtNYXhpbWUNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0t
dHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50
aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRh
aW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMp
IG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndp
c2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBp
bnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50
KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJl
dGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNo
bWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQg
YW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGll
bnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRo
aXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVs
eSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVz
IG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBz
eXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRv
IGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_004_668568219.171700220
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTWF4aW1lLCBEYW5pZWwsDQoNCldlIGVuY291bnRlcmVkIHNpbWlsYXIgaXNzdWUgd2l0aCBt
ZWRpYXRlayBTb0NzLg0KDQpXZSBoYXZlIGZvdW5kIHRoYXQgaW4gZHJtX2F0b21pY19oZWxwZXJf
Y29tbWl0X3JwbSgpLCB3aGVuIGRpc2FibGluZw0KdGhlIGN1cnNvciBwbGFuZSwgdGhlIG9sZF9z
dGF0ZS0+bGVnYWN5X2N1cnNvcl91cGRhdGUgaW4NCmRybV9hdG9taWNfd2FpdF9mb3JfdmJsYW5r
KCkgaXMgc2V0IHRvIHRydWUuDQpBcyB0aGUgcmVzdWx0LCB3ZSBhcmUgbm90IGFjdHVhbGx5IHdh
aXRpbmcgZm9yIGEgdmxiYW5rIHRvIHdhaXQgZm9yIG91cg0KaGFyZHdhcmUgdG8gY2xvc2UgdGhl
IGN1cnNvciBwbGFuZS4gU3Vic2VxdWVudGx5LCB0aGUgZXhlY3V0aW9uDQpwcm9jZWVkcyB0byBk
cm1fYXRvbWljX2hlbHBlcl9jbGVhbnVwX3BsYW5lcygpIHRvICBmcmVlIHRoZSBjdXJzb3INCmJ1
ZmZlci4gVGhpcyBjYW4gbGVhZCB0byB1c2UtYWZ0ZXItZnJlZSBpc3N1ZXMgd2l0aCBvdXIgaGFy
ZHdhcmUuDQoNCkNvdWxkIHlvdSBwbGVhc2UgYXBwbHkgdGhpcyBwYXRjaCB0byBmaXggb3VyIHBy
b2JsZW0/DQpPciBhcmUgdGhlcmUgYW55IGNvbnNpZGVyYXRpb25zIGZvciBub3QgYXBwbHlpbmcg
dGhpcyBwYXRjaD8NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQpPbiBUdWUsIDIwMjMtMDMt
MDcgYXQgMTU6NTYgKzAxMDAsIE1heGltZSBSaXBhcmQgd3JvdGU6DQo+IEhpLA0KPiANCj4gT24g
VGh1LCBGZWIgMTYsIDIwMjMgYXQgMTI6MTI6MTNQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3cm90
ZToNCj4gPiBUaGUgc3R1ZmYgbmV2ZXIgcmVhbGx5IHdvcmtlZCwgYW5kIGxlYWRzIHRvIGxvdHMg
b2YgZnVuIGJlY2F1c2UgaXQNCj4gPiBvdXQtb2Ytb3JkZXIgZnJlZXMgYXRvbWljIHN0YXRlcy4g
V2hpY2ggdXBzZXRzIEtBU0FOLCBhbW9uZyBvdGhlcg0KPiA+IHRoaW5ncy4NCj4gPiANCj4gPiBG
b3IgYXN5bmMgdXBkYXRlcyB3ZSBub3cgaGF2ZSBhIG1vcmUgc29saWQgc29sdXRpb24gd2l0aCB0
aGUNCj4gPiAtPmF0b21pY19hc3luY19jaGVjayBhbmQgLT5hdG9taWNfYXN5bmNfY29tbWl0IGhv
b2tzLiBTdXBwb3J0IGZvcg0KPiA+IHRoYXQNCj4gPiBmb3IgbXNtIGFuZCB2YzQgbGFuZGVkLiBu
b3V2ZWF1IGFuZCBpOTE1IGhhdmUgdGhlaXIgb3duIGNvbW1pdA0KPiA+IHJvdXRpbmVzLCBkb2lu
ZyBzb21ldGhpbmcgc2ltaWxhci4NCj4gPiANCj4gPiBGb3IgZXZlcnlvbmUgZWxzZSBpdCdzIHBy
b2JhYmx5IGJldHRlciB0byByZW1vdmUgdGhlIHVzZS1hZnRlci1mcmVlDQo+ID4gYnVnLCBhbmQg
ZW5jb3VyYWdlIGZvbGtzIHRvIHVzZSB0aGUgYXN5bmMgc3VwcG9ydCBpbnN0ZWFkLiBUaGUNCj4g
PiBhZmZlY3RlZCBkcml2ZXJzIHdoaWNoIHJlZ2lzdGVyIGEgbGVnYWN5IGN1cnNvciBwbGFuZSBh
bmQgZG9uJ3QNCj4gPiBlaXRoZXINCj4gPiB1c2UgdGhlIG5ldyBhc3luYyBzdHVmZiBvciB0aGVp
ciBvd24gY29tbWl0IHJvdXRpbmUgYXJlOiBhbWRncHUsDQo+ID4gYXRtZWwsIG1lZGlhdGVrLCBx
eGwsIHJvY2tjaGlwLCBzdGksIHN1bjRpLCB0ZWdyYSwgdmlydGlvLCBhbmQNCj4gPiB2bXdnZngu
DQo+ID4gDQo+ID4gSW5zcGlyZWQgYnkgYW4gYW1kZ3B1IGJ1ZyByZXBvcnQuDQo+IA0KPiBUaGFu
a3MgZm9yIHN1Ym1pdHRpbmcgdGhhdCBwYXRjaC4gSXQncyBiZWVuIGluIHRoZSBkb3duc3RyZWFt
IFJQaQ0KPiB0cmVlDQo+IGZvciBhIHdoaWxlLCBzbyBJJ2QgcmVhbGx5IGxpa2UgaXQgdG8gYmUg
bWVyZ2VkIGV2ZW50dWFsbHkgOikNCj4gDQo+IEFja2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhp
bWVAY2Vybm8udGVjaD4NCj4gDQo+IE1heGltZQ0K

--__=_Part_Boundary_004_668568219.171700220--

