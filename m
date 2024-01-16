Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63F182E58F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 01:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6B410E3D3;
	Tue, 16 Jan 2024 00:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F6210E3CB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 00:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705365968; x=1736901968;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CLn0CS6CHElwul8VhiGR5cKS/HaqEns6qmdlARF8SD4=;
 b=ZltnGHUmg3UtWHPI95ewmk9iDgxMfPHSYOoSASi6tGOx+c5v2JwIPqhw
 cDgn/dbsxlhdm469MPGvuQosU1FqSVSqhUO6beu9gk+RUGdmAie7n8L4A
 nuBDAgNChc0pr6U3i2/1CpSsBGPwUpqLuHQ407odN9Pd+SNZlz236GaUR
 GomNNF1+ttzZcYOzHy4fG7VONvIjuR9688O/OPoXDQWQyMLLDxku1F/DT
 tnKuIPtxAE8ySBKYtp07DLMxqw4Q48jasSCMpHUrtswJ9UvkqCL7oICwu
 beoyuAN40ZkVcGjBQJxtzxCDc7XgkYPhaqSLmS/mVqHxOr3zHOu0eyrOM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="398581667"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="398581667"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 16:46:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="1030786886"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="1030786886"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2024 16:46:04 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 16:46:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Jan 2024 16:46:04 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Jan 2024 16:46:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUD/edFizlNXgF7OkGzJ8q/f6ptsxpnmqa4s+8hrfPQ/V+Yjk6JCWzpu2o0y7KcUDr5sTd750OtpOur5z/D5wEr4LMcuwbS1vf5gYzG0JlPphJQYn/jLtuXEogjuwHIO/F6UDmN939P8bSzcWZY99GawEDpCw/o10Pa03aM8eaqTfecSf++QD+kd1phAxtgwj2nusgkhW59/BFP7/cPgUWkRAfQAkqKEvPGdjWSIMS7bKqSajtf+vgRS8tzkzoE0oL4wmbQ9MfNY6xdxOaBH/M8X4/Ca702wMjYYgNzE9geRDvcUV5kZiyevNyq0wKXfX97aWyKqW1TnmJk8+/escA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLn0CS6CHElwul8VhiGR5cKS/HaqEns6qmdlARF8SD4=;
 b=RY0TnjdIHcDTMHim9cYUMB0mCASpP5RAFgQqfzozAYhurqyP2NnA7u7gd04++qIcr9/hX7fod51u1Pq6hLKO0pKwUER9Xag124meII1HsjnGAiL2OCGxbIRgJyz/Zj8miyEfLPfjIZ+xvsj+Uz0p1cIcOXVLEPAU9Q1cgr0q0pn0oy2K8ZqgbbyROiAUmZq2iR+5slunoX6tSaegPU3QN1kG6RUMg4qJmck8CuFfqoSlwODwBuRUTtD95U2aI379izxQjyB1WFX2DxtY9o/NMNvAn1seE9PNHd3DT1H8IxfQVPENE/KWARvpEpAr8bVD8Cb2ObUSwBE+hleavKfl/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CH3PR11MB7724.namprd11.prod.outlook.com (2603:10b6:610:123::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.27; Tue, 16 Jan
 2024 00:45:57 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a8e9:c80f:9484:f7cb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a8e9:c80f:9484:f7cb%3]) with mapi id 15.20.7181.022; Tue, 16 Jan 2024
 00:45:56 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>
Subject: RE: [PATCH 0/4] KVM: Honor guest memory types for virtio GPU devices
Thread-Topic: [PATCH 0/4] KVM: Honor guest memory types for virtio GPU devices
Thread-Index: AQHaP7tymmMn9RzSAkmqnV+LZ1Ybo7DLoueAgAPOSYCAAIYUAIAAoD4AgAAM2ACAAB54gIAKXh0AgACHppA=
Date: Tue, 16 Jan 2024 00:45:56 +0000
Message-ID: <BN9PR11MB52763D5A686C855CD74766BA8C732@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20240105091237.24577-1-yan.y.zhao@intel.com>
 <20240105195551.GE50406@nvidia.com>
 <ZZuQEQAVX28v7p9Z@yzhao56-desk.sh.intel.com>
 <20240108140250.GJ50406@nvidia.com>
 <ZZyG9n0qZEr6dLlZ@yzhao56-desk.sh.intel.com>
 <20240109002220.GA439767@nvidia.com>
 <ZZyrS4RiHvktDZXb@yzhao56-desk.sh.intel.com>
 <20240115163050.GI734935@nvidia.com>
In-Reply-To: <20240115163050.GI734935@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CH3PR11MB7724:EE_
x-ms-office365-filtering-correlation-id: 392f6053-51ec-450c-b4e1-08dc162c8049
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EEKUoXJjonx+Wug/cJkfr8DH4J4cJ1+XRga67bGQG1LnO/wq4exEp2mA5cavrUFKmsPSWzSFARdi6dfKdbXgwRM0EZeP9ZN2lW/oidF0ptM9G3Wnqw9HhllRqB0XuV28oovw6UIG1fkQY0kzYpvTfifZKgGhmONFZYFRAYqKXcF8aCuy8wdCwNfAI9IBwnmNiz1jv7w/RzQlcQ+j6jmxTn9A7WZ6c9Y+VYrw0rzTIjfYNSme2kVinqeOjphC5aFDysySW98Yw7vcPP/MZr4bsQjiuBN4EA2v6zbPR4b4OjyHZM8/o2YPjtFSV5AxHcU0/5BawghOyOs3e0hhkeF804DTNvDLzo/e4685G0JH4kCR2HcZmTWeabm2rszgbq6AcdWyuK1efF1jwbLwRgm4mY+82TjJGUwLAJgaVe9shgrcZdtaZf4EYXpot/T8ux6N1sybT8BsNVEjSQlrq5oYwM3yuHrBeaRVCCw5UScHXOgwdqZWi9gSvD2qrt7l5ax3uOHpS17MfFXrTWcuRkenF9aDNjjJE3FHQ87YNR3OOTI0wvGbJxPxNrg5JITflP62pzqJDSUKK8qKYTmPdVdvA7eecXyydBDmM01pWPEwjgI2VbcqlI1lwhslrbp3s8gl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(366004)(396003)(376002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(41300700001)(38100700002)(122000001)(33656002)(38070700009)(86362001)(82960400001)(4326008)(8676002)(8936002)(52536014)(76116006)(66946007)(316002)(110136005)(54906003)(6636002)(64756008)(66476007)(66556008)(66446008)(7416002)(5660300002)(2906002)(26005)(83380400001)(478600001)(71200400001)(7696005)(6506007)(9686003)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A1J1teEvyf+xwG6JmwLEf8rgJar7wRz+1KF36sIkIw+IsD58KmlDBz8xZqdt?=
 =?us-ascii?Q?Dt4PEMgXER0a45pVr4cVqCKnHSLFAX8mA5UogwVKLYmP9Dlq7TcvW9NKe2XI?=
 =?us-ascii?Q?eKgPnMz4ReQCCKU0xd0M2aZ5SGzpksRvYsJAjkfPeXQgLTRB5AfNgVu2wnqU?=
 =?us-ascii?Q?rrYYNSonu43DQf/hxZ1wHS/6GawsacLN2p59jEF5WhRre0am8eK9yk+mc9rb?=
 =?us-ascii?Q?Ncc99YTKEDXiuP4niFkP7KgNUE7Qht3lnS3H2/fBgRESnYMQsu3W7+UgDf3G?=
 =?us-ascii?Q?h8mI8v9qxzlLehYWgsDEGhN0jJqSm+jITnxsbWVJECwwfl5CN+2bII7pEYOb?=
 =?us-ascii?Q?drRwr5Qhj4demokwF1kjc5m7J3jpSU+eAwgxkR6+HlFnNRsETKQq7nZoocmZ?=
 =?us-ascii?Q?FbeV8Y2H1vK9q44ABACReMFZZIPG+yg31iUtoqPo1KT/sEug6XV8oZd3zp+H?=
 =?us-ascii?Q?/kl2RsAtDDNmF2Ex1cv1aupg9QtMU84wxiwI79/zHokxYFWxum1ajNcX7P1j?=
 =?us-ascii?Q?X6kiigzqvyRrFoE6eGtsfS7eJtIAiwaPGonebM37Orlmv+IDaXI6DiyeHER9?=
 =?us-ascii?Q?R/uO5xeFPqnZQOBYX+t1oX+NNkZ4Bv1wXJpsrzZREqn8rM9i3IRhRBw07pl/?=
 =?us-ascii?Q?UoTkCe0VyFTkiyVwJvWIFJjtDAZxFKn7GFIhVu5HnzMJtoGFTKMTsJ8w3Cmt?=
 =?us-ascii?Q?KvJ1y+WDdOwKyAYNoA846ajoo1CbmWn1x9/5Av2ZksGZni4Qr+0pwviW+yjO?=
 =?us-ascii?Q?x0GlgWuOzfl/9AB8TzXgG1ArPR3Ed/FLXHoTi8MA5l/V3TGgRtm2iH/8K5Zm?=
 =?us-ascii?Q?v5FgGbvpuOeIIQO71g2/z2OBJzUHzTMYxc9JjUoZ4ojWmWos8jolioe8ah9M?=
 =?us-ascii?Q?a+0z7Aufka7vEWgW+QBco3vVaX4RGOjkyaxy3HTyPjtNoF2Se0OiWacDLjcY?=
 =?us-ascii?Q?189rqfItOJaV7Q5R6BInP17HKlku5Nzjw7c3A1vA5S/PU5I708GSkGO6zWYI?=
 =?us-ascii?Q?Tkt/lGMvh+PuQNn6co6fY9i/Jt5AQTWMoGSBxxVCDtK3dsuiE4TPq0kiZ3vg?=
 =?us-ascii?Q?zV6wwIs7CZNqXclXbVD8ka1sciycIYmvAv9qY3wuADFoxsRvctW7pkS9ibbP?=
 =?us-ascii?Q?9R12kD0uf0sLiaRi3jW/ijE2/wgxoPMI/H+kEgIQjsdtEXSlQ+YMLAn7l9ge?=
 =?us-ascii?Q?/24KklxeedSgtgeUCyrxATgsGSYeOdTCSSFD3EhHCGIH2OS6ZpL/n9GKPiJs?=
 =?us-ascii?Q?oIP1SNEEO9iJz7pOYwHqn6aMd3LXtFqWGC/n5/b9enFPWyRN2cX4iJ6p4b2P?=
 =?us-ascii?Q?ce5aAt03JdEyc2c5q3z0CWyH9puojAeC0SmnbU0vqTJvc/89BqfmRFVhHzkt?=
 =?us-ascii?Q?7+kUs8GhrDzsasRQeVFIJFlD6LAjQpmDyYp3EVFpjh5jHXaLckwdp/EHn/Nt?=
 =?us-ascii?Q?5TQdtcxCgKCZy/JIUbU4els482Dq28q4ILlhEbTlVvpNmFUW7jqjdJvK2opZ?=
 =?us-ascii?Q?3q4TQw7TrxSBCpD3ES2hXfTKChGo33JVKox33zpH+iyhcdKfv9xvLpQ7OQDF?=
 =?us-ascii?Q?Jf1e788orugfs803t2Lxy6oj6nxBBAeGHCPiSDDs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 392f6053-51ec-450c-b4e1-08dc162c8049
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 00:45:56.6167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vBXtN4/KN3PuBIxcCpwirkv8adIZAtS4jgtZ8ACM7SS/Q3mn28R0CieUOrNBmRx28qZfT5robmXlM/XnnHKPpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7724
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
Cc: "wanpengli@tencent.com" <wanpengli@tencent.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>, "maz@kernel.org" <maz@kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "zzyiwei@google.com" <zzyiwei@google.com>,
 "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "olvaffe@gmail.com" <olvaffe@gmail.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Ma, 
 Yongwei" <yongwei.ma@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "jmattson@google.com" <jmattson@google.com>, "Wang,
 Zhenyu Z" <zhenyu.z.wang@intel.com>, "seanjc@google.com" <seanjc@google.com>,
 "ankita@nvidia.com" <ankita@nvidia.com>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Tuesday, January 16, 2024 12:31 AM
>=20
> On Tue, Jan 09, 2024 at 10:11:23AM +0800, Yan Zhao wrote:
>=20
> > > Well, for instance, when you install pages into the KVM the hyperviso=
r
> > > will have taken kernel memory, then zero'd it with cachable writes,
> > > however the VM can read it incoherently with DMA and access the
> > > pre-zero'd data since the zero'd writes potentially hasn't left the
> > > cache. That is an information leakage exploit.
> >
> > This makes sense.
> > How about KVM doing cache flush before installing/revoking the
> > page if guest memory type is honored?
>=20
> I think if you are going to allow the guest to bypass the cache in any
> way then KVM should fully flush the cache before allowing the guest to
> access memory and it should fully flush the cache after removing
> memory from the guest.

For GPU passthrough can we rely on the fact that the entire guest memory
is pinned so the only occurrence of removing memory is when killing the
guest then the pages will be zero-ed by mm before next use? then we
just need to flush the cache before the 1st guest run to avoid information
leak.

yes it's a more complex issue if allowing guest to bypass cache in a
configuration mixing host mm activities on guest pages at run-time.

>=20
> Noting that fully removing the memory now includes VFIO too, which is
> going to be very hard to co-ordinate between KVM and VFIO.

if only talking about GPU passthrough do we still need such coordination?

>=20
> ARM has the hooks for most of this in the common code already, so it
> should not be outrageous to do, but slow I suspect.
>=20
> Jason
