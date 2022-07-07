Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1594569DF0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 10:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8308E14A54B;
	Thu,  7 Jul 2022 08:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0198A14A543;
 Thu,  7 Jul 2022 08:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657183576; x=1688719576;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5Sp0KXaS6/Z0hZY1dHFB8H0hmb6IdYHay3fr1Ct2H4U=;
 b=bIapaBwGNJ5lx0hd85bv+8EJGyJTBdJzcn2HQDcJkkOLTndj+hMkn6OW
 roZ8s+0myVf9oUIFW0s7KR57kzaHmMgSHqnk+BsZUZf1VvcYPtHQVRP+P
 c75woA4Eha2FBvocecbCy5/FzABWU3QUmJmNTaxHtFjjN4SfX83ydnn9S
 /kPF7asEuoBsLZMN3ws0me3uyPiCr9VrFXfBQj+E9q6s10o0eoM+pJFvQ
 3f4RxznQuuz1WVdC6DfIySK6fDh2Wt9L/R2HCfKbOVNPZJfkJ3P9MisD9
 QFwmZXE2CrF/qpLVN6kQqUhd0sZuG6yrjEa6pJUEAwzW089XNAeyI2Rkx w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="370287052"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="370287052"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 01:46:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="720440147"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga004.jf.intel.com with ESMTP; 07 Jul 2022 01:46:15 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Jul 2022 01:46:14 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Jul 2022 01:46:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 7 Jul 2022 01:46:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 7 Jul 2022 01:46:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGkDe93NYNToltYBjvYr3wk3QGvsbyAiJTwwXkrNXXMWxr8tI9/XV1lIEf3Ira+SzQcUwNdmkum08AqFLNlLUIPmbcqOlc+WU8tJw09YtWpOjy7lsJ9W7qRgwceVmp/lUCFWWf4C69NklhP3batSGIVEDYfCMQZ+WfYv0mN9TxaGVuNrWhTWbc/gmDHCDOKxs3kAB2qa0c45QgnySJJrlALAdC73MV6JoY3qBWPJSaRJs4jqhhSIvtuEyCZKY0GM9wsickFhwMVxZdSA/C/KZRBgF/xpjKTUfBlbdKCWbOwQVmOhqD89WOIo+cUwgoDFJpcqZxG1n26VJ/x1gv2cag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUvCpr2sCQgwBQxuRthsZ7tlgz1IW+7n41oI+CgEstk=;
 b=KEWfzBeHv4SIzWnCnEuYFJ3UfphHp6nGwTjOLLsB1Q2/fSmz6yCQZWS/CIx7BxIE3rgQMTMnTg9cefVtScUiN9F0m4zyvyc8dUYfYrMv9xqifisyuh/Bu1X2gVepBKNfxqmdOln+qB3s+joqxS6KxdsrIBeyaL0NWpkU3zZNtO69v33T3aBe58BPbkhC1z8sVknwd61Ysdr6rfF3edNuAnwxFLXoqJFAlQwor03CR5lZzFKGKKLQJStZzjbnhv2htEyPyUCHVTFnEe2JC6xkZMAHg5IbV/SN8Sci5qW+73sIenXMEbDFwUY+B09atrYEiMtQJ1v/pO+SPhrEJsND9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MW5PR11MB5907.namprd11.prod.outlook.com (2603:10b6:303:1a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Thu, 7 Jul
 2022 08:46:12 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 08:46:12 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "kwankhede@nvidia.com"
 <kwankhede@nvidia.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "gor@linux.ibm.com"
 <gor@linux.ibm.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "svens@linux.ibm.com" <svens@linux.ibm.com>, "zhenyuw@linux.intel.com"
 <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "farman@linux.ibm.com"
 <farman@linux.ibm.com>, "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "vneethv@linux.ibm.com"
 <vneethv@linux.ibm.com>, "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>, "akrowiak@linux.ibm.com"
 <akrowiak@linux.ibm.com>, "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "hch@infradead.org" <hch@infradead.org>
Subject: RE: [RFT][PATCH v2 4/9] vfio: Pass in starting IOVA to
 vfio_pin/unpin_pages API
Thread-Topic: [RFT][PATCH v2 4/9] vfio: Pass in starting IOVA to
 vfio_pin/unpin_pages API
Thread-Index: AQHYkQGk+7oqdDT4NUCRLeKa0V01Qa1ymTqQ
Date: Thu, 7 Jul 2022 08:46:12 +0000
Message-ID: <BN9PR11MB52769E657ED58B29677AC4F88C839@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-5-nicolinc@nvidia.com>
In-Reply-To: <20220706062759.24946-5-nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 611f6179-7572-4cb7-b826-08da5ff52534
x-ms-traffictypediagnostic: MW5PR11MB5907:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A5GBTFZ+cCdtIDE8tA303fzXo8RMl/Z9zS2sYOUsdHgMzD3bAnMij1TCkfFJpt3Ud15NNVWxPMLJO9EG/ptKM3nZ6TYD2D80CztwHJDZJ3eKjjdae+oOKtkxRrJIMVpcKTpZCAiVHJ6QU0PwcRMHIs+9d7CvOlJN34/RLE6+hLC/E/BlTCWeQ/G4QNbKU/T4KbDOlGZY4aE66LeopSuhiyEq/nLyCx0bjM+XL/jOGwaD7l3e47WgYAHn4pM8AmYVxqVThZbeNtJDVPEdetKOo7HTDSbK0tzAsFDZN5NNdubKcZQF0yZv1NUr0P2BUbXc6I+fTrqWUvn4V8nuSD+ymVH9U/cIrIDlrEymYCaZEeThPM5NtSE7jqQw6EDwPSQLpENprFje8HMkCaihTEHvSUPynYKAXkhjeYtrjVHoCHcfazcJOoz2EpqWfc5LPzuIkdr7GpOhyaVSgqq7JvytcjD3hN+8QtJ6+4L03L51nkJXk4dQFm8Teum0limhI/a/Gz8FMr458JlG8Ncvxbj9SzbYDcuH69r8RcGUnaeq2Bua85DMCFb2fN0RA40yvtRXYc/2res2Eyq8EqW4x1hITZy0V5pmODFTU7KDDpYuogYKdTvGulezAUL0QYw9LE3ssfo7MDoQb24z0657RJAG6nrmzTCeEWCvJ8iJaLqIqeQr4M3SlGfUWNBsmn38PSYHxK6VY/5o8YcMAc78AzJnxxxudSbJHj1DCidgctPWXUcUC/A88LhDp/+ajvE2W5BwghmwTukFxojFYhSU69I1KVOrvKzxDUleLq/sJah3yo8Lzego1Psddfqtxpelwgj01nGhc7KMhuyhnOlpp2wfKA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(396003)(346002)(366004)(136003)(8676002)(186003)(8936002)(66446008)(64756008)(9686003)(76116006)(4326008)(26005)(122000001)(6506007)(66946007)(82960400001)(41300700001)(7696005)(38100700002)(316002)(33656002)(66556008)(52536014)(66476007)(38070700005)(7406005)(55016003)(54906003)(5660300002)(86362001)(110136005)(478600001)(921005)(2906002)(4744005)(71200400001)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xb0suVkbcdmoXQC8/9F5Yg01+16/zVaftGb1HluVhUAqPMKuoDLSM7f4/tKA?=
 =?us-ascii?Q?oCHWbLgR60GCW0aKHxXhsYB7pVgC6Ys/GWBAsOGOOMMqF0h8+FDI0YwPdUeI?=
 =?us-ascii?Q?zjBzy8vCJIcc6jzSYa8gWYKc8Z+yrazAOFYkCituKdrqTkv7QzKNeDNWw8ay?=
 =?us-ascii?Q?VeYVdOAqZ8hKVNzFMXtk3/a6BY3ifrJ3rgu37DeJnZT0pdoqn2qLP87nPeq6?=
 =?us-ascii?Q?+Ke7r0XPXO/3Kd2ApBOK/zSiiVdfnWbPGokz0wyWU3tAR/AW5PtHcI27wwwM?=
 =?us-ascii?Q?D4PA0xb+ddIHVj4U+VQ48dries4RkwLXR1dGQIf3A4wTWj/rYkPhvl1M9kNh?=
 =?us-ascii?Q?gjWQ8//rKzWrFbc7zQWWC9U3hpTAEpoejtA4vBBUwEH8x/XVP0Zm5C+vhMQR?=
 =?us-ascii?Q?22GDgyk97SiCYFoVt7lBjtLAWCzIyPcLcLyHfUyPofNc446IzagxyHaMMHp1?=
 =?us-ascii?Q?NT5V1eCU9N7cDAgevtNXn/B0oSJPgz4EmUfoA4d1D4odhWeXLWsun2s8jc0U?=
 =?us-ascii?Q?TXMO3/SxRmWEsUjPsd6fNS1RevNNd0kMDnvhXiKaPz3TWRBoP3+3CvjjQhXx?=
 =?us-ascii?Q?2+ECtc9YE/cqAuO8TxJcN+EdQfrGR/TGjQX51HJx3YBN9FDRudsdNIcZaaDH?=
 =?us-ascii?Q?ecP4U2srAGztfWzaTHFztPNxzUydqtOVlio/JcN0mC7US3vRBhEA0JJqLH7g?=
 =?us-ascii?Q?8plCQzhNgzLs21t9U6pHUariii4nXfIrT2F5S7obR5XL+em7rxJtSJauxC4Q?=
 =?us-ascii?Q?kNc7eGrSEi+QPMkGQmPxRZ2KaRuTJzZIsg45Yy7bhYt5BQt0wZ12SDC+sh85?=
 =?us-ascii?Q?73dSVKCP/IPDeoak/aK//NvsDe+BhSPYCHE2BRyaVPcsLGcp7k2C2rAaXejU?=
 =?us-ascii?Q?a+2f0CIxPQH8NeEB6SSzUl8Y7EFeaYi57Hvd5dtizPgAo5+deSmkGIzX48lK?=
 =?us-ascii?Q?eph/aasugUhsU1ES/+mfoA+auTq+8F4tncRu0kUOQRLeGNIj8RxGZISf3ySs?=
 =?us-ascii?Q?A0OecRyBHkxCib3csaZGeFnYDvFKjY6/WrW4dMIs2C5BzPqtjjNLYS+t33dD?=
 =?us-ascii?Q?7cbKNRsJnhN2/kmL7qvSL3eCB7Sveuua02fy8fRz8Le43pokoOPpOocd5ECg?=
 =?us-ascii?Q?ofBlJsdD7NnTe0A0Fy595naGhyLTujbHOQGQuT+RrSumDTtewo/HPbTUdaZz?=
 =?us-ascii?Q?6ErszZ1N4RAp3O4nuNClnarfKfRTN+SRe3ruxFbS6sA90AwGiV4Q/PuWTPIF?=
 =?us-ascii?Q?u7v5AR1uwYXrAU0VgSHMQWrpyHW/PTSkvh9nRj3oKyfngN3twTjcaJyqWlQM?=
 =?us-ascii?Q?pyD+W4snAbVdCCozbXqYl7p5FisuaVOxVHSXPvVZF6NafPX1/6OYcIjmTSyu?=
 =?us-ascii?Q?QdNN8pme/5u8IEvcWqDJcGf/teIDYkwL0URVPZcJyNqkIEoFywPBfGQDb7li?=
 =?us-ascii?Q?wlzzQ/CnuFHuK6BvKQCnC161TfEMBHuGfThLOxuEbGnyEi/b2sIkYvZLSDUi?=
 =?us-ascii?Q?qtmkNQLgO/hbaiwefwr6C7UuRAMnOLMPG8JMZi7YQd5zOyIpLFABsCtdgikG?=
 =?us-ascii?Q?1B6YbT27boS8ahslMDHAzJdXmVbjoHOnTmypDTUJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 611f6179-7572-4cb7-b826-08da5ff52534
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 08:46:12.2028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aoBWMx37ZcNIcvvZ23/z1adTdPhOsAWTMhhEPh7dUeHivdeUAm9sa+WiheyxQtkB9D5MTku7JTK4g642XlK4og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5907
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jchrist@linux.ibm.com" <jchrist@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Nicolin Chen
> Sent: Wednesday, July 6, 2022 2:28 PM
>  /*
> - * Pin a set of guest PFNs and return their associated host PFNs for loc=
al
> + * Pin contiguous guest pages and return their associated host pages for
> local

can we replace 'guest' with 'user'?

>   * domain only.
>   * @device [in]  : device
> - * @user_pfn [in]: array of user/guest PFNs to be pinned.
> - * @npage [in]   : count of elements in user_pfn array.  This count shou=
ld
> not
> + * @iova [in]    : starting IOVA of user/guest pages to be pinned.

remove 'guest'.

> + * @npage [in]   : count of pages to be pinned.  This count should not
>   *		   be greater VFIO_PIN_PAGES_MAX_ENTRIES.

greater 'than' ...

otherwise looks good:

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
