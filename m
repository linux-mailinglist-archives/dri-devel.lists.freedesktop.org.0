Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84287737BE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 05:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED4510E39E;
	Tue,  8 Aug 2023 03:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EDC10E22E;
 Tue,  8 Aug 2023 03:47:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3Dsv5TItOp7S+oS3MNmX0XsQMgvr3tpjUm8wxWBO7xWSeASuQRSzAU05EwwrBuQntXAPnFy2qPGsWoD4/VwvCcs6qGmp6KbyhO82hiL5B4auxglDvGUNlDTP5xPXxXv2kikUpLDS2UrCYitYmVI5iHWKN2ZEv3zS1xwXnHDFwTteOmA/H1ZUJ9OhO9KCVCzD6U/z6ZBjKR6FFoijHE1jObIDvMrROH/sxcmLilJQNeqx/y5EjQEkur7V07pFxmuqVKP8cKglZ+9S1tzbdXvwdMHNcqGwDnlLvPUlDGtyBft5O8BLFabkDZzdBLRqSBM3kZY4h2ZL3H2+MjBStnVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECRPc5mYKvtd2j20QvYMLA2bmXZUGC/PHeBG/8oFlYQ=;
 b=XAXryAk4EGs3icGqrEA575jhxLxWtK/PmQ6u+Z1+/tsK6qj8pgWw//I1sY9re3C6kwT4O9Kg2e3Dw2SRUH6yJmBBWGxb8r+SmraVtH2L98HpIfL6Y88DYfpjAckN+JtsxLfAQvLMFPpfrwFIbiSyVN6iPS5S43B254pk79RMnAncqNODrwV/2ctc0AyJZOr8eelAR2x4btpOHynNPRz7J7RVJEduAWsmvZkjd5Kb1zUDHB1rIEvQH9b5lFk/2BwEjhG2nxhAvMq4FiRhLSuP2gZpd3rc3EHi7Z2SiEkqsnMQo7zc8k4f3uySFVJYMNYDn8txkMvGRdIvd0XyjTbapw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECRPc5mYKvtd2j20QvYMLA2bmXZUGC/PHeBG/8oFlYQ=;
 b=ZBJWceYH0wwVSqmmRtKv6ZsI9SyBN2XpHoX9JSH8G03+F53yljTmvjfFlCwTN2cM4QOWWT/N8UHctUScWjhIRYgY1S0zkGsTdtSMBDmbA3tIwvMw8kO+U36uQU+0DxW0VquOGOnv5ub7vkTV0w7VqcvQJevP8KFjBM5W4MCOews=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by PH7PR12MB6881.namprd12.prod.outlook.com (2603:10b6:510:1b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 03:47:51 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::6c8e:fa7a:2604:da9d]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::6c8e:fa7a:2604:da9d%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 03:47:47 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "imre.deak@intel.com" <imre.deak@intel.com>
Subject: RE: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Thread-Topic: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Thread-Index: AQHZxpvrGNhE4HkDQUKz6BD10YkZXK/aRFEAgAPTpQCAAOsxAIAAqq0A
Date: Tue, 8 Aug 2023 03:47:47 +0000
Message-ID: <CO6PR12MB548978FEE8BE8300F43D4486FC0DA@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20230804062029.5686-1-Wayne.Lin@amd.com>
 <20230804062029.5686-4-Wayne.Lin@amd.com>
 <ZM0Z3sZEYMcMTnuP@ideak-desk.fi.intel.com>
 <CO6PR12MB5489306FA44F5F107180E57DFC0CA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZNEU8j6OR3KirIcS@ideak-desk.fi.intel.com>
In-Reply-To: <ZNEU8j6OR3KirIcS@ideak-desk.fi.intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=0a92884c-0107-432b-89b1-933eb5ffd33c;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-08T02:10:38Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|PH7PR12MB6881:EE_
x-ms-office365-filtering-correlation-id: 0da0bbdd-409e-41d5-ec83-08db97c23b2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jwbDMGu+QqKx/pvuPZuYzKpbOKWCumJT2VisGZzMSOmYRjj9Z1mUV5fr5pEbjja9PchQMiSU6rqszxpWeABjHx3czvYxNkk8jIN9iX6r12pY9VSxJ4SEBZIbKwg0wBYcbhDwDYNmD11oXMJOAQ33fvgKaCUwV/IpMToENslc8nVp87L1w5tguCG1WrFnlZEQWQmpNryXpr4boAH2f1MHHSSDQ03m0joTH95bgdScYKJv7t69IWrvPNwjvQSkeGD/W5ZxKy4xRXp1UJozJMq9xopUzJRq0joNHlirjpOVSv2Vq7qmd7yTfFVC5z9ZlAqkIfcMu1GKwL2K3Xwka1zSSoDcAkcS3pOGt9akPNNmYTJp7mkJ1xuTeA7XIIb6yQiO1ixCKgE/NaVEhpKlzoSQuH4kPmvNDfCt1GJ+XhQbgJENWED4ubKuX81WGVv8Zgjxs0GtC8BKsZeATLZD4L6iVOEy2CHBbpFbbqGfsp3hgSZSWn8yl/sbnAX8dduUT1DhVHDVnAgZ1R9BMqmJB/uzd/OuNQkgsjyxQ2R8JEKB0zJSXKY5E5lJBZ+sF9VbR2ZhfVgNeI3dNselhrSPa27Q0H9geBwfxAuZBNJsKbRRI7/heolfNAKl2g6H49lAh26eoBoEC3YA7KSDHcf702ojgAxTbPADYgTuKOhhvF3jcQ561+x+JvF67xEFq81sKtF3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(90011799007)(90021799007)(451199021)(186006)(1800799003)(86362001)(41300700001)(52536014)(55236004)(478600001)(53546011)(6506007)(8936002)(8676002)(26005)(7696005)(5660300002)(83380400001)(2906002)(54906003)(71200400001)(38070700005)(38100700002)(55016003)(316002)(122000001)(66446008)(66476007)(64756008)(66556008)(66946007)(76116006)(6916009)(4326008)(9686003)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tH8FaVcdd5bG2t/Npmb78j9ek1n7D7KPVGyWRCe6lgeZC8FxBCYvmkw1fIvb?=
 =?us-ascii?Q?XRz2K5r5TNgCxVc9/1LtO3p9ttpIhv95Tu4IR9N7kE/QyNTb0E/1YUxxD3Ei?=
 =?us-ascii?Q?n9G/uAc65D2da/lves988vB642Uhi0FpRH8ltYseNgW9TFKO5ykpGPOHD2AW?=
 =?us-ascii?Q?XHaACdEllwmoC6N85ml+NJBrWUBz1Ovgk2FqxnAhRgpSQ5Daec3qzc0XKpOf?=
 =?us-ascii?Q?XgOGmzaab55LwTTTiM7kKXQTUTJ0nPtmtEruvb9rJ6Emn2qGdydI28aGaV5v?=
 =?us-ascii?Q?aeCpR3Hj5iKSUiM0zdTBeI7g+LQR5wh1l5oFZcZuuiXKmsfZ4/F8k1cPZJrX?=
 =?us-ascii?Q?D9tFqC1lH0UjSl3hBTVjf6ITm6Gy+xkt0eNxeY/6XvPj3JFfDNJt99mz0Ixr?=
 =?us-ascii?Q?OYW1FS8Wtx/yrdX9dlafX5hQrCaLB+HEnWh4YRKx853sZbxSXDQ4Q/naP6xR?=
 =?us-ascii?Q?K1q8qJ8EekoHWGu+DyWamHcHETJ5PswSYfb0+APFM6/H/zKcA7HI1z5M7FcP?=
 =?us-ascii?Q?RoYavEdM2tVcwljsMUkt0hsTcUZXRAorV2E95t4ZXpV1wJMW5EbM7YmFrrPg?=
 =?us-ascii?Q?lHLoTVn6TypAVKHrY66UjGOMPNN8t9kml2jJ5u+lXzUQsg92EsE67Hvlljqu?=
 =?us-ascii?Q?dUA6zdS3Jr3YNlqYkZV0RvW9RjzfzaMcvv8rq8bpf67u0VcnujqHGnL6sRhr?=
 =?us-ascii?Q?ZbCqFQsDg2PlrpD9/54XBbwR/hRIDeoSij6683w3m17URSggZLefaq43eQ2i?=
 =?us-ascii?Q?EsH4wvBAjCjjg4ajzn4j1NUI3thhEQrrHy3Nh2w8q+/16NwQmNCNbwQUxuJB?=
 =?us-ascii?Q?Rsg08NeNwlSjEYuB0HojIORJ5A5eCEYoX+stRZhIAvRVdFm3M7ok+OxPLC73?=
 =?us-ascii?Q?U3+coeEA0VW1IqoZC2ugLwWSot2/Vo83KGeQUAQs9vjmOmNfkjknMOeRD32o?=
 =?us-ascii?Q?uXUpqD90w98x/f1Gdl5j6TIGk/aRYP98MSwbeVIq8wic5pKha7EDPfosBXiD?=
 =?us-ascii?Q?a9tGqCavPB558c5846965XKlSZ8cxukGO03zWQnchet9tEPScHp05VPpPL3x?=
 =?us-ascii?Q?DzMZ0vTizdwsG3b/xivZfb8k9JJr6+Xp6zcLc8kl+RoHk4NkLx6/uSXUNBrv?=
 =?us-ascii?Q?PpsjxN28M4rAP8nF7da5fiKlYzBKpLYr3dxcRctvcOJg0sn0QBngsOZzOWlY?=
 =?us-ascii?Q?RoV6cSJY+zWK++i2x4iZ2lcaqR4JurrsO4VhW1XKJ+so0yexeABY470esZCC?=
 =?us-ascii?Q?bx2DYo9X73lvzCjO+YVp488UF1PpU23DCvBWPxiRX37tRg9CRlVC0fRAdvUc?=
 =?us-ascii?Q?Jdx7ehFM09fMSSKegFxpTKBsHABXsYNpBF8+2QmccJKtiZv0oNV7/LKrvrD5?=
 =?us-ascii?Q?fF9ka9OXd54WC98wt6geVtzQwtSGNM32pZAIUZNNebWAx3nfuT2FLEjW6seo?=
 =?us-ascii?Q?HOqjX3n3Y5w54fTRxjNV21eSh2UgX56cOh8rWr3SR8UmthlfA2XvjeUG8UKX?=
 =?us-ascii?Q?qHbJfxLBzauBuREer1yHlQ7azvL7S3Kfi0wmNMbz/lLlH+jBZxI5sNCDCJwf?=
 =?us-ascii?Q?Y7S/SebseztCuKNfBxg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da0bbdd-409e-41d5-ec83-08db97c23b2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 03:47:47.5273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BJ9mdHY7ivJJPNbwbvqyHhdUYuVJx63aBUS/ImqqhK1vZW/N+09gLf4GwtRyw2T4ZP7FWkhY/q9oYDW8t2ZbOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6881
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
> Sent: Tuesday, August 8, 2023 12:00 AM
> To: Lin, Wayne <Wayne.Lin@amd.com>
> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> lyude@redhat.com; jani.nikula@intel.com; ville.syrjala@linux.intel.com;
> Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> <Jerry.Zuo@amd.com>
> Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> drm_dp_remove_payload_part2()
>
> On Mon, Aug 07, 2023 at 02:43:02AM +0000, Lin, Wayne wrote:
> > [AMD Official Use Only - General]
> >
> > > -----Original Message-----
> > > From: Imre Deak <imre.deak@intel.com>
> > > Sent: Friday, August 4, 2023 11:32 PM
> > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> > > lyude@redhat.com; jani.nikula@intel.com;
> > > ville.syrjala@linux.intel.com; Wentland, Harry
> > > <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
> > > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > > drm_dp_remove_payload_part2()
> > >
> > > On Fri, Aug 04, 2023 at 02:20:29PM +0800, Wayne Lin wrote:
> > > > [...]
> > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > index e04f87ff755a..4270178f95f6 100644
> > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > @@ -3382,8 +3382,7 @@
> > > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > > >   * drm_dp_remove_payload_part2() - Remove an MST payload locally
> > > >   * @mgr: Manager to use.
> > > >   * @mst_state: The MST atomic state
> > > > - * @old_payload: The payload with its old state
> > > > - * @new_payload: The payload with its latest state
> > > > + * @payload: The payload with its latest state
> > > >   *
> > > >   * Updates the starting time slots of all other payloads which
> > > > would have
> > > been shifted towards
> > > >   * the start of the payload ID table as a result of removing a
> > > > payload. Driver should call this @@ -3392,25 +3391,36 @@
> > > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > > >   */
> > > >  void drm_dp_remove_payload_part2(struct
> drm_dp_mst_topology_mgr
> > > *mgr,
> > > >                              struct drm_dp_mst_topology_state
> > > *mst_state,
> > > > -                            const struct drm_dp_mst_atomic_payload
> > > *old_payload,
> > > > -                            struct drm_dp_mst_atomic_payload
> > > *new_payload)
> > > > +                            struct drm_dp_mst_atomic_payload
> > > *payload)
> > > >  {
> > > >     struct drm_dp_mst_atomic_payload *pos;
> > > > +   u8 time_slots_to_remove;
> > > > +   u8 next_payload_vc_start =3D mgr->next_start_slot;
> > > > +
> > > > +   /* Find the current allocated time slot number of the payload *=
/
> > > > +   list_for_each_entry(pos, &mst_state->payloads, next) {
> > > > +           if (pos !=3D payload &&
> > > > +               pos->vc_start_slot > payload->vc_start_slot &&
> > > > +               pos->vc_start_slot < next_payload_vc_start)
> > > > +                   next_payload_vc_start =3D pos->vc_start_slot;
> > > > +   }
> > > > +
> > > > +   time_slots_to_remove =3D next_payload_vc_start -
> > > > +payload->vc_start_slot;
> > >
> > > Imo, the intuitive way would be to pass the old payload state to
> > > this function - which already contains the required time_slots param
> > > - and refactor things instead moving vc_start_slot from the payload
> > > state to mgr suggested by Ville earlier.
> > >
> > > --Imre
> >
> > Hi Imre,
> > Thanks for your feedback!
> >
> > I understand it's functionally correct. But IMHO, it's still a bit
> > conceptually different between the time slot in old state and the time
> > slot in current payload table. My thought is the time slot at the
> > moment when we are removing the payload would be a better choice.
>
> Yes, they are different. The old state contains the time slot the payload=
 was
> added with in a preceding commit and so the time slot value which should =
be
> used when removing the same payload in the current commit.
>
> The new state contains a time slot value with which the payload will be a=
dded
> in the current commit and can be different than the one in the old state =
if the
> current commit has changed the payload size (meaning that the same atomic
> commit will first remove the payload using the time slot value in the old=
 state
> and afterwards will add back the same payload using the time slot value i=
n the
> new state).
>
Appreciate your time, Imre!

Yes I understand, so I'm not using the number of the time slot in the new s=
tate.
I'm referring to the start slot instead which is updated during every alloc=
ation
and removement at current commit.

Like what you said, current commit manipulation could be a mix of allocatio=
ns
and removements for the payload. My thought is, conceptually, looking up th=
e
latest number of time slot is a better choice rather than the one in old st=
ate.
It's relatively intuitive to me since we are removing payload from current
payload table and which changes since last preceding commit till the moment
we're deleting the payload. Although it's unreasonable that these values ar=
e
different.

> > And with this, we can also simplify some codes. Especially remove
> > workaround in amd driver. In fact, DRM mst code maintains the payload
> > table and all the time slot info is in it already. We don't really
> > have to pass a new parameter.
>
> I agree that drm_dp_remove_payload() could be simplified, but this should=
 be
> done so that the drivers can pass the old payload state to it (without ha=
ving to
> pass the new state). This would be possible if vc_start_slot was not trac=
ked in
> the payload state (which is really not an atomic state that can be precom=
puted
> as all other atomic state), rather it would be tracked in struct
> drm_dp_mst_topology_mgr.
>

So the reason I chose to pass the new state is like what I mentioned above.=
 I
would prefer to carry the latest updated payload table instead which is in =
the new
state. And I agree with the explanation for the vc_start_slot and that's al=
so my
thought at the beginning. It could be a refactor later, but no matter the s=
tart slot
is put into payload state or the topology manager I would prefer to refer t=
o the
latest payload table rather than the number of time slot in the old state.

> It looks like AMD has to reconstruct the old state in
> dm_helpers_construct_old_payload(). Could you explain why it couldn't
> instead just pass old_payload acquired by
>
> old_mst_state =3D drm_atomic_get_old_mst_topology_state();
> old_payload =3D drm_atomic_get_mst_payload_state(old_mst_state);
>
> ?

AMD doesn't pass the drm old state to the stage while HW is deleting the pa=
yload.
The reason is that HW payload table is known during HW programming procedur=
e,
so the payload removement is based on the table at the moment. AMD expected
the current number of time slot is also already maintained in drm layer.

Again, thanks for your feedback Imre!

>
> > > >     /* Remove local payload allocation */
> > > >     list_for_each_entry(pos, &mst_state->payloads, next) {
> > > > -           if (pos !=3D new_payload && pos->vc_start_slot > new_pa=
yload-
> > > >vc_start_slot)
> > > > -                   pos->vc_start_slot -=3D old_payload->time_slots=
;
> > > > +           if (pos !=3D payload && pos->vc_start_slot > payload-
> > > >vc_start_slot)
> > > > +                   pos->vc_start_slot -=3D time_slots_to_remove;
> > > >     }
> > > > -   new_payload->vc_start_slot =3D -1;
> > > > +   payload->vc_start_slot =3D -1;
> > > >
> > > >     mgr->payload_count--;
> > > > -   mgr->next_start_slot -=3D old_payload->time_slots;
> > > > +   mgr->next_start_slot -=3D time_slots_to_remove;
> > > >
> > > > -   if (new_payload->delete)
> > > > -           drm_dp_mst_put_port_malloc(new_payload->port);
> > > > +   if (payload->delete)
> > > > +           drm_dp_mst_put_port_malloc(payload->port);
> > > >
> > > > -   new_payload->payload_allocation_status =3D
> > > DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > > > +   payload->payload_allocation_status =3D
> > > > +DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > > >  }
> >
> > --
> > Regards,
> > Wayne

--
Regards,
Wayne
