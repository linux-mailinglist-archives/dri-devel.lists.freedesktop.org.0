Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3C0CCDE3A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 23:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD7010EBD5;
	Thu, 18 Dec 2025 22:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0fSHG2q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E89510E47A;
 Thu, 18 Dec 2025 22:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766098653; x=1797634653;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Bg+upyn2CClAUNgezCGpk/RE2iGgazyPXWNcTSleYsA=;
 b=K0fSHG2q9OvaD6O+yNXZ441dGaK27ioM1Dicwikc9GVhsj9EaWtE5Dx7
 JXZDqOiokR6mCCQcPgBK99IpT+RclCFsqymmsMELXXJ1Rr048cdVovPnt
 D03D9t1ozt4ZukvREeqWjfYmhhPjBDG3tpTeuXHXEnrnUxDahOTxPb3Aj
 H6BMGn8YdbCKpf8ixOE646fohkHshMdE9OnsjKVvQzFzucprW9epVeP8K
 TFXsVHNEOHrUl5Nro5EvA/uP8V8gTnXO+I6P2Q6kj161KM6YR9G7NF5RK
 ZGrxkUItLzRGeA/XG02ZOTSMk3hQ14RBkBx5nmjWBdHJzP8+5WH/4OY4B g==;
X-CSE-ConnectionGUID: 3ip/E7W1S/OvQXPBOVIIUg==
X-CSE-MsgGUID: teZteIX1RBy4/33UsjwsEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68100880"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68100880"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:57:32 -0800
X-CSE-ConnectionGUID: M2HhZ1DDRGmPjAkgxxd7KQ==
X-CSE-MsgGUID: dIbvPGLyTrWtp4JvVjz1ww==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:57:31 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:57:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 14:57:30 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:57:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfm/PQWMC/ffrZd0INWbbYDlYOULYk09iOHtrgvbdt1pNVMMqRuKJnYQu1yydg/mB+OUAmqxhaDs9PgfUzRFSwqxSXHbGYrNFPTl7JZ/VIjxGn/ULxI8jalkxG/8kctgEh0oXKum73MHTlrATf6fITBjF7QVG62CsdmmoXBIGvHy/bA5ykn+ZYMj45iv0CWp8XX0XFIMRn98MBPcHGfOQgi3xsDzcn1HSYXnQMSVWdP5H/47+pwBQO599I9ipzce0V0qK5V4ingBNUs9F1NDibjGmdSGFI5KrV8pVYBaJwzUT/mzsP5pPWyahafGeVhqOFcIbk2pfVoqUnGpfN/Xeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1Rx9CNRG3ypz9Ft4/hYs1xuwvoUJqcuiVFTdMlUHGk=;
 b=JY4qoIb6GOrt4nWnTfpQ9uWzRjhWA2eEiI8nTUXyD1sAc3DSjiAt8rVOQdZtjZnO1J8t2YTJD4rjJO8QkjtG7edCq3QQFEzY3zcr6JNGtlCJgrttARzWvZ6EDeU7C+LVG8dVtNvZtPwqY7xQ7cyWlqEbIy9BAWg294DohFs0Qdue2+XpWBr7Y7XRfXtYZFp5mlRbH/FNUMPKbbpF4vAUZbU2i2zUAW5kQsrDK7oru+2w2YBcNUbeceUQXfZZliBE2IxHSC1Oi/6TBeo4OOYRQPnIIsYAzesn79MaBAhapd0XMKDAAYqFS5Q0HGD8QIMYBb1Igex2ok0EBAh7ocNCVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB6678.namprd11.prod.outlook.com (2603:10b6:806:26a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 22:57:27 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 22:57:27 +0000
Date: Thu, 18 Dec 2025 17:57:23 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
CC: <airlied@gmail.com>, <david.hunter.linux@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lucas.demarchi@intel.com>,
 <simona@ffwll.ch>, <skhan@linuxfoundation.org>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix documentation heading levels in xe_guc_pc.c
Message-ID: <aUSG0zilXrushjTr@intel.com>
References: <20251209094836.18589-1-swarajgaikwad1925@gmail.com>
 <20251218064639.7474-1-swarajgaikwad1925@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218064639.7474-1-swarajgaikwad1925@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:a03:333::25) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 426c61f6-32b7-409a-6267-08de3e88d083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUhBSjVScGpXczcxazJNVEJGSkJUU01Uc2xybCtRa2FxTnJNWGY5OWxKdEFC?=
 =?utf-8?B?ZHk2Y0QrekxrSTVEZWllSmIvanQxVEY5M0NrT2NiWFJqSzJSNjV5ZWUyQjlM?=
 =?utf-8?B?K0laSlpjM0RKeDRSQ3BtTjM5cHpwT24wU3ZPVERaNmQrNXFXbElEaFZwNXFv?=
 =?utf-8?B?MWJidmd1d2Y5bWVqY2w2cExRUGErOGdoSWN5OEM3WGxYeGVkVXZZcXlYalN5?=
 =?utf-8?B?T0pXTTgvRkplUVNvU09PZEt0OE5WK3hiTUdqWVZjR3RlZ3hmanQ0UFZpRGhy?=
 =?utf-8?B?ZHU1cTJDZVl0eW5SMzNBS2tLL3BpQysxTnFQOG1yTXRhcUtDYmxCRjdZZkwy?=
 =?utf-8?B?N2pFMi92VmtycWlrUVhTUHhBVzBqUCtCWGFPeElHaFk0OUdvTTVmcjkyM0JP?=
 =?utf-8?B?WHY3cHladlRXT3Y2SGdIaHl1cWEwbHlFaEtjRUhqbFdKQWt4a09PVFh1Mk0v?=
 =?utf-8?B?YzNUWHJScTdvbUhCS0dNcnJtbGM2czlPcTc3aEpMOW8zL2o2bXo0MDN0K3gy?=
 =?utf-8?B?WkFZaEF6VUlMNmdBTVRpZlAzeXlYSG9BdEJ2WjZkQTQ0cG5MWlo0Z0Izb0hR?=
 =?utf-8?B?Ulc4aThOZStHR1JGVm5IMC94RFZOWnhDZkZZZHhCWUJZUER2clJPOEEzMERp?=
 =?utf-8?B?QWp4Y1hWOFh4WWgxbjBaUTAvcW5LZTFUNmh2SHhaN0dOVzR2S09BbWswKzZ6?=
 =?utf-8?B?QUorUnpFYlBvRndVRmlKK1Q2blJ2a3FlSHg3aFBVWlk5S0NUME1jdjdya3JH?=
 =?utf-8?B?UVA3QVYrbkcvYU01Y1FKcXVXM01LQm90T1VCMy9rUktUQWxJdUx2M0o5ZkN3?=
 =?utf-8?B?aEVHM2c0NlR2TG45Vmt3aElKNVZDYUpmQ2dUWTlpcGUvQ2ZLOVE5ZHhRY0JO?=
 =?utf-8?B?ZktMSWc0d2ZPUEJLT0RWWDNQMEoyc0I5U2ttQUxIS1RQVHhGU0tDWFBFOHhF?=
 =?utf-8?B?Mm5zbVZhclI1Q2dhNU5Zemt2T295Mzc3Y1U3aEFSWDJrRHJiajNqaHRIa2tC?=
 =?utf-8?B?WG1jZWM0RktDMnRzdGRlQnZ6OEEzc0Ywemw5cGIyU1Z4RGhZaHZrWFJOQ2Fl?=
 =?utf-8?B?UGdWYjI3cGUzVDRndkdLdjZFU3hiNnhLLzNxZnByMWJET2V1MnQ1S2c2a0Zp?=
 =?utf-8?B?VkJnV3pPaFFpakJDbGRYZmRmUU9SZkc5SmJKQzIvWVFZaGo5MTRaNFFMV3VM?=
 =?utf-8?B?c0tHQzBTOEkyazU1Z2JJNFdzSXJHbjgya0REQ01XZ2VjdTRqN1B4eUtYb1k3?=
 =?utf-8?B?Nkx0bkl3ay9Jbi82Z0ZCYmpHZSsxL3U1em9JS3RUWE0yQ210QWJVOE00cEJC?=
 =?utf-8?B?QVBtN3NibE9xNjg1bnZXUnNQYm82MHk1NmROZFhIeVN2NjBkRm5oL3Y3Tk1Q?=
 =?utf-8?B?R2VXeWMvdzBMUEx6NnFOa3d5QmlacHBNcnJaRkZsYytxbmVKZzZ1NFpxZ0ZK?=
 =?utf-8?B?UzNqSHo3NnBiYUoyQ2JGVDBSdEVUTVp6Sks1L1QxYU5IN1RVbUV2TjV5UU5W?=
 =?utf-8?B?aGZocjN6UHFhNG1nYVJkY1dmZklBRlBodGxuTHl3bEYzZmtQNElPVjh6NjZL?=
 =?utf-8?B?cXB0ME9Dd09lWmR6Q0Y1TW92eEhyZXBoQnVGcHg4MFRSSC9KYUU0STg3OHNq?=
 =?utf-8?B?R3ROQWY0VC9uaFhFY2NMWVMrN2VUOTQ5MjJhMGNLbFVobUY3bUtmK3NHOGlO?=
 =?utf-8?B?SFRoU29VdHpDdWVuQThQQjBmRnhha3paa2MrL3hTMmkyYmh5V20yN1llUnRT?=
 =?utf-8?B?blZjK01WUXZRMXMyMjBzdWVObG4wWnJJRmE1QkgwaDRaVDVIZGdYemZGNEtU?=
 =?utf-8?B?cS8rM3NqNTV5NDZWTXhYQ0dObFEvL3ZqMmZuWWwyYWo1SzJic3VacVQ5RE9a?=
 =?utf-8?B?a1lVWEgzUjkyVHB0YlZieUpBR0VrbHhVdGJaTGUyaGdwQjJES05kTnNnK2ZM?=
 =?utf-8?Q?Ht5DOo0S4x6qqPl0yaR0mmr7ehbMkEv4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjhPQktZaFBsR1NoWXJsc1VmamVwdUFRdkI0YVVTbHpJMWtmOEVCaXpJck00?=
 =?utf-8?B?QXpPeFo3N1EvYUdtZVdza045Q2o5NzFXSUowY1d6elRTVW00aXNxTTFFQkpU?=
 =?utf-8?B?UlN2YXM0QUl0ZUJqOXVXMVJxQzFVR0l3ZE8yZTJWcEtxYXpnaTlsSGJNK0VD?=
 =?utf-8?B?endsRzhBUGcxWjllb3RRb2VuY2FydWoyOEJ4UklHNTVMUjJ0SzJoeHhCbk93?=
 =?utf-8?B?SksxekFjb1gxN3pmUFJZSkgxNndLR0FFZnZhRE9PdUhRL0d2T1NqampCdnBk?=
 =?utf-8?B?VzZubGdHcUMvM25rSzhQT0VGQjQwS3QyeXVOemxDUmtwVTBVRmkzbXpmTEVE?=
 =?utf-8?B?MWlnbmVtcjZtMFRCc3REaVpKMTRkZ1JwZkZETW14WUhuTDA4Vk1FbFRZejlo?=
 =?utf-8?B?WUhoZlE4UVVhNzhZZk92cWFDOFk3RWw2Yjl4QkMyL0dQU2hQenREdzdpRHR3?=
 =?utf-8?B?ODh6ZllyYTRkdnk1aWVrR09qdURSNlZPV3JIYnJRNG53QjJsanNyM2dvcS9K?=
 =?utf-8?B?eVlLbHFNR1prV1MxMFF1TXhtNVhmeVh0UlBOVG16Z09KNjhxWXVBRmozMHd2?=
 =?utf-8?B?Z1pXdDVDTk13SENPd25Sci9ZWGVQZ2JiTXhIbU0zREFncERJSTF5Ri8wd0Zu?=
 =?utf-8?B?bWdHLzZ1QURDME9GYjdoWjVLS0RpN2tJMzIzWUszZUw1VlRTcUhCVUppZkNi?=
 =?utf-8?B?Qmh2eGM1M3hJdjlrRitIV1R2cnBuelA0RkFlM0FVUlRkMytGWGZNUDd1VFVL?=
 =?utf-8?B?b3ZaeE81NVFVdXhuSXB0c3pZR3RqNzVoOUNhbEFxRnFoR3UzK0RMZ3J0SDNL?=
 =?utf-8?B?TGJWL2tWTWZ6NkZkL0Z6RjByOXJ1QUNvMUtZYlV6M0liKzJ4cWJqUzB0OS9t?=
 =?utf-8?B?cmY3U1hGUUEwM3Q2WlF0akZ2Qk5QNjFHeUdFS1ZUY3l4SlE2WXc4U01PSUtU?=
 =?utf-8?B?eXUzM0ROaVAwYTBLZHR2UkhqanZtZk1WT1JTbS9JN2lLMXZzM3NjQTJqakdT?=
 =?utf-8?B?OUg0UnJOZXR4U3hQdFEvUXo2TSsyeWl1MGc5ZlprVDZGM1JQelhZK0VDbXVJ?=
 =?utf-8?B?N0phTXdWTU5IZEdncFB1S0F4NTlCZnpwb2MrY01qWnB3WUgrNU1GWER6bTdu?=
 =?utf-8?B?eDd2OFUwSEdyQXNIeVZ1NVNCMHlHTTJidjNEb3JtZytsRTZXOFVxUHBwTVVn?=
 =?utf-8?B?TUE3M0VHMkRUZk5kZGFwcC9HQWZrb2dVRDZhaEphdzc1TW03Ymh2RjQrMTFj?=
 =?utf-8?B?N3pydnIxN0o4MlYrZk5McDE5MjJJTzBlSnluQ2dBUG8xRGdZa2ZaMWV5YkRl?=
 =?utf-8?B?ZGZScnErMlR0djlrUEZ1bnR4bEpZb2Q3Y1F3L1dNTEJRbmtwNEVnTzdLZjJM?=
 =?utf-8?B?OW5VU1lQNlIyUXB0d2h4OXk1SFBSL00rT1pBMk9DK0RLS3NHVllCbTdNa2ZF?=
 =?utf-8?B?c3NhNEkwRWRVYzZQTlpkVnBXS3lIc2tJM2NWRmUrS2tuT3hkVFB6QTk0YWV2?=
 =?utf-8?B?akdybGFWVE0rcW8yU1d1YktleHFJWGZ2R1U2djJSMU8ycmlVOU9xUzAzcFJk?=
 =?utf-8?B?TVpzZnpwK1RvZGVmWHJLTXYwSjYwanE3Q1BQaVFmbjlkblRhS0VKOXRSVGdZ?=
 =?utf-8?B?cGVNWEZwclVTZ0F3YUVkQ1ppOUtMTEFxemdYbzA2Uk9uMkVWQnhQZUxvOE5w?=
 =?utf-8?B?azA3elNjNExJRzlBa0FrWXUzMk80bVpJU1hCMzVlc3F6R2pNT1ZuQ2ovZHFK?=
 =?utf-8?B?dGdIUDZIQkEzeUpJQldtZUM0SzJMNkp6M3MvaFFBMGV3SktPR2JYNEgyTGpE?=
 =?utf-8?B?REcwbFd6aUwrbDNUbnF6WDBkVFpVN2dwVzlDVlFrN3AvUjd4RFh2US9acXhr?=
 =?utf-8?B?UE1wZkowRXpDR2tCelcvWW91UVBVRzZ1UmVkT0hRdmJXRTRVWXpDRlJucUhL?=
 =?utf-8?B?L3R3TDZMY3hyNDcrNXNsQ2E5MW1BVzc0R2hneTFPT1Ewc2pPamJweTFGd1NX?=
 =?utf-8?B?dGZKZ0t5MU1tYzFkbDUwUWsrQlNYVnovbEZYSW4yeTVSUEFIcXBCUmJWa0Vm?=
 =?utf-8?B?Tk5rSUlWc0R2bllOMWc1L3ZMY2ZjQ2lTb05rZXI2MEtSRWtlVUNDY2dOdmJP?=
 =?utf-8?B?TVZZcVBaY25Wd0pobDc2dS9TUHZJVWd1MjgyQVBaMjdKYUppMEZXd3JZZlcy?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 426c61f6-32b7-409a-6267-08de3e88d083
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 22:57:26.9405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/ZQ05LHzgWSa4AevOLsK7hwPDTT/azdkSFxbOEgGHBylYdHgaTIuxwa3WQrYaeVB8qh5uOqvjK710C8RvFSCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6678
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

On Thu, Dec 18, 2025 at 12:16:38PM +0530, Swaraj Gaikwad wrote:
> Hi
> 
> I’m following up on this patch from last week. It addresses a couple of Sphinx
> documentation errors ("A level 2 section cannot be used here") that occur
> when building htmldocs.
> 
> Please let me know if the changes look good or if you would like me to
> adjust anything.

Thanks for this patch. I just pushed to drm-xe-next.

> 
> Thanks,
> Swaraj
