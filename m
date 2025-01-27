Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC97A1D89F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD9210E559;
	Mon, 27 Jan 2025 14:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvEXakn3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E3D10E559;
 Mon, 27 Jan 2025 14:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737989079; x=1769525079;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=d4vp0zKeD6PmgWa2HXjdLWvhjP5vI5+V6p0msx1rA00=;
 b=JvEXakn3h9vs5sWrJh08ZHQSzv4F9x2ytxFVYRKa4T5PJaI3iVcm4fFK
 4o5lOeT+PgjxWU4a9IGE4n3ZK4BhYCWONWygESpybDo8rr2pxeFG20/Yu
 caWkgNOwi7Wsi9DF+DhPyix4uJxRGWuayQHTLO09FB0q7Gpqrj0qwuDuP
 pGHfy+2XgjhXhOuIHHbytH80bm86dAfHmBmZf9Mlqgyk57dGlq4YgxkKh
 u2F4LXD5ESp1aALpfe3QPKf66XrV5KqSQ7u4extf5/rXU+WCTeg0RpfKR
 SC0AlSX81+UINL22evEYZLxrhDfRoCI5iuv0eNFoeump6UrT1pDWdrpGp A==;
X-CSE-ConnectionGUID: FL7n59F1SUiX4r01i1gNow==
X-CSE-MsgGUID: NcLe8FsZTauI+aqFNNdk9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38361099"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="38361099"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 06:44:39 -0800
X-CSE-ConnectionGUID: 8OURXnRmQPuPJhN5ufqebw==
X-CSE-MsgGUID: J9i2WFWZSZS7biJClWB+lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108313679"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 06:44:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 06:44:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 06:44:38 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 06:44:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKDZhO/BAj3wdiLyOyX9ap6mjJo70CFBlzvqQiUheyS27mt/AdKTKI2AdojC89tOrmPNkGDYme2QDuDIYX2D/2UIKkHfkJKnowNDXPv5IkiEyYTQUyuYsddGRvE22vGAtkU/bdz+NtW4QGzWI56qHhuOo+GaquR7rB8P1HfPmIhdwSjIAMEThG/1YZL9JgiPL/Rox1hQbK8TdC2/XapR9HAo8UOy2kpE9nCmRn/DZwFePKlasfArtOPYvUwlk4FWfukB9vhNBa7FVF0clLeoCTgUqAOFImSWuWFrdirVfzxBsztzvci1HSluc0xecUyqV9nUJwJypv3/JoSMQ+/CqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4vp0zKeD6PmgWa2HXjdLWvhjP5vI5+V6p0msx1rA00=;
 b=tQnTXoxKYxu7sQJl4K8Ei25xuo2M/D42jRyMJeULAuDaP34VS4IP218H7VRe51lWSw5Md3eLlwr93LWoUojh9QiDUtncc6SZz1quNW9G+mjltIwQWE4iwa36pvM8bA4rgxqbg7kByg2knr1W0V/AMt/oyX4f/NSCVVN5adXEc/auDVCITFz1Dr708+BaVkNO7e961+OYGMWiXVMHjyfLDtipB+hj8RpycDDBrm17U2R9R9fJzfaKnEb5fyYENLk1W5WCr07BlNhUJZ4t5jR7zWS5M6Cdf5qrhMZuVHrf+Fu2zUiLMktN/8rMC4wUwo7xvPtUu348v19Vr/E3huOozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MW5PR11MB5907.namprd11.prod.outlook.com (2603:10b6:303:1a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Mon, 27 Jan
 2025 14:44:35 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%5]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 14:44:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 27 Jan 2025 14:44:29 +0000
Message-ID: <D7CXPGEMO1T0.39WDP8CFIFXL5@intel.com>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Andi Shyti
 <andi.shyti@intel.com>
Subject: Re: [PATCH v1] drm/i915/guc: Always disable interrupt ahead of
 synchronize_irq
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-gfx@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.18.2-107-g4f7f5d40b602
References: <20250123162351.1364395-1-zhanjun.dong@intel.com>
In-Reply-To: <20250123162351.1364395-1-zhanjun.dong@intel.com>
X-ClientProxiedBy: ZR2P278CA0005.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::10) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MW5PR11MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: 5534da96-8e48-4631-2f95-08dd3ee11e03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmhhTjhQR1hzMjJwLzBUN3lGeGMwN1lxTmhTbEozeVdyeEt6MmRaZHlXTWpO?=
 =?utf-8?B?ZUdEcDVScnRpWmFhTW9tU0RZRlZSYkx5MWVaYXlaR2dTYUhmK3l1TnBOR0VS?=
 =?utf-8?B?OXBhWmh3NEE5b01nVzR2V0oyRW1hcHBseHpKTXByVTFDekVJZTFLYzZ5V1Mx?=
 =?utf-8?B?ZVMwTEJHdVFtTVdVSjVGQXpCOG56eTF5WFdONTBMRUFJVEVVYjZVbUgwNkJ5?=
 =?utf-8?B?ek1VTlZLa1RyMlNHaGlQWVdQNGNiRTd1U2w1S3FrOUFMNU1SWFYwekR4dHlq?=
 =?utf-8?B?V2w3NVJwUFRWTHFXc3FsSUd5NDZ0VlNmTmY5d2lTQURXUFhaUE9WZnc4dTJE?=
 =?utf-8?B?SUFOV0VNYXo2SmQzMUc0SXFCVXJNSmROK2FBVDdaNWhIbW5zaDRMRjVVQUl5?=
 =?utf-8?B?eWJIdTVvclRGUXplM3RsNTZsa0dJMHZCdjFSZ3VUbmNib2M3YzJyQlc3YnAz?=
 =?utf-8?B?d0tXdllwcWdROWx4V1FiK3RHdEY5T3orOTNMdFFIRUtUaG9RbEdoMkFBSzRK?=
 =?utf-8?B?QTJDcS9NNkR1dXJVYW1uTHRJb1MycTlDQThJUE1QdlhrT25GNlZzRnd6ckpN?=
 =?utf-8?B?TmRCeHlkRlZPcWx5Ulk1enNtR29EcEs3Zm8rTWQ0Zmd6dXgyRlhMSy9UQXZk?=
 =?utf-8?B?Z3dlU2o0KzJ3OE8zeGdBN2x2YWRWejJva1lTS096VmprT1JWK1RxN2R3a1Zx?=
 =?utf-8?B?WElqdGpFWTU0WmIxMWwwd1cwbWw3MzRFNldQU0EwbEc5bm93WWNJL0RndVhP?=
 =?utf-8?B?YTV0Q1RJOXRvM0hGeWZsZkdDcG5FcjVDUkRLb2xkUE5jMXlhZDhPdDV6L3hl?=
 =?utf-8?B?blg0TmRlTm94cGszZjlCV3lFSzFsQzVHZkl0L1krbDlTdVdXZXZ0aHIxVlFW?=
 =?utf-8?B?UXRGNWxNeFE1UTZaTzI5c3lsVWVHSmNEdG5XSHlkTFdxcHVacG1VVXRnbmNB?=
 =?utf-8?B?anFBSWFqN2VvRzNtd0pGbVkrKzRpZlYzQ1FzcERMUkxQbElnaUpsdDhaUTRr?=
 =?utf-8?B?eCs1Q01SYjRhTEJUUkZSZ2VFdWN6Z1psNDlyOGthNVBZUTVPcXl1bk5sWDNs?=
 =?utf-8?B?d0J2L3MyQzhVVW9hRGNSUmRja2g5WFVzS0FwZnZyNXdiVktaMW94enpTWWNQ?=
 =?utf-8?B?dUpuNFBIR0FiQ0U1QkovZjVBOWhQN1lHZVNDM1FlYU1nMzZiQlkrNUNudm5l?=
 =?utf-8?B?aG9KZWJBdmNpT3UyUnFkKzBiaWd2L2NObmtQMGhwcFYzTTYrVVMvYlBYNXNF?=
 =?utf-8?B?eG02UThrMWxKMUJhVXBsR0tSblFuWjV2djNiWk1XNFNEQUVGK1JlK0tZREFm?=
 =?utf-8?B?ZXhuUmJqVXBWOXNGeU1la1lSTEh2dThNSEQ2QUFHYXFDVlF0ak1MOFZ3dWQx?=
 =?utf-8?B?bkVBNWg0NjI4eVF3VVUzUmtvNUdvT1g5TGdKd1hLQUJxVzNST2JJeVd6RDdD?=
 =?utf-8?B?SU5lUWtGNlFKemFNN21id1BJdlFBNHU3ZjNQVDFNUTY1bGZENFgrZ0lzYnU5?=
 =?utf-8?B?TjRRV0VDQ3RPbEVuS3kwSmdQUlFaV0J1bFBaOE5FWVppV1J6SE1kRkxOZHZ1?=
 =?utf-8?B?Z1JIVXhEMDQyTkc1S2VtZDJpN3lIYzl2NlozZTlvMDIvNUpGdXFWVFRzdnpY?=
 =?utf-8?B?b2gxS0g5bVBsL3d6UGJYY1JEMkU4REt0RGZBc2ZIZWMyOTdaUGFCY1prbUk0?=
 =?utf-8?B?UVAyNEZTQUYrdDlVcTZKcjJqd1lObnM4c0dxeDhyaWMwaHZUblg0Z0xaNmtB?=
 =?utf-8?B?aTZ6UWMxbm9TMjIyWHN2TFdnTGhCNUFicWFoZHlNYjl2Z1pyblVONG02MURX?=
 =?utf-8?B?SVVEQ0QybTdhbUJqa2ZuUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFBWcGg4TlQxVjlFcmkza3hCOUJpb0RPcWl6dmE1SEkrTXpMRjg0SVlDOHlS?=
 =?utf-8?B?RkdBMUFsK0hORmE2U0ZYQ2txYVFlSWU1bEkxbzV1QlYvUnFpWC9LRTdtS1hp?=
 =?utf-8?B?djMrUUJqYnZPWDN6RDhyL0VHK0hsaUhiV2xkcFNSSmo2Wnpzdlp3ZUFUVEVm?=
 =?utf-8?B?eDdLWmM0N2dIQTZDS05SN0txWStJaElJcHlvZU5sRG1BRGtwRkRsdjVSeVVY?=
 =?utf-8?B?YjhwZHVuY3NoMDY5aUtRbXFKM0dBSDh4QVJzaGFqd0pLSTdLRUk5QzBjdVQx?=
 =?utf-8?B?aVlZOHRwbkp3aDN6ektKeTYzOEZQcWRabHAxNlhOb2lMTHpkaTZ4bDJJeVNv?=
 =?utf-8?B?T3U1dERobndWYXdZQmRVU1pSSkFaVm5oaEZRUVduNVlPcG9HWEk4ekNEM281?=
 =?utf-8?B?UFhSL3pVN1NSb3FyOUtlQUVOK0NwTXRlQnQ5S2Fha3pYMVl4b1RjRi80Yk4r?=
 =?utf-8?B?UXZISXdHaWNhZG9BMHZUS21tb3JPQXNPY2U5endtYVNqN3JlYjNuRURZdE1Y?=
 =?utf-8?B?WmMvM1pueXZTblIvVlF2Y2x5V3dFMUNaRFdtaUZBZUgyQ0JmbS9LRlBVelVa?=
 =?utf-8?B?V0dxTFIzSHZGYjN1U0NmOHZtSTR6SjVmc1g4MnkyVXRjeUR2QUlQbDhGY3BT?=
 =?utf-8?B?RlhOeVN5OXcybnA0aU5xK0NMSUV6NFVYSVJ3aGVrS1hsWWwvaW50bThTcFZ6?=
 =?utf-8?B?Tm02aGZvUEM4TDdaallqN0lieGdSY2tlU3NmUW1NR1JHZU5FM2E1c3hSUnVU?=
 =?utf-8?B?TEhmZWRNSkhSOVFZUEV3K3JDZVRpd0pTVjViaDdnc1cvQyt0enNpTFN2WHY2?=
 =?utf-8?B?TkVzdmpGN3U0ODljSUFLV0t6eTJYRmhVM2tSWEFuQlRhTHNSU1pXQ2szVW9U?=
 =?utf-8?B?WXBtblh1djVSN1JBZVd2K3hFQVUxNzFQVmFjNGtGVmZWS3FPNEpzbDZGTGl2?=
 =?utf-8?B?clV6QUFCVXRISEszRHc1enB1YTI5YW56azRLdVZIR1lNekJvcWVweXJIZFZr?=
 =?utf-8?B?cnBBTTdna1BPUFZzQWZpYkZ4N1VCbm5sT201K3JKNm1RMnRqeFdJUkxFdktw?=
 =?utf-8?B?OGZSemtJYU04ZURCNXVsU3BrVjRHeGgyY2FwSlpWcTB4ZFdWL3hRMWhDSXYv?=
 =?utf-8?B?VXpxcEhrblpiQnVwZjRMamw4MWF6OFoxSUVZZHpOeVFkcWRUU2IwK294aU1L?=
 =?utf-8?B?RENuNDBRb29GUFpGNUdWVTI5bWw4T0pmdG9qdk5qSWh1R3pqSFlWKzI5cUwr?=
 =?utf-8?B?dXJOUHl0VDlnR1JPS1JRUmNQQ2lodHc1M2hGVnprRVl5cHdwNFNpNE1ONnBo?=
 =?utf-8?B?b3FoTTFiQ09ScUQwRmxGbE1sTXNZNjN0NldYSmtqVkwxQWdIMVo0ZTlkNVhk?=
 =?utf-8?B?VzFIYzQ5ZEpJWnBGajFrb3Q4ZVFPZFRzVXRMck5pK1pQRGsvcWJ5M3UzMUh6?=
 =?utf-8?B?SS9UUXF2UnBkT2hMTXg1TU13djRFVlJPRmRaN05WMnVSdDRZUUVtNVNEQTRG?=
 =?utf-8?B?Z2Fpcmt4c2pZYmZJY1E0ZnVXazUxbFVLMGowSlc5RVdaMFozcy9kTUMvMmlQ?=
 =?utf-8?B?d3A1ejhqWkZoSHVHbzg3N3BxV0tpRFlNUVpvTkxQM2Jyd1doTFIwNzhHV3VW?=
 =?utf-8?B?UU5LMzNLYU1LWWNPWWFST1FXbVNheUU4L2JDS2o5QXNKTzVGQ2oxRmtRanJl?=
 =?utf-8?B?cERvUVVsR2pWa3NyQlIwdS90WEVmeFUyTFpRaGg0U24yTHRWS2MvWExnaU54?=
 =?utf-8?B?YktHbmY4cnhnajJTT1FQSWNuL2xwbXJFRXZNNnNOazU3QndhdklJcjZGdG91?=
 =?utf-8?B?STlQZ1dwWGZvN3lUSVFVQ0dENysyVVVKYUUzQUF1Qlg5YUxyVFhla0xjeWZT?=
 =?utf-8?B?dGxIOW5LZis2K3hka3lXb3VJQnZmOW1mc1JEVUlKWCtuL211L2t3SUVzaEJz?=
 =?utf-8?B?VUpDRzUvNDB0Mk02ZEk4eXY5TjlaMjVLOGwvMDlpVFlnbVBYemRBWVJhTkZt?=
 =?utf-8?B?TzdiUGpvR2I1OEpZdUhqVmZjcWJJc090R0FISXlFWTVWMUZFdDlmOEg4Rmpx?=
 =?utf-8?B?VW5NNUJGWHR5cWp1NDYwcWM2RGFVNmVwbS9ROTdZQTVCbEFFempHTWtJZHJ4?=
 =?utf-8?B?bUR4UG10YTNjOVdLSGF5NGU0by9QQWs2eGFTdmxIeXJoM1c0TDJqU081NkJZ?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5534da96-8e48-4631-2f95-08dd3ee11e03
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 14:44:35.0639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adlm6ZeScIF4KKKSMvCK/cPVqGSsVvJ5rCFlGXbmUQQgzMbgrkva0+EgFrCug3CLEkS6C5nSUyi5n/nQIPmzfjdr6BIDR6kEH0EFrpDFizs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5907
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

Hi Zhanjun

There is a missing newline at drm-tip/drivers/gpu/drm/i915/gt/intel_rps.c:2=
49
Overall, LGTM.

On Thu Jan 23, 2025 at 4:23 PM UTC, Zhanjun Dong wrote:
> The purpose of synchronize_irq is to wait for any pending IRQ handlers fo=
r the
> interrupt to complete, if synchronize_irq called before interrupt disable=
d, an
> tiny timing window created, where no more pending IRQ, but interrupt not
> disabled yet. Meanwhile, if the interrupt event happened in this timing w=
indow,
> an unexpected IRQ handling will be triggered.
>
> Fixed by always disable interrupt ahead of synchronize_irq.
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13454
> Fixes: 26705e20752a ("drm/i915: Support for GuC interrupts")
> Fixes: 54c52a841250 ("drm/i915/guc: Correctly handle GuC interrupts on Ge=
n11")
> Fixes: 2ae096872a2c ("drm/i915/pxp: Implement PXP irq handler")
> Fixes: 3e7abf814193 ("drm/i915: Extract GT render power state management"=
)
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>

Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--
Best regards,
Sebastian

