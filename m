Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5F576E11F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 09:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6714610E080;
	Thu,  3 Aug 2023 07:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D05110E080
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 07:20:24 +0000 (UTC)
X-UUID: 34e3520a31ce11ee9cb5633481061a41-20230803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=7Acv83XN4+0aFf4PkHXV31u3FWWNAL5Ga68Q7K4bh9U=; 
 b=YLJDMXncvHZMCdtLyA043IEM0IoTPqTGU5KvldtjrPptyRI0/u2W6FRuzkUbmgN2q7i13oxcWHGubzpr/fCkwTXC5esJSbBfq+W0aR0tMzEiSjWgStRSn/GjlCIXbRhYB02ypCVCjm3Wyx5GP+FvtG+blAmhBAH1blOjY3/xJNI=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30, REQID:852b1985-ef93-4763-8ade-8cbe60a8e43f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:28,RULE:Release_Ham,ACTIO
 N:release,TS:82
X-CID-INFO: VERSION:1.1.30, REQID:852b1985-ef93-4763-8ade-8cbe60a8e43f, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,BULK:28,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:82
X-CID-META: VersionHash:1fcc6f8, CLOUDID:eb40c442-d291-4e62-b539-43d7d78362ba,
 B
 ulkID:230802225303LTIP56LL,BulkQuantity:14,Recheck:0,SF:29|28|16|19|48|102
 ,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40|20,QS:nil,BEC:nil,C
 OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FCD, TF_CID_SPAM_SNR, TF_CID_SPAM_SDM,
 TF_CID_SPAM_ASC, TF_CID_SPAM_USA,TF_CID_SPAM_FSD,TF_CID_SPAM_OBB
X-UUID: 34e3520a31ce11ee9cb5633481061a41-20230803
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 228324080; Thu, 03 Aug 2023 15:20:21 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 3 Aug 2023 15:20:20 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 3 Aug 2023 15:20:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZnsLIUkNihNQFopRAn8ODDQ47PH3G7kI8XzZ9hVaBSSw+Ku2+uAHxEjjhrlzpCjtzwcIEUSZmcFXFcMNahBfG2tvRra9NvL13PyZxe9XPPKcYQJNzIEjQFRhDhkZrrna37sR6DFqv6dVJWTiFz6HJgFaKarKxT+9ijH8sBIOAzeOjGa7eJeAUwaCKgmfKg/ZclgAjbJaR7LSzRkATnEKmcOAF469YBBNf8+Puiv9fzxxTlodq806K70JPi4TB5bn/hFpfT4EJ50WwLXsX405sh0EtFZrwZlXBkjHqla81PoAjhGNIylc99vEr2jIZsy8Otn631Xe8EO1se9FqUG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7lMhlIvm1+no3/hMHQP9qiHyB+TGnJH598NQhpFySs=;
 b=GTUzq+nQ7KnzhYT9E274ZMdLLjEZ3JpqtJ2Q3INecDTTQLeEr3gDr0DV/b6Rq+CR2Ra7YpZ4sbkY+3khwTM27T/YLFBKry1HbDRN39z4sMMXhYE3NHsOVZaLCjlbEbqT7Q/w2dEPG0/gClUrzmWwGhxLth8+XnRi8z0H9n2lzNqoBHU4OJeCYCp2W8Y/om7G7vNEFZ5bR8UEEHQTqXpwceJXp1zh+ovmX5UmJWd0jBQCVq7zUqhPj+epMDC21EjM6ptPzo6yvEKDsqWeHufpgg4ssXw1MiUcJqDFntyKLQvgjqvIvOTz1vObufJhoBApjAEUkosxObprRda1oN1T2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7lMhlIvm1+no3/hMHQP9qiHyB+TGnJH598NQhpFySs=;
 b=baGTmVmycn5zS6OJnI7EyIR+78VdH6pe80UZkdvcBj3QoPKoubqDZU59RrNbO3RDBMPO/xF52McAOQUDvABgSPIuMBMPBT1IYJq5O/Mtyz/Pb8elmXuF8urLmtMXO9ATfuPJgak7jSng+8ctrqbpMkNWItNdXPNGmKaB95yblYo=
Received: from SEYPR03MB6459.apcprd03.prod.outlook.com (2603:1096:101:50::10)
 by SG2PR03MB6586.apcprd03.prod.outlook.com (2603:1096:4:1d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 07:20:15 +0000
Received: from SEYPR03MB6459.apcprd03.prod.outlook.com
 ([fe80::b532:b348:3c02:982b]) by SEYPR03MB6459.apcprd03.prod.outlook.com
 ([fe80::b532:b348:3c02:982b%6]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 07:20:15 +0000
From: =?utf-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [v3 2/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Thread-Topic: [v3 2/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Thread-Index: AQHZwxDWBavvSbTht0etjS6nC3ISe6/TxFwAgANXjQCAAB2hgIAA9jgA
Date: Thu, 3 Aug 2023 07:20:15 +0000
Message-ID: <6aa6947865795fc534b61f5b8a80b3c42fd5a0cd.camel@mediatek.com>
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-3-jiaxin.yu@mediatek.com>
 <25e6ab45-ecad-4bc3-bf4d-983243c939ad@sirena.org.uk>
 <c6ae8630d06138b6d0156c19323afebf0718f522.camel@mediatek.com>
 <089fe457-1c61-4b7b-ad37-a67e7f46cb56@sirena.org.uk>
In-Reply-To: <089fe457-1c61-4b7b-ad37-a67e7f46cb56@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6459:EE_|SG2PR03MB6586:EE_
x-ms-office365-filtering-correlation-id: 1864e57a-9f6e-4ceb-8128-08db93f21559
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Iswgkusl9I/pAgjsT4zOv0lDNPhmwjy9lcIhdFU9fxOEAs9AZRV+A0hEwmPnvXTgwUhJ1Syr2ufWWq10gvKCvvZk+sjlATuYT16odZLJzYas4WvlSr0ZT6hbKbY89P4jyx0qQF9me6PnZYYsNNtOC9FGaZpOIlwGzc0EFlPL9GWNLyTirtaD2TbwrBB+Qonasf+tWLv6UbLs7m50O1rueMCqRRD/2gR8ly9kQyrS1gsnkmVGmINJkJRvSJzAeIzHnS+CzyuvWj53yRvmYuCAwpiJ+dxeWWStq356NOpr7GV5bxjDIoGSKeiqGVan8XRmZD93CsK1PjPphwvl0d9q0Y2GkV+pVBnpajAdLXLHwc5JZoodlIyVmJnWge+a/R1zGY7agUXqV2EFV7DLEg8//s9mRtxnQ1tkMdEf7SJbZWUPwHYmFeafBp6rj7j7pk+pPCHDVPyw5vqTvFOIMX27r8eJf3I3uFfbWXLmT8qUH/oRbj73WYTeoclskPTJktpIJl9HsgV6pgIfbEtJ61Ite9H7lOpZrYA8tCmbAnAwdBz5YxVFuTgaZ8OD0xr9imJP/dqGCUxSOp1jW0om2l81D61vS7ToT+Hke6Yzq04KhiSR5AtreG8PHxa0Jf0wSxr7rcWjqHmWE9rKiuuya9aTVHTj4aaUKA1/7xSw0HuK3Zg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6459.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(136003)(346002)(366004)(451199021)(122000001)(6506007)(26005)(38100700002)(186003)(38070700005)(2616005)(83380400001)(2906002)(85182001)(36756003)(5660300002)(7416002)(54906003)(478600001)(8936002)(8676002)(86362001)(6512007)(71200400001)(6486002)(41300700001)(316002)(91956017)(4326008)(66446008)(66476007)(66556008)(66946007)(64756008)(76116006)(6916009)(66899021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUs4bUtNakpVQW5pc1B0WkFVM01pUklTbEpFYkF2b2JQM1VwdmtwbzE2Nmgw?=
 =?utf-8?B?VEhBMS9XQ0NsRktkVW5GLzlYVnZBNjFEMmE4c3hlYjh4enlZbGNkTzVlS1Rs?=
 =?utf-8?B?WXM1RjVWMlVUYnNTdWhyWkFDL0FIMnJNODhxbXlmRkNrNHlUSjlES1g2Y3pv?=
 =?utf-8?B?Q2VCNUhncmV0R0VQSFhNajJ2WjUyRU1BUVUwU1B0RVJIOW5OQk02Z05YbUx3?=
 =?utf-8?B?MkJzMTMySjhUQ2F2S0hyN3ZYUWR5NmZzNTc2a3FIdE9lVVl3U3FOdTNwUi9T?=
 =?utf-8?B?WlBqUnJRZ0xXNmZmTG04ck5yditUcnJRK0svMk02YzVmNitpVk8zWDZOcXVo?=
 =?utf-8?B?RzdwaS92NU1lcTVPQ1RPazZ4UU9vZkltcFdQRU1iOFpZTVVlV0hCMzJSaURh?=
 =?utf-8?B?Q01Jb1hEaXVobVdwZVBvcE02RWhsYzgrVU1JYSsvczhRRTJKazllN0FHeTAr?=
 =?utf-8?B?TGgwSWxRTjE5MFdjMkNOUmJDUFBBNHkwQnlFU0FOUEZuRjFtTC8xazZLWGpN?=
 =?utf-8?B?TzUrNWtDeTBMVmpVanRmYUhBWk03U05CVldmWW5QMGlQMXdGdFFTSUptQXNP?=
 =?utf-8?B?bTRSaTNZL3VjMWRtU2Mrd1N4WHVpQWtQaVJxUVh5aXIxUFRranNVWDFhRk9D?=
 =?utf-8?B?MXNodE81WHkrOG8rcHp2QWR1SFl3dFBGd1o1eU9nc1FYWnFQbVNFN3VxSHVT?=
 =?utf-8?B?NDVWeXVDRUJvd2hYVjF5VGd4KzBYK2RRN1JweWh2WlNEVitkY2QwK2V5dW9K?=
 =?utf-8?B?ZnQxMHg3MWpXVXAwdy9tMjltZzBxT1lBeW1wdk9QWEg5T3dOT0NSR0lpeDJT?=
 =?utf-8?B?OTNoellrWHBDNXVyYS92b0Z1V3JZeUpObWRLN1NTK0lQWjBIZGxLNmwvN1E1?=
 =?utf-8?B?ZkZRTzVwUjRZTVFSTlVsRzllM1hkYVo5b3NNZXVZUE1vUWl6VDBoN2Y1bDlp?=
 =?utf-8?B?dnlyQ0p3cWZ1NkhxTnM2KzdJUnorRmxIQlJabWptK3BORldKbzFJMjF5cVlM?=
 =?utf-8?B?Smd6RENuYWFFYkx5b0psZXdVZ3NIZmY5QVZ4S1V1VUVDT2xvUElabVhTejk3?=
 =?utf-8?B?QzAvOU12bjJRU1hlY0dXTysrVG43cmVIQitDUFd6V0pZOFFrMEVLUTZwaVJC?=
 =?utf-8?B?NS9adUN1ZTNkUThGWmFUdEY2Z1lkd25uck1nem8wcjNzcXg0QWRKMFdmUXJN?=
 =?utf-8?B?QzF0OElZUWVQVmFIK1RnQk50R3dmVDJZTlpTaE1xWXljcmV3RU9qVkh5WWFx?=
 =?utf-8?B?YmdDUm1XeWlYdVVpd0NXTisrclBBVE9WUEZPY2d1amxTN2djSVhkMkFUb0lU?=
 =?utf-8?B?aWRoc0VUM0IyUm9nT2s4QTI4N1BmdmJHTHJtdzIvSlFYNnpJK3BRN0dmeS85?=
 =?utf-8?B?a0ZjMnErcmRLc1BJTndZYTdBNGkreW1vcytHaFFPM1d6QU14RFJaYTNnUis0?=
 =?utf-8?B?eUFZNDdJWGZnSU1nd3UzMFhyZkhyWXNhcjRWaDNHOGNYWVpYdm9vaG8vUHE1?=
 =?utf-8?B?MXNLSzRQR1hMbytTYTkzdkkvNFhjZGVVQU5mRXZQVEtybTVMK0tncGFmZmV1?=
 =?utf-8?B?TWJNVmR4M0ppeHg5SHRzZzE4TWpzc1pUdUI4REgyNGtpWUptZ2hmbVp0ZFl6?=
 =?utf-8?B?L2c3bVVmL2pFNTlGTlpldG03alNyK0tycHNaeTcrR1RKWkplRjBMY3kxSTA0?=
 =?utf-8?B?TTBJaW5ObjUxZExhL3loNjNDd2V2dHNlR0VTcmxMQXFmWGswOHZYYjE4dVNW?=
 =?utf-8?B?N29Hd3IzYkxuTUpRUTdqMDNsUDFjUjZZbWd3dE1rSDZCd2VQZTl2VThzY0Rh?=
 =?utf-8?B?ZklZbTBjMEUwTDY2ZkdZbnR1TWQ5Z0M1RnV0N2xMT0NiL0t4aXJQblg1SERv?=
 =?utf-8?B?KzFwOEVSZWM5WW1ld3dzc1k5TWRjMGFmdVlMZ2dvNGI4RWg5UHVIZFpaRFA4?=
 =?utf-8?B?ejRYV054a25QUHFJUlprR0V5NVN0ejdyOGg2aGdKT3BRSFM4UkJuSTlSUmVn?=
 =?utf-8?B?cWRnaDEyeHpsUkNJVTBYYWdITjhlVGNqMlY0K3lVMmhVTUtOb0NIa2Fma3Mw?=
 =?utf-8?B?ZkZWL1BzcEN6ZU55OWRQcXhGaDZsbi9oMmFqU3Y0R2xyZU9HRHIwU0Z4Y01D?=
 =?utf-8?B?c2ZheDJUenhaOEdDd0Excm9IcXFMTndYT2ZTTjhyL1h6b3RKcVJNdHZxRGVa?=
 =?utf-8?B?NWc9PQ==?=
Content-ID: <2A82F25C250C9B49A02413789F617A83@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6459.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1864e57a-9f6e-4ceb-8128-08db93f21559
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 07:20:15.2467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q/MbAacKtIixiMBfWURq7uf4stlvVsnJSBemWBXhjzFf8mixmSmW9g2lqm+Ea10n9d9Gq720Tg7HhLqXEprAvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6586
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_189443426.613222710"
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 =?utf-8?B?Q2h1bnh1IExpICjmnY7mmKXml60p?= <Chunxu.Li@mediatek.com>,
 =?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?= <Allen-KH.Cheng@mediatek.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_004_189443426.613222710
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjtXZWQsJiMzMjsyMDIzLTA4LTAyJiMzMjthdCYjMzI7MTc6MzgmIzMyOysw
MTAwLCYjMzI7TWFyayYjMzI7QnJvd24mIzMyO3dyb3RlOg0KJmd0OyYjMzI7T24mIzMyO1dlZCwm
IzMyO0F1ZyYjMzI7MDIsJiMzMjsyMDIzJiMzMjthdCYjMzI7MDI6NTI6NTdQTSYjMzI7KzAwMDAs
JiMzMjtKaWF4aW4mIzMyO1l1JiMzMjsoJiMyMDQ0NjsmIzIzNDc4OyYjMzc5OTU7KSYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtPbiYjMzI7TW9uLCYjMzI7MjAyMy0wNy0zMSYjMzI7YXQm
IzMyOzEyOjUwJiMzMjsrMDEwMCwmIzMyO01hcmsmIzMyO0Jyb3duJiMzMjt3cm90ZToNCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyO09uJiMzMjtNb24sJiMzMjtKdWwmIzMyOzMxLCYjMzI7MjAy
MyYjMzI7YXQmIzMyOzAyOjA4OjAyQU0mIzMyOyswODAwLCYjMzI7SmlheGluJiMzMjtZdSYjMzI7
d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtVc2UmIzMyO1NORF9T
T0NfREFQTV9MSU5FJiMzMjtpbnN0ZWFkJiMzMjtvZiYjMzI7U05EX1NPQ19EQVBNX09VVFBVVCYj
MzI7dG8mIzMyO3RyaWdnZXINCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO0RB
UE0mIzMyO2V2ZW50cyYjMzI7dG8mIzMyO2hkbWktY29kZWMmIzMyO3doZW4mIzMyO3VzZXJzcGFj
ZSYjMzI7Y29udHJvbCYjMzI7dGhlJiMzMjtEUEFNJiMzMjtwaW4uDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjtXaHkmIzYzOw0KJmd0OyYjMzI7Jmd0OyYjMzI7SSYjMzI7aGF2ZSYjMzI7ZGVm
aW5lZCYjMzI7YW4mIzMyO1NPQ19EQVBNX1BJTl9TV0lUQ0gmIzMyO3RoYXQmIzMyO25hbWVkJiMz
MjthcyYjMzI7JnF1b3Q7SERNSTEmcXVvdDssJiMzMjtpZiYjMzI7SQ0KJmd0OyYjMzI7Jmd0OyYj
MzI7dXNlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTTkRfU09DX0RBUE1fT1VUUFVULCYjMzI7aXQmIzMy
O2NhbiYjMzk7dCYjMzI7YmUmIzMyO2NvbnRyb2xsZWQmIzMyO2J5JiMzMjtIRE1JMSYjMzk7cyYj
MzI7UElOX1NXSVRDSC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7Li4uDQomZ3Q7JiMzMjsNCiZndDsm
IzMyOyZndDsmIzMyOzI3NjImIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyh3LSZn
dDtkYXBtLSZndDtjYXJkLSZndDtmdWxseV9yb3V0ZWQpDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsyNzYz
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjtyZXR1cm47DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsyNzY0JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyO2VwJiMzMjs9JiMzMjtTTkRfU09DX0RBUE1fRVBfU0lOSzsNCiZndDsmIzMy
OyZndDsmIzMyOzI3NjUmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7c25kX3NvY19kYXBtX3dp
ZGdldF9mb3JfZWFjaF9zaW5rX3BhdGgodywmIzMyO3ApJiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsyNzY2JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjtpZiYjMzI7KHAtJmd0O3NpbmstJmd0O2lkJiMzMjs9PSYjMzI7c25k
X3NvY19kYXBtX3NwayYjMzI7fHwNCiZndDsmIzMyOyZndDsmIzMyOzI3NjcmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtwLSZndDtzaW5rLSZndDtpZCYj
MzI7PT0mIzMyO3NuZF9zb2NfZGFwbV9ocA0KJmd0OyYjMzI7Jmd0OyYjMzI7fHwNCiZndDsmIzMy
OyZndDsmIzMyOzI3NjgmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtwLSZndDtzaW5rLSZndDtpZCYjMzI7PT0NCiZndDsmIzMyOyZndDsmIzMyO3NuZF9z
b2NfZGFwbV9saW5lDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsm
IzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Mjc2OSYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3AtJmd0O3NpbmstJmd0O2lkJiMzMjs9PQ0K
Jmd0OyYjMzI7Jmd0OyYjMzI7c25kX3NvY19kYXBtX2lucHV0KQ0KJmd0OyYjMzI7Jmd0OyYjMzI7
ew0KJmd0OyYjMzI7Jmd0OyYjMzI7Mjc3MCYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjtlcCYjMzI7PSYjMzI7MDsNCiZndDsmIzMyOw0KJmd0OyYjMzI7VGhlJiMzMjtleHBlY3RhdGlv
biYjMzI7aGVyZSYjMzI7aXMmIzMyO3RoYXQmIzMyO3lvdSYjMzk7bGwmIzMyO2Nvbm5lY3QmIzMy
O3RoZSYjMzI7b3V0cHV0JiMzMjt0byYjMzI7YSYjMzI7d2lkZ2V0DQomZ3Q7JiMzMjt0aGF0DQom
Z3Q7JiMzMjtjb3JyZXNwb25kcyYjMzI7dG8mIzMyO3RoZSYjMzI7cGh5c2ljYWwmIzMyO291dHB1
dCYjMzI7b24mIzMyO3lvdXImIzMyO2JvYXJkJiMzMjthbmQmIzMyO3B1dCYjMzI7dGhlJiMzMjtw
aW4NCiZndDsmIzMyO3N3aXRjaA0KJmd0OyYjMzI7b24mIzMyO3RoYXQsJiMzMjtpZGVhbGx5JiMz
Mjt3aXRoJiMzMjthJiMzMjtsYWJlbCYjMzI7dGhhdCYjMzI7Y29ycmVzcG9uZHMmIzMyO3RvJiMz
MjtjYXNlJiMzMjttYXJraW5ncyYjMzI7b3INCiZndDsmIzMyO3doYXQNCiZndDsmIzMyO3RoZSYj
MzI7cGh5c2ljYWwmIzMyO291dHB1dCYjMzI7aXMmIzMyO2NhbGxlZCYjMzI7b24mIzMyO3RoZSYj
MzI7Ym9hcmQuDQoNCkRlYXImIzMyO2Jyb3duLA0KDQpJJiMzMjthZ3JlZSYjMzI7d2l0aCYjMzI7
eW91LCYjMzI7aW4mIzMyO2ZhY3QmIzMyO3RoZSYjMzI7c3BlYWtlciYjMzI7aXMmIzMyO2luZGVl
ZCYjMzI7ZG9pbmcmIzMyO3RoaXMmIzMyO3dheS4mIzMyO0J1dA0KYWJvdXQmIzMyO3RoZSYjMzI7
aGRtaSYjMzI7dGhhdCYjMzI7b24mIzMyO3RoZSYjMzI7Ym9hcmQsJiMzMjtJJiMzMjtkaWQmIzMy
O25vdCYjMzI7ZmluZCYjMzI7YSYjMzI7ZGVmaW5hdGlvbiYjMzI7bGluaw0Kc25kX3NvY19kYXBt
X2hkbWksJiMzMjtzbyYjMzI7SSYjMzI7dXNlJiMzMjtzbmRfc29jX2RhcG1fbGluZSYjMzI7dG8m
IzMyO3JlcGxhY2UuJiMzMjtUaGUmIzMyO3B1cnBvc2UNCmlzJiMzMjt0byYjMzI7Y29udHJvbCYj
MzI7aXQmIzMyO2xpbmsmIzMyO3NwZWFrZXIuJiMzMjtPciYjMzI7d2hhdCYjMzI7ZG8mIzMyO3lv
dSYjMzI7c3VnZ2VzdCYjMzI7SSYjMzI7c2hvdWxkJiMzMjtkbyYjNjM7JiMzMjsNCg0KVGhhbmsm
IzMyO3lvdSYjMzI7dmVyeSYjMzI7bXVjaC4NCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17
LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioq
KioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1h
aWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50
aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBk
aXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpj
b252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlz
c2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWlu
ZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVu
ZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxh
d2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWls
LCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJv
ciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRv
IHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWls
IChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90
DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29u
LiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_004_189443426.613222710
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIzLTA4LTAyIGF0IDE3OjM4ICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBXZWQsIEF1ZyAwMiwgMjAyMyBhdCAwMjo1Mjo1N1BNICswMDAwLCBKaWF4aW4gWXUgKOS/nuWu
tumRqykgd3JvdGU6DQo+ID4gT24gTW9uLCAyMDIzLTA3LTMxIGF0IDEyOjUwICswMTAwLCBNYXJr
IEJyb3duIHdyb3RlOg0KPiA+ID4gT24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgMDI6MDg6MDJBTSAr
MDgwMCwgSmlheGluIFl1IHdyb3RlOg0KPiA+ID4gPiBVc2UgU05EX1NPQ19EQVBNX0xJTkUgaW5z
dGVhZCBvZiBTTkRfU09DX0RBUE1fT1VUUFVUIHRvIHRyaWdnZXINCj4gPiA+ID4gREFQTSBldmVu
dHMgdG8gaGRtaS1jb2RlYyB3aGVuIHVzZXJzcGFjZSBjb250cm9sIHRoZSBEUEFNIHBpbi4NCj4g
PiA+IFdoeT8NCj4gPiBJIGhhdmUgZGVmaW5lZCBhbiBTT0NfREFQTV9QSU5fU1dJVENIIHRoYXQg
bmFtZWQgYXMgIkhETUkxIiwgaWYgSQ0KPiA+IHVzZQ0KPiA+IFNORF9TT0NfREFQTV9PVVRQVVQs
IGl0IGNhbid0IGJlIGNvbnRyb2xsZWQgYnkgSERNSTEncyBQSU5fU1dJVENILg0KPiANCj4gLi4u
DQo+IA0KPiA+IDI3NjIgICAgICAgICAgICAgICAgIGlmICh3LT5kYXBtLT5jYXJkLT5mdWxseV9y
b3V0ZWQpDQo+ID4gMjc2MyAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47DQo+ID4gMjc2
NCAgICAgICAgICAgICAgICAgZXAgPSBTTkRfU09DX0RBUE1fRVBfU0lOSzsNCj4gPiAyNzY1ICAg
ICAgICAgICAgICAgICBzbmRfc29jX2RhcG1fd2lkZ2V0X2Zvcl9lYWNoX3NpbmtfcGF0aCh3LCBw
KSB7DQo+ID4gMjc2NiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocC0+c2luay0+aWQgPT0g
c25kX3NvY19kYXBtX3NwayB8fA0KPiA+IDI3NjcgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwLT5zaW5rLT5pZCA9PSBzbmRfc29jX2RhcG1faHANCj4gPiB8fA0KPiA+IDI3NjggICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwLT5zaW5rLT5pZCA9PQ0KPiA+IHNuZF9zb2Nf
ZGFwbV9saW5lDQo+ID4gPiA+IA0KPiA+IA0KPiA+IDI3NjkgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwLT5zaW5rLT5pZCA9PQ0KPiA+IHNuZF9zb2NfZGFwbV9pbnB1dCkNCj4gPiB7
DQo+ID4gMjc3MCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXAgPSAw
Ow0KPiANCj4gVGhlIGV4cGVjdGF0aW9uIGhlcmUgaXMgdGhhdCB5b3UnbGwgY29ubmVjdCB0aGUg
b3V0cHV0IHRvIGEgd2lkZ2V0DQo+IHRoYXQNCj4gY29ycmVzcG9uZHMgdG8gdGhlIHBoeXNpY2Fs
IG91dHB1dCBvbiB5b3VyIGJvYXJkIGFuZCBwdXQgdGhlIHBpbg0KPiBzd2l0Y2gNCj4gb24gdGhh
dCwgaWRlYWxseSB3aXRoIGEgbGFiZWwgdGhhdCBjb3JyZXNwb25kcyB0byBjYXNlIG1hcmtpbmdz
IG9yDQo+IHdoYXQNCj4gdGhlIHBoeXNpY2FsIG91dHB1dCBpcyBjYWxsZWQgb24gdGhlIGJvYXJk
Lg0KDQpEZWFyIGJyb3duLA0KDQpJIGFncmVlIHdpdGggeW91LCBpbiBmYWN0IHRoZSBzcGVha2Vy
IGlzIGluZGVlZCBkb2luZyB0aGlzIHdheS4gQnV0DQphYm91dCB0aGUgaGRtaSB0aGF0IG9uIHRo
ZSBib2FyZCwgSSBkaWQgbm90IGZpbmQgYSBkZWZpbmF0aW9uIGxpbmsNCnNuZF9zb2NfZGFwbV9o
ZG1pLCBzbyBJIHVzZSBzbmRfc29jX2RhcG1fbGluZSB0byByZXBsYWNlLiBUaGUgcHVycG9zZQ0K
aXMgdG8gY29udHJvbCBpdCBsaW5rIHNwZWFrZXIuIE9yIHdoYXQgZG8geW91IHN1Z2dlc3QgSSBz
aG91bGQgZG8/IA0KDQpUaGFuayB5b3UgdmVyeSBtdWNoLg0K

--__=_Part_Boundary_004_189443426.613222710--

