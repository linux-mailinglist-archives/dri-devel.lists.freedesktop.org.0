Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0834899839F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 12:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896A310E8C3;
	Thu, 10 Oct 2024 10:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8TBiJML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6F410E8C3;
 Thu, 10 Oct 2024 10:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728556357; x=1760092357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=doqr1dty0vN+uf31XtEqRtxzdxeUgEoyO4Rr7m7TfV0=;
 b=P8TBiJMLoFA4bTKK48jzhslY+BdCgXswx3kl8fuuYYKJohArE8Q2FXTo
 JT7nn/UJJT8ecfsId8kAyKkjAGUJSUyh1L457Hjldq6dknqguzvM+ceST
 5Td8AyKJsHDzIG2t21AhTiJS0omgzt1y/w/LuiixC4agIxdMcNeVX5Fs6
 RjmvjL002bI68U4qf/R0263+BLZB0N5FBsEQTp6r4AZ4sBY2uPDU5vgzd
 i88aFKAkXGK3jHXEuo/efhYpbkpTODy4lomeJSajpFs4h5EFAic49IvZn
 AvLyFfIqFVGiTuKGOxGdOR8vhmmiPZkpejwTqtN482sSdWgMSvVbzvYl0 A==;
X-CSE-ConnectionGUID: rKNjOOPgQ0+84kHtzWtjqw==
X-CSE-MsgGUID: qBTECrwiSsq3RLVyhBBCbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27351305"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="27351305"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 03:32:36 -0700
X-CSE-ConnectionGUID: +4zwoDOwScSCV3JD/xSNrg==
X-CSE-MsgGUID: T7i+5Ds5ThKAZZF9OaBviA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="80559343"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 03:32:34 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 03:32:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 03:32:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 03:32:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exTCYN/P+Bog60IrLiv0hAfZkj1EMBHMjpSZD4+s0d4fmXnyIRAu9wJPWtlw8RB9Nt17B6KyF94uNL8Mm1PMIA6/0o+HB5s9CNWvkaXk9TK+Bh0CtA+/MbOY07Bc1aECBb5oEB56qYXx+HirbliEmwS86AOfoMlGJwCuuvrvTmGi9Mvn1Fe/EKhtND3rFo6Wpdw7AFpocIm7roK0bHur3c+5Q6KgbtbnfguBa26/yyuwhVkm/XWYEgPxi1PYrF+AaYb6eDqM3QQ+zbF1wg45StDUc5D/XW8/w7BRrlWYeBYhlE4uQLISQW/0B2kSq9dJ0fW03LQt8Zl0IMiQJkruXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdVn5Ub7EPPEMa3i3e7evc/RY/yZ3Kbngz9R7/bMOT4=;
 b=gZxGGWUeDGP6LN0/73Vvq4kdDctg0e3OtWV/wuUmiRHJ/esxaSMWW66TnjoFm303YaXL8xUZ6RifyVliz8AxpAIfyfn/kZqlI1Vo0ViOBCq8kSO3opD7uL1ifZCIGhYySwulyGZxjGjLyEG7jBg9L2hCDR9nVRHZFKK/yxvq6WujOqlqIp2eW7yUM8avGJvO/svvdGTEBk/8Ve4o/8Bnk5XcbdmSxA2W15O9YLBldb7fFNpbt3wgP6QJQOactwbMQP07g5EF4hybmPMD1hdHhyTD6wzFOdUdJQDXq1FRdrv0QQHv/zuO38q5d8vwkjFaIzkuDbN8PkJcBxxcUl2K6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Thu, 10 Oct
 2024 10:32:31 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 10:32:30 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v3 5/5] drm/xe/pf: Extend the VF LMEM BAR
Date: Thu, 10 Oct 2024 12:32:03 +0200
Message-ID: <20241010103203.382898-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241010103203.382898-1-michal.winiarski@intel.com>
References: <20241010103203.382898-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 312d2e32-a51e-4d8b-c513-08dce916d857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEYxZkRXeWhZazVtLzlOSXp1bTNId1Fnc0F4ZU9mSzFQOHUrd0t1V29sQXFH?=
 =?utf-8?B?Q2FwM04wYjRiYkE5Q1krSTVzK3MwUmd5U2ZpenltcitwMXcwZDZLOVQ0OGJu?=
 =?utf-8?B?OEtNWmJvWSt1bTNaSE9aVGNJaGJseUNrZHdnclhaVU1SMmFiQjBBTlV6S2pB?=
 =?utf-8?B?SWhYdDU5WXkwWUp3YVp5c3JjN2hnMWVBd1oyU3Q3SHZxYXJwcjVVb29DcVMx?=
 =?utf-8?B?SzVFbE5pbWZUQ1hTR25nMi83L05SendpQnlDVDFOUno5cG5hUnhianpSTFdx?=
 =?utf-8?B?cUpEZVdONnh0a0VZdEY0bGZFbDRaWnRZb1pvRGtHbHM4dVQvNkN2RWFjeFo5?=
 =?utf-8?B?bzAwNjhneUYvRFdDR2ltUVFCaDk1WkFHOVptUjNjSDc4RlBnbUxXd3ZuSTRV?=
 =?utf-8?B?bStzZTdKcGNiL2Q3YjJkQUQ4SHZmbXVKS21YbjBZKzcwaWdsdzhsTTJ1MFkr?=
 =?utf-8?B?Q1hsd1lvRFV3Unhpa09QMUJQQ28vWTR4THVweDNNUmlYTkJZK1FTSThoT0do?=
 =?utf-8?B?RTZ6TjFTd1ZFL0VNcVFSTjdISHloTkZqb0RRSVljT3lKTDdQcEh1bU1EVFF2?=
 =?utf-8?B?V0Y3VWNheDJZeW52OUxZaFVIR0RzV1I2U24rV2hlNWVYSFZpVnBGVWV4S2xL?=
 =?utf-8?B?VGFTZmVBNEZqRzRHeDA2NGd3S2cvNzVQZmMySitacEFaVURFczB2MXVCOWor?=
 =?utf-8?B?b2ZmYytTVmJndnVaNG5aUjQ3Q2Uva0JMZ096RU52WFd5ZXcwNFhvSDNTM21Z?=
 =?utf-8?B?VjNFMWxqNzcyY2N3ckxaaHliT25mSWFOMHRvRjNFMlJmSlpSb1dXUHgwZDJx?=
 =?utf-8?B?bktKM09IUUY1UUQrS2F6T3hCdGsxUlhFS0k4SmJYU1NWVnRncVNuKy81VWZP?=
 =?utf-8?B?YXpTYVU2LzlsYmx2emMzbDNqdU15UHI0STBqbjNNeHBMQkJCeHBDVTd5NHY0?=
 =?utf-8?B?SlBaazIweXQ4bGVjQVBCUy91aVBBZGpYZW51Q1hkWCtXZ1E4NjRYSHJIOS96?=
 =?utf-8?B?ZC8zQVpyNDJTSkw0d2JjZzhrc0NmM0RSemtLUlRCSCt3U0RZWGhSRU5EMG9n?=
 =?utf-8?B?ZEs5ZW5nTnVaSzR4QzZiOEpjelBnVWlOb2lLYjkwYUFIaWRNZ0NVb0xURkIr?=
 =?utf-8?B?ZzhyOUg2VE9mN2xpTjYySDlKcjRvMEFaSmVtaC8ralM0NmFkTTBTNzduV3BF?=
 =?utf-8?B?dDVlUXdXT0hJNHNYeTVCQUdyd25IbFNacUgwQi9lcXJZU2FiVi9QVnhqWDhR?=
 =?utf-8?B?UzRFUjlmVzR3RzRnMWp5MlZLdnJKS3dEY1F3M3RvdTV3MmtrdTl5ZWQxNVdU?=
 =?utf-8?B?eUFRb0lXczRkTDhpY0haUlNFeEpTelBKTUhlRDZCQ2tDYU5QTW1xVDJ6Rjlw?=
 =?utf-8?B?TCs5bFNyUWY0MFBjOHV5dFZoKzIyYVJ6YUVlRmxXeE9YWUZBRVdiOUpqMGhN?=
 =?utf-8?B?R3dFYTRUMzQxS0RGeCt6YnM0ZGMrdDVTMVRudi82ZHR1cG9pV2lOQ3U1eU9w?=
 =?utf-8?B?bFRCcHY5M1VYaEVTS1VPeHE5bjBiMDg2dWNiMmRIVDdNT2UxMTNoY1ZvVDYx?=
 =?utf-8?B?YXpHeUJ5MlU5eXd1N0dLclc5M2EyVDNzNHJtb25YSGkzNUliTllSZkwzWVRB?=
 =?utf-8?B?dTNTTHpTcmpmcWRYQ2FYWTNuWmpaNUFsWXVETW5FTFBTNUwxTDZtR2VXSlVz?=
 =?utf-8?B?eHpOanppSjh1UjJMNHcxY3BRYjluQUU2RUxvRXBhc3BWVEtYZHYzcVp3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEMyeWlTSUtLQ3VuYnp1djlNUWNCNUJnYkZ1VmdvZmVpcm14dzArdk1YMnkz?=
 =?utf-8?B?QWVObE1kNTMyRFBXMkFwejEwdDlhV3VKbFd1QjEyOXZoMnZCZlVONzFRVUVJ?=
 =?utf-8?B?TlA4SG1RVzdnUkNYcitwSjFwaGFTcXhiSEN6ZkVhY2QvZWhBeEtURk9oNndZ?=
 =?utf-8?B?RDd6aDRjQjV2RUZZYW9EOU0xQWdqVC9CTG9oMTZGSHpuWUxsUlhXSWRoSStT?=
 =?utf-8?B?cXVaVGF1VjI1ZVdoYTJiRDBHMzJyblBHek1IdEtaNzZucFdOa2R2RGh6VUxi?=
 =?utf-8?B?dnA3RVZ6ek1QUHdxOVBoNFR5dktJUzI3L1RCeC9FZkxwNFdMRS9ic3NZci9H?=
 =?utf-8?B?dExhMktocW9wVHVaaFVTSVVtNUtHUXVUd0JNQlJlZVNBUnRUajZXR3NVWDZI?=
 =?utf-8?B?MnNnKzJYRWhwT1V1elZ4RDgrVlUzSm1mTi9mWDZqYThONnQyY0NadUhlc3ky?=
 =?utf-8?B?aExrTVY1UXpzU282Ymt5bjBDS29Fck9seTg1dXZMUWhvNjlqOWlIQW9WbEQw?=
 =?utf-8?B?V2x1ZWhkR2VCRGovRmpqUUJyNkRJTUpScHFKYml3VDRFTGlYbWpKdTQ0Nlhi?=
 =?utf-8?B?bVlFMWcySjVPWWJZNXZNVlNxbmlJODhlTjBRWFR2ODVYeEllSnFFNWdHc1Yz?=
 =?utf-8?B?L3hXSThIWE10Q0xhd0ZVcDdDUkxnVjR2VGh6QUlxYlA0VGpQb1V3dk0vNXRH?=
 =?utf-8?B?NXRGVVZjT3U3Nmwvb2h2QTZEdVpVd1VwTHdCMW91alJjUFE3WXdyYkZtZDBn?=
 =?utf-8?B?dUZaR3Fsc3ExSVYybWNDZGZERUdMU01md1RxNTBJWlphMmpFVU92S20rMEJC?=
 =?utf-8?B?WDhudzZSZHFZMWF2dmM2dURmUG8vN25Ta1ZnVCtOempoUERtbmRVVGZwSzht?=
 =?utf-8?B?Ulg2Y1E5VXJ1VGR3ak05T0VQS1NDT1h6b1lwZU1uMkVRK2ErbEYwQ0RpTmlL?=
 =?utf-8?B?RmVOUk9va3lIREFFYitDb29sVGNrWTIrN1RKRkY2Zy9sUEt6RWpJLy9xZDFM?=
 =?utf-8?B?V0o3YjZOVnpGYWJ4T2VnU3FIb0wvSFZObWd4L0ROdDAzWlVyeVVWRVV0WHpC?=
 =?utf-8?B?U0R0TXo1ZVZpRVlGazNYaDRiUVo2MGRLdkcyUjJpZllVbFIvSHl0b1Y5ZGVu?=
 =?utf-8?B?R08zaVV0b2FmTnRhbWhyNXpjcmd6Q3g0M1dFQjZ5Vkd1OEFlUmVxWVVWell2?=
 =?utf-8?B?TmNLSHpickdEdWlsVVp5N0NDWnBFV0xHRzRSbjdqUFRJMTFNRjkvSmhhS1U3?=
 =?utf-8?B?eVRJeXBRTGRhRUQvdWR4M3N1eDdjSWN2RGJmVjAvY2wzcDlWOWdoMy9qQXZ4?=
 =?utf-8?B?TTNHZXFmTEx5bTA3U1duTHJSSDBJK1hvaFl1TlIxRUVHdTNUTVpsSkJvbkhG?=
 =?utf-8?B?VVBUelJmMHEyTmdyeTlLdVdha2V1SXMyZDhiNS9TUk52d0tTOWMxSVJVdFk1?=
 =?utf-8?B?UEtOTmxjR3pXN05FRS9qWWVsTTNNbWlza0p3cmdldVVEaDAzZmt4TWFnT2dD?=
 =?utf-8?B?YkZxQWtlRHVoKzFWUTBRM3l4ZGdKSjFuVW5aU29GemsvNlhYcXlpTzJ3V1Bz?=
 =?utf-8?B?d2VQWm9xY1lhVXVsQmwxYkpxM2p5L1pqL2tpVzdHTnBvaU5aSUxyaGNjN3dE?=
 =?utf-8?B?M1pIQVpuQjA2amlibXIrcWdQWEdTQmwrUDRLZjdKdHAwRnRJMHlJazBjb1ZX?=
 =?utf-8?B?WkV2bTNxNktkay81VEREMmovUzlFZVRRYlhFVVVmRVB1K1F6MXlxeU9WdHFr?=
 =?utf-8?B?Q3pMR0YzU3Z5c3AyT0NaOFQwK2NYWlB1SlhVZXAreWltaHlEc1JmOWNIc3JS?=
 =?utf-8?B?VUI2VkJhRCsxeU9BTC9hZnBFVmd1Q21JVkFIaTFkdVlRYlVOWk8zTTVOQmFC?=
 =?utf-8?B?REVaTnFTZXVIcldGNzd4eDFEbk9JeHUvaXdDOWdLQitLY0FVd2IzMEw2Yjkw?=
 =?utf-8?B?RUZOcEl1ajd4YnF1elpXRHREVmpGYUxFcWtpWnZYcE5yUHM2MlFlTjM4TC9R?=
 =?utf-8?B?ajREWkEyaXNjM2pjcnJDblpvVDQ5ZkpSNHZFMSs3RGdESUZIdmdLbzMrOGdw?=
 =?utf-8?B?R29XS3cwSXVHQ0FpbGlleHFQdzFJSERJcGRmTlVCT0hacm50WEpwNEV4Rnh1?=
 =?utf-8?B?WmtSa29GOWFWL255YmRMWG5zTW1NVytQMnlIZGhNM2JhN2hRR3RIY2RwUytU?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 312d2e32-a51e-4d8b-c513-08dce916d857
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 10:32:30.8990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjHW+P7YzbGrckK7LL2/dLmZP5Ktfnv1m7sdrh4Q1edn/vkpvtfgqBRe/yAnxhLcpJdxlmfNg1xxe7gk0gYfE6cbTYwJKC/FtTnSU2/TA54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
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

Opt into extending the VF BAR.
LMEM is partitioned between multiple VFs, and we expect that the more
VFs we have, the less LMEM is assigned to each VF.
This means that we can achieve full LMEM BAR access without the need to
attempt full VF LMEM BAR resize via pci_resize_resource().

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_bars.h | 1 +
 drivers/gpu/drm/xe/xe_sriov_pf.c  | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_bars.h b/drivers/gpu/drm/xe/regs/xe_bars.h
index ce05b6ae832f1..880140d6ccdca 100644
--- a/drivers/gpu/drm/xe/regs/xe_bars.h
+++ b/drivers/gpu/drm/xe/regs/xe_bars.h
@@ -7,5 +7,6 @@
 
 #define GTTMMADR_BAR			0 /* MMIO + GTT */
 #define LMEM_BAR			2 /* VRAM */
+#define VF_LMEM_BAR			9 /* VF VRAM */
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 0f721ae17b266..a26719b87ac1e 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -4,7 +4,9 @@
  */
 
 #include <drm/drm_managed.h>
+#include <linux/pci.h>
 
+#include "regs/xe_bars.h"
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_module.h"
@@ -80,8 +82,14 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
  */
 int xe_sriov_pf_init_early(struct xe_device *xe)
 {
+	int err;
+
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
+	err = pci_iov_resource_extend(to_pci_dev(xe->drm.dev), VF_LMEM_BAR, true);
+	if (err)
+		xe_sriov_info(xe, "Failed to extend VF LMEM BAR: %d", err);
+
 	return drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
 }
 
-- 
2.47.0

