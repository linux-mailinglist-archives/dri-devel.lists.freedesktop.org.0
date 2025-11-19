Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E33C6D2DB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 08:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8B110E59C;
	Wed, 19 Nov 2025 07:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VjnNaBnS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673EA10E59B;
 Wed, 19 Nov 2025 07:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763537898; x=1795073898;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9YU9Nnf4q1Hdk5wQJk33Mybl5mYVSaDuFh36+1JExMk=;
 b=VjnNaBnS1xu08GRs0l8rrN17cOpdzrNWVEmds8fKHBr9u+LzyLmC2/yS
 9yxpIf9NEA1g90ro/DXqn0Nb8AKQ/9a/u8s7qWj81tkqgT2ZdSXlbpQdd
 9aRKWJnf0XLwRebfFhjSYUzHZMWocmfUAhbp/yz9wj4FJ197s6fZ3UOzd
 dI3HZ4TPhzokao55X9QSbBlME3z43vhp0RmnDaJRqPE5IoToIbdlkhKmZ
 feaHN60A7CRDt0+MPXQjLOwY85E87XrKONWSAp6oefQ80mscHEhVqmpgK
 OGbvA0p1cwtCXAnAXTmU0R5XOOqMHZzxBudkZHK9H84PGBnpolZma2Il0 A==;
X-CSE-ConnectionGUID: 7MlV4fzLSWKgatrV9YMZGw==
X-CSE-MsgGUID: wtWdhTLERN2IAcnSEKZTrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="68178541"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="68178541"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 23:38:18 -0800
X-CSE-ConnectionGUID: Aj2lJLNsT76uwuJouZIoiA==
X-CSE-MsgGUID: gD23HaTJRUibdLdHS0ZbAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="190234121"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 23:38:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 23:38:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 23:38:17 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 23:38:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edFYuRKjwIeWUQNu/qxFA9+4CoGtUeDhEC3QEq9cksJSi9YZ+UVnZInAPktemAR3Kejq+zETcHnnOnOTcnCwc3XR/u8AA6vR6FilbLQb6vvqyFrcMl0OGiuPqHqmT5Nulao3DwBvVaOo+2sniwP15rC7GohLD5fcziAYs3ErbnZbkMoUQipEmYKafZHNczMsFFHpNJhOGlQ76sHGg5xdJvVxid1pwn+7gHUgg4zYciYs3yjlfej/kj8Y3U+M37sntGzZ7OKrEFlC9jmA/xkSkCdFChGgHe2aaj9LQGmlEry7WjfJKq9LfCgdMqAaJTkdNpWN7UKkAVWHsmkuMTouBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hM1TAImRUymz/bhqFvItkc/dtXRfIi9lI0n9h3DB/iQ=;
 b=kYPj7qwtaOblgfKyz9KmhWD2IRjnHy+zGh900asnSG78YLV34W39ABtqwfSVgpkv5671hOgmtFeGApP4MIspWGGgIx4suKllBnPm/vKWcBpKuGnDpJmtn0QB5gO8Y54JdnnmWAt70ZBpjnK0/gOmo8ziyPckVh66+Uz0gk76LPbqE8lDUjsYeu5K2pVh/8BA5k74k1wrlwu8TSQRU5VGL7h20Vf7WCri3IcQrc6gt6jWnAdrEx7ZBg3mpLRyGZoel0SWl+Ej4qFf4xN138VbjmBAyez1y2h2fYFLqTqA22DtPuIA6dfqO7twbfFRzXjHFF2GMdfZ+aYvs0eN0Ywcjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DS4PPF178D5B043.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 07:38:10 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:38:10 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
Thread-Topic: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
Thread-Index: AQHcVFeIsN6bopHDnE6NSW3ozkyKJbTwREQAgACHCYCABYqGMIAAVdIAgAL6Q0A=
Date: Wed, 19 Nov 2025 07:38:10 +0000
Message-ID: <DM3PPF208195D8DBBC8B3E4D82648AF4AE6E3D7A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251113043918.716367-1-suraj.kandpal@intel.com>
 <aRWU-ovOdSRUQI-B@ideak-desk>
 <689e22d69f7ad9be4f4a78b5194d8c4965be8ca8@intel.com>
 <DM3PPF208195D8D4E9B5E427A947CB14523E3C9A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <aRr0MJbOaHXMXEtO@ideak-desk>
In-Reply-To: <aRr0MJbOaHXMXEtO@ideak-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DS4PPF178D5B043:EE_
x-ms-office365-filtering-correlation-id: 0fe8eaf1-7217-4f73-2983-08de273e96c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?XlctZOGzq1f2khWEE9CamZIzYbz4SHjMidengOQzL5+Aegew/11S93qbDvLy?=
 =?us-ascii?Q?MbWLEdhK0MW4DCN2zbObx94GrxKP8BaeFV75m4D2B4cHdifSAQeBTCIKeZ5p?=
 =?us-ascii?Q?myZf1oIKOgxCKCxEptDZeeoS/a9Dz2Pv3Gcozy7dqoOBQffQXRFSg6vd5Xqn?=
 =?us-ascii?Q?oRwa2iZsHQ0Nzp0KqkFgc7cS9pQFAx7HyN1GDl9PDhjhpyPKvXcpL9rstPR+?=
 =?us-ascii?Q?qPH74gXB/HmGYqjLqFNB2fACLwnG41wFOFtELAP4qiQGCjsaiZ7us1dH7FBl?=
 =?us-ascii?Q?2bNA908yzbQ9bf84WqGBfVd135m5cl7ecKQrvSMRR8WDpZmtRirSprWA5iaP?=
 =?us-ascii?Q?eLcDRn2zDDWVyPS+0jbJ9IoCJCi3jAyCVdqKo+4E4Qp49AmbDHIAQfiNQQE5?=
 =?us-ascii?Q?+LiBvaWMZUXMn3hf0F0AIZSJU7DDkPa2eqRJRAxIVPyJ1+O7i+UghWuseg13?=
 =?us-ascii?Q?9EIzfRYY5VqnzCo9Gi7krmlQFIWe4r5kKsT/6RlB8S4m9j6NskZV+WygLK42?=
 =?us-ascii?Q?0Nu9nFBvWaClRfkBvYxWDJ4L8bWnpFfd1SQZwO8iyOh1wv4s80tWEYDd9I1v?=
 =?us-ascii?Q?dsxwXDuiQq/V6JZEG5FjKdkJJSNd3ETGEhB0L1H1XY8vAExwdkHP0+egtvkC?=
 =?us-ascii?Q?G1JJHjKNdTZVMQtI2NWXW4gYFgnu9kiR3Xv5TV6NBg/nFLsPM+iBrbYAgw64?=
 =?us-ascii?Q?QstawA5Lv1RF0ErLNyfh6dihSCoY1JLLQ1QuOHALIFVT5ST85hZ3lR1iSaJt?=
 =?us-ascii?Q?pkT6Vd/dsvomq7IicIf+TIYeUppExv7Rzk+VTx2X9g3fDkM3LyRzJFS7dHci?=
 =?us-ascii?Q?xicgQfIzyTNP9zvA5POKDQWhpmLHWKjMExG2ni9F2DHd4sd640m4l2xxY0tI?=
 =?us-ascii?Q?vJb56WJB926PO0snO/172lRuTrHj23DVzua39ND+rMXVYHrfiLXOtrC7NVDY?=
 =?us-ascii?Q?mSvcS2g+HEtS3+UwHv7Jky9V+DCw7MX20O+k9oKd5GUaGjswyjNHdQsIru02?=
 =?us-ascii?Q?9jvQvIBGfT1/FfyNuuSW6fudMZjqe/FeyjlMUbI7qdIj9u2QBtb42Fro2x7N?=
 =?us-ascii?Q?5gev0n672T52W5m3ljWPvtw98FET3XfiSFdkcd3leCL4EZVzmtvPKNtz0Cff?=
 =?us-ascii?Q?3xvr8in2oz0ZKNE47mEKWtDxKdXKxxG0YGorK05jOHg6NUHq/lsIG/+YZ9Q5?=
 =?us-ascii?Q?TMTFPfDSmrKdWzwxJDXII/2xAI+jhib2KvbCFASPv7Gh3jfGszrZUtsZc4Ve?=
 =?us-ascii?Q?NBtsEbsuQoG3H0v9uq91l3DsKNzrOJzP8R3eYC8i6UjveKdK2tOJ3djSVkwR?=
 =?us-ascii?Q?5/WB3tcEZlBt9LHpKvVvwOd6x7O3P/1SxRkbaBoYNhAN7WHEaZNs6hgrGj11?=
 =?us-ascii?Q?S546TPGnMbGe5rPaRTZcSrPPkvce7hGwMr/xAeNO6Xc4ZfG8e2jOcGViNLgG?=
 =?us-ascii?Q?jb0Rw2xO52oLETqG6JPOs8Xmc6vs0eeZbnIZl6A2BPldRukhyhSzW0lXpNMD?=
 =?us-ascii?Q?1zLY7kGYGvt1Fc1kZmi0D64jYMHWaqVsiIts?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NevvavAH/Hek9HE2UrivnkMPrKwR3O4Qvl30BubFttoqWb1Asp8cgdY6Mfxw?=
 =?us-ascii?Q?b9vbMRQH/Agbq2EhVxInvIOWu++ZwbfwztEWnUsBQWNYpRxzwlGx54HgIxog?=
 =?us-ascii?Q?MAh7SmcvcPwFejl7ylgQ1r8EbVCwYMmwlHu9hp0+fKOe/iQ8FEzZSMksPQqN?=
 =?us-ascii?Q?mWyLnAtX33lb3DBpIb8yK++EhqYLNNzLu+7f9UmyfPHbAng27joAGI/8AFWT?=
 =?us-ascii?Q?zcWFE1fbPn314JTx+Salpgt7WWMksFo4sPUNXGkVv9PETzCNV0YaOksnqUWU?=
 =?us-ascii?Q?X6UsKk1uprW1wK28RfD+RrcFBHLjChSqOTye72pLsNCnzy/j/wOHWwORZyOn?=
 =?us-ascii?Q?NpeHihpqZcAXdAxgjEAvhayiIpP3Mx8EyvIEn5+OI5J+W6MxizVOMisHJpJe?=
 =?us-ascii?Q?ZpG89WcGRg3tKhi7J88dv/DMmljhxnNuDsjiZA/8A8mzOKhSYCaLyYzR6N8z?=
 =?us-ascii?Q?t0Q+p4haa7Pkx69i4NLtDMMxsDswlrzzvb+37oFWUHr55B5MBW8r5nia2au9?=
 =?us-ascii?Q?J9vFC8Lxplwn6DKHxygo+oCmyp7/Lg4WaJhgZjxpSYAvjjUwXkbThPX5M729?=
 =?us-ascii?Q?7SfoFbPBmrLqzeI8A32wf1jxyqMA2HNWw7Vc/kzoGBP+Mwj9MprIfmK3qTu8?=
 =?us-ascii?Q?qSA8JN+czOvMeDMtZXLtP1I/ZgRP0Rf004TeMT8UUTQM7gBKRs+5mxUYlW5H?=
 =?us-ascii?Q?3zF+HscLZfCOWYtMNgkvm//IeF/JV/T1IjY2JgZqudPcTBqgJOZd00mppQW3?=
 =?us-ascii?Q?Ix21dXMBuqLNa3JInZ1/vxc6NiSDqUCNklCaOI8DLvMovoiGKCCeSMsYFc2O?=
 =?us-ascii?Q?4bqh7diLkt7KH8AbFINfzv03bTetTUOmGPgP8iayHdZs3NCxEMlcjxLaR501?=
 =?us-ascii?Q?SvLBH220psQMW/4ilHZ0YEjCLLECl5fmoa0C+Bq92Wtz4zVKm9eXWshusYEu?=
 =?us-ascii?Q?JwZNbbRXC92skd1kk9ghmwxZirutt6R4c5tMMeKm31RIH0AougDB9bSOScAp?=
 =?us-ascii?Q?yg1dO4L8dH7I3Hrw6d+Fvq9+eP5ceHVBHLsDPBu42ubnv5SrMuF2qME3kaGO?=
 =?us-ascii?Q?M6eoThsWH2XsuoNDNcFv3HewM/xizTO8Bx46eIHvQGXNWhC4ya0OX1MhaP+6?=
 =?us-ascii?Q?F2GpDBHv0fgnOBYDrJHEdMPOudOZzobwDIL0koK7irglgRfIs+yGUQ6fiWqw?=
 =?us-ascii?Q?pJX2dHrUb7UE2bJvIXaR7TVVbKE1jjojZRRqtgM+WA9mREaKpRKLrB0qZGi0?=
 =?us-ascii?Q?3244IQGcS4QpEsh2IPv2ye5IWoINAzgku7880U0dvCku7qM782cco9ltGMwx?=
 =?us-ascii?Q?QCeMq42n6HCI63sbPAdtUTCMX3biYBpN7uBrYSa3j92LQSurO8RKnwh+MZ0h?=
 =?us-ascii?Q?0+NaPsaw6Jpv/smhYAyKhNmc8MoEcj1La3nd/AhOK5Pi5OnGCZvRL95Tr5ou?=
 =?us-ascii?Q?mjulfjvkomrXd+4g7WNjlM5NlsjOoJ+XjjoUQ/WvQKPsACaqlzA+XiNkXb+J?=
 =?us-ascii?Q?nNNqEL6xy6k79DSxDH0E5lQcaQQjO0PJoJGkgg0LBrRnP5LeIAM+CjCwfZHN?=
 =?us-ascii?Q?O0mWLat3CljkN6GMSMXjDU037YdswcqfVaMXE/Fb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe8eaf1-7217-4f73-2983-08de273e96c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 07:38:10.3783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lfyz5PLkrJLj74NdwOarVssq+n9/uA5xiQeRgJcyK2J7uk772Aruveg7uVNCJB0mtRVL6p+Kbpz9SKNXaJhzlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF178D5B043
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Subject: Re: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
>=20
> On Mon, Nov 17, 2025 at 07:09:38AM +0200, Suraj Kandpal wrote:
> > > -----Original Message-----
> > > From: Jani Nikula <jani.nikula@linux.intel.com>
> > > Sent: Thursday, November 13, 2025 9:55 PM
> > > To: Deak, Imre <imre.deak@intel.com>; Kandpal, Suraj
> > > <suraj.kandpal@intel.com>
> > > Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org;
> > > intel- gfx@lists.freedesktop.org; Nautiyal, Ankit K
> > > <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > > <arun.r.murthy@intel.com>
> > > Subject: Re: [PATCH] drm/display/dp_mst: Add protection against 0
> > > vcpi
> > >
> > > On Thu, 13 Nov 2025, Imre Deak <imre.deak@intel.com> wrote:
> > > > On Thu, Nov 13, 2025 at 10:09:19AM +0530, Suraj Kandpal wrote:
> > > >> When releasing a timeslot there is a slight chance we may end up
> > > >> with the wrong payload mask due to overflow if the
> > > >> delayed_destroy_work ends up coming into play after a DP 2.1
> > > >> monitor gets disconnected which causes vcpi to become 0 then we
> > > >> try to make the payload =3D ~BIT(vcpi - 1) which is a negative shi=
ft.
> > > >>
> > > >> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > >> ---
> > > >>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
> > > >>  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >>
> > > >> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > >> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > >> index 64e5c176d5cc..3cf1eafcfcb5 100644
> > > >> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > >> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > >> @@ -4531,6 +4531,7 @@ int drm_dp_atomic_release_time_slots(struct
> > > drm_atomic_state *state,
> > > >>  	struct drm_dp_mst_atomic_payload *payload;
> > > >>  	struct drm_connector_state *old_conn_state, *new_conn_state;
> > > >>  	bool update_payload =3D true;
> > > >> +	int bit;
> > > >>
> > > >>  	old_conn_state =3D drm_atomic_get_old_connector_state(state,
> > > >> port-
> > > >connector);
> > > >>  	if (!old_conn_state->crtc)
> > > >> @@ -4572,7 +4573,8 @@ int drm_dp_atomic_release_time_slots(struct
> > > drm_atomic_state *state,
> > > >>  	if (!payload->delete) {
> > > >>  		payload->pbn =3D 0;
> > > >>  		payload->delete =3D true;
> > > >> -		topology_state->payload_mask &=3D ~BIT(payload->vcpi - 1);
> > > >> +		bit =3D payload->vcpi ? payload->vcpi - 1 : 0;
> > > >> +		topology_state->payload_mask &=3D ~BIT(bit);
> > > >
> > > > This looks wrong, clearing the bit for an unrelated payload.
> > >
> > > Agreed.
> > >
> > > The logs have, among other things,
> > >
> > > <7> [515.138211] xe 0000:03:00.0:
> > > [drm:intel_dp_sink_set_dsc_decompression
> > > [xe]] Failed to enable sink decompression state
> > >
> > > <7> [515.193484] xe 0000:03:00.0: [drm:drm_dp_add_payload_part1
> > > [drm_display_helper]] VCPI 0 for port ffff888126ce9000 not in
> > > topology, not creating a payload to remote
> > >
> > > <7> [515.194671] xe 0000:03:00.0: [drm:drm_dp_add_payload_part2
> > > [drm_display_helper]] Part 1 of payload creation for DP-5 failed,
> > > skipping part 2
> > >
> > > <7> [515.347331] xe 0000:03:00.0: [drm:drm_dp_remove_payload_part1
> > > [drm_display_helper]] Payload for VCPI 0 not in topology, not
> > > sending remove
> > >
> > > So it's no wonder the port's not in topology and everything fails.
> > > We obviously need to skip payload_mask updates when the VCPI is 0,
> > > but that's just a symptom of other stuff going wrong first. Perhaps
> > > we could do with some earlier error handling too?
> >
> > Yes I agree the question is how high will the error handling needs to b=
e
> added.
> > A lot of weird things going on here.
> >
> > 1st one is how is it finding a payload which we do not create while we
> > call destroy function
> >
> > 2nd how is VCPI with id 0 possible from what I see VCPI are 1 at least
> > that's what I gather from
> > drm_dp_mst_atomic_check_payload_alloc_limits.So what are we missing
> when we create a payload?
> >
> > Imre, Jani any idea still new to how payload creation work so am I
> > missing something.
>=20
> A VCPI ID will be assigned to a payload during an atomic commit only if t=
he
> corresponding MST connector is still connected. If the MST connector gets
> disconnected by the time of the atomic commit - as in the above case - no=
 VCPI
> ID will assigned and the allocation table in the branch device cannot be
> updated either for the payload, as indicated by the above payload
> creation/removal failed messages.
>=20
> I think the fix should be not to clear the VCPI ID if it's 0. Valid VCPI =
IDs start
> from 1.


Hmm then in that case should we just return 0 early if vcpi turns out to be=
 0 here.

Regards,
Suraj Kandpal

> > Regards
> > Suraj Kandpal
> >
> > > BR,
> > > Jani.
> > >
> > >
> > > >
> > > >>  	}
> > > >>
> > > >>  	return 0;
> > > >> --
> > > >> 2.34.1
> > > >>
> > >
> > > --
> > > Jani Nikula, Intel
