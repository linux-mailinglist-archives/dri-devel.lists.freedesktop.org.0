Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F472D013A3
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 07:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C5610E55D;
	Thu,  8 Jan 2026 06:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SurY7TXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41B910E55D;
 Thu,  8 Jan 2026 06:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767852957; x=1799388957;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G+j/2LR4VNl2bfrW4gXApI9j10y83Cr11y+7iCZGMUU=;
 b=SurY7TXusVAwxi6sucB6QZLbNNogCdYLJ+rYtPG/gQsRX/jVDl3Tk55g
 aMaLApnDZLYjmV7UK5rvlF7+LzU1tWTXzGod7TU0jSGO2EVJdLw0cSwQ0
 AByJNxrLeyfrSosJiO2UQWn7GsnPyqJs4NWYYcDLno0Uen9HYOlNMXVWd
 mGAGqD38sUn0qf5mhREjUfAIcWyJYLA2vj+Zgu+yuob49wLfT8dppFWSZ
 XjvMvLdrLbRlJwNuNVYocBfWr5b5Fltu62rtmf2AQlEeWzmCxhoM2di1A
 J5NRkxwjHuDZeB6pFojdhfnKmzBCEk33mnqa1rc3+XgRVGMWeP2UiiVSc g==;
X-CSE-ConnectionGUID: EPhDPJ2VRTi81+ptI5sS8w==
X-CSE-MsgGUID: GxRs3x7ARYmEU2J4u1ze2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72861398"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="72861398"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 22:15:57 -0800
X-CSE-ConnectionGUID: SCvEMVJkRtOFs+wrUz2VBg==
X-CSE-MsgGUID: UgSFTvEUT22MVZqrhbCVug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="202320067"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 22:15:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 22:15:56 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 22:15:56 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 22:15:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGPmc9u4FJUXdNbDGc/weo7D1Ag80eqJ+62PsHBeWonCqk67MiqK++E1xaGd9M2wb7nLZd+hPoVJdSjbxcvE3yZxTBIFzWZ0Wu5W40AJHxX4uDUoUd2ssHm3yvkMY/LrT3rTcyQ6S3feOw86xGmnldZj3b7ttXtxr63q5ITKYvSKmYlBnsb4HFytZvDl4uCqJfmAhGJ00OGsxdYGPdwaFZddlFtbfxpQUOnMF7s8zh6ru//lHR4cS2twM+oEc4FTcJhStjExYLU8IHq6+KVlU24oWMpiPR7kneFq8FeZbWfR0IElTyIYuwdiSmC8V6+cYX2SrtSY24UO5YQlgB55PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+j/2LR4VNl2bfrW4gXApI9j10y83Cr11y+7iCZGMUU=;
 b=Szd92WSBXEWu6OYkmlNnzMjPtrnsa4HszwxaH8bKHT5rZuJ89jho6yi6FUe8etV+yWwi15azK/bRXyAs5q15s7neIwGkCxMGPpP3KFEXRRw6He8PJoqk8TA76nbaRlybEEb+J5EJz9O3NIXv9RJYNKz/hlWc6niXqFtgGm7am6IHc0jioqf14hjoRrxrhIICOddEIVpeYmTeLTbjNiAkn4XgxDKeSNFZuWlZroCIukF3KAECIdbWVUjD4PJsC7nGCdTJEk5RAkyo+UOC5DnO6Zz4X8OAZUN2sPf2LCiB9PYjghblxoQhGADh2RpbuWQ3N3JTaiaqg7Yy1kkVEU+seQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SN7PR11MB7114.namprd11.prod.outlook.com
 (2603:10b6:806:299::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 06:15:48 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 06:15:48 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v7 2/5] drm/atomic: Add error_code element in atomic_state
Thread-Topic: [PATCH v7 2/5] drm/atomic: Add error_code element in atomic_state
Thread-Index: AQHcfsaUh3j8ihIq8kaKbfUaREzCHLVHzrwQ
Date: Thu, 8 Jan 2026 06:15:48 +0000
Message-ID: <DM3PPF208195D8D58FDA4CC842D621AE737E385A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260106-atomic-v7-0-d51d9a351684@intel.com>
 <20260106-atomic-v7-2-d51d9a351684@intel.com>
In-Reply-To: <20260106-atomic-v7-2-d51d9a351684@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SN7PR11MB7114:EE_
x-ms-office365-filtering-correlation-id: 3db9b2e6-1d11-4e5e-76be-08de4e7d5dd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?eGxNbUs1TjBhamRHS1hOWFdBUi9kMW9SdVpDbzB1c1kzaUlpQ3Q2eXRMMTZv?=
 =?utf-8?B?V092bkhuVUpYaXhzSS9LYzVtbXVBakJKZTZVTmh6NDFNdWNScldpanFsRWlW?=
 =?utf-8?B?SDhrSzhKZWcxMHBSUEt3RlpZb0dBbks4a0xKV2ZHbm1EenNScjN6R3BlZGpF?=
 =?utf-8?B?MGlBckhxelFDVkUvbUs1QzVTd1I3V05KcGdtRWJVbzVlTmtKUG9IRnBWMHNX?=
 =?utf-8?B?SUhMdlBaUDdkbFFXeFZDdEJpN2pWTFlZWGVjNU1OVUp6dW8xdUk3ajh5OVJK?=
 =?utf-8?B?TkNGeUZEWWhjcWxqdVM3NzNNdXU4dTdVR2VaOGFBdGJZR0xRaFp3RXhsVEhS?=
 =?utf-8?B?QjdpWWgxNUdNZHJOTUF0Qy9TRDJnTXhNN25INE9WRzdTUmZkdEwvV3BQTm9Z?=
 =?utf-8?B?NG5CblZ4YnlVVzhya3dhUng1TlZZNjR3WWZlVTN6cVViS2FLcnJ4bXNqeXNT?=
 =?utf-8?B?RklFdjFleHVqS2xwaTM3S2kya09jV29oU0s3WHFGak1mNlVpZFNpYUZKN0N1?=
 =?utf-8?B?YzRNaklKWU5rZ2h5RU5rdnZFR3dtNFRLOHpiT0MwclR3TTE1d3hnZ1RpZlNW?=
 =?utf-8?B?RXQwN3ZWcW45d2xScEx6S2FWWnpvZWYyTERNV3EwdzlqSTY2MGlyUFFhVTgw?=
 =?utf-8?B?WUlLTXJxekYzU2NVK1BCekRWTGhVb212aG02bEF5YWZOcnJpNU9tZkRiazhq?=
 =?utf-8?B?Mk92SFNTSWhhZXduSXRNOXBrOHdKTlBqVU1UaUtCMWdFYS9JdTlJbkFqWTNC?=
 =?utf-8?B?dVlLZ0VWbmpJQ3gwZHRGYWppanp5L2hDa2wxOWk4bE01WlZCS1dORlNYTkk2?=
 =?utf-8?B?a3dCOVpWNEV1KzBYcXNaTDBFMnBwaU1QK3hGZkJ2Uk5jb3publNlQ1h0Z1Vx?=
 =?utf-8?B?Q1dpTmtiWkdHRkVQd1VBV0RpNkFieHFhdnRUSXdqVlBlSXhVcythS3V1OVBu?=
 =?utf-8?B?VGFpZVNKN0wwNFk4SFpLQmdOQk1Vc3V2VUtaT1pyMmVTQk1waHEyNDJZUFBY?=
 =?utf-8?B?dlUxNWV1amFhQWpxVW1rNERmQ0ZtazNjWWFHanFQU1cvMklSUjgxRnF1U3pO?=
 =?utf-8?B?cDVtbkVUamE3Zkg5OG5hZ2prN0lGdXF0bkFEK0x0RFpTckg1dXJJeU1SQzdY?=
 =?utf-8?B?VFBSUVRlMUtKVWJNZHNiSW1LOTg5c0szeS9TTldmeWlBN2U3dHMwZTNBakFN?=
 =?utf-8?B?RHNkOEtSWnNSSFhxV0t5aDhFSDB0NWg5VVpITWJjSVlyTmZza0ZlL3ZiSnN0?=
 =?utf-8?B?WEw5Y3czaFdGM3RPR1EzRE1IODJoOVlLaExvdXlVc20zdUdxTlZabXgyYjhx?=
 =?utf-8?B?eWV2dXFVbmI2bDhueXNWdHhCSDhwMU4vYjBiTUh5YjhwYVZzbW10NGkyYSsy?=
 =?utf-8?B?T0FXc1JQdG5DQ2NuTzY1VXhqUVRwcjQydldSZlErRi9iUFd6YXlYR01XT1Nq?=
 =?utf-8?B?SDcySnhpdVRUMEF5U0EzYUYvUXdkVmJ0UzJmZllwa1A3K1k3cGVDWjgzMnRn?=
 =?utf-8?B?VWIzRHhWc0F2SCtiOUlXWC90MFY2SjY5RWRNcmJ5WHBoQkNueU1WUTdpcHpa?=
 =?utf-8?B?Ny9oN2szcVhmaFJBc25oR0lWRVNoendRR1Q1VGhSWHlxL1FsRnVPQnhZdktC?=
 =?utf-8?B?VDk2TGV3aHR0bitlNU9kR0FRVjNCYUFEdDBxNStLV29pVkQ1NWZib0xQWUFE?=
 =?utf-8?B?TkpRT04xZnc3SE1sanlCNHYvdjhpOVZEVGl4MG5McXk3THpEaGRJOXpEdWZB?=
 =?utf-8?B?c2FiSVg4QzBXbHRTOFhYWlU4YU92bnZyT2pocWxZamY1czQxVmlOdHoyRTZS?=
 =?utf-8?B?VTM2UExoWStlNnMvbStZblFvckYxbnNkUHFuZFNwVDlJVVI1MTRVQVMyWG5y?=
 =?utf-8?B?YkRJT2dIaDBJSi9RYTY0SGZhb0MzNU5RcC8wTGRkaUswZGhyd3dFd0swN3Js?=
 =?utf-8?B?SEk2N0lRZmVRVkg2UVRyTjA1K0pZanprY1FVdXFCMlpaN1I3TXVMUFRmUkd2?=
 =?utf-8?B?ZkJwNjNwTE1pT2FFcWFrODFwYWpDU09UdHg1cEZUUHhpR2JpMGlRako4Unkr?=
 =?utf-8?B?MjBodTNiK1k3Q2FVd1BiNTlvbkpCVUlPYUtjQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2V0TitWU1FSQjZVc3AxKzNReTRubTlRSXdhZ2RwSGJZbU9rUFZzaDBnRVdt?=
 =?utf-8?B?S25lNkU5clQ1U0tDOENZMHRBcTdzVzdWUlY2blFkR1J0R3JFUWNkc1pqbG96?=
 =?utf-8?B?cHBINkVpSjkwSDVJTEZpajJUb082OEhYZkxFN2llT3JXOTF4Q1VCc25CN2RF?=
 =?utf-8?B?UEVmRjRXNzFwQnJWbWFZb0xSNWFXbGc4UVRsaWtxTGVsZmxvMGZ0TFRxbzVq?=
 =?utf-8?B?NWVDamNGWmlLYzJObmh1cHlYNmxvNHZpREk2OXJoVGJrUkltUjlhMFREUmho?=
 =?utf-8?B?ZkVqdXNpa3V4b0Z2ZWswZzZ5ejU2K3RNU3FkME5RVm5yNFV1YkFzb1VaSHc0?=
 =?utf-8?B?WCtMUEEzVGlNQ2xBK2wrMGwzYlRYWVh0WWNXWStPUU5nWnQ4WW53dFBYRlhj?=
 =?utf-8?B?eHJMSEZDbkF4U1BuRXRzOUhnUGpwTXNhVVdYZ0dLTjJrTXk0NHI5ODk1WXdl?=
 =?utf-8?B?SVhka2Z3ZjQvWWdJellERUE4aytQbmxOSUVyMHVNSk5QYUlnanZqUGRxT1p5?=
 =?utf-8?B?U280QzF0SVd2WGxSYU8vVzBNdXNtYTJTWTkzODl4Y0lCR20weWRnQkhrcU1i?=
 =?utf-8?B?eXZCcTBsaWtvUlIySHlDS1F6QnIvUU5uMnM4Y3RjZzFnall2RVo3Wlp4dEtB?=
 =?utf-8?B?VlltZnlyZHMvOGR2aGRaV21POXYwWkxNTk1BbHFNU2ZndUpSajFTNzZPb2Zo?=
 =?utf-8?B?LzBLcWF2U3pmT1IyOUpTa1hocVpoM2VmQTNvTytkVXlpSmRQaTMxQUxEcVB6?=
 =?utf-8?B?L0E0SnF1N24yU2dyNlV4alI1NlFIUWhFUE9Nc2Vtbkk5YkYwQk5CM0tESUZ2?=
 =?utf-8?B?SitYM1FXd1NaOHV1OEVhdmJMa0doOGZQaXhKaTJxNlZtaS82T0krREc2R05t?=
 =?utf-8?B?WmNYYU1rQXBZZFJ2V0lnNXQ5ZVNiVTVzTlNhdS9YdExHOWhVOHIxbXpBOFlo?=
 =?utf-8?B?ZnZBcUN2eFlyelVodTI0V0tMT2hneWtRNjk5cndhKytVeVRsa005TDVBbFNW?=
 =?utf-8?B?d1JTaVdIYTVoK0llam5VclF2UVMxR1JSNm1zWjcwbG1xZnJDVHluUEJCbkd1?=
 =?utf-8?B?NlVuSEdZTXVZVUM2VzlhYzN6aFFzeFZJN3VTZzZlWlZ5aUV3MzRMSGFWdFFQ?=
 =?utf-8?B?Y0Z3ci8va2NLL2Q0UTR1a2VDM20rT1hSYUI1QjArLzViMHVlYjVvM0M2bVVM?=
 =?utf-8?B?OTBGWTJvRGx6SDNKdnpKNkdpVG9oQ3VCTWUyYm8zT2NHRVFJT3F5Q2paZnp4?=
 =?utf-8?B?SGFXSi9mVytzRFIyZ2dEbVBjKzB1dTBFUDV3Sy9pVDRXWExKYlVNS2NuU3N1?=
 =?utf-8?B?a28wLzdMbGZpWWJUc1RhRytvOXV6b2VTL2VlVjRsUzB2VHE5NlY0N3NlUGxD?=
 =?utf-8?B?R1lWc0pwWkk4bHpkNXdTYjVzTHBvUkFqT05JSTVmUEI3M0h4ODFXbGtXSkZl?=
 =?utf-8?B?bHErSG83RVZVYm4xZUozc28raVVWTnAxb0tTYVMzNXIvcW9UcGFhMVF4aDNN?=
 =?utf-8?B?SEtpc282TWF1VnVzSTJPZGZuY0VQV2NNTUV6ajJha2lRWU95UGVHYm0rTEFC?=
 =?utf-8?B?V3hIZ1BqSVRMY1hvcy90dkZvdTVCU2F3TXJpSWYxT243dlNkck1RbC9JelNL?=
 =?utf-8?B?MjBhTGNiU2xCN042eEE4K0lDMlBIWmdsSitDWks0Wk84eStudDZTaE9KOUxR?=
 =?utf-8?B?K0VvNVZDMVI4akxDQnpFZmtpZXU4cEIxeU1iS0hsNC9QK3Y0WVFHZ3RaeC95?=
 =?utf-8?B?Y2Z2K3pWZjBOUnVXSDBnNFkzMnUxdE5WVDRRV1VFY1lUMlE3dWFBakFRM2pH?=
 =?utf-8?B?Z2xQbFVRaGJmd29sUlJ0OWd5bkNQQXVOR3NuWlc5WnhrZnppbUd1eW43cWV1?=
 =?utf-8?B?eFJPd2RTU1BHZGtIdXdEcjNJK2x6UFp1NldTVzVYQjNTWDVsQmpicWhSUGlH?=
 =?utf-8?B?OTdLVTVLNXI2b1I5SmRxRUVXd21WWmdDaG5PTzBXcGtZaUk1UVF1Sk5lVGo0?=
 =?utf-8?B?Mm8zTXB0N3Jad3Z1RVJBRDRPTThvOWV2Z1ZDL1J4VFFJQUppOGQyYUJHWlNU?=
 =?utf-8?B?L1NRSjh0d2hCellqeXFLQndOUktOMllNZXB2SGFzb3dRMU9ZMytudG5QSW1r?=
 =?utf-8?B?c3cvNWY2M0VPSHFML09rT1hoZU5zdTROSFY1N3greWxnWVZiZitpL0sxVm1K?=
 =?utf-8?B?RllCKzdhSjNKazFUb2hiK3NFYm5QMkswcDM1RVlybi9ocDV2MDc2Z0h5M0FW?=
 =?utf-8?B?SjNhZU80aEI0ZWU3UDZVb0JEcWtRZE96TktjUDJYb0NzMlhKbkNQanpoRzZy?=
 =?utf-8?B?TzJvcXIwYW54SXBqOWdpY1g1d1V2M2ZBbTJJT21mZDExeE9wYWpwZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db9b2e6-1d11-4e5e-76be-08de4e7d5dd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 06:15:48.4950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pl2WeziMwLA6tCDq5CUcSs/PdjZzGLNnORxK6lAyhtieI1DzweJ3brBv7rVk2PH/qFg3bEvhJg5MVIxUElXpPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjcgMi81XSBkcm0vYXRvbWljOiBBZGQgZXJyb3JfY29kZSBlbGVt
ZW50IGluIGF0b21pY19zdGF0ZQ0KPiANCj4gTm93IHRoYXQgYSBwcm9wZXIgZXJyb3IgY29kZSB3
aWxsIGJlIHJldHVybmVkIHRvIHRoZSB1c2VyIG9uIGFueSBmYWlsdXJlIGluDQo+IGF0b21pY19p
b2N0bCgpIHZpYSBzdHJ1Y3QgZHJtX21vZGVfYXRvbWljLCBhZGQgYSBuZXcgZWxlbWVudCBlcnJv
cl9jb2RlIGluDQo+IHRoZSBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSBzbyBhcyB0byBob2xkIHRo
ZSBlcnJvciBjb2RlIGR1cmluZyB0aGUNCj4gYXRvbWljX2NoZWNrKCkgYW5kIGF0b21pY19jb21t
aXQoKSBwaGFzZXMuDQo+IE5ldyBmdW5jdGlvbiBhZGRlZCB0byBwcmludCB0aGUgZXJyb3IgbWVz
c2FnZSBhbmQgZmlsbCB0aGUgc3RydWN0IGVycl9jb2RlIHdpdGgNCj4gcHJvcGVyIGVycm9yIG1l
c3NhZ2UgYW5kIGVycm9yIGNvZGUuDQo+IA0KPiB2NTogQWRkIGEgZnVuY3Rpb24gZm9yIHByaW50
aW5nIHRoZSBlcnJvciBtZXNzYWdlIGFuZCBmaWxsaW5nIGVycl9jb2RlDQo+ICAgICBzdHJ1Y3QN
Cj4gdjY6IFJlcGxhY2UgZHJtX2VyciB3aXRoIGRybV9kYmdfYXRvbWljIHByaW50DQo+IHY2OiBB
ZGQga2V5d29yZCAiY29tbWl0IGZhaWxlZCIgaW4gZGJnIG1zZyAoU3VyYWopDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCg0KTEdU
TSwNClJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4N
Cg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljLmMgfCAzMSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ICBpbmNsdWRlL2RybS9kcm1fYXRvbWljLmggICAgIHwg
MTAgKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fYXRvbWljLmMNCj4gaW5kZXgNCj4gNTI3MzhiODBkZGJlYjEyNDg5NmY2MTI0ZGY1
NjI4ZTJhYzI3ZmFhNC4uMGY0ZjYwNzFjYzMwNWExMTQ2NTRjNjk3MzINCj4gNzJiYmM0YjFmZjM2
YzggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWMuYw0KPiBAQCAtMjEwNSw2ICsyMTA1LDM3IEBAIHZv
aWQgZHJtX3N0YXRlX2R1bXAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gc3RydWN0IGRybV9w
cmludGVyICpwKSAgfSAgRVhQT1JUX1NZTUJPTChkcm1fc3RhdGVfZHVtcCk7DQo+IA0KPiArLyoq
DQo+ICsgKiBkcm1fbW9kZV9hdG9taWNfYWRkX2Vycm9yX21zZyAtIGZ1bmN0aW9uIHRvIGFkZCBl
cnJvciBjb2RlIGFuZCBlcnJvcg0KPiArc3RyaW5nDQo+ICsgKg0KPiArICogQGVycl9jb2RlOiBw
b2ludGVyIHRvIHN0cnVjdCBkcm1fbW9kZV9hdG9taWNfZXJyX2NvZGUgdGhhdCBzdG9yZXMgdGhl
DQo+IGZhaWx1cmUNCj4gKyAqCSAgICAgIHJlYXNvbg0KPiArICogQGZhaWx1cmVfY29kZTogZmFp
bHVyZSBjb2RlIGluIGVudW0gZHJtX21vZGVfYXRvbWljX2ZhaWx1cmVfY29kZXMNCj4gKyAqIEBm
YWlsdXJlX3N0cmluZzogZmFpbHVyZSByZWFzb24gc3RyaW5nIG1lc3NhZ2UNCj4gKyAqDQo+ICsg
KiBSZXR1cm5zOiB2b2lkDQo+ICsgKi8NCj4gK3ZvaWQgZHJtX21vZGVfYXRvbWljX2FkZF9lcnJv
cl9tc2coc3RydWN0IGRybV9tb2RlX2F0b21pY19lcnJfY29kZQ0KPiAqZXJyX2NvZGUsDQo+ICsJ
CQkJICAgX191NjQgZmFpbHVyZV9jb2RlLCBjb25zdCBjaGFyICpmb3JtYXQsIC4uLikgew0KPiAr
CXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSA9IGNvbnRhaW5lcl9vZihlcnJfY29kZSwN
Cj4gKwkJCQkJCSAgICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlLA0KPiArCQkJCQkJICAgICAg
ZXJyb3JfY29kZSk7DQo+ICsJdmFfbGlzdCB2YXJnOw0KPiArCWNoYXIgKmZhaWx1cmVfc3RyaW5n
Ow0KPiArDQo+ICsJZXJyX2NvZGUtPmZhaWx1cmVfY29kZSA9IGZhaWx1cmVfY29kZTsNCj4gKw0K
PiArCXZhX3N0YXJ0KHZhcmcsIGZvcm1hdCk7DQo+ICsJZmFpbHVyZV9zdHJpbmcgPSBrdmFzcHJp
bnRmKEdGUF9BVE9NSUMsIGZvcm1hdCwgdmFyZyk7DQo+ICsNCj4gKwlkcm1fZGJnX2F0b21pYyhz
dGF0ZS0+ZGV2LCAiQ29tbWl0IGZhaWxlZDogJXNcbiIsIGZhaWx1cmVfc3RyaW5nKTsNCj4gKwlz
dHJzY3B5X3BhZChlcnJfY29kZS0+ZmFpbHVyZV9zdHJpbmcsIGZhaWx1cmVfc3RyaW5nLA0KPiAr
CQkgICAgc2l6ZW9mKGVycl9jb2RlLT5mYWlsdXJlX3N0cmluZykpOw0KPiArCXZhX2VuZCh2YXJn
KTsNCj4gK30NCj4gK0VYUE9SVF9TWU1CT0woZHJtX21vZGVfYXRvbWljX2FkZF9lcnJvcl9tc2cp
Ow0KPiArDQo+ICAjaWZkZWYgQ09ORklHX0RFQlVHX0ZTDQo+ICBzdGF0aWMgaW50IGRybV9zdGF0
ZV9pbmZvKHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkgIHsgZGlmZiAtLWdpdA0KPiBh
L2luY2x1ZGUvZHJtL2RybV9hdG9taWMuaCBiL2luY2x1ZGUvZHJtL2RybV9hdG9taWMuaCBpbmRl
eA0KPiAxNzhmOGY2MmM4MGZjNThmZTQyZTg1NjRhNzE2ZGExYTk5ZGRiN2RhLi5iMDgwZjk4MWVj
MWFmZDRiMjU2OWFiYTcwM2MNCj4gOTNmYzFlYTU4MmNiZiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVk
ZS9kcm0vZHJtX2F0b21pYy5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9hdG9taWMuaA0KPiBA
QCAtNjMzLDYgKzYzMywxMyBAQCBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSB7DQo+ICAJICogY29t
bWl0IHdpdGhvdXQgYmxvY2tpbmcuDQo+ICAJICovDQo+ICAJc3RydWN0IHdvcmtfc3RydWN0IGNv
bW1pdF93b3JrOw0KPiArDQo+ICsJLyogQGVycm9yX2NvZGU6IHBvaW50ZXIgdG8gc3RydWN0IGhv
bGRpbmcgZmFpbHVyZSByZWFzb24gYW5kIHN0cmluZw0KPiArCSAqDQo+ICsJICogc3RydWN0IHRv
IGNvbnZleSB1c2VyIHJlYWRhYmxlIGVycm9yIHRvIHRoZSB1c2VyLg0KPiArCSAqIEVycm9yIGNv
ZGVzIGRlZmluZWQgaW4gZW51bSBkcm1fbW9kZV9hdG9taWNfZmFpbHVyZV9mbGFncw0KPiArCSAq
Lw0KPiArCXN0cnVjdCBkcm1fbW9kZV9hdG9taWNfZXJyX2NvZGUgZXJyb3JfY29kZTsNCj4gIH07
DQo+IA0KPiAgdm9pZCBfX2RybV9jcnRjX2NvbW1pdF9mcmVlKHN0cnVjdCBrcmVmICprcmVmKTsg
QEAgLTEzNjAsNSArMTM2Nyw4IEBADQo+IGRybV9hdG9taWNfZ2V0X29sZF9icmlkZ2Vfc3RhdGUo
Y29uc3Qgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiBzdHJ1Y3QgZHJtX2JyaWRn
ZV9zdGF0ZSAqICBkcm1fYXRvbWljX2dldF9uZXdfYnJpZGdlX3N0YXRlKGNvbnN0IHN0cnVjdA0K
PiBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gIAkJCQlzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJp
ZGdlKTsNCj4gK19fcHJpbnRmKDMsIDQpDQo+ICt2b2lkIGRybV9tb2RlX2F0b21pY19hZGRfZXJy
b3JfbXNnKHN0cnVjdCBkcm1fbW9kZV9hdG9taWNfZXJyX2NvZGUNCj4gKmVycl9jb2RlLA0KPiAr
CQkJCSAgIF9fdTY0IGZhaWx1cmVfY29kZSwgY29uc3QgY2hhciAqZm9ybWF0LCAuLi4pOw0KPiAN
Cj4gICNlbmRpZiAvKiBEUk1fQVRPTUlDX0hfICovDQo+IA0KPiAtLQ0KPiAyLjI1LjENCg0K
