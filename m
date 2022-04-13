Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 417FD4FFF08
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 21:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4A110E290;
	Wed, 13 Apr 2022 19:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1452E10E373;
 Wed, 13 Apr 2022 19:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649877477; x=1681413477;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/U4YLAIgxPRAWnFnFw7RvEx+/nVxpKYrd0mSXD5+CJQ=;
 b=TlC4xX2eOOO62zLCnMzbiK4pjy0IzeqMfSMStlYWx/Ln/JbbdG7N4GLC
 QxHN40bndvlLbqjZ9lG41J0wydrqLOgZrlLS5ZIpasWIpypDHMOEbacoK
 B3AzF36vr6IkusyjpP/du4b5jMiT2IDu35Zxm+2tsfFzt+39PB82F3A+X
 IMOhUvTOr7iQ2QeJYFnNztyc9kuzB1ChhfrGaF3Z0bznMINb04w2ag9YZ
 yayCP3Jo9yErBYbwZVV9puIvQkVAz+18TWfkICJGk5o9oGrcIp7s4q0D8
 8uEk/hcC+3POcWf0TSxLdGSBGdmZopAcksBDBaY3WFwMJZv3M0Pw5Telx Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="262505548"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="262505548"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 12:17:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="700367794"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2022 12:17:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 12:17:55 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 12:17:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Apr 2022 12:17:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Apr 2022 12:17:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YW0ZfGfeIWi5Vaf9xZQdA/I9vNp9kbVcKNwRjLbgw8GTVOruwbdSh1sf6udE6cuPR75Q4ynhXfbd4Cej+SZggOk9KI+PNkgTYyameXSAq8oY/5xApbj2Gu6jvEIRoKhKev7SWJhsVby3xIDNAd/n1x6OEJVvl0EP4/lD4XP6Qi5rvarZLEmT6SYK0o0HK49CizW0SiQDt/5Vm9eBnxY+3IDe7FRFcG46Rn0OV8S1cqQu7G0emgvv1HR2m0HO9lWL16hilupVweXp3UQ7aiJeW/1T6ypXwBxH/9XO5lfhjjBg6kybxR2Iqrk7Zh+V/CrjhBF1qLuxiUDDtvSnRmXlqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQQbje48wRBvEUHy2lS265SydZ8Xg2q4cq3KIX+CFjQ=;
 b=eA+WwD1RLwz92BCfFpBY8I7Yp3comU+Y44i5w4WmKMBQM8RmNCdqtcAhJ975jXa6RJa2vNgt6pj9gpcPZJzNjpKeJXepXhATawct6PzYXvNEinI2qaKNEBnD/1POE3BbLCVKsnSjLQ5tg5LPC3Q1i5pPzcukCQD1K6iF/towPfdzue+UKZ8ayr0YvLvXUibFgs5A6HUSDLC81oPdfW8mhrILfXcHsGQBLCUjgNa7jQ7OEbx4q5HaYR36VQAHMF9GceuPgCJqkgA+2dKpCVMrC6WJjOGUvGT1SHOTMSKIq4FQAUJnwgM76tMSKruZm933LQY/kntxGYHU3eW5QU8qjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 BYAPR11MB2679.namprd11.prod.outlook.com (2603:10b6:a02:c7::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.30; Wed, 13 Apr 2022 19:17:52 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%6]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 19:17:52 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Thread-Topic: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Thread-Index: AQHYToWBxoFJZjoJdESeYYuxVyKPnqztWRcAgABgPgCAAEpdgIAAA2kAgAADOQCAABLpgIAAHA6A
Date: Wed, 13 Apr 2022 19:17:52 +0000
Message-ID: <661447fd-b041-c08d-cedc-341b31c405f8@intel.com>
References: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <1-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <20220413055524.GB32092@lst.de> <20220413113952.GN2120790@nvidia.com>
 <20220413160601.GA29631@lst.de> <20220413161814.GS2120790@nvidia.com>
 <20220413162946.GB31053@lst.de> <20220413173727.GU2120790@nvidia.com>
In-Reply-To: <20220413173727.GU2120790@nvidia.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3fa64ad-a247-4384-f0fd-08da1d824e98
x-ms-traffictypediagnostic: BYAPR11MB2679:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BYAPR11MB2679AD22745AFBE712B811B1CAEC9@BYAPR11MB2679.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yGOR7Da8V0QR/PPCwg+VfFxXz1w9wPYh9nJbDQKxnB7mhMX6qdkO0bGfbSz8Nbl52E/OONJmbWXS22/egK+1cDJ17hf3KASbqI7qC1chZRSdFgC96MDVYOX1KMvQVRcOeiAJeA6tNE0BwLrNlXM07BM3n76rK3ABd0AGCvJDBCjY9uJsMLR3AcW+/lYXQCI40JHbAbtGgQ+JEcRiayNouS888WYJ4THH+TfOyEXceRJPvcQkWxyVgnyLe3jtMmUfOQAlAEM82bRmfbJEQPy49LUsPAOckG/+R4lzpV7bnlD9vwO2YOy6i564+XBImdLvTblfX/xUrkmja3Rbzqaqs6AHNkh80iIQfu19YGFC9yNrrMUxihuHZqzh08rbuD1VvmY3vtBz5CGibaFBJi39PIsobWx9no1CvDVy5HNZAr6B9KVfzLc9czDAbUcoKuamtEnKyn7WnyklmgxUQ3LzHBNWBJyTXgMGW9NgIpB/LItvAVyNBbQOLacmhTP4nwBx9OfI4wKMgu/cf8Q9HxuVaFOg7AgkvOjKv40au6+RG5ScU9xPDT4xhp8IzPhjOR9UEitLnlXyQkPffqtmpCEZIgnvcV8uOFr5nWXCT5BufjZnUfw+c+6Y/yaVoIg+g+Sd3NWPWf0Idox3vyBBgY9qZj1cCi3S9aQj60uawsK8sLK9g6cOYSh3DJx0XmFDbS8K38r8F2jDxWRZ6cWZHzm4PbHg9wI4U+1jxoWyVmm5KHaNHcc4OsYIPIp4jaohUVBD2vkse9Lt8K2MwF6/SE7Beg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(31686004)(186003)(508600001)(38100700002)(38070700005)(82960400001)(5660300002)(7416002)(7406005)(8936002)(6486002)(66476007)(66946007)(66556008)(76116006)(91956017)(36756003)(110136005)(316002)(54906003)(86362001)(6512007)(64756008)(66446008)(31696002)(26005)(4326008)(83380400001)(71200400001)(2616005)(122000001)(53546011)(2906002)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?urBVENndAH9znd2uZ9rNBcceV2xWQW9qdmSqJFex8LqjDP85G7uCo0Vd?=
 =?Windows-1252?Q?vFIRps8gNGsjawOjtiv4wapLkcvpExaYQtmTsG6fDqASEk6Dyk8HDjIc?=
 =?Windows-1252?Q?6i1RdkPylEMOUd9kLAZrNUImWz/U6Yuh5osG2mjZZaKOip/Ivhu7kseu?=
 =?Windows-1252?Q?lRqKr76+8kQ/nM/TqapHvorDeDHiUa1NDP+3Xeew8TbE1BfScZ2kX71i?=
 =?Windows-1252?Q?2aA/59xPrifhS42rj1cDaE8M8QF4F+WKkXNLYqyqa0NyiF4jbGLMR5DA?=
 =?Windows-1252?Q?p2h/RhuJM4Pw8f2I3vQkU7TOq6GD6Cm1d36ODgXwrFoAITzXBOLGm7L5?=
 =?Windows-1252?Q?NxBU88gWyXf4junG+Z+RpggnFLOLtdc+9NMze5VQpOsBUJHxt8VJDu+D?=
 =?Windows-1252?Q?zD80rwaAN+xGlyKrihjSCuumRKT3o5SmxuCGyz9LOY3yb9hGarVb8Qjb?=
 =?Windows-1252?Q?pWgjHINOLNcxcERxiN6/HOJEMbLChvKHleWQRXgmjk+Y2hYUMnOjMiOm?=
 =?Windows-1252?Q?nP/HnJR5dxIoO7adY6IuRBdLH7TYvYgahmfcSCg5dqiRIgsBZI/5sk3O?=
 =?Windows-1252?Q?O6+WfbJ8c7+bgBHZdFjPkry/lXXvjJGpDviwlSQ/thfwcQ0GxTvaNwgP?=
 =?Windows-1252?Q?QUqhxqr+TPUTgL9FxaGP9GxVde8Ev9eJKlkdEWwUtB9+czQBJIgkDiLr?=
 =?Windows-1252?Q?T8fXeCvNg0UMKDBS8EE6d8dTsORrLyjwEwMUpIT4S2rQiaT0lTXJkD38?=
 =?Windows-1252?Q?iY62yTuyIBOAXTxSoCWh29racR9kRfJ1iyXClWLN4Gr7pbdWYZMRSav/?=
 =?Windows-1252?Q?kIyZU/3kGSRvTu1CAHUCe4U2jRtJH7Th2Xgpgwm/Ko0+DLLA0xqSJJRl?=
 =?Windows-1252?Q?hY8OrIyWnXCBWV0AqpFqQfQoqJD35VqssJv1A9jjpsSnS27/k+K5jyE6?=
 =?Windows-1252?Q?pHFA3UvLcV4DqbFDuSQ4KNMv5ZSUbRtu91LNVWXULuM6Teh1hrJuaO0R?=
 =?Windows-1252?Q?WK5QLKN61eoEzWGzEvEli254IbV8gBVX7Oq5aWLAHrmkbl4kRzcbupAd?=
 =?Windows-1252?Q?+XepsQiBqCyT3/6bO3tz39xGbRpTjRCQAu+huWNK5w4k9ibk//XKoxer?=
 =?Windows-1252?Q?Qwj7PVQj1baa0o+oaSnhzOpmv9aHFw2YogOOPLOyg8a6HwcGKkQOjxRE?=
 =?Windows-1252?Q?wPjRmlq2kcy4Rgw10WcsrvFLPKw4coIW9omL4rmtSggc8xVInsjDmPZ6?=
 =?Windows-1252?Q?KrcwjdgfiVyAkQFFGfxav+xoZOsYS6B/z2pRiO70RzUcah+VoNX0MMWb?=
 =?Windows-1252?Q?e6UHTSZYKhfTXSZ0Mrs7VjmLWgewCrrjpKgp0BquHFFH1iOGl6My4WRt?=
 =?Windows-1252?Q?1Kt0r8HRikggJF8AMxD138/ROZP/3esJtbSi6egZTuhYdtEcyFpftITg?=
 =?Windows-1252?Q?spixMSfvK3JxBNL0SGkHLmWcOf/fkdNj9vO9EJ/wSotsYli20hAd9EDq?=
 =?Windows-1252?Q?IUZEcnq7ZO1eRF4bTGJk5on5x7mIERUFzddLt0PQrqMHVicusKNRzqpP?=
 =?Windows-1252?Q?sqDEZf75ilCkGk4q+bfNNEvzB1vIfJPnQDJ4Y8mp5nbMVob8hCXZdErt?=
 =?Windows-1252?Q?hI4hF8gW0rizH8lWoJL7aPwWTwBFQhJ+wPzMYHivW1dN5U8WYvrV8XYI?=
 =?Windows-1252?Q?3VbUe3oZWnuWfHIWtBwkMnFrXp81PvtMJ1cK4v4HZuYFoz7Oe+Jfyk8Y?=
 =?Windows-1252?Q?YhdXAB0qK2Xa23uYVyqUKxnmmfdc75YZbf+i+SlPCk0sWRinUFVkuWw/?=
 =?Windows-1252?Q?mBjqr9b7jI4/UTsczQwonciH5bqU4PDjxG8wRG9DTCQGlNk4CSZRlCxg?=
 =?Windows-1252?Q?GS2HwKBfrdfKSw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <EDB64C059D11C543A5C817B051AC42D0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3fa64ad-a247-4384-f0fd-08da1d824e98
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 19:17:52.6852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +SEA4luc3QFvVg+CZbF58GFdqANTCtfcaMmCljKKR3UtHYhbTm5VHPanlEFj5vldl7yEXyGp0JskaFLQrLwB5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2679
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, "Tian, Kevin" <kevin.tian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan
 Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Jason Herne <jjherne@linux.ibm.com>, Eric
 Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/13/22 5:37 PM, Jason Gunthorpe wrote:
> On Wed, Apr 13, 2022 at 06:29:46PM +0200, Christoph Hellwig wrote:
>> On Wed, Apr 13, 2022 at 01:18:14PM -0300, Jason Gunthorpe wrote:
>>> Yeah, I was thinking about that too, but on the other hand I think it
>>> is completely wrong that gvt requires kvm at all. A vfio_device is not
>>> supposed to be tightly linked to KVM - the only exception possibly
>>> being s390..
>>
>> So i915/gvt uses it for:
>>
>>  - poking into the KVM GFN translations
>>  - using the KVM page track notifier
>>
>> No idea how these could be solved in a more generic way.
>=20
> TBH I'm not sure how any of this works fully correctly..
>=20
> I see this code getting something it calls a GFN and then passing
> them to vfio - which makes no sense. Either a value is a GFN - the
> physical memory address of the VM, or it is an IOVA. VFIO only takes
> in IOVA and kvm only takes in GFN. So these are probably IOVAs really..
>=20
Can you let me know the place? So that I can take a look.

> But then, I see this code taking GFNs (which are probably IOVAs?) and
> passing them to the kvm page track notifier? That can't be right, VFIO
> needs to translate the IOVA to a GFN, not assume 1:1...
>=20
GFNs are from the guest page table. It takes the GFN from a entry belongs
to a guest page table and request the kvm_page_track to track it, so that
the shadow page table can be updated accordingly.

> It seems the purpose is to shadow a page table, and it is capturing
> user space CPU writes to this page table memory I guess?
>=20
Yes.The shadow page will be built according to the guest GPU page table.
When a guest workload is executed in the GPU, the root pointer of the
shadow page table in the shadow GPU context is used. If the host enables
the IOMMU, the pages used by the shadow page table needs to be mapped as
IOVA, and the PFNs in the shadow entries are IOVAs.

> GFN's seems to come from gen8_gtt_get_pfn which seems to be parsing
> some guest page table?
>=20
Yes. It's to extract the PFNs from a page table entry.

> Jason
>=20

