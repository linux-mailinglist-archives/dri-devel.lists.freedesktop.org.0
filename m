Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E015D07F46
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2434910E86D;
	Fri,  9 Jan 2026 08:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fRbTjHJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A21510E863;
 Fri,  9 Jan 2026 08:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767948569; x=1799484569;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qqE4lFfrz1IT8MLgk8f2+ootUxyrNiHeRs4nD63ZXL8=;
 b=fRbTjHJAwRN92Zo/2r1oLR/flUVMQK02GxZhdMPDRCnimpvcwn5Lmxr2
 dR/d4AYm0iTOEhE9V1m1Zj6NBXsbg2UNXhVYUp0KSDiIDN2jnlTFU1Cww
 +BeqckKPE1iYdauZZ/wOq3aGze1gyvrwMCdchFl6b08GypuYarZ+++n3H
 ZL6eewfTnX4A2ImkXQKe59EXo0nwiDBPValDpPqcB3TN+UgAUjGetuI+F
 AhH1B9d1nIg40jnDEqZ4LhOLNtN05mDmibFF1tPgeryltlBGhbuP0LD38
 vljixDqUXiP+hWXB+j/TvwOLYZcQHY2zazjSY6TJRy10396xp2xnvzsQ2 g==;
X-CSE-ConnectionGUID: nTwT6JUIRRau68Nr1LJWog==
X-CSE-MsgGUID: kgB2H6QdS1ux7UlPLatbaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="94800573"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="94800573"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:49:28 -0800
X-CSE-ConnectionGUID: UkSxi9a7RHmDGCLyUcVZsg==
X-CSE-MsgGUID: aFg1LBw4RDic6e1tIhydUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="203849768"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:49:25 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 00:49:25 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 00:49:25 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 00:49:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rqb1WEK+cSNCxHLBkgtpug8byyNmsACNE/e8XbPRlCbwRFvSWj6TLUwjd5vhdoUKsFLz7mgQDOcuK1KXJ6ssrn5Le9i+Z8d6D7rT/5w1oIuaZ0/frNDhll1zyWQJmTmCLZD8TircgB5zAGjsGbxSnvsTfbToL5R6+wODNidwqeRm2RNxaa/SPbC6M3fzEsupag8rmmRIuteBjoCOkQjVmvhSTsPFB6wuxsgWwB9kH8ItgYoLeL+bgdwWgleMstUhs/9te+laydmGdw8N/2dtgNrHyaC6sTjAGbmOfE9PrMazWRTA/7PobkwCHCsj2HrO7ejn8w679KVvJ8RdvOEYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYeNgi5rEguevfMiTcxu/MOwDrQveFMlURulcOXPg4s=;
 b=iCF/jDLAxGI3DK01Ry+lRALjzZrBTIrk0EKbg5Ycbv0S7u1VSHQxWowho6BtcUuIZPF8Lbfz7HadxZxC0RUjO0GBlBlKg8HBu7PMU5E7l+ft4hUEmB9cglkcHNsYbx8buGU8AuUP8p8KvOO4G+0M2BoqKxxsJkpV/TSpxY1zBM9WTVU2zmRMxZykarku0gs+f2mveFoLd2w/LXxu5J4bx+up2vxW8Fu6O/Ah/zST9ohfqGEXGg61ZlRIYPDv6Xrcy8tbwKtRYUc//PKb5ZyqVCXztjEJL33y+ADguYZSQj41rgSrDVj/CeywZZR7pIDaMcjkFuAPHPDE7NNC6VonFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SN7PR11MB7973.namprd11.prod.outlook.com (2603:10b6:806:2e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 08:49:22 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 08:49:22 +0000
Message-ID: <9a11b2af-3a67-42f3-a644-81e0bfdf0a7c@intel.com>
Date: Fri, 9 Jan 2026 14:19:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] drm/i915/color: Add failure handling in plane color
 pipeline init
Content-Language: en-GB
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "daniels@collabora.com"
 <daniels@collabora.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-14-chaitanya.kumar.borah@intel.com>
 <DM3PPF208195D8D8D76FABC0564F8D66DB0E387A@DM3PPF208195D8D.namprd11.prod.outlook.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <DM3PPF208195D8D8D76FABC0564F8D66DB0E387A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::11) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SN7PR11MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d8bc9e-094b-4061-9f11-08de4f5bfb36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDJJYUw3UmF5UVpvVkxoc2dCdWpVaUZIVnE0Qm1PaC8wR1ZMTE1FeEdrZ0x3?=
 =?utf-8?B?R0M1YzVhYXd1S2FINnpMYkhUQWhTM2lNQmZXVWtUemU2NWJjMGY2TW05YnVr?=
 =?utf-8?B?K2hwUHI3WFVzNTlwbjUrb1lZb1NNS2lxQk1LUEx1R1Y5MDJIOXpLZjRJSGR4?=
 =?utf-8?B?VHZUcXN5c3Iwdk4vNHEzVWgyRldGYUdXbFcxd1BkWVVwOFYrOW9Wb2J0S2d6?=
 =?utf-8?B?Zi9wcHpYd0tVbmJRQUc5MURjUFE2R085ckNVUHJ0QkQwN2d4aGtxbTFtWE5H?=
 =?utf-8?B?U1VyK0FpOW9Pa2N3bzZtMVB3YkgyVW9VMXo1RmZOZ3o5TktXZDc4L1FMNmkx?=
 =?utf-8?B?TnJld1lWM3BnSzd1UGFJeVBrNFU4SG40eXVrcnFKbVp0YkFpKzVPR256d2Y4?=
 =?utf-8?B?a2F1bkthSG5lSUxYQlpRNXFzZCsyMi9tOXZ4SVI3QmpqcGpmMEZuWUFIZkg2?=
 =?utf-8?B?WUpHTEp0YXBoN0NNVmhsV1hpM3AvNE56cjY2bzkrRFUrb1VjVThrc1c1YktR?=
 =?utf-8?B?MnNxeHc2YXI3djhPNE1EZWlCbUk1WnU5VjRUNVNkaExGdnFZWFN1SC9CcWsy?=
 =?utf-8?B?a256QnVXL2pUUno4Rm96SFhmOFlia0pFSm9keCtuWlhqbEpmd3hYcnRtMjJu?=
 =?utf-8?B?T1A2YjhlU2lPM0l6RVpNR0JabW9tU0V6VHhkbU1ZREtTWEtNUWZOTWdqbERI?=
 =?utf-8?B?MDJBYUc0TWdFVTBXaVpKd2paYVJNdk05dmg5ZWVJQ29tK2xHclFzQmFuRXBi?=
 =?utf-8?B?SGNMdUIvUmNDZHhXS3hRdE5xbVpncFVXSTQ3bnJtZkhsb01pM2ZkRXpRSTZw?=
 =?utf-8?B?SmpTb0VhWnNUUHhyeVdZZEc4Zm9xVWo4ZmtQMGlKR0xCUi9DbDlRNzdWaGlD?=
 =?utf-8?B?QlNjbU10QjRrVjJCU0pETHJya1k5NTR3clVncTJiZW9DL2dCUVYvVDdIUzdt?=
 =?utf-8?B?OVAzNC82b1IxQTZnYUNSUUVPS201dVd1cU9CRjk0TFl0cUhhbE5ZaVAvYVZF?=
 =?utf-8?B?Rk1wM0xEMWVuU2djL1A3eTVLTU1Vd3dqMytCU2kyd2xCcWNnWjd3Z2VzOGtt?=
 =?utf-8?B?bXNnWjBVRkFNLzVRNWVwTUFlOVN6QWtPdk5wTHE4Umk0QWRHMmUyN2dXZHJa?=
 =?utf-8?B?RmFSeDkvdFp2T0pFeUhFTXgvMFFpZ0N1V0YzS2wreDdJWGg4ZEg1c29TSHFl?=
 =?utf-8?B?bGtFM2o3UVVxa2hVS3FzbUVnaHY1ZFcraXVzR2E4bFpxY2xsbU03T1d5UDRW?=
 =?utf-8?B?RkhkNzFrU21zc1VVWjV2cGlHVWFRQWtiT1F3ayttQ29PSDFCWC9SeWxGRGF1?=
 =?utf-8?B?NmNvZmtjbkNkWXlkZWRaVmtNVUJubWtDbVhDYlc2Z0R5aWFXQnNReDhWcmo3?=
 =?utf-8?B?N1BINVM5K21XMEZyOEJHZmFtNE5UUk9XR0xDUFdqZk1MdXp5L0w3cCt5Z2tR?=
 =?utf-8?B?YjRqSkNMK043My9mY3RDc1pCMjAwNnRSS3Q4V1o3N1NVOFppZytGWWtOYlBM?=
 =?utf-8?B?TThCbUd2ZTA3c1FaRzVVOVYyUnh3SkxaUDNLZjZoaFdwbUxBVHA1cEFaYjhS?=
 =?utf-8?B?VjB4QmZRQitvdkpISnduVmNCOGl6enB2cThrdUlrTW5rSjNabm80WEM1SjlN?=
 =?utf-8?B?K0h3czZFV1llRUxJazVONDY5YUdSUzdvbitWbjhKaXREeHBXT3YzeXh3NFRm?=
 =?utf-8?B?d0Z2UUFGcExGTEJ0aTJCVjlJbStaUDJuU2V6ZnJBblA0WkkyU2IvK3JGRVBi?=
 =?utf-8?B?Y0NaSTVLeFhsbE1uRVBzSE1NTEJHQU9vSkZhdFNRdWE1TGFSdUtYOFpOSnJ4?=
 =?utf-8?B?OGdxWWgyWnkxelNHT3U1ckx0enNwK041T0wwVENDd0tTVllXdW1pK3VDSjl6?=
 =?utf-8?B?T2p5YUVnaGhhZEloTnNrR1pwa1RDS2hTWkt2WmhJcWFES29IWC9NY09uODIz?=
 =?utf-8?B?SXppQXFwWFcwSjY1RTh1T3JzM2ZMdGhoNUpSczN4SnJTeTg4YnYwd2FVcnpE?=
 =?utf-8?B?RU9hSEl1MU1BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1R3ODRJbzNrK2UzdzROeDFvOTJVNHQwdEtNTnF1RFREdk5BYWI0MjdqT1hG?=
 =?utf-8?B?VkxDdEU4cy81bGFHNkxqV0Zyd0czb011SHdrKzRDNWs2NGZHakNpUU9kdyt5?=
 =?utf-8?B?SmNIL2swRTErNkpNblhVbk5xR2RDbWpnUTRRbmtlc2VvT01JcWl1azhjeGs3?=
 =?utf-8?B?WWNqL0ZpcXNBM05Hdy9LeUM1c20yeGlPbitmellZSlo3WUIvSTZlUmt1RHVr?=
 =?utf-8?B?b0Z1bDhZVEJlbGZZZnd1NG80RHk0NkI4NVdjK2p1ZHN4SEZwak1zRHhhdnU0?=
 =?utf-8?B?YmtpUDZtZjgyZW9hNFlHd0hNVkZHcDVueGFOL3dNa1V2UDMwL213MDdhRm1R?=
 =?utf-8?B?MmhtRHFBaHR5dU14UkZJSURvVjZYVzBmam5sR0hrZ2ovVTB1TlM4dTJ1MUhs?=
 =?utf-8?B?cnhiK0hpWTNqZXRUQkFYMEJ0b0tnY3NDdnZCUjhsT2NBNThLaGc2N1BGK29k?=
 =?utf-8?B?V3NWVnMwcVl3ODdFVE1vM2pTQ3VGTS9FYWlKZWtQRklhRUNPMXZWYTFWNmww?=
 =?utf-8?B?cFhRM3o0YmxYOTduczNkQWNnaUI3dUZ1VWVhcy9Rc0taK21sNERaOVJTWDBO?=
 =?utf-8?B?NFdCRUprYndzWTNGR05MaUhFZlhuMzZnTjluRW56ang1YUlnQVI5MHZOUHRu?=
 =?utf-8?B?UGYrU2dCMUQ3MkpBMnczdUMzSktEcmIxSnVEUHNrRTdjVndhWkdoa3llMzdQ?=
 =?utf-8?B?ME1mYWJ1RGg3dXZYZkI5MjQ4VGVrVFpQQnhqODY5SU1HYUxmVnVqTHZJY0sr?=
 =?utf-8?B?MUoyaDQwc2w1dGNsVFNwTG5ma3JvUTRSL0xHWUpLdWxHbjl6ZjVnUU5zUUxV?=
 =?utf-8?B?UXdoYnNWYkQrMWpwNUJxVHdqempsRVhtVlkrTGZzenVucXloUW1EbVZRVk00?=
 =?utf-8?B?OG51dUkwblVlUDVhUU5XU01CNTJGZVNKYVRnazBSVW1KWTNBdllzT2kyc09P?=
 =?utf-8?B?T1lzMlExNWVQSDh2VWdha0dpa0RiME45cHAyNlVTcUcxUVNGU2xmc1VQekE4?=
 =?utf-8?B?NEJPY09ZRGNkcjlFVitQZ0NWSm5qMTZMRzRLQ1NTSnRjdmVpZ2Iyei8rRS9t?=
 =?utf-8?B?T1QwdlJHYTB6K0YwYXBYVDEwcmJ5c3ZXTnB0cnBGTWVzdFE2aDRrc2VVOU1H?=
 =?utf-8?B?VlJRVGljTUtETUZvRStwSCtyUXN1RzdDbHlWVzFIM2k1a2VKQVZ4K25BS1po?=
 =?utf-8?B?RkZsYmIwV0VYOTBqT1BmbnR1dkVDKzFCYTFrSGpWTFBWaUI1dlM2Yjd5cU1X?=
 =?utf-8?B?U0R3WlIwazhtMUpQZW9BTWRENUNjMVBuY3dkM2J0dnp1YkdaYldHK1BXZU5y?=
 =?utf-8?B?Ym5WS0RtY1Y1Z1VNVzZ6dExrd1d2QjNRMEhGVWVEYThPYmpRY05OamU0ZjA4?=
 =?utf-8?B?OG1BajNwTi9Fb0NPRm1aWCtvL0VtZVlNNEtuTzhwQjBxcGtnQVRrUlBpYi9m?=
 =?utf-8?B?eitiOGl0b3c0c3dMSDc2SFdGbDVBUTE4UEZJUDFSbnBmZEZpdFBjT1AxNThq?=
 =?utf-8?B?YXAvcXo1VlYvSi8xdGZyV0Q2QW0yaC9BeXppajUvNjhoQXBNVk1jRVNSNWps?=
 =?utf-8?B?Y2JLT1ppMFRXd2pGT3htMGNuTlhwcHNqU2xFNHJXc2hSQUNuMHYxZnBsdUJp?=
 =?utf-8?B?SVJ1TkQzQ3dTK2pmSS9aM3lKVXIvUjlabm9wRlFzcCtQMFJxU1VNOHh2RWE4?=
 =?utf-8?B?cU5MeWdjN2FMVDd0eTd2eVc0RzJTV0hKSGtScHAyMS9EeHBCa3dEcnlFenJN?=
 =?utf-8?B?TDl0QU4xV21oN0kxT2xla3RVeHZOaThvd3JUdG5UYWpqZmtJNXowSTNIcGtj?=
 =?utf-8?B?UVNjTDFCS1h3ckZSbURkK1cycTFldFl4ZjhjUmpTU1NLZHZPUjduYkhSWnNr?=
 =?utf-8?B?TzdNYzIremR5WW0rbXE0cFcvbmhleHRaM25tRjFiMzg3cmxGR1VVbXhiaFp1?=
 =?utf-8?B?UUM0SzNaRHp6SHg0NHhMQ0pXdUMybzJ0dFhraWxCL2s5elAwY0VhdjJ3eFNS?=
 =?utf-8?B?ZFJ3aWFiYWNWQmxIRHFYRkpwaU1hL2dtWm56OFlqWGN1dnptT0EwUnZ4eWJY?=
 =?utf-8?B?UkZBWGpqYk5LZ3NFMWZDVTJWV29TbnFOS0hrU09vR1d4ZVFPcEE4TGN6bERB?=
 =?utf-8?B?V04rVE93QkdVOENzTm5Hcnc5SWxOOXA1V25TTkpMc0Y4ZjdNV01vZi9LR0RY?=
 =?utf-8?B?b1JKSXZmVFFweXc4Rk45ZUNMWE9mMkF0T1AyNDFBLzUvYitsUTNDejZvQVNJ?=
 =?utf-8?B?YVhXMlZ2dWJXRE5KTjczdGNnQ3o5ZmpVTThuWTBHT2VuNG9hR1NZYUtaVkdr?=
 =?utf-8?B?Vk5FaStqMXV6ZGJZVkJwMllpdk1QQUE1RXBSUzNGUmNacmpFUzh5VGsxMjc5?=
 =?utf-8?Q?xVTQC/y9Qoq3Segg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d8bc9e-094b-4061-9f11-08de4f5bfb36
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 08:49:22.1194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJXuOYcvEjLXUom76980GVnqhAYCkpB/lZxkA1CfnuNq1LW+O6q/76eNBvezlV6vCvyw/pSx5vK09XmTZI3UQiRdB4GUfnhciYG4g6cIUQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7973
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



On 1/6/2026 9:25 AM, Kandpal, Suraj wrote:
>> Subject: [PATCH 13/13] drm/i915/color: Add failure handling in plane color
>> pipeline init
>>
>> The plane color pipeline initialization built up multiple colorop blocks inline,
>> but did not reliably clean up partially constructed pipelines when an
>> intermediate step failed. This could lead to leaked colorop objects and fragile
>> error handling as the pipeline grows.
>>
>> Refactor the pipeline construction to use a common helper for adding colorop
>> blocks. This centralizes allocation, initialization, and teardown logic, allowing
>> the caller to reliably unwind all previously created colorops on failure.
>>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>>   .../drm/i915/display/intel_color_pipeline.c   | 142 ++++++++++++------
>>   1 file changed, 100 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> index 8fecc53540ba..035ec3f022cd 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> @@ -2,6 +2,8 @@
>>   /*
>>    * Copyright © 2025 Intel Corporation
>>    */
>> +#include <drm/drm_print.h>
>> +
>>   #include "intel_color.h"
>>   #include "intel_colorop.h"
>>   #include "intel_color_pipeline.h"
>> @@ -10,6 +12,7 @@
>>   #include "skl_universal_plane.h"
>>
>>   #define MAX_COLOR_PIPELINES 1
>> +#define MAX_COLOROP 4
>>   #define PLANE_DEGAMMA_SIZE 128
>>   #define PLANE_GAMMA_SIZE 32
>>
>> @@ -18,69 +21,124 @@ static const struct drm_colorop_funcs
>> intel_colorop_funcs = {  };
>>
>>   static
>> -int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct
>> drm_prop_enum_list *list,
>> -				     enum pipe pipe)
>> +struct intel_colorop *intel_color_pipeline_plane_add_colorop(struct
>> drm_plane *plane,
>> +							     struct
>> intel_colorop *prev,
>> +							     enum
>> intel_color_block id)
>>   {
> 
> Seems like you just added a new function and then changed the function
> _intel_color_pipeline_plane_init but git format-patch messed this patch up bit
> Maybe try use --patience option to make this patch more readable.
>   

I used it on the v2 but did not help much :/ May be I am missing something.

>>   	struct drm_device *dev = plane->dev;
>> -	struct intel_display *display = to_intel_display(dev);
>> -	struct drm_colorop *prev_op;
>>   	struct intel_colorop *colorop;
>>   	int ret;
>>
>> -	colorop = intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
>> -
>> -	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
>> plane, &intel_colorop_funcs,
>> -						  PLANE_DEGAMMA_SIZE,
>> -
>> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>> -
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +	colorop = intel_colorop_create(id);
>> +
>> +	if (IS_ERR(colorop))
>> +		return colorop;
>> +
>> +	switch (id) {
>> +	case INTEL_PLANE_CB_PRE_CSC_LUT:
>> +		ret = drm_plane_colorop_curve_1d_lut_init(dev,
>> +							  &colorop->base,
>> plane,
>> +
>> &intel_colorop_funcs,
>> +
>> PLANE_DEGAMMA_SIZE,
>> +
>> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>> +
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +		break;
>> +	case INTEL_PLANE_CB_CSC:
>> +		ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base,
>> plane,
>> +						     &intel_colorop_funcs,
>> +
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +		break;
>> +	case INTEL_PLANE_CB_3DLUT:
>> +		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base,
>> plane,
>> +						   &intel_colorop_funcs, 17,
>> +
>> DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>> +						   true);
>> +		break;
>> +	case INTEL_PLANE_CB_POST_CSC_LUT:
>> +		ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop-
>>> base, plane,
>> +
>> &intel_colorop_funcs,
>> +
>> PLANE_GAMMA_SIZE,
>> +
>> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>> +
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +		break;
>> +	default:
>> +		drm_err(plane->dev, "Invalid colorop id [%d]", id);
>> +		ret = -EINVAL;
>> +	}
>>
>>   	if (ret)
>> -		return ret;
>> +		goto cleanup;
>>
>> -	list->type = colorop->base.base.id;
>> +	if (prev)
>> +		drm_colorop_set_next_property(&prev->base, &colorop-
>>> base);
>>
>> -	/* TODO: handle failures and clean up */
>> -	prev_op = &colorop->base;
>> +	return colorop;
>>
>> -	colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
>> -	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
>> &intel_colorop_funcs,
>> -
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> -	if (ret)
>> -		return ret;
>> +cleanup:
>> +	intel_colorop_destroy(&colorop->base);
>> +	return ERR_PTR(ret);
>> +}
>>
>> -	drm_colorop_set_next_property(prev_op, &colorop->base);
>> -	prev_op = &colorop->base;
>> +static
>> +int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct
>> drm_prop_enum_list *list,
>> +				     enum pipe pipe)
>> +{
>> +	struct drm_device *dev = plane->dev;
>> +	struct intel_display *display = to_intel_display(dev);
>> +	struct intel_colorop *colorop[MAX_COLOROP];
>> +	int ret = 0;
>> +	int i = 0;
>>
>> -	if (DISPLAY_VER(display) >= 35 &&
>> -	    intel_color_crtc_has_3dlut(display, pipe) &&
>> -	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
>> -		colorop = intel_colorop_create(INTEL_PLANE_CB_3DLUT);
>> +	colorop[i] = intel_color_pipeline_plane_add_colorop(plane, NULL,
>> +
>> INTEL_PLANE_CB_PRE_CSC_LUT);
>> +
>> +	if (IS_ERR(colorop[i])) {
>> +		ret = PTR_ERR(colorop[i]);
>> +		goto cleanup;
>> +	}
>> +	i++;
> 
> I see a lot of repeated code maybe we can get this done via a loop
> static const enum intel_colorop_type pipeline[] = {
>          INTEL_PLANE_CB_PRE_CSC_LUT,
>          INTEL_PLANE_CB_CSC,
>          INTEL_PLANE_CB_3DLUT,
>          INTEL_PLANE_CB_POST_CSC_LUT,
> };
> 
> for (n = 0; n < ARRAY_SIZE(pipeline); n++) {
>          if (pipeline[n] == INTEL_PLANE_CB_3DLUT &&
>              (DISPLAY_VER(display) < 35 ||
>               plane->type != DRM_PLANE_TYPE_PRIMARY ||
>               !intel_color_crtc_has_3dlut(display, pipe)))
>                  continue;
> 
>          ret = add_plane_colorop(plane, colorop, &i, &prev, pipeline[n]);
>          if (ret)
>                  goto cleanup;
> }
> 
> Where add_plane_colorop is
> 
> static int
> add_plane_colorop(struct drm_plane *plane,
>                    struct intel_colorop **colorop,
>                    int *i,
>                    struct intel_colorop **prev,
>                    enum intel_colorop_type type)
> {
>          colorop[*i] = intel_color_pipeline_plane_add_colorop(plane, *prev, type);
>          if (IS_ERR(colorop[*i]))
>                  return PTR_ERR(colorop[*i]);
> 
>          *prev = colorop[*i];
>          (*i)++;
> 
>          return 0;
> }

Sounds like a good idea, thank you. Implemented a version of this in v2

https://lore.kernel.org/intel-gfx/20260109081728.478844-14-chaitanya.kumar.borah@intel.com/T/#u

> 
> Regards,
> Suraj Kandpal
> 
>>
>> -		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base,
>> plane,
>> -						   &intel_colorop_funcs, 17,
>> -
>> DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>> -						   true);
>> -		if (ret)
>> -			return ret;
>>
>> -		drm_colorop_set_next_property(prev_op, &colorop->base);
>> +	colorop[i] = intel_color_pipeline_plane_add_colorop(plane, colorop[i -
>> 1],
>> +
>> INTEL_PLANE_CB_CSC);
>>
>> -		prev_op = &colorop->base;
>> +	if (IS_ERR(colorop[i])) {
>> +		ret = PTR_ERR(colorop[i]);
>> +		goto cleanup;
>>   	}
>>
>> -	colorop = intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
>> -	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
>> plane, &intel_colorop_funcs,
>> -						  PLANE_GAMMA_SIZE,
>> -
>> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>> -
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> -	if (ret)
>> -		return ret;
>> +	i++;
>>
>> -	drm_colorop_set_next_property(prev_op, &colorop->base);
>> +	if (DISPLAY_VER(display) >= 35 &&
>> +	    intel_color_crtc_has_3dlut(display, pipe) &&
>> +	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
>> +		colorop[i] = intel_color_pipeline_plane_add_colorop(plane,
>> colorop[i - 1],
>> +
>> INTEL_PLANE_CB_3DLUT);
>> +
>> +		if (IS_ERR(colorop[i])) {
>> +			ret = PTR_ERR(colorop[i]);
>> +			goto cleanup;
>> +		}
>> +		i++;
>> +	}
>>
>> -	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", list->type);
>> +	colorop[i] = intel_color_pipeline_plane_add_colorop(plane, colorop[i -
>> 1],
>> +
>> INTEL_PLANE_CB_POST_CSC_LUT);
>> +	if (IS_ERR(colorop[i])) {
>> +		ret = PTR_ERR(colorop[i]);
>> +		goto cleanup;
>> +	}
>> +	i++;
>> +
>> +	list->type = colorop[0]->base.base.id;
>> +	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d",
>> +colorop[0]->base.base.id);
>>
>>   	return 0;
>> +
>> +cleanup:
>> +	while (--i >= 0)
>> +		intel_colorop_destroy(&colorop[i]->base);
>> +	return ret;
>>   }
>>
>>   int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe pipe)
>> --
>> 2.25.1
> 

