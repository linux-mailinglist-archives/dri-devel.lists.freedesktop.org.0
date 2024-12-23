Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734049FB7DE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 00:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B16110E043;
	Mon, 23 Dec 2024 23:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGzS39T4";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0630510E043;
 Mon, 23 Dec 2024 23:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734996010; x=1766532010;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=TjdXrVgo9QI1MTVfGigZOfJAbyxjaYYZ5IbL/l7MjZY=;
 b=oGzS39T49FHReHeoKl4+YlZMoj+ceVeCJxUiCXseqqc2a1sDXzydBsIj
 kSUjd5GPjLpxLl+Y2t4PZohlbq3wLiaqNRmCmJ8VaYpQDHiPsEgDm+FRm
 6/1mxbMoWXGd0MWsajcHmtC1+aToXBe+TFV2Xh4yBpNdkhwF0Nx+jRcia
 o0UUnU2fgp1KpLnk4skXLhaPa15QP4QTiUR6aIbAiMYLBgh5U+o7uwGpX
 FNkPMkCzZ8gGFbO+CAb63dLk75JSu5Nxc6wjCdHRTNALKygNVLBX6PBlx
 GnjMdi9PlVvlJhWsV1pJtUeLr3GqIDdfxsON19badxXCBXKHle7+iU5nK A==;
X-CSE-ConnectionGUID: loajCTYlRMG+AF4GYasYIQ==
X-CSE-MsgGUID: zFXeU7JTR4e2D2ejdsroGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="39242542"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; d="scan'208,217";a="39242542"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 15:20:09 -0800
X-CSE-ConnectionGUID: F5LW6LhpTfqQd461pf0VTw==
X-CSE-MsgGUID: Jk59lmu3RiK5W/cgIkIWoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
 d="scan'208,217";a="104313449"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Dec 2024 15:20:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 15:20:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 15:20:09 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 15:20:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgjCqe/xAbWdJENTAOgLMBSkqK+ThVDD7x9ajBJZr/A0LyFevFdEURJBdR9CbHRAOp/5+tQHQ9l7ojx+UUd2cGJ57Kx3rfxHeM8yCGbkyqZ5tmT996J6yi36u33t+pwRIaiSXmA+0TBbX25O7UogwrcGq7w0amRWNrigLy0LwokDtUX5wkvWnFjW7XqxB92AUzLkki/BB8pU2TSimKIKnjYeVVVJXX42M6PPRrfx/BLUhyHF9oFjtWPG37CE6BIJzV6En7TZTh+asKOVKRJtLutbroOVBajni0VCML+MqqOJXiyusB98MemPK7OKYCC9SHB0KbUx3GZSAQrw9bAPjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFWzXHPe1bOjhPcl65JXsrmdo9vbZCXMh6Jo1mHyFbk=;
 b=Jo3hpbs1iGcxk1zYxvNdUbhY1qrBPZmc9HR6FXmKBGUbzXKZbBMLVYKprXMyxF8btLsRGbvxlAn6oueI3AD7jm1ycAfYkXZKnFYNZ4sypEBMDQpzF6b4xrq2jnNbzLeno/El2aAo9flwIP/+IdEODlgbQlGSTZ9TWseTKIsYKPPP/F7USsAC1GDkxNxkJk5C14jJ4EZ8JkQ5wyMvWkIe2EIJZ6xhqUnKiAOnUVuxcQtWJ7oFdpPDf/fEjCVDelbyIoyq61aehp/QJXRuwfvMWazD0Ao/n+WIEyaEPZ1uUDFq0sONhjvX8gLq7G7fEgZnWVIdMGhiw6VyBMJKdCWWdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CO1PR11MB5091.namprd11.prod.outlook.com (2603:10b6:303:6c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Mon, 23 Dec
 2024 23:20:03 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8272.005; Mon, 23 Dec 2024
 23:20:02 +0000
Content-Type: multipart/alternative;
 boundary="------------VmfGto5U6vsAKgaWkC0PS4uy"
Message-ID: <27c27339-cde3-4028-99e5-deb574c091ec@intel.com>
Date: Mon, 23 Dec 2024 15:20:01 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Add debug print about hw config table size
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
CC: <DRI-Devel@Lists.FreeDesktop.Org>
References: <20241221011925.3944625-1-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20241221011925.3944625-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BY5PR20CA0016.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::29) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CO1PR11MB5091:EE_
X-MS-Office365-Filtering-Correlation-Id: 0439cedf-59d7-4aca-5621-08dd23a853b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGlHcFUyWERGVDBzU3VGL2NqdEx2aW9IODNmUVlXVDFrRmxac1F2eC9uV09w?=
 =?utf-8?B?ZFFaVlVXMVBRUGlXemZhS3VMR3c2YTJjRnpoWm5Kc0VKVnpVK290YU84RlN3?=
 =?utf-8?B?OEVZbjhmRThJM3ZHY2VGMEZtVW1ZMEVRNzNXZS9heHozTVI0SXdXRmZhNlBt?=
 =?utf-8?B?YWRXWWx2MG05VTVOTjVmVFZ2bWxSczlQNVZoeEFUSHYwcTJBVzF6dTl1Wmds?=
 =?utf-8?B?cjM5V2kvelFNVDFPcXMyZU4vWURIMlc0bFpoOEQxZU5PYkNhM1hNT2kvbVQ3?=
 =?utf-8?B?R0hwYUllc2piY1BIdnlFV2VhWVgzc1VBa0JOUmNQZjc0djd3MEdsb29EOG5x?=
 =?utf-8?B?TmFKb2V2enRYOGpXL3c5ekxxMmVtaGRESXBNVjFkeUZtc0haODFWbVdGdEQy?=
 =?utf-8?B?RDMxT21kb2xYK3FHV2NXYWplN0dNQ01CeU1raGVwS3NIcFBUWDNIcDAxTW5H?=
 =?utf-8?B?Y3ZMQmZ1MTRqbFpUbTNyWGhNeXBVMVdJVkZOT1lUZFAycGRpU3JrY1VCZHp0?=
 =?utf-8?B?cjhCNVFZdjJ0T2V5WlFUb1ducnpPVkpPWi8rV2NIOTVyUFNycHBDZEN4ayt3?=
 =?utf-8?B?Rkt6SHdMNzhzMTZ0ZjJKeC9sUXBodjY5N1I0aHdjUnZBTzVrdTVYaitGU1Y2?=
 =?utf-8?B?cDVBQUhMN2ZZRmdlOTcrTU5hL2VhNEh5Z0duQzl1K3hUYTJJYXRFaFJiaHdY?=
 =?utf-8?B?T2xzK3ZmdUxqTTdsQ2d1SC9aNE40dUNQcnRJVGFvUFdRdzVzREVkY01NQVNy?=
 =?utf-8?B?RmVKY0dOWWRqVzlQRUUxWm54OVNaVEg0blRQMGtKMlBTTjVDa2pRTkR4ZTlx?=
 =?utf-8?B?ZnZxMVBaclFrUGhCSDdjRzE3b1NLTGJMdTI5eVpKYllKZk5XdUNCcTZya2hQ?=
 =?utf-8?B?cXFTOXNGWXdKbklyaDlGOVYyWnZSOFhnQy9uR3krTDRmbVBQY1dxeUdVcVJC?=
 =?utf-8?B?RHo0YWNpR0hGcFRVZ2Z2VmhZUDNhTkZVcWVSTGZ4by90dktxakcycGdDdld3?=
 =?utf-8?B?alJsaUtYN0JnN3RNa0w4UFRxNXRkcy9McDJuS0dVQU5vL3pyRTkwWGlSTFFC?=
 =?utf-8?B?eTdGVkREcjM4MGVzT2JaSzh1N1BIODdZT3RJT1I1TXFWem1vdHJYVWdENS9G?=
 =?utf-8?B?ZWNuRk04MGZ3bWdveG5ZSnhSQnV2MFRSdnFNc2hMb0loMmtrS3k1b1YwVFFI?=
 =?utf-8?B?a0FYY3ZHUHd3TjRNRTVvTW1PU1JGd2ZHZnd4b3YxUCtXRlVtTFRJYlJmajll?=
 =?utf-8?B?QW01TjhCRlpFN1RNRFNjRkpNcWtFY0pDVWZ6Nm9XcnV5WnFjQTVjTzZSbG50?=
 =?utf-8?B?K1kyTVJnZ2syTGt6Vk9JMHB3dzZXY1paWnFjaFdpYXFKbDdyM2UwaEpZc2Vr?=
 =?utf-8?B?NUo0UG16NzV0a20vYmpubWVnYXZQZStlWE8xR2RieWpZNWg3OW52WFd3Sk9L?=
 =?utf-8?B?dzNNSnNGSnRhTEwzWnlFSUcrZysyU0EwRzJRVEdpR0F3bnNNbW05QlhUNHUr?=
 =?utf-8?B?VU4rREY3ckl6Um4vNEtVYkloMzlFZWdOOFhPc0QzQTVZRHlkREhvQnZSWlZT?=
 =?utf-8?B?RThFcTZkZmFWWENGNTVqTG1IVkJHZzVMbTdMcnF4R0IxYkpuaG00dUhtUHFI?=
 =?utf-8?B?dnZDRWEybU5qM0JVV0xIQmt6cWNiNDB5bFp1L1lKdHNvUFp0N0ZCVjAvQ09j?=
 =?utf-8?B?QW5JbXNYd0xyWHExTmJvZFZNZ1pMQWVPTitPR3IwbldJbmQxcWpsYXFBSjl3?=
 =?utf-8?B?aEhYSzY2WmpqYzFpaGRyYWFPb1Q0QVAwNEV0ZmU4NFhFSzZFb1pDWmVMVGw5?=
 =?utf-8?B?ODdHdmNKQ0pRTDdGdkFXZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGUxbnhCK01SWkhRNnFubVNHTy9SQ3g3VHJ6eE1DV2t4bVpzOU1vWFp4VGhD?=
 =?utf-8?B?cVhLT0NsaXFTSmhKaWROMFp3d2JNT2Nzdksva0x3M3F1WFJtcCs1ZXZTM2Z1?=
 =?utf-8?B?SXhwekxkVjUxNjJBUUlIc2tvWGZ3Z1ZoMEdGR2wrZzgyRVBTdFovbEdnSWlL?=
 =?utf-8?B?R2JGT1BsREpnU1JaVnpid2Nxc0RVdWJ0WUJjazB1bUxzbnpPb2tmUytXYnQ3?=
 =?utf-8?B?Tm40aEVVT3c1c1BiUDh4dlhmSlZyamI1VHUvYlpreTl6ZjBFOGRzMFI3eTA3?=
 =?utf-8?B?RXJnNVQzRE5nUGZBenVBL21uYTVMdkhsS1cyTUg3L0dOUGtkMkEzNDF5VDIz?=
 =?utf-8?B?cTVwZTBGc25WdUVmNi90QktrNEthZjFCQU9Ga1U4YVUwUkhCNnNISWxEZ0tE?=
 =?utf-8?B?b21RN1RwM05HQVVoTjBIRTVUbHovZFhGNUU4OGRlNFRGQ2lnR3FnellJTFhs?=
 =?utf-8?B?cUt3RW9KVmkxY3IxR2RiNzZielkzb0I0QTJOc05PSnRSYVp3emNlK1BFL1gx?=
 =?utf-8?B?SUhpQjdDUDhQU1dHZVg2ZzdvOWZ4QldPVGRvcmJrbnNPckhrU2MvQlVsN1RP?=
 =?utf-8?B?QnZwNTJxOEQvL2lwd1hDeVd3QTl2bEF0TXlsQ2VwVWFEejE5TzcxYmlEc0lM?=
 =?utf-8?B?Z2tqNlRQcEVucHU4OW93RzRSQkR6c05ZbWN5NW9WMWxacVY4dmNFM0VyZ3Yw?=
 =?utf-8?B?MlNPdGpFQVQxdkxzUVNFaTFONDNuVlRaZC81QVlMRzRtYnh2RnpVOTd5N3pM?=
 =?utf-8?B?aWdaYmtUTXUzS2pZYmg0MUtnNmR5c3hFSlZoSUdSTFNRaXJwbGltTjROazhi?=
 =?utf-8?B?Qi93UlJhaHVKZDVWYkZDMmxCTUNMcnY1bUZNQXdlQVlBcm5aUUpHVDlxMUwr?=
 =?utf-8?B?WFlGTWJUUVFGWkxyendlUDJ2ckFKYWk3L3BESGdZY0w0UEJqd3FJb0RtaWho?=
 =?utf-8?B?UlpraHdJRDdwMThXOTBjS0hoS05tV2dWaWc3Yy9uR2RuVytrR3ZrK2ttdWNT?=
 =?utf-8?B?WVBSZVRQSlFzNVRCSThISmxUYUtZblhQV3c4c1VZbmhoVjdKRCtOYWdzcTRn?=
 =?utf-8?B?ZmxDM2hmRWFqV21oNzhGY2pQQUE4dE45YkluMUdyaFpoUVFiNEs1UHBQRHpD?=
 =?utf-8?B?NWE2V2FvSXI4WFJGVlZrS0daYU5uVzZYTkpTUXNpb29yRDVpVnFSYy9xMnFq?=
 =?utf-8?B?ekxQcTEyQWRxSkpHVUhzWUpxcDZ6M1JZUU5zTDhnZUhuMWsvTUpqMDJUMUY0?=
 =?utf-8?B?WmNrSEk5NzdGeUcvbjBvejF4bm9FZjdyK2M5dG1tbXVaanlybjlQbkFiOHBn?=
 =?utf-8?B?K3VYbExLQytOcElmenZOaFV3NE9iVVZnNlU4b1JTVjVPaUhOcytiUmw5Tnpx?=
 =?utf-8?B?d1lzVkUvdEloZUVTNVV0TnR4WDVoODNuN05uT09Ud1YwNEYyaEZubmQxN2Rx?=
 =?utf-8?B?cytvSHhDbEJxenBaenFCd1V0THJHN1BxSHlSUmZ4QjR2MFF6b29NdzVxNkVG?=
 =?utf-8?B?YkRFc1F3WDZQMWduRVlLeVNMREZPOVgvNzVqdTZtTzJFZDJHR2NDblVMcFJ4?=
 =?utf-8?B?OEdGUnVHemZOOEtSNFB0WGhJODFRR2Z4NW9zTllmMFJTNXRYb2E5R09FVHFS?=
 =?utf-8?B?elpxMXVBUU9Vb0FjZ2VyOXRuS2FCeGc0S2tqRXl5RkNrdW00SkZKNXZYRDhG?=
 =?utf-8?B?K1Z4QmZ6enRiSld3cWp4UFo4azU2TTQ0YnUxckIyNkNyWFBYdGNEU093WFM2?=
 =?utf-8?B?eVBYRGU4OHBXWitQNU9rRzN4Y2plMnBpRTJqUWoxcUJGbS9DQys1Yisrajc1?=
 =?utf-8?B?VjRKSWRvVklIRnNDOU5Cd0VaZXd1cUNWeElleG9vSFIvSXoraUxoczNQR1Vn?=
 =?utf-8?B?UGhVaXZtTEt5eWU3eGhEUXpKUHBNRXRuSS9kT1ZWNHY4cUw1dEVRWjZvbkFU?=
 =?utf-8?B?bTl0YzBiN0MxN0xkcW9aSEtaR2NnS08vNWZFeWdoZEE0TzJjeVRKdnVYZ0Rj?=
 =?utf-8?B?T016WDZET1JjK2VQYU9xVndBUnQvRjFjU0ViNVh3eXRsK3kzSUlvLy9zQmJE?=
 =?utf-8?B?QThZVDBONXI2UHczMmdhaFpMc3dhKy8ySnQvQXlZNGpMVGpleGR6L0FFeTF2?=
 =?utf-8?B?amNsQlQ2cmFleXViUHg3MStaY1JYS1h0TDRZL2J6ZUthVHgrWm5pYVgraisy?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0439cedf-59d7-4aca-5621-08dd23a853b9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 23:20:02.4411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6g5sp/rNOTyBEg/gcJDr8HvnHoNb9TdLEdqwQEDHm7kyokmO6JmxrZS88EoflmOfn5E7fS8Q9VF64JzP7EDvSvG1olfDX5D3Z7PHfbZXFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5091
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

--------------VmfGto5U6vsAKgaWkC0PS4uy
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit




On 12/20/2024 5:19 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison<John.C.Harrison@Intel.com>
>
> Add debug info to help investigate a very rare bug:
>    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13385
>
> Signed-off-by: John Harrison<John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> index b67a15f742762..868195c33f5b3 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> @@ -7,6 +7,7 @@
>   #include "gt/intel_hwconfig.h"
>   #include "i915_drv.h"
>   #include "i915_memcpy.h"
> +#include "intel_guc_print.h"
>   
>   /*
>    * GuC has a blob containing hardware configuration information (HWConfig).
> @@ -42,6 +43,8 @@ static int __guc_action_get_hwconfig(struct intel_guc *guc,
>   	};
>   	int ret;
>   
> +	guc_dbg(guc, "Querying HW config table: size = %d, offset = 0x%08X\n",
> +		ggtt_size, ggtt_offset);

This seems to result in a double-log where the first print has no useful 
information, e.g.:

[drm:__guc_action_get_hwconfig [i915]] GT0: GUC: Querying HW config 
table: size = 0, offset = 0x00000000
[drm:__guc_action_get_hwconfig [i915]] GT0: GUC: Querying HW config 
table: size = 752, offset = 0x00D05000

Given that only the second log is useful, IMO better to move the guc_dbg 
to guc_hwconfig_fill_buffer(), because the info needed for the second 
print is available there and it is only called once.

Daniele

>   	ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
>   	if (ret == -ENXIO)
>   		return -ENOENT;

--------------VmfGto5U6vsAKgaWkC0PS4uy
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 12/20/2024 5:19 PM,
      <a class="moz-txt-link-abbreviated" href="mailto:John.C.Harrison@Intel.com">John.C.Harrison@Intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241221011925.3944625-1-John.C.Harrison@Intel.com">
      <pre wrap="" class="moz-quote-pre">From: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>

Add debug info to help investigate a very rare bug:
  <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13385">https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13385</a>

Signed-off-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
index b67a15f742762..868195c33f5b3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
@@ -7,6 +7,7 @@
 #include &quot;gt/intel_hwconfig.h&quot;
 #include &quot;i915_drv.h&quot;
 #include &quot;i915_memcpy.h&quot;
+#include &quot;intel_guc_print.h&quot;
 
 /*
  * GuC has a blob containing hardware configuration information (HWConfig).
@@ -42,6 +43,8 @@ static int __guc_action_get_hwconfig(struct intel_guc *guc,
 	};
 	int ret;
 
+	guc_dbg(guc, &quot;Querying HW config table: size = %d, offset = 0x%08X\n&quot;,
+		ggtt_size, ggtt_offset);</pre>
    </blockquote>
    <br>
    This seems to result in a double-log where the first print has no
    useful information, e.g.:<br>
    <br>
    <div style="font-family: Roboto, Oxygen-Sans, Ubuntu, Cantarell, sans-serif; color: rgb(0, 0, 0); font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: nowrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span id="dmesg-normal420" class="dmesg dmesg-normal" style="font-family: monospace; white-space: pre; overflow-wrap: normal;">[drm:__guc_action_get_hwconfig [i915]] GT0: GUC: Querying HW config table: size = 0, offset = 0x00000000</span></div>
    <div style="font-family: Roboto, Oxygen-Sans, Ubuntu, Cantarell, sans-serif; color: rgb(0, 0, 0); font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: nowrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span id="dmesg-normal421" class="dmesg dmesg-normal" style="font-family: monospace; white-space: pre; overflow-wrap: normal;">[drm:__guc_action_get_hwconfig [i915]] GT0: GUC: Querying HW config table: size = 752, offset = 0x00D05000</span></div>
    <br>
    Given that only the second log is useful, IMO better to move the
    guc_dbg to guc_hwconfig_fill_buffer(), because the info needed for
    the second print is available there and it is only called once.<br>
    <br>
    Daniele<br>
    <br>
    <blockquote type="cite" cite="mid:20241221011925.3944625-1-John.C.Harrison@Intel.com">
      <pre wrap="" class="moz-quote-pre">
 	ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
 	if (ret == -ENXIO)
 		return -ENOENT;
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------VmfGto5U6vsAKgaWkC0PS4uy--
