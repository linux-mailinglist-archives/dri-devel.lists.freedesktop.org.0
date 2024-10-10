Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1688F99839C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 12:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390C610E8CA;
	Thu, 10 Oct 2024 10:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jrd1pDWM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8392F10E8C8;
 Thu, 10 Oct 2024 10:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728556346; x=1760092346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ybaOv2ojJW7CwOeUTI7puwXRWFM1V1+uIvZzDLzNOR0=;
 b=Jrd1pDWMTwHTg+Ftf7dEcnZYoAHKJKusrsb9+hRd6m5WyF6MQq+SZmc5
 VuzFCaQEcPSSqEEgxxi9AHTuKelOywJhCKUCMbLJQjjUUF5Vx8v1Vl4qf
 UmP/OqLjyEjcDJp5EuW+ZGRC2Wb3pNlTDbKX0CL7f5A9qG737yvDZ7f04
 ueLIIfyQpiLwvo3je1SM3q3Zs79JGbRrOExxYuIwfBR9H684GpsTi2gXr
 LvRFFO3m7L6+UWeUteltmyZLlbyS0KJOm+mjaB+DfSzYXoMc0bZXIeAZ/
 BeIid9c6DKT6nzZg8I8yjf8C8t34KVraqVTU62PdRUYlGo5rg4isJKlHq Q==;
X-CSE-ConnectionGUID: P0UtIlmpSweMM0P+TR+RVA==
X-CSE-MsgGUID: 1eywsvlKR92LR6MQ8357VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="15528451"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="15528451"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 03:32:26 -0700
X-CSE-ConnectionGUID: VeisuotSSoqWCy3d81VI8g==
X-CSE-MsgGUID: qiOs39orTq2A4jEt31w1Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="76751659"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 03:32:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 03:32:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 03:32:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 03:32:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBzyVQkaH46NE0mUJ0zRMwbHAktKDr4xo4NmrHgA7Op97Sy4+zq2RnDm7iiUrcdVfJa7dPrhzuXGzaZKxQTgzG7FF6NBMhhxspEUm5dwQsNwFBKzVEWHi3t51dCnSZoQ1hffeQo5QdRZyLNqHn9HerF/Ce97qY7h5TYcNfrwnh/nrtb+RipOWro3ClysWJcQUWkUdigTMYTtJsAoebbI0oD+wrhK60d9x+TrsjIheV8TJlvSXPGAiKNshX/XHVy1Tt3uuLOpjxy4nryimhBM7ABAKUs3/teB+ztzuebtzQF6vCh3uO70ywRBgRJStWE3AQKMPND6jEr0LV16p/9r9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8RdkHf2rYc9zV3jfSuykZ0/1sP4SE+Beit5J1B6fNE=;
 b=xrqEW7gfqrxP3LsNip7QudfHVB8erwkhLG5RHnlyrEx8UiTSBmtH4Pz3VOagrDJSiutzGCz4+AquDSoakikgW35o1FTLHLzeHPnr+vBnCwvbHEh7zmEDhtFoSixrCvXqfjI7nM+NRZ+OhVBeP6w3w8mECVRaCuzrGOFQuF/pxue81R7eslcqPcEW/rRxi4Po5TphwP7wnGK5UdLQFBtzGrpUvwtEokpgKKsiraQwhhR+tFlUNdZdKn0L6JneSCSyi7sOaev/wATbxix5mdG4ciJu84tI4/Rr+67yTkql7sDhTlhkVKWITZu+6uGqqCXH2wwMhYmuVPcD4xEOpbe2tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Thu, 10 Oct
 2024 10:32:23 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 10:32:22 +0000
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
Subject: [PATCH v3 3/5] PCI: Allow IOV resources to be resized in
 pci_resize_resource
Date: Thu, 10 Oct 2024 12:32:01 +0200
Message-ID: <20241010103203.382898-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241010103203.382898-1-michal.winiarski@intel.com>
References: <20241010103203.382898-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0024.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::6)
 To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c693b3-3926-4deb-1322-08dce916d38c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?em1oenRwZ05vVzhtcGUvVnp3TjEzYVltMVBJMWxCQmp4aXFROGVrMEZKR005?=
 =?utf-8?B?RnFIYlgwRkxXZ3lEVjRQOVhlTE1vOWJUS0lrZEtkM0VnanpTUWQrTnlLRUpQ?=
 =?utf-8?B?djBKTFdCckJ0SVJVWDdjck9sMmJBbVVzckdsRjB2OTBTU0xqTUFmN3NxRnJ2?=
 =?utf-8?B?cG04S1RabU1kaXRYOFBqWmx1RGdIZnQzVWFLUlIxVThMSy8rUzJkR1J1VjBn?=
 =?utf-8?B?ZXBTZ1hNL2RzUlMyY054OXNha05XWHBhdkVWM2I1MkFOVU4xYyt3bGZjS0tE?=
 =?utf-8?B?dmZIbmxEajdzQ1dydHVVOW1CeEUvOTBrL2F0d2ZVck9pMHk2MVFjRzNuN0lV?=
 =?utf-8?B?NUt4S2lnMTV2bWtZV1RVYk9mSW9zb1UwVWtIOU9ROHdueUhjSk04L01jdnVr?=
 =?utf-8?B?VkVFZU1HTWREVnBjazFWLzUvZlNPUFFJdGczdGdXS0R2YkFEN2dsOVhOOUg5?=
 =?utf-8?B?bnNDcFkzTlFCM0UyekFiNW9RQ3FaTThIZEJmbXFqMExtTmtlWGlsSjB0Vkhh?=
 =?utf-8?B?Zm40cFpXNHBJR1ByVmxGaVlETWZyZlhxQlhQRFQ5S29UMGxKajBDeWFTSFRu?=
 =?utf-8?B?ZEZsNmoycm13dklRTEpqdkpaR0RWMUVnSTc0VkNNYytuWnZtY0gybGFQM2tm?=
 =?utf-8?B?azlLSTgrTFBVYi9yM1BySHlvLzJRdUpZTDhmRngrZzBYYU1mOENuMy9jNm5j?=
 =?utf-8?B?Y1VFTzNMSUhNaE1ZYjZRSUQyaDNGM0dqdm0yMUpQNDQybGFKd01MejFVTTlL?=
 =?utf-8?B?cUJRdUMwd2tmUnN1TkpzNTNrM0RzSExURVc5Z050ZjhDVVM2aWZFUXBuWlZs?=
 =?utf-8?B?eWZIU1BWczJLRDZrOWk3eUVhMDUzL0VlUzVFOGI4RXF1OUhXUjkwbjJad1U0?=
 =?utf-8?B?eXBrbE5zWnBVQzlNY0U3OTg1TmhZVDArRWtlMFJkeWpCd0tLdDZzVlJ1eDNZ?=
 =?utf-8?B?VElaN0I0N1NDOUcvT2Z1bU9MWUF3NGJUSkxLQ0dkUUpBQjdjN0ROVDhIS3pu?=
 =?utf-8?B?VmdkdVVoOGJLSkw4cVc3cEE4bmpnL1A0b3l2RzNwM3VEZjdKenBQbmdBMnNy?=
 =?utf-8?B?eFBBYnpmdTNiSENYZHkzY1d6NWNERGdBSHc3a01Mb1JzRmI1NWt4cWdzMWpp?=
 =?utf-8?B?MmpuZ01icngzdXBTN2ZzNUd4Z2RhSzAvNStRbUk1dldiYnFsYjBVNzRFTWxr?=
 =?utf-8?B?eU5OL3Vqd3lzSm16aXFnZ1FzVUJ0N1MwV0ZtWkc2S3JQeG1ZQVoyWExpNjFi?=
 =?utf-8?B?aXhNR2xyaVVzWUUrV2JmamZZNlBOWUJaNnNkUjZNdmhyS1hrYlBpalMrSXZm?=
 =?utf-8?B?QWVBTHlCeGNHT2JtNmM2M04wQlA4a0NvMFg2V3dySzJ0RjFrN29obE1Paitr?=
 =?utf-8?B?djFseEYrYy8yNzFPRHgrVU5OOUFSOTNZRFZsOURXdC80SXFRaGZoYTZqZnZo?=
 =?utf-8?B?Q21LYkt2MEdlb1JnQkxadEIrNHcwWVlWWE9zbmp4MHVQRkNUZXNMci9UTVVp?=
 =?utf-8?B?OS9MTUlFQXdKcE4yakE3MHRjbldyei81ZEJITVZJU3VGN05TR0d1bmYrNlda?=
 =?utf-8?B?TlVVVlhpS3FIdHNBaWRBZS9pUU1Ia0ZTdjlvVHQ3Q2JicHl1SStpS3g0UXJC?=
 =?utf-8?B?blAzR2UzNHdxZkJIQ09Sa2dLRFltQ2l5K1gvR0dycU1DalZPZXNtR0tadGVU?=
 =?utf-8?B?SmI0T2NXZVg3R25FTm54T3BINEJqYW5tK2FNKzFya1pTcVFtNGN6bklnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWNjQmx4NE9aUWZnVldsc1JHQnZzQ1ZnQTFvVUdQSGx1eUM3d3U0RFJScFdo?=
 =?utf-8?B?eUkvUDFubGw0d0tyOHdHQzJIQjJDcTI1YlRSUnc3K0Z1ODV0SEhVWjlnR2d0?=
 =?utf-8?B?V1NtUklGd1JkL3psbU9VaUhNVHFaR3daQXl6bk13ZXd5TGZYSlZnbzMvZFBP?=
 =?utf-8?B?clQva21uc1lCVnFIU2tyRXpHOWU2VE52TExmMHVFbHhCOVlIZGFZeUFFVnN5?=
 =?utf-8?B?UlZXT29sWkxrb01pZFNHbW54bTBTcmE3OFVzTm9oZVFqVWtPeWdhWXhCNU5U?=
 =?utf-8?B?S0pOd3pKVmpOQkcwQlM1NmpOZWNOMHhrUlB4MVBpd0pmOFJsSHdlM2dZak41?=
 =?utf-8?B?SVJoZ0JyMHhwQk01SUpvK1Roblo5ajBpR1AwdHJTTkVBajlHMnFIZ1p2NzNE?=
 =?utf-8?B?YnpjK01zYzNPNHU5RFg3T0lJVmxneENRVSt3cXAyRDByaVdHWThxSHNZQTVI?=
 =?utf-8?B?NWhFMlhGTnc2U1JQYTUvTm8xTWNFcGsyaEpkTlNKd0NLRGRkeFMrNW1kRjFB?=
 =?utf-8?B?aUtZTlUzV2J0U0owQ01iMDZJbU1TbTEyVy8rMmZzOENoM3BHRTdKRHROQU9Q?=
 =?utf-8?B?WnRWNXZVT2JGQllETjFHaG8xQkZ6OVZTcW9JNVBCeWxlNS9POWpIY3B2THYx?=
 =?utf-8?B?Rm92N0FsSDFSV2FLS1p5WWhuYTl5VE8rNlpPRjdidmwrZUl1ZW84dEpiMTB1?=
 =?utf-8?B?cjhXb3RjRjF2SDdhR1VRaUR3dFRRb2hBempvMVoyRW1OWFlCMUg0RHltR2xm?=
 =?utf-8?B?M3I5eWpWWU9OaUVWMXZPMll0c0NteWU4S0hIL1AvdzRqYXU3TDJmeWprTVRh?=
 =?utf-8?B?anVYZlI0MnplenhoN1FXUVUvZG1DdVNVc05UNEdNRVBMWFJMaFczNlp4cGhY?=
 =?utf-8?B?eWxVcWtCWUpYUUNlcVBkbnRER2xtd1RtQU81MjNrbVZIN29vK1Qzc25ScUFT?=
 =?utf-8?B?Yk0yQk9JMnljRHh3by9tOHY1MTFxWTVNdDNoRzQwNy9IYUM1QmdwR0dVU1o0?=
 =?utf-8?B?QnBsc3hNSXdiWVlIWTQrYjc5cW5xNU9seS9sQlNSMCtVbUkvcWpvS1JFODRT?=
 =?utf-8?B?SVp1YjNzTm04cnJZcVBjUDJPUkZjbGhBWXdPak1heHpxOHdibjFIMkIzUk9t?=
 =?utf-8?B?RE5wbStnUTNNNnNabHNVZEIwSW5TOE5sYWFqYTJkaFJCcGZRSTNkMk96ZnZo?=
 =?utf-8?B?dGdTNURPbmVMQnR2Tm1tdWt3NUl2S2dDTWVnQ0l4b0pYdzBoTUtqUnIvZm9l?=
 =?utf-8?B?THE2TXF2S2xuVFVhWXV1UjF0NTJmVG1Rd2dBWDV4VGtzNHkreVFhZ0ZQb3Rr?=
 =?utf-8?B?b25HRDdtWVhRTTI3YlBhaGxBTHRRQmVXQ2hKY21sbHd3UzBwZTN5eitxeFBv?=
 =?utf-8?B?ZTN0ZVlvYWVHTGNwU3Q4RFZSa3Q3SnNMWENhSXRnWmg4QkVEcnBVU1d0WUNB?=
 =?utf-8?B?Q0VnbXRTVlZXakJMZ3dsNGpIcXh2RVI2UkRTMkFzdU45d2MyaGcrRGdYV3pF?=
 =?utf-8?B?akx0eEFCNFdJbCtGUnNkZjRpdmJOQ0REMmdZUDF2bHdMZllUTWhJcjZjN0FQ?=
 =?utf-8?B?ZlpnSHZkT2hyNnlWR3JjallJRUkwZmhMeTcxVFRPanVtdllKQXlCY0ZadVhM?=
 =?utf-8?B?RmlrLzd2bVBud3gxdUswNm5OQWptUVF0eHJJMFVCeHdxSDVaV2lTdHY1Y2Vp?=
 =?utf-8?B?ZDcwRmpWL1VBR3VJQi9yTXc2Qmc2UHhkU1EwaCtsQm9ScTRDWVZlRU9jai9H?=
 =?utf-8?B?Sld3cFlWWDQxMXdFd1YzQk85SllqeHNkVVVNa0NyQ3VZZlM0dnYzam1UL204?=
 =?utf-8?B?NXNPUFdIZ2FWNHNkdkQ4VHNvYXlQT2pGZXg4VDlVeXh6OWtmaE1OT3I3VVN0?=
 =?utf-8?B?L3dDTG5GcFk4RWthUmR0bDVUV0RQbSswSzc3TUVqbjhKcTNqYUNHMkxtMGlx?=
 =?utf-8?B?VC9kL1RrbGI0N05jR2ZtMmdCS2ZXSTJqZFFKODMyNHlCMHE1S1Y2UjR3cml4?=
 =?utf-8?B?VHU4MkRkZlQyUHlYUTU1UXRVMWMvb3R2YzZ2TzVIRlVkMWExMjZCQW5lQmdM?=
 =?utf-8?B?MTQ1RXB0RXdCQXkwdjM1Sjc0WDRNbnlCTjRCbm5xUE4xZkRxYVNjVkFLSVh6?=
 =?utf-8?B?QXQrU1RqSFMralJMeHNSWWszb2lNdm5FU3IvZU1qdEV4L2xGWEN1cmRieTNa?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c693b3-3926-4deb-1322-08dce916d38c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 10:32:22.8536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQs655IqyfDqnVW72EGhn4fmOrcNfCLbm30t4ztwsyYSaH/Nd0LybMLiymkAjp4EgG991N+D9mapJjleq56bH5HZfAwg7mBK3s9S/3J1ioQ=
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

Similar to regular resizable BAR, VF BAR can also be resized.
The structures are very similar, which means we can reuse most of the
implementation. See PCIe r4.0, sec 9.3.7.4.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c       | 20 ++++++++++++++++++++
 drivers/pci/pci.c       |  9 ++++++++-
 drivers/pci/pci.h       |  8 ++++++++
 drivers/pci/setup-res.c | 33 ++++++++++++++++++++++++++++-----
 4 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index fd5c059b29c13..591a3eae1618a 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -154,6 +154,26 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 	return dev->sriov->barsz[resno - PCI_IOV_RESOURCES];
 }
 
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno, resource_size_t size)
+{
+	if (!pci_resource_is_iov(resno)) {
+		pci_warn(dev, "%s is not an IOV resource\n",
+			 pci_resource_name(dev, resno));
+		return;
+	}
+
+	dev->sriov->barsz[resno - PCI_IOV_RESOURCES] = size;
+}
+
+bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
+{
+	u16 cmd;
+
+	pci_read_config_word(dev, dev->sriov->pos + PCI_SRIOV_CTRL, &cmd);
+
+	return cmd & PCI_SRIOV_CTRL_MSE;
+}
+
 static void pci_read_vf_config_common(struct pci_dev *virtfn)
 {
 	struct pci_dev *physfn = virtfn->physfn;
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7d85c04fbba2a..788ae61731213 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3718,10 +3718,17 @@ void pci_acs_init(struct pci_dev *dev)
  */
 static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
 {
+	int cap = PCI_EXT_CAP_ID_REBAR;
 	unsigned int pos, nbars, i;
 	u32 ctrl;
 
-	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_REBAR);
+#ifdef CONFIG_PCI_IOV
+	if (pci_resource_is_iov(bar)) {
+		cap = PCI_EXT_CAP_ID_VF_REBAR;
+		bar -= PCI_IOV_RESOURCES;
+	}
+#endif
+	pos = pci_find_ext_capability(pdev, cap);
 	if (!pos)
 		return -ENOTSUPP;
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index c55f2d7a4f37e..e15fd8fe0f81f 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -584,6 +584,8 @@ static inline bool pci_resource_is_iov(int resno)
 {
 	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
 }
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno, resource_size_t size);
+bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev);
 extern const struct attribute_group sriov_pf_dev_attr_group;
 extern const struct attribute_group sriov_vf_dev_attr_group;
 #else
@@ -607,6 +609,12 @@ static inline bool pci_resource_is_iov(int resno)
 {
 	return false;
 }
+static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+					     resource_size_t size) { }
+static inline bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
+{
+	return false;
+}
 #endif /* CONFIG_PCI_IOV */
 
 #ifdef CONFIG_PCIE_PTM
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index e2cf79253ebda..95a13a5fa379c 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -425,13 +425,37 @@ void pci_release_resource(struct pci_dev *dev, int resno)
 }
 EXPORT_SYMBOL(pci_release_resource);
 
+static bool pci_resize_is_memory_decoding_enabled(struct pci_dev *dev, int resno)
+{
+	u16 cmd;
+
+	if (pci_resource_is_iov(resno))
+		return pci_iov_is_memory_decoding_enabled(dev);
+
+	pci_read_config_word(dev, PCI_COMMAND, &cmd);
+
+	return cmd & PCI_COMMAND_MEMORY;
+}
+
+static void pci_resize_resource_set_size(struct pci_dev *dev, int resno, int size)
+{
+	resource_size_t res_size = pci_rebar_size_to_bytes(size);
+	struct resource *res = dev->resource + resno;
+
+	if (!pci_resource_is_iov(resno)) {
+		res->end = res->start + res_size - 1;
+	} else {
+		res->end = res->start + res_size * pci_sriov_get_totalvfs(dev) - 1;
+		pci_iov_resource_set_size(dev, resno, res_size);
+	}
+}
+
 int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 {
 	struct resource *res = dev->resource + resno;
 	struct pci_host_bridge *host;
 	int old, ret;
 	u32 sizes;
-	u16 cmd;
 
 	/* Check if we must preserve the firmware's resource assignment */
 	host = pci_find_host_bridge(dev->bus);
@@ -442,8 +466,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	if (!(res->flags & IORESOURCE_UNSET))
 		return -EBUSY;
 
-	pci_read_config_word(dev, PCI_COMMAND, &cmd);
-	if (cmd & PCI_COMMAND_MEMORY)
+	if (pci_resize_is_memory_decoding_enabled(dev, resno))
 		return -EBUSY;
 
 	sizes = pci_rebar_get_possible_sizes(dev, resno);
@@ -461,7 +484,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	if (ret)
 		return ret;
 
-	res->end = res->start + pci_rebar_size_to_bytes(size) - 1;
+	pci_resize_resource_set_size(dev, resno, size);
 
 	/* Check if the new config works by trying to assign everything. */
 	if (dev->bus->self) {
@@ -473,7 +496,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 
 error_resize:
 	pci_rebar_set_size(dev, resno, old);
-	res->end = res->start + pci_rebar_size_to_bytes(old) - 1;
+	pci_resize_resource_set_size(dev, resno, old);
 	return ret;
 }
 EXPORT_SYMBOL(pci_resize_resource);
-- 
2.47.0

