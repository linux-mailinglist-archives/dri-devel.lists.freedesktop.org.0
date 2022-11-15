Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA0D62919E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 06:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B46710E367;
	Tue, 15 Nov 2022 05:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC81F10E363;
 Tue, 15 Nov 2022 05:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668490890; x=1700026890;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vSsQZoqvhMcyYjjEHfu8MSMnYRD8yv43MnGoAeQOzKY=;
 b=mAG1T/Aw9roYvWm7btWh49pLIc2hyAhWFyOflMoVpsIEncQAOCDKoep1
 piTzkNgaaEXA01zhsOTMC74xKvn/Fq8vVj6i5GHvFbk6bD9XCYEPY4Cx2
 PtPnbaVVoToIQCsn3udy1mjzOlb+n+w6VvLXdI5RW2vbKz4gX8YqcbuDB
 7CIFnWMGTMRF55nwqk99soFqI5OEpssnrIf5pXYLn6qEOVvXFd43zQO4u
 y4McZLhqxLsrJX0gJN1tGXHCXBCr4TKJupC5xJNeT49tOV+8ybxWYAhKI
 RlzdTGUjBkpgr+O4/CmBgec3EH1XjpcwiwCm+5vO+7hHS+rcPV+YjdHOW Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="374302783"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="374302783"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 21:41:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="763796776"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="763796776"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 14 Nov 2022 21:41:28 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 21:41:27 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 21:41:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 14 Nov 2022 21:41:27 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 14 Nov 2022 21:41:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrjgJT//+WFlV7eVbwaZ4C1kCyFvWxDsMWhXwdPxhxBTdwrakdlWv5B9Squc24GBk+Jv8O8hi3g/5p/TsWJ+AlUPO0wEeEDfxkt/UaP5AerA+us82/GvOx1njtFK7OtLFJdBl6+8LsSuzjVPmHopk1sV2N7O5auG+TI9dpCirIjNMjACzoCqy5u7jJ5X5UtQonmbAJPzEEdrixv3vdr709DOmsPYi08kOiZKdGTDaG7dK+z0d5yM8euXDLt8eEWeeLSgNHSOI8l+kkTOxfZweBFZdezU0fWE/k4Ek9pOlHpoUhPmtMidNTnFdOQI7A7VFlVkd6dli92xZRxSdhVPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSsQZoqvhMcyYjjEHfu8MSMnYRD8yv43MnGoAeQOzKY=;
 b=bj/436kVMr6cx/zlSO5rruxjXTFjQSE1sn39A3gDazNZk1nGwy3zzdCamdiBAZghfSN0rGbrP1igReqw2c7vK8RB5b9U0SRwrgvGLxyeDyQ1jNKdQYpKPnS4WIX4UI+VhVT2NXdEA6HOxvJ3LP6nxR7oBdCIQouOesfJtI+cNMedz3ktCtDwt+MY4M7/j9pSeP9nCFp29MVNJY4hFMiSuci8kGi2WeLjCyOsYcTSd5FPDYjMScQhZjJLVkEmV5OnR5sOAaE9hxciV1fgatVQ6PoBNNwcOPo9v91VeOQYzNGLZqhBajQVFJpLZV+N7gZXT36JWXdArzRR6iv443swGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB2684.namprd11.prod.outlook.com (2603:10b6:5:c7::18) by
 SN7PR11MB6703.namprd11.prod.outlook.com (2603:10b6:806:268::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 05:41:25 +0000
Received: from DM6PR11MB2684.namprd11.prod.outlook.com
 ([fe80::f861:c6de:75fd:9e17]) by DM6PR11MB2684.namprd11.prod.outlook.com
 ([fe80::f861:c6de:75fd:9e17%4]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 05:41:25 +0000
From: "He, Yu" <yu.he@intel.com>
To: "Yang, Lixiao" <lixiao.yang@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>, 
 Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Thread-Topic: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Thread-Index: AQHY+CfUxaXtEwfYxkaz5OilVyqRnK4+fOMAgAD8OBA=
Date: Tue, 15 Nov 2022 05:41:25 +0000
Message-ID: <DM6PR11MB268429C4986C7808760CCE72E0049@DM6PR11MB2684.namprd11.prod.outlook.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <Y2ofNKmmAIMGYLFK@Asurada-Nvidia>
 <9b2bb9f2-fc82-dd01-84ff-c2fe45e1a48a@intel.com>
 <Y2vb4fuPZdYKR1M1@nvidia.com>
 <127303b5-8753-f866-1811-a67ff4bc021b@intel.com>
 <CY4PR1101MB22308F4687554490AF39DA11EA059@CY4PR1101MB2230.namprd11.prod.outlook.com>
In-Reply-To: <CY4PR1101MB22308F4687554490AF39DA11EA059@CY4PR1101MB2230.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB2684:EE_|SN7PR11MB6703:EE_
x-ms-office365-filtering-correlation-id: 258451fa-075a-4c25-ce50-08dac6cc092e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0FIdQ7iA72zZ48hbPP2dvvGzkkUswN1R4PXlRpbDOyDgqkZ2xYrRGlQIrOZfoP/vwD4c2njoDPib37KzmTRB+a9mbkY8CVd07JvvL7wJoxdOBOiydbwKHCQCcuUiJrnreTRN1pZLChpDyP+Q8fLADI9f6NMBAkdOyXCt3/Zv6vo4oFhTA0Y0FLNrQbpeRjU9hd9pTfYXF6DdxZxL3vpPc6kEKChz1WdmvuGREGbqzJ9NAiPae/CA1hVT8JBTVz7LpKmseiaNBMKBUFpO64rF3Y50sNXwUOw+NL5xepvzg8xI2XzVQKQ74pKsr8pwODuFttA4DoqZK1/m4P/g9Crxus91U722JrS9uuaLojkqtLWaIjHgBcJwHGbO298iVau6WZrTuG5/i8d9vMre5Ia76UkrnxpSNVCjM+T0fjCgn9Q3IlcsJr/GQYThGmTEv1xxjT4BRxiE/b6nMrHe0lo3d4ghs7SsJdJKTDHddQ57LOh1lyo7mGyJ/wqJ6Zq9lNW16QpCA+BHXkB50XrNjvo7fPYdpB6+zbT0L2PPLhN1UgYgt9NvykNCnEr2baF39Yvm8Ozf/hikkM4FY5hu1DS+7hHwznExFw0YXernjw4OfrZOWvMLsofpmt0sPU0Sp2EOf/TOIpug+F11lKbk9jiz49gJ0sZAlvKPuLk4VQ/Kp9++ht7jy678EnpCVcIysTptWIbthLgJ3pBk/OpMCHsAmXlMRBMi2DQf3ZL4zmTq/ameBqiu2QS5d4MKA0iZSKcuYXgse+eY0+VEPSMh50AdlRPE+oDtR2Z9ax1TyIwClno+s/VHg8nNKzpfqxLrMtBouwf0qCx4DTyTmLbOGSFinQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(366004)(39860400002)(346002)(396003)(451199015)(9686003)(186003)(966005)(71200400001)(478600001)(38070700005)(26005)(7696005)(54906003)(82960400001)(316002)(53546011)(110136005)(6506007)(83380400001)(55016003)(86362001)(122000001)(33656002)(38100700002)(2906002)(66446008)(4326008)(8676002)(41300700001)(66946007)(76116006)(66556008)(64756008)(7416002)(7406005)(8936002)(66476007)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEsxYlA2eFdmem1tWDFCV2Fyd21USmlmMDVNbk52NE0yVWlZWXFYaXVMOHdh?=
 =?utf-8?B?OXhBS3p5UUpoSkFIbDhEV1RBclFVZGhLMjIrRWR1K1QrdGRhTVZGQ1dLam8y?=
 =?utf-8?B?djl1L2NwaDB2N0FtL2pDNWF6K2Z4QXE4UXg5c2pEYnJpbkNRRHBzaFQvbUhl?=
 =?utf-8?B?b2dQdGMyOThNR3o5QnNsV0FyM0hHL2x1K0V5bFlOU3k1NndONGQyaFRVZk1u?=
 =?utf-8?B?ZmxDcjVsTmxrZkVqbmVlbnhrbUpJRWZCamcxWXcydDBtclQvWWhxQXhEZDAz?=
 =?utf-8?B?dmVqdGx6cVBBOUVlT2YwNVQ2bHY3WStPVHcxSmE1N2xwMU53Y2RWeFlyZ3R6?=
 =?utf-8?B?U3VwT3FkMk1qSXV5ZnMxdkd2QnowNWp1N3dId0JMMHcxRm5ZZmtRMUl4cFN0?=
 =?utf-8?B?M0c4ZTZGRzZ6NEdFZ1pBNjlTVGV6V1A1Z0tCQXhBUUhVQmdiSzBQSWpxdElz?=
 =?utf-8?B?NmhNamtodEZwZDRBdFVTdjVPY0FnMmNFNTh2ZitTeWlxbm1ySTZzNjhndlIw?=
 =?utf-8?B?N0huOVhMSTNxSkVGVlgwZ2dtbmt2VnBMWU9tUzZ5R09XWUd5UytROG9tbmc2?=
 =?utf-8?B?My9STnpwYTJuVVZhckI5TUxQbHk1UmRYcWZJN1RGbDVucTg4VG5pYXBZY2pj?=
 =?utf-8?B?R05VVktyUy8ydm9WS0pOMnhpQnZvTVhqWHNHUTBLa1dPUlZWa3ppeW4wRGt6?=
 =?utf-8?B?bEtxNjZCcDVPczhCdnZHb2pZMUI4eW5KSHk0NWRMV0NZZGpoL2dINlVKR2pu?=
 =?utf-8?B?ZS9Qb1NmUzBpeWRMSVhNemNBVC9UUnZCdWp4TXRWdllWcU9ibnNQL2dMK3FD?=
 =?utf-8?B?dS9JOGprcGErQy9Oa3JwSmVHUzM1RWJEd25IZkc1MzZhZUhDaVdZZVM0ai95?=
 =?utf-8?B?VWcwaDM4OTBDaThuUVJqTW1YYU9WTXdLVXk0dVp1LzQ4QTduNG15UW5RV1E0?=
 =?utf-8?B?a3ByOEJQeXQ1VC9DNXpycGFPMkU3Myt6TFZpZGNobDJWOXkraXVEd092Ynpl?=
 =?utf-8?B?ZnZnMkUxK1RBSjdqQkxFeld5bDN5bzUvdGZmaDFyenNDVkYwZWhML1ZMQWpz?=
 =?utf-8?B?Qy9jaXo2Z0oyTHk1ZzUvSUtRY09ybUVnK29MZWlEVFExMU5LRE5xSHNDK0Z1?=
 =?utf-8?B?OEFCU3QzV3RtL3puQy9JejJ5WU9yUTFodnc5aVUxYjdhTzNsbithOVlkV0FF?=
 =?utf-8?B?dGpVMWFMRTI2azArYzY2ZEpISVpoQkFkREl2L2VlVHZsTzhRUDd5OEVBVW5P?=
 =?utf-8?B?K0JjMFg4cDFjUkYzUGUxYWU2SlRDMzY4WHdDL29LcGRIYUw1UU5RNUJDblJs?=
 =?utf-8?B?SWxQQjNDay82TGVPSG41MFo3Um9yNUxrZ0QvSHU1WE1tNmxoS1FxZExWc2F5?=
 =?utf-8?B?R3daYXlVNlh4TXZteEZWQzBmMkM2MkJzaEtCMnh3TDZDSDZmcmgxeEpjKzJn?=
 =?utf-8?B?YlJKczBOVkN0eFF2L2cyZU0rT2wxWjdITGpVTk9UZkJ3MVpyS2dndXBLVFpP?=
 =?utf-8?B?Sy81U0RBekNvSW1WczIzVmdEOWVZZjh4YlU4WTQ1TUsyQmVGOVJLaGhkZTYy?=
 =?utf-8?B?QkFrUWQ4Kzh6eUsrQXd6QS9iV2hmdkVqZjl6Nm9iQlFRZHI5aHZZcHJZcTJL?=
 =?utf-8?B?S1NiVnpQMVl1eTRkUmU1U1cvT3I4NnBMeXAybUZFdnROOWdHR01TS1ZwaWEw?=
 =?utf-8?B?cHU0WmhGMFBveU5HNkZKeW5HTkNUNi9udUNoUTdRWWpud3c2Wjk1NDcyY3Zh?=
 =?utf-8?B?eEMzcWgrR0VxdkE3eTlBcytkaVFOQXhqRUdYNGR4dHljR0p2cWVqVVJjSlVY?=
 =?utf-8?B?U1oxcmtjRzFFUmpoZTd6djQ5RFJmYndVL1BLWGlIS3pQeEoycG91RkFFc25J?=
 =?utf-8?B?ODg1NFpDaEZEYTZRTnluN25ESWsrRlFPd1VNNmE3K0ZqWGk4NU1wV0RBaVhE?=
 =?utf-8?B?SURmRmpPWnNqSWMwRnA1T1R0dmlpaHlFWUkwZ1FFYlJlc3ZpeEFKeXNVSlhJ?=
 =?utf-8?B?N2lOWGhiTXhJdGNsbVZxQ0NZT1NYUzZrQ2Z1SlRETDRMUDRDaVFzaWs2bnlZ?=
 =?utf-8?B?OFZkYnNHOFcrNUZpNlB6UjJOYWpScXZVV1NVSFRSRjVHa0lscjJzak9LYzZw?=
 =?utf-8?Q?RiFI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 258451fa-075a-4c25-ce50-08dac6cc092e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 05:41:25.5724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Xrqyes5ggf2eN/U0Y8QULuTWS8RRdoaLIJYaEAXSugRyX+2Os2kh2Lq6sX036E0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6703
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Hao,
 Xudong" <xudong.hao@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Matthew
 Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>, Eric
 Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, Shameer
 Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMi8xMS8xNCAyMjozNywgWWFuZywgTGl4aWFvIHdyb3RlOg0KDQo+IE9uIDIwMjIvMTEv
MTQgMjA6NTEsIFlpIExpdSB3cm90ZToNCj4+IE9uIDIwMjIvMTEvMTAgMDA6NTcsIEphc29uIEd1
bnRob3JwZSB3cm90ZToNCj4+PiBPbiBUdWUsIE5vdiAwOCwgMjAyMiBhdCAxMToxODowM1BNICsw
ODAwLCBZaSBMaXUgd3JvdGU6DQo+Pj4+IE9uIDIwMjIvMTEvOCAxNzoxOSwgTmljb2xpbiBDaGVu
IHdyb3RlOg0KPj4+Pj4gT24gTW9uLCBOb3YgMDcsIDIwMjIgYXQgMDg6NTI6NDRQTSAtMDQwMCwg
SmFzb24gR3VudGhvcnBlIHdyb3RlOg0KPj4+Pj4NCj4+Pj4+PiBUaGlzIGlzIG9uIGdpdGh1YjoN
Cj4+Pj4+PiBodHRwczovL2dpdGh1Yi5jb20vamd1bnRob3JwZS9saW51eC9jb21taXRzL3ZmaW9f
aW9tbXVmZA0KPj4+Pj4gWy4uLl0NCj4+Pj4+PiB2MjoNCj4+Pj4+PiAgICAgLSBSZWJhc2UgdG8g
djYuMS1yYzMsIHY0IGlvbW11ZmQgc2VyaWVzDQo+Pj4+Pj4gICAgIC0gRml4dXAgY29tbWVudHMg
YW5kIGNvbW1pdCBtZXNzYWdlcyBmcm9tIGxpc3QgcmVtYXJrcw0KPj4+Pj4+ICAgICAtIEZpeCBs
ZWFraW5nIG9mIHRoZSBpb21tdWZkIGZvciBtZGV2cw0KPj4+Pj4+ICAgICAtIE5ldyBwYXRjaCB0
byBmaXggdmZpbyBtb2RhbGlhc2VzIHdoZW4gdmZpbyBjb250YWluZXIgaXMgZGlzYWJsZWQNCj4+
Pj4+PiAgICAgLSBBZGQgYSBkbWVzZyBvbmNlIHdoZW4gdGhlIGlvbW11ZmQgcHJvdmlkZWQgL2Rl
di92ZmlvL3ZmaW8gaXMgb3BlbmVkDQo+Pj4+Pj4gICAgICAgdG8gc2lnbmFsIHRoYXQgaW9tbXVm
ZCBpcyBwcm92aWRpbmcgdGhpcw0KPj4+Pj4NCj4+Pj4+IEkndmUgcmVkb25lIG15IHByZXZpb3Vz
IHNhbml0eSB0ZXN0cy4gRXhjZXB0IHRob3NlIHJlcG9ydGVkIGJ1Z3MsDQo+Pj4+PiB0aGluZ3Mg
bG9vayBmaW5lLiBPbmNlIHdlIGZpeCB0aG9zZSBpc3N1ZXMsIEdWVCBhbmQgb3RoZXIgbW9kdWxl
cw0KPj4+Pj4gY2FuIHJ1biBzb21lIG1vcmUgc3RyZXNzZnVsIHRlc3RzLCBJIHRoaW5rLg0KPj4+
Pg0KPj4+PiBvdXIgc2lkZSBpcyBhbHNvIHN0YXJ0aW5nIHRlc3QgKGd2dCwgbmljIHBhc3N0aHJv
dWdoKSB0aGlzIHZlcnNpb24uDQo+Pj4+IG5lZWQgdG8gd2FpdCBhIHdoaWxlIGZvciB0aGUgcmVz
dWx0Lg0KPj4+DQo+Pj4gSSd2ZSB1cGRhdGVkIHRoZSBicmFuY2hlcyB3aXRoIHRoZSB0d28gZnVu
Y3Rpb25hbCBmaXhlcyBkaXNjdXNzZWQgb24NCj4+PiB0aGUgbGlzdCBwbHVzIGFsbCB0aGUgZG9j
IHVwZGF0ZXMuDQo+Pj4NCj4+DQo+PiBJIHNlZSwgZHVlIHRvIHRpbXpvbmUsIHRoZSBrZXJuZWwg
d2UgZ3JhYmJlZCBpcyAzN2M5ZTZlNDRkNzdhLCBpdCBoYXMNCj4+IHNsaWdodCBkaWZmIGluIHRo
ZSBzY3JpcHRzL2tlcm5lbC1kb2MgY29tcGFyZWQgd2l0aCB0aGUgbGF0ZXN0IGNvbW1pdA0KPj4g
KDZiYjE2YTljNjc3NjkpLiBJIGRvbid0IHRoaW5rIGl0IGltcGFjdHMgdGhlIHRlc3QuDQo+Pg0K
Pj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvamdnL2lv
bW11ZmQuZ2l0L2xvZy8/aD1mb3ItbmV4dA0KPj4gICAgKDM3YzllNmU0NGQ3N2EpDQo+Pg0KPj4g
T3VyIHNpZGUsIFl1IEhlLCBMaXhpYW8gWWFuZyBoYXMgZG9uZSBiZWxvdyB0ZXN0cyBvbiBJbnRl
bCBwbGF0Zm9ybQ0KPj4gd2l0aCB0aGUgYWJvdmUga2VybmVsLCByZXN1bHRzIGFyZToNCj4+DQo+
PiAxKSBHVlQtZyB0ZXN0IHN1aXQgcGFzc2VkLCBJbnRlbCBpR0Z4IHBhc3N0aHJvdWdoIHBhc3Nl
ZC4NCj4+DQo+PiAyKSBOSUMgcGFzc3Rocm91Z2ggdGVzdCB3aXRoIGRpZmZlcmVudCBndWVzdCBt
ZW1vcnkgKDFHLzRHKSwgcGFzc2VkLg0KPj4NCj4+IDMpIEJvb3RpbmcgdHdvIGRpZmZlcmVudCBR
RU1VcyBpbiB0aGUgc2FtZSB0aW1lIGJ1dCBvbmUgUUVNVSBvcGVucw0KPj4gbGVnYWN5IC9kZXYv
dmZpby92ZmlvIGFuZCBhbm90aGVyIG9wZW5zIC9kZXYvaW9tbXUuIFRlc3RzIHBhc3NlZC4NCj4+
DQo+PiA0KSBUcmllZCBiZWxvdyBLY29uZmlnIGNvbWJpbmF0aW9ucywgcmVzdWx0cyBhcmUgZXhw
ZWN0ZWQuDQo+Pg0KPj4gVkZJT19DT05UQUlORVI9eSwgSU9NTVVGRD15ICAgLS0gdGVzdCBwYXNz
DQo+PiBWRklPX0NPTlRBSU5FUj15LCBJT01NVUZEPW4gICAtLSB0ZXN0IHBhc3MNCj4+IFZGSU9f
Q09OVEFJTkVSPW4sIElPTU1VRkQ9eSAsIElPTU1VRkRfVkZJT19DT05UQUlORVI9eSAgLS0gdGVz
dCBwYXNzDQo+PiBWRklPX0NPTlRBSU5FUj1uLCBJT01NVUZEPXkgLCBJT01NVUZEX1ZGSU9fQ09O
VEFJTkVSPW4gIC0tIG5vDQo+PiAvZGV2L3ZmaW8vdmZpbywgc28gdGVzdCBmYWlsLCBleHBlY3Rl
ZA0KPj4NCj4+IDUpIFRlc3RlZCBkZXZpY2VzIGZyb20gbXVsdGktZGV2aWNlIGdyb3VwLiBBc3Np
Z24gc3VjaCBkZXZpY2VzIHRvIHRoZQ0KPj4gc2FtZSBWTSwgcGFzczsgYXNzaWduIHRoZW0gdG8g
ZGlmZmVyZW50IFZNcywgZmFpbDsgYXNzaWduIHRoZW0gdG8gYSBWTQ0KPj4gd2l0aCBJbnRlbCB2
aXJ0dWFsIFZULWQsIGZhaWw7IFJlc3VsdHMgYXJlIGV4cGVjdGVkLg0KPj4NCj4+IE1lYW53aGls
ZSwgSSBhbHNvIHRlc3RlZCB0aGUgYnJhbmNoIGluIGRldmVsb3BtZW50IGJyYW5jaCBmb3IgbmVz
dGluZywNCj4+IHRoZSBiYXNpYyBmdW5jdGlvbmFsaXR5IGxvb2tzIGdvb2QuDQo+Pg0KPj4gVGVz
dGVkLWJ5OiBZaSBMaXUgPHlpLmwubGl1QGludGVsLmNvbT4NCj4+DQo+IFRlc3RlZC1ieTogTGl4
aWFvIFlhbmcgPGxpeGlhby55YW5nQGludGVsLmNvbT4NCj4NClRlc3RlZC1ieTogWXUgSGUgPHl1
LmhlQGludGVsLmNvbT4NCg0KDQotLQ0KQmVzdCByZWdhcmRzLA0KSGUsWXUNCg==
