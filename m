Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 678C734A160
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 07:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A266EEA8;
	Fri, 26 Mar 2021 06:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04EC6EEA8;
 Fri, 26 Mar 2021 06:04:02 +0000 (UTC)
IronPort-SDR: +0yc68Mta7eemm8iRC49ASX7PL8p/dUufFgT6jHj0QRRyfnGemv9yvwgnLxQLfrefZe/MYovON
 hUXWQTT2qzXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="191115316"
X-IronPort-AV: E=Sophos;i="5.81,279,1610438400"; d="scan'208";a="191115316"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 23:04:01 -0700
IronPort-SDR: FFbLDIHqxGOkmf8EqwiCV3JeTT6lZMKEOSXBgpirWjcpHYGBcMvbVgCSubcbBJkqCH+9ScqpmM
 MM2AJSHRb0Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,279,1610438400"; d="scan'208";a="514945135"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2021 23:04:01 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 25 Mar 2021 23:04:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 25 Mar 2021 23:04:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 25 Mar 2021 23:04:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ew/Y9oinOIV/bWs4hw19v5Vf2Uc0orgFUQnQFfQfR5JtLn46ElIOBQoMwD+ODdr6mk4AHA/gJ3wMIgbKOZLFTHDB/P67m9LpH2+HwLO3ghm+Eov8B/MZMtn5MEQdgSpot6ahTxa3P+KHfXhy9FapwEGd7HKxStGq89ylM1jSWhX0RP/9LtoIDzWrBdsqX8RVA8TqlDujmFRtgn3eyO3QrWiRwuFGBnVvyI8jTFcM7JxZh6ued+Di6DjAwOmk89SzilrWU+ud09JRGqENIjxE6leZBaqO+Phy6X0UxY80vQALiy6P7lfMfidUMqZEPO/FR1WtRAM8tEJYBerz5q5q1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XvF5d8YG1H9/9t3nJO+sRzwPWyr8MNxKW48a6WgmHA=;
 b=m6+bpAaiqVXOTqA4WV+qCwqG5FriEBxtBieIN53t2gclb5uNuhRWjtAfDIr1xcFXkPdJr5qXoiWjmsESs/5RJizXHAv7Wd8cnEx1vNMOH7wLprfnGaHdNjFTzCxAMRmSfEjdzvRKUynkOh7EE+KzbjZM6ywea9fBtgwt6RH1cPw+0gYttPsKW6vOU/7Imy02xBqUIaxLg6vuAqR8VFWHwgtrOzvsjP82tnBAXRzK7PFGKdu5PSUPGAySz8LB8tvvKkUq5gF0P4HZs9WkDFO8mYUd41Kb1KtNHmtAlAUG4mT74sScmIgHbuxX/Ow6mEGcIrg3Ae58jjcbLY3cFQo0qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XvF5d8YG1H9/9t3nJO+sRzwPWyr8MNxKW48a6WgmHA=;
 b=euLuaNhh6hFAmk2e4lVi/6aPPhDlmnoStnS5pDBRaYCFA3y1E8bOuU1Li0ZH2fhEnalt4tFYOP28zUaNtQfjK0zE+pVA96trGgAjygFS/bxucfmHGAl/m15iCORGFWMWB22ZMYfHdOB0svWMeGU21FtvguMzxvGyFMwOBQyVFC0=
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR1101MB2223.namprd11.prod.outlook.com (2603:10b6:301:54::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Fri, 26 Mar
 2021 06:03:58 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29%9]) with mapi id 15.20.3977.026; Fri, 26 Mar 2021
 06:03:58 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [Intel-gfx] [PATCH 15/18] vfio/gvt: Make DRM_I915_GVT depend on
 VFIO_MDEV
Thread-Topic: [Intel-gfx] [PATCH 15/18] vfio/gvt: Make DRM_I915_GVT depend on
 VFIO_MDEV
Thread-Index: AQHXICLyxojq74jjR0KE9+YRbEelZKqVyZnQ
Date: Fri, 26 Mar 2021 06:03:58 +0000
Message-ID: <MWHPR11MB1886B77F545C4F8E2AAC0BED8C619@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <0-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
 <15-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
In-Reply-To: <15-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f5e7a11-e353-41fc-9633-08d8f01cf214
x-ms-traffictypediagnostic: MWHPR1101MB2223:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB2223E38D5B591B1DF2FE833A8C619@MWHPR1101MB2223.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yeugJjDhg8J9bU/zP6cs2ym3temOrQTEK/zicopJH2et853a4GdIabKjzNZzPttODylCBbVlgFopcivvvhtK40VktKmSwhgexN+jKD+AaM2rzNKah2SsdWC/XAu147eU+QlO6Ck2bggltGuozfrtC2e0zL87UjFz/mbcXlPt8+sFg9T8IBd6X+kpKP0O6JsP7WoGIVLwljXJWtGSbAGYHyu8Z3aVc+5l4969RrkiwA5gut/kh+PJeeUboGyqOu7QTcagWWBhh5md5eDWTmF+rh4BDj8y2GMl3ZORVhw0zemdnWjR3JhRAUQ0N5OlRf/gOGU0ubUrWuJ0QZBeM4Y5KEf6/79MajanOez96Cp1LTx7goJ/NF5bGz4ty9Fr16D/4kV0BDazKHbAWrXsaP4Kb1Xj5XufAHmRww+OdsamrYvU2GmqEwls3+QjWOfueMddzGk1va0DN5l2gy0Zqvw4TLa7WMuciFX9MBclFFCj+hAesLZrPIEX190RSUT3zG05Z2ZwjICQNMIkJvpB5qGLAjXqRa5GDRPoOu6C2+adwdxS1A5YP8tpOV222pQHPZuCl9OsmxpWM41XWCeb+EqZTbfp3dxx3HA2AzQLwbTq+VPJgyk38/JyCzWZnsP+UTJOO7Uk61ph4npY5ibD+lKP3I9xIX3Gn8iXlCaTB71lQQgL5HFW+wGc3pk3l2s2pWZGRR4Kyv8CuW/9BnoaywGo8g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1886.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(39860400002)(376002)(396003)(136003)(110136005)(2906002)(8936002)(7696005)(8676002)(186003)(86362001)(54906003)(316002)(6506007)(478600001)(26005)(33656002)(38100700001)(966005)(66476007)(66556008)(66446008)(6636002)(71200400001)(52536014)(7416002)(83380400001)(76116006)(4326008)(55016002)(66946007)(5660300002)(9686003)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?UJvqJhdx9lQRxBIutEDpK2ap8BqMK9/jpXpgHdJ3qt5UvFxWADvbl9VIbEG4?=
 =?us-ascii?Q?CYnO1lr3NQBPpLyoPtWuVL9TO4Vq0n7uPZMB6TgvWnI4zzGix6Bm2bnxxurr?=
 =?us-ascii?Q?NYqUK4T7O9LNQMPFZLN71QXvqkr+Ua8qlCGcl6rAvwknhetr/yPSyan/WnGC?=
 =?us-ascii?Q?GqWr7E5CXD/xrdGpV0zHkIJI2NsbJHI6z9MjtTu38ACkEyLfXkOV9NtzGoHN?=
 =?us-ascii?Q?Myy96dMvf3PnB5tfpiu/nNALSKOp+pyerLH3qK4ZmBcuLKk1ZuADvbsP7Uma?=
 =?us-ascii?Q?3ppeBl3jRsJE1MjxCOB2wRNigN0cPjC8PV3mvbWsTWZ62Yi5QT+VEoj2dMUh?=
 =?us-ascii?Q?tH+U1uVeyU32ei2GxSJxwG4bB+PMZqqkgnAj+ASO6mjF4la2/W5N/wcGZVjo?=
 =?us-ascii?Q?vzyWFyaPKx1fqBB6hFb/kWcst/d2Ne4OkTghZN3Fb28oMWjpSS3f+5H+hA2b?=
 =?us-ascii?Q?UkaUGSSRvDSZX1CppmaF7VbkLKaDkScDAqqPYuZCk4x9TeDS55eCr1MhRUtX?=
 =?us-ascii?Q?htA2GajWsDGnzAs8aG4aaOeTliYmqBj9fkzCiwo7TYr1f1Moh7A6d3/DESAT?=
 =?us-ascii?Q?1M3GjYbkIIFJDnrE6KL8oBF4d90pici8NWbYeOMxphdNzQS4uZoUaIURmEL+?=
 =?us-ascii?Q?NjMpWOyOvnTDQUj+kUM/KyCm7Ep2or8nDDl/RW5V9/wKhBD4BiL6/ulcjg5G?=
 =?us-ascii?Q?gY7R2eu1Ijwre0bXi5JDVZNITmwRW8fApB1ga9TExwsffmfrIeNi80Ot5Kr5?=
 =?us-ascii?Q?lsgieKsoUza7kHt/jf+WysiGKdCVdNnEpNxqltOhP/KXxwWlphVr5dXJBOkI?=
 =?us-ascii?Q?EYsDm5GQRoV/fTzn5DPmWHE06ABBqUKhzvy8lQLX2k2e89lKU308Jeqqay3o?=
 =?us-ascii?Q?uuuTx3hpNHmVwOAy544pH70hH0JmjTqIbUqkaVLzlsjlp0gbM4XyLkjQzOyY?=
 =?us-ascii?Q?fifuotE0hZrWr38pClUmc6DnGFqcQXTsJory67Cd3N0IgjBqq1RkIBrQULEJ?=
 =?us-ascii?Q?wylcGX3RWlCN32DIArBTnm3ugIXI/fDOsuCAn8RqQTQMCthm2OQKzlHWZ4gm?=
 =?us-ascii?Q?t+D+gsYyPZFBWnRRYnxfiZM+AAGv5Y5UgggeQBatdxEiTtNjqK7RAZHHeKdn?=
 =?us-ascii?Q?OsRSyf5j3Y8Vyt1B4e/t4M4UPXEPzBnkpWqm8xDq78IBnmXgUkKlj2jif4Z+?=
 =?us-ascii?Q?fvDgNCXDwwAlMI4FN2ZvMEQj92PpP12snm9Yug5ExXUCjcpAaQgIjX/gl+z3?=
 =?us-ascii?Q?LV93b4mnB6F4Ns+eyNCbfLnjmOwktsNeZQPv+y9M7gUKIR6bfNWj2Gs5XUZv?=
 =?us-ascii?Q?+8K5bCWftS4CBAzZeowOEZ8s?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5e7a11-e353-41fc-9633-08d8f01cf214
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2021 06:03:58.2831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyo5DgsiQdkexSTBa9meNcOQrzfJm53i9Fj3s/oqIEIBytpUT3kv6SLCK5bDt0TA80Wox0GvyXVb+0Z+XY12FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2223
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Tarun Gupta <targupta@nvidia.com>, "Williams,
 Dan J" <dan.j.williams@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe
> Sent: Wednesday, March 24, 2021 1:56 AM
> 
> At some point there may have been some reason for this weird split in this
> driver, but today only the VFIO side is actually implemented.
> 
> However, it got messed up at some point and mdev code was put in gvt.c and
> is pretending to be "generic" by masquerading as some generic attribute list:
> 
>    static MDEV_TYPE_ATTR_RO(description);
> 
> But MDEV_TYPE attributes are only usable with mdev_device, nothing else.
> 
> Ideally all of this would be moved to kvmgt.c, but it is entangled with
> the rest of the "generic" code in an odd way. Thus put in a kconfig
> dependency so we don't get randconfig failures when the next patch creates
> a link time dependency related to the use of MDEV_TYPE.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
>  drivers/gpu/drm/i915/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 1e1cb245fca778..483e9ff8ca1d23 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -101,6 +101,7 @@ config DRM_I915_GVT
>  	bool "Enable Intel GVT-g graphics virtualization host support"
>  	depends on DRM_I915
>  	depends on 64BIT
> +	depends on VFIO_MDEV
>  	default n
>  	help
>  	  Choose this option if you want to enable Intel GVT-g graphics
> --
> 2.31.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
