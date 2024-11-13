Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168499C674E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 03:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6E810E330;
	Wed, 13 Nov 2024 02:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jZC5kvkJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD2D10E328;
 Wed, 13 Nov 2024 02:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731465029; x=1763001029;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=z2wIETtlCj5ujtJKYUOkPjrYAZsWOMd2hMg+OgntU3c=;
 b=jZC5kvkJNtDpOXbHu6NNDiqdaKq+jSUyPbf3PFKpyBU+Dg3MXheMkAoZ
 Z0UnLT0p1SzkIyZLDm3L5dKU4FsfbJl6TXLWCVSWyBq9JKWbcavK5OOKu
 D5IorUslu7eptPTzTwAcg+UUnZji4D2BXPYq9TGFcsi1hHwwAVslDQLsb
 FAD7vskPjrKqNl/AN/lgrU5qmgrumAPk7zqJpLjUaoss938HweceWlmax
 WR4bFU7FS9EmMbS/n3ZNlLOt2erI0dlkDGYRIU+sPU9EREn4126ADIQ5U
 99Fo0yYZAq/iuStyKOCNmqEuqOdl4p/acyBpUcGxReMxysMJMP0QwQQfq g==;
X-CSE-ConnectionGUID: bDKvsGEfQ7qxFUJ+3uyUlw==
X-CSE-MsgGUID: nARICqarSHysMPLao31gWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="41943678"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="41943678"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 18:30:29 -0800
X-CSE-ConnectionGUID: vc3yPMv4QyiQYkHJwA3ndw==
X-CSE-MsgGUID: W73DMNFAQr6878DUbHnOUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="88534346"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 18:30:29 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 18:30:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 18:30:27 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 18:30:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcz/9sYJ2lS9Ibx8Yjb5jwbiYHnkZHmiECaolZGxwQpFMCmszzEF4K18OHiboRQGVdhSghqWURMCC+KJFP5znhokhZNKH5n5QwXlkpB73ygriHhq3Dn5vX50QE/ddyr6qfjkIPSlrrPOfzCra875frr4VChiAJu/V2eyaP0PtQwnWaANpE2GVpHiLTAOt17BMMSe65w6DST/RtzK9JsI8EbxtphcOnbyUDfKYP2VHcMKjoIXQ6HZGzmruaUUEjbvhnuFv84DavhPwTYl2Tc3okn08TUN27tEO1hdO5h/zuhGuUut2yy/GBBnAfcXCr6EYXQDbBv/uAD6rNQ3hkPoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ru3mwg3e4rUvnvUcLSdLD1ojngWiWJOmyoytw2DtWY=;
 b=ZpnfMxr7vTwzp5oP7Zm+KktDvyIkd1g6KUbsdJrnNzQmIaeJMGPt7yFZWAbIpqeh5mb008Kgo3E8C3mbpYjzeCkotsSWDSkFziSdhmNyTeCb85p2GVcsOUut0EMsfPU8Sq3XnO7fbUshmtcxA6A4RGzGXaNWt2Qe1XPvJAtd0TtMUyfaXIXyYJkNPTbLTO2aW/eKqBaOQg5rU860HVfKBQo8pkt1WmlPPx6SK2JBA8pPQCrGZqRNXqGkUtVnD5FwM6GMqWsfZJaf8E4RPSOc5is2dQIzjZmNzWw2eCemtJgbdmAk3rILW8qspQxy1kg73rcS27OM0ocze5IJX8RKBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PR11MB8733.namprd11.prod.outlook.com (2603:10b6:0:40::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.28; Wed, 13 Nov 2024 02:30:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 02:30:25 +0000
Date: Tue, 12 Nov 2024 18:30:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <simona.vetter@ffwll.ch>, <thomas.hellstrom@linux.intel.com>,
 <pstanner@redhat.com>, <boris.brezillon@collabora.com>, <airlied@gmail.com>,
 <ltuikov89@gmail.com>, <dakr@kernel.org>, <mihail.atanassov@arm.com>,
 <steven.price@arm.com>, <shashank.sharma@amd.com>
Subject: Re: [RFC PATCH 0/6] Common preempt fences and semantics
Message-ID: <ZzQPYocTEvnJVgQ1@lstrano-desk.jf.intel.com>
References: <20241109172942.482630-1-matthew.brost@intel.com>
 <2d634baa-89cc-4b83-a4c4-4d2ca6a4f2b7@amd.com>
 <ZzLLq3IKLnOGSea/@lstrano-desk.jf.intel.com>
 <0dcd54bc-a1e0-41cc-915f-917f1dbf5729@amd.com>
 <ZzQOkyyQeZ3SkcHd@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzQOkyyQeZ3SkcHd@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0321.namprd04.prod.outlook.com
 (2603:10b6:303:82::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PR11MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 312ff839-f3d1-493c-b133-08dd038b216a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?2f4o4m8zJxOoCqzAgo8EHzL8nVdUoX7U+IlE/DYW+1vKtf/ztVgY0dBwP7?=
 =?iso-8859-1?Q?x1wZDJnZWXtxlfXYAV1OWuO1yM/7Ig5HMHjSVxj7g9LEsh9O1mHHaTSdtI?=
 =?iso-8859-1?Q?tBbFkMqYvQGK3FL0g3kr6qZQ+hYRraEaxPHtPV6UFg804HvYspK66tRqif?=
 =?iso-8859-1?Q?ZLqyggYL3aFLdT+VARYC8wa/ah8Mgo7mv87IcFe5xYwpC/izuhk3Z+HWHo?=
 =?iso-8859-1?Q?smvkFhApCJbtOBCKv2tpig0ZZAiEtKf+PFvnVYtDJWEXCdNhC1rkVoHapo?=
 =?iso-8859-1?Q?osi/+kZCOHzpEszLfzCzhthTA0wlRzWqUAu/pVV5ivbx95DJO7DAZ1h80t?=
 =?iso-8859-1?Q?zPGi1Vvl+mKUwcJ/iRsjmIX3hmIOTKzCVe26DLdJ2b5Vu8uQBfj53NuxU5?=
 =?iso-8859-1?Q?61KabcPs50RBOU/vpPMqv9HSfGDhFzty4s8rKtbW7WNHBWPM25K+MDrKb3?=
 =?iso-8859-1?Q?9h1Us8zU+zh0quQSp0GuRJmSOmW6T79Uu73o2KQw5c+sMy875/70OFXOOU?=
 =?iso-8859-1?Q?fgqbWMAQD8PQL3cifvhw32SYGTcDsv5Pr6JI3GLlwxIfLcqJ/nLCpY2m4b?=
 =?iso-8859-1?Q?fF8un/7/rKBaKfQjXYq8qKJm0O4hVoR1Uy00b0F4QK7clv5dMaZvGAhPl7?=
 =?iso-8859-1?Q?tshVoWP9HnGwvUy7EMRTrqX4XVmqQ8zx6kq6ynWanMHGG1puzFDiFJwmMV?=
 =?iso-8859-1?Q?Bn5GDXFf7Q0I8yooQJyDaEsWFhEne5uw0fOqDFD3+3cCq+uhc6a7se3LPK?=
 =?iso-8859-1?Q?LPSIdK6/YNOJOSOYESnAs5MW3guxmR8j6lKzfxBcNTG1gUpXI7F4u1zvZJ?=
 =?iso-8859-1?Q?x1flqehkR+MoOgr6q1TSkRaR/RRM8zOE7YJN8Bk0XJi40kNbwUjaZL4Uug?=
 =?iso-8859-1?Q?aWkEgeOmUSsY9V3sCNXpYhdNvFnXaagUOTFB/mADbFUeu2d6CdgsasDGi0?=
 =?iso-8859-1?Q?XiDHbarWOVrbngltUzUOVk3UuzYHnkqiF8V0eAKye85IbqhxTfM7HikHje?=
 =?iso-8859-1?Q?gVbttF9f0w+ZHAodWtkf8fArtEezBIgc7V/ZfhchHmr1185zbZoGiJQ2xD?=
 =?iso-8859-1?Q?8Jrj0LEOr70E6dOCjEJbR1PYJkt8T0YysaPNzOYQo2Rw9COky8ml2d5216?=
 =?iso-8859-1?Q?IacrbU204YA5ygS+7ze0+Z2ce/tyFfxc8kZh414ReudAkWXZFGevvihl1z?=
 =?iso-8859-1?Q?JT90IDtQG138FcLiE5EiAugGzFba8R4RZhyaFPhZ0dzOS1Sx3RrZENBoXj?=
 =?iso-8859-1?Q?equfaW8S0OZW+vq0SCtAqP84oU9kQz56RnhdJ7cW1h0fXgwvSsAufCqEmW?=
 =?iso-8859-1?Q?K5Xq4PJPEkUqZVVbjoPhGKeBhw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3ykFlIuKoYbLo8wmTqeQduXzDRX1TmfSSWU7U9IzLGtWQkjR843i8GTD9l?=
 =?iso-8859-1?Q?FV98IN2ZH92Ro7aCgZTn8Qw7B4cl8Wrc5aPAdeq1hXdHiTHONC5BoFLW0G?=
 =?iso-8859-1?Q?yiaLPjyYXi1IK9L5jwzzbmrfSHRdU8eGhB4q7HatB+Pl5r2YPJ++j3DN1k?=
 =?iso-8859-1?Q?VGOLuCumiKB9EFfex4iWQzUvHlSZ0IpDLSy9b4xG5NA64JkaIJ8JMjwXte?=
 =?iso-8859-1?Q?My3vAyhjsyxoNviywitgH16t16dsynF7Z3W8uOFuOJMFz2jqJ0DwJ1TOGg?=
 =?iso-8859-1?Q?AwgpFsuhXR7WnJAbSSt+h9t1kk74hbouF/GaTHsglqRygkPdkLRHOMxvm9?=
 =?iso-8859-1?Q?mMLnj1qAYQFtPLIU2ya+6YtG9LVu3Mj56+Y6O6LhqHpDN1z5I6nX3AYoe5?=
 =?iso-8859-1?Q?4cNAjzJcuJPd2vWONFJDZL8ETNfnBU5deJqDTme5n8jS8/TPg/xjsNhqgn?=
 =?iso-8859-1?Q?zPSkQ2ksby+ecCmPiNVyGBzBiP21m0qS18ltiroRq5qZWSOlkMVVMbShge?=
 =?iso-8859-1?Q?iC4hQMdk6wzjamWiybhVgiH6HX/L+6UtuO+6Dr/N3tI+xcVfLfBa80iwta?=
 =?iso-8859-1?Q?9F0kxknQbsb06wvlxeOaIbNW3WzAL5jhkSj7KAFA9CglqEW/NsLX2mx46H?=
 =?iso-8859-1?Q?URY7CEO0TEiX3C86KcIaU0ub0Bgm2u+5HWCKyakCmw4SKTAL0gYrzCXorC?=
 =?iso-8859-1?Q?2qHK9vzdgdYmQPpb15k+/T/nRAYkW3pgpuKLGYRu53CBXaGLyDDb3TboYi?=
 =?iso-8859-1?Q?6kbfgXKILvDJsYMjzPhdFg3td/28HtuVSND8P+Cg/qHcwrWFrA5MZhYic6?=
 =?iso-8859-1?Q?mUIOrTN4BdeiGiI780Cf76mGBZ8+r4xvX4yEGhaXZLieF6IZz9LEKvFkPM?=
 =?iso-8859-1?Q?kOymfSSYJC9SyXsk1pqa/LNz+MdFWUIHI3IkkmncsmugpTtaSSidL+JSbJ?=
 =?iso-8859-1?Q?T9ibOt6sIdRNqFLhiMZAN4XBV7RTmkMH1QTthFmFqD/JOZMYr2XNRoJJoU?=
 =?iso-8859-1?Q?FjvmrqSdMjkBlmVyRsy4f8kpR6sqVcwNEwgbw2Out34DJl70RnIdRDYukX?=
 =?iso-8859-1?Q?Q/FusnFOuvgDbpB0YGgL8NjwCgrBXVwH3SycNnm1tLkQYFZhWtjigmdTtj?=
 =?iso-8859-1?Q?e7dJtUVerEDVeEKlMi9RoG7sTb/MkYeiRWpMxEDyfb5ewb7OTlE8yM6FfO?=
 =?iso-8859-1?Q?9FGn4pZqDMbMR6Zj8MMApwuVvE/BSJmYMyYQxBpQkcIUXN2ez6PZszjk0b?=
 =?iso-8859-1?Q?ZaJOPZLUf8xjKNUut7+L8kjy6qWOZHDlVFPR9+eobocJp11KvS5W2lGUd8?=
 =?iso-8859-1?Q?cLBvf8Alys5+kvZhKQPn1SjnuBsVHsxQGYFO7bgCuXO1/yAVe0Ei7q61tg?=
 =?iso-8859-1?Q?Er1QhFZGtifMOkiOO2h6jtX5Luh0WFKG87RBBQMHDg6d8lNzPE+TEQ1zvy?=
 =?iso-8859-1?Q?qiAouQ/mbpfiOamHOZWkK+5sSeGWzMfZMTU8pq8DMvXZ4KuCTsGvDvGTcc?=
 =?iso-8859-1?Q?HFy6itLwKUENnqAE8iSHDmvuYbnzelZo9zpr0bPu4guongXtpEkP5H+yD/?=
 =?iso-8859-1?Q?KzrU2AM9CCrpMpnktQ0PlmfkHcD+GDWwdR6m4BdVb41U/tQukxMI/Gu26v?=
 =?iso-8859-1?Q?8x0RFNazkMYlaj8F+xNfyYv2y54VZGQD8UkXn7OzgqQ18GXsSysnUDzA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 312ff839-f3d1-493c-b133-08dd038b216a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 02:30:25.3565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /P6/ccrN/cIgzbjVscO2o5U3LBCe24ZK4j3wwW89eYsbPySj5KO51nj/WKTU9j6HhW/EA8u/yU/eayBx6bY/zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8733
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

On Tue, Nov 12, 2024 at 06:27:31PM -0800, Matthew Brost wrote:
> On Tue, Nov 12, 2024 at 12:09:52PM +0100, Christian König wrote:
> > Am 12.11.24 um 04:29 schrieb Matthew Brost:
> > > On Mon, Nov 11, 2024 at 02:42:02PM +0100, Christian König wrote:
> > > > Am 09.11.24 um 18:29 schrieb Matthew Brost:
> > > > > The motivation for this series comes from pending UMD submission work by
> > > > > AMD [1], ARM [3], and the Xe team, who are also beginning to look at
> > > > > this. Sima has suggested [4] some common driver preemptive fences and
> > > > > semantics, which we all agree on. This is the first attempt to implement
> > > > > them, based on Xe's existing long-running preemptive fences.
> > > > > 
> > > > > The semantics are fairly simple: preemptive fences attached to a
> > > > > dma-resv must wait to enable signaling (and thus preempt device
> > > > > execution) until all fences in other slots have been signaled. These
> > > > > semantics are necessary to avoid deadlocks when preempting a device
> > > > > while a user submission is pending, and resuming device execution
> > > > > depends on the user submission completing. The semantics align with
> > > > > Christian's view [5], which I also arrived at independently (with a
> > > > > little help from Sima).
> > > > Ah! I was really wondering for a moment why you wanted to add a separate
> > > > dma_resv usage for that. But I strongly think that this approach won't work.
> > > > 
> > > > The assumption that completion fences which depend on a preemption fence are
> > > > always part of the same dma_resv object is most likely false in some cases.
> > > > 
> > > > At least for the AMD design what can easily happen is that we put a
> > > > completion fence only into a drm_syncobj for explicit synchronization and
> > > > then engines or different devices which still use kernel submissions depend
> > > > on it. That can go boom really trivially.
> > > > 
> > > > What we do instead is to wait for the latest issued completion fence while
> > > > holding a mutex to prevent creating new ones before stopping the threads and
> > > wrt to a mutex...
> > > 
> > > A current code reference would be nice. I looked some of the code on
> > > list and dma-fencing rules are broken...
> > > 
> > > e.g., This patch [1], takes 'uq_mgr->userq_mutex' in the dma fencing path.
> > > This patch [2], takes 'uq_mgr->userq_mutex' and then dma-resv lock /
> > > allocates memory. That is clearly not allowed.
> > 
> > No that is unproblematic. The dma_resv is only locked after the preemption
> > fence is already signaled.
> > 
> 
> That's kinda cheating, fragile, and a pretty poor practice IMO. Your
> driver though.
> 
> > The problem is currently that we have separated the signaling worker from
> > the resume worker. E.g. the mutex is dropped in between.
> > 
> 
> Again, can you share any code refs? See below, will share work shortly.
> 
> > > 
> > > Perhaps this is fixed in your current code base though.
> > > 
> > > [1] https://patchwork.freedesktop.org/patch/593210/?series=133345&rev=1
> > > [2] https://patchwork.freedesktop.org/patch/593211/?series=133345&rev=1
> > > 
> > > > signaling the preemption fence.
> > > > 
> > > Right, that works and is functionally equivalent to the intended purpose
> > > here.
> > > 
> > > I left out a key detail: when a user fence is converted into a dma-fence
> > > and exported in a syncobj or syncfile, it must also be installed in all
> > > of the VM's dma-resv bookkeeping slots (i.e., in VM's dma-resv and all
> > > extobj dma-resv mapped in the VM).
> > 
> > I don't think that this is something we should do.
> > 
> > > Before exporting a dma-fence, the VM must be validated + resumed, and
> > > you must hold all dma-resv locks, so the above is trivial.
> > 
> > Hui? Why should we hold all the dma-resv locks for that?
> > 
> > We only hold the userq_mutex to make sure that no user fence is created
> > while we are in the signaling path of the eviction fence.
> > 
> 
> I reason that the user fence -> DMA fence IOCTL (and vice versa) is
> essentially another version of the rebind worker, which also performs
> the fence transformation and installs fences in the preempt slots to
> guard against unwanted preemption while a DMA fence has been exported.
> It seems to work quite nicely.
> 

Ugh, typos. s/installs fences in the preempt slots/installs dma-fences in the bookkeep slots/

Matt

> > > If you're using gpuvm, just call drm_gpuvm_resv_add_fence. I assume AMD has a
> > > similarly simple call.
> > 
> > Nope, we try to avoid locking all BOs in the VM as hard as we can.
> > 
> 
> Why? Calling in to perform fence conversion shouldn't be all that
> frequent and simplifies things.
> 
> Also, it's likely that only a few locks are involved, as not too many
> external BOs are mapped within a VM (i.e., most BOs share the VM's
> dma-resv lock).
> 
> > > Now the ordering works inherently in dma-resv and the scheduler. e.g. No
> > > need to track the last completion fences explictly in preempt fences.
> > 
> > I really don't think that this is a good approach. Explicitly keeping the
> > last completion fence in the pre-emption fence is basically a must have as
> > far as I can see.
> > 
> > The approach you take here looks like a really ugly hack to me.
> > 
> 
> Well, I have to disagree; it seems like a pretty solid, common design.
> 
> Anyway, I think I have this more or less working. I want to run this by
> the Mesa team a bit to ensure I haven't missed anything, and will likely
> post something shortly after. 
> 
> We can discuss this more after I post and perhaps solicit other
> opinions, weighing the pros and cons of the approaches here. I do think
> they function roughly the same, so something commonly agreed upon would
> be good. Sharing a bit of code, if possible, is always a plus too.
> 
> Matt
> 
> > Regards,
> > Christian.
> > 
> > > 
> > > I'm pretty sure if converted your code this solution it would work,
> > > there are however a couple of bugs in this post which I have fixed.
> > > 
> > > This is a common solution based on existing components which I'd lean
> > > towards rather than some new component.
> > > 
> > > Matt
> > > 
> > > > That code could of course be made some driver independent component.
> > > > 
> > > > Regards,
> > > > Christian.
> > > > 
> > > > > Implemented via the new dma-resv slot DMA_RESV_USAGE_PREEMPT, a common
> > > > > embedded base preemptive fence class with driver operations, and updates
> > > > > to the scheduler to adhere to these semantics.
> > > > > 
> > > > > The current Xe long-running preemptive fences have been converted to the
> > > > > new common code, and UMD submission is expected to follow (hopefully)
> > > > > shortly thereafter in a subsequent series.
> > > > > 
> > > > > Not intended to be presented as the final solution, but rather to
> > > > > kickstart serious discussions on this topic.
> > > > > 
> > > > > Matt
> > > > > 
> > > > > [1] https://patchwork.freedesktop.org/series/113675/
> > > > > [2] https://patchwork.freedesktop.org/series/114385/
> > > > > [3] https://patchwork.freedesktop.org/series/137924/
> > > > > [4] https://patchwork.kernel.org/project/dri-devel/cover/20240828172605.19176-1-mihail.atanassov@arm.com/#26011577
> > > > > [5] https://patchwork.kernel.org/project/dri-devel/cover/20240828172605.19176-1-mihail.atanassov@arm.com/#26011853
> > > > > 
> > > > > Matthew Brost (6):
> > > > >     dma-resv: Add DMA_RESV_USAGE_PREEMPT
> > > > >     drm/sched: Teach scheduler about DMA_RESV_USAGE_PREEMPT
> > > > >     dma-fence: Add dma_fence_preempt base class
> > > > >     drm/sched: Teach scheduler about dma_fence_prempt type
> > > > >     drm/xe: Use DMA_RESV_USAGE_PREEMPT for preempt fences
> > > > >     drm/xe: Use dma_fence_preempt base class
> > > > > 
> > > > >    drivers/dma-buf/Makefile                    |   2 +-
> > > > >    drivers/dma-buf/dma-fence-preempt.c         | 102 ++++++++++++++++++++
> > > > >    drivers/dma-buf/dma-resv.c                  |  43 ++++++---
> > > > >    drivers/dma-buf/st-dma-resv.c               |   2 +-
> > > > >    drivers/gpu/drm/scheduler/sched_entity.c    |  29 +++++-
> > > > >    drivers/gpu/drm/scheduler/sched_main.c      |  50 +++++++---
> > > > >    drivers/gpu/drm/xe/xe_bo.c                  |  22 +----
> > > > >    drivers/gpu/drm/xe/xe_guc_submit.c          |   3 +
> > > > >    drivers/gpu/drm/xe/xe_hw_engine_group.c     |   4 +-
> > > > >    drivers/gpu/drm/xe/xe_migrate.c             |   4 +-
> > > > >    drivers/gpu/drm/xe/xe_preempt_fence.c       |  81 +++++-----------
> > > > >    drivers/gpu/drm/xe/xe_preempt_fence.h       |   2 +-
> > > > >    drivers/gpu/drm/xe/xe_preempt_fence_types.h |  11 +--
> > > > >    drivers/gpu/drm/xe/xe_pt.c                  |  12 +--
> > > > >    drivers/gpu/drm/xe/xe_vm.c                  |  22 +----
> > > > >    include/drm/gpu_scheduler.h                 |  15 +++
> > > > >    include/linux/dma-fence-preempt.h           |  54 +++++++++++
> > > > >    include/linux/dma-fence.h                   |   1 +
> > > > >    include/linux/dma-resv.h                    |  24 +++--
> > > > >    19 files changed, 326 insertions(+), 157 deletions(-)
> > > > >    create mode 100644 drivers/dma-buf/dma-fence-preempt.c
> > > > >    create mode 100644 include/linux/dma-fence-preempt.h
> > > > > 
> > 
