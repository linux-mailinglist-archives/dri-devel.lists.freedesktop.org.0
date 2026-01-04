Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40933CF1154
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 15:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160A210E012;
	Sun,  4 Jan 2026 14:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGXy5l1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0641010E012;
 Sun,  4 Jan 2026 14:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767538342; x=1799074342;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=G2gAtyO3yDJ2LZp2QqKF/NZD53BlfSn6Snd2hm536Kw=;
 b=fGXy5l1xUCs1jU3qAQMIkflPw1QkRhxPKTk24wQrnph0ChBXWlLvK8l4
 2JY5ymk9vIea1K+gKxIvC3ZRHrunT7vjrfiG2Bt1uKBPw7ji9s2A6OPb5
 6LuOsgkpuklxhgBmhXV+qCWjqoBpZkoOvkMnyACJ1lBSbGccWNXZZAXHz
 0pal9UY1Wat52KDLh6flXWpvDDgrjqA0rzsMRNne17bTqOVmFe8VqTECb
 LMWUqQmsrUTuVihNZA3JWHKb3TntPV+rgOBAXGDdtTmSXfD3pBziBwuUC
 q4Sauxm5IL7FMtBzWsJ9EhANzKOx/hVp8r+PxgbDdAqCZ3oQdpjoo0GXB w==;
X-CSE-ConnectionGUID: 0YvA9LoqQCKnrOb82Dh/iA==
X-CSE-MsgGUID: FKIZTm2SQSOM/n324oF6ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="79564319"
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; d="scan'208";a="79564319"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 06:52:21 -0800
X-CSE-ConnectionGUID: 8AuJUWEHShqNRM7JLQb0oQ==
X-CSE-MsgGUID: QT/2K8DoQH+ehv4uVDICAg==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 06:52:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 06:52:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 4 Jan 2026 06:52:20 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 06:52:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJ3yEllRNeXVZeIe7gB9lUsSlvnXLBVQpjrrTULCVzXmv/PkOy4oKTm2g/1tVSTzxY84F9CiYBMPYkXSY47pDYClx/Pgna/OvAoOB9d3GzGjCQWYZLT0kbkibVd59NtFcQ/qjtIyWUABqnqpMa1ucQ3E4hB+4ItKa6ON84hAH3Cs+tF+vmuoTJGmkQTn17ynNCOrFctZopxDL0gd0FiIDFEcsEMEmJ3nT0Kvvy8jGFIRnqpsD1ePeTsQMx+ToFWFS5zQgwvBzAJG9uARCMWTPpkmUJ1jQTxps9JJkXABp4O4l96x5csWUEUGjvxit9UTV+uRnfaVhby1+jZjfzCYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2gAtyO3yDJ2LZp2QqKF/NZD53BlfSn6Snd2hm536Kw=;
 b=FHRFi3POoW7ATxQtAWY9aS8ofo1TuxvyboLeBTv+gyNmFLdiSEyhSyewYZhJzOGyhPLZlFfGd8mCP/JEQFJ/2JpeeJ2wacqzHJAlZRJNjFxJnEurxrHm7lJz0B1ew0IrgHkx2hftI+n9u6DcR/epsoBA+Md98lpdG5O1pYvzdMJqxFzLKdsF1dgMECWxZgmqnoBto6e9K3ICkVNqSN6dgiMtsBmxql4eXFj0crd6SK0xI7ABpbJ3h1LyoRp4lHn1N26r2xwwts6bTPNVV/dY9gs5tLMc4k422yYWBlY6R1c8JaLHbkQpbe1DRrCgY2to5GhAearQqYgzd9hqDWuPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by CH3PR11MB7868.namprd11.prod.outlook.com (2603:10b6:610:12e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 14:52:18 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%5]) with mapi id 15.20.9478.004; Sun, 4 Jan 2026
 14:52:17 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH RESEND 0/4] Kconfig updates for MEI
Thread-Topic: [PATCH RESEND 0/4] Kconfig updates for MEI
Thread-Index: AQHcSL3tCl2GQ7HVhEGaKV9eMqUCc7VCfaoAgAADkBA=
Date: Sun, 4 Jan 2026 14:52:17 +0000
Message-ID: <CY5PR11MB6366AC576419F1A3577EAEACEDB9A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20251029102153.419347-1-Simon.Richter@hogyros.de>
 <1de1d31f-3c26-4d8b-8150-c10300bb6615@hogyros.de>
In-Reply-To: <1de1d31f-3c26-4d8b-8150-c10300bb6615@hogyros.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|CH3PR11MB7868:EE_
x-ms-office365-filtering-correlation-id: 1b8e79c5-9f52-4b7b-4406-08de4ba0db4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?OWt3YVU5YlNJRXdVUnZUVm91Q1l1QmRvem5hYkZySTNUUTEwaDhOb2NxY3o1?=
 =?utf-8?B?dUw3WUU5T0lUTWo1Tzc5M0RiNlB0NnZLdUNmM0VGTE9JQzRacG5mYmxYeld2?=
 =?utf-8?B?amRZZW15bDRuZ2IyMTdMTzlZb2tCd0JjV0l2dWljQWJiS0RjMHdCTnRqd1hu?=
 =?utf-8?B?ZE0rU1lVV0pUOHVMTnM0b2Nkb2NaY2NFbGFPUkt2VWI0Mm9UR0RTWkZ3eVVT?=
 =?utf-8?B?U3d3WW1ZM0tlYm44VlV1Y3g2c29jQ2pDTFJEakgxUnhGZkNxbW1qSDZnNVBP?=
 =?utf-8?B?WG9hbzNkYVFVUHpkcTUzbHRZZmxyMnpNQ09CY2FwSGRlQk9ldjJRRE1yZVM3?=
 =?utf-8?B?N1JPSGJLZ3hNSXlZNXVQUWNtenlNYzdyK3hXbzZnbGl4N0tab1VSWEtyVE96?=
 =?utf-8?B?bzVFNE5vTFlkbUF0ZlZNKzVhVEhMUmFOdENnMFhLWU5ZVFVOZnpCSDdnZkNz?=
 =?utf-8?B?b09kZGNwWEE3dmxvOWlKVEdKYVp4dWdkZjJsK2MyWCtabm90dGpOK3htRCs4?=
 =?utf-8?B?S3VCZ3d2UC9LaWdvanBUajNXeGRJbWdHWkNlQ2lmbzJuMUpWQzNyZHF5ZEJC?=
 =?utf-8?B?MjVFVlJxV3BxdEM4MjBNSkI1RDExUWlpa0h1QWN2THRlNE50MVhNa21Hdmpn?=
 =?utf-8?B?aDQ5M1k4QWpSUnQyVmVacEthaGcxTjA0YVJiTGpSekpRajZmZWpkTFQ2Zkti?=
 =?utf-8?B?K0FLRVY5TGlsKzhaOE9tNHFjY2VNU0Q1R0hBeDZwRzd6TWpvTkRvR2tGSCts?=
 =?utf-8?B?Wk5hRnUzMHRrampQWFRyVER0dE5LbXR4RlFFMzRvT0cvb283K0NXeU85WHN1?=
 =?utf-8?B?THBwYWhVWGhtNzQ5bTh2YnNlK2pOUjVJdFBiaHN0dnpBekRuMFdkclltYjJ6?=
 =?utf-8?B?ejNWNWc5Y09YblI2cFhnODk1aUJNWnBZMnVyenlyc2JBbGQ1VXR6bDNYYlMz?=
 =?utf-8?B?cGZHMDZtQ3ZodkoxMjdtMWlUOVJnOTVpWTRkNEtNN2F2YjZRbUYyVmlTQkYy?=
 =?utf-8?B?MWNPRUl4M0pPOFkrbUhlNFgrUnBiVVhUVWtoU1pEQ3pSMXpFYVRGNEM0WGJW?=
 =?utf-8?B?QzVyVGpqejNyd29GMTcvZFhDdGRxYTdubTRjU3NLUTJNNk91aEtMd1dWdjR6?=
 =?utf-8?B?V0VESlkvcjZubE83dXVNeUgvOEdXNzFGb2szdjBJcjJ2N2RVN3VkNlhkdS9H?=
 =?utf-8?B?K05DN1pzOEhZZCtpTFhqZGJSTllLYmhKd1pRdE9DZ1hWMXpkYXU2OEhJQUlm?=
 =?utf-8?B?WXNlSjNRaHBxQkhqVVJiQ0tWS29ZSGl0Y0NYUkhWV3psb3lXcUZJWGN5N2hG?=
 =?utf-8?B?cVBPdklDeldrdnRYTThvdm1yREViMTdTbk9nZFFoMlVUMDUyKzhManlvcXdZ?=
 =?utf-8?B?OFBkRTB0MmRzK2hOVlgzQStML04yV0RiejV5K1RWaVkyM0gyRWJSLzRwOTlW?=
 =?utf-8?B?RVdFQmVGREFod1BnR2k0dFZUb1dHZVI5MStuUmZsZjlFckR4eSs5SnNWbGQw?=
 =?utf-8?B?d2tFdDVhZWFIbEQ2TTdkNDYzWXNuTVJDMHlTM0twamc1QS9KRFNhZGlTK0Fv?=
 =?utf-8?B?WDE1R2pxZDc0WFA3NERPSXJ1R2RWcmd3c1ROWWorYWN4NmE2NVkwRk5nU2Vk?=
 =?utf-8?B?OFBOVlFXclA1UnV1NFJjSjdFOGRNVHJtSElzQnVaVkdyUS94UzRFcHNlOGFh?=
 =?utf-8?B?UXZJa1QrTDN5Um9TQ1FSKzFWOWZqWW9nOFU3RzM4aVcvc3FyYlRRa0dYMWd2?=
 =?utf-8?B?OUV1SE1OM2hvcFZFUFhoTSt3M3I1Y1g1ME5HaFh0WDRoNGFaUFEvL1JoZzNh?=
 =?utf-8?B?eWh3b3ZDV1ZzVXE3dEZjQkE5OU5BYXNQM3QrSzJXSzVmd3FDYlpPYlcvM0g3?=
 =?utf-8?B?M3h5cjU0WGdvZHVuN01GNmtOdkRmVkIzSHJYQWZKUVV5OFpEUXJKczV5b1dB?=
 =?utf-8?B?bGZzQXhldE00eENnS3RjWTUvemkyWTI1SEozYlhkR3RUNU4yd3M5NlZqL2t2?=
 =?utf-8?B?WnArNkJuWm5BPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djNVZTB5cWxBRGcwZ1EwN0FqZGpOckNIbUFCWmtFbyt2NS9KWHZzRzhKbmdH?=
 =?utf-8?B?ZmRGRzhNRFhVaE5Rd1pzd3pzaUV0dVhZbXhVVTFQR3g0d3h6TGdkKzlyanFH?=
 =?utf-8?B?aUxFUlRuaVRWTGRQVGhEQWJXQ09MS2VadFRpd052UGdjTUtuMTh1dncwS0NB?=
 =?utf-8?B?bnRWaURqQlQ4L0V6U3cyeEl4aWQ5cEloS0lHTERERVJkVkhJNjJUQmxtaTcx?=
 =?utf-8?B?WXNxYmcraElvTGhHMGYya25WTm52ZnhSbkdSbm5TVVRiUG52dktrWUV6ckVn?=
 =?utf-8?B?VllOZThBeXZLSno1VGNxM3RGNHY3SFVsSHpiVGNqdU9NOUhlb29mR1V3NjVM?=
 =?utf-8?B?d0F6UXdqTFBEaE03S1dDSkFFZlhkbEtjTW05MG9CR0kwU1N1bHRVV0RkaHh1?=
 =?utf-8?B?UTM0NVZoYWdiMDhVQklhWVNTL0YvQ1puN1BzU2lOOWtzakcrbEVmSnVibU0x?=
 =?utf-8?B?UkxUYUlvak4zZ2dPWmFvckNIdVVZRHVaWjJVeFV2SGxsRjUzVXJPekVzcnVp?=
 =?utf-8?B?d0s1U2FRU0R4Q3JsdDV2RnQyeThHeGFUSXlLNFBlT0ZObVNGcEdZZm10bW5I?=
 =?utf-8?B?Myt0NUd5VkpIOUVOajVReTRCNFM4L1p3clRnS3NjNEpvUG1MMFp0SGNEelkw?=
 =?utf-8?B?SEJwVnRhU0t1TzBKc2RBYzhVZG1lVjlRR0wvYnR2Q3UvUzZEckdISHlEUitY?=
 =?utf-8?B?ZVZRS1BvbVNKZVV3RjYxdzJFa21Tdzc0alNBdGhIdFZnM2hZazQ4d2swYkI2?=
 =?utf-8?B?WmxlZWIwSDhSdUVFbDlQb0hJZU9rc3QxUW1rKzRQdHJvOW5sUytMQmhUdjBm?=
 =?utf-8?B?MENFT2MxU2Y4RXlDNlp0Q2NoUVl5UUFPSERSVkJBTWR6VnZCODhJeVNQRlJ5?=
 =?utf-8?B?alZWV1E0ZDZ4WGhpMHovZDgyODNlSVRpaEw0YXIzdXQ5U1dRR01hNDBud0VC?=
 =?utf-8?B?eExKMkNyVnNZQng1V1liZEh4d3p1Vk9yY3Z3cmpWaEpaVEJHanZNTndBK2NZ?=
 =?utf-8?B?eGNRK1pvLzE1bkt6d0NSRlpqeEQxYkI3bUhVRkJNcXFzTmdIK0g4TWFKQ3Vp?=
 =?utf-8?B?TGZLNjRhWWVSSjR1VEV2bmUzSWh3Q1AxeVRMNjJxNWpySUJqSnIzSHF4WnZL?=
 =?utf-8?B?RHlTRmpnb01SVmFqVDJISURsQUdROE42Q1REa2kyb0RWT1Rzd3NjR0ZBd1FN?=
 =?utf-8?B?b21hNWduQjBrQUxTT3BhWnBPSW1nTWFlaG5oR0VIOW5EdmNXUmIvait6ZGY5?=
 =?utf-8?B?bllWaktHbjJNTkRqYkM5QmMrSmgvYlF0YXJvb3drSWhFWHVXU2JQWDhLRmZX?=
 =?utf-8?B?ajBVWDFWaUMrcHVFVDc2alY2ZFAxcXBQTzBpMXZQeU5pS21LdFJXeHMyWTdh?=
 =?utf-8?B?bU9TbFZXRkxBTVRhS3hmcmRhR3dld09pKzFieUFsR28wdjVSVzl1S3BjclJ4?=
 =?utf-8?B?VGZGWnZyWEJDRFIxSlZLdVZBNitMYVljOVpHMDJsUUpqQk1XOUc2K3Q4Skdx?=
 =?utf-8?B?eVBIa1U3QTBYSXp2WTlQdGxjODhZK0F1QS9Zd0gwdGVhV3FTN3VNc3ExYTc1?=
 =?utf-8?B?Vkk3Q1JHelg0dTljdGYwRWVMQXRjQzJIRVAwS3NPL0g2TktOa3Y1NXd2cEFC?=
 =?utf-8?B?NW5xazJQbXExLzZhL0c4dWh1VXhxSkwvTmhoYmdyRFpZZDNZS2dTV2NxdVNR?=
 =?utf-8?B?NDFaSEhpUlE4bTg1dHlKRTVud0pvL21sNDh0VkxxME1HYkNhelZRd3NMTE45?=
 =?utf-8?B?emVPaFU2bzZoaFFyQ3Y1Mmw4QW9ORVEyL2trY3N0WUhJODdGR2U5dDRXdmJV?=
 =?utf-8?B?UmlHbGhEMkQ5WWNJUFNQZStMV3JlSDUydnIwVVZuR1dISVFNTGl3amZmSEJi?=
 =?utf-8?B?TFFCMHhJT2UvczJuRFNKU0FIWThxcVBBRXNIWGd6TUkxM2NBNXMreEVSUXdS?=
 =?utf-8?B?NnFrWUpjM3pkSTE5VWU2VG1kRDMwUTB6R011YmNQV2o0aktoZWxRYXZOU2h1?=
 =?utf-8?B?a2hTRGZJWVQ2UVRyaENJekN4WHA4SG0zSWxGZzNiazVISjROU1NwcU5hbDNj?=
 =?utf-8?B?eXV4akRhM2lmU0F6VTlveE9TM1cvVytTRDlraHNUTXZXUjR3VXNGb3NaQlov?=
 =?utf-8?B?dFp1aWg3bnk5QUVMa1FmY2ppNFhPQzhSMTZ1UGsxVE5JR1BQU0VzT2ZmL1Y3?=
 =?utf-8?B?M1FESGFVOUhXZGJpS0lsY2ZDUEdpK3BoSlhDUWZ6VWVNUElhdkdIT0c0em4v?=
 =?utf-8?B?UDQxS2Iza3NGNkdYTGFyVmp3NVY0dElyOGNvYTVFTDVOeGpNS0RwV0JQTGpG?=
 =?utf-8?B?aHhrTzNMQ0pvQlB3YnptZG1VOEtZSDEvdVBRb1JDZTZucGNHVEZGc2pOOE90?=
 =?utf-8?Q?QPCVTit4E1TKpeiSr9SMD7lLgvZbUpn/b5HSBSJoqeyLR?=
x-ms-exchange-antispam-messagedata-1: K+EROtEmj0TOUw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8e79c5-9f52-4b7b-4406-08de4ba0db4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2026 14:52:17.8873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W1FYF+vFDzyZnA+ikBV6b2ykKfx1X2Pc4IE0eAvFPVAe/Zh35wn+XVQOiLFfVFOQaW78zYhPUWyf7e0S5WArxUmeHcEClCUbXrihY05E8y8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7868
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

PiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggUkVTRU5EIDAvNF0gS2NvbmZpZyB1
cGRhdGVzIGZvciBNRUkNCj4gDQo+IEhpLA0KPiANCj4gT24gMTAvMjkvMjUgMTk6MjEsIFNpbW9u
IFJpY2h0ZXIgd3JvdGU6DQo+IA0KPiA+IHRoaXMgdXBkYXRlcyB0aGUgS2NvbmZpZyBkZXBlbmRl
bmNpZXMgZm9yIE1FIGludGVyZmFjZXMuDQo+IA0KPiAgPiBTaW1vbiBSaWNodGVyICg0KToNCj4g
ID4gICAgbWlzYy9tZWk6IEFsbG93IGJ1aWxkaW5nIEludGVsIE1FIGludGVyZmFjZSBvbiBub24t
eDg2DQo+ICA+ICAgIG1pc2MvbWVpOiBEZWNvdXBsZSBNRSBpbnRlcmZhY2VzIGZyb20gR1BVIGRy
aXZlcnMNCj4gID4gICAgbWlzYy9tZWk6IEFsbG93IGJ1aWxkaW5nIHN0YW5kYWxvbmUgZm9yIGNv
bXBpbGUgdGVzdGluZw0KPiAgPiAgICBtaXNjL21laTogWGUgZ3JhcGhpY3MgYWxzbyBoYXMgSU1F
IEdTQyBpbnRlcmZhY2UNCj4gDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9z
ZXJpZXMvMTU2NzMxLw0KPiANCj4gQ29tbWl0IDVkOTJjM2I0MSAibWVpOiBnc2M6IGFkZCBkZXBl
bmRlbmN5IG9uIFhlIGRyaXZlciIgaW1wbGVtZW50cyBoYWxmDQo+IG9mIHRoZSBsYXN0IHBhdGNo
IGZyb20gdGhpcyBzZXQuIFRoZSBvdGhlciBoYWxmIGFsc28gZW5hYmxlcyBnc2NfcHJveHkNCj4g
Zm9yIHhlLCBpcyB0aGF0IHBlcmhhcHMgYWxzbyBuZWVkZWQ/DQo+IA0KPiAgICAgIFNpbW9uDQoN
ClRoZXNlIHBhdGNoZXMgYXJlIGZvciBtZWkgZHJpdmVyIGFuZCBzaG91bGQgYmUgbWVyZ2VkIHZp
YSBjaGFyLW1pc2MgdHJlZS4NClRoZXkgd2lsbCBiZSBtaXNzZWQgaW4gWGUgbGlzdHMuDQpQbGVh
c2UgYWRkIG1lIChtZWkgbWFpbnRhaW5lcikgaW4gY2MgZm9yIHZpc2liaWxpdHkgYW5kIG1heWJl
IEdyZWdLSC4NCg0KLS0gDQpBbGV4YW5kZXIgKFNhc2hhKSBVc3lza2luDQoNCkNTRSBGVyBEZXYg
4oCTIEhvc3QgU1cNCkludGVsIElzcmFlbCAoNzQpIExpbWl0ZWQNCg0KDQo=
