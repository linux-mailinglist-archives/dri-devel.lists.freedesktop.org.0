Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640EC190D07
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 13:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB8589D9B;
	Tue, 24 Mar 2020 12:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690075.outbound.protection.outlook.com [40.107.69.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996DE89D9B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 12:05:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLtf3PPJfN5mojNvPA/mAOtqjF3nvDL7nRy7WakfM20XYpRKfTitUZp3xUaBqW/Je5uqBKcRgIPVY9ZKcxPaOA5nkdxvp2kGSsfpJUj2oBylAu7Lqo2aMThqPpX7byQHzG2vd6kxfaNLYONnWFLYOEagTYrT4yGBUZad7NB7OBdfDmHVmS8vtChiMImUBPMdiTUD2Nb78ZKaPxsXMrBdxeaJVVvotA08OfC0s805uJG4iUFVOAe3qF869gT3nhN09i3uMWk9Xa+pIEq6huyHZ8ljPqgn3T3DROPlzS2KbOLexGiZK9nDwyfe0qRKr9kjhFN/LyXDOyYQeQjW0U/lqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwGhOr9pi3UibXoLtZ60wrWyLuCYA2EzUY87Oozi9Kc=;
 b=LV/K+qQOV6Xu6TkyOJYfRbM7pSGxsKVq6RlJFotuoRbGf0YFZyMCylrRXgEMekeoe/KMcjheJMb13CD5ynodg20h2TwiVb4OL+EZ5tzMn3pfEmv2O1FTzsa57Fz9v7KJU3tJ1syNg/JzaMCe1KS9h8RldjFU4erCJpjQPWRFS51MJ7ySqBEwA8ovoZriYnFEMi7AKn4wLJ+RI35jZp29qOoor9oY+PLNrhLQlyOr3uZIRFMnoRYFBjnC+VdFHRfX6WadpxyNG52XlmHi9J1kANfFi019/7zD53S+21AbFwIIf6nxTh0es9P2a7PEKgfPE5+O+lsXNVQ9ERSfLILI/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwGhOr9pi3UibXoLtZ60wrWyLuCYA2EzUY87Oozi9Kc=;
 b=sxE6LuetbYABxBdJJBtZJA/yEQHvFqq4cTRItJewpCDya+0+1EaZ3iYfw9mfrvkA6q5FVXkwf7egU+zkfm5klrlM6XAhUIL2+mdmEaNpwh6RC0GPts/Jqo9Ud3VEBROuwpRBymp9g4HFyil++P8NCNXiVKt0KNiM+AVAakbUPKQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rodrigo.Siqueira@amd.com; 
Received: from MW2PR12MB2524.namprd12.prod.outlook.com (2603:10b6:907:9::27)
 by MW2SPR01MB0009.namprd12.prod.outlook.com (2603:10b6:907:12::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 12:05:29 +0000
Received: from MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::91a7:e6f7:b17a:bfa5]) by MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::91a7:e6f7:b17a:bfa5%6]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 12:05:29 +0000
Date: Tue, 24 Mar 2020 08:05:24 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH] drm/vkms: enable cursor by default
Message-ID: <20200324120524.qz2lxzmialjdp3mj@outlook.office365.com>
References: <20200321203740.pg3r7f4vybruowox@smtp.gmail.com>
In-Reply-To: <20200321203740.pg3r7f4vybruowox@smtp.gmail.com>
X-ClientProxiedBy: BN6PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:404:10a::20) To MW2PR12MB2524.namprd12.prod.outlook.com
 (2603:10b6:907:9::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56a0:11a1::4) by
 BN6PR13CA0010.namprd13.prod.outlook.com (2603:10b6:404:10a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.12 via Frontend
 Transport; Tue, 24 Mar 2020 12:05:28 +0000
X-Originating-IP: [2607:fea8:56a0:11a1::4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5515d38e-cc3e-4f6b-c9b1-08d7cfeba532
X-MS-TrafficTypeDiagnostic: MW2SPR01MB0009:
X-Microsoft-Antispam-PRVS: <MW2SPR01MB0009A1CD77E2A27D792B34A998F10@MW2SPR01MB0009.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(6916009)(6666004)(81156014)(186003)(8936002)(54906003)(16526019)(8676002)(81166006)(7696005)(52116002)(21480400003)(55016002)(5660300002)(86362001)(966005)(66946007)(4326008)(66476007)(1076003)(66556008)(478600001)(2906002)(316002)(44144004)(9686003)(6506007)(2700100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2SPR01MB0009;
 H:MW2PR12MB2524.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ITo4/38GlHrSa5P4qFXo/vIju4vchFIztqcnyDt1kOpCcNbRcqPQ0X7T8NmN0W25uvbfmuUQJW3Th/VYfivtG9SWMqHLLys1CKzZflPfaRtaT2D++iLrkpHRgdwZD7QYflDPBRd9G5ztYR91JyCbeqZ1gjPCdOelMsZhzgdLw7AAfe5Z5DBdu2BwEpBQEJV3yW47jOZZWdtZwMrjB6JW5aE0qlvV6111JLGt/iZNUX3CDZ0zi9mS6p8xV+0nP/IjUz9zt6hm7RVeYFawQ6gt1fSYN6V3JuViTfMCoRvEulNIUBrb6PsW2xVh59acS5vaLQ1Ab02f83EIlrqooi+1fUXk5aohfZk2a/yUicwiDI5MuOkYOF8QV5pqwuhX6QmyTKDwi5iSAKFICcqlmwW4oQlPsYXgi4E4xWJoRv5zgd21Q0BPGM5zYWKTd/dYJ33E2eoLS6Gs/xry3mDJUklizsbKGPCnKpsZc34MnTtpMjU3O9IEAgVCsYXIMdj01HYSaXoFneCVzb9EedkOirw+1l5CbG+/s1puH/RPId3TOSwCDEtbpZYWXEJnf2zvnJLK
X-MS-Exchange-AntiSpam-MessageData: Ww9xLI5pgfPNrRYGXZXkmFXb+2MAndH1YIm/d/35RQPh5GRUl9A0tL2J2v+idI1pyLcHbomB5MVB3ggYA7lJKLq6OIGRdMhWSOMrk4Simwp9mj77O5LXKcW5kCAR6q8IF/iughvspc0H8UyvIzbfQmzqfc7/vw6+FaQxnFGyRIc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5515d38e-cc3e-4f6b-c9b1-08d7cfeba532
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 12:05:29.3926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhkJ+lUrQmrLWcW4ihK18wtjnP4zEMk+MksH5HksbO1z2SA7qTrSyPgzl3xZ4YvpuyiU2FLKEnVN5lm9fMQXvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2SPR01MB0009
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
Content-Type: multipart/mixed; boundary="===============0626320070=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0626320070==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4cgyuppobto6qlaa"
Content-Disposition: inline

--4cgyuppobto6qlaa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Melissa,

First of all, thanks for your patch.

I agree with you, it makes more sense to me if we enable cursors by
default. I don't remember why we decided to add it as a disabled by
default.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

On 03/21, Melissa Wen wrote:
> This patch proposes a change in the behavior of the cursor to enable it as
> soon as the vkms module is added. Enabling the cursor by default appears
> to be an expected and more friendly behavior, especially when running IGT
> tests.
>=20
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 860de052e820..6e6feecf7f20 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -34,7 +34,7 @@
> =20
>  static struct vkms_device *vkms_device;
> =20
> -bool enable_cursor;
> +bool enable_cursor =3D true;
>  module_param_named(enable_cursor, enable_cursor, bool, 0444);
>  MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
> =20
> --=20
> 2.25.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--4cgyuppobto6qlaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl5594MACgkQWJzP/com
vP8hxQ//WMowNTZ9DJBooTOvzybtvAaIsxHOugW6uIFjLKQRCcyVh5CHAoNw3g58
DJJ4sPrWwq2roHE9kn4BhEW4ZOWIgp0ACrNdr+HeeSYNWlqSdMtZudVF7P6S1V+p
GM7Ru8BhFrFZAiN7HL74ocII5DYcmYrj9Q+1Ftc56epXUB49wxFAnMr9eyPOj4HZ
HGe38b2Pba74LMrZI8pT9q+COWSrTE+Kvrh9tcoYcw4XL9G7Ed63q2kuZGxjBDM2
bvFqHxomxdLx7vwitz97iDYh1sxxclVIGaZcRlyss8HjEiq70COCgk8FDhOcsivA
LvouP7n3yZ5/dGgk/ExxaagQwqpS9yPr8dD726YaryaYTmHg10Lm5VhB/p7LaQBo
FYCU2lt0/63ktC0oBK6mVn4MBFi+9eGkOI55jZ4angzpjXT8OboE2SEmjJxj2wnN
C9rXLjsHPv6CcVnikfQCqtPwcE8o2zMqTQTy8PsxRHEz6bNfFE1cEmp2rJcgCquq
paW9AK40RvgE5RrByW54PMn/eu+yEWlc7YXal7+VHOgDOsEs75IKUa4ybUREfGY/
2QI8PZ2E6xi7sH30yPKfXSwZpgKs1cPr1aJyRZmp36cdwNLLr2QVES1DCLuEUo+9
wUvKCy11zj/NC/lAWOdCk+gCX0sP01n/BMaELw84L7giZP01ZwA=
=VMRW
-----END PGP SIGNATURE-----

--4cgyuppobto6qlaa--

--===============0626320070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0626320070==--
