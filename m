Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 336FA5B8D81
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 18:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EC510E995;
	Wed, 14 Sep 2022 16:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CD310E993;
 Wed, 14 Sep 2022 16:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663174269; x=1694710269;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mOKF4mLuewpmkvsaZONF8BJauh6IRYbJUPFr2lOAQo0=;
 b=C4nCvQWLslFGScEzutHF9TW9q1/YXK2nK5DWsPP6HmIKcRHE15E3AUYc
 Z2GGxTUXxL/Z6vmA5UjJoGO/s/DodrUvrRrQw9KZq/jWd/Y8bRBDRa48E
 wPc82ndt8lPR7ZsfJMA4LvQc7WWXKscMkb9SIbOrK5gpymCo/onK0M1Nm
 elGtW8XYZ+ZI7caTWWsgI5Cq8xJs8y+r1jRQP5WQpvXOOORsGGzT00Wt/
 ZWfxBaxGMSDzHBGwzHFpr5zWxhCAOGjUjHgoM1+oD0Clm55DqRs19INm3
 kknzAnfILQnIA/nwCtbnVG/FokYAUxhKIRgzAJpEl0zgeV6xIbWkYnVMF A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="278210156"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="278210156"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 09:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="706017338"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Sep 2022 09:51:07 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 09:51:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 09:51:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 14 Sep 2022 09:51:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 14 Sep 2022 09:51:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Glp0Ujx8/6RKAGI4VgVSJr/A98/xNHv6hrOE2UeEY7N+4qkyNTtw5xOAdeFY45J9ukAmakVMZw3tfY1Vti5wr0/Haxik0NhaA+CHSUkex6N160baGLerOu6E/1qYK8uKdKQdU+Qd5em1l0zhhDKYsuIgmSpCYC3tR35GR0KTT0SEBinXbpWE2LgHHjd9caKrPNQBqYd39HV7qc5MzEi6m0He5d4VBz/QUxdUD/Z2a7Ek35QUNjzjatzCZLTrKXYJdkghoQO6U8biSsxAkvcTtC4ycgWxL20y7Rb1bmrp/PjxZM6wmUSMPnXu3dxJoCvFBweInN7C6meEEnFyMNvydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESQ41QLOF5GYsTfYYT4w2s+NswhVjrti/9Om0txIz6A=;
 b=X4R70Q3jiy/uBkw9z+D0JIRVpqUX7L52DZ94s0Zu4fi8irilW+q4SdfLh1FvXjHhFOGj203CtbTaVj9m6zzKqVTuKGht2q00w7Bs5e35QyPCHgJp6gDZMQL448Q/spNbxCobPZWEcoc085NBZB7o+b5szXFOwFHuP//Juaf1UrnT49blmyehXEnzfC7p4j7lY/tX4UmJDlIYKDoW8ze5AhpF7lwT2m+BcIyrtOn0/i1gmI0jf4szo4UUSY//Ao+UXMI+BE2l6/+NMhoITF+Ld9dYagXHur1MgC5XvbZ9AHEN8fGh1d4rxaPTUnDkurN6LQE9Xb8HH1xzkMtyiQrRWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4093.namprd11.prod.outlook.com (2603:10b6:208:13f::21)
 by LV2PR11MB6070.namprd11.prod.outlook.com (2603:10b6:408:179::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 16:51:04 +0000
Received: from MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3]) by MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 16:51:03 +0000
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH v5 00/15] drm/i915: HuC loading for DG2
Thread-Topic: [PATCH v5 00/15] drm/i915: HuC loading for DG2
Thread-Index: AQHYxwvhDwkOr83sg0Wmwsp7KLTA2q3fJSpQ
Date: Wed, 14 Sep 2022 16:51:03 +0000
Message-ID: <MN2PR11MB4093E87A6EAE878EFCE805ABE5469@MN2PR11MB4093.namprd11.prod.outlook.com>
References: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
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
x-ms-traffictypediagnostic: MN2PR11MB4093:EE_|LV2PR11MB6070:EE_
x-ms-office365-filtering-correlation-id: 02ebde2e-c1be-4544-7599-08da96714f99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aFhPcBO/7/xUtUqbzNEyda5WHKVWYoP5GxKVlDe3erumNdBEJmclTeXF9dd5RfGXcPkmRqYxQi4bKDaNBXSdWK9+58t24eoDa3Pd3u+hWjlsRqM90LKY8u/1JW2JZgT9369kOOmr7rnFqgpY5UMBKsICa7uo/PVnZ54ER21KSIjgSYu2dTXBfKPj+Ymq5raVKLdLSXPl8Y8frIOPmGDMFV74Ee5vsirHQkZzUrD/R/5kqeQchxEWsVlDYpddMu5j9d7i1/h/9Uv3je4MLZ66Ot42pxLbz+eksvXiybHUMROXEHRXIIPMYPeV/4+5j8ZtV3zga4yC/J7ecm0161y0cApeM00409/Vaqxu5PCU+IMsVKSY9ar+UIggtO5tpV0mJqJ2F0dhmNH00MtF34VHjc03A5TPwq1z2foDARekswT9vjx3iQa12S6S5kkIebsjQFuGxaOiFvBUAzW43Blh2yUreiEt33UShJfvBPKk3YRBjL2By9UiNgXYdXLr5R0wcjKtXHDq4lmEzmEKTaBBEKEVisz1DCAq54BfUV0q1fwsARm6f10ZhxP6LcUw3vJl0ZdI3xNwbspSTFgOHXjaD6by2GvYp07tSmAaY0m9EAlx7tdq11EPDLKEH6UqVgvqBaoJY42LMtn0TqdRCbFGEwvbIcAsWMeaEq6xaL3xRE4o1dwPhA3rMXNcxSRTPkZmAcxBFnRS7N3hn6n9F1EIJCyLdUASCglHChg+XSyBjF2dv+2moskgnsdS/URn+iM2cOcoM4qiapzt6bwkEjrGbw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4093.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199015)(64756008)(8676002)(71200400001)(8936002)(316002)(478600001)(110136005)(55016003)(66946007)(54906003)(4326008)(33656002)(66556008)(66446008)(5660300002)(2906002)(76116006)(38100700002)(66476007)(41300700001)(52536014)(6636002)(186003)(86362001)(122000001)(82960400001)(83380400001)(38070700005)(26005)(6506007)(7696005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ugUdzQ5Albcpz6KvjrKDc4G2LLURePFL1HqcX8YaELC8UlILe9rGlgCYEm6A?=
 =?us-ascii?Q?os+uEQ9Xd4CMyPuEk9JvIjUlG0Xq6uUprh4ESCXyPSwity0Qx2CXMioDQIAC?=
 =?us-ascii?Q?6xShmJY9441ddtitISNBqjXHWi5MOmejvOj8tSBQUppHM1e9UeUEKHTfcLvy?=
 =?us-ascii?Q?YN5U0C2EVtOSgHo0YHSCmA0iDKpKDZruTPAD/nShMiAyVVqZ83JuqkR3pHCl?=
 =?us-ascii?Q?3rQWJdf4hLTdsb+olaFKBKqM8OplFr3gIWny/xlvXiXnNkfkkAZUaqjzIQUU?=
 =?us-ascii?Q?UqInT+Ph4dJ+gcXNpG+pTvumYCt/Fen9Ea8T9Uvp2aAj/gvOhObKCNcf1KWS?=
 =?us-ascii?Q?Mv9ksJpdSnnDCOob1dXqcll5uiqvyBdX3aFrUPeJnnfkHC/ljaQRxrcjEpMq?=
 =?us-ascii?Q?OnwLs2LzqR2AdV6p240r5W1FycayR4LAZbRc8X+Tp4D1mK0c11c5c9mq4GLu?=
 =?us-ascii?Q?hSMoTSOXlVtIqLuCSogG1RDznLNu/E3tQbmuyL4BJn92Xnw0Hr62/63GPeyz?=
 =?us-ascii?Q?Pp7nexfG/3o8O8GKGmWHiLX21Yu+G36zbD9qwdDfod5uAXiYOxP5zo+/ZYOY?=
 =?us-ascii?Q?raIGR6Al3wCgLuCKPGoTivSJhVSE4kLm40UPQrmzPyBnQHX9HHTQjyTdg2vX?=
 =?us-ascii?Q?vPqOFfpBkRbxQt5kfIpencnn7is6W2tG/UGGSvxzddkVM0/yXTyhpXeOnvk5?=
 =?us-ascii?Q?5we64a2OXf+Ne470p7zdo8G2ATiNdZuJpuxXBk8pxuWmp6VO77PhYS0FLkpi?=
 =?us-ascii?Q?LNKcvAcLuwqwDktLMOm4ng075bT4dFXfngga3ONe7/9iEb5NFUeizSrByZwF?=
 =?us-ascii?Q?OmgaHfifq05qu8qDrr2OWES9Xnio0DMWNflcTnMXxfN6+MwEPn/vktF6boxh?=
 =?us-ascii?Q?VTZMGni60COAdPGw6mXiN4uAxCrY7IOR4SEsictNU959z3UDjIB58S+rzg91?=
 =?us-ascii?Q?NYoW5ixzBk7m60SKMhYlwb9ILGicWqFK9mjVpOWYe0vnClrGa1T5/v4ulRTu?=
 =?us-ascii?Q?iioFY+voH5yGLUiBvnXQDkEboZJuX9lW9YuA8JuMO00Wewz6gGz+33fXAIUZ?=
 =?us-ascii?Q?re1f5449t5AXoV54iw+14lQiAzRuzCtbJpgzCxX9jdOrEupZl3h7IJ/YmiE/?=
 =?us-ascii?Q?Zm6g25d9iUE/zQFpBlLpUI9O91u6cPyUvaLqbU3IIkw3EJCBDD0tpD5H5a73?=
 =?us-ascii?Q?wOKKnXqONVsHccZz1s6Ja147APNSOCPtLs2PyTgA8bAepydrqss9De50gYK1?=
 =?us-ascii?Q?lNlCuUCctjotk4abh/o3v7yjCsWnG6tjC5f6bBXHHZ8wOScUQObD/xGXjzRY?=
 =?us-ascii?Q?+ZQdnGq0y4LLPLd62t+mN1lJgDmQG51FM4rFCpyzjNFAbSDOUfYne9vColCB?=
 =?us-ascii?Q?cdO6Wji83u3t50MkhXIkb2AtYmHhanFRY7luaYuFmM/mIJqVooeYytIx3vNj?=
 =?us-ascii?Q?lABJbkaBazkj7N72oXW8/NXcpkPFDxuZ2o5z+81/lGAKhIgHDCGYyE9/xOSh?=
 =?us-ascii?Q?5zWA22uSl1BpWpbLboOD0ZkKDLouFpNsj62W/OJxSKfpJJ4tJIZ2cWN+YFOE?=
 =?us-ascii?Q?SvkBocKVWLbKg7ul4aScThfFicgvq+Q65h8dHbBb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ebde2e-c1be-4544-7599-08da96714f99
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2022 16:51:03.7118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bsJjItLSImx/BTnLeY3asT6qsAlNb2k3FpYlxLFKKOdNqu5C/7MHgZwWxDl9OiKlpmkQwytUYploKGoe2DcmcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6070
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
Cc: "Ye, Tony" <tony.ye@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>, "Teres Alexis,
 Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>=20
> On DG2, HuC loading is performed by the GSC, via a PXP command. The load
> operation itself is relatively simple (just send a message to the GSC wit=
h the
> physical address of the HuC in LMEM), but there are timing changes that
> requires special attention. In particular, to send a PXP command we need =
to
> first export the GSC as an aux device and then wait for the mei-gsc and m=
ei-
> pxp modules to start, which means that HuC load will complete after i915
> load is complete. This means that there is a small window of time after i=
915 is
> registered and before HuC is loaded during which userspace could submit
> and/or check the HuC load status, although this is quite unlikely to happ=
en
> (HuC is usually loaded before kernel init/resume completes).
> We've consulted with the media team in regards to how to handle this and
> they've asked us to stall all userspace VCS submission until HuC is loade=
d.
> Stalls are expected to be very rare (if any), due to the fact that HuC is=
 usually
> loaded before kernel init/resume is completed.
>=20
> Timeouts are in place to ensure all submissions are unlocked in case
> something goes wrong. Since we need to monitor the status of the mei
> driver to know what's happening and when to time out, a notifier has been
> added so we get a callback when the status of the mei driver changes.
>=20
> Note that this series includes several mei patches that add support for
> sending the HuC loading command via mei-gsc. We plan to merge those
> patches through the drm tree because i915 is the sole user.
>=20
> v2: address review comments, Reporting HuC loading still in progress whil=
e
> we wait for mei-gsc init to complete, rebase on latest mei-gsc series.
>=20
> v3: fix cc list in mei patches.
>=20
> v4: update mei patches, fix includes, rebase on new FW fetch logic and
> merged mei-gsc support.
>=20
> v5: update mei patches

Greg,  I hope I've addressed most of your comments.
Can you please check if the mei patches are in acceptable state or anything=
 else can be improved with this series.  Appreciated.=20
Thanks
Tomas


>=20
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Tony Ye <tony.ye@intel.com>
> Cc: Alexander Usyskin <alexander.usyskin@intel.com>
> Cc: Tomas Winkler <tomas.winkler@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>=20
> Daniele Ceraolo Spurio (7):
>   drm/i915/pxp: load the pxp module when we have a gsc-loaded huc
>   drm/i915/dg2: setup HuC loading via GSC
>   drm/i915/huc: track delayed HuC load with a fence
>   drm/i915/huc: stall media submission until HuC is loaded
>   drm/i915/huc: better define HuC status getparam possible return
>     values.
>   drm/i915/huc: define gsc-compatible HuC fw for DG2
>   HAX: drm/i915: force INTEL_MEI_GSC and INTEL_MEI_PXP on for CI
>=20
> Tomas Winkler (5):
>   mei: add support to GSC extended header
>   mei: bus: enable sending gsc commands
>   mei: adjust extended header kdocs
>   mei: pxp: support matching with a gfx discrete card
>   drm/i915/pxp: add huc authentication and loading command
>=20
> Vitaly Lubart (3):
>   mei: bus: extend bus API to support command streamer API
>   mei: pxp: add command streamer API to the PXP driver
>   drm/i915/pxp: implement function for sending tee stream command
>=20
>  drivers/gpu/drm/i915/Kconfig.debug            |   2 +
>  drivers/gpu/drm/i915/Makefile                 |  11 +-
>  drivers/gpu/drm/i915/gt/intel_gsc.c           |  22 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   1 +
>  drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 254 ++++++++++++++++--
>  drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  31 +++
>  drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     |  34 +++
>  drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   1 +
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  24 +-
>  drivers/gpu/drm/i915/i915_request.c           |  24 ++
>  drivers/gpu/drm/i915/pxp/intel_pxp.c          |  32 ++-
>  drivers/gpu/drm/i915/pxp/intel_pxp.h          |  32 ---
>  drivers/gpu/drm/i915/pxp/intel_pxp_huc.c      |  69 +++++
>  drivers/gpu/drm/i915/pxp/intel_pxp_huc.h      |  13 +
>  drivers/gpu/drm/i915/pxp/intel_pxp_irq.h      |   8 +
>  drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |   8 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_session.h  |  11 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      | 138 +++++++++-
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.h      |   5 +
>  .../drm/i915/pxp/intel_pxp_tee_interface.h    |  23 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |   6 +
>  drivers/misc/mei/bus.c                        | 146 +++++++++-
>  drivers/misc/mei/client.c                     |  55 ++--
>  drivers/misc/mei/hbm.c                        |  13 +
>  drivers/misc/mei/hw-me.c                      |   7 +-
>  drivers/misc/mei/hw.h                         |  89 +++++-
>  drivers/misc/mei/interrupt.c                  |  47 +++-
>  drivers/misc/mei/mei_dev.h                    |   8 +
>  drivers/misc/mei/pxp/mei_pxp.c                |  38 ++-
>  include/drm/i915_pxp_tee_interface.h          |   5 +
>  include/linux/mei_cl_bus.h                    |   6 +
>  include/uapi/drm/i915_drm.h                   |  16 ++
>  32 files changed, 1057 insertions(+), 122 deletions(-)  create mode 1006=
44
> drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
>  create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.h
>=20
> --
> 2.37.2

