Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D46388F14
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 15:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A856EDA6;
	Wed, 19 May 2021 13:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4CC6EDA6;
 Wed, 19 May 2021 13:28:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3asfTolfLlPAVxw+lfnkSi6h4FWXqw81jKHxaEKa4KiHeN3uTAoMYgmOu1wyuPVTVGbI1Bnjcb7HG5tO3s0ji1S0j2k3QhNq57TbC28TWTXl0pJRBkyLoUN1j+P5KP2IwmsNued891PYqDCpgpUweTqpuSo0ufd5Uct65h8/GuytrMEmYWF25NTobjVPuM963zvZ/i43chR+Jdb0Q4ftdQiIE1Qrf3trdzTkfvd2i+ULp/A+mY4L/OD8sLZO6ImIi8a+uyY9wWvkEUGiNWkq777K8rNbphdUqODebKrCYHOAkgcFSGTsH2lITkumIDqeqoV8VkZsJ3761pxniCq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9amG/bcvGK1UVh5iYy0ShPOfWnaiTv+e9N3g0FGyp3M=;
 b=jaVjmEnsmqkl2Hp+oDTVQXFUG/OAK+h7+XmyF7Q9PJZqBQZASXmXToDVdxyD7kCxDlktAO7+MO40V1rnSmFmYexqzl1H7agH3LOio5CwArwv4OpQNDpnCITbWfWC+2dgTg8e6i3zu1eaG6OjcD5+i742cXp0rNX9SFjE8rlxtTiG/VAoO3Opu6SlKLTU3QBar3ZH5QdPpy7dQsc+c/SrQkCBTRjn9JviGxjvtNr24QNNGZvvicJFR+m8pQUSYKTlbFOOGEeHHiHlxjBp/XA6iASm2g85IjSeffzMAZbNnT6Z+n9JUo/R4U/7Zu/+1E3TB+6gq2mlVG5ZxiCTtCJ3gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9amG/bcvGK1UVh5iYy0ShPOfWnaiTv+e9N3g0FGyp3M=;
 b=PWRdqoMrzQqmUihSgarIzcAp+TzJ77NUjDqZ1OX6URabedl9N/Hn2XwwZRyW07rHVvE36MqGJrFBMei/1PM6ZeVFK/6kx9Np0vFJSjus84Gx1hF+zy1tE8kxf7LetXNrTNHXprh/UWt7TDTcCJE8o7yXvn+HgospnU9n1+k5dSs=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4064.namprd12.prod.outlook.com (2603:10b6:208:1d3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 13:28:36 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%8]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 13:28:36 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Jani Nikula <jani.nikula@intel.com>, "dim-tools@lists.freedesktop.org"
 <dim-tools@lists.freedesktop.org>
Subject: RE: [drm-rerere PATCH] nightly.conf: drop amd branches from drm-tip
Thread-Topic: [drm-rerere PATCH] nightly.conf: drop amd branches from drm-tip
Thread-Index: AQHXTIvt6L0biAkddkefghpqWo8FiarqzFpQ
Date: Wed, 19 May 2021 13:28:36 +0000
Message-ID: <MN2PR12MB44884924C665EE6EDF3E17A2F72B9@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <20210519084932.8666-1-jani.nikula@intel.com>
In-Reply-To: <20210519084932.8666-1-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-05-19T13:28:33Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=b0fc229a-b591-4d97-ae3e-62b261560b40;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.11.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8ad71f7-6fee-429a-fd10-08d91aca01da
x-ms-traffictypediagnostic: MN2PR12MB4064:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB40645FD71FDDE02490CF9856F72B9@MN2PR12MB4064.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZM2H2+MpAuunofqXBCe9/KPaKfVZ/mLkN1pVCCEZVjW3+/K5K7FwrvSH+vJ99A2jYYn3D4Jht4wjzMZXL6AKe/UbMMv55fb/VhwwggknOdLSYcuv9Hvdxw2/jp4RRHXbr91NWDKTrNRTE6SXTaTvL3YD4H7h0lzoIfyWvCAGu7XHS3wQDMWPmlXbme65pD39IxKsWLuBdhWyIGhmqGJ9xGtTM99VcnKWUsShLFmNuOnDBAiaxIF9Ihbog7XF76H0sp8mgAMg54dU+zmJHiybRPXWeENhLrYzaqpCmrt0x7mK4HaKrIARMDKUIJem7ChWq+BD1SwiGzLBhP5zZWFUPc7mbeF0+bVuULPMhuCbk5Hi/hsyphCGX6Q4lVowBb5l8VcNnaii7Oi00Q63NTCdJSzGI99NnSh5WPONyecJq90Eu+54NR75OeSAcTaY/VEOdwfhXJEpS2uoGoTK7auRLhHnVahbYEov2AI+Ms7rR4dE6LvAmRWciI+1QbhseLO9V8Pu0v3pGyWX6NKU3KWECcX+zahYrb1gIf0p75MRgdH7pM/+ZELq98yZWYYHLzCCAeXsZXflcOoyaHOZyiNf84SNaAgKtutPVmZZ6skuCELXHzL1rkuy4kWMXts6sGTXweZC7KXjcOmWHc34mzE9Il2SP4ku2P/NoOBtCGmXt0WKhyxEM0r67o7uu8ibmiTL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(26005)(38100700002)(66574015)(122000001)(86362001)(71200400001)(83380400001)(7696005)(186003)(5660300002)(33656002)(4326008)(2906002)(66476007)(66946007)(66556008)(54906003)(64756008)(66446008)(45080400002)(110136005)(316002)(966005)(478600001)(76116006)(52536014)(9686003)(53546011)(55016002)(8936002)(6506007)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?7CMKPd3lfA5yup/2grtOKg9E7Z3yfHGa0DXZSq14VgHN8fGzRx7uJkgzTc?=
 =?iso-8859-1?Q?PXO2GdV3wM2GS7OsECz44FAX5SBwNihFiQakBImfxf1bJkPgWWpdKo+MCc?=
 =?iso-8859-1?Q?D6XM37C9N7ORUs9ZFd0AEUTAbzg0oG/0jB9pn9gNwfWRZROJ+QP3o93VaA?=
 =?iso-8859-1?Q?23DHdNE5H5BGNH/h+OHY6Gf0Bt+OJB2Si2YRdh2TMxQKx3x9LOGU7SGCv6?=
 =?iso-8859-1?Q?tO13hlBe2qjEsFfs6T9IEJLgemVzRbtUSbIm2wNJGoSbJ/Js/9xAI7AM94?=
 =?iso-8859-1?Q?gncNjOwy8h7uxgoYpEVx/rRwHVh/TQrkv7pDkxMA3PGjT5p7/CCx38UW1r?=
 =?iso-8859-1?Q?ybVt2whUvlxgGuDhc47G9miDdRTLMIo36s2a4y/N/JxNGVZzZ8CZfOlh8F?=
 =?iso-8859-1?Q?wTw0C44CEu4Vm7T30IbEAVfPYus4viuVzipBAeAFWy5jPyD3tJFe2wkOQw?=
 =?iso-8859-1?Q?FWM1rXXRDjvVhfe0tFcLpQdCc2bxQgEb0cwnmNijoFuEHClXo2WDI86/1t?=
 =?iso-8859-1?Q?/sMYsYYHYzcV08qc/10/9lzg8rZAXBs6eXm3bRBm8z56c/cb85C+yPw/mp?=
 =?iso-8859-1?Q?4/aG4Yt0Mw9axRS/CvjWWzLkXo7GYN9h9UWRveEPFjNS1Rh4w8PGMsIo2+?=
 =?iso-8859-1?Q?/w+R1Hxz3iUdmlS4z7vOqbP9mKqIZ/9s+LoBCynYxNuZfzYIQLhTjvHEQg?=
 =?iso-8859-1?Q?aaSOlxgVCVy1KvlyiTuybPYppwpFTgO5mXtZR3DKA6q06I9OpToQn4tIlS?=
 =?iso-8859-1?Q?kieKUwrZmk9GRQNrKlF7I96Y4fEXQTR3omcfzpfPFkkTtVjtg+p9LFiKb2?=
 =?iso-8859-1?Q?WiO2GN6qF85Pkfn2cxKbF3R5uW4IYTPet171Wkt6g9oVD+ekzXPQrSomXM?=
 =?iso-8859-1?Q?cuRqHr0nS8GVhIP32dGl2qHM7TPnULBZpIxAuySiHEDjlTT5dbhrazSYmj?=
 =?iso-8859-1?Q?j6GOMZG++Pxc/o2r1XlMdMyxCpUtONcpAxvy14My4tIon0EQCjm6b4Ado7?=
 =?iso-8859-1?Q?7ZikjAMKUtauKyzX5T/5alSHcC0pMAnyBh/9sxIw3TemzbHFpepdrpmTQh?=
 =?iso-8859-1?Q?ggtS/gbsxToyQYbeuf3JLslswLp3Z1jGh2kil6uQ2d8+E0YyjLSbJgNPOP?=
 =?iso-8859-1?Q?51FQA1z/4oyl8jbUOqR9Rz95mDcb37+i7YVnC/TK5n1hUvnE49FHaAEM9w?=
 =?iso-8859-1?Q?wRAjKyjXTA0nOpuqHginQZ7zmsEdgLUaqwHAaXgGT6yi362M4uWzroZp3Q?=
 =?iso-8859-1?Q?Z4nSMIhGL/ygQkbxQckV4M8VhXvGfsVmMiLaq064JLH9EnPzKjwiIkA2zc?=
 =?iso-8859-1?Q?tv6AfPAHPU8RYl7CnAs01i20jAjySNryLHBFY9r5Sogf3aDcl/bPGZTtex?=
 =?iso-8859-1?Q?+nj1z18UC4?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ad71f7-6fee-429a-fd10-08d91aca01da
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 13:28:36.5654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OxA4aSqTOmsnF0vIl6ExumyQUFtF9LRJ0daWEEuoYq6MIuRiMh1fbRvuwU02iQoIXWVh5E3HOTFVl02KqLfA4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4064
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

> -----Original Message-----
> From: Jani Nikula <jani.nikula@intel.com>
> Sent: Wednesday, May 19, 2021 4:50 AM
> To: dim-tools@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
> jani.nikula@intel.com; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan; Pan, Xinhui <Xinhui.Pan@amd.com>;
> Daniel Vetter <daniel.vetter@ffwll.ch>
> Subject: [drm-rerere PATCH] nightly.conf: drop amd branches from drm-tip
>=20
> We've had a stale repo for amd in drm-tip since around v4.15 i.e. for mor=
e
> than three years. Nobody seems to notice or care. Drop the amd branches
> from drm-tip.
>=20
> Having the current amd branches in drm-tip would be nice to have, if only=
 to
> have a common drm integration tree. However, maintaining that has a cost
> due to the inevitable conflicts. We can add the branches back if and when
> there's interest in sharing the burden.
>=20
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  nightly.conf | 9 ---------
>  1 file changed, 9 deletions(-)
>=20
> diff --git a/nightly.conf b/nightly.conf index 9211550ef75c..35fb1d9ba600
> 100644
> --- a/nightly.conf
> +++ b/nightly.conf
> @@ -40,12 +40,6 @@ git://anongit.freedesktop.org/drm-misc
>=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fano
> ngit.freedesktop.org%2Fgit%2Fdrm%2Fdrm-
> misc&amp;data=3D04%7C01%7Calexander.deucher%40amd.com%7C5903896cf
> 2e642afb05408d91aa30f6d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7
> C0%7C637570109906926805%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w
> LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am
> p;sdata=3DespN%2BoIX9SjLh2Py%2FkqlVsi0p9Ru%2Fet2M11XWqJ5eUQ%3D&a
> mp;reserved=3D0
>=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fano
> ngit.freedesktop.org%2Fgit%2Fdrm%2Fdrm-
> misc.git&amp;data=3D04%7C01%7Calexander.deucher%40amd.com%7C590389
> 6cf2e642afb05408d91aa30f6d%7C3dd8961fe4884e608e11a82d994e183d%7C0
> %7C0%7C637570109906926805%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC
> 4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&
> amp;sdata=3DE5cwRH0Pr9JkIfIMNkNzjlLn5hN6k0inxBkk%2Bwhd1lk%3D&amp;r
> eserved=3D0
>  "
> -drm_tip_repos[drm-amd]=3D"
> -ssh://git.freedesktop.org/git/drm/drm-amd
> -git://anongit.freedesktop.org/drm/drm-amd
> -
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fano
> ngit.freedesktop.org%2Fgit%2Fdrm%2Fdrm-
> amd&amp;data=3D04%7C01%7Calexander.deucher%40amd.com%7C5903896cf
> 2e642afb05408d91aa30f6d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7
> C0%7C637570109906926805%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w
> LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am
> p;sdata=3D1kQe4t89CyANqRhNUpQ2RP3Ndz7A3sdd%2FiWZ7FmKHM4%3D&a
> mp;reserved=3D0
> -
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fano
> ngit.freedesktop.org%2Fgit%2Fdrm%2Fdrm-
> amd.git&amp;data=3D04%7C01%7Calexander.deucher%40amd.com%7C590389
> 6cf2e642afb05408d91aa30f6d%7C3dd8961fe4884e608e11a82d994e183d%7C0
> %7C0%7C637570109906926805%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC
> 4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&
> amp;sdata=3DvVqMWMbdJFHJW8j09tn1m7ItGSL0RmfeDbJZFWoYBf4%3D&am
> p;reserved=3D0
> -"
>  drm_tip_repos[drm]=3D"
>  ssh://git.freedesktop.org/git/drm/drm
>  git://anongit.freedesktop.org/drm/drm
> @@ -76,17 +70,14 @@ drm_tip_config=3D(
>  	"drm			drm-fixes"
>  	"drm-misc		drm-misc-fixes"
>  	"drm-intel		drm-intel-fixes"
> -	"drm-amd		drm-amd-fixes"
>=20
>  	"drm			drm-next"
>  	"drm-misc		drm-misc-next-fixes"
>  	"drm-intel		drm-intel-next-fixes"
> -	"drm-amd		drm-amd-next-fixes"
>=20
>  	"drm-misc		drm-misc-next"
>  	"drm-intel		drm-intel-next"
>  	"drm-intel		drm-intel-gt-next"
> -	"drm-amd		drm-amd-next"
>=20
>  	"sound-upstream		for-linus"
>  	"sound-upstream		for-next"
> --
> 2.20.1
