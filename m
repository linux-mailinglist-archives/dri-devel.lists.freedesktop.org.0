Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE19C999F7A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 10:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C6310EA93;
	Fri, 11 Oct 2024 08:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XTsKpbxQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4429A10EA93;
 Fri, 11 Oct 2024 08:57:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiSJisZNijo53/mwFzYWuM7XyCwjgi5+uP6KzlZApR+gtur3fICokLfqiGJiaBOMUll/LrN4uqCqcIzYbpoqQTzZlGPNFnvoLBi/2rBlWvV3rIEt9QF39vG89kl8g21YjXa4LTXwMLr4D9yjvfpIGKu/ANRN5uyND4caEZu+ozcXJk8aEHUtY02rD/fEU/HtBMYQJ3U/Aku+F8z00BoIxz3KDS2ngft0cW5HWHNZqOK3sTLkzdGNvdO2sxy/HaXdsMWApUl/S8Qo8fFn60U4SO+f5LFHjgKXtr9/dwZImo6+MnBfteIiukPrrhEZ/aYPC8UA49IqDQQTb+IwpkYl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNo4XZP4WcbOLjoFq4A1Ng9KcAAV5YhP6SDTRMGZYh0=;
 b=q47lrTfnqY8L/b0WiXm60JtaLiKnsPQwdDm//FdNthGendxy2JfDoez/ZLvu4/U8cinGC49VZO9UrTFnx3EFGEOkoUq/SlYOushscboiHROxd9Oasue/1/FzqPoTJoIHW4EDbog0jAGLDKZUDOuhOSQznHlU9bC1efGfBmn6jJq13c/Vbl0MrkTtY3EX+xO2xInlnY4VckfNUtP2WXDlUIlhAxwwkzDyseVOqbuScV5bwGg9+e5+n7FPxuw2iugW1of3EfxDwVmSnr9D+3U1hjaSclSfMiBCvZSHieOltZch2XlL65HCn4ZaueGM2r3VnwAzyuY6HVRFLIPEfYsOZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNo4XZP4WcbOLjoFq4A1Ng9KcAAV5YhP6SDTRMGZYh0=;
 b=XTsKpbxQQvmbF8oDBqVH8V9v91lYV4aAXIZiIBJMYDtQbOn67vZ71/piLdL9GDAYrUYyHaUtSFMUd2D26yb5qhV+FTfK2BPfZs94zudRR0g3uiIC+oLsZKjXSDY7kfI6TOwBsbvqmrA49gUpbitDCKxO3O+Tm38dCfplMhi+eqk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB9521.namprd12.prod.outlook.com (2603:10b6:208:593::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 08:57:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 08:57:55 +0000
Content-Type: multipart/alternative;
 boundary="------------qqP0iFfv7kARWQshWdmwFY5E"
Message-ID: <8fa25483-d6e2-4614-aa2a-c41af0529e5c@amd.com>
Date: Fri, 11 Oct 2024 10:57:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] PCI: Allow extending VF BAR within original
 resource boundary
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20240919223557.1897608-1-michal.winiarski@intel.com>
 <20240919223557.1897608-3-michal.winiarski@intel.com>
 <376713b2-6703-4fd2-b99f-cc67de4f267e@amd.com>
 <47iala6cl7tks7tw3wcrxm43y4xl4w24u6gfw5tekdcuabhndx@t37nyrqysrb5>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <47iala6cl7tks7tw3wcrxm43y4xl4w24u6gfw5tekdcuabhndx@t37nyrqysrb5>
X-ClientProxiedBy: FR4P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB9521:EE_
X-MS-Office365-Filtering-Correlation-Id: ef4c7034-196d-46f2-143b-08dce9d2cbe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFg3TEtDbkNiQTU4dGFuVXprK3NuWWRVeDZhSkVoT0N6QktYaGlZY1VxdFNW?=
 =?utf-8?B?VldPNmFyZncvdWxhU3VXQnIxYW55Ykg1b2tocVh3NVkrcDRkeTNJOWNYZWZQ?=
 =?utf-8?B?U3FXcDdpTXhsdnNNZWx0RzJHZHMwZlJ6WTNQaVpBMHBwdVV4RjNMRjNoZHBr?=
 =?utf-8?B?OWxvc200RlBGd1YwNGpJeVd1TjZZamR0VkxZSHhoY2RQZVpiaUt2MHd3K0w2?=
 =?utf-8?B?aXAxLzFyL2pUb1RhVkppRzcvS1pBWW12MDNCWm0wODBXblh3SFpRc1VzQ292?=
 =?utf-8?B?RGtTaE1FZ0ZWV3Zmejl1ZEV6YlZ6dXdhQjZGQUlNYzRvMUVtTnNqdFFCQTNQ?=
 =?utf-8?B?Q2s1Ym9jSXdLTmNlL0k4bXZJK3NhUFdkUmVBNHltbURaUU9laUsvdWJXaVEy?=
 =?utf-8?B?S09LSDhEUEpBcmFJUnhkc3ZMdUV2L2Z6YVZpR3Ayek04QWpHc0lTbzhmV0pV?=
 =?utf-8?B?cXloZU5iNXNLSnlqV0wwYmdNMndCZUNkd0tnQmhDQUdyTGh2SzZJTzBmeE9z?=
 =?utf-8?B?UEJ2YVkwVU5hdkFyamEyY3Q3c1FxQXh6WFBlRU5aYjQ4VUhBc2pPZkREa2lJ?=
 =?utf-8?B?dEZiZTJGWk5aQ0pPUjNFQXdtQXpPdDBwODZGdk5zYW95TVY4d3lSUXVXQjVt?=
 =?utf-8?B?ZWVjQlBwRjJZKy9ZZUhzY3hDdndnTCtlQUhDM05XVzRQSWY0cC9TVk13UnNn?=
 =?utf-8?B?WCtMTnhwc3hHc0JWZ3hxa2ptMEtiZVEwLysrOWZiZTdlTVAvVGJpK21ObWt5?=
 =?utf-8?B?ajJEUDZDZ1JLclYxUU44VXZ3VFJuUDF0L2ZGdG11ei9DUTBEeGw3WitlKzFr?=
 =?utf-8?B?ZnpSdzNOQjkxSm1ZeTN2cm5IdndFNkFpZmdwOVZxQlA2VGlBVXhNeVhiSU5H?=
 =?utf-8?B?cUtHSi9GTzVLaENHOXdxMGhSYTQ1QzdHVzJDbXhuTXN2bGR3cUVrZms1ajJk?=
 =?utf-8?B?T1hiUWc0KzhsT1JzWmRBT3VYN2hGakp6cXJ0V0FwczBxRTc0b0NlMWRiUDhH?=
 =?utf-8?B?ZUZNM3ZTUERsK3plL09uZWdlYVozMmVWT3dOdFAyS2ROMVhHYThnR2ROTDRR?=
 =?utf-8?B?cVAwTm90Z0w2OEFoR200TnJ0eG1hVE9EaHBVNEYzaDd1YitIbUpMaVRHMFg1?=
 =?utf-8?B?a2FGNGJUeDhyTHJoOFgxOEF5Z1oycUpPVDgzUFBWcksyckJ1RUdKY2hUOW9r?=
 =?utf-8?B?ODhkS3VWOW9NbDY2LzlXMUd1Tk9PbnBiMkQrVWFzL1FoR0UwV0lkeHVLKy9v?=
 =?utf-8?B?ckp0cHJDTlRJVkkvMEl1M1hQbC81eno0SUlCNmZKWDd1d0JsL0JycWJVMzBv?=
 =?utf-8?B?ckNacGovdUxxZnEzNzdrYWRBMTkvdFQwM2ZiemJNbUI0ZnQ3SHUwRGNHdnN1?=
 =?utf-8?B?L295OTdoUjRWUmxxWWkyNjJvNVJMdGl3VlhWZWxxTWE4L3ZTQVdMMDg1QVpC?=
 =?utf-8?B?cXRtMDVJc29HZFViOWhnbXk0ejFjVGh1QjhicEUwZlVsbFNZVS9yT1VZL1Zp?=
 =?utf-8?B?dzFCVmVSUHJkOXErK3RDMmpSS1RYWmRzRTdiMDk5RHFzenNLUzNYaDhXa3Ba?=
 =?utf-8?B?cW9oUnhGSmozWUxiOWl5d2ZBN0NDTy94WlRkR3ViVTQ4THhadE1LT0Y1S05J?=
 =?utf-8?B?ZW5BUFhlOWpvdEFkRWJ5NG9UbTFRS3FJZnJjeXJKLy94N0FRVHpqNmZKNWhq?=
 =?utf-8?B?V1NMbUxjM0V0L2REb0hIT2o4SnF3K2RvK3lKc0VSczlQR2gzcUdEQmFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M24zL216QVdpbDh4ZWVRUXgwYmUycGxidWJGYW1RSmM1a3VJdy9XOXVRSk82?=
 =?utf-8?B?RzdQT1VjUGtFZkEyWWlldGJGWUxaZllaUzg3bElIOVhOVmltd0JBMThLUzVr?=
 =?utf-8?B?b2R5M3BqQ0tacXNiSWFEMXdndVgrV3RHck04ZEt6VUFubVVaNDB5eG9KTjlp?=
 =?utf-8?B?SWhHZzhZQnpacUZjTlo1bkJQVGMwYXNwb00zZHdSeVJCWjNuS2wxM2o1WGpk?=
 =?utf-8?B?cDdjUG9hdm9scjFIRXU1WTBKenVibTVZeFdmM2lKZ0FrQVoreHBJbkRSclVR?=
 =?utf-8?B?Tyt0RS9NdjQ5RWVWOUNtaGNWY2l3Nkc2TlpLdWhPK1o4ZlRHYzNrMytPSkVm?=
 =?utf-8?B?cHhSVWdRQTJyS1NmdEtZcERSNVIwMkdzdjVGV1J5OGdXd0pSSXZiSERnM1hq?=
 =?utf-8?B?OXdkTEsxZ0VNWFZsb3pYVURMblk5OXFRRVliK2JPSTgxNGRabmVHYWxXU1ll?=
 =?utf-8?B?cEs0a2U1YUdCRC9ONythUytEMnJmQ3gvWHc4bUlWSzQ4dlNOcU00cXhiWFN1?=
 =?utf-8?B?Tm5EM0ZSMVlpenRFTkZXWWMyZ2Y2VjdHYWpHZW9CNDhQWTJVOGVJTnNUT2Ft?=
 =?utf-8?B?RWEvVnY1aDdZOC9aa2NIOUlZdjh6TXlLL2JEV09oU0RIbzUxRFFtYXduTC84?=
 =?utf-8?B?RWVQUE5xRUFZOHo4SVBocFcvUGhFcnQ4YUNBQi9hQ0JGSVV2blg1WTlTelZP?=
 =?utf-8?B?Zjg1NXZ4UjFWOU1EK044VXNUZmJBMVczSEJxU1IwL2VFaXdhUVQrM3pVVzMx?=
 =?utf-8?B?TzVRcERTc0R4TlV3VVZ0UnI2UGRkai9CSXphWEdreDluWjJaZCsyZVRlMmVY?=
 =?utf-8?B?eHdyQUR4bUhpejhDV3VXOTlCWkN4Qlo2aXV1ekVxOE02V2dheURnUnQ0Mnhw?=
 =?utf-8?B?QmhKb214MHNMMDkxVVZZRzRndnB0bWd3VVVIeDV4eUhweWY4d0F5UE1nbHEy?=
 =?utf-8?B?cmkxYkY0bkZ3ZFZWL3NPdGhMK3hKVWRGVVdYMHllOXplRS9YeGFrc1NmQUh0?=
 =?utf-8?B?c3lBeTh4TGtPVjFQMXQ4ZnRNSkVwM2liRXRwdEpBdWZjRGRKbklMTkxlMUVv?=
 =?utf-8?B?cE1qbUY1WVQwMU05TnFzWVRGaWIxa2lyWjd5OEpkRFZRVk9yUWd5Q1BKNk43?=
 =?utf-8?B?eUtreTFjZVhhcysrbTlnc29NaDBBeWlNVzNlcVJqSmpyYWNxcU82WmhaQmRJ?=
 =?utf-8?B?eHl6TURGMjgzK29rZjQ4Rk44SkRCOXBYYmNOR2NjbFJHd1MwT1hDMGFhTmti?=
 =?utf-8?B?UjB3Sm5jVUduVVhkUU5wVUQzY0dzVXhnblZIL1V6MmE5Y1NOQmhSN2xkZlN5?=
 =?utf-8?B?VlZXTHN4ZjhSUFZUNlVRVGcwNDZMYlpHcFBFd0h5ZkNHUWFXSWJhTUV6MTNZ?=
 =?utf-8?B?OXRXNHZFNlBBU3pqcXVNbGFRWG9wUHlzYjFBOXVUOW5sTk9NeVRmT3Y3MHZS?=
 =?utf-8?B?dWJzaVVpVE1MRDE2Unc3bkFWcFNncFJQVFRNYk9YZ1VHaU94NWFKNHd2L2tY?=
 =?utf-8?B?a2pQcnRLcTZTRStEaisweWozOEtHVGVxbDdWc1VBcWZ6RDAvMnIyaU9QWGoy?=
 =?utf-8?B?MlJKN0xWV0hKbldUTXdUbFRhOGNQQmdRT2RFUTNkUW5GL28wdXNGV3VJUisx?=
 =?utf-8?B?MlFYR3docWdqVUUxWXNqdC9LOE1CVmRMUlVSYVpOOVE4VTFBVDdDT3R5bzRx?=
 =?utf-8?B?VU4yeXR1S0tsRkJadjVyOXpIL3V2bk93VlllTUF0SklhanFSRy9zc2RUY1ow?=
 =?utf-8?B?VnM3R1ZGL1RRbUhkVDg0VFdpMjZSQ3UwK1RBWlRXOTNnU2tRWnNHLzZNNDY4?=
 =?utf-8?B?Nk9TNkdTMzREQ1Y2WCtqa0tBc0diUzkyalhYWlJENngyK2swblFmMTRabzVQ?=
 =?utf-8?B?SjJoNmZJV2VXQ3dGR1d5c0x6L0NpUUl5MXBUOWdtd0lpbHFzMTJ3bVhKNFJW?=
 =?utf-8?B?VkZSTU16a0M4NlB6L1ZJM21Hd1ZkcnlBZ3A1WWdoVzRtMm1mUytVaFlvaGZz?=
 =?utf-8?B?L3ZlUFd1UE8xb1IwV2NFWXVQcTZNeWZYa3ZaNUpSeHNieTlVTkN6OHVsWHVR?=
 =?utf-8?B?QTJBVE03VitmYWYyZXpDaVk2TG5VWVo1MHh1S0RJWU41RzRsY3ltVDNsZWZx?=
 =?utf-8?Q?AMXE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4c7034-196d-46f2-143b-08dce9d2cbe7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 08:57:55.3871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohSkg0G376xSjrA4VTkqV3oCGH/6eQAL7A7srKWPwBmPjldXz/nPC/Rhba9/i6uu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9521
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

--------------qqP0iFfv7kARWQshWdmwFY5E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 10.10.24 um 10:59 schrieb Michał Winiarski:
> On Fri, Sep 20, 2024 at 12:07:34PM +0200, Christian König wrote:
>> Am 20.09.24 um 00:35 schrieb Michał Winiarski:
>>> [SNIP]
>>> @@ -487,6 +567,11 @@ static ssize_t sriov_numvfs_store(struct device *dev,
>>>    		goto exit;
>>>    	}
>>> +	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
>>> +		if (pdev->sriov->rebar_extend[i])
>>> +			pci_iov_resource_do_extend(pdev, i + PCI_IOV_RESOURCES, num_vfs);
>>> +	}
>>> +
>> That sounds like a really bad idea to me.
>>
>> Basically the suggestion is here that the PCI subsystem should silently
>> extend and shrink the VF BARs when the number of VFs change?
> Why do you think it's a bad idea? Everything is under PCI subsystem
> control and the driver in charge has to explicitly opt-in to this
> behavior on a per-BAR basis.

And exactly that's a bad idea. The PCI subsystem shouldn't control this, 
the driver should.

At least for some devices we have tons of interactions with ACPI and 
EFI. Only the driver does know for example when platform drivers which 
might be in the way for a resize have been unloaded.

 From the past experience BAR resize should only be triggered by the 
driver and never from the PCI subsystem while scanning the bus or 
probing devices.

>> Bjorn has the last word on that but I would say that instead the driver
>> owning the PCIe device as hypervisor should resize the VF BARs to a desired
>> size and that in turn restricts the number of VFs you can enable.
> Then the PCI subsystem would silently change the driver_max_VFs (or new
> variable, as driver_max_VFs is under PF control, so it's either new var
> or checking VF BAR size in pci_sriov_set_totalvfs).

Nope, the PCI subsystem should not magically adjust anything.

What should happen instead is that the driver would call 
pci_enable_sriov() with the number of virtual functions to enable and 
the PCI subsystem then validates that number and return -EINVAL or 
-ENOSPC if it won't work.

> It also means that we have to do the maths to calculate the new VF limit
> in both PCI subsystem and the caller.

Well the point is that those calculations are different.

What the subsystem does is to validate if with the number of requested 
virtual functions the necessary resources will fit into the allocate space.

What the driver does previously is to either change the allocate space 
or calculate the other way around and determine the maximum virtual 
functions from the space available.

> We can go this route as well - I just think it's cleaner to keep this
> all under PCI subsystem control.

I think that would be much cleaner, especially the PCI subsystem 
shouldn't adjust any values given from the driver or even more general 
overrule decisions the driver made.

Instead proper error codes should be returned if some values don't make 
sense or the subsystem isn't able to move around BARs currently in use 
etc...

Regards,
Christian.

>
> I'll keep the current behavior in v3, but I'm open to changing it.
>
> Thanks,
> -Michał
>
>> Regards,
>> Christian.
>>
>>>    	ret = pdev->driver->sriov_configure(pdev, num_vfs);
>>>    	if (ret < 0)
>>>    		goto exit;
>>> @@ -881,8 +966,13 @@ static int sriov_init(struct pci_dev *dev, int pos)
>>>    static void sriov_release(struct pci_dev *dev)
>>>    {
>>> +	int i;
>>> +
>>>    	BUG_ON(dev->sriov->num_VFs);
>>> +	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
>>> +		pci_iov_resource_do_restore(dev, i + PCI_IOV_RESOURCES);
>>> +
>>>    	if (dev != dev->sriov->dev)
>>>    		pci_dev_put(dev->sriov->dev);
>>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>>> index e763b3fd4c7a2..47ed2633232aa 100644
>>> --- a/drivers/pci/pci.h
>>> +++ b/drivers/pci/pci.h
>>> @@ -385,6 +385,7 @@ struct pci_sriov {
>>>    	u16		subsystem_vendor; /* VF subsystem vendor */
>>>    	u16		subsystem_device; /* VF subsystem device */
>>>    	resource_size_t	barsz[PCI_SRIOV_NUM_BARS];	/* VF BAR size */
>>> +	bool		rebar_extend[PCI_SRIOV_NUM_BARS];	/* Resize VF BAR */
>>>    	bool		drivers_autoprobe; /* Auto probing of VFs by driver */
>>>    };
>>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>>> index 4cf89a4b4cbcf..c007119da7b3d 100644
>>> --- a/include/linux/pci.h
>>> +++ b/include/linux/pci.h
>>> @@ -2364,6 +2364,7 @@ int pci_sriov_set_totalvfs(struct pci_dev *dev, u16 numvfs);
>>>    int pci_sriov_get_totalvfs(struct pci_dev *dev);
>>>    int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn);
>>>    resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno);
>>> +int pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable);
>>>    void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe);
>>>    /* Arch may override these (weak) */
>>> @@ -2416,6 +2417,8 @@ static inline int pci_sriov_get_totalvfs(struct pci_dev *dev)
>>>    #define pci_sriov_configure_simple	NULL
>>>    static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
>>>    { return 0; }
>>> +static inline void pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
>>> +{ return -ENODEV; }
>>>    static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe) { }
>>>    #endif

--------------qqP0iFfv7kARWQshWdmwFY5E
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 10.10.24 um 10:59 schrieb Michał Winiarski:<br>
    <blockquote type="cite" cite="mid:47iala6cl7tks7tw3wcrxm43y4xl4w24u6gfw5tekdcuabhndx@t37nyrqysrb5">
      <pre class="moz-quote-pre" wrap="">On Fri, Sep 20, 2024 at 12:07:34PM +0200, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 20.09.24 um 00:35 schrieb Michał Winiarski:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">[SNIP]
@@ -487,6 +567,11 @@ static ssize_t sriov_numvfs_store(struct device *dev,
  		goto exit;
  	}
+	for (i = 0; i &lt; PCI_SRIOV_NUM_BARS; i++) {
+		if (pdev-&gt;sriov-&gt;rebar_extend[i])
+			pci_iov_resource_do_extend(pdev, i + PCI_IOV_RESOURCES, num_vfs);
+	}
+
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
That sounds like a really bad idea to me.

Basically the suggestion is here that the PCI subsystem should silently
extend and shrink the VF BARs when the number of VFs change?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why do you think it's a bad idea? Everything is under PCI subsystem
control and the driver in charge has to explicitly opt-in to this
behavior on a per-BAR basis.</pre>
    </blockquote>
    <br>
    And exactly that's a bad idea. The PCI subsystem shouldn't control
    this, the driver should.<br>
    <br>
    At least for some devices we have tons of interactions with ACPI and
    EFI. Only the driver does know for example when platform drivers
    which might be in the way for a resize have been unloaded.<br>
    <br>
    From the past experience BAR resize should only be triggered by the
    driver and never from the PCI subsystem while scanning the bus or
    probing devices.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:47iala6cl7tks7tw3wcrxm43y4xl4w24u6gfw5tekdcuabhndx@t37nyrqysrb5">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Bjorn has the last word on that but I would say that instead the driver
owning the PCIe device as hypervisor should resize the VF BARs to a desired
size and that in turn restricts the number of VFs you can enable.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Then the PCI subsystem would silently change the driver_max_VFs (or new
variable, as driver_max_VFs is under PF control, so it's either new var
or checking VF BAR size in pci_sriov_set_totalvfs).</pre>
    </blockquote>
    <br>
    Nope, the PCI subsystem should not magically adjust anything.<br>
    <br>
    What should happen instead is that the driver would call
    pci_enable_sriov() with the number of virtual functions to enable
    and the PCI subsystem then validates that number and return -EINVAL
    or -ENOSPC if it won't work.<br>
    <br>
    <blockquote type="cite" cite="mid:47iala6cl7tks7tw3wcrxm43y4xl4w24u6gfw5tekdcuabhndx@t37nyrqysrb5">
      <pre class="moz-quote-pre" wrap="">It also means that we have to do the maths to calculate the new VF limit
in both PCI subsystem and the caller.</pre>
    </blockquote>
    <br>
    Well the point is that those calculations are different.<br>
    <br>
    What the subsystem does is to validate if with the number of
    requested virtual functions the necessary resources will fit into
    the allocate space.<br>
    <br>
    What the driver does previously is to either change the allocate
    space or calculate the other way around and determine the maximum
    virtual functions from the space available.<br>
    <br>
    <blockquote type="cite" cite="mid:47iala6cl7tks7tw3wcrxm43y4xl4w24u6gfw5tekdcuabhndx@t37nyrqysrb5">
      <pre class="moz-quote-pre" wrap="">We can go this route as well - I just think it's cleaner to keep this
all under PCI subsystem control.</pre>
    </blockquote>
    <br>
    I think that would be much cleaner, especially the PCI subsystem
    shouldn't adjust any values given from the driver or even more
    general overrule decisions the driver made.<br>
    <br>
    Instead proper error codes should be returned if some values don't
    make sense or the subsystem isn't able to move around BARs currently
    in use etc...<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:47iala6cl7tks7tw3wcrxm43y4xl4w24u6gfw5tekdcuabhndx@t37nyrqysrb5">
      <pre class="moz-quote-pre" wrap="">

I'll keep the current behavior in v3, but I'm open to changing it.

Thanks,
-Michał

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">  	ret = pdev-&gt;driver-&gt;sriov_configure(pdev, num_vfs);
  	if (ret &lt; 0)
  		goto exit;
@@ -881,8 +966,13 @@ static int sriov_init(struct pci_dev *dev, int pos)
  static void sriov_release(struct pci_dev *dev)
  {
+	int i;
+
  	BUG_ON(dev-&gt;sriov-&gt;num_VFs);
+	for (i = 0; i &lt; PCI_SRIOV_NUM_BARS; i++)
+		pci_iov_resource_do_restore(dev, i + PCI_IOV_RESOURCES);
+
  	if (dev != dev-&gt;sriov-&gt;dev)
  		pci_dev_put(dev-&gt;sriov-&gt;dev);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index e763b3fd4c7a2..47ed2633232aa 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -385,6 +385,7 @@ struct pci_sriov {
  	u16		subsystem_vendor; /* VF subsystem vendor */
  	u16		subsystem_device; /* VF subsystem device */
  	resource_size_t	barsz[PCI_SRIOV_NUM_BARS];	/* VF BAR size */
+	bool		rebar_extend[PCI_SRIOV_NUM_BARS];	/* Resize VF BAR */
  	bool		drivers_autoprobe; /* Auto probing of VFs by driver */
  };
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 4cf89a4b4cbcf..c007119da7b3d 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2364,6 +2364,7 @@ int pci_sriov_set_totalvfs(struct pci_dev *dev, u16 numvfs);
  int pci_sriov_get_totalvfs(struct pci_dev *dev);
  int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn);
  resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno);
+int pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable);
  void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe);
  /* Arch may override these (weak) */
@@ -2416,6 +2417,8 @@ static inline int pci_sriov_get_totalvfs(struct pci_dev *dev)
  #define pci_sriov_configure_simple	NULL
  static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
  { return 0; }
+static inline void pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
+{ return -ENODEV; }
  static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe) { }
  #endif
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------qqP0iFfv7kARWQshWdmwFY5E--
