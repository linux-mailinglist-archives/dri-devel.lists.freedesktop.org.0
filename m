Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C7BABEB18
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 07:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC66210E5D2;
	Wed, 21 May 2025 05:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUe1pM7T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6581C10E5D2;
 Wed, 21 May 2025 05:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747803708; x=1779339708;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=k6d4JUb+vBv1JbypVW05tU1Jh1AkeUe+djCRMqWjwPI=;
 b=lUe1pM7TEcdhSkFxn68hzuObQ7vADpQ6wKy12veqWhxKNSjlLd5XMLBz
 Co666JUw26U+fPEqAdtm4KljJRM95Zz2VLO3ibeYdt1YWkiFVfDqEtZHW
 s1BPDNEheHlG12PTFYUqWQTAiiJoLD3sfsxM121QA/+ZGReT/EajwpmDh
 +HFt+AJSPz05DC8ta6PGr1OOnTCVXP4/cG2ETJ8Tw718ccgcicFjlc1V+
 zPwTZuBKvxS9dTNYRGDNRGqikkqtBUKh2c1/NjeFBGYqrPSlo7tHrZbrX
 Mql2f/fqtnUwkgMmxZuVDFvBI+ZLa4lyUZZ/9tEBatoiMpTfzPQF6fsMh A==;
X-CSE-ConnectionGUID: hooX5f5kRWGuZYfusH5yug==
X-CSE-MsgGUID: Imh3YlTTQ0WHeNn1zsAexg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="59993266"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="59993266"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 22:01:47 -0700
X-CSE-ConnectionGUID: V6sXHcNeRnOPhAWRYCrfdQ==
X-CSE-MsgGUID: Z00S4xrYRSapv//n++Y9Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="139804281"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 22:01:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 22:01:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 22:01:45 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 22:01:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Us+flvLU5JnxZDq8m3ymmC/r7/UAj0LzZr3DKp2F7FwsIAcHbMK/VyKPWJRMxe4pVvUQVM866xKGIkVXSER0noMQW8wb17+Euk3bLenC6f8wdPQkTQTcD4SRWVhiIuLvNya/U0iknQ2g8OSJzkInkRvMep+K95jyahLI0y0HQwVo6po8HNrzJNzqGViT39a4OwFGY+8ZXE3lcF+NE7dmpaafllNHVdHwtdbNsu2qq0bkATrSd3xWWHJNLI4SO9Yui4NOu+K/gRl+2X4CeQWi6zRNL2ndRJvlk9nSuMh/wf/A7qtzcbOSm4FnHmea85Feq0w00LbPGak0IJfUnmg4lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fi50PH9vqaj7hTcVaxZ7j4QRcAmgpZSnn2hvzyYQtYc=;
 b=grHeUDvpOwP4SRtJxczdGj35G9trZ1+xSyGXSRE8PPBARsrSsU+k33yDrSQPrF8bURCQs4DAx5oGe1mcb3eMhEGXe2KQlzyMgmguVdW3KbQFLx6eC2yOUVeJN+YNSJBkw1148/ltdf3aGFQCwlDJsIVdHas+yJLkilqT6PTwHq54MD/I65r0Kl5pr9mNp4/CNf/glP3S7EuBL/ReS4YsmpAj9ld6lShMN19wNTfDCWS7D95sOVpfyX/RroxYxwY5Xbf3bsuGz7jATbjzsrQ32hOLQl9LUwCfhFjtOfw1hzvh/tstamCkgf/WAurV4UCiDsE8EjYdhjMFJ6FG/kTNQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by LV8PR11MB8463.namprd11.prod.outlook.com (2603:10b6:408:1ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 05:01:30 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%3]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 05:01:29 +0000
Message-ID: <3fd9c099-eae0-4f14-89a5-ad463471e3d3@intel.com>
Date: Wed, 21 May 2025 10:31:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] drm/i915/psr: Do not disable Panel Replay in
 case VRR is enabled
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20250520165326.1631330-1-jouni.hogander@intel.com>
 <20250520165326.1631330-13-jouni.hogander@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250520165326.1631330-13-jouni.hogander@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|LV8PR11MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ceb3fee-43ba-477b-cd5b-08dd98248c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1NTR29rR0N3VC93YVc3aGlUQ2FqN2xCaFM1NWFLRVlBZHZIOFNwV2dkZkZT?=
 =?utf-8?B?MFVuZ3AvYWRQaU1RVCtFQVZmQ1lxd0tJRDdIdzArU29BV2txbnlBc0F1WElj?=
 =?utf-8?B?OE8ySnV6clp3OXMyNXZjUE1hNWl6SHRXMlU4cDBPRGt1Qm5MbkdIRTFXSnBr?=
 =?utf-8?B?OHpEcUdPRFRqUENVQ05UVUphTFN2VHI0SzB5dFlNeFJqMmpxSS9rT0N5NERh?=
 =?utf-8?B?dGtlZjRNUWF4VGQ0ZnViZmhxb0lZZWFBTFBtRSs1aExzaFJYbjhTOWZvdUoy?=
 =?utf-8?B?Vm10dTN3Mm9ERmVjbVFySm04SThZdkx2TmpxbTZWOUNZdjlhaW5la2ZSOGZM?=
 =?utf-8?B?bnoza2c5WlpDNStCb0hWZ2FmMTJMWVlyMmpqK090Y2pPcjM2MEdtR1B4VzUy?=
 =?utf-8?B?RmdQLzlYTEhRSUgwa09IZHNzc1JCSjAvQnNHV1A3d1YydjJSK3E3d0FvRHd2?=
 =?utf-8?B?bU5KNitXOHB0UUQ3d2JJT2NqL1lTRjRIRVY4QzNrU2NTMDFLR0N3WlpOaUQy?=
 =?utf-8?B?ZmU0ZzNxUkJkOGJIc1N2UXZUckZ2Tzl0Rk5nWStnajdWTm8vMkhzdDRvZGVM?=
 =?utf-8?B?N1J4Q1A5VDJzRG4wVlpEbG9SZ01RTzI1eUNybmV1bHNNS21vdGtYTE1xTVRl?=
 =?utf-8?B?RGN4eUxPdXNUbjQ4QmxOOWpZMWNTYzFTcFdOaC9HQzcwR2lWbEpMd3BSU3VS?=
 =?utf-8?B?SjlyS2l0MHpNcUZZNHNyUUxvdU1FcysrUW5RdGNhUkJBbmZJcC9sSlRLQVFV?=
 =?utf-8?B?NkcxSlZkalduNGVHM2ZKMGw5dWFGTVZlbldKSWNnYjNyM21xU1hYaG5MTm1n?=
 =?utf-8?B?VUJIanM2SlVQdCtiaWp3R1lFd2x2RjkrS0xBd21KQS9JNFhCd2dnUzgvRXZV?=
 =?utf-8?B?c1RORmdLdWZmRjd4WHRiT2hpVVhzcEhIRWlXWGdqajR2NnhqTnIwQmF6eW5V?=
 =?utf-8?B?WlQxTE1JOTAwdnpreFF3a2FXR0xGMERCcXBtWE9mclNwZ2diYi9STkVBV3pR?=
 =?utf-8?B?Y21oUUFwLzc1T1pCNjQwT0dpVk9KQlFEKzI1ODJlWG1xalM0WjFxaTNySmdu?=
 =?utf-8?B?cXVOcS92T1d2T1h4NDI2Z2NidnZMZEQyS2kyOENOcVNXRUx2WFFzU2xLbXQy?=
 =?utf-8?B?eU05NlUwVXBwL01rOEl1d1JnWFB1M1R3VzRDbnUrdWdjWkUrM0NpdGREVVVJ?=
 =?utf-8?B?SEp0Mk4vTTZxVFc4VGZlSWFrNWkrNFhsdGdQQXA2RHVVN3d5dmpPblJwUnVB?=
 =?utf-8?B?VW51dm1EWnVCQXBRck5ZWWRmM3FFMWJ2a09OL2tIUDdrLzQvbys4V2w0U2pJ?=
 =?utf-8?B?WE14Z0JMd0xrOWpRYi9WTVdDVjRWc25pN21xTU4rK0lqVGhXOENSUCtCYWhS?=
 =?utf-8?B?a2xMNE5JNCtHUFdScUJ4eDJQQ2R2ZVFrTzlkRWNjRU5BMkthWUgrUWZKTFE3?=
 =?utf-8?B?eVB3MDE4UGZjTG03VHJiWEE1UDQ1N2pjemYwdHpsTmUwTGRUY0xHeTJUOVVF?=
 =?utf-8?B?ZHBMamNkK3NTNkV3RnYweW80N2RyR2VLRE9yWk4vL1dlQkNRYXdvTElHV0x4?=
 =?utf-8?B?MlI4aHZ6SnVGZVBhbGdiRUUvaGZNb21mMWpiNVo1eUMvZktlRE1WbFd5Q01C?=
 =?utf-8?B?L0lQTk5icitCZkJ2blRTMVRRRFN4alI0TEFBY3V1M2pZaWJoUkVPWFBkeENU?=
 =?utf-8?B?bWxJdWliRFozc2huK1hNMkNUSTM5cy8waFh5MUtmaHlWQlkwOGdKc1NXR0o5?=
 =?utf-8?B?c3JHejhlby84Yjk3MUxlMFZURUFIYVNTQlJwV2YxTjBUZ0xWcXBYUndmdFhV?=
 =?utf-8?B?L29pak1DUkhXUWhOTGVrUUd6RWQ2cUc2Ym5UM3BSUVlhdU9VQlhORTdudCsw?=
 =?utf-8?B?bTlkZUdQaFIraUdKRGc1YjM1YXpIOG4vbG81R1FVVnRDcHMyVnFNcktlV2U5?=
 =?utf-8?Q?R3jVLNMFlFQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlgxcFdQQ2FsVnVKNjIzai9lalpwYmVHQ0VpcEZoaHVhWUhsQS9nck5PekNn?=
 =?utf-8?B?OEV1eGcvUkdHMWxJZVRQNnZKc1MwSHpVWGxvNElvWFcrcEcrb2syZGdBV3ZK?=
 =?utf-8?B?TkxBRSt3aWtCeHh5cHJFYmNVTDlaRnZhWmFBaDVFZlNXK25GVWloeVYyOUQw?=
 =?utf-8?B?RXpBa05aK0xUVnEvZHFDRWJTUlEyUjlLUEJ4ekRlamtOVHR0dzNKZXg0VlIw?=
 =?utf-8?B?K3dqVG9ja3A4YkcwUlVwUzZ2eWNDZlBlVUhHOHNJZ0IyRUJSZDhPN2ZJS0Rq?=
 =?utf-8?B?M09ndFdnaG0vb2R2ZTNiRXJvYTdtWUVnQ1V4Z3Q0Ujgxd0NLRXdPb203cEo0?=
 =?utf-8?B?OEdMTmZQYTBNUG55cFVtYXdGbjRzRE5ZcmUyWUFuNC9GT1ZvOHJxZVdsTEhw?=
 =?utf-8?B?dEpUbzBicUZxOG12eDB4Q2ZnK2FHTk1yZ0oyR3R4dlM0eUxqZ0p5d3dkV2o5?=
 =?utf-8?B?OEhTbDNUNFcvcGt1amo3dGVISTdhR3F0WVNQSGlYbm1sTFhwQUZGUzdlUHlk?=
 =?utf-8?B?Ri9XWFFvUEJxRndGd2txVDBMeWl6a1lhL09rY3N2SXNVT2luTy9RcjFLY1lC?=
 =?utf-8?B?N05wdXJoSWd0Znk2TTUrTXp0a2IwcmVhTFZRTzNJaVNNcVFmeklHZzRCUmds?=
 =?utf-8?B?aWw0NFdJQnNrVUJkQjNqZXZwSTVVYkROR0xUT1lzbHZoZDBnaTE2ejZrVjNJ?=
 =?utf-8?B?Q3Rzc1ZNRjA2SnliVjd0M3dWNGMzNGxXZmJoRFNLODdOU3RYSzdDcEpveUt5?=
 =?utf-8?B?WTloT0h3QVVycFdQUkhDeTZOK3pleU0rbjNCVHpaOU50QnRreHVabzRSdTRP?=
 =?utf-8?B?SUZoM0ZJQjNyN05nSUtmWjYzNnVIUWw2M0lIT1dZS1dNNkpWelNpaE5zQW5Z?=
 =?utf-8?B?YmJtM0l6QXhkZE9yRkR1amlKK2tRODVvaThiaGthOWlYc0JLZWx2aWJvVUFh?=
 =?utf-8?B?QmpRNTJhaGhhNWpPRzdKWW8rRiswUDRJdkxJOENSWGovTGhFRkI3SDdlOUkr?=
 =?utf-8?B?SWVMWGpmVnRIV1NuZXZmVnlKOXh0TkVjWnVNT1dPU3JoM0VQbzdFUVhCRTIx?=
 =?utf-8?B?SkVjYkp2Zms4K1JFUTQ1N1VaWG1uZWFnUGZKVmNMaDRJTXlDRnhSbGtxRjVw?=
 =?utf-8?B?T1YyUFEyZ3dnSTRKVmNRVXZWOWdzd29oeUN3bzRxdVY4TkNuaUpMd1lYN2hk?=
 =?utf-8?B?dDFzU3lwRElZK0RXSW5leERTV0xnYkswY3IvcE9lZzl2Nlh0VVlpZy9mR3RK?=
 =?utf-8?B?UWJ4Vm1TUlVKbTVKbVNnczI5enhCeE5kOXovWFBNWFhiUjBPcG00dXF5U3hr?=
 =?utf-8?B?TmI2NDBTNDQ3Qktud1hidmRPN2ZGNGRDOURKc0kySXNRQ3JlL3dMc3VueW9D?=
 =?utf-8?B?TEU3UkdycHRPb2hEdm1paERiT0xVYkVOZDMxMzVTWnpzTjFNSkVRTVNtQ2o5?=
 =?utf-8?B?ZHJGNGVOQmp1SXNTMGVKU0E3QWczSzMyRk95RDJBYStlcTBtaEFxZ2FQdGl5?=
 =?utf-8?B?SXBqQ1dDcC9Gc2U4L0ZFeFI5M0JyQUNWNW1XeHVnczJQbmlKYmttRVpna1JK?=
 =?utf-8?B?TWdJMGxoTkVOVUlMbkZCWDhpcGtYNk5jblNZUnVzL05mWjkyc1BwbHh6bFhR?=
 =?utf-8?B?UWdRdWNXMDFIUXlLV1FYcEY1Z0pEU0Z2Q2tCMXJ0dC9KTWlqRHB1aS9XUHBr?=
 =?utf-8?B?Y0RMS3IyeHBqZW1nMzY2N005Z3l0ZVpBbXdGUDdlbU1iaC9SbEdjVHZkY0k0?=
 =?utf-8?B?cXR5c2lCbG1QTUg1cHBpb1Frdy9tcXNaY296M21zQ0M4UUZlVDVqNDgraFNK?=
 =?utf-8?B?UDRCK2FtTDdDblJTNEt1TWFWa29ieTFaKytsM3dmcnh1NHZNTjJ4bFlhVkRY?=
 =?utf-8?B?SEk1U21LdDVOL3NGeVhWK1ltLy9abENOenBqcFBlSXJzQSsyN3BPUHVaN3cv?=
 =?utf-8?B?YVNFVGpjVkJOU3E4TXhJSE5mUWlRdUgxM0VVYWNlaDBwUlBHc3R1UFkxNGdw?=
 =?utf-8?B?aGdoRHc1NEVIem5kamRzSDkzTkx5UEV6ZVBHaHZTTFBsV3BsdVphc0I4d2RJ?=
 =?utf-8?B?ZVdVN3czZ3hBTmNlUHNNUWVIMTMzb0NaeTBRWkY0d2c2c2dXbC9lbXhJNjg0?=
 =?utf-8?B?TlVlM2Flczh1YWxPRThiK3llMXFOMG1YSmNCVUtpQjh1ZE1aeGF0QUtSbUVj?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ceb3fee-43ba-477b-cd5b-08dd98248c31
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 05:01:29.9257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/qkegYvf+cTV2Yvn28w3Z9/6o97AAizkKnIZvyukUbww6QP9vuzZeCSg6eDpV/OrTc0exW7r6E4L58ePf+D3uDVulvZ3Anx4hL3J6FTSKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8463
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


On 5/20/2025 10:23 PM, Jouni Högander wrote:
> This patch is allowing Panel Replay with VRR. All VRR modes are supposed to


I think you missed to remove `patch` from the commit message.


Regards,

Ankit

> work with Panel Replay.
>
> Bspec: 68920, 68925
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_psr.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index 38535e0d2496..db7111374293 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -1579,6 +1579,12 @@ static bool _psr_compute_config(struct intel_dp *intel_dp,
>   	if (!CAN_PSR(intel_dp))
>   		return false;
>   
> +	/*
> +	 * Currently PSR doesn't work reliably with VRR enabled.
> +	 */
> +	if (crtc_state->vrr.enable)
> +		return false;
> +
>   	entry_setup_frames = intel_psr_entry_setup_frames(intel_dp, adjusted_mode);
>   
>   	if (entry_setup_frames >= 0) {
> @@ -1696,12 +1702,6 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
>   		return;
>   	}
>   
> -	/*
> -	 * Currently PSR/PR doesn't work reliably with VRR enabled.
> -	 */
> -	if (crtc_state->vrr.enable)
> -		return;
> -
>   	crtc_state->has_panel_replay = _panel_replay_compute_config(intel_dp,
>   								    crtc_state,
>   								    conn_state);
