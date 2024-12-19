Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151B49F792B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 11:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB63F10E47C;
	Thu, 19 Dec 2024 10:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N6QYat7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2977610E47C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 10:05:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3WPhU/PKZGaqAX8CIjc9bvRqaSEN+Y4ddJMr3QRkdyS2d5SAUSa7FXvpSoysEOAABzhFGneqsaEPBtGlUGnWzzHnOQeVm9Xue8EvrJvGFLIao2UVGs96fB5kVgGEedT4f3k61DOq75nVRVO8AwqRE0sHecjoru35V8PTkYO9K5kQdEPmgmrBWE5aSHTv2pNJtxXC0HUI15+lANaK9L2adQnbin9oPHhGt2E6ezpFY5aDvMlWpJSEDzAUcN7sEvIYAhww4qeSnpWogIV0dPIK7+Dd1j1EjSMZEjf1enovihCvwQSwVK3RtO2W9PbxaGIZ5xHZHjNmdSwgVALElBSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrhVgELc4+fMdYOjNRQFK4yMPY0kvqIpaEjvGLp6nSE=;
 b=AftK3Mh4D1qDMdPg1MkMZp5MFM92boMP9nn+nHaCU8EEV7BKxcgG7hu3qCLQxbsy/8FHp6qk5j33th59NJgqsOXm0/Hvv0FRCjM4e6BZNZU8OBp0WCc3QKJIbM3Pe4M/XyE9XVho7cBIF1QPQLMNC+jd4STEUiP9+GslpmlAjhs2FnUGcgaTFXsU31PF+2I2qqjxm1jLOjZhaTxmMdAY+8qsycNpRLJFRz+6Cw4QK9qF7XNOvSPpL3nHfKAxZHEYqz1w32ZbVJTIQ5bSkGG3NBBuJW0pPvNqP2YZh7nCk/pde1iINZtKvsont0Lfj/WlSFpOD6s6XPmHxb2bU/CuTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrhVgELc4+fMdYOjNRQFK4yMPY0kvqIpaEjvGLp6nSE=;
 b=N6QYat7t6WKUQYdlksoDVylK58PMqm8A81xcdDEv6tHmBsKxQS6B9OgvRTYpT89K7WxxWWtNjaQrWTG4pGTNwZbvgHTLRi7SQzKdchsDjzqRFb3gNMDEEz5kGwel728rerYmbY8XfnAxpXC3/TLg0T6u8W+wXRKas5ncn3j+x4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4322.namprd12.prod.outlook.com (2603:10b6:a03:20a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 10:05:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 10:05:00 +0000
Message-ID: <0843cda7-6f33-4484-a38a-1f77cbc9d250@amd.com>
Date: Thu, 19 Dec 2024 11:04:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Wei Lin Guay <wguay@meta.com>
Cc: Keith Busch <kbusch@kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, Dag Moxnes <dagmoxnes@meta.com>,
 Nicolaas Viljoen <nviljoen@meta.com>, Oded Gabbay <ogabbay@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Leon Romanovsky <leon@kernel.org>,
 Maor Gottlieb <maorg@nvidia.com>
References: <20241216095429.210792-1-wguay@fb.com>
 <89d9071b-0d3e-4fcd-963b-7aa234031a38@amd.com>
 <Z2BbPKvbxm7jvJL9@kbusch-mbp.dhcp.thefacebook.com>
 <0f207bf8-572a-4d32-bd24-602a0bf02d90@amd.com>
 <C369F330-5BAD-4AC6-A13C-EEABD29F2F08@meta.com>
 <e8759159-b141-410b-be08-aad54eaed41f@amd.com>
 <IA0PR11MB7185D0E4EE2DA36A87AE6EACF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
 <0c7ab6c9-9523-41de-91e9-602cbcaa1c68@amd.com>
 <IA0PR11MB71855CFE176047053A4E6D07F8062@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <IA0PR11MB71855CFE176047053A4E6D07F8062@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4322:EE_
X-MS-Office365-Filtering-Correlation-Id: 657f7df3-26bc-4440-63a3-08dd2014998d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWx0MlJZRkYxUnlKdDFlSWhmYWRuSkJXdjVqamg3UDlWbmdmSHA2bmZNb2k3?=
 =?utf-8?B?eStqUmE1Sk9jTzgzOTlYa0dFT2Y2Y1Axd1p2T0dYeFdDeXVQQmdISEVveDBo?=
 =?utf-8?B?RmFQZlplb1JyWTk1N2ZTZmFPcS9qZE10aVM3TUhjZGRqNkkyREtRSmp2YkJo?=
 =?utf-8?B?OHdEWWdSeXZUNW5nek0rRTN2QThudCs3UHY3bklvV21yTzNPZERmMUpLOVNh?=
 =?utf-8?B?KytPOXdNeERNQ1MydzQvQi9rNnNBU0VYQ2ZlSi92YmdBWkFOVjNwUk1DOFA0?=
 =?utf-8?B?MFgxZXVKQjZTOWVhVnBxTDhZUjVhbzc2Q3N0ZHpFbjBxS3VqcnRUM2Frd0N0?=
 =?utf-8?B?T2J6UXBWWloyeEN5N0xGZWtwdkZ1ZkVTR25tSGpHTjB0c1RiWGdvT0VLVG1B?=
 =?utf-8?B?N3dkL014Z3RoMXZXWDBtQlIxTXorS0RoNStQOUhaT09JVGpCVlp6Q0tGbER5?=
 =?utf-8?B?Qi8yb2U3Ky9PNjR4SjByaElYUnZaNEhxN0JLT3RySWRnL25GbjhqT3U1QjN2?=
 =?utf-8?B?TFB6N0VCV3J5NlZNZkRJTkVBQ1BYS0JiRzZRU3RGNWNETkpYQ0VDditrN0I3?=
 =?utf-8?B?dWVndmJ0OXk5ZVdqemJBOUZDSkM3UTBBSG1HbDVEY1pTQnMwY0lROVQ0b0E4?=
 =?utf-8?B?a2pZNGhGNVN4MEk5TkxtcjJ3YjBiUTBYMkdqL2VhV1llRmZLejhXWUVxQkpo?=
 =?utf-8?B?NHF6UzM0V0FWcDFRRUthL0hSMHoyK0F5YzNwcEhQcW0rcmt4TjFsQk1FUUVE?=
 =?utf-8?B?azdwUHgxcnV2Qkc4MjJudTF0UEZ1NVBpUmVDbEpkcVV3bHJScmFZS2syamlU?=
 =?utf-8?B?cm9uaUpOU2h2K3JMMmlESXg4QU9TNFdFNThYYThmTWU3ZWRCa3RuVW14S1Zj?=
 =?utf-8?B?VW1oMDBuVmx2S0dSQmJhcHhnR3RhcXF5b2I3N1BsRFdaNHY2R3BFYzZERFdI?=
 =?utf-8?B?SW9pUFgrRjduWmQrYWdQTUdyWDJFR3Y3a0djSllFWGlXOHRlRjduNnlJZFV6?=
 =?utf-8?B?K1RzVXVtdVk5MHRMRzJsQWNqV29mb3RWNVREa29lMGZVc1E3c3pDUWRvOWNL?=
 =?utf-8?B?UUYvYng1bWFzaG9sTnVQVjlWeTlXWHhEaG4zMk1SMEhEZmwvcXFNNmRucFBD?=
 =?utf-8?B?NE02MXU1S3MyYmFYN0NSS3VjellWaGxpTWxGSWdRcy84cHlJM0VrSDVpTHdY?=
 =?utf-8?B?aWdQeHJKQjZxUExnejBaazlHVkhySkRsRHJ3L3NVeUJtQzFzVm1hYmpPbUov?=
 =?utf-8?B?NjY2bWRUUjJIMWdHanQvTEZGVi91MGluSkFSWHBjcmUzcnBlb3RaSlJ6a2Rm?=
 =?utf-8?B?S2tMK0g1N3JTRTNwYzAwbTllWlpJRTVwZTQ3bHE1UGIxL3dBTzZsYmVvd1Bu?=
 =?utf-8?B?clZtS2VpeU1uL3ZIRHVXblhGOFpKczBERmg0eStVSUcwL1JMaXA1RjhvME5Z?=
 =?utf-8?B?K0VtV0UvN2g5MjhDRWRvZ0I5UytMTXk3SG5JNGZkcUs0ZVlWR0M0bGtldWsv?=
 =?utf-8?B?WHpCQkUvUVRoMU1zL0VFMzNNNDBSbjBJUHhHZWJMT3hXNTYyeU9YRTdSeDNo?=
 =?utf-8?B?S25ZM0FxMC9xR0pBQ25vY1hmdzhuNWg4TmZoT1NPODVGUmNZMEsrL0dHTmNV?=
 =?utf-8?B?OTNON0t3V1lBeHdBVTdkWG1oYVFIend2b0kxSUtwL3BFdDVaTWNHNE9KWXhy?=
 =?utf-8?B?S2t1QVdzcUgrVUxDSEF1YlBlRVJzNFFKOHR6MitJQStiZ01BSGFjOTExSml6?=
 =?utf-8?B?WWZJRmV4dkljb0NtZUtJbXFKQSs1RUVwTmhTR2lQckhVMW5XQVdHU0xRUUJa?=
 =?utf-8?B?V05IbHJVZEd0ZDQ5SW55VVFKRUY4UkoxMGp3cWxnRlRIYjJRRnlxbXF3aEZ4?=
 =?utf-8?Q?T1RfStLIPB84b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MktuSVVKOUtxR0pydW1pWFhrR0pCMG9mc1ZQRGR1T2lNdHltTVNFSDc4SFBn?=
 =?utf-8?B?M2ZBaWdFVWt3N3VCK09SMUVpZDhWaEZKTnA3VFZCTm5KUmdZeEw0ZXBxMUFX?=
 =?utf-8?B?ajZ4bWdyZ0tLWlMyWFVPZDhGLzkwc1Z1bHJxV092Zko2c3k3cnZ4VUhZcjRa?=
 =?utf-8?B?dS93NnFxYVljL1FsL3hxTHNlUEMxZHkxUG9kZWduTHJtVVBtOGJtYUJyMWlS?=
 =?utf-8?B?emVMUWFkOXVYT21tajFzZk53b01zbVpialdUaUZuRUYrUkpyQmxXZkxMV1hF?=
 =?utf-8?B?T0RVV0pQUlRYV3VqT1dPSWJuVW1WTXJUWk5PMi9RbzcvRXB2NXhaRll5SjQ2?=
 =?utf-8?B?RE1wVThoa1JjWUZvaFh1dk10WlN2YXpRdndyd2FKQXBzSEtGUVM5L21yYnhs?=
 =?utf-8?B?bng4QjhBMFRuV2JpVHA4a2FvM0ZDbWJDR0xmazVROXFJM1VKZXFvRTRSendW?=
 =?utf-8?B?YnBIcXpzZVJZU0xOVGxGWFhWU054bEN3MDdST1IyZXhOWHFldUhlc3ZpMjBy?=
 =?utf-8?B?aE9xeUV2aGRWVGVPOTJCZ21qZEpQd1lTdHEwdTVLaWV6cHBSTXFRd3hWZVRC?=
 =?utf-8?B?NWkyRkRIWHVtcEhxUmZPT2EzVzN1OFJ6dHZ6dkxsSUtXZFlLclRCeFJZdXNU?=
 =?utf-8?B?RDUwZjNlSld2ODl3bE9EaUlodFQ3NDNLb015NWN0VUVzY0dkSkNSSVJwNDBv?=
 =?utf-8?B?Y21Ic1A0VnV1RmIvODlWWHZLUEFNMGxpREhoWTREZWFkeTBEOXJTbjhNcmJC?=
 =?utf-8?B?Y3h4YmJJS3RaclJGT1BCQS9hamxvNUsveG5mWG81ZXZib1Nhc1dZd0owRXJx?=
 =?utf-8?B?NmoxTFJIOXk0Q1NvVTI2VTlOVHpsbmtoM1RBUkpCTE1vTGRtQ0xlbHVwckM4?=
 =?utf-8?B?N1lxSTVwRWpDbGxMUUJNNEpGNm1XQjJCT09qcVFENHU0QWwxMWVKNTd0c0dv?=
 =?utf-8?B?Qm1XTXZkK3FFdkpkdk9WZlRSNFFLUXpsclRrTzF6QXRVNDFWb0V3QlEzOG5X?=
 =?utf-8?B?bjcvL2N2NjY5M0hyZ2Z4TkJ2NWkxaGU5bDNpd0NuN1RYQkJrd0p0ZC82T0cr?=
 =?utf-8?B?WHlnMEJZTktid3YzU0FxZEFLOFdOQk5DWFQzVEhPWmlZOHE0RnoyM085TTRD?=
 =?utf-8?B?dW0yT1FvU0JZd2Q5NEZ4NWNiZEhnVzdDdkRIRng2ckxORHlOUG94dGxmUEVC?=
 =?utf-8?B?UzUvY09WNXBJVHdqbGhvV0JSNjZDTHpVQ0h3SjVxUlVyeXJJNDFpcU9rYWdt?=
 =?utf-8?B?MFZkb0gyYlg5MWJCRGlkZ2ZTYmdIU3lxSTdYcWF4N0dnclJLRDFnQ3hBZkU1?=
 =?utf-8?B?UURRWVhRSEhnQ0luMDFUQ01EV3lvaUtWNDV3TFdqVXc3Vm1RZmVVN3VUZ25D?=
 =?utf-8?B?MERZbWpRMFdDQ3VFdHkzRFdPamV6dDZGbnVtTHp6Z2F5d1d0L0NDLzREbThE?=
 =?utf-8?B?OTdHZFliNFJXTmJQYnQ5bkUvYnJuOGY5TXR3STNyU3htb2FZQ3FoZWRXMHJ5?=
 =?utf-8?B?K3ByOWdlci9JRmJHdkR0YzJaU0lrU1hIcmdZZVpVS0JuZGdKaGlxdW95dWNl?=
 =?utf-8?B?WFZxME93ak1EQ1J0OVdIVm96L1AxZ3hZM0g1MXRXN2tIcmxWL3RYektOb3Fx?=
 =?utf-8?B?RE4vckpJa01vQXRpNTh5VW1YaXM5YnVBd2d2eWtWRXZpSWFFdUxhNVB2NFhr?=
 =?utf-8?B?WndyZSt0NytPdW5rNmIyeTRETVBadm5pSysvSVZ6WktRU0RHK0FpS01icWJX?=
 =?utf-8?B?YUFkT1NzUG9MT1NkdkQvZEdBSXdqbU1HMEJaUWlWQTlZSkZzRExDTHVxdm54?=
 =?utf-8?B?Y3NocDF5U0JQNWtOMkRRWnIvamZJN2ZZODVLaGRsS2psY0ZtM2E0aHlUSVhD?=
 =?utf-8?B?U3JiM0habkIvSUdGOS9Rb0wrZit2N05TREtCREpTK0RLaHJkeXJ5bG9BRk9H?=
 =?utf-8?B?MnNRd1l0NVhIbGYwM3JCbWN1MEtod2N2SWFITHl5U2V4WkdFVnlTbE4wL0s3?=
 =?utf-8?B?R0h0SEFidmJkbDl2ZGlTN2Y3cVpDZW5PU3N0Wk9yL1JZTTQrRFlUaUVzZVZo?=
 =?utf-8?B?Y28xT0lod0Nqd1BFZjJPTTRjeUxCUXVUcXc0WlNCZFN0TENJWW1rVENGMnht?=
 =?utf-8?Q?0TQg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657f7df3-26bc-4440-63a3-08dd2014998d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 10:05:00.5411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOfP8PeEnwBnmImkjK67iNd/0XvEg5X/IjQLPudx6m2XsC537a4m4KXDMgEnyJgY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4322
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

Am 19.12.24 um 08:02 schrieb Kasireddy, Vivek:
> Hi Christian,
>
>> Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
>> through dmabuf
>>
>>>>> 	I will resend the patch series. I was experiencing issues with my email
>>>>> client, which inadvertently split the series into two separate emails.
>>>> Alternatively I can also copy the code from the list archive and explain why
>>>> that doesn't work:
>>>>
>>>> +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool
>>>> +revoked) {
>>>> +    struct vfio_pci_dma_buf *priv;
>>>> +    struct vfio_pci_dma_buf *tmp;
>>>> +
>>>> +    lockdep_assert_held_write(&vdev->memory_lock);
>>>>
>>>> This makes sure that the caller is holding vdev->memory_lock.
>>>>
>>>> +
>>>> +    list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
>>>> +        if (!dma_buf_try_get(priv->dmabuf))
>>>>
>>>> This here only works because vfio_pci_dma_buf_release() also grabs
>> vdev-
>>>>> memory_lock and so we are protected against concurrent releases.
>>>> +            continue;
>>>> +        if (priv->revoked != revoked) {
>>>> +            dma_resv_lock(priv->dmabuf->resv, NULL);
>>>> +            priv->revoked = revoked;
>>>> +            dma_buf_move_notify(priv->dmabuf);
>>>> +            dma_resv_unlock(priv->dmabuf->resv);
>>>> +        }
>>>> +        dma_buf_put(priv->dmabuf);
>>>>
>>>> The problem is now that this here might drop the last reference which in
>> turn
>>>> calls vfio_pci_dma_buf_release() which also tries to grab vdev-
>>>>> memory_lock and so results in a deadlock.
>>> AFAICS, vfio_pci_dma_buf_release() would not be called synchronously
>> after the
>>> last reference is dropped by dma_buf_put(). This is because fput(), which is
>> called
>>> by dma_buf_put() triggers f_op->release() asynchronously; therefore, a
>> deadlock
>>> is unlikely to occur in this scenario, unless I am overlooking something.
>> My recollection is that the f_op->release handler is only called
>> asynchronously if fput() was issued in interrupt context.
> Here is the code of fput() from the current master:
> void fput(struct file *file)
> {
>          if (file_ref_put(&file->f_ref)) {
>                  struct task_struct *task = current;
>
>                  if (unlikely(!(file->f_mode & (FMODE_BACKING | FMODE_OPENED)))) {
>                          file_free(file);
>                          return;
>                  }
>                  if (likely(!in_interrupt() && !(task->flags & PF_KTHREAD))) {
>                          init_task_work(&file->f_task_work, ____fput);
>                          if (!task_work_add(task, &file->f_task_work, TWA_RESUME))
>                                  return;
>                          /*
>                           * After this task has run exit_task_work(),
>                           * task_work_add() will fail.  Fall through to delayed
>                           * fput to avoid leaking *file.
>                           */
>                  }
>
>                  if (llist_add(&file->f_llist, &delayed_fput_list))
>                          schedule_delayed_work(&delayed_fput_work, 1);
>          }
> }
>
> IIUC, based on the above code, it looks like there are two ways in which the
> f_op->release() handler is triggered from fput():
> - via delayed_fput() for kernel threads and code in interrupt context
> - via task_work_run() just before the task/process returns to the user-mode
>
> The first scenario above is definitely asynchronous as the release() handler is
> called from a worker thread. But I think the second case (which is the most
> common and relevant for our use-case) can also be considered asynchronous,
> because the execution of the system call or ioctl that led to the context in
> which dma_buf_put() was called is completed.
>
> Here is a trace from my light testing with the udmabuf driver, where you can
> see the release() handler being called by syscall_exit_to_user_mode() :
> [  158.464203] Call Trace:
> [  158.466681]  <TASK>
> [  158.468815]  dump_stack_lvl+0x60/0x80
> [  158.472507]  dump_stack+0x14/0x16
> [  158.475853]  release_udmabuf+0x2f/0x9f
> [  158.479631]  dma_buf_release+0x3c/0x90
> [  158.483408]  __dentry_kill+0x8f/0x180
> [  158.487098]  dput+0xe7/0x1a0
> [  158.490013]  __fput+0x131/0x2b0
> [  158.493178]  ____fput+0x19/0x20
> [  158.496352]  task_work_run+0x61/0x90
> [  158.499959]  syscall_exit_to_user_mode+0x1a4/0x1b0
> [  158.504769]  do_syscall_64+0x5b/0x110
> [  158.508458]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
>
> And, here is the relevant syscall code (from arch/x86/entry/common.c):
> __visible noinstr bool do_syscall_64(struct pt_regs *regs, int nr)
> {
>          add_random_kstack_offset();
>          nr = syscall_enter_from_user_mode(regs, nr);
>
>          instrumentation_begin();
>
>          if (!do_syscall_x64(regs, nr) && !do_syscall_x32(regs, nr) && nr != -1) {
>                  /* Invalid system call, but still a system call. */
>                  regs->ax = __x64_sys_ni_syscall(regs);
>          }
>
>          instrumentation_end();
>          syscall_exit_to_user_mode(regs);
>
> I also confirmed that the release() handler is indeed called after dma_buf_put()
> (and not by dma_buf_put()) by adding debug prints before and after
> dma_buf_put() and one in the release() handler. Furthermore, I also found
> that calling close() on the dmabuf fd in the user-space is one scenario in
> which fput() is called synchronously. Here is the relevant trace:
> [  302.770910] Call Trace:
> [  302.773389]  <TASK>
> [  302.775516]  dump_stack_lvl+0x60/0x80
> [  302.779209]  dump_stack+0x14/0x16
> [  302.782549]  release_udmabuf+0x2f/0x9f
> [  302.786329]  dma_buf_release+0x3c/0x90
> [  302.790105]  __dentry_kill+0x8f/0x180
> [  302.793789]  dput+0xe7/0x1a0
> [  302.796703]  __fput+0x131/0x2b0
> [  302.799866]  __fput_sync+0x53/0x70
> [  302.803299]  __x64_sys_close+0x58/0xc0
> [  302.807076]  x64_sys_call+0x126a/0x17d0
> [  302.810938]  do_syscall_64+0x4f/0x110
> [  302.814622]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
>
> As you can see above, there is indeed a synchronous version of fput() defined
> just below fput():
> /*
>   * synchronous analog of fput(); for kernel threads that might be needed
>   * in some umount() (and thus can't use flush_delayed_fput() without
>   * risking deadlocks), need to wait for completion of __fput() and know
>   * for this specific struct file it won't involve anything that would
>   * need them.  Use only if you really need it - at the very least,
>   * don't blindly convert fput() by kernel thread to that.
>   */
> void __fput_sync(struct file *file)
> {
> 	if (file_ref_put(&file->f_ref))
> 		__fput(file);
> }
>
> Based on all the above, I think we can conclude that since dma_buf_put()
> does not directly (or synchronously) call the f_op->release() handler, a
> deadlock is unlikely to occur in the scenario you described.

Yeah, I agree.

Interesting to know, I wasn't aware that the task_work functionality 
exists for that use case.

Thanks,
Christian.

>
> Thanks,
> Vivek
>
>> But could be that this information is outdated.
>>
>> Regards,
>> Christian.
>>
>>> Thanks,
>>> Vivek
>>>
>>>> +    }
>>>> +}
>>>>
>>>> This pattern was suggested multiple times and I had to rejected it every
>> time
>>>> because the whole idea is just fundamentally broken.
>>>>
>>>> It's really astonishing how people always come up with the same broken
>>>> pattern.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> 		Apart from that I have to reject the adding of
>>>> dma_buf_try_get(), that is clearly not something we should do.
>>>>
>>>>
>>>>
>>>> 	Understood. It appears that Vivek has confirmed that his v2 has
>>>> resolved the issue. I will follow up with him to determine if he plans to
>>>> resume his patch, and if so, I will apply my last patch on top of his
>> updated
>>>> patch series
>>>>
>>>> 	Thanks,
>>>> 	Wei Lin
>>>>
>>>>
>>>> 		Thanks,
>>>> 		Christian.
>>>>
>>>>
>>>>
>>>>

