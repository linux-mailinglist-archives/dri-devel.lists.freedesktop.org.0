Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFE25B2EE3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DAA88867;
	Fri,  9 Sep 2022 06:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D12F10EBE0;
 Fri,  9 Sep 2022 06:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662704963; x=1694240963;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c73jUdeN33Wj9RoO67JhxUunFy4FMoD/PiK1voBICjE=;
 b=KBh49YJ2wg8UYfN3OgjC+mvRSbbGI62CAeId/w3xD+KIqge93boI2t5+
 c9sosImdMqqdloSYqUdkdhqr9a9Qt1QnZfv50oKaDnHN0/FD3yg1uwsjX
 b3sU/Ut1mZzCndaGJlpY2hJQsf/1PmVxfu8h/U8bibRoVozobWhu6kYy4
 9DnwUki3oan0Uy4F3lWxkhyhRCBijZeVL3JzvnwFnwVMcR8+GQh23iKbB
 EqGVlx+oVJC4r/BIVk1iTmdZdl0vC8PfswD3q14ntt68OsVBiws1Nsvyl
 Y+iBPfu1ahHGJtnz1BXrabOG3WWMjKD5ym0cwrilUNqRN22wyfWOXFFet A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="284428167"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="284428167"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 23:29:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="740949558"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 08 Sep 2022 23:29:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 23:29:21 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 23:29:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 23:29:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 23:29:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlEQh4yFhmcQjU11Mml5431IbT55uHbJxVZLgj5Iw8ffTS+kBwY4OxqF7b3O/lvNWIRHSoQUch9eC/GebtLA3+CDJRoySfh22I9p+5Ep4wbtWvq8oK4qIJvw9jSJ2Gdfwhc4RduR8LIx3C4qrBqMzQQdGn21ZMCrCqzpwsRGwzLDij7YNzpaiXxoDYbzIzHWXeSFdgUq9ZFdmz/Fy1Kg5iYPZEvRe2n6YKsEAtPIrt8y3VCFLGYeLKNSlwexvBvf9aX2uZc3TzoxKA9prwLGCPfXbOubD8bWaciasBWgIrqzdwk1uVFr69gNlTFggI+qMKPl5H8f10bVdeunQIoMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZ8aeqMf/w63fm47h4fh3upBecetyFeo3SANu8MY8ow=;
 b=C26wCWeA+QS18wjZ2Goiw2ilgr4fsFAvAG23hl9vSbCfhEhOqJZ3CaON/chFIaVJkswZH/D/sI9n148m9QjcO8GoK0Yc2POQSexxzg0h1ps4WwCZoZGedFopVuBYNsv4ZN58Qd3UiLtkxNk0Fquq3ttD8g65yxihPigJ2rFfZK6g1Gh51pIzbF5cVpCH8HJvSgv9BWVD0iM5b8YfJhj0Jtc/TCqn6/gKYyZVEqQhaBqvpjGsVHvEcxfcpzT7WPF74y/AgHRQJXb2dUeYbL2X7Mc1uRQd8Jc9oYqB0HO0ya7XtlmZGSoP/wQHz88nj8Mh1U6ZZL6BwU4Mw/OGzJ6cuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4093.namprd11.prod.outlook.com (2603:10b6:208:13f::21)
 by BL1PR11MB6028.namprd11.prod.outlook.com (2603:10b6:208:393::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Fri, 9 Sep
 2022 06:29:06 +0000
Received: from MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3]) by MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3%5]) with mapi id 15.20.5588.023; Fri, 9 Sep 2022
 06:29:06 +0000
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH v4 01/15] mei: add support to GSC extended header
Thread-Topic: [PATCH v4 01/15] mei: add support to GSC extended header
Thread-Index: AQHYw+FxP14x1Yi3GkKP1KLEadeeMK3WnkSAgAAEPJA=
Date: Fri, 9 Sep 2022 06:29:06 +0000
Message-ID: <MN2PR11MB409396C135A40653FC6EF742E5439@MN2PR11MB4093.namprd11.prod.outlook.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
 <20220909001612.728451-2-daniele.ceraolospurio@intel.com>
 <YxrZF46WTxKa9nf2@kroah.com>
In-Reply-To: <YxrZF46WTxKa9nf2@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 532ac591-6854-4f2c-f1c5-08da922c9882
x-ms-traffictypediagnostic: BL1PR11MB6028:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XywRE+C3SRmpHACpVItvqERW8R7S0u7NCwrun2zyIcX9VbKz8h28Ksc6GWYnH67Uzl42Zej3haN0E5erqUvqFB8v3UGLD1PoEeCaAIEIbmtK6WCO5C04kFrZeQNPCPKvO7xrIjmhdK+zlbIEJswPHCqeYPCncbjyFJh7I7Rb+014cyWg0+fvLg+WtQZ2rertrw20/iIg4abk3iaLdYDOt3RNUVO+XqUtFr5umP+AD9GO4GNLVtFbAIlGXJlqdj4o6CBYQzB4ec7Cybysi0BmO7Scn1ilK5VbBrVx4YPENJV+QeNpkvXokgzFa7bDj2nPqeDWuG06o5OFW2FlKnHuHcvxSXaf1ggEA53iKYsr3zOc/LkQtvnr8eZJnANuTOJ6PqkKaIWF28Ee1BEIalFCSPfKbRPPFQ74Y+68o5Ng1+EYcRiLAu4612MsmohJxL2G7ywJvk8FYPVV/Symqp7g46N5sEFGbfbCck61m9ba5oLoV7zXD4FhKlfYpAoE5hURCfK/cEfvL5PpOL3SdQBJZjXitFI3OdlFklw8Lwasc6rRLaUdhJMH3RN+58yi/fBhWR6S+ROPvejA4RfpnyFhMA622EdnhsIxNw8sIVqh1zb/qvVJlrRyh1BX5iQbGbSrqEvRp1t8CrDwV0vNR9V++RzG7LjIiTrbhLr0qqNsFf54lDUK6qJc6PL2WiMU7BByfH5uhXpTTKI7eZysg0zZsPpWD4VUp0Rs/Te2cWQUeuTyKLEPsNHC7fpezXsmOZ3q3GM2J/FHvmeN29T0AuD+Vw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4093.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(39860400002)(346002)(366004)(376002)(71200400001)(7696005)(55016003)(66476007)(6636002)(122000001)(316002)(54906003)(110136005)(38100700002)(478600001)(5660300002)(83380400001)(8676002)(82960400001)(66946007)(64756008)(4326008)(6506007)(66446008)(26005)(66556008)(8936002)(186003)(86362001)(76116006)(9686003)(52536014)(38070700005)(2906002)(33656002)(30864003)(41300700001)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/xeGky6Jspoy2PyQuuiEvkcQmwKvlcvigZMpKVg+Ezk1GvqoUQDPPdfKzYSm?=
 =?us-ascii?Q?kCfmkjYDYOsUzUrp1f3gvCdThhQSCQytFyp+K0JvezyhLq4c7A2KMxXS/0b9?=
 =?us-ascii?Q?X8U45+1065rRfX3xCzZ3tjhWSOgpGcz5AlP8fJgBjj86Xiw2etFjts4TXI7b?=
 =?us-ascii?Q?LtchAaXkbCgAMshmz+TPvD+MowfZ5cfmJYeO7ZSepskVj62DUJ/WBn+uTcFH?=
 =?us-ascii?Q?uIsE1RmezVITaiBhRgDWH82QTlxJedWtnLB5HIAqE+DDIJGDcFKGtUs+Mgi5?=
 =?us-ascii?Q?Ko1Z6ve5EVPw5sEHH9IclXcbyMr+UKqRoShCcO0I56QL4VPvhhAb1sT9UtMp?=
 =?us-ascii?Q?TD9Q5/5RfAbQBSi/bAaBB9i+Eqr8eOflM3f03+Kl9D70IsRKoBDSY85bv6Oy?=
 =?us-ascii?Q?AM7pvrnkeIEAKL0evqKV6rwQ5zWIf1ctI+7te3+wfJHsLIv275teIxSyeifj?=
 =?us-ascii?Q?3ibP2ltEBZ0gbciUX0g6jjqygSGjeVvenztMQ32SdJNRIDAtpy0+6s3DLp45?=
 =?us-ascii?Q?rF52iT8eiJ2HLGS8s1NWINkHvFIpcbuOnynrh0AGvGwZ6Nl/Qkv6uu3Z+1mh?=
 =?us-ascii?Q?RX/U5XgG/Shu8VK7+7ZCYzqJRZe5zxahG5evigpJAFm3X5iiUSaJUx0y1/sC?=
 =?us-ascii?Q?tK4PMnR6OulJQM7OXPPLAyBPC1WTW8nAJZlAQUb0esTy1tG7XTNiGuFVkMLs?=
 =?us-ascii?Q?zJ37c8jA2ln2YR+rkpE1S10wmCF9vEKPLi4EAZDbHT5ixQhekJmzl6UJImrd?=
 =?us-ascii?Q?5kAtZ2jfF9PGsr3gjpcE/meKt88uKVMl0gTc2fyKik7VBOSXqWwDi7U/04td?=
 =?us-ascii?Q?X2Z+2hZKiI3TcseCanZ4HpseqJJgSxGAfKufqgPbGhIGGCVnnQ8QhoWXrOmY?=
 =?us-ascii?Q?nI6mdnDGAAWklDmSLbgb5uMHH4cxQ8j74KWUkNZKReGGNIo/Umtj8BJUmbH0?=
 =?us-ascii?Q?COEibwaXGIzZqU6unTujeARtJTcpdgaf69e2lonLZC4aF9eYziwdFUZ74u8f?=
 =?us-ascii?Q?UiLdRXV0lKiqIhNx5yWIVTG2Rp4SewQ/r+k+CHwOoGiFtDrjrAR3FnKAdLkj?=
 =?us-ascii?Q?bDrUBinb2/4sFYdhZauqfG/VYS6z6T635fPBsusa4XhqTAOtmwAjbGxfPpk8?=
 =?us-ascii?Q?UpYoRhv9rjpeJ9ICHD9aKyBHP9ovZ0/MfIJt1Ygka3MhpjUGAI8l5HJZd/vn?=
 =?us-ascii?Q?evDLd88ECZzmi4s/ugd8cEebR4GHKZnwQRwDpOg4NvH/YfyHeIjlQRtzi6dK?=
 =?us-ascii?Q?1hiOq+KE8OVOqJ6D4X1MaS5yP4E8Sx9rYB+K+Nb5KDhySiY3lIYm7eSOjFJo?=
 =?us-ascii?Q?T1rfVgokIXOVpinrib1B2PVPyZlNwfVntmwNflvXKlFJXkZzqoKhwyd/KQVN?=
 =?us-ascii?Q?XuhM/H1lm7cY+t6PJQ1xoi5CrRoi6cHKaPiel+g56jXNIHu1BiHTo+oG98qG?=
 =?us-ascii?Q?DVkDWzR9hjozbDbMF9/yy07gJDzbtDCUFAdSwaFRDCxXBgF3rTI3uC23pDmL?=
 =?us-ascii?Q?Jat9JF/B9uijYauWEwqfGGe7t/+E0nw3ejy6S/MqGJ29KPkEffydRXpjeNt5?=
 =?us-ascii?Q?Ay0Id1c6SKY5b9OIwna2yvdcGHz1zX3OJ71N2uR+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 532ac591-6854-4f2c-f1c5-08da922c9882
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 06:29:06.1124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wd8mYsu5q7oSSoVkzcgt/H1sl3clPzp/uIXIh4IYnN49+WDBWZc6pamMjcJdifKKyhR7YQEbZ9IRnBX64op9Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6028
X-OriginatorOrg: intel.com
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Lubart, Vitaly" <vitaly.lubart@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> On Thu, Sep 08, 2022 at 05:15:58PM -0700, Daniele Ceraolo Spurio wrote:
> > From: Tomas Winkler <tomas.winkler@intel.com>
> >
> > GSC extend header is of variable size and data is provided in a sgl
> > list inside the header and not in the data buffers, need to enable the
> > path.
> >
> > V2:
> > 1. Add missing kdoc for mei_cl_cb
> > 2. In mei_me_hbuf_write()
> >    use dev_err() when validationg parameters instead of WARN_ON()
>=20
> This stuff goes below the --- line, as the documentation states, right?
> Why is it here?
Right,  miscommunication between me and Daniele, the issue is that=20
What is under line goes away when patch is applied, so it was temporary
In the body, it should go under line when posted public.=20
Will fix.
=20
Thanks
Tomas=20
>=20
> >
> > Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> > Signed-off-by: Daniele Ceraolo Spurio
> > <daniele.ceraolospurio@intel.com>
> > Cc: Vitaly Lubart <vitaly.lubart@intel.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  drivers/misc/mei/client.c    | 55 ++++++++++++++++++++++++----------
> >  drivers/misc/mei/hbm.c       | 13 ++++++++
> >  drivers/misc/mei/hw-me.c     |  7 ++++-
> >  drivers/misc/mei/hw.h        | 57
> ++++++++++++++++++++++++++++++++++++
> >  drivers/misc/mei/interrupt.c | 47 ++++++++++++++++++++++++-----
> >  drivers/misc/mei/mei_dev.h   |  4 +++
> >  6 files changed, 160 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
> > index 0b2fbe1335a7..6c8b71ae32c8 100644
> > --- a/drivers/misc/mei/client.c
> > +++ b/drivers/misc/mei/client.c
> > @@ -322,6 +322,7 @@ void mei_io_cb_free(struct mei_cl_cb *cb)
> >
> >  	list_del(&cb->list);
> >  	kfree(cb->buf.data);
> > +	kfree(cb->ext_hdr);
> >  	kfree(cb);
> >  }
> >
> > @@ -401,6 +402,7 @@ static struct mei_cl_cb *mei_io_cb_init(struct
> mei_cl *cl,
> >  	cb->buf_idx =3D 0;
> >  	cb->fop_type =3D type;
> >  	cb->vtag =3D 0;
> > +	cb->ext_hdr =3D NULL;
> >
> >  	return cb;
> >  }
> > @@ -1740,6 +1742,17 @@ static inline u8 mei_ext_hdr_set_vtag(void *ext,
> u8 vtag)
> >  	return vtag_hdr->hdr.length;
> >  }
> >
> > +static inline bool mei_ext_hdr_is_gsc(struct mei_ext_hdr *ext) {
> > +	return ext && ext->type =3D=3D MEI_EXT_HDR_GSC; }
> > +
> > +static inline u8 mei_ext_hdr_set_gsc(struct mei_ext_hdr *ext, struct
> > +mei_ext_hdr *gsc_hdr) {
> > +	memcpy(ext, gsc_hdr, mei_ext_hdr_len(gsc_hdr));
> > +	return ext->length;
> > +}
> > +
> >  /**
> >   * mei_msg_hdr_init - allocate and initialize mei message header
> >   *
> > @@ -1752,14 +1765,17 @@ static struct mei_msg_hdr
> *mei_msg_hdr_init(const struct mei_cl_cb *cb)
> >  	size_t hdr_len;
> >  	struct mei_ext_meta_hdr *meta;
> >  	struct mei_msg_hdr *mei_hdr;
> > -	bool is_ext, is_vtag;
> > +	bool is_ext, is_hbm, is_gsc, is_vtag;
> > +	struct mei_ext_hdr *next_ext;
> >
> >  	if (!cb)
> >  		return ERR_PTR(-EINVAL);
> >
> >  	/* Extended header for vtag is attached only on the first fragment */
> >  	is_vtag =3D (cb->vtag && cb->buf_idx =3D=3D 0);
> > -	is_ext =3D is_vtag;
> > +	is_hbm =3D cb->cl->me_cl->client_id =3D=3D 0;
> > +	is_gsc =3D ((!is_hbm) && cb->cl->dev->hbm_f_gsc_supported &&
> mei_ext_hdr_is_gsc(cb->ext_hdr));
> > +	is_ext =3D is_vtag || is_gsc;
> >
> >  	/* Compute extended header size */
> >  	hdr_len =3D sizeof(*mei_hdr);
> > @@ -1771,6 +1787,9 @@ static struct mei_msg_hdr
> *mei_msg_hdr_init(const struct mei_cl_cb *cb)
> >  	if (is_vtag)
> >  		hdr_len +=3D sizeof(struct mei_ext_hdr_vtag);
> >
> > +	if (is_gsc)
> > +		hdr_len +=3D mei_ext_hdr_len(cb->ext_hdr);
> > +
> >  setup_hdr:
> >  	mei_hdr =3D kzalloc(hdr_len, GFP_KERNEL);
> >  	if (!mei_hdr)
> > @@ -1785,10 +1804,20 @@ static struct mei_msg_hdr
> *mei_msg_hdr_init(const struct mei_cl_cb *cb)
> >  		goto out;
> >
> >  	meta =3D (struct mei_ext_meta_hdr *)mei_hdr->extension;
> > +	meta->size =3D 0;
> > +	next_ext =3D (struct mei_ext_hdr *)meta->hdrs;
> >  	if (is_vtag) {
> >  		meta->count++;
> > -		meta->size +=3D mei_ext_hdr_set_vtag(meta->hdrs, cb-
> >vtag);
> > +		meta->size +=3D mei_ext_hdr_set_vtag(next_ext, cb->vtag);
> > +		next_ext =3D mei_ext_next(next_ext);
> > +	}
> > +
> > +	if (is_gsc) {
> > +		meta->count++;
> > +		meta->size +=3D mei_ext_hdr_set_gsc(next_ext, cb-
> >ext_hdr);
> > +		next_ext =3D mei_ext_next(next_ext);
> >  	}
> > +
> >  out:
> >  	mei_hdr->length =3D hdr_len - sizeof(*mei_hdr);
> >  	return mei_hdr;
> > @@ -1812,14 +1841,14 @@ int mei_cl_irq_write(struct mei_cl *cl, struct
> mei_cl_cb *cb,
> >  	struct mei_msg_hdr *mei_hdr =3D NULL;
> >  	size_t hdr_len;
> >  	size_t hbuf_len, dr_len;
> > -	size_t buf_len;
> > +	size_t buf_len =3D 0;
> >  	size_t data_len;
> >  	int hbuf_slots;
> >  	u32 dr_slots;
> >  	u32 dma_len;
> >  	int rets;
> >  	bool first_chunk;
> > -	const void *data;
> > +	const void *data =3D NULL;
> >
> >  	if (WARN_ON(!cl || !cl->dev))
> >  		return -ENODEV;
> > @@ -1839,8 +1868,10 @@ int mei_cl_irq_write(struct mei_cl *cl, struct
> mei_cl_cb *cb,
> >  		return 0;
> >  	}
> >
> > -	buf_len =3D buf->size - cb->buf_idx;
> > -	data =3D buf->data + cb->buf_idx;
> > +	if (buf->data) {
> > +		buf_len =3D buf->size - cb->buf_idx;
> > +		data =3D buf->data + cb->buf_idx;
> > +	}
> >  	hbuf_slots =3D mei_hbuf_empty_slots(dev);
> >  	if (hbuf_slots < 0) {
> >  		rets =3D -EOVERFLOW;
> > @@ -1858,9 +1889,6 @@ int mei_cl_irq_write(struct mei_cl *cl, struct
> mei_cl_cb *cb,
> >  		goto err;
> >  	}
> >
> > -	cl_dbg(dev, cl, "Extended Header %d vtag =3D %d\n",
> > -	       mei_hdr->extended, cb->vtag);
> > -
> >  	hdr_len =3D sizeof(*mei_hdr) + mei_hdr->length;
> >
> >  	/**
> > @@ -1889,7 +1917,7 @@ int mei_cl_irq_write(struct mei_cl *cl, struct
> mei_cl_cb *cb,
> >  	}
> >  	mei_hdr->length +=3D data_len;
> >
> > -	if (mei_hdr->dma_ring)
> > +	if (mei_hdr->dma_ring && buf->data)
> >  		mei_dma_ring_write(dev, buf->data + cb->buf_idx,
> buf_len);
> >  	rets =3D mei_write_message(dev, mei_hdr, hdr_len, data, data_len);
> >
> > @@ -1983,9 +2011,6 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct
> mei_cl_cb *cb)
> >  		goto err;
> >  	}
> >
> > -	cl_dbg(dev, cl, "Extended Header %d vtag =3D %d\n",
> > -	       mei_hdr->extended, cb->vtag);
> > -
> >  	hdr_len =3D sizeof(*mei_hdr) + mei_hdr->length;
> >
> >  	if (rets =3D=3D 0) {
> > @@ -2030,7 +2055,7 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct
> > mei_cl_cb *cb)
> >
> >  	mei_hdr->length +=3D data_len;
> >
> > -	if (mei_hdr->dma_ring)
> > +	if (mei_hdr->dma_ring && buf->data)
> >  		mei_dma_ring_write(dev, buf->data, buf_len);
> >  	rets =3D mei_write_message(dev, mei_hdr, hdr_len, data, data_len);
> >
> > diff --git a/drivers/misc/mei/hbm.c b/drivers/misc/mei/hbm.c index
> > de712cbf5d07..12a62a911e42 100644
> > --- a/drivers/misc/mei/hbm.c
> > +++ b/drivers/misc/mei/hbm.c
> > @@ -340,9 +340,13 @@ static int mei_hbm_capabilities_req(struct
> mei_device *dev)
> >  	req.hbm_cmd =3D MEI_HBM_CAPABILITIES_REQ_CMD;
> >  	if (dev->hbm_f_vt_supported)
> >  		req.capability_requested[0] |=3D HBM_CAP_VT;
> > +
> >  	if (dev->hbm_f_cd_supported)
> >  		req.capability_requested[0] |=3D HBM_CAP_CD;
> >
> > +	if (dev->hbm_f_gsc_supported)
> > +		req.capability_requested[0] |=3D HBM_CAP_GSC;
> > +
> >  	ret =3D mei_hbm_write_message(dev, &mei_hdr, &req);
> >  	if (ret) {
> >  		dev_err(dev->dev,
> > @@ -1200,6 +1204,12 @@ static void mei_hbm_config_features(struct
> mei_device *dev)
> >  	     dev->version.minor_version >=3D HBM_MINOR_VERSION_VT))
> >  		dev->hbm_f_vt_supported =3D 1;
> >
> > +	/* GSC support */
> > +	if (dev->version.major_version > HBM_MAJOR_VERSION_GSC ||
> > +	    (dev->version.major_version =3D=3D HBM_MAJOR_VERSION_GSC &&
> > +	     dev->version.minor_version >=3D HBM_MINOR_VERSION_GSC))
> > +		dev->hbm_f_gsc_supported =3D 1;
> > +
> >  	/* Capability message Support */
> >  	dev->hbm_f_cap_supported =3D 0;
> >  	if (dev->version.major_version > HBM_MAJOR_VERSION_CAP ||
> @@ -1367,6
> > +1377,9 @@ int mei_hbm_dispatch(struct mei_device *dev, struct
> mei_msg_hdr *hdr)
> >  		if (!(capability_res->capability_granted[0] & HBM_CAP_CD))
> >  			dev->hbm_f_cd_supported =3D 0;
> >
> > +		if (!(capability_res->capability_granted[0] &
> HBM_CAP_GSC))
> > +			dev->hbm_f_gsc_supported =3D 0;
> > +
> >  		if (dev->hbm_f_dr_supported) {
> >  			if (mei_dmam_ring_alloc(dev))
> >  				dev_info(dev->dev, "running w/o dma
> ring\n"); diff --git
> > a/drivers/misc/mei/hw-me.c b/drivers/misc/mei/hw-me.c index
> > 9e2f781c6ed5..da4ef0b51954 100644
> > --- a/drivers/misc/mei/hw-me.c
> > +++ b/drivers/misc/mei/hw-me.c
> > @@ -590,9 +590,14 @@ static int mei_me_hbuf_write(struct mei_device
> *dev,
> >  	u32 dw_cnt;
> >  	int empty_slots;
> >
> > -	if (WARN_ON(!hdr || !data || hdr_len & 0x3))
> > +	if (WARN_ON(!hdr || hdr_len & 0x3))
> >  		return -EINVAL;
>=20
> Again, please remove the WARN_ON(), don't add to it.
>=20
> >
> > +	if (!data && data_len) {
> > +		dev_err(dev->dev, "wrong parameters null data with
> data_len =3D %zu\n", data_len);
> > +		return -EINVAL;
> > +	}
> > +
> >  	dev_dbg(dev->dev, MEI_HDR_FMT, MEI_HDR_PRM((struct
> mei_msg_hdr
> > *)hdr));
> >
> >  	empty_slots =3D mei_hbuf_empty_slots(dev); diff --git
> > a/drivers/misc/mei/hw.h b/drivers/misc/mei/hw.h index
> > e7e020dba6b1..14f89d96216b 100644
> > --- a/drivers/misc/mei/hw.h
> > +++ b/drivers/misc/mei/hw.h
> > @@ -92,6 +92,12 @@
> >  #define HBM_MINOR_VERSION_VT               2
> >  #define HBM_MAJOR_VERSION_VT               2
> >
> > +/*
> > + * MEI version with GSC support
> > + */
> > +#define HBM_MINOR_VERSION_GSC              2
> > +#define HBM_MAJOR_VERSION_GSC              2
> > +
> >  /*
> >   * MEI version with capabilities message support
> >   */
> > @@ -229,10 +235,12 @@ enum mei_cl_disconnect_status {
> >   *
> >   * @MEI_EXT_HDR_NONE: sentinel
> >   * @MEI_EXT_HDR_VTAG: vtag header
> > + * @MEI_EXT_HDR_GSC: gsc header
> >   */
> >  enum mei_ext_hdr_type {
> >  	MEI_EXT_HDR_NONE =3D 0,
> >  	MEI_EXT_HDR_VTAG =3D 1,
> > +	MEI_EXT_HDR_GSC =3D 2,
> >  };
> >
> >  /**
> > @@ -305,6 +313,39 @@ static inline bool mei_ext_last(struct
> mei_ext_meta_hdr *meta,
> >  	return (u8 *)ext >=3D (u8 *)meta + sizeof(*meta) + (meta->size * 4);
> > }
> >
> > +struct mei_gsc_sgl {
> > +	u32 low;
> > +	u32 high;
> > +	u32 length;
> > +} __packed;
> > +
> > +#define GSC_HECI_MSG_KERNEL 0
> > +#define GSC_HECI_MSG_USER   1
> > +
> > +#define GSC_ADDRESS_TYPE_GTT   0
> > +#define GSC_ADDRESS_TYPE_PPGTT 1
> > +#define GSC_ADDRESS_TYPE_PHYSICAL_CONTINUOUS 2 /* max of 64K */
> > +#define GSC_ADDRESS_TYPE_PHYSICAL_SGL 3
> > +
> > +struct mei_ext_hdr_gsc_h2f {
> > +	struct mei_ext_hdr hdr;
> > +	u8                 client_id;
> > +	u8                 addr_type;
> > +	u32                fence_id;
> > +	u8                 input_address_count;
> > +	u8                 output_address_count;
> > +	u8                 reserved[2];
> > +	struct mei_gsc_sgl sgl[];
> > +} __packed;
>=20
> Why is this structure here if you do not use it?
>=20
> And that's some really odd alignment of the fields, is this coming from t=
he
> hardware?
>=20
> > +
> > +struct mei_ext_hdr_gsc_f2h {
> > +	struct mei_ext_hdr hdr;
> > +	u8                 client_id;
> > +	u8                 reserved;
> > +	u32                fence_id;
> > +	u32                written;
> > +} __packed;
> > +
> >  /**
> >   * mei_ext_next - following extended header on the TLV list
> >   *
> > @@ -320,6 +361,18 @@ static inline struct mei_ext_hdr
> *mei_ext_next(struct mei_ext_hdr *ext)
> >  	return (struct mei_ext_hdr *)((u8 *)ext + (ext->length * 4));  }
> >
> > +/**
> > + * mei_ext_hdr_len - get ext header length in bytes
> > + *
> > + * @ext: extend header
> > + *
> > + * Return: extend header length in bytes  */ static inline u32
> > +mei_ext_hdr_len(struct mei_ext_hdr *ext) {
> > +	return  (ext) ? ext->length * sizeof(u32) : 0;
>=20
> Odd spacing :(
>=20
> And please just spell out ? : statements with a real if () statement.
> There is no difference from the generated code and you write code for
> people first, compilers second.
>=20
> And how can ext be NULL here?
>=20
> thanks,
>=20
> greg k-h
