Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5949A796F60
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 05:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AFC10E03A;
	Thu,  7 Sep 2023 03:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F31010E03A;
 Thu,  7 Sep 2023 03:44:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaKbu7Svn9i718h8HvPuaSNoEX0q/seA2NVEYEdb5U3hfXJRUPyOLoTaZyvBnVxdUuqUDd2onsn05Xi/FZqklrqqrAaXnPJojxUWFmap249SaM6+1O+i37HhZeFvBRv889PffT3GVlPRL1mVGO2+pWPJfpfmwnPJ2NZhxCNajFJ4bCz4Vr/uoKEQnQPzvnp7hI0Jyow8yNcsu9GMGu8HvF4+dQW7DgeYcv9RxuSi+tgdnvYlZ8XtuajWZFfb7NtU/yOTTTJpqN17sGo7do/3iCflKsIX1RJGvu4YL7gcNsANEjt+e6r1NBFxF+htnK/MIfQXzvC13jjDO1eBxPyysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2y+CJEUn66jfSc65lucZbwvD1+zjj1uhrtBfbA1LCbM=;
 b=O/t6EqCeKwAoV5VUrVHZukjKa7LEiDkMYezaemKAWCXyyJQRXBOxq0krCiEg3VcfAFTtTpGxhcyfk7GjJAy5EmGn1yKBS1qCYSKkvIhqfmhRH8m1Lqkf4+7XXTNDWuX+9zK94lDXFQXlznjWd2dJcKJ3ZnbcRLRV5dtkW71eDBIxZBKuG9AH9S0V1u5BuJQMzGNy/JIYQI8TS2fZNuy061TGYASIBAuQ/YzQkRluIMBUbHaU167m/WcLYweM9h3DLGumi2lBqGGjIPQBA86iCcgZTOS6ogCsTysD11kwrBkq9UWaFL4kXQwU/ZOFcmynttddFZsprCQ5nlTTd/4YEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2y+CJEUn66jfSc65lucZbwvD1+zjj1uhrtBfbA1LCbM=;
 b=AchWwpJRv78I6+VLdM3fTEsW2+lXZgrntf8Mo3oMtEfmJ521iuKAEcUvrG/0vpKhbgkMsZ1215A1Y2iFFwrccBgtSRnukQ486cAfQ4wE5BsEB2pH7jHmmHahr3IttkwxK7QAz/ev4jCG2tz5459B/v3em2tdyejQRDM4rod3FzY=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by CY5PR12MB6276.namprd12.prod.outlook.com (2603:10b6:930:f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Thu, 7 Sep
 2023 03:44:39 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::fd43:1117:583:d37a]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::fd43:1117:583:d37a%3]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 03:44:39 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "imre.deak@intel.com" <imre.deak@intel.com>
Subject: RE: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Thread-Topic: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Thread-Index: AQHZxpvrGNhE4HkDQUKz6BD10YkZXK/aRFEAgAPTpQCAAOsxAIAAqq0AgBC8pwCABt6JcIAD4XUAgBO5wdA=
Date: Thu, 7 Sep 2023 03:44:39 +0000
Message-ID: <CO6PR12MB5489FC7230B9D400EEF5735CFCEEA@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20230804062029.5686-1-Wayne.Lin@amd.com>
 <20230804062029.5686-4-Wayne.Lin@amd.com>
 <ZM0Z3sZEYMcMTnuP@ideak-desk.fi.intel.com>
 <CO6PR12MB5489306FA44F5F107180E57DFC0CA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZNEU8j6OR3KirIcS@ideak-desk.fi.intel.com>
 <CO6PR12MB548978FEE8BE8300F43D4486FC0DA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZN+uWC1fDKZUmDdL@ideak-desk.fi.intel.com>
 <CO6PR12MB5489E92E7A29CA7285602B20FC1CA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZOiywboCeFxJwCCP@ideak-desk.fi.intel.com>
In-Reply-To: <ZOiywboCeFxJwCCP@ideak-desk.fi.intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=065dc13f-714d-4147-895b-9c6dd8a00110;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-09-07T03:09:32Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|CY5PR12MB6276:EE_
x-ms-office365-filtering-correlation-id: 112d7159-b586-4569-34bf-08dbaf54c367
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 41k0k4COrIPuhnudDPh4extLJ/9YxtbXwqxXoDvJAvmWMYDrhyqUVrH5Nz0NmeZ5DMU6RmGt5ytI4jDVQSgHoD4dIp3L1iFwsKbUa2U3g1QIHgSD6pTk//yKjmunh6DJ1QHqZg9vEeOAANx6utZORQvmI2YVEk9m8R6ZLU3ArEKZxinqPTVqNfhCZOt5Qzhrh7qi0L8tBhsurZPb1m3doTffwdKZDHJ61oHLBIk/sTYLODrQ8Jn3Z1nIfcBhDrIqrqU8nY5WnxytJOq6k3k8IwhIHMGsOOaG/BS3KiFzm+KkXima68m6eRMprpTrxiCJwJSVC1YFfTfNy1MqOEBQEJpzVvsOy0AM/E0heafT8a+VPe4GVgPs5jFfQ3BB7AG6vMTwfTAp9Ml5NHlBRjOF6d9KYWqHIqkDBoHaUi2KjFtUAAH/G/XszRbQ4n73vdF6Fpbb4o9C4n3iKprAJnljtx6r94ZpnIrUCMLH3ve4rQNjrqfFFVXHxHhu1ag3yyrvF03kcTs6mk/llh9OVRegCj2hsVCe98tanPOqaIJEiPe2uN8+JOPupX/4AIiXLrc9X/S19XneRN503csLp9owxEW6fSWWWfIoL28iG3gztGepWv5bbGE8fvOmOBzmvLGK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(136003)(346002)(376002)(186009)(451199024)(1800799009)(55016003)(83380400001)(71200400001)(26005)(54906003)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(316002)(6916009)(52536014)(4326008)(8676002)(8936002)(41300700001)(5660300002)(53546011)(6506007)(7696005)(9686003)(2906002)(30864003)(478600001)(33656002)(86362001)(122000001)(38070700005)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TFR4iMQ8nYxkqhmq/XdpkGqN4YVxkQoQLqfqGAwAl54FPcAkdLyOB0mZZ4Ce?=
 =?us-ascii?Q?cNaCLqL5CDBoCkCpINxmJmoUQhqftiFyHvTWy1nzT9SPD5vNPjXSgBRSYjVF?=
 =?us-ascii?Q?+FeE+t9D/jzCTvD23dDwDYUQ7obegUflMYWtoaPuHXloyhPVHzQjem0WGRg6?=
 =?us-ascii?Q?nx2pOjI+kRBaGvnlzFG6DnhkLTSQXWg69OJN80A7q6FBoL44ToQR+TWDkiB4?=
 =?us-ascii?Q?VHG1EwKdiykIW0zIAfv3tUx8DqEXgkz7uCnvrf6w3SiYzpWRq0E0qqD4hS/W?=
 =?us-ascii?Q?5G3SnH+NhBPffEVHSUgf3/QOx+3GGBq0mONfQqW8E0OMnlG7sKTApfktptq/?=
 =?us-ascii?Q?o+2AhavGdzNKG7n7wzU1OerMd9RIZIiLiFAvuyV5QnX88SsBrh+qDxvIXgiB?=
 =?us-ascii?Q?DTJg2LQIxAUqFJPTJc+ULhGYnX7YWfgSAtPGkGT4hlh7C0JAv4CFYmd9q1fm?=
 =?us-ascii?Q?SE9XurxtIvryr+pINSdkAr28W1WwXKSEl1bVbY2CZ0AVgTrT8en0UoXYR6Xb?=
 =?us-ascii?Q?ToCoZlMllwMHbmifMxUGEZm/VYrfXMEBXnQ44RBdK4x4M+Q6y7BKJ5XcBGNM?=
 =?us-ascii?Q?55O0lXjODDfzerDkLN2TdeKb1KobU73+bv5P84c2TIBlDP5Wm91qCpiM8UVa?=
 =?us-ascii?Q?W1W7JD+fuum9kD8PsbP5PiZr3WGOhAdDGAieAUiPIh+Oe8uBnFF7lgpOGKOj?=
 =?us-ascii?Q?wk6iLDniHu6rKyMYQ/kSJ6LCai57qzTgHIH8NXGKe8ECmyQqsmvOIFVsYlmB?=
 =?us-ascii?Q?fUbjKtiUgHBI1SjDam+merY5Xn/rjyWdqEUtaJ6dNDl9ZSaAYbP4ejfRlmvH?=
 =?us-ascii?Q?6xhdye6/DtXmNhNFfsHuqhNH95W5iXg9E9ER31oWALgxgd6taGngsCZddKse?=
 =?us-ascii?Q?HgUIgzOBY7cbG7WiC3V+m0DFU8l8B8axWKeBwtiRhPv2BU4Y+CYDT1Z30+0M?=
 =?us-ascii?Q?RG/467CVE95FhdP7dZV3PFfScAlclCIGp0Rp+1CrnohxyiKnR64eTLxL4dFJ?=
 =?us-ascii?Q?pQ8ldHIVwP9HmKcQNfBsdIEAX/II8/O+W4NbEG1gIsn1ud3I0Rznd48mTFXS?=
 =?us-ascii?Q?qZWGnBo23A1E36umi+TJw4g6vuqVGqANGDwqisN0Ny9Nl+CYuVIFhSIxBB3j?=
 =?us-ascii?Q?Q/pHLGM1Gh20ubpiA6PKOPzfDk6R6G7o2lE+YRa66rPd8jBOnyhfrzn12gMd?=
 =?us-ascii?Q?ZLFfljvWUj0Mud/LbqKieqyFrQtN7Mr/8E0TjOYvY3oDl8v+4Fh/U5mnHtdC?=
 =?us-ascii?Q?aDFNUL2Qn2NTHSvflYZzgBad6CuWOnFv6aetumKYk+pyYIVhtsaBgXIbVrLx?=
 =?us-ascii?Q?Uitv565YexdMFAu6cHtpQx20AZt+K8cU78UXhcy1qfm3S0AOG8lbW6cKTm/I?=
 =?us-ascii?Q?FNdHuF+pftxHUpWXiTS3a6e8G+RfVx2YH1MfrT1GTIqkN670PxF4rti19fhp?=
 =?us-ascii?Q?j/6xqS5LUGHLFJmPPWLT14vHp8cenmXeKU1vu+vZNde6pZJJZDLl3bDzpQ1z?=
 =?us-ascii?Q?HZOSNR7JnByJ4E4KxWLraR9WUmg5jJ0TREK1azWwcBuGBlY/aBkt0qbGDdjH?=
 =?us-ascii?Q?ilKDdToACIvr2mjjBY0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112d7159-b586-4569-34bf-08dbaf54c367
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2023 03:44:39.3485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2FDvRBf/8u6s9/Gw+DLxp9lWUWzYTu5gfLuoIalaAm6Cq64cx9w4T1htQ/LtDI0q7b+Dm9IRzA6NX+bVz7LLnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6276
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
> Sent: Friday, August 25, 2023 9:56 PM
> To: Lin, Wayne <Wayne.Lin@amd.com>
> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> lyude@redhat.com; jani.nikula@intel.com; ville.syrjala@linux.intel.com;
> Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> <Jerry.Zuo@amd.com>
> Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> drm_dp_remove_payload_part2()
>
> On Wed, Aug 23, 2023 at 03:16:44AM +0000, Lin, Wayne wrote:
> > [AMD Official Use Only - General]
> >
> > > -----Original Message-----
> > > From: Imre Deak <imre.deak@intel.com>
> > > Sent: Saturday, August 19, 2023 1:46 AM
> > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> > > lyude@redhat.com; jani.nikula@intel.com;
> > > ville.syrjala@linux.intel.com; Wentland, Harry
> > > <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
> > > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > > drm_dp_remove_payload_part2()
> > >
> > > On Tue, Aug 08, 2023 at 03:47:47AM +0000, Lin, Wayne wrote:
> > > > [AMD Official Use Only - General]
> > > >
> > > > > -----Original Message-----
> > > > > From: Imre Deak <imre.deak@intel.com>
> > > > > Sent: Tuesday, August 8, 2023 12:00 AM
> > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > Cc: dri-devel@lists.freedesktop.org;
> > > > > amd-gfx@lists.freedesktop.org; lyude@redhat.com;
> > > > > jani.nikula@intel.com; ville.syrjala@linux.intel.com; Wentland,
> > > > > Harry <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
> > > > > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > > > > drm_dp_remove_payload_part2()
> > > > >
> > > > > On Mon, Aug 07, 2023 at 02:43:02AM +0000, Lin, Wayne wrote:
> > > > > > [AMD Official Use Only - General]
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Imre Deak <imre.deak@intel.com>
> > > > > > > Sent: Friday, August 4, 2023 11:32 PM
> > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > Cc: dri-devel@lists.freedesktop.org;
> > > > > > > amd-gfx@lists.freedesktop.org; lyude@redhat.com;
> > > > > > > jani.nikula@intel.com; ville.syrjala@linux.intel.com;
> > > > > > > Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> > > > > > > <Jerry.Zuo@amd.com>
> > > > > > > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > > > > > > drm_dp_remove_payload_part2()
> > > > > > >
> > > > > > > On Fri, Aug 04, 2023 at 02:20:29PM +0800, Wayne Lin wrote:
> > > > > > > > [...]
> > > > > > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > > index e04f87ff755a..4270178f95f6 100644
> > > > > > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > > @@ -3382,8 +3382,7 @@
> > > > > > > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > > > > > > >   * drm_dp_remove_payload_part2() - Remove an MST payload
> > > locally
> > > > > > > >   * @mgr: Manager to use.
> > > > > > > >   * @mst_state: The MST atomic state
> > > > > > > > - * @old_payload: The payload with its old state
> > > > > > > > - * @new_payload: The payload with its latest state
> > > > > > > > + * @payload: The payload with its latest state
> > > > > > > >   *
> > > > > > > >   * Updates the starting time slots of all other payloads
> > > > > > > > which would have
> > > > > > > been shifted towards
> > > > > > > >   * the start of the payload ID table as a result of
> > > > > > > > removing a payload. Driver should call this @@ -3392,25
> > > > > > > > +3391,36 @@
> > > > > > > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > > > > > > >   */
> > > > > > > >  void drm_dp_remove_payload_part2(struct
> > > > > drm_dp_mst_topology_mgr
> > > > > > > *mgr,
> > > > > > > >                              struct
> > > > > > > > drm_dp_mst_topology_state
> > > > > > > *mst_state,
> > > > > > > > -                            const struct drm_dp_mst_atomic=
_payload
> > > > > > > *old_payload,
> > > > > > > > -                            struct drm_dp_mst_atomic_paylo=
ad
> > > > > > > *new_payload)
> > > > > > > > +                            struct
> > > > > > > > + drm_dp_mst_atomic_payload
> > > > > > > *payload)
> > > > > > > >  {
> > > > > > > >     struct drm_dp_mst_atomic_payload *pos;
> > > > > > > > +   u8 time_slots_to_remove;
> > > > > > > > +   u8 next_payload_vc_start =3D mgr->next_start_slot;
> > > > > > > > +
> > > > > > > > +   /* Find the current allocated time slot number of the p=
ayload */
> > > > > > > > +   list_for_each_entry(pos, &mst_state->payloads, next) {
> > > > > > > > +           if (pos !=3D payload &&
> > > > > > > > +               pos->vc_start_slot > payload->vc_start_slot=
 &&
> > > > > > > > +               pos->vc_start_slot < next_payload_vc_start)
> > > > > > > > +                   next_payload_vc_start =3D pos->vc_start=
_slot;
> > > > > > > > +   }
> > > > > > > > +
> > > > > > > > +   time_slots_to_remove =3D next_payload_vc_start -
> > > > > > > > +payload->vc_start_slot;
> > > > > > >
> > > > > > > Imo, the intuitive way would be to pass the old payload
> > > > > > > state to this function - which already contains the required
> > > > > > > time_slots param
> > > > > > > - and refactor things instead moving vc_start_slot from the
> > > > > > > payload state to mgr suggested by Ville earlier.
> > > > > > >
> > > > > > > --Imre
> > > > > >
> > > > > > Hi Imre,
> > > > > > Thanks for your feedback!
> > > > > >
> > > > > > I understand it's functionally correct. But IMHO, it's still a
> > > > > > bit conceptually different between the time slot in old state
> > > > > > and the time slot in current payload table. My thought is the
> > > > > > time slot at the moment when we are removing the payload would
> > > > > > be a better
> > > choice.
> > > > >
> > > > > Yes, they are different. The old state contains the time slot
> > > > > the payload was added with in a preceding commit and so the time
> > > > > slot value which should be used when removing the same payload
> > > > > in the
> > > current commit.
> > > > >
> > > > > The new state contains a time slot value with which the payload
> > > > > will be added in the current commit and can be different than
> > > > > the one in the old state if the current commit has changed the
> > > > > payload size (meaning that the same atomic commit will first
> > > > > remove the payload using the time slot value in the old state
> > > > > and afterwards will add back the same payload using the time slot=
 value
> in the new state).
> > > > >
> > > > Appreciate your time, Imre!
> > > >
> > > > Yes I understand, so I'm not using the number of the time slot in
> > > > the new
> > > state.
> > > > I'm referring to the start slot instead which is updated during
> > > > every allocation and removement at current commit.
> > > >
> > > > Like what you said, current commit manipulation could be a mix of
> > > > allocations and removements for the payload. My thought is,
> > > > conceptually, looking up the latest number of time slot is a
> > > > better choice
> > > rather than the one in old state.
> > > > It's relatively intuitive to me since we are removing payload from
> > > > current payload table and which changes since last preceding
> > > > commit till the moment we're deleting the payload. Although it's
> > > > unreasonable that these values are different.
> > > >
> > > > > > And with this, we can also simplify some codes. Especially
> > > > > > remove workaround in amd driver. In fact, DRM mst code
> > > > > > maintains the payload table and all the time slot info is in
> > > > > > it already. We don't really have to pass a new parameter.
> > > > >
> > > > > I agree that drm_dp_remove_payload() could be simplified, but
> > > > > this should be done so that the drivers can pass the old payload
> > > > > state to it (without having to pass the new state). This would
> > > > > be possible if vc_start_slot was not tracked in the payload
> > > > > state (which is really not an atomic state that can be
> > > > > precomputed as all other atomic state), rather it would be tracke=
d in
> struct drm_dp_mst_topology_mgr.
> > > > >
> > > >
> > > > So the reason I chose to pass the new state is like what I
> > > > mentioned above. I would prefer to carry the latest updated
> > > > payload table instead which is in the new state. And I agree with
> > > > the explanation for the vc_start_slot and that's also my thought
> > > > at the beginning. It could be a refactor later, but no matter the
> > > > start slot is put into payload state or the topology manager I
> > > > would prefer to refer to the latest
> > > payload table rather than the number of time slot in the old state.
> > > >
> > > > > It looks like AMD has to reconstruct the old state in
> > > > > dm_helpers_construct_old_payload(). Could you explain why it
> > > > > couldn't instead just pass old_payload acquired by
> > > > >
> > > > > old_mst_state =3D drm_atomic_get_old_mst_topology_state();
> > > > > old_payload =3D drm_atomic_get_mst_payload_state(old_mst_state);
> > > > >
> > > > > ?
> > > >
> > > > AMD doesn't pass the drm old state to the stage while HW is
> > > > deleting the payload.  The reason is that HW payload table is
> > > > known during HW programming procedure, so the payload removement
> > > > is based on the table at the moment.
> > > >
> > > > AMD expected the current number of time slot is also already
> > > > maintained in drm layer.
> > >
> > > Yes, both of the above are maintained by the drm layer, but it also
> > > means it doesn't really need to recalculate time_slots_to_remove as
> > > done in this patch, since that info is already available in the old p=
ayload
> state.
> > >
> > > Afaics the AMD driver calls properly
> > >
> > > drm_atomic_helper_commit() -> drm_atomic_helper_swap_state()
> > >
> > > after a commit, so that all the payloads it added should be tracked
> > > now as the old payload state.
> > >
> > > So could you confirm what is the old_payload->time_slots value
> > > (which you get with the above functions) at the point of removing
> > > this payload and if it's not the time_slots value this same payload
> > > was actually added with previously, why this is so (via some example
> sequence)?
> > >
> > > Thanks.
> >
> > Hi Imre,
> > I'm not saying that the time_slots carried in the old state is wrong wi=
thin
> amd driver.
> > But just amd driver doesn't carry the drm state to the step when it's
> > removing the payload, since the info is already in its hardware and
> > drm used to maintain the info in the drm layer.
>
> Hm, in
>
> dm_helpers_dp_mst_write_payload_allocation_table()
>
> the
>
> mst_state =3D to_drm_dp_mst_topology_state(mst_mgr->base.state);
>
> used as the new state doesn't look ok to me. The above is the MST object'=
s
> current SW state after an atomic commit/swap, but this isn't the new stat=
e a
> driver should program to the HW or pass to the drm helper functions. The
> object's current state could be ahead of what the driver should program t=
o the
> HW, if the driver properly implements commit pipelining (so at the point
> you're programming a state you'd have already future commits computed and
> queued up, each queued-up commit with its own state).
>
> So instead of the above mst_state the driver should pass down the
> drm_atomic_state to dm_helpers_dp_mst_write_payload_allocation_table()
> which should use that instead to get the MST state it should program or p=
ass
> to the drm layer.
>
> > So the patch is trying to get the behavior of this helper function
> > back to what it used to be.
>
> The behavior before was actually broken and one reason for that was a
> confusion about what's stored in the new payload state. It's a mixture of
> old/current state (vc_start_slot) and new state (time_slots). So I don't =
think
> it's a good idea to add even more dependency on this semantic.
>
> I think the right solution for what this patch is about - remove the need=
 for
> dm_helpers_construct_old_payload(), would be to pass down
> drm_atomic_state to
> dm_helpers_dp_mst_write_payload_allocation_table()
> based on the above.
>
> > And the main reason that I want to change the pass in parameter is
> > like what I mentioned previously. The commit manipulation could be a
> > mix of allocations and removements for the payload. And in the spec,
> > it also introduces examples to reduce or increase the payload
> > allocation. Although we're not using reduction/increment today, it
> > implicitly imposes the limitation to use them before calling the
> > removement helper function with the old state as the passed in
> > parameter. So I also want to remove the dependency by this patch.
> > Would like to know your thoughts about this.
>
> It's not clear what would be the benefit of changing a payload without
> removing it first. In any case, I think the right direction for the drive=
r would be
> to meet the requirement to use the proper atomic state with the drm helpe=
r
> functions (not the object's current SW state) as described above.

Hi Imre,

Thanks for pointing that out and that was also one of my plan to refactor! =
But I
would take that as another patch to follow up and would like to align with =
you
the idea for this helper function itself more.

My concern is referring to the old state to remove the time slot is just no=
t generic
right for what the helper function shall accomplish. Even it doesn't bring =
benefit
as you see, having old state as the input imposes limitation to drivers usi=
ng it which
is the downside that it brought. The limitation is like what I tried to exp=
lain before.
For an instance, if one driver has compressed streams allocated in the prev=
ious
commit and wants to disable these streams at the current commit. It handles=
 and
accomplishes the commit into two steps that firstly to disable dsc engine o=
nly
(which increases the time slot), and next disable the streams. Under this d=
esign,
the old state can't represent the exact number of time slot that it want's =
to remove
at the moment. For this case, I don't think drm_dp_remove_payload_part2 sho=
uld
block the driver to use it since the driver doesn't do things wrong.  Conve=
rsely, it's
due to the helper function constrains the driver to use an inappropriate in=
put.

And with or without my patch, the current payload allocation table (i.e. vc=
_start_slot
In new state) and the time slot that this new state is going to set (i.e. t=
ime_slots in
new state) are already both in the new state. I think the patch doesn't add=
 irrelevant
input for removing a payload as this helper function should do, because the=
 time slot
it should remove is the exact one in the payload table now, not the one cap=
tured in
previous commit.  So in contrast, refer to old state time slot is a bit con=
fusing to me
because it's not generic right. Would like to know your thought on this poi=
nt.
Appreciate your time!

>
> > Thanks, Imre!
> >
> > >
> > > > Again, thanks for your feedback Imre!
> > > >
> > > > >
> > > > > > > >     /* Remove local payload allocation */
> > > > > > > >     list_for_each_entry(pos, &mst_state->payloads, next) {
> > > > > > > > -           if (pos !=3D new_payload && pos->vc_start_slot =
>
> new_payload-
> > > > > > > >vc_start_slot)
> > > > > > > > -                   pos->vc_start_slot -=3D old_payload->ti=
me_slots;
> > > > > > > > +           if (pos !=3D payload && pos->vc_start_slot >
> > > > > > > > + payload-
> > > > > > > >vc_start_slot)
> > > > > > > > +                   pos->vc_start_slot -=3D
> > > > > > > > + time_slots_to_remove;
> > > > > > > >     }
> > > > > > > > -   new_payload->vc_start_slot =3D -1;
> > > > > > > > +   payload->vc_start_slot =3D -1;
> > > > > > > >
> > > > > > > >     mgr->payload_count--;
> > > > > > > > -   mgr->next_start_slot -=3D old_payload->time_slots;
> > > > > > > > +   mgr->next_start_slot -=3D time_slots_to_remove;
> > > > > > > >
> > > > > > > > -   if (new_payload->delete)
> > > > > > > > -           drm_dp_mst_put_port_malloc(new_payload->port);
> > > > > > > > +   if (payload->delete)
> > > > > > > > +           drm_dp_mst_put_port_malloc(payload->port);
> > > > > > > >
> > > > > > > > -   new_payload->payload_allocation_status =3D
> > > > > > > DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > > > > > > > +   payload->payload_allocation_status =3D
> > > > > > > > +DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > > > > > > >  }
> > > > > >
> > > > > > --
> > > > > > Regards,
> > > > > > Wayne
> > > >
> > > > --
> > > > Regards,
> > > > Wayne
> > --
> > Regards,
> > Wayne
--
Regards,
Wayne
