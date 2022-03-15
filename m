Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 092084D9E8D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 16:21:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49B710E464;
	Tue, 15 Mar 2022 15:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2724410E1DA;
 Tue, 15 Mar 2022 15:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647357691; x=1678893691;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nX2PC5jx9LbYHljuS6UweJvte0gEZrFXXksfgCF1ZxA=;
 b=O2qpSB/cnrMoooAxtFVmC3gB8FXrBowucIklgw7Pfn2qwwXeqZzKurlt
 EhG4pfqUrzdOGzUAjaUudnGy6hRB8ie6ipZJ3fFtcgLmxbtmWim/qEGo1
 dEW45QFMvEKcnQa2YzZgD7bBau1nlwel+czBp87YUGjN5wJ5NFSde1zdn
 HkjdoYRqbt8wvLmd2mofX4o9Ava1u56T7tnYTBromxbfY8JOt4a+Aii1r
 C3RmxNaA1JFyrMs2VfuwM7l8cvGbbABVPdjMORWMazKVsI3BH7r3sn+xV
 60f6xWkS4RIozG+wPGfT0A+LSz4QWMRcBoFagd/rU61jkHJPAs2GSvxwT A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="281103355"
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="281103355"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 08:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="783102504"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 15 Mar 2022 08:21:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Mar 2022 08:21:09 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Mar 2022 08:21:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 15 Mar 2022 08:21:09 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 15 Mar 2022 08:21:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNnan5DlpMNGE/E2kWsVTQa8W3WgpFdP4jUxKOpezMALSCTcVijdxBdx/YPgNlO4MUL/mVw8M5y1aRQBiPRVHg3GWgo0QIHyWqhE5cx0wutL8/0E6qgCH7A+XxHAf7aZ5rl6QImXnpJWF5rQPbp5UMaaegr3D+PtidvN7eNsmClDS0ANvDhUsKMtRj7Qw0vWC98lphq9NkpCKz6GWSUsIw6GDyME92i8eLpGazjH9EK/fU390u87A0C3wQUTEFY8FjdkdWGAdF+x92aIsMMSYYtEaHpgQiSBxErLkTmbKiCvzRVnHB/0QaLUUkH1Cu3cMPn3NnMU3G6crjozemN7yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbDrzeTgwTRrlHgfPlvZDfnLqvUyN9qxbUGxCWRh8ug=;
 b=jLCklmffzRY+ohLzBvmgP8/sD8z2rM8VS0J4qYw/Q19cKK4lfvBQFoy6PCE4r5q+052DLZUJVm/4frNNh6c+gMb/8SxRqi+Ykk+hECsloJ624WV65Qzz4YgYrJBzG+C+U2PApNn2+z0SS3SRvFyDg42MFpFSIWNfhzf4EaJ4siuHeEwTMmw36WDKGwH+FAkLimfiJnZ7R8On4ahpIEwwAI61e3PhCqAaKJbIs83mQNVm4mprPErUZ/YBFNBsJ42MbUawYwYA5QAD5ErBuVerz8n48YiehGuHbv/BL+IDlQ1H46xO19DH0U6Zg3thkYT3gwPQHkx5aI4YTD+24UkL+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2710.namprd11.prod.outlook.com (2603:10b6:a02:c7::24)
 by BN6PR11MB1715.namprd11.prod.outlook.com (2603:10b6:404:49::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 15 Mar
 2022 15:21:05 +0000
Received: from BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::48da:a7d6:83c1:7e22]) by BYAPR11MB2710.namprd11.prod.outlook.com
 ([fe80::48da:a7d6:83c1:7e22%7]) with mapi id 15.20.5061.028; Tue, 15 Mar 2022
 15:21:05 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, Drew Davenport
 <ddavenport@chromium.org>
Subject: RE: [v7 1/5] drm/edid: seek for available CEA and DisplayID block
 from specific EDID block index
Thread-Topic: [v7 1/5] drm/edid: seek for available CEA and DisplayID block
 from specific EDID block index
Thread-Index: AQHYNt7ozQc56E1NlEu0amjY1RoaeKy+kKiAgADPNQCAAQPwgIAAJRRA
Date: Tue, 15 Mar 2022 15:21:05 +0000
Message-ID: <BYAPR11MB2710A1F31351816341D04707A3109@BYAPR11MB2710.namprd11.prod.outlook.com>
References: <20220313134702.24175-1-shawn.c.lee@intel.com>
 <20220313134702.24175-2-shawn.c.lee@intel.com> <87mthtvsds.fsf@intel.com>
 <Yi+tYBJgkZoaNTSl@chromium.org> <87wngvtmz6.fsf@intel.com>
In-Reply-To: <87wngvtmz6.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9363858c-9324-4305-ba49-08da06976c4b
x-ms-traffictypediagnostic: BN6PR11MB1715:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB17156E7C80FFE66F61A5F612A3109@BN6PR11MB1715.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +HPB4zDrIAqNJ24QuEs/Nlr56ki226EyCJaRpf9uON+cbBPOD0X/SPmwATKDzU0CFLhWpBIQbw5PhBReeLCaRtxvEZJLS0COFCO3/KwU+ppqYYpEMfnpzHHCKqbeDfOg9qqB2TFPWUjQRpHWS7SHMaCOZs3jo71L/QXf6jJzLKvIKfC81wftQT9f6eDPb/pFE1if3KvPxWdp/jJtUotqEfRKmZ15+XCcYp5u2Z/wO2mATOZ7iYnj1evBogCylqT0ckhJuJHCJzOkxE+Ae2JJ270hadhgGC+l6OxiLQjw8Fd4vF/il+dyXcGizcydQrUtLXseo+Lrt8rnniwA+BGHOX8DSa3DHFEksqplXY2WDj6iCcle2PnwU+ADWglzJ9XkLvY/TTcuVfPjO91VPwnaT8sEwQeuJ6Mwm/BzVHihj2lRhI4gQQydnOyepXozyO+5fhDSYxrisAvD0E99FQVZ69FJrMEFflV2hGUT3NTxxrHPGJLVAvCkay7XZIwH1uu6ycPHgtr5kVGN1ScpINh/tNHfQBqrIogjwLfbefFu3ak/RmvOqATvPzrWqXyf3YoJArV0D7PMlY1stRjxDmKd9ZDSqi2lrAbTsAPAZuJCykKCV0ZOi5XYqNbCLe/hxSg93DSMUJgUqxvjNQ05JAHkf9CbNz3ErRlGi7+7ndfd06APQbuiCgBLIWPXaZ4/nqdk9Rzyd1L/EAZd2W5gX+Nxx7HDTjgxnkFbDsTtCOQnKn6nNmbpnUQMvdWl3Iu3r3EIxfVUGz32s39ggLsSo4PLp1TjjOx81G1cNlyHvbLEaW4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2710.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(30864003)(966005)(186003)(26005)(5660300002)(8936002)(71200400001)(508600001)(52536014)(38070700005)(4326008)(53546011)(86362001)(33656002)(82960400001)(55236004)(6506007)(7696005)(122000001)(110136005)(54906003)(9686003)(316002)(64756008)(66946007)(66446008)(66476007)(66556008)(55016003)(8676002)(76116006)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iQ+yyO6c0TVN1sv3UMP3AP83BJYjzkhI6+3VGkyQk1xzpXw0ghd0YsaCiFLP?=
 =?us-ascii?Q?OL0/i+IBCTYuCvu/kSbR2+8DNIyRH9bAQMuDa3AP7fN7xsPQMWCzFEEGZnBO?=
 =?us-ascii?Q?A36AiSZ2AoCFPSzwzuOWKuNSDE8yS94w1tPNbuxo0fwG3z6zo3FKJrNN7wdF?=
 =?us-ascii?Q?gheM4HHl4XimGjhg36IEPSTM6VO1aF5WfpOYLsdm67XcHwfSJAVbTQ5iDt+s?=
 =?us-ascii?Q?J2ZZJP+C2hwl69oi+bJQsSw9hJWJ9ENIL8mLg+PTBKmfn0XLmYBI6X4h3gWX?=
 =?us-ascii?Q?BemRl753qG0rtPB/jh9XjsDFps2VxvVEEIW4+bk0JpPAxpZnTyOSowO5q43b?=
 =?us-ascii?Q?HA3SUoWoOkRgLs5LCYzgm7wimft6fvraJfSW6PInFOW/LvvCn0yAG/Szz70x?=
 =?us-ascii?Q?v8fODDilvf0LuE1mEA2/a2z6Qyt2atsRI7P2gRElifYA0/ZqvMaUZ6JzJo8g?=
 =?us-ascii?Q?R75r3iM9RbC4UKexVBpiVWhJGls0BPV0rIjT3x+AbnD5UCvSODh5OgbPrNFw?=
 =?us-ascii?Q?i1V13O45tNAZZjalpiq9OngGgyjHry8V8we4DgrmI3TVrnFpUh8H40/1ofXp?=
 =?us-ascii?Q?u0rKohyD4+GCui32PDz6mHzHJfZ+WwWtlkYnqf0aCVUVpDlx0HSq62vxtchk?=
 =?us-ascii?Q?I4AAnx/w6pOblwtHy6jmruWrUDuUPT9ye1UHnLXtdtFGmbfvxueeh8yo3Tzf?=
 =?us-ascii?Q?5HaSD2bRf7qhdOs7FpGMd49YpKPg/Ghcvqds2kYyCjkDZd5360mWjA9MJGTS?=
 =?us-ascii?Q?xgmB/5J48r/cMKN4YXz1gxPEgP4D6bKUAzcP40dpGgZlJGzP7LjKHhKOw4ak?=
 =?us-ascii?Q?+iqj73pfK4r/E50jpZaZvquKHGgbgU/wxORFiNbnpfdI+Vt1Vy+XOzGfT+k4?=
 =?us-ascii?Q?WV/z8R8yuPkJehQ16RKovETGRpPazMgFEYUwPOwDRPldTpC03JWqvB2bdFA2?=
 =?us-ascii?Q?fxcC+r6qXTEYWOMuNLrjOhNh9JqOgr2WI8v5VXMKBvQUlSoCJdu0e7WyfCre?=
 =?us-ascii?Q?epgxKxi2ILg0zDBlWJmA+zTeuC676uEUXtPJO3PQ5s7b/Ni0RHj3GyS2WjBr?=
 =?us-ascii?Q?X1OVaMbcXtdGYcMXgY+3lZLCPy28JpV/0CSX96R9yO7AWRtPZFec6hTpPvEw?=
 =?us-ascii?Q?tiGW9GFrG+XYXjYQyIvE2p7ECMktnx2TXdJUgPMdS1PTme5ZRXX9vE+/3LE/?=
 =?us-ascii?Q?+rv6IUayjThUoknuwdhn7vZBPThDTf4hkApeFGs5yI8HATvfd/3HDLh1EaSQ?=
 =?us-ascii?Q?t9dF6CezTQpGcnkeiNgJdkYb0Sp7IThe6iz1mxTouF/WyZnIlg3C+3y+mBf5?=
 =?us-ascii?Q?IRDibAEJsjs/46Z3ABp3bSJjfaaGQk/4rZyumff8fsBpWUW0NtqxZuM+VRWT?=
 =?us-ascii?Q?HCTkuMO/d49SULFMLPL0TF3CcegwEISFYFLHtLqZ54cnqSi9Tzxg0GFopsCB?=
 =?us-ascii?Q?1UZ0Sukc7ZL3B2bnv8cRlErx3jbV7i02?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2710.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9363858c-9324-4305-ba49-08da06976c4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2022 15:21:05.2139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rPLLPvoTrhyXsVUeLrGdnhR88R6WArpBYYN6NEdV9JAIrMIlAMIf7V2d4ufm4ZDZraIeqNkBbIyxVrGIas8ZWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1715
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
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, March 15, 2022 8:33 PM, Nikula, Jani <jani.nikula@intel.com> wr=
ote:
>On Mon, 14 Mar 2022, Drew Davenport <ddavenport@chromium.org> wrote:
>> On Mon, Mar 14, 2022 at 10:40:47AM +0200, Jani Nikula wrote:
>>> On Sun, 13 Mar 2022, Lee Shawn C <shawn.c.lee@intel.com> wrote:
>>> > drm_find_cea_extension() always look for a top level CEA block.=20
>>> > Pass ext_index from caller then this function to search next=20
>>> > available CEA ext block from a specific EDID block pointer.
>>> >
>>> > v2: save proper extension block index if CTA data information
>>> >     was found in DispalyID block.
>>> > v3: using different parameters to store CEA and DisplayID block index=
.
>>> >     configure DisplayID extansion block index before search available
>>> >     DisplayID block.
>>> >
>>> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>> > Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>>> > Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>> > Cc: Drew Davenport <ddavenport@chromium.org>
>>> > Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
>>> > Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>>> > ---
>>> >  drivers/gpu/drm/drm_displayid.c | 10 +++++--
>>> >  drivers/gpu/drm/drm_edid.c      | 53 ++++++++++++++++++-------------=
--
>>> >  include/drm/drm_displayid.h     |  4 +--
>>> >  3 files changed, 39 insertions(+), 28 deletions(-)
>>> >
>>> > diff --git a/drivers/gpu/drm/drm_displayid.c=20
>>> > b/drivers/gpu/drm/drm_displayid.c index 32da557b960f..31c3e6d7d549=20
>>> > 100644
>>> > --- a/drivers/gpu/drm/drm_displayid.c
>>> > +++ b/drivers/gpu/drm/drm_displayid.c
>>> > @@ -59,11 +59,14 @@ static const u8=20
>>> > *drm_find_displayid_extension(const struct edid *edid,  }
>>> > =20
>>> >  void displayid_iter_edid_begin(const struct edid *edid,
>>> > -			       struct displayid_iter *iter)
>>> > +			       struct displayid_iter *iter, int *ext_index)
>>>=20
>>> Please don't do this. This just ruins the clean approach displayid=20
>>> iterator added.
>>>=20
>>> Instead of making the displayid iterator ugly, and leaking its=20
>>> abstractions, I'll repeat what I said should be done in reply to the=20
>>> very first version of this patch series [1]:
>>>=20
>>> "I think we're going to need abstracted EDID iteration similar to=20
>>> what I've done for DisplayID iteration. We can't have all places=20
>>> reimplementing the iteration like we have now."
>>>=20
>>> This isn't a problem that should be solved by having all the callers=20
>>> hold a bunch of local variables and pass them around to all the=20
>>> functions. Nobody's going to be able to keep track of this anymore.=20
>>> And this series, as it is, makes it harder to fix this properly later o=
n.
>>
>> I missed your original review comment, so apologies for repeating what=20
>> you said there already.
>>
>> I'd agree that passing a starting index to the displayid_iter_*=20
>> functions is probably not the right direction here. More thoughts below.
>>
>>>=20
>>>=20
>>> BR,
>>> Jani.
>>>=20
>>>=20
>>> [1] https://lore.kernel.org/r/87czjf8dik.fsf@intel.com
>>>=20
>>>=20
>>>=20
>>> >  {
>>> >  	memset(iter, 0, sizeof(*iter));
>>> > =20
>>> >  	iter->edid =3D edid;
>>> > +
>>> > +	if (ext_index)
>>> > +		iter->ext_index =3D *ext_index;
>>> >  }
>>> > =20
>>> >  static const struct displayid_block * @@ -126,7 +129,10 @@=20
>>> > __displayid_iter_next(struct displayid_iter *iter)
>>> >  	}
>>> >  }
>>> > =20
>>> > -void displayid_iter_end(struct displayid_iter *iter)
>>> > +void displayid_iter_end(struct displayid_iter *iter, int=20
>>> > +*ext_index)
>>> >  {
>>> > +	if (ext_index)
>>> > +		*ext_index =3D iter->ext_index;
>>> > +
>>> >  	memset(iter, 0, sizeof(*iter));
>>> >  }
>>> > diff --git a/drivers/gpu/drm/drm_edid.c=20
>>> > b/drivers/gpu/drm/drm_edid.c index 561f53831e29..78c415aa6889=20
>>> > 100644
>>> > --- a/drivers/gpu/drm/drm_edid.c
>>> > +++ b/drivers/gpu/drm/drm_edid.c
>>> > @@ -3353,28 +3353,27 @@ const u8 *drm_find_edid_extension(const struc=
t edid *edid,
>>> >  	return edid_ext;
>>> >  }
>>> > =20
>>> > -static const u8 *drm_find_cea_extension(const struct edid *edid)
>>> > +static const u8 *drm_find_cea_extension(const struct edid *edid,
>>> > +					int *cea_ext_index, int *displayid_ext_index)
>>
>> As discussed above, passing both indices into this function may not be=20
>> the best approach here. But I think we need to keep track of some kind=20
>> of state in order to know which was the last CEA block that was=20
>> returned, and thus this function can return the next one after that,=20
>> whether it's in the CEA extension block or DisplayID block.
>
>Per DisplayID v1.3 Appendix B: DisplayID as an EDID Extension, it's recomm=
ended that DisplayID extensions are exposed after all of the CEA extensions=
.
>
>I think it should be fine to first iterate over all CEA extensions across =
the EDID, followed by iterating over all the DisplayID extensions. No need =
to keep track of the order between CEA and DisplayID, as the former should =
precede the latter.
>

Refer to "DisplayID extensions are exposed after all of the CEA extensions"=
. It looks to me patch v5 is able to support this. And did not touch Displa=
yID iterator.
https://patchwork.freedesktop.org/series/100690/#rev5

>> What do you think of using the pointer returned from this function as=20
>> that state? The caller could pass in a u8* that was returned from a=20
>> previous call. This function would iterate through the extension=20
>> blocks and skip the CEA blocks it finds until it finds the passed in=20
>> pointer, and then return the next one after (or NULL).
>>
>> An alternative might be to create a linked list of ptrs to the edid=20
>> extension blocks, and allow a caller to iterate over them in whatever=20
>> way they need, but I'm not sure how useful that is elsewhere.
>
>I think the main problem here is trying to hack a for loop around
>drm_find_cea_extension() and drm_find_edid_extension(), and duplicating th=
at all over the place, without adding more structure or abstractions.
>
>Contrast with displayid_iter_edid_begin(), displayid_iter_for_each(), and =
displayid_iter_end() and their usage. They hide all the complexity of loopi=
ng across DisplayID data blocks inside EDID extensions, and none of the use=
rs need to be aware of that complexity. All the state is hidden in struct d=
isplayid_iter, and the users don't need to look inside. No allocations, no =
linked lists.
>
>I think it's particularly bad to have the changes here break the abstracti=
ons in displayid_iter_*, especially because they should be usable for pure =
DisplayID 2.0 *without* an EDID block structure. They'll just need a displa=
yid_iter_begin() for pure DisplayID and some internal changes.
>
>Looking at the usage, the iteration should probably be done at the CEA dat=
a block level, something like this:
>
>	struct cea_iter iter;
>        const struct cea_block *block;
>
>	cea_iter_edid_begin(edid, &iter);
>        cea_iter_for_each(block, &iter) {
>		/* ... */       =20
>        }
>        cea_iter_end(&iter);
>
>This would replace cea_db_offsets() and for_each_cea_db(), and would itera=
te across the all CEA and DisplayID extensions in the entire EDID.
>
>This looks usable, and then you'd start figuring out how to implement that=
, instead of trying to retrofit all the existing usages to abstractions tha=
t don't cut it. You'll probably need an EDID extension iterator too, and th=
en use that and __displayid_iter_next() within
>cea_iter_for_each() i.e. you'd embed the edid_iter and displayid_iter with=
in struct cea_iter. Exhaust the former first, and then the latter.
>
>
>BR,
>Jani.
>

Hi Jani, Drew, thank you all for your comment! Agree that edid driver may n=
eed
abstracted EDID iteration similar to what you did for DisplayID iteration.
It will need a lot of code changes in drm driver.

But, we have a tight schedule and have to meet HDMI 2.1 compliance test req=
uirement.
Do you think this series can be a short term solution to pass HDMI CTS test=
?
And we can have another long term plan to work on your opinion to modify
the iterator and make edid driver more efficient and easier to maintain.

Best regards,
Shawn

>
>>
>>> >  {
>>> >  	const struct displayid_block *block;
>>> >  	struct displayid_iter iter;
>>> >  	const u8 *cea;
>>> > -	int ext_index =3D 0;
>>> > =20
>>> > -	/* Look for a top level CEA extension block */
>>> > -	/* FIXME: make callers iterate through multiple CEA ext blocks? */
>>> > -	cea =3D drm_find_edid_extension(edid, CEA_EXT, &ext_index);
>>> > +	/* Look for a CEA extension block from ext_index */
>>> > +	cea =3D drm_find_edid_extension(edid, CEA_EXT, cea_ext_index);
>>> >  	if (cea)
>>> >  		return cea;
>>> > =20
>>> >  	/* CEA blocks can also be found embedded in a DisplayID block */
>>> > -	displayid_iter_edid_begin(edid, &iter);
>>> > +	displayid_iter_edid_begin(edid, &iter, displayid_ext_index);
>>> >  	displayid_iter_for_each(block, &iter) {
>>> >  		if (block->tag =3D=3D DATA_BLOCK_CTA) {
>>> >  			cea =3D (const u8 *)block;
>>> >  			break;
>>> >  		}
>>> >  	}
>>> > -	displayid_iter_end(&iter);
>>> > +	displayid_iter_end(&iter, displayid_ext_index);
>>> > =20
>>> >  	return cea;
>>> >  }
>>> > @@ -3643,10 +3642,10 @@ add_alternate_cea_modes(struct drm_connector =
*connector, struct edid *edid)
>>> >  	struct drm_device *dev =3D connector->dev;
>>> >  	struct drm_display_mode *mode, *tmp;
>>> >  	LIST_HEAD(list);
>>> > -	int modes =3D 0;
>>> > +	int modes =3D 0, cea_ext_index =3D 0, displayid_ext_index =3D 0;
>>> > =20
>>> >  	/* Don't add CEA modes if the CEA extension block is missing */
>>> > -	if (!drm_find_cea_extension(edid))
>>> > +	if (!drm_find_cea_extension(edid, &cea_ext_index,=20
>>> > +&displayid_ext_index))
>>> >  		return 0;
>>> > =20
>>> >  	/*
>>> > @@ -4321,11 +4320,11 @@ static void=20
>>> > drm_parse_y420cmdb_bitmap(struct drm_connector *connector,  static=20
>>> > int  add_cea_modes(struct drm_connector *connector, struct edid=20
>>> > *edid)  {
>>> > -	const u8 *cea =3D drm_find_cea_extension(edid);
>>> > -	const u8 *db, *hdmi =3D NULL, *video =3D NULL;
>>> > +	const u8 *cea, *db, *hdmi =3D NULL, *video =3D NULL;
>>> >  	u8 dbl, hdmi_len, video_len =3D 0;
>>> > -	int modes =3D 0;
>>> > +	int modes =3D 0, cea_ext_index =3D 0, displayid_ext_index =3D 0;
>>> > =20
>>> > +	cea =3D drm_find_cea_extension(edid, &cea_ext_index,=20
>>> > +&displayid_ext_index);
>>> >  	if (cea && cea_revision(cea) >=3D 3) {
>>> >  		int i, start, end;
>>> > =20
>>> > @@ -4563,6 +4562,7 @@ static void drm_edid_to_eld(struct drm_connecto=
r *connector, struct edid *edid)
>>> >  	const u8 *cea;
>>> >  	const u8 *db;
>>> >  	int total_sad_count =3D 0;
>>> > +	int cea_ext_index =3D 0, displayid_ext_index =3D 0;
>>> >  	int mnl;
>>> >  	int dbl;
>>> > =20
>>> > @@ -4571,7 +4571,7 @@ static void drm_edid_to_eld(struct drm_connecto=
r *connector, struct edid *edid)
>>> >  	if (!edid)
>>> >  		return;
>>> > =20
>>> > -	cea =3D drm_find_cea_extension(edid);
>>> > +	cea =3D drm_find_cea_extension(edid, &cea_ext_index,=20
>>> > +&displayid_ext_index);
>>> >  	if (!cea) {
>>> >  		DRM_DEBUG_KMS("ELD: no CEA Extension found\n");
>>> >  		return;
>>> > @@ -4657,9 +4657,10 @@ int drm_edid_to_sad(struct edid *edid,=20
>>> > struct cea_sad **sads)  {
>>> >  	int count =3D 0;
>>> >  	int i, start, end, dbl;
>>> > +	int cea_ext_index =3D 0, displayid_ext_index =3D 0;
>>> >  	const u8 *cea;
>>> > =20
>>> > -	cea =3D drm_find_cea_extension(edid);
>>> > +	cea =3D drm_find_cea_extension(edid, &cea_ext_index,=20
>>> > +&displayid_ext_index);
>>> >  	if (!cea) {
>>> >  		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
>>> >  		return 0;
>>> > @@ -4719,9 +4720,10 @@ int drm_edid_to_speaker_allocation(struct=20
>>> > edid *edid, u8 **sadb)  {
>>> >  	int count =3D 0;
>>> >  	int i, start, end, dbl;
>>> > +	int cea_ext_index =3D 0, displayid_ext_index =3D 0;
>>> >  	const u8 *cea;
>>> > =20
>>> > -	cea =3D drm_find_cea_extension(edid);
>>> > +	cea =3D drm_find_cea_extension(edid, &cea_ext_index,=20
>>> > +&displayid_ext_index);
>>> >  	if (!cea) {
>>> >  		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
>>> >  		return 0;
>>> > @@ -4815,8 +4817,9 @@ bool drm_detect_hdmi_monitor(struct edid *edid)
>>> >  	const u8 *edid_ext;
>>> >  	int i;
>>> >  	int start_offset, end_offset;
>>> > +	int cea_ext_index =3D 0, displayid_ext_index =3D 0;
>>> > =20
>>> > -	edid_ext =3D drm_find_cea_extension(edid);
>>> > +	edid_ext =3D drm_find_cea_extension(edid, &cea_ext_index,=20
>>> > +&displayid_ext_index);
>>> >  	if (!edid_ext)
>>> >  		return false;
>>> > =20
>>> > @@ -4854,8 +4857,9 @@ bool drm_detect_monitor_audio(struct edid *edid=
)
>>> >  	int i, j;
>>> >  	bool has_audio =3D false;
>>> >  	int start_offset, end_offset;
>>> > +	int cea_ext_index =3D 0, displayid_ext_index =3D 0;
>>> > =20
>>> > -	edid_ext =3D drm_find_cea_extension(edid);
>>> > +	edid_ext =3D drm_find_cea_extension(edid, &cea_ext_index,=20
>>> > +&displayid_ext_index);
>>> >  	if (!edid_ext)
>>> >  		goto end;
>>> > =20
>>> > @@ -5178,8 +5182,9 @@ static void drm_parse_cea_ext(struct drm_connec=
tor *connector,
>>> >  	struct drm_display_info *info =3D &connector->display_info;
>>> >  	const u8 *edid_ext;
>>> >  	int i, start, end;
>>> > +	int cea_ext_index =3D 0, displayid_ext_index =3D 0;
>>> > =20
>>> > -	edid_ext =3D drm_find_cea_extension(edid);
>>> > +	edid_ext =3D drm_find_cea_extension(edid, &cea_ext_index,=20
>>> > +&displayid_ext_index);
>>> >  	if (!edid_ext)
>>> >  		return;
>>> > =20
>>> > @@ -5311,12 +5316,12 @@ static void drm_update_mso(struct drm_connect=
or *connector, const struct edid *e
>>> >  	const struct displayid_block *block;
>>> >  	struct displayid_iter iter;
>>> > =20
>>> > -	displayid_iter_edid_begin(edid, &iter);
>>> > +	displayid_iter_edid_begin(edid, &iter, NULL);
>>> >  	displayid_iter_for_each(block, &iter) {
>>> >  		if (block->tag =3D=3D DATA_BLOCK_2_VENDOR_SPECIFIC)
>>> >  			drm_parse_vesa_mso_data(connector, block);
>>> >  	}
>>> > -	displayid_iter_end(&iter);
>>> > +	displayid_iter_end(&iter, NULL);
>>> >  }
>>> > =20
>>> >  /* A connector has no EDID information, so we've got no EDID to=20
>>> > compute quirks from. Reset @@ -5516,13 +5521,13 @@ static int add_dis=
playid_detailed_modes(struct drm_connector *connector,
>>> >  	struct displayid_iter iter;
>>> >  	int num_modes =3D 0;
>>> > =20
>>> > -	displayid_iter_edid_begin(edid, &iter);
>>> > +	displayid_iter_edid_begin(edid, &iter, NULL);
>>> >  	displayid_iter_for_each(block, &iter) {
>>> >  		if (block->tag =3D=3D DATA_BLOCK_TYPE_1_DETAILED_TIMING ||
>>> >  		    block->tag =3D=3D DATA_BLOCK_2_TYPE_7_DETAILED_TIMING)
>>> >  			num_modes +=3D add_displayid_detailed_1_modes(connector, block);
>>> >  	}
>>> > -	displayid_iter_end(&iter);
>>> > +	displayid_iter_end(&iter, NULL);
>>> > =20
>>> >  	return num_modes;
>>> >  }
>>> > @@ -6164,12 +6169,12 @@ void drm_update_tile_info(struct=20
>>> > drm_connector *connector,
>>> > =20
>>> >  	connector->has_tile =3D false;
>>> > =20
>>> > -	displayid_iter_edid_begin(edid, &iter);
>>> > +	displayid_iter_edid_begin(edid, &iter, NULL);
>>> >  	displayid_iter_for_each(block, &iter) {
>>> >  		if (block->tag =3D=3D DATA_BLOCK_TILED_DISPLAY)
>>> >  			drm_parse_tiled_block(connector, block);
>>> >  	}
>>> > -	displayid_iter_end(&iter);
>>> > +	displayid_iter_end(&iter, NULL);
>>> > =20
>>> >  	if (!connector->has_tile && connector->tile_group) {
>>> >  		drm_mode_put_tile_group(connector->dev, connector->tile_group);=20
>>> > diff --git a/include/drm/drm_displayid.h=20
>>> > b/include/drm/drm_displayid.h index 7ffbd9f7bfc7..15442a161c11=20
>>> > 100644
>>> > --- a/include/drm/drm_displayid.h
>>> > +++ b/include/drm/drm_displayid.h
>>> > @@ -150,11 +150,11 @@ struct displayid_iter {  };
>>> > =20
>>> >  void displayid_iter_edid_begin(const struct edid *edid,
>>> > -			       struct displayid_iter *iter);
>>> > +			       struct displayid_iter *iter, int *ext_index);
>>> >  const struct displayid_block *
>>> >  __displayid_iter_next(struct displayid_iter *iter);  #define=20
>>> > displayid_iter_for_each(__block, __iter) \
>>> >  	while (((__block) =3D __displayid_iter_next(__iter))) -void=20
>>> > displayid_iter_end(struct displayid_iter *iter);
>>> > +void displayid_iter_end(struct displayid_iter *iter, int=20
>>> > +*ext_index);
>>> > =20
>>> >  #endif
>>>=20
>>> --
>>> Jani Nikula, Intel Open Source Graphics Center
>
>--
>Jani Nikula, Intel Open Source Graphics Center
