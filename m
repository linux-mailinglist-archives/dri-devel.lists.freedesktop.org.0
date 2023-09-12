Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8F079C827
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911B610E392;
	Tue, 12 Sep 2023 07:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2086.outbound.protection.outlook.com [40.107.100.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028D410E392;
 Tue, 12 Sep 2023 07:26:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGKHbwNhnfBQMA/MmLwuXmN9omyJq3kzhDBoFRAfxRWcjoHMWr0tSfhDZnDJLMi5qnn7n3fccCjx0wE2cEEk1oDXeuUTu+ASvFvoM2d01gG52IMjHx6R5uEP7X4wNJYp52N0DzwUrPg5CaEXMah2AOcsyEANR/bK9n0HnoxA8mI0ENztVmltd9gFu7nEZcP1BoIMG2zWBmR1MK/QDsZRmVcsPO+2US/VpQx6AD4V06Iwhx779YEvOJ91758//nTz3LgWFXva+C/u/3Uj+1spkYhG5XG8hC7MglB4TfVyd3ZPxF6qFvAkk8CPJ2rGv2F/mXts2c7C8uJf9LRN1DqLOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zz0tLfz8BtVJ/jJWDbeTv2b4aR4cXIVXqluyj0Nyq+Q=;
 b=JEISzBZXNT3luH9X2w3XPqEOFUxZfzC9CxjcOSnUeFaYug0Nmx4TnNOEesvOTx4pFakllbt596WUIkAlZB7r8JpzIl9smiudpj6RW3Pm+OJFwzrOg5tBD7oSuUDV63BipNFC45pPkhR6lB0Z5gxNQAgSX8L8diZvQRm5O3997K/QeYtW2/J6M40d1Z7oumuiI/B50U8cAlbpPvRxjJWxhtHNlpIrOHXLRErJvmoJa6JrVAu93P2SI3xssm2tsU+MJn+sADP+6hSMfGBrdSLxnJRJy9Bbr/8MY0Apvl3K31AeqR6fl62NoxmOvdQQIu/fswEYTAQzE+LldfXZAaWbQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zz0tLfz8BtVJ/jJWDbeTv2b4aR4cXIVXqluyj0Nyq+Q=;
 b=24/dK6YYsC/etTl4qMVyBZ56hUrYtnBkDEKCvyNlTeUz5JE9/tAHkEzU2/TflzxPJnb9LyiH2YBaj7gtAaR+KQyTx0SFGHGx4ClSOf6lTmnKJR7VlExF/pupLr4o9KLiIF6OgdK6cAo5YLdQE7XDrnt8X3XPVz6aP9Y6Zc590QA=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by PH8PR12MB6793.namprd12.prod.outlook.com (2603:10b6:510:1c4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 07:26:30 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::fd43:1117:583:d37a]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::fd43:1117:583:d37a%3]) with mapi id 15.20.6768.036; Tue, 12 Sep 2023
 07:26:29 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "imre.deak@intel.com" <imre.deak@intel.com>
Subject: RE: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Thread-Topic: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Thread-Index: AQHZxpvrGNhE4HkDQUKz6BD10YkZXK/aRFEAgAPTpQCAAOsxAIAAqq0AgBC8pwCABt6JcIAD4XUAgBO5wdCAAqENgIAFbmkw
Date: Tue, 12 Sep 2023 07:26:29 +0000
Message-ID: <CO6PR12MB5489BBC86F6113C5019F3D96FCF1A@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20230804062029.5686-1-Wayne.Lin@amd.com>
 <20230804062029.5686-4-Wayne.Lin@amd.com>
 <ZM0Z3sZEYMcMTnuP@ideak-desk.fi.intel.com>
 <CO6PR12MB5489306FA44F5F107180E57DFC0CA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZNEU8j6OR3KirIcS@ideak-desk.fi.intel.com>
 <CO6PR12MB548978FEE8BE8300F43D4486FC0DA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZN+uWC1fDKZUmDdL@ideak-desk.fi.intel.com>
 <CO6PR12MB5489E92E7A29CA7285602B20FC1CA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZOiywboCeFxJwCCP@ideak-desk.fi.intel.com>
 <CO6PR12MB5489FC7230B9D400EEF5735CFCEEA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZPtzhcxqWPB07vfw@ideak-desk.fi.intel.com>
In-Reply-To: <ZPtzhcxqWPB07vfw@ideak-desk.fi.intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=4d5a8f14-db5d-44e1-b5d7-ae905bf0b882;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-09-12T06:15:12Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|PH8PR12MB6793:EE_
x-ms-office365-filtering-correlation-id: 95b9d3be-105f-447c-d5a4-08dbb3619529
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M5dPYIoZ9eD17i0LbNGa3uLK+/DsWLRNepoMHkAWd7gIu93rC+U0fnShiyZQa3tR6yzZCwZRZyfqr5/hrt+opQIXtSnZ913Cr/sZwvi5SuqdEulgsFUfVYus/pCRdi3LwqhEgGElaXuQ9DGWUaqYVHKNZGbBiOvk/vLd/zYzZAhc5JVaE6SXujfWJ25ObhJj8Pd0oq6aSRR0bWmdCERTIrz1Soo+Ymvbb5CKwu0DXIRlwAJKzycWcVHC6DS75KCIlyG7tokPAygeb5DtZIKBECbY2nQX70l7bXk/RsbOnOxpbtpsGZCxJW4qcWtsgfrBSKcsMTQrHByJsI6rVrimNGxfly6XQ54P3ITPEiPNottaJIy9rP6o2ns9fsFzyAUuE16JCyBikBlbeiOU24scCnVLU49cUk8PGjaPsltVsUgOsDobGeSwOLSzEjcglBWI6Z9GO0o8MObAM0olO98JbzxAYd4o7xyLE9Ef2KbjL001pg+lNUuuYWNnG7EI3E3YDAfKgBjGx3UCcXJuGVF0cW8sld4ECLcaA2m3iy+hfGvBerZNEBRKDDADJq3R1t27mGEE2kE+jzFpKOaCNvcUwpSJc47eWLo0udkiy0+fG7kq+uln3tb4Dc3+41Tj7doM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199024)(1800799009)(186009)(52536014)(71200400001)(53546011)(6506007)(7696005)(83380400001)(66476007)(8676002)(55236004)(9686003)(2906002)(30864003)(316002)(66446008)(6916009)(26005)(66556008)(5660300002)(76116006)(4326008)(64756008)(66946007)(478600001)(8936002)(33656002)(55016003)(86362001)(38070700005)(38100700002)(122000001)(54906003)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GKdBiICelEG49VKjjenbeae6UEvhpwKhApp/6WshafSNE1sCyBbKwXwxi/HO?=
 =?us-ascii?Q?eJ2J5wtshyi33D/ku/AbninwxB8DiwhN72Uxdx2ITeUr7BFzFPqePXb+00mk?=
 =?us-ascii?Q?Y+0meMXDgJkL1oiZ5+H9N9yoglTJKEqBQt4gu7/Z1UhJgTzn0XlRFOKOs0Pr?=
 =?us-ascii?Q?jbRpWZD+1Oa+fMGWVUbWz3Dagziel+SAoTNAp2N99Ql5oBmME2JSuinbzgOy?=
 =?us-ascii?Q?fPazGUMvfSIo17VmNSgb+i0jWrc9ZkNND4hjQ4jFIHgTMNyAhK6EH71Pi16T?=
 =?us-ascii?Q?h+SCqW2z4kWAjNvB2jeQ2DJ4jjDW3z3a1Pf5wx7LxM24yR+WWPVYH/eIojZE?=
 =?us-ascii?Q?CNHeCdS5JwpHZcQjzReBy7s3Q7J6o3cOsQKIWKbJKeFryCx1svQJQYuMA6J2?=
 =?us-ascii?Q?pkXm338cn+YTo/SUZ4Upo8fHCn3RifuQW/7Uqjn9k6cTabegKdD2S3MhAa5T?=
 =?us-ascii?Q?hdsznQ+WSzZF/n+8FETg5fEMPmlaRTZSJv/MKZXTMHZdHQMFDaGIRJvkgrKG?=
 =?us-ascii?Q?7cDcKGljjBSpbFy48vgo34YjXT4e0dbMCcCAqBCa5e6UXjMX3QbCPcf0Wmtf?=
 =?us-ascii?Q?Yt4UhbOp+sM6czsLTKIrUB1J2Im1RQCxAgOHhDWlDq4QpVYQyEvzkPVngfi5?=
 =?us-ascii?Q?4o+JIPvccMxh7U+2kbYb7LbC6GKOj+E047Wv+K7TX/1vzzKj3TO54QvqSLv4?=
 =?us-ascii?Q?O80OcdECRoxp+2tPx2p3YWFdW1VLHLEkeA/4/pmT53ArHS00aisVun3Gc1Ul?=
 =?us-ascii?Q?wqOBR0lIqb1w5OzpTXCqdWhOVqHQswU+ku4JX0fLP2BlhLpd6+W6/thQ82mT?=
 =?us-ascii?Q?ZuuNyYKkSJW+7AxbrsUJCtdFvO0LoNc5UDiaDc3n+oAzxIzDzbN7Qx/40CHx?=
 =?us-ascii?Q?N/zL+y5lWbhpnai3a2YSfX5+wkijmUO09yi5gAxBvkm4usDHdZgdJTkgtQQA?=
 =?us-ascii?Q?TTC9IuLm68yQHeCaCTcQA7s4KJY/BKyz1f8SKaqcpXj1XL7/44h7UZ8XPi8h?=
 =?us-ascii?Q?vNvIc4TC2eyhDSmN4fiOulYRCF59fL4GsSo/5tOHTY6+bBkIudsQpNP77KTQ?=
 =?us-ascii?Q?E5C2k3M+IB9pKjT4jCoOLYd7N7y983t2xcbTluvwJj4jmGCygqyOo6P4Tqll?=
 =?us-ascii?Q?KoaMMaeKVRLEN1Z4LcRgR3mY9ajwkyOTJfowypYmra427Xd/AJWl9N9gl/i9?=
 =?us-ascii?Q?4eOZbSgMdksAp/mhM1tA+lT4c9rasvw7pNgInjeWgL0ktk9kiWBJaKU/Wbbz?=
 =?us-ascii?Q?awLi3xXEmxT5Jh/+tjXBu8jSPu2TqdIbNzGTyeSDvQOvHV9s5ltfvP9iSP9F?=
 =?us-ascii?Q?by+i9y0vww5oX/kk+w/CvbGwRF31pPOf2gBfHkkPNXO+j3l8Xj4llGKGQoCc?=
 =?us-ascii?Q?RNiZMRz2fqrA8fwc2ISAs8f098ekt/U68dull5PGe8crnTqFw42z4Z6M+hpl?=
 =?us-ascii?Q?Nh0iLLJ1dX+/jKKJ7pMNjSgXPu76WA6vs/GNFKAcVNzwFJ0yQ0dl9EcpwaR7?=
 =?us-ascii?Q?+3MLvbcRCaxTaRFmBLEGQ3ISlA/HHH08aCpOy1PyRFTtdxrP8I/JKHS2nUL5?=
 =?us-ascii?Q?aSaGZEQj3FdNeneDrME=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b9d3be-105f-447c-d5a4-08dbb3619529
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2023 07:26:29.8636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w47TirLjlcB4yK6DSJmcM0qyZuaAszF1CZ7ysHxEy94M19ogp/sayQm1rajJGJoEnomc6Giq2eOGlDtJbW3hmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6793
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

[Public]

> -----Original Message-----
> From: Imre Deak <imre.deak@intel.com>
> Sent: Saturday, September 9, 2023 3:18 AM
> To: Lin, Wayne <Wayne.Lin@amd.com>
> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> lyude@redhat.com; jani.nikula@intel.com; ville.syrjala@linux.intel.com;
> Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> <Jerry.Zuo@amd.com>
> Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> drm_dp_remove_payload_part2()
>
> On Thu, Sep 07, 2023 at 03:44:39AM +0000, Lin, Wayne wrote:
> > [AMD Official Use Only - General]
> >
> > > -----Original Message-----
> > > From: Imre Deak <imre.deak@intel.com>
> > > Sent: Friday, August 25, 2023 9:56 PM
> > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> > > lyude@redhat.com; jani.nikula@intel.com;
> > > ville.syrjala@linux.intel.com; Wentland, Harry
> > > <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
> > > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > > drm_dp_remove_payload_part2()
> > >
> > > On Wed, Aug 23, 2023 at 03:16:44AM +0000, Lin, Wayne wrote:
> > > > [AMD Official Use Only - General]
> > > >
> > > > > -----Original Message-----
> > > > > From: Imre Deak <imre.deak@intel.com>
> > > > > Sent: Saturday, August 19, 2023 1:46 AM
> > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > Cc: dri-devel@lists.freedesktop.org;
> > > > > amd-gfx@lists.freedesktop.org; lyude@redhat.com;
> > > > > jani.nikula@intel.com; ville.syrjala@linux.intel.com; Wentland,
> > > > > Harry <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
> > > > > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > > > > drm_dp_remove_payload_part2()
> > > > >
> > > > > On Tue, Aug 08, 2023 at 03:47:47AM +0000, Lin, Wayne wrote:
> > > > > > [AMD Official Use Only - General]
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Imre Deak <imre.deak@intel.com>
> > > > > > > Sent: Tuesday, August 8, 2023 12:00 AM
> > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > Cc: dri-devel@lists.freedesktop.org;
> > > > > > > amd-gfx@lists.freedesktop.org; lyude@redhat.com;
> > > > > > > jani.nikula@intel.com; ville.syrjala@linux.intel.com;
> > > > > > > Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> > > > > > > <Jerry.Zuo@amd.com>
> > > > > > > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > > > > > > drm_dp_remove_payload_part2()
> > > > > > >
> > > > > > > On Mon, Aug 07, 2023 at 02:43:02AM +0000, Lin, Wayne wrote:
> > > > > > > > [AMD Official Use Only - General]
> > > > > > > >
> > > > > > > > > -----Original Message-----
> > > > > > > > > From: Imre Deak <imre.deak@intel.com>
> > > > > > > > > Sent: Friday, August 4, 2023 11:32 PM
> > > > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > > > Cc: dri-devel@lists.freedesktop.org;
> > > > > > > > > amd-gfx@lists.freedesktop.org; lyude@redhat.com;
> > > > > > > > > jani.nikula@intel.com; ville.syrjala@linux.intel.com;
> > > > > > > > > Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> > > > > > > > > <Jerry.Zuo@amd.com>
> > > > > > > > > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > > > > > > > > drm_dp_remove_payload_part2()
> > > > > > > > >
> > > > > > > > > On Fri, Aug 04, 2023 at 02:20:29PM +0800, Wayne Lin wrote=
:
> > > > > > > > > > [...]
> > > > > > > > > > diff --git
> > > > > > > > > > a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > > > > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > > > > index e04f87ff755a..4270178f95f6 100644
> > > > > > > > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > > > > @@ -3382,8 +3382,7 @@
> > > > > > > > > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > > > > > > > > >   * drm_dp_remove_payload_part2() - Remove an MST
> > > > > > > > > > payload
> > > > > locally
> > > > > > > > > >   * @mgr: Manager to use.
> > > > > > > > > >   * @mst_state: The MST atomic state
> > > > > > > > > > - * @old_payload: The payload with its old state
> > > > > > > > > > - * @new_payload: The payload with its latest state
> > > > > > > > > > + * @payload: The payload with its latest state
> > > > > > > > > >   *
> > > > > > > > > >   * Updates the starting time slots of all other
> > > > > > > > > > payloads which would have
> > > > > > > > > been shifted towards
> > > > > > > > > >   * the start of the payload ID table as a result of
> > > > > > > > > > removing a payload. Driver should call this @@
> > > > > > > > > > -3392,25
> > > > > > > > > > +3391,36 @@
> > > > > > > > > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > > > > > > > > >   */
> > > > > > > > > >  void drm_dp_remove_payload_part2(struct
> > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > *mgr,
> > > > > > > > > >                              struct
> > > > > > > > > > drm_dp_mst_topology_state
> > > > > > > > > *mst_state,
> > > > > > > > > > -                            const struct drm_dp_mst_at=
omic_payload
> > > > > > > > > *old_payload,
> > > > > > > > > > -                            struct drm_dp_mst_atomic_p=
ayload
> > > > > > > > > *new_payload)
> > > > > > > > > > +                            struct
> > > > > > > > > > + drm_dp_mst_atomic_payload
> > > > > > > > > *payload)
> > > > > > > > > >  {
> > > > > > > > > >     struct drm_dp_mst_atomic_payload *pos;
> > > > > > > > > > +   u8 time_slots_to_remove;
> > > > > > > > > > +   u8 next_payload_vc_start =3D mgr->next_start_slot;
> > > > > > > > > > +
> > > > > > > > > > +   /* Find the current allocated time slot number of t=
he
> payload */
> > > > > > > > > > +   list_for_each_entry(pos, &mst_state->payloads, next=
) {
> > > > > > > > > > +           if (pos !=3D payload &&
> > > > > > > > > > +               pos->vc_start_slot > payload->vc_start_=
slot &&
> > > > > > > > > > +               pos->vc_start_slot < next_payload_vc_st=
art)
> > > > > > > > > > +                   next_payload_vc_start =3D pos->vc_s=
tart_slot;
> > > > > > > > > > +   }
> > > > > > > > > > +
> > > > > > > > > > +   time_slots_to_remove =3D next_payload_vc_start -
> > > > > > > > > > +payload->vc_start_slot;
> > > > > > > > >
> > > > > > > > > Imo, the intuitive way would be to pass the old payload
> > > > > > > > > state to this function - which already contains the
> > > > > > > > > required time_slots param
> > > > > > > > > - and refactor things instead moving vc_start_slot from
> > > > > > > > > the payload state to mgr suggested by Ville earlier.
> > > > > > > > >
> > > > > > > > > --Imre
> > > > > > > >
> > > > > > > > Hi Imre,
> > > > > > > > Thanks for your feedback!
> > > > > > > >
> > > > > > > > I understand it's functionally correct. But IMHO, it's
> > > > > > > > still a bit conceptually different between the time slot
> > > > > > > > in old state and the time slot in current payload table.
> > > > > > > > My thought is the time slot at the moment when we are
> > > > > > > > removing the payload would be a better
> > > > > choice.
> > > > > > >
> > > > > > > Yes, they are different. The old state contains the time
> > > > > > > slot the payload was added with in a preceding commit and so
> > > > > > > the time slot value which should be used when removing the
> > > > > > > same payload in the
> > > > > current commit.
> > > > > > >
> > > > > > > The new state contains a time slot value with which the
> > > > > > > payload will be added in the current commit and can be
> > > > > > > different than the one in the old state if the current
> > > > > > > commit has changed the payload size (meaning that the same
> > > > > > > atomic commit will first remove the payload using the time
> > > > > > > slot value in the old state and afterwards will add back the
> > > > > > > same payload using the time slot value
> > > in the new state).
> > > > > > >
> > > > > > Appreciate your time, Imre!
> > > > > >
> > > > > > Yes I understand, so I'm not using the number of the time slot
> > > > > > in the new
> > > > > state.
> > > > > > I'm referring to the start slot instead which is updated
> > > > > > during every allocation and removement at current commit.
> > > > > >
> > > > > > Like what you said, current commit manipulation could be a mix
> > > > > > of allocations and removements for the payload. My thought is,
> > > > > > conceptually, looking up the latest number of time slot is a
> > > > > > better choice
> > > > > rather than the one in old state.
> > > > > > It's relatively intuitive to me since we are removing payload
> > > > > > from current payload table and which changes since last
> > > > > > preceding commit till the moment we're deleting the payload.
> > > > > > Although it's unreasonable that these values are different.
> > > > > >
> > > > > > > > And with this, we can also simplify some codes. Especially
> > > > > > > > remove workaround in amd driver. In fact, DRM mst code
> > > > > > > > maintains the payload table and all the time slot info is
> > > > > > > > in it already. We don't really have to pass a new parameter=
.
> > > > > > >
> > > > > > > I agree that drm_dp_remove_payload() could be simplified,
> > > > > > > but this should be done so that the drivers can pass the old
> > > > > > > payload state to it (without having to pass the new state).
> > > > > > > This would be possible if vc_start_slot was not tracked in
> > > > > > > the payload state (which is really not an atomic state that
> > > > > > > can be precomputed as all other atomic state), rather it
> > > > > > > would be tracked in
> > > struct drm_dp_mst_topology_mgr.
> > > > > > >
> > > > > >
> > > > > > So the reason I chose to pass the new state is like what I
> > > > > > mentioned above. I would prefer to carry the latest updated
> > > > > > payload table instead which is in the new state. And I agree
> > > > > > with the explanation for the vc_start_slot and that's also my
> > > > > > thought at the beginning. It could be a refactor later, but no
> > > > > > matter the start slot is put into payload state or the
> > > > > > topology manager I would prefer to refer to the latest
> > > > > payload table rather than the number of time slot in the old stat=
e.
> > > > > >
> > > > > > > It looks like AMD has to reconstruct the old state in
> > > > > > > dm_helpers_construct_old_payload(). Could you explain why it
> > > > > > > couldn't instead just pass old_payload acquired by
> > > > > > >
> > > > > > > old_mst_state =3D drm_atomic_get_old_mst_topology_state();
> > > > > > > old_payload =3D
> > > > > > > drm_atomic_get_mst_payload_state(old_mst_state);
> > > > > > >
> > > > > > > ?
> > > > > >
> > > > > > AMD doesn't pass the drm old state to the stage while HW is
> > > > > > deleting the payload.  The reason is that HW payload table is
> > > > > > known during HW programming procedure, so the payload
> > > > > > removement is based on the table at the moment.
> > > > > >
> > > > > > AMD expected the current number of time slot is also already
> > > > > > maintained in drm layer.
> > > > >
> > > > > Yes, both of the above are maintained by the drm layer, but it
> > > > > also means it doesn't really need to recalculate
> > > > > time_slots_to_remove as done in this patch, since that info is
> > > > > already available in the old payload
> > > state.
> > > > >
> > > > > Afaics the AMD driver calls properly
> > > > >
> > > > > drm_atomic_helper_commit() -> drm_atomic_helper_swap_state()
> > > > >
> > > > > after a commit, so that all the payloads it added should be
> > > > > tracked now as the old payload state.
> > > > >
> > > > > So could you confirm what is the old_payload->time_slots value
> > > > > (which you get with the above functions) at the point of
> > > > > removing this payload and if it's not the time_slots value this
> > > > > same payload was actually added with previously, why this is so
> > > > > (via some example
> > > sequence)?
> > > > >
> > > > > Thanks.
> > > >
> > > > Hi Imre,
> > > > I'm not saying that the time_slots carried in the old state is
> > > > wrong within
> > > amd driver.
> > > > But just amd driver doesn't carry the drm state to the step when
> > > > it's removing the payload, since the info is already in its
> > > > hardware and drm used to maintain the info in the drm layer.
> > >
> > > Hm, in
> > >
> > > dm_helpers_dp_mst_write_payload_allocation_table()
> > >
> > > the
> > >
> > > mst_state =3D to_drm_dp_mst_topology_state(mst_mgr->base.state);
> > >
> > > used as the new state doesn't look ok to me. The above is the MST
> > > object's current SW state after an atomic commit/swap, but this
> > > isn't the new state a driver should program to the HW or pass to the
> > > drm helper functions. The object's current state could be ahead of
> > > what the driver should program to the HW, if the driver properly
> > > implements commit pipelining (so at the point you're programming a
> > > state you'd have already future commits computed and queued up, each
> queued-up commit with its own state).
> > >
> > > So instead of the above mst_state the driver should pass down the
> > > drm_atomic_state to
> > > dm_helpers_dp_mst_write_payload_allocation_table()
> > > which should use that instead to get the MST state it should program
> > > or pass to the drm layer.
> > >
> > > > So the patch is trying to get the behavior of this helper function
> > > > back to what it used to be.
> > >
> > > The behavior before was actually broken and one reason for that was
> > > a confusion about what's stored in the new payload state. It's a
> > > mixture of old/current state (vc_start_slot) and new state
> > > (time_slots). So I don't think it's a good idea to add even more depe=
ndency
> on this semantic.
> > >
> > > I think the right solution for what this patch is about - remove the
> > > need for dm_helpers_construct_old_payload(), would be to pass down
> > > drm_atomic_state to
> > > dm_helpers_dp_mst_write_payload_allocation_table()
> > > based on the above.
> > >
> > > > And the main reason that I want to change the pass in parameter is
> > > > like what I mentioned previously. The commit manipulation could be
> > > > a mix of allocations and removements for the payload. And in the
> > > > spec, it also introduces examples to reduce or increase the
> > > > payload allocation. Although we're not using reduction/increment
> > > > today, it implicitly imposes the limitation to use them before
> > > > calling the removement helper function with the old state as the
> > > > passed in parameter. So I also want to remove the dependency by thi=
s
> patch.
> > > > Would like to know your thoughts about this.
> > >
> > > It's not clear what would be the benefit of changing a payload
> > > without removing it first. In any case, I think the right direction
> > > for the driver would be to meet the requirement to use the proper
> > > atomic state with the drm helper functions (not the object's current =
SW
> state) as described above.
> >
> > Hi Imre,
> >
> > Thanks for pointing that out and that was also one of my plan to
> > refactor! But I would take that as another patch to follow up and
> > would like to align with you the idea for this helper function itself m=
ore.
> >
> > My concern is referring to the old state to remove the time slot is
> > just not generic right for what the helper function shall accomplish.
> > Even it doesn't bring benefit as you see, having old state as the
> > input imposes limitation to drivers using it which is the downside that=
 it
> brought. The limitation is like what I tried to explain before.
> > For an instance, if one driver has compressed streams allocated in the
> > previous commit and wants to disable these streams at the current
> > commit. It handles and accomplishes the commit into two steps that
> > firstly to disable dsc engine only (which increases the time slot),
> > and next disable the streams. Under this design, the old state can't
> > represent the exact number of time slot that it want's to remove at
> > the moment. For this case, I don't think drm_dp_remove_payload_part2
> > should block the driver to use it since the driver doesn't do things wr=
ong.
> Conversely, it's due to the helper function constrains the driver to use =
an
> inappropriate input.
> >
> > And with or without my patch, the current payload allocation table
> > (i.e. vc_start_slot In new state) and the time slot that this new
> > state is going to set (i.e. time_slots in new state) are already both
> > in the new state. I think the patch doesn't add irrelevant input for
> > removing a payload as this helper function should do, because the time
> > slot it should remove is the exact one in the payload table now, not
> > the one captured in previous commit.  So in contrast, refer to old stat=
e time
> slot is a bit confusing to me because it's not generic right. Would like =
to know
> your thought on this point.
> > Appreciate your time!
>
> I'd like to be sure that the payload is removed with the size it was adde=
d with
> in the previous commit and as I wrote above not depend for this on the ne=
w
> payload state with a mixture of old/current/new states.
> Based on that I'd be ok for instance with a new
>
> int drm_dp_remove_port_payload(mgr, mst_state, port)
>
> function which looks up / removes the payload with the time_slots calcula=
ted
> based on the payload table as in your patch and returns the calculated
> time_slots.
>
> The AMD driver could call the above function and the current
> drm_dp_remove_payload(mgr, mst_state, old_payload) function would be
>
>       time_slots =3D drm_dp_remove_port_payload(mgr, mst_state,
> old_payload->port);
>       WARN_ON(time_slots !=3D old_payload->time_slots);
>
> --Imre

Sorry but I might not fully understand what you suggested here. Would like =
to know
if you agree on referring to the time slot number of the payload table at t=
he moment
is better then referring old_payload->time_slots for drm_dp_remove_payload(=
)? If
you agree on that, my patch actually is just replacing old_payload->time_sl=
ots with
the more appropriate one. Not adding mixture of old/current but replacing t=
he old
with the current one. And like what I explained in previous example, when c=
alling
drm_dp_remove_payload(), the time slot number to be removed shouldn't be
constrained to the one in previous commit. The number in the payload table =
when
we're about to remove the payload might be a better choice. Could you elabo=
rate
more what's the mixture that this patch is adding on, please?

As for the changing suggestion, are you suggesting to create a new function
drm_dp_remove_port_payload() to wrap up the calculation in my patch? If so,=
 I think
that's the consensus to use current time slot number to replace the one in =
old_payload.
Therefore, it doesn't have to pass old_payload to drm_dp_remove_port_payloa=
d(), and
"WARN_ON(time_slots !=3D old_payload->time_slots);" is not appropriate as f=
or the
example that I gave previously.

Thanks for helping me out here.
--
Regards,
Wayne
