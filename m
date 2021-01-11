Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DC82F1CD1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 18:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D034289BFB;
	Mon, 11 Jan 2021 17:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0F989BFB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 17:44:32 +0000 (UTC)
IronPort-SDR: Re8/U4g5BfY5FP9kYSVafjrwCx8rH/wlZWniMrCRCLP5sTKm72mc91q4NstXjWT2C/tlNZHpYm
 Q690fE0RJzPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="175327159"
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="175327159"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 09:44:32 -0800
IronPort-SDR: bBFkRLKXk+c1Bn7M+tG4oUZ3dPrNeeRNesEX1L2yo4065OqPo3LqA4zT3361i7N6lLDMeJgXf6
 IN7ZBeQ25Rqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="399881508"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga002.fm.intel.com with ESMTP; 11 Jan 2021 09:44:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 11 Jan 2021 09:44:31 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 11 Jan 2021 09:44:31 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 11 Jan 2021 09:44:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnTnq37fGN0wVZ+zTHD37uWNQ07ONj1GfTCofqlGl2kWMPIFktZqpl9VsF+CTCp65+t2cfpnNJ84l9QlgDz+RRtyB2pOTJC9ChJ/Jz1aVG+Yw/1bMR/QvTqfV03Q/y5r6Kkx23CKZSdmPQOeclvVwQmV2lS8auHmCDnhY1jYkB5q/35RqqtjEArSh44eY+QpFW1fIJtITS4YX5th0kOeXMlYb44RSlB7wigFfxW7tJ13tRP06IAZUV4BvN01NMgXFEEioSghhz68ulU+Y+aQMmzNOrEQ4SMZQfztAHfwC2wyRgZ1lVbNpWZk0ZL8FdlFpEf/6a1xTTkv3GJRVkD8qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmX8Wgy5sd7lS+uit1GSdnLZ7RhtpfYlrQdXg4s2As0=;
 b=BouBwMOkFgrFa3IY95QpobGbRVuklSMW0t5vujbPJXyxwnUTDlmMQvavtXTitzl7nfRy3lnxaTWHbjthz0oaGYmQJ1bagEjU/ZPNnOs/duki3lfG93YCBtl8Njb0wIu0a709SYnG+zij9VMqA8NPU90iMBUYNZL98KzTaNbXdMs6IjIVyUst35kN4lOsyHfYqyek0SU2uHFz7mmejtCMtl6bBci1GRQNZLvm22ngWdIDsnF+0dcVIg+PYTI6OF8zPOn9OfTFY1ZTBAVzyH/RV4sdUKQtFD89VKKuRqC/qy/Zqs4XvRraVGuhP2PnV2L6XTPjiaW3vo8EJNnviS9OrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmX8Wgy5sd7lS+uit1GSdnLZ7RhtpfYlrQdXg4s2As0=;
 b=XYcX0GCu09FpUr3u0Ph7ew87WmrxA/eFZdCQWuclzNXwdvIbn9+y4fbI8HLqu7D9NNgsLk3Jsf+Su6ZkmKcFEokx2Ai09xbIbmEo7DQEKUihY4uLY4DE0KwikY6IIq4LIeyVIiMKoj7HDu8srL8FJhJrj40QN48eOUUPVrwsE38=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR1101MB2318.namprd11.prod.outlook.com (2603:10b6:301:4e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Mon, 11 Jan
 2021 17:44:25 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 17:44:25 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH v16 0/4] RDMA: Add dma-buf support
Thread-Topic: [PATCH v16 0/4] RDMA: Add dma-buf support
Thread-Index: AQHW0ybv5Bnk7Ef2+EKwhnBRO9bgTqoitKeQgAAF2oCAACAzkA==
Date: Mon, 11 Jan 2021 17:44:25 +0000
Message-ID: <MW3PR11MB4555953F638E8EDCD9F2CA90E5AB0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
 <MW3PR11MB4555CCCDD42F1ADEC61F7ACAE5AB0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20210111154245.GL504133@ziepe.ca>
In-Reply-To: <20210111154245.GL504133@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ziepe.ca; dkim=none (message not signed)
 header.d=none;ziepe.ca; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb6702fa-261f-42e2-ef53-08d8b658896e
x-ms-traffictypediagnostic: MWHPR1101MB2318:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB231837B365EC5D357B6F5038E5AB0@MWHPR1101MB2318.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JDXuIYhq6Mls3msoDAjh/Lc8rQKZUk/ql0bvVeO7FfMUS8Ml84xaJVcpUcXUQSLe6XnpG9cW+wfmOVQhhKCOraxgt/38S+kD7/W479HuP+cE0NFcq4OB21nlANQhAxx/fgTOAZIaCFA03QxzjtIfTL7m5A7x6gGungo8+bURXPQGBWBWjDADXWTfePWYUOQ0jGr0UpLvg91/8wc5L/nsCzBm+Ls/DwHzr1f1Lw97l6MvaA0iQxAA8axXbCzHM+KSadTZfXGaatuB07yptNlJsdqWlEv+FICXMDQAEAz7l3ccXshrK2YAVklH/PdRz275CpmpAULwsHWXjTmr84xX+nB+aN20PvYOT1wHyrn9Dm46qDhuA12SPSy3Y7XVHXOY1hFK6e1FdG5d2niFGN7ebQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(8936002)(66556008)(478600001)(66446008)(64756008)(66946007)(86362001)(76116006)(54906003)(26005)(6916009)(7696005)(83380400001)(9686003)(53546011)(66476007)(6506007)(55016002)(8676002)(316002)(2906002)(5660300002)(52536014)(4326008)(71200400001)(4744005)(186003)(33656002)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?IKU6yGsTrHXEf9DQAwA9UJq6xyTLRRT7ShzfHHDJNlMmQKeK5J1DyfUBuvUu?=
 =?us-ascii?Q?gXwGPJF9Y7zBA8oRWJxOgdnMymW1kP9q+dP+vhT2LlOdvEwT/PYDDAFD/6LS?=
 =?us-ascii?Q?tQJM5EXpy4G9BynEmVcMpgPMyyh7GWs1ZKVPoyx2MxZaWheLxGEQ2GfjocOH?=
 =?us-ascii?Q?4yLnBvvSOtPA74N39VMpJBk7pgB6pl1FJFNTM/BaANgsa7UrYAHSTrhkT8Pc?=
 =?us-ascii?Q?fDz1nLl21qwcdfShXzTi7bj4AVIuc0DGtmtJs1Kyyw+U+vB/bWztaNhoncdq?=
 =?us-ascii?Q?Ui+nYYdtSBb+C13zm25pgNNFBtknUdaSnS90PMU3Hf47KVvtITQnWJjcxWZw?=
 =?us-ascii?Q?L2lGd61WGdW99moNl8lMRkefw2kitob0+fZmyneAwXRvGPq81rtWNJi3OoRZ?=
 =?us-ascii?Q?T7v3zsy2KI3M6RatpYrOtzBi+ZM4AvdXlRCgeCDtjBUuV/j85lFXmjZi2J3m?=
 =?us-ascii?Q?4ZocAngLojld2RKdSD//VKhZEOELC5CZIGjmcP1vJh6Lj8JNoQuRzf6Z+IvI?=
 =?us-ascii?Q?uTHAm6C44Fpp3cwwaBI0V+89VQ41ooqEGKA54WHhRk8vogtu9Q0xtjJ3WQ+D?=
 =?us-ascii?Q?YEy7o4mgxWbIUA6bm9S8UAxbInD/D8g0zZPC0/lQ6xw5B5DDTBwqjUNL/kc6?=
 =?us-ascii?Q?ZbdPc+sSzkpO34xd9rYXZC3dMVXSO1vn1qlrBQdsrrT3QzIKqKloggR33YEC?=
 =?us-ascii?Q?QPP9CO5H2MSgKPgXQvjod579IK9MwU1KNLI0ee1ecNJ/uL2E6EU5PFK2/Edp?=
 =?us-ascii?Q?wdC7OfZzj3PAfwXbiAualSzWaH/MRMvsEL4X0ctY7XOjGXcyVPJQ1o/ZmUSI?=
 =?us-ascii?Q?//S+Cv2fPZZs7QNphAcj+FQ9nF5tKY2XYR47CzK+3+FHEyWdJUxKw4AX1Ds1?=
 =?us-ascii?Q?gRywpsUyo1OV2AghTb3IktYniFtakzwt9xde2OxMAnbuQ6E6SScxcgu1kpc4?=
 =?us-ascii?Q?GvHFtvPiuEgVpAadz/NiBuCkn0b1mrYytPHwoFYaw3c=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6702fa-261f-42e2-ef53-08d8b658896e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2021 17:44:25.0966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ErPDoTUFkhpOnIQZObWJm8q4lakkuFH6xULpfhuqnynOuk4MjqZdAgc35bqxuD06NrHpVsSlmixMj12XQxQStw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2318
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Doug
 Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Monday, January 11, 2021 7:43 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
> 
> On Mon, Jan 11, 2021 at 03:24:18PM +0000, Xiong, Jianxin wrote:
> > Jason, will this series be able to get into 5.12?
> 
> I was going to ask you where things are after the break?
> 
> Did everyone agree the userspace stuff is OK now? Is Edward OK with the pyverbs changes, etc
> 

There is no new comment on the both the kernel and userspace series. I assume silence
means no objection. I will ask for opinions on the userspace thread.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
