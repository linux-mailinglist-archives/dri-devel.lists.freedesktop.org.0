Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC5F3AAE9F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 10:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F26489857;
	Thu, 17 Jun 2021 08:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D19289857;
 Thu, 17 Jun 2021 08:20:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IaM8VYHZ8MoT8rY45rFLiFU1CB6YC4Vpof1CMGy9AStXKDsptFJscqDo6cma224uB7AaQMYfF17pgs2d85MkM0XR1M6dJGs5pJz/lMINEI4gYWRX5alxhiR38Z+lUcN2BWfO4IFGIgUqIFe0CKnnaQA9VHD7D65fCO2gm0eokSa/pKb9HnSGtMnhOhPHOCBd8c02+yGn1dQH1a0sy9NrCKvhSd5CL7cQh9wqyrZh2Q5+eOcCaqxJDImo9vnKQ1sOlSGzU5UEoiSRSGPNSvncHG5bCCg6Xf+aHC5TP/61JByzXc+9iKgwO1KcQ4ppSzKasryed6LMWZAPJG8u2paq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95WhQAsq2GgBbemOY1gIEsbekS1PtRnaVjwJXT0uuMI=;
 b=OhW9d+yuxtmWHwshlxFj+hdRwv9Y7ihd+XN+uL0T5whtfNByj4lslG2sVFzlJsNAMoPcx/bksc4lNB0zkHEFMhFhVDxkg3b7vBf5dOdJw9N3ERfXm4WteAP8IWdhPfl/f+wVzZjVLNFcPhltDIIhXCylrCiGXaK1K4mJ+QERry3HWK/Z66wbnIvfeVn+3YFPNhGh5EjgvDy0OP2kXdZXamI9nHPhAgBOTb9olKRJ1wvkp3wlA19Nqk/c/7/CjGvQ/VdAGpHXJB64woksIqnt5gSEKOyhn+pKdQjK/C4+n1qmg5J7D/4AS7YwxOCf5m9YTuBnVCQnlYhOJtDxVZX3Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95WhQAsq2GgBbemOY1gIEsbekS1PtRnaVjwJXT0uuMI=;
 b=MrnvF44oaR/AUAYn21K82PVR1T+HmWX8x8TrudB6+uPpfeNBa8YiYcLrn2sb5d03tsFR8k7w14oSLYCtQyOPW3gnvuQY9WfTJdZqjF+NXRM51fQctpjPOfyt21dH5zqNT2Uy2gn6weJt+4zJNCt0jL1ch2vm+yoAFD7NevtONps=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by CO6PR12MB5492.namprd12.prod.outlook.com (2603:10b6:5:35d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Thu, 17 Jun
 2021 08:20:33 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::704a:9f7a:1c8d:db6]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::704a:9f7a:1c8d:db6%4]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 08:20:32 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, =?iso-8859-1?Q?Jos=E9_Roberto_de_Souza?=
 <jose.souza@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/dp_mst: Add missing drm parameters to recently added
 call to drm_dbg_kms()
Thread-Topic: [PATCH] drm/dp_mst: Add missing drm parameters to recently added
 call to drm_dbg_kms()
Thread-Index: AQHXYud+7THo0Bsa2EmLIBnQB+rXx6sXCw4AgADQGKk=
Date: Thu, 17 Jun 2021 08:20:32 +0000
Message-ID: <CO6PR12MB5489B93BAF0D296FDC1BDA79FC0E9@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20210616194415.36926-1-jose.souza@intel.com>,
 <6b5b8d478b3ecb33858c3f55f432178c0917ffb4.camel@redhat.com>
In-Reply-To: <6b5b8d478b3ecb33858c3f55f432178c0917ffb4.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-06-17T08:20:02.518Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: caf38638-c489-4778-ffe0-08d93168c683
x-ms-traffictypediagnostic: CO6PR12MB5492:
x-microsoft-antispam-prvs: <CO6PR12MB5492F3F6865B5F5A0DEBB9FEFC0E9@CO6PR12MB5492.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:261;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D+DDEaLCpgrR8StFYUVm+QNABYYlMG3U52q+uxcKFSSW/s2w/bF1wO7MDVb8Wsb13a/ZS/d0q+dPgfSYg34HV5mS8KY0A8p9NfLekv2AAZGZoihWe/lGEGpRnCQSHfzAbKYuqCCuYTkHF18UFTdGJSFAAD8pcqY/xiOMnq2tXy+YGQ4OPKyoO+Mrh2iqWqgMdK/3BxX88LiipCo4qtpR2TtCVdLJybMrQhzlWTgij7YLNWdhHMUkAUS9Ez9K+UO0/DhNyi7F5i4YnQ4I4Xb5LXQuv+q71Uo1ZjICwozfJTbUecX1tbUqQHGz9PU2NzayjlVIO5jZ4d2o3S+fKdp5VH8gdFDLVIhloJVogP1NNb3kxvWq7MeeYCb57deAGD5gvS7gQ6Idh1WjJvynWMJzYL08FNak7FjvmI1qWgV6QC01AI+TiZvokDjoS/BpImX6MY+0Rarg3LXBK7lIeR7La+h7QulXcYFOExAdtHm3lAX1xjanI9I4o+91QW3IdfjlYbuWtkhyZGbujkB1QElErM4D2P8VXMrvJt+KmBRJl19If8a8NGkFvH0LTGxD5KB4mcal1qacYdV6Ygpl9l6rTdrN4ZZwkfysA+z5V7I32bg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(71200400001)(122000001)(52536014)(478600001)(7696005)(38100700002)(186003)(9686003)(4326008)(55016002)(2906002)(5660300002)(8676002)(33656002)(8936002)(66476007)(91956017)(53546011)(76116006)(316002)(6506007)(86362001)(110136005)(66556008)(64756008)(83380400001)(66946007)(66446008)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sWMzhU2Cjn9nWaK97VcrJrlPkQNS8gH5n1wBb7hvHa0Q3KPef+xa2BgjJ4?=
 =?iso-8859-1?Q?dkfAWy5o4qJD40bNHiZVQF4zD2hP6RTON6GlXfHw9QfWFn6EmgOgE3/MmV?=
 =?iso-8859-1?Q?KxOC8MdhxEhLmZBqE8FiZ74iHIqQev4P5oGvW/UImGiOmYd3nTUhz4+ENY?=
 =?iso-8859-1?Q?tSdEd3NLPHiu6qso7B1Jsl0cqqJypfVsVRBVNG5I5LDANgwK7GoSuV5xe+?=
 =?iso-8859-1?Q?LzPElhAdqkm9sMdKnUDu8EK4zBH9clQFPqjtflliyAm1v+jYbfx4SoGVV1?=
 =?iso-8859-1?Q?6X8wS4NKO70nVqEmVaJ/qDgCcLzktpBA5EljSGZx+NjF89fehRtvLEiiKO?=
 =?iso-8859-1?Q?bEO6CjmFeyv93ymIAuYwr07u1aBqz2fsDOLTI/FvXtZ4ui0ox5TGo3uRPE?=
 =?iso-8859-1?Q?L5EiU5+O+tJi/EwUwJMNYTqZjhQ4tFc0Ej4IiPtg4Xm0JMfsH9DdfjegUE?=
 =?iso-8859-1?Q?BYux5Fo+NTM5AqJEoEBtTuuTKwbJhAjjXnYtLH597fkV1JiJwkber1uJXU?=
 =?iso-8859-1?Q?6ZD7YUrcJFIgZcpMEvfv/HSnx+g08CaydFiPPPGKWTzzhnd0Uw1vyk3W8j?=
 =?iso-8859-1?Q?pluTMe0zsgwgsRs68zeHIcHIoyqzPYp5WarsPkaQiFAtk9KpJtylx+9gf3?=
 =?iso-8859-1?Q?O7aKtVAR3r8eh1B9GczVuV0gOKV4BJpEtrce+oK69sLoY02HYxnDLP7NB8?=
 =?iso-8859-1?Q?LazQcOdiL7LHpoM2l/8qn41rvhDxzq6+gIsVbqSTAwkNBnjixi6DLne5qk?=
 =?iso-8859-1?Q?2fAe/6mq1whLYSfBwOhsyrfXWdaolB58mGueggLjWzJr4SeKHLsuCQ2AdF?=
 =?iso-8859-1?Q?LJNSTua6GJtUGhOGFkwzwmVnVwUamT60v53JYskacAIdqEn1Bu/wPElo8o?=
 =?iso-8859-1?Q?HlsPShwGVawt0lWqp4qIqsf4lKZ3dSdaLUqjNPrktevSsN/FnGZG5PJmxB?=
 =?iso-8859-1?Q?itkNNg7lyIHlGTU9V+Cl34wgyJ6pBbdIuRqibKOxHcjMb8Vt7tSsHA997n?=
 =?iso-8859-1?Q?h9/dkf60vXs5SQF+8+ILzDzxEUrbpl/C1Vcg9zX1vUviFpff1nT5wNATIS?=
 =?iso-8859-1?Q?NwvcCBvKx3c7yK0aEzB2qsb71U57ZG0EBVNeR1OogBfigTIRpSft+6hRF2?=
 =?iso-8859-1?Q?dio+q6vmBeQs7WpS9DlUhTnLe3+XKaYtNKLPXUOzOP16pO8bCDnV5raIOg?=
 =?iso-8859-1?Q?56Lx0RT6+07Gp8P3kS2POYdWWk1fSyBIW5wUOc+BlnapdS9PYDAApCd+K9?=
 =?iso-8859-1?Q?FNwbvRlzmH5CIH2NZ4hPUTA3JTBrTuP1qX52SHd0y6o4wC1PDOK9C/zrjS?=
 =?iso-8859-1?Q?5R7dPWN+ooCm9Q7A1/DrblZGhBxeGuvcHWzFi00uhiyQogc=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf38638-c489-4778-ffe0-08d93168c683
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 08:20:32.3488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e/2t3vUTKDB90BL5QOe/pSGsf9OXJsY5JHaseYFLnAcRrsCsNI1bTK2fY1uXotAYvsAfI+eYlpzSzaF2lBz6Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5492
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Really sorry for the mistake that I made and any inconvenience it brought.
Thanks Jos=E9 and Lyude.

Regards,
Wayne

________________________________________
> From: Lyude Paul <lyude@redhat.com>
> Sent: Thursday, June 17, 2021 03:47
> To: Jos=E9 Roberto de Souza; intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Lin, Wayne
> Subject: Re: [PATCH] drm/dp_mst: Add missing drm parameters to recently a=
dded call to drm_dbg_kms()
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> Will go ahead and push this to drm-misc-next-fixes, thanks
>
> On Wed, 2021-06-16 at 12:44 -0700, Jos=E9 Roberto de Souza wrote:
> > Commit 3769e4c0af5b ("drm/dp_mst: Avoid to mess up payload table by
> > ports in stale topology") added to calls to drm_dbg_kms() but it
> > missed the first parameter, the drm device breaking the build.
> >
> > Fixes: 3769e4c0af5b ("drm/dp_mst: Avoid to mess up payload table by por=
ts in
> > stale topology")
> > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 9ac148efd9e43..ad0795afc21cf 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -3389,7 +3389,9 @@ int drm_dp_update_payload_part1(struct
> > drm_dp_mst_topology_mgr *mgr)
> >                         mutex_unlock(&mgr->lock);
> >
> >                         if (skip) {
> > -                               drm_dbg_kms("Virtual channel %d is not =
in
> > current topology\n", i);
> > +                               drm_dbg_kms(mgr->dev,
> > +                                           "Virtual channel %d is not =
in
> > current topology\n",
> > +                                           i);
> >                                 continue;
> >                         }
> >                         /* Validated ports don't matter if we're releas=
ing
> > @@ -3404,7 +3406,8 @@ int drm_dp_update_payload_part1(struct
> > drm_dp_mst_topology_mgr *mgr)
> >                                                 payload->start_slot =3D
> > req_payload.start_slot;
> >                                                 continue;
> >                                         } else {
> > -                                               drm_dbg_kms("Fail:set
> > payload to invalid sink");
> > +                                               drm_dbg_kms(mgr->dev,
> > +                                                           "Fail:set
> > payload to invalid sink");
> >                                                 mutex_unlock(&mgr-
> > >payload_lock);
> >                                                 return -EINVAL;
> >                                         }
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat

