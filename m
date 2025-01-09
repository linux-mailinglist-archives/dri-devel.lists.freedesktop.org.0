Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4041BA07105
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 10:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F324410E461;
	Thu,  9 Jan 2025 09:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eiGXidI/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B0D10E374
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 09:10:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZ4MvAFEFhzlqsAzEHGC/Ob5KKJc96uqV4GKHwI8MOk7h2inRb/Bek/NleQYxhmMO6ZDurqpD+89uZ1gl9RrwPzVLOZvaDoQ1c9uCVqG/bDgN2McmFVagsMfHaGj6g27Xkq1s2uSQrNMlpu1vHEdo60aNO2P2ToyrjZTgGL+sXODKU/KWW1R3RnDe3tTB3/87f6CSvrXbr6QNXo+TpWNNdw9m0IzoTx8RPnbkI2uuNJo24LTXp+LlBUQvDTH/95H/MyOVm4XTqvhSVOxMwJhlSxnqbMqNIFcILWNDOjXUjEsQodA0YnjbCt9uabv7SjkiJmNHOZmE5VQ1u1C56c2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXyTCxRgcJKgwiVazwYVHA/ALtGRL+FgkkQSnbYHfZw=;
 b=CrbKBL+dY+xya9cek5rvBuEVSGmLzRx0OUKYzytyxlC1XKEZdXv3qiO5LAnTy1oVf4KTOkopBZox7plW9ucRJBfI2bBltEMqeIXZyHR2ko8AC4E2ER9kNVXe5IUzZ/LOq2U7tosDn+n0Min0uJUCdjIu9G0pMo5sp2CEMh413C4fTjpTuDPDtKJn8AIsttCcaHgZyk0IwI9Xbb8t1VugrTe7hUBVFN8JjSErqx0VBTYJNE/p+Q4aEwf6bsl/FMjl8w7f01m9yAWOqHq2rn8Be9aZbZHRlOo3VacyzmwDueWSMGLqf168STkdsMHePMhVKQCDEkcnv6tGI1YVEO2yuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXyTCxRgcJKgwiVazwYVHA/ALtGRL+FgkkQSnbYHfZw=;
 b=eiGXidI/lk87RoRhGbDAOhN9lj4/2iUcBVYTohNLC71LPpr5TacGwtTmaRJvO8wjV2dtb3v6hSSyuxUhOuc/g878ykyKynUN6+zcVykqzYRDNTbzevkA1WQmm1OMhCBFmGsICA33Dbw+FGtLVCkguHO28lP/wXRx94Bxwskhw68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM3PR12MB9350.namprd12.prod.outlook.com (2603:10b6:8:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 09:10:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 09:10:10 +0000
Content-Type: multipart/alternative;
 boundary="------------00jAhXeWM6ZcmQMCvG0qXm3N"
Message-ID: <0e7f92bd-7da3-4328-9081-0957b3d155ca@amd.com>
Date: Thu, 9 Jan 2025 10:10:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-2-yilun.xu@linux.intel.com>
 <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250108162227.GT5556@nvidia.com>
X-ClientProxiedBy: FR0P281CA0248.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM3PR12MB9350:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a7eb2ef-6b42-4095-6ad1-08dd308d6ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUVGUG5sZkdaQ0ZIQ2ZWemtrZCtUaER5TU5qLzZRWXJxQldvN2JlTjRUMFVl?=
 =?utf-8?B?YnhrZWM3RmxWaDVnZ2FYR0wvNzh1UlhMZEdheHF3dlFEN1ExWkp3RzJDUFp0?=
 =?utf-8?B?SGpveEFJMm1BaDlzZXhZV3VaVk5RRm05RkRwSldYUzRjei9sWXVaTDd6RCtz?=
 =?utf-8?B?c1ZQUTFQNy9rR3RJV0h4SnhVdTlERzdKOW9Xa3psMm1DaU9tUjhqSm9UR0dt?=
 =?utf-8?B?NUdZa0RyYVpVKzhaaDVON2FHVlJ2MmRqbnJUbExMNlZyanpwbEh2UnNpWUJX?=
 =?utf-8?B?WS9GNkIwMmttQWFIdi9OUnJSZVVUS0N2STkvWnhtNFByb3l2M3dUSXpINW5S?=
 =?utf-8?B?OXllNnpncm9rSHNGV1lDbDVWL0JueUR4VDBYNGh3OXl0WTUyWnEyQ29CS2p3?=
 =?utf-8?B?V2JLUi8vRmNHVVIxSWRUYUJ2dGtjYjFkaURNTHdsaHdiaWV6T3llVEd1WVNl?=
 =?utf-8?B?OGxaZnhKajIzdThlK0JUMFpVSUlyanZFQTBOVFA2SmZLOWtqaVRSaVZkNEtF?=
 =?utf-8?B?R1V6QjYxRjJhbkpSQ1pSblY2MHlQVzR6R2IzYnNmOXVUcGdFellhdDJoV2NN?=
 =?utf-8?B?SW5obitCSGNFYmhuS2p1cHpQbmRZN005cDl1dmpYaGpmSytzeTJRRDNMOHVm?=
 =?utf-8?B?dUcxZXJtd01GTFdWWjBGYy9EbnNoSkxyOFg0V3ZKcU13ZSs0TXZmMVdqV3FQ?=
 =?utf-8?B?Y2twTGhWZzZ3cVhpWmlFQ2FtVDRXRXowa0VDOWpDVjNIRi85ZFpCamw0cEpB?=
 =?utf-8?B?RHZ3ZDg4Ri92OE1yQkRVbWk0TDhxSHc2TUFzN1QrUURKRE5Vczk3U0cvMXJQ?=
 =?utf-8?B?Y2JidWNhaElzSHBvdXJuZGpuWTlrUDVteVQ3SXhBbXlDS3NGVWJoT3pTQU90?=
 =?utf-8?B?ckRGU0hrKzBzU2JxM2V3MkpYMjFNUnU4aUFjMXE4V0FTYnN6bStsYjR3ckd0?=
 =?utf-8?B?RXJDUjk0b0JYYURvSENrb0VFb3k4V29WaEc4U2N1SW51QzNrbzN4TDlMazlE?=
 =?utf-8?B?OE9iV2tBWjBqeTFFL1h1bDhSZHV5djZZbEdCMklBaTVFWndqZEJpL29LWHNI?=
 =?utf-8?B?ZjI2VVNsL0M4Y21mNzNoMXducFZDVEhxeXJrbktyK2RCNlB6NnZtZ1dYaEwz?=
 =?utf-8?B?OGJRSmMvd1ZvNWNiVmlDd3J0amlINk02RjBhZ3dYdnFvVkVkeEozcTV4UVF4?=
 =?utf-8?B?OXRQb1N3OGhBWHpKSkxUS0p5QWVyaC8xVWpGUEUvdjZQM3B2UW5HM1BzWjYy?=
 =?utf-8?B?ejJzOUpYalJpS0daY3lJd2I3dzR0NFcwQmhLem1nUUIxQS9WbzBSSkZlck0z?=
 =?utf-8?B?ZG9WSGpZdmNRSlFjVm9lWWthWFhQdFhtQXNpMFl0aFFvNG5WeXBWZWdic0Rt?=
 =?utf-8?B?anVkb2JBT04vd2pOazJueVFVWkM1Ukd6QXRsTDZqSm9td2FMMmg0THVSeC91?=
 =?utf-8?B?RTRzS2VMajhBalpVV0owNjByWjBYaEp6akpIN2JIMS9uNUZrWm4xMXhwNlMx?=
 =?utf-8?B?QVFWdjJBM0xyczlQWVRMTEJOTTJRR3NGa1FqTnhEcFBsT2Zod25LdXlzbThJ?=
 =?utf-8?B?NEs1NUczbWErTWRlU2dNamhqcUE0anloekh6S0FwQzVGNVd4UUtuUGs2end1?=
 =?utf-8?B?RHBzKytIckNZUGNTSnRveFpqRDZVWTBqWVhhY09SaFJQblYvK2FyY2w1ZkRa?=
 =?utf-8?B?SGZwUXZ0cE1YOVBOOG84bFNpMTFWRFpzOHhIUkovQWk4eHEvNURxUEVUSzc3?=
 =?utf-8?B?c3RQYUgwQUZkSitPTmdQT0tMUHdGaDBtckpEbDBsaWNWWDZvMFFlaXdLcUpP?=
 =?utf-8?B?bkpHUyt4TzVwVG1VdFY0Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG44enJOd1VsdUR2YXNoWnVUMjUrTUxHMS8vY2NRZW5XZUxFMzhZbTdxTG1T?=
 =?utf-8?B?WHd0ZkdSYmEvaWdvUE5JekQrNDFKMzMvcnVtdStiNzJhZ3JDYUx0WnZtV2I2?=
 =?utf-8?B?YTJEU2J1V1dnQ0NvTnlqL1BQSTRrbDVMd2lCU2pHOTJqeFhWSXZxSHBMVUhJ?=
 =?utf-8?B?UEEvZlV3aXFsMitCNWh1NTBjNkVPNm1LWGxIdk1Jb1FYc280ak04Q1hDMlMv?=
 =?utf-8?B?ZGc1M2piaG1tZXZ1dEVHTHRhMEJBUlJyTVlmSGdVV3BRZEZKZzlGcFhyQmlN?=
 =?utf-8?B?QVE3ekcraytGa1p5M2JwTTJjNjdvbnVFQkh2SmF1dGVJUGNTTDArZ0t2SUN3?=
 =?utf-8?B?Zjl3Qy8yMUhGNE5XNHRsRVQ3c1l5NllxZzY1Nms3U0NaY05BblJJSTEzdzJN?=
 =?utf-8?B?UFZMdll5Zjd1NjVzNElxblN2djBLaHd0c1MvRlFJSFA5NHR2NU9DZ1NNZUNN?=
 =?utf-8?B?Z2QySW90cjJyc0RONlN0dXNldWdleXdUQTBHenZUck5UaHBhazNsVjFINVBF?=
 =?utf-8?B?MjJ1TTRFclA3RDY3ZTNmVDdqVlVXNm9VVVkvVlB6NGNIdEMvd1krTEtoYWF5?=
 =?utf-8?B?UUhWNFl3NjFVRGt2L3BSMmRzYUJPeVl4Mnk2YzVKRzRINUpkNk4zMTlzOXhi?=
 =?utf-8?B?eU0zWEl0Kzl6QW1NSmcyV0xaQVYvRnRHT0U1Z2pFVHRVK1R3VWtHWTNRd1NS?=
 =?utf-8?B?WWI0aTA0Wkw3QTVIRDJCNXJYalF3UEh4dlhYcDI3N01BN2xOdnNWSWRTOGpG?=
 =?utf-8?B?alNjcGxzc0F3NEsyU2xCY3Z1aTdkZmMvT09IOGZzUEp5Y2NVRmpHLzhPazEw?=
 =?utf-8?B?NjRCeDBVaDdyWEEyeUk1TWFiUS9EL2tiN1VaOXh0Ui9WYThpSUlRNHVmN2h6?=
 =?utf-8?B?QUx0UGthOGIxa0xZaU1PUDRyVUVyZVZpQitmV3MxQnNLN3VlY0RpeDU5R3VB?=
 =?utf-8?B?QWN1UUZsVzRCc0dwV29jUnF4QTNVd0RodGZDYlNXTTZQK085VHpSem43Rmg3?=
 =?utf-8?B?Y1hZSjVIOGtyWSt0Q1JEQWlRV210WGphYnBWR20xZ1V0MVI2amZ5YVdsZmtB?=
 =?utf-8?B?ZGFhZXFRMjAvUGlUQnQvdTRQZnR1ZTRkOUluVjQvaWJmWUpEOVgyOFNjMlRq?=
 =?utf-8?B?dXlCdWhBOC9XRG43TmZ4ZkFvekY3NHFmMlJqTTBmUVhsVDU5TkdmZnhsRXZN?=
 =?utf-8?B?SXNZNEhxOTc2MEF0QWFOcTlZV2pjWm4xeER3OU9UVVVBbTZlcGJzNXJLZUVp?=
 =?utf-8?B?ZXR3V2lwNU5wVjVVc0Z1bEdlN1duZUdZblVCQlFxUGp4YUsrWUE4NmYwaHF5?=
 =?utf-8?B?bWIwaHFhR2xjcTRnUzU5cjhCYXE5ZDBVVmV5aFhVOHVyQkFPd2hzcHNQSlQy?=
 =?utf-8?B?Q1ovb2wrT1EwMWlVU2lVVTNyMnVhR09RSm85U0FLV202N2Yrd1BHZjhsOEtr?=
 =?utf-8?B?aHF3akp1eUg2N2wyWWJ3dFhuZE5jdDRDWVV4K3FweGxCSm9LZEZrVmdrSE9S?=
 =?utf-8?B?TDh4NGtubFVPMVA5THh4UWxpNlNaTG1qdTV2VUQrcC90elNQZ21PUVJhSE1o?=
 =?utf-8?B?Ny85UTBrcmppS0ZWRUV4TlZIOXdvNjRKZFJFOWNyR3EyNXFody9vZUtwVVJv?=
 =?utf-8?B?bFNXTEVxVVpsMEtuWHVTZ1loMS9tTkt2bnhsSmFJbEJzRmZhTWNMNFhsakRM?=
 =?utf-8?B?NWdNMmVpT0hsSUx1RmxSK3VrSy93dFdVSlE5SXJ6OUZ5b1NYZEtMLzFBL05G?=
 =?utf-8?B?TDlad0J4azB2OUE3Z2kxQ2pWWElSeWFCM3ZySG8rMmNzQXhnS2hadUhJbGEx?=
 =?utf-8?B?MFFlMEpJUVdRVzlSdmI0ZExYMTFyMDJhK1ZrWlQyYm1TWWYrN2R1UXdxQVZh?=
 =?utf-8?B?VUtIb3QrY3dVUlFLTm9IUXV4MUVIcnhLYW5RV2w1L3NicVhjekMwcDUyaXcr?=
 =?utf-8?B?RnNtcm1rcW1uU3NHaEJlUTVNQk4zd2UrbHVXUUdDSTFGeTBjbUV2aXdKUTMy?=
 =?utf-8?B?NzV1QUhzb01RMVVaS1FqR1ZCQVFoWmJTMjJKZW5rWXdySUVUaGM5cjFVNWFa?=
 =?utf-8?B?aEcwRG5mYXZvK0NNNGUyZU1NbnAvOW5UVHo1bS8rV2tYNFN0U1VXQ3ZLbUxn?=
 =?utf-8?Q?JLRPBOaSOStxHJf81toBra9gP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7eb2ef-6b42-4095-6ad1-08dd308d6ae4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 09:10:09.9580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fm1YW0jAbzuwsloCBGaIJ/hKNRZ6mjGxZWUBucI92Mbj6EDvt2KlOHfCLd9Mo+d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9350
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

--------------00jAhXeWM6ZcmQMCvG0qXm3N
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 08.01.25 um 17:22 schrieb Jason Gunthorpe:
> [SNIP]
>>> For P2P cases we are going toward (PFN + P2P source information) as
>>> input to the DMA API. The additional "P2P source information" provides
>>> a good way for co-operating drivers to represent private address
>>> spaces as well. Both importer and exporter can have full understanding
>>> what is being mapped and do the correct things, safely.
>> I can say from experience that this is clearly not going to work for all use
>> cases.
>>
>> It would mean that we have to pull a massive amount of driver specific
>> functionality into the DMA API.
> That isn't what I mean. There are two distinct parts, the means to
> describe the source (PFN + P2P source information) that is compatible
> with the DMA API, and the DMA API itself that works with a few general
> P2P source information types.
>
> Private source information would be detected by co-operating drivers
> and go down driver private paths. It would be rejected by other
> drivers. This broadly follows how the new API is working.
>
> So here I mean you can use the same PFN + Source API between importer
> and exporter and the importer can simply detect the special source and
> do the private stuff. It is not shifting things under the DMA API, it
> is building along side it using compatible design approaches. You
> would match the source information, cast it to a driver structure, do
> whatever driver math is needed to compute the local DMA address and
> then write it to the device. Nothing is hard or "not going to work"
> here.

Well to be honest that sounds like an absolutely horrible design.

You are moving all responsibilities for inter driver handling into the 
drivers themselves without any supervision by the core OS.

Drivers are notoriously buggy and should absolutely not do things like 
that on their own.

Do you have pointers to this new API?

>>> So, no, we don't loose private address space support when moving to
>>> importer mapping, in fact it works better because the importer gets
>>> more information about what is going on.
>> Well, sounds like I wasn't able to voice my concern. Let me try again:
>>
>> We should not give importers information they don't need. Especially not
>> information about the backing store of buffers.
>>
>> So that importers get more information about what's going on is a bad thing.
> I strongly disagree because we are suffering today in mlx5 because of
> this viewpoint. You cannot predict in advance what importers are going
> to need. I already listed many examples where it does not work today
> as is.

Well there is no need to predict in advance what importers are going to 
do. We just gather the requirements of the importers and see how we can 
fulfill them.

And yes, it is absolutely intentional that maintainers reject some of 
those requirements because the they find that the importer tries to do 
something totally nasty which shouldn't happen in the first place.

>>> I have imagined a staged approach were DMABUF gets a new API that
>>> works with the new DMA API to do importer mapping with "P2P source
>>> information" and a gradual conversion.
>> To make it clear as maintainer of that subsystem I would reject such a step
>> with all I have.
> This is unexpected, so you want to just leave dmabuf broken? Do you
> have any plan to fix it, to fix the misuse of the DMA API, and all
> the problems I listed below? This is a big deal, it is causing real
> problems today.

Well as maintainer of DMA-buf I don't think it is broken. It's just 
missing requirements.

When you have new requirements we can certainly talk about them, but 
giving drivers a green card to do whatever nasty thing they want to do 
is not going to fly at all.

>>> Exporter mapping falls down in too many cases already:
>>>
>>> 1) Private addresses spaces don't work fully well because many devices
>>> need some indication what address space is being used and scatter list
>>> can't really properly convey that. If the DMABUF has a mixture of CPU
>>> and private it becomes a PITA
>> Correct, yes. That's why I said that scatterlist was a bad choice for the
>> interface.
>>
>> But exposing the backing store to importers and then let them do whatever
>> they want with it sounds like an even worse idea.
> You keep saying this without real justification.

Well I have really strong justification for that. Please look at the 
code here and how it cam to be: 
https://elixir.bootlin.com/linux/v6.12.6/source/drivers/dma-buf/dma-buf.c#L776

We intentionally mangle the struct page pointers in the scatterlist to 
prevent importers from trying to access it.

> To me it is a nanny style of API design.

Yes, absolutely and that is really necessary.

Inter driver APIs are hard work because the framework not only needs to 
define rules but also makes sure to properly enforce them.

That's why we not only added tons of documentation how to implement 
things, but also annotation which gives big warnings whenever somebody 
tries to do something nasty.

> But also I don't see how you can possibly fix the
> above without telling the importer alot more information.

Giving additional information to the DMA addresses is perfectly ok. It's 
just that those additional information should be the output of the DMA 
API or DMA-buf and not something drivers try to figure out on their own.

>>> 2) Multi-path PCI can require the importer to make mapping decisions
>>> unique to the device and program device specific information for the
>>> multi-path. We are doing this in mlx5 today and have hacks because
>>> DMABUF is destroying the information the importer needs to choose the
>>> correct PCI path.
>> That's why the exporter gets the struct device of the importer so that it
>> can plan how those accesses are made. Where exactly is the problem with
>> that?
> A single struct device does not convey the multipath options. We have
> multiple struct devices (and multiple PCI endpoints) doing DMA
> concurrently under one driver.
>
> Multipath always needs additional meta information in the importer
> side to tell the device which path to select. A naked dma address is
> not sufficient.
>
> Today we guess that DMABUF will be using P2P and hack to choose a P2P
> struct device to pass the exporter. We need to know what is in the
> dmabuf before we can choose which of the multiple struct devices the
> driver has to use for DMA mapping.
>
> But even simple CPU centric cases we will eventually want to select
> the proper NUMA local PCI channel matching struct device for CPU only
> buffers.

So basically you want something which tells you if device A or device B 
should be used to access something?

That was discussed before as well, but so far the resolution was that 
userspace should decide that stuff and not the kernel.

Would it be sufficient to have a query API where you can ask the DMA-buf 
exporter for information about the buffer? E.g. NUMA distance etc...

>> When you have an use case which is not covered by the existing DMA-buf
>> interfaces then please voice that to me and other maintainers instead of
>> implementing some hack.
> Do you have any suggestion for any of this then?

Yeah, compared to other requirements that sounds trivial what you have 
at hand here.

>>> 5) iommufd and kvm are both using CPU addresses without DMA. No
>>> exporter mapping is possible
>> We have customers using both KVM and XEN with DMA-buf, so I can clearly
>> confirm that this isn't true.
> Today they are mmaping the dma-buf into a VMA and then using KVM's
> follow_pfn() flow to extract the CPU pfn from the PTE. Any mmapable
> dma-buf must have a CPU PFN.

Yeah and I'm the one who forced the KVM guys to do it like that.

> Here Xu implements basically the same path, except without the VMA
> indirection, and it suddenly not OK? Illogical.

Well I'm the designer of this KVM solution and it's not illogical to 
reject that when you are missing quite a bunch of stuff.

Sima correctly pointed out that you need an mmu notifier if you want to 
work with PFNs, but that is just the tip of the iceberg here.

If you want to go down the CPU access path you also need to cover things 
like cacheing flags, lifetime, dynamic changing backing etc...

Regards,
Christian.


>
> Jason

--------------00jAhXeWM6ZcmQMCvG0qXm3N
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 08.01.25 um 17:22 schrieb Jason Gunthorpe:<br>
    <blockquote type="cite" cite="mid:20250108162227.GT5556@nvidia.com">[SNIP]<span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">For P2P cases we are going toward (PFN + P2P source information) as
input to the DMA API. The additional &quot;P2P source information&quot; provides
a good way for co-operating drivers to represent private address
spaces as well. Both importer and exporter can have full understanding
what is being mapped and do the correct things, safely.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I can say from experience that this is clearly not going to work for all use
cases.

It would mean that we have to pull a massive amount of driver specific
functionality into the DMA API.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That isn't what I mean. There are two distinct parts, the means to
describe the source (PFN + P2P source information) that is compatible
with the DMA API, and the DMA API itself that works with a few general
P2P source information types.

Private source information would be detected by co-operating drivers
and go down driver private paths. It would be rejected by other
drivers. This broadly follows how the new API is working.

So here I mean you can use the same PFN + Source API between importer
and exporter and the importer can simply detect the special source and
do the private stuff. It is not shifting things under the DMA API, it
is building along side it using compatible design approaches. You
would match the source information, cast it to a driver structure, do
whatever driver math is needed to compute the local DMA address and
then write it to the device. Nothing is hard or &quot;not going to work&quot;
here.</pre>
    </blockquote>
    <br>
    Well to be honest that sounds like an absolutely horrible design.<br>
    <br>
    You are moving all responsibilities for inter driver handling into
    the drivers themselves without any supervision by the core OS.<br>
    <br>
    Drivers are notoriously buggy and should absolutely not do things
    like that on their own.<br>
    <br>
    Do you have pointers to this new API?<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250108162227.GT5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">So, no, we don't loose private address space support when moving to
importer mapping, in fact it works better because the importer gets
more information about what is going on.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Well, sounds like I wasn't able to voice my concern. Let me try again:

We should not give importers information they don't need. Especially not
information about the backing store of buffers.

So that importers get more information about what's going on is a bad thing.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I strongly disagree because we are suffering today in mlx5 because of
this viewpoint. You cannot predict in advance what importers are going
to need. I already listed many examples where it does not work today
as is.</pre>
    </blockquote>
    <br>
    Well there is no need to predict in advance what importers are going
    to do. We just gather the requirements of the importers and see how
    we can fulfill them.<br>
    <br>
    And yes, it is absolutely intentional that maintainers reject some
    of those requirements because the they find that the importer tries
    to do something totally nasty which shouldn't happen in the first
    place.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250108162227.GT5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">I have imagined a staged approach were DMABUF gets a new API that
works with the new DMA API to do importer mapping with &quot;P2P source
information&quot; and a gradual conversion.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
To make it clear as maintainer of that subsystem I would reject such a step
with all I have.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This is unexpected, so you want to just leave dmabuf broken? Do you
have any plan to fix it, to fix the misuse of the DMA API, and all
the problems I listed below? This is a big deal, it is causing real
problems today.</pre>
    </blockquote>
    <br>
    Well as maintainer of DMA-buf I don't think it is broken. It's just
    missing requirements.<br>
    <br>
    When you have new requirements we can certainly talk about them, but
    giving drivers a green card to do whatever nasty thing they want to
    do is not going to fly at all.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250108162227.GT5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Exporter mapping falls down in too many cases already:

1) Private addresses spaces don't work fully well because many devices
need some indication what address space is being used and scatter list
can't really properly convey that. If the DMABUF has a mixture of CPU
and private it becomes a PITA
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Correct, yes. That's why I said that scatterlist was a bad choice for the
interface.

But exposing the backing store to importers and then let them do whatever
they want with it sounds like an even worse idea.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You keep saying this without real justification.</pre>
    </blockquote>
    <br>
    Well I have really strong justification for that. Please look at the
    code here and how it cam to be:
<a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v6.12.6/source/drivers/dma-buf/dma-buf.c#L776">https://elixir.bootlin.com/linux/v6.12.6/source/drivers/dma-buf/dma-buf.c#L776</a><br>
    <br>
    We intentionally mangle the struct page pointers in the scatterlist
    to prevent importers from trying to access it.<br>
    <br>
    <blockquote type="cite" cite="mid:20250108162227.GT5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">To me it is a nanny style of API design.</pre>
    </blockquote>
    <br>
    Yes, absolutely and that is really necessary.<br>
    <br>
    Inter driver APIs are hard work because the framework not only needs
    to define rules but also makes sure to properly enforce them.<br>
    <br>
    That's why we not only added tons of documentation how to implement
    things, but also annotation which gives big warnings whenever
    somebody tries to do something nasty.<br>
    <br>
    <blockquote type="cite" cite="mid:20250108162227.GT5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">But also I don't see how you can possibly fix the
above without telling the importer alot more information.</pre>
    </blockquote>
    <br>
    Giving additional information to the DMA addresses is perfectly ok.
    It's just that those additional information should be the output of
    the DMA API or DMA-buf and not something drivers try to figure out
    on their own.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250108162227.GT5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">2) Multi-path PCI can require the importer to make mapping decisions
unique to the device and program device specific information for the
multi-path. We are doing this in mlx5 today and have hacks because
DMABUF is destroying the information the importer needs to choose the
correct PCI path.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
That's why the exporter gets the struct device of the importer so that it
can plan how those accesses are made. Where exactly is the problem with
that?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
A single struct device does not convey the multipath options. We have
multiple struct devices (and multiple PCI endpoints) doing DMA
concurrently under one driver.

Multipath always needs additional meta information in the importer
side to tell the device which path to select. A naked dma address is
not sufficient.

Today we guess that DMABUF will be using P2P and hack to choose a P2P
struct device to pass the exporter. We need to know what is in the
dmabuf before we can choose which of the multiple struct devices the
driver has to use for DMA mapping.

But even simple CPU centric cases we will eventually want to select
the proper NUMA local PCI channel matching struct device for CPU only
buffers.</pre>
    </blockquote>
    <br>
    So basically you want something which tells you if device A or
    device B should be used to access something?<br>
    <br>
    That was discussed before as well, but so far the resolution was
    that userspace should decide that stuff and not the kernel.<br>
    <br>
    Would it be sufficient to have a query API where you can ask the
    DMA-buf exporter for information about the buffer? E.g. NUMA
    distance etc... <br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250108162227.GT5556@nvidia.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">When you have an use case which is not covered by the existing DMA-buf
interfaces then please voice that to me and other maintainers instead of
implementing some hack.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Do you have any suggestion for any of this then?</pre>
    </blockquote>
    <br>
    Yeah, compared to other requirements that sounds trivial what you
    have at hand here.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250108162227.GT5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">5) iommufd and kvm are both using CPU addresses without DMA. No
exporter mapping is possible
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
We have customers using both KVM and XEN with DMA-buf, so I can clearly
confirm that this isn't true.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Today they are mmaping the dma-buf into a VMA and then using KVM's
follow_pfn() flow to extract the CPU pfn from the PTE. Any mmapable
dma-buf must have a CPU PFN.</pre>
    </blockquote>
    <br>
    Yeah and I'm the one who forced the KVM guys to do it like that.<br>
    <br>
    <blockquote type="cite" cite="mid:20250108162227.GT5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">Here Xu implements basically the same path, except without the VMA
indirection, and it suddenly not OK? Illogical.</pre>
    </blockquote>
    <br>
    Well I'm the designer of this KVM solution and it's not illogical to
    reject that when you are missing quite a bunch of stuff.<br>
    <br>
    Sima correctly pointed out that you need an mmu notifier if you want
    to work with PFNs, but that is just the tip of the iceberg here.<br>
    <br>
    If you want to go down the CPU access path you also need to cover
    things like cacheing flags, lifetime, dynamic changing backing
    etc...<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:20250108162227.GT5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">

Jason
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------00jAhXeWM6ZcmQMCvG0qXm3N--
