Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E229731DE7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 18:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AEF10E517;
	Thu, 15 Jun 2023 16:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633C110E517;
 Thu, 15 Jun 2023 16:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686846874; x=1718382874;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HSCtLO6KpOUpH00J+5S9Zp1it24qDJPtpu/IvopYBKo=;
 b=R5zDiSfAp1CPt0X5Q2enXaB4ct+Cgcw2CZx/uMNCR/0BOVNH6T8eXISU
 tSyp7yXre7RcfyNNjdrrukh13U1P/TiCUHmqwnDbttZQYaop0VfkME+H5
 nFcAmn44VQ/Ja/C9jIBko1s7GpBsLUZzOeJUrEsBv0Hk0LevxZXF088kI
 82DWlKLaDVjrZBDrjMF407PtS4UUehJtSJ3OAMUhvSeuycOHXJQxIG/z0
 5/1W2nYcGIMfMJgog5H/AEV+pVrCPHjul8bj119DIOIv5RxhvoFMhYZ01
 WWAC6qUjoVKHg0Dqt35L5iBqmgg9PXsUAcFT/h/fdVHXhmcWY7pHQOI9V g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343699913"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="343699913"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 09:34:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="777741018"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="777741018"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 15 Jun 2023 09:34:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 09:34:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 09:34:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 09:34:31 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 15 Jun 2023 09:34:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oO6OgjV7XipBXfCGb7G4AjLCu08m9sDnM9R6vOSAzhIiBnnJ1eOobn9WByEbWrDCh7Vuanh9FXS8x1L4oHj6fHnoQcvqC9TExmwLXI7Oelo7qwKwS9PKAQjKHsFZisMbwL5KfyiOnbcCqR+QhvjyNLvHUOqNP+Fh5pCEtldoMZbv4CmitTOgWNwadBCaXRFalt81Ue4gRi4bVyYFJs/Bqxekvb+NiszIHIVV+LG4IF4BjzDH7dY5AYzGYCwpHxIr5g2PVfFH8p7B319A6HNcQBWWecs5IwGYbovveXXqke1hhEcFV/KqW66YsvFjz42aZ0h1Z+JDsLl3zU+LLKqLPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2vnjUX7NyH3DbjYBINpkPH2ES81U8rz/j8m7bfdgKs=;
 b=EJzHrW+ddNMbmnKSkjtu/Pm4F1SjEtDanHsL02ddBlUlO7rp6iThbPbcRmj2J7CB8hVj8xL0nbcYP/XsHjZRll9ah9JSememTje6CFgPzCVu6gJM3d629dCD2jLAei0xGq6HitkB/OUNDQl9Yv3wU/Tl3f8ZQb6gQvPhahBWtsEZOoVg51kSj/aqZaC7KOZkCv33vrIhsmGsxKUaYaSLIz2xQhX/wIcV5nSK+BsUX8N/zgEzp/0jysU/+8zqnOLk6JWeaYd12Dn6BkooHNf+FEx5usaJxHPOvHqhzvK+yodrzQoW5mrjRwsen+bgt8L91tZynRHKKBeCUAUT4rvRAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB6100.namprd11.prod.outlook.com (2603:10b6:208:3d4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 16:34:22 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6455.043; Thu, 15 Jun 2023
 16:34:23 +0000
Date: Thu, 15 Jun 2023 09:34:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [Intel-xe] [RFC PATCH 1/1] drm/xe: Introduce function pointers
 for MMIO functions
Message-ID: <20230615163420.GW5433@mdroper-desk1.amr.corp.intel.com>
References: <20230602142501.6-1-francois.dugast@intel.com>
 <20230602142501.6-2-francois.dugast@intel.com>
 <qcsuilqdccvku4qoa36a5m3mhdr75akwpba77oisjk6e4kvkrm@6u5tr3dfmf5v>
 <ZIdIfdiClQ60fZSI@fdugast-desk.home>
 <20230615000105.GU5433@mdroper-desk1.amr.corp.intel.com>
 <CAFCwf10Td52xyKN9U903-GzS8V_T6sJ8t9ppLiXCNLzHGHzLEQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf10Td52xyKN9U903-GzS8V_T6sJ8t9ppLiXCNLzHGHzLEQ@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::35) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB6100:EE_
X-MS-Office365-Filtering-Correlation-Id: 205e6d6b-f6e4-4300-479d-08db6dbe6032
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ai3hfCsra/dTbaaIkucc92l+8ObnBK0KiP3RbShvNdwLMOkvnvdwSTDqZRxyp6HN7wSh5eJ1IU8B3XeWAB57XsK6qqsb11Ox1EYJ0MpVjQRrx/tbNiKfgZQy/uqbfh3IeT+aGN2JrRtCb6eBa/4YFw61gqqQHOfYcWiYT6LHbzMwTTtkLSM28yCjbji/TrIpeQK3kBSzatrdSdRPPzynThYo+m9QR3Gz34AqUg3OSFNAme2CCsDzCgR1Ja4mhL82qVv1SORRbPRmBg3Qr5z69oREnQW/ovED1X/diSe1SuLL+B9IBv719EL13iXxDquPP2A621dmJ2u3Ut/cu/sAvmK6X8MfU1VfotdxrNUh8f7UaTnR04qB2klY9hjS6XB6hPXtI27xfs0sGwbduIJy+dwoF21hSfS8IS+8bytjvhZjnQguxd/tQ93u/ryvCDN7Vq/krrCe7r28AtIM7p0el8X7uUPxyKY0Xbm6RbunwaGD3TP/wSwJxku7dwxJ+0/bkeW6ieNH53HqPnPU71MaT2CzvZ9eQ3ZrvV34ywpluTc/Y8bG27m2FbwWDUnMgr8w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(186003)(6486002)(478600001)(26005)(53546011)(6506007)(30864003)(1076003)(8676002)(41300700001)(8936002)(6512007)(316002)(5660300002)(4326008)(66946007)(54906003)(82960400001)(33656002)(6916009)(66556008)(86362001)(2906002)(38100700002)(66476007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K21jbnYxdVBzMUwzdm4yZGRjS0djSks4a2xtNDd0TGV2OUd2L0pJWlN4SG9S?=
 =?utf-8?B?S0NTanRtc1d5a09RSzVyNkZYUzNmSkRsMjd5RUNRVXZRTFpVOGpvc1RSbGI3?=
 =?utf-8?B?cy80dFFlaFZOTzByY1dvcWZ0Q2Y1MWg1eFJ6bGx0UCtpNjJlcXoyQXNTd3JX?=
 =?utf-8?B?TlR6ZTJ0aW5JQ1hkRkd0RnFlem9KbzUzTXZUWVp2L056YW5ValN4L0dwL002?=
 =?utf-8?B?TEpoNVdkNmxXZkYvSG9jMXIvSFJ0MzZNRFo2ZTJSOXVXajl4bmxsUlRtblY2?=
 =?utf-8?B?emZRNHBiZ1JWZHU5SDkxK0d2VU1TUGdxYmJ1NWFCRk5CRzh3ZXJsTlNqc0Er?=
 =?utf-8?B?ZXhRNFp1dXptYWVqNGhwVkw2cjhaQ2ZqWmQ3RXFpYjZHVGJoQVdrT0M1VVNF?=
 =?utf-8?B?QjU5bGpBLzJkL2pTWHZJTkdpcUlubUFaM2ZRV0VxbnpKVXlTeEZOZDQrUnRD?=
 =?utf-8?B?K3lYaEwwOGdWWUNUWnlPSzdhcmZjem5oekFQdDBvN3NFY08zU2R5QitZQnZ6?=
 =?utf-8?B?RlFaR0R3b0p2SHdUUUR5MnhGWTNIVm84ZWtLcnNmU3pyaUpVVDJrR2x0MnI1?=
 =?utf-8?B?aHM0RVpkY1NZTVVnVVR3TTl4QW53aG1tM0cya1VQcS9CZlg3a3V0Z051bXpL?=
 =?utf-8?B?SmM2MWVKY0s0TUlWL0k5bHd2c01haHYvd21wNExmRnpjZWpOVVo5cDhLUCtW?=
 =?utf-8?B?K2JkQ29zTWI1d1plOEVINVJzM3hCMWt5WXRKU1JYZ1UwMnBuMjBNQjJtT1JK?=
 =?utf-8?B?OVNIVjhPTVQweW51NDYwV3JRSkg4Ni9rNktkcmRMQXgxQUd4OS9RUzFkV1Rk?=
 =?utf-8?B?N25wVWdTMTZ0WEpid3RPM2QweHdLdW90Z2VhSjBoYlFCeFJWSXc0eE9LMjJO?=
 =?utf-8?B?THd6Vks5VUIzSTFBeUVySXlRang0a1kzUTZMZVNLQm9oS0pKaUsvNU85ZHZp?=
 =?utf-8?B?VHpreXFlZXh4U0lHL0pUd3ZiL24vSllzYmhoaWcyL0NMRUovSmVMSFJpaXVz?=
 =?utf-8?B?S0FDTkRXaTE4MU5QbklhY3htcDMyYzRTVXpxeDB0TVovOEoxa2NseVU3S29n?=
 =?utf-8?B?cGtZNnJFL2JuTnpIQXh6ZWtqMERTOFVOaFVObURneVNvWkdVREpHU0xYdktw?=
 =?utf-8?B?enZRQTB1SEgzT1g2cU9neXJBM2c0OHdROCt6TStweDFMRFJtaHI4b3JtdUtJ?=
 =?utf-8?B?bElXMHppcld3MllEUGsvWHRpeUVQQndYQSt1TlVyS21TT2FHTGVwd2svaVE4?=
 =?utf-8?B?MGkxUXRHckNVOGdMc1QvQUMrbjY2SFpoL3NhUVdSN1dvY0dOMlV1QXBOY2ZY?=
 =?utf-8?B?N1lpZEFpZkFuU0RKUFdtYitrRTU3WUE0SUp0TzdiUWorWG9YUGdZU2IwbW9B?=
 =?utf-8?B?R0dpYVkyWGwvWkY0RjRJVXdhY0JtRjk3eG5vRGhydzVUL0ZpZXFvL0pCdWVO?=
 =?utf-8?B?VkZROXBtZnJyQVZabHVtSFNOMGd1d1BwQ3BOMHIxbXJ4TGZzVW1MUWZ0ZWVq?=
 =?utf-8?B?TzZtYyttakwyR29oODdVbWF1U2NsWmJ3V2Zhand0SzBiN2ZjS0l5QmtCZm9t?=
 =?utf-8?B?dDVaZ1ZSaitLOWdXYWI0MjdRcTNleGovajV0K1BWRC9va3FMK3poZTVRYUV2?=
 =?utf-8?B?UlBXYnZPOFNaRktkbTRFV0VtWVkrZGJpQ2xhQ0lSbmRzN1hiR1RPamhtWW1I?=
 =?utf-8?B?UVlYYlJPSjVXbEdFV0VnNXVhNU4vUlBVMUZwZjJobUpacStzamVLWXRBWmhC?=
 =?utf-8?B?ZkJzRGhHNW9CTEtYTnlRZkU2UzRESzFTU3Z1WHNZcEpocjVSK3VscExoZk0x?=
 =?utf-8?B?N3dvQzhUUWkvNHRkS0JSSUhpcFM4K0RyU2ZEZGtHVERzeUlIbFFMdGRzd0lL?=
 =?utf-8?B?VUFmektEdjZsSVRXMmZUZ05wc21CSGpjaFgyb3pCWmpFS3AwYlRMK2IvbWxH?=
 =?utf-8?B?UUx6OFU2djNLbmRtajgrTjBPZjYyWGQ2U0J4UElMRUFvbGJXWjNTck9TMHBL?=
 =?utf-8?B?cTFSb1RQWEhueGRPQk5sVHJRd3FkRUErL3BYZS9jOVdOdDBJdVdrTTRLOGgy?=
 =?utf-8?B?R21EOENlR2ExU1drQzBoazdVUllTTU05Vm55TTBvZ2k4allhUk9SU2VRMkIv?=
 =?utf-8?B?ME40bTFSRkw1UkZPbDZ2eUJibVozWEZSZGFUZmhXNVJlcVVneE5CWG5mSFdE?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 205e6d6b-f6e4-4300-479d-08db6dbe6032
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 16:34:23.0220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BppuZPTaZR5wXgdzebqJW0lEcVBP0a7cKTayH45b1FHqgbpuVgWqFKlnEMWdX/NVHieIjIwpoDQlDR4ckDhIXccytDl+8P8P9qt73qSK2gI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6100
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
Cc: ofir1.bitton@intel.com, Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 ohadshar@intel.com, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 04:04:18PM +0300, Oded Gabbay wrote:
> On Thu, Jun 15, 2023 at 3:01 AM Matt Roper <matthew.d.roper@intel.com> wrote:
> >
> > On Mon, Jun 12, 2023 at 06:31:57PM +0200, Francois Dugast wrote:
> > > On Thu, Jun 08, 2023 at 10:35:29AM -0700, Lucas De Marchi wrote:
> > > > On Fri, Jun 02, 2023 at 02:25:01PM +0000, Francois Dugast wrote:
> > > > > A local structure of function pointers is used as a minimal hardware
> > > > > abstraction layer to prepare for platform independent MMIO calls.
> > > > >
> > > > > Cc: Oded Gabbay <ogabbay@kernel.org>
> > > > > Cc: Ofir Bitton <ofir1.bitton@intel.com>
> > > > > Cc: Ohad Sharabi <ohadshar@intel.com>
> > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > > ---
> > > > > drivers/gpu/drm/xe/xe_device_types.h |  3 ++
> > > > > drivers/gpu/drm/xe/xe_mmio.c         | 81 ++++++++++++++++++++++++++++
> > > > > drivers/gpu/drm/xe/xe_mmio.h         | 35 ++++++------
> > > > > 3 files changed, 99 insertions(+), 20 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > index 17b6b1cc5adb..3f8fd0d8129b 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > @@ -378,6 +378,9 @@ struct xe_device {
> > > > >   /** @d3cold_allowed: Indicates if d3cold is a valid device state */
> > > > >   bool d3cold_allowed;
> > > > >
> > > > > + /** @mmio_funcs: function pointers for MMIO related functions */
> > > > > + const struct xe_mmio_funcs *mmio_funcs;
> > > > > +
> > > > >   /* private: */
> > > > >
> > > > > #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > index 475b14fe4356..f3d08676a77a 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > @@ -25,6 +25,62 @@
> > > > >
> > > > > #define BAR_SIZE_SHIFT 20
> > > > >
> > > > > +static void xe_mmio_write32_device(struct xe_gt *gt,
> > > > > +                            struct xe_reg reg, u32 val);
> > > > > +static u32 xe_mmio_read32_device(struct xe_gt *gt, struct xe_reg reg);
> > > > > +static void xe_mmio_write64_device(struct xe_gt *gt,
> > > > > +                            struct xe_reg reg, u64 val);
> > > > > +static u64 xe_mmio_read64_device(struct xe_gt *gt, struct xe_reg reg);
> > > > > +
> > > > > +static const struct xe_mmio_funcs xe_mmio_funcs_device = {
> > > > > + .write32 = xe_mmio_write32_device,
> > > > > + .read32 = xe_mmio_read32_device,
> > > > > + .write64 = xe_mmio_write64_device,
> > > > > + .read64 = xe_mmio_read64_device,
> > > > > +};
> > > > > +
> > > > > +static inline void xe_mmio_write32_device(struct xe_gt *gt,
> > > > > +                            struct xe_reg reg, u32 val)
> > > > > +{
> > > > > + struct xe_tile *tile = gt_to_tile(gt);
> > > > > +
> > > > > + if (reg.addr < gt->mmio.adj_limit)
> > > > > +         reg.addr += gt->mmio.adj_offset;
> > > > > +
> > > > > + writel(val, tile->mmio.regs + reg.addr);
> > > > > +}
> > > > > +
> > > > > +static inline u32 xe_mmio_read32_device(struct xe_gt *gt, struct xe_reg reg)
> > > > > +{
> > > > > + struct xe_tile *tile = gt_to_tile(gt);
> > > > > +
> > > > > + if (reg.addr < gt->mmio.adj_limit)
> > > > > +         reg.addr += gt->mmio.adj_offset;
> > > > > +
> > > > > + return readl(tile->mmio.regs + reg.addr);
> > > > > +}
> > > > > +
> > > > > +static inline void xe_mmio_write64_device(struct xe_gt *gt,
> > > > > +                            struct xe_reg reg, u64 val)
> > > > > +{
> > > > > + struct xe_tile *tile = gt_to_tile(gt);
> > > > > +
> > > > > + if (reg.addr < gt->mmio.adj_limit)
> > > > > +         reg.addr += gt->mmio.adj_offset;
> > > > > +
> > > > > + writeq(val, tile->mmio.regs + reg.addr);
> > > > > +}
> > > > > +
> > > > > +static inline u64 xe_mmio_read64_device(struct xe_gt *gt, struct xe_reg reg)
> > > > > +{
> > > > > + struct xe_tile *tile = gt_to_tile(gt);
> > > > > +
> > > > > + if (reg.addr < gt->mmio.adj_limit)
> > > > > +         reg.addr += gt->mmio.adj_offset;
> > > > > +
> > > > > + return readq(tile->mmio.regs + reg.addr);
> > > > > +}
> > > > > +
> > > > > static int xe_set_dma_info(struct xe_device *xe)
> > > > > {
> > > > >   unsigned int mask_size = xe->info.dma_mask_size;
> > > > > @@ -377,6 +433,29 @@ static void mmio_fini(struct drm_device *drm, void *arg)
> > > > >           iounmap(xe->mem.vram.mapping);
> > > > > }
> > > > >
> > > > > +static void xe_mmio_set_funcs(struct xe_device *xe)
> > > > > +{
> > > > > + /* For now all platforms use the set of MMIO functions for a
> > > > > +  * physical device.
> > > > > +  */
> > > >
> > > >
> > > > what is "device" in this context? that seems confusing as we always ever
> > > > just support reading/writing to a real device (physical here may also
> > > > add to the confusion when thinking about SR-IOV and VFs).
> > > > We shouldn't add abstractions that are then never used and all platforms
> > > > end up using the same. Unless it's a preparation for a follow up series
> > > > adding the different handling.
> > >
> > > For now "device" is meant as "in opposition to simulator" but I agree
> > > we can find a better name. Existing platforms all use the same
> > > implementation but this is preparation for platforms that require a
> > > different implementation.
> >
> > I agree with Lucas that this doesn't really seem to be a good candidate
> > for a vtable; every platform uses exactly the same logic and I can't
> > really envision how/why this would need to change for future platforms
> > either, so this seems to just be adding unnecessary complexity.
> > Registers being accessed at some offset into a PCI BAR isn't likely to
> > change going forward.  On future platforms it's more likely that we'd
> > need changes to the part of the code that maps the MMIO BAR rather than
> > the code that reads/writes an offset into a mapping that's already been
> > setup.
> I agree with that for every *real hardware* platform the
> implementation will probably be the same.
> But for simulator/emulation, there is a different implementation.
> And even if we don't upstream that different implementation, doing
> this abstraction will help us upstream the rest of the driver as we
> minimize the differences between upstream and downstream.
> And helping us upstream the driver is a good enough reason imo to add
> this abstraction.

Adding extra abstraction layers to upstream code that provide no
upstream benefit and only come into play for some private, internal-only
workflow is generally frowned upon in the DRM subsystem.  Unless you
have some kind of public, open-source usage model, adding the extra
complexity and clutter here is probably a no-go for upstream.

Also, even if you do have an unusual form of simulation/emulation that
doesn't behave like real hardware, are you going to have several of them
that all work in different manners and need unique implementations?  If
we only ever expect to have two code paths total (and only one of those
upstream), then using a vtable seems like overkill.  A very simple

        if (special case)
                return alternate_implementation();

would be much easier to understand and maintain.


There are lots of other places in the Xe driver that _would_ benefit
from per-platform vtables; we should prioritize making changes like this
in the areas where they provide a clear benefit.


Matt

> 
> 
> Oded
> >
> > >
> > > >
> > > > +Matt as there is still (at least) one refactor planned in this area,
> > > > since gt is not always the proper target for the MMIOs. He was saying in
> > > > his earlier series about having a mmio_view or such to abstract the
> > > > offset and other differences between each IO range. Not sure if this
> > > > series would go the rigth direction, maybe we need to think in both
> > > > cases together.
> > >
> > > Matt, would this series block the refactor mentioned by Lucas?
> > >
> > > In general, are there objections to introducing functions pointers for
> > > MMIO functions (extended to all of them, as suggested by Ohad)?
> >
> > It probably makes more sense to do vtable conversion on other parts of
> > the driver where we already have different implementations per platform
> > and where we already know that design makes sense.  We can always come
> > back and do this to the MMIO functions later once there are actually
> > multiple implementations, but it doesn't seem to serve any purpose right
> > now.
> >
> >
> > Matt
> >
> > >
> > > Thanks,
> > > Francois
> > >
> > > >
> > > >
> > > > Lucas De Marchi
> > > >
> > > > > + switch (xe->info.platform) {
> > > > > + case XE_TIGERLAKE:
> > > > > + case XE_ROCKETLAKE:
> > > > > + case XE_ALDERLAKE_S:
> > > > > + case XE_ALDERLAKE_P:
> > > > > + case XE_ALDERLAKE_N:
> > > > > + case XE_DG1:
> > > > > + case XE_DG2:
> > > > > + case XE_PVC:
> > > > > + case XE_METEORLAKE:
> > > > > +         xe->mmio_funcs = &xe_mmio_funcs_device;
> > > > > +         break;
> > > > > + default:
> > > > > +         DRM_ERROR("Unsupported platform\n");
> > > > > +         break;
> > > > > + }
> > > > > +}
> > > > > +
> > > > > int xe_mmio_init(struct xe_device *xe)
> > > > > {
> > > > >   struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > > > > @@ -384,6 +463,8 @@ int xe_mmio_init(struct xe_device *xe)
> > > > >   const int mmio_bar = 0;
> > > > >   int err;
> > > > >
> > > > > + xe_mmio_set_funcs(xe);
> > > > > +
> > > > >   /*
> > > > >    * Map the first 16MB of th BAR, which includes the registers (0-4MB),
> > > > >    * reserved space (4MB-8MB), and GGTT (8MB-16MB) for a single tile.
> > > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> > > > > index 3c547d78afba..80ce9de7aac4 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > > > > @@ -19,6 +19,13 @@ struct xe_device;
> > > > >
> > > > > #define GEN12_LMEM_BAR            2
> > > > >
> > > > > +struct xe_mmio_funcs {
> > > > > + u32 (*read32)(struct xe_gt *gt, struct xe_reg reg);
> > > > > + u64 (*read64)(struct xe_gt *gt, struct xe_reg reg);
> > > > > + void (*write32)(struct xe_gt *gt, struct xe_reg reg, u32 val);
> > > > > + void (*write64)(struct xe_gt *gt, struct xe_reg reg, u64 val);
> > > > > +};
> > > > > +
> > > > > int xe_mmio_init(struct xe_device *xe);
> > > > >
> > > > > static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > > > > @@ -34,22 +41,16 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > > > > static inline void xe_mmio_write32(struct xe_gt *gt,
> > > > >                              struct xe_reg reg, u32 val)
> > > > > {
> > > > > - struct xe_tile *tile = gt_to_tile(gt);
> > > > > -
> > > > > - if (reg.addr < gt->mmio.adj_limit)
> > > > > -         reg.addr += gt->mmio.adj_offset;
> > > > > + struct xe_device *xe = gt_to_xe(gt);
> > > > >
> > > > > - writel(val, tile->mmio.regs + reg.addr);
> > > > > + xe->mmio_funcs->write32(gt, reg, val);
> > > > > }
> > > > >
> > > > > static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> > > > > {
> > > > > - struct xe_tile *tile = gt_to_tile(gt);
> > > > > -
> > > > > - if (reg.addr < gt->mmio.adj_limit)
> > > > > -         reg.addr += gt->mmio.adj_offset;
> > > > > + struct xe_device *xe = gt_to_xe(gt);
> > > > >
> > > > > - return readl(tile->mmio.regs + reg.addr);
> > > > > + return xe->mmio_funcs->read32(gt, reg);
> > > > > }
> > > > >
> > > > > static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> > > > > @@ -67,22 +68,16 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> > > > > static inline void xe_mmio_write64(struct xe_gt *gt,
> > > > >                              struct xe_reg reg, u64 val)
> > > > > {
> > > > > - struct xe_tile *tile = gt_to_tile(gt);
> > > > > -
> > > > > - if (reg.addr < gt->mmio.adj_limit)
> > > > > -         reg.addr += gt->mmio.adj_offset;
> > > > > + struct xe_device *xe = gt_to_xe(gt);
> > > > >
> > > > > - writeq(val, tile->mmio.regs + reg.addr);
> > > > > + xe->mmio_funcs->write64(gt, reg, val);
> > > > > }
> > > > >
> > > > > static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> > > > > {
> > > > > - struct xe_tile *tile = gt_to_tile(gt);
> > > > > -
> > > > > - if (reg.addr < gt->mmio.adj_limit)
> > > > > -         reg.addr += gt->mmio.adj_offset;
> > > > > + struct xe_device *xe = gt_to_xe(gt);
> > > > >
> > > > > - return readq(tile->mmio.regs + reg.addr);
> > > > > + return xe->mmio_funcs->read64(gt, reg);
> > > > > }
> > > > >
> > > > > static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
> > > > > --
> > > > > 2.34.1
> > > > >
> >
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
