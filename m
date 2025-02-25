Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC93A44363
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A876E10E6FC;
	Tue, 25 Feb 2025 14:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="beqgiiok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A00210E6FC;
 Tue, 25 Feb 2025 14:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740494889; x=1772030889;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3C16IUqZvgdCKgF7zKqjQK2j1dXFFLwrycM9Fudbcv0=;
 b=beqgiiok/Jr0iyFqHTPS9oM/wClgnQjOgFS19GI7rBEucfe3vzar0vu7
 S15lVECMRfS2dQvx7pjaniuRkYBXYrdHhwNVjQhLVBHlWYG6xIomG0sAk
 mXwUrblNXL60G3oFRuDuJWIHDQnUroLlkUs4KuvP46g3e8zI6ambBDhGL
 Yts8xySDVF5Kj/J0dUP+oDy50jbZTltS3QhuThvRyKSmkIrBLF98pRVTf
 7cILSTEJWRZAxNLRTVEwCKrWSTHKD77AMtGgOyMiaraTCHrMP+v2OlpIy
 tjbqnQlHfMwVu1Ldhg5zyPCKKCc5n3hqJ5Z9m75q6tHiVuWhyLKeNUeXD Q==;
X-CSE-ConnectionGUID: UsFCtOjOSpCStrTGMRoZ/A==
X-CSE-MsgGUID: vv1NfDreRo2UMUz/hgHEfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="51934372"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="51934372"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 06:48:08 -0800
X-CSE-ConnectionGUID: M6d9j4+fSmmtj25w839i6A==
X-CSE-MsgGUID: gx2ANxltTIS1MOkOKf9TkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120517944"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 06:48:08 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 06:48:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Feb 2025 06:48:07 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 06:48:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKvOAe1RCeQ8Wbd7FlP2XzA8w1HY4sujG9QVFBLv0T+HZDwsmOdQqwAgNOtdvvQg6hnU1EK4MckaJKWbBWZdwjboGw2XNw+KoCt9I4IpkCAKgS00QL/d7DSPBjphvKtX4CAGpIj4T/8FBNzAOelpsGjvGFt8RiO8isUern/9NcP75zvhpwNZ03sse2gpduOemJlM2fEzvQh3HXVKSKyO7EQnVh9qe8tBNl6YeB8W4ZIuuP20MiPYvlxfnWYwUcSjvxd5utLp7TVHlmAN+/C6C/SL2ht4tSbCfzJbvA/XxiDStUMgDprcvr0x+uA9nW+b8Ki3pH2tEzmKXszethlk0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIUaz9gbP0Cj0B3e3YReDZ+pp8s2JU/DDvrnsayRk/U=;
 b=qbcbi0Xj9ehizdYb/ZKxtiqLlySx5ALCAOk/7ZqZJSyDGY8ToVzvSPtlI2E+JYlPNuk3hUAWWa8vj7E1hz2g7gKil+H5pGz4DznEpMFWHuj8lnLtb7SOIzi3Nbne9COtAkdtqV6b3/QSI+fC6cQWUYzBhXnJauXOsttYrWBbTo9cykMrhlRGWqRogDFFS+J/D1Unr9RU/OvhM8vG6xbdE2WWvx99PaecEsm92zFqbKOQ51Q72B8n+pQfr/vW/YibdG1wdPsL5WJoAR7G7ElfGl/llNwVv2J5rb7w41emCL7N36982Novacp09lsTNysGRk5jQzEZ48FoLWagb8YN9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7512.namprd11.prod.outlook.com (2603:10b6:806:345::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 14:48:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 14:48:05 +0000
Date: Tue, 25 Feb 2025 08:48:02 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH V9] drm/xe/uapi: Use hint for guc to set GT frequency
Message-ID: <petwt7bcigkh2rtqwdq6urdtrv5tdeyccqgfmqekto3y62prkl@b4ojplpk6qmv>
References: <20250212113830.9027-1-tejas.upadhyay@intel.com>
 <zi3xuzjcih4ok6ce6znqzx4azkorwkvxyt6n45wzadzwaiialg@7fsjvbfkmdby>
 <xow55bqw5z2p33fq7z2pj75fhuogweynco2j76ku4skre6axoj@t7blqywfmsqb>
 <SJ1PR11MB62042F65378253D198C6642881C32@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ1PR11MB62042F65378253D198C6642881C32@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0237.namprd04.prod.outlook.com
 (2603:10b6:303:87::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 2429b7c4-09a7-482f-39db-08dd55ab6928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTd1YU5ZUy9Vd3I3SlZEU0FoWHcwSDJUMmJ6cUNzYjJPTXpwV1k2aVkxSmdR?=
 =?utf-8?B?VUgzVGIxcXpTNHBCcmpCUFhlcmZ1RmE0K0twZnp1TVBITnlRK1h4VDRTODJC?=
 =?utf-8?B?ZnVQWmtKVUE2blNlcis0ZGFtL3JFekpXVmhRWHZDWlQwSHBMeUJmeURFZFBk?=
 =?utf-8?B?TTRHS3dNK244V2N2MWJCVHVUZklHZnFGci80RkZ4U3QvZkgyZ2tRazBoT1Nk?=
 =?utf-8?B?NjdCMkdRL1hyUVdSRjlTdkpUWUh1VXhXbzJpc1I3OVlLQkJjaTBwOS9HVlY4?=
 =?utf-8?B?VThTZXRENWF5RVdaYk5iQ2VYMEV5OUM2SHRRdGxGVi9POXozK0NlS3FBMisw?=
 =?utf-8?B?d3NJNWdVUS8wRWdpaFpqbWFCY05LQXloaDEyQWp6NVdVajB1b2ppbW13cFQ3?=
 =?utf-8?B?eDZROERiZDFMaTVMdmNRWjk5WUs2ZWpNY3lWMEFoMmNGYVpFclllTFB1Wm5E?=
 =?utf-8?B?VUpPZDQ2VzFTVXFnMk1JNitObVpZaHpTbENrRGRRcGVCcjlCNCt0UThZM3dN?=
 =?utf-8?B?RHFCV1hJVFV3YXF1TWtqUFZSeUd4SFE0MkxFRm1qT0Jsanh6c2liei9kQkdo?=
 =?utf-8?B?cU5zNWxVTTBJWm9STWg3YW1IUGtLQ2g2T0NvZ0RzQ3dCeVY1cmFpd1praUZO?=
 =?utf-8?B?NTlzZGxkQWhDU2xPT2Z2TjNYL2tZbWFQVnJoZDV5VWR2Q2xZTTYvVGdEMTlu?=
 =?utf-8?B?QWFRWkVQUDgreXlsQS9xQnZ4S0ZwT3dLUmYyNThpTGFqRzI4c0hrcTdqSmF5?=
 =?utf-8?B?OS94YzJSWVhhVWVKV1RXbk9hOHVXN2ZnYkgvRy9URktHYlFVS0N2bWpvUDYr?=
 =?utf-8?B?T3hCbFliOUdzN0ljcHhHR2hnRFVmS1drTzgyTmRpTXlnajFPcWVGeWNqK1Nt?=
 =?utf-8?B?cDNaMlhzcHlYYk1iLzZkaTFaTUtZYnhCeFZVRlJiYVF1SjNWMjJuN25jM3dn?=
 =?utf-8?B?NkZQR1Q4SkpBbFVhR2cxSWV0cTVVaC9tRUg2N01kZmpnOENMZnlqSjhWRTc5?=
 =?utf-8?B?aFhWSUdTU1h5bHh0N3ZRN3J5K2pTMUZCb21zZGcvbGFQUVFvcC9oblpRQ09s?=
 =?utf-8?B?YVpnVXd1cWhjT1VqUzVlWGJqcTVXSElkdjNSeDdpci9ZQ0kwTlZKU0lKL2V1?=
 =?utf-8?B?TTVmRUtzVmdvaXYxWGlPTEREaDRrazJwbnhDdXVSazQxM3lLcTgyL1UralI0?=
 =?utf-8?B?RnVsREd0Wm82Rm1ydFFjZVd5NmRCdmdlS3pxSnVqMCtHS0xpUXBabWNPOTFm?=
 =?utf-8?B?ZWh3bkw0THdjVHYxQUptZ0lyQjVEYm03SjBUTXY4TnpmNnlBVjJqTEtzZkFG?=
 =?utf-8?B?UXpkbWlFYmR1MVVEK2Z1eVl1WDFpTVFGbTJ1NmswZ2NOdjBCS1hqRmZLYmdp?=
 =?utf-8?B?ckk5TjZQYzZUL0JmeEpweTZ3NnZIeHR1UFYzREVIbndzM05zVFdnMkYrVmdh?=
 =?utf-8?B?Qm5yYm1WNDA3dFZFN09IWUNLVmdwbC9RbDFuNlg2ZTJLdnF0bTJVTWFZMnNH?=
 =?utf-8?B?K0htY2JqR3U1R1hITENvQVc2Z3lqK1ZSSGFReHRzUTdxRnJBTzV5Z2MrdHBQ?=
 =?utf-8?B?MzR4b0pUV3NncmtNZWVPMklkaTY5MnRZNVhtekZtc3pxZXpXOTNvOXY1RXNB?=
 =?utf-8?B?YzlJZ1N3NS92eUpDZ05iQXo5Q3NheTU3R2lIdkswL25EcWp2eFdHRU9KMTBr?=
 =?utf-8?B?N3JxYXprRnIyaHVmWnEyOUZLS0VtT0puZmJGWTZwNGpUTUVBL3dvVzJ3QjAv?=
 =?utf-8?B?a2U3dEk2R0E5Rit3S1dtRjhxUU5aT0tQaG5saXMwRVNpdVRqd1lPdXRraHVp?=
 =?utf-8?B?eFNoU3hyR2dlUE1xby9nZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEFGTHpKUkRkSlFzcGFzZlVHQkd1T3hOL1ZvcHRYRUw1eVdPMnRhck1WQUhI?=
 =?utf-8?B?Snk3R2R2WDB6RnAzM3Q4Uk1HYk1OWXA0WllBUlU3Unoxd21mQTJwUHh1ZlB4?=
 =?utf-8?B?c1VYZHN2aVRDZ2J4Ujl1M01sejdzcXZ5enU3OFNYdW16VkRxVERESWJ0b1V3?=
 =?utf-8?B?a1J5UGlSb0E2WDR4Qk5CQzdBdmFQUERqV0wxS3lPNDJTeDJ3azN5LzNZeHNK?=
 =?utf-8?B?NjI1TGtxV3RUby9zZWNRclBpcm92ekpGb1N2NG9LOElFSG1xYzZaT1pFOHNz?=
 =?utf-8?B?ZGlDckVhN05kMzdaUy8vYW5EbzRFdTI5UGRaNitpN1paL1d4SVVvTVZHSkhB?=
 =?utf-8?B?NWJjUy91STRNeDVpcmU5Z25YYTlIUDJlL1VCTWRTQm9DM1lQcVFKY01FUlVY?=
 =?utf-8?B?TWhUalQxNEJPRERqRHU4QlJrcVhoZm45NzVaZFVLQzZoUmFxM3pENlpxYU93?=
 =?utf-8?B?WFVWSlpvY3g2L0NKUzdaOHlQRWdGRHo2YkhPcUJ1dm9QQThDUFNJUWtYWjND?=
 =?utf-8?B?b2NwNHQ5VDlqNEhLSkwrRkgrSVloMUwyWGl1VDhTNkxoQmpxWHJjcFhiTEhz?=
 =?utf-8?B?Ti91UGFoMitFOUpYM3ozek9FNW9nc1RwRVBVZmV6enM5M0VocGZsSjNUQ0V6?=
 =?utf-8?B?M1BLUVpHb1N2NWkxS0k2cS9ncHc2S3V6Qy9qdUllOGE5UHlEWHQxYVJISWN5?=
 =?utf-8?B?ZDFIZy9uOXVuZVVUb2gzcjRrN0pkMHlUNXNybDAvRlN5WlFHbXZzcUV5MHo1?=
 =?utf-8?B?ZzNFaTNvUG8yNE9sMTlpRWlRR0FiRytqalUwUG9mYVN1VjZxNkZVUlg4ckNF?=
 =?utf-8?B?Z25SckdZTHd1ODNrRkFoRFRzenI5cTlxbUpLcWpJWkx3bTB6cGc1aHRFZnBU?=
 =?utf-8?B?cGlVbEw3czRMajJ3Q3VSbnE3OE9HVlVicFJDSXB6S2tpUUozYTNEbFREWjhC?=
 =?utf-8?B?a2d4UGxMNWFwY1p5N3YwUjJVcGZkZTh5VzROdkJPeFg2S29sQnprZGJPRHR4?=
 =?utf-8?B?Wk9hMHZtVndZdW81WG1SVlFWTHFrcFRNTnBQY01pZUdOVXRuMkpuak4wemps?=
 =?utf-8?B?MWNFYkJvUkRjeTJkN1kxRGlJbWJDazNyd29wN0RMNWQ0VkVUUzduZjN0RFhZ?=
 =?utf-8?B?d3N2c0IzN2cwaHREUzZSSHBKaC9ObnRrV21jV3NHNUxxNWZ6ZzhaeUFQY21M?=
 =?utf-8?B?NmNlU2tqMVV0L1NsZHBDQTFzQjlXbFNvN24vUzdmbXJxSHpjdTRWSC9yTUhC?=
 =?utf-8?B?U0tmSi9OVlV6dDZYTnIzRG5Gb3BXZWJXM1E3bnIyclVhMkF2dGxhZElEUDNW?=
 =?utf-8?B?VFpLTDNndFJmZ0pvNklFRndVOHpCeXlUejI4aEliOWQ4ckczMEw0U0VyM3JR?=
 =?utf-8?B?bmJ5VnZ4SnlKT1pmdllQQVBVOUtuUDArQXo3WnBNaUR0UnkvUlpWQ2VnZG5S?=
 =?utf-8?B?K2UreDRBVlhrVDVvejBzMCs4VlJoTTFwZGNaTDF6RVlSV0R3c3ZpU2tyNGVv?=
 =?utf-8?B?Z3BTV2tlMEo3cmRPNU5yMTRZUC9PdUNkUzZLeFZOVE1UaUdrQ0JaTjR5dzVv?=
 =?utf-8?B?ajhDdmZzZnEwYS9ZdkJwZGhWRzZya0hPbVhjTk1jS2t6dlhCamh1dG9reGR5?=
 =?utf-8?B?TFBwY0FoaGZRU1BkNmxQWi96dlFFZ2FESkh0aGN2eUEvdHlXZ1NqT2xLdk0z?=
 =?utf-8?B?cE45MHhIakxoaUxLT2VhVGFyL2p4dWN5WVplSmxVUnpFUVVnSnZ3OHJ0L01V?=
 =?utf-8?B?Yk15QUtMMjhZakZsZFVJSzRHWlo2bCtyT3h3VzdROGVtYnp5d2E1WHViOHQ3?=
 =?utf-8?B?UDZ4WWkyVFBCUWtIWGwyN1RtbTErUDc3TnZkR2dvdGNwS1hZWDV2cER1UVdQ?=
 =?utf-8?B?Uk1pdTVaZUlkaFFKQVMwejdnQ3AzeFR4Qk9rUzl3OFpWWVlBN0VOVlNFbzZr?=
 =?utf-8?B?K2poRm1WNTlYNlpxTGZhdFlLNDFncUQ2ZE5Bc3RDeWtZZ1VTQXRzNjA2MVpx?=
 =?utf-8?B?azBzV0owNkRvTE9TRi92ejBsTXJ5SHhRNFR2UGt3ZmJnemZOMFdpckd6Skkx?=
 =?utf-8?B?RzhtSFQ5UTkzelc5cFMveFluRWJQQitEaUI3cE8wbG8wOFd0UG5JbjBQRitD?=
 =?utf-8?B?dGtVaHpRR0t4cFJ1SjN1emhnODNuNkgwUExKemgwMWlxVHpFS1h3a0xlaldI?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2429b7c4-09a7-482f-39db-08dd55ab6928
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 14:48:05.0231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83t0G8ZWuSj5KqqyrdiQwWCp8eq/i8Lqxl+e+s5nYZ96g3ybxMTIaT2K8OFt2Xt+uwj0ZgpaZ8KxGy6Nv3zft6ujahPJEa5PNl35lAoKSFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7512
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

On Tue, Feb 25, 2025 at 04:39:25AM +0000, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Tuesday, February 25, 2025 12:42 AM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
>> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
>> Subject: Re: [PATCH V9] drm/xe/uapi: Use hint for guc to set GT frequency
>>
>> On Mon, Feb 24, 2025 at 09:43:09AM -0600, Lucas De Marchi wrote:
>> >On Wed, Feb 12, 2025 at 05:08:30PM +0530, Tejas Upadhyay wrote:
>> >>Allow user to provide a low latency hint. When set, KMD sends a hint
>> >>to GuC which results in special handling for that process. SLPC will
>> >>ramp the GT frequency aggressively every time it switches to this
>> >>process.
>> >>
>> >>We need to enable the use of SLPC Compute strategy during init, but it
>> >>will apply only to processes that set this bit during process
>> >>creation.
>> >>
>> >>Improvement with this approach as below:
>> >>
>> >>Before,
>> >>
>> >>:~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak
>> >>--kernel-latency
>> >>Platform: Intel(R) OpenCL Graphics
>> >> Device: Intel(R) Graphics [0xe20b]
>> >>   Driver version  : 24.52.0 (Linux x64)
>> >>   Compute units   : 160
>> >>   Clock frequency : 2850 MHz
>> >>   Kernel launch latency : 283.16 us
>> >>
>> >>After,
>> >>
>> >>:~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak
>> >>--kernel-latency
>> >>Platform: Intel(R) OpenCL Graphics
>> >> Device: Intel(R) Graphics [0xe20b]
>> >>   Driver version  : 24.52.0 (Linux x64)
>> >>   Compute units   : 160
>> >>   Clock frequency : 2850 MHz
>> >>
>> >>   Kernel launch latency : 63.38 us
>> >>
>> >>UMD Compute PR : https://github.com/intel/compute-runtime/pull/794
>> >>UMD Mesa PR :
>> >>https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33214
>> >>
>> >>v9(Vinay):
>> >> - remove extra line, align commit message
>> >>v8(Vinay):
>> >> - Add separate example for using low latency hint
>> >>v7(Jose):
>> >> - Update UMD PR
>> >> - applicable to all gpus
>> >>V6:
>> >> - init flags, remove redundant flags check (MAuld)
>> >>V5:
>> >> - Move uapi doc to documentation and GuC ABI specific change
>> >>(Rodrigo)
>> >
>> >hmn... that doesn't look right.
>> >
>> >...
>> >
>> >>diff --git a/Documentation/gpu/drm-uapi.rst
>> >>b/Documentation/gpu/drm-uapi.rst index b75cc9a70d1f..7337d1be45ef
>> >>100644
>> >>--- a/Documentation/gpu/drm-uapi.rst
>> >>+++ b/Documentation/gpu/drm-uapi.rst
>> >>@@ -583,3 +583,21 @@ dma-buf interoperability
>> >>
>> >>Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
>> >>information on how dma-buf is integrated and exposed within DRM.
>> >>+
>> >>+Low latency hint by user
>> >>+========================
>> >>+
>> >>+Allow users to provide a hint to kernel for cases demanding low
>> >>+latency profile. Please note it will have impact on power
>> >>+consumption. User can indicate low latency hint with flag while
>> >>+creating exec queue as mentioned below,
>> >>+
>> >>+     struct drm_xe_exec_queue_create exec_queue_create = {
>> >>+          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT,
>> >>+          .extensions = 0,
>> >>+          .vm_id = vm,
>> >>+          .num_bb_per_exec = 1,
>> >>+          .num_eng_per_bb = 1,
>> >>+          .instances = to_user_pointer(&instance),
>> >>+     };
>> >>+     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
>> >
>> >how does this driver-specific doc make sense in this file?
>
>Thanks for looking at this.
>
>There was suggestion to add this in documentation during review, @Vivi, Rodrigo Can we remove this? And if we remove this whats point in keeping documentation here for 4 line paragraph?
>@De Marchi, Lucas Do you mean completely remove from here, just keep in xe_drm.h?

AFAICS in v4 the request was to add it to the documentation, not to add
it to a random documentation file. In v4 this example was only in the
commit message rather than in the documentation.

If you add it as kernel-doc you are adding it to the documentation. See
https://docs.kernel.org/gpu/driver-uapi.html#c.drm_xe_exec_queue_create
			    ^^^^^^^^^^^

The xe uapi shows up here:
https://docs.kernel.org/gpu/driver-uapi.html#drm-xe-uapi because:

Documentation/gpu/index.rst:
	...
	driver-uapi
	...

Documentation/gpu/driver-uapi:
	
	drm/xe uAPI
	===========

	.. kernel-doc:: include/uapi/drm/xe_drm.h

In v9 this example is duplicated in Documentation/gpu/drm-uapi.rst
(wrong file) and xe_drm.h (right one).

I hope that clarifies.

Lucas De Marchi

>
>Tejas
>
>>
>> to avoid needless noise in the log, I zapped this commit from
>> drm-xe-next:
>>
>>   + 8f78c0dfbe9d...8b4b3af869e9 drm-xe-next -> drm-xe-next (forced
>> update)
>>
>> 8b4b3af o [drm-xe-next] {drm-xe/drm-xe-next} {drm-xe/HEAD}
>> drm/xe/userptr: remove tmp_evict list
>> 6b93cb9 o drm/xe/userptr: fix EFAULT handling
>> 4e37e92 o drm/xe/userptr: restore invalidation list on error 8f78c0d │ o
>> drm/xe/userptr: remove tmp_evict list f2211aa │ o drm/xe/userptr: fix EFAULT
>> handling b9aaabb │ o drm/xe/userptr: restore invalidation list on error
>> bee37a8 │ o drm/xe/uapi: Use hint for guc to set GT frequency
>>
>> this documentation is also in include/uapi/drm/xe_drm.h, so maybe the best
>> thing to do is probably to just drop this part that got included in the wrong
>> part. Once this is fixed we can add it back.
>>
>> Lucas De Marchi
