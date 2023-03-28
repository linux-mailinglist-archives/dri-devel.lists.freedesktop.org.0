Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A857D6CC082
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 15:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2C810E529;
	Tue, 28 Mar 2023 13:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C75A10E48D;
 Tue, 28 Mar 2023 13:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680009648; x=1711545648;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0xnOQFQKsDty/HJz7OCN3Pr6VFNqTJBmrFTWfZc2BFU=;
 b=Tnd1EHeTWk7l4tCbW3fAmIUPCRwktiFb9mPSH+GwXR/wlLVq7/LXO9x0
 jdkwGzmkiFoCu/YkgwRwNJvbmfQIy22UU7+7dVdrTB5yTZHM2a/ZfhLDl
 C5Y0Q+AcigKzbb1oJmjOrLzHxZhxbsklsvbNZLMuOCpj6S25DHXpvSr4+
 KdxRSSp5ZxCSm2FSbzBsdmAEZ9LGqMjOkeBhUti7YPiHxB5IyHZMktFD5
 ax/eg7SeO+juSmw+9OqNIHuuDRXKCJjCF+FFELewygnjSNzGpuBOXZJRc
 k8sDwAYIc2vlttdxVMiX5p1tPBAttYfHNXecbpj1MDZ55nMqueiXrfU5t A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="368320521"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="368320521"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 06:20:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="858076759"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="858076759"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 28 Mar 2023 06:20:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 06:20:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 06:20:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 06:20:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 06:20:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWtiQWtsLk2851hzoBcP2om4SAdv1pxLJ9S5c4/Uudzhz7wQOddu973M5nQq2CYTip3SEq5VcDC0gP0KJdmLA0T+2yIj99AgGIsg9f7r/iVSBg9L/CZA04yDzuM2VT6ZHVv4xA3e5zBc6FHAqbT0dr9SQrqf6r0UDvYvAPqe+mu0Acc3shtPUySr8jljJIY0FxJNDHPU2j19sxSLU2XSybmHXCOQTSWOcBSxjK0CKyJqm7hNVV2ol+/QEKBXXm0c6RW3t9bn6EHRQ/FYXzo2JQfvwVbDMPxGZZA+pw9swyq2BdlaJti2WCXtzD9XrLK2KI0QGxEl4h4i+LQwFBdOKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxJPkQoOPuww5QdwiDiQ+F7gww+EOJVi4xXAY1KqvGY=;
 b=jNCsYMK9NnUpkuSffXSnwTe2coYGoh3AodSP14asLjmYl3p0RE3/ffWqzERNkwvQKlDM00Fl5nLrMyF2emgBxYydcGwACtBtvWYZMsFFZrJ8xh7xxfBL1AdKL3Hu5QE0V18ryDk6GUlIb5IfOFUZYWgW9kMPLU19/hzDOaMZc4mYXDgZPNVqH2M4hOKqMaOrJVYWyRkzM1RfldqYRWuKekBuVqNa8wVjixf894weqclMNENO5If03/E9kFIIUmyg4R20b+f5cCyTFR870B09f4lrML9IEv3Aguj8/xy44aLYV5n4zEb4RsykAu51hodJ9GjYH4yMsdVmAcJrgJeGKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SA0PR11MB4671.namprd11.prod.outlook.com (2603:10b6:806:9f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 13:20:39 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::e382:a793:21e7:fd49]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::e382:a793:21e7:fd49%4]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 13:20:39 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 0/7] Enable YCbCr420 format for VDSC
Thread-Topic: [PATCH 0/7] Enable YCbCr420 format for VDSC
Thread-Index: AQHZRn8nw/kWjfeWPkyOdd90kbBg6K7w1cUAgB+MCmA=
Date: Tue, 28 Mar 2023 13:20:39 +0000
Message-ID: <SN7PR11MB6750FDE3318A85E0A2541831E3889@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
 <87ttyvbhuz.fsf@intel.com>
In-Reply-To: <87ttyvbhuz.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SA0PR11MB4671:EE_
x-ms-office365-filtering-correlation-id: 4f86b03a-9821-4b0a-d5fe-08db2f8f3994
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BkZgTRdHi5Md7QmykOrtPBwwXAXrXKTjQxsHXqukNh2OENju01nDSsC45zU3UA/BAHyBTFoVDiZdE/NZ9DQdaaJuuQXxJ2OSBmHLxLSGiIGVGuTsT6L+a4yC4neArOW3fq2g4Mi5qQg8l4YXpfedMCQ+LelAgugXFSXVppdzSq/wpG8WNsutOgykjf+88l8vFCBkdvBGxQpm1f4jkDY9hBtvx89TU9JMO8v07AJWy6zfWMDACkBq/PTvPfAjMAs01kqCLvx8MDjnNxyFM12pYYrEJufhG8N1ghr6G1BQgwDVfuA5hTcn07ItL1kyulyYK+3G55VQyxMLtIIYgNg6vuR2vIrCgUwBGf1lfQsHGvv5M4FRiMFIt6FtNDlXtHQQg15l+b/psPcDF21ZmEDtYcsmYG2lAslx6ybb9z3f/A5e09svT60t9teXYqR/WcTOUWKZbwau5RpcVUidTWIrFFPPQIbvb8Ro+f/0ZJyOdzbXT/J7OxGHiiOW14T3kvU7DZWdZbirQah89FVnPla8m/EIj/r1xKX9sA/DiziWyIG/I+Et1Pg103sr9ybe7gMc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(6029001)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199021)(8676002)(4326008)(41300700001)(64756008)(316002)(66946007)(66556008)(66476007)(66446008)(82960400001)(2906002)(52536014)(8936002)(5660300002)(966005)(9686003)(76116006)(6506007)(26005)(53546011)(110136005)(478600001)(54906003)(71200400001)(83380400001)(186003)(38070700005)(122000001)(38100700002)(86362001)(33656002)(7696005)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aUwtBB302aF9oov1aqJZJgrDyuEntd1TIY3ekYemg7JsVYu3E5B+BDQ1okej?=
 =?us-ascii?Q?aibSmOJ1iTPj6ByH5h+ghnO35j7GAAPFVaDUjH0gwD2kk2nb23eujLU/iLhd?=
 =?us-ascii?Q?GX+9P+Mc4kLxV3bYOkr2XfgevqAqkcYpun1CI4ExwjBzbYAZGNLUgOcL5Bxd?=
 =?us-ascii?Q?mbDwem500As4dj4K4TSEtoq1i2ZsmsvIp80eTR7gd/z7TF9XxZr3/BuMvO9w?=
 =?us-ascii?Q?BBxfYb12uxtPc7ZeIMjXrvhCfe///ixFAUvL93KZKoAjRMoBdWy816jCtL83?=
 =?us-ascii?Q?8pXEhy71s/pE0+ywz38xnrBpzsNfnnK4zqc10xJZZyHAh0Djj03Z3l9nn023?=
 =?us-ascii?Q?XDrYwZIxWxeYxNbDo5i4X3Cxt7+DquQOwxGbc3NWBwy1tvEU8Eu43FrhMp8C?=
 =?us-ascii?Q?PXADrRZKUeRT7qLirekPXuzFlP3nfult2zvDA5ykZTyZAnjgNc3a7FQ7YVOW?=
 =?us-ascii?Q?PsIxv5oGyj7Eu9UQoC6VsDPlOfRnEP+bkbVNayrHsV18fT2OfLdzmJasB4d5?=
 =?us-ascii?Q?CwJeD8E/XuAhmHNEYwcMetVaM4CrtfccsvR24DaKiLLm3jDT/MlTj42nbF5m?=
 =?us-ascii?Q?nQrxZz7z/mPP9Bbl0Um5K8YxMxYsDcOKfhAC3cS6AHfxAow+ncgP+CvEBxo6?=
 =?us-ascii?Q?fP0IWp88RTaCvD6O7uvcB/WTO85wklBt84zFxQa//PB3Ja+hkIgfDiumvB9k?=
 =?us-ascii?Q?ndQz5IjEZEGkCnfBPVyJ26utriY23edzf+YRfgbIgXu2kFrQeIfevZGKG/Mo?=
 =?us-ascii?Q?G3tYFg23HTKABF0EGZEddvlGk2bg8HlmZ2twEMJO3QCLZpKj5RY0GppHf1tJ?=
 =?us-ascii?Q?aYnWdMmNsOa8x8I5ZPPL9yboZNDUCOvbPn9FgDHAWiLpRk90SgfOSnyd1l9n?=
 =?us-ascii?Q?wZoA6J2WV9CJ1yAn2JjpIBS+IhD3BwyIX22MZWwxUF2ZFI6V+7+sRhhYoZrE?=
 =?us-ascii?Q?+BF0WqDmtEcdSjDMHSPTtQYDqwW/bkGIrGF3jY4py+wQ7DI8gcjyq5ZOHNCG?=
 =?us-ascii?Q?cnJgWQfps0RgVZEhoD2enAV5cgSD+eSlQOhPXOdWkBdyquy/emvchvH+Izv/?=
 =?us-ascii?Q?Qx/xJpOa7hBEAALL6QB7hFjHbI+vyEiYyxQTmKxgTNRXJOU8QRH6D0JLpOFH?=
 =?us-ascii?Q?FA9dJar2Ipo3qm8Qq8VjlgmcHxMzsznZgUOpey9aDTMm4z7vFtWpZd1ND3Z+?=
 =?us-ascii?Q?2dxC9Yb+G7ouOsvQ9jhSvSq1kKi7WnnkBGuojDTC6JBs2NZObqXExrcJPDKy?=
 =?us-ascii?Q?Dm9Ao+qLwUI5FcpulgGdw62ZE5XZ1Q7GNZmBN3lnZyoSgZrlIIdjKSiSjnIh?=
 =?us-ascii?Q?wcCzqs7VQGEXf5kf/J0SDD8QKTVOR5o+zM1/uwd+NlzitY/lcBvxaePy9DXt?=
 =?us-ascii?Q?2mX0d/cb5UtUFnPBgQL0PjAT0Z26Dlz49Kdgxt/dOEs7PXwX6V1K/WoqUup2?=
 =?us-ascii?Q?RSExbjB8odc5/izNZ3yn/3stUybOU6V1Vl0vkCB+uQ8LGwa8ecFU8Acf/VZ4?=
 =?us-ascii?Q?V1LklyYHuXVQd2F/r+o5LTqovi3LXAjcj7Zb2Nve3JWpjJ7khfxXpJlT6Hpa?=
 =?us-ascii?Q?RO004lMl9YvzJUb+bd6wakr5xXmMihwbLFAIs9Zk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f86b03a-9821-4b0a-d5fe-08db2f8f3994
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 13:20:39.5603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eSoHE+bJou397DmkSGJML2JjMWO1a8Ti+1cixF/rbvPNpyz4pdQIQoPnNpmzl/1Pvwbkit4NFKD6FSA00TwqOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4671
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Ja=
ni
> Nikula
> Sent: Wednesday, March 8, 2023 5:00 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; dri-
> devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; Shankar, Uma <uma.shankar@intel.com>;
> Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: Re: [PATCH 0/7] Enable YCbCr420 format for VDSC
>=20
> On Wed, 22 Feb 2023, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > This patch series aims to enable the YCbCr420 format for DSC. Changes
> > are mostly compute params related for hdmi,dp and dsi along with the
> > addition of new rc_tables for native_420 and corresponding changes to
> > macros used to fetch them.
> > There have been discussions prior to this series in which some patches
> > have gotten rb and can be found in the below link
> > https://patchwork.freedesktop.org/series/113729
>=20
> I think it would be useful to get [1] from Dmitry merged to drm-misc-next
> first, have that in drm-next, and again backmerged to drm-intel-next befo=
re
> this. At least patches 1-5.
>=20
> There's not much point in all drivers duplicating the parameters, and we
> need to move towards common code. Dmitry has been helpful in
> contributing this to us.
>=20
> BR,
> Jani.
>=20
>=20

Hi Jani,
Maarten has acked the patch series to be merged through drm-intel and in th=
e meantime
I will work with Dmitry to pull the common code to avoid duplication

Regards,
Suraj Kandpal

> [1] https://patchwork.freedesktop.org/series/114473/
>=20
> >
> > Ankit Nautiyal (2):
> >   drm/dp_helper: Add helper to check DSC support with given o/p format
> >   drm/i915/dp: Check if DSC supports the given output_format
> >
> > Suraj Kandpal (4):
> >   drm/i915: Adding the new registers for DSC
> >   drm/i915: Enable YCbCr420 for VDSC
> >   drm/i915/display: Fill in native_420 field
> >   drm/i915/vdsc: Check slice design requirement
> >
> > Swati Sharma (1):
> >   drm/i915/dsc: Add debugfs entry to validate DSC output formats
> >
> >  drivers/gpu/drm/i915/display/icl_dsi.c        |   2 -
> >  .../drm/i915/display/intel_crtc_state_dump.c  |   4 +-
> >  .../drm/i915/display/intel_crtc_state_dump.h  |   2 +
> >  .../drm/i915/display/intel_display_debugfs.c  |  78 ++++++++
> >  .../drm/i915/display/intel_display_types.h    |   1 +
> >  drivers/gpu/drm/i915/display/intel_dp.c       |  39 +++-
> >  .../gpu/drm/i915/display/intel_qp_tables.c    | 187 ++++++++++++++++--
> >  .../gpu/drm/i915/display/intel_qp_tables.h    |   4 +-
> >  drivers/gpu/drm/i915/display/intel_vdsc.c     | 108 +++++++++-
> >  drivers/gpu/drm/i915/i915_reg.h               |  28 +++
> >  include/drm/display/drm_dp_helper.h           |  13 ++
> >  11 files changed, 442 insertions(+), 24 deletions(-)
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center
