Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6DB5B57B4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 12:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD6D10E33B;
	Mon, 12 Sep 2022 09:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6D110E336;
 Mon, 12 Sep 2022 09:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662976791; x=1694512791;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RtgFvCEbDKO3+Ryjbvaj8giT/Jh0GUgsrDLaro9A9y8=;
 b=JERgaY4webyrFBFjNOSxhbig8uyGQyvGCBnZnFwBhATS7E5PygEvLmgQ
 z1fEWHieWtuBca78fLhjkVXGtUrosOrb6xH9PRG8ujDXvibEWbr3k9PoP
 5VZzo9csD4qgZaQ/1odYz4VJXrLraBaKD7j5KmPn/NB2kulEz+JWJ5Rwd
 a0kLryd0mZj2xsVDAUkvTeqtKBe6OAMcweVQfNx7nlQFtpuAPoE2GxMrl
 xwfoHu9AviqLwAIG+0IfQet5102lJpjJ1UlutKycmNcOwYuGaVBlYwq/p
 j21EA/aIVnxf6m7/QnOMtg4Xc1ycI/IZ7NzP5EbDIRFzVn51aVHdTnFOo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="284847882"
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; d="scan'208";a="284847882"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 02:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="758331078"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2022 02:59:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 12 Sep 2022 02:59:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 12 Sep 2022 02:59:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 12 Sep 2022 02:59:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h33Zx8qsO/F30rWcOX0PG27rUsNpN06cAXj3Vh/9UZH2w8/6IiUR/YP2U7Z2f2rp8YDg7YmJsJySB/BlibD/MopzPRZbsfURwT0dK219PmZutDbwZwHF9k3HKF93DOMIxUNm4HAus3NEpSTilCn63/ekDoh0HtdmRrFLFrRFdcfWlISD4pL73TeB0B/seln/TU8YyNNQiRd19V8H2qCowiPgbZUIYyRZUYHgfERrjyqf3fDS7uN6KLDs2Q9v/vRwNak5cpfAmu/H1IGXjWiLgRnEpW+N9nfVPIFUxUVyyOYlWwHndRWsCVstFqsdiWwezxWwniA/NdQ5dT0tysDg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dyJDcLH5VTOXIpxmUy0H+DLR1eZPod8O2bXrfZduw0=;
 b=QIjx3Alj/LPjo+qJMPRVAUrL4mJUisIIWQddiKZUba0PsXj2wEAa7I2vfIb0NZw5MwsPXYJ1oTbZcUN0K6Og3MuGid5LZpis3uzXdWeQYum5Vw2R1pmxhsMTbrcrkyv9nFPZmVM6CAI2TZL8p5LACwOe61fzE00LifWOgTJWpb9bTkyRfvUakXzomecCBiC+91w3Yg+ZWLvj0yYBmphHR/xPbYFfUWmz406M305nBz/fCTI0N1X/tIuWpNo2f4H6VjrU1UPGx313BCkkMTc+IPDcI42ZAW7CmCYrEx6cuX2MYl+A7rT5mPiTL9r4aG80bYk7pudsHR1zJFnuOB1LIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4093.namprd11.prod.outlook.com (2603:10b6:208:13f::21)
 by BL1PR11MB5509.namprd11.prod.outlook.com (2603:10b6:208:31f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Mon, 12 Sep
 2022 09:59:46 +0000
Received: from MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3]) by MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3%5]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 09:59:45 +0000
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v4 05/15] mei: pxp: add command streamer API to the PXP
 driver
Thread-Topic: [PATCH v4 05/15] mei: pxp: add command streamer API to the PXP
 driver
Thread-Index: AQHYw+F5lxpIc4tF1UiCpESP2c97qK3WnvKAgAAE1pCAAAMFAIAE6BlA
Date: Mon, 12 Sep 2022 09:59:45 +0000
Message-ID: <MN2PR11MB40932A4EFF78CF62E97EDDBBE5449@MN2PR11MB4093.namprd11.prod.outlook.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
 <20220909001612.728451-6-daniele.ceraolospurio@intel.com>
 <YxrZqW2l7cNF5OTI@kroah.com>
 <MN2PR11MB409371E657AFC2777F8BEF0BE5439@MN2PR11MB4093.namprd11.prod.outlook.com>
 <YxrgQNbz2wvWz7Yy@kroah.com>
In-Reply-To: <YxrgQNbz2wvWz7Yy@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4093:EE_|BL1PR11MB5509:EE_
x-ms-office365-filtering-correlation-id: 95d987f7-3c7b-448d-ef8b-08da94a58598
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tk4qJe8Lz0y33pR/olDNnSsf8G8n4G8L66CT69r12PqbVG1qNkbyuNTTCAsbYyTwnN6oZet4wL2+d8Y3Cmvp1E/jSUlYDtwEjpzQP6TDdHDHg8knQyHonr/AZx9h6B6PmO5BFcKIXVminXIrp4+gMulKumlnIFBbn9aar971bBDt5qQHdZc4UEJ8zuaLcdJ3q31rc3ZX3bSL+RMLoMWK7JktflrWNgshJ5VS2N5gKBObETdAUQmjrVhw5YZ48aggGbmzy3zHSpz1gVmIIwZCHNsKcsbbk0zsJU3cOOzs4r7V5HgfLsq8+SElN4CbF2NbGKe3tNxdDnpNlZcZByD1QOxtAkzxHIjuxe3xgkSg8j6g9mye2EYocQbkQyXz9XmJYEOEuLHfjqLXsMTN4M1+EpufFYEGgqonhIjvtKkEb7f6fjKO4OofON5vzmcEIW1in0m0QH8LcPeojqbHGcRxfOC9i43iW+L9SFqowkoit3NS9p0zfzD4rsDy2WnWZGOmSKOBOhB1PW+bXfbRBc25OtjKV+pJeZ2ak3HjTB84maaPH02dshl1C/X6W2pxhV1/TmtkzGNn1BkxtOygjE+ZsM9VgFiz0mhnm4PB7FBxkOSMUrb/JEFLrFQLFwoWQ1RIBR294BPoAykXDa65zU/GS3kZFYN4ckI/P7H0ovij0s/6GwM729vaF36aboM7ZPqOWPTG6/Rpe54Ind/DMAjBnIAiCmVwgUp/ZjANvPHVigExvtRkmYuCMBY3W3E+d6B/N6CEOv3SChHLxMpEv59hJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4093.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(366004)(376002)(396003)(136003)(52536014)(4326008)(55016003)(316002)(5660300002)(86362001)(76116006)(54906003)(6916009)(64756008)(66556008)(66476007)(66446008)(8676002)(38070700005)(66946007)(71200400001)(2906002)(8936002)(478600001)(9686003)(122000001)(38100700002)(26005)(6506007)(186003)(107886003)(7696005)(41300700001)(82960400001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pKFKGHDPFeUamNk1pDTKwnsXxQJ8ufoUBoKlAQjHzXT3ogwuzZI4IFs28cSo?=
 =?us-ascii?Q?1oFxcBKPmqEbIissNYAkAz6au7tK50x9C4n0e3dHhmhRd46UqwzWvnc0bxQo?=
 =?us-ascii?Q?Zab0A7BcgkERLkfRegtoDt5dr8L6INMfx025iE4BvkhSd/NXLwgd26VoDa/i?=
 =?us-ascii?Q?/n1UYtyDBn3FrA64MXzZLMeBUSoRjLv1vqW3wy7VRxk0rEfWJ0QmogN0Iy9d?=
 =?us-ascii?Q?c+2pilaBrBA+hHWMtRw/O2eblWoZbuSXlsQHDP0MOQCeiELZ70d3xd91uin6?=
 =?us-ascii?Q?wS9dQfV0hjefPS6sZ0AJMNgDvUQwzeEJm8imEmgMfAgmomxxRzwHRgE1oknm?=
 =?us-ascii?Q?9welnEy1tCRsldUY/17JUIGrX1yiBIw9/ob6U85FdYLvMjmZVoZ0zCxVjv2q?=
 =?us-ascii?Q?1FgRWAH/PjrhT3WmQPkw6DUlpLtcAX6VttjnnBJBZA/SaUBC5M5m509cNUZS?=
 =?us-ascii?Q?bVpf/NWHjytAoj2MuBS2GJz/f4+Pd3pWAelhllN5cyJsqSj5qaeG/QEmdv2b?=
 =?us-ascii?Q?QSS/0OA0VMD+BZrymY7y9qoXjfvYuwYlEB0nOPfMHZ3SPg/S2WHfjehRbp4K?=
 =?us-ascii?Q?ZxGaeeO9UKit1Uawpny9dwmkidSQ6r/l0TnA1m9oknGCNwXPuTHup/kxh7mb?=
 =?us-ascii?Q?jTfLBSBL/yE58+g8rEIeZi9pXlAj99boVtR9u57ECtc8JZG4lSc/yGwUs/tr?=
 =?us-ascii?Q?UNp8gjyvul79/LoDlrCXDpeY7M7IztneV/LsM3grBfk2kgz1wTA+o1p3tlD9?=
 =?us-ascii?Q?g3JR1aAeDbYa+zlnPBl3Hsi3upayfxt7vW1TTiVnLetJAJ5VCIi7WTQizGUl?=
 =?us-ascii?Q?OFoWzLjYGHj0MpGMtIXvNDi7KguGrERKFBU0vpBsNqqGvuhmlINa73hyvb0m?=
 =?us-ascii?Q?R/AdbsjgGr7tqaLvb6Z+Ique3Gn8NO+KC2jrlP980gxryhlsClKdiZkMP52z?=
 =?us-ascii?Q?F5VD3puCvtMtKk4QMb52LjPZ595FmLW5GIyr/Bw9ptTJtAaWpbqCLIVggmK6?=
 =?us-ascii?Q?oNV+HOyGcDncN/4LySK5s7gZLRJ6IA2F26lEJZkHRmWxXTTcEVea68HIKLbw?=
 =?us-ascii?Q?S2GK9sa3XiHrsb/JRTFKX4TtMhJeJoGglEXdGRKvRzPHjISTSJFo6IEf1Zq+?=
 =?us-ascii?Q?H7U9Y2QlLE6KA8DWd0FYSfceO71S4NDx0szpq8dq3XRVCyl98wQgCv1aDX2F?=
 =?us-ascii?Q?XtTRdnnT5sKvtBYBDs3n2XncesnFWWX9u5Tv2FWRFJ2BYBT4tB1KWbqAHw68?=
 =?us-ascii?Q?rU5KBMftFfbQ+nL9IwVIkYhA465f6belGGt8fd6mG3BSqxnIwUWHruWlcLnD?=
 =?us-ascii?Q?dG2KBXIQzFBr63ygmT8XiC6uwJFO/fpyH7S9DqVAExq6w0Ac7EshZX/Z4Fh2?=
 =?us-ascii?Q?KyHWDnsSfEThlauMfyei30wyJ2eIK4ir+vrT6vaR88KOMt7FDyuW0a2fvSzQ?=
 =?us-ascii?Q?T9oUfB9iUfpc72LspDTHtLcgKp8JIkHlshXyrF7Q3smO+VqPsuYjrhDU+Y6A?=
 =?us-ascii?Q?5AGAs7mikfnuqu6NwJcMN2fNIhyQxU4kr10wmpDMiJ23+XnEDhPzs469dkqS?=
 =?us-ascii?Q?u6tIGyhQClQJtGEE1HLAe2U2sAKmhw1hqlP9g8t2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d987f7-3c7b-448d-ef8b-08da94a58598
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 09:59:45.8097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lv2zP13skPnrFeAQh5bPBq5vbONHydMmUseFUp5xfVHMsvS2EMvJokORXtt+D/RILmGCbSIKPH20jH+Ul3zCLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5509
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
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Teres Alexis,
 Alan Previn" <alan.previn.teres.alexis@intel.com>, "Lubart, 
 Vitaly" <vitaly.lubart@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>=20
> On Fri, Sep 09, 2022 at 06:38:33AM +0000, Winkler, Tomas wrote:
> > >
> > > On Thu, Sep 08, 2022 at 05:16:02PM -0700, Daniele Ceraolo Spurio wrot=
e:
> > > > +static ssize_t mei_pxp_gsc_command(struct device *dev, u8
> > > > +client_id,
> > > u32 fence_id,
> > > > +				   struct scatterlist *sg_in, size_t total_in_len,
> > > > +				   struct scatterlist *sg_out) {
> > > > +	struct mei_cl_device *cldev;
> > > > +
> > > > +	if (!dev || !sg_in || !sg_out)
> > > > +		return -EINVAL;
> > >
> > > How can these ever be NULL?  Doesn't the core control this, so why
> > > would that happen?
> > This is any interface function between modules, I think it is not
> > healthy to take assumptions here about how caller behaves, this is not =
an
> inner functions. This is important even for catching programmatical mista=
kes.
>=20
> It is a static function being called from a framework.  Enforce this in t=
he
> framework, don't sprinkle this stuff everywhere, the kernel is NOT defens=
ive
> about internal users like this otherwise it will overwhelm every function=
 call.

I'm not sure, this is the case here.  The function is passed to  i915 (othe=
r driver) driver via struct i915_pxp_component_op.
This is outside of the component framework.=20

Thanks
Tomas

