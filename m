Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95957859EFF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 10:01:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8A010E1D8;
	Mon, 19 Feb 2024 09:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="h/N9Q6Ur";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="P5l5gClL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EA110E1CE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 09:00:57 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41J7tBWU027763; Mon, 19 Feb 2024 09:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:mime-version; s=dk201812; bh=lhx2LUVoBSnDDaE7ABZpY
 j7dx4LYCODPdgqul+ELSmQ=; b=h/N9Q6UrHcUzqIFekdveg29Ui6UK65Let+Ylx
 CAYlw8yExdRxeAFy67sQPXQ/NHUSs/8AVKZVrbvSQDcGUoedZgcDxzNenYuWZdy7
 bWYeylqFOfZOLO8QRsfBMNzOI4HC3L21S1tRRsmTR7cBtGR5/AIBU2Xqxhl2cWRo
 Zwobh7lY4NOxhWWy6h+yunMQTRNDpPMZHNJ9Z13wsabivAIQI9GE9hyfN7DCY9Xv
 MnFvofGgfB1H6dBvarPiLz0QXTHvnnlZDBTgf1mtYhoH+pMbrlIbXLNLtg8TXgem
 ue0xWeD7LebDm8wlcVIRoByR5zVS4pRI5y5khzHfiajvUgbrA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3wanrvsddu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 19 Feb 2024 09:00:31 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 09:00:30 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 09:00:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nV17zZdcQhgvHoWS/VtjxAsZS1ZdSvHyMHfjuaneqjoRCu21YE3vV8fbu2sYnfbDQGidVe0V+VSNz8oU3/bc7XNOcfjTokzduEuOr3eBnGidWRzSfgMep2qPJOsOe0mP7RTJnqJkqQCjviRm8YRVjnbHUZEkbe7LyrK4ug6/69HthFz6JZglDx6+vUI7FDTHhVpul9nGtgkvEY2Y3RaGaJ4oKadnGD+K/0FjGjFNpp5ZDQT+CCwIWuvlQrAgrYJVGFka7nbrh2BhPwzfVorFaNurfu1MB43D0G/ZiU062GpQfZOOzZdlUu/mZDrkhzuIxLtjKy7ielsoifUD8TcxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhx2LUVoBSnDDaE7ABZpYj7dx4LYCODPdgqul+ELSmQ=;
 b=RQF28f/N4FQr8EJ2WtqSpqsu2DT6g5+wiltrv1a851wZ3mONpVD66C+agbPII7W8aF+FhTP5fkjr1mYsJsV+scn1j9thOIq0H/8V1haj/ld0LDRE8OWOn9nc1tbRAivGZAhywbH/CQ8GRA/bd3zSGN3prygnBO50hpFJHhIqkOuU04F4/TN5PG7TdJkDcFK912rWMmU3LQrrDI8oVKQbeHtOJDKyo5DXCmK4xpm6hsZoUhOgtEqSH8HvUYTE1OkT/Fk+zA+nXjcmVwc8p3rmdNBFKlQ9no41XX1GvsULrU5hM82ug0lbOZtrIrJ3SEVFYz15doHhCBnIpLQk7XSEig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhx2LUVoBSnDDaE7ABZpYj7dx4LYCODPdgqul+ELSmQ=;
 b=P5l5gClLvp1hPK4w9gCZDDhMVfQ7/mt1XgYiyi+BFtf6IbB3CthxFQNO6NpuYtBuaRU40fPCKBv32tiy+RQWJ38nEO1b60UXpK3nacgngwjr/C0gLMxc9dBY3U9A0DmhTbsdGm9wqbkdGDjdfhh0lb7tuJT0gx9NwrDENmr9ZmA=
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16c::5)
 by CWXP265MB5298.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:191::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Mon, 19 Feb
 2024 09:00:27 +0000
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4b5c:d51f:da10:2626]) by LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4b5c:d51f:da10:2626%5]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 09:00:27 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Adam Ford <aford173@gmail.com>
CC: Maxime Ripard <mripard@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Sarah
 Walker" <Sarah.Walker@imgtec.com>, Javier Martinez Canillas
 <javierm@redhat.com>, Nishanth Menon <nm@ti.com>, Marek Vasut
 <marek.vasut@mailbox.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Thread-Topic: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Thread-Index: AQHaYxIUhgoz/G+Kvkq/JRlnzqZV/A==
Date: Mon, 19 Feb 2024 09:00:27 +0000
Message-ID: <1ff513b9-d4fd-4663-b46b-bb9662e3881c@imgtec.com>
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
 <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
 <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
 <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
 <CAHCN7xKffJ29zyjoJVAcy3b_d=-zkFzbL=URj4yWJWzYvRdB_Q@mail.gmail.com>
 <TYCPR01MB11269CBE8429A31DE5002A5A5864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <nzrkujogauvn262ucxippwidyub6ikcohcjpbpn4hzj7rymctm@4owntgrmcquf>
 <TYCPR01MB11269CBAA20275E11D9AD6500864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <wxwad77x2mxhhwdsbgiytzn6x54t4sywodjhzefwldo277njiz@ru7z54wxgelu>
 <CAHCN7xJi-6W6x+OJmkNwOX45SM4WHD5zkN42ZOp8ZxFnp3YL5w@mail.gmail.com>
In-Reply-To: <CAHCN7xJi-6W6x+OJmkNwOX45SM4WHD5zkN42ZOp8ZxFnp3YL5w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB3404:EE_|CWXP265MB5298:EE_
x-ms-office365-filtering-correlation-id: 1f07288a-55c9-476c-584b-08dc3129374d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KVNc8QN2F2RIJeIuujbSRVrPzYgtJCbo35l/0frcb+Y2u+mtnwmQTHiZFdZ/J2RT2DNxjuuTdxVl9Vy6VotDt3WAXEwkze9XMrE3EzOWwbzA9CeggCqO97bDC04vsO0VsV49ivBd0Kq/9+RB4K9snVZvWwAi8DYt4Rl3of9nTAZKNhdhqh3GjzJwqRZ4gyORmkWoaZUd997Jj1Zch0rp0mU1klFxIs9dQiE9sUAcX1oA0+GhFxYsrakcQXsau5A8ZpyGWFwGv0d7evw52AgxjKsVDlPDHKASa01VjghXWMpKt/HVaoiWuy2pK0SCUrBAXBs1L+ei7dXpl+O32dT23f7aVC+0Rzv8Uj3SDV/wchmAB7CP+mdzm0bkEIl5kTo8kl1hz+5DX/VyjtY1rTXedWvIP/DQhQf9nptH76fK+75rhNvURCJUo/0cJ1V9t++fzdVYiu+YLl7DR/OUAvXab5e062bUYsDMjPW/lF+YPzDIY9DdXunFRYLXvei7RlNmYZO/oOJlsGtj72GhlJa8plZ9JuPoWVuduZdFTapet/7W4GZu+gnrduJCcrvpTywPrbtv34xcVQOR0XMfZjA8GbE5ndalgTof4GW1gmI+Ols=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39840400004)(376002)(366004)(136003)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38100700002)(31686004)(122000001)(2906002)(7416002)(5660300002)(6916009)(8676002)(8936002)(41300700001)(316002)(66556008)(66476007)(31696002)(86362001)(66446008)(64756008)(66946007)(76116006)(4326008)(6486002)(6512007)(478600001)(966005)(71200400001)(54906003)(6506007)(99936003)(83380400001)(53546011)(2616005)(36756003)(38070700009)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzZqMGI1YzBxTzNrSG5YUTJNak1JQkZ5QVhjc2VVK3RmcmVGYkU4Z0tVVEEv?=
 =?utf-8?B?eHVKT1RDMzFRcXNoT3lWZ3lueEZMcnQraE1BNjU2aGRmTzNWMlM4ems5Wk1L?=
 =?utf-8?B?WDA5cm5lYjN4MSs1Zmt0dFYzcHZta3QzdGp0dUZtYzRmK1Z2VFZ4SGlRYnlM?=
 =?utf-8?B?aFFZMEMrN1lOTmE3bDNIOVB4UUtFcllsa2dYQy9YanhZalN3KzJYTGVTUlRh?=
 =?utf-8?B?aGw5WXQrbnN2c2V6TG8wVytmeTYwZUpHdFJqdi9lZjNQS0I2Z3VTOEV3Y25B?=
 =?utf-8?B?M2ZCTUNlSzhQR0FYRFk4enF6Sm9tWlQxNmFOY3pXdEF4Y0VzSjhLS0lnZURQ?=
 =?utf-8?B?clVpbytKVE9FTjNRdFAxMVZTdDdSck5UNWFmQnpjclJrd0FVbUJYd3luZFpZ?=
 =?utf-8?B?b3MyS3VIOHFLTzVLMUVSL2lsNjZwQ2d0WmlGZFdyQlFRbXZ2QzJ6MTVXVTFG?=
 =?utf-8?B?NWhTRG9vV1dwMUc0Q3lCL2J4eExudmlvWW5Wd01rYlBzb25zR3FRWkhVMitD?=
 =?utf-8?B?UmV0bjV3Y0VqNG5QS1Jhd09MbklBTjA1OHZwU2dlYzBJc3pDL3dvVnl1UG1U?=
 =?utf-8?B?Zm1UQjB3blNKWDU1MFdZcmRSTS9Xam5YcnFOSGFKZlY4RjJKRXZxNFRidXpU?=
 =?utf-8?B?ZE91ODRGRzhTZFdZTW1aVkM4dkV0Y0N0NVZCVWg0THlVMkVYUGFSY2ErZWpl?=
 =?utf-8?B?dGFvY0xvMjJuSGJNSm0yMjZQVFFvY3d5bzZrallDYnNkeC9wcGVFeXBXcXhr?=
 =?utf-8?B?RTg2dlZZQlhYSzg4VVFEOTRYNmM0YUY0WmtuaVMzZXlzZ0psZHRnSXlyeEd3?=
 =?utf-8?B?VjBhMkNJVitodnpCeUZEMDBZK1BGaGxzSWN6enlZRmhrajlwa0pQeTUyZzN2?=
 =?utf-8?B?MDFFQ1RNenlNY0NtT2w3RXZCOVArb05xZlpVeTBuRVlNMExVL0Y3emUwYnV0?=
 =?utf-8?B?VmlzTms4SmRpOGNwQzNnRzlBQTh1NE1LREVMK1BQZnJmWGthNUQ3Njl0eEdy?=
 =?utf-8?B?SjI4cTVpNDlMZGFpVVQwWTdLdG9OZkMzSUs0aWxxUFZFLzVvOERyUkUyWElk?=
 =?utf-8?B?YTZDRkFHUXJMVFlzMTdqTU0wem14MWkyY09CQWdaVnk5NXFkSkwwV3FJMHdR?=
 =?utf-8?B?UE1VUy9BUHVSakZsV3QrWkNwSkluTmU5UElySklPSUptRUZyRzAyaFBwRW44?=
 =?utf-8?B?NC9vQnlUc0owWnVzQnErcDZrY0lKdnRBOUovQ21vbWNpL2hHdWU5NHUxeCtJ?=
 =?utf-8?B?eXZ3TUxHdDdxbkNIN24vK25jS2kwWjAzelNKSlgxTXVQTW9SWGdvSnVJR08y?=
 =?utf-8?B?aDZGLzBNL1MvTTVhQ1NJZERxOFlpZDNoNDVBSnNjaFNUOGs3dEVYT0pDMVE1?=
 =?utf-8?B?NGJZUHQwZWppa1liKzh2dnVaUEVrTDR6ZHliNkNXYS9kMVBJVnpMSWpMQkhz?=
 =?utf-8?B?MzBrbktYKzl2cER1QlFTT1o1RUgxb0ZUNllUbDBpbDNaOWtZREZ3N2orWDVN?=
 =?utf-8?B?aTB1WU1JSTFyZkY5OENKVVJPS3MwR2hkTm9jTldQVUUxRElCUGgwZ1d5UU1Y?=
 =?utf-8?B?dElzRlJrUmoxVE1IUlcrMU5GTkVCR29TRUlUbEtKdi95S3ptdzdhWk1TZVZR?=
 =?utf-8?B?T0U5RzA1VlF0RGR5bEJERXNhdFNkY1g2dEpGTE4vYndsU3p4M1hpc1dOVmF0?=
 =?utf-8?B?SUZwWWxONTB4MmtTa0V1UVZGdHFtMUo3YWwxNmNPc25DUTNxRlBoZ2VsV1VR?=
 =?utf-8?B?VSs3RGlUalJBQmM5bk11UkdBWE9CRjNEQnIxT1VFYkdMdDZPeGExRzYwYWRN?=
 =?utf-8?B?ejZZVW15VThTVFd5RG5kMUFYdmUxbFNFWWJzQ2JmVnF1UGhLQkVTcUNRbEF0?=
 =?utf-8?B?bmdkWTlxNVRKb0FxaTU5WkRJbWhaQXhkY29mWCtRMkZITGZVL1lPKzFDOHZ6?=
 =?utf-8?B?ZmV5WGJka1JUcmNCcS9rQnVQMGdjcnhJeDZrbWFPWWNBazN2TlpvWG4xZUFo?=
 =?utf-8?B?WWRxN3ZlVDNmVkJoa25kcE9CSWNwSDh0cjhYemwxUCtaL1VnZnNRL3FnZEFB?=
 =?utf-8?B?eTF4aU1pRzVFNGNPaVNLV3hRZ05yNTJkeWtoNGhBN2tsclZrNk5OWThKWENI?=
 =?utf-8?B?SkJMbnJhNGoranJmZkZGVmZQa2NuYStnR1RHa1JKQk5jdEN0WUNiaUVOYm81?=
 =?utf-8?B?SFE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ha7LX0M8wgsyahGCVSED1Pxg"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f07288a-55c9-476c-584b-08dc3129374d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2024 09:00:27.0460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ql9bfUkJ+0AsktDQ0sXtrg9A+0cAOEr6VPX9USECpQih7lJsNN4ekXQyjBVGLQetm3sFFSeydxolw0KBkoa6lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5298
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: vglMKDHSMRtJ9sDDtCp99rZXROTqRE1O
X-Proofpoint-GUID: vglMKDHSMRtJ9sDDtCp99rZXROTqRE1O
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------ha7LX0M8wgsyahGCVSED1Pxg
Content-Type: multipart/mixed; boundary="------------1xsLN9pK6q311Mc1xcQLrJKv";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Adam Ford <aford173@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sarah Walker <sarah.walker@imgtec.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Nishanth Menon <nm@ti.com>,
 Marek Vasut <marek.vasut@mailbox.org>, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <1ff513b9-d4fd-4663-b46b-bb9662e3881c@imgtec.com>
Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
 <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
 <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
 <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
 <CAHCN7xKffJ29zyjoJVAcy3b_d=-zkFzbL=URj4yWJWzYvRdB_Q@mail.gmail.com>
 <TYCPR01MB11269CBE8429A31DE5002A5A5864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <nzrkujogauvn262ucxippwidyub6ikcohcjpbpn4hzj7rymctm@4owntgrmcquf>
 <TYCPR01MB11269CBAA20275E11D9AD6500864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <wxwad77x2mxhhwdsbgiytzn6x54t4sywodjhzefwldo277njiz@ru7z54wxgelu>
 <CAHCN7xJi-6W6x+OJmkNwOX45SM4WHD5zkN42ZOp8ZxFnp3YL5w@mail.gmail.com>
In-Reply-To: <CAHCN7xJi-6W6x+OJmkNwOX45SM4WHD5zkN42ZOp8ZxFnp3YL5w@mail.gmail.com>

--------------1xsLN9pK6q311Mc1xcQLrJKv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Adam,

On 18/02/2024 23:26, Adam Ford wrote:
> On Fri, Feb 16, 2024 at 8:14=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
>>
>> On Fri, Feb 16, 2024 at 09:13:14AM +0000, Biju Das wrote:
>>> Hi Maxime Ripard,
>>>
>>>> -----Original Message-----
>>>> From: Maxime Ripard <mripard@kernel.org>
>>>> Sent: Friday, February 16, 2024 9:05 AM
>>>> Subject: Re: RE: [PATCH v2] drm/imagination: DRM_POWERVR should depe=
nd on
>>>> ARCH_K3
>>>>
>>>> On Fri, Feb 16, 2024 at 08:47:46AM +0000, Biju Das wrote:
>>>>> Hi Adam Ford,
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Adam Ford <aford173@gmail.com>
>>>>>> Sent: Thursday, February 15, 2024 11:36 PM
>>>>>> Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depend=

>>>>>> on
>>>>>> ARCH_K3
>>>>>>
>>>>>> On Thu, Feb 15, 2024 at 11:22=E2=80=AFAM Adam Ford <aford173@gmail=
=2Ecom> wrote:
>>>>>>>
>>>>>>> On Thu, Feb 15, 2024 at 11:10=E2=80=AFAM Adam Ford <aford173@gmai=
l.com>
>>>> wrote:
>>>>>>>>
>>>>>>>> On Thu, Feb 15, 2024 at 10:54=E2=80=AFAM Geert Uytterhoeven
>>>>>>>> <geert@linux-m68k.org> wrote:
>>>>>>>>>
>>>>>>>>> Hi Maxime,
>>>>>>>>>
>>>>>>>>> On Thu, Feb 15, 2024 at 5:18=E2=80=AFPM Maxime Ripard
>>>>>>>>> <mripard@kernel.org>
>>>>>> wrote:
>>>>>>>>>> On Thu, Feb 15, 2024 at 01:50:09PM +0100, Geert Uytterhoeven
>>>>>> wrote:
>>>>>>>>>>> Using the Imagination Technologies PowerVR Series 6 GPU
>>>>>>>>>>> requires a proprietary firmware image, which is currently
>>>>>>>>>>> only available for Texas Instruments K3 AM62x SoCs.  Hence
>>>>>>>>>>> add a dependency on ARCH_K3, to prevent asking the user
>>>>>>>>>>> about this driver when configuring a kernel without Texas
>>>>>>>>>>> Instruments K3
>>>>>> Multicore SoC support.
>>>>>>>>>>
>>>>>>>>>> This wasn't making sense the first time you sent it, and now
>>>>>>>>>> that commit log is just plain wrong. We have firmwares for
>>>>>>>>>> the G6110, GX6250, GX6650, BXE-4-32, and BXS-4-64 models,
>>>>>>>>>> which can be found on (at least) Renesas, Mediatek,
>>>>>>>>>> Rockchip, TI and StarFive, so across three
>>>>>>>>>
>>>>>>>>> I am so happy to be proven wrong!
>>>>>>>>> Yeah, GX6650 is found on e.g. R-Car H3, and GX6250 on e.g.
>>>>>>>>> R-Car M3-
>>>>>> W.
>>>>>>>>>
>>>>>>>>>> architectures and 5 platforms. In two months.
>>>>>>>>>
>>>>>>>>> That sounds like great progress, thanks a lot!
>>>>>>>>>
>>>>>>>> Geert,
>>>>>>>>
>>>>>>>>> Where can I find these firmwares? Linux-firmware[1] seems to
>>>>>>>>> lack all but the original K3 AM62x one.
>>>>>>>>
>>>>>>>> I think PowerVR has a repo [1], but the last time I checked it,
>>>>>>>> the BVNC for the firmware didn't match what was necessary for
>>>>>>>> the GX6250 on the RZ/G2M.  I can't remember what the
>>>>>>>> corresponding R-Car3 model is.  I haven't tried recently because=

>>>>>>>> I was told more documentation for firmware porting would be
>>>>>>>> delayed until everything was pushed into the kernel and Mesa.
>>>>>>>> Maybe there is a better repo and/or newer firmware somewhere els=
e.
>>>>>>>>
>>>>>>> I should have doubled checked the repo contents before I sent my
>>>>>>> last e-mail , but it appears the firmware  [2] for the RZ/G2M,
>>>>>>> might be present now. I don't know if there are driver updates
>>>>>>> necessary. I checked my e-mails, but I didn't see any
>>>>>>> notification, or I would have tried it earlier.  Either way, than=
k
>>>>>>> you Frank for adding it.  I'll try to test when I have some time.=

>>>>>>>
>>>>>>
>>>>>> I don't have the proper version of Mesa setup yet, but for what it=
's
>>>>>> worth, the firmware loads without error, and it doesn't hang.
>>>>>
>>>>> Based on [1] and [2],
>>>>>
>>>>> kmscube should work on R-Car as it works on RZ/G2L with panfrost as=

>>>>> earlier version of RZ/G2L which uses drm based on RCar-Du, later ch=
anged
>>>> to rzg2l-du.
>>>>
>>>> IIRC, the mesa support isn't there yet for kmscube to start.
>>>
>>> What about glmark2? I tested glmark2 as well.
>>
>> It's not really a matter of kmscube itself, but the interaction with t=
he
>> compositor entirely. You can run a headless vulkan rendering, but an
>> application that renders to a window won't work.
>=20
> I have made a little progress.  I have Ubuntu running on an RZ/G2M
> (Rogue GX6250) with a device tree configuring the GPU and the GPU
> loads with firmware.
>=20
>   powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.45.2.58_v=
1.fw
>   powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)
>   [drm] Initialized powervr 1.0.0 20230904 for fd000000.gpu on minor 0
>=20
> drmdevice lists card0 and renderD128
> --- Checking the number of DRM device available ---
> --- Devices reported 2 ---
> --- Retrieving devices information (PCI device revision is ignored) ---=

> device[0]
> +-> available_nodes 0x05
> +-> nodes
> |   +-> nodes[0] /dev/dri/card0
> |   +-> nodes[2] /dev/dri/renderD128
> +-> bustype 0002
> |   +-> platform
> |       +-> fullname /soc/gpu@fd000000
> +-> deviceinfo
>     +-> platform
>         +-> compatible
>                     renesas,r8a774a1-gpu
>                     img,img-axe
>=20
> There is more to this dump, but it seems to repeat. I wanted to show
> that it seems like it's trying to work.
>=20
> I think I need to modify the powervr code in mesa to recognize the
> renesas,r8a774a1-gpu and associate it with the rcar-du, but I am not
> sure, and I am hoping someone might be able to provide some guidance,
> since I think I am missing something somewhere. I modified
> pvr_device.c in the mesa driver to attempt do this:
>=20
> /* This is the list of supported DRM render/display driver configs. */
> static const struct pvr_drm_device_config pvr_drm_configs[] =3D {
>    DEF_CONFIG("mediatek,mt8173-gpu", "mediatek-drm"),
>    DEF_CONFIG("ti,am62-gpu", "ti,am625-dss"),
>    DEF_CONFIG("renesas,r8a774a1-gpu", "rcar-du"),
> };
>=20
> When I run modetest -M rcar-du, I can see the encoders and connectors
> and I can display test patterns, so the rcar-du is working.
>=20
> I built Mesa 24.0.1 with the following options:
>=20
> meson setup builddir -Dvulkan-drivers=3Dimagination-experimental
> -Dimagination-srv=3Dtrue -Dtools=3Dall -Dgallium-drivers=3Dzink,kmsro,s=
wrast
>=20
> I have tried to set PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 the Mesa
> documentation for the powerVR, and I have exported the variable for
> VK_ICD_FILENAMES to point to the powervr json file.
>=20
> when I try to run glmark2-drm, I was expecting the GL reddered to be
> the powervr, but it keeps using the
> GL_RENDERER:    llvmpipe (LLVM 15.0.7, 128 bits)
>=20
> I realize this driver is still in its infancy, but I was hoping
> someone could give me some guidance to let me know if the work to do
> is on the Mesa side or the rcar-du driver side, or something else.
>=20
> I rebuilt both libdrm and mesa.  While I don't get any errors, I also
> don't get the hardware acceleration I was hoping for.
>=20
> I even tried  PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1
> MESA_LOADER_DRIVER_OVERRIDE=3Dzink MESA_DEBUG=3Dcontect glmark2-drm
>=20
> ...but it only renders with llvmpipe
>=20
>     glmark2 2023.01
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>     OpenGL Information
>     GL_VENDOR:      Mesa
>     GL_RENDERER:    llvmpipe (LLVM 15.0.7, 128 bits)
>     GL_VERSION:     4.5 (Compatibility Profile) Mesa 24.0.1
>     Surface Config: buf=3D32 r=3D8 g=3D8 b=3D8 a=3D8 depth=3D32 stencil=
=3D0 samples=3D0
>     Surface Size:   3840x2160 fullscreen
>=20
>=20
> I am not as familiar with the Mesa side, but if I can get this working
> to a point where something is rendered, even if it's not 100%
> compliant, I'd like to push patches to the kernel and/or Mesa if
> necessary.
>=20
> adam
>=20
>=20
>=20
>=20
>>
>> Maxime

I suggest you try running Vulkan demos (we use Sascha Willems=E2=80=99 [1=
])
instead of GL at this stage. Support for Zink is currently under heavy
development so you may have trouble differentiating between issues with
your kernel changes and the incompleteness in Mesa.

Matt

[1]: https://github.com/SaschaWillems/Vulkan

--------------1xsLN9pK6q311Mc1xcQLrJKv--

--------------ha7LX0M8wgsyahGCVSED1Pxg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZdMYqgUDAAAAAAAKCRB5vBnz2d5qsMPB
AQCQjNAki64edEkMOWibhRLHt7rWcu/9Cj6vIoGZsOijnwEA4tpQlnC0cJFH6BE65UEsvkB+x63f
7LFGglsyliUsegQ=
=ExFl
-----END PGP SIGNATURE-----

--------------ha7LX0M8wgsyahGCVSED1Pxg--
