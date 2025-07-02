Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B50AF6673
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 01:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BC510E0A3;
	Wed,  2 Jul 2025 23:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A9wlYomW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D5210E0A3;
 Wed,  2 Jul 2025 23:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751500563; x=1783036563;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OUi/FTa7fqDlVR9Qv17Ef0hyHcLfisGWHUtZI8vUyDw=;
 b=A9wlYomWyBWiYOvabq2cKS17Snv/rLAfgjwOM+3Ui6T5RYGLQxdUuRVG
 spIRYLKHupOFnnkc20ndcojpQx+8P1F/BuY0ajjCldj/AK//rhBQUoVCP
 Y9Y/fCr/1urJ1FsOHMdHxLWiwMlqUoaeRh/ZE441hTpOef39637WaGOp4
 uT8BmEr0crxyjRJPxLkyjYIseSZudrz3o7a+yZzTTZGWdtVUImf8FmydR
 7QBwNYjqXP5RnXmQySDxjPuhpn9jAaimWaSpzOi3bFugxP/Aai3THYEBt
 ybHUzs4iCRC8t2iV7GcGKx4ZtWQEFnY0cQMuKg442OwIgUT7IFuJvaBGs w==;
X-CSE-ConnectionGUID: xJSOF3RsRzyD8M60mzLepA==
X-CSE-MsgGUID: pih2iMZTT3O8Sb1koQVmIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57490744"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="57490744"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:56:03 -0700
X-CSE-ConnectionGUID: ir+gwd5bQCynbgzQhP8Pjg==
X-CSE-MsgGUID: 2HhngbO9RfWdd6W21tel1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="185153310"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:56:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 16:56:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 16:56:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.75)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 16:56:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9AkouFaNYKKnwgXscPC7B6+GB1LooNZ9TZeCJ3+HwYTacvADkz/+v+ZkxbNrICbWNyC9dC0seDJ5kfgMny/HLXjjgV6MExlg4nyMGvRgmx2f5N345DZVYnBnmMSVeP11VYUUVoq+9ISXhO7VAhAKxbSSIL9SgjWXyxjw7H2WUAbIY0ioiMimk5PRKDS0ESTIiuJ0qasBNlGBwPNy8vELf5da7LxkvIDiK4glOFumb1CQ93oXcHTgIJWB/uVC041/x2mr7G59FlkFhASweYA3Z6C/Uwi4jBvhbHjGs2/r0Exb1IdHTuhcCLynkdhmajqx9liAVSinmkgSaFqBlz9vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJHAqCJ8RhZmZbxoTWqxv6ojwu/IjzG6JhCNB6MpkDk=;
 b=JLFrFcpG5QSWOKXODoBhGVbLT0RfgqhF9SmOdRwpLnpKc6dgJ0eYpRuAjVflhY629V6ak741O8YnKKwHWF6eI4aWQe4IVlsx48ViNn2ITbD1WZmPsBubg85zTf9X9j1gl0/sNp34v5SBgojMmLb2Yut4Axb+0rms36/lXRE2nDH8/6TWTO7BHHjYAw5UXnvbpkkIsfg02pzcwnpzUyUSBGIIrHBvqUs8HLdO+0w4jvJDceoJXIEn1gFAAU325Sw9QzAbxoXNn8/W5xX1+Es0Q0YFs9rMzDQncgIemO8pw8R/1JsugLW9MRNIohJTVRRGLbfLj0MkuKo5sZGxIa8+cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS0PR11MB8050.namprd11.prod.outlook.com (2603:10b6:8:117::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 23:56:00 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8857.025; Wed, 2 Jul 2025
 23:55:59 +0000
Message-ID: <73a03548-fa7c-41b0-9f61-0b3264ee0533@intel.com>
Date: Wed, 2 Jul 2025 16:55:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] drm/xe/xe_late_bind_fw: Initialize late binding
 firmware
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>
References: <20250702165216.557074-1-badal.nilawar@intel.com>
 <20250702165216.557074-5-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250702165216.557074-5-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::12) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS0PR11MB8050:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d52d67-74e1-4557-5c92-08ddb9c3fe97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2diR0Z1Y05GMVo0Zk5SZkRSUjhVNGxwSEE5WXVDYkhFMGdhOEJNMmlpRVBv?=
 =?utf-8?B?VWs3dHhIWGR1N2xwU0dGSit4YWdwajI2eTZpVkxKUmhGSVh0dno2NEQzYlRT?=
 =?utf-8?B?bm5uVFVCZGFsb1U0MUdGTWJpck1CSTI2Q3J1OWV6L0RaY2h5T1pyKzdEYjcx?=
 =?utf-8?B?U0lKUHdSa0VGS0lyZDhsM2lwTVB1Z3NNRFhUMEgrSTN4N1dNcWNlbFQ0L0ZH?=
 =?utf-8?B?RHNjY3FKY1VlNkh1eTFuSzJKcklSSFdMTGU2STFHZjhkTEVwa05QU0g1dTVO?=
 =?utf-8?B?MkluOHNCTmxuek9KZmNyaFN5akVwaDJxcXJSLzM2Znk3QWNSbFBZVlRVMW8y?=
 =?utf-8?B?Zmx6Vk05dDVLTUxpYU1ibnoxYUlpcmR6WSsrU3FyRC8wN1VGajBvZGFlUW5E?=
 =?utf-8?B?OFlFNHVnb25kR0pGRUNnZ1lObG41Z2JaWFY3UmZpTlJZSWV1YURrQ3dHeTla?=
 =?utf-8?B?bWY4NktGUXZqUkN2SlpLS01jTnZsVjhqK0pFa0ZVZXVJTy82K1dGNyt1SW94?=
 =?utf-8?B?NnNTWXNqY2NTNjBvU1poL2VxTTI5Q0dnUzZFTHdUMCtYUTJQcVJtSVlPK25q?=
 =?utf-8?B?MFpKb1FIeG84RUlUbUI1WVJsdFJBUVVTZUk0WTZJUDdaSnFyREptM0ZpZEN3?=
 =?utf-8?B?QnpSalp1RmJGQU9OblpTQ1ZCR1hSVzUzRjI4cEFYbXp2MFJvTGo4Vm1aMVZr?=
 =?utf-8?B?djkrc2pFLzF0Rm9uYXBsb1N0L21NajIvaU13T0hKS2o1dVlpbHJXb0tzOFpp?=
 =?utf-8?B?UUVSUTlMMUsvcTdSSTI2WHRMMGZpeTBCcENIMWxrc3VDdW9lTXRZWTVnSXpK?=
 =?utf-8?B?Q1ZvMHhWUVl4MW0zNDgyYzdjMklseEl1SDJDWmptcjQrWkJZVkNQLzdzVWdI?=
 =?utf-8?B?M3E3RmlDOVlneDYrWlJkdHpvc0s4RFA5Ri9pcmphZFhFL3pNNkxkUCtMa2pB?=
 =?utf-8?B?QTF4ODNHb2xGUFJ2YnhCdnZ5N0VsbDM5cTV4NG5hYm1CRUFjQlNUeVU1a1Fp?=
 =?utf-8?B?eHdGVzVqRzFacGtlVkJiRHFieFNQODUyUXlTazZlMWRUU3hXbkZad3hlUXA2?=
 =?utf-8?B?TGZUNHMyRkpkMk5vdjVGdWVkb0ZFTmg5SGxSSUVPQ1BIbmRMNDBQLzVVeGlJ?=
 =?utf-8?B?c3JyUm5tdWJ1UjVVaE02RklEbW5acDBLZExuOWdwTCszdWI0MExBQ09sUXNs?=
 =?utf-8?B?Q1FoM09VVzNrVEdaekRoSzdXTkZSdklpd3ZxYW0yQzF3cUdJUTQ3VjVRQ0M0?=
 =?utf-8?B?UjFLaW9FS1ZsQVFPODE2UXhUWllqeUk2TGFSMTljclVhMy9hcmdUTXRDenF0?=
 =?utf-8?B?VnJFa3RqeEJhVnROTEV1Vk5yTmRxeXJGUk1ZR0N6NWVPMkFuelI5eEp4TGc0?=
 =?utf-8?B?MlM0Z3JjVlJiM0VZVjRxNUJUQ0N2ZUNHZ1Q2U3VPeGVic09qUFdxZk1MVlBD?=
 =?utf-8?B?d3NGT2o0ZUNodVZlU1BlZW1TQXhQUnZYdFZWdzVrb0RlaHZjYklwZGhJSTNw?=
 =?utf-8?B?UW9QSjZEWTZVWWowMFd3U2k3OFBkYWo4K2IxYkpGWUFZajZBYjY3YnBtdW1P?=
 =?utf-8?B?TWxCaEw5eXF1amRxUWx5YmNlYmRKYlVzeVp6dXRlSVN2YUxzUEREQ21GSmJU?=
 =?utf-8?B?YmpIanhnM2RPelMzejNVQXVKb1I4bVVnUzlEd0JySkt2bThmU2VPSEJOMGty?=
 =?utf-8?B?bkVkMllRd1NpVnh2Y0VhR2N3QzcwWHBrcjUrVGdkdXlVbHlDWU5VcFEyZlF4?=
 =?utf-8?B?bWNDMElWeFRKWjEzZXBaSnBERlVtNmVIeUVOa3k5a0Y4b0tmcTl5RmkvVHlw?=
 =?utf-8?B?VWF0YXlYN25NUm5hUGpiR0ZEMXpYK1NqMzRMcjFlVEpFZUVmZjNLVU9RUTFM?=
 =?utf-8?B?ZTN3ODdWb3NZZ3RYTGN5T1FxQTlSUEkrQWh1eUgwV2g4dkdLK2cwMWcwdzJG?=
 =?utf-8?Q?UdInFkKq0Uc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1pkR21XQ3hHd2NLQmRYMmlFcHd4bkdkTC9ZL2psUWM5Q20zUktoaEUvUFI4?=
 =?utf-8?B?RUk1bXRaanNuQTh1YzMvNmhpZFNpanh3MmRtbDlzODRUNGRtWEU1WUhna3Y5?=
 =?utf-8?B?aDAvYjA3YlhJVVQ0WnFla0hSUHNUV1luVlk3ZGRucEtLK1lCbHlSSHNjalFk?=
 =?utf-8?B?R1hmenZXSXYvdDk0UzRtdVZKS1V1MGw3SFU1dEpWSHRHaWRONDJROGNtZzg1?=
 =?utf-8?B?MkMyZ09UTkthZFZKS2tUb2xuQStYYm1ZckE2ZGdNSHFsemtIR0RQTVE2bFVx?=
 =?utf-8?B?VVoybTFRZjNocXRQMUV4aHo5TGY0a21vSmdwWUlhcVEwWWpydWdrUHV0OGls?=
 =?utf-8?B?akdhczdUY3Q0ODhOaTVFREkrQ3NsdTBkUUVPKzJrcVdEZ2RmY0NZM24wUDdE?=
 =?utf-8?B?ZVpFam5kNjRDK201NXNzZnlCbTlpUkwvS0t5QWlHOEJQZFVOdFVqajJxREw1?=
 =?utf-8?B?S2ltR2trTUxwMnN0TVhrRzVGdjFZY01vUmt4aGU1WnkxUGxMbUJnQkJQSDJu?=
 =?utf-8?B?L1M4QzlLMFRnWWt5bzM2UEFsSFRoQ3dCNlZtT3pPeDJtMW9oZEdqSU1IbW5E?=
 =?utf-8?B?dzU0bzlNcFJBdVdPQXQ5WVhYeGxhY2tid3lBY1VSNDVObVhsN2h0OVNCcm9v?=
 =?utf-8?B?cWp2Mi9EWGg1VERyRUp1c0pjakk3VTk3bWszMUpQZ29URGpTb0EvODJGWmFv?=
 =?utf-8?B?cjVaYnFRVEkrTHVsRGZUM25QNlo0Q1lla0hzL0tnRVpMQ09jYXcvY1ZSZ3Ra?=
 =?utf-8?B?Um8rZXY0M0ZkbGwweHVUL1V6QStwQlZrWHY1T1QzZUJRSlAvak81VUpZTUxH?=
 =?utf-8?B?RjNsYUhiZzhVa1ZWOGx6TVhYaWhVVzNhcm9CbUdWT2t1V3Y2ZlJocEc1YjRN?=
 =?utf-8?B?T05jTmgyYTBzb3BhYlRUR1NEUWtzcUp3VnlWRktMSFY1TktWNlFZS2xzSkd1?=
 =?utf-8?B?ek83d3NhR3o3M2xSV3BQZDFSbnMvc3dURkRadHJNRWxKN3c2Mk1hNTRkYXln?=
 =?utf-8?B?M3FXdlB4MVVlczZ2SnUzeUhkWGtuNmQ4T09leUowV2gyT3VJdDZieEZEdGp4?=
 =?utf-8?B?aEdQYjVvTHk3WGpEWEcxaEs2OXJNWUZkK3pZdTVrTmJtNVpBS3VLMHdmZUE0?=
 =?utf-8?B?bE9zOXFVLzRWMHFXaTBPU3B1YU1IS1QwMEVuL3dwNk55MnY1T2h5T2hiN2k0?=
 =?utf-8?B?eTArYWxiaDNCRGVQbTF5YzgzODJoaXZiU1NIQmpXM0UzTmFpdzR3ZkZsYzll?=
 =?utf-8?B?ejVRbEtiUlZsR01lbi9DWDZmMTl3TWVtNStCdmtiK05JZ0RwRmZlZzFRUE0x?=
 =?utf-8?B?cUc4eFd6dENnemZEd3Z4QlVvSVhZaWRUdnRNam5LOHlYSXRDQ0JHcHJJZitZ?=
 =?utf-8?B?VFhReU1jRlBvejhjdC9RMXgvM3drYjI4U0dpSnpPQTdaemIzL3NzM3pURkpW?=
 =?utf-8?B?MXpJK3Bvai9ncERNZllMYjl2WWxOYTJUcmhMeWYvWkRpakpkSzNQMDZwVWZP?=
 =?utf-8?B?QXZ3djN1WGRndG5nbkd3VTRhdnFRcTJ4RTh2R21ZNEN2MDhHNGROYW4rRXNV?=
 =?utf-8?B?UWFscGZqdEF1bmQ4VHg4WHRCVkpSMk1sRlN1bkgxeW5xbDFtTjhJcnZyaWpL?=
 =?utf-8?B?U3RzeDErb2dDQUZtTnhCWDVSSnFqc3czU05kRnR3K3kycllzVUtCQi82U0pw?=
 =?utf-8?B?REFQOUF2RFlLbkV1SC9OZ0kvVFU2a1hqenRhZWRkbWVFaFJBV29QaWd1Wm5X?=
 =?utf-8?B?bVBEc3lYOEhyaEN6WHhFY0pJR1BnVzUxWEJhbTNPYWd4cE1RKzB0c1NZZHpW?=
 =?utf-8?B?WXhIOUhpN1lidGQzN01lKzRIeVFWMUNqOFU4UjNQU2xaYnNKUHhBUTA5bEFr?=
 =?utf-8?B?ZUJmclQ2MlRUd3NtREY1Z0didGlIVWZqTG1sbExTbzlxblRKTFZaV1hJTkZ0?=
 =?utf-8?B?YjdXTzdJZm12RDNJbFpYb2FLT2dqVFU4VVQwbFJQa1czNVJZOVZpQUx2ZnV5?=
 =?utf-8?B?V3cwczcrR3JRZEw3ZEpDK2RrT0tWUmVBU1pQb2NKRFpzS09vem12dU94Q3Mw?=
 =?utf-8?B?Q2hycU1CRDc0VzU3dW92dUg0MDhUUGRvb3JZSHJOaFlGeHdHTDkvM3JmWmMw?=
 =?utf-8?B?Vi9rMzMwNWhUREM3M2lsSUpXUEZzSXljaHlrNFpWME1ET00xOTRKc3crdDMw?=
 =?utf-8?Q?bkVgq887cacouyRC3ThqLgc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d52d67-74e1-4557-5c92-08ddb9c3fe97
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 23:55:59.8954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tvsiwjabqy91G3sWJaxlypY9QYmI0pMOJNLTRFZAX6DAGsTCvqWj6Ww0x7d1YcCEUNhOAhUs1OuTJtebXbpTvDADFp6ROmAVDCk9bRhW5mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8050
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



On 7/2/2025 9:52 AM, Badal Nilawar wrote:
> Search for late binding firmware binaries and populate the meta data of
> firmware structures.
>
> v2 (Daniele):
>   - drm_err if firmware size is more than max pay load size
>   - s/request_firmware/firmware_request_nowarn/ as firmware will
>     not be available for all possible cards
> v3 (Daniele):
>   - init firmware from within xe_late_bind_init, propagate error
>   - switch late_bind_fw to array to handle multiple firmware types
> v4 (Daniele):
>   - Alloc payload dynamically, fix nits
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 100 ++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  30 +++++++
>   2 files changed, 129 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 22e79f0dbbdf..ca2370af3c27 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/component.h>
>   #include <linux/delay.h>
> +#include <linux/firmware.h>
>   
>   #include <drm/drm_managed.h>
>   #include <drm/intel/i915_component.h>
> @@ -13,6 +14,16 @@
>   
>   #include "xe_device.h"
>   #include "xe_late_bind_fw.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
> +
> +static const u32 fw_id_to_type[] = {
> +		[XE_LB_FW_FAN_CONTROL] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
> +	};
> +
> +static const char * const fw_id_to_name[] = {
> +		[XE_LB_FW_FAN_CONTROL] = "fan_control",
> +	};
>   
>   static struct xe_device *
>   late_bind_to_xe(struct xe_late_bind *late_bind)
> @@ -20,6 +31,89 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
>   	return container_of(late_bind, struct xe_device, late_bind);
>   }
>   
> +static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	u32 uval;
> +
> +	if (!xe_pcode_read(root_tile,
> +			   PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), &uval, NULL))
> +		return uval;
> +	else
> +		return 0;
> +}
> +
> +static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct xe_late_bind_fw *lb_fw;
> +	const struct firmware *fw;
> +	u32 num_fans;
> +	int ret;
> +
> +	if (fw_id >= XE_LB_FW_MAX_ID)
> +		return -EINVAL;
> +
> +	lb_fw = &late_bind->late_bind_fw[fw_id];
> +
> +	lb_fw->id = fw_id;
> +	lb_fw->type = fw_id_to_type[lb_fw->id];
> +	lb_fw->flags &= ~CSC_LATE_BINDING_FLAGS_IS_PERSISTENT;
> +
> +	if (lb_fw->type == CSC_LATE_BINDING_TYPE_FAN_CONTROL) {
> +		num_fans = xe_late_bind_fw_num_fans(late_bind);
> +		drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
> +		if (!num_fans)
> +			return 0;
> +	}
> +
> +	snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
> +		 fw_id_to_name[lb_fw->id], pdev->device,
> +		 pdev->subsystem_vendor, pdev->subsystem_device);
> +
> +	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
> +	ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
> +	if (ret) {
> +		drm_dbg(&xe->drm, "%s late binding fw not available for current device",
> +			fw_id_to_name[lb_fw->id]);
> +		return 0;
> +	}
> +
> +	if (fw->size > MAX_PAYLOAD_SIZE) {
> +		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
> +			lb_fw->blob_path, fw->size, MAX_PAYLOAD_SIZE);
> +		release_firmware(fw);
> +		return -ENODATA;
> +	}
> +
> +	lb_fw->payload_size = fw->size;
> +	lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, GFP_KERNEL);
> +	if (!lb_fw->payload) {
> +		release_firmware(fw);
> +		return -ENOMEM;
> +	}
> +
> +	memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
> +	release_firmware(fw);
> +
> +	return 0;
> +}
> +
> +static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
> +{
> +	int ret;
> +	int fw_id;
> +
> +	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
> +		ret = __xe_late_bind_fw_init(late_bind, fw_id);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
>   static int xe_late_bind_component_bind(struct device *xe_kdev,
>   				       struct device *mei_kdev, void *data)
>   {
> @@ -79,5 +173,9 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
>   		return err;
>   	}
>   
> -	return devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
> +	err = devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
> +	if (err)
> +		return err;
> +
> +	return xe_late_bind_fw_init(late_bind);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index 9806d17291ad..7d5dcb28b784 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -10,6 +10,34 @@
>   #include <linux/mutex.h>
>   #include <linux/types.h>
>   
> +#define MAX_PAYLOAD_SIZE SZ_4K

Sorry I didn't realize it earlier, but this is in a header so it needs a 
prefix to avoid clashes, something like XE_LB_MAX_PAYLOAD_SIZE. I'm ok 
if you fix that when merging. With that:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +
> +/**
> + * xe_late_bind_fw_id - enum to determine late binding fw index
> + */
> +enum xe_late_bind_fw_id {
> +	XE_LB_FW_FAN_CONTROL = 0,
> +	XE_LB_FW_MAX_ID
> +};
> +
> +/**
> + * struct xe_late_bind_fw
> + */
> +struct xe_late_bind_fw {
> +	/** @late_bind_fw.id: firmware index */
> +	u32 id;
> +	/** @late_bind_fw.blob_path: firmware binary path */
> +	char blob_path[PATH_MAX];
> +	/** @late_bind_fw.type: firmware type */
> +	u32  type;
> +	/** @late_bind_fw.flags: firmware flags */
> +	u32  flags;
> +	/** @late_bind_fw.payload: to store the late binding blob */
> +	const u8  *payload;
> +	/** @late_bind_fw.payload_size: late binding blob payload_size */
> +	size_t payload_size;
> +};
> +
>   /**
>    * struct xe_late_bind_component - Late Binding services component
>    * @mei_dev: device that provide Late Binding service.
> @@ -30,6 +58,8 @@ struct xe_late_bind_component {
>   struct xe_late_bind {
>   	/** @late_bind.component: struct for communication with mei component */
>   	struct xe_late_bind_component component;
> +	/** @late_bind.late_bind_fw: late binding firmware array */
> +	struct xe_late_bind_fw late_bind_fw[XE_LB_FW_MAX_ID];
>   };
>   
>   #endif

