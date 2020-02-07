Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3567615601E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 21:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFE96FDA3;
	Fri,  7 Feb 2020 20:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95B16FDA1;
 Fri,  7 Feb 2020 20:46:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvMcA6nXqle40ahVgKvHfVwiFepNR7ynv//6/2uwJ6ZTtFlTJqNZnfJF7aEcQFqBkZoPU1M9keqZlmqjfcXtPYuyZhZu2swlYWZdpMZV65dw1XPrz2kW5Uwvm8sj3wLyp/5dBglCttzzXR3pzyq7Yb2bpmQrd3H2EllXvg3c3T4L8QZnZFD5H8h0GW2BUtxs64ISBDtk4/vNpkZ3Hmf75xPzIWIRuzopCU/KEq0pAX0uJ6EPZY2/cmQopxseRc4q45PerM1e8cbqPzbOPnrxrQFrZWvm9TLyfxEdQzR5ozlftl3P/FQ5eiuXksz0a8lMxW+uOzd/+s5R8uKiTk9FFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BGzbYw7xxUSOicL2K4IdWLQiSVJBN+6zzjVNTM5wYw=;
 b=Ynlo95IJyS0V4H0y5yy7tL0+wgXF10UQKfH9zTFvuYJv3prdfZxgEbKOhcssnDgLrOR173J7FngP3JwZD33bdevUlEk7WTwAfv3MbMtN5YcNIswFzMq5CSQRmUp5kvFQp7BAZXo43zzDhbNr6LPPfNObyoIxJmHi6/qYdlNp6gzEYb6fVCAtpB9XUwT0gdHksrSqaiJQYhUgTNx4txT+sNR38Ql9Y7htxlOKb0ExqxR+zRLjNXaiFnZPASczUhEiYqklp62688n3MxftDMI5Kwtw7XK1F4fQbcIhB87EIsSfA/cEK4Yg5w/PigybiJgMGy8TVRUfqiU4ZvRtrtrDUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BGzbYw7xxUSOicL2K4IdWLQiSVJBN+6zzjVNTM5wYw=;
 b=Vooi92H31JD0qIdaqRdl1G2KesgoSp+wXvePqcRZZE6aArbRAQqw2230V6Qx0BVOtHLUK/vXMqpxWXqONJWzNx36sZS+INtE0lDiJhTEmNs7FxKCnY+W2TMqy/SHqd7/7QD2q2EWYVzZEloOnaHzYMPKNnYj7cMtnaEcIiawKZo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rodrigo.Siqueira@amd.com; 
Received: from DM5PR12MB2519.namprd12.prod.outlook.com (52.132.141.150) by
 DM5PR12MB1755.namprd12.prod.outlook.com (10.175.85.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Fri, 7 Feb 2020 20:46:05 +0000
Received: from DM5PR12MB2519.namprd12.prod.outlook.com
 ([fe80::3506:db14:d616:9f43]) by DM5PR12MB2519.namprd12.prod.outlook.com
 ([fe80::3506:db14:d616:9f43%6]) with mapi id 15.20.2707.024; Fri, 7 Feb 2020
 20:46:05 +0000
Date: Fri, 7 Feb 2020 15:46:00 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>
Subject: Re: [PATCH V6] drm: Add support for DP 1.4 Compliance edid
 corruption test
Message-ID: <20200207204600.a75x5vz2pz5suz2y@outlook.office365.com>
References: <20200205152248.32419-1-Jerry.Zuo@amd.com>
In-Reply-To: <20200205152248.32419-1-Jerry.Zuo@amd.com>
X-ClientProxiedBy: YTOPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::41) To DM5PR12MB2519.namprd12.prod.outlook.com
 (2603:10b6:4:b5::22)
MIME-Version: 1.0
Received: from outlook.office365.com (165.204.55.250) by
 YTOPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend
 Transport; Fri, 7 Feb 2020 20:46:05 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f12a9591-477d-43d1-52b3-08d7ac0ec068
X-MS-TrafficTypeDiagnostic: DM5PR12MB1755:|DM5PR12MB1755:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB17554DC25D7FFC30C89244B6981C0@DM5PR12MB1755.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 0306EE2ED4
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10001)(10009020)(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(199004)(189003)(8936002)(6862004)(21480400003)(44144004)(66946007)(66476007)(316002)(52116002)(54906003)(7696005)(66556008)(6506007)(5660300002)(26005)(2906002)(956004)(478600001)(966005)(9686003)(55016002)(1076003)(81166006)(81156014)(8676002)(16526019)(186003)(6666004)(6636002)(4326008)(86362001)(2700100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1755;
 H:DM5PR12MB2519.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mrdbvt+aBQfnvA6Dru6TVnNPi9sy8lRLCZ2qqpPpot0Smj45o5Jr6TNsaiLxiJVs4rOPMPmZwrDg+AbmyTqgadjmAJo978+NF0WUP3zk6DA9T5A0jLDxIJNn0eYYOykJ6h78qkSFSZdnMGgJG9NQAyOYxFEK3Szeewd7+mkLf1MsRfM8dDS+tN5/nxY3kqS7ZugDhPzobN1ctH70SvOlNppDkfclBaWdYMX5DiDB8bbXTi1uJttkmKwhRugAWC0pgFBrZT2jBcz7Z9ChEFVppkwXqAkJzYxxZgJBWWVYACzQm//Ew96ef3M9BmCrFmXJqrWu/4/LMgXUn280yyT32f0EEHz10ADy85XqgxaEEHgsF4RoOOuY6wUl2l89z8+t4KjXNUKTi+KDXFiAPUM9CjNEN64lAhaD5HS+GUb10rcejnDjKmKrTG5y8y8kML1F9u47XU6S77YKSpfhIOXzRxT6vKat9v6o9swSnOD7u05h5Q+3pm/cxjEzCRLUZFW4Eq0Z3MSwsQKY4d9jHUX0A31W5TWKO9XIC8Y1EAFtwt1HRyhXT7BVSO2TgAHKWarnpzL1eza3mFy1et+Sj7jHvgidcXA/sqQSG4wSGRFUIwASLp5kw1jAWUb8Qtavg9dfsVLhgj3xAKs+qj51/byd9Q==
X-MS-Exchange-AntiSpam-MessageData: sXKylaG6TdQlFnWjyVraYxMp+qsS72RkY5ZNysdS1zOT2K/Vkds7QCl5uhjlRzeGz6yB9egzXWa20K6SOMsX+4uQSc18RJsBYM3Yiwg4bepWkxj3G4pgaoOGSscmcIP7Eu0ADvKxxyqjcqQW4xXyWQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f12a9591-477d-43d1-52b3-08d7ac0ec068
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2020 20:46:05.5075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZAanvu9y7cNhjQ1NEZFOzcy34Sxi2/RpZuYxC/jaSDSIP3TCC7VkjFFWdOA+iUyIwAvHbuIX49kEQPJjshsPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1755
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 manasi.d.navare@intel.com, amd-gfx@lists.freedesktop.org,
 Alexander.Deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: multipart/mixed; boundary="===============1651845465=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1651845465==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jpfjaor5bziqin3a"
Content-Disposition: inline

--jpfjaor5bziqin3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 02/05, Jerry (Fangzhi) Zuo wrote:
> Unlike DP 1.2 edid corruption test, DP 1.4 requires to calculate
> real CRC value of the last edid data block, and write it back.
> Current edid CRC calculates routine adds the last CRC byte,
> and check if non-zero.
>=20
> This behavior is not accurate; actually, we need to return
> the actual CRC value when corruption is detected.
> This commit changes this issue by returning the calculated CRC,
> and initiate the required sequence.
>=20
> Change since v6
> - Add return check
>=20
> Change since v5
> - Obtain real CRC value before dumping bad edid
>=20
> Change since v4
> - Fix for CI.CHECKPATCH
>=20
> Change since v3
> - Fix a minor typo.
>=20
> Change since v2
> - Rewrite checksum computation routine to avoid duplicated code.
> - Rename to avoid confusion.
>=20
> Change since v1
> - Have separate routine for returning real CRC.
>=20
> Signed-off-by: Jerry (Fangzhi) Zuo <Jerry.Zuo@amd.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 51 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_edid.c      | 23 ++++++++++++---
>  include/drm/drm_connector.h     |  6 ++++
>  include/drm/drm_dp_helper.h     |  3 ++
>  4 files changed, 79 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_hel=
per.c
> index f629fc5494a4..1efd609df402 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -351,6 +351,57 @@ int drm_dp_dpcd_read_link_status(struct drm_dp_aux *=
aux,
>  }
>  EXPORT_SYMBOL(drm_dp_dpcd_read_link_status);
> =20
> +/**
> + * drm_dp_send_real_edid_checksum() - send back real edid checksum value
> + * @aux: DisplayPort AUX channel
> + * @real_edid_checksum: real edid checksum for the last block
> + *
> + * Returns:
> + * True on success
> + */
> +bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
> +				    u8 real_edid_checksum)
> +{
> +	u8 link_edid_read =3D 0, auto_test_req =3D 0, test_resp =3D 0;
> +
> +	if (drm_dp_dpcd_read(aux, DP_DEVICE_SERVICE_IRQ_VECTOR, &auto_test_req,=
 1) < 1) {
> +		DRM_ERROR("DPCD failed read at register 0x%x\n", DP_DEVICE_SERVICE_IRQ=
_VECTOR);
> +		return false;
> +	}
> +	auto_test_req &=3D DP_AUTOMATED_TEST_REQUEST;
> +
> +	if (drm_dp_dpcd_read(aux, DP_TEST_REQUEST, &link_edid_read, 1) < 1) {
> +		DRM_ERROR("DPCD failed read at register 0x%x\n", DP_TEST_REQUEST);
> +		return false;
> +	}
> +	link_edid_read &=3D DP_TEST_LINK_EDID_READ;
> +
> +	if (!auto_test_req || !link_edid_read) {
> +		DRM_DEBUG_KMS("Source DUT does not support TEST_EDID_READ\n");
> +		return false;
> +	}
> +
> +	if (drm_dp_dpcd_write(aux, DP_DEVICE_SERVICE_IRQ_VECTOR, &auto_test_req=
, 1) < 1) {
> +		DRM_ERROR("DPCD failed write at register 0x%x\n", DP_DEVICE_SERVICE_IR=
Q_VECTOR);
> +		return false;
> +	}
> +
> +	/* send back checksum for the last edid extension block data */
> +	if (drm_dp_dpcd_write(aux, DP_TEST_EDID_CHECKSUM, &real_edid_checksum, =
1) < 1) {
> +		DRM_ERROR("DPCD failed write at register 0x%x\n", DP_TEST_EDID_CHECKSU=
M);
> +		return false;
> +	}
> +
> +	test_resp |=3D DP_TEST_EDID_CHECKSUM_WRITE;
> +	if (drm_dp_dpcd_write(aux, DP_TEST_RESPONSE, &test_resp, 1) < 1) {
> +		DRM_ERROR("DPCD failed write at register 0x%x\n", DP_TEST_RESPONSE);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +EXPORT_SYMBOL(drm_dp_send_real_edid_checksum);
> +
>  /**
>   * drm_dp_downstream_max_clock() - extract branch device max
>   *                                 pixel rate for legacy VGA
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 99769d6c9f84..f064e75fb4c5 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1590,11 +1590,22 @@ static int validate_displayid(u8 *displayid, int =
length, int idx);
>  static int drm_edid_block_checksum(const u8 *raw_edid)
>  {
>  	int i;
> -	u8 csum =3D 0;
> -	for (i =3D 0; i < EDID_LENGTH; i++)
> +	u8 csum =3D 0, crc =3D 0;
> +
> +	for (i =3D 0; i < EDID_LENGTH - 1; i++)
>  		csum +=3D raw_edid[i];
> =20
> -	return csum;
> +	crc =3D 0x100 - csum;
> +
> +	return crc;
> +}
> +
> +static bool drm_edid_block_checksum_diff(const u8 *raw_edid, u8 real_che=
cksum)
> +{
> +	if (raw_edid[EDID_LENGTH - 1] !=3D real_checksum)
> +		return true;
> +	else
> +		return false;
>  }
> =20
>  static bool drm_edid_is_zero(const u8 *in_edid, int length)
> @@ -1652,7 +1663,7 @@ bool drm_edid_block_valid(u8 *raw_edid, int block, =
bool print_bad_edid,
>  	}
> =20
>  	csum =3D drm_edid_block_checksum(raw_edid);
> -	if (csum) {
> +	if (drm_edid_block_checksum_diff(raw_edid, csum)) {
>  		if (edid_corrupt)
>  			*edid_corrupt =3D true;
> =20
> @@ -1793,6 +1804,10 @@ static void connector_bad_edid(struct drm_connecto=
r *connector,
>  			       u8 *edid, int num_blocks)
>  {
>  	int i;
> +	u8 num_of_ext =3D edid[0x7e];
> +
> +	/* Calculate real checksum for the last edid extension block data */
> +	connector->real_edid_checksum =3D drm_edid_block_checksum(edid + num_of=
_ext * EDID_LENGTH);
> =20
>  	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
>  		return;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 2113500b4075..b3815371c271 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1357,6 +1357,12 @@ struct drm_connector {
>  	 * rev1.1 4.2.2.6
>  	 */
>  	bool edid_corrupt;
> +	/**
> +	 * @real_edid_checksum: real edid checksum for corrupted edid block.
> +	 * Required in Displayport 1.4 compliance testing
> +	 * rev1.1 4.2.2.6
> +	 */
> +	u8 real_edid_checksum;
> =20
>  	/** @debugfs_entry: debugfs directory for this connector */
>  	struct dentry *debugfs_entry;
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 127d6e1d3338..957a3d00ee05 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1459,6 +1459,9 @@ static inline ssize_t drm_dp_dpcd_writeb(struct drm=
_dp_aux *aux,
>  int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
>  				 u8 status[DP_LINK_STATUS_SIZE]);
> =20
> +bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
> +				    u8 real_edid_checksum);
> +
>  int drm_dp_downstream_max_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  				const u8 port_cap[4]);
>  int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> --=20
> 2.17.1
>

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>=20

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--jpfjaor5bziqin3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl49zIgACgkQWJzP/com
vP80fw//RqZvI8mst9dbUHreo+QMToPLsC9kfZZeuaQdeGZYnsaj3GtuxBkWoNPc
DaDARSuNQTtaqdoQPqZIaPsgR112XDzVx/VBWMfTB0hkvbtUQEPcDR0eDfVeSp1v
IRM6ffsY9GrIqpqUfpH8If2QqlHY0Q4HfwKrkUldp6f80WwaghFdI0hcK0ldGn/i
oxgEzIgdQ49gD0XM98bXsAUCa9FvFSAV2r+nMtj5EVPDPHXKQ+84CcheLteX6kRA
bDnTWErFQnhZVSfZccxsi0AbcJwYQfZ315VF3gOhqhQesD4+woYlcYAMOKI0L1Qs
poTMNNAN/e7UdWlZhZUeLQJ+6P5tckF9ovnT+cHjy5XRMhxJg6XymVv6SZjoQur/
0k5M1JPfKtYTErl101NbVYZjq1AeAUZ9HLDNmt5L/p/UydfdWHHcZb1Z2hULMLyj
AYbvC+BxPswnhVXbjZDyie8NCclkm5/0EdC9QC/lEd4cgVe6onEivPZz/sLdduKa
UV9TrJkvEdvej01XcIUKWZJI9iXW9w0vHX/vNmml5pGefSwUZxWCKtH4HVt4e38U
di5NNMeeY1icj3K3K4P8bb3aJcehDBHCBRa4Iax001jl8uS6/7icngQT/d81MS+a
jSZlA8H5VGwWe6M9ZldStbI295OMY9WubXw5DglUfdSB/5Bk/UY=
=Cnyw
-----END PGP SIGNATURE-----

--jpfjaor5bziqin3a--

--===============1651845465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1651845465==--
