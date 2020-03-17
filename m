Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D6C1885FD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 14:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4386E125;
	Tue, 17 Mar 2020 13:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4906E12A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 13:40:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nw90KXZ5NJnIWqWEgIlxmf3XzP987sNaeJrMjkSJMXZB6xiOxbFIXIuVxxDXiGmBtspT6LFj+n5zxb6bpVRkLB2Ap6bQo4RliuRq8elZnx3y5N84CN0jTnQkf7pjvzPKOmiyokebYgQ6c6c6bosqX1lbjzyBBiEg32XNv1XWjxO2VPhXhsB1RXTMxUInrd2sXd5gWgcpj0AD82HWNhBjXcSVvmS5NnPZyPDuDvy+pnWvY5fRyCN2nzqWRyGxLwsvxaHRhPop1eiPMGl/0e+Z4a+/n08YVgEM3Ue4FHDA0maWWmAh6MbeNXBGwcQR67Ul2HtlqjkTwrT+s+e7EgOLGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37YsdWVN4D26rTI0zHPcDLtb+DiBkopbTPHGnlyhSg8=;
 b=mkegSc4isq3lwiZ5EZ8ONoa0sfZmA3QAcW8D9JRCgzJoydVZNtMuRxQ5EiJ7DyKRq2uGcB5P4rFJvPqPKGNZDFVgcUtD93ORUq26+1DIkYSeq79DRKgYIlSqMSWgaJ6bFQmt57Xly1Nq2zD+5t3IhUMolhHsc/Uino4Qx90WqwNL2kjz3X9AuoLmfzw5ZV6CrAJ7h1Ki62RkxoR/5bIeKiRoAq5e1Sj20+HAuYtaLQk5hQpN25I2Ew/LDRt5ZWbv8ijcdox0vEc0a/At0rcBZ4AdbgvIHgAKb+1gOyw/ltktUOrdzUfHt8OMwBxb1z2tiK1wuQ8xQdGEtawnA1W32Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37YsdWVN4D26rTI0zHPcDLtb+DiBkopbTPHGnlyhSg8=;
 b=dDM04G1MHkr5tN1iaG5xF34onzaDq8PAR+fd9vzv4d4p3YAAqrfatqI3z7vGlOUzAXQArdFFBV2FoOweZEAB+qmHaCDxBmWkeumFSophbnrWoWds8rxcOGDViWUv1r4F+mo3bTDnLryOz0MBxitNWiSrdRYNjRPcPTGyrt38H60=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rodrigo.Siqueira@amd.com; 
Received: from MW2PR12MB2524.namprd12.prod.outlook.com (2603:10b6:907:9::27)
 by MW2PR12MB2364.namprd12.prod.outlook.com (2603:10b6:907:b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.22; Tue, 17 Mar
 2020 13:40:03 +0000
Received: from MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::91a7:e6f7:b17a:bfa5]) by MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::91a7:e6f7:b17a:bfa5%6]) with mapi id 15.20.2814.021; Tue, 17 Mar 2020
 13:40:02 +0000
Date: Tue, 17 Mar 2020 09:39:59 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH] Staging: drm_gem: Fix a misaligned comment block
Message-ID: <20200317133959.pdimegprq3gn4gsf@outlook.office365.com>
References: <20200316211553.2506-1-igormtorrente@gmail.com>
In-Reply-To: <20200316211553.2506-1-igormtorrente@gmail.com>
X-ClientProxiedBy: YT1PR01CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::26)
 To MW2PR12MB2524.namprd12.prod.outlook.com
 (2603:10b6:907:9::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56a0:11a1::4) by
 YT1PR01CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.16 via Frontend Transport; Tue, 17 Mar 2020 13:40:01 +0000
X-Originating-IP: [2607:fea8:56a0:11a1::4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bda85423-3b06-4162-41b9-08d7ca78b1de
X-MS-TrafficTypeDiagnostic: MW2PR12MB2364:
X-Microsoft-Antispam-PRVS: <MW2PR12MB23649BFA24B1B759E9258C9E98F60@MW2PR12MB2364.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0345CFD558
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10001)(10009020)(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(199004)(81166006)(478600001)(81156014)(966005)(6916009)(8676002)(16526019)(186003)(55016002)(8936002)(4326008)(7416002)(9686003)(7696005)(52116002)(5660300002)(44144004)(86362001)(21480400003)(66476007)(66946007)(1076003)(66556008)(316002)(2906002)(6506007)(2700100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2364;
 H:MW2PR12MB2524.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nb3uXOR2/nhm5sRVD3PM1bdGHOWndSH2kP+iqR06cqFcKwct5wRlBLb3eEFHxqEyi1fHXMhowLGoAAgWnextc88nW2Xzq4v4IrAiHYfo5uTHdJSITZkYvVprz0XzteWP6YvN+f3r/dOJS6X/+DRnKPtbI2+HcwpAUT8nNXFt5JhXX9ycDqkm0NzhLrepjWDjVf2x+sYiLvLVi+/YYfbe79sELyc8wFnhKHLvyEKBUUKpUuIyBB/7gautFRTWsw07Sv0A4BGn9r7DCuEh/PMcPDzmE9LmYTelRCfE7aNjoG8/rLsVKD1uWjA6Mi1AavDX7ShAu8nekbGBgjBTs7roM4eNz50454jhsFbKSiT/wgiU8Zbly8z/GbDdifiXanqzbKtEc8yMTFG+tYaWYNxbQ48M9vYMevcTcnruRzem//CCn125ISaC2XFQlDvtyYJXbuRlCWmvGOU+oyVU/nrVY/w+orSoau5ssVDO9FTHugusO0qhsZtZdSf9mEhCDKORkA8YQ7Oq+cEmY4OVgjkvRYlmZLL9bDB7P7dVV8kS6IwpNjUOb9oer6aupOtPEdczS80byRbo67QJHBkDEx8hoDYqc/OAG+EbNwC8m37Ha+reH33DaqxoHFJJLi8isjJGbtaXqk8/ZRNiMZpQIl51Wg==
X-MS-Exchange-AntiSpam-MessageData: R4RkqcGsI1kIYLvvbFPIMuOtjgk+ykjKJsTX61kdR+cRnY3ab5aDxK0R1pEdlCjRwfHgIcKUk7gjlk13nJIOlVVM6rslL6zh4s2bnu4qOm6zxb3SErzhgoiTS1hInggiK6oX5Q29oJNADSjZN2CZaGNPEiqQoEJ65fI3ZQFlEa0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda85423-3b06-4162-41b9-08d7ca78b1de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2020 13:40:02.7042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibUbNi9oFciGQVL4mN1H90CfDc6CyT4pvKlLewbxOlGs2AKpPC3k70OwgfR3VaNVAsCNkhX22/wptPr9/RM/vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2364
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
Cc: rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andrealmeid@collabora.com, sean@poorly.run
Content-Type: multipart/mixed; boundary="===============0569406807=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0569406807==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2kyrwqlv7u5mtxbp"
Content-Disposition: inline

--2kyrwqlv7u5mtxbp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Igor,

First of all, thanks for your patch.

Just a few suggestions:
* Avoid using "Fix" in this sort of patch. Usually, we use "Fix" for
  indicating a bug fix or similar. You can read more about it here:
  https://kernelnewbies.org/PatchPhilosophy
* Patch subject format may vary between subsystem, however, I recommend
	you to follow the instructions from this page:
  https://www.kernel.org/doc/html/latest/process/submitting-patches.html

In summary, I just recommend you to improve the commit subject for your
V2.

Thanks

On 03/16, Igor Matheus Andrade Torrente wrote:
> Fix a checkpatch warning caused by a misaligned comment block.
>=20
> Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
> ---
>  drivers/gpu/drm/drm_gem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 000fa4a1899f..6e960d57371e 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -222,10 +222,10 @@ drm_gem_object_handle_put_unlocked(struct drm_gem_o=
bject *obj)
>  		return;
> =20
>  	/*
> -	* Must bump handle count first as this may be the last
> -	* ref, in which case the object would disappear before we
> -	* checked for a name
> -	*/
> +	 * Must bump handle count first as this may be the last
> +	 * ref, in which case the object would disappear before we
> +	 * checked for a name
> +	 */
> =20
>  	mutex_lock(&dev->object_name_lock);
>  	if (--obj->handle_count =3D=3D 0) {
> --=20
> 2.20.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--2kyrwqlv7u5mtxbp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl5w0yoACgkQWJzP/com
vP87bxAAv1ThCByaUiPe9+Gk9mq15AT44DkzUnZ6Qy2cwY7jA4BOvMXCvuLSa21p
SByYl68VtCfRWALMPIT6rVnhK1ok/dB+qHkxa1exxK27GveRtpuDqGnmhhYCuB/9
mEgUXAtEiuhfcWvpxrFoCRv48Eva0cly583RyOmtdFd5aQTuxEEmdLINZaoI8+jz
uBcHzOS0JP5PPuYoqtYl/gc7l+SAXiRYCXiR30AMdBGSfwefNVupxtLWJhe1Fge1
j4yNdDLVqE+FF5DvFtEWTTTeKWJUfjJUFtPAq/uZIetNKLUKvKqGDBZ3JJfNAcpS
wn/n+pPyixNxiGH9qO/feK8l1TL/nRsPNgxybqrOdKyOdhrH5HCfw5kUxkbkwJcq
iP6jGRpnTWJhkaP8YkD+/5FA4X3GpXJRLr/ZsZWqLfp7ZN7Ffyzr5SMkL6yYD3NH
JPmFvwQoPzTRxIy1efnL2NePq7P86VmGlfsJzPztLu0+JV+KE+8D6kx5Tp4cnguL
YFWs5FlM3EdWR8xQwE0pU9Gj0SSJ7KGtfx2dtq/JQvEp3nrGME84ovQLRziZizn8
KGfXoS/FaIfaAfLJNIra1Bpr6ERNM/83YuqPXhJhWKn/sUivpD1oYCEIZOPAz57E
AAZzmYurNDwsTgBJvT/O+wqTBeZMfyi2s5EOiP08GJOCHv3ZzIQ=
=mIpG
-----END PGP SIGNATURE-----

--2kyrwqlv7u5mtxbp--

--===============0569406807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0569406807==--
