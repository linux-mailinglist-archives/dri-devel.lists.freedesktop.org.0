Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F4AB28822
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 00:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470D610E9BE;
	Fri, 15 Aug 2025 22:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0p0xhC9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651C510E9D6;
 Fri, 15 Aug 2025 22:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755295343; x=1786831343;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FXQ+NzzpkNkDoFCYIqa5FfFecbBy24E9228mRK08muI=;
 b=a0p0xhC9VWCJS9TVOoWsgUsxdHfk8O/tqwHTWNN14EHz9Na7f+CZTzJN
 ychaDr9vPd14FKwwpUrl1qn9fZItmHI2uox1xhnOwjX7Q8HrGZ55FderG
 etFRbKDR9qETjGJv+Sx+eU3aHk4kuMVgcaJjpbeRFcME5D52Gs0EaGGkk
 OH9C6/JfR/yv5KgcZlJC9jIsT7dbhxRdRadE6Mve+BM6nCiZW7jhLPm18
 ADVwfH2Hry45FaIZtUzgkL9sZxOgWSPZUzmBQeZ8sbiKDMtgjvJX8q6Yf
 kKlH7iKQ6486uNQMiblpmsY/1yY/cgajhLY2i5W+AFA13Z83Z/te29o++ Q==;
X-CSE-ConnectionGUID: gpX8dCLsRc++LfgGBv4HjQ==
X-CSE-MsgGUID: BjY5Pp3fSOaHq9VYTZr6Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="61431634"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="61431634"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 15:02:22 -0700
X-CSE-ConnectionGUID: DpPDi1A+Svu/JhtwVd4wuw==
X-CSE-MsgGUID: iu4B7mxaRiWqXISDB8Vj1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167487595"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 15:02:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 15:02:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 15:02:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.59)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 15:01:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4LC2En3cVwv0uubD849gsS5YDwvt+9T+NT+BCYEU8+vQZ1ecprcvGgkuat5Q2XAlKgzp/sDZROlYuWHn6IcfftGqrT7V8P6sDbHy6DGZ5V/sdPwjUtpKeaQ3JD4p7uRfjyRLsCV2sjNTHaEpgVHt2b0CDQdybUIaATRxBFBputuqA1f5rM1nZvOtnsUHXZK//aWQ84fexTqPnq54ajBOxv01LsgebjXGpADMDUte5TpFbk6DCxrb1uhvpzqqhisfyw3PIlt/SaLIjyGa9SyPsq4ifaauQSCk90n+/5Kjks/7NnLnQ7zQGd8BzVpSz9Fa13eemp3u/b9dpdLsECvzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ky166xEmSx+ocnbAr41es9W4dw0Z+CrZApymtHikXRM=;
 b=f7HSg4DjzzIVmlOvXgl1rWWK7kiaduE7Uvp1XBsFfD4m8d0La0ntNitNC7cmzU1sUGR3ZMZR1kXrYdfO7jEm64mXN4JMq+SjQjhwTcSIovBVZqbIinNRIElStHRGxp9KBZob39he+pupDP4sRWnPd+ggcuPbuPqnl2x1eAs6B4vgCeFSGz5ippxJw4kpqjbgcmy6v9nVGln3m8ZuRTD8A+aeHok2BacnAPRvdtpdt7laDs0WSYEJzdzEJmuZ2MbeiEnPM+vp7Pp1uPJxgUYaEIjBLCi4Gi/seW/wV95zKkaHr7FqaJZBDviH35RgpwO/mqZNc824ZA1vxXwLghrYdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by BL3PR11MB6316.namprd11.prod.outlook.com (2603:10b6:208:3b3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 22:01:48 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%6]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 22:01:48 +0000
Date: Fri, 15 Aug 2025 18:01:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, <Ruhl@freedesktop.org>, Michael J
 <michael.j.ruhl@intel.com>, Riana Tauro <riana.tauro@intel.com>, Anshuman
 Gupta <anshuman.gupta@intel.com>
Subject: Re: [RFC v5 5/5] drm/xe/RAS: send multicast event on occurrence of
 an error
Message-ID: <aJ-uRzbCxXmiQhlH@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
 <20250730064956.1385855-6-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730064956.1385855-6-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0062.namprd11.prod.outlook.com
 (2603:10b6:a03:80::39) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|BL3PR11MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e47b4c7-4ddb-4826-d796-08dddc4754bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8FhCQGgm/bSAwfLclUxbYa4qHI+vooLBgPdqtKisMGrwcuHegwvyM3cApQ?=
 =?iso-8859-1?Q?iZDnYiHZhOSbSvw0326cZxpM53z6UUZdJTA2DO43VllhGS8VWXXW0sYZ75?=
 =?iso-8859-1?Q?c662SLenU/PA3OEj4aYED4YaOhchP3AbRhWv15vj73j/3IV2kJumeRalkW?=
 =?iso-8859-1?Q?sYbbc0KTwJthoazrfNXzbkmVTXIZK5wRSTua7PdVnNdsZD3s7NTO42Kbe0?=
 =?iso-8859-1?Q?ZuG6FdfUWkr3f77afFFgMd2iCMlCI00W8DwrIaJMO1JHoKRdZ2i6kgcIMg?=
 =?iso-8859-1?Q?LmMdBEUgsjHKGKMgYz0TFGoepD8lPlXrhXqBurGd43vFJTvgANbA45cHp2?=
 =?iso-8859-1?Q?1+Y81UFUybOmci23Sb7s2K/qpqRg8GAaksMlbPfpR6LT/pXKfCUTk2dlzg?=
 =?iso-8859-1?Q?dU/DKtM35BzkQFx3U43EeUal8MJp6hfbNSTrUblL72QmingVe9nipMCdbK?=
 =?iso-8859-1?Q?MWnWa+IdXyYVh+0EBVF24eRUq9nRlZHo5VcGJELR7BnhD27/xNodtRmXdF?=
 =?iso-8859-1?Q?dNg3hXra4tkkV4aZlqQFYfiaPfiAWiP4bSBUDz+uAJLoLKVqvSTegUtZCS?=
 =?iso-8859-1?Q?PbegHNfIObIlaPhZSxNE+b7Van1uwJgbgDkh/XpBmP1lMqvu3Op6Y/VsHs?=
 =?iso-8859-1?Q?hRrj3sy526N8CxBT/35q2nQygeu+EMMCAjnMTNBQZdYnibFO9ZTj5jvVL4?=
 =?iso-8859-1?Q?Zm02OhIqzsP4cAWSJOo0EIC7rOAVvhUMnMNZaU9AAFD1gqfGNJSoHWFOOc?=
 =?iso-8859-1?Q?C3lOqgN2pmDvb5Wj8U/i0WDKROl1HU+kNFgCYnQ8xIjDG6iktoIIoDBXkI?=
 =?iso-8859-1?Q?VEMbKTtXqjg3pdCF3A4Ot8pHp/14cYdLjL4UMN6WBQ7FedOapjP1MqC+ID?=
 =?iso-8859-1?Q?bWGpMlZdfQmO8lNQKFt6hypGJoB05Q49FYzZAz/JOyJdwpwpDe1LDuxEjI?=
 =?iso-8859-1?Q?KNgf60WHXLdFO2Wy6cCakTKHIa1KroFHQTAH3TVJvzhUYxrNhSSFM1USMD?=
 =?iso-8859-1?Q?TMSs1CsL7kTWX0hbw6OBnOMrPqcP208gBUCf3+Rw5JYrTGu1s8hmOXS6lM?=
 =?iso-8859-1?Q?sH0KVymEgirmX3stWyN33+oYv4b2WTIhUuDW8MBXxAmkJXxrMDZni4ip39?=
 =?iso-8859-1?Q?1JSpC97l214z6pG1czXxnS+9w+msTJLbX/7AkNUB69g2PxZGCZ2hDEOdkJ?=
 =?iso-8859-1?Q?IkNE4L00NIvCGtbG0zM3YkAKNS6J3dsOW7cmz5db9olRN+eVcAZAttmi4F?=
 =?iso-8859-1?Q?rB+GP+dZA8PcocZV7JafclbpntAX3A1m6RM6lz1D635me+en/ENdtXyMy5?=
 =?iso-8859-1?Q?JnbKBQr9zh3k+4yj1zyBZY73pVulQNRBT7IagMcUwoWRHX7O8iZX5rAnMB?=
 =?iso-8859-1?Q?gPE+2wTXP0RapxLwB1R6PMI1wy7WH4y69zSh0U/u2ge4s85IbpgZrx8VVM?=
 =?iso-8859-1?Q?30LBLDhtu+esQWC/77ouj6+Zy88lYlV9RrMB29Bx4jF1fLSR3UZjQzwh78?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Rb1zhzaIqhGY3C6H4Je62+iLt3p7DhKFz4v6ZfEEnPHrJrfbB44v4Zk6Ca?=
 =?iso-8859-1?Q?2TnghPx9IBKteHxJinVq2tC3tywGYxzeML346ZrttmrYXtEYPXib4GL1j0?=
 =?iso-8859-1?Q?Z2dYCQ4sA6K9Lo/e0nGG5oiQfzizCrRIy1iqwTeiVRaSwIwWCP0WFyJBwx?=
 =?iso-8859-1?Q?WNg1djIKUAnPPHdAx5aSUodsNGBcvEgK/1FujVrBNkKI/wkEbrYi/2D+MI?=
 =?iso-8859-1?Q?s8rXdYmdwndzlnai/LsuSPeZRbqYnbSOCJD7HoT86R5mG/+KVQ6YFLZGyo?=
 =?iso-8859-1?Q?EAQHY3eLtT5wZ/cx0YNK2R+Iy/mqCqQTlZk9RnLx64plAc8e/TLwLdk4xI?=
 =?iso-8859-1?Q?+Rys303AHQKfRtLsq+nWwUafcMvbTYKbgPKgzcAT8UQ2YRqu7B7J7ySF/T?=
 =?iso-8859-1?Q?efy41lubVTNxG/VdAcdnKkGdNOzzg+EW1GYs4BT2hVeZR5apSVKVimkZw+?=
 =?iso-8859-1?Q?tJJPCqUfRWQ0WuBolV0pAPGnAuUmw/ScZnv88ggMJrvqbV6l8Aptzl6O1w?=
 =?iso-8859-1?Q?k8b3qh7DKLyqIgJ5mmUbmx7NVuIHC6QmBoYMy5Jj1NNVzYLfkoNWLKM5NN?=
 =?iso-8859-1?Q?sLspsw1ErMJFzihgBzavDd/dxkWR0jokQW0Fjcf10BfZ7yg4mVeS93zBc+?=
 =?iso-8859-1?Q?Zzs8yKIANxXhWsxtobbo0uiw1sRIQ6SV2K9MHmPuEK5BfbDlR07xxEpZF3?=
 =?iso-8859-1?Q?cI3Ipwab0sLw6nsX14lvqidHhCzzFTrMeNL/GOQPGazhksVVqvk6En/wxO?=
 =?iso-8859-1?Q?hK7bdjysXvTVcQN/sC3Pl4FAj7w4nbfI4M4iEJFuYi2yQHo4t4m3SsSMs5?=
 =?iso-8859-1?Q?HLwyfmqZfiYbFowj2olDnP4UEnKawrEiiW/aC5N/4w0c6+USt67AjMXtlI?=
 =?iso-8859-1?Q?5gmVZZOVyroe/9d2ojGDpV23PO1ET36Q3EnfWGeTC0+hh0q6p3xxBrf8fc?=
 =?iso-8859-1?Q?i4ltK/3XfqcdcZY3VJkzf8A3ALn8HF7H7ZqQjWbRyRhmOn+GDWZsdHSrSW?=
 =?iso-8859-1?Q?jIRndgyQU1muFdTl9KDwk149Q0oHgC0csOszwmmJ8C+E/1i0PVjDB0iOol?=
 =?iso-8859-1?Q?ifSsSVN4nj9d4wY15s20faXANNcpUgwZDppOU6C0PzLtAW0SkufRY/+dIJ?=
 =?iso-8859-1?Q?k0/CxLeHBagllmyFWs4UUhBoVT2+b6i5MtGbbVH9jB4funC3NYPhPVHKGL?=
 =?iso-8859-1?Q?J0nY3fA6X2PXLcqLYoS3mwbezwXlHv4MQXHZcJiHkgQ7TaKXRl7eawpx9O?=
 =?iso-8859-1?Q?wJyPE9BfPe2Iad6JLHqk6OK057G8QrZhhOHMSVRLq0QrFqV28Ar9XkVciV?=
 =?iso-8859-1?Q?dUFxRkkAURcyEcBx7MmfE5IZthMZiv53Ub2QEus1jOnvR5jjZvXOynwKOI?=
 =?iso-8859-1?Q?g82dFkIzemUGigeI8mSz/IPvMIGTiV+khb6sSYkUjWBDUN/dgliAmPUSQq?=
 =?iso-8859-1?Q?G1/FzUcusYJzukMwjUGkxl8962xeWB3v2ymT/sHBck5850e1HP8PFaEIif?=
 =?iso-8859-1?Q?johnU9m5L35+aWPRyZCdG7UAtGQcvUP53zNlKdx0gelMcH914PICMUOVYE?=
 =?iso-8859-1?Q?/eFn8Z7PaYJtGeWkBQPQ3+11MBrSNN8NKKtGOpuhnwHHEu11Yw7oi4lPco?=
 =?iso-8859-1?Q?NbNHFXyJrZuPQ1Y5zWbNJTouohmoLpF1uV0tpLX51mrDwGq0pLIvRRlA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e47b4c7-4ddb-4826-d796-08dddc4754bf
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 22:01:48.1411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0b67l5MjZoV8rIihZx74SdO0hjvMQ43qKTwSS56yrezyC/0kBauYdxjH3wiPaNGDMpc4CmM1eP44tzzGlWrzDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6316
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

On Wed, Jul 30, 2025 at 12:19:56PM +0530, Aravind Iddamsetty wrote:
> Whenever a correctable or an uncorrectable error happens an event is sent
> to the corresponding listeners of these groups.
> 
> v2: Rebase
> v3: protect with CONFIG_NET define.
> 
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com> #v2
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_error.c | 41 ++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index bdd9c88674b2..e6e2e6250b70 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -2,6 +2,8 @@
>  /*
>   * Copyright © 2023 Intel Corporation
>   */
> +#include <net/genetlink.h>
> +#include <uapi/drm/drm_netlink.h>
>  
>  #include "xe_gt_printk.h"
>  #include "xe_hw_error.h"
> @@ -776,6 +778,43 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>  				(HARDWARE_ERROR_MAX << 1) + 1);
>  }
>  
> +#ifdef CONFIG_NET
> +static void
> +generate_netlink_event(struct xe_device *xe, const enum hardware_error hw_err)
> +{
> +	struct sk_buff *msg;
> +	void *hdr;
> +
> +	if (!xe->drm.drm_genl_family)
> +		return;
> +
> +	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
> +	if (!msg) {
> +		drm_dbg_driver(&xe->drm, "couldn't allocate memory for error multicast event\n");
> +		return;
> +	}
> +
> +	hdr = genlmsg_put(msg, 0, 0, xe->drm.drm_genl_family, 0, DRM_RAS_CMD_ERROR_EVENT);

this is something that could be wrapped up in the drm_ras

> +	if (!hdr) {
> +		drm_dbg_driver(&xe->drm, "mutlicast msg buffer is small\n");
> +		nlmsg_free(msg);
> +		return;
> +	}
> +
> +	genlmsg_end(msg, hdr);
> +
> +	genlmsg_multicast(xe->drm.drm_genl_family, msg, 0,
> +			  hw_err ?
> +			  DRM_GENL_MCAST_UNCORR_ERR
> +			  : DRM_GENL_MCAST_CORR_ERR,
> +			  GFP_ATOMIC);
> +}
> +#else
> +static void
> +generate_netlink_event(struct xe_device *xe, const enum hardware_error hw_err)
> +{}
> +#endif
> +
>  static void
>  xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>  {
> @@ -837,6 +876,8 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
>  	}
>  
>  	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
> +
> +	generate_netlink_event(tile_to_xe(tile), hw_err);
>  unlock:
>  	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
>  }
> -- 
> 2.25.1
> 
