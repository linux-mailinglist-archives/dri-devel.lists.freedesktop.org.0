Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A658936EC65
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 16:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E916EEAE;
	Thu, 29 Apr 2021 14:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D366EEAE;
 Thu, 29 Apr 2021 14:30:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rc8XgqIqNOoIqYy1MP3Js36hfynYmKZ60kgT3z3aUtt1pRrz47TXvCw0Y7K04ej9v1oNnyuKvhN0UDl/x+uJxGI09oyzlGFmM5WjG2ouK8RqtDLtz7gwQIMVfAfd4tH7rtdyqj9NXdQfNSBfy5rm8Nx/975Zw4tLlf2H7Q6eBixgkrcpoYdyUu9vx1tm7jFzdROFdWxRHmodAeDgqc8daEeQ8rfgMNZqI0YmZmBwIvkO86xoMqlfh3Xf3q6Wn+8Vr2BkezO62bfnl4fT55fm6xBSyDyl31feNs/Dz52zwEHH7pjPVsYKZqcJCp+12CwWMCqP4bY/AMrhimnZRuo9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEOluUaLyB2byncnXhTMUz+KKHVeash59tIWxkeStUY=;
 b=JqlsiEKztVRCQTRP8/hqCfBswITF0Yy0njJxXbEGfmzKooOuBwpRYbBKhpZfLSwvnn+tHTqRIXQzo1tenrPoi5rq1pWNkTO12nnuIt7QNfGlVrbMTXFnoHHVoF/6YkU5I+HhGwa3QP0fY2bMw1AyCxy5O57DCxFRYPyAB+ryPBu5qDqHlxDwBMT7EDJQJiSRLphDsI3FbJf+wE4fuhjVhAkvhdxfsO7Fcb+3XgQteW9NOObLFo70ljvh3zJCeMbJA3DL2/2a4QSEHkuU+GIcyYfdjUgnEAicBqoQfs7U+9gw+v8n0bKLgq/8+Ouc6Yw5B7xju59zoqwbeXv+kkdQYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEOluUaLyB2byncnXhTMUz+KKHVeash59tIWxkeStUY=;
 b=IkYZhjC/O0U8ALlsxqNJCB1FzOo7XDQA7PEb8qAnNSJUp39h1++jQ+Dx7OT+9zQGNRSGaeft3kJUILVl1l1zQH5xuK91+n7jvR4eTyVLmpD5LYjHY4YIwxl8ReJVXIdfjc40lsywNaS0HBS8iz+/9JmTyd0NgBQZ8rHps33WGBQ=
Authentication-Results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.26; Thu, 29 Apr 2021 14:30:47 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101%7]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 14:30:47 +0000
Date: Thu, 29 Apr 2021 10:30:43 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] [v2] drm/amd/display: Remove duplicate declaration of
 dc_state
Message-ID: <20210429143043.psmabddm74bljtpx@outlook.office365.com>
References: <20210429123900.25156-1-wanjiabing@vivo.com>
In-Reply-To: <20210429123900.25156-1-wanjiabing@vivo.com>
X-Originating-IP: [2607:fea8:56e0:6d60:9d3b:95a7:19db:40c3]
X-ClientProxiedBy: BN0PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:408:e6::24) To DM6PR12MB2601.namprd12.prod.outlook.com
 (2603:10b6:5:45::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60:9d3b:95a7:19db:40c3)
 by BN0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:408:e6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Thu, 29 Apr 2021 14:30:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71299113-5cee-4ace-8fc2-08d90b1b6144
X-MS-TrafficTypeDiagnostic: DM6PR12MB4250:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB425091BC9F29D92C871D42B5985F9@DM6PR12MB4250.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XidyLaVhDyTUhYF6m9eOCJEJ2UZhzvLBAEExVOALR/+ghylDeWAZrwXajNCJsZmK7IYND2/wD3Vb30/vucyRTjhZVXFVj6Or44NqgkYnWdseecaKYBdNjSIeyeP+j9qJqdNRq5RsrAd2VL6mnVduN+VjyU7afhHygAXKBA+qMLhFz0z5obRUj9UAEy/JMOFRPMnLatIvWn+zPIg0p2/tzxMX1ZCQxQo1gxRVvcGH9Hxn8njbWk9BiQbmyMhdWo2QnnchR0okCNPcKRFHrR3tznCjjyJQNyECCeZEz7F9vGsYh/3sjU2YfPNGzCTFfMw5FO5doxwOD6EzfSxQKpnbdACyLDm0xPsvAU4eyYg7Hn3fJWkLDtZraVexyKrqZmzPIPi7kPZvrc3AkoBvFM9EN82WjaWDBVADqrwiORP8HNujdoboi/eU4BmwvmbuaoNtCvaWv4aqAUFeuRoLt9jOLksltig2oVdCl9uCl1v+MdZf6htmgA9Jd5JffXVCeq5Hfd49FN/WCc8R4tJWewHQl8HYzNY25vKSXPRYlJ6tLba5Bk6rDloNXO2QuaSUl6ai1UaIz8AYFFX4RAxROsi0dREbk9P3kxFop0wW/cfoyzHLQzwAE3SrxlXCPm0AasSdfZltgQ3OOWlZxvgmKM66IYK/Cnr9+c9MTdALcVn10R1loowt/Id9ZxetjZJ/q1yC+tCFgz9fq77ICC5mBlg2e+J/7RRfPUUmHZE1V+wOUHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(21480400003)(6916009)(2906002)(38100700002)(4326008)(66946007)(316002)(66556008)(16526019)(55016002)(9686003)(186003)(54906003)(1076003)(66476007)(8936002)(6506007)(7696005)(86362001)(5660300002)(52116002)(478600001)(966005)(8676002)(83380400001)(44144004)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5YEon8Pab58Jsk+m7XoO3SUGTU49Dg65MWx4oB1C0YKl37SsS3LcA+OQDvYb?=
 =?us-ascii?Q?apKbwbCBveiw9/rf18EOGr1PpO5d67Tdok5ck9ymQi8oZ2KxmIgsSnfs1P3F?=
 =?us-ascii?Q?mdhJzXJfwEjDtse3vDPZlikAO85oJeUGtRcb6GlBVPRuskB1Q0sF7udascpR?=
 =?us-ascii?Q?adp9GEYmi81Jc39vGlbQpp8/DOn2f+wlfeubxu3m4aD+gVvHeTA7vw1yGGfM?=
 =?us-ascii?Q?U4F650svvu9wfjTRoC+4dytQN5aHqunsRcnwPNMFIsqixn/9YzHio/IgijNG?=
 =?us-ascii?Q?IV7F0Ihiw1p9K1jcep0qam5r893IWuN0Xh1Amf5MCYm1xOSHVP+pLoy77d7h?=
 =?us-ascii?Q?SQmGsx+9tIYWvaWNStfwetJsq0i0/ta1x8k1q0d9WHv48rapCS2SE7h3RGce?=
 =?us-ascii?Q?hFezQnmwMuXR9CfW+qMLWjoirNWhdLC8SNFwC3E7tTkqyXHYn1PmiaI1RBao?=
 =?us-ascii?Q?KMSVamfYsCDnvLOwe6VZZu9ygQif6rOSfQkQEnWMLCnZcjH9TqgSvZOUAS/x?=
 =?us-ascii?Q?c1Iufig8EqylSOAMLMo/oeDO1gEaS4KrEVPL6Xcd78n6LQ3dRHQC5CG8jhvd?=
 =?us-ascii?Q?iGLT8zkbiCaM9kejgy0+hxdJyCraAJ3RM0/KaEL83e75pGOv1gL0e5DR3yiq?=
 =?us-ascii?Q?FnizYjR1TAsyscmCHoFhDzwRbsucojFu3CH7Vmx4FMVwMIgJoVQGxUCuYCpb?=
 =?us-ascii?Q?82F5hAYIr+nDtZ5tPp+K6CJ0oIVusPgTICzI/eVaOWXqnLfv2czXPJ4AoyzQ?=
 =?us-ascii?Q?l5C+Mn7RdxZRGnZaYwOvLzaz7Id82YQTI/2ZzooPTd12hqhGZofxieVXb0qW?=
 =?us-ascii?Q?rp+eMGgscAp9dXGHOnZZan2o6c4unECR0NyUaqKJmvfF+mBYfraoqpwSJ+PV?=
 =?us-ascii?Q?euGYJFor1a8zXUWGse3Ud+SnAc7xtxH6aLc0wTbFqAOeh3/qdd9o1xK7+q0c?=
 =?us-ascii?Q?6LVCrpnRjyBUAc62uAxVfKaGPJxjLlYn1VKu8qF5pK6MjLNVl7sb/VdL874L?=
 =?us-ascii?Q?+oBftNwCyIQ+1x7qlhj6me+UDe+s2Yo5Ff8DzdeUnsOY2Oyw12Vbuq6thP1A?=
 =?us-ascii?Q?jU7X64Qkraeqe2zR1yDJef+U5a9v2hb/f51vRXvWR2ujlcu/BjIAZ5iw89oi?=
 =?us-ascii?Q?yJgO6RHGHDEUGHcujqEfpvserdM9PqzYwRkTthnj7Dz4d9sicOW462UQvPo/?=
 =?us-ascii?Q?N4Tc2Eo3JgfqOHFidgzpfsT/Frcbcxc0GPygM1BZcgbN/Ds0GIcmSNqj3Pr5?=
 =?us-ascii?Q?6ttlluC7YBKHYWB12A297dpe6m9/P1xUaYiQ0wVYT+H4fBZUg4kwaeX5B5k6?=
 =?us-ascii?Q?y3lUwyJIYepwmngTtBVRPnZUKyJLK+VF1PefZngJj4pZzWSyUCSWobx6iSJH?=
 =?us-ascii?Q?ngqS+Q5ZW4Modmn6bCdqGraTjIBB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71299113-5cee-4ace-8fc2-08d90b1b6144
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 14:30:47.5280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7k4Jwl/f0Kw4AeiqMY+KwiXPyaw/NVnSx3RAPfm9qa4padety6K4LsfKGGAzhW6b72x4kCbWcVphchtQwkRXzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4250
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
Cc: Jacky Liao <ziyu.liao@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 kael_w@yeah.net, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0198178367=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0198178367==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pxa2pngw4xywjlgp"
Content-Disposition: inline

--pxa2pngw4xywjlgp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

On 04/29, Wan Jiabing wrote:
> There are two declarations of struct dc_state here.
> Remove the later duplicate more secure.
>=20
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
> Changelog:
> v2:
> - Remove the later duplicate instead of the former.
> ---
>  drivers/gpu/drm/amd/display/dc/dc.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/di=
splay/dc/dc.h
> index 8108b82bac60..6f3c95b5d1a2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -594,7 +594,6 @@ struct dc_bounding_box_overrides {
>  	int min_dcfclk_mhz;
>  };
> =20
> -struct dc_state;
>  struct resource_pool;
>  struct dce_hwseq;
>  struct gpu_info_soc_bounding_box_v1_0;
> --=20
> 2.25.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--pxa2pngw4xywjlgp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmCKww8ACgkQWJzP/com
vP/ggQ/8CfGtjmkV50kOe1v8HJZBnGNKUGy3IqvB4aNVU1FEtg4GqXY66S77Iarx
7gc+QO8d2w5TJe07n+/Wdeho3Vj71OI4zktscX2kyFNrce+OmR4T9sFU+m8aKpCN
HQK6PPV0Fec2Qe3JZPOJsvcETHUuL8gPIL+/XQ33uboagvFqYsec5CSNoUmCWqZM
TtA2M/yq24WRR4nhbascTuhiS0kBShC28xxXyqZBKHIIKSapBb6DonyAtZYVSgrg
rqfCJUdkzgA2jMaZn1nnNySGHV4niFbpPIWmHE5l3PZgSMc+rKHYv8NKYn7wLk6L
/spnGzj8WR+U6a1v7RCRlzJoeU65sf6WapJk1nVim9HAUhykcJdeLdM2MN6/mC1N
CndJz+xRhIDVfaLGviDb9i72swgTn92pAI6+TFxdO4R0Kg3Jy9pdCuVPD0DbiZRU
InKCQl10YhprBfAd9pIo86/Qjn3DGF3Me6o/Czo3/RgOAa4QWaeMVRLJCvLn6wyM
wH9j3brJpZY8xYaUBSlUvP6jnrRH0FmIx+301m+A3+0ZSI/gicl//xYjajJGlpbL
6dfpGEnHvRJOiK0wEkJaiDDcndtFji3DzTXyqlLQ5GQOSfJIve/lTQX65hqmRYUT
lHcRcQnWtGYn2giQG3fqj+zHON707RNdKhtOhbqeutxryOHRmMM=
=+V0s
-----END PGP SIGNATURE-----

--pxa2pngw4xywjlgp--

--===============0198178367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0198178367==--
