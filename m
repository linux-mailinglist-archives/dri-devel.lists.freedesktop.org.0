Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 832079EB291
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 15:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3014A10E051;
	Tue, 10 Dec 2024 14:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aFuhCxBk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7937410E051;
 Tue, 10 Dec 2024 14:03:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WknZfoCZHQK+ZfVdDT/Mz1brVLPtjVqJ+bUOWFCOZNAy9p7d5MDNDwRdg0RVDvVB0ye/Csyi5deDbcRQvl8KWpSVSGEE2uLLuHlNcOQnbf5L+YK+8a39ypS375ZDYGMAlc/3oGNjyqmJui7oOWae6KdKQ/Vf8rV44BaCn2VqGdJZFMAoMLmfposmaBnTrL/NWpNeSpLgWcd7l/aCFFZ303QoJednUY+4FOy2ZxqC7xvg7SBloGy8e/Fjk5q+tbi+NSAIx6uQ8/TQfvvrgldvgU2za+atDj2r/GQjpBA8H2wUSYr7KlZ8asdGVXyOQTV1l/9ee6NW5J7uxjnuBH3sWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rg31kn2aNAWqh+BjrW9V/NI/FtomCGhLI4/Le/zeOIs=;
 b=SXi9kpE0Wli6PKphIRvmy2drlHnY/svDzwLwbD0PydeU3Fxc43yg7nGtI7FhGENipCzkDqA8evYY8BXDtbFXtiFk5WWzqQ2RVcZ07c6QvuHWFnF9c7NYW1rB41qhKbl3x1RnCfzp4VmZWZPpzzSae8EqL9XIyoP8z4o/l3CZzclZe2ZX7OaHYmJTGFkGroRKdry2/Iwy/LcX4+xqo0TYg7xz2RYCDVDb9lw8eagzbyuwQPIzaotmjquYKyxbmBYQl4TedVQPocm/6Hcjzo6JRUO5sc07saQQfeLeYbMENJmtF+DNOp/87Hm6Eiew5WpR/3/qIPkbjXob9pTXlKqsUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rg31kn2aNAWqh+BjrW9V/NI/FtomCGhLI4/Le/zeOIs=;
 b=aFuhCxBkLfdaNjeB+KR2B/NKZaoURrQMT6l9SRHaq3aLv9szUDZlFk4oZjPdaOnd03olwlL0u3ePprKnP7ahsJLhGMNT6hjEPseuNYc9Ws/aM1c8oobQJ1iaNBL3OAnzQyge1eLr4KJsZUzNdN7cC5T/stWESHFKIFjBxFeCKZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB7478.namprd12.prod.outlook.com (2603:10b6:806:24b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 14:03:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 14:03:22 +0000
Content-Type: multipart/alternative;
 boundary="------------Yto28ho8LVN1gG5fo1aSYds4"
Message-ID: <bbe0193c-8869-488a-ae23-139a244654c8@amd.com>
Date: Tue, 10 Dec 2024 15:03:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/26] drm/xe/eudebug: implement userptr_vma access
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Christoph Hellwig <hch@lst.de>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, Linux MM <linux-mm@kvack.org>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 lkml <linux-kernel@vger.kernel.org>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
 <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <ec42fe8b-9be0-41cc-96f4-f1869c6bb7e6@amd.com>
 <Z1cNQTvGdAUPp4Y-@phenom.ffwll.local>
 <e4401ab1-0562-407a-a0e9-2f6e43e5ac22@amd.com>
 <173382321353.8959.8314520413901294535@jlahtine-mobl.ger.corp.intel.com>
 <d2141daa-b556-4487-a310-69a7fea4eae8@amd.com>
 <173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com>
X-ClientProxiedBy: FR0P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: beba1d12-a857-4034-4bf0-08dd19236885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2lqQTQweDVhalB6Z3lyZE1ZR0hQbDBZbnRIaFV5RUUvK0xZYW9FZkE5MkpK?=
 =?utf-8?B?TTd1MldGMXducndCUHF0MlNHVkt3bGhML0VyMThZaFYybWVFK0YyNzRoUEJv?=
 =?utf-8?B?SE16VDZLMjZaSXFwdmtBVEtKeCtBS3lmVHZxMnVxdEhGc2dQTTA2QWhVRDBt?=
 =?utf-8?B?cUNSQ2lXbGJ3VVE4dTZxUEttaUdic202OEFRbjVWY3hHZUtZYS9HMkdieDMx?=
 =?utf-8?B?TXJoVGQ1a1J0eGVIWHJoendwVEltNzY1ejdJOXFHczU3T2tBKzlrWWM5eU1y?=
 =?utf-8?B?T2hza3FOQmR6L1ZUNTBRckpGZnk0L1ZSM2JNSlBMay8rdC9keldkbTNoTWx4?=
 =?utf-8?B?cGVJai9CVnFrblJ4dk1TeHd3czcvQ0pkMVJCVE1tT2hUVkNsaWZQMUNsN1JH?=
 =?utf-8?B?K0ZCK0JHeFN3b1BEZDNVZUd6T1I0L2V4Si95bmZHNUFQWW5LK3NWY2xmR3Yw?=
 =?utf-8?B?ellscDZBVnpSbUtZcnFGZk96SHk2SzU5ME1nZldhYU14QjVmSlU3RnZxSFZD?=
 =?utf-8?B?aGw5K3BvaWNReFlpQlVvMHBkcjh6TGN2QjlrNkxkKzZOSDFPWXBydndmWG16?=
 =?utf-8?B?U0d5cTdvZTByajFtdHdZdHh3cWNBYUh5Q2EvS2pQOENSa3dDNEpnL3VsSFpQ?=
 =?utf-8?B?a0FIVUdsTmZ0MlRDMFltTUtqdEhZb2VPSXpiTC92d3VRSDQ1R1lMbTh6dXgx?=
 =?utf-8?B?K1JRSHBWaVBjQW1ET0R2UnhyVTh1UHU5V3Nsb3RudVlBL085QUJ1Wkxnb1JD?=
 =?utf-8?B?aVEvN21pNmRTeCtiK252cC8vbEdTcUwwazZvU1R0aTF0NzRKdVNpRm9IWHln?=
 =?utf-8?B?NWZndDFEdXRTbFk4bVU5SUpkeTBlY0hiUTVIYld0bjdkTU81eTFOS2s5bSs3?=
 =?utf-8?B?Ny9SQzVtMFpSQXp4Ui9HVzAzaktoaUhpSm5ybllGR1BCb2hxN093UnpGU3Rz?=
 =?utf-8?B?dlBydWZZeWRxazJBSlR4WTc5Z0lLbWZRcHE0MnpXdTh2UzZsc1ptVFJqMGMz?=
 =?utf-8?B?bG44bEFJVlVRR1lvSDlnOWZ0RUlJMEVHRFY3V3p3cEw0RnNqcW5aeE43bHgw?=
 =?utf-8?B?Rm5WRmQrcDFnYlArYVEvTzdYZU9pQ3oxYmZPVlJtdnZVZ3JYWGtpSHk2eTNs?=
 =?utf-8?B?aklCcTRKK1kvQmpmYVhQaDdoVWJuNlg5STFkbytDM2VDemFvTzdTV21Zdm8r?=
 =?utf-8?B?NTJQQVZINzREVHh3RUtrakl2a3ZUS1BPY3ZKTHhRalVRZjFwNzNIaHo4M0Zx?=
 =?utf-8?B?TG95WGZwZUNJYm9zK0xJZUJkUmlobnZGbmxPdkxjaHo3YTc5cmJsRE1DRmhR?=
 =?utf-8?B?L0pTMGNISmtLS3p5dFN3YS9wazZxQ05WTkJsQ0V5WGhNU3pkMnhtQ04yN05Y?=
 =?utf-8?B?d1h3cEludy9tc3JpNm45N2d3UEM1cUNBM21hM3l0VnlIZXhaOU9neWd2WFpN?=
 =?utf-8?B?N0RKTkdESkR0UWpOMG1wMTU5ZU1PcENTSUw1SStrNUlsM1dzcWF2dWxiZUJ6?=
 =?utf-8?B?anVONmJRNThGNHBMcWtLUnZremM3azVFeHVEWS9iVGcwZGJqOEgrTmh0cDl1?=
 =?utf-8?B?a2pNZzU5dW91QWNXZE5ZdHFMWmhmVi9pTTNGUkZVWWF1aE4vK3V3RStuYWtQ?=
 =?utf-8?B?MWNKcHFJSm9pVnF2bk5hSkVCSldYYXlVVFUzNVpqOTNGdmxjZUo2QW1rcFJs?=
 =?utf-8?B?ZUtzL0YvN2JiSExWVCthUFhnMFpvT0oxVzZhbE80MTZPRDgxMlAvdzU4TndT?=
 =?utf-8?B?eHBPTUs5UVVqeGl5ZDM5TUZJeDZqMUlmazlVMmQvbUl2VWNOUXRQa1kxWmJo?=
 =?utf-8?B?TnpDOUlUUzhFZ01kR0ZLeVU3VzVQYlNsZndnQjErcjRLYUtQSk1OSWRFZVpS?=
 =?utf-8?Q?cyWmFU0PI/LVQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ui91Tk9JZ0JLRnVXT3diZWJ1SmpOM1NvSHdCSVU1SXRpK3FMRUZSbTdRRWU3?=
 =?utf-8?B?eVVMa2hSNXI3UzU3U0NSSnkvVDc0U0F6QjAvMUNkdUJ5NVdqMjVtZWZBdFpD?=
 =?utf-8?B?NGpBZzNGd3JQSFBseFpmVzM5bytVejdQLzRVWGxMR2N6WEpUYk42cmxJVFhC?=
 =?utf-8?B?QjNDTFdERlVnS2tSLzRpVlVENmRzYXlnWXNZSkE2NDdPRk1Ld2VFVXBreG1w?=
 =?utf-8?B?MUk1eXBrcXpFQ1UwYU51SzNvR2VaeEMvWlhDNHhUVVVabm9HT1pzVzdTR1kz?=
 =?utf-8?B?UTVzUjMwbjNBY1FhMEZwRlRBd0MySTBna3MyOHFqMFpsYy9KWnVaVHR5bTha?=
 =?utf-8?B?UnZ4b2pTeXlCSWJ3aFhmRURLWHJDbGUwcUd4a0R4ZkFwWHNnNlp6eTBJbVhj?=
 =?utf-8?B?Z054TmFTbjFnZXJNQjNWZTdXd3pMUkhjWnB0TkxxT1J4bFVlQzU5OEI1RFFo?=
 =?utf-8?B?MFZ5ZXBya1R2TFYxa00raGx3dXBDZEZxd0Rmd09DVE5CSzhsQnpsVUZlSEtC?=
 =?utf-8?B?RlJQcWMzdEIybjBRNGd2dVYzbVhTTUlYTk9wMlFHK1FrWldTSkxlUDNNWVRZ?=
 =?utf-8?B?MUVDekZ1WmlNRHFNdUN5Z0xkQjlzOHphclRFcWpwWGVFRDh0dEFaQXIzNzAr?=
 =?utf-8?B?Smtubkozd0Q2OTZnRmo2R21VRHhXdS9YbGhRcy9LMmYzSDVnRmcyMW9GYWcz?=
 =?utf-8?B?L0VUQm84UjR5ZFVLN3cxamVETUhaQmRPZUJtcFl3Z2lDWGlHTGpvNzIwNUZF?=
 =?utf-8?B?cFF0ZEJrRERHZzYzYUpWcEZ0N3p6TEp0MEJDVmtMQzFCN0psZThwUG1JUllB?=
 =?utf-8?B?ejE4Q3JVVW1Dd2hGTlhGakZmeFpvZDZlYnJZcE5sZSt2RlFKQ1pKc2o5Vkty?=
 =?utf-8?B?ZVBvQ1hRdkQzeHpvS2M4THNaWjBSN3NnOFVydEpXM2N0REhHaTErdUFwUnJG?=
 =?utf-8?B?UDBsRDVLN05zRFBybnJ1MUtPVlpUamgxdkpJWkNMRU9WM1duZThsYVN4bzVx?=
 =?utf-8?B?N2pvbUI4N3pFZFM5K3EyWjBFRDVRSEMvME5JaGNEZlUwMlUwZnhIajB5NWI3?=
 =?utf-8?B?NWRCU0dGSlVVVGVMSFZTSzUwU1R6QU5neUU0Unl6cVVCTCt0azU5QTRkRnM1?=
 =?utf-8?B?TVB5QWpjaWkvNmxzL1U3SCtDQlBKY0lXOHRuNWk1dXh5QXNjSzZwdHNnYmVw?=
 =?utf-8?B?YlUvQm1ORWl5UjAwZFpBSlE5Y1F4K1JGOUFjMFVxeDNqUkNBTHBsS1o5dnNW?=
 =?utf-8?B?TVpuaHJncm1aK093TWt6b0FSUk9hWFdvSjBEMXJOMUtNeW95aDluZEpiM3cr?=
 =?utf-8?B?VGpsODY0ZXMrQ1lEeFowNVUzSGNNcEY4dUtBY3grL0QzZ040MnRMYWIrc3Zy?=
 =?utf-8?B?bkNlRVJ5OGJSYzhoRm94bWJNblRhREJLRnI2SndjODNLRDdpaG9oTytjd1BQ?=
 =?utf-8?B?WVVYQVh3OTFqRHJKK2VtNGluL0VtbFhWTmlQRGM3YmRncDViK2hVZkNOMzJG?=
 =?utf-8?B?UWNZNzRQRERwSzIva08vWHU3MUZIeUFaZ2w4ZmJ6TE0wdXRlanFPS0xwazJq?=
 =?utf-8?B?OU5aV1YwY1BaMWYxaGJkcVVFRjBZdU9CR3UyUHVQM1c3K0N1TmVHeCtXMk9X?=
 =?utf-8?B?NEdITStMVzFtQ3I4U1pWRHdTUWxVd3pJSndmVEk5UVM0VFYzZ3dIdnA4R21T?=
 =?utf-8?B?TjdLSkRDSTZpWlVIRnZhdlhMZG5GQUREbnpoNG9ZeW1rRDd1cThaVGhTMERo?=
 =?utf-8?B?VC9TUjJwRFNIbmVjRVdhUUhKMTQyTU1uZkhEeThVVHU5clhqNjF5K1lSRFF3?=
 =?utf-8?B?WGVPQ1cwNG5KcmVvRXplTUNrK1gxcmVxYVdXL0pwWFBCeTNnT3BDNVYxRWZK?=
 =?utf-8?B?NzBJUUUwc254dEsxaHR5OWZDcEM5TCtlNUpjTno5VFl2ckJqb1M0aUJhZzcw?=
 =?utf-8?B?TE05c0JrNWtCMWR3NXo1bWtORlV2ZjF3NmQyM2haSHZESlJzWXRwZFd2VjlJ?=
 =?utf-8?B?SkM0SGhWMFl6LzV5VEdLMGRwelFpV3BjcENHd1ROeFE0MWhTQUJMd2J3S1VG?=
 =?utf-8?B?UkR1dFluL0R5M0Z3Qlh6OUIvYVpZNU52TG1VREI5SVZGdXB2Zlk2Yjl0a3BT?=
 =?utf-8?Q?ZJRfPPYtv+LjbLHJ2TzkI14ST?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beba1d12-a857-4034-4bf0-08dd19236885
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 14:03:22.7963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8vVr8fAU8FYpepUUwlJz6KVfqm6ejORDN3Z56quwchkDQsy/AA66czYPNUXXWxH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7478
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

--------------Yto28ho8LVN1gG5fo1aSYds4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 10.12.24 um 12:57 schrieb Joonas Lahtinen:
> Quoting Christian König (2024-12-10 12:00:48)
>> Am 10.12.24 um 10:33 schrieb Joonas Lahtinen:
>>
>>      Quoting Christian König (2024-12-09 17:42:32)
>>
>>          Am 09.12.24 um 16:31 schrieb Simona Vetter:
>>
>>              On Mon, Dec 09, 2024 at 03:03:04PM +0100, Christian König wrote:
>>
>>                  Am 09.12.24 um 14:33 schrieb Mika Kuoppala:
>>
>>                      From: Andrzej Hajda<andrzej.hajda@intel.com>
>>
>>                      Debugger needs to read/write program's vmas including userptr_vma.
>>                      Since hmm_range_fault is used to pin userptr vmas, it is possible
>>                      to map those vmas from debugger context.
>>
>>                  Oh, this implementation is extremely questionable as well. Adding the LKML
>>                  and the MM list as well.
>>
>>                  First of all hmm_range_fault() does *not* pin anything!
>>
>>                  In other words you don't have a page reference when the function returns,
>>                  but rather just a sequence number you can check for modifications.
>>
>>              I think it's all there, holds the invalidation lock during the critical
>>              access/section, drops it when reacquiring pages, retries until it works.
>>
>>              I think the issue is more that everyone hand-rolls userptr.
>>
>>          Well that is part of the issue.
>>
>>          The general problem here is that the eudebug interface tries to simulate
>>          the memory accesses as they would have happened by the hardware.
>>
>>      Could you elaborate, what is that a problem in that, exactly?
>>
>>      It's pretty much the equivalent of ptrace() poke/peek but for GPU memory.
>>
>>
>> Exactly that here. You try to debug the GPU without taking control of the CPU
>> process.
> You seem to have a built-in expectation that the CPU threads and memory space
> must be interfered with in order to debug a completely different set of threads
> and memory space elsewhere that executes independently. I don't quite see why?

Because the GPU only gets the information it needs to execute the commands.

A simple example would be to single step through the high level shader 
code. That is usually not available to the GPU, but only to the 
application who has submitted the work.

The GPU only sees the result of the compiler from high level into low 
level assembler.

> In debugging massively parallel workloads, it's a huge drawback to be limited to
> stop all mode in GDB. If ROCm folks are fine with such limitation, I have nothing
> against them keeping that limitation. Just it was a starting design principle for
> this design to avoid such a limitation.

Well, that's the part I don't understand. Why is that a drawback?

>> This means that you have to re-implement all debug functionalities which where
>> previously invested for the CPU process for the GPU once more.
> Seems like a strawman argument. Can you list the "all interfaces" being added
> that would be possible via indirection via ptrace() beyond peek/poke?
>
>> And that in turn creates a massive attack surface for security related
>> problems, especially when you start messing with things like userptrs which
>> have a very low level interaction with core memory management.
> Again, just seems like a strawman argument. You seem to generalize to some massive
> attack surface of hypothetical interfaces which you don't list. We're talking
> about memory peek/poke here.

That peek/poke interface is more than enough to cause problems.

> Can you explain the high-level difference from security perspective for
> temporarily pinning userptr pages to write them to page tables for GPU to
> execute a dma-fence workload with and temporarily pinning pages for
> peek/poke?

If you want to access userptr imported pages from the GPU going through 
the hops of using hhm_range_fault()/get_user_pages() plus an MMU 
notifier is a must have.

For a CPU based debugging interface that isn't necessary, you can just 
look directly into the application address space with existing interfaces.

>>      And it is exactly the kind of interface that makes sense for debugger as
>>      GPU memory != CPU memory, and they don't need to align at all.
>>
>>
>> And that is what I strongly disagree on. When you debug the GPU it is mandatory
>> to gain control of the CPU process as well.
> You are free to disagree on that. I simply don't agree and have in this
> and previous email presented multiple reasons as to why not. We can
> agree to disagree on the topic.

Yeah, that's ok. I also think we can agree on that this doesn't matter 
for the discussion.

The question is rather should the userptr functionality be used for 
debugging or not.

>> The CPU process is basically the overseer of the GPU activity, so it should
>> know everything about the GPU operation, for example what a mapping actually
>> means.
> How does that relate to what is being discussed here? You just seem to
> explain how you think userspace driver should work: Maintain a shadow
> tree of each ppGTT VM layout? I don't agree on that, but I think it is
> slightly irrelevant here.

I'm trying to understand why you want to debug only the GPU without also 
attaching to the CPU process.

>> The kernel driver and the hardware only have the information necessary to
>> execute the work prepared by the CPU process. So the information available is
>> limited to begin with.
> And the point here is? Are you saying kernel does not know the actual mappings
> maintained in the GPU page tables?

The kernel knows that, the question is why does userspace don't know that?

On the other hand I have to agree that this isn't much of a problem.

If userspace really doesn't know what is mapped where in the GPU's VM 
address space then an IOCTL to query that is probably not an issue.

>>          What the debugger should probably do is to cleanly attach to the
>>          application, get the information which CPU address is mapped to which
>>          GPU address and then use the standard ptrace interfaces.
>>
>>      I don't quite agree here -- at all. "Which CPU address is mapped to
>>      which GPU address" makes no sense when the GPU address space and CPU
>>      address space is completely controlled by the userspace driver/application.
>>
>>
>> Yeah, that's the reason why you should ask the userspace driver/application for
>> the necessary information and not go over the kernel to debug things.
> What hypothetical necessary information are you referring to exactly?

What you said before: "the GPU address space and CPU address space is 
completely controlled by the userspace driver/application". When that's 
the case, then why as the kernel for help? The driver/application is in 
control.
> I already explained there are good reasons not to map all the GPU memory
> into the CPU address space.

Well I still don't fully agree to that argumentation, but compared to 
using userptr the peek/pook on a GEM handle is basically harmless.

>>      Please try to consider things outside of the ROCm architecture.
>>
>>
>> Well I consider a good part of the ROCm architecture rather broken exactly
>> because we haven't pushed back hard enough on bad ideas.
>>
>>
>>      Something like a register scratch region or EU instructions should not
>>      even be mapped to CPU address space as CPU has no business accessing it
>>      during normal operation. And backing of such region will vary per
>>      context/LRC on the same virtual address per EU thread.
>>
>>      You seem to be suggesting to rewrite even our userspace driver to behave
>>      the same way as ROCm driver does just so that we could implement debug memory
>>      accesses via ptrace() to the CPU address space.
>>
>>
>> Oh, well certainly not. That ROCm has an 1 to 1 mapping between CPU and GPU is
>> one thing I've pushed back massively on and has now proven to be problematic.
> Right, so is your claim then that instead of being 1:1 the CPU address space
> should be a superset of all GPU address spaces instead to make sure
> ptrace() can modify all memory?

Well why not? Mapping a BO and not accessing it has only minimal overhead.

We already considered to making that mandatory for TTM drivers for 
better OOM killer handling. That approach was discontinued, but 
certainly not for the overhead.

> Cause I'm slightly lost here as you don't give much reasoning, just
> claim things to be certain way.

Ok, that's certainly not what I'm trying to express.

Things don't need to be in a certain way, especially not in the way ROCm 
does things.

But you should not try to re-create GPU accesses with the CPU, 
especially when that isn't memory you have control over in the sense 
that it was allocated through your driver stack.

>>      That seems bit of a radical suggestion, especially given the drawbacks
>>      pointed out in your suggested design.
>>
>>
>>          The whole interface re-invents a lot of functionality which is already
>>          there
>>
>>      I'm not really sure I would call adding a single interface for memory
>>      reading and writing to be "re-inventing a lot of functionality".
>>
>>      All the functionality behind this interface will be needed by GPU core
>>      dumping, anyway. Just like for the other patch series.
>>
>>
>> As far as I can see exactly that's an absolutely no-go. Device core dumping
>> should *never ever* touch memory imported by userptrs.
> Could you again elaborate on what the great difference is to short term
> pinning to use in dma-fence workloads? Just the kmap?

The big difference is that the memory doesn't belong to the driver who 
is core dumping.

That is just something you have imported from the MM subsystem, e.g. 
anonymous memory and file backed mappings.

We also don't allow to mmap() dma-bufs on importing devices for similar 
reasons.

>> That's what process core dumping is good for.
> Not really sure I agree. If you do not dump the memory as seen by the
> GPU, then you need to go parsing the CPU address space in order to make
> sense which buffers were mapped where and that CPU memory contents containing
> metadata could be corrupt as we're dealing with a crashing app to begin with.
>
> Big point of relying to the information from GPU VM for the GPU memory layout
> is that it won't be corrupted by rogue memory accesses in CPU process.

Well that you don't want to use potentially corrupted information is a 
good argument, but why just not dump an information like "range 
0xabcd-0xbcde came as userptr from process 1 VMA 0x1234-0x5678" ?

A process address space is not really something a device driver should 
be messing with.

>
>>          just because you don't like the idea to attach to the debugged
>>          application in userspace.
>>
>>      A few points that have been brought up as drawback to the
>>      GPU debug through ptrace(), but to recap a few relevant ones for this
>>      discussion:
>>
>>      - You can only really support GDB stop-all mode or at least have to
>>        stop all the CPU threads while you control the GPU threads to
>>        avoid interference. Elaborated on this on the other threads more.
>>      - Controlling the GPU threads will always interfere with CPU threads.
>>        Doesn't seem feasible to single-step an EU thread while CPU threads
>>        continue to run freely?
>>
>>
>> I would say no.
> Should this be understood that you agree these are limitations of the ROCm
> debug architecture?

ROCm has a bunch of design decisions I would say we should never ever 
repeat:

1. Forcing a 1 to 1 model between GPU address space and CPU address space.

2. Using a separate file descriptor additional to the DRM render node.

3. Attaching information and context to the CPU process instead of the 
DRM render node.
....

But stopping the world, e.g. both CPU and GPU threads if you want to 
debug something is not one of the problematic decisions.

That's why I'm really surprised that you insist so much on that.

>>      - You are very much restricted by the CPU VA ~ GPU VA alignment
>>        requirement, which is not true for OpenGL or Vulkan etc. Seems
>>        like one of the reasons why ROCm debugging is not easily extendable
>>        outside compute?
>>
>>
>> Well as long as you can't take debugged threads from the hardware you can
>> pretty much forget any OpenGL or Vulkan debugging with this interface since it
>> violates the dma_fence restrictions in the kernel.
> Agreed. However doesn't mean because you can't do it right now, you you should
> design an architecture that actively prevents you from doing that in the future.

Good point. That's what I can totally agree on as well.

>>      - You have to expose extra memory to CPU process just for GPU
>>        debugger access and keep track of GPU VA for each. Makes the GPU more
>>        prone to OOB writes from CPU. Exactly what not mapping the memory
>>        to CPU tried to protect the GPU from to begin with.
>>
>>
>>          As far as I can see this whole idea is extremely questionable. This
>>          looks like re-inventing the wheel in a different color.
>>
>>      I see it like reinventing a round wheel compared to octagonal wheel.
>>
>>      Could you elaborate with facts much more on your position why the ROCm
>>      debugger design is an absolute must for others to adopt?
>>
>>
>> Well I'm trying to prevent some of the mistakes we did with the ROCm design.
> Well, I would say that the above limitations are direct results of the ROCm
> debugging design. So while we're eager to learn about how you perceive
> GPU debugging should work, would you mind addressing the above
> shortcomings?

Yeah, absolutely. That you don't have a 1 to 1 mapping on the GPU is a 
step in the right direction if you ask me.

>> And trying to re-invent well proven kernel interfaces is one of the big
>> mistakes made in the ROCm design.
> Appreciate the feedback. Please work on the representation a bit as it currently
> doesn't seem very helpful but appears just as an attempt to try to throw a spanner
> in the works.
>
>> If you really want to expose an interface to userspace
> To a debugger process, enabled only behind a flag.
>
>> which walks the process
>> page table, installs an MMU notifier
> This part is already done to put an userptr to the GPU page tables to
> begin with. So hopefully not too controversial.
>
>> kmaps the resulting page
> In addition to having it in the page tables where GPU can access it.
>
>> and then memcpy
>> to/from it then you absolutely *must* run that by guys like Christoph Hellwig,
>> Andrew and even Linus.
> Surely, that is why we're seeking out for review.
>
> We could also in theory use an in-kernel GPU context on the GPU hardware for
> doing the peek/poke operations on userptr.

Yeah, I mean that should clearly work out. We have something similar.

> But that seems like a high-overhead thing to do due to the overhead of
> setting up a transfer per data word and going over the PCI bus twice
> compared to accessing the memory directly by CPU when it trivially can.

Understandable, but that will create another way of accessing process 
memory.

Regards,
Christian.

>
> So this is the current proposal.
>
> Regards, Joonas
>
>> I'm pretty sure that those guys will note that a device driver should
>> absolutely not mess with such stuff.
>>
>> Regards,
>> Christian.
>>
>>
>>      Otherwise it just looks like you are trying to prevent others from
>>      implementing a more flexible debugging interface through vague comments about
>>      "questionable design" without going into details. Not listing much concrete
>>      benefits nor addressing the very concretely expressed drawbacks of your
>>      suggested design, makes it seem like a very biased non-technical discussion.
>>
>>      So while review interest and any comments are very much appreciated, please
>>      also work on providing bit more reasoning and facts instead of just claiming
>>      things. That'll help make the discussion much more fruitful.
>>
>>      Regards, Joonas
>>
>>

--------------Yto28ho8LVN1gG5fo1aSYds4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 10.12.24 um 12:57 schrieb Joonas Lahtinen:<br>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">Quoting Christian König (2024-12-10 12:00:48)
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 10.12.24 um 10:33 schrieb Joonas Lahtinen:

    Quoting Christian König (2024-12-09 17:42:32)

        Am 09.12.24 um 16:31 schrieb Simona Vetter:

            On Mon, Dec 09, 2024 at 03:03:04PM +0100, Christian König wrote:

                Am 09.12.24 um 14:33 schrieb Mika Kuoppala:

                    From: Andrzej Hajda <a class="moz-txt-link-rfc2396E" href="mailto:andrzej.hajda@intel.com">&lt;andrzej.hajda@intel.com&gt;</a>

                    Debugger needs to read/write program's vmas including userptr_vma.
                    Since hmm_range_fault is used to pin userptr vmas, it is possible
                    to map those vmas from debugger context.

                Oh, this implementation is extremely questionable as well. Adding the LKML
                and the MM list as well.

                First of all hmm_range_fault() does *not* pin anything!

                In other words you don't have a page reference when the function returns,
                but rather just a sequence number you can check for modifications.

            I think it's all there, holds the invalidation lock during the critical
            access/section, drops it when reacquiring pages, retries until it works.

            I think the issue is more that everyone hand-rolls userptr.

        Well that is part of the issue.

        The general problem here is that the eudebug interface tries to simulate
        the memory accesses as they would have happened by the hardware.

    Could you elaborate, what is that a problem in that, exactly?

    It's pretty much the equivalent of ptrace() poke/peek but for GPU memory.


Exactly that here. You try to debug the GPU without taking control of the CPU
process.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You seem to have a built-in expectation that the CPU threads and memory space
must be interfered with in order to debug a completely different set of threads
and memory space elsewhere that executes independently. I don't quite see why?</pre>
    </blockquote>
    <br>
    Because the GPU only gets the information it needs to execute the
    commands.<br>
    <br>
    A simple example would be to single step through the high level
    shader code. That is usually not available to the GPU, but only to
    the application who has submitted the work.<br>
    <br>
    The GPU only sees the result of the compiler from high level into
    low level assembler.<br>
    <br>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">In debugging massively parallel workloads, it's a huge drawback to be limited to
stop all mode in GDB. If ROCm folks are fine with such limitation, I have nothing
against them keeping that limitation. Just it was a starting design principle for
this design to avoid such a limitation.</pre>
    </blockquote>
    <br>
    Well, that's the part I don't understand. Why is that a drawback?<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This means that you have to re-implement all debug functionalities which where
previously invested for the CPU process for the GPU once more.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Seems like a strawman argument. Can you list the &quot;all interfaces&quot; being added
that would be possible via indirection via ptrace() beyond peek/poke?

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">And that in turn creates a massive attack surface for security related
problems, especially when you start messing with things like userptrs which
have a very low level interaction with core memory management.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Again, just seems like a strawman argument. You seem to generalize to some massive
attack surface of hypothetical interfaces which you don't list. We're talking
about memory peek/poke here.</pre>
    </blockquote>
    <br>
    That peek/poke interface is more than enough to cause problems.<br>
    <br>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">Can you explain the high-level difference from security perspective for
temporarily pinning userptr pages to write them to page tables for GPU to
execute a dma-fence workload with and temporarily pinning pages for
peek/poke?</pre>
    </blockquote>
    <br>
    If you want to access userptr imported pages from the GPU going
    through the hops of using hhm_range_fault()/get_user_pages() plus an
    MMU notifier is a must have.<br>
    <br>
    For a CPU based debugging interface that isn't necessary, you can
    just look directly into the application address space with existing
    interfaces.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">    And it is exactly the kind of interface that makes sense for debugger as
    GPU memory != CPU memory, and they don't need to align at all.


And that is what I strongly disagree on. When you debug the GPU it is mandatory
to gain control of the CPU process as well.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You are free to disagree on that. I simply don't agree and have in this
and previous email presented multiple reasons as to why not. We can
agree to disagree on the topic.</pre>
    </blockquote>
    <br>
    Yeah, that's ok. I also think we can agree on that this doesn't
    matter for the discussion.<br>
    <br>
    The question is rather should the userptr functionality be used for
    debugging or not.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">The CPU process is basically the overseer of the GPU activity, so it should
know everything about the GPU operation, for example what a mapping actually
means.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
How does that relate to what is being discussed here? You just seem to
explain how you think userspace driver should work: Maintain a shadow
tree of each ppGTT VM layout? I don't agree on that, but I think it is
slightly irrelevant here.</pre>
    </blockquote>
    <br>
    I'm trying to understand why you want to debug only the GPU without
    also attaching to the CPU process.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">The kernel driver and the hardware only have the information necessary to
execute the work prepared by the CPU process. So the information available is
limited to begin with.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
And the point here is? Are you saying kernel does not know the actual mappings
maintained in the GPU page tables?</pre>
    </blockquote>
    <br>
    The kernel knows that, the question is why does userspace don't know
    that?<br>
    <br>
    On the other hand I have to agree that this isn't much of a problem.<br>
    <br>
    If userspace really doesn't know what is mapped where in the GPU's
    VM address space then an IOCTL to query that is probably not an
    issue.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">        What the debugger should probably do is to cleanly attach to the
        application, get the information which CPU address is mapped to which
        GPU address and then use the standard ptrace interfaces.

    I don't quite agree here -- at all. &quot;Which CPU address is mapped to
    which GPU address&quot; makes no sense when the GPU address space and CPU
    address space is completely controlled by the userspace driver/application.


Yeah, that's the reason why you should ask the userspace driver/application for
the necessary information and not go over the kernel to debug things.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What hypothetical necessary information are you referring to exactly?</pre>
    </blockquote>
    <br>
    What you said before: &quot;<span style="white-space: pre-wrap">the GPU address space and CPU </span><span style="white-space: pre-wrap">address space is completely controlled by the userspace driver/application&quot;.

When that's the case, then why as the kernel for help? The driver/application is in control.

</span>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">I already explained there are good reasons not to map all the GPU memory
into the CPU address space.</pre>
    </blockquote>
    <br>
    Well I still don't fully agree to that argumentation, but compared
    to using userptr the peek/pook on a GEM handle is basically
    harmless.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">    Please try to consider things outside of the ROCm architecture.


Well I consider a good part of the ROCm architecture rather broken exactly
because we haven't pushed back hard enough on bad ideas.


    Something like a register scratch region or EU instructions should not
    even be mapped to CPU address space as CPU has no business accessing it
    during normal operation. And backing of such region will vary per
    context/LRC on the same virtual address per EU thread.

    You seem to be suggesting to rewrite even our userspace driver to behave
    the same way as ROCm driver does just so that we could implement debug memory
    accesses via ptrace() to the CPU address space.


Oh, well certainly not. That ROCm has an 1 to 1 mapping between CPU and GPU is
one thing I've pushed back massively on and has now proven to be problematic.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Right, so is your claim then that instead of being 1:1 the CPU address space
should be a superset of all GPU address spaces instead to make sure
ptrace() can modify all memory?</pre>
    </blockquote>
    <br>
    Well why not? Mapping a BO and not accessing it has only minimal
    overhead.<br>
    <br>
    We already considered to making that mandatory for TTM drivers for
    better OOM killer handling. That approach was discontinued, but
    certainly not for the overhead.<br>
    <br>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">Cause I'm slightly lost here as you don't give much reasoning, just
claim things to be certain way.</pre>
    </blockquote>
    <br>
    Ok, that's certainly not what I'm trying to express.<br>
    <br>
    Things don't need to be in a certain way, especially not in the way
    ROCm does things.<br>
    <br>
    But you should not try to re-create GPU accesses with the CPU,
    especially when that isn't memory you have control over in the sense
    that it was allocated through your driver stack.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">    That seems bit of a radical suggestion, especially given the drawbacks
    pointed out in your suggested design.


        The whole interface re-invents a lot of functionality which is already
        there

    I'm not really sure I would call adding a single interface for memory
    reading and writing to be &quot;re-inventing a lot of functionality&quot;.

    All the functionality behind this interface will be needed by GPU core
    dumping, anyway. Just like for the other patch series.


As far as I can see exactly that's an absolutely no-go. Device core dumping
should *never ever* touch memory imported by userptrs.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Could you again elaborate on what the great difference is to short term
pinning to use in dma-fence workloads? Just the kmap?</pre>
    </blockquote>
    <br>
    The big difference is that the memory doesn't belong to the driver
    who is core dumping.<br>
    <br>
    That is just something you have imported from the MM subsystem, e.g.
    anonymous memory and file backed mappings.<br>
    <br>
    We also don't allow to mmap() dma-bufs on importing devices for
    similar reasons.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">That's what process core dumping is good for.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Not really sure I agree. If you do not dump the memory as seen by the
GPU, then you need to go parsing the CPU address space in order to make
sense which buffers were mapped where and that CPU memory contents containing
metadata could be corrupt as we're dealing with a crashing app to begin with.

Big point of relying to the information from GPU VM for the GPU memory layout
is that it won't be corrupted by rogue memory accesses in CPU process.</pre>
    </blockquote>
    <br>
    Well that you don't want to use potentially corrupted information is
    a good argument, but why just not dump an information like &quot;range
    0xabcd-0xbcde came as userptr from process 1 VMA 0x1234-0x5678&quot; ?<br>
    <br>
    A process address space is not really something a device driver
    should be messing with.<br>
    <br>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">        just because you don't like the idea to attach to the debugged
        application in userspace.

    A few points that have been brought up as drawback to the
    GPU debug through ptrace(), but to recap a few relevant ones for this
    discussion:

    - You can only really support GDB stop-all mode or at least have to
      stop all the CPU threads while you control the GPU threads to
      avoid interference. Elaborated on this on the other threads more.
    - Controlling the GPU threads will always interfere with CPU threads.
      Doesn't seem feasible to single-step an EU thread while CPU threads
      continue to run freely?


I would say no.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Should this be understood that you agree these are limitations of the ROCm
debug architecture?</pre>
    </blockquote>
    <br>
    ROCm has a bunch of design decisions I would say we should never
    ever repeat:<br>
    <br>
    1. Forcing a 1 to 1 model between GPU address space and CPU address
    space.<br>
    <br>
    2. Using a separate file descriptor additional to the DRM render
    node.<br>
    <br>
    3. Attaching information and context to the CPU process instead of
    the DRM render node.<br>
    ....<br>
    <br>
    But stopping the world, e.g. both CPU and GPU threads if you want to
    debug something is not one of the problematic decisions.<br>
    <br>
    That's why I'm really surprised that you insist so much on that.<br>
    <br>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">    - You are very much restricted by the CPU VA ~ GPU VA alignment
      requirement, which is not true for OpenGL or Vulkan etc. Seems
      like one of the reasons why ROCm debugging is not easily extendable
      outside compute?


Well as long as you can't take debugged threads from the hardware you can
pretty much forget any OpenGL or Vulkan debugging with this interface since it
violates the dma_fence restrictions in the kernel.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Agreed. However doesn't mean because you can't do it right now, you you should
design an architecture that actively prevents you from doing that in the future.</pre>
    </blockquote>
    <br>
    Good point. That's what I can totally agree on as well.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">    - You have to expose extra memory to CPU process just for GPU
      debugger access and keep track of GPU VA for each. Makes the GPU more
      prone to OOB writes from CPU. Exactly what not mapping the memory
      to CPU tried to protect the GPU from to begin with.


        As far as I can see this whole idea is extremely questionable. This
        looks like re-inventing the wheel in a different color.

    I see it like reinventing a round wheel compared to octagonal wheel.

    Could you elaborate with facts much more on your position why the ROCm
    debugger design is an absolute must for others to adopt?


Well I'm trying to prevent some of the mistakes we did with the ROCm design.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well, I would say that the above limitations are direct results of the ROCm
debugging design. So while we're eager to learn about how you perceive
GPU debugging should work, would you mind addressing the above
shortcomings?</pre>
    </blockquote>
    <br>
    Yeah, absolutely. That you don't have a 1 to 1 mapping on the GPU is
    a step in the right direction if you ask me.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">And trying to re-invent well proven kernel interfaces is one of the big
mistakes made in the ROCm design.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Appreciate the feedback. Please work on the representation a bit as it currently
doesn't seem very helpful but appears just as an attempt to try to throw a spanner
in the works.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">If you really want to expose an interface to userspace
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
To a debugger process, enabled only behind a flag.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">which walks the process
page table, installs an MMU notifier
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This part is already done to put an userptr to the GPU page tables to
begin with. So hopefully not too controversial.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">kmaps the resulting page
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
In addition to having it in the page tables where GPU can access it.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">and then memcpy
to/from it then you absolutely *must* run that by guys like Christoph Hellwig,
Andrew and even Linus.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Surely, that is why we're seeking out for review.

We could also in theory use an in-kernel GPU context on the GPU hardware for
doing the peek/poke operations on userptr.</pre>
    </blockquote>
    <br>
    Yeah, I mean that should clearly work out. We have something
    similar.<br>
    <br>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">But that seems like a high-overhead thing to do due to the overhead of
setting up a transfer per data word and going over the PCI bus twice
compared to accessing the memory directly by CPU when it trivially can.</pre>
    </blockquote>
    <br>
    Understandable, but that will create another way of accessing
    process memory.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">

So this is the current proposal.

Regards, Joonas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
I'm pretty sure that those guys will note that a device driver should
absolutely not mess with such stuff.

Regards,
Christian.


    Otherwise it just looks like you are trying to prevent others from
    implementing a more flexible debugging interface through vague comments about
    &quot;questionable design&quot; without going into details. Not listing much concrete
    benefits nor addressing the very concretely expressed drawbacks of your
    suggested design, makes it seem like a very biased non-technical discussion.

    So while review interest and any comments are very much appreciated, please
    also work on providing bit more reasoning and facts instead of just claiming
    things. That'll help make the discussion much more fruitful.

    Regards, Joonas


</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------Yto28ho8LVN1gG5fo1aSYds4--
