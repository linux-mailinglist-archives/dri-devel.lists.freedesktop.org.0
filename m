Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC8377186A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 04:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EC110E183;
	Mon,  7 Aug 2023 02:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B599910E183;
 Mon,  7 Aug 2023 02:43:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUyYdBT59faTx1QYy4OE7K886q7figcR6qOD9khVjr8tgqmMuku75kuwdZAVJ0UmQrqfiZMFig8A4nr1Jb+HTnWPJsq5Tvc0rAz8bfH3+WaBTXQDCvVbo/iVucZebcAi/0eh34Hao2MpQFUAYJsm9Y9L2W2+xJgY55KR4KfhtukBq1CTvVqCluPDxoTToeWHHKl/eYKNkgsRdGzqMHdBvnR7kUFwEXK6FCeIaANZdwQoaF4lOiMhyF89Jan62iDz9KvrUtQsBlPqcCvGRC3dYx03Gs7gl1U8vHp/9ZLThPwLce8nw1IMXw7HesT2dX6bPHcmFe5vudH4aN/TURRsmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8Hr84Vou+jL76VQ2n9kEOMgrAjcoe+VwAWA1ZOLF1o=;
 b=M5QQw20/xpZraDdG3QYxlVQpOE/jnsrlS/UeePD5qlfJ8dT6goJvbJcHeEMVsrvPknddHPEQNadlrttOXS/LZvCx6QU5OMfrpQMkKUox+GSMDwwly5u2KlYx0dFhZjP3qu56yJgAYhlJDe+sru5zMEYYYoLgr7uvOWP3EgFqVi3hJVpFmsee84MVH+cQKNfHCYaldVVVuFpumlRtLS6YXPpWVrZS8/ZAW2U1LVUQCpEhU4GTAWGfhDyKbATp7Qfhthw685wV1Okea0pcI2ziNTQLlCcLeZc7nUQfhD608u2ByK8ZlOmAasajohyPjFZm34tvEZp3ULAgPIlNrhIqqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8Hr84Vou+jL76VQ2n9kEOMgrAjcoe+VwAWA1ZOLF1o=;
 b=TrU/cAkmqnipLkOXfvjwhZ9EPt3b/jVsnxoHf8IwHkuQf1bFJw5WgiJ73kTwCA7hPz6gt38cUD1c4C9cI1AGimfWqrTQ0QI4Wt/lNXfWrkOCouikXX+eY2MWD5eydo8hz2RlE2livw8Vi6qIIeNGWlcPLRgg0q96JqzkbBhg+CA=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by PH7PR12MB6955.namprd12.prod.outlook.com (2603:10b6:510:1b8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 02:43:04 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::6c8e:fa7a:2604:da9d]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::6c8e:fa7a:2604:da9d%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 02:43:02 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "imre.deak@intel.com" <imre.deak@intel.com>
Subject: RE: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Thread-Topic: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Thread-Index: AQHZxpvrGNhE4HkDQUKz6BD10YkZXK/aRFEAgAPTpQA=
Date: Mon, 7 Aug 2023 02:43:02 +0000
Message-ID: <CO6PR12MB5489306FA44F5F107180E57DFC0CA@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20230804062029.5686-1-Wayne.Lin@amd.com>
 <20230804062029.5686-4-Wayne.Lin@amd.com>
 <ZM0Z3sZEYMcMTnuP@ideak-desk.fi.intel.com>
In-Reply-To: <ZM0Z3sZEYMcMTnuP@ideak-desk.fi.intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=91fc2051-673d-40d4-bd19-b679b1f890b1;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-07T01:57:58Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|PH7PR12MB6955:EE_
x-ms-office365-filtering-correlation-id: 495a90b5-482b-40f5-d6d7-08db96f004f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h8sInoUUEgQoul2XZvU8ARQrdPYhzgGfcJIYhHbpBaapPi+AZqiVZimZs7O9T9w5iiQbqSzmpblrot7xqgRQJtHS5QfQJw0M3Pybxlq7GBcuknx5iRTjihC5ENoSi7sAC6wq+Iyr5fgORd/V7MvdtxIjhCqeYRQ+3h0AzICUgeXC+b0J8q0G2IOWKyU2I7Igzv6IOM5uZP/aJejSZ6vBj8OpOAAJXx0R1Fso/aDfxHGBQFodmc8wpQgWYAFOGhuHRbow8FScQk1qnB4zuC6JN7zUj73S24sXNN/LTBUTXf7QagVtUqtD/acL7YnDzdCcI9hO70v6Orr0YBeiBYrW1QTF/lh5brU3IJI1guP5onTXl/euitzQcEWaWyFwOGV7AOQT1W5aiy3hxJzBPM+BfBsUEf3jm1dU/Yis3lr/zEFEBLqd1yPoxxeoV+4d+ryMqHSrEL9l/2/iheoUnNLpTcxJ80daEOPrZtx9mFWhe3nsmt5sab7G0gtFpyPa1SDZQYMnp+43ELUeMKsDCuK2+jBrpIeapkAls2COXrAUekmX9zZs305aeR7x09txc0r+KNneKFO9VWZPR3nn1M1mBe7XRRag31E1w+tJFzewbMpC9EXlviR8Jwx5STh9O1re
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(451199021)(1800799003)(186006)(55016003)(7696005)(71200400001)(9686003)(478600001)(33656002)(86362001)(122000001)(26005)(6506007)(53546011)(55236004)(41300700001)(316002)(5660300002)(8936002)(8676002)(52536014)(38070700005)(54906003)(38100700002)(4326008)(6916009)(2906002)(66556008)(66476007)(66446008)(64756008)(66946007)(76116006)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XAfXQxbyagjsyY01b2lRrCUBGirfj21tOSfz6lo0nGv9Ywr8BcLi82xC8OFb?=
 =?us-ascii?Q?u+U8knPZcJt4e8UB9LBG59KflVbrSJ6YIucAwVvxykdTJWmMLXb7d5Cw1Ms8?=
 =?us-ascii?Q?/5/1n4qDyccz8Bwhcfku5/tKkMJ27WXKeJ7456GxvDqgiQTG2L+mGB6MIQvd?=
 =?us-ascii?Q?Z29f6opJbPMyYBeC2SvTU2mgTyyqQjknUpfAbPoOxPP4UoEGLuF7jcCYEZa0?=
 =?us-ascii?Q?YM8YVmpn64LdgKZh2inJqavKkX32Np9tDO5pnhfr/fjIQPvc94q4wTELzKw1?=
 =?us-ascii?Q?OC8hs5zGFqhDZVUIAFFChMcFQMFhTiZcsDNkb16R44DdFXNH5lorhIRiJKHy?=
 =?us-ascii?Q?cOW7nf+eZ3hyKaZATsVRjSQXVq4bqmsTY6wxZi90MXuRN15rhoH6yFMs1Kyf?=
 =?us-ascii?Q?ZNZI9so0l2woKAbBSQk6l2QKGZRLYDc83YDi8jAsPXttjIn05iz7V48+J4+L?=
 =?us-ascii?Q?loBsmxZXgWbDS3Lhsl0f4yEHkeMaJnCsM1TwQBVXBNku9PUFzvN3tePSGE2N?=
 =?us-ascii?Q?rw84ADo6qCZMU6TU5Bm3aczfXEW6ZNrNctIiNfd/RdJ6IaUcu7ET/jR7/o0w?=
 =?us-ascii?Q?TfyXo+Hg2PuDZvhMEVxJ8uvBsWwvEXILLSEmEe+zmTWEuFJxHO29+VEYgRi5?=
 =?us-ascii?Q?eZI0V76kce6ffbLJfLo1yIIITFPTxCkSKTwqBjtUEQWmViqTRqoWBBIMmNnk?=
 =?us-ascii?Q?c3c+ajGcfXDIIIOt3CANw/4g2S90tElpN5QoG2AIXVqhD0ReKEuAFuLStZ2Z?=
 =?us-ascii?Q?f0bXjWBnCD2MOp1yrZQ8aM8xpi5UkrscGcY2tdMbzOKuAOARnhIUgre+bUFI?=
 =?us-ascii?Q?u2+51E+0pwP7v8AgBHhzRPB95FAvYniG0d3h5HN5DgFInvF65vSQgga+SpQ+?=
 =?us-ascii?Q?x3aaSPziWQWC6mLFzUZkZcBFeXIooUra/RDXF9UNSIa1ry6iNykfJ2CSS5ne?=
 =?us-ascii?Q?/tKyUAszZu/yuGpguxPRiBaF9Xb7/tG4mz85os8UJBpZHnFJgqP/WWZUj9mi?=
 =?us-ascii?Q?dVSKQ6fZhJyKh9k6HupjUOaH3+7ledtuON5zo+dXu6rkhVa/mkhH+DflMn4W?=
 =?us-ascii?Q?Ce+MUyq/rP+FyFh9NgVmeWzqLa7iP9RQ5KdFIcvlKd5xf99wORftS9F6g1BY?=
 =?us-ascii?Q?yNSjq33nWDjyGD5Am71ddKCLQsP771abG8b8+8mbxZ9qplO8QRC/DrqniB/N?=
 =?us-ascii?Q?KcEq1We4eRenokXerIPxJNMY5MY4pqMxWQ1UdQt0oVIssVDPLV6u2msUsOaS?=
 =?us-ascii?Q?MMD/FAf21v3bGLfdRj43SqQSMFsNr6I0JGwui4gwvKQGUIOqsbN1DNTJPVse?=
 =?us-ascii?Q?3bs0dlXmhKQCVk9dHXFBiKULihd5rkGDObPqAcYlpI+kLudS2wMd6pIUYBC5?=
 =?us-ascii?Q?FMbQevCCgDrUZA6J4KdU5Op+AZ03DgNYS10o0yx38HhLaFLLHELaQttsFNI+?=
 =?us-ascii?Q?VHDT7meveK8OTQfKE34D1PofXpBDw/Jxit2B65w5SuFhQjwM4Ua3ir0S2HIn?=
 =?us-ascii?Q?AnRh7Z13bFdjcBJ7ybG5OwQ4A8wSHGLW22LTydkXb57fc7YX7k/eSJpJoD13?=
 =?us-ascii?Q?+NypBgBoXjLCF/N10C8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 495a90b5-482b-40f5-d6d7-08db96f004f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2023 02:43:02.2201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +leIYUETNPiyp7xCvnE8ActT3o6gMskLKTRH7IQX0Qs4Gctd2q46wta0IFMeUb/w+lW383mE/BlMccqyXM3Wwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6955
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
> Sent: Friday, August 4, 2023 11:32 PM
> To: Lin, Wayne <Wayne.Lin@amd.com>
> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> lyude@redhat.com; jani.nikula@intel.com; ville.syrjala@linux.intel.com;
> Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> <Jerry.Zuo@amd.com>
> Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> drm_dp_remove_payload_part2()
>
> On Fri, Aug 04, 2023 at 02:20:29PM +0800, Wayne Lin wrote:
> > [...]
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index e04f87ff755a..4270178f95f6 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -3382,8 +3382,7 @@
> EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> >   * drm_dp_remove_payload_part2() - Remove an MST payload locally
> >   * @mgr: Manager to use.
> >   * @mst_state: The MST atomic state
> > - * @old_payload: The payload with its old state
> > - * @new_payload: The payload with its latest state
> > + * @payload: The payload with its latest state
> >   *
> >   * Updates the starting time slots of all other payloads which would h=
ave
> been shifted towards
> >   * the start of the payload ID table as a result of removing a
> > payload. Driver should call this @@ -3392,25 +3391,36 @@
> EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> >   */
> >  void drm_dp_remove_payload_part2(struct drm_dp_mst_topology_mgr
> *mgr,
> >                              struct drm_dp_mst_topology_state
> *mst_state,
> > -                            const struct drm_dp_mst_atomic_payload
> *old_payload,
> > -                            struct drm_dp_mst_atomic_payload
> *new_payload)
> > +                            struct drm_dp_mst_atomic_payload
> *payload)
> >  {
> >     struct drm_dp_mst_atomic_payload *pos;
> > +   u8 time_slots_to_remove;
> > +   u8 next_payload_vc_start =3D mgr->next_start_slot;
> > +
> > +   /* Find the current allocated time slot number of the payload */
> > +   list_for_each_entry(pos, &mst_state->payloads, next) {
> > +           if (pos !=3D payload &&
> > +               pos->vc_start_slot > payload->vc_start_slot &&
> > +               pos->vc_start_slot < next_payload_vc_start)
> > +                   next_payload_vc_start =3D pos->vc_start_slot;
> > +   }
> > +
> > +   time_slots_to_remove =3D next_payload_vc_start -
> > +payload->vc_start_slot;
>
> Imo, the intuitive way would be to pass the old payload state to this fun=
ction -
> which already contains the required time_slots param - and refactor thing=
s
> instead moving vc_start_slot from the payload state to mgr suggested by V=
ille
> earlier.
>
> --Imre

Hi Imre,
Thanks for your feedback!
I understand it's functionally correct. But IMHO, it's still a bit conceptu=
ally
different between the time slot in old state and the time slot in current p=
ayload
table. My thought is the time slot at the moment when we are removing the
payload would be a better choice. And with this, we can also simplify some
codes. Especially remove workaround in amd driver. In fact, DRM mst code
maintains the payload table and all the time slot info is in it already. We=
 don't
really have to pass a new parameter.

>
> >     /* Remove local payload allocation */
> >     list_for_each_entry(pos, &mst_state->payloads, next) {
> > -           if (pos !=3D new_payload && pos->vc_start_slot > new_payloa=
d-
> >vc_start_slot)
> > -                   pos->vc_start_slot -=3D old_payload->time_slots;
> > +           if (pos !=3D payload && pos->vc_start_slot > payload-
> >vc_start_slot)
> > +                   pos->vc_start_slot -=3D time_slots_to_remove;
> >     }
> > -   new_payload->vc_start_slot =3D -1;
> > +   payload->vc_start_slot =3D -1;
> >
> >     mgr->payload_count--;
> > -   mgr->next_start_slot -=3D old_payload->time_slots;
> > +   mgr->next_start_slot -=3D time_slots_to_remove;
> >
> > -   if (new_payload->delete)
> > -           drm_dp_mst_put_port_malloc(new_payload->port);
> > +   if (payload->delete)
> > +           drm_dp_mst_put_port_malloc(payload->port);
> >
> > -   new_payload->payload_allocation_status =3D
> DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > +   payload->payload_allocation_status =3D
> > +DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> >  }

--
Regards,
Wayne
