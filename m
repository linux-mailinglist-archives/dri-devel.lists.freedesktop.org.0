Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0A08141C5
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 07:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C713B10E31A;
	Fri, 15 Dec 2023 06:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B7010E31A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 06:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702621432; x=1734157432;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pn5QYoRhY9nNxRDOW6MNM+szmIfeGMUM5kZB3wMALfs=;
 b=jkZptNR70XEMTKLpxEvv+A+YW5kyGirorPubD7XTc9w7H/at8kVqVzbf
 aboJEZ2dglyuG4bj1TBAh3zGeVIwU6RxU0mtHiIFvDBAxrzxBFbtquOtQ
 /yLdAJv9L6gL1+SmqTE4Gt18Jroh18V98h8sGHlifIsAVnMSNopyVxW2+
 mNVQQOl19BuLQXnDc5ZfyoXGLHZ0tSmBJscy5eNfassncyQxqtxGkPNyY
 7yq5/OcxtE7FwTE9fmfGepe3YMW+Dc3f7lqgoidPbMwsIjwjgvjM73uZm
 7QdzITU5WiPOuHyQjBDNH+z8+60lyEHjaA8xjkTWiKaauynZt78zP1aWV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2076208"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="2076208"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 22:23:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="898034153"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; d="scan'208";a="898034153"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 22:23:51 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 22:23:50 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 22:23:50 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 22:23:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1M6rm7jUOdos9EWRcsQkX1UBfI7bHAoXPIryZL/F2+S1KCKEdfsxqUqjMIq7qDS8aN2G8iAm0aD0bQNdbGMx+egMDnBNfvEqmAENaIJ5JSp6v4eetAJLYNK4s9Is8FniViRRTncsFLjnLwo6OrER6aiHhS4cjWDP2lYhN0nSZd8FVVXF9F7EymKtuNiPHVDK+ra5b9klGgU5Pp6Ipl/9BzsJ7JJYvT3qAJFu61I+LLLAfLpjoiqQX61uKBsHN4eDnzJVF5Jhr2Jp5M+53ZLLaf9v2JLI6LuzUcWXfeLZlvHZYRQXjkXSh3IgIz33+CiB5rKhuwK5IQesIKceOQUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAtPL18JzRCrjYccKxvguiNK2d1Pm7r/gvAfudjkjlo=;
 b=DudispkfChSRL1I+kYHqanEpY/QTQURUYIAAHMdh57E/tK591r0Fv9dzYdAv+juTTKbs/ZILULPMdg0a2/OgX61seuBSrQG9u0XOjAnbaGHJgV3TU7SaZeyoHFjsSVz41MApuEnCboL6MTD4eGDWqizH0s3EYLZ7tA0UqCmb8alKwEgpIfFSZtXg87/wAjFcBfflGtpSI37vtSdTufcuzQUSSd46jA54ptQtQEzbp9KEKBMQYU7iH/GVv0jWspJxLswoVlZIjj5wqHzmjmX/lLhJA5sR6oxmj412Bmb8MDZM36NgeZ27JpOh30CgW7LzbvOuToYMH2pAqYyPPUMV6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB5610.namprd11.prod.outlook.com (2603:10b6:510:e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 06:23:48 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::e7a4:a757:2f2e:f96a]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::e7a4:a757:2f2e:f96a%3]) with mapi id 15.20.7091.029; Fri, 15 Dec 2023
 06:23:48 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Zhao, Yan Y" <yan.y.zhao@intel.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC PATCH] KVM: Introduce KVM VIRTIO device
Thread-Topic: [RFC PATCH] KVM: Introduce KVM VIRTIO device
Thread-Index: AQHaLn1b27525Q6w90S6Q0FOwXgDl7Cp2kUA
Date: Fri, 15 Dec 2023 06:23:48 +0000
Message-ID: <BN9PR11MB5276BE04CBB6D07039086D658C93A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20231214103520.7198-1-yan.y.zhao@intel.com>
In-Reply-To: <20231214103520.7198-1-yan.y.zhao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH0PR11MB5610:EE_
x-ms-office365-filtering-correlation-id: 6f6d0069-bfe5-40a2-fddd-08dbfd3665cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0EHlPFZ4sjfDTYaXGNK5loF/BndpmKiDVF4A62iNUCmVoRJBNezcbrW/aUsr5lhRxv8Y5sXJ6a9ztCmYCRKH56HtSvlyMBOKl0J25xFqKOvL3k/2S3KMJBkgYBmiqIGXn1jurAEag1Zv8ajRJhAsuu3H2bVBF2eb9Kx5CW5L6XtRR/bYi5UlsKHc81IieYujvMRT4VOBN6dzg5eIpVFSB6FJXC9Nfg+nTwXBGpEj3P9cS8MP+uS2u3wd+8bSrIb46USlIZKdFMxIWm8kHOZ1r0IpqbLqjoT1yWXTr3rBMZZ8nqDPq9aKyj7VpmkGvIRCaDX/R/HJPIz15DwQgPitLvfMrCR7qxyAsB9Trog1+yUli5uQrVNAkeULgTfGiX6ilm0hyscJcx+lNhuBeeBTDNbqkdDdrYXE2+jQGFMRpnVqv3mOpMkCyOQ+gYR/w6OmjdTXTRYF94vpew37WhqNZe7v5e475GJLDTF9WyvU0kMuB5DvW5NS8k59SkcBmd5D7BKYYG6uxLEwKw7yJWd3Uk+6KjD/vDjoXJiwGsQZ0v722K7AvoVC4HiGuBF8cdOFU8f9h9ZZlcjus4HmjU54NsSpnnGO4m999P5R6wY1ovwNgKr4Ux08DjYbWDDupRM2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(83380400001)(9686003)(7416002)(26005)(122000001)(38100700002)(8676002)(8936002)(4326008)(52536014)(110136005)(316002)(2906002)(71200400001)(5660300002)(41300700001)(64756008)(6506007)(7696005)(66556008)(76116006)(66446008)(66476007)(66946007)(38070700009)(54906003)(478600001)(33656002)(86362001)(55016003)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GmfbtgPxjAbwU24/NfrvrhjiwgGpMgZHrRfMWpnGNcEgVSPduSVY1pyLMp2s?=
 =?us-ascii?Q?OjJa8QGvWItb9MIO38MZbHgL479gTFUJTcyig8Hd/ZtKMudMnsvBGm6YOW5l?=
 =?us-ascii?Q?Ds4wZNQeyzr4syvIm6y/DVvkx3ifDHYbOTI0d1EtEgm3+9no2TV/rPWGplvX?=
 =?us-ascii?Q?gjnK9NEZ2Mucxe6J2E4QKwPcweWIRU1+7KRNTaKaPe8QW+Z38ZqougPEdHfw?=
 =?us-ascii?Q?QGgIH/upFiMApVc/zJTNTi9XFi1Wf/BOOi9i/8K9ll5kEgUA8lzneFOrlXeN?=
 =?us-ascii?Q?OwCUnOtXyZciydcqaj9aSK7GYazc1q8Q2dvRRmk9iktkXfKXYEsighwVLO8Y?=
 =?us-ascii?Q?VIkySE8YQqZYvpB/R6ogpip0gN2y4heYgNqD42vY06/wMF/UjFS1W9xFuU1N?=
 =?us-ascii?Q?3UJrBmuEeledXgk10VHrEUq9yHL3NZdJemPveuyJtwIbpQZgXDccHw3mXK4s?=
 =?us-ascii?Q?2+YK+zkEP0q8vRCzfKHOmEm0FfJ3jd638qL7t0JsVahPyOTOiihdaJFSFDhd?=
 =?us-ascii?Q?LeUBUmfmVtkpgTOfco3wbbgmxtqmuhpRyjk79Z/jhqLfz0LVn0b/yyQQFi65?=
 =?us-ascii?Q?OcopqPBG/JYt2kOL7O6uqTg/yT30N16uRQmejv0EEUVT/0VKhIVpOlGGv9wq?=
 =?us-ascii?Q?E+z86/8UeDMCYA3z3HvgYd5qtB4QXL7S16Q0+057LRcaYVsWY/S3fO2RtlVm?=
 =?us-ascii?Q?5PsdH992dQVAwJWlwkSIodGsvabcN657fxYap+011qD4AzgBUNY4iLPARFP5?=
 =?us-ascii?Q?ZhNPz4615kvUdRK7EgIv5W5LaFpgHZh57qSnRpQZlstreeBFJ2tNKuV85ZvA?=
 =?us-ascii?Q?mGoOu7c6xEDnD49kGc7ja5sY84UTxW4zzkBGLf6tiW24Ih6F3IXPAj8RbBBp?=
 =?us-ascii?Q?FokTnoe7XU7GNfX9ZT5awnFve2c5c3Gdvzr7+2RGyGnVZiRSqqe+4lK4G4ZC?=
 =?us-ascii?Q?aUYYAtMstt5pw0O4yheIn6+Kau7ihX9PUXdixqQ3yDLpAZcA0VdeFYXMqu3I?=
 =?us-ascii?Q?Gzt0uJABkyc1/x+gA0lxNHLTnKY1DNiTAhONckWXDy0yej/8j1dODWw+WMxX?=
 =?us-ascii?Q?YEDXZySlIrFnXiQ74v9Wnyo5SShxAsZIOLgQvIGYD0yam9XpGOmASLnNeuUC?=
 =?us-ascii?Q?Y8a0dulBvKO5jhuYv8AMNpzRo7TbyW4nGZV5KdvJDr/VzyCTR0/711SQTayj?=
 =?us-ascii?Q?8jL0vUoNWtpqw3ndg3d/nnb15bsUvN/Bld8hEhCmIDnjIKLkc/Aiyq5uAfg7?=
 =?us-ascii?Q?rvD0Lq+xzVXpxusPPH3+VfV/iehRPLi4w6SksuAH9Z9AaE/Dtz0tJZUMBn3O?=
 =?us-ascii?Q?w920EhIYuSplQlFHiq+fL/v8OxjNws5TTXYC+nwBOnNnfwzY44i49fMyyUD5?=
 =?us-ascii?Q?A67ClM9kudI4piFSLGk5zvrIFjWmJfSWEMXF4wzwrqzaIXCZk6FKoSNKcUWT?=
 =?us-ascii?Q?tnIVGz5q/cbxX8oes8l3g3sAz+ck2Wmfn2i0IrDHAiPoRlixketGrKmS6O2x?=
 =?us-ascii?Q?k9v0ok3w8osFxvC64KjdLdpkYE4ias86BQT+bhCjjDMSeBU0csgrD65+2euy?=
 =?us-ascii?Q?yHMHweR4YRkuKpU4lE8AW7xgL+/m0tJumLd3KFg2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6d0069-bfe5-40a2-fddd-08dbfd3665cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 06:23:48.0863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TndMqFFhsNlhIKESW7vlHF4aPWymh9wqYDKsSBhPjnzQSToSCvB/ppYLArIJOgQ7S1qExyjWerDO3Xdl8BYzcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5610
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
Cc: "kraxel@redhat.com" <kraxel@redhat.com>,
 "wanpengli@tencent.com" <wanpengli@tencent.com>, "Wang,
 Zhenyu Z" <zhenyu.z.wang@intel.com>, "seanjc@google.com" <seanjc@google.com>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>, "Ma, 
 Yongwei" <yongwei.ma@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "jmattson@google.com" <jmattson@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Zhao, Yan Y <yan.y.zhao@intel.com>
> Sent: Thursday, December 14, 2023 6:35 PM
>=20
> - For host non-MMIO pages,
>   * virtio guest frontend and host backend driver should be synced to use
>     the same memory type to map a buffer. Otherwise, there will be
>     potential problem for incorrect memory data. But this will only impac=
t
>     the buggy guest alone.
>   * for live migration,
>     as QEMU will read all guest memory during live migration, page aliasi=
ng
>     could happen.
>     Current thinking is to disable live migration if a virtio device has
>     indicated its noncoherent state.
>     As a follow-up, we can discuss other solutions. e.g.
>     (a) switching back to coherent path before starting live migration.

both guest/host switching to coherent or host-only?

host-only certainly is problematic if guest is still using non-coherent.

on the other hand I'm not sure whether the host/guest gfx stack is
capable of switching between coherent and non-coherent path in-fly
when the buffer is right being rendered.

>     (b) read/write of guest memory with clflush during live migration.

write is irrelevant as it's only done in the resume path where the
guest is not running.

>=20
> Implementation Consideration
> =3D=3D=3D
> There is a previous series [1] from google to serve the same purpose to
> let KVM be aware of virtio GPU's noncoherent DMA status. That series
> requires a new memslot flag, and special memslots in user space.
>=20
> We don't choose to use memslot flag to request honoring guest memory
> type.

memslot flag has the potential to restrict the impact e.g. when using
clflush-before-read in migration? Of course the implication is to
honor guest type only for the selected slot in KVM instead of applying
to the entire guest memory as in previous series (which selects this
way because vmx_get_mt_mask() is in perf-critical path hence not
good to check memslot flag?)

> Instead we hope to make the honoring request to be explicit (not tied to =
a
> memslot flag). This is because once guest memory type is honored, not onl=
y
> memory used by guest virtio device, but all guest memory is facing page
> aliasing issue potentially. KVM needs a generic solution to take care of
> page aliasing issue rather than counting on memory type of a special
> memslot being aligned in host and guest.
> (we can discuss what a generic solution to handle page aliasing issue wil=
l
> look like in later follow-up series).
>=20
> On the other hand, we choose to introduce a KVM virtio device rather than
> just provide an ioctl to wrap kvm_arch_[un]register_noncoherent_dma()
> directly, which is based on considerations that

I wonder it's over-engineered for the purpose.

why not just introducing a KVM_CAP and allowing the VMM to enable?
KVM doesn't need to know the exact source of requiring it...
