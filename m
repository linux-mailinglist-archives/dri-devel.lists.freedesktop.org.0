Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8941C7FE2
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 03:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95446E901;
	Thu,  7 May 2020 01:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986626E901
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 01:56:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APnOU7BdBCl+KVb1rs4wUvN3htGT9B7+J3zN0R7WcrfcyS0Q1vZufPa7MNEhcCrrEHC8iPISx+40cpDE30MRAty6QcYPTUu0ViyLVzEL2PYKeyKqjAB4VFKGEqB/iBR/qLmaWIWpswzDvbZ15q3VEWt7yBq345AzMA7GE8iMGPYxfUgh4oDMDJae9QBtwY/cqKxU0B2C1mg4V1XmaOZmC8vzBU5SJacICG+C8fO1K4WXTf0y8KlUbjPim3Ce5H4oVY52ufgYB+rcVSglrfmzvIXBf+etEp3zA+oD4dxI0/Ayd/+lHllWekwqeP0GWJ+UbcaNbifG9cp0hWwfeWtwoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzwAgZXcs21w50xRn4XpDHvc31EBA+SFrA1pe/o7ogQ=;
 b=eN67jVznF8U1KebcBIRdGtiXosiLgdYO3PQGNZfSQCPFD4UkI4E+zX8IYmEMmnNe83oTVrUN9cowLXuDtSwbc1NRRbuuWokvkNiaFZoaijFwR9scnD9ul1pmmKHm5w4mvVrIvo2A2dHp5jaTIqZJhn+f7Bg9P97VRUXYQsD/LEQkid3ktFNLRBCF4U8y3AtK+0V5kvxeGGv42y/bRaaRoJiew0f0kTF6zDe0D6TwRv0ItEKEDmDOhcRJV5UjlzTXo+GZoXEdrnC/Nudgt+kk30SJJ0hJLEkRSC53sQVqG8XsyNa7xHJlPfT4vKf1UZkW3z9rLE7pL+MCcGPooUVUkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzwAgZXcs21w50xRn4XpDHvc31EBA+SFrA1pe/o7ogQ=;
 b=t2/2L6p/LDwyRDCkeknyoxuxLeqN0ih1NWCJOvbjawKJYokSy+9btAvuc7boHcy1MwJUXCsa4kvRNaVqjzozVaNgvYrfXgew/iQOzPBFLowC9vq76Zh++JOcM75j/TqGzqVH/UMKXUm3Tt38q/e00iwBLsv8hzcvqGlK14gVmMs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1159.namprd12.prod.outlook.com (2603:10b6:903:36::17)
 by CY4PR12MB1525.namprd12.prod.outlook.com (2603:10b6:910:11::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Thu, 7 May
 2020 01:56:03 +0000
Received: from CY4PR12MB1159.namprd12.prod.outlook.com
 ([fe80::e9c0:2506:396c:70b7]) by CY4PR12MB1159.namprd12.prod.outlook.com
 ([fe80::e9c0:2506:396c:70b7%10]) with mapi id 15.20.2979.028; Thu, 7 May 2020
 01:56:03 +0000
Date: Wed, 6 May 2020 21:55:58 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH] drm/vkms: enable cursor by default
Message-ID: <20200507015558.szxxcixhz7gnn3r2@outlook.office365.com>
References: <20200321203740.pg3r7f4vybruowox@smtp.gmail.com>
 <20200324120524.qz2lxzmialjdp3mj@outlook.office365.com>
In-Reply-To: <20200324120524.qz2lxzmialjdp3mj@outlook.office365.com>
X-ClientProxiedBy: YT1PR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::20)
 To CY4PR12MB1159.namprd12.prod.outlook.com
 (2603:10b6:903:36::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56a0:11a1::4) by
 YT1PR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 01:56:03 +0000
X-Originating-IP: [2607:fea8:56a0:11a1::4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3187f864-7288-4870-67e2-08d7f229cc7f
X-MS-TrafficTypeDiagnostic: CY4PR12MB1525:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1525A48C2DDD6876C05F5E6698A50@CY4PR12MB1525.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LXKexfTQ7HzKgyjRawSyfK1zEfApfxl5fohkcDRqjfpmMYYmu9XRvabdRH9d/Hjc/K1BNMmpMV6mCKGiEeFfdMLwtXuuUZ7SP4EqcFn/fSZ0KfNJzx1qHVshYNC0vZadhe1AG2ZVPiNaNwr5ZDI5W7ngObYTaNJ6EvQrUjLnuOtjRnBzgVd3Ja/pMloAft90n8mnb3gmtxrHXSkCdHeJMSOhFWaw3frl7P4/LLemmI7cU6jozSS6XYxtbXnoC/OL8k5+TNYvq/DHqQ2yM24A6dxapCp55ov5sjonXoZJS7cfudPIJPXgJe+Cec8lTlXQ6C5Ylko1WlDLj9iNVql+S/cNBMJ7vw5a2N0tU+lF0gMdUl5VAk8t808TATM28BD7bvroOs6XY7udZqwF0sa6aUAkVxzQOI/SFY/8meFz6YK6hVE8gNV9x/u0PtNp5fXlfWbjMcqlVU2yCDu8CqfidNZhmCssoID5tIUOKfkRdnVJ06XRJ+lgEco0m8knlc8JHam0poHkdeCd94vKGt82YT19GC5+Un5jUI/iT2zgFb7GE4FhQlFXMBuQrPEaaiq1VgALxkup0KlxF9GBpvNF5TrWwH1reHQDrLMjHP68RAgOOoDE6YtQGnNHK0aizhG7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1159.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(33430700001)(8676002)(52116002)(478600001)(6506007)(7696005)(1076003)(44144004)(54906003)(6916009)(6666004)(316002)(5660300002)(966005)(66476007)(9686003)(21480400003)(8936002)(55016002)(2906002)(66556008)(86362001)(4326008)(186003)(33440700001)(16526019)(66946007)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 581rsbc+Ou+d2nBuXyCOBN7vsOoU77v/yBq129RnfPrHVyil1XYZF6CpR9P6niUQximNq002Kv2D0yihRTzycHF/1ByNPcgLmmu5rrMvINw2NC/SJEYNW+uK1eNutgeyaMp+96YAHqAvfIqH/MFOrJqhGHKa6sUS2DuxtO+N2XJJh8dxvJT91ymD8EGXMkvXaWJbeRECWGlQGLrrLlEI35g0iUw6sm1cstBkyZD4IP+13r/EN78rWboLK+v6tyzNgspopJuUuhKCDUSejl0gIu47dU/8JmmYawdbGH2rf3Ol2OkXw/RBNZ/xp97GB60Ih6McoF1r4wxu5EuT44M/TyD5mmsYExffRIWTSBiAU8E+9xegircCUkzJSs3zt54foZJfzRcPOt0D+y16gPf5EhZPuM3kMNbLBn29IslR/hYPHgJHK8RS9VKK8DvhHuYF0IMV1NRPMUdJFdWCVFpf3mp4TTm4gmNq+L5bGkDwvNIZzWGg7rDfyvSVYCTu9fOfn9WeIFtmDahQEQ15FEP/XzcI6+6fPKGh5bl4vtq/gZve4bPcNAUb9nl116502odKaNIxU8uA5bsdZ6BeM1K7ldETmrsRXrWHTS32CMHr52qsPr4eQN7l5JTLJV22OwNJWeq51smSm993H64BnpFdeY1MQRfQcag9iwzpTYKEheSeoso17Vu6MmKtNE7t/1V51yrhTsOskb0HMKqRQTDM7s5WIRHXEJdaJqf7pAem0aqxwPZsKYOSurBKhKhNCMMD1WQvE303suOHFzZPqHfACZPLlGUJpuUPFBNsPEaEB09OSRn+4EHqdQ2QORkZa1bt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3187f864-7288-4870-67e2-08d7f229cc7f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 01:56:03.6706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUQvtCRkcaDT7dsPyVW6mZluwHHB1Ks9Z8fCqxegg/TFOXAjwKAoypyg7l2ep7hHM+DwBknKnMzFz/qcMXNEwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1525
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1808875822=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1808875822==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cribvfniaehgra7r"
Content-Disposition: inline

--cribvfniaehgra7r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Applied to drm-misc-next.

On 03/24, Rodrigo Siqueira wrote:
> Hi Melissa,
>=20
> First of all, thanks for your patch.
>=20
> I agree with you, it makes more sense to me if we enable cursors by
> default. I don't remember why we decided to add it as a disabled by
> default.
>=20
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>=20
> On 03/21, Melissa Wen wrote:
> > This patch proposes a change in the behavior of the cursor to enable it=
 as
> > soon as the vkms module is added. Enabling the cursor by default appears
> > to be an expected and more friendly behavior, especially when running I=
GT
> > tests.
> >=20
> > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkm=
s_drv.c
> > index 860de052e820..6e6feecf7f20 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -34,7 +34,7 @@
> > =20
> >  static struct vkms_device *vkms_device;
> > =20
> > -bool enable_cursor;
> > +bool enable_cursor =3D true;
> >  module_param_named(enable_cursor, enable_cursor, bool, 0444);
> >  MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
> > =20
> > --=20
> > 2.25.1
> >=20
>=20
> --=20
> Rodrigo Siqueira
> https://siqueira.tech



--=20
Rodrigo Siqueira
https://siqueira.tech

--cribvfniaehgra7r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl6zaq4ACgkQWJzP/com
vP+SXQ/9Fe8xOflNY8NrRtq5vyPQ7YcaP5H2ZokGvW5MuS1qIsKOeUDXlNkWkw85
WyAE5RMtvgVHXv/WjBxn0SDYhpD3TCVltQcK1tnbB9VeyXImShUrMbGvX0MdmlwY
ZO2dYcpGtzu1qJT3Uw/eGbgokuX0hDxSun0CrXwyxVkpp50M7es/RvO9lej9MH7i
ws+SxGnSyowLTuOMYGxtobo0zxiyyB6przVvPHC1XPvQkX/tXXc0xPeclTaEaMKA
fzVDk/vrDJAF2WsPCDgC6AWtNafqoWQKmBLQ2yYjexgn3EezVmUhNeBgS/lbE844
/8YYOpraNJXqaUtCUcFngAO5voiFxw9efXw4PIJal1zYEORXFMjS4iwFWdzTsYA2
l15nPVK47CQ5CfDaG/h4yMpoIYd8x0p4FEaFYflA8+xIcBMjDndpFvghoX6e6feq
vxjJfQQViBWhghs2ZGv9Gg6Ut0wLzX99cQnQq+ITjGXPWAzJf7VBA6H5s4svwxXu
ZsIO8VsywylL5LiO3D91YeEJv+bpgWvVJwdeFnk7VfhoyBbPJXz8OnlgrE6CEMcN
InvlzsvSPyqmkqxf61esZby0pd70x3pTd/TNwj3usfmTlRwEn2+Tv9Fq86L2SrDm
iCGnoY9PjvpNIAukU1kNRbQAoNi527bZ6yrl18res8X4lm8iSzI=
=TbhH
-----END PGP SIGNATURE-----

--cribvfniaehgra7r--

--===============1808875822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1808875822==--
