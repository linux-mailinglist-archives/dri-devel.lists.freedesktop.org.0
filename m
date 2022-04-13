Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D7E4FF7DB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 15:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA7F10FCDB;
	Wed, 13 Apr 2022 13:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBC410FCDE;
 Wed, 13 Apr 2022 13:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649857179; x=1681393179;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OB34L95MLXvnm9dtf+72A+8kuKekNN88FO/cjc3CIy4=;
 b=az9iA0n7GSNuCEwWvBq2H28unVL2m71XxRgg+DKyrB0uxZJ0CYj+ui0r
 +XDlQ95IFmCHhl7nVxIWrIR1MFtRrMRna+CCygM0JBO+oclQkUVChtxhf
 LCAFdPk6LybbadxZ4ePnAwX2TgEtTXdBDiN+DD2gKnHffMi/2VcxcdKzq
 L5mlhQVicygew09IxQ8h15Ncvkce/1v8uYWrpMmGwbQIMWehC/dMek0f1
 yAWV3y/NvZ/cTB1Vvb/ddSwCdg8geoxrzeRNgyxRu89SW4UA/qR114Yxy
 DYSCAixx4PIyLwc4rpJI8nLi0gx3e5Jd3pFaSzFn/uSBsm+zCa7111hZE w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="323106943"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="323106943"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 06:39:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="552204062"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 13 Apr 2022 06:39:38 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 06:39:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Apr 2022 06:39:37 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Apr 2022 06:39:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2800ZayX0PVptJna5hl5eGEFvWirxTf77gPMSRkvUAlvEwDCwv2bw0GPRmWvKNIyS56yTRbgGa1giWgP8Eh3LFED5nbX6XQ+tI+AWPInCONsfIGk/KzTEMfFIsKk3fC3z8KJ1ufjafb7jaiLF+nodpeD7TBWehK3vbV/5m8VfGe2xt8vrJGwsUZAeqChaMej8tWzKO/x0cBXjW8ATTQN+Kea7sSQ+/lxqZB+jqg08ZEPc4I1CkGfF6EOMAy9SUv0MLJgD7nAzDguPfiWHs1IMgOrtuxXDjjg2QPBShOMuG5zDC6tLLTJIleEjbQVZY0abCPuZZHx24EFbB6k1qXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxUN3TzdYr+JxLF5if/9zI4GUBBvfWCP/slc7q6Rh+M=;
 b=Ob2AW/OPwI44AXeJpw+/zsoLSEzRkeqV6nGjCij5yUjqMyjSAZ5K6SH3QXGAk1qZT0lbhVD5A80v73qlJLX61qWflpvHRSy9n2SEh4cZLfVW29un/taESswHMdeQrZQbBN/lEyd+FiQ4zu2T9Hb869ZwD6E1SUKMHWqNJiUEJlpOFtpqI6YF4BOCb8MtbKdppVUnh4GqH+Ehni2yW8zvVCNryihAN5fwJGS+6aKdi3END49drbeMH4WEWToxcGJlRTqURNoLnCwbtQNQx43oAeUbcZzBhkASsLwloEbkG8kEsnTFVBJRPQTn+G0dULvrFKCV5PyaXP/2oYlYlnwVng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 MN2PR11MB4176.namprd11.prod.outlook.com (2603:10b6:208:13b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Wed, 13 Apr
 2022 13:39:36 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%6]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 13:39:35 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/34] drm/i915/gvt: cleanup the Makefile
Thread-Topic: [PATCH 05/34] drm/i915/gvt: cleanup the Makefile
Thread-Index: AQHYTa57MrQvrkmHQUyclnfpNoW96Kzq1UoAgAAM1ICAAAtDgIAC3JIAgAASg4A=
Date: Wed, 13 Apr 2022 13:39:35 +0000
Message-ID: <e8cdc103-f683-0b73-70a7-807f6fee0280@intel.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-6-hch@lst.de> <20220411152508.GH2120790@nvidia.com>
 <87zgkrha7c.fsf@intel.com> <20220411165121.GA26801@lst.de>
 <877d7tgo33.fsf@intel.com>
In-Reply-To: <877d7tgo33.fsf@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f44fed0b-344f-4234-73b6-08da1d530cb1
x-ms-traffictypediagnostic: MN2PR11MB4176:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB4176241E1B52A0B0433BE77FCAEC9@MN2PR11MB4176.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KqsUeyUE6YZXzbHcKdPnZKmIhFLy6vfCQt1GRaINc/m1tLW3NXNisdOX7hCP0frpUwiPAuzXUHdujz09Vve8CGWn8anpwn+0EOAO9IWWbHULJSifHANW40KdGN1cFCRIX8dirno90t7lsQJmxuN8ecfGfgZqfOXilELmDVNGIj+dbyVXJJfFRo0ca337H5DgBGnW3q6Rcq4pdKzyW7Ss70lnjPlfSL3aGX0Ifj99A4zaSxpY5Odrr+WyGsLhHd0eqXPXOy171JkVyKqQQL738P3+rBDpISudIqRi90fZv+tJd5Ma/Z7iwT1GEBMJIjScw5hVOYXT0daRbumf3Wx50HBl0a0Up2Fud5rQg2y9U0aYxzYbcGx/Vs/DuJXQ0TMcVt5ZCwZOWcNXc7khqo8/akF/8B/PhyUL1kvy0cjO+99z567XgA70zyVUN2jxEJpP9jH9g2I0XOXED2UYdIqaYbc3kHqpwcflvRuKcz/XYte7W4dpIrGDTLQh29NB0/rS7DnLf04VZ0obAz8rTVVY+uqKSscPDFQs7HHEtkSXuVDyF9JQgZDUijdPqXCz8M1Z+2pSCuG8yJWIkq5pb3Z63IHC2PLPQAoyTxN5J3onUwLS9ZHUVwYXAO+hFmlsYI2bldtfXYI3RGFdNRl5OVt1Vh5dIdXd/AlTJn69dqCo2CrRP5MowVwWQVqKuxb4j8brY4oh4XIX8IhN33bthvMsbc1Zv7znjRUAeSsmPxRwSnXRspjkDpNpvFUitWBf/vfVVCWjj1MlabagSsn11srzAw++DP9La7wlGKD27EaNu2DzmBNXSnFc6OVmbttrYv2P4NZkgdgEbOAaEL+QfQcXhHKxsOAW+Oilbc+1ms+ebMQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(31686004)(6506007)(82960400001)(8936002)(2906002)(53546011)(31696002)(91956017)(76116006)(66446008)(66476007)(66556008)(38070700005)(4326008)(38100700002)(64756008)(36756003)(5660300002)(66946007)(8676002)(54906003)(86362001)(316002)(186003)(2616005)(83380400001)(110136005)(966005)(6486002)(26005)(6512007)(71200400001)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?HsnH5nsJ9lumEJ3GsFWTvV0WhQ0HklzNmgFQUAM7m/hEDbFVGxQ98PMA?=
 =?Windows-1252?Q?7SE1uiAPrZkZ9ojSrPPzvETrh+LeiJ+OhDLPu0+1yP5E3wB702XwP76P?=
 =?Windows-1252?Q?kwfFlO80tSeApeEtIHjUKdKPVy6oM4c7MyAxvrtdJzVSCS2LFQgKFRz8?=
 =?Windows-1252?Q?FWxP1xMbE46Gio/C1BD5wyg483mBVcDLyZz8Bv5zVclpodxbxDkCVbap?=
 =?Windows-1252?Q?m0oKX7EQCI3BvQoCNyq2SLCSmF5n8/1gMIxM6b6Uq2q8pocgDeuOCZrT?=
 =?Windows-1252?Q?0j1UsfhAeSQZJ5M0BSNjQnhlqHH0vehYWUuso0HDkXU0zrM6o/u5oV+k?=
 =?Windows-1252?Q?AdLx/Flwl8yBOqTgXeq0H2rd7YAVBhTDjs1jzBSJ8Ccs8WC0dvruMVAh?=
 =?Windows-1252?Q?Wu0lYFAl2oDhZ6Lfwspt6TnKLdQ5r0RxT2DrO3Wa1ONew5yPEG7OOjhx?=
 =?Windows-1252?Q?mVWiaBpITxmIXHls7jnipx3DMHEMknlWtguNyLyG4JlaOIOaTiNy1BTS?=
 =?Windows-1252?Q?na3E3IpUXcVpBE6ri64yvc+yjp03s4SBxO0Tvf7meOaww9Q16gLwKxHv?=
 =?Windows-1252?Q?xBahg2XJokpCLMEY1U6NOtOfPyf0pAbIfu6xXBoj0YkoJZ7OruXofe7j?=
 =?Windows-1252?Q?IhTV2Ig+XW2UprZWgsxR7dVNskmrFryWgR/xoL583W9hGRax4D+Wp0wH?=
 =?Windows-1252?Q?t/7EsOZS1EKBL54XHK8byNy9Wghwqbpqe10+ASj0saWAHR+IDSC9J153?=
 =?Windows-1252?Q?U8+fyIiXcR8aM8dVfS5zvIPIuA/mGles2tfBIqUbhfUkB+pCJw/OUFGS?=
 =?Windows-1252?Q?rvBD8I1p/fEhonGhgxeKQweG2hwaNEBeOWq2HXSmKvEeOlJfF8bTzlBf?=
 =?Windows-1252?Q?SUL9w8Q8lQGZoHImYYgviUEC//20f3wAXFEmjS7OyBhDW5j36cc6Q7Ro?=
 =?Windows-1252?Q?wMM0kbd9VQWlyb62osH/EDKfsgNHzH2T/30YCbBHdCSVRBE4zmRLYkV5?=
 =?Windows-1252?Q?7Cfb3HVr36ppGJ0yJsAqIi+FfxT5OajlJsHLv5iLNDSvDNjsTdpJ8xPR?=
 =?Windows-1252?Q?PopFnN9x3U5AcT2ZIyaRUBHUniR4MmrIOH3u7hA5bw+3yVOyQZOBXqhJ?=
 =?Windows-1252?Q?s0AARlSLHHDCvCsoivsD74NutH9Ju42FvkKBwbWVlVDcwfymgssLn/sJ?=
 =?Windows-1252?Q?uunR3YbWOZ6ie+0VoV30Afb7JH/w0IN8ixLrXztsKDLkZ78vohs7+rks?=
 =?Windows-1252?Q?f3XgeD9h1muemwQwIzigo7hYTP/zIINh+4UYNEe4A89zraZKncK9BqGU?=
 =?Windows-1252?Q?LIg8TfM9j5JbLsKrrcCbd6MPkS9FTVYvFXvbgOyFo6Z03ScGyuWoVnak?=
 =?Windows-1252?Q?XWtCK2CJ48Za5a0cXR0rmg/wx7tMneNy8g4piMw1COR47kGPCQChc6z2?=
 =?Windows-1252?Q?kWht9F1HpYKH+MCWVeA11qqyTHIy9eHqCLCgztGTCjFI8pRi3mQzTD7Q?=
 =?Windows-1252?Q?wVPRRy4Gbv0vcnidjFacRGgZCfTlJ/5E8VRIOZG1isDOHZoCr2NhsbmX?=
 =?Windows-1252?Q?pUwi7NN3IiiEiVPiqB0FokyUyGGRZWuUsuvBMEQbq/wkxemTs580T2C7?=
 =?Windows-1252?Q?5AtDq05Eux3B0JSb2eEu/VSO11u/oFdUQbc5fxpjFLF5/EILLM7FjciN?=
 =?Windows-1252?Q?c810hGfac2AExI+aiMP0R7m/40jCY1BE2kZnkonAK7JqKcLO29prCZzf?=
 =?Windows-1252?Q?QsH9hkUDg00St8tjhH3j9QPgfQ9xxUSYzuA3milHcwep/Gg+g3uAPeaz?=
 =?Windows-1252?Q?YBEiNxProt35GucvZQ+6hccVOKSbMxCaTxey6LPfAl9ghixXzybiuHSN?=
 =?Windows-1252?Q?YqMgy+MXBHd2PA=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <CC39892EB287E04994B9128061B8484D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f44fed0b-344f-4234-73b6-08da1d530cb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 13:39:35.7856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P12TKKmuW1unnJt1pnsePRuBLoobWuj8gm58iIc6JCVM3ld2Xt/9aaHefazcCIFK523nFiZictdZ1xxbwkxhZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4176
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/13/22 12:33 PM, Jani Nikula wrote:
> On Mon, 11 Apr 2022, Christoph Hellwig <hch@lst.de> wrote:
>> On Mon, Apr 11, 2022 at 07:11:03PM +0300, Jani Nikula wrote:
>>>> Up to you but I usually sort these lists
>>>
>>> Yeah, please do. Otherwise matches what I sent, so ack.
>>
>> Let's just merge your 2 patch series ASAP and I'll rebase on top of
>> that.
>=20
> I rebased them on top of current gvt-next and resent [1]. Zhenyu, Zhi,
> please pick them up if you approve.
>=20
>> What branch in drm-intel should I use as the base for the next version
>> btw?  Or does gvt go through yet another tree?
>=20
> It's yet another tree... Basically gvt is developed on top of gvt-next
> (see MAINTAINERS) and Zhenyu and Zhi send pull requests for
> drm-intel-next.
>=20
Hi Jani and Christoph:

It seems Jani's makefile clean patch has already included this one, I can
just simply drop this one so that Christoph won't need to re-send everythin=
g.

For the branch to move on, I am merging the patches and will re-generate th=
e
gvt-staging branch, which combines the newest drm-tip vfio-upstream and oth=
er
gvt branches.

If you are in a rush of re-basing the patches of non-GVT-g stuff, you can u=
se
gvt-staging branch until my pull request landed in drm-intel-next.

Also our QA will test gvt-staging-branch before the pull request. I suppose
it will take one or two days.

Again, thanks so much for making this happen.=20

Thanks,
Zhi.
> > BR,
> Jani.
>=20
>=20
> [1] https://lore.kernel.org/all/cover.1649852517.git.jani.nikula@intel.co=
m
>=20

