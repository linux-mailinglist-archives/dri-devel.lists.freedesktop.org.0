Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E47A9B416
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 17:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1946ECD9;
	Fri, 23 Aug 2019 15:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680067.outbound.protection.outlook.com [40.107.68.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81306ECD8;
 Fri, 23 Aug 2019 15:58:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJfrl/ZgtkCtjwLpv1SY9nypydA7cdOJH8WMDYPoRrX7nnHqUCmGOetnynfMkKM/IpIoCuSfcVGjWKGSU1wMp5DMi1X3JfO1HjC716SInn8jesu8sGAn8uFZm6Wnest74hy37zDJ6pdfD0jZ97ZAVTQuPYJ9q1p5sdsn9prGb8bSoE/Gmhy8AiQ0NWFKNGUhbOf6vWb2P0ihWWAage3DkrjJ2DnMM74b3CURNPbF6S8c3GhS1SSA/kqyaqZTrEfQIlzvug0mcqQvk9OvMzwHWUeTPpAYYwnn1uFcBVEc16BSIhZPc8qoi0jM0y/ntknQmQCYLWGKG3l3mbLaNIzBlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gn/oEy3kQN6ER8FB3K7Z/9vW8q61dD3/WHa+GWVIPGs=;
 b=EgAcULlVaWZXOzBoblgawgwdiOlkNfo/Sc9v0erzXVoU4gmMYBBMJQy23L+mYkmV9JwKV1f23T0ZdgSMNQbRSPS6vdHVmb3oub8HprKDbFgMPkpC8lCl7mjiU+O0yc58T0XfetgTIWy3ohNF8xx+pvtQ6cpow8/pQLHTYts0zkxS+2K8r8u/RWG0mS3X+UOPFZNHwCXJk0uibOGwxFlI79trcYVGE1U43yedjpNBay8vK9+hm8hoaYcS9BkWtSyxaqOVatbDTgdTS0MPOjBzjYaAYPonPenoImz9mSFNlO0wkgkt4IayijLuH15j4AQW/XpIG9DTJ4JRgCfn3nFoXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0165.namprd12.prod.outlook.com (10.172.78.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 15:58:00 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2%5]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 15:58:00 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm: Add LTTPR defines for DP 1.4
Thread-Topic: [PATCH] drm: Add LTTPR defines for DP 1.4
Thread-Index: AQHVWTtlZ/MqugNHyEyjQDzi8fC43acI5JUA
Date: Fri, 23 Aug 2019 15:57:59 +0000
Message-ID: <8105f436-91af-3c63-7ada-a5800df43a52@amd.com>
References: <20190822224607.m73g3a2a23zww644@outlook.office365.com>
In-Reply-To: <20190822224607.m73g3a2a23zww644@outlook.office365.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTBPR01CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::30) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70dc61ca-5bdd-481e-f404-08d727e2abbe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074)(7193020);
 SRVR:CY4PR1201MB0165; 
x-ms-traffictypediagnostic: CY4PR1201MB0165:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB016577BF9A626E8F91F1C4E58CA40@CY4PR1201MB0165.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(189003)(199004)(5660300002)(58126008)(110136005)(54906003)(186003)(26005)(446003)(66616009)(4326008)(66476007)(64756008)(66556008)(66946007)(66446008)(229853002)(476003)(2616005)(11346002)(76176011)(99286004)(386003)(6506007)(53546011)(52116002)(99936001)(2501003)(31686004)(316002)(65806001)(65956001)(66066001)(478600001)(81156014)(81166006)(7736002)(25786009)(53936002)(8936002)(6246003)(2201001)(102836004)(305945005)(8676002)(3846002)(71190400001)(71200400001)(6436002)(450100002)(6486002)(2906002)(36756003)(31696002)(14444005)(6116002)(6512007)(486006)(256004)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0165;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S/J43Ia9dtnzc5pElARGyIGrJcUooccLB0d8ohisJ/1FZ1nLRaGSsL97b1Nk80bubTlk9fAQSBaQy3VxFmTa+Ey8JZQSs7tsStCvEOtY/JhFe9+Rorjjplm8L8sVka3AOVsC9cmUUSfnSSKaGZoVYa+uZ4d3lBBnq1GCqbiH8/eoP3PJnJRUkogcIM3hH0DcZPP4cpFzn3e4CHNcK+x/TFtvQzalRBW+ebV14HeCT8fWMIGAbycPth18FZ/YSiq1ymBqiP8TSJVqFgCpSfWzuexLl9IqQ/ZB46GQlSkSowo7uFyFpWXq45llJpZkGM21T3JoCoR9Hw+l3TLn2TR3i/5Rhhh9mygW4tScH5QQg2geUfhVJa1WMeR3KNc/Kfi/7yIfktL04QcmHdi59pslGicxsXsMfl0+QKhtp5ngh78=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70dc61ca-5bdd-481e-f404-08d727e2abbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 15:57:59.6953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /0DD03nnZfR9Bb2In/QnS1utBP04q4oC/zQPUM63qkLWFWsd3IDGf76VrBWVhiQnlDwITZD38XibZ6WNvNs5rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0165
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gn/oEy3kQN6ER8FB3K7Z/9vW8q61dD3/WHa+GWVIPGs=;
 b=UCZ25+qmTCTH+dTbpMCvNVxaQJOBgjQTsnJLZs495Fu6W19p5UR/WQUux+zriKbllEQRAi7D8G868x07dPVXHLB6vFF8XIr9gMuqBxYL4uTORTDmp3BbuVXgjnfbWmxjAdTezUr1lLBJzyHATqARqKRNCytOZnbC3XN94wIWHks=
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
Content-Type: multipart/mixed; boundary="===============1158834263=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1158834263==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yhEycHOY5GvvroNbpg8nf0NFlrv4yNEqK"

--yhEycHOY5GvvroNbpg8nf0NFlrv4yNEqK
Content-Type: multipart/mixed; boundary="X0vQyaYXkRLW2m8P3gBnXegyFSiafsUNP";
 protected-headers="v1"
From: Harry Wentland <hwentlan@amd.com>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Berthe, Abdoulaye" <Abdoulaye.Berthe@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
Message-ID: <8105f436-91af-3c63-7ada-a5800df43a52@amd.com>
Subject: Re: [PATCH] drm: Add LTTPR defines for DP 1.4
References: <20190822224607.m73g3a2a23zww644@outlook.office365.com>
In-Reply-To: <20190822224607.m73g3a2a23zww644@outlook.office365.com>

--X0vQyaYXkRLW2m8P3gBnXegyFSiafsUNP
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2019-08-22 6:46 p.m., Siqueira, Rodrigo wrote:
> DP 1.4 specification defines Link Training Tunable PHY Repeater (LTTPR)=

> which is required to add support for systems with Thunderbolt or other
> repeater devices.
>=20
> Cc: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>
> ---
>  include/drm/drm_dp_helper.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 8364502f92cf..8336d960da7f 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -134,6 +134,32 @@
>  #define DP_SUPPORTED_LINK_RATES		    0x010 /* eDP 1.4 */
>  # define DP_MAX_SUPPORTED_RATES		     8	    /* 16-bit little-endian */=

> =20
> +/** Link Training (LT)-tunable Physical Repeaters - DP 1.4 **/
> +#define DP_LTTPR_REV                                  0xf0000
> +#define DP_LTTPR_MAX_LINK_RATE                        0xf0001
> +#define DP_LTTPR_REPEATER_CNT                         0xf0002
> +#define DP_LTTPR_REPEATER_MODE                        0xf0003
> +#define DP_LTTPR_MAX_LANE_CNT                         0xf0004
> +#define DP_LTTPR_EXTENDED_WAIT_TIMEOUT                0xf0005
> +#define DP_LTTPR_TRAINING_PATTERN_SET_REPEATER1       0xf0010
> +#define DP_LTTPR_TRAINING_LANE0_SET_REPEATER1         0xf0011
> +#define DP_LTTPR_TRAINING_LANE1_SET_REPEATER1         0xf0012
> +#define DP_LTTPR_TRAINING_LANE2_SET_REPEATER1         0xf0013
> +#define DP_LTTPR_TRAINING_LANE3_SET_REPEATER1         0xf0014

Can we align the register naming with the spec and to align with the
rest of this file?

The seem to take the form of DP_<name-from-spec>

E.g. call this one DP_TRAINING_LANE3_SET_PHY_REPEATER1

Same for all other registers.

Keeping the naming consistent makes it easier to search.

> +#define DP_LTTPR_TRAINING_AUX_RD_INTERVAL_REPEATER1   0xf0020
> +#define DP_LTTPR_TRANSMITTER_CAPABILITY_REPEATER1     0xf0021
> +#define DP_LTTPR_LANE0_1_STATUS_REPEATER1             0xf0030
> +#define DP_LTTPR_LANE2_3_STATUS_REPEATER1             0xf0031
> +#define DP_LTTPR_LANE_ALIGN_STATUS_UPDATED_REPEATER1  0xf0032
> +#define DP_LTTPR_ADJUST_REQUEST_LANE0_1_REPEATER1     0xf0033
> +#define DP_LTTPR_ADJUST_REQUEST_LANE2_3_REPEATER1     0xf0034
> +#define DP_LTTPR_SYMBOL_ERROR_COUNT_LANE0_REPEATER1   0xf0035
> +#define DP_LTTPR_SYMBOL_ERROR_COUNT_LANE1_REPEATER1   0xf0037
> +#define DP_LTTPR_SYMBOL_ERROR_COUNT_LANE2_REPEATER1   0xf0039
> +#define DP_LTTPR_SYMBOL_ERROR_COUNT_LANE3_REPEATER1   0xf003b
> +#define DP_REPEATER_CONFIGURATION_AND_STATUS_OFFSET   0x50

With a cursory search I can't seem to find this in the spec. Where is
this coming from?

Harry

> +#define DP_LTTPR_FEC_STATUS_REPEATER1                 0xf0290> +
>  /* Multiple stream transport */
>  #define DP_FAUX_CAP			    0x020   /* 1.2 */
>  # define DP_FAUX_CAP_1			    (1 << 0)
>=20


--X0vQyaYXkRLW2m8P3gBnXegyFSiafsUNP--

--yhEycHOY5GvvroNbpg8nf0NFlrv4yNEqK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkiEcMSFhcOGNLtE6LVgVyYwUtuMFAl1gDQUACgkQLVgVyYwU
tuOqCQgAxuWo0QQCxMTKj0TSQagvX9ulxdI4GmKWgTGntzj0Ng1NvYlxzudOWrZH
Am47T4DTDLc7Miv5ZmMNUglzrwSfSm+8Hbx6koqlSnpqwgNiikLE7pexl7XwPQvx
tlc+3K2ftK789eSoBdfOBaTAgdQ3i4ZVCn9bRauxoY9fhFPvdApFYsvDo5Y6hXGC
HQXxgRg/Qcs4dwh+PO1sWqXiVuZEF5xHdLOFK+2Es/adMz/sM/SL4B+34BVPipuk
N48TheM7dPLiy/YxrU1WRt3PXnNYbx032bPL6wmflTlhhRLSvpdRZAGxr9pwGOFY
2vNQDt0ldC9fuksLCCJ4Li95w5RYWA==
=PVXp
-----END PGP SIGNATURE-----

--yhEycHOY5GvvroNbpg8nf0NFlrv4yNEqK--

--===============1158834263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1158834263==--
