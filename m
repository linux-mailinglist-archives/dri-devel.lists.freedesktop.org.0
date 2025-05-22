Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F06AAC03FC
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 07:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF92A96B3B;
	Thu, 22 May 2025 05:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OiCImArJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0229FB7F;
 Thu, 22 May 2025 05:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747891551; x=1779427551;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GMIdprWgwi1pdHT2bnmWloGBYca048e9E4PCgtcbsdY=;
 b=OiCImArJg8WCnDTJrqQgefAqzFrgtAqC4crmLehfehQPJlRmSbX2J3Rl
 Ydo6gpfYHTiGQ/mUJ2q39Ceipq4q+79GzjcBWShXyb/nCcA5B5rnKkE1P
 VkfAmnSJW7d/HoyeCIorOy3b9tAIX+Zy/5T6N5Xgj/Kc8x37ccxQ6QQTO
 5JFnu/usz6nWKWl59ee/mWzGuUzpeCipAKUcYL5EOte/NbTbJRjjveEtA
 ViiskimEjaWybmWxpWTnOJB6WzWgE5d4ttNj2FVKMSvW+pGeV6chFoup4
 Ysul/GCdRlyHuHV5GjGhhqyK+Hh+bTYhb2odwHtsWLsCKMNdzBXBQt6Nd A==;
X-CSE-ConnectionGUID: YzSrVNhRR6+eqEmsO3HtkA==
X-CSE-MsgGUID: pJCOFgcPSYiWV4MI5aqysg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="50037656"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="50037656"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 22:25:34 -0700
X-CSE-ConnectionGUID: 0fTx2oEQTqS10OdOKU1jxw==
X-CSE-MsgGUID: hkdwXFLiReqfc8I16BQNdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="171415449"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 22:25:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 22:25:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 22:25:26 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 22:25:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbTtx7dfVcSFaVdNK1VY815bb3pEYpzMFZndIG/KVRrQRfOEVU4QWEg9yfKxI3sLRjTl0Xbo6ybtEl825v2vyyAJDr23btpVzlSVmfa8I8VddsChqJw0mRa1fpJ/MKGityRXretXvZRHZjGLLos/jd4lrRmd5dwKmYZ6Y/53jAYxBc9t7ok/KIC1GONsVn4a3ds3CAf38LkYjfwPvmSdKKr0ZJtrJk2nFUS2u7ZH6G08D/F412xkwKfA+W+0izMJ3VyrxVT960wUcCu91Rj9bRuzKfKjOYbLewofisXxtbZp5TA2zAcy6iiZjegl/cMgFgGFL1lZb6uXz/skW5VdRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMIdprWgwi1pdHT2bnmWloGBYca048e9E4PCgtcbsdY=;
 b=F7lDqprS0Att+q9w9CaHUIgcmIo3Xoqf1eMEi1t5tmnSLdY1dV4rLNfkwvOKLUFC5uETV49yx2BXVQy0T3JHe3s4OmYhZ1TBdbQxR9z+8ABexCgDvMltEu+m9osPpWGbHr2y9Bzfa5OrE869VtK/8m+8TOyTO1ZQy8o9rKcamSxPxzrPUSE2bZFXkhjl30DAuG2tcWsVIuYUYsLhq8fBHjUj1+MqQORojGuAHResVkNHMIQDrPNalGS1r3rS/WrPya7oqtxyWJhVVqRV4oEJTB7brCZLiabZiVVkrdYTXfiYS4gCzTYVQxDodt+kyYuZI/LWMpSka1KFWBt+juq7xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CY8PR11MB7059.namprd11.prod.outlook.com (2603:10b6:930:51::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.26; Thu, 22 May 2025 05:25:19 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 05:25:19 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "simona@ffwll.ch" <simona@ffwll.ch>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 00/12] Panel Replay + Adaptive sync
Thread-Topic: [PATCH v4 00/12] Panel Replay + Adaptive sync
Thread-Index: AQHbykcEp8a24XJb30ezjyF4XWEVFrPeHz+A
Date: Thu, 22 May 2025 05:25:19 +0000
Message-ID: <4ba5f8375dea2ee73b430730abd11cd45fd12fcc.camel@intel.com>
References: <20250521115319.2380655-1-jouni.hogander@intel.com>
In-Reply-To: <20250521115319.2380655-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CY8PR11MB7059:EE_
x-ms-office365-filtering-correlation-id: 143fcac7-8872-4a57-2b08-08dd98f10acd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UkFROGloVUY2RDNWWWJFZlpiSXhOdll0SG1ydmNEWkZoSUdvbThnYXJ1NEdr?=
 =?utf-8?B?SjlXL21OVXlFODdxSEpSYzcwVXl5dXlxdEpIb2Z1QmxzV2JWUU16TDF1ZE5O?=
 =?utf-8?B?bmo4cmUxY2VXckxjOHFPdTcvVFR0ZHFMVmJnNE5CRTZrcUUrWnhVNHZJSFQw?=
 =?utf-8?B?c3dqVmF6blZiaC9oMFREYUlEcWpqMWV1SGRxTWhwVU95WDN2QUg2SWlycmN1?=
 =?utf-8?B?OUdCRlJoUU9lM2lBaXJRcWpzQVZwbzJXNi9aRFRvRWVPYkhBcXk3NXprK0t3?=
 =?utf-8?B?azdlNDkrZlcyOUd5MUdQQTVqQjhYaU5QQTMzTnAvZmFqYnRZZlRIY25OUDJv?=
 =?utf-8?B?TThRdzltVXRkUXRFVm9yN3ZyUXVkK04rU2ZiK3lkYVFEVExFUlEvOVI4Wm9T?=
 =?utf-8?B?RVArSURCQ1R1MTV6aWlhN3NDbU0zRlVlZjMxZTg5S3luRktUSEFXWVZWNUhZ?=
 =?utf-8?B?OXVtRVhrelBReWNzdTYrWm55M054TlpTOG9WMFl4Y0RvQklLSFpqcWZvcU53?=
 =?utf-8?B?THNZNmgxaFp0WDk3OEkyamhrN08zUGxRWXFWa3IzSFNMNlZSbElQZUNleDJq?=
 =?utf-8?B?cEFMNi81SE5qRjRWa3RLbE9BRzQ1YldnbFJXYW0rRnVGbHF4NFQyRFRvRGpw?=
 =?utf-8?B?QmF6bVU2aWNlbU91bGxUcm0rbDVDbnNQdlluSzlxV1VNQ3BZc0FQQlJlRHV1?=
 =?utf-8?B?QUZFWjBhL1ZKeGRaZ3M3N1M1VVVXa2ViWkxBUnU5TjUxZDh4ejdsd1dLQ3Vv?=
 =?utf-8?B?cjExMHZXMzRpSitiREVibUlrL3JvNVZGODlOcnVwQzJFY2NkSzJSQXRHWHlz?=
 =?utf-8?B?MkVLbW5JbVVzaW55WkM4ZC9WMGMrN2d6MHMvT09GMnZ1NGZkS05PNXpTOTdB?=
 =?utf-8?B?Zy9kUWJnSVUvZFduVnpDQllCN1E1SHhJcFdReFFxTHlVWkYyb2pqaHlCWmdM?=
 =?utf-8?B?b3VIdVI2ZFVIRHh2UWRLa3hhMXRKVHFKMHhXQ21JN3Vlb3V2eHFUckZYTzEy?=
 =?utf-8?B?bHl2RGw0Y2dVM1pvcjJ1N3RMQ3BPOUY3bnNKNVBkby9XczJYRzJ5OGV3STlk?=
 =?utf-8?B?R1ZiK1lIemxHU0VYSGptRHJxNS9LZWQ4ZmMzWVN2ck1ZOGdoelBhN2l5V1Rt?=
 =?utf-8?B?SkVIQzZUUzMrNUUxVGxrdW1ibzJLek52cHVROTNrQ05Lc2Y4RGZBMlpkNm1x?=
 =?utf-8?B?bEtycE9JS2hhWUhNcm5SUVI0Q1hDMVJhelFZcnRuM2c0VVNtSjJQNFhYeEhm?=
 =?utf-8?B?R1Jab0Q1Vm1kd2NSYTdoREk5cmZSTlNNZkxLUXAvRzdJRmkwdnhiSUMveVY3?=
 =?utf-8?B?bVZTb2QzOXowUGRjRGgyMVV2WHBnMlNiNzA4akFVV3BjbFUvbFdiMDNNdmZE?=
 =?utf-8?B?eVRRbUd0MXpiUklyeVpFQzhRUGhNMGwxeWNzOGlhTGFiU242Tk5VeCtKdXBF?=
 =?utf-8?B?UVQxMjJWRmtndHdYZlRyU0lsSmUzS1lwdFBEWCtPalQyM2Erd3pINmZ2d1VK?=
 =?utf-8?B?SWpYVm05blZidHJ5MVltU2JyK1hwY1BJVHQxNUtJZStDeHhOazFGNWx5eFF4?=
 =?utf-8?B?OXhpd2thdGw1NXhpS2RhbVpmVHhEYTZpU2hTVG53OWJCWWh4YVE1M29qOHAw?=
 =?utf-8?B?VzVjNTVzYkZXREs1N01DcFdUTWxFOGZSMDNLM0ZnaGNoWDdvNTVCaXN0ZmlJ?=
 =?utf-8?B?SXJGK29mMlVVRUp2dnlFQkVCNnU3eWRPODE5ekNRcnRFMjlTckR6S3BiL3B3?=
 =?utf-8?B?MnVhVEx6c3R2eEJnY21ZUkJnNnpFUGpBeU45cjZ2ZVJTQnc4VlBTRXQza2JU?=
 =?utf-8?B?SHdDRk5FKzBjYk1TcUhyNVZDV3dGb2k4amdtNGRZWEJNcTB3SWVROEpzdHM5?=
 =?utf-8?B?MFBnakxnUllMRDlRdFphaUJtcGZLQ0F5dlZ0cVRoUmtQbHh4aVhmNTVWSHFr?=
 =?utf-8?B?MVA3UXhqdnRuYWFRZUprZkVyYTdoV2VpUDc3Y0ZPeTZDWHpzVUgydjRsLzJG?=
 =?utf-8?B?cnYvMUxOU2t3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHhPUXB1RTZscXBySDFxNlhpMmRnY3VqSWp4UndCbGhndUM0aGtDcjVQL0hZ?=
 =?utf-8?B?RTJ1N2VjeEVPZURBTEljRHM3dkRwUWJJZlV1c1ltRE5yUWxqZHk2dHBXSkhG?=
 =?utf-8?B?U1ppTnlySmdmTkRzVmQ4ZTVZQ2lIZ2szb3dHSHlJaTZra2d0dDZsS2R1Nlly?=
 =?utf-8?B?UlduSTExVmRkR1pQSUE3QWJEek9aWFljUUo2dS9DZFN3TUVNZG85aENZVWZY?=
 =?utf-8?B?a0Yzbmh4NnpSanc1VWJ1Qnowa2MvdnNLaWd1TGg3RHhYcVZGRkdremNiQXZO?=
 =?utf-8?B?RWtKRzBxSGJPWWp3bTFqcmtTRUdDbXhDMTZDaTFxZ0RONDJkRTlFcUR4cDRH?=
 =?utf-8?B?bXo0QUducTNCMVB2NktydEtQUXVUTEpVY2xiQVBVZVJ4TXBoWnBWcWNHZXFs?=
 =?utf-8?B?cUVkM2ZyWDF3bHp0OTNlcDY3TTA2aTlnYkhFTnI2MlVjbzFKTE1UVElyQ0pr?=
 =?utf-8?B?cStjY3BxMWljeWZIWFZXbHU5ckdhRGNVMTBycm5jUVZDOUo5Rk10cVY3RE82?=
 =?utf-8?B?ekwrRDNIaEF2MXg4UHZ3eWM2L1Fnd2ZtZ1MvMGZOamVWUzhIdXAwOC9yMll0?=
 =?utf-8?B?eEtZeWVEelB3aEtESzVYSjBabzg5TEdCMSt2OWdibSt1aXBlcUUwRGc0WFZF?=
 =?utf-8?B?Z3o1RWdsMXcvYkN6K3JSOUN0eko2TkhoRFQ5MkFSMlV6MnRKbzZKM1I3SXA4?=
 =?utf-8?B?OE9KYS95Yi9jOHVZWlVkYmhLM1hDNFBIVDBqOVczSkN3TEFvQjQ5RHUreDE0?=
 =?utf-8?B?REhaNEQ0eTF6a2t3S2FyYVlqRHBjMVg0ekU1bmtOYjRMQjJaZ1grTEpvaFll?=
 =?utf-8?B?cUorMDNGNkE0RHQ4VXhXRTMveGhGbkxSeVpYRkx0MVorRVpaQ0h2b3lVZGVt?=
 =?utf-8?B?SlNsWkpCTnlUclBwdXNKYjFjR0VubWpxL2NqYXIzZGpTRys0TENCUERiUEQ0?=
 =?utf-8?B?bmRNS0ordDFtRm5BN2ZIS1pSZWhnaXl1c3dLc0RYNkp1MXlqdWM4OGxGdXBL?=
 =?utf-8?B?MGN4VlNuU1ZVdW4yeDIxaGlpNHZONkRCbG1PeEZVUlVBOXNmdm9hcVJLKzdB?=
 =?utf-8?B?ejJuZ2dLczhEbXNhOThPNk9SMTg2UVh4V2dTL3pDV3BlaFA5bi9tQk5FSHY3?=
 =?utf-8?B?eWtrZjdXWm1FWjFOVkMrMngwelNpeWhqWkQwOHRDaTNkS1psazNwcFdkejBr?=
 =?utf-8?B?aUgyR2QwbzZ1bWUrL0tLSHZsV1dXc0FIbzdNZFpTRGlJWEhQS2duZmdjNW96?=
 =?utf-8?B?K25ocVg5b1V4WmZyTmxmZGF0LzhZVFNyUnp0ZGpCWlhLeFBsOE1yanp3dGY3?=
 =?utf-8?B?UEdiRURVVTc1Z2JFemZoSzlxOW9kQlU4SS9SQlREREZtdGNmaVY5UTk2RFlB?=
 =?utf-8?B?STlJaGlMUVZ5TFdhUjVYcTJTT29jY3ZJbkhhUjZjT2lrTmFuRHozL2ZYWjl1?=
 =?utf-8?B?ajRBUHZTT2JsSi9CNzlEZ0ZNR2JQWmRhWlZweFBkQklWaDR5bW12SHJxMmFY?=
 =?utf-8?B?endsZStGY3ZudFpwZnVqUEZsRTVwd21hUkp6eE9maGRWc0ZxdFJna0E4cE12?=
 =?utf-8?B?eGh4eENheEQ5MGFlcmxUSEprd001VGhIZEpmTS9iRlJ6djB2aHpDbVRpaENJ?=
 =?utf-8?B?NFh1RTVIM0lST2F3R3ZGaG1YaEdlajdHZVVCZFk5N3ZFR0traGwzSGxDZisv?=
 =?utf-8?B?T0t0M1hIYXhYWWZrYzB3V1ZXYXRVelV3cG5tWGpITW5kRHFKTk1nNXdWN2s5?=
 =?utf-8?B?bm1Jd3VLMGRRQ2FZaFRQVlBsVXBqaWxuMXJPcVJZVHNUVEtiVE1jM1JCNmph?=
 =?utf-8?B?SGZybmNEam55TnlTZFNoekJVTjE2Qkl6ZzdjWEtIRFhOanQzdERpU29xY3hU?=
 =?utf-8?B?dkNmYStORXVIMmdiRGs0N05QTnU0Z3F0Zkp3K01RMjc4SXExMno3Rzl4eDdz?=
 =?utf-8?B?M3BpUlZrbnRDVUlkMldJWk1OK1RPS0h4aGZCS3Vod2J3OVQ2VFhiWGRnWmkv?=
 =?utf-8?B?TXk2L2VtSmxlNUV6T3BJM1FhYjdpWnFwKzZUYjBPdkVpK2pSNFVFdk9mVkxi?=
 =?utf-8?B?U09XMzZMNmpqZ2VRTVRUaUpQUHhDWlRGd2F2L0NXbHpCT2tYYU1FamNSeGNE?=
 =?utf-8?B?RW84dmNmeXl1YTNUQ2kzeTd5MnBYamxNNHdVUC83L0IzMjlUYmZnOFpZVStN?=
 =?utf-8?B?dmFRRnRpSzRXSGh6cTI1M3ZFYmdhK0haSVpEajVqRHlmd3Y0NU12MWx5NjRw?=
 =?utf-8?B?WGV5bUpyVnUxZ1lMMVRqSUF1dmpnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EEB3ABB85E293645AC157F7E62E4F32C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143fcac7-8872-4a57-2b08-08dd98f10acd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 05:25:19.1811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W90vEF/v8S3tI+4d8VXRZ8N756ZytLOexS4vGU3iLXfjhU7YHLV9EH4oMUmFRXvxJpMSUIdG/FSQs5y2yXMXW0ZIhfiDw58vqWS/OxmV9C0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7059
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

SGVsbG8gRFJNIE1haW50YWluZXJzLA0KDQpJIGhhdmUgdHdvIHBhdGNoZXMgKDAxLzEyIGFuZCAw
Mi8xMikgaW4gdGhpcyBzZXQgSSB3b3VsZCBsaWtlIHRvIG1lcmdlDQp2aWEgZHJtLWludGVsL2Ry
bS1pbnRlbC1uZXh0LiBJcyB0aGF0IG9rIHRvIHlvdT8gVGhleSBhcmUgdG91Y2hpbmcgaTkxNQ0K
ZGlzcGxheSBkcml2ZXIgYW5kIGRybV9kcC5oIGhlYWRlciBhbmQgcmVzdCBvZiB0aGUgcGF0Y2gg
c2V0IGlzDQpkZXBlbmRpbmcgb24gdGhvc2UgY2hhbmdlcy4gQ2FuIG9uZSBvZiB5b3UgYWNrIHRo
b3NlIHR3byBwYXRjaGVzPw0KDQpUaGFuayBZb3UgaW4gQWR2YW5jZSwNCg0KSm91bmkgSMO2Z2Fu
ZGVyDQoNCk9uIFdlZCwgMjAyNS0wNS0yMSBhdCAxNDo1MyArMDMwMCwgSm91bmkgSMO2Z2FuZGVy
IHdyb3RlOg0KPiBUaGlzIHBhdGNoIHNldCBpcyBhZGRpbmcgbWlzc2luZyBjb25maWd1cmF0aW9u
IHRvIGhhdmUgUGFuZWwgUmVwbGF5DQo+IGFuZCBBZGFwdGl2ZSBTeW5jIGVuYWJsZWQgc2ltdWx0
YW5lb3VzbHkuIEFsc28gc29tZSBpc3N1ZXMgaWRlbnRpZmllZA0KPiB3aGlsZSBkZWJ1Z2dpbmcg
YXJlIGZpeGVkOg0KPiANCj4gMS4gU291cmNlIFBPUlQgQUxQTSBjb25maWd1cmF0aW9uIGhhcyB0
byBtYWRlIGR1cmluZyBtb2Rlc2V0Lg0KPiAyLiBQSFlfQ01OMV9DT05UUk9MIGlzIG5vdCB3cml0
dGVuIGFjY29yZGluZyB0byBIQVMgZG9jdW1lbnQNCj4gMy4gV3JvbmcgcmVnaXN0ZXIgZmllbGQg
ZGVmaW5pdGlvbnMgZm9yIFBPUlRfQUxQTV9MRlBTX0NUTC4NCj4gDQo+IFBhdGNoZXMgYXJlIHRl
c3RlZCBvbiBMdW5hckxha2UgYW5kIFBhbnRoZXJMYWtlIHVzaW5nIG91ciByZWZlcmVuY2UNCj4g
cGFuZWwgc3VwcG9ydGluZw0KPiBBZGFwdGl2ZSBTeW5jIGFuZCBQYW5lbCBSZXBsYXkuDQo+IA0K
PiB2NDoNCj4gwqAgLSBhZGRlZCBEUF9EU0NfREVDT0RFX0NBUEFCSUxJVFkgZGVmaW5pdGlvbnMN
Cj4gwqAgLSB1c2UgZGVmaW5lZCBzaGlmdCBpbnN0ZWFkIG9mIGhhcmRjb2RlZCB2YWx1ZQ0KPiB2
MzoNCj4gwqAgLSBjb21tZW50IGFib3V0IERQMi4xIGNvcnJlY3RlZCBhcyBEUDIuMWENCj4gwqAg
LSByZWZlcnJpbmcgcGF0Y2ggcmVtb3ZlZCBmcm9tIGNvbW1pdCBtZXNzYWdlDQo+IHYyOg0KPiDC
oCAtIHJld29yayBQYW5lbCBSZXBsYXkgRFBDRCByZWdpc3RlciBkZWZpbml0aW9ucw0KPiDCoCAt
IGRvIG5vdCB1c2UgaGFyZGNvZGVkIGluZGljZXMgd2hpbGUgYWNjZXNzaW5nIGludGVsX2RwLT5w
cl9kcGNkDQo+IMKgIC0gZW5zdXJlIEFMUE0gcmVnaXN0ZXJzIGFyZSBub3Qgd3JpdHRlbiBvbiBw
bGF0Zm9ybSB3aGVyZSB0aGV5IGRvDQo+IMKgwqDCoCBub3QgZXhpc3QNCj4gwqAgLSByZW1vdmUg
a2VybmVsZG9jIGNvbW1lbnRzDQo+IA0KPiBKb3VuaSBIw7ZnYW5kZXIgKDEyKToNCj4gwqAgZHJt
L3BhbmVscmVwbGF5OiBQYW5lbCBSZXBsYXkgY2FwYWJpbGl0eSBEUENEIHJlZ2lzdGVyIGRlZmlu
aXRpb25zDQo+IMKgIGRybS9kcDogQWRkIFBhbmVsIFJlcGxheSBjYXBhYmlsaXR5IGJpdHMgZnJv
bSBEUDIuMSBzcGVjaWZpY2F0aW9uDQo+IMKgIGRybS9pOTE1L3BzcjogUmVhZCBhbGwgUGFuZWwg
UmVwbGF5IGNhcGFiaWxpdHkgcmVnaXN0ZXJzIGZyb20gRFBDRA0KPiDCoCBkcm0vaTkxNS9hbHBt
OiBBZGQgUFJfQUxQTV9DVEwgcmVnaXN0ZXIgZGVmaW5pdGlvbnMNCj4gwqAgZHJtL2k5MTUvYWxw
bTogV3JpdGUgUFJfQUxQTV9DVEwgcmVnaXN0ZXINCj4gwqAgZHJtL2k5MTUvcHNyOiBBZGQgaW50
ZXJmYWNlIHRvIGNoZWNrIGlmIEFVWExlc3MgQUxQTSBpcyBuZWVkZWQgYnkNCj4gUFNSDQo+IMKg
IGRybS9pOTE1L2FscG06IEFkZCBuZXcgaW50ZXJmYWNlIHRvIGNoZWNrIGlmIEFVWExlc3MgQUxQ
TSBpcyB1c2VkDQo+IMKgIGRybS9pOTE1L2FscG06IE1vdmUgcG9ydCBhbHBtIGNvbmZpZ3VyYXRp
b24NCj4gwqAgZHJtL2k5MTUvZGlzcGxheTogQWRkIFBIWV9DTU4xX0NPTlRST0wgcmVnaXN0ZXIg
ZGVmaW5pdGlvbnMNCj4gwqAgZHJtL2k5MTUvZGlzcGxheTogQWRkIGZ1bmN0aW9uIHRvIGNvbmZp
Z3VyZSBMRlBTIHNlbmRpbmcNCj4gwqAgZHJtL2k5MTUvcHNyOiBGaXggdXNpbmcgd3JvbmcgbWFz
ayBpbiBSRUdfRklFTERfUFJFUA0KPiDCoCBkcm0vaTkxNS9wc3I6IERvIG5vdCBkaXNhYmxlIFBh
bmVsIFJlcGxheSBpbiBjYXNlIFZSUiBpcyBlbmFibGVkDQo+IA0KPiDCoGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jwqDCoMKgwqAgfCA3MiArKysrKysrKysrKysrLS0t
LQ0KPiAtLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5owqDC
oMKgwqAgfMKgIDQgKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2N4
MF9waHkuY8KgIHwgMzIgKysrKysrKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9jeDBfcGh5LmjCoCB8wqAgMiArDQo+IMKgLi4uL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2N4MF9waHlfcmVncy5oIHzCoCAzICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RkaS5jwqDCoMKgwqDCoCB8IDEyICsrKysNCj4gwqAuLi4vZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmjCoMKgwqAgfMKgIDQgKy0NCj4gwqBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jwqDCoMKgwqDCoCB8IDQ0ICsrKysrKyst
LS0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmjCoMKgwqDC
oMKgIHzCoCAyICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzcl9y
ZWdzLmggfCAxNCArKystDQo+IMKgaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyNCArKysrKy0tDQo+IMKgMTEgZmlsZXMgY2hh
bmdlZCwgMTY4IGluc2VydGlvbnMoKyksIDQ1IGRlbGV0aW9ucygtKQ0KPiANCg0K
