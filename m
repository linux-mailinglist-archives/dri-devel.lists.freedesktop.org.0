Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3772EA1A7A5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 17:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC0F10E871;
	Thu, 23 Jan 2025 16:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3USERni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E8710E86C;
 Thu, 23 Jan 2025 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737648873; x=1769184873;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=RWyyiouQSPNoT1tuwhKF7jyf97mwTmG+2ZTigy3PcyU=;
 b=a3USERnihwA/FxIStcAtgrMD8qsdg0J82lAno8yWprPD6Biw8uABh5i+
 mpwJmAtxCyqom+ITBYY90CVdWGDMIsMGtJiDm6G05d5c8SVeCQNw7fivn
 xsx+Rb29VMzSgQKbLF+M8RDt1VAvvD0G8A9Pz9WKN7Y+O7e1K2jGb325r
 bY2ueRDC+drlpioOSLPywdRUhgA9yogUqpjU9JOljUaxAN4qvURCdYKyR
 qqZB3h2wHSAlyNfW6aQNgwXGjnvybw8lmcpM6oPSIqtwl2jqs5GPk+oS1
 UJdqQ6RYUqcZzx0CfVp1NIRZ+eUhTnZeSyHvth+cU+H5zWs90aC280BO6 A==;
X-CSE-ConnectionGUID: 53rwhmhRTcm0zFa6qYsZCA==
X-CSE-MsgGUID: uYT8jV5uTLWh+yrGdQtQeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37363017"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="37363017"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 08:14:33 -0800
X-CSE-ConnectionGUID: JQGvqcvhS1CWDUC/h2fCLQ==
X-CSE-MsgGUID: o/6Ei0VnS5O9rSclZY3cIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108370869"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 08:14:33 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 08:14:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 08:14:32 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 08:14:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOkLZfXTP13Nwq2MxX+NNOxUlWcjG5IMDpDDcFDbvgMWkkDrPITJ5MzTXd+6viwOaSiOp3qr1p4DfyoP76ptgmnfQTKIBfLiiW75fsNJFPBt7WydNIO2AbNpvCwB+9UYxiUqRzFE3x6SrcISiT1ethADh4B+8PzKKWUr2e1IUESO0EVLTdfQ5KC1pQlgEFAwubiRWRobL4l0U7Y1eNRXegsFzX9FJbTA4CWYXDCPBW1218Ty3nxfLE/rHksMNwLtzVmbH3KmyDT+wLCTjYNNDqhnGVVXzBQB9oeuDixmOvtFTZaJHVtCRPSyiopBTI0MEbsGrq9dIl7reT5McXT2og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IR2BYbPskK1f8RQYYyN77EV005EjFb24WVi7qHMuRbQ=;
 b=IqzNNe8jsOCfC88BitiyP27sJAGwcGPMofx+P2BgiWFdXMoWq4Az12t6eT3aC/xiHCt7D3tJgDSYMvcpxZtIv4E1bZveF8BKXXmcmSSgFZdPehHA9urG7t4PD7TBOPafDTN43KofU9b9yF1/7o+PpouOPdRZ2MHmnPmoH/SKJXeGvJCaKaGzekTWaTZkIF7uhfTZJSXgROKmblNHXJAOhlvCP0t5nFh1moWBmVTO4lmWCTGl30bCbUIrkTyhUCJq438ZEpiNFF6yEP4rXubUyrb07NqX2Zxjp0A8QO0ED97DSASpQh6nP0yuRxnomEWWqC/VdjYm6n0OrS3wHkRWXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SN7PR11MB8262.namprd11.prod.outlook.com (2603:10b6:806:26e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Thu, 23 Jan
 2025 16:14:16 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 16:14:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8734h9mujs.fsf@intel.com>
References: <cover.1737644530.git.jani.nikula@intel.com>
 <11497a3e490c001f3a884acb310b4812b643a9a0.1737644530.git.jani.nikula@intel.com>
 <8734h9mujs.fsf@intel.com>
Subject: Re: [PATCH 4/5] drm/print: Include drm_device.h
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-gfx@lists.freedesktop.org>
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
Date: Thu, 23 Jan 2025 13:14:11 -0300
Message-ID: <173764885189.34727.4688059102283695255@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0193.namprd03.prod.outlook.com
 (2603:10b6:303:b8::18) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SN7PR11MB8262:EE_
X-MS-Office365-Filtering-Correlation-Id: 684e5e79-21d7-43bd-b715-08dd3bc8fbe2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|16122699012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjNNTkNJK3BjYVd4VUxEYW1lVldNdWh5OEhvWjlnUnMwelVwNlhWaGszNHZm?=
 =?utf-8?B?UUtPRTBYYzR0aU53VEEwTzRzY3RIQmh3VU4ySFpzMzd1TlZKQ0h1RUtCSlBo?=
 =?utf-8?B?RUlicDVBRTVBNStQU2p4TDJFcUlHY0RHanppRk9EVGw3RUl3OW5XYk9YaDF1?=
 =?utf-8?B?R3BIOVhwUDZ3R2duZDFCM3ZTY0NiSnVRNklrMHo1OWZieGZzMlRhMDRReGNX?=
 =?utf-8?B?Y2o3NCtrb3NSNzN6M0dCUkZmZkZzR2tueWcwTVFEalJ1TkVjVzZvYTdJaEpT?=
 =?utf-8?B?Q2hXZTNJblduMUVUNmFRbUFBNnZ5M1VPc3d0UHJnVUFBVHlwZUhsK2NxMi94?=
 =?utf-8?B?Zmw0aDkwcHdYcUl3bkVuWEpvdE1heXMzOG1NY1h0WTN2dGxTd0VlSXBFZklx?=
 =?utf-8?B?T2NXdHpPVGJXRjVDbDhaOFVXdUtNdytNV29zL0o0a2ZsQmtCWUZRNHdQM3RI?=
 =?utf-8?B?SG9IRm9hdy9QdzNyNXJOUEVqQS85T1NyajJJL2p2d2k0REFLYnZuYWJmVXpQ?=
 =?utf-8?B?UXE0Vy8xTmdLRWFDd2dMdENOSVN1NEE2dHhaTVd3cWNFNDhDK0htVnlRZTV2?=
 =?utf-8?B?THVJZUR3RTAwVGFTNnRPMzlNcHJDRDkwUXBnQXRaNFd5QzVXeTliWHVGbmJZ?=
 =?utf-8?B?cFFsVUtCNCtlRFRzcWlucHRqTjYzdVRzVHpURGcrUVZjalZHaWxFYlJCelRO?=
 =?utf-8?B?Vlo2VXBvNEZYUjI4R2N6cm41VFVsUStYc2pDSFIyMVZKVEQzQTRBbllvaVF6?=
 =?utf-8?B?dS8wMlNWS25oTEV3RDk3YWo4VlBUOURvL3VhTHBnT2lNWHpTWHZPRHJJbHdJ?=
 =?utf-8?B?QlRWWXJXaEZ1Q1VGQXJ6R0FDbUJ3WDZVcUR3Uzh0RERhY0ZDSnI2QzBZVkVa?=
 =?utf-8?B?aXBESUpXNFhrV1U3SC91V21EbzFHZ0I5dzk4Tzd5emNoT1AyYjJ0WFpxQTlN?=
 =?utf-8?B?QmhPeTNYSXRqRDVaZW9aY0FUZFRZNnNucVR4U1hzbXRmdUduMytIRHZ5a3Ax?=
 =?utf-8?B?Zmg3Z093TTgvdTNXTnZWbEhncjZHMkd0Tm05KzQ0WWhwbkJCUEY2QVhYQndL?=
 =?utf-8?B?aGpVbjc5Vk1idm5wK0ZRYm5UMVcxZFQrekh6eWZwSHdCZ1dDYjJPaXprUzBW?=
 =?utf-8?B?UVJlVURyYVQwTzVtVzBCbjBOT2RWK2lBSzZJTlZhTWJPRURkdHlNN3dqUkNG?=
 =?utf-8?B?blNjSXhGR2o3eXZWekRwaXpxUi9hR0xKSGFSK1NRZDhvaE5YVDA1SVQrakNK?=
 =?utf-8?B?ZGdKclRqT1NtWmVZWHBNdERHM21uZkVaUWV1NEUrdHFuVGVHS0tOS0dtb2VG?=
 =?utf-8?B?TjJxZmVnYW5XTUZlcGlDL2d2dmN5ZEZPZDlmNmVKaHdsYnFxc3NQWDNzQ3NJ?=
 =?utf-8?B?Ni9vNzVRenhHdWU3MWVVRWNqMDA2N0svQlJjN1poZWJxcGZGdVlWL2RaZWVp?=
 =?utf-8?B?S1NLSEZFLzJ3YnJTV1FHbVExMmxOTFY5QVpadDFReUVac1luNGJhR2pqMkVH?=
 =?utf-8?B?SC9La3NUYmhvU2VpeG43ZE9nTnUrNU9XVzlZYjdualBqL09qcjh6ZXJNdzF2?=
 =?utf-8?B?TXYzWU44ekUrbjduSlFhWnpsV1o0dzh3TlVhalFrbE94bWVVc280TWxrRmNU?=
 =?utf-8?B?NDZHTWR3Z1I4T2pQUWNxNkQ0QVZZY0VpaHBCYzJGWXFIR0R3RWJIZHVJT2Y1?=
 =?utf-8?B?ZEwxejBiWFk0T2EzSzc1Sjdhc1ZQYk5rS0I4MHN6L3MzdStLcmlYL244Vk5z?=
 =?utf-8?B?bzA0OEVuMkMwZnZqcEFqR3BTUHpMQ0pzMlhUOUw4dkZ3cFVrUTBRMm1VdG9n?=
 =?utf-8?B?YnJVNzNDWVBxL1FyZzFBZGQ0S0V1Ymp3VVNsQkpISUZpMDFZRXJSRUQ5c1RX?=
 =?utf-8?B?WFpGVDQ0WUJNdk00NWZsdHRPVFNtZGFUVXluOTJLYlBvSmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(16122699012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHFiT2ZOVmhjeU94N2JOUkx3VlhxMFpLTExWM0lxcmZOSVN6ektYdjdiTVJm?=
 =?utf-8?B?OXVmSWhoeEZyOWkydStrRG8xSDFaVllRdHdmSDF5QVkrc3RENnlXTDVSM3F6?=
 =?utf-8?B?VGxxYTBqQ0VTR3ZZVGJ6ejZjMG5WNnpGZG9xcmVPYUUwU3FUYi9oWUFWblJY?=
 =?utf-8?B?Q0VObUJRQVdLQUZHTmdUVkllNGlwOGltaXlNS05lbElEVWc5cWt2TzlMWGN6?=
 =?utf-8?B?d1VSVzNOcEQ3ZWEvWnAyM2k0ellaWEpqTHJtbER1Z1Z3eXA0ckFCaGZwNXZ5?=
 =?utf-8?B?V0VNRmlJTHVaeUMrNUVWQ1dKaHRjcE4vY01pbHltdXYrTU1xa3lkU2cvUzZs?=
 =?utf-8?B?bWVGVGR0cTZlQnlkTEo2SnRWRERyYzF6c1VIQlRxVks5UGZlY3R4S2ZidTRM?=
 =?utf-8?B?cGF6THVRSDliRStKTXlDdzBzNkhZOEVoYVA3bDRxYTJocnU1M0NlTEhKWnh2?=
 =?utf-8?B?YmJiVDNsSXMyWVlseGRaWWk2R3pLUmhsajRsVjJOTUdhNUsrbUpGenNiYnhy?=
 =?utf-8?B?bkpnTWIyUmYzNjlhZmdKQkNLNkJJOWZsWG1DQ3VhS282SVdNd3FhUGthNVpj?=
 =?utf-8?B?RElQRmwvNUpBajMxbklVcmh1djFWNnZNVW53dmE5OFJLOUc1NEk5U1Z1Z0Yz?=
 =?utf-8?B?by85dVRTcHR3QlU2MThJYUtGNGZGZlVtY3h6d1JtUXNLeWVGb0NEdkhoeE1l?=
 =?utf-8?B?aHZsclBiUmhiSDd2Qk5wS0ZKejZpVXk1YXZuaE1HSGV3cUUxQU5CRFp1ckNX?=
 =?utf-8?B?aWxTVlR3engrdi9rbklmQ0JPdEcxVitmcFZJc2kyK0VkaWwrRk9MZ3FyK29D?=
 =?utf-8?B?ajl0b0YwQ2FOZjhWYUZ0Q0lBRU0zc0YrOXZQOXF1SHNkOVlTSUQ0aDk2Uk1w?=
 =?utf-8?B?YXVJTmRpK3hpMW1NWnlNYW9CZkpkemMrcCtrNzFuQmFFZVlhVWZ4aUlkcU9r?=
 =?utf-8?B?SDFyNXVXYWgxV2dQUU0wYmQyeTF2Ty82WWR5bXdPd3lDamJXUTdZbElEcS9x?=
 =?utf-8?B?RE5NSTBnZTFFN1VQcDdRZzA0MmFUVHRtOHM4VTdielB6TmNoclpaUnlpdVNX?=
 =?utf-8?B?SEdKSzl4ekRySWJUQW1Fblhya3Vra1Nzd2xNb0UrRXljVjN0ZHV4MjVyYXla?=
 =?utf-8?B?VmZCRnJHMVBSeUdoRHFEMlEwSllSWS9vcmhhOVJ1TG5ub3FiNHZiRUZWTjRD?=
 =?utf-8?B?dTRDOW5LV3NJOFk2NHJqbnBySDhpb0FPbDhZN0Vyci81RG91UGdHVjY4RXFN?=
 =?utf-8?B?MVFmWVR2ZENYblh2elJlKzRGai96R2dWbzhWU0VpQ0g0VjhIaytuWWdyQlA4?=
 =?utf-8?B?bGgzU2Y2KzFpZEEvNjBZMzhWSmdYcFBPUWJEWG54Y3RRMGlTcDV5K0FxNk1N?=
 =?utf-8?B?djlnZ2l0VHJ3TWF1MzBRM3FIeW9DMWYyeDJtUkRYMVlpQVpBaTdUZFpzQjBE?=
 =?utf-8?B?a3BRRjMyU3dFTGZRM09QeDNpNTNpUXZVTHV6RnVBaHVJc2ZVenVqeXl4Yjlo?=
 =?utf-8?B?aU90ek1NSGtOaHdZYmdKSlJvbjJhR2xraEc0TUJ6ZFF6QmhXRkUxUW55MEEw?=
 =?utf-8?B?RWxuMTZhNlVRZjhVRGgwaDY1ZFRqNHR5S2U1eEg0NWtNRzNvbWFUdkZGTTNs?=
 =?utf-8?B?My9jWHFtVW9HM3ZoNzZuNmsrVVBQNWpSaU5YbU83OU16cEliOTllcHZMYjlw?=
 =?utf-8?B?ak4yM1I5UHpDOHFPbG9ucGliTWJzcGdleHhiTklzRVQwOU5jRVNGeHdqRTYr?=
 =?utf-8?B?TmJEL2dGdjhSdno4TGMzdDZSLy8rS1dtNXkzbjQwOUxyRWV6UUJXcmpPcEY2?=
 =?utf-8?B?UkYwaUxUZVZ1eDV0K2dLc25QSkZtMmVVODl4aHdOTnVlOTg0bHNmYmFueGxH?=
 =?utf-8?B?L1I5bThNdUpXclV6NVFTL3hFOEtCeUtDb240ajVUWDJMQzQxL2k0a2tqc3hC?=
 =?utf-8?B?ZVpOWEQ4MkMwZCtRczd0eFVPVk15NHZKOHNVZFRESWxKWVYyVC96SnJvanBz?=
 =?utf-8?B?TVZ0eStHOGFnQWJqQVp3NkFEYnN0WlFZRjJXS0ZzLzFndjNXTHY3MVNwbW5i?=
 =?utf-8?B?cHlFVHF1TFIzZGEyVXZKTTM4Z25iM1Z4VmdnQjl4Szc4U1E4VThLdUEzMHJB?=
 =?utf-8?B?TDBTNFpMQzJQbWJoU1FOeFFHYU9sYzBxVUwyYUJZR1QrUmdUSjFxTTRSUmNE?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 684e5e79-21d7-43bd-b715-08dd3bc8fbe2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 16:14:16.2918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQBWHQ8MXbCqG6uc+vWfWXRdeBls6Irrw4ep4H+SmC7RnbdtUqpZuijuJ7rlUIAigpGzSIpYC8vjeimONiRNMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8262
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

Quoting Jani Nikula (2025-01-23 12:14:31-03:00)
>On Thu, 23 Jan 2025, Jani Nikula <jani.nikula@intel.com> wrote:
>> From: Gustavo Sousa <gustavo.sousa@intel.com>
>>
>> The header drm_print.h uses members of struct drm_device pointers, as
>> such, it should include drm_device.h to let the compiler know the full
>> type definition.
>>
>> Without such include, users of drm_print.h that don't explicitly need
>> drm_device.h would bump into build errors and be forced to include the
>> latter.
>>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
>This posting should have had
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
>but obviously not needed if the original [1] is merged instead.
>
>
>[1] https://lore.kernel.org/r/20250121210935.84357-1-gustavo.sousa@intel.c=
om

Hm. Since that's in the upper drm layer, I thought I was not supposed to
merge it myself.

Am I? In that case, is it okay to merge it via drm-intel-next?

--
Gustavo Sousa

>
>>
>> ---
>>
>> Including here as a dependency. May be merged independently.
>> ---
>>  include/drm/drm_print.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>> index f77fe1531cf8..9732f514566d 100644
>> --- a/include/drm/drm_print.h
>> +++ b/include/drm/drm_print.h
>> @@ -32,6 +32,7 @@
>>  #include <linux/dynamic_debug.h>
>> =20
>>  #include <drm/drm.h>
>> +#include <drm/drm_device.h>
>> =20
>>  struct debugfs_regset32;
>>  struct drm_device;
>
>--=20
>Jani Nikula, Intel
