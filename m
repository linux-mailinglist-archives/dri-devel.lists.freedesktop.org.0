Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A95C35A2B
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E397D10E744;
	Wed,  5 Nov 2025 12:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fqepx3mH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F4610E73F;
 Wed,  5 Nov 2025 12:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345520; x=1793881520;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+ywaKyV1Ft9OfiQjwVUY+AFZzxeI2QYZ3epomVrSWvQ=;
 b=Fqepx3mHElwhSBrmCu7EfrUsJgQ5exxJRpi/tbWt/7pbw2rcZEZMuNG9
 +MTtNKXiFxDH8SZsrG9121CvJ5H7zv7T0sUiVk27Opg3TAs3uk6IpJvDW
 ZurYI2qdu64Cpx0etcR3Kxgq5sMrMjnZV2OVDSZos8riFAt5YE0HbeabU
 nQHfThhLuhBFKrRL77RaQWj9YLMgW0E8uSyFZYYEHNmfyRlMSLjGlEYbF
 eY78D+zLgGcL21qr6uZE9Ol8p9u7z2SFCawClk5EZArbGMQ8jKXBVUnVI
 jMWoA2Z6jxOfdjCH8xSd1lFrEk992Dfodr8KTPqkxko3cMDKc3xuefRcb g==;
X-CSE-ConnectionGUID: yhQ8JRd0S9CRrcP3gchf6w==
X-CSE-MsgGUID: n7l7S60jQ/SRnKuqte3FCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="82086022"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="82086022"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:25:20 -0800
X-CSE-ConnectionGUID: fz0LPqzST3qp/kaFU5u1+w==
X-CSE-MsgGUID: PQVGniTMTde9FVlABsPrlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187603385"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:25:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 04:25:19 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 04:25:19 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 04:25:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBIF32dG/RLg833nWn8jyKA8m7O9XyS71zewyc8q0Z1sVFKLsYcvHr7G0CQ2iZyj6SEGazwAjMREHdG20QWEEwl//9TLxocfFgYy/rPZaDHUa8/hfCrUt37tEMAF6K5hC4Xsg433FB/pugA/gO3z6A2x6m8UUZSaLcBZRpkFpFPO5FLYaBADu/lvSwgHDnlzGc8vUtqqeoCC570vP0gLHVG8dJw8xhiRD/dlsl8duq9bhUqPd5g5au31RncbCPxNkgDNptV3lc6F+dBPxAtEM0B37K+Op8DWP/a8UPQVfxRJWBwB58MNGhuX04gESQ75h1VBAjGRVXcyItFYCvpMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tu0AdmKEShi8Wi8hrorFq5M8IUtGyihByQbuPu3jblw=;
 b=sPvxW/vMHQEXK66+gKITgcxx/NzlKVWVCFzkyoCt+la+mkeJTwtV2iBekxJeEVcLwwPOER2iHowGoqPyHIP4OwXmg3HqPBX3J+DJTHd1OSZ3NCsy3u4EXaZ2cQXI89Q/ZuF/y0iLQDO7i7MM5URZfIxt8AWkeFmtQEi9tTT8tzu8wwNm2sHsl/QEPTWW0uGOTs36XfLcNjF0JeOz8in0dFWbsnSCyBNzrCcefTG/fwGn7jqW1U2yTfaH4mRC7CHhdttRi437f8l6IZyiUPxu+6WVlyd61551CbzEeHjyBtoOiYGtzTQ0xC5v5ELQyzxeOtTrjDmLNok16PY3gJvCHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 12:25:17 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9275.013; Wed, 5 Nov 2025
 12:25:17 +0000
Message-ID: <1e84f070-8cd1-4735-9d2b-7f8e76060232@intel.com>
Date: Wed, 5 Nov 2025 17:55:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 11/24] drm/i915/color: Add and attach COLORPIPELINE plane
 property
Content-Language: en-GB
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-12-uma.shankar@intel.com>
 <DM3PPF208195D8DB02B13BC6F33E064A0E4E3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <DM3PPF208195D8DB02B13BC6F33E064A0E4E3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0209.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::6) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SN7PR11MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 6802d333-ac99-48e8-2cd6-08de1c6660ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVJ3bUh6VTdyZDBCQ2VVOTVEaXRkNEpSaFJkQ3FnR3JqUGlST1o3WU5kOGNY?=
 =?utf-8?B?OGM1L0x5TUxhVDQvNjNrMUVoVG8xYXlsdUpjVFd0UjhmdkthaEJCUVlsb1dy?=
 =?utf-8?B?S3B0S2hVbk1QZTIyY2JSaXlhTHB3U2VJSnNFKzg4WkZsTG9hdHVXOW1nSFI0?=
 =?utf-8?B?YWF4UzR0Zk5xVU54Z2NGSVR2NWF3YW5LZWpSbVk3WVhZelBoYVEra255dlhl?=
 =?utf-8?B?aU1zQnNNWWpjcjhoaFFSK01SdFZSN1o2OGhYRE9rNExIN0NVMzYwN2UvRU5F?=
 =?utf-8?B?eHlINW1IYVl6L3FYUE0rdlNFRnRQSHRsTG1nQnc2eHBkdThnclVtV0d2Njc2?=
 =?utf-8?B?SVJNU0ZtTnJxWEdWeUhlTkVWb1ZHYjV4VWl5dXhhUk5YVVdYaTVwVjluY0dZ?=
 =?utf-8?B?WDQ1dHhOTDNlT0t6dVFacDFVeGhPNEJXbHNVTS9hRGhJdXFJblAvL0NaWGVW?=
 =?utf-8?B?NkM4a2h5QlppRFVXSEg3elZpZ1BCazZrTkE3ZGtteDFhV3M0S2lQWjZId2V0?=
 =?utf-8?B?RTBNZXRZOWFsUGdkQXViNElXZGxZUWlTU1BvNUcrd2xSNmZFM1o3OFUraUNO?=
 =?utf-8?B?d3p3ZTEvaXNRYzdZWXIrSmxOYzQvVmZsQTEzR3RrVXl0S0ZtS1hPK1NZNytE?=
 =?utf-8?B?RW90ZGZvMnhwOVJyTEYvNkFBemd6bGJyY00vNnhKM1Z6LzU4eVcrR2tHN1d3?=
 =?utf-8?B?ekVjUkY0eVdaeC9nOE1tUURuZmUxRERtQmtSWEt0azV1eHdLNzlVVVprSHFM?=
 =?utf-8?B?S3FwZ2tZVCtBcnk2LzBtbFUwVVdwUzZZZDZGYitwdU1nZXJFU2dQU3dEcTRa?=
 =?utf-8?B?SitBMU5pd1p3TXdFTE0raTNKWElpZlk2bGwzZ2ZEQ1MwODNpY0VlcHN5Nk96?=
 =?utf-8?B?TEJvV1p0MHJxR0Qvckg2N2dwd2JqcDRJTEQ1ci9Sb2JSNjArUGsrRzFEN0wx?=
 =?utf-8?B?dmIzSDJBdXF4cTY1VExLUWxyUkZ0T0dIZTZQZUJPVFZBVWs4S1BjYmdqUXdJ?=
 =?utf-8?B?SHFsci9xY2EzUmhBVWpjVkI0c2xwWkpoeFNhVUk4eEQyZ3V2ekJKUDE2R2sy?=
 =?utf-8?B?NXd4d3c4RGxrT2pDcktaeTV0Si9DVm1JVllVTU51d01KMmgvVFdOOWxxRWZD?=
 =?utf-8?B?TWFZMVVqaGRlNEQxYWtGclJ4ay80M1FWZUdOUFRUcUtIVmVvL3N2VGszZldk?=
 =?utf-8?B?Ujg0SFZ0dE52Q21rNXp6TmlEREVmZndFdnVJVmd4NFpGTUYyd3ZXM0FoQVUw?=
 =?utf-8?B?OXh0U1U3VUQ0K0VhRlhVWllZUnlxR1J0Q2hWSjlVcHZHd241N1BiTUxmZXpG?=
 =?utf-8?B?Yys5NzVtRXFJS3VFZlM2dHdGN3lNdXZCNGNXTUhFOFRsNnVRSFBWSmZTbTcz?=
 =?utf-8?B?SW1IUWE4Um5VQWVTN0NsZDBuNG1ISW5PNnZ1U3YwNjl4a3pIWmdRek92M2d3?=
 =?utf-8?B?YUtzZjJNZGo0NTNTL282QnVaNGhURXVtcks3QXUvZm0zZXgrRzFyc3NVQjVM?=
 =?utf-8?B?UTNPWXBnd0VpS1NGNnlrNHdNZDRSMUcrUzRuS2U5MjBONm9WUGsvbzkwelBB?=
 =?utf-8?B?ZWVRK2VzT1l6VU53Q3BneTFYbVVYSU9JdTVoZVVkamQra2M4d3V4dWxsNmZS?=
 =?utf-8?B?SVRxRWY4Ylpubk1BV0hOa1d0emFZZEpzUE9YNWtVOTdMdDRnWXllYmdkQjc5?=
 =?utf-8?B?bzRtSWVzM0EwbWVHTkdrT2VKL09tK3dUQUE3dHE1RDJXUTNxNUtaSlJramll?=
 =?utf-8?B?d3daT1NBSmhNQzgvTEJLWDF5bDJaMHNpcHRMbUxQbXZKMDkyaXpYY3Z6M29E?=
 =?utf-8?B?eTJxNXg2dElrN0JGcEdoWkdiRlBoTDBaT2N1T3JyMTFuSlN2TWNPekR1MVdi?=
 =?utf-8?B?RzAxRjRFR0syZ2pQQk9Fd24rUkorL2w3RkJ3eU1RUkVLT25tTUZ6Z2V6ZFJy?=
 =?utf-8?B?WEo2S3VlMk9DbnlZQ2Z3ZkFhQ01OdEltTUUzc0VaSldkKzZXeDRjRkh2MzFW?=
 =?utf-8?B?ZE82ZkJOSnBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmlFZnRuTUJIRTY1QmdTSzJBQXQzdGI4ZmkwSWg4ZmtscXJsUVJqa3ppdHpH?=
 =?utf-8?B?RmNMbGF3YzdaZDVKVHViKzl1VkhYbzJLMjJYbXpkSitoTnBUcWpHdGpCMnU4?=
 =?utf-8?B?VmdYNVhqK2VsSWxYTDFROEhkb0h0L2piQjJ3K0NWR0pxN3N0dGJoRjNKa3Rk?=
 =?utf-8?B?TG5BNnJ5V2xEcXBzU0NKNHdvMlhNak1RRUhuNCtxTmo2ZDYwVVZJblR4Ukg0?=
 =?utf-8?B?M1FzMmNUVnlsZm1XT3pzNHJiVnI5R21mZTVXRlVxZnVMVVRLUi90VkZySnd2?=
 =?utf-8?B?cDI5ak1KR0xsZlNQbDMveVM5ZEdYdk05TFVJOHEwcjF5NFJjUjgzdkNSZCtP?=
 =?utf-8?B?WEJveWw3bVZGd3Q0aFYyT3RFOWRyQ1h6SVl2NXdQN3N0bkU4SEdqWXZIQXJo?=
 =?utf-8?B?THoybk5LaWZLTGRMTWxGdVpJSkMwZTBWMm4xbUNNOVlDV2VhY3JITVJrYUw1?=
 =?utf-8?B?NW00N2Rqa0dVdzdBMzJZWVBDMjI0WXZTamdhOGdZTDNiOHpxbFoyazJ0TlN4?=
 =?utf-8?B?azV3R2xWMEJWb0N5Ujl0N2NrSGhZZE9GYWhQL3RLMFA4Q0c4a1UvNFFVemR3?=
 =?utf-8?B?YzdVUWxFbFdXUzYzNHdPR2N6UWEyaTRIOHd5aXhmcEdGL0FVdTQrOXdjcUhv?=
 =?utf-8?B?SmN1d2kzZ3dyL1FZTXh5MEpTZktJOFdMdXkrSnJITXRjckJnc012cWpuTm5r?=
 =?utf-8?B?b3BpQmhOQkZsYTBXZDlBbEErZXFrMlRwNWtLcXFSblBZWnFDd09OMi9Tdmc2?=
 =?utf-8?B?Z2ozNkYwZUVET2xSSmlEZXZsaFVZTW14Z0ZEcUZIc0Y2Q0pvNFYrTzJ2KzBK?=
 =?utf-8?B?SzlPdG0wT3R6UnJiOVhGTlNHU1B6cVlUTFJnM05BdC83SGV1ZTNDcGZsWFRB?=
 =?utf-8?B?NjdEVXFjT28yQklPaHhlQ1QwVHJ0SWNuQ1FOcnZoZFFDcXA1ZlkwR2JMc282?=
 =?utf-8?B?NGxSQTJWQnE1OXdweEFWNHF0cUQxdmJXcWkxbDU0bkVaUzM2UkRVL3l4SjJD?=
 =?utf-8?B?VnpSSGptNjhQbHhFV2JyNjU1M1NvbUt1TVZZNmE0YStsanZTL2VEdVJaSVFM?=
 =?utf-8?B?dFpuS256eXVRQ01YK1pJUm5FYnJaMWIyc1F3VmVRbjY5SFNnaXk2QnY4VzNG?=
 =?utf-8?B?WTcvNEU2WGt2T0RvMUxWNnV2cC9FTXVUcS9mL25oQzBzS1FHU3FwNk1rTTZC?=
 =?utf-8?B?K1IzYS9ONVZ4bVdWR09HMjRMZ04vSmpOODdPaWJJTUQvZG4rQWgvVllucHpF?=
 =?utf-8?B?cWFKNTJidEZTdXRVTXBLTkduUlcwOEZlaS8yZHVvWFllTkN3S3FEMTVhblhE?=
 =?utf-8?B?QUxBblF5K1hMZitxTmxWYUNnb3pyRFJEK1lVYWV2OWp3WFF1SWc4dnlya3Ew?=
 =?utf-8?B?a0E4K1Y3VmxxOGdZVlFmNmQrL0wwUXdHcGJzTjRTZWxDNGp3VEY5UnZHcEhS?=
 =?utf-8?B?K2tUTkRHYW0rblNVNk1jVlRCVS84WlpqYnVyZndsbEJ0a3l2L0NOTC94czBR?=
 =?utf-8?B?ZFh3SC9DSnR2QmtJR21RN0tkcWNsWnJCRTA3RFNzdEk2UXIzbHQrdDJrL1ND?=
 =?utf-8?B?R1VxR2RtS1NkQVo2cFh4b3F6SHliUG9ldnhiMGFnUTI4VWNHZi9Cdi91NGR5?=
 =?utf-8?B?bXA2eHNVU2VJdlhPTkJVRi9Dek4wSHY4MjRPWUhVSGxFVXc1amNYU2ZnaURC?=
 =?utf-8?B?UTUrSTFpVk1LRXNscTA5Ni9MeEc0VFIrdnM0TUtqTCtrZEdhdzk1TEhGZmVB?=
 =?utf-8?B?YVdrNFg2RzZsUThhN3NweEZiQXFBc3ZsQTAwdXRJRXJHdGF1L1pEQ0I2Y3FD?=
 =?utf-8?B?bjFVVnFCelNnWWI0cTlkdTF3QTJHUmJQM1FQNXlKTmt3dW1iY1laSkF0WDBO?=
 =?utf-8?B?cDVXWWxBWDhtdEVnY0VsVW1sMHc5T0Vhd3BFVnJNYWpsUW5ydDIxMHJDYitO?=
 =?utf-8?B?eHdWb2xxMEljYUd0ZitsREtHUnNNZGN6bzNwbmNpSlRXakxEK09IZWRKVHVJ?=
 =?utf-8?B?cFZPZDhNd3Iyck1JY3JXZHEzR3hndm16b0t6TC9tcVZqVlRzR3grT2RPZUxs?=
 =?utf-8?B?RWIzdlVMN2hHcElURDlpTVZqRDYrbkJXNzc1N1c0cFhiSzUxeVRGQjQ1SzJk?=
 =?utf-8?B?ODJ6QXcyZWtNTE9XbktQYi9iZnJhMk9YcjJ1bUcrRWM3NXdCcGRxbkNDTkdK?=
 =?utf-8?Q?ZzhzK68t/gEazJoku0u1dns=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6802d333-ac99-48e8-2cd6-08de1c6660ce
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 12:25:17.2602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fN+mp2wZqMBWe8q/xC+zV6gz+vioeSzX5Dl6+ntxC4a1pa8uKzmlNMzdiPvOfCQ/eUouvQM9/339MjJN9rOs+1x6LkB3kpdWur+f6sAArQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8282
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



On 10/28/2025 10:43 AM, Kandpal, Suraj wrote:
>> Subject: [v5 11/24] drm/i915/color: Add and attach COLORPIPELINE plane
>> property
>>
>> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>
>> Add supported color pipelines and attach it to plane.
>>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_color.c | 42 ++++++++++++++++++++++
>> drivers/gpu/drm/i915/display/intel_color.h |  3 ++
>>   2 files changed, 45 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
>> b/drivers/gpu/drm/i915/display/intel_color.c
>> index 90ac6530d1a5..363c9590c5c1 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>> @@ -4050,6 +4050,48 @@ int intel_plane_tf_pipeline_init(struct drm_plane
>> *plane, struct drm_prop_enum_l
>>   	return 0;
>>   }
>>
>> +int intel_plane_color_init(struct drm_plane *plane) {
> 
> Again need to rethink the name here
> 

Ack, I have now created a separate file for pipeline related stuff.

>> +	struct drm_device *dev = plane->dev;
>> +	struct intel_display *display = to_intel_display(dev);
>> +	struct drm_property *prop;
>> +	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
>> +	int len = 0;
>> +	int ret;
>> +
>> +	/* Currently expose pipeline only for HDR planes*/
> 
> Missed a blank space at the end
> 
>> +	if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id))
>> +		return 0;
>> +
>> +	/* Add "Bypass" (i.e. NULL) pipeline */
>> +	pipelines[len].type = 0;
>> +	pipelines[len].name = "Bypass";
>> +	len++;
>> +
>> +	/* Add pipeline consisting of transfer functions */
>> +	ret = intel_plane_tf_pipeline_init(plane, &pipelines[len]);
>> +	if (ret)
>> +		return ret;
>> +	len++;
>> +
>> +	/* Create COLOR_PIPELINE property and attach */
>> +	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
>> +					"COLOR_PIPELINE",
>> +					pipelines, len);
>> +	if (!prop)
>> +		return -ENOMEM;
>> +
>> +	plane->color_pipeline_property = prop;
>> +
>> +	drm_object_attach_property(&plane->base, prop, 0);
>> +
>> +	/* TODO check if needed */
>> +	if (plane->state)
>> +		plane->state->color_pipeline = NULL;
>> +
>> +	return 0;
>> +}
>> +
>>   void intel_color_crtc_init(struct intel_crtc *crtc)  {
>>   	struct intel_display *display = to_intel_display(crtc); diff --git
>> a/drivers/gpu/drm/i915/display/intel_color.h
>> b/drivers/gpu/drm/i915/display/intel_color.h
>> index ce9db761c6e2..c2561b86bb26 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color.h
>> +++ b/drivers/gpu/drm/i915/display/intel_color.h
>> @@ -18,6 +18,8 @@ struct drm_plane;
>>   struct drm_prop_enum_list;
>>   enum intel_color_block;
>>
>> +#define MAX_COLOR_PIPELINES 5
> 
> Here I see you will be initializing a max of 3 pipelines if I am not wrong the number should reflect that so maybe
> 3

We technically have two color pipelines one with 3 colorops and another 
"Bypass". 5 is more a forward looking limit.[1]

==
Chaitanya

[1] Also a bit of monkey see, monkey do
https://lore.kernel.org/dri-devel/20251030034349.2309829-25-alex.hung@amd.com/

> 
> Regards,
> Suraj Kandpal
> 
>> +
>>   void intel_color_init_hooks(struct intel_display *display);  int
>> intel_color_init(struct intel_display *display);  void intel_color_crtc_init(struct
>> intel_crtc *crtc); @@ -46,5 +48,6 @@ void intel_color_assert_luts(const struct
>> intel_crtc_state *crtc_state);  struct intel_plane_colorop
>> *intel_colorop_alloc(void);  struct intel_plane_colorop
>> *intel_plane_colorop_create(enum intel_color_block id);  int
>> intel_plane_tf_pipeline_init(struct drm_plane *plane, struct
>> drm_prop_enum_list *list);
>> +int intel_plane_color_init(struct drm_plane *plane);
>>
>>   #endif /* __INTEL_COLOR_H__ */
>> --
>> 2.42.0
> 

