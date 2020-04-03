Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4D619DA7E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 17:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731786EC18;
	Fri,  3 Apr 2020 15:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829F96EC18
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 15:47:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5rLLA/TnJ0tVzksSVEq36aU9Zx+Kobf+QdFu5J1m54xKjKhHU2+Nu2wJ5p0gtAk2U476IyQe7iHKd7p0PGgNYviE8r33L5Ecv1/FkKvjmEa+UCCRVh5ZuFjO9RaoAghPP3G41J5ZT5qW3B5qLwiOLuWe8u5zgoAWWU+OUTEuxE8xqn0Um7QTDVF35J4W4WaDNMSGcPZN7afK5Nw+STXN7ENAFP7x1w+hJwThD8f2tehX6eC3Y4C1IFhTGm2Fx9TPVhrn9L3UiB1jQ8cnVLUwK5jMm9sokvjGBX5GR6eKlb4FyHOy6RTrV5zsaOQsoiaZiL0YMvSgtXDoPQhzCllfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvD3jeGriiExsdLpmA1d3qxJiSzzeAZ6QGi0Btb8uoU=;
 b=UoRjrSM9SveG2Q8x7u5YDfPuH+6sxBTDfoAww9zDGIsYuluv1j3iZNKbS2xzQ3gCqN3eANU1bINwt5gFYP1qLFcJEuAmVdXX7OJI45L09XBliGamZG/CQX0HlIDYKK5/eISUepvKRyZt4QnVbDhDEVJ3YbEeJDdAJvlR1PW7u87YTzApglY3Z/AZPiejhFx5xYIwz/kq4MurnDYSDhdFqvzBVcKnqXpIZxH3V2DFhOvX889f1EWVo94LizdZ7F5Y77jcpjIXzYA/Im8jbs+Y0MouAseyB6+kOyaizHrFmVBoGpRjiSZGQPz9iDTmuvNId4sxZzJEeg0d3fqnJ113SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvD3jeGriiExsdLpmA1d3qxJiSzzeAZ6QGi0Btb8uoU=;
 b=STF/G+e8fZAiLCcqMimLLXySwerpP95vZIQqq0FrlI8fo3Rr5pSf/lHOwL1UVCAQl/kn5qT59KBfle6F50ZVI6MKx7APvBULK7UqdTgzyUPOeiwXAiZ2D12k78Nkn/IxuveTwnB4taqlQMji5gyy5fKwhN5GizgRvteCVQD6Fxs=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB3294.namprd12.prod.outlook.com (2603:10b6:208:af::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Fri, 3 Apr
 2020 15:47:46 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::5868:c9cf:2687:6e03]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::5868:c9cf:2687:6e03%2]) with mapi id 15.20.2878.014; Fri, 3 Apr 2020
 15:47:46 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Guillaume Tucker <guillaume.tucker@collabora.com>, "Michael J. Ruhl"
 <michael.j.ruhl@intel.com>, Shane Francis <bigbeeshane@gmail.com>
Subject: RE: mainline/master bisection: baseline.login on peach-pi
Thread-Topic: mainline/master bisection: baseline.login on peach-pi
Thread-Index: AQHWCcIY+w6wQ4TFQ0mlStv6l6ZdZqhniaaw
Date: Fri, 3 Apr 2020 15:47:46 +0000
Message-ID: <MN2PR12MB4488D9D3984D03030D3BACC3F7C70@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <5e863110.1c69fb81.17969.099e@mx.google.com>
 <187eeb8e-5c70-4479-d806-a7123f9023c8@collabora.com>
In-Reply-To: <187eeb8e-5c70-4479-d806-a7123f9023c8@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-04-03T15:47:42Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=816c19f6-5eef-47e2-b765-0000181236f6;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-04-03T15:47:42Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 50fb980c-9aaa-4027-bc80-0000fa5bc299
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
x-originating-ip: [172.58.238.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 43f3a013-08c6-45e1-47de-08d7d7e65b04
x-ms-traffictypediagnostic: MN2PR12MB3294:
x-microsoft-antispam-prvs: <MN2PR12MB32942357DB4E470B916CDC41F7C70@MN2PR12MB3294.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0362BF9FDB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(2906002)(71200400001)(4326008)(6506007)(8936002)(53546011)(5660300002)(81156014)(81166006)(186003)(7696005)(33656002)(76116006)(110136005)(45080400002)(66574012)(966005)(478600001)(66946007)(66446008)(86362001)(9686003)(26005)(52536014)(7416002)(55016002)(8676002)(66556008)(316002)(66476007)(64756008)(54906003)(45673001);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZPsaEn0Clrejc2JeH4KUIHXsiOjfSH/4vZndz34jXijoM6bB12UCGRwLeB17G3XALeZ/Hi1CjLFsg8ZmFGcF72fkOSyUcHon3T43KN54aCcuizCeEffYkkxs8eH7RUr6f6wBYmD0ZCTe3i3szR1xZ30/TgkWHQpq50TwAIRuMzRt9wjC/Ublc7vUn/7+U4rKy2avh5v/6RAWaPHehL7qyEFBzAyNBiEDXjVwlPGLblE8iCr1YZHjKhOlSosBEQ7Mk2erIJHWYN5a9jJpOiRRI1tiQ6U3BmlfERVUJCW43xTYK6PNL3poYL6jQcS+s59NJ9+ytVIlJtP0fHu3Yq9eq4Z2Pvu8hKHeFhQhhEDM5qGjTGRT89QZPfWB72l0R/XB1P+g1HsrlJ18M+pm6dwP2LsTcc0bsBl/0TRv0lt1DH8Eu3pDMngr/lp4BR/9Niobcz4havBZvvjOKmUrnHh0nDUGd0c/PWzPo4CNtf4n8URg/91mncJJ1cKECLgvOpRPKc8WRlYOKhD2TrhWXjP56PoCYAZotVDqwsDPSfIPGTWlJTNfrc3DmIKDpQgPR3W8
x-ms-exchange-antispam-messagedata: U6nIxLY1xzkUq/4JsIXfWswsVfIB4xeGGUxvdW/FtkG+/X45w0QI/It8LVkl4zL+RStg4o2W0GLU+uXr7hWkEy53J5vBxBZxXWW05OGihf8HgJrY/+kWLBkeKIVO4Rr03PUBdsAAY9I+ha6FHetioQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f3a013-08c6-45e1-47de-08d7d7e65b04
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2020 15:47:46.4327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IAIxoaQm4Z8kWOLiTEos59qzzK8Q79Aea7yd5MhzWe9issWLAgc1/GNpVUwlKW8+NjAKpa8RoMOc6UDv4Nnj1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3294
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
Cc: Joerg Roedel <jroedel@suse.de>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tom Murphy <murphyt7@tcd.ie>, "kernelci@groups.io" <kernelci@groups.io>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

> -----Original Message-----
> From: Guillaume Tucker <guillaume.tucker@collabora.com>
> Sent: Friday, April 3, 2020 10:14 AM
> To: Michael J. Ruhl <michael.j.ruhl@intel.com>; Shane Francis
> <bigbeeshane@gmail.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Cc: kernelci@groups.io; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org; Tom Murphy <murphyt7@tcd.ie>; Joerg Roedel
> <jroedel@suse.de>; David Airlie <airlied@linux.ie>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Daniel Vetter <daniel@ffwll.ch>;
> Maxime Ripard <mripard@kernel.org>; Enric Balletbo i Serra
> <enric.balletbo@collabora.com>
> Subject: Re: mainline/master bisection: baseline.login on peach-pi
> 
> Please see the bisection report below about a boot failure.
> 
> Reports aren't automatically sent to the public while we're trialing new
> bisection features on kernelci.org but this one looks valid.
> 
> This bisection was run with exynos_defconfig but the issue can also be
> reproduced with multi_v7_defconfig.  It doesn't appear to be affecting any
> other platforms on kernelci.org.  This looks like a DRM driver problem, the
> kernel image boots fine without the modules installed.  It actually started
> failing on Tuesday in mainline.

Fixed with this patch:
https://patchwork.freedesktop.org/patch/359081/
Just trying to get this into 5.7 and stable.  I was waiting for a 5.6 back merge to drm-misc-next-fixes, but I could send it as a separate PR if Dave or Daniel prefer.

Alex


> 
> Guillaume
> 
> On 02/04/2020 19:38, kernelci.org bot wrote:
> > * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> > * This automated bisection report was sent to you on the basis  *
> > * that you may be involved with the breaking commit it has      *
> > * found.  No manual investigation has been done to verify it,   *
> > * and the root cause of the problem may be somewhere else.      *
> > *                                                               *
> > * If you do send a fix, please include this trailer:            *
> > *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> > *                                                               *
> > * Hope this helps!                                              *
> > * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> >
> > mainline/master bisection: baseline.login on peach-pi
> >
> > Summary:
> >   Start:      56a451b780676 Merge tag 'ntb-5.7' of
> git://github.com/jonmason/ntb
> >   Plain log:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fstor
> age.kernelci.org%2F%2Fmainline%2Fmaster%2Fv5.6-3277-
> g56a451b78067%2Farm%2Fexynos_defconfig%2Fgcc-8%2Flab-
> collabora%2Fbaseline-exynos5800-peach-
> pi.txt&amp;data=02%7C01%7Calexander.deucher%40amd.com%7Ca1d322a4
> f72744bfe14208d7d7d9398f%7C3dd8961fe4884e608e11a82d994e183d%7C0%
> 7C0%7C637215200294572061&amp;sdata=pJ%2F8FHi6grBy4aGUuL%2F9%2Bj
> %2FVqrWJfStjBCaDUnBoUMI%3D&amp;reserved=0
> >   HTML log:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fstor
> age.kernelci.org%2F%2Fmainline%2Fmaster%2Fv5.6-3277-
> g56a451b78067%2Farm%2Fexynos_defconfig%2Fgcc-8%2Flab-
> collabora%2Fbaseline-exynos5800-peach-
> pi.html&amp;data=02%7C01%7Calexander.deucher%40amd.com%7Ca1d322
> a4f72744bfe14208d7d7d9398f%7C3dd8961fe4884e608e11a82d994e183d%7C0
> %7C0%7C637215200294572061&amp;sdata=pSoe45cMygTcp0UXe3DY%2F6jeI
> EChQ5FwsPO32A4%2Bhh8%3D&amp;reserved=0
> >   Result:     42e67b479eab6 drm/prime: use dma length macro when
> mapping sg
> >
> > Checks:
> >   revert:     PASS
> >   verify:     PASS
> >
> > Parameters:
> >   Tree:       mainline
> >   URL:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.k
> ernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&
> amp;data=02%7C01%7Calexander.deucher%40amd.com%7Ca1d322a4f72744
> bfe14208d7d7d9398f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7
> C637215200294572061&amp;sdata=MW1XaSNAKSVByF8eOG2%2Bv59Mqjwi
> 7Cu6QaU87AZbka8%3D&amp;reserved=0
> >   Branch:     master
> >   Target:     peach-pi
> >   CPU arch:   arm
> >   Lab:        lab-collabora
> >   Compiler:   gcc-8
> >   Config:     exynos_defconfig
> >   Test case:  baseline.login
> >
> > Breaking commit found:
> >
> > ----------------------------------------------------------------------
> > --------- commit 42e67b479eab6d26459b80b4867298232b0435e7
> > Author: Shane Francis <bigbeeshane@gmail.com>
> > Date:   Wed Mar 25 09:07:39 2020 +0000
> >
> >     drm/prime: use dma length macro when mapping sg
> >
> >     As dma_map_sg can reorganize scatter-gather lists in a
> >     way that can cause some later segments to be empty we should
> >     always use the sg_dma_len macro to fetch the actual length.
> >
> >     This could now be 0 and not need to be mapped to a page or
> >     address array
> >
> >     Fixes: be62dbf554c5 ("iommu/amd: Convert AMD iommu driver to the
> dma-iommu api")
> >     Bug:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugz
> illa.kernel.org%2Fshow_bug.cgi%3Fid%3D206461&amp;data=02%7C01%7Cal
> exander.deucher%40amd.com%7Ca1d322a4f72744bfe14208d7d7d9398f%7C
> 3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637215200294572061&a
> mp;sdata=5qsATa1dvRx7b4cBDTyjFH13Oz6jpZ%2BynQT6QUe6MkI%3D&amp
> ;reserved=0
> >     Bug:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugz
> illa.kernel.org%2Fshow_bug.cgi%3Fid%3D206895&amp;data=02%7C01%7Cal
> exander.deucher%40amd.com%7Ca1d322a4f72744bfe14208d7d7d9398f%7C
> 3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637215200294572061&a
> mp;sdata=hPVjWOqgGd3tpZILyoNJIB%2FrdKGVIbX%2FL5s4GY8M3Gw%3D&
> amp;reserved=0
> >     Bug:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitla
> b.freedesktop.org%2Fdrm%2Famd%2Fissues%2F1056&amp;data=02%7C01%
> 7Calexander.deucher%40amd.com%7Ca1d322a4f72744bfe14208d7d7d9398f
> %7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63721520029457206
> 1&amp;sdata=QKsHmktt0%2F8rez459Fid0mEdMeXUlevTENL9OBMK9qE%3D
> &amp;reserved=0
> >     Signed-off-by: Shane Francis <bigbeeshane@gmail.com>
> >     Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >     Link:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatc
> hwork.freedesktop.org%2Fpatch%2Fmsgid%2F20200325090741.21957-2-
> bigbeeshane%40gmail.com&amp;data=02%7C01%7Calexander.deucher%40a
> md.com%7Ca1d322a4f72744bfe14208d7d7d9398f%7C3dd8961fe4884e608e11
> a82d994e183d%7C0%7C0%7C637215200294572061&amp;sdata=7ZxCW%2BfS
> Kyl0flufyP47iN7nFYn0LTMWeJ3iKk9vm6g%3D&amp;reserved=0
> >     Cc: stable@vger.kernel.org
> >
> > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> > index 86d9b0e45c8c6..1de2cde2277ca 100644
> > --- a/drivers/gpu/drm/drm_prime.c
> > +++ b/drivers/gpu/drm/drm_prime.c
> > @@ -967,7 +967,7 @@ int drm_prime_sg_to_page_addr_arrays(struct
> > sg_table *sgt, struct page **pages,
> >
> >  	index = 0;
> >  	for_each_sg(sgt->sgl, sg, sgt->nents, count) {
> > -		len = sg->length;
> > +		len = sg_dma_len(sg);
> >  		page = sg_page(sg);
> >  		addr = sg_dma_address(sg);
> > ----------------------------------------------------------------------
> > ---------
> >
> >
> > Git bisection log:
> >
> > ----------------------------------------------------------------------
> > ---------
> > git bisect start
> > # good: [8b614cb8f1dcac8ca77cf4dd85f46ef3055f8238] Merge tag
> > '5.6-rc4-smb3-fixes' of git://git.samba.org/sfrench/cifs-2.6
> > git bisect good 8b614cb8f1dcac8ca77cf4dd85f46ef3055f8238
> > # bad: [56a451b780676bc1cdac011735fe2869fa2e9abf] Merge tag 'ntb-5.7'
> > of git://github.com/jonmason/ntb git bisect bad
> > 56a451b780676bc1cdac011735fe2869fa2e9abf
> > # bad: [59838093be51ee9447f6ad05483d697b6fa0368d] Merge tag
> > 'driver-core-5.7-rc1' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
> > git bisect bad 59838093be51ee9447f6ad05483d697b6fa0368d
> > # bad: [32db9f10d52c97ffc407c7dad81c6fafcad730b2] Merge tag
> > 'arm-soc-fixes-5.6' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> > git bisect bad 32db9f10d52c97ffc407c7dad81c6fafcad730b2
> > # good: [78511edc2dd4c7b9f74f3b544093c854b7bd7744] Merge tag
> > 'pm-5.6-rc6' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
> > git bisect good 78511edc2dd4c7b9f74f3b544093c854b7bd7744
> > # good: [76ccd234269bd05debdbc12c96eafe62dd9a6180] Merge branch
> > 'perf-urgent-for-linus' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> > git bisect good 76ccd234269bd05debdbc12c96eafe62dd9a6180
> > # good: [81573b18f26defe672a7d960f9af9ac2c97f324d]
> > selftests/net/forwarding: add Makefile to install tests git bisect
> > good 81573b18f26defe672a7d960f9af9ac2c97f324d
> > # good: [9efcc4a129363187c9bf15338692f107c5c9b6f0] afs: Fix unpinned
> > address list during probing git bisect good
> > 9efcc4a129363187c9bf15338692f107c5c9b6f0
> > # bad: [823846c3107197b6eae9fb656a23e986926d6c07] Merge tag
> > 'riscv-for-linus-5.6' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
> > git bisect bad 823846c3107197b6eae9fb656a23e986926d6c07
> > # bad: [7bf8df68cba0536479aead32297e47908922582c] Merge tag
> > 'drm-fixes-2020-03-27' of git://anongit.freedesktop.org/drm/drm
> > git bisect bad 7bf8df68cba0536479aead32297e47908922582c
> > # good: [fbf66796a0aedbaea248c7ade1459ccd0dd4cb44] Input: move the
> new
> > KEY_SELECTIVE_SCREENSHOT keycode git bisect good
> > fbf66796a0aedbaea248c7ade1459ccd0dd4cb44
> > # bad: [5117c363eb213d5503f5b7e39c9bfafd46388184] Merge tag
> > 'drm-misc-fixes-2020-03-26' of
> > git://anongit.freedesktop.org/drm/drm-misc into drm-fixes git bisect
> > bad 5117c363eb213d5503f5b7e39c9bfafd46388184
> > # bad: [0199172f933342d8b1011aae2054a695c25726f4] drm/amdgpu: fix
> > scatter-gather mapping with user pages git bisect bad
> > 0199172f933342d8b1011aae2054a695c25726f4
> > # bad: [42e67b479eab6d26459b80b4867298232b0435e7] drm/prime: use
> dma
> > length macro when mapping sg git bisect bad
> > 42e67b479eab6d26459b80b4867298232b0435e7
> > # first bad commit: [42e67b479eab6d26459b80b4867298232b0435e7]
> > drm/prime: use dma length macro when mapping sg
> > ----------------------------------------------------------------------
> > ---------
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
