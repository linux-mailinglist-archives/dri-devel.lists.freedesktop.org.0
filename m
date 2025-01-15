Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AA4A12521
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 14:45:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816C910E698;
	Wed, 15 Jan 2025 13:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aqyuT2iY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1BC10E698
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 13:45:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fv9YDJs3imkBrjqXv4Pxb0FbYqYrKoWyqlqVnerTo2If9NTnKulwpvuv0or7p9GSLtMytod5jg/JfK6C4j5xJkc9+6JE4687EinvrxhL8cQvZ/emAuNTyc7VKz2jRehplhtjUb1Th7Dy0SiH5S/bIoHzUBKBb1fpq0Ga5QG8SO1bYoYRUjLvZjQFt+ElCiI2OAjyNzXrWn91etyrmZJiDXl7fxUCEU5kWf/wvSqJ3bZUX4IntRovhU4/swFAVueluN91kxzl0DhV3cXcXo01Nyn+yxsrSQ0LCpnNsukLgC69sX/w+niQVPyeO/alXHfbJvnmEUwPpinKOEdPifVNew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxAwCZ87IOnmEZornajrcjbam0tMX8Ku6ZkisETplbk=;
 b=cPtJ6216i83shk2KYoG7k3oSMVQh4JI0rg7ZJ5QnHr5fb1Plon5acbK15cFNqMZN5LbT6Nvgjxm6gIqpih7YxVyZyQ9FDG+OiFjmGU64/lAbwocb0Rwk1JvDHMzkEEEF21u/x2qBZLhNNKZsPRf9HwrjE7PFBjrzbh6e+oeVS1yqy/p0up6x7owCtjW04KXQVT3uG2gS0Gb+8bvIq/rkuP7C/lH/nL/HdHUGSX3Fb1PZR3GXPkf4S2fBTBPi/IPKglw1rsPs0gAkn6OaYkn3IgNnWkvyyR6qCjtu7dkarx+2oC7aolIL1eEp+KYbs1J8LtQuq5IlbpEkmi+gm5Uukg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxAwCZ87IOnmEZornajrcjbam0tMX8Ku6ZkisETplbk=;
 b=aqyuT2iYGMwehv1C8GKEwRJYE/bzary9EYVFzXduhqe8i3nyQ/jtqNQ29qHYXu5rbwLVeXgmYDjHdVBAzm72Q1d5Vj5ett28t5NEftnyiTc3zRQC58x+FPlF4F9AppMpH8i3r7PTY34aqpsLc3yIvGc4x4AyScmKNNNya7EnzaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5740.namprd12.prod.outlook.com (2603:10b6:208:373::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 13:45:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 13:45:24 +0000
Content-Type: multipart/alternative;
 boundary="------------Avi86ny3nb5z5eKoNn0oqdnl"
Message-ID: <f6c2524f-5ef5-4c2c-a464-a7b195e0bf6c@amd.com>
Date: Wed, 15 Jan 2025 14:45:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
References: <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com> <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <c823f70c-9b70-441c-b046-71058c315857@amd.com>
 <20250110205454.GM5556@nvidia.com>
 <d213eee7-0501-4a63-9dfe-b431408c4c37@amd.com>
 <20250115133821.GO5556@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250115133821.GO5556@nvidia.com>
X-ClientProxiedBy: FR5P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: 764cc6d2-1224-4f84-f74b-08dd356adcab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L01vQ1poNUJLc3BRcTNUMVhwbVA0T1oxNlBqTnRqMm9rb2tJSFVoUGcwOWJk?=
 =?utf-8?B?ZEVyRWEya051RXpKWkFYUmhOWEkwaVI5L0hwRHFFZUV1NERtNzRvVkZaQTZU?=
 =?utf-8?B?czlPRTBFTGxoclRCTGZ3NS93ZEZBNjZxOG9YM09YYld4dFU4ZTRZbWFMMWd1?=
 =?utf-8?B?UlFvU0syWG1majdNQ0NIK1Y4Vm1BU1NlYlBBYjJOdnJyenFwYm84dTUybm5Q?=
 =?utf-8?B?SjdiSUhQaS91d0QvTThtTFJrUVhjQmhJOW95MDNuWjlKS095a1hTTmZRUTJz?=
 =?utf-8?B?SitYLzhuTGxGekJ6NERtQTYrWklJM0EzaC9hQVlYbUd1VHkrL0hMVGZDb3ZG?=
 =?utf-8?B?eVZWTFp2RE5NRTNsUThVWnZxVU1rQURkbzZvMU01UmtraFRJekdKWEJ2eGhQ?=
 =?utf-8?B?ZkFqSnE0TjVBOXphdkFXeThZM0NxZllXTThWQWF0VHBPTFRvWU9JdTBpVlRh?=
 =?utf-8?B?VVVmeGVjUXNLQm05R2VIeUlBbk5YVWI4QXU5RHZ4RDB3eFhlY1RsOGJtMjlu?=
 =?utf-8?B?K3BoMnJqVnQvdW9vSE9RSStka2RVTVFYd1NGRE1CY1BuemFLM25zMG8wQitC?=
 =?utf-8?B?QitvVHBMeHFCZlArWTBCS3Y2MlFrK2JtU1Jva3V1c1NZcmU0WUR1Qi9XZzFw?=
 =?utf-8?B?dmdEVHZxVkVTRjNOcDVzZG1qRnl5ZVdIQXR6VmJxeGFWWEtjSGNGYlIzYjY1?=
 =?utf-8?B?bTNDTkNTTzBKNVdVSExCVjRqQVVyb25MUUs5bm16YkNrbnhlOStzU0o2ZmVD?=
 =?utf-8?B?cU1Tb2N3cFVub2YrNEZnaEROdit3ckJwRTBRdCsyd0dIbng0N2VQNUdJMVBi?=
 =?utf-8?B?dVZuVHVLNWtUSm5Od0IyMlNQa0hqU0lkMkZRa1hDZThBMmFpZWUxcUV0OFpJ?=
 =?utf-8?B?a0VsLy9qV2cwRVRNd1RHSWplSngyVGZ5MWhoVUNLZ1hQMktVYjlNWXZKWVVt?=
 =?utf-8?B?cURqeTBVanQvZ3FiUmRoOGhSOHZGRm1nVWI1TnVWNk5HZDR5azcvTm96bEF5?=
 =?utf-8?B?ampXQklTK0NiOHMydEw5VUFLK0Rpc3pZRk1uOVMyK2tQdGpaWXcxYUlSTDcx?=
 =?utf-8?B?TUoycWtGVkl0bC9rYnVpVUdzdGJFcUNPdml0UGdteW5hcm1HeG4rYjZ4WStP?=
 =?utf-8?B?aS9Kckd5b3FWeSs1bXVLVTZPY2NiM1pybWFzRmZTdmdCRHlrZkZrbHpHL1Q4?=
 =?utf-8?B?Sll2VmExUVpQbmFhRlBDSW5OSVkyL0JsQjV0dWs5czd2eEdTZHAxM0g3WGVT?=
 =?utf-8?B?N0ZrZ29LeVovWmt0NnBoU1IwTVYwaVZ6RXU5QStSc0hycTZpQVNxVzdPelRQ?=
 =?utf-8?B?ZW5pTStwdUpxa2pXcy9nTXRqaG9WNHZWaWk0NDZ1NGVQV3Azd1o5UUlpMTlK?=
 =?utf-8?B?WUlkMUxUUWNiUHlqekRMY1NLaTJtSlhramlkRXZUaEV3bmIvSk9jRVZyaUpn?=
 =?utf-8?B?MUl2TzN1ZFptV1RWRTJOVjNxbFRHeDUzaWp0RW5Ba1hZenVlWHZsWWJoRmlY?=
 =?utf-8?B?ZTU4dlpaczI0NFN5ZTg5TTJoUElDNEcyWjl6ZDdCSVJJQmt6dTRtQ2xTOVBh?=
 =?utf-8?B?YnNSUjh4QmhoK3dnQ0V2d0syQWxuUlpxKzRXZnhVMmhWQmxoZXJQaVJhWDVE?=
 =?utf-8?B?QXVZRWRDckRkQzl4T001dFl4Q2tMckdWb3BSL3RBNDlQL0dVNWFLUFVGRTJN?=
 =?utf-8?B?UktJaEpEckhud1hKRENmeTRLTVJJd3lHclladmJsbmJoSlFTZkJmak8vakpM?=
 =?utf-8?B?WCtmWWxzTE1MY2kweWlLeGRiRHI1T2Rjc3JxVytGT2c1d3cyR2ZhQ2ZEZHJC?=
 =?utf-8?B?WDVXUEs1cVFqM2xwRDBUQzhzbjc5ZkFGM1RWTjRhSEtHV2RVL0RtenRIWDBR?=
 =?utf-8?Q?CJIuA5O3rfxVE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU5YU1E0S2xqMHpEdnM4akppWm9RckpsdCs0cEVqSklaQ2cyYUE1RngvL3dH?=
 =?utf-8?B?RlVsbllsTW1LSitlSmMvNEZPemlBTUVDS2RHbzRIOEJkaStwclB1QlVKOTcv?=
 =?utf-8?B?U3VlbEZPQjNvaDJucEFkRGtPd1VyaUFBRHZSR2NiTzFpVjlMSVBaOEJIcG94?=
 =?utf-8?B?QWcwOVcvUUpxUi9UY0krWFB5bGdSMitvWVlJT01OMC9SZUVTUjJpaS9Gb0gy?=
 =?utf-8?B?b0dKS25iay8yOWQramdOUFhRTUtydW4wYVdFVC9JQUpLdUxlaHFaaDdlUGRD?=
 =?utf-8?B?VzlIU3FhQ2owZnBQaElKaDJwNzVLM2xsZTd3cEFmNXVLTFlGTzliRTV0Nm44?=
 =?utf-8?B?Wk1vekZUc0NwZ2JZUGl3Y3lKRnZsSldFN1pKRUxiMW9iazBMTWo5UThBbXl0?=
 =?utf-8?B?Ynd5dHNlKzZtK25WM0U5N0Q2bGo3eVhYTW4rRnVORWhGZ3JUQXBQSWQ4aExC?=
 =?utf-8?B?dldPS3VLWjFxTm5SRitoM3owNTFwQmluOWRaczRQTWtGVXRiNGJCV3c0aVh5?=
 =?utf-8?B?MFNZKzBLSHIwVmRER3hCUk9kU2NlcTJIMy9TYXZZVGRZcHhUZkd4NnpPTnRO?=
 =?utf-8?B?ZVR4WG01NzRJZ3RITmxQNVcwWVkwcUlwYXptK3pra0R5MVRwK0t5Nm0rbCtJ?=
 =?utf-8?B?U0xrUU1ldVhWV1JQYXI3OUZPbTlPT0dIcTJVTWNKSWlUYXVDMStiRDQvbkhD?=
 =?utf-8?B?ZVlFSmZ6c3UvdmMvZ255VmZidWkxbjFKOER4Zm1lMFFqcDZ2cFZpajdGdWRV?=
 =?utf-8?B?cGlxeVE3bVU2NTJpdUhQVTlRMWFXNkx6czgxSEVrYlNDN05QWkNraWZ3eHFQ?=
 =?utf-8?B?WTA5T3Z3aWNXZk15OE4zMWw3WXZnenJCbUNuZktEMHloam5sL1VFUGgrMFE2?=
 =?utf-8?B?SDhJZDMwek9TRlM4eGF6Wkt4SEtwRDh4RHlnOWJrSlNYSVBtYk4rTitCWVp0?=
 =?utf-8?B?K0Y5cnJVRm5wTnoxcEJ6WXpHMkphZXM0QnorUEwyTkcwclJSUEdnZ0E0MDE5?=
 =?utf-8?B?RjAwUkFsWS9uNGZlZEU5d0ZSUEMrYmNhRjFyK0xFcEV6dEtoRVVEa3RFR0hE?=
 =?utf-8?B?c0xxUldNMWVKSmthSStYaVZDRStWNDZLZHpMWTRETkpIblU5T2ZzYWMrb0Vv?=
 =?utf-8?B?RGM5TnhPOENxMDRwaDNLRy9PeXRnc2xzUXk3R0dWM1ZhNCt6bytlZnJ0a1Ru?=
 =?utf-8?B?THcrM3FUMkl0U1lJcGMxK0t0WlBJcy9SRDhHS0JTcjM0VE1mb1JwVW56bnFG?=
 =?utf-8?B?aEgzcldSRzN6a2U2eGx0Q0gwQ214cUUyWnJrdllWY0dHaW9haXhmMW5mWDRE?=
 =?utf-8?B?Mi9UT0prMkJrTzRxSGwzVFRvL2Z0WmtvNURPNWZsNll1R2wzbk5rekRWTkEx?=
 =?utf-8?B?TE1EQzZ4OHJ4ZFkxMDV6R3dHcCtJcWloS3dFK0RDaVV5dk82Q2ZDOE5PK1JX?=
 =?utf-8?B?Tm0yK0NQYXlsOWt5eVJLZVJRbXBLeStkM2Fjd0JjOXQ0VXA4bHVCcEFuZ0RO?=
 =?utf-8?B?UTc4Y01RTkpDS0RKK2RkVHFUTjRPN1hRYXhHQlJteWFOL3M1dVladU9GN05R?=
 =?utf-8?B?V2hHKzVkMkE0Z2g3YTdxQkdNeS9rc0g2YlYwMTdoeFNXNU5xRExjcGluNXhX?=
 =?utf-8?B?RGZ0MVU3OUl1SnovN0o1eTVINjVYa2lSK1ZmNkFTU0lsSXlqRFZISmxJak9C?=
 =?utf-8?B?SWR4REk3Smp2cWRUZUNxZzBacmJ6bDFmaHh1M3JlNG1PSmd5NE9qWXc3TXNz?=
 =?utf-8?B?dGtIQU80UlBiMExVL042RWZUMzB3eERXbGFtaUhVKzZnZHgvZzhybHVWN3Rn?=
 =?utf-8?B?SThhYk9lRHMwYThDaVpaaEdyNUIxTDJTNEJMZU5CZXlQNGs3MDB6ZEVyTmZv?=
 =?utf-8?B?TVRxNDQzak4ya2h5UE5md3crZzJqRkFOQkpLN1ZJckJKSFVzYW9sa1gzdjFi?=
 =?utf-8?B?RElYZTRHbUp0aElsL0UzVUNsMkN5eFE1ekZ1WDNOR3psNllZaUZabGMrdFNy?=
 =?utf-8?B?WFJLMExZM2N5bFlnMVFYR21tVmNnUmVkbnNUWkZxWVJORGphODFrSy9EakYw?=
 =?utf-8?B?bys3b0lyWXBWMC9mQ0lJdGF6eG9LWTllU0djSUVNMklPdmlyMXdyaWRMRVV1?=
 =?utf-8?Q?CgreerbU2vFy0InoKCEfkZcnD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 764cc6d2-1224-4f84-f74b-08dd356adcab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 13:45:24.3081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W30Z/SLH4cJOkkLLdNu6ED9ZLBgwmzp7V9oFTrAf2C1mApjT2zFUTTOm+RsrBq+B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5740
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

--------------Avi86ny3nb5z5eKoNn0oqdnl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 15.01.25 um 14:38 schrieb Jason Gunthorpe:
> On Wed, Jan 15, 2025 at 10:38:00AM +0100, Christian König wrote:
>> Am 10.01.25 um 21:54 schrieb Jason Gunthorpe:
>>> [SNIP]
>>>>> I don't fully understand your use case, but I think it's quite likely
>>>>> that we already have that working.
>>> In Intel CC systems you cannot mmap secure memory or the system will
>>> take a machine check.
>>>
>>> You have to convey secure memory inside a FD entirely within the
>>> kernel so that only an importer that understands how to handle secure
>>> memory (such as KVM) is using it to avoid machine checking.
>>>
>>> The patch series here should be thought of as the first part of this,
>>> allowing PFNs to flow without VMAs. IMHO the second part of preventing
>>> machine checks is not complete.
>>>
>>> In the approach I have been talking about the secure memory would be
>>> represented by a p2p_provider structure that is incompatible with
>>> everything else. For instance importers that can only do DMA would
>>> simply cleanly fail when presented with this memory.
>> That's a rather interesting use case, but not something I consider fitting
>> for the DMA-buf interface.
> To recast the problem statement, it is basically the same as your
> device private interconnects. There are certain devices that
> understand how to use this memory, and if they work together they can
> access it.
>   
>> See DMA-buf in meant to be used between drivers to allow DMA access on
>> shared buffers.
> They are shared, just not with everyone :)
>   
>> What you try to do here instead is to give memory in the form of a file
>> descriptor to a client VM to do things like CPU mapping and giving it to
>> drivers to do DMA etc...
> How is this paragraph different from the first? It is a shared buffer
> that we want real DMA and CPU "DMA" access to. It is "private" so
> things that don't understand the interconnect rules cannot access it.

Yeah, but it's private to the exporter. And a very fundamental rule of 
DMA-buf is that the exporter is the one in control of things.

So for example it is illegal for an importer to setup CPU mappings to a 
buffer. That's why we have dma_buf_mmap() which redirects mmap() 
requests from the importer to the exporter.

In your use case here the importer wants to be in control and do things 
like both CPU as well as DMA mappings.

As far as I can see that is really not an use case which fits DMA-buf in 
any way.

>> That sounds more something for the TEE driver instead of anything DMA-buf
>> should be dealing with.
> Has nothing to do with TEE.

Why?

Regards,
Christian.

>
> Jason

--------------Avi86ny3nb5z5eKoNn0oqdnl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 15.01.25 um 14:38 schrieb Jason Gunthorpe:<br>
    <blockquote type="cite" cite="mid:20250115133821.GO5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Jan 15, 2025 at 10:38:00AM +0100, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 10.01.25 um 21:54 schrieb Jason Gunthorpe:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">[SNIP]
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">I don't fully understand your use case, but I think it's quite likely
that we already have that working.
</pre>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">In Intel CC systems you cannot mmap secure memory or the system will
take a machine check.

You have to convey secure memory inside a FD entirely within the
kernel so that only an importer that understands how to handle secure
memory (such as KVM) is using it to avoid machine checking.

The patch series here should be thought of as the first part of this,
allowing PFNs to flow without VMAs. IMHO the second part of preventing
machine checks is not complete.

In the approach I have been talking about the secure memory would be
represented by a p2p_provider structure that is incompatible with
everything else. For instance importers that can only do DMA would
simply cleanly fail when presented with this memory.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
That's a rather interesting use case, but not something I consider fitting
for the DMA-buf interface.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
To recast the problem statement, it is basically the same as your
device private interconnects. There are certain devices that
understand how to use this memory, and if they work together they can
access it.
 
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">See DMA-buf in meant to be used between drivers to allow DMA access on
shared buffers.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
They are shared, just not with everyone :)
 
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">What you try to do here instead is to give memory in the form of a file
descriptor to a client VM to do things like CPU mapping and giving it to
drivers to do DMA etc...
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
How is this paragraph different from the first? It is a shared buffer
that we want real DMA and CPU &quot;DMA&quot; access to. It is &quot;private&quot; so
things that don't understand the interconnect rules cannot access it.</pre>
    </blockquote>
    <br>
    Yeah, but it's private to the exporter. And a very fundamental rule
    of DMA-buf is that the exporter is the one in control of things.<br>
    <br>
    So for example it is illegal for an importer to setup CPU mappings
    to a buffer. That's why we have dma_buf_mmap() which redirects
    mmap() requests from the importer to the exporter.<br>
    <br>
    In your use case here the importer wants to be in control and do
    things like both CPU as well as DMA mappings.<br>
    <br>
    As far as I can see that is really not an use case which fits
    DMA-buf in any way.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250115133821.GO5556@nvidia.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">That sounds more something for the TEE driver instead of anything DMA-buf
should be dealing with.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Has nothing to do with TEE.</pre>
    </blockquote>
    <br>
    Why?<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:20250115133821.GO5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">

Jason
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------Avi86ny3nb5z5eKoNn0oqdnl--
