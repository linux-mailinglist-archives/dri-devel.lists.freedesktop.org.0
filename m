Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20AF784F28
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 05:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7547410E042;
	Wed, 23 Aug 2023 03:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FDF10E042;
 Wed, 23 Aug 2023 03:16:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbU0XBV3LIpfyHksnBUu/bPrI+ZFSv2zo02G9zmAzAl04tBn4zo5tbGxSPFN5FwWz9lW18FkbVqWjhnO8cNi8TSa/6eNO+IgQFZeTizpFIYeMQWYjvkgPbt+gGUFOl1fvsV/NaHNDVcpJ0YiohH/uNCLRWOUEVrtCBZE8RVWxCHQQCZZppa3iqdKw9ubZYLVtpl2b3SFZDMAW+yR+f2wyL2Kkhv7XV9/CaotmZ2HtCWmC9R9zJuVY5O2jO0JLTKxFdpkBIiZOO7Y0dLsx0iC6+JNujooluyarnt4wu/Q2+DBKfzzNqmFxuOZuAIiBOyAVCy2R7YjYDHV6Xw/H5PlFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ly5gWXasdoUBBgrYYaQtuKSVAvfCyC1Vdv0lw2wWO6I=;
 b=CnZz7tPFBM/4q9grBawXuWLr6a2Tj9Lr38DS4P3G1NOQktt9QTx4Ji0H4n36NZ8yq39eYz1sPq8XLXVG6u1UNW7QDePE7UYwW1RfxgVHlZbAdC5nrLO3aeyc+jxrHteL0deAWd4c6HfjcyHsGBDVwCVjFr1qF791whZqAhzk0nme9OVQMf8ezvQzlIk2MWyJWkEu47IwO40s/oqZ23X9jlbY9ceeU/5tKfX0dW1XE4Fe+glHEOd4uOCDl2qjaF8jEbNsP/oksFBdgqqxTC2S/N1kIIGPbxGGczj+i17sTnGXirSZsUItCbLpOqciTtc/kgqBELnQQSCBwTza56DoUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ly5gWXasdoUBBgrYYaQtuKSVAvfCyC1Vdv0lw2wWO6I=;
 b=uecqK77EFqcFDXDvvpd7V3cEB4cNoiayovUjiB8lvNkfCziArJJUCWpXcuM3FqV/Y2QdfFWDSDqBVzUfTR/JkQmZcD22LiT4yAbMWYrJdPda8MWVMMDvvU+WJhJkd9943rjMUkXDmW3gQfkbB+33bzpvn4HG7N/OfGVT5UzZH0Q=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by DS0PR12MB7725.namprd12.prod.outlook.com (2603:10b6:8:136::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Wed, 23 Aug
 2023 03:16:44 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::6c8e:fa7a:2604:da9d]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::6c8e:fa7a:2604:da9d%4]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 03:16:44 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "imre.deak@intel.com" <imre.deak@intel.com>
Subject: RE: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Thread-Topic: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Thread-Index: AQHZxpvrGNhE4HkDQUKz6BD10YkZXK/aRFEAgAPTpQCAAOsxAIAAqq0AgBC8pwCABt6JcA==
Date: Wed, 23 Aug 2023 03:16:44 +0000
Message-ID: <CO6PR12MB5489E92E7A29CA7285602B20FC1CA@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20230804062029.5686-1-Wayne.Lin@amd.com>
 <20230804062029.5686-4-Wayne.Lin@amd.com>
 <ZM0Z3sZEYMcMTnuP@ideak-desk.fi.intel.com>
 <CO6PR12MB5489306FA44F5F107180E57DFC0CA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZNEU8j6OR3KirIcS@ideak-desk.fi.intel.com>
 <CO6PR12MB548978FEE8BE8300F43D4486FC0DA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZN+uWC1fDKZUmDdL@ideak-desk.fi.intel.com>
In-Reply-To: <ZN+uWC1fDKZUmDdL@ideak-desk.fi.intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=17835ad7-32aa-4b95-a525-73ed4629678b;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-23T02:40:03Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|DS0PR12MB7725:EE_
x-ms-office365-filtering-correlation-id: 3b7c070c-8305-4fd1-4760-08dba387611c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XltkABXQzPNeg7oD+4UqC/MZYsvGDXUHQVsdj2A7cZSx0ly7O3VcYa52qpzdousesa20jpjq0XhXB18cL3r3pcF/u99cxQs99wl+mOqPe5Mhw3W3eUinRbwrOPg5iGV1YtXkJcRnZ5rpk+v/UEBoBeRrOiLZxnXTpHwa8f2qxXvOif9o5ucTZtPpcw+0YUkf/1P4YdZhtuKca+jDQqxVY0pfs7VQupOnPqbsB4aClAflvpYVBmnb+KtArfX7eKw0XyQOcla7SlEytT3sM4rS26ENPRt33Lfj4K35N9CmL0HaAONi1bBva1UabvHjZmwzyxM/aNVz6Ax6hoaEJljEtbpyWSGsB7YS+r5pvZ2l+h3LJcpFjRL/zKEMZ874l21iPl87jAOua0FygPXDaFdszioURotI+mGd2yB8xfH1rNrMMUlpTCAhHeNuk54k1FHUacpyBrloDwWbaSjf7phETqSKc9g/qVOLukez9FfYyEsfg+WnUEZyzWcNvUoI5VXXZomKKOKGNQWs5dIo4zeEQ8ddjdxD+gnAQe6I1ibzKeR6Lqo4bBrLrilpRZl+xhWb9fXzUue0UeN9cyTZZRg4OQpQUfi4lfGEqj0S/+TZzNbqFnLPneGqQ30smDoI512I
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(1800799009)(451199024)(186009)(30864003)(2906002)(83380400001)(122000001)(38100700002)(38070700005)(86362001)(33656002)(55016003)(4326008)(55236004)(8676002)(8936002)(53546011)(71200400001)(6506007)(7696005)(66476007)(66946007)(66446008)(64756008)(66556008)(54906003)(76116006)(316002)(6916009)(9686003)(41300700001)(5660300002)(26005)(52536014)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RpDnIsM9rdTUM8A0cvwwFQ5s/7n2/7OVjvOB++7u4ehN3eTYCWAKhsaVKkd8?=
 =?us-ascii?Q?NF0pjP/xLeYAR5N/Eac4Mq0j/J41+nMipSWaN6qlH+zPByJttRIO4ux3yoIs?=
 =?us-ascii?Q?z+JFLUUE+ma37dW7EJ6u53LCrgj76HQsQvYAdz0J3IM0WmESt11E0Q41BMzO?=
 =?us-ascii?Q?vbQ2WAja4LFjX3h0DlZmMSx2ELw7q9Oqt32X37lUsDJz2dZHZNAaehblk6hv?=
 =?us-ascii?Q?AitQ/cbqSyClp3zZAO3MWQeF0Cq0zDN/igQ69xZXE5WsXAWD3eb9RTO29HHj?=
 =?us-ascii?Q?ioEG3ZfYGaGR456+N9QrG4my7m5G8cMWnLi55dClAtqk6Fok0omfcpdlKKVb?=
 =?us-ascii?Q?DfGdRy1TbM7Q0edcbgCNPJpgdNb1PrpzNurc1zv+E9ht8jhLrMLhLVqgySxK?=
 =?us-ascii?Q?uBnU9IV1klYX/JabbBps/uJfbnjQQfsA7/SCF2hSt5AK5Gl6kQMr1PVDTvvo?=
 =?us-ascii?Q?xuvmV9QzaOBrd8n7vr6g2XoTuhU+BMVK1MU6VkGYMx3vKSPwdUBM9vzSvAOD?=
 =?us-ascii?Q?f4HoAOb3+VCJxD+6uJZ7/B3O6ByQQa6V1SK9jaQqLJoZEOe0dehPgv/Gls5E?=
 =?us-ascii?Q?vWHDxLAf+xq6iPlNsy/Y9YXiAnJJELlm724VAWFd7M2RCNqSR7xivvUWSdjd?=
 =?us-ascii?Q?wkXrq3IE2djJygJs3cchnls+phJKIetO4iU7SZCD8GLOpBqCY8241NyI8GXq?=
 =?us-ascii?Q?OuSo6pvd1rHCtikTNNoicqk8Vhe5Ep/4ON99azYx1Q2GFG33TvBSDuN4O+nE?=
 =?us-ascii?Q?6OtFMc8S243F3MH+lFR5pCnBNX8oglcrDTzvCBULKV0RTAhXD7kmtaD8hfNc?=
 =?us-ascii?Q?bUFVN9iu46OPN9VHHiAs2fBIF+94n0lqdz3Di8XljpbkaQNbdbq2waU9y71M?=
 =?us-ascii?Q?gvfEl38FtKHQ7po4d/eJSdlAqBrmVM+7cvfkDKMguwUTRHYf47gHZisnc8Yn?=
 =?us-ascii?Q?i6qakL4AG3ZzgYAV320CGchmIdGT3JtZ7uNY/UzWxHnzCUjmpqTXMfMpD1XU?=
 =?us-ascii?Q?HI4wezghC2haiHDZ11IcqPxkx1I/uPP0rdm7G/y0pW0ZyytkLxxXcLNxGGSr?=
 =?us-ascii?Q?bEcrJX76MlYZx3Ja8MPWU8sFoqJqi4MdESvv0v46OACWdYcRpMxLRJbVUJ8w?=
 =?us-ascii?Q?k7l7ai4WHhREq0rlkhAjqFu477IRKaOJ+KRqRLoaPVZLgIoZFWLg493jRnAC?=
 =?us-ascii?Q?Zn87pFDHf1X1w40s6n9lGG/tiuurm5R7qZGhBsAlOY6lHpQx0x8a404vMSuh?=
 =?us-ascii?Q?q6ieW3vj/B8ydgQHsaw+eoH9wqX2LNfElMv6s+MfB8OU0bYoQpYEa5nCI6CX?=
 =?us-ascii?Q?U5fS/9O/Y2TUxitIwUFySWqrXuo9jsaNUi/zdUAIci/5OuiwWrml15dvFspJ?=
 =?us-ascii?Q?8+v+HqojDtU+pAlo71iXhO3Rkw13YcDlGjEgXGjuo6es+1PKCvX53eAixlnI?=
 =?us-ascii?Q?tr+g58PmnYwK2JeQ0FjJUUGZbfI+9vsMg7+Ulh//b0oH52BTf7/os4Gl0eJz?=
 =?us-ascii?Q?qTnX50IH6ZCuQlbXaxxxtkFohGVeX4VnVvr4Au9OTwkmA0xuh3hdBB/CpUvT?=
 =?us-ascii?Q?E7ZhLEyH3t6v7kxP7hQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7c070c-8305-4fd1-4760-08dba387611c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2023 03:16:44.8063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p6c5P6TEzaeN1LtXD+0hmZqfyKmYAA7tKCpJPJea8Ju0h3FquM0+QhLS4Hwc37qniBA+3BNfVtlrWt/JRC8Mkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7725
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
Cc: "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

> -----Original Message-----
> From: Imre Deak <imre.deak@intel.com>
> Sent: Saturday, August 19, 2023 1:46 AM
> To: Lin, Wayne <Wayne.Lin@amd.com>
> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> lyude@redhat.com; jani.nikula@intel.com; ville.syrjala@linux.intel.com;
> Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> <Jerry.Zuo@amd.com>
> Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> drm_dp_remove_payload_part2()
>
> On Tue, Aug 08, 2023 at 03:47:47AM +0000, Lin, Wayne wrote:
> > [AMD Official Use Only - General]
> >
> > > -----Original Message-----
> > > From: Imre Deak <imre.deak@intel.com>
> > > Sent: Tuesday, August 8, 2023 12:00 AM
> > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> > > lyude@redhat.com; jani.nikula@intel.com;
> > > ville.syrjala@linux.intel.com; Wentland, Harry
> > > <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
> > > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > > drm_dp_remove_payload_part2()
> > >
> > > On Mon, Aug 07, 2023 at 02:43:02AM +0000, Lin, Wayne wrote:
> > > > [AMD Official Use Only - General]
> > > >
> > > > > -----Original Message-----
> > > > > From: Imre Deak <imre.deak@intel.com>
> > > > > Sent: Friday, August 4, 2023 11:32 PM
> > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > Cc: dri-devel@lists.freedesktop.org;
> > > > > amd-gfx@lists.freedesktop.org; lyude@redhat.com;
> > > > > jani.nikula@intel.com; ville.syrjala@linux.intel.com; Wentland,
> > > > > Harry <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
> > > > > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > > > > drm_dp_remove_payload_part2()
> > > > >
> > > > > On Fri, Aug 04, 2023 at 02:20:29PM +0800, Wayne Lin wrote:
> > > > > > [...]
> > > > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > index e04f87ff755a..4270178f95f6 100644
> > > > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > @@ -3382,8 +3382,7 @@
> > > > > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > > > > >   * drm_dp_remove_payload_part2() - Remove an MST payload
> locally
> > > > > >   * @mgr: Manager to use.
> > > > > >   * @mst_state: The MST atomic state
> > > > > > - * @old_payload: The payload with its old state
> > > > > > - * @new_payload: The payload with its latest state
> > > > > > + * @payload: The payload with its latest state
> > > > > >   *
> > > > > >   * Updates the starting time slots of all other payloads
> > > > > > which would have
> > > > > been shifted towards
> > > > > >   * the start of the payload ID table as a result of removing
> > > > > > a payload. Driver should call this @@ -3392,25 +3391,36 @@
> > > > > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > > > > >   */
> > > > > >  void drm_dp_remove_payload_part2(struct
> > > drm_dp_mst_topology_mgr
> > > > > *mgr,
> > > > > >                              struct drm_dp_mst_topology_state
> > > > > *mst_state,
> > > > > > -                            const struct drm_dp_mst_atomic_pay=
load
> > > > > *old_payload,
> > > > > > -                            struct drm_dp_mst_atomic_payload
> > > > > *new_payload)
> > > > > > +                            struct drm_dp_mst_atomic_payload
> > > > > *payload)
> > > > > >  {
> > > > > >     struct drm_dp_mst_atomic_payload *pos;
> > > > > > +   u8 time_slots_to_remove;
> > > > > > +   u8 next_payload_vc_start =3D mgr->next_start_slot;
> > > > > > +
> > > > > > +   /* Find the current allocated time slot number of the paylo=
ad */
> > > > > > +   list_for_each_entry(pos, &mst_state->payloads, next) {
> > > > > > +           if (pos !=3D payload &&
> > > > > > +               pos->vc_start_slot > payload->vc_start_slot &&
> > > > > > +               pos->vc_start_slot < next_payload_vc_start)
> > > > > > +                   next_payload_vc_start =3D pos->vc_start_slo=
t;
> > > > > > +   }
> > > > > > +
> > > > > > +   time_slots_to_remove =3D next_payload_vc_start -
> > > > > > +payload->vc_start_slot;
> > > > >
> > > > > Imo, the intuitive way would be to pass the old payload state to
> > > > > this function - which already contains the required time_slots
> > > > > param
> > > > > - and refactor things instead moving vc_start_slot from the
> > > > > payload state to mgr suggested by Ville earlier.
> > > > >
> > > > > --Imre
> > > >
> > > > Hi Imre,
> > > > Thanks for your feedback!
> > > >
> > > > I understand it's functionally correct. But IMHO, it's still a bit
> > > > conceptually different between the time slot in old state and the
> > > > time slot in current payload table. My thought is the time slot at
> > > > the moment when we are removing the payload would be a better
> choice.
> > >
> > > Yes, they are different. The old state contains the time slot the
> > > payload was added with in a preceding commit and so the time slot
> > > value which should be used when removing the same payload in the
> current commit.
> > >
> > > The new state contains a time slot value with which the payload will
> > > be added in the current commit and can be different than the one in
> > > the old state if the current commit has changed the payload size
> > > (meaning that the same atomic commit will first remove the payload
> > > using the time slot value in the old state and afterwards will add
> > > back the same payload using the time slot value in the new state).
> > >
> > Appreciate your time, Imre!
> >
> > Yes I understand, so I'm not using the number of the time slot in the n=
ew
> state.
> > I'm referring to the start slot instead which is updated during every
> > allocation and removement at current commit.
> >
> > Like what you said, current commit manipulation could be a mix of
> > allocations and removements for the payload. My thought is,
> > conceptually, looking up the latest number of time slot is a better cho=
ice
> rather than the one in old state.
> > It's relatively intuitive to me since we are removing payload from
> > current payload table and which changes since last preceding commit
> > till the moment we're deleting the payload. Although it's unreasonable
> > that these values are different.
> >
> > > > And with this, we can also simplify some codes. Especially remove
> > > > workaround in amd driver. In fact, DRM mst code maintains the
> > > > payload table and all the time slot info is in it already. We
> > > > don't really have to pass a new parameter.
> > >
> > > I agree that drm_dp_remove_payload() could be simplified, but this
> > > should be done so that the drivers can pass the old payload state to
> > > it (without having to pass the new state). This would be possible if
> > > vc_start_slot was not tracked in the payload state (which is really
> > > not an atomic state that can be precomputed as all other atomic
> > > state), rather it would be tracked in struct drm_dp_mst_topology_mgr.
> > >
> >
> > So the reason I chose to pass the new state is like what I mentioned
> > above. I would prefer to carry the latest updated payload table
> > instead which is in the new state. And I agree with the explanation
> > for the vc_start_slot and that's also my thought at the beginning. It
> > could be a refactor later, but no matter the start slot is put into
> > payload state or the topology manager I would prefer to refer to the la=
test
> payload table rather than the number of time slot in the old state.
> >
> > > It looks like AMD has to reconstruct the old state in
> > > dm_helpers_construct_old_payload(). Could you explain why it
> > > couldn't instead just pass old_payload acquired by
> > >
> > > old_mst_state =3D drm_atomic_get_old_mst_topology_state();
> > > old_payload =3D drm_atomic_get_mst_payload_state(old_mst_state);
> > >
> > > ?
> >
> > AMD doesn't pass the drm old state to the stage while HW is deleting
> > the payload.  The reason is that HW payload table is known during HW
> > programming procedure, so the payload removement is based on the table
> > at the moment.
> >
> > AMD expected the current number of time slot is also already
> > maintained in drm layer.
>
> Yes, both of the above are maintained by the drm layer, but it also means=
 it
> doesn't really need to recalculate time_slots_to_remove as done in this p=
atch,
> since that info is already available in the old payload state.
>
> Afaics the AMD driver calls properly
>
> drm_atomic_helper_commit() -> drm_atomic_helper_swap_state()
>
> after a commit, so that all the payloads it added should be tracked now a=
s the
> old payload state.
>
> So could you confirm what is the old_payload->time_slots value (which you
> get with the above functions) at the point of removing this payload and i=
f it's
> not the time_slots value this same payload was actually added with previo=
usly,
> why this is so (via some example sequence)?
>
> Thanks.

Hi Imre,
I'm not saying that the time_slots carried in the old state is wrong within=
 amd driver.
But just amd driver doesn't carry the drm state to the step when it's remov=
ing the
payload, since the info is already in its hardware and drm used to maintain=
 the info
in the drm layer. So the patch is trying to get the behavior of this helper=
 function
back to what it used to be.

And the main reason that I want to change the pass in parameter is like wha=
t I
mentioned previously. The commit manipulation could be a mix of allocations=
 and
removements for the payload. And in the spec, it also introduces examples t=
o reduce
or increase the payload allocation. Although we're not using reduction/incr=
ement
today, it implicitly imposes the limitation to use them before calling the =
removement
helper function with the old state as the passed in parameter. So I also wa=
nt to remove
the dependency by this patch. Would like to know your thoughts about this.

Thanks, Imre!

>
> > Again, thanks for your feedback Imre!
> >
> > >
> > > > > >     /* Remove local payload allocation */
> > > > > >     list_for_each_entry(pos, &mst_state->payloads, next) {
> > > > > > -           if (pos !=3D new_payload && pos->vc_start_slot > ne=
w_payload-
> > > > > >vc_start_slot)
> > > > > > -                   pos->vc_start_slot -=3D old_payload->time_s=
lots;
> > > > > > +           if (pos !=3D payload && pos->vc_start_slot >
> > > > > > + payload-
> > > > > >vc_start_slot)
> > > > > > +                   pos->vc_start_slot -=3D
> > > > > > + time_slots_to_remove;
> > > > > >     }
> > > > > > -   new_payload->vc_start_slot =3D -1;
> > > > > > +   payload->vc_start_slot =3D -1;
> > > > > >
> > > > > >     mgr->payload_count--;
> > > > > > -   mgr->next_start_slot -=3D old_payload->time_slots;
> > > > > > +   mgr->next_start_slot -=3D time_slots_to_remove;
> > > > > >
> > > > > > -   if (new_payload->delete)
> > > > > > -           drm_dp_mst_put_port_malloc(new_payload->port);
> > > > > > +   if (payload->delete)
> > > > > > +           drm_dp_mst_put_port_malloc(payload->port);
> > > > > >
> > > > > > -   new_payload->payload_allocation_status =3D
> > > > > DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > > > > > +   payload->payload_allocation_status =3D
> > > > > > +DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > > > > >  }
> > > >
> > > > --
> > > > Regards,
> > > > Wayne
> >
> > --
> > Regards,
> > Wayne
--
Regards,
Wayne
