Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD2E5B2EB6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F195710EBDF;
	Fri,  9 Sep 2022 06:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202A610E9CB;
 Fri,  9 Sep 2022 06:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662704474; x=1694240474;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=66qkxWGoEyxYcxR4mCDanZ+cQgDprpmXr26svSyXMsI=;
 b=ZGcmE0VpsWK23TLGfiFIdWx+yPJjKFzYA5NvA3VmwFy61GvE4YcwTwNn
 hA4cj9nK4UGaeRHe0czYgSpPiZCcwRxSjnKaaemvpwV8WXGjPvmWAqn3L
 oKbixCQNYJzkONI5IhXDKv5AnmzTJXurD/ELghQ+jgFV7BPBEaaE7HuPm
 PJvBbDGjZgdbVrKtmc5s3S6dd01FnhhuBWbDldFs5mCO+iu2vLyrQEn4v
 fa74WorPmSh4Lsua5QEHS8qYzKZGRDRoZOS9neGIXRj/RmGB3uvEGOY0t
 U61rZRv41xKBVTzxikD0OMt2ji168I5aFzHK7eCtrBAkD5TnLuAD25+lY w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359133699"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="359133699"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 23:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="757494334"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 08 Sep 2022 23:21:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 23:21:12 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 23:21:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 23:21:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 23:21:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHR6bcwf/B2hciiB0BddB+MOfbiJRXm7ZB2YE893gNciIp/FnhKTg9H/mKMKUWh9LfSytHff4iCGspYLsuZPHnRwk+uOl0zncMF3/M7F7nfjZAYiSRViDkMokca4I1hID2yqMuh7eTrwBf1IheTR2CLZp+9SbVoixNPifn0YKSf98GTYE8EMOQVpHUxJRMjPPXsZQX5LZy4K72cETJGAbN8ddq/CcjQ1Ao9TdAKTAsI6YJ8/7OpmBb0uK/h5OSh88eViyklwy2CswSl9FaSRJnA7VJYNvx8jGMbai9tNq6Pnlu/DeQQlcHdvdeawFGsurOsOJm3yXV+i9Mi1MNrBdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLqUAxXRRic68sbn4c8QPJ8GPYViIwHYaDmPpQWLfS0=;
 b=ZJy0+I/OFzTlHcKkXGiCjFIszy5Ahb0qaIsGFEapFpjEa0nYhYolQ1IExyMeIp2/9bn1P9tujVF6vLU6s/YjquqRE+pQlqfCYWGJevYjFyXSLXk3QrZnKaxpr7JdnUvR+SzDk9KSlV8/66NSGcm9chl3VhAzZX6xHHejAcF9amsFkuBHpkn58Uvy73oNoS1nxnK/IoYSdMDdeOp0InVJkdETRRxLkXVCwcefX/67+NZW0pFOWEeLcyjnlA59H6pfwkUuCnyP13UZY49uDR8yuh7+IvbWXLveZ7JdlcWltQ3B65dsd2yG8hh6U6jA+XQg6C8ZlFVBs3CYYVlE+3/O7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4093.namprd11.prod.outlook.com (2603:10b6:208:13f::21)
 by CY5PR11MB6163.namprd11.prod.outlook.com (2603:10b6:930:28::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 9 Sep
 2022 06:21:10 +0000
Received: from MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3]) by MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3%5]) with mapi id 15.20.5588.023; Fri, 9 Sep 2022
 06:21:10 +0000
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v3 02/15] mei: add support to GSC extended header
Thread-Topic: [PATCH v3 02/15] mei: add support to GSC extended header
Thread-Index: AQHYtB6RdCTn+hu8wU62ToJCTRVk663KwLqAgAsU+iCAAOKkAIAAAywA
Date: Fri, 9 Sep 2022 06:21:10 +0000
Message-ID: <MN2PR11MB409398930CFBB975F10AF65AE5439@MN2PR11MB4093.namprd11.prod.outlook.com>
References: <20220819225335.3947346-1-daniele.ceraolospurio@intel.com>
 <20220819225335.3947346-3-daniele.ceraolospurio@intel.com>
 <YxDKk++n5mbaqYAx@kroah.com>
 <MN2PR11MB409393DBFB080257B0667E8BE5409@MN2PR11MB4093.namprd11.prod.outlook.com>
 <YxrUhlCxm/vo7tG8@kroah.com>
In-Reply-To: <YxrUhlCxm/vo7tG8@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c25dfbb-2a25-41dd-8649-08da922b7cd6
x-ms-traffictypediagnostic: CY5PR11MB6163:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PmUxVoj4NveXfhjhPg0wyx9AMD+NWTBHI37erKP7Rvy7bTq5Blq2iYsXAbNJ5E5RhvMPZAaCvQLsxXZ7gZ4ZWcrfnEt/v58nY7XEU2dcY0infkT2qhJq54jp5gFh9TGL44bosyEzpRd+NWAndhj/4Ltxhij0n+zYnR3h9og2xXGwbO4lKe3grM3gu18+kml9uQUu+wucSSLXu2GOwZLP2EpqnmUEMzt4XEBD7ATj8tsBUgglMm75NmiUq0SFdeoLUGkqAtHnVGkO3QTED8JHrW8/DTDFbbsuqqw3N/V2mM2vpwja+RpZcypgwdZWyD5r5CRNDJd6kaiM9fsI/sJBTljHYKXCd2xQqfYgGXFiPi8h8i0XMtN8KPkJ/+XBS8nGHQR4ORJuZ9Li4fHAapFWgl+kwL9tyF3SlAIrsBqya4IX5R+y6ZXLsxg6SJ/h6Oun1BN1QkZKSKiO4GE1pgO6mDnuPXUlyowLK5jNCvl2SGOi+BWzNLNL/n7elfiQFPTxa0WbANiR7MOI6th3a3iC/QjgEEIj/Tmm9POUCXnOyE+fK3EnA9KxUcORNEhJ1xVlrTVNJ2liA6X4dE09TEdceiLEHlwLDnVFORFIklbZGyC4/wUuEbwjf6ZGIzdTZofYsCYQeDxpup0OAdouFZMVaRlctd59QS7rxxvBed42ZZnkc9UDND2304sRaUuaOT2MzsJRFX8JT/uj32lRDgdR8ZfzXd7kUFkmA8kXS5eepUgOHI/xAEMijMFVSWrrNy4ewsqVjipAhDxHAe39D45ikQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4093.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(39860400002)(376002)(366004)(396003)(38070700005)(186003)(82960400001)(6916009)(64756008)(83380400001)(66556008)(316002)(8676002)(4326008)(76116006)(66476007)(71200400001)(54906003)(66946007)(66446008)(5660300002)(6506007)(26005)(9686003)(2906002)(41300700001)(7696005)(55016003)(52536014)(107886003)(86362001)(8936002)(478600001)(33656002)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FtOhdhZ06G/4ucoDg926l5PmeBgAo3NkK/Ah436CFJn7eW2/Kkj4icRZlJxj?=
 =?us-ascii?Q?T81Ipv3MHQkfDnms7XcMqoexKxDFk+yBM3hxQT4+MX1iryszXAXcOoMnQtLZ?=
 =?us-ascii?Q?Zv8ZljobMROcTxztoAWMMKo3HKDOXt25ZW2pZkgRhMlKOBk4Hk3hVdFaPJP5?=
 =?us-ascii?Q?lNVog3PDQJsDvVj0xr+c3XmIorhALgY6i1O+TvRsl6XNvWJ48XbEV12N25bi?=
 =?us-ascii?Q?vaV3cJh+gymDsUcWWgruSV1fvEveTuUYJHXRdIS7XhInDHzTBvSgBct/huJn?=
 =?us-ascii?Q?rZlTQOwJmdu5MuHKZU8sVCE07Z3IdYtd38l85fgZx0/iygYML6rbnRqwLqSK?=
 =?us-ascii?Q?MJPGXjRwuxLaSMecz+RAo1I1NOmXc0/BTkjKTPsa8NT0dM+Tell9LsEMAKLD?=
 =?us-ascii?Q?/cUJ4jTXFhF+AMN3AaOv/UtyzDrqNDzBzGBdTWLgrLUZyZRxzUsCePAIco6/?=
 =?us-ascii?Q?7woZTghYekQCymySo+bIV98nIs4crMB8cRqBp8WyfTOEQMSDac0Uu4GN78ZG?=
 =?us-ascii?Q?ByGJE0WV49uTjdQJUWH9EceG38p20d5nqPkH9Mo9q/CAfCVj+dF0rC/8AFt2?=
 =?us-ascii?Q?zCWhv2I1pTOMkyj7M2Tc5yRVfr7uh7CKniu+Z8Q2bMZD8vej6bMkU/kcqKlt?=
 =?us-ascii?Q?lcNWQGxKyrms8A7v8omKnHbE3xfCoXPc92NLXOj206r6MleojMbNmX9pJCPH?=
 =?us-ascii?Q?ptANaLnMExKoKHHyi8NFxb5hwDAe0NNA7mAZ4vgjvx4HH0e4Qonw+iuYmDkz?=
 =?us-ascii?Q?se7t9+2f2s01tDBESP0HO0eKVmX0+OxxZLPebnUF9WgcLoPhXyh/OkSUFz+y?=
 =?us-ascii?Q?/nRZEdbij8O68fPSPCWuKUwJ/GnOx9FqtG0H1gRldtmSH7GgPaBHSvANxxGA?=
 =?us-ascii?Q?wrWrDNiGvZrP+JUfV07M+W8Wjb2e3EyujEJnwaxXCO3leJUboh5soxATPEhk?=
 =?us-ascii?Q?ikvABk+REOIlT0siRNX1K1oWOTnVBw9JYNCR4hg/MJXfXVedziPbQKhqXLQJ?=
 =?us-ascii?Q?FtvB/MNiss4e1sNl+20jlPrbQcKD0R+CVSXY75kfnZ8DzLhIGOMNVMhW1vcX?=
 =?us-ascii?Q?uGLnV/agB8/NSqCgue5F5uNo+FR9TKW6jWjXj5VmGINZ5bh7lEU6F1nyH/WW?=
 =?us-ascii?Q?Rz98jy3AO31ejmc11cdn3C/yWgM3Uy4LK57S+fEAuke3ktFK+DT1/vUDdb6t?=
 =?us-ascii?Q?QgFnpOIgIqMpJAy12Zd80cYazF1ov7r24Rz7I5IUGPR+phqdW8rm8ReuslfP?=
 =?us-ascii?Q?w/XZjYIIOQ2Ig6Nivq8wHbf8Efx6nsjPcOVjkbQipvWxavZKd42mFyoYcOgn?=
 =?us-ascii?Q?/XHHx0yGs0GHqzN++xd70qZj3NHmRsK/BfWqLDrSWBeoAZxXIhLA3s0ghSG7?=
 =?us-ascii?Q?VsJLnqReq2Ehzf3sCfyOTxrZo24nVMqqICgn4ltFi3zkyTOQ6NqS17nOm0K6?=
 =?us-ascii?Q?HUcSAyJd507tqJTevKA6qNDFSbS9vj+Aj207zLXFe2StzsdOOlItARBLKND2?=
 =?us-ascii?Q?3mgO4HYRJS/IKpJBlKxdaEpce1IC+V7UCzrp7xwYTyTikZ21tzkDrd/O0sJN?=
 =?us-ascii?Q?5oODqYYq+R5fMatQmVy/jsa339tDaFmEAFFroKCf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c25dfbb-2a25-41dd-8649-08da922b7cd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 06:21:10.1560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v+ZJa7ZusNNU81gOF/yVUmKUjrlIRHlc307l15oBGhYSfVVhmvZ9CWJRSYTmjaD1GI2Wf580AMAxIHO1xzhN6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6163
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
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Lubart, 
 Vitaly" <vitaly.lubart@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > >
> > > On Fri, Aug 19, 2022 at 03:53:22PM -0700, Daniele Ceraolo Spurio wrot=
e:
> > > > --- a/drivers/misc/mei/hw-me.c
> > > > +++ b/drivers/misc/mei/hw-me.c
> > > > @@ -590,7 +590,10 @@ static int mei_me_hbuf_write(struct
> > > > mei_device
> > > *dev,
> > > >  	u32 dw_cnt;
> > > >  	int empty_slots;
> > > >
> > > > -	if (WARN_ON(!hdr || !data || hdr_len & 0x3))
> > > > +	if (WARN_ON(!hdr || hdr_len & 0x3))
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (WARN_ON(!data && data_len))
> > >
> > > Do not add more WARN_ON() calls, please just handle this properly
> > > and do not reboot people's machines for a coding error :(
> >
> > As far as I understand WARN_ON()  will produce solely a backtrace ,
>=20
> Except when you have panic_on_warn() enabled in your systems, as many
> do :(
Was not aware, thanks for bringing to my attention.=20

> > This particular condition should never ever happen in theory,
>=20
> Then don't check it!
In theory :)
> > anyhow we can use dev_err() here as well.
>
> That would be best.
That how it was resolved in the V4 series that Daniele has sent,  will be g=
lad if you can review.
Thanks
Tomas

