Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 499D59D13BE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 15:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B547F10E501;
	Mon, 18 Nov 2024 14:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yirO76fN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEBF10E500;
 Mon, 18 Nov 2024 14:56:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qmgq/rQA/h0KCvRo60pWG+XT3P11IpT2MVxcASclWXM15D/4fPu7+GRmsdhCA/XVVpQvEhspmmkeZhxP0d4Uj7prQ5PtCXlxt3dDB+Fs97xSVseYyCEqTNiQSAlq0aexaBbA14xqcO5vhmnYrX/4LbIzIy40uyk4helaSDBlzom5bs8umUeddRkTY7RHrnIykvPE4y4MH2Ab6LD8s3ZMlAx1l5YhyA/37luDD51VrUT0dvScK2oW+zoiTIPQj/WmbEW+AvTwG3A/1l1PuW+2qYmUXiILVnhxUJgklwPLb3vumozSQ2ZohXoCapN4wgHirXmuRxrwEUmhhcaZ96obsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89jIjXlbwwD5DbCABgI9LSSIPxP4aONd+m+FtWVjacc=;
 b=OQ35JBXwiMYuxLnvc9mxgyPIBLuv/HHN52LvidIuFJxzrhSGMUp2XJqSqkxj+bKyBOoJS924MzWIlpbhd7J9+q3gX3A1sek6/X8vpGAi7L3+INro1loYyCZV3dK0UQgYKcE3NRnIS5Z7S34IJ7VGrlDhQUvrw5dN8JSy+4/Nos+Vedewa/k1sOwq8+WZxU4xiQG680QmqwZMWvRVsvb9Hrx3jYlMqpO1ZOt90xQJVT23C2jZ8ON/UBQOdo0J469J4cOEiQNUEc80CVKsSIdNnyVzu3hbkMzNU2M0TSViLcOyn3M8uv9RUFjDKcpBWDyLZC79luZSv5MLOU/TtL+jtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89jIjXlbwwD5DbCABgI9LSSIPxP4aONd+m+FtWVjacc=;
 b=yirO76fN1odjcqBiyQ4/yEtZNZSA7GVl50y76HTxpXcW23dfsYUjw6znUNylTXiBKs4w9sDaYUMyGHDLhfswRzgYP8+178Q26jpKc+DMMqfJexMzC7kQ2EaOfuGPxL4J+6EEicFfSLpRv17al3UeBqMjh7csMObR0nHPuu8Wma4=
Received: from SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7)
 by LV2PR12MB5871.namprd12.prod.outlook.com (2603:10b6:408:174::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Mon, 18 Nov
 2024 14:56:14 +0000
Received: from SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b]) by SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b%5]) with mapi id 15.20.8137.027; Mon, 18 Nov 2024
 14:56:14 +0000
From: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v8 3/5] Documentation/gpu: Clarify drm memory stats
 definition
Thread-Topic: [PATCH v8 3/5] Documentation/gpu: Clarify drm memory stats
 definition
Thread-Index: AQHbN+JVqcQDwBErzkuJlm+rssH7qbK9H0EAgAABtzA=
Date: Mon, 18 Nov 2024 14:56:14 +0000
Message-ID: <SA1PR12MB859961AF9F43B4AE986F54C4ED272@SA1PR12MB8599.namprd12.prod.outlook.com>
References: <20241116044452.5925-1-Yunxiang.Li@amd.com>
 <20241116044452.5925-4-Yunxiang.Li@amd.com>
 <57e02488-1e6b-4e61-a082-4c54be07e071@igalia.com>
In-Reply-To: <57e02488-1e6b-4e61-a082-4c54be07e071@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=f878b7e3-4249-48b5-a0b7-451c8d977208;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-11-18T14:44:38Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8599:EE_|LV2PR12MB5871:EE_
x-ms-office365-filtering-correlation-id: 21a8c69c-e6e2-442b-90ad-08dd07e1265a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?VKkTbUGU7F4jGJ9ES1rJsLJgy39bG7pvbEMfffVGaTWNrkRf3OSckOfAJH99?=
 =?us-ascii?Q?BdK3UBQx1zvs6gOo/21nnA9aogNNNkmgMXRBBPWGCbdpVO/Y7xADikLP6vno?=
 =?us-ascii?Q?ynzY2QE1URtjBmscBy6FXqG3Oh/nAzWO5v0Yft+6K1rWMwJy8majbSzWr3t5?=
 =?us-ascii?Q?C+6XSCDT7eT0TSEhnPMqF9r4IngiXaf2nuwtYoHf9t1Qe2+2oFUIP08wKcc5?=
 =?us-ascii?Q?bTG8wD0sQxpGR+C+A8mfc0egpcmotMWSaYlcPOFjgAMOUWtb+k6VIxsq5DJ0?=
 =?us-ascii?Q?m/yWQJTPf5iNPsRDtsLDpOiG93I61gmoqm8HpBH0D9cCrqRmvXNOOX/c5QGb?=
 =?us-ascii?Q?1Hc4spFmcLeUXDa9UIIwNvt+HMadc1zsM03yQMM7w2QkSODCN4d/NcfNHvnP?=
 =?us-ascii?Q?ztfJ0mc58boALWIBezslf5kW/wgq9nDuGg9RidqBE6AEyO5XUjCuCPldYXka?=
 =?us-ascii?Q?Ld5YLu8Rk7ECxQZJPZDaFaM4OvLb7/Ejz7pJNNFD5Y67xNtnsTY7OV279mv3?=
 =?us-ascii?Q?KhNxIA9vu7popRSod3gZ1CgyMXPbH1uIw0B46iYERszQX9tRwTa0mOfKtX3e?=
 =?us-ascii?Q?3qcCiBWudTfsdcxOkXL28lUjOM9Pucq0+QXVXhN/wW7ABUyV0p8d0paJ2E1g?=
 =?us-ascii?Q?Ru0oYreN/INZ0MU9GL/GPZ3Dr6Z48sRLf2My615KAD4HZSCGSgtZvdFbrmSz?=
 =?us-ascii?Q?pbkzA/6DpTRGoD0q5a3Qa2nAiWd6gVDITi8zwkpz0svQ+0+vs5zpnm6S7Ngb?=
 =?us-ascii?Q?dc9w1gToaA/EMgsru4uD0//0FEfb/OUeQ9ZO4QxyCzAtrXRoZKoBvAZZqWDe?=
 =?us-ascii?Q?E+VsRRBfrGKMb3aJQRm0AtYT88bTm7iQNNUz0E9fLce2xSzkzA9lwHlMKXG5?=
 =?us-ascii?Q?xB60pdlJVCg85AW2fQpUbvfZvPgFbmYv/wGesO+C6Yqr9d44nin9iW1u/RxK?=
 =?us-ascii?Q?a8aQ2RDLK0d6Ta6qVGrImKa6XlXutWkiwSkD3nW+XgTG7umOPEKHSsJQ7pnj?=
 =?us-ascii?Q?m1HPkej1RSBQwCs4N6WE/jMiD2bm6fkQsIlI907uXrAiSCPvCTraSpWSm0FM?=
 =?us-ascii?Q?o8FM9EyJrU2sVaS6LTFMLBAw209T+BiviwzWQPa91uMv56pc6IYAeU9wzftm?=
 =?us-ascii?Q?4vME7Ks13x8PLGPMW0mfigKrqKSrYShPRS2HNYWPU7Ogtbr5HglJanqYIovr?=
 =?us-ascii?Q?R37YeXuZKQ/hU0WytxNamL8vVSvvgchyrUb98tHqNx/jQcXi+q7GPyDNensD?=
 =?us-ascii?Q?TFTvX0hXTBur79K/6v6PWsrqhkMxcYZniw81VRHF+m3mDd160kwHHUwta5j3?=
 =?us-ascii?Q?OUY8VY+v97tuic7D+sTmSNStEYYQpghYM5myw5HmnQe362oM7fhEpRgrwmzG?=
 =?us-ascii?Q?bTqd/HU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8599.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rD0h5NmgrKtI95ZPHJpfLnxJ+YWQ7bXoOXpzz+POKTcIN9th5IRZcwfe4VCD?=
 =?us-ascii?Q?IpiW8lHdA19dtK+tizyjgDlk6VWhxSAWdQ3jPaSYf9sGurxK01CRBRW9GY1k?=
 =?us-ascii?Q?eF6o31LVdNWFQGltZeOX+zt330E9Za0XNQ/JUkFAHzVhlZ/jKJXGNHlhHVJ8?=
 =?us-ascii?Q?ZJmrTQg5MzBz8qCLWFxaTgSFof3bcYCrCfef4O3Ee0p77ZXXOqiQFCGZpxS5?=
 =?us-ascii?Q?UrGYFv5zcWAZuwAXBVwhIo+jY88Ln8LDUA+6Kgxb1rori6p6YNlkS7aPSLmH?=
 =?us-ascii?Q?1+8b+tk+TSk8qp4lURS1Vxkq+7Dn2940OedIPXbjrWGLFthJkwSXhN5wDXfg?=
 =?us-ascii?Q?6NMdzzZfOkEut9PXdCRX61uWOpPSphgzM1xvdVRvP1o+Hhmz+LDHk73dsaQg?=
 =?us-ascii?Q?2tvIihJ/5+zZ8GQzP8SPCB69jFhbD5shWFbzMklNrteXLIhE/efvrWYf7S3R?=
 =?us-ascii?Q?nfAMbrAi+skP+I4+OIyD8oQtCNk3dtqb4fzMC+U+ATfWmz0G7okTrh6jMiJO?=
 =?us-ascii?Q?D31g8zMyadlxLND5f7AAQc2nQ3anJ0cJNswZImYFWH0DeYyihegrk2F+XAm9?=
 =?us-ascii?Q?RvG1Evy8KfkjbEfQaHmq2+0htvBZoUsiFwsVIYc5A9I6t9uLiLjmicO4y1aw?=
 =?us-ascii?Q?wtgSj8T+JURXufJIQMuNizd7V2JvGItmLWuW4muhfZog1UZoLL/S+3sCg7tS?=
 =?us-ascii?Q?38MApU8A2eBr4EotrMGBEp44b5U9FQ2oBFK5fSKmivZkqZVvNl33Q8ZRlDuV?=
 =?us-ascii?Q?0XbSz3tNatWAwMUR1Ns0Dr0xikgb/DwvMOWbeX7pyaa/foSKOspGu4EWlz19?=
 =?us-ascii?Q?2O4OgEunY2MoM44VA0Y2nwVAZES0qB+fAqfo/lS2dPSTgmgmz3GlZgH6IEHs?=
 =?us-ascii?Q?QIuRQ9avo4F1C6JSyGjztUb7bl0s9Mx7BQ81Q8RWoJQh5wMThd6Op1oJJgsB?=
 =?us-ascii?Q?NTW9+NJwaorpfGse796YseMQ3QPqeo79dW7+3afof5AuuWCsb2BwxYoFbzu1?=
 =?us-ascii?Q?NxHMBRJysvIr5eWXN8KcMl7z914VFdEmh1UkeRnaVtTUeu/r89B/1DiaB7/y?=
 =?us-ascii?Q?f9FfAPj8mTbZJMJv2iVvHE8F2bJhN6qRLWkcsZND0B6BudrHHmzFl/dWT901?=
 =?us-ascii?Q?Q+ajlfhOggMNkSY+FVGcmOakM3iZRpTihD2h/OHkjHRQt/XIN8BaAFWipKsX?=
 =?us-ascii?Q?r6oYJNgLnH/HzOT0Obexnhu9M/UsuE1+EODAW8XrtGaLVKGgWLsarD6r6c5G?=
 =?us-ascii?Q?7YAuQpWozm6sSY62Hr43VvwWlloKx7aLkCtDH8Z7VijdhRfc5uoqi55OGZj2?=
 =?us-ascii?Q?oHcmJpaLFPDp/0K7IKSsQB3DyEH1Bm0H260Bni27bz7pOp7WaxndmPULM+AF?=
 =?us-ascii?Q?cHdPs767eDyqnd+A3kt01uFKUSQIHyr35vxvdQlhnYGF7apCgEuDUjC9JESd?=
 =?us-ascii?Q?/TlJACAj5Yc/NYVLSTEcfkdGaApQNFImJ9BqlvGEq2YL7EXWw49ejX2Ae20c?=
 =?us-ascii?Q?IvbW7phEhXtooIO+9SSBNRKeDUTQPD3X66e8W/RkixTV7fodhQ6om+esQCwR?=
 =?us-ascii?Q?TKvrOUJQRbeTKUxOUow=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8599.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a8c69c-e6e2-442b-90ad-08dd07e1265a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 14:56:14.8344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eR1TeT87PwOs8g8MgUUFlMqbOA+FaHwPNhKDct0+jC5IsHb3XnXIQsDSmkV5BH/lIB6R9yHYrI8lg2N33n+hKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5871
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Sent: Monday, November 18, 2024 9:38
> On 16/11/2024 04:44, Yunxiang Li wrote:
> > Define how to handle buffers with multiple possible placement so we
> > don't get incompatible implementations. Callout the resident
> > requirement for drm-purgeable- explicitly. Remove the requirement for
> > there to be only drm-memory- or only drm-resident-, it's not what's
> > implemented and having both is better for back-compat. Also re-order
> > the paragraphs to flow better.
> >
> > Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
> > CC: dri-devel@lists.freedesktop.org
> > ---
> >   Documentation/gpu/drm-usage-stats.rst | 36 ++++++++++++--------------=
-
> >   1 file changed, 16 insertions(+), 20 deletions(-)
> >
> > diff --git a/Documentation/gpu/drm-usage-stats.rst
> > b/Documentation/gpu/drm-usage-stats.rst
> > index ff964c707754a..973663f91a292 100644
> > --- a/Documentation/gpu/drm-usage-stats.rst
> > +++ b/Documentation/gpu/drm-usage-stats.rst
> > @@ -140,13 +140,9 @@ both.
> >   Memory
> >   ^^^^^^
> >
> > -- drm-memory-<region>: <uint> [KiB|MiB]
> > -
> > -Each possible memory type which can be used to store buffer objects
> > by the -GPU in question shall be given a stable and unique name to be
> > returned as the -string here.
> > -
> > -The region name "memory" is reserved to refer to normal system memory.
> > +Each possible memory type which can be used to store buffer objects
> > +by the GPU in question shall be given a stable and unique name to be u=
sed as
> the "<region>"
> > +string. The region name "memory" is reserved to refer to normal system
> memory.
> >
> >   Value shall reflect the amount of storage currently consumed by the b=
uffer
> >   objects belong to this client, in the respective memory region.
> > @@ -154,31 +150,27 @@ objects belong to this client, in the respective =
memory
> region.
> >   Default unit shall be bytes with optional unit specifiers of 'KiB' or=
 'MiB'
> >   indicating kibi- or mebi-bytes.
> >
> > -This key is deprecated and is an alias for drm-resident-<region>.
> > Only one of -the two should be present in the output.
>
> IMO the second sentence should stay in principle (I mean at the new locat=
ion,
> where you moved it). Intent is to avoid new implementations adding both k=
eys. The
> fact amdgpu has both is not relevant for that purpose. We don't want some=
one just
> reading it is an alias and having to have any doubt whether they need to =
output both
> or not.

I see, yeah I will mention in the drm-memory- part that that tag is legacy =
amdgpu only behavior.

> > +- drm-total-<region>: <uint> [KiB|MiB]
> > +
> > +The total size of all created buffers including shared and private
> > +memory. The backing store for the buffers does not have to be
> > +currently instantiated to count under this category. To avoid double
> > +counting, if a buffer falls under multiple regions, the
> > +implementation should pick only one of the regions, and do so in a con=
sistent
> manner.
>
> Addition feels fine to me in principle. I would only suggest rewording it=
 a bit to avoid
> ambiguity about what it means to "fall under". Perhaps like this:
>
> To avoid double counting when buffers can be instantiated in one of the m=
ultiple
> allowed memory regions, the implementation should account the total again=
st only
> one of the regions, and should pick this region in a consistent manner.

Ack

> >
> >   - drm-shared-<region>: <uint> [KiB|MiB]
> >
> >   The total size of buffers that are shared with another file (e.g.,
> > have more -than a single handle).
> > -
> > -- drm-total-<region>: <uint> [KiB|MiB]
> > -
> > -The total size of all created buffers including shared and private
> > memory. The -backing store for the buffers does not have to be
> > currently instantiated to be -counted under this category.
> > +than a single handle). Same caveat as drm-total- applies.
>
> I suggest to explicitly point out the caveat is the multiple region one.

and Ack

> >
> >   - drm-resident-<region>: <uint> [KiB|MiB]
> >
> >   The total size of buffers that are resident (have their backing store=
 present or
> >   instantiated) in the specified region.
> >
> > -This is an alias for drm-memory-<region> and only one of the two
> > should be -present in the output.
>
> I think it does not harm to keep this note at both keys. Or at least make=
 one
> reference the other for this point specifically.

Might be easier to just have drm-memory- as a foot note here, instead of it=
s own section

> > -
> >   - drm-purgeable-<region>: <uint> [KiB|MiB]
> >
> > -The total size of buffers that are purgeable.
> > +The total size of buffers that are resident and purgeable.
>
> Is it not redundant? How could something not resident be purgeable in the=
 first
> place?

There is the possible confusion between buffers having a purgeable bit and =
buffers in a state that is purgeable, I feel like it's worth an explicit ca=
llout since there's also code comments about this difference.

> >   For example drivers which implement a form of 'madvise' like function=
ality can
> >   here count buffers which have instantiated backing store, but have
> > been marked @@ -192,6 +184,10 @@ One practical example of this can be
> presence of unsignaled fences in an GEM
> >   buffer reservation object. Therefore the active category is a subset =
of
> >   resident.
> >
> > +- drm-memory-<region>: <uint> [KiB|MiB]
> > +
> > +This key is deprecated and is an alias for drm-resident-<region> if pr=
esent.
> > +
> >   Implementation Details
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
>
> Regards,
>
> Tvrtko
