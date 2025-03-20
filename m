Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91395A6A801
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 15:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71CE10E60F;
	Thu, 20 Mar 2025 14:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="THrNirSv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D856E10E60F;
 Thu, 20 Mar 2025 14:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742479829; x=1774015829;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=llRBksXk8F2VpdjMCEeD9PtqTsaOW78bh6JqIcZWMUg=;
 b=THrNirSvwJl/dcr3dSWG5i+G272l0wQ/xuElcCfJ7YXNoGfr49wz7HHs
 aFufhoYZcpzWK7j5yL0aAnPSOdYXui4OcMJuV1gO/5gqXnoqZywTKCsWQ
 DqgwGdL9EJuMK20YjMYwOLXszdYMhi/R99QHKtDmSsWjXZ7GFvPyLIs5q
 Tjt3hiQQrQEzonANM9jbC7QQIAtvgiPL7CqtjjjtCfkNlZuzqAl5LRnhg
 UHJdCXlndx74Hz3DelpFo6coU5OLFFsSycYTHCj4Xd9IPuxfv43bCxbl6
 zBaUJGFKvcH9DtiV8TTqHOcOapB388s+NqQEyrmnAipQRjYY5j0PazEa/ g==;
X-CSE-ConnectionGUID: hvTqAAdmRSWuanmpKY/5ig==
X-CSE-MsgGUID: 4Y/20iP4TMOwTVxduohbSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="53930836"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="53930836"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 07:10:29 -0700
X-CSE-ConnectionGUID: gEQSsmk8ROao+hDn8e7QEA==
X-CSE-MsgGUID: AoqpMZhFRtqUW8JoE86KXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="123860782"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 07:10:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 07:10:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 07:10:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 07:10:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLwxeujot9mFbKuIBipohhrGm8qpS0cwlh6yfTtLJAeyNqTqBSK6zrdGwmMG27GmfJSX44I3uzZX8cmtizLpmAh182rBN9EB8bmQ40teeup7wc6KlPvgrsPle+PZwcIQm0IgfRH4muJ0uzMUAP6YIGeq+3QClU9bgx2KT9yIfHMPWvsnoUsBkZRLRAC6Ms7d7PbfB7+/c1gJEeaAKhWDnFlRJujBaqFuJiUQAntsj0y9sAZwQ8On3fvzKb3q7jQtNdqMHqn8QwCYnvx2xxKKR3vl1jARQR/tW7BchcRsAwtJYssCVnsb833SkY1dNE/dozkXst4gg+BMOJklueH18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llRBksXk8F2VpdjMCEeD9PtqTsaOW78bh6JqIcZWMUg=;
 b=vB/5/W2YKd6vXFmXl8blfXnwNqrZ8zlWCatDobqtwHIrG8Dl3xf8PKkygerdAeBe7ycaY8WFeWKwv8Y6jYZKGXlerG+OBaKagSuKCEWzORCGN0OidK3D9eONCTf5YrtyWBG0tSY3FjKJWXLPicPvGxLJmnPpO4lN8KY2NK8/0YcEMA3l+DBoGZ7cRV3YeZG+RVFgLfAutSts/NKvwmiUMEMqO9fDu126aUWfnTu5vDWOOOzlTZqZw50Z9Tf2fiwO+BWG5PJNa6iar2xYkQ5HLdKmGf8JqzLujiA2t2sVV1DStakGeYr/dwk/SGUKBBl9yxR6+VuXIbOb66LWdnOrXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB6350.namprd11.prod.outlook.com (2603:10b6:8:cd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.34; Thu, 20 Mar 2025 14:10:24 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 14:10:24 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "michal.mzorek@intel.com"
 <michal.mzorek@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v8 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Topic: [PATCH v8 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Index: AQHblEaOnnQwskdVv0CO6Lem3mkV/bN7LPqAgADt1KA=
Date: Thu, 20 Mar 2025 14:10:24 +0000
Message-ID: <CH0PR11MB54449F317FF5D5C0C1F78019E5D82@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250313183415.133863-1-jonathan.cavitt@intel.com>
 <20250313183415.133863-7-jonathan.cavitt@intel.com>
 <e2600ee9-b9ed-4f5a-91e5-6df1cc20f650@intel.com>
In-Reply-To: <e2600ee9-b9ed-4f5a-91e5-6df1cc20f650@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB6350:EE_
x-ms-office365-filtering-correlation-id: 3fed73bc-3622-4b50-c5da-08dd67b8f53e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?bXQ1RnFENUJxWGo0Z0lOd1RaRm9MYjZ3TmpQWjB4bDhLVlFxM2xhK3BNZEI1?=
 =?utf-8?B?L3p6eGgwVlBMU2NORy84b2tzdHNkZ0dRb1ZzQXBzSlQzdHB6L0JNdGxmQTk3?=
 =?utf-8?B?QjhncWluVi9sa3JmZGdCMU1aMWFZaXFvVnpBL1l0NlZYSlRZRWRKa0poSlpa?=
 =?utf-8?B?dDRSQXpZcHYxVjBuN1pvV1JyditFTWlEckJFNzJYdjRLU3FUbnNsOHlPUVBl?=
 =?utf-8?B?V0EvdmdGVE1YOURWYXZJSGt5WmFyeHNaWDBTT0tqSlhVOU1zZWtMWW9FUVQ5?=
 =?utf-8?B?TFU4Z0cxaWZ2MnVkV0ovcmpaR2dPWVVNQ1ZpQU9TM3FLNXFpT2VwbFNibEVB?=
 =?utf-8?B?ZVI2MGliTjFXY0xxN2p5SGUveW9xUUMxd092L0JWZTN1VnkzZk0zRnJqQ3NT?=
 =?utf-8?B?dks4aHJPSHk2TFVlKzNWSHdKbDJmdnhDMzNxN0Y4ZzQxUGUrSElIeFc1SllB?=
 =?utf-8?B?MUFrQUlXWjJlRFZkcHZ0T2xxUm91aC9sVkVtcnBCcjhuOGdwZjhSN04wTkg3?=
 =?utf-8?B?SnJVaG9xWEFqVzZEeUd4RUJrRjdXSThHd0lNWDdoMmVTTGJGZ3JHa2RvZHZi?=
 =?utf-8?B?ZFpuSGxwRXFOQzcyeldiUEVCVyt4dXZpYTlrdWRKQ2U5b3h5aFJNRWkzUlFY?=
 =?utf-8?B?THdHdnFGVklvVjFCTklkK0V2QVZ3Um9vaWJZUmVZTjZBYzhRdUpSYkpCdzVW?=
 =?utf-8?B?eEZydVJVZUZDeHFRVFVNUWgxYWlUSVlKb3VWQWZsZW9EL2h3L3lRcldTVVBP?=
 =?utf-8?B?a2FLWnhScHpnUm4yWUtCZ3FxTUt6VVpkdmVkUUpMWVBYWHlTbStkU2JhcVg5?=
 =?utf-8?B?RHZkMy9qbXdVanhCRlVvSWttUGQ1eHA3UE5FWUwvZVFkb09FaXZSWXR5Njdy?=
 =?utf-8?B?Q0JyZlVuVDhPYkt1dnhmZmNHZndRaGc3MlpSaFhTb0R2Q2ZWUUlGZ29oUElM?=
 =?utf-8?B?WHlZRWJRVm51MnQwK1dqZzFFcmx2WjJScUhIZ1QyNEhGNzJ1UU5kUm91MlVl?=
 =?utf-8?B?Z2U5SnZndmxqZ0RwVUxGSGpJbHVwQ1J2ZTZ5R0pJSkhjaTloN2hhZHlVaVhx?=
 =?utf-8?B?RUJxMysvYjRqMTliZ1JydVN2U1Q0R2NFVjhZa0k0dmhhdWJjWWRVTGlIOUov?=
 =?utf-8?B?UWpyRFJ5cHQ3QkRFRVltL2hLeVVSRHJFaldORHdxeXlZUG53WDVaclNzOE1Q?=
 =?utf-8?B?RUF5TC9ISUR1L2ZDTzc4cnRNK1k1ckk4dWx5a01tMVpwNE1GRVJDS0kxY2E4?=
 =?utf-8?B?ZXBxL214VGVldElFaEdseWlQQzNBMkNXdTUwWTR6aTdPM2tRcmo2ZGEydkcz?=
 =?utf-8?B?R0liUGUvUDFhQnBueXovemgxaGo5TWovTlMyTDN1b0xzOUFlZWo0bE1hbXNp?=
 =?utf-8?B?MXhTd2Nxbk5Mb1BIOWcvSDZVbEpFWDVJNkJIdGhsMDhuNmJOWVA1YjJTSWI4?=
 =?utf-8?B?QUVyYVFTU0xZMHE4aWR0UUxJOXdFSUpwMGloSy91RXNsZ2pEREFaMDhVNnJU?=
 =?utf-8?B?amtVeGh6UWJzM0x1ZjAxUUJ3UmMxTkhjRjRpdGJGVDBKTmNpdVZUUFJ0dktr?=
 =?utf-8?B?aTB1Ym5zdkJ4VXBNd2kvNllNb1lBTk0xbkJSODBMWG5DR0dhc05FRHdGQmpv?=
 =?utf-8?B?VUZyODJWNXNNOHdBNi9zb082bmNqZHEvM0phbHNEMkUwNG0yNEVyRVJkYWZY?=
 =?utf-8?B?SFU0czB4U3lkeC9rRHBTZy9aQmd5ekhCakxueFd4MjdFWHRtVXVMVHV3a2tJ?=
 =?utf-8?B?ZzZPSEttQjg5YlNkd2VOZ0phTll0cERHcG9uS0U5L2dKbkdDNnNOYi9RTXN2?=
 =?utf-8?B?L291V0pEUmZsVEtLUVQ1WEZDTENiTDZ3aElyNXp1NmdrSVFON3JqTzRkTVh2?=
 =?utf-8?B?RitQVUYxVTZNR2hNRUN0MXZiMUhFY0FNeWVJSnZkeklEN2xsbHRtZFNKL3Na?=
 =?utf-8?Q?F0Q+1+U/F7EcSRaZidJc9D6+kQwENxC5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Si8rT3RWd3JEYjFwUk9aU0U2U0ZXTkFSQk9GY2FBNURnWEhxTVNTY1FtaGND?=
 =?utf-8?B?d0h4MGZCZjZTV0RQV1NJVllMUUU0cFVESGQzais1Z3lCTFo4V2krK1UrenM1?=
 =?utf-8?B?M1p1WjVaTnRjSDJTQ2NsQ1VqajMxSWJXdmFIVjhQN2dQVm9Vb3Uvdm0wM01H?=
 =?utf-8?B?cWZQdjdmSG95UnVsbURWTG5lZUUwQlBlRXhZMGRjZFJQZVgwdURWUnJ6SXp4?=
 =?utf-8?B?R3NrYVg0TXQ4aWpQSVpEekp1MGFyVVZJWlpVU1dIajZFT3Q2VGhIVDZVWG5J?=
 =?utf-8?B?eTdPZjZiWmhkeGxMTlpaWlRlb3U5SDdwUkNFZ0Z4Y203RzQzTEtFVi9MS3Fm?=
 =?utf-8?B?VFAyRG1Fc1pYV0VoUVU2QlBhb0RmUTR4NHJOWW5FQlI0YmpLa015aGhoK3VG?=
 =?utf-8?B?bE90RUNMUjFlbjRhcVdEeFRUN1pheGhHZGNhVlRJNEpHcnVmUThIY1BjcEh6?=
 =?utf-8?B?eitLb3ZDUE1mbTJ1QktuMnJjczhGTDk1TXlmNzY1SEJmcEQzeEpXZUs5ZHZY?=
 =?utf-8?B?akJ2OTRYSEIrR2xEUDRObll0NkFGUUdxUUhMVVVmdk82YkN3VkkwaFpIM2Ju?=
 =?utf-8?B?TWRKRWhRejVEZXIraG5xelJpZmhRV2ordERsQ1VpMkJPZlFIYWhnQUxObDRS?=
 =?utf-8?B?WU5BV0JxbHNMM2JpMjM3K3ZZc0hsdjJkNTh0WUM5aGkxWXNKWlFPSldWWnlZ?=
 =?utf-8?B?L0JQMTV1bTRGOEw4QWhhaEhEc3piUnJDVnRtbzBidlkyaU1ZWXBleEVSRlYy?=
 =?utf-8?B?Y3Q3OWZYbFg5dzUvRmRRc24raFRBTUFoczBIQXRGb2VDODJxaCszK0ZXQzkr?=
 =?utf-8?B?M0kzZHVVL1BHa0VuNUNybjZUSkFyNFNQZThWTUxpODEvUWtjWVlsT3kzYm1B?=
 =?utf-8?B?S3lGdmdyelRicEN4SFF4M0VCKzhGdlVPMVN3eUEwRDlXdjQ1V1lNZnovYjA1?=
 =?utf-8?B?anhWeGs0TGFTMC9uRWhGYmtUYmV4djBIOTFHZTdENSszSTl6c1RNME81cUhG?=
 =?utf-8?B?RkZJQ2ZUZTdaZE5FZmVuOGNONkxSTTJEaUE5WWlLM242dnkzVTdScGxBQlR0?=
 =?utf-8?B?MXcrUGJHa1doOUxIUkRJbnpUQjFGU0RyenFQRlBiaXRBdEVvSlNacVhXZSsw?=
 =?utf-8?B?SXRqTGZ2cTR1TjF3RUQxYjZJSThxSlk0NEIxMVZCVGdURm5mUVNhNVBGVmVw?=
 =?utf-8?B?UGpIU1N0SkdTWFVYOG96cGMxOWY0Z3prNE9ZSmxyU3JmdFAyTndiT3BDaTJP?=
 =?utf-8?B?ZmlBRWNmM2RJbWpUNUc3bHhIWWg1Z2FIemhGZWJ3WEZrUnQxREpGUzVCb01D?=
 =?utf-8?B?Q3NFTk0rMWJFT1laU0JxS21Cb2dNRmJhUW1OdnpnUzhKNnlBcUkzS2tteTV6?=
 =?utf-8?B?TnBSRjFySElzbDdqMWdOVE1FcC9Jd0xPYTNObGZtV1Fud1NLaEhObWhvaHRz?=
 =?utf-8?B?b1RCOG9aUDdUTlBtNXZOK0RaVER3dnRnRnljS0dkcUJPRzYzTVR5dG1iWmU3?=
 =?utf-8?B?TzRkU21wU0tGZFR6Z0dhRjc0VjNaMUlyYVYwOGorSlRpb2Z2RVgrbzExOG53?=
 =?utf-8?B?WWxlMHpjUFdBbTFOZEh5TVpxS1NGZTg4TTV4Y0c4K0RFU285K05oTTFJRkZS?=
 =?utf-8?B?K080b3FNMW1QWUM4YnN5MStzWGlkNllhWjFMRThrTS9QVWxvb1dNUGtkWmFV?=
 =?utf-8?B?ZlVFamVwaVpDR2h6Vm1vdjZPMGU1TUk1MEhTekJnNm83L0phdmV3Y0ljeVNi?=
 =?utf-8?B?NzNhK29ON05zR1RQY3VZM2Vodkt6SSt5a3VnUmIrZ3R3L2EzZ2pMMGtMaDZR?=
 =?utf-8?B?dU52eHVHVHNKUTF3YWhmR1Iwa3pzaWlDMVY5ZlRmbWV1RytYWUJRczJHR25s?=
 =?utf-8?B?Zm0wQjFyRmJrMXBGMmZESjN4SFhJVzAyMVNtZ1N2WElYVkZ2cEdDblJQZVZX?=
 =?utf-8?B?UmozMnBpcnVGaWhJa2RjRkFjUUhsemh3ckNMU2RPMlplNUxFRjNHOXhDQ0Fa?=
 =?utf-8?B?SDZsUzFERDBETVNBVW5aSEo4S1RLU1J5aG9EMFFwOEtQR3o0RjVyTlVsNTJ4?=
 =?utf-8?B?NHJoNDErS2h5MHY4VkpBSVJyNExQd0xBeVRlbytvclhydnhaa01saE9nck1z?=
 =?utf-8?Q?s0l6CGVEVyNA3BhMK1IM8UuJi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fed73bc-3622-4b50-c5da-08dd67b8f53e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 14:10:24.2377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RVoEHovTBK+zfMLI7ySG7ni49PVhLbEwNwRAEcXGc1Bs4zY5xzRuQv3agcN/bBYbrmySzThxKF/nKA1VERUEqnniD1quyhBWE43JOz6xHyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6350
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFpoYW5nLCBKaWFueHVuIDxqaWFueHVu
LnpoYW5nQGludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE1hcmNoIDE5LCAyMDI1IDQ6NTgg
UE0NClRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsgaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogR3VwdGEsIHNhdXJhYmhnIDxzYXVyYWJo
Zy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT47IGpvb25h
cy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb207IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0
QGludGVsLmNvbT47IExpbiwgU2h1aWNoZW5nIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT47IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFdhamRlY3prbywgTWljaGFsIDxNaWNoYWwu
V2FqZGVjemtvQGludGVsLmNvbT47IG1pY2hhbC5tem9yZWtAaW50ZWwuY29tDQpTdWJqZWN0OiBS
ZTogW1BBVENIIHY4IDYvNl0gZHJtL3hlL3hlX3ZtOiBJbXBsZW1lbnQgeGVfdm1fZ2V0X3Byb3Bl
cnR5X2lvY3RsDQo+IA0KPiBPbiAzLzEzLzI1IDExOjM0LCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6
DQo+ID4gQWRkIHN1cHBvcnQgZm9yIHVzZXJzcGFjZSB0byByZXF1ZXN0IGEgbGlzdCBvZiBvYnNl
cnZlZCBmYXVsdHMNCj4gPiBmcm9tIGEgc3BlY2lmaWVkIFZNLg0KPiA+IA0KPiA+IHYyOg0KPiA+
IC0gT25seSBhbGxvdyBxdWVyeWluZyBvZiBmYWlsZWQgcGFnZWZhdWx0cyAoTWF0dCBCcm9zdCkN
Cj4gPiANCj4gPiB2MzoNCj4gPiAtIFJlbW92ZSB1bm5lY2Vzc2FyeSBzaXplIHBhcmFtZXRlciBm
cm9tIGhlbHBlciBmdW5jdGlvbiwgYXMgaXQNCj4gPiAgICBpcyBhIHByb3BlcnR5IG9mIHRoZSBh
cmd1bWVudHMuIChqY2F2aXR0KQ0KPiA+IC0gUmVtb3ZlIHVubmVjZXNzYXJ5IGNvcHlfZnJvbV91
c2VyIChKYWlueHVuKQ0KPiA+IC0gU2V0IGFkZHJlc3NfcHJlY2lzaW9uIHRvIDEgKEphaW54dW4p
DQo+ID4gLSBSZXBvcnQgbWF4IHNpemUgaW5zdGVhZCBvZiBkeW5hbWljIHNpemUgZm9yIG1lbW9y
eSBhbGxvY2F0aW9uDQo+ID4gICAgcHVycG9zZXMuICBUb3RhbCBtZW1vcnkgdXNhZ2UgaXMgcmVw
b3J0ZWQgc2VwYXJhdGVseS4NCj4gPiANCj4gPiB2NDoNCj4gPiAtIFJldHVybiBpbnQgZnJvbSB4
ZV92bV9nZXRfcHJvcGVydHlfc2l6ZSAoU2h1aWNoZW5nKQ0KPiA+IC0gRml4IG1lbW9yeSBsZWFr
IChTaHVpY2hlbmcpDQo+ID4gLSBSZW1vdmUgdW5uZWNlc3Nhcnkgc2l6ZSB2YXJpYWJsZSAoamNh
dml0dCkNCj4gPiANCj4gPiB2NToNCj4gPiAtIFJlbmFtZSBpb2N0bCB0byB4ZV92bV9nZXRfZmF1
bHRzX2lvY3RsIChqY2F2aXR0KQ0KPiA+IC0gVXBkYXRlIGZpbGxfcHJvcGVydHlfcGZzIHRvIGVs
aW1pbmF0ZSBuZWVkIGZvciBremFsbG9jIChKaWFueHVuKQ0KPiA+IA0KPiA+IHY2Og0KPiA+IC0g
UmVwYWlyIGFuZCBtb3ZlIGZpbGxfZmF1bHRzIGJyZWFrIGNvbmRpdGlvbiAoRGFuIENhcnBlbnRl
cikNCj4gPiAtIEZyZWUgdm0gYWZ0ZXIgdXNlIChqY2F2aXR0KQ0KPiA+IC0gQ29tYmluZSBhc3Nl
cnRpb25zIChqY2F2aXR0KQ0KPiA+IC0gRXhwYW5kIHNpemUgY2hlY2sgaW4geGVfdm1fZ2V0X2Zh
dWx0c19pb2N0bCAoamNhdml0dCkNCj4gPiAtIFJlbW92ZSByZXR1cm4gbWFzayBmcm9tIGZpbGxf
ZmF1bHRzLCBhcyByZXR1cm4gaXMgYWxyZWFkeSAtRUZBVUxUIG9yIDANCj4gPiAgICAoamNhdml0
dCkNCj4gPiANCj4gPiB2NzoNCj4gPiAtIFJldmVydCBiYWNrIHRvIHVzaW5nIHhlX3ZtX2dldF9w
cm9wZXJ0eV9pb2N0bA0KPiA+IC0gQXBwbHkgYmV0dGVyIGNvcHlfdG9fdXNlciBsb2dpYyAoamNh
dml0dCkNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFu
LmNhdml0dEBpbnRlbC5jb20+DQo+ID4gU3VnZ2VzdGVkLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0
aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gPiBDYzogSmFpbnh1biBaaGFuZyA8amlhbnh1bi56aGFu
Z0BpbnRlbC5jb20+DQo+ID4gQ2M6IFNodWljaGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwu
Y29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jIHwgICAz
ICsNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jICAgICB8IDEzNCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5o
ICAgICB8ICAgMiArDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDEzOSBpbnNlcnRpb25zKCspDQo+
ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+IGluZGV4IGIyZjY1NmIyYTU2My4uNzRl
NTEwY2IwZTQ3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Uu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+IEBAIC0xOTQs
NiArMTk0LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1faW9jdGxfZGVzYyB4ZV9pb2N0bHNb
XSA9IHsNCj4gPiAgIAlEUk1fSU9DVExfREVGX0RSVihYRV9XQUlUX1VTRVJfRkVOQ0UsIHhlX3dh
aXRfdXNlcl9mZW5jZV9pb2N0bCwNCj4gPiAgIAkJCSAgRFJNX1JFTkRFUl9BTExPVyksDQo+ID4g
ICAJRFJNX0lPQ1RMX0RFRl9EUlYoWEVfT0JTRVJWQVRJT04sIHhlX29ic2VydmF0aW9uX2lvY3Rs
LCBEUk1fUkVOREVSX0FMTE9XKSwNCj4gPiArCURSTV9JT0NUTF9ERUZfRFJWKFhFX1ZNX0dFVF9Q
Uk9QRVJUWSwgeGVfdm1fZ2V0X3Byb3BlcnR5X2lvY3RsLA0KPiA+ICsJCQkgIERSTV9SRU5ERVJf
QUxMT1cpLA0KPiA+ICsNCj4gPiAgIH07DQo+ID4gICANCj4gPiAgIHN0YXRpYyBsb25nIHhlX2Ry
bV9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQgaW50IGNtZCwgdW5zaWduZWQgbG9u
ZyBhcmcpDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gPiBpbmRleCAwNjdhOWNlZGNhZDkuLjUyMWYwMDMy
ZDllMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4gQEAgLTQyLDYgKzQyLDE0IEBADQo+
ID4gICAjaW5jbHVkZSAieGVfd2EuaCINCj4gPiAgICNpbmNsdWRlICJ4ZV9obW0uaCINCj4gPiAg
IA0KPiA+ICtzdGF0aWMgY29uc3QgdTE2IHhlX3RvX3VzZXJfZW5naW5lX2NsYXNzW10gPSB7DQo+
ID4gKwlbWEVfRU5HSU5FX0NMQVNTX1JFTkRFUl0gPSBEUk1fWEVfRU5HSU5FX0NMQVNTX1JFTkRF
UiwNCj4gPiArCVtYRV9FTkdJTkVfQ0xBU1NfQ09QWV0gPSBEUk1fWEVfRU5HSU5FX0NMQVNTX0NP
UFksDQo+ID4gKwlbWEVfRU5HSU5FX0NMQVNTX1ZJREVPX0RFQ09ERV0gPSBEUk1fWEVfRU5HSU5F
X0NMQVNTX1ZJREVPX0RFQ09ERSwNCj4gPiArCVtYRV9FTkdJTkVfQ0xBU1NfVklERU9fRU5IQU5D
RV0gPSBEUk1fWEVfRU5HSU5FX0NMQVNTX1ZJREVPX0VOSEFOQ0UsDQo+ID4gKwlbWEVfRU5HSU5F
X0NMQVNTX0NPTVBVVEVdID0gRFJNX1hFX0VOR0lORV9DTEFTU19DT01QVVRFLA0KPiBOb3Qgc3Vy
ZSBpZiB0aGlzIHdpbGwgYmUgdXNlZCB0byBpbnRlcnByZXQgZW5naW5lX2NsYXNzIHRoYXQgd2ls
bCBiZSANCj4gcmVwb3J0ZWQgdG8gVU1ELCBzbyBqdXN0IGEgaGVhZHMgdXAuIEluIGJzcGVjIDc3
NDEyIHRoZSBjb21wdXRlIGVuZ2luZSANCj4gY2xhc3MgaWQgaXMgNSwgaW5zdGVhZCBvZiA0IGFz
IHRoaXMgbWFjcm8gZGVmaW5lZC4NCg0KeGVfaHdfZW5naW5lX3R5cGVzLmgNClhFX0VOR0lORV9D
TEFTU19DT01QVVRFID0gNSwNCi1Kb25hdGhhbiBDYXZpdHQNCg0KPiANCj4gVGhlcmUgYXJlIG90
aGVyIHZhbHVlcyBzbyBwZXJoYXBzIHlvdSBjYW4ganVzdCByZXBvcnQgcmF3IHZhbHVlIG9mIA0K
PiBlbmdpbmUgY2xhc3MgYW5kIGxldCBVTUQgZGVhbHMgd2l0aCBpdCBhY2NvcmRpbmcgdG8gdGhl
IGJzcGVjLg0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAgIHN0YXRpYyBzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3QgKnhlX3ZtX29iaihzdHJ1Y3QgeGVfdm0gKnZtKQ0KPiA+ICAgew0KPiA+ICAgCXJldHVybiB2
bS0+Z3B1dm0ucl9vYmo7DQo+ID4gQEAgLTM1NTEsNiArMzU1OSwxMzIgQEAgaW50IHhlX3ZtX2Jp
bmRfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgc3RydWN0IGRybV9m
aWxlICpmaWxlKQ0KPiA+ICAgCXJldHVybiBlcnI7DQo+ID4gICB9DQo+ID4gICANCj4gPiArc3Rh
dGljIGludCB4ZV92bV9nZXRfcHJvcGVydHlfc2l6ZShzdHJ1Y3QgeGVfdm0gKnZtLCB1MzIgcHJv
cGVydHkpDQo+ID4gK3sNCj4gPiArCWludCBzaXplID0gLUVJTlZBTDsNCj4gPiArDQo+ID4gKwlz
d2l0Y2ggKHByb3BlcnR5KSB7DQo+ID4gKwljYXNlIERSTV9YRV9WTV9HRVRfUFJPUEVSVFlfRkFV
TFRTOg0KPiA+ICsJCXNwaW5fbG9jaygmdm0tPmZhdWx0cy5sb2NrKTsNCj4gPiArCQlzaXplID0g
dm0tPmZhdWx0cy5sZW4gKiBzaXplb2Yoc3RydWN0IHhlX3ZtX2ZhdWx0KTsNCj4gPiArCQlzcGlu
X3VubG9jaygmdm0tPmZhdWx0cy5sb2NrKTsNCj4gPiArCQlicmVhazsNCj4gPiArCWRlZmF1bHQ6
DQo+ID4gKwkJYnJlYWs7DQo+ID4gKwl9DQo+ID4gKwlyZXR1cm4gc2l6ZTsNCj4gPiArfQ0KPiA+
ICsNCj4gPiArc3RhdGljIGludCB4ZV92bV9nZXRfcHJvcGVydHlfdmVyaWZ5X3NpemUoc3RydWN0
IHhlX3ZtICp2bSwgdTMyIHByb3BlcnR5LA0KPiA+ICsJCQkJCSAgaW50IGV4cGVjdGVkLCBpbnQg
YWN0dWFsKQ0KPiA+ICt7DQo+ID4gKwlzd2l0Y2ggKHByb3BlcnR5KSB7DQo+ID4gKwljYXNlIERS
TV9YRV9WTV9HRVRfUFJPUEVSVFlfRkFVTFRTOg0KPiA+ICsJCS8qDQo+ID4gKwkJICogTnVtYmVy
IG9mIGZhdWx0cyBtYXkgaW5jcmVhc2UgYmV0d2VlbiBjYWxscyB0bw0KPiA+ICsJCSAqIHhlX3Zt
X2dldF9wcm9wZXJ0eV9pb2N0bCwgc28ganVzdCByZXBvcnQgdGhlDQo+ID4gKwkJICogbnVtYmVy
IG9mIGZhdWx0cyB0aGUgdXNlciByZXF1ZXN0cyBpZiBpdCdzIGxlc3MNCj4gPiArCQkgKiB0aGFu
IG9yIGVxdWFsIHRvIHRoZSBudW1iZXIgb2YgZmF1bHRzIGluIHRoZSBWTQ0KPiA+ICsJCSAqIGZh
dWx0IGFycmF5Lg0KPiA+ICsJCSAqLw0KPiA+ICsJCWlmIChhY3R1YWwgPCBleHBlY3RlZCkNCj4g
PiArCQkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKwkJYnJlYWs7DQo+ID4gKwlkZWZhdWx0Og0KPiA+
ICsJCWlmIChhY3R1YWwgIT0gZXhwZWN0ZWQpDQo+ID4gKwkJCXJldHVybiAtRUlOVkFMOw0KPiA+
ICsJCWJyZWFrOw0KPiA+ICsJfQ0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4g
K3N0YXRpYyBpbnQgZmlsbF9mYXVsdHMoc3RydWN0IHhlX3ZtICp2bSwNCj4gPiArCQkgICAgICAg
c3RydWN0IGRybV94ZV92bV9nZXRfcHJvcGVydHkgKmFyZ3MpDQo+ID4gK3sNCj4gPiArCXN0cnVj
dCB4ZV92bV9mYXVsdCBfX3VzZXIgKnVzcl9wdHIgPSB1NjRfdG9fdXNlcl9wdHIoYXJncy0+ZGF0
YSk7DQo+ID4gKwlzdHJ1Y3QgeGVfdm1fZmF1bHQgc3RvcmUgPSB7IDAgfTsNCj4gPiArCXN0cnVj
dCB4ZV92bV9mYXVsdF9lbnRyeSAqZW50cnk7DQo+ID4gKwlpbnQgcmV0ID0gMCwgaSA9IDAsIGNv
dW50Ow0KPiA+ICsNCj4gPiArCWNvdW50ID0gYXJncy0+c2l6ZSAvIHNpemVvZihzdHJ1Y3QgeGVf
dm1fZmF1bHQpOw0KPiA+ICsNCj4gPiArCXNwaW5fbG9jaygmdm0tPmZhdWx0cy5sb2NrKTsNCj4g
PiArCWxpc3RfZm9yX2VhY2hfZW50cnkoZW50cnksICZ2bS0+ZmF1bHRzLmxpc3QsIGxpc3QpIHsN
Cj4gPiArCQlpZiAoaSsrID09IGNvdW50KQ0KPiA+ICsJCQlicmVhazsNCj4gPiArDQo+ID4gKwkJ
bWVtc2V0KCZzdG9yZSwgMCwgc2l6ZW9mKHN0cnVjdCB4ZV92bV9mYXVsdCkpOw0KPiA+ICsNCj4g
PiArCQlzdG9yZS5hZGRyZXNzID0gZW50cnktPmFkZHJlc3M7DQo+ID4gKwkJc3RvcmUuYWRkcmVz
c190eXBlID0gZW50cnktPmFkZHJlc3NfdHlwZTsNCj4gPiArCQlzdG9yZS5hZGRyZXNzX3ByZWNp
c2lvbiA9IGVudHJ5LT5hZGRyZXNzX3ByZWNpc2lvbjsNCj4gPiArCQlzdG9yZS5mYXVsdF9sZXZl
bCA9IGVudHJ5LT5mYXVsdF9sZXZlbDsNCj4gPiArCQlzdG9yZS5lbmdpbmVfY2xhc3MgPSB4ZV90
b191c2VyX2VuZ2luZV9jbGFzc1tlbnRyeS0+ZW5naW5lX2NsYXNzXTsNCj4gPiArCQlzdG9yZS5l
bmdpbmVfaW5zdGFuY2UgPSBlbnRyeS0+ZW5naW5lX2luc3RhbmNlOw0KPiA+ICsNCj4gPiArCQly
ZXQgPSBjb3B5X3RvX3VzZXIodXNyX3B0ciwgJnN0b3JlLCBzaXplb2Yoc3RydWN0IHhlX3ZtX2Zh
dWx0KSk7DQo+ID4gKwkJaWYgKHJldCkNCj4gPiArCQkJYnJlYWs7DQo+ID4gKw0KPiA+ICsJCXVz
cl9wdHIrKzsNCj4gPiArCX0NCj4gPiArCXNwaW5fdW5sb2NrKCZ2bS0+ZmF1bHRzLmxvY2spOw0K
PiA+ICsNCj4gPiArCXJldHVybiByZXQ7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQg
eGVfdm1fZ2V0X3Byb3BlcnR5X2ZpbGxfZGF0YShzdHJ1Y3QgeGVfdm0gKnZtLA0KPiA+ICsJCQkJ
CXN0cnVjdCBkcm1feGVfdm1fZ2V0X3Byb3BlcnR5ICphcmdzKQ0KPiA+ICt7DQo+ID4gKwlzd2l0
Y2ggKGFyZ3MtPnByb3BlcnR5KSB7DQo+ID4gKwljYXNlIERSTV9YRV9WTV9HRVRfUFJPUEVSVFlf
RkFVTFRTOg0KPiA+ICsJCXJldHVybiBmaWxsX2ZhdWx0cyh2bSwgYXJncyk7DQo+ID4gKwlkZWZh
dWx0Og0KPiA+ICsJCWJyZWFrOw0KPiA+ICsJfQ0KPiA+ICsJcmV0dXJuIC1FSU5WQUw7DQo+ID4g
K30NCj4gPiArDQo+ID4gK2ludCB4ZV92bV9nZXRfcHJvcGVydHlfaW9jdGwoc3RydWN0IGRybV9k
ZXZpY2UgKmRybSwgdm9pZCAqZGF0YSwNCj4gPiArCQkJICAgICBzdHJ1Y3QgZHJtX2ZpbGUgKmZp
bGUpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gdG9feGVfZGV2aWNlKGRy
bSk7DQo+ID4gKwlzdHJ1Y3QgeGVfZmlsZSAqeGVmID0gdG9feGVfZmlsZShmaWxlKTsNCj4gPiAr
CXN0cnVjdCBkcm1feGVfdm1fZ2V0X3Byb3BlcnR5ICphcmdzID0gZGF0YTsNCj4gPiArCXN0cnVj
dCB4ZV92bSAqdm07DQo+ID4gKwlpbnQgc2l6ZSwgcmV0ID0gMDsNCj4gPiArDQo+ID4gKwlpZiAo
WEVfSU9DVExfREJHKHhlLCBhcmdzLT5yZXNlcnZlZFswXSB8fCBhcmdzLT5yZXNlcnZlZFsxXSkp
DQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsJdm0gPSB4ZV92bV9sb29rdXAo
eGVmLCBhcmdzLT52bV9pZCk7DQo+ID4gKwlpZiAoWEVfSU9DVExfREJHKHhlLCAhdm0pKQ0KPiA+
ICsJCXJldHVybiAtRU5PRU5UOw0KPiA+ICsNCj4gPiArCXNpemUgPSB4ZV92bV9nZXRfcHJvcGVy
dHlfc2l6ZSh2bSwgYXJncy0+cHJvcGVydHkpOw0KPiA+ICsNCj4gPiArCWlmIChzaXplIDwgMCkg
ew0KPiA+ICsJCXJldCA9IHNpemU7DQo+ID4gKwkJZ290byBwdXRfdm07DQo+ID4gKwl9IGVsc2Ug
aWYgKCFhcmdzLT5zaXplKSB7DQo+ID4gKwkJYXJncy0+c2l6ZSA9IHNpemU7DQo+ID4gKwkJZ290
byBwdXRfdm07DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0ID0geGVfdm1fZ2V0X3Byb3BlcnR5
X3ZlcmlmeV9zaXplKHZtLCBhcmdzLT5wcm9wZXJ0eSwNCj4gPiArCQkJCQkgICAgIGFyZ3MtPnNp
emUsIHNpemUpOw0KPiA+ICsJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgcmV0KSkgew0KPiA+ICsJCXJl
dCA9IC1FSU5WQUw7DQo+ID4gKwkJZ290byBwdXRfdm07DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJ
cmV0ID0geGVfdm1fZ2V0X3Byb3BlcnR5X2ZpbGxfZGF0YSh2bSwgYXJncyk7DQo+ID4gKw0KPiA+
ICtwdXRfdm06DQo+ID4gKwl4ZV92bV9wdXQodm0pOw0KPiA+ICsJcmV0dXJuIHJldDsNCj4gPiAr
fQ0KPiA+ICsNCj4gPiAgIC8qKg0KPiA+ICAgICogeGVfdm1fYmluZF9rZXJuZWxfYm8gLSBiaW5k
IGEga2VybmVsIEJPIHRvIGEgVk0NCj4gPiAgICAqIEB2bTogVk0gdG8gYmluZCB0aGUgQk8gdG8N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmggYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdm0uaA0KPiA+IGluZGV4IDliZDdlOTM4MjRkYS4uNjNlYzIyNDU4ZTA0IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5oDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3ZtLmgNCj4gPiBAQCAtMTk2LDYgKzE5Niw4IEBAIGludCB4ZV92
bV9kZXN0cm95X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ID4g
ICAJCQlzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpOw0KPiA+ICAgaW50IHhlX3ZtX2JpbmRfaW9jdGwo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4gPiAgIAkJICAgICBzdHJ1Y3Qg
ZHJtX2ZpbGUgKmZpbGUpOw0KPiA+ICtpbnQgeGVfdm1fZ2V0X3Byb3BlcnR5X2lvY3RsKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ID4gKwkJCSAgICAgc3RydWN0IGRybV9m
aWxlICpmaWxlKTsNCj4gPiAgIA0KPiA+ICAgdm9pZCB4ZV92bV9jbG9zZV9hbmRfcHV0KHN0cnVj
dCB4ZV92bSAqdm0pOw0KPiA+ICAgDQo+IA0KPiANCg==
