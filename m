Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E25AAF309
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 07:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CA210E329;
	Thu,  8 May 2025 05:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQnCZBy4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F0510E329;
 Thu,  8 May 2025 05:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746682903; x=1778218903;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KXkjHqcVYL09t54mb9VTpNIHloUFtxMorekSasT82Kc=;
 b=ZQnCZBy4TRSgMMKAIOgL297LOpitYOCLJPebwbxIcDJoSPZJX1LOq9dO
 piYl26lj6M1hkkwBTC5PF8pGsZ+SEB2xLruZezrS/c6TnGQ19O/J4INr8
 T20XNa4ECzfAYFuGo8BibCMneQMInOpGudKHkKQ1EBpE9HzshzbaV76QJ
 t29E9CfKhFHtLJAH30BmsIr+nub07rWcKqZKXC76a8Ub+CgZUIDxyPWUM
 6Fz/pbXTraYA7VkJvk+SofcPkCGYiEHTLY9LRZIetGG7AjMiBTiy2gNAM
 L9JokAtod3dGCNsEy3D2O0O1YLiyhXHLYBsUkGIhT5L9y9rR73EbxUPpW g==;
X-CSE-ConnectionGUID: Lg9mpqFfSRWTlmOV8z5aPA==
X-CSE-MsgGUID: M2YYWRGGTteTPZnUa/3RmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="73829602"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="73829602"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 22:41:42 -0700
X-CSE-ConnectionGUID: 7xOBvLxqThSEPT49nwr9NQ==
X-CSE-MsgGUID: 3fjb3YJWSJu0Kw1AK2Q/FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="137177663"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 22:41:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 22:41:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 22:41:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 22:41:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G66olDIEsbA3qnioYJG4qrpLd5qSVgQW7ftW7aG3x7/i8RE739Cistz4kLZtmez+zBsDR2wWL02uEypX4XNgsk5Ffmvd8zw4kaui4FEUUpX4WM1c6qrfQ6u6/wex3cv7JMDkBGfYg51HMzFnET6u2t1ASOmIBimfeHSw5Dkbw0oKY2AHh/nVlwn+htVWZrRuTyq+hO6p7PEllBJcTzzNhzOGqEcxglbHOaMRN6EPadFzLK2Oqwi/1cUHLiJQJiht5eH/H58D+8IP9jKW5aF3GGy4pc2LutmVCXkiYcekJblrcdsK7pC3GveEhUJJMGFPIEanV37Vpbjj361pirWjYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXkjHqcVYL09t54mb9VTpNIHloUFtxMorekSasT82Kc=;
 b=yBGD77c3xQ5qF9xx58Aj6+4Kc9M5PGH2S4exF2FIEbj44o4bhmn31DfLSIkjGwRouSYLciMAkqhcMjQpx3JGIRRlf/DeeMwAQHfRXSfDC8EKygVWaIBDO22Bgs1eTAO58mxGfie410U6RCz7kV2/4nsuQGn88XODZK7YcO/KAO/u9tV4TQet3oCEEhg53wHtk1LWTeeujl2aovj4OPA8EwvD/9Hg12Vz8hVMypZeaQzsuQdVMzXhTIujTPmw1Hm3iwtc7TLn63wiANyLxEMAKEtLdJBDim0Obvgs1w5g0noaMtsG9FQEub0pht8PGMBMA8Q4mmo9DF53rIVjDkAXKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by DS4PPF2A0C3F85C.namprd11.prod.outlook.com (2603:10b6:f:fc02::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 05:41:26 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8678.028; Thu, 8 May 2025
 05:41:25 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
Subject: RE: [RFC 2/9] mei: late_bind: add late binding component driver
Thread-Topic: [RFC 2/9] mei: late_bind: add late binding component driver
Thread-Index: AQHbuSDqalOEw8L7EUKk6KiF9NE7Y7PH0FSAgAB0pOA=
Date: Thu, 8 May 2025 05:41:25 +0000
Message-ID: <CY5PR11MB63661EF99D9F0B57F03F1507ED8BA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-3-badal.nilawar@intel.com>
 <f9c351fc-da71-4583-9487-3678e354569d@intel.com>
In-Reply-To: <f9c351fc-da71-4583-9487-3678e354569d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|DS4PPF2A0C3F85C:EE_
x-ms-office365-filtering-correlation-id: 170698b5-7d2e-4e4a-c2e9-08dd8df2f938
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dzdCZUg0K3pRYkhNa2Y0OWNBVGNxNkcxTjdtWkp5dzJMYTBNMHlpcmpINFdq?=
 =?utf-8?B?T0NzaUZvemNIU1N5NkFuaWUrcTYwSk1IWlpoOXRQRXhMejAzQ3pCaU0reGJU?=
 =?utf-8?B?QVQ2eDhWek91K3JkOVpmUkd3M0s5QUpqcngwZnFjTjdBNnU5TDNldGFwMzhx?=
 =?utf-8?B?NDNwNzBOQTRzRnVjNWlJOVdBNUJxUldGSzNPejJDK01kMW1iU2R4UVlrS2k4?=
 =?utf-8?B?MWoraTE5LzhBL1NTVUNWRHZlV3owMEYxSFhNbDBJY0JNREVxU1BoQ1EvWnpX?=
 =?utf-8?B?MEFVS2JvbU1tdVErQkdaWHFHVEczZmFoMVZmR1RrdDJqTnVVM1dIRFEyS1cx?=
 =?utf-8?B?SEhMZzF6bHl5THU5dHdTdVE1Rm45UGNjQ1F5eUg4RVNtU1BReVJxQVI5clNl?=
 =?utf-8?B?ZmQrK0g1dVhKOUY3RkNrNUNITktRQmJpZmxhcTBCcmEvV3FnTExhZXB3UEZV?=
 =?utf-8?B?OGlKSUJGQXhhQzVDMDNEdWtQd3Y5cEw0dk1KQlcxamIrelVrdDYzOStEbVlV?=
 =?utf-8?B?b3VqRWpSUXlNc0NwU3ZuNzN5YzVOcnZjUVZURjNhbzZrLzltK2hNeUNNcHVa?=
 =?utf-8?B?bkN5alFXMWJudEd6KzNITnVtbGlRcFI0SVVpemxUdjRrajVmN1lDdmpMQ2Vm?=
 =?utf-8?B?T2tVTWE2V1NlZWNGYVY3a1c4MHI5NE1iV0hGcjZMcE5pZEhUVWZzTEhTV1pR?=
 =?utf-8?B?MGdha0J3ZS83OEkzeWpqYnpTV0IwaGNsSThTcTZtNFQ5YjhVZCtMVlZ1cWZo?=
 =?utf-8?B?eEtxbjRheXN1dlBibmdEekdHdWdOdHliSDB0ZmZhVE9FZmFlMFZXbTlta0pp?=
 =?utf-8?B?dGhrWmVyRzJLcDNIcTJ4U2w2Ty96OEdoMHRDcEc4YTFuVXFxV0hPeHJBTVVz?=
 =?utf-8?B?Lzk4V1dNM1BmbUJ0d2YwTWR0NUpFUEpPVWlMcGg4OE00ZnlabFRRbUhSS2V5?=
 =?utf-8?B?d0x3VTlFa1JBcG5RV0ZSUW94aW1jSk1kTVRSdzdaTHdiQkswaWR1VzEzY3lp?=
 =?utf-8?B?d1c0VHpaZC9XWTI0YW1TTmxFTUlsSTVDWUtzbnA0VEQ2UFIyc1IvaHhNbDd2?=
 =?utf-8?B?YlNRdjFNSlhHNXgvT25RQXB0ZXpocjhocGZjVVJVdHU4ZDdHVm5iNDJmM205?=
 =?utf-8?B?UjYxbG1lejJRcWIxb3A0Z2hSd1NDdHhSbHluQ1Vta3M4V0FEMStGYml0WVBa?=
 =?utf-8?B?UkhML1NYTXRuZzhHTXlLcWVnenNEMFo1M2h4SVNwS3U4V0ErSlIvVHFUVGJW?=
 =?utf-8?B?b0loblN3dDRhUVpHRXF4ZVlVSEFDb1lqbVZYaU8ydWZXQnQyTUhpejd5NDRU?=
 =?utf-8?B?QVlvdi96eU04SlZSSDhHNkJvRTZVT0gzbExpUllJVmUwOEdqMjRzTFpRWG5Z?=
 =?utf-8?B?anZvSFpOQnNFWmVKWGI0Qm5wWWRJc0xqV0hZbVFsUWlQdm9PUm84cjg2cEpl?=
 =?utf-8?B?OGVXb2xraWo5LzBwYWpaOS9oelpycEJMVWpRWkVLY2JMQzlJZzkzeHYrUUsw?=
 =?utf-8?B?c2R5Y2gwZ2NiMEYvMldKOWFWNEozUmZvZlBuR2x6MWJUNGxjblEvOTMvUDhB?=
 =?utf-8?B?T0IyUm01TFNLMjdNaUx3NUtzNmFlVHg5Y1BmRHNDdjF2eWhxT0NIOTBEVlZj?=
 =?utf-8?B?UWJDdnFwaFJsV1l6VlVzcG1lUG5wTmwxLzR6b1V2eG82ZjNFbm9yblFvd0N6?=
 =?utf-8?B?aFJQS2pYc3dtZTdhK05aaXNCUGMxQXdXek1wZEhiK016eVNkWEdzTFdtRG84?=
 =?utf-8?B?ZTFSNHFmRlR4am9ETi9NZnFEc254c0gwSGZFVWpRaVgwYTlFbUFJUzdVdmgy?=
 =?utf-8?B?OWhXc3BZRHlRaU0rYjBnVE0rVURya1g3NHgzSytRazRQS1E4S3cxM0hQRCtM?=
 =?utf-8?B?SFBhaVhvU3dSUnR4c0ZiNGVPc2tKbks2YWt0NlZSNU5WTE8xQ3FYZmU2QVZF?=
 =?utf-8?B?Z05MaWNnN2VsbmNsanJENGNJWnZKSDVWUWhmMFdoam9JVzNtNjdsWG5hanlm?=
 =?utf-8?B?Tm54cG9rQ0ZBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWl2RC9HZVFCWHRGTG5CWUZDZDI1Z2ZwMXowM1BuWkJJQ1g3aWRJSXgza1Uw?=
 =?utf-8?B?YXlFdXNqVnlaN1NZSk1GYklOVWdjZldVV0szLytJSTVuTmlrNEZiSE93Z3B2?=
 =?utf-8?B?akFXK1ByQ2VMRTk0SXVYdk5FWFpNaWRrL2JZbmdiV0lMS0R4d1draGNCVkFa?=
 =?utf-8?B?ak9XYmx5SUJkbndFV0dyWmhlTVozZkJLNG91b2JaR2JTaGRIVzFvMmRSTUtu?=
 =?utf-8?B?NjlSeDA0SXBHSnljWlJXWnphQ3JNaWlxNXdwSytHSG1qdVVYdVZCc1U0SDNo?=
 =?utf-8?B?OXpwQ29pV2VTaGhaQkR1M29HcnZMaEVVNktQa0U2OFA1dzJyUnhCMFhtdHdT?=
 =?utf-8?B?VHdycWlOYlMyVlE0VkU3VnlIMkNWQi91aHdnSzZiY01uazBJWUdDRjY3c2NF?=
 =?utf-8?B?WDluYmt6RHFMMmwwUWVtaU1wMkFIcjg2RTVRS0RzZFEwL3RsQXZqNmNlNmZB?=
 =?utf-8?B?Sk9wRVVtT0VRN1NZUjVhS3hvK1JnbnQ5aU5oOVlVWTlJWWMrZWtZUUU5Zlls?=
 =?utf-8?B?bFJIaytwNm54b0MzYlRNN256QTZlMUtsRTh4Y0t6YUo0MS9XMFlpNTBOODlS?=
 =?utf-8?B?NUFjaUtSWDJJVklva0pMUHRQU3FvZXY1dFRRejJDVldtN3FXSVJwMTZHSGFX?=
 =?utf-8?B?cCs1QVFFM1BBK0ZPaHdFenVKMVRUdmhwb1dMOHZNenJJYkpJR2FwNDJCVTNE?=
 =?utf-8?B?eWhLK1VFa3ljZXRRaVAzL2RySmRaeDFDZ3Q4SHYwdHI3eVF6RUZUbVRKMXRW?=
 =?utf-8?B?K24yYnFTUC9rTTQ2MzZlT1FEbHpjRDJxQjlNK29YZnBqU2pVTGNMVEpqN2U5?=
 =?utf-8?B?NFBTK1pXSktIRlh2Q3RQSDJZMmtMMEtWWWZDTEk0Z05FS1BYM1ZTM1BYNElo?=
 =?utf-8?B?OTNMWGVEUndjWG5heE8ycnY1S28wSER6YmNUWEtYREZTN3NOWlUzUWlHQnZz?=
 =?utf-8?B?OHRxOFJ3cC80bjBkNkRWVHJFaUUvZU5WMGhpS1cyakZkQUxwTm9aNmo3UGxQ?=
 =?utf-8?B?Y3FRcFpqTTlnY3ZNWHdPQjVLNTdyMEZ0R3RNekI1dE03L1RKTEcrZ0kzVHhC?=
 =?utf-8?B?UG5YaFRzS29FcW5qTDE2cFk4NENSM2ZOaHNmdEkwa08yeHlHQ2piNlBjLzQ2?=
 =?utf-8?B?NTdvRGRGbmQxK3BGWnQ1NlpkRXBNQUpPcWxpbWlES01OdndoVzFIV2crZ05I?=
 =?utf-8?B?b0JFbHBDSUlnYURKOCtrVlRtOFdlNG9DWmpOcGVrejZ4YnhONStLTGMzM1kr?=
 =?utf-8?B?TUdNVEFjVHk3MGY2VUs2eGE1Y2dFVjRPeXE5OVFJV3QvLzlDVEhJSzJpL09V?=
 =?utf-8?B?cGlCZWFyUUJUNnc0YUQ3aUtPR1k1S1hhWGsyV0RaWmZycXNYbzlQR0hqOU9X?=
 =?utf-8?B?Vmx4dFBIQXI0Qkh4Mk9nWDh6ZjJPbE9KUDFOdXZWSlBadTNyV05uQzJmZjRz?=
 =?utf-8?B?QWp4bk0zcUVNTWF1Sm1uY1lZOHpad1B1a3ZPeEFqbkQ1VFVuSEpsUjFkQ0tL?=
 =?utf-8?B?R3d4OGs5ZSs5OVNkK3hDM1hwQjBWaDdzWHBWZm0xaTJhRDR6NHpUWDVFZUVB?=
 =?utf-8?B?NlBUTnhpUTI3cGZTRXVGNFhCMEJrL2l6L1U3SG9xMllkUkUrajFVL0pYaHBX?=
 =?utf-8?B?M01hTlpTdUgyTVRYTm42bTM4SXhJYWdaZWJFL29PZ05SZXgrMU5yN09MU2xQ?=
 =?utf-8?B?NXZDQlRUamtjVXMzcDY2YzZpa1VQVlljMitCNmx4VXc4MzRBV0NFSDI2MXg5?=
 =?utf-8?B?Rlg2bnh4SjJqWlFTOVk1VGp0WW9TZzRZdTJoVkZQKzZNSFlQcSs0ampDVTlj?=
 =?utf-8?B?RitFRUV4RTVuNk1VU2xEZzJVRlFVQjVpOVdvQzVZVFZjc2E1SGxHQlU5WEFX?=
 =?utf-8?B?VnVLZlhNdXB0Z3Uwb1JLMWljVVowS3Q1QitpT3BocVV5MTBMaUpsc1hjTnhK?=
 =?utf-8?B?cGJFejFuK2JDMC9Ba3JDT1R2RXVqcUF1T2s4UnZUM2JqaXprTUxEYlBaMEpT?=
 =?utf-8?B?ZTNXS05HRWt4TFNZT1RpQlkvQ3d2RTBNamlDVUpkalpvamtaNzl4RjdRbkxv?=
 =?utf-8?B?Q0c0YVROV25aa1FhVklFMkRxM08xcTlzM0dtTnc4dHdkT0NRUFBLeEF5WmNl?=
 =?utf-8?Q?koirVw5PwYRbsyRjFir/csG50?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 170698b5-7d2e-4e4a-c2e9-08dd8df2f938
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 05:41:25.8872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1BT0FZPR3ulb4iSlgubzZnJhgI8tlHiDkFlGiNDYJ7HlE1+1Yah9maHtP6REsJyITKH3Crsam1dd/RmwsQQPeff2vOQw+fXf7lvAxwAQN7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2A0C3F85C
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

PiANCj4gPHNuaXA+DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2ludGVsL3hlX2xhdGVf
YmluZF9tZWlfaW50ZXJmYWNlLmgNCj4gYi9pbmNsdWRlL2RybS9pbnRlbC94ZV9sYXRlX2JpbmRf
bWVpX2ludGVyZmFjZS5oDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAw
MDAwMDAwMDAuLjQwMDVjNGM2MTg0Zg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9pbmNs
dWRlL2RybS9pbnRlbC94ZV9sYXRlX2JpbmRfbWVpX2ludGVyZmFjZS5oDQo+ID4gQEAgLTAsMCAr
MSw0OSBAQA0KPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+ID4gKy8q
DQo+ID4gKyAqIENvcHlyaWdodCAoYykgMjAyNSBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+ICsgKi8N
Cj4gPiArDQo+ID4gKyNpZm5kZWYgX1hFX0xBVEVfQklORF9NRUlfSU5URVJGQUNFX0hfDQo+ID4g
KyNkZWZpbmUgX1hFX0xBVEVfQklORF9NRUlfSU5URVJGQUNFX0hfDQo+ID4gKw0KPiA+ICsjaW5j
bHVkZSA8bGludXgvdHlwZXMuaD4NCj4gPiArDQo+ID4gK3N0cnVjdCBkZXZpY2U7DQo+ID4gK3N0
cnVjdCBtb2R1bGU7DQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogc3RydWN0IHhlX2xhdGVfYmlu
ZF9jb21wb25lbnRfb3BzIC0gb3BzIGZvciBMYXRlIEJpbmRpbmcgc2VydmljZXMuDQo+ID4gKyAq
IEBvd25lcjogTW9kdWxlIHByb3ZpZGluZyB0aGUgb3BzDQo+ID4gKyAqIEBwdXNoX2NvbmZpZzog
U2VuZHMgYSBjb25maWcgdG8gRlcuDQo+ID4gKyAqLw0KPiA+ICtzdHJ1Y3QgeGVfbGF0ZV9iaW5k
X2NvbXBvbmVudF9vcHMgew0KPiA+ICsJc3RydWN0IG1vZHVsZSAqb3duZXI7DQo+ID4gKw0KPiA+
ICsJLyoqDQo+ID4gKwkgKiBAcHVzaF9jb25maWc6IFNlbmRzIGEgY29uZmlnIHRvIEZXLg0KPiA+
ICsJICogQGRldjogZGV2aWNlIHN0cnVjdCBjb3JyZXNwb25kaW5nIHRvIHRoZSBtZWkgZGV2aWNl
DQo+ID4gKwkgKiBAdHlwZTogcGF5bG9hZCB0eXBlDQo+ID4gKwkgKiBAZmxhZ3M6IHBheWxvYWQg
ZmxhZ3MNCj4gPiArCSAqIEBwYXlsb2FkOiBwYXlsb2FkIGJ1ZmZlcg0KPiA+ICsJICogQHBheWxv
YWRfc2l6ZTogcGF5bG9hZCBidWZmZXIgc2l6ZQ0KPiA+ICsJICoNCj4gPiArCSAqIFJldHVybjog
MCBzdWNjZXNzLCBuZWdhdGl2ZSBlcnJubyB2YWx1ZSBvbiB0cmFuc3BvcnQgZmFpbHVyZSwNCj4g
PiArCSAqICAgICAgICAgcG9zaXRpdmUgc3RhdHVzIHJldHVybmVkIGJ5IEZXDQo+ID4gKwkgKi8N
Cj4gPiArCWludCAoKnB1c2hfY29uZmlnKShzdHJ1Y3QgZGV2aWNlICpkZXYsIHUzMiB0eXBlLCB1
MzIgZmxhZ3MsDQo+ID4gKwkJCSAgIGNvbnN0IHZvaWQgKnBheWxvYWQsIHNpemVfdCBwYXlsb2Fk
X3NpemUpOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIHN0cnVjdCB4ZV9sYXRl
X2JpbmRfY29tcG9uZW50IC0gTGF0ZSBCaW5kaW5nIHNlcnZpY2VzIGNvbXBvbmVudA0KPiA+ICsg
KiBAbWVpX2RldjogZGV2aWNlIHRoYXQgcHJvdmlkZSBMYXRlIEJpbmRpbmcgc2VydmljZS4NCj4g
PiArICogQG9wczogT3BzIGltcGxlbWVudGVkIGJ5IExhdGUgQmluZGluZyBkcml2ZXIsIHVzZWQg
YnkgWGUgZHJpdmVyLg0KPiA+ICsgKg0KPiA+ICsgKiBDb21tdW5pY2F0aW9uIGJldHdlZW4gWGUg
YW5kIE1FSSBkcml2ZXJzIGZvciBMYXRlIEJpbmRpbmcgc2VydmljZXMNCj4gPiArICovDQo+ID4g
K3N0cnVjdCB4ZV9sYXRlX2JpbmRfY29tcG9uZW50IHsNCj4gPiArCXN0cnVjdCBkZXZpY2UgKm1l
aV9kZXY7DQo+ID4gKwljb25zdCBzdHJ1Y3QgeGVfbGF0ZV9iaW5kX2NvbXBvbmVudF9vcHMgKm9w
czsNCj4gPiArfTsNCj4gDQo+IERvZXMgdGhpcyBzdHJ1Y3R1cmUgYWN0dWFsbHkgbmVlZCB0byBi
ZSBkZWZpbmVkIGhlcmU/IERpZmZlcmVudGx5IGZyb20NCj4gb3RoZXIgY29tcG9uZW50cywgZm9y
IHRoaXMgY29tcG9uZW50IHdlJ3JlIG9ubHkgcGFzc2luZyB0aGUNCj4geGVfbGF0ZV9iaW5kX2Nv
bXBvbmVudF9vcHMgdmlhIHRoZSBjb21wb25lbnRfYmluZF9hbGwgY2FsbCwgc28gaW4gdGhlIFhl
DQo+IGRyaXZlciB3ZSBzaG91bGQgYmUgZnJlZSB0byB1c2Ugd2hlcmV2ZXIgdHlwZSB3ZSB3YW50
IHRvIHN0b3JlIHRoaXMgaW5mby4NCj4gDQo+IERhbmllbGUNCj4gDQoNCllvdSBhcmUgcmlnaHQs
IHRoaXMgc3RydWN0IG1heSBiZSBkcm9wcGVkIGZyb20gdGhpcyBoZWFkZXIuDQpCYWRhbCwgbGV0
J3MgbW92ZSBpdCBvdXQgaW50byBYZSBjb2RlLg0KDQotIC0gDQpUaGFua3MsDQpTYXNoYQ0KDQoN
Cj4gPiArDQo+ID4gKyNlbmRpZiAvKiBfWEVfTEFURV9CSU5EX01FSV9JTlRFUkZBQ0VfSF8gKi8N
Cg0K
