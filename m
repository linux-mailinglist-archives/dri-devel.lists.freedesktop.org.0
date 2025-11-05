Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6020EC36423
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C9510E79B;
	Wed,  5 Nov 2025 15:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F/v8cEbF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803BA10E76F;
 Wed,  5 Nov 2025 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355584; x=1793891584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3VJGsLpH04F4Dv5t/c7lEFVmPbn2ILRURNqStF2A7eU=;
 b=F/v8cEbFECWKhghWX6Xz04WMDS4ojU7rS6um2XlHQoz+DXJ0DkFJc8Eg
 9qfSxHhVOx40rGlZngKyMA5lpDPiGmv4KULzElHDCYyHswQ4c31TuWbr7
 oht8Br3Q4FxrrGd5NML3MTnqVu+DKHeVra8cNlA1SSR/TW7olNX4e9ksx
 RIYiZrtcNRFCStt1KjrBKRtr8rXX9CGIZpEkrkwsBGWa6S7zLyKpYhxaR
 JXtt8AOLv+umo0oguBxeYReHUvB9iObK+M0yfQPer25+1mmfJYpJw6DyH
 DUk3bdgMtJ7kEbkNyeNHAbIDVfmmrGYodzZ4nnVX1a8IpXtTgrm3LHawu A==;
X-CSE-ConnectionGUID: sIcK8bk3TM6wALBeyfxz3Q==
X-CSE-MsgGUID: glhXEhFQQeqq7pABR9xf0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="81875930"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="81875930"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:13:03 -0800
X-CSE-ConnectionGUID: iNNah17aRPWDoMd0+XaFJw==
X-CSE-MsgGUID: AAGaapgPQh6JOm2So2rxlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="186766672"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:13:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:13:02 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:13:02 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:13:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPhj7dwtc8v8NZXo+tHczHoI21fLXGP9u7X4TE/x/S9/sZsC165nsZ2T3Kh2XH4enb+zQl9J9mgIQgWdkJBjvGO6l7Ec0bAr1A0syWuh9uh5E3q5Nt1702Cj0emLcWHSRqecHMSpDaDsEuykh28dxN2JSUykOiEC0a4FJfyW2Lx6DUR1dXDZETlVNx2YhEgQzW7NnBnj7WEWJ0ocWyq42G32VfbzBhuQanxsPJurS6Fy/ClSMWSeleKKMaRyjSYIPbn4B0oWuiLKp1vikkBAZMNMdDiCZl0+ILEutHRicGQuxxIsRlSwPqBlX4lvsG6h6CDtDuex2NCOcs25PN3KRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdzVYwU7smMK1J9zLyGDbgT+K2AGDTDNRJpnHfQTqCg=;
 b=gIzXi2hRaubNB12/6X9zsrxFeZKOnOwEBLDAq48cak+1QYvq+Ojqo04p6b9zeFFGA/uM78lx2Axruv6WE4p0x9yNcSa+wL/bYAfvhZWBddaP8Z7sn9m4kXv8QYgvcVJJJauLShnfNm6bCxbneaAZbGkPbKUAoefrXVMt6A/CUYU1avw+FDLCJxEJ+HvgWS36mPdk5s+UfQtstGj3FnM5wuVh/VBYUZWEwqzWpAM07OKz6uTcHLjTIOhMXn71zCzHpYlKlq5ff5GledHEfYS0Dwo5GbTves/CGdJN5xZRg6PrfshQUNNPmH80CbLJvQCv9KSdzZAv4l/xJU9OzBXwYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB8038.namprd11.prod.outlook.com (2603:10b6:510:25e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 15:12:58 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:12:57 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v4 25/28] drm/xe/pci: Introduce a helper to allow VF access to
 PF xe_device
Date: Wed, 5 Nov 2025 16:10:23 +0100
Message-ID: <20251105151027.540712-26-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0032.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::21) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB8038:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cb22982-edff-48f4-f600-08de1c7dcd84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0tNY3dncVVQZ2REUzY1SWZsWnRoZ1daWXM3Q0hWNDJobVJ5SlUwbmdVcVh0?=
 =?utf-8?B?VTJZUHl3eHZsTE5Yb2RnZUYwYmU2L0VUaWpOWHh1RGEvaEdDY05FeGtpMjRv?=
 =?utf-8?B?MUlORGU2eU81cHFLZytwcDl6MjR5MFk0eWxlaGszME9NZzN4cTZZUUY1TEpt?=
 =?utf-8?B?Mkp5b2FCNHNwVUF5b2lyK2NrYk9HV0huamJpN0tHWUhPbW1MdlJmTTQyOURO?=
 =?utf-8?B?cE9DN2ljYUJZeURPT3lpSFFnZEY4OHMwZENGZFROOFJ5a2hQR3JjWjJCVE9o?=
 =?utf-8?B?LytQdWh0YVd4WUNkNFIzMnNjcWlxTkI5ZFptSk1BcWFqSWd4aDVtcC82MTNH?=
 =?utf-8?B?M2JBY1hIUDVodEZlMm1JUmpGTkhjallaTHBCQnVxdjZja3Y1c1BqOW5xZC9B?=
 =?utf-8?B?a29XUXhPUUhXcHJMbTJRNlUzMFo4Q21TRXN1NkdvYWtrUHVrZVVrSUxLcEtF?=
 =?utf-8?B?bnlEL2lGTlU1RHdUZkdHWFE5Vkp2V2Z4bHhHWk9Da3NZUjFvd1ZpaXIwTzZS?=
 =?utf-8?B?SitjWktsWTkrNHRYbGF4QWZxVnpRLzZ1eG1rQkVsOTZxY0FpK2czenUyemdX?=
 =?utf-8?B?cklEdU1NN3hJWS90SzNjaFdwSUZZSjFIWGMwVnNyZHQ3ekpmdkw3TEJiVkhM?=
 =?utf-8?B?N09NQXJSaTNzRWpZVGxYSnBaN1h0TGx1UE52Z2NWWWQ3V0t1ZXhVQ0dnTXVp?=
 =?utf-8?B?cm1EcFJMREkrSUovR2pCVWFoNmswMFZZc2NncVEvY1lUbWpFdm9ycWVpa1hm?=
 =?utf-8?B?TkV2citFeFl4U1BPWXYwRzZFOFpCc1VhWW9IdHE0ZWpwNkZDeGlPbFJUaHow?=
 =?utf-8?B?d2h0YlBqR2I0Tjd4OGNQUU9XcVRnWGF6Uzh4bk5FeHBMMWlFYVRqQUQ4N1d3?=
 =?utf-8?B?M3Azb0dRZEwwRTl4c1RGOGoyRGpGMHN0aS8ySkVaZDVFZU5rd1dYaG1aeWJO?=
 =?utf-8?B?Q1oxMVd2VUU4TmNYYWxnS0x4cXlhMkZnak5RaVByeHI4MHRteHl5enEyeit5?=
 =?utf-8?B?d0pMdittaENPWWdDb3FraGJpcDN0UFZaWCtwd0hzUHdXUGR5cEZ6RjBzRGF6?=
 =?utf-8?B?dk5yOXVza1ZFeStCM0QvcEo5QjZvTjhtOFZqQ2JYNzV3Y3NaK2VwdXFvT0Y1?=
 =?utf-8?B?Mlk3UXYrak01ZjFzL1ZvZFdRbDJYbURHaFBjQ2RNSXV1MGV6K2s3UHNWSUZJ?=
 =?utf-8?B?ckZsOURCVHJGQjh2alpKNEp4ZDNzOS85TFQ3U1Y2TGpIbGU0bkRTT2NEa0ti?=
 =?utf-8?B?T0tqRy95bVNsekJSOCs3dEV2S1JEQUNzRG9pN2FoTE43NkVIM0p1eDNlR1ll?=
 =?utf-8?B?WEswUytQSzNNUlNVREw3QzBxUEVnR2w5RFVrMmVNZDhjeFVPbFlRZzluMU5y?=
 =?utf-8?B?YzlYa3ppb3AyOU4zYXU2eTN5cUFBOExqMmk1bkJSNzNwL29zYnUvNlFiV0po?=
 =?utf-8?B?cEQxdXJPOE5IVXQvTmpWTWVVSzF4SUVaSit1YzJGNy9jUHNFS2MvNW84YVB5?=
 =?utf-8?B?aTg4UXVsOHBwak9OdzFkZ3NPYXduSnNHMDBPSGNXRk1EMWtIeFFVYS9DZENM?=
 =?utf-8?B?VitaaTZxMHBteTZRRnJERWtYNmJjSjlRWkdiL3JLYmxWUWNyVXhxZHFQOXpO?=
 =?utf-8?B?QTZmdW5xZjI0bzhib2NsQW1PMndtajFmUjhZSmlibDFhUzBRbmxRdHh3OGZn?=
 =?utf-8?B?TlZYZUhGS1BjTzZpZzNWZUpPY3dnR1dpbWhpd1Fkd2dhcHRFcDNra0ppSmNZ?=
 =?utf-8?B?WHlPMnMrZFFqbGtFbGRmcGQvWUUwYlJYUkNlWExpVXk3Uzh3bkx4UDhVeGJJ?=
 =?utf-8?B?SWsvTnM0RWJyejJCblNvMFM3VDJDK3ZuTk1rMXE0Vy85VGNnRGRkME9DQmtL?=
 =?utf-8?B?T29wWnBhSzd0R2dROUtBS3JHWjVGRGxwZTYvZlNvWndNMWw3dzB3QnllTndt?=
 =?utf-8?B?MTdEU0V6TWxiNzZzWVFaM1YxUTBZRWErNlFyUkI1VXE3bHJPVGZSUEdUUXdH?=
 =?utf-8?Q?wNjL3YOe9WHHGCQxqBBIW9oQm37BuM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVFSanZYcDAvRGVYeHVqT3BCSEpVcGJlbko1YWQ4aUJ1V2MyYVBlRDFYZ29r?=
 =?utf-8?B?Z2RWeW5YYUZwbUhLRjFQMWErSGVwK0grbE5hVXVpK3pISS9abVVsZ2lOaE9F?=
 =?utf-8?B?VlY5b2dZZTY3RmFPK1FrUlZrSTdKSTg5dFdXT1VxUVZSU0RYOTVIRTdLU1po?=
 =?utf-8?B?dk9VRWRLeU1tT2wvK1NPb0cvMTFaZUN4NlJEVHJta2hnZDdQdElpY2lSTUdj?=
 =?utf-8?B?VFpocDhPN1pYK2Z2b0NiNXV3cjJDcTV0eWpXdWM2WGVhOWk0UytETlpaSUNp?=
 =?utf-8?B?RTZCMmx5NlJQNnhBSEcyZEVGMU5IZy9rQkpFTlZhUEFWbDZyRjljeHdLNjln?=
 =?utf-8?B?NGdHR1BwejR1WU1TNFBzV2J0c2VOamRYekgvK2FLKytPZWdDUUtqaGZMTTZz?=
 =?utf-8?B?bnlIWjMyQ2JhaVZ0WGZwTVNEaW1GRUhuYk5qRTF1bkNpeHhpQWw0bThQY2NL?=
 =?utf-8?B?TWpSVW54Sm0xR0Z2d0pLNjZ1VXFaN2VqbGJZZlVFbjFlYVRJVWJId0IxOGlS?=
 =?utf-8?B?enBvbWdHSjlLeEVBQU5VMW5vTFhyd0tkVlVBcXFkUzZjNUhHNE1pQXNoSUww?=
 =?utf-8?B?ZTdwTFlpbFp6dWFHRmlDYmx1VGdQRFp2WjgrL1hkMUdrQ2R4M283Rit4UytM?=
 =?utf-8?B?a25zb2c5MGZuYTdKWjEyU25STUxlcWhhSWp2VTk1WWRReGpaZU1xOE1nUUdO?=
 =?utf-8?B?L1gvL3JWK3BQa1A5Q0pydEl3dnEvVHZzY1JGZE9Zc2FncDJSZWJKWkRHcUI0?=
 =?utf-8?B?SGROMForRGVFbjRKUVhHd1lpaU13eitRZXBUaThhaFljSDdBeUJQUE9TaGJa?=
 =?utf-8?B?MCtHTUlySW43cWMvR0dFRjFjMlc1VEtoTmNZb0thSFRJZGp6MjJkRVVuemlo?=
 =?utf-8?B?ekQvYlFXdFp0RlFPaEc3aVRwcU1tR21FdXgrRUhYbFE2VHExaWtId1RuYkVs?=
 =?utf-8?B?VkR3TE1uaFJjLzJzRGRuK1d2TWtQaXFJb0ZZVmROUmRtZGJuSnhRWXUvVXNP?=
 =?utf-8?B?OUZmbWNxN3FTZHB3bTllZUFmQzZSaTVMSDZqcDBWZnc3dkFhaEt1WFFGTkFO?=
 =?utf-8?B?QU5mZGh1VGNRTE4vNkRHNzFUNlNBMWVxcEo3YjMzbGllbmxob3JiUlhmbm5I?=
 =?utf-8?B?Q1k0bElGTG9vbmlYTSt1Y3JoKzAva2EwVlRZMndXUVFPdEtjYjFYbEUwZkll?=
 =?utf-8?B?c0ZBTzA2Slp6cG1EbldLWUszTVZRTVorQ2o4SVZBdEM2UTBwcmtqczZUTGNU?=
 =?utf-8?B?Q1FkeWtvRURIUGZKblBEUVJXMlpVMjFLenljdEF4aEZnWkJlakVWbWIyRkQ4?=
 =?utf-8?B?Q0g5bGl6WnB2dWRYbDNHTTZyRXM0VktkdFZ0Z0E3a1cwdHc2SGJ0UlBrV0lB?=
 =?utf-8?B?MHB5K0pyR29iTTJ4Tll0SkkwRk9hYXpkWlQ3NHdqVEwyKy9RQmpWeGprQUM0?=
 =?utf-8?B?ejhHQnlJcmtxdmd1MXk1SU9BcGhKYWJ5eGxUQWFPS1RGalc2NUw4d1FHY09I?=
 =?utf-8?B?LzFoUjJENi81dGxOaThsbFJlNVBHdlZRaityaTBnTEFrYVJ3TlVURmNZOERm?=
 =?utf-8?B?WTZVRW0ydlZIYnN6b0h6VEZsclNNT3U0RTRFNmNwWkJNTStLNFltVTQ0Rm1p?=
 =?utf-8?B?TFo3YVJsQzhiUWJiRXVNZitDU2FlQzVVcU9CdmNXODBIQS9oZ2xubzcxRDZx?=
 =?utf-8?B?RGhRazVvbXA2ZVF1a1oxSFlsSEFyamg5UHlmZGVJbW9wL3k5NlR3bVVVTkdD?=
 =?utf-8?B?L1JVT3FyREFJc0dFMWh3UU5WZzRHTndlZmNWTHc2K05pRnVjajVFdFRieWpk?=
 =?utf-8?B?SDFOY04zd0wwaGJIaytuUnRhdzhtRFVQQVhERWlwSjMxVzA4VWhOZ2ljTHp1?=
 =?utf-8?B?ZGhUa1lqcTg3bXU0aVNNMXBGVS9sL1pwUUNocXBncmxyTmxyQ1dkSUFhOFp3?=
 =?utf-8?B?cTV0MEJ0cGxLeVZLNVZMM1hHV0hvclZpQWFQaUZlMUpZNzFPa0loaUx3TGlM?=
 =?utf-8?B?NTF2bHEyUHZXZnhKMXNnTnM3WllRblJXd3Eza3pmRTh6b1hXQ0pDdTB2NG95?=
 =?utf-8?B?UHNJS09TdkRtVGJ2cnNrYkYwUHF5dnJqUWJ4ZHd4WE0wUFl4LzZLeG5vL1dN?=
 =?utf-8?B?Z1dRUTJVTjNuM3hubVZhT09XSlEwam9kU2dWYnc0OTVuNmtlSldjM2VYVDAx?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb22982-edff-48f4-f600-08de1c7dcd84
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:12:57.9149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWVnNLYnBDnHQM+6IO+rK0xmn3p4Nt34Dr8pSgjofcJtqSLi9RUDjXjl+tmiAVzFV3BcjDDvtnBmCgw3sX5DDamyC5KR+JzPAhuAMhI1jOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8038
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

In certain scenarios (such as VF migration), VF driver needs to interact
with PF driver.
Add a helper to allow VF driver access to PF xe_device.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pci.h |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1959de3f7a27c..8b2483d1cbea0 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1224,6 +1224,23 @@ static struct pci_driver xe_pci_driver = {
 #endif
 };
 
+/**
+ * xe_pci_get_pf() - Get PF &xe_device.
+ * @pdev: the VF &pci_dev device
+ *
+ * Return: pointer to PF &xe_device, NULL otherwise.
+ */
+struct xe_device *xe_pci_get_pf(struct pci_dev *pdev)
+{
+	struct drm_device *drm;
+
+	drm = pci_iov_get_pf_drvdata(pdev, &xe_pci_driver);
+	if (IS_ERR(drm))
+		return NULL;
+
+	return to_xe_device(drm);
+}
+
 int xe_register_pci_driver(void)
 {
 	return pci_register_driver(&xe_pci_driver);
diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
index 611c1209b14cc..e97800d5c9dc3 100644
--- a/drivers/gpu/drm/xe/xe_pci.h
+++ b/drivers/gpu/drm/xe/xe_pci.h
@@ -6,6 +6,9 @@
 #ifndef _XE_PCI_H_
 #define _XE_PCI_H_
 
+struct pci_dev;
+
+struct xe_device *xe_pci_get_pf(struct pci_dev *pdev);
 int xe_register_pci_driver(void);
 void xe_unregister_pci_driver(void);
 
-- 
2.51.2

