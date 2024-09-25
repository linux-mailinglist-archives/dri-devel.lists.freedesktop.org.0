Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CB3985F97
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 16:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB6210E0E3;
	Wed, 25 Sep 2024 14:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a9aSFuxU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3865D10E0E3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 14:01:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzDRP2m3dqCxd7MD+GsZkC6l5osAWkoYimsHeY9op+cNAgfD7je57Cw2ocrxixQ+MwO/Uf1ZxHA4hWTxVPXlrio5VWehfDfEY4ZCByT9YKWShvOS6F6KJKKLTnj8YiysAV8seBLBsuVws7CkFLlpwaR82lHkWWgfr8UWw6nFvciLv+ZO63MnKdf6ER8Ay5u6PoKMK4SnnHi5s/mWcqAjexcEMCkBiiifw0Cmkd/6CtPzEoOVHxVXP0pFKOyD1bJZfKHe3on6GEyYQrcuXNKSJg7HwaHISY6wYV8Lxctv4qsX0DptZ9Gae2kDqI9XMKTWeBmPzoXSHJm0dCHp3eVvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmuXmRpRuH4oJYMpKsSqgbjubRXCwOGnZt0tQMTWR7A=;
 b=zV5CpB1S5rPpOZe+jVIUFWOei5ErjIU/UsflX1F1yFHlp9wO330Y+x3P2lSxx68/kRNAJFStdwV7Rrmlndm19STAi1hVJiHgFQqaja/WbPkkRrMrFSFnEzxQsTnGPCyJnMCdYQFcIdY2mVFOVf1jELAl2N8A0j00svkG28xCL5/bggO65FqOYH2/7M7wGFkpI/5vNl1wxSXM55H0B6+S99f90vfgtJ1HbudSikrcOOtf3C+NqtchOGa+phY3ZVBfkhM/PxMVOvSC5z6pIEscRLjNpk3N5J5/B6alXxU1FLGdBB2aveAdldbBwY8+T+7tRY1CwMHtSc7GTl5mdTtX3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmuXmRpRuH4oJYMpKsSqgbjubRXCwOGnZt0tQMTWR7A=;
 b=a9aSFuxU5TlOPqskDDN4WkLJ/THde1P3cuZTjAiErxNZS5+BwRaVjcPnMTo+4J/U2JdSsrR7XFFG2lHZWiEKAAIPYBLJJmCEx0TPB/yJGJiQHUV/xxugf7QVyrSxTny+GqLYjyhSGjd3jHNwqGqy+Df/g7+qDfb4KJF2EW/eWTQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8148.namprd12.prod.outlook.com (2603:10b6:806:351::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.29; Wed, 25 Sep
 2024 14:01:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7982.012; Wed, 25 Sep 2024
 14:01:17 +0000
Content-Type: multipart/alternative;
 boundary="------------HQQUdO8cZe0QSVOFB8ZQ2Jw0"
Message-ID: <04caa788-19a6-4336-985c-4eb191c24438@amd.com>
Date: Wed, 25 Sep 2024 16:01:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] Re: [RFC PATCH 0/4] Linaro restricted heap
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Andrew Davis <afd@ti.com>, Jens Wiklander <jens.wiklander@linaro.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>, Sumit Garg
 <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
 <d8e0cb78-7cfb-42bf-b3a5-f765592e8dd4@ti.com>
 <mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge>
 <e967e382-6cca-4dee-8333-39892d532f71@gmail.com>
 <lk7a2xuqrctyywuanjwseh5lkcz3soatc2zf3kn3uwc43pdyic@edm3hcd2koas>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <lk7a2xuqrctyywuanjwseh5lkcz3soatc2zf3kn3uwc43pdyic@edm3hcd2koas>
X-ClientProxiedBy: FR3P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 46565238-d676-4b66-0c29-08dcdd6a8656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEFaVUxGNU5aZWd2N1gvOG5XVzN6c0tYNG9yb05wYW1aejViQlN2aStHSE1a?=
 =?utf-8?B?RXlISXVJWmVYK2kvSlBwcGFqTUdqZU9YMFZCRlFSeTI0QUFhR0VDOHdWYmNM?=
 =?utf-8?B?M0NFQzQwYXNQNlc2U0dTbzdMUTI2T25zQlY2MzJJakMvTXQvLzF5MTZ3UE1I?=
 =?utf-8?B?d09neXhZNXBocFRWWkQ5cERhYU43RUFKZ1NNSXFENGhyNS9ZRW9KYmdFTld4?=
 =?utf-8?B?NCtkQnFzNzNlRnpnaXlaUStsY1k2Z1lWL0p3ZEhKS1Z5YWx5WSsxdkw0V3RY?=
 =?utf-8?B?YklBZFQvQy9GYS9lVk1RUFdtb0FrbHJWZGg2c2ptc1NxVnZlTVdrTXRWK3lj?=
 =?utf-8?B?YWYyQjN3WERmNXloOXZTQ2szVXVBR2JFbDFEQ3JhVmJHekFwQTRMcWFtcUZR?=
 =?utf-8?B?eTRnZU1HK0VsL29ZamVxc0prMGdQRlkyVENIcGdPVVJadDhvckMyRGgrZUU0?=
 =?utf-8?B?cE4wV2JmVTlPV1duMmc4MTRsM2hJcDByaEwvZmpkQS9FeHd3cUNlRjYxQits?=
 =?utf-8?B?b2FJYzRlQWUzbUJwWXRwaVdaT2l5UWN1R3h2RFRBVDB0bzlWVGx1S0ovZmt5?=
 =?utf-8?B?V0FkZXdVSmFBenllaVM2M3kzdWM3VHhYZ0pyVXZRMWxuM2t5dlBlRjVBN0w2?=
 =?utf-8?B?Z3c3dTEvcVNCUDcwaDNoMmJIZnN0VklSQ1BRU1ZPdmsweFJOMzhkZVVndEVJ?=
 =?utf-8?B?Vk5NMW5pbUZNajN3OW5UdVB3S0NOdnBNZjFkNE5oK01yN0hPellEN1FhcFVD?=
 =?utf-8?B?Z1JCMnJBeS8rUStpb2FVVjNmUWV5enY0RFEvR3h0N2NIWHVWN0Y3K0Fhbml1?=
 =?utf-8?B?eThQdXI4KzJtRVhLSURNQW1jdmJCRGtKS3FEeGxhM2VrYXl0Sm55MzQzWHFM?=
 =?utf-8?B?Q0NaeDRPYWUwbkxQQThQd2w5MXduZlpadkljUVVtQ0N2ckE5QkUrRi9tS3Y5?=
 =?utf-8?B?T256TFFLL2MxbjhMUzVxWnJQMmZLTGRQN3JWNnpMck5BV3ZoN0FPRjhnTk10?=
 =?utf-8?B?eUloeWZMbndvM3pXQ1htN094ZERKaGl3OGExaXIweEF1U0F0SFFmWGk3d1pF?=
 =?utf-8?B?RG9IS2xFV3VmZzJDcDVSWklEOWhxSGRvaWVNb2dHSFhQSXF2ZjNEV3Zzc2xS?=
 =?utf-8?B?T2V0YnBPN0VWM2lwUmgxekF6S0ZEUnZnNzRzeDk4NmliVFNBdUlCZ3VpVkVN?=
 =?utf-8?B?MGY1S0pBSDNyeFdLZFVXRDR6WWxneEc3WVVNRG1GeXpxbko3dldJZzQwanlH?=
 =?utf-8?B?b0hpNTZranBOcVlUNDVXcGVnMzlucGhQc1RzY1RMVTFidXExVktCUW9zWFNO?=
 =?utf-8?B?a3pzSGVqY3VmaGNPUEE5YnhzOTFPcWpxWnJ2ZnpQUTBlaVpoMjNNZWZrQ3RZ?=
 =?utf-8?B?Y2RMaUlKU1RtVDBSZVJFYWhBN2pBRVJaN3Z4SVc2Y0pIanVtdDJJaXdpTTcw?=
 =?utf-8?B?RTlBamFROVRMWWwzYXhqMFhRbFlvMFdud2JXT3A3MyszWDJQR2pSVVRrNWxJ?=
 =?utf-8?B?dGxvTVN6cWU2RE13U3kvSmFoM0VQTHEzU080QmtwV01nSExSVW52dXI1cHJM?=
 =?utf-8?B?aFo2UUZQODI0ZjUwWFZLb0xEY2NCa3RycnpoaFI1Z244clhrN3ZkMFBrMHJz?=
 =?utf-8?B?RmVjWi80RHVsMWNOWHVieFRORDF4Qi8zbVpSL1NWeXN5aHhmWm9MN1Fyd1Jh?=
 =?utf-8?B?Qk5rakNDR21TSnJaeUsvVjVKWm52QkJ0c3BqZU16VUFYdERwd3V0aXBRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmFqS29oV0plSEkwdm82c1VFYmlDTGNZV3FWSmlXTXV5NEVUNURZZ3dHazhz?=
 =?utf-8?B?MUwrazFyWVlCZW95L2RPZHdkV0lhYU1naWFOSnV4U0EyTkRram9hUzJ2OVhE?=
 =?utf-8?B?UTh3eXlqOWZGTU9SekN4QmhnczFkQWNLVVVvK0p6T2Z1dXZEcXNXdjJTeDQy?=
 =?utf-8?B?M1dOWk9TcytCbmxEZ1BoeFhFMjdkZ0lGUkZFZStIWHdvSE5HbEhtY2NMRHpi?=
 =?utf-8?B?L3NtNTUvdVhtU2xOcjh3Ym5VNXI2bFVQdzRpUDU1ODVzSHV4TjVRWDRiamFL?=
 =?utf-8?B?eFZRbUtxZVVLMmtqR01QbklKejdZNWo4SmcwaDFBVkhBazBIZ05TVG5FOWJH?=
 =?utf-8?B?d2VKS3N5VU5PT1RTWDFWTEIwMVFqMEFQLzlFZy9ibHA2UUFrYUxpMzU4dUlT?=
 =?utf-8?B?WEM0a3pBMXZsZ3hBZEo0NXBEbjQzeUtEbnFnd3FDL0NBeGozL3FZM1BQK0VF?=
 =?utf-8?B?Y0cweU5UcVVLa09jU29WcVQ0S2lpSW1nVEhxWTJwSGovUm5rOUZ6ekdoeFI2?=
 =?utf-8?B?K2xtK0xGOStCMER6dXRZUXhhQXQxTmdSclFYVmkrWTdRam55NWZxb2VUaUFh?=
 =?utf-8?B?UWNXQXdiUi9aWDdMcHl5bkpFSEZUWllkb1l2TDNCKzQrRWs1Tlg0STVNMHQy?=
 =?utf-8?B?ZzhOdnlMMGpaU01aZzBXS2JwN1pyTVZNTEluN1R3YzdFZGdDSzlPUEJTSmJ6?=
 =?utf-8?B?Rm5nRy9uUEdPcmJHMGN6TXgxejQ0QWEyL011ZFdLaWZKTWJRT3pZTExpVXA5?=
 =?utf-8?B?WWZHQXFWZ0lXUklxQmc2Q3h5SzUrdStBSVl1eDNpczBwZEh3T3N2Q1dPS1g5?=
 =?utf-8?B?ZHdrVURzWjFNMml0OGFEa1Q5dlUyOUQycjRqVUVONGI1MzVBb3dKd2REbWVW?=
 =?utf-8?B?WlJwSW5mNzJPMDcrWXc0cW9DdFgrK1pFM2t2Nk45Y3UrTURtSHBVMmpEWHhz?=
 =?utf-8?B?WTgxTGtJUWVaQ0ZHUWFCWG8zY3hrcVNQMnFoTG5rRW1vS09DNE9IVFVaWVFt?=
 =?utf-8?B?YURqZFpqdjZvSnVibCtLOUFDbVN3bjdxM3NyQjdrN0xwVXI2T3BSYk00K1Uz?=
 =?utf-8?B?MUJHVk1jL3lramZMdmhHdlkxNmdxSGp3VnA5WGc2b0UyQXRteEdacGlRQWVF?=
 =?utf-8?B?TllDUUpZaHBSTXM1cnk3MFF6WE1wV1dHeGhqbVJrOWJrb01ub2oybE5qeWRx?=
 =?utf-8?B?NGZmdmNQOGJYT0hyTEU5ZzhTczJ0RHJRL0NmK3NVUG90OGNremxYVDRNRlVT?=
 =?utf-8?B?bjYrNys0ZEdoRHorM3pHc1QzYkRyZHNoQ2NLdWVjL29NaGMyU2NZalBsdGFU?=
 =?utf-8?B?K3JVaGkxcE5ZRkh6Uk4zaE1aem9QQk9Dcm5WWGFmaE9DSGlyUm0yUGRZUURD?=
 =?utf-8?B?QktmN3N2eTJMOUU1N2pHanRpZGM3MkNITDZpOHJRazRLLzBrQ0hqTTdaK2ZC?=
 =?utf-8?B?azFZZnR0T1ZDSGNkL3RNNVljNXFsOVpjTjFERkZPOTROS1hiYnVaTHFUT3ZK?=
 =?utf-8?B?M1cxeVNZNzRoYmkwYlRFM3hEcXIyQ3h0NVpBN3U3QmRENHgyQ1pUNTlTRDE2?=
 =?utf-8?B?NW9wbDNLc2ZCUk8rMURDTGF6MUJoRU5rWWlZZUcyVFBVUXVkbzVjNVJkc0Rp?=
 =?utf-8?B?R3hZTVJmSEdwK3JrWmpuTy9QZHZNdlZQM0sxdWRvZ1BacGVtL3FBSlhxQVJQ?=
 =?utf-8?B?cEtRVGkvMlJvQjVNSlY0ZGFnRXFqVDVNL2lheGZVRG5BUUQ3VHJmbzFpOTlw?=
 =?utf-8?B?RUhBb082UXNOOTBJR0s5ZHE4RjBlRUVwYlJETTlNOVpUODI5dEE1eGtsRkpB?=
 =?utf-8?B?TnlPUjdDaGFoTW5xZUNBKzBWRkNuM2laTFhnZmZrWlJoekQ3ZUdoTnFER3FU?=
 =?utf-8?B?ZVdxMUlvQlVjVEluVmFlZ3gya3hOQnM5N29GcVpDV05hdlNkaHdDVkxHV3JU?=
 =?utf-8?B?TEdmMk0rV1hLVXVibGtHc2VCNDMxeU5lODdaM0kvYzZyeXpHYU90Tkd1aWxY?=
 =?utf-8?B?MnYySFZIemd4eTVVeXYyOGkvVVgrcjhMd3RxS0hwRnYra3FQSURUanF5ZUNO?=
 =?utf-8?B?RjZCSlBwSm05eDlUTXVkbHozNUV2bUY3R1gxMUpXWHFOWkJJMFRhYzUzKzR1?=
 =?utf-8?Q?i6Pw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46565238-d676-4b66-0c29-08dcdd6a8656
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 14:01:17.2600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLvqUMO7ALwJmK8iovwH4nsd9XtrGML1YvKr7e/CzXa3gREk9GjvUwMKKuDrd7PR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8148
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

--------------HQQUdO8cZe0QSVOFB8ZQ2Jw0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 25.09.24 um 14:51 schrieb Dmitry Baryshkov:
> On Wed, Sep 25, 2024 at 10:51:15AM GMT, Christian König wrote:
>> Am 25.09.24 um 01:05 schrieb Dmitry Baryshkov:
>>> On Tue, Sep 24, 2024 at 01:13:18PM GMT, Andrew Davis wrote:
>>>> On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
>>>>> Hi,
>>>>>
>>>>> On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
>>>>>> Hi,
>>>>>>
>>>>>> This patch set is based on top of Yong Wu's restricted heap patch set [1].
>>>>>> It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
>>>>>>
>>>>>> The Linaro restricted heap uses genalloc in the kernel to manage the heap
>>>>>> carvout. This is a difference from the Mediatek restricted heap which
>>>>>> relies on the secure world to manage the carveout.
>>>>>>
>>>>>> I've tried to adress the comments on [2], but [1] introduces changes so I'm
>>>>>> afraid I've had to skip some comments.
>>>>> I know I have raised the same question during LPC (in connection to
>>>>> Qualcomm's dma-heap implementation). Is there any reason why we are
>>>>> using generic heaps instead of allocating the dma-bufs on the device
>>>>> side?
>>>>>
>>>>> In your case you already have TEE device, you can use it to allocate and
>>>>> export dma-bufs, which then get imported by the V4L and DRM drivers.
>>>>>
>>>> This goes to the heart of why we have dma-heaps in the first place.
>>>> We don't want to burden userspace with having to figure out the right
>>>> place to get a dma-buf for a given use-case on a given hardware.
>>>> That would be very non-portable, and fail at the core purpose of
>>>> a kernel: to abstract hardware specifics away.
>>> Unfortunately all proposals to use dma-buf heaps were moving in the
>>> described direction: let app select (somehow) from a platform- and
>>> vendor- specific list of dma-buf heaps. In the kernel we at least know
>>> the platform on which the system is running. Userspace generally doesn't
>>> (and shouldn't). As such, it seems better to me to keep the knowledge in
>>> the kernel and allow userspace do its job by calling into existing
>>> device drivers.
>> The idea of letting the kernel fully abstract away the complexity of inter
>> device data exchange is a completely failed design. There has been plenty of
>> evidence for that over the years.
>>
>> Because of this in DMA-buf it's an intentional design decision that
>> userspace and *not* the kernel decides where and what to allocate from.
> Hmm, ok.
>
>> What the kernel should provide are the necessary information what type of
>> memory a device can work with and if certain memory is accessible or not.
>> This is the part which is unfortunately still not well defined nor
>> implemented at the moment.
>>
>> Apart from that there are a whole bunch of intentional design decision which
>> should prevent developers to move allocation decision inside the kernel. For
>> example DMA-buf doesn't know what the content of the buffer is (except for
>> it's total size) and which use cases a buffer will be used with.
>>
>> So the question if memory should be exposed through DMA-heaps or a driver
>> specific allocator is not a question of abstraction, but rather one of the
>> physical location and accessibility of the memory.
>>
>> If the memory is attached to any physical device, e.g. local memory on a
>> dGPU, FPGA PCIe BAR, RDMA, camera internal memory etc, then expose the
>> memory as device specific allocator.
> So, for embedded systems with unified memory all buffers (maybe except
> PCIe BARs) should come from DMA-BUF heaps, correct?

 From what I know that is correct, yes. Question is really if that will 
stay this way.

Neural accelerators look a lot stripped down FPGAs these days and the 
benefit of local memory for GPUs is known for decades.

Could be that designs with local specialized memory see a revival any 
time, who knows.

>> If the memory is not physically attached to any device, but rather just
>> memory attached to the CPU or a system wide memory controller then expose
>> the memory as DMA-heap with specific requirements (e.g. certain sized pages,
>> contiguous, restricted, encrypted, ...).
> Is encrypted / protected a part of the allocation contract or should it
> be enforced separately via a call to TEE / SCM / anything else?

Well that is a really good question I can't fully answer either. From 
what I know now I would say it depends on the design.

For the content encryption used by AMD and some other vendors it's 
clearly a data property which isn't related in any way to something the 
kernel deals with.

When it's not encryption but rather some special protected area of 
memory which only certain devices have DMA access to then having a 
separate heap might make sense for that.

As rule of thump I would say it's the kernels responsibility to manage 
the physical interconnection between two devices, e.g. come up with DMA 
addresses which work. And it's the userspace responsibility to negotiate 
the actual data format of the bytes transferred, e.g. things like width, 
height, stride, pixel format, tiling, encryption etc....

The tricky part is all those special cases, e.g. that GPU can only 
scanout from local memory, that atomic operations work only on system 
memory, that a devices might have different coherency constrains, etc.. 
Nobody has figured out really all the requirements and we basically just 
go from use case to another use use case.

Regards,
Christian.
--------------HQQUdO8cZe0QSVOFB8ZQ2Jw0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 25.09.24 um 14:51 schrieb Dmitry Baryshkov:<br>
    <blockquote type="cite" cite="mid:lk7a2xuqrctyywuanjwseh5lkcz3soatc2zf3kn3uwc43pdyic@edm3hcd2koas">
      <pre class="moz-quote-pre" wrap="">On Wed, Sep 25, 2024 at 10:51:15AM GMT, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 25.09.24 um 01:05 schrieb Dmitry Baryshkov:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Tue, Sep 24, 2024 at 01:13:18PM GMT, Andrew Davis wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Hi,

On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Hi,

This patch set is based on top of Yong Wu's restricted heap patch set [1].
It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].

The Linaro restricted heap uses genalloc in the kernel to manage the heap
carvout. This is a difference from the Mediatek restricted heap which
relies on the secure world to manage the carveout.

I've tried to adress the comments on [2], but [1] introduces changes so I'm
afraid I've had to skip some comments.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">I know I have raised the same question during LPC (in connection to
Qualcomm's dma-heap implementation). Is there any reason why we are
using generic heaps instead of allocating the dma-bufs on the device
side?

In your case you already have TEE device, you can use it to allocate and
export dma-bufs, which then get imported by the V4L and DRM drivers.

</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">This goes to the heart of why we have dma-heaps in the first place.
We don't want to burden userspace with having to figure out the right
place to get a dma-buf for a given use-case on a given hardware.
That would be very non-portable, and fail at the core purpose of
a kernel: to abstract hardware specifics away.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Unfortunately all proposals to use dma-buf heaps were moving in the
described direction: let app select (somehow) from a platform- and
vendor- specific list of dma-buf heaps. In the kernel we at least know
the platform on which the system is running. Userspace generally doesn't
(and shouldn't). As such, it seems better to me to keep the knowledge in
the kernel and allow userspace do its job by calling into existing
device drivers.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The idea of letting the kernel fully abstract away the complexity of inter
device data exchange is a completely failed design. There has been plenty of
evidence for that over the years.

Because of this in DMA-buf it's an intentional design decision that
userspace and *not* the kernel decides where and what to allocate from.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hmm, ok.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
What the kernel should provide are the necessary information what type of
memory a device can work with and if certain memory is accessible or not.
This is the part which is unfortunately still not well defined nor
implemented at the moment.

Apart from that there are a whole bunch of intentional design decision which
should prevent developers to move allocation decision inside the kernel. For
example DMA-buf doesn't know what the content of the buffer is (except for
it's total size) and which use cases a buffer will be used with.

So the question if memory should be exposed through DMA-heaps or a driver
specific allocator is not a question of abstraction, but rather one of the
physical location and accessibility of the memory.

If the memory is attached to any physical device, e.g. local memory on a
dGPU, FPGA PCIe BAR, RDMA, camera internal memory etc, then expose the
memory as device specific allocator.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
So, for embedded systems with unified memory all buffers (maybe except
PCIe BARs) should come from DMA-BUF heaps, correct?</pre>
    </blockquote>
    <br>
    From what I know that is correct, yes. Question is really if that
    will stay this way.<br>
    <br>
    Neural accelerators look a lot stripped down FPGAs these days and
    the benefit of local memory for GPUs is known for decades.<br>
    <br>
    Could be that designs with local specialized memory see a revival
    any time, who knows.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:lk7a2xuqrctyywuanjwseh5lkcz3soatc2zf3kn3uwc43pdyic@edm3hcd2koas">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
If the memory is not physically attached to any device, but rather just
memory attached to the CPU or a system wide memory controller then expose
the memory as DMA-heap with specific requirements (e.g. certain sized pages,
contiguous, restricted, encrypted, ...).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is encrypted / protected a part of the allocation contract or should it
be enforced separately via a call to TEE / SCM / anything else?
</pre>
    </blockquote>
    <br>
    Well that is a really good question I can't fully answer either.
    From what I know now I would say it depends on the design.<br>
    <br>
    For the content encryption used by AMD and some other vendors it's
    clearly a data property which isn't related in any way to something
    the kernel deals with.<br>
    <br>
    When it's not encryption but rather some special protected area of
    memory which only certain devices have DMA access to then having a
    separate heap might make sense for that.<br>
    <br>
    As rule of thump I would say it's the kernels responsibility to
    manage the physical interconnection between two devices, e.g. come
    up with DMA addresses which work. And it's the userspace
    responsibility to negotiate the actual data format of the bytes
    transferred, e.g. things like width, height, stride, pixel format,
    tiling, encryption etc....<br>
    <br>
    The tricky part is all those special cases, e.g. that GPU can only
    scanout from local memory, that atomic operations work only on
    system memory, that a devices might have different coherency
    constrains, etc.. Nobody has figured out really all the requirements
    and we basically just go from use case to another use use case.<br>
    <br>
    Regards,<br>
    Christian.<br>
  </body>
</html>

--------------HQQUdO8cZe0QSVOFB8ZQ2Jw0--
