Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A691519C61
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 11:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101761120B4;
	Wed,  4 May 2022 09:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B971120B0;
 Wed,  4 May 2022 09:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651657958; x=1683193958;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+bvlkbrclFcXuHtrJs7OhfipWYiW8RXpD39m8tqxf9w=;
 b=hCQMU4NHiTYqrpyM4Yr4SPpVVz5SwTVrHWJ+oX6cHFVK8FCaHff9LcB2
 Ba1eeSsjXGJL4uwK3Ek3myfzzjx6iDwMwB5JqbYKlbPWRk9AjIlU+SBkH
 WqBw4prJI4dxSIyqzkGAg+kDUqijl5dHA1SQyWc0GW4D68WPcF6MkuzsY
 n0lLhgr8SfHmhcD6R64c10GQB2Alvzn87+D0MuvMRWXlvOM0Sl7dqdoQ7
 gRq0yKxKYv5jRf2fibE58ZsHAn+5GSUcVuU5V6PhLVwtCGlHdCkzWJXon
 iqVoNtkiX3wHjvxrmXAt+lBtri685/3FaoPxVsYbXLbkNX27XY9INv0/b w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="248257411"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="248257411"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 02:52:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="631891522"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga004.fm.intel.com with ESMTP; 04 May 2022 02:52:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 4 May 2022 02:52:37 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 4 May 2022 02:52:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 4 May 2022 02:52:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 4 May 2022 02:52:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrNqU2PSPoukcK4/iKrNUKyYGOt47QdgoHLVvE+ZQ76pmqtL0F3XoXciFfLzWMjJ6M7fXNY+x2ctlhCpZTqWUD1t68tfZ33M8iId3J9dXxcAUUU0T+nvTpl7c0GQhaPvOQRb5BaRmi5FibRPObqEChAIFnFtPOjh7UpCd4K/iETuaw8hISx4c8XhHP2H+xymGThIzUDQgl6EcwQBIM8gN5J+3fNV0ffGgkglxnkf8A5hbapLbE8I58dGtseGadBO0zwJ+7X+DBjbcLIBz+w42m5/kJQtWwGwMYGu1fBYx3k9sHkZsrCKRtzlcY94/kI1PCmZ99LnPq3AQldHjxDxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bvlkbrclFcXuHtrJs7OhfipWYiW8RXpD39m8tqxf9w=;
 b=c4fppPfeAyp0c8TCmH+Oy/UZqdUquEkCwDZTM05CWdvdOurUbH7aI/3L/k8VuWUDLO2/X2DeMj5fHR80TPZVw5DnxLmUmdVew1dHEj65rznigc+crvneCpoPnNBXvc/5zz5gAXuSyh8/vc7CwC2+iB+CYQJSD+jVTbd1FXBViSrweY+WHab9/1r9fdp8O+xKV/7Z8BC++wxqHEMgGg2KpLv29pR894w2sqAxEhLIVpo9eNKGw51gYblqSdXCdZSrkIaagBzj8q/xQUcr7PO3vLZIg0pG2SagO4zuc2IPXIBra05MFrwCPaz2uryZA+bk7aeQoZ01Jdk/a8FtvdUy3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB1741.namprd11.prod.outlook.com (2603:10b6:300:10d::20)
 by DM6PR11MB3337.namprd11.prod.outlook.com (2603:10b6:5:a::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Wed, 4 May 2022 09:52:34 +0000
Received: from MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::48e5:949a:3716:bf7c]) by MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::48e5:949a:3716:bf7c%10]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 09:52:34 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [Intel-gfx] [PATCH 0/3] i915 private writeback framework
Thread-Topic: [Intel-gfx] [PATCH 0/3] i915 private writeback framework
Thread-Index: AQHYXedhAX6FB7EumE2Yd413rl34CK0Oex4AgAABL1A=
Date: Wed, 4 May 2022 09:52:34 +0000
Message-ID: <MWHPR11MB1741D7B0BB3AC7B0689DB2A0E3C39@MWHPR11MB1741.namprd11.prod.outlook.com>
References: <20220502054219.2083162-1-suraj.kandpal@intel.com>
 <YnJK2En3AeNVpbwG@phenom.ffwll.local>
In-Reply-To: <YnJK2En3AeNVpbwG@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec265227-ec44-4719-24f1-08da2db3d058
x-ms-traffictypediagnostic: DM6PR11MB3337:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB3337F9A7819E5038C4D6B9F9E3C39@DM6PR11MB3337.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SGqBZeVZKFm+D0FaKl7UUaxWJtASdwmSY8336K+R3mLTSR7AifCOimQ1DtmIcvCmeIlnvUKYcW5ZpgdNo/RYJzrLZKbV1UGgcbu1V1lOng3002HkF/Do5JqQIiwlxVbRW6OI45imLfH72kP3ANJVGYvQXdnPRbPubNYkecGp9aHlxCqcp6NthMCsYJzlexABTjpjuasZtJe4a08pm2iUHSCP0OT/1ZbrgYLn9NeKFabuhsw1XQjUktq5XvHQRErnNFqeec0j2m1f9BGbDQp6RQpodUtRMpd319sOpg8ad0cE+IcB+XEmQTrKnVnG4yKQN3gpEoIWnFT4skEn1r40YEg34nhaI3hPq+5E4FTHWb+WO7h3g3Yy2u2hLJdlnXQLrkneGylp1G/CLKYKaA/IH0TkE7/CqyR6hbui3a+DM9jbrAtTojY3mgrfdxYIZ8tWnJMaVoIz3gAESZtJw6F8e+ROGouzcrGyewP6stsTIQkBuFMZLTppuIZEhHUbNr5TWHeQl2StCyZbS4/o1iNJVycF53pW8fhbICd1r0F66KjY+h1H5sHADqA8xO/04r/O3XRf2mt2DIYkbOiUJqoihNDrHq25v91sA9GITCleT5uxRPPk70qYfy7M7r+MNvdzY4VjMpzSBoz07Xc5U4AhVn2B4aY+UkQAEtmfmjPfHp+ICLehuE8PqjzvdVBlQSP7xDSNEE17OFhxpx4WAmNOEipaOpGEzTNJH4aQmSZLGCRiDRliOPWNgIH2MhacHtFH//w2RzQKqNNZtLpFA0xZSzBwTvLJ9BJKJ5sVrJUow9pjnOcTJoZuSsD5FqK8WTqwz5kbMbctb1rwhXU3PKsqZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1741.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(8676002)(66556008)(86362001)(66446008)(4326008)(33656002)(66476007)(55016003)(966005)(6916009)(54906003)(316002)(71200400001)(38070700005)(38100700002)(64756008)(2906002)(83380400001)(186003)(107886003)(8936002)(7696005)(5660300002)(6506007)(9686003)(122000001)(52536014)(26005)(82960400001)(66946007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wUepzrHhgaAPQHA0smw/YgJuFsGX4Vl1L/E33OnuHetObl+J+qvb3laPHgA9?=
 =?us-ascii?Q?gSVGPzyD1mMEonNSeIsYrQXz8Yg5y4MBzNQc8+N31CeYQgqiurFkeLNiONLl?=
 =?us-ascii?Q?0sszKuKsjDsvVA0ccKvz747LpgZlV1szGJe/h02KLuAiwlmZ98Cn35iswUTS?=
 =?us-ascii?Q?z50mndFV1b1Xj++/9vKOQR5NXP4QU/wDpUn0fdXPuMpag7Q+5cEOvpv369m0?=
 =?us-ascii?Q?ZDO1bcG8O/SQtki0yu3GlOkxCMJCKdS9Axk2U+zPbEhZ8i//QciE+IFfMLAO?=
 =?us-ascii?Q?poB42J9E9y1rYtHC1hIHSCPAOc12E9OUoP6Qz5VMLT7HBavPa/a8+PPD+gvY?=
 =?us-ascii?Q?pu7Ex/2Z0zIX9gtBV2D9OyCXjLGIOwdx50SxbZ2DEqmGE782VS0Ouzh9NhsI?=
 =?us-ascii?Q?zUVj66HdPFQy1ubwZETbqJw0FTMG/BGAmzf+nEW51F/JIe4PzVm3hr++1daA?=
 =?us-ascii?Q?4Tu7T69n17IGMHnsspKJL/BmgYbSt5CwXW5GjlPCw9ILf+3mPHqC4uTTlGtD?=
 =?us-ascii?Q?BFgaXhzPT9vEIouDAIkp95Q8sCW6lpcBN2HW2Ko1o8PfWxaJsPU/tVca9udf?=
 =?us-ascii?Q?39rqC+krJ1doVolqGOl3Hco8UI9S4H0RFmoOQ54PROf02GmSOVQAZSqD8+5w?=
 =?us-ascii?Q?gcbI/gBUEfXjtntNLXwqCS4TYcA98XG7GIpdKbJ7c48LiGahCzzorWPp7HOL?=
 =?us-ascii?Q?ZRDa5eUkU8tDMazRJiFfqGZhbk90Kf8NHDAy/1na5Johm7M4ZkumLUwD1aFD?=
 =?us-ascii?Q?1T16mJdw2/vUmAumw52NNz3EVpc6VbW6/6O/SgKTl4e9umNpuRulS1J5rgt/?=
 =?us-ascii?Q?iZe5HEAtVCdf5Q1cwBH52PNpUEbVD5RyWd1xuRQIIXxwv443mUQXCo6KTWlY?=
 =?us-ascii?Q?QEsDE5N/+Yj6aaR+1uBthQUsGsxGBUFqG+ivDc2cfPR5DTvL0k21mwhBAbOs?=
 =?us-ascii?Q?+oZ5tmBdbi9hp1MRibtagUO/m4rKU3L6gVX2X8ku5QUPjgKP77S2PNHGfOBX?=
 =?us-ascii?Q?fzV+Owy/4m7FApTrGgHulEinXerdsTEwUllM2o0Am6R/fgFZmVrK2fAtqcLa?=
 =?us-ascii?Q?drzWI2FBgOTeFd4kTj/rsGHyNVKXTYmmmEtyFFXeUpUXl2G/XBg7r1bqBy+4?=
 =?us-ascii?Q?w6kEnCYwVsyVPF0wW3NO5M6hhrayLUltLIpOuRajH01z6aKrBT84l2G+Gryc?=
 =?us-ascii?Q?q3ZrccdFB49ZV01P2kzSgnimWaydRXpM1tQdJBQqm90oY5uGT+qU+iyTqe7j?=
 =?us-ascii?Q?e3/4ncMgYVzePG4jFoO7TBIyRBjpiWcGQ/2iGui3ZXo+HLZGwsEmKKIpbVNo?=
 =?us-ascii?Q?nNaICeD003YFrTrdM9ZB64OhF3wCbHIxRka34ceG8aP5EAggDycm0m1IO/nw?=
 =?us-ascii?Q?kMnW8DdBEVIZtbtSeLRwTZmsAwOqWi/TcS/01Y/HDcKnGIbQvJiddmGpqx4C?=
 =?us-ascii?Q?fRiyoC0lt7d/VnjdSTzL9u4AWop5zelaYJvmyQzaajarij+IKjksklD2vqdD?=
 =?us-ascii?Q?5Xf0b96Gczd6r7FXJA5t7iJyPkAlAHmY9G/TY6wxM2duE7/mnbUQvRQCopBy?=
 =?us-ascii?Q?dT659KzqeTM/5tRRNuH0LVhl+5mRKW8g7xQNElrZ8pBQEu3LJereHKsTN9UF?=
 =?us-ascii?Q?udIYMk2mO1CKahxkrh9k92/0Xg0KGc5sQVYwdUfWE+1U1h9QyR+C9F21szhz?=
 =?us-ascii?Q?nZP/IXAN6oIAXnfhIst8Wz3lX6NLIkAYbhZdCPum3HDPwsZiCCxgkL+SjEjN?=
 =?us-ascii?Q?5Gs2P3ojfQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1741.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec265227-ec44-4719-24f1-08da2db3d058
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 09:52:34.4023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k+QKrxcFYtjEPlApk0e4FKDFzIvRxx+xxS+FhgbaqMD4BRJXNVCTj4dj5slSegpEe2Iv3sdbka7EvvZWCskGfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3337
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

> > A patch series was floated in the drm mailing list which aimed to
> > change the drm_connector and drm_encoder fields to pointer in the
> > drm_connector_writeback structure, this received a huge pushback from
> > the community but since i915 expects each connector present in the
> > drm_device list to be a intel_connector but drm_writeback framework.
> > [1]
> > https://patchwork.kernel.org/project/dri-devel/patch/20220202081702.22
> > 119-1-suraj.kandpal@intel.com/ [2]
> > https://patchwork.kernel.org/project/dri-devel/patch/20220202085429.22
> > 261-6-suraj.kandpal@intel.com/ This forces us to use a drm_connector
> > which is not embedded in intel_connector the current drm_writeback
> > framework becomes very unfeasible to us as it would mean a lot of
> > checks at a lot of places to take into account the above issue.Since
> > no one had an issue with encoder field being changed into a pointer it
> > was decided to break the connector and encoder pointer changes into
> > two different series.The encoder field changes is currently being
> > worked upon by Abhinav Kumar
> > [3]https://patchwork.kernel.org/project/dri-devel/list/?series=3D633565
> > In the meantime for i915 to start using the writeback functionality we
> > came up with a interim solution to own writeback pipeline bypassing
> > one provided by drm which is what these patches do.
> > Note: these are temp patches till we figure out how we can either
> > change drm core writeback to work with our intel_connector structure
> > or find a different solution which allows us to work with the current
>=20
> I'm assuming this is just fyi to keep development moving and not being
> planned for merging?
Yes we do plan to get it merged as a proper implementation that uses drm-co=
re
will require significant time and to unblock the writeback functionality th=
ese interim
series of patches have been floated.

Regards
Suraj Kandpal

