Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6F19D34A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 17:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4945C6E261;
	Mon, 26 Aug 2019 15:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690065.outbound.protection.outlook.com [40.107.69.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0946E25D;
 Mon, 26 Aug 2019 15:44:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZd7z5ePzfZbvWlgZ67T0yMWF5A0O+vGZJ5bkgz4ZJ4iV4Y09nAirC1vmd8T5ES3BlVUzgxYJkdVJBcMyQbvOC4GDu88JYw/MU7MBzBj8p9LMaBwRLrZLQ8ySk8cfu956t17aARayT94JNVxvUN62YUgWt6rpTIbLTUzs2NdjE6NagAu/r9t3PsYWnQo0/iRzLZ9C19fFeUCuN8pMxpQPqcW/ThnbYJfzIz3tlt09zabDzIUEMvyF9km20VASMQGhYeXd62Z+2bD41Q3J9xrtVILmQlH55HoTavRrguRoe/CEox2msTnkK+VCPlwvp+7MrLaJ11U2qYHI8/AhdPZMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUMRuoVQ6q6lFKjeU24hCikGjFhs03ECj85/sIbvsGE=;
 b=oEex/pgYt+vexqLjAuegNPQ+rL/bvPqtQ+bAY2wD1gdyxeL4Q2XL65HetOoMQ3UiVXH9Ek/YD9d8MJLmU99lH/QSLm/e9gUNezLrsDMYX8eGohZooar5HPFBhSQQoG1sG7dHlUqRk5itvRDnkBAn7yYejFFzokcRZuWYgLsPChFYU1WbtLnRCSJUWL67/PvbCJMRdSb7WSUA9eYOWRav0HuFKo0glX6Fd+CjRxWreHANRtKjSw5OaGdwkb9BA+oIyjcEH4jYc3uXbHJqFZYak7qonVMkX7K1LXPuLG6anpgGuUdR7KHirmuDJAM6o9sOcrSD1SbzjhVWmJO07B3ikA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2484.namprd12.prod.outlook.com (10.172.119.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 15:44:21 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2%5]) with mapi id 15.20.2178.023; Mon, 26 Aug 2019
 15:44:21 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH V2] drm: Add LTTPR defines for DP 1.4a
Thread-Topic: [PATCH V2] drm: Add LTTPR defines for DP 1.4a
Thread-Index: AQHVXCMIs0HPddxKiUWpD8Y2be0PaqcNkfAA
Date: Mon, 26 Aug 2019 15:44:21 +0000
Message-ID: <d6ff9470-baea-b235-c8d0-9e1d9462e64e@amd.com>
References: <20190826152925.4x7mwhzxit353yww@outlook.office365.com>
In-Reply-To: <20190826152925.4x7mwhzxit353yww@outlook.office365.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTBPR01CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::45) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d559fe04-a53b-4f5c-a96c-08d72a3c434a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074)(7193020);
 SRVR:CY4PR1201MB2484; 
x-ms-traffictypediagnostic: CY4PR1201MB2484:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB2484E907FE2547FF1B4808358CA10@CY4PR1201MB2484.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(189003)(199004)(14454004)(6486002)(6436002)(26005)(99936001)(478600001)(256004)(14444005)(5660300002)(71200400001)(71190400001)(476003)(2616005)(11346002)(446003)(486006)(31686004)(186003)(65956001)(2906002)(66946007)(66616009)(66476007)(66556008)(64756008)(66446008)(66066001)(65806001)(2201001)(53546011)(6506007)(386003)(36756003)(102836004)(6116002)(52116002)(76176011)(3846002)(54906003)(81156014)(4326008)(229853002)(25786009)(6246003)(8676002)(99286004)(81166006)(31696002)(6512007)(7736002)(58126008)(8936002)(305945005)(53936002)(2501003)(110136005)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2484;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1ZlYeJNQu6hq0LrB0qG3Yllw/UAXVXHgR815IOFboOfhnbyabgeBDwKuP8YiS6eDwVDz7sTIVx8CoMVhSuy7Ifg08FI1Q/6NhtFicKMTG/np8bs64v5KVkgA9t+GjNyoIJkvDcsmmBRCHAYNqsx4TbUIW4lvAv6o20/KQZ4jJK+KjhdMoUdsGBy6wTsSqmX5D+pWvPtxnABzGKxGgqlp9yKve7Wk21mXPKBF7CLipK1h2nCtiqi3oUdW6SQoy7DyHHftHbNZj8L8zBw+42pf2mu+BN0EIag8kjGs4WKZt0LCigniP53phaqT3Kp0rciSZQxdSkDfROvuz4mBlJB/Gm36l+vfQio/wKjOVD0EntHtZ/duO0xRWxpiDRE3/Hr8GSFH+y9l2G/P+hT0L6kZHJzdzW9udaVkGOb3Vp1Y0t0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d559fe04-a53b-4f5c-a96c-08d72a3c434a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 15:44:21.4943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VSy5NwSSQ9TJ0UXkFTprrcpLdYUpTdekmZ3f90zk68qfSTtITKtJ4sW4eWWnB3jRzqZ2viwgrFB/FGeKDV1Ygg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2484
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUMRuoVQ6q6lFKjeU24hCikGjFhs03ECj85/sIbvsGE=;
 b=M0AzTUNhLclj2JC2cbC7xBwI7FsYJ60wave0Qv4SgxaRsLxU/k07pECPxpoKM8Gea9on3rY/hi+U8+UVi7CEjQ9snqkPo6D+G84EXwttwDUNnuuezWaOoT35JQrPX+PPpZDwv9e+/9TCFCQnNAvBjC+djXlpa2ihBFzG8F20eC4=
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
 Abdoulaye" <Abdoulaye.Berthe@amd.com>, "Navare, 
 Manasi D" <manasi.d.navare@intel.com>
Content-Type: multipart/mixed; boundary="===============0626752910=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0626752910==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Y6T2VYDe1Zxm2yfBEqBO97zyr8MvyhOmR"

--Y6T2VYDe1Zxm2yfBEqBO97zyr8MvyhOmR
Content-Type: multipart/mixed; boundary="GPAOQqXlrNXVmhE8tP5byj9m3sUwc5SVz";
 protected-headers="v1"
From: Harry Wentland <hwentlan@amd.com>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Berthe, Abdoulaye" <Abdoulaye.Berthe@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Navare, Manasi D" <manasi.d.navare@intel.com>
Message-ID: <d6ff9470-baea-b235-c8d0-9e1d9462e64e@amd.com>
Subject: Re: [PATCH V2] drm: Add LTTPR defines for DP 1.4a
References: <20190826152925.4x7mwhzxit353yww@outlook.office365.com>
In-Reply-To: <20190826152925.4x7mwhzxit353yww@outlook.office365.com>

--GPAOQqXlrNXVmhE8tP5byj9m3sUwc5SVz
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

+Cc Manasi, FYI

On 2019-08-26 11:29 a.m., Siqueira, Rodrigo wrote:
> DP 1.4a specification defines Link Training Tunable PHY Repeater (LTTPR=
)
> which is required to add support for systems with Thunderbolt or other
> repeater devices.
>=20
> Changes since V1:
> - Adjusts registers names to be aligned with spec and the rest of the
>   file
> - Update spec comment from 1.4 to 1.4a
>=20
> Cc: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  include/drm/drm_dp_helper.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 8364502f92cf..e8beb4e7e5da 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -134,6 +134,31 @@
>  #define DP_SUPPORTED_LINK_RATES		    0x010 /* eDP 1.4 */
>  # define DP_MAX_SUPPORTED_RATES		     8	    /* 16-bit little-endian */=

> =20
> +/** Link Training (LT)-tunable Physical Repeaters - DP 1.4a **/
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
>  /* Multiple stream transport */
>  #define DP_FAUX_CAP			    0x020   /* 1.2 */
>  # define DP_FAUX_CAP_1			    (1 << 0)
>=20


--GPAOQqXlrNXVmhE8tP5byj9m3sUwc5SVz--

--Y6T2VYDe1Zxm2yfBEqBO97zyr8MvyhOmR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkiEcMSFhcOGNLtE6LVgVyYwUtuMFAl1j/lMACgkQLVgVyYwU
tuObcQgAqaPd92wRVMd0cJUDGdqrSb4DLrQHnhHQbtfWgbwIl96eFqCcAxCK/DsA
w2n2ddQR3ZcmbOFzle6cGA5erySwjqUr55ouzwP6pjzQ2B6TdewFbuq/5q3maqj0
qZx92ytUjXv1wto5+AF7uO0G2nSyymkU5m8KgCdttEgbbVTOaGpBv0f4mkiL5TBB
jlKBz/VX1eFBD1m5BFTn105rEy3ErBQnDgo+gUzV05VRlvMqAr2rm9nFiqxEXiAi
zzh+u1fePGPx0AUqMsZ4mjuLce8K0u423HO5ffx5zfXX6YnNR1FSNm4fHQtgUwOl
wxC9qMLiKsddve/lfoa0vif+3aePtQ==
=5kj2
-----END PGP SIGNATURE-----

--Y6T2VYDe1Zxm2yfBEqBO97zyr8MvyhOmR--

--===============0626752910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0626752910==--
