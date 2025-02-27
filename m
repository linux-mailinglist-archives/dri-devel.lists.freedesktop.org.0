Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50D0A48894
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 20:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD2B10EB66;
	Thu, 27 Feb 2025 19:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZLKKK0U1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83B610EB5C;
 Thu, 27 Feb 2025 19:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740683495; x=1772219495;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=25RSBCidwuG4WPVuaZnYKf2NCErzKZBdXN/EMLqI8qg=;
 b=ZLKKK0U1i14mIpClgevG8O/0vJVRRZsmW7MevtIm/rL6eFDrE1Nrgu76
 +bnoilgv0SQAJFy2lX8qOW6Fcddpaglf6Th2AKRgim3rJFLO7xKLt/ub0
 97ZQ4paBMz6YcWlivBpc84DVrvTpcDniXUvf8QVJ+V4JFl9OJzmTHwKk/
 vwwXE1Sbk0POv8AG9N/Vjomg1FBbMDPj2EupopInTE7o3uNPQGAk1tuKQ
 GBUS1vbdVhNuxHO78tQksGc+1nMVNNzt9bR7ysCgTxTWq0YBGvXqWsMBO
 qud+duUhdMZM5o5t/8XzO4pakOAczbKsPHMv3bEOvHounKLP5595kijeS w==;
X-CSE-ConnectionGUID: uh5WdLEPQ72Et/n2qbCV0g==
X-CSE-MsgGUID: SWT+4dC5RUmWVnpF2twaog==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40837285"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="40837285"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 11:10:46 -0800
X-CSE-ConnectionGUID: N8oEM1swTpeY75rDuzq6Nw==
X-CSE-MsgGUID: E5TJueUMR7uxTF8sBGFJgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="117299084"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 11:10:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Feb 2025 11:10:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 11:10:44 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 11:10:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6y1VDBEbC8V4Yr/pGbsazZQ938FIYpfXqWVz6KUmYEOTK808iA/noihC7TqyYqv22XULlWRTTtIr02RT6t3OCkDd8TCeIe5fwp1K0YNlfKMI95uCii0AnpbB7PmAURDCW9UYDywiN9TUIVIbEO6GGu4t3um+u/8hA/n5WvWufZ+TJGmqR/BsdeZNXwtv8BnkyckMmWREtRtn0MoOL/Ikob0qrrSNxJOSaZmYf8+rGsDTvQGoqhP3xuMvSpdGmSKZ2Luk7xGBVKtu1eSK1p+LJuMUSsAfY/6VnAcFs3rB7jBVt3y9/a4Ewct6i+8HZgtejqWSOrzmj3NgmiabsHSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Syrr4XyStuVgy7hID1hpbeX/gKo/9F7ZhSS9T2wnig=;
 b=BVDHkk16jPAGJ6IL5q7WrTZM1h4CxO47qZEzcCrytmFHmZMOhiJ8pQCyeEDISW97zYgg3m3RF3H74Oi+rvE6qmzz/3E1YUU8fkDEgEZ+wBicffRCkIoXxDLMOo8JsbFZLyZIawxLDWZ2cHzCH6GXmcbcXUIOtrge2tv3sgtYg+eVgGGxX1sSaa7UcyfJJk/fy74DFGHBq5NvgIVUqfi8V4Uxlge1TW6F6bbIksciXPV0zENEL87SJX2uvJFgY5Vjgwa7ANpL8xMq8P0Kgv6a/yxM9+dSPWqLl8u2xIrgQmnUKzyozFo0SJZGX57UpxNUj5u7XVr5GVONClQEHgyyGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 19:10:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 19:10:00 +0000
Date: Thu, 27 Feb 2025 13:09:55 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tamir Duberstein <tamird@gmail.com>
CC: <da.gomez@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>,
 "Masahiro Yamada" <masahiroy@kernel.org>, Justin Stitt
 <justinstitt@google.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <llvm@lists.linux.dev>, Klaus Jensen <k.jensen@samsung.com>, Theodore Ts'o
 <tytso@mit.edu>, <gost.dev@samsung.com>, Barry Song <baohua@kernel.org>,
 Daniel Gomez <da.gomez@samsung.com>
Subject: Re: [PATCH RESEND v3] drm/xe: xe_gen_wa_oob: replace
 program_invocation_short_name
Message-ID: <fzigsonsdbtvo6aorgvzlh4mvbpvikbz6iwh6h5jx53e7zd7m4@munr3ea5nbme>
References: <20250224-macos-build-support-xe-v3-1-d2c9ed3a27cc@samsung.com>
 <be5abg6u6wm62nhak7xrhtlkqxcekael6ztnkatwqxcil44x5y@p6yrbfingm4e>
 <CAJ-ks9=gaxW2191c+K0E0MgjsQWLYoKxJZLxGb6RMbPRVHc4tQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9=gaxW2191c+K0E0MgjsQWLYoKxJZLxGb6RMbPRVHc4tQ@mail.gmail.com>
X-ClientProxiedBy: MW4PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:303:b9::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 2038ae22-5bac-4a5a-0f4d-08dd576254e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eE83eGVwdmMzSVVVWlZiNEc3KzkzOUwrbmRxWEYxeU9BTlZMM2U5LzYxNGx2?=
 =?utf-8?B?YlJiTEFQSGx6d2t3YzJHUEFOKzU5MkdSRUdUTEkyKzFqRFpYL1lQQXpLWVNi?=
 =?utf-8?B?Ymg5V3pPL2pSVkRKUEZPdGRvWjJSVGRvUDRtaVRTMHp3S1Q5azJuU1I0enVx?=
 =?utf-8?B?aTZ2NlM5aWdkS3JTcGFQRzhpZTJrdHZtMzkwVjNUZ2MyWld4TmNGTnByUlhv?=
 =?utf-8?B?dnRvUTdpZ1FkdnJ4bFhTTjNUU1BzVlJVam5PYUpMNGYraXJOQWs5YzEyaUhZ?=
 =?utf-8?B?Vm5iWEltajRqTTdza25wS2dSTTJaclRISEVGaTlqWWQ1eGFLOXFZMkdmb3M2?=
 =?utf-8?B?UklnRnBaZWZOcW5PWjFNRlFvdGlnNzY2UHBCRmhGWTlMdVBLU2xxWEI0a3ZY?=
 =?utf-8?B?U3JrMnZvY0hKSFBsWi9qTjYyQWYrU3hLM3BGK3B0d1YyMGdvYzY3amFVWGpV?=
 =?utf-8?B?dGs0ZkJxUTZwVmwralZDSEdoTnhhNGU5dTBrWVJpNkRZdHY0VTg2VXV5VnQv?=
 =?utf-8?B?M0I5cmFKdi84WWV4N29wTU83WjFUdkJ5TUNwM21EN1U2TFhMY0hFMVkxTWNv?=
 =?utf-8?B?dHJnb3JCSW54TlczQWxGQ0pPOVhIbWpHdWxIRlllcDYwelZmcFV5dzR1Z2xr?=
 =?utf-8?B?UklkOUVUSHdhcnduTy9vRUF6MnRJQXRIUEM0WW8vRjVrWjN5U0hSeGRIT213?=
 =?utf-8?B?TEYwUUNmMGhySXozUDhpM28zY3lhcWFSLy9zalh3Ri9zdTBsN0k3RTE2TW1F?=
 =?utf-8?B?cGtPcnIyVVdzTHJ0cjJWVFJlS0FIUUkwRTU4Y0k0dnJKcElPWVhLNlVjZGlR?=
 =?utf-8?B?Qkt5ZlQxZlY2Q1lwVGpyZGpWaGttck5vNFVMdmRwKy82SmhEZzRKcVZoZzJJ?=
 =?utf-8?B?OGNlUi9RY2NJWGRIV1p2cFlnaU4yMlpURnBwOUhRMTM3OWJIZ1NyRVJ4ZFdu?=
 =?utf-8?B?OUltMm5UVHBNakZEYTRRbFlTLzk1cXlWODV2RFRUaWIvd3FmNVUxWTdoNkVy?=
 =?utf-8?B?b1hCa09QTCszR2RUNWpnZ24zQ3BVWEtWd014UUV4OThma2EvQ3psSGMraVB2?=
 =?utf-8?B?dmZuQjlnUGdURVZmblI2RWdRRXFRUHFEdXNTOWROTFZJcDE5Q0NHWi9OMEI5?=
 =?utf-8?B?SWFINmdIT1dKOEJVUlgwV3dra2tCd015ZHhhL3VMeTM3SXpmbzFDYi9zZW9n?=
 =?utf-8?B?dzVXTkFuZVg4bkM2MW9TM2gvY0JQMTFwZG9QeU9qZUlDZ2ViY21BbVRYbHJT?=
 =?utf-8?B?QmtlNklicUc5eUV1QTU0bEVmN05mSElIckxpZ0pwQnFEZERQUnY3S3lFWmZI?=
 =?utf-8?B?MEZWRis2TDhHOGFOamhJR04zcUxlR3RkVG9QZFd6WWNNNituSGYxaXh3cWMw?=
 =?utf-8?B?YzMvYmd3Rmw0ZTFsNnMzS0RLMTdyZWdsS1VZR0E0UWxBL1dMdzFtM0FEcXIv?=
 =?utf-8?B?dGtEeFRwL0ZwemtDczEzTElzT1hjaFZVK2dNU1ZBNytnbzFMMlowZlh1Y3gz?=
 =?utf-8?B?bGx6TzRpanNMemZKMFFGYnBGUEsvT0d0Yjd5WkRsYzFDdW9xdHRDQ1hudS9S?=
 =?utf-8?B?SDhOa0U0UTdSTU9KTDBDdkpYR2NuOE9CY1pkR2JRaHk3TkltMnh2L2ttbFF6?=
 =?utf-8?B?TlY3Y3VtdThHMkF5ckx0TW93Q0lWbUdJeExUc2JkcWN2ZUxwMHNhZHVQNDVW?=
 =?utf-8?B?OVNUN244Rnc4eURidGVlZVRjVURWaFRNZURKRXRlZ2tFQjA2aFFZb3NIQitB?=
 =?utf-8?B?RWtoV01PbExqbnQrVlRXYTUrc0hTcG5seThkTHZTSG9aN3YwcWVtS0ZUbmVI?=
 =?utf-8?B?Unl1cTd1cHQwcnRFL3dqS0pOUThDUHIwRFRYQmxBcUlNcE9mbDFQbklpYTg0?=
 =?utf-8?Q?8dLFMm1dxyX46?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlZiTXpQVWJGSHkvSndDa1VKdEtnbWd5MjhOeHFmZ3luSmw5VlNPcVFwTFc0?=
 =?utf-8?B?QmplbEEzQlhucitlTHRaTmppNjRIUHlWc2YwWlZudUJVRFlKSHQ1cm05REhx?=
 =?utf-8?B?Z2FBczIwbGVySFQ5MXR4MjVONW5PdHROT2JQT1dzdTRFcXJkaVpPM2RDZkw3?=
 =?utf-8?B?Ulk5T2ZhTW8xeVJzZ0hDem9CaVhtR0lnU3o1eDZqcWNudFhZRVpHYWtFZml4?=
 =?utf-8?B?VnREbXp0bGVHMUNiY0ZaenVSVjR5YnV4YmV4OUtSL0V1NWo0UTRRVXZ3MVZy?=
 =?utf-8?B?bldHdmhhMzVFVDZtMzdkT2gvdWsxTmdzNENtcVVJQ0NmN3lNc2pubm9ZWFQ4?=
 =?utf-8?B?UmlvYzdrSzdiTklSTlE0c0YyQTEyc2VGRFphSWRZTUxLSFpWV1Iwd3RCYllO?=
 =?utf-8?B?VWI4eHo1OFhRQmJ1ajhoa3VqUktJaXZmT1VCcmhXZVFiSE93cW9HODV4dUhW?=
 =?utf-8?B?MEUvbHNqKzVjMjM0SVJpbk5NWWY3cDh1OVB0TU5SSFV0K29WNzhHdmZGVTVZ?=
 =?utf-8?B?YzRTdVNJNFdMSHU0ZUlRK1B1dHNIUTlTY291ZlQ0SVErN0ozc2twNjVCbjVJ?=
 =?utf-8?B?azdMMWIxWGV5bzZuMWpqcW9LcUwyWlNzbWFhTGhMVmowWGlaWGlBRjJ1MXhu?=
 =?utf-8?B?VlYvTDdTczAwdlRyb1NUV1VUeU1wS1BvQ0NMc1lrTnZiVGlHYmhTZ0lyVlBM?=
 =?utf-8?B?VE5vVnJzK0pvVGpLMHZja1RkMkpyVHloaHR3bW1hQkExQU1ibFpKbWlsTWFn?=
 =?utf-8?B?bWtPVHhNbGVWeDVDdElTWEdab0JUak1ScXZ0eE5JSE43Z3pwR05pTzBhZ0s1?=
 =?utf-8?B?cFAvcUEvK21IZEdjWXkrRjQ2NXRBZWFFY0syUUlMaStmekNkRnR2TWNReER0?=
 =?utf-8?B?TXRrbmFPOUUraWo4b2RvSjJzelg3NnFxR3JhWjEyZTdJRmdTQW9ENDdpMHZh?=
 =?utf-8?B?VklzY0NkUWtSOTFieXgxaW4yTE8rbFVicVI3eTE2QXFzUUNGb25TZHZ5MVho?=
 =?utf-8?B?TkM5SkVFeFE5eEdnM2tRbkhQMGZHQU9HT1dicEwxMkE3RW95alJrMzRjU2Ft?=
 =?utf-8?B?K25iSmNLeHZDQTJFNk5yY2Rhamw1dTJrYXU5eGd6bzBTN09KbFkvZ3pMM3pm?=
 =?utf-8?B?eGMxeE9DWGNjam9UU1d5ZUNnNXhHZUJBbkgxVW9ldENKdUxpVUVna3FGSmov?=
 =?utf-8?B?Wno1bkFraWVMczlTcG1qZXlBR3lkcEh1WjkzZjNBSHpoV0VHeHozcHFESkk1?=
 =?utf-8?B?QU9JRTNKaDIxTktCWmwwUXV4U05uK0loRitWWWZrK3dKN1psUTd6VFF2VnBp?=
 =?utf-8?B?TWwwR0pWTXE2b215dlJVMlZzVnJLZExoeGZobDBNTHZmTzFXMEgwR0g1NWFG?=
 =?utf-8?B?bHlnT1JUNjdJb2lQWEVia0ZUeWZ6QmplcXNFSUhtLzZ0bDdRc3l0NjJuWjJh?=
 =?utf-8?B?MTRMYXFUNUNEOURrSkJoaDA1L21sKzJtYUtNQWtEcUFGcUpUVDRTdHVOcmtC?=
 =?utf-8?B?bmJFcjZETTBsU21kYjBONWZJYlZORlRzNFFIVXdITEZ2TWxwd2w1Wm9Ydk1q?=
 =?utf-8?B?c2xMUDE3N0RvVjBUYWZFUS81UWg5cVlaV0xiM0dtVFJaQmNKT3hXcThMZFRU?=
 =?utf-8?B?L245QTJzL0IvaS8wSTlLbU1yS0NHM2dPTlN4MXNFcFlSbHozWm8rUlo3b0dp?=
 =?utf-8?B?SFN4YjJhcVFrNnhUeDI0aktVZUZITzNwRmI2VmxVWWZNUGk3T1ZIMGU4RmhJ?=
 =?utf-8?B?WWNVWWZzTDNDbGtIVDNyQmlQRVQvZnU1ZHR3WUFhK0hDUWI5clBuZmZySEFL?=
 =?utf-8?B?dkJPdHYwY3VIOVNORGxLT0o1eldEME9pZVNYTHBrK1daOEVwYjBRMWFibkVx?=
 =?utf-8?B?NkpyMVVJeTcxQUlHYmZ1NlE2NXdhaE05K3B1OEc1WUo2K0NWMDdHcmUxUjgz?=
 =?utf-8?B?Tk1tYnpITzRYMFhHdUZuY291a3lDc21COW53L2t3bndPeVdkL1o1Z1RsS3N6?=
 =?utf-8?B?bEtTSWM4aWczc1EwN0Q3bnZVM2gxa0ZkcVZqYUdnVDc0ZDlvZFZIUkxKdHFH?=
 =?utf-8?B?YUpDaXRkWTh2MEcvTk0rOWtYZUJnOGdtM214d2FKQ2hVNXlQb2hla0VUaXRv?=
 =?utf-8?B?bVpVTFJBYVJvYWxDbmFDb2hMbEZCREFlQmtNYzJnWnJVeHVpc09NVlJEK29J?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2038ae22-5bac-4a5a-0f4d-08dd576254e3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 19:10:00.1120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iiS6yYjz8f+fKyoItTtBpcF8zAb3QtXIojRTnzkMVJ+W1JSjHBQ6MV/1tgadGP+OOy87pu48VWDTYrWkvZzEA+nGW43v7WwqGftu94MxWvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5782
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

On Thu, Feb 27, 2025 at 08:39:21AM -0500, Tamir Duberstein wrote:
>Hi Lucas, chiming in here since I also care about building on macOS.
>
>On Mon, Feb 24, 2025 at 10:05 AM Lucas De Marchi
><lucas.demarchi@intel.com> wrote:
>>
>> Is this the approach taken for other similar issues you had? Note that
>> argv[0] and program_invocation_short_name are not the same thing. For
>> this particular binary I don't really care and if it's the approach
>> taken in other places, I'm ok using it.
>
>Believe it or not, this is the only place that
>program_invocation_short_name has ever been used in the kernel. There
>have been numerous instances of:
>
>#define _GNU_SOURCE /* for program_invocation_short_name */
>
>but never any actual callers (that I could find in the git history)
>other than this one.
>
>> I was expecting you'd take the acks and merge it all through a single
>> tree since you received push back on the need to build the kernel in
>> macOS.  Is this the only thing missing and you'd want it to go through
>> drm?
>
>I believe the other patches have been applied or dropped. When I last
>tested building allmodconfig this was the only issue I ran into (macOS
>arm64), so I asked Daniel for this resend.

fair enough.  Pushed to drm-xe-next since nobody ever reads the
usage for this helper tool and it doesn't really matter if now it's ugly.

Lucas De Marchi

>
>Cheers.
>Tamir
