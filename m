Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3108FA1EB6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 17:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFD46E142;
	Thu, 29 Aug 2019 15:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700079.outbound.protection.outlook.com [40.107.70.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B52C6E12C;
 Thu, 29 Aug 2019 15:18:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niUca7fjSi4Pj9OJpJclXQYy0aaMvgxbh3rSylmQjd1hKva94Rknee3XloJsIjC8GXlMpddxaJcbUl31DE9tV7P5C/eifhNBqqTvNZjFzR98SwpByB+7QDkfWM7ngqZYGHprxPoWZwupqVI4xSdjr+CSKp59zxp8trJcK3RCUQ1WTn2cb2YUQUQxANkkUqzdMqV5eRCElDc6NS5k90edp8hjzWrvco399hwO2zn3WTmKqGflHqrcYfvow0xBgi9Kl6aseuTh8Tk57D99r6cEkmv8FsMFnI55UVPiIDruFi4OqHnFoXtUlHQG6F0WoMQ4CHey1+8uHFifcW39WgEssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwGCoUrEa9qRo97So+YkGhwolEqC4E8w/5mq9yMDb9U=;
 b=isancnb77ny4TFB1eE1Ov6B7exCH0dQ7nNCQGaXTAKl3qUdEdyyzc13b667q21j2TfG2YBt5yBL5fG04niHSsHNM7kBIlJVZp+EGLnaVghZaglhnjuQ+e61BT0JtjtEb7/Qvbu6R9mxcWJkj5CBmLvuKrMEamuY/dFuCOIPzC3jy1/rda7LQfdugQ58Qh5Ji7MyiQkev5C7bEzFsuNCV3fzpwClvHnLj1cO6mtvLpAh6VpriWveTnZNvdk2pN5cNbWvUyDBSkVceyYPWgvLB6q8Ls1lPvvl1e4BZ4IbGAzxWPf80MyW7AwUghYq4EWXCJGmvdL5iMLhffsl9lo4o0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0182.namprd12.prod.outlook.com (10.172.76.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 15:18:13 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2199.021; Thu, 29 Aug
 2019 15:18:13 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH V3] drm: Add LTTPR defines for DP 1.4a
Thread-Topic: [PATCH V3] drm: Add LTTPR defines for DP 1.4a
Thread-Index: AQHVXdokkKgVCkf48k68itapbcTb5acSPjYA
Date: Thu, 29 Aug 2019 15:18:13 +0000
Message-ID: <31113782-7302-2ff4-21ba-7e3c64105b3b@amd.com>
References: <20190828195243.w6mq7gdv22ggums7@outlook.office365.com>
In-Reply-To: <20190828195243.w6mq7gdv22ggums7@outlook.office365.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YT1PR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::47)
 To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c22b70f-d8f2-4f44-2c6e-08d72c941bef
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074)(7193020);
 SRVR:CY4PR1201MB0182; 
x-ms-traffictypediagnostic: CY4PR1201MB0182:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB01823DEB4B0B34132C2DBB728CA20@CY4PR1201MB0182.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(189003)(199004)(478600001)(25786009)(81166006)(476003)(8676002)(110136005)(2201001)(14454004)(66476007)(65806001)(5660300002)(316002)(36756003)(58126008)(66556008)(64756008)(6116002)(71190400001)(71200400001)(3846002)(54906003)(65956001)(31696002)(66446008)(66066001)(66616009)(66946007)(2616005)(102836004)(6506007)(386003)(14444005)(52116002)(305945005)(76176011)(256004)(8936002)(229853002)(2501003)(446003)(486006)(26005)(53936002)(99936001)(6512007)(4326008)(7736002)(6486002)(6436002)(31686004)(53546011)(2906002)(11346002)(99286004)(6246003)(81156014)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0182;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a9LsZpbWixNEQwMU59K0/fbz4OqlUXOdf+ltmD+nhty2MnH3XD75yr3xZ5rijwHYSFQUmwrg+9AcFIqJysqNRATVxfQBZH0nvx3pb078ZFkRiqSlyEAJGqVP8pbz+RGv7/AcddhzZetTOfGpdXFIz3s33aGTShd4YICj8x579THHCFaI4J323zf3VUpc1t92htaMo+sjWSUZ/Nh6LxGD/UOlI9DlO1Ck2rMKTeyIBQ0+wR2f9kkS6T4vVdSErpqMmPy3gQg/5OSzXTuCJIiATh0fzt7aQ7qOcUv7a7hpgMxpIOPzUNqQXNmgND6QEmL/OB1jNJoHykmZ8ZNAn7IZZ/u5FAOFf1TBDAO/9LfkQSoETk+kJJedwBD5aW4ACHWdg/odibm+Flwg9s+NgIQR3OxG+Q+2SKDCsP+oVEMU90A=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c22b70f-d8f2-4f44-2c6e-08d72c941bef
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 15:18:13.3814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CXX2yv5jlDAdhSDgN6Ru8GzDRwgV5TPwpE7UOuaU3hp/gRXfAQCSw25O6Y/X/vi1h2UAUXnn649Fx0KApSp2yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0182
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwGCoUrEa9qRo97So+YkGhwolEqC4E8w/5mq9yMDb9U=;
 b=RjKQK4rKlpbDDkEQ5DbuTvrqd2TXBY09UcRdAahvF4Q0VwIDhksyU4sIFlBoRVPS94XJP9qzAMGfW349hENs0eWcY/HftRhWWNTmDddNOn4H/9pAFGkgekTmSAs9yzljHmiJU9B49x5CXfXfiTziFq6gXEhuIO+6VAHKhUOuF68=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Berthe,
 Abdoulaye" <Abdoulaye.Berthe@amd.com>
Content-Type: multipart/mixed; boundary="===============0678675079=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0678675079==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="A12RtjfXdtjHE8pdHhgp76XeTZvC0ffBd"

--A12RtjfXdtjHE8pdHhgp76XeTZvC0ffBd
Content-Type: multipart/mixed; boundary="Qc4Hj7GMrj4BcB42TciGwvMRhpgVJPR1u";
 protected-headers="v1"
From: Harry Wentland <hwentlan@amd.com>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Berthe, Abdoulaye" <Abdoulaye.Berthe@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <31113782-7302-2ff4-21ba-7e3c64105b3b@amd.com>
Subject: Re: [PATCH V3] drm: Add LTTPR defines for DP 1.4a
References: <20190828195243.w6mq7gdv22ggums7@outlook.office365.com>
In-Reply-To: <20190828195243.w6mq7gdv22ggums7@outlook.office365.com>

--Qc4Hj7GMrj4BcB42TciGwvMRhpgVJPR1u
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2019-08-28 3:52 p.m., Siqueira, Rodrigo wrote:
> DP 1.4a specification defines Link Training Tunable PHY Repeater (LTTPR=
)
> which is required to add support for systems with Thunderbolt or other
> repeater devices.
>=20
> Changes since V2:
> - Drop the kernel-doc comment
> - Reorder LTTPR according to register offset
> Changes since V1:
> - Adjusts registers names to be aligned with spec and the rest of the
>   file
> - Update spec comment from 1.4 to 1.4a
>=20
> Cc: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  include/drm/drm_dp_helper.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 8364502f92cf..67f9121d781d 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -989,6 +989,31 @@
>  #define HDCP_2_2_DP_RXSTATUS_REAUTH_REQ(x)	((x) & BIT(3))
>  #define HDCP_2_2_DP_RXSTATUS_LINK_FAILED(x)	((x) & BIT(4))
> =20
> +/* Link Training (LT)-tunable Physical Repeaters - DP 1.4a */
> +#define DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV 0xf0000
> +#define DP_MAX_LINK_RATE_PHY_REPEATER                       0xf0001
> +#define DP_PHY_REPEATER_CNT                                 0xf0002
> +#define DP_PHY_REPEATER_MODE                                0xf0003
> +#define DP_MAX_LANE_COUNT_PHY_REPEATER                      0xf0004
> +#define DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT               0xf0005
> +#define DP_TRAINING_PATTERN_SET_PHY_REPEATER1               0xf0010
> +#define DP_TRAINING_LANE0_SET_PHY_REPEATER1                 0xf0011
> +#define DP_TRAINING_LANE1_SET_PHY_REPEATER1                 0xf0012
> +#define DP_TRAINING_LANE2_SET_PHY_REPEATER1                 0xf0013
> +#define DP_TRAINING_LANE3_SET_PHY_REPEATER1                 0xf0014
> +#define DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1           0xf0020
> +#define DP_TRANSMITTER_CAPABILITY_PHY_REPEATER1             0xf0021
> +#define DP_LANE0_1_STATUS_PHY_REPEATER1                     0xf0030
> +#define DP_LANE2_3_STATUS_PHY_REPEATER1                     0xf0031
> +#define DP_LANE_ALIGN_STATUS_UPDATED_PHY_REPEATER1          0xf0032
> +#define DP_ADJUST_REQUEST_LANE0_1_PHY_REPEATER1             0xf0033
> +#define DP_ADJUST_REQUEST_LANE2_3_PHY_REPEATER1             0xf0034
> +#define DP_SYMBOL_ERROR_COUNT_LANE0_PHY_REPEATER1           0xf0035
> +#define DP_SYMBOL_ERROR_COUNT_LANE1_PHY_REPEATER1           0xf0037
> +#define DP_SYMBOL_ERROR_COUNT_LANE2_PHY_REPEATER1           0xf0039
> +#define DP_SYMBOL_ERROR_COUNT_LANE3_PHY_REPEATER1           0xf003b
> +#define DP_FEC_STATUS_PHY_REPEATER1                         0xf0290
> +
>  /* DP 1.2 Sideband message defines */
>  /* peer device type - DP 1.2a Table 2-92 */
>  #define DP_PEER_DEVICE_NONE		0x0
>=20


--Qc4Hj7GMrj4BcB42TciGwvMRhpgVJPR1u--

--A12RtjfXdtjHE8pdHhgp76XeTZvC0ffBd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkiEcMSFhcOGNLtE6LVgVyYwUtuMFAl1n7LMACgkQLVgVyYwU
tuPnWwgAiHoXl+2IZquOWeIZZCShLIgq8aL9RUl0VGvHuFsoq9rFkbdPk95f3xmy
fMpfcPj1d+WKGW+LXnZoXuXnUgwv+O0foT008sjilMpPxmmjW7deb4sAaLeQJbiq
EQkXdzhqGKd/l7COlOQwWl7xFsorx9pYZUJqOmNL+n9HqmhmySkFfwrgTamAJEfb
tPA3cJwly02xAuSSPG+5Nja8x8kIsMhEf6j6MvginoOT5RdiwG5pbSwf+oU2HDno
eT0Iqv+WDyy1ZzPHmfeqCcvDm4aV/iqL5/0TPrnEfJa4nL6QQGDiiEVJY3NCNN8E
EWhxYRJHhuewTjsjMA4nEpl9Z//rLg==
=pOTW
-----END PGP SIGNATURE-----

--A12RtjfXdtjHE8pdHhgp76XeTZvC0ffBd--

--===============0678675079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0678675079==--
