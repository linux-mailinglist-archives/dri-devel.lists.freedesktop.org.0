Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292DA55A28B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482FD10F230;
	Fri, 24 Jun 2022 20:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E61C10F230;
 Fri, 24 Jun 2022 20:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656102208; x=1687638208;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NxsFYKuI6s+omt5WBuh78JS6RCA25iY7n8r75xwToKo=;
 b=gPcca55oNFqoV0i7mzjWcgwhyVucir9z5h2g98t+/F7V08RybMiwSJLt
 uT0HvGsHcGFWUk5vKn1gu7na4SiLpXfFN9Oh4w6WZyMez9LbpYfXj0hyr
 FHfGqx/gkGiZG4aiW7BRjZnjrLwakcCAZ2EX/jCHB9wvA1tgnUm/AuPKk
 HFDBx+dz4KVvHbetypobhyNt/keU1ZOLTlmCbCLt10UgmUTdAJwt0IOPf
 TNMc8boSLvgGHBtiX04ophUXNKl0ufWpKJmnD+/kM4xKclQZ1qNLdlPWp
 Gs1pXm25co+lhcNcMkHK3f+PdhYjy1GqTdU66CEtrFd4g6a97CteiC0MA A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10388"; a="342771462"
X-IronPort-AV: E=Sophos;i="5.92,220,1650956400"; d="scan'208";a="342771462"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 13:23:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,220,1650956400"; d="scan'208";a="835269162"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 24 Jun 2022 13:23:27 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 24 Jun 2022 13:23:27 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 24 Jun 2022 13:23:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 24 Jun 2022 13:23:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 24 Jun 2022 13:23:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEbnxSltgwlm+Hjkmt62/yNIZUCOevmlCbhX5EklKGx1yRcnpCV13nxP8omHSXJ9OueYgV5Ep9uOFz6EYtMu1fYPBR2TW9/z5fGayZRDjnkUuE5v0ZudNdlH6a3FZ+QcCiOFOwDbXPCw3S3ACUoIUkZD7xh39fyqqHzeUowbFXXIoiWAkCM6CeEwMrhKOAuDJNDF0vubn78fxdw65Xr8SPPnfEYXHN/m/rRTPnK93NssRTqyrdShoMx+O4xASWzh0KwLg3mld5l7pPhfXOOJcfeyIdWyFoJCgHvbRLV7nirgR/njymT8lnipCgYz0QzR10oAmG5QsSEL0Ka3Ih0F1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxsFYKuI6s+omt5WBuh78JS6RCA25iY7n8r75xwToKo=;
 b=JR7q5N9/nzGFSw9D6dKPm5YY+uuCWJCjbu7qwQ/R3MYWxSqN9dnc9kZ1IvIQXV+PTjKDaqW3iD2O1gl56YXvd/Ur6/zGliH0QbYz1CGz9HxX2FpGyQJzCKsqYr3+ZcxDnzdjif0bERJFE76IHon5XtCYCq35Xzkd7GA4bJw8Nh1RFFMbD+i3G1Mq9a6t7WgPYZok8s4wIzk/JlAKVTH8h0ROJyMODIqYAtV4ckkloSZrUz4igRChlGC6jSlixFLXoP/QI/LcTS2FYvPYq8EvJQCVuyUJCZjazHmUcKO439kJ9nlXwBDYBYnKrrBgcC4dzsipJnqyXqh3X4oq4Qa9xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR11MB1633.namprd11.prod.outlook.com (2603:10b6:405:e::22)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Fri, 24 Jun
 2022 20:23:19 +0000
Received: from BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::98ce:859e:1d00:e639]) by BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::98ce:859e:1d00:e639%8]) with mapi id 15.20.5373.017; Fri, 24 Jun 2022
 20:23:19 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Subject: RE: [Intel-gfx] [PATCH v3 3/3] drm/doc/rfc: VM_BIND uapi definition
Thread-Topic: [Intel-gfx] [PATCH v3 3/3] drm/doc/rfc: VM_BIND uapi definition
Thread-Index: AQHYhewtASI2jWfgB0G497ALZvi+T61bEx+AgAB2AwCAAAyDgIAADUaAgAEHWwCAAAh5AIAAI9AAgACkqeCAAMK1AIAAv6qA
Date: Fri, 24 Jun 2022 20:23:19 +0000
Message-ID: <BN6PR11MB1633F819E6DF445769061CF092B49@BN6PR11MB1633.namprd11.prod.outlook.com>
References: <20220622035650.29256-1-niranjana.vishwanathapura@intel.com>
 <20220622035650.29256-4-niranjana.vishwanathapura@intel.com>
 <6ac2f495-8ead-4824-f9af-1c03fb3770c4@linux.intel.com>
 <20220622151229.GY376@nvishwa1-DESK>
 <b347fb63-5200-9f5c-b0d6-ca51b7a064f9@linux.intel.com>
 <20220622164445.GZ376@nvishwa1-DESK>
 <e6ed0d2f-ee2a-2219-c2cc-49efc32f0560@linux.intel.com>
 <1874e47b-4337-5ac6-ebea-fca21ea1ba4c@intel.com>
 <6d70cde9-f856-540a-b1d4-0325596b0c88@linux.intel.com>
 <BN6PR11MB1633C90D1B2E40359F1F168F92B59@BN6PR11MB1633.namprd11.prod.outlook.com>
 <1d36da1a-9224-5750-d103-60e7cdfdf8df@linux.intel.com>
In-Reply-To: <1d36da1a-9224-5750-d103-60e7cdfdf8df@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 100f47bc-1c09-4cda-00e7-08da561f60cb
x-ms-traffictypediagnostic: PH7PR11MB5793:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U+KcSxgL32xCLl4yt2epPKu9rl4SXZclmmQIFtudof9ciICnWutx5mUlyGgx9702ZQbNEF7hlzE/GpJmn0/b8OQO+eL0rDUfThc/5PBgiKIci6lFineJYXaLkMRLO7C3HxTF6/T9tF+JcJCmn6RE8y0gcwgk7XJFU9Q3N/sduo6Myjv3UcDMDRcXtLDaiREVULbcHGsabJujE8vw7uekdh09kO9thBCDedUgjb4iz7Z5ao067jND3Dfq5yKcYcioHPoMhubGZaicSdTGPTDzZJioSHzyw+G+53XGS9eN7mJaq8p/NtamfEfFU8iMj9jUi0N+SnlPTBQOQGc6dlJmZgA9e7+cZGpDx6u7JPbUEcbDQtzIF7Lj+xupa42s0WiJfTtboXHKTWcBxo0F0sXOHL27ET6QYNXvLDmywyu9ytby1G/7ZQSUfS9GqPHuPaJSmrAy4UvKphJZOUm5FUAXTdiGyxgwRGYcNE/a96Y6rH4VLzJfnGYkeKgzyZvP5T8kKnzCMBOieCNZpddPn8btUTbKvtlFDLcqZzBUyK32v5kwc4qB3HHJwoHGoQNgYm7RsCPtKOtcbsVq+gMvi/bp6T9y1MP4aWyXtGAVyiaWEz85lrMeDu5gkFcdPl5JHvUoZ1Cyk2udykqTjOgKdRejqAZ1eeL/a6a2KUWiLu1RoTZODRbU9+cEWzjIMo87A0l4TGZT0rH+jmUL+mBCApecp93I/CaP8KQooRc2rqg/IdpM8ecpknFXZNxgaXuphXl8p2DYQYGB9NdnwwToUuNKTiPxvJwGcX+Kjq8ubQeSyXo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1633.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(396003)(366004)(136003)(346002)(2906002)(122000001)(71200400001)(82960400001)(38070700005)(83380400001)(7696005)(26005)(66446008)(186003)(55016003)(9686003)(6506007)(66556008)(38100700002)(53546011)(41300700001)(8936002)(66946007)(8676002)(316002)(6636002)(52536014)(64756008)(54906003)(76116006)(33656002)(5660300002)(66476007)(4326008)(478600001)(110136005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmJVQ2RBRzZzQVhZUVlxZ0ZFdVR3WjN1NHZaVDU0azY5SUwwWGVCeFR3S2dk?=
 =?utf-8?B?RTNpUi9EWStHWFpTZ2xKT25PcVJVTGh3Y3FIS2hqbzF5azczU2xFYUc5V2J1?=
 =?utf-8?B?OFhpVk44WmFFRkIwNUlXL3phZ0tnV0s0SVhFZlA2TWpDRXljZldKcFpJVHdp?=
 =?utf-8?B?Ymk4eFQ3T3ltVXByYXZpTm5XQ2NtUG0wS3lsZEdlUmFaTVkzbmMxeGgyRysx?=
 =?utf-8?B?cXNWcWxtR2NpNCtFOEpIbnJzbGhxdmZTWFFsejQwU1MrTVpMZitIeExoUlps?=
 =?utf-8?B?NkxFTWhrdDRmZjErajFhWVhQb0JhVzVTbC9ydUlCNU1SdWVCZVF3aHVnQitW?=
 =?utf-8?B?aHNpMVpvYnBKUTNoRllXUDdISktocnl1cDh2YnRaYXdXdGR0cnBBT3RlYzBh?=
 =?utf-8?B?Q0VQa1Mvbzh6TFc5TFZmSnN1L1BpRFZwNXpnbWhSRnZpY2FTMGk2OFFaQjdP?=
 =?utf-8?B?WUR3cVhqUytJWFkyR0VsOEsrWC84bVNmY0FpakR1ZjBvRVBZdjV0TXNMV1dE?=
 =?utf-8?B?N3ZHN1ZSWFJpY2pUd3pxOExFc3k5L0JvR3AycHovS2JkNmJLYzlwYzFiQkxr?=
 =?utf-8?B?ajlyWFZHNEZYRTlSZWpZWk9LUU4wWFlnUnc3cldvL3ZRZzBTOGh2cDVkelpG?=
 =?utf-8?B?aGtzN0l4Rm1SbjJuY0krcnJuTzlFeVJtOGgzNTEvekZ6K0szUTJGU3hHL2lJ?=
 =?utf-8?B?UHpZOEhnNk1GR3VTRGtxZllINUNKL0tCQXhuN1NrK1ViUEhUblpETXhnNUVY?=
 =?utf-8?B?UUFJeVdVcXhCV3B2RUgwbjVueHNhYm42UzFzMGdrUUlUODFPMVVnS3lhUUsr?=
 =?utf-8?B?R1JwR2w1YnIyTUdHbSt3akw2b2x5WGNZZFFycy9YS2xtUmsyN2REbU9mTXJ2?=
 =?utf-8?B?cGFubHFybTY2QldTdEZsRmo2OG5FMm5kTnlIUU96R2hqT1NZSGpTcGhXR2pi?=
 =?utf-8?B?RkhNalFhYkFJMmxDZWZ4RnNEdTlNdG1XTmRSdWR1eWNoM2M2Q3YvbjR3OHJJ?=
 =?utf-8?B?eHFaY251UW5GL1Jhc0ozVDE1NGRTdGV3RytiazdLdml1YTBpUG1LSFI2bDcz?=
 =?utf-8?B?dVFOSUxiWlhNVU5WcmVVOStrZVB2M2p4UG9xSkxrOXRFelhvZkVscE5CSE10?=
 =?utf-8?B?ckFyTThwSm94M2g3L1BzOWZENlJzQTRjcjJvVlU3Zml4SXJZUlh3V3hidzQz?=
 =?utf-8?B?VWhEalYzdkVYV3kzNlRBaFBSWTJ4YjdIYUxQSzd6VGt0Z3VBZXFsS0V3OTB1?=
 =?utf-8?B?NUJ4a0FmSCtkYStqZFRRamVMc25kZnJJYS9kNTBoQ1pPME9DZmY2MmxVMlhK?=
 =?utf-8?B?bWsyelcyd1VVbE9QRlJiTW4ydDUrY21zQUl6R1F3T20yU2NVYTlZbXhGTUJP?=
 =?utf-8?B?aTA2VVV1SW5aZCtrS0hGSm9PL0FyT0JxeXFUcVNxR0I0U1BJdFZOeE1sNmhK?=
 =?utf-8?B?dkFqVWJvMTI5MWZQZzRiNHdwM2ZxTnltNVc5Rm90bEttNkpJSitNZEd1cita?=
 =?utf-8?B?Zkp0V1M2b2t0UUpOMkFMUi8rZ2c4K3pYZmlSS2pXcTRkeVBnREN2RzAzeXRk?=
 =?utf-8?B?MFkzUDg1VHVGRnVDZlpQck9DTnFiNmtvUUI5YUkwaWRNc3orSVhORyswdmdE?=
 =?utf-8?B?bFpQaUlFREVNVDVYMytRUEJBYkxHeEJmeGM1ZFpMWmpxR2hkUGJpT2w2QlJu?=
 =?utf-8?B?bjdkODRab09PWVV2bUQ1RmN4VzhJVXE2RnM4TmRnQjJ5K0l0bFc0OXBOUXd4?=
 =?utf-8?B?clBLTVdQYTlieUtrTkM1MjZ4emtPeHFvQmhDT2pTeE5wcHhMYUhMQVhnRC83?=
 =?utf-8?B?aWswaDUwZm85YVRPREhsRitVTWZRUU8vTGNMa3VNWjBmNmhzTTR4U1UxTHA5?=
 =?utf-8?B?TzRoZHJNOEMvNlZvTG5VTU1Ud0paeG4zVmZJS2k5MHpXVFppYWlWZFVwcFI4?=
 =?utf-8?B?NGJuQkNLcFBrcGFGV3BDNVp5b0k1cmhMT3o1amtQRGNvTzJQOUhoYlpTTVda?=
 =?utf-8?B?dU1OR1E5bnFEUTZCcTI1cnBrbU1ibTBrVnIzUG9nd2FlR0d6MHhLQ2h1ZjdG?=
 =?utf-8?B?SFVUSkFpVkQwWVBYSXhkUkhVZ0hhN2t6UHgwejN5N2o3S010QnZqbEV1OXM4?=
 =?utf-8?Q?l0P2DB0LAs1Sdtqa0NF5PDza4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 100f47bc-1c09-4cda-00e7-08da561f60cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 20:23:19.3925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kwSCM6as6TGnpuPpnBRPvNp2HwmITPVUYPA2qxnagctW8h3xR62y5VDPCZANqP0+/Kh8a+PFhFIiEvCEVMQy3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
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
Cc: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGV0J3MgY29tcGFyZSAidGxiIGludmFsaWRhdGUgYXQgdm0gdW5iaW5kIiB2cyAidGxiIGludmFs
aWRhdGUgYXQgYmFja2luZyBzdG9yYWdlIjoNCg0KQ29ycmVjdG5lc3M6IA0KY29uc2lkZXIgdGhp
cyBzZXF1ZW5jZSBvZjoNCjEuIHVuYmluZCB2YTEgZnJvbSBwYTEsIA0KMi4gdGhlbiBiaW5kIHZh
MSB0byBwYTIuIC8vdXNlciBzcGFjZSBoYXMgdGhlIGZyZWVkb20gdG8gZG8gdGhpcyBhcyBpdCBt
YW5hZ2VzIHZpcnR1YWwgYWRkcmVzcyBzcGFjZQ0KMy4gU3VibWl0IHNoYWRlciBjb2RlIHVzaW5n
IHZhMSwgDQo0LiBUaGVuIHJldGlyZSBwYTEuIA0KDQpJZiB5b3UgZG9uJ3QgcGVyZm9ybSB0bGIg
aW52YWxpZGF0ZSBhdCBzdGVwICMxLCBpbiBzdGVwICMzLCBzaGFkZXIgd2lsbCB1c2Ugc3RhbGUg
ZW50cmllcyBpbiB0bGIgYW5kIHBhMSB3aWxsIGJlIHVzZWQgZm9yIHRoZSBzaGFkZXIuIFVzZXIg
d2FudCB0byB1c2UgcGEyLiBTbyBJIGRvbid0IHRoaW5rIGludmFsaWRhdGUgdGxiIGF0IHN0ZXAg
IzQgbWFrZSBjb3JyZWN0bmVzcy4NCg0KDQpQZXJmb3JtYW5jZTogDQpJdCBpcyBzdHJhaWdodCBm
b3J3YXJkIHRvIGludmFsaWRhdGUgdGxiIGF0IHN0ZXAgMS4gSWYgcGxhdGZvcm0gc3VwcG9ydCBy
YW5nZSBiYXNlZCB0bGIgaW52YWxpZGF0aW9uLCB3ZSBjYW4gcGVyZm9ybSByYW5nZSBiYXNlZCBp
bnZhbGlkYXRpb24gZWFzaWx5IGF0IHN0ZXAxLg0KSWYgeW91IGRvIGl0IGF0IHN0ZXAgNCwgeW91
IGVpdGhlciBuZWVkIHRvIHBlcmZvcm0gYSB3aG9sZSBndCB0bGIgaW52YWxpZGF0aW9uICh3b3Jz
ZSBwZXJmb3JtYW5jZSksIG9yIHlvdSBuZWVkIHRvIHJlY29yZCBhbGwgdGhlIFZBcyB0aGF0IHRo
aXMgcGEgaGFzIGJlZW4gYm91bmQgdG8gYW5kIGludmFsaWRhdGUgYWxsIHRoZSBWQSByYW5nZXMg
LSB1Z2x5IHByb2dyYW0uDQoNCg0KVGhhbmtzLA0KT2FrDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGxpbnV4Lmlu
dGVsLmNvbT4NCj4gU2VudDogSnVuZSAyNCwgMjAyMiA0OjMyIEFNDQo+IFRvOiBaZW5nLCBPYWsg
PG9hay56ZW5nQGludGVsLmNvbT47IExhbmR3ZXJsaW4sIExpb25lbCBHDQo+IDxsaW9uZWwuZy5s
YW5kd2VybGluQGludGVsLmNvbT47IFZpc2h3YW5hdGhhcHVyYSwgTmlyYW5qYW5hDQo+IDxuaXJh
bmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4NCj4gQ2M6IFphbm9uaSwgUGF1bG8gUiA8
cGF1bG8uci56YW5vbmlAaW50ZWwuY29tPjsgaW50ZWwtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEhlbGxzdHJvbSwNCj4gVGhv
bWFzIDx0aG9tYXMuaGVsbHN0cm9tQGludGVsLmNvbT47IFdpbHNvbiwgQ2hyaXMgUA0KPiA8Y2hy
aXMucC53aWxzb25AaW50ZWwuY29tPjsgVmV0dGVyLCBEYW5pZWwgPGRhbmllbC52ZXR0ZXJAaW50
ZWwuY29tPjsNCj4gY2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tOyBBdWxkLCBNYXR0aGV3IDxtYXR0
aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW0ludGVsLWdmeF0gW1BBVENIIHYz
IDMvM10gZHJtL2RvYy9yZmM6IFZNX0JJTkQgdWFwaSBkZWZpbml0aW9uDQo+IA0KPiANCj4gT24g
MjMvMDYvMjAyMiAyMjowNSwgWmVuZywgT2FrIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmDQo+ID4+IE9mIFR2cnRrbyBVcnN1bGluDQo+ID4+
IFNlbnQ6IEp1bmUgMjMsIDIwMjIgNzowNiBBTQ0KPiA+PiBUbzogTGFuZHdlcmxpbiwgTGlvbmVs
IEcgPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPjsNCj4gPj4gVmlzaHdhbmF0aGFwdXJh
LCBOaXJhbmphbmEgPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPg0KPiA+PiBD
YzogWmFub25pLCBQYXVsbyBSIDxwYXVsby5yLnphbm9uaUBpbnRlbC5jb20+Ow0KPiA+PiBpbnRl
bC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOw0KPiA+PiBIZWxsc3Ryb20sIFRob21hcyA8dGhvbWFzLmhlbGxzdHJvbUBpbnRlbC5jb20+
OyBXaWxzb24sIENocmlzIFANCj4gPj4gPGNocmlzLnAud2lsc29uQGludGVsLmNvbT47IFZldHRl
ciwgRGFuaWVsIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT47DQo+ID4+IGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbTsgQXVsZCwgTWF0dGhldyA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gPj4g
U3ViamVjdDogUmU6IFtJbnRlbC1nZnhdIFtQQVRDSCB2MyAzLzNdIGRybS9kb2MvcmZjOiBWTV9C
SU5EIHVhcGkNCj4gPj4gZGVmaW5pdGlvbg0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiAyMy8wNi8yMDIy
IDA5OjU3LCBMaW9uZWwgTGFuZHdlcmxpbiB3cm90ZToNCj4gPj4+IE9uIDIzLzA2LzIwMjIgMTE6
MjcsIFR2cnRrbyBVcnN1bGluIHdyb3RlOg0KPiA+Pj4+Pg0KPiA+Pj4+PiBBZnRlciBhIHZtX3Vu
YmluZCwgVU1EIGNhbiByZS1iaW5kIHRvIHNhbWUgVkEgcmFuZ2UgYWdhaW5zdCBhbg0KPiA+Pj4+
PiBhY3RpdmUgVk0uDQo+ID4+Pj4+IFRob3VnaCBJIGFtIG5vdCBzdWUgd2l0aCBNZXNhIHVzZWNh
c2UgaWYgdGhhdCBuZXcgbWFwcGluZyBpcw0KPiA+Pj4+PiByZXF1aXJlZCBmb3IgcnVubmluZyBH
UFUgam9iIG9yIGl0IHdpbGwgYmUgZm9yIHRoZSBuZXh0DQo+ID4+Pj4+IHN1Ym1pc3Npb24uIEJ1
dCBlbnN1cmluZyB0aGUgdGxiIGZsdXNoIHVwb24gdW5iaW5kLCBLTUQgY2FuIGVuc3VyZQ0KPiA+
Pj4+PiBjb3JyZWN0bmVzcy4NCj4gPj4+Pg0KPiA+Pj4+IElzbid0IHRoYXQgdGhlaXIgcHJvYmxl
bT8gSWYgdGhleSByZS1iaW5kIGZvciBzdWJtaXR0aW5nIF9uZXdfIHdvcmsNCj4gPj4+PiB0aGVu
IHRoZXkgZ2V0IHRoZSBmbHVzaCBhcyBwYXJ0IG9mIGJhdGNoIGJ1ZmZlciBwcmUtYW1ibGUuDQo+
ID4+Pg0KPiA+Pj4gSW4gdGhlIG5vbiBzcGFyc2UgY2FzZSwgaWYgYSBWQSByYW5nZSBpcyB1bmJv
dW5kLCBpdCBpcyBpbnZhbGlkIHRvDQo+ID4+PiB1c2UgdGhhdCByYW5nZSBmb3IgYW55dGhpbmcg
dW50aWwgaXQgaGFzIGJlZW4gcmVib3VuZCBieSBzb21ldGhpbmcgZWxzZS4NCj4gPj4+DQo+ID4+
PiBXZSdsbCB0YWtlIHRoZSBmZW5jZSBwcm92aWRlZCBieSB2bV9iaW5kIGFuZCBwdXQgaXQgYXMg
YSB3YWl0IGZlbmNlDQo+ID4+PiBvbiB0aGUgbmV4dCBleGVjYnVmZmVyLg0KPiA+Pj4NCj4gPj4+
IEl0IG1pZ2h0IGJlIHNhZmVyIGluIGNhc2Ugb2YgbWVtb3J5IG92ZXIgZmV0Y2hpbmc/DQo+ID4+
Pg0KPiA+Pj4NCj4gPj4+IFRMQiBmbHVzaCB3aWxsIGhhdmUgdG8gaGFwcGVuIGF0IHNvbWUgcG9p
bnQgcmlnaHQ/DQo+ID4+Pg0KPiA+Pj4gV2hhdCdzIHRoZSBhbHRlcm5hdGl2ZSB0byBkbyBpdCBp
biB1bmJpbmQ/DQo+ID4+DQo+ID4+IEN1cnJlbnRseSBUTEIgZmx1c2ggaGFwcGVucyBmcm9tIHRo
ZSByaW5nIGJlZm9yZSBldmVyeSBCQl9TVEFSVCBhbmQNCj4gPj4gYWxzbyB3aGVuIGk5MTUgcmV0
dXJucyB0aGUgYmFja2luZyBzdG9yZSBwYWdlcyB0byB0aGUgc3lzdGVtLg0KPiA+DQo+ID4NCj4g
PiBDYW4geW91IGV4cGxhaW4gbW9yZSB3aHkgdGxiIGZsdXNoIHdoZW4gaTkxNSByZXRpcmUgdGhl
IGJhY2tpbmcgc3RvcmFnZT8gSQ0KPiBuZXZlciBmaWd1cmVkIHRoYXQgb3V0IHdoZW4gSSBsb29r
ZWQgYXQgdGhlIGNvZGVzLiBBcyBJIHVuZGVyc3RhbmQgaXQsIHRsYg0KPiBjYWNoZXMgdGhlIGdw
dSBwYWdlIHRhYmxlcyB3aGljaCBtYXAgYSB2YSB0byBhIHBhLiBTbyBpdCBpcyBzdHJhaWdodCBm
b3J3YXJkIHRvDQo+IG1lIHRoYXQgd2UgcGVyZm9ybSBhIHRsYiBmbHVzaCB3aGVuIHdlIGNoYW5n
ZSB0aGUgcGFnZSB0YWJsZSAoZWl0aGVyIGF0IHZtDQo+IGJpbmQgdGltZSBvciB1bmJpbmQgdGlt
ZS4gQmV0dGVyIGF0IHVuYmluZCB0aW1lIGZvciBwZXJmb3JtYW5jZSByZWFzb24pLg0KPiANCj4g
SSBkb24ndCBrbm93IHdoYXQgcGVyZm9ybXMgYmV0dGVyIC0gc29tZW9uZSBjYW4gbWVhc3VyZSB0
aGUgdHdvDQo+IGFwcHJvYWNoZXM/IENlcnRhaW5seSBvbiBwbGF0Zm9ybXMgd2hlcmUgd2Ugb25s
eSBoYXZlIGdsb2JhbCBUTEIgZmx1c2hpbmcNCj4gdGhlIGNvc3QgaXMgcXVpdGUgaGlnaCBzbyBt
eSB0aGlua2luZyB3YXMgdG8gYWxsb3cgaTkxNSB0byBjb250cm9sIHdoZW4gaXQgd2lsbA0KPiBi
ZSBkb25lIGFuZCBub3QgZ3VhcmFudGVlIGl0IGluIHRoZSB1YXBpIGlmIGl0IGlzbid0IG5lZWRl
ZCBmb3Igc2VjdXJpdHkgcmVhc29ucy4NCj4gDQo+ID4gQnV0IGl0IGlzIHJhdGhlciB0cmlja3kg
dG8gbWUgdG8gZmx1c2ggdGxiIHdoZW4gd2UgcmV0aXJlIGEgYmFja2luZyBzdG9yYWdlLiBJDQo+
IGRvbid0IHNlZSBob3cgYmFja2luZyBzdG9yYWdlIGNhbiBiZSBjb25uZWN0ZWQgdG8gcGFnZSB0
YWJsZS4gTGV0J3Mgc2F5IHVzZXINCj4gdW5iaW5kIHZhMSBmcm9tIHBhMSwgdGhlbiBiaW5kIHZh
MSB0byBwYTIuIFRoZW4gcmV0aXJlIHBhMS4gU3VibWl0IHNoYWRlcg0KPiBjb2RlIHVzaW5nIHZh
MS4gSWYgd2UgZG9uJ3QgdGxiIGZsdXNoIGFmdGVyIHVuYmluZCB2YTEsIHRoZSBuZXcgc2hhZGVy
IGNvZGUNCj4gd2hpY2ggaXMgc3VwcG9zZWQgdG8gdXNlIHBhMiB3aWxsIHN0aWxsIHVzZSBwYTEg
ZHVlIHRvIHRoZSBzdGFsZSBlbnRyaWVzIGluIHRsYiwNCj4gcmlnaHQ/IFRoZSBwb2ludCBpcywg
dGxiIGNhY2hlZCBpcyB0YWdnZWQgd2l0aCB2aXJ0dWFsIGFkZHJlc3MsIG5vdCBwaHlzaWNhbA0K
PiBhZGRyZXNzLiBzbyBhZnRlciB3ZSB1bmJpbmQgdmExIGZyb20gcGExLCByZWdhcmRsZXNzIHdl
IHJldGlyZSBwYTEgb3Igbm90LA0KPiB2YTEgY2FuIGJlIGJvdW5kIHRvIGFub3RoZXIgcGEyLg0K
PiANCj4gV2hlbiB5b3Ugc2F5ICJyZXRpcmUgcGExIiBJIHdpbGwgYXNzdW1lIHlvdSBtZWFudCBy
ZWxlYXNlIGJhY2tpbmcgc3RvcmFnZQ0KPiBmb3IgcGExLiBBdCB0aGlzIHBvaW50IGk5MTUgY3Vy
cmVudGx5IGRvZXMgZG8gdGhlIFRMQiBmbHVzaCBhbmQgdGhhdCBlbnN1cmVzIG5vDQo+IFBURSBj
YW4gcG9pbnQgdG8gcGExLg0KPiANCj4gVGhpcyBhcHByb2FjaCBkZWFscyB3aXRoIHNlY3VyaXR5
IG9mIHRoZSBzeXN0ZW0gYXMgYSB3aG9sZS4gQ2xpZW50IG1heSBzdGlsbA0KPiBjYXVzZSByZW5k
ZXJpbmcgY29ycnVwdGlvbiBvciBhIEdQVSBoYW5nIGZvciBpdHNlbGYgYnV0IHRoYXQgc2hvdWxk
IGJlDQo+IGNvbXBsZXRlbHkgaXNvbGF0ZWQuIChUaGlzIGlzIHRoZSBwYXJ0IHdoZXJlIHlvdSBz
YXkgInJlZ2FyZGxlc3MgaWYgd2UgcmV0aXJlDQo+IHBhMSBvciBub3QiIEkgdGhpbmsuKQ0KPiAN
Cj4gQnV0IEkgdGhpbmsgdGhvc2UgYXJlIGFkdmFuY2VkIHVzZSBjYXNlcyB3aGVyZSB1c2Vyc3Bh
Y2Ugd2FudHMgdG8NCj4gbWFuaXB1bGF0ZSBQVEVzIHdoaWxlIHNvbWV0aGluZyBpcyBydW5uaW5n
IG9uIHRoZSBHUFUgaW4gcGFyYWxsZWwuIEFGQUlLDQo+IGxpbWl0ZWQgdG8gY29tcHV0ZSAiaW5m
aW5pdGUgYmF0Y2giIHNvIG15IHRoaW5raW5nIGlzIHRvIGF2b2lkIGFkZGluZyBhDQo+IHBlcmZv
cm1hbmNlIHBlbmFsdHkgdG8gdGhlIGNvbW1vbiBjYXNlLiBFc3BlY2lhbGx5IG9uIHBsYXRmb3Jt
cyB3aGljaCBvbmx5DQo+IGhhdmUgZ2xvYmFsIGZsdXNoLg0KPiANCj4gQnV0Li4gdG8gY2lyY2xl
IGJhY2sgb24gdGhlIG1lYXN1cmluZyBhbmdsZS4gVW50aWwgc29tZW9uZSBpbnZlc3RzIHRpbWUg
YW5kDQo+IGVmZm9ydCB0byBiZW5jaG1hcmsgdGhlIHR3byBhcHByb2FjaGVzIChmbHVzaCBvbiB1
bmJpbmQgdnMgZmx1c2ggb24gYmFja2luZw0KPiBzdG9yZSByZWxlYXNlKSB3ZSBkb24ndCByZWFs
bHkga25vdy4gQWxsIEkga25vdyBpcyB0aGUgcGVyZiBoaXQgd2l0aCB0aGUgY3VycmVudA0KPiBz
b2x1dGlvbiB3YXMgc2lnbmlmaWNhbnQsIEFGQUlSIHVwIHRvIHRlZW4gZGlnaXRzIG9uIHNvbWUg
Z2FtZXMuIEFuZA0KPiBjb25zaWRlcmluZyB0aGUgZmx1c2hlcyB3ZXJlIGRyaXZlbiBvbmx5IGJ5
IHRoZSBzaHJpbmtlciBhY3Rpdml0eSwgbXkgdGhpbmtpbmcNCj4gd2FzIHRoZXkgd291bGQgYmUg
bGVzcyBmcmVxdWVudCB0aGFuIHRoZSB1bmJpbmRzLCB0aGVyZWZvcmUgaGF2ZSB0aGUNCj4gcG90
ZW50aWFsIGZvciBhIHNtYWxsZXIgcGVyZiBoaXQuDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gVHZy
dGtvDQo=
