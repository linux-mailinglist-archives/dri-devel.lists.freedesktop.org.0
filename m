Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 971985483CB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 11:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8389910E099;
	Mon, 13 Jun 2022 09:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A269C10E099
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 09:59:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjWG3ngB7O9Ly01YAU/F89K1BXb/mX/gFXvWcgtsdbovJet2nzipp6Ot5AuGwJgRff91DLjwPSMa54i7U6yVHj1n0PSt/RyIYUyzvOU0HwRPU8dXQcxuEjq5n5+lpxzesDfBAtUWwv1hvpTnGXtInA1b7Qp4Jt5zM5Arb/DEa78TkTFhVZmrZJ37aVSF9x5IyTmVDgPQ8bmo2Ce3wPzL/IoM+zkGXN0OizQTTN938PRMMdZMM9cB2LpLFeTrs2rcynli7+ao38ZaRan9YqXn+FDXG6DvyUgqLNpFc4n99r9MHDcJPska6pyF8+d+ShTxTaMmTNbYcRkPGbMhHpoleA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwSyxRahEAiQkVmNqRCztaC/dmZgHbQdv6voK+fKB6Y=;
 b=gzrrxG4NygNlbVn7xm7X5N4qFm0MuMm7zJn5/OU8DH1mYtqTMjnJM2SvaZQhTkSN47bsT62vaelmWWchxTz9RUa47FQJx7hnNF3zpXYIqI3g/xGI63+Uivv1qS9k7TBpTOlXzRJYQlGmH133nyRVom1sLxsutqcXcaAnyj2HE6R9HOLdfcz7eGKt66DfhgqdSr59qiy50fav+hrckIxc8xWgpK2YU4F77AkF+xQPMX9K4ZN/A5Tw+rCvOTU5jnWw+ESJ+cFeDQUulnmHGlialOm6uUl+yMoc/UlQnhlOsqPXkHMd6oErq+xQfNd1eWk4YVIrvGHrN2P+OOsJtfSP4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwSyxRahEAiQkVmNqRCztaC/dmZgHbQdv6voK+fKB6Y=;
 b=XEvHcdn97DsCdozxfnY7E/uucb0H2w0mlLZWuG9O/Ec5lVBbCLNJCAFR2lbf8pKf+HsjvfwUjdZocjWTNf7Pmrl3pPkzKd0B1LazGvWnHmnyPyN+NbOWmfGXHwykUzPEBeHjrM9042dbG6TcY+snOoNt8tB2/rtzbOKPNPchakY=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by CY5PR12MB6273.namprd12.prod.outlook.com (2603:10b6:930:22::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Mon, 13 Jun
 2022 09:59:01 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::68dc:88ad:eb33:1813]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::68dc:88ad:eb33:1813%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 09:59:01 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] drm/dp_mst: Get rid of old comment in
 drm_atomic_get_mst_topology_state docs
Thread-Topic: [PATCH 3/3] drm/dp_mst: Get rid of old comment in
 drm_atomic_get_mst_topology_state docs
Thread-Index: AQHYdr3rfxl56jhHOUq56EiL4VxHW61NKmrQ
Date: Mon, 13 Jun 2022 09:59:01 +0000
Message-ID: <CO6PR12MB5489D6138C8CC26344618172FCAB9@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20220602201757.30431-1-lyude@redhat.com>
 <20220602201757.30431-4-lyude@redhat.com>
In-Reply-To: <20220602201757.30431-4-lyude@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-06-13T09:58:59Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=b25ac003-7823-4ee6-b948-720384bd8549;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f486694-da7e-4beb-29b5-08da4d2357a7
x-ms-traffictypediagnostic: CY5PR12MB6273:EE_
x-microsoft-antispam-prvs: <CY5PR12MB6273F04F9FD1F5D7AAFF41E4FCAB9@CY5PR12MB6273.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nkiNljicWjHU0J6FHIbX59uO1QxeVp1TAX5HZnxJE9odtDqiWdzb35jcKnmTb3gMOaJxGk6Gn61IJa8QuFlNFDQMBjWxiMViwhj5yNoZm+/9/XArQfSOxK2wh8a9TZApVBmvEZwP+DVZcEwT20T0dRsPQR0OkJ/p40dX8EfdWL0N10lgbu2fK+tiabgDkPWnlJPLwOA96N9DaFuzksepcL/GdRdMJg3xiNllXXR8kSbo23gcgNzIBTKUkkIW7cCjmhcL9u9STWOXqrMnDzocZ6+q07yBEMxTufv2m+BoWOrf/Osb8yHhRG9OqTgyEu5UsnLX6guwzY+CD/f6HscY67JKq79PIzsax1FTjscbVkh/2Dka4ZY0zUIW4epLt2NlR9oMbwfn8Z02CUdHPJbKWtuJtXbKfo00r8RXb6fHW9iMkzyzoDEZgxspEuUAA0HNIo6A3izdeXxdjSqWMtZ+XRy8UT31vQy/izK/E64ei9HRI52b5MylfAyQYt8ipTNRBmcnTlmevog/M0xIX0YuBm40OFZuy0bsXhxbYskgc8An0YGvlazmm1roci3tKPBiZvUrTy+Gr5Pm9obdlFLK5gxfbXRhxEaxfK9qbfwi5ud2FjeJ6h9TKG8UkcRYDEWgW24nUwxNQFeUqRjT9mHkVS9YBnwUc0Qeby+f8uwK1fbbWOgEQ8uIz7J/ons7GuOkkbSgEyHBSD1J+G50E37EL/CG6TtZiDg07723qI64uxs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(508600001)(66556008)(66446008)(66476007)(2906002)(64756008)(66946007)(5660300002)(76116006)(33656002)(8936002)(6506007)(52536014)(8676002)(86362001)(7696005)(9686003)(53546011)(4326008)(38100700002)(26005)(71200400001)(38070700005)(54906003)(83380400001)(316002)(55016003)(122000001)(186003)(110136005)(26583001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EdTZ48YWJGtugHCmatRGxvKW+16cvUo8hUj9Ahf5UKO8oasJFuKrlhfQ6n6D?=
 =?us-ascii?Q?TjBLsgkNLwVmzlL6a/foH10gRCgUmaK76NgXR21VnX6H2+Sh2+/8HMYuihfi?=
 =?us-ascii?Q?eDrqsbfvUbBAPQruxEAAqnOE7a1TXCiU8el5vZ0ro1GAqyiYkxeet5Jg8cZz?=
 =?us-ascii?Q?QplJAaNcrERgzduI1BqHQEdHBmkE8LJnVtABk/4P5QyC2iRvCtHU9l2czlao?=
 =?us-ascii?Q?0YxSBRWnYVP+qsEJwXFccbMQc3ogqTQ3U7nnbvbj3ip5FSZVhrb1o+HLxg+B?=
 =?us-ascii?Q?6AyC43vN0UYjCYTxkhc1qq74O++NYyo0SnBXHPaKdGzPmkqXSqdrrzRcCya3?=
 =?us-ascii?Q?z8sxfpm6Cj8yV5BbNF8Z5wI7YMoUu88m/k2a/HoVLjEd3TWkGUznu8Oeukju?=
 =?us-ascii?Q?uBdEGe8O68KUB1nbDsxN4/pg98ExygPcXd8DwqEaVGgPmpQIluofbNaGpPXA?=
 =?us-ascii?Q?L2PCFy7CK2+ieBmjHwWzf9fkILgRCyF79eTEJWiRtVCud560SxVur7lYGu+S?=
 =?us-ascii?Q?pJwC3CynywPbDa1tI8Y+tob6eTcwd2gNxI3X0FQyvodTcct1AIr2bxKefb9m?=
 =?us-ascii?Q?51lNKewJEjlNITDNTOaalpVgAU5NsGEkSHQG7QBcItQodD2BmZwoq2hAax91?=
 =?us-ascii?Q?wAWBk35smI4085u3Rt6Xwp9OkRfj18pNsdsay1pLBTUzmBMMvje7n9t6IpWF?=
 =?us-ascii?Q?mLWaLVf7JFF3A4wG04M5OxJdZUqlWM1C98yrZV+N/xQ8NpnGLUwHWqqLh9mZ?=
 =?us-ascii?Q?IC5PzSVEVHxp9WHgzHT/ONY3bu3c7lnwpGGSH3SiLs1y/73e7lV4TiS3T8ZL?=
 =?us-ascii?Q?u5349Z8V3japu/u7HKXc01vVoQUgFhGjxbx9vZ3mL2oF8rRaPwiVcQNcXEnu?=
 =?us-ascii?Q?cbT2Lf0uxOLvh0YunfE1l1xWy105fWOpxwitR56jR7sprF6JO71ZXlPq4wQC?=
 =?us-ascii?Q?bH/p/nJdMyZjyk7cybjezdHVc7H+FPfahmNUvijHCo8NYaq12zGtzC/LpnRv?=
 =?us-ascii?Q?8B6vCjHk8fjX48hyZ14dCMxPoikPKpuroc+jVJG90iZuL9vbZ9klJK/cY+y1?=
 =?us-ascii?Q?gbJT9s0qxXe8DziQJPvhOS2HsYVoxnAwo6nytfv6WqWGOxkNQQv0dK/rIrVG?=
 =?us-ascii?Q?zGkP2TNIezziXjY5Hwecustuye2yWoLsgltixLsyy6CXJROdSIdLdqmNqGuW?=
 =?us-ascii?Q?ob8IIc+F9/NlvHCR/GXxE6kE6Lcj7yn4XD6TkkR0GOMUxgJY5mGA5O6/21cx?=
 =?us-ascii?Q?5I/mmcYSzn6xZTffdzN0gRKH0VilgkKce8gnKeUpUVww1eJ+3esWSc4lsmVb?=
 =?us-ascii?Q?6aRH2LaAI4wXn+7/QSP6HhzVLY6q0e/CMTAUPm8MOEP7Gf/aJynMzs06coVV?=
 =?us-ascii?Q?UVEvXDYX5zstEVgWREEZbuqx/rpJOH74b+YX6N9ogjyg9MmocljoHmcy4cv3?=
 =?us-ascii?Q?ExPlBrsoK/SAC5+gKaZxnBrpI/OU5ShEaCC/8HLV1MegkUGIH59KSXNripCI?=
 =?us-ascii?Q?l5fEZqiVy3mjJ6z0rR5qDiF1yG0+s0v8N2kw4YZAUCvoVWVLtMMA26T2Fb5Q?=
 =?us-ascii?Q?g+OVSmJm9pQ1TLWjLXoCDnhigYUj7WIlGmA2+WHizC6OlsHywCWVdD8KxKD9?=
 =?us-ascii?Q?yWlyP0OGIDMc6mgnMv1VVqdfa1nb4wPTgZ3c1yWkbcqM5HPS2zV33KL1CcI0?=
 =?us-ascii?Q?N3dGSPeer1giUJU9sK+XvRPlQyGUsaGteOizL22qBYJshY6Tidse0HourjSQ?=
 =?us-ascii?Q?FkqMkZjymA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f486694-da7e-4beb-29b5-08da4d2357a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 09:59:01.5644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 75lAIRyXiM0kV0ZlrxlCfUB2CPAojtaQZYCCfeph9JfKo8EHdf7TcYzTSbntI/U6lwU86cGmzZcJc+XVV4eQ6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6273
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 Rajkumar Subbiah <rsubbia@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Hi Lyude,

Feel free to add
Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>

> -----Original Message-----
> From: Lyude Paul <lyude@redhat.com>
> Sent: Friday, June 3, 2022 4:18 AM
> To: dri-devel@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Tho=
mas
> Zimmermann <tzimmermann@suse.de>; Lin, Wayne
> <Wayne.Lin@amd.com>; Jani Nikula <jani.nikula@intel.com>; Lakha,
> Bhawanpreet <Bhawanpreet.Lakha@amd.com>; Rajkumar Subbiah
> <rsubbia@codeaurora.org>; open list <linux-kernel@vger.kernel.org>
> Subject: [PATCH 3/3] drm/dp_mst: Get rid of old comment in
> drm_atomic_get_mst_topology_state docs
>=20
> We don't actually care about connection_mutex here anymore, so let's get
> rid of the comment mentioning it in this function's kdocs.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index d6e595b95f07..9f96132a5d74 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -5458,8 +5458,7 @@
> EXPORT_SYMBOL(drm_dp_mst_topology_state_funcs);
>   *
>   * This function wraps drm_atomic_get_priv_obj_state() passing in the MS=
T
> atomic
>   * state vtable so that the private object state returned is that of a M=
ST
> - * topology object. Also, drm_atomic_get_private_obj_state() expects the
> caller
> - * to care of the locking, so warn if don't hold the connection_mutex.
> + * topology object.
>   *
>   * RETURNS:
>   *
> --
> 2.35.3

--
Regards,
Wayne Lin
