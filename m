Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E4BB52B8B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 10:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBBA10EA46;
	Thu, 11 Sep 2025 08:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="biY37AuB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431E810EA30;
 Thu, 11 Sep 2025 08:24:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuUlFP+FZxS3IpLbUfgczvi8oOEzAbLyyl9MBRng78w79hdvazw8yo4t3r5HDzozMUyDqpH/aD77BS1X7k4c4JH0K6qMecZXFJNEnOwH/MrgUKYRGiYwcBygBk4IgfshWBahm6O+CnTmFHv+uScfrVxoBeK85U8PXPedlamg1IwXRcRK2PxzZVudu7WHNgX3isUtnfExM/9wwWPrUBAEsMXgGhCO8xwgOoI6dp/UbK96HkWgRsXAy7FDuZhAYF0XzrutDk14yOeBQOGDOcy2Bp8bMG97zYF+sOK0uXFzOIedtSctwYEh3BK+sBjZPkRZsL+ADZCmaApweuNrcpp+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zieBl4lTqu1FkHdos+xVBDpXzoHE8cHE24msHhxr7Y=;
 b=U8fTcxD+ggLTwbzvCOwB6j5ZK0VcnfBAv0sCfs2PHMbYhkRRqxhmDf3XFa++DLOmUoS8TsldHmeyew47Wchae9muZhb4LXnwK5uuSA9nvIyjorJPeNjFlckTcRo9Y4zA9q4wiiiMhIuw98TLQqHkptcbuYSIoPKNajLAGD8NTwJf1SfZv6n6oc8ySLuZxOD0VbnRBgotsf7pO/RuKYeQnnG7fdShgI/p1l7DGvZ/XIy70YhRlEvUuZobvB06r5KMCXe3d/6SyfkZQqNoZ4m/xQ0K3kvUwZEsl8/ZtkvD7RAET3ff7fT7JVnIRZWmj/uTUD1VRckLL5JmjVWDnJJrcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zieBl4lTqu1FkHdos+xVBDpXzoHE8cHE24msHhxr7Y=;
 b=biY37AuBQHw0oftcH25IAA+mRTDA4NZUZGc4zeuTtC1W0Yg/p89ICZW7DIZc3XsOGSaJzHItJ7/vSXDOMSWiIrTfHIn2UpA9YopFLX+vbp4VMSVz3KMNaLHUMWajkTRahKNgWqwzbrkrhSc4wWc34rEwIGUAS+CTLCPgEFckXeY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH0PR12MB8507.namprd12.prod.outlook.com (2603:10b6:610:189::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 08:24:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 08:24:38 +0000
Message-ID: <97f8d4a7-6897-4fe5-878c-c04a887cce62@amd.com>
Date: Thu, 11 Sep 2025 10:24:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] PCI: Improve Resizable BAR functions kernel doc
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
References: <20250911075605.5277-1-ilpo.jarvinen@linux.intel.com>
 <20250911075605.5277-5-ilpo.jarvinen@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250911075605.5277-5-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0291.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH0PR12MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: 49d10d47-4202-4d1a-2bdd-08ddf10ca5ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXBuT0NTN0RHZUc0OTZFZXJITnNXcXZsWDlXYTYzNENZYlVqN3dUeWQ3Rzl2?=
 =?utf-8?B?eTl6ck1iQkxiSlFudld5bkw4VnA0ekhRbzlNcCtWd3Vra1NLMGZkd0JxRit1?=
 =?utf-8?B?eVlhajFoNENkOEdJVGVXcVlsRDBobjNINVpvbWg1WWV0TGVOZGNSNTV4MHlZ?=
 =?utf-8?B?MnhDM3NOSlRJaEppUWEyZVIybmMwRnRiaHFoNzVlSkM5eWd1R3JuR01qME5t?=
 =?utf-8?B?K3QwVm00U3lnYXJEMXgzZFRuUkNhdTFGbStGSlIvUVVLZStaSEJERVlFamhB?=
 =?utf-8?B?UE93Q29BVG95L2NrcHg4TnVVVit5RWlIZ0Rpak9ueGVNQzJpMldGYi94ZGFq?=
 =?utf-8?B?RFVRMTRDRDVJZlBreHVTNnZkdVMrYUxLTzhNZllQY1B2endKelZXUzQxNTMz?=
 =?utf-8?B?cS9XcWtBZWpHTHNTWThoWGp4eVVEUXNRa1JiSnZUd3hkZGR5Rkh0TU1ySERN?=
 =?utf-8?B?VDBuL085MytvczdWU0hqazJHOEVTVzBGdUxzRkVqcFlHQk5Ta000TDRicnJx?=
 =?utf-8?B?ZGtleWpVSi9FamdTbG1DKzJibkdLZ0pSQzVvWU5yMkpSNVdXWVNOVTExaWl6?=
 =?utf-8?B?ZnpwN0JPNGlGOG9vWmd0K3BJSHM2OExUbVc2QjFRcDdqd0RzNjlJQXh2ckpK?=
 =?utf-8?B?UUhXeXFONWFZT1JMbHE1RDhMU3RFSngxQmpob1lTRkErYVJ3S0R6KzVtVyt0?=
 =?utf-8?B?c28xdFhEVTJTZDJLL0RFU0lnWEtHM2tIeDRkV1hPY3FEelVpaFNvby9paGEr?=
 =?utf-8?B?dEVjY0ptNFJHVjJiOWdUNEZ2MENDN0ZjWXVLb3FDMEx6RHVNakZqbzU5WmVj?=
 =?utf-8?B?NFhGbmNORWFlOFdDZjNOQVBRdFZIaWlQL2kzTmlNS01MbUdleFQ3cVpMd1dv?=
 =?utf-8?B?d0lNTU9uWFN1TVp1VCs2cmxFVW02aHRUYTRkbEpBdXprUGdNZE1Md3lrMzBv?=
 =?utf-8?B?Sm43Z0tLcTh5dnZFWlBmS3ovZURHcURvNEJjd0NvRmpERmtacUU1NGNkZmt5?=
 =?utf-8?B?TmFGeW96SWxlMlVJMlQ1VE0wYWpHaFFlSExIRUowWERvTTM1U2pINCtrck4y?=
 =?utf-8?B?Z0JLN2o5Z2JrMzdLbE1JRzdFakhUVDJrOWp4KzUrTnpMSXlaM1dRTUIweUdJ?=
 =?utf-8?B?MGN1amtZVTJERHhIRHptQWhYUFhOMTVJVG5wNS9tOStjK2tNZ0pkSGpMVm5s?=
 =?utf-8?B?UmdQM1MwQ1Q4VUFuZVgrVHVXK2p2K0ZwZS9uMEdVMi9DNFRjN2QzRVBRdElZ?=
 =?utf-8?B?U3U1Y1pKdkdkY01YaUlOeDIrdTN2U0FyZW10OFBtVVViSlRocDcvam5VOXJK?=
 =?utf-8?B?UkNGeGI5WmpJTlUxbEhNOG9CTWRoNWFWT1o5OGYwREJuSHk3TEtsZmlLK1pz?=
 =?utf-8?B?bUpuTCsyN0Z5eWYxL1Z5UURFUXRYVDBUNEJEZHJnUkVpWDllNFpmSExpUFpt?=
 =?utf-8?B?ZmVsc04zb3pSK2VwNjhBYlh5YnFGb3VTVXRpUUxZRjdiTGw3dlZ2SHFYN0xV?=
 =?utf-8?B?VlpTM1lXNjRVeXJlM1ZZTGwzQWJZM1A4dERlMFJHL2k3MUU1KzRnaEVkQ2tF?=
 =?utf-8?B?WGU0eGZQazA3T3JvaGJUT1QwUm1tUnJrNG9ST1I4emNEeVQvUXV1NTlWd2Jk?=
 =?utf-8?B?UCtkQkhhb3dwcHNZUDhBOElNQWhRTExmaUlKdFU4eXowS2ZucWxNczF0NUsr?=
 =?utf-8?B?ZXZUbHVrT1p2MVhjUGtVc216K3NqSHpDVHF1c0NKcG9qTTFubjNHcXFBWnFD?=
 =?utf-8?B?SmhCM2tVVGVkMjg0b2NCVlp3S2gvT2gzTDhUZ3pJRHVrZ0JUZ1E2RlFCQmxh?=
 =?utf-8?B?WXZndlNDWUFVUk9rWU5GMXYxQkxVVWF1Q3MrUUVjYXowWFY1QnlEMmdrUHVT?=
 =?utf-8?B?UnVKV1VGNFpPTGhCbkxtWFBwTDlWUmdNR3JvL3RtOUdPNytpY2FPemp2ZTV4?=
 =?utf-8?B?Tmhkc1ZCY3dBenRHSWk4eENCWkk2U0RBdjJBelBSQktWeGw3TDRTYzRPUS81?=
 =?utf-8?B?NDRjanFQZFFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SThCZENKWXJHNVIyL2ZXWjY3eTRoMHNZL0VtQ3NCMXJjWVVXMlVVN0tKbFFm?=
 =?utf-8?B?OEZEbm53QWFaSm1xWUcxRU85VmdmYTFnWGQzcWhpTWpEcUtYS255dUZ2c2h6?=
 =?utf-8?B?TTEvSDFrTXJSWVpYczB5SmFmYklGUFhPSDNtK256UEJBMkEvMWNBK25mU2da?=
 =?utf-8?B?MEd2b3BBNEJvYy9BdHBKZnRmanRjUXZQcXZtQ2piT3NxZjNaOWRXbU55Ti82?=
 =?utf-8?B?TEc0ZjZ5ZmUyb2hXUWYyaXowZUwwekdRRzQyYXkwcnpUb1YvZUV2Qi9ua2o2?=
 =?utf-8?B?UTRxUzcvSGpVYmxzbjFPbTlJN3A2SFQzUVVGZkZzc29YK2FGY1M2MGZnczhy?=
 =?utf-8?B?TVc0U3FuSnBtelRoTGhQOVRVVkdjeVpVb3JZZmY0Znpod0FYT3VBV0ZDb0J4?=
 =?utf-8?B?OXhEa3kxb2dMUzI2Q1JtSlpuSVFPa2JkNWY2aDA2YTIzY1NiaFBBVHZYRzhC?=
 =?utf-8?B?L1dkY29tUUhFTEFhOXU4Rmkxb3pUM1FIaVE0Y2xlYjhrN3k5cUQ0OGFYSFdC?=
 =?utf-8?B?ZzJPcFI4Yk4xUE5Nb0hmdGZoMDBWR01hM2h4SXRQVHcyWjZIQ240Qkx0dU5J?=
 =?utf-8?B?Y2x2VjRpUmpmSFNUUkhNWEd3UVUyR1NuV1JibEx3VlpiVExEM3Z1aHQ2Y09x?=
 =?utf-8?B?elozZU9zNkNmRnB1T3JzNndyRXRneVMrM1QyMVhtd3ZEMXplRGlpb2QyWDBW?=
 =?utf-8?B?cUpOMDVaYUlZUmI5WTRJc1p3YjgwNUREOTRncEt6bjFlV3haVCtiQWR3S2Ir?=
 =?utf-8?B?cGZXUmxaTXhUUEQ2Sy9pRmJlYTFPNlZOV1l6ZGl2ZStkV29wR2I5dlNlUkRa?=
 =?utf-8?B?aEVVNTlSbHdmdFVDY2NOeUVWcUFQUEY5NU9kY3BtMk13aXZHUG13ZVBNTlJP?=
 =?utf-8?B?clBhTEZ6TldaN1VnNkZqMDBGS0Q1TnZIaGF3ZldZWXFrQ0lBQVhUeUpCWG1m?=
 =?utf-8?B?MjNXdXB3WThZM25EYXM4YktrZnF5ME0wSFFtVXJzOERhcnAvbHNyRzQrS2Ur?=
 =?utf-8?B?VHJwK3pwK1RYSEh3amFpcTNZQUZ5dlE4dnJlQTVkdzYzSHVxVE40bXNtRUMr?=
 =?utf-8?B?dmMwOFBHSFVkdVVsZnc3amNPNC9rL2FVOUxiNllVZ2xkUHAwM0cyNUpDczlm?=
 =?utf-8?B?d2JOZ2t3VEc5UERYU2hvZkdWTlRGZmJOOGhpVWtzUDlkdjlJM2sxQk9nN1Av?=
 =?utf-8?B?YzJTckpUOVZMTk10TjJxQUZLU3B6KzJEWGlXK1FyeWdaU0hwZkhFck4rU3Mr?=
 =?utf-8?B?c1M3V0FqemtiTXJ1VFFqLytqMjVxZWlRZGJkaEVqajRzSkZ1QUJoYXVURktE?=
 =?utf-8?B?WTZIWFo3QytRN3E0ZklycWxmYllFU2tSVzI1ajM2R3dTd09vb1NmQU1YWkU0?=
 =?utf-8?B?b1hOeGZ3WFBQMHBQdUNQWnZNS0lPVzhSeGtBREVOZjYrZSt0b2tLYzlWTWdO?=
 =?utf-8?B?Vlh4SncrZFhGNWtIcEM5MkpOdWRWZ1FJMW9zY2ZDVEFhM2htd2p1QXkrQ0wy?=
 =?utf-8?B?NHNuemIzSERSMk5zalFqd2ZiSTFkWmY5aDFGbFRzTkR0dXUybXBPVDhyeVBW?=
 =?utf-8?B?TkRyMUpLdWFOK1h0SmpYYXVWODlRZmFGeWJpRVp4QWdrYkI4RGljVWpIL1VH?=
 =?utf-8?B?ZTkxbk5UczQ5OXhzZHIxSlNPSUNiNWhPa1luaEFzZmprcFRNUGMwSXBlK2R1?=
 =?utf-8?B?N0JkMEVXK3loR0ZmRm1FN1dJbG9heCtXTWFOblAvSzJ3aENhaktscFYvZklS?=
 =?utf-8?B?dUtrZGtwZzlUeW1Ib0xwZXd2eTZRUDljTkFmVDkxZVZhSndoK2JyTzhOdy9w?=
 =?utf-8?B?MlY2MzV1TTNXYmdjdGlaRnNXaFZCS1NWdmxyNitTTnBUV2FyRCtqcHJodzdh?=
 =?utf-8?B?VXladVk3RlorOFRNeW1ZN0ZaZkowcWJ3WW9tZWJGUkxxMjZwMW41MHFucVJV?=
 =?utf-8?B?N2MzYkFvZGdaVFFCVXRGKytiM0E3MUM4bk1TR3FINjc0bWlKUmg3UDlFOUJi?=
 =?utf-8?B?eWMrWHFJZ0FoaFFnaCtPenZ5ZEcrVkgwOTl4M2ZBWVlicWgzNW1rNFgvd3do?=
 =?utf-8?B?dDMzaHZrbzFJNzcyYTJVcW0vZzNCU3c5NlZpc0pBdU5kOHlRV3NTaXpjOVFZ?=
 =?utf-8?Q?twE4PAdJoq4a8tt5/K1pYj+QS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d10d47-4202-4d1a-2bdd-08ddf10ca5ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 08:24:38.2355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wN6iWDFt85+ehgiVXmDSJLH+Hq5Pz8fmrs/V/vmXCTDyvyDXx2aD/157DyIoknws
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8507
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

On 11.09.25 09:55, Ilpo Järvinen wrote:
> Fix the copy-pasted errors in the Resizable BAR handling functions
> kernel doc and generally improve wording choices.
> 
> Fix the formatting errors of the Return: line.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/pci/rebar.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/rebar.c b/drivers/pci/rebar.c
> index 020ed7a1b3aa..64315dd8b6bb 100644
> --- a/drivers/pci/rebar.c
> +++ b/drivers/pci/rebar.c
> @@ -58,8 +58,9 @@ void pci_rebar_init(struct pci_dev *pdev)
>   * @bar: BAR to find
>   *
>   * Helper to find the position of the ctrl register for a BAR.
> - * Returns -ENOTSUPP if resizable BARs are not supported at all.
> - * Returns -ENOENT if no ctrl register for the BAR could be found.
> + *
> + * Return: %-ENOTSUPP if resizable BARs are not supported at all,
> + *	   %-ENOENT if no ctrl register for the BAR could be found.
>   */
>  static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
>  {
> @@ -92,12 +93,15 @@ static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
>  }
>  
>  /**
> - * pci_rebar_get_possible_sizes - get possible sizes for BAR
> + * pci_rebar_get_possible_sizes - get possible sizes for Resizable BAR
>   * @pdev: PCI device
>   * @bar: BAR to query
>   *
>   * Get the possible sizes of a resizable BAR as bitmask defined in the spec
> - * (bit 0=1MB, bit 31=128TB). Returns 0 if BAR isn't resizable.
> + * (bit 0=1MB, bit 31=128TB).
> + *
> + * Return: A bitmask of possible sizes (0=1MB, 31=128TB), or %0 if BAR isn't
> + *	   resizable.
>   */
>  u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar)
>  {
> @@ -121,12 +125,14 @@ u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar)
>  EXPORT_SYMBOL(pci_rebar_get_possible_sizes);
>  
>  /**
> - * pci_rebar_get_current_size - get the current size of a BAR
> + * pci_rebar_get_current_size - get the current size of a Resizable BAR
>   * @pdev: PCI device
> - * @bar: BAR to set size to
> + * @bar: BAR to get the size from
>   *
> - * Read the size of a BAR from the resizable BAR config.
> - * Returns size if found or negative error code.
> + * Reads the current size of a BAR from the Resizable BAR config.
> + *
> + * Return: BAR Size if @bar is resizable (bit 0=1MB, bit 31=128TB), or

This is a bit misleading since there is no mask returned but rather the order or in other words which bit of the mask was used.

Regards,
Christian.

> + *	   negative on error.
>   */
>  int pci_rebar_get_current_size(struct pci_dev *pdev, int bar)
>  {
> @@ -142,13 +148,14 @@ int pci_rebar_get_current_size(struct pci_dev *pdev, int bar)
>  }
>  
>  /**
> - * pci_rebar_set_size - set a new size for a BAR
> + * pci_rebar_set_size - set a new size for a Resizable BAR
>   * @pdev: PCI device
>   * @bar: BAR to set size to
> - * @size: new size as defined in the spec (0=1MB, 31=128TB)
> + * @size: new size as defined in the PCIe spec (0=1MB, 31=128TB)
>   *
>   * Set the new size of a BAR as defined in the spec.
> - * Returns zero if resizing was successful, error code otherwise.
> + *
> + * Return: %0 if resizing was successful, or negative on error.
>   */
>  int pci_rebar_set_size(struct pci_dev *pdev, int bar, int size)
>  {

