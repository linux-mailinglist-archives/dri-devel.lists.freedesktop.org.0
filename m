Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C30671730
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 10:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71EE10E6E0;
	Wed, 18 Jan 2023 09:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2073.outbound.protection.outlook.com [40.107.101.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214D110E6E0;
 Wed, 18 Jan 2023 09:14:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dx5gd88gK4RjWLzrSXEhPsCgJH9iuEKuuLPjjv4GwNYD7rM8DYpVBpHcHYb93dkU8TYp1Y8da2AzqvK2werNbl4KpYhOgBryzp8oSowDDU2onAXjF7Poel98aQTSA3/RKzi4gvKn+p0gYL6HA/Yc50NBrw9L99+8+hjqqBxepvaYfUo4FHga/6dNHAPerPLs1Np0JrijFA3p46lF0uCMH6FBM075X5u5mj/zVZoNkAoZZOWjfFfqEPwtzU45SR5WdktXL9zw7HK3u8+lp0zDle2fLxF7+QrXrMsMyxgDL863PyVRNG2K1HhRt/JSRAYUQRUzeF0ZcrsoZe2qYbU5Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrV3LlH94SGyC5BrYiaX+N2ZjbxLG1xKrSuhR2CJLVo=;
 b=gxOhyBBwn4R7FBNKWvoyMBJzBNxkX6dF5TOaKSWN/mPQsrK+9xOBK8Zv2bGJnOOB/jPe8Mk9AjJmmVhpZi+uWOeL8g9OIqsRlSL7PRxXr9JByZznLCN4uZU2G93if+Fkgv+FPlioqI5Aay+KmwehwMeADl5p3H5eYUheeJXqYXLMr7K4gFDPXC/GQWmrrTEqrOv5l6pGEsP3x3qblnbSoH4V0OvyRhjIm2Y7B3pOusvAktF9KAlne96Xbnkd0ODaF2jcuPq97lkKQuHApbDj0NqmSr2aKF3oqLUAab1F3Ti5SZ2KJWU0URizKLKqt0Q2HPdFGpQsF8cibcqMuHabVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrV3LlH94SGyC5BrYiaX+N2ZjbxLG1xKrSuhR2CJLVo=;
 b=u65orxLL/7HQJHjTjTl5CI9FeO5TvHwou8Y0FVkNJa3O9v3Nl0vUg4wJuAJiSX21hLQ0VUo/wfLmQuNoITM/plJ20PQmy4F5geiiEelxITU9Q23GEh+9wQ6ZACKydD29SXylydhIqeOiYGdB1q70pCzJNx7CfmnbbYbNMWE7crE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by DS7PR12MB6005.namprd12.prod.outlook.com (2603:10b6:8:7c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 09:14:04 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::500a:d02f:5ceb:4221]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::500a:d02f:5ceb:4221%7]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 09:14:04 +0000
Message-ID: <b1605ab2-7f60-1e2d-de21-a6eb94afdbc7@amd.com>
Date: Wed, 18 Jan 2023 10:13:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Subject: Ongoing failure for "dim rebuild-tip"
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::11) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|DS7PR12MB6005:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d5ab43-ef21-4a54-c0c7-08daf9345834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dKiFxcJGlut7TZIshc2rWB6zMsDaBO3fBCGfGxAhbTnLct4rwqow5RplOPgUxkwh12t7BVdDyp5v73j5xaLV/RV+4CuzWGA630jRWkpgzaKmlTNVQUve5Zn2ye9JFwwOSOlP2n2wG2XLvcHnrZofZCvPXyWS5Jsj2YtEIUb0jN6Pk2KzuodkI67ZZz6yopAH2Az1WlspynoaNLaOBgay+MJ3SENaPxbkRVFMonfv/mJS4OFhWFERqX0cyfHgBS1OYSjanWrQu2Wgg6X+FXnwhnIsJ2qZviSs9B09wqmed9kPmSVDTI3C2zhsyuPK8wR5t3ucj+hchdpfltlhP75GOw1JzjgVhMBAkc/pG85OOmM8GWLngDwguwGD6ikrWRE3JchRtEfNXCeEdH+RyvqvgVXrt+sGZdzkU+dCLMv+irf+yjp07MK7ipH4+kbnGMHfh6oTjiHrS93143RUEBIlHz7NHhZTa7bvuEbxnkPk7Y+XcgMFK04WH/Zfci3ZD8mFBIETFlNXrNUQbFYwBlh9kO4lNl1Sg6OXTAFRCMi6+ysrqzibFncFJ95fJLlIUKlemnCbZbqLFYUZVQypkIp3qkyc7yy4KsLSaXLaWnQutk3vMgnxU9DhhW3Gv8lWG5/tyEAE1nld6lXqR+8yEudnYL5iEkwNjEUf52Jz8uYmuPDJqlTws2m46/36xXTzNQ6kqdyZHDsE0Q9m0P9DESw+YqCG8h0y57JPiXC5oBZZveY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199015)(316002)(31696002)(38100700002)(86362001)(8936002)(2906002)(66946007)(4744005)(66556008)(66476007)(5660300002)(8676002)(41300700001)(2616005)(186003)(83380400001)(6512007)(110136005)(6666004)(6486002)(6506007)(36756003)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2c4U3ZWWmxoZDl5VEk1dzRTSU9sV1lGSXpEbEZVdWJlU2l2TDlseFlmTHhk?=
 =?utf-8?B?azV1ME9KS1pqcjk1N1k1bklkQzdKNi8xOG1zYzVpZlM5VEx6Q3JLZmVOWUJu?=
 =?utf-8?B?QTFkRXV3dVFkQjJZSVZxZ3VCTlRQTWNpQk5FNkhRL2laem15MU14a2V4V08r?=
 =?utf-8?B?WEIwdzJ1emE1R2h2bXVGQWFGY0VGZUNSTWpTb1hOWHhpVG43WmYxV2p6ditq?=
 =?utf-8?B?dEJneVkyelJ3NEppQ0hzc1ZSSEFVeGpRVUVZaU1NdG04NVFiZ2h5NXpEYzls?=
 =?utf-8?B?MnE2S3NkVWhwQW5qYjFqdW95d2dHZlJxcGRwODV5c04wQVM3RXQrWnNlaEY0?=
 =?utf-8?B?Lzg2VmpiN3dTNzM1enA2cTFGZ3hZaVdBdHhCSy9FY3VNTEVnWG9hajE3aERJ?=
 =?utf-8?B?Qy96dlR2TlFFQUJSd1F0R20vdWFOWU9HeGxCS0FTQVRHUFRJSkMyT29ETE50?=
 =?utf-8?B?aDBadFYzNmV2ODRXblpkU0ZXTG1TUGRGYURHR3dGZTA2UHNQeE0zQ0lTa1Zs?=
 =?utf-8?B?MGN2YklDYW15UWdEZ3R1eWVDclUrRG8vbjhGQTBDS0RVN3FGcWRsZlJLTjFT?=
 =?utf-8?B?aExwOGRMbm1UemFvam8wM0hNNlB5OHpIWGhYZnh6Zm5SbnlkaEtFNUxCTU42?=
 =?utf-8?B?YUI1UWVYUlU4SE96NGJqMmo4OWRybWt2WE9ob0cvdkFpUTVhNEtGRWRPeUh2?=
 =?utf-8?B?djkwQ0NXOENDeWJhUGdLZTV1SGRjc3VGbmIzMlM3aEhiaVBlblhQT1Jackl1?=
 =?utf-8?B?Uy9sV2krUnI2a1E1L0VINmZKeTkzYXBHNE9CZWVETHJkamVmMFhub0FrUXZ1?=
 =?utf-8?B?SGdRSCtqcnFmYUdqZmRVdFRDYUdMSWU1OCs2Y25hOFhtejl2L0ROQUt0c3V1?=
 =?utf-8?B?MHVlUTl5aFg3MHA3MGc5VldVNmxBVlN6ZHBDRVI0YUYwQmRWMXk4dnVia1ds?=
 =?utf-8?B?a2pibUNHdUJxOVo5OTExSTE3WURaZGM5eU5wT3JtL3FsRmN2MDdhZ3lpanhS?=
 =?utf-8?B?cVJsYkZTandJQUNTZ0tmV1NsUGMxSURmYzU4S3hpMENnWXZMVjhrVVJBWmxq?=
 =?utf-8?B?enB2bENmakp3M2ljNEpOYzd1UzZVeFkyaTFuMC9qaC9MYlh2RWdsWXllellF?=
 =?utf-8?B?ckVoL3BOU1ZITUxoYmQrdU4rN3NydGdkcFZEWFNsYktsVmQ0NU45WjNiSjZr?=
 =?utf-8?B?K3UxeWFYVHVrUzdBNkwzbTlLMUFLRmJicU9IOWFyU1J5WGhtUHBwVnJMR2NF?=
 =?utf-8?B?ZHJ1Y1JJS3R2NEhBOGJ1VkI0Y3pzUktPRDZSaXBrZTJIVy9WVGJERUdzTy9Q?=
 =?utf-8?B?VFVadm5uTXJkcEZNTUpjN3h4Z08wYTJVR0h2WDJFa2tzK1crcmhMMkFrei9q?=
 =?utf-8?B?RnlLMjFrLzJoRTNtckd4Q3dPT1ROVVljWFc1VHNhck4xdXpQdXhjTGg1MDV2?=
 =?utf-8?B?WmphdEpzSFVyQmdJN1lTaUgrR3N1cUFlQjloUDZnWUY3Z1k1cFJDNm5HdTB4?=
 =?utf-8?B?THBHc0FPdzdudEt5V1ZzdmpUMUJwUUwwSUFRbitQS0lLYzIrQzJ2VVBuN254?=
 =?utf-8?B?QUtLUUhXeitwTm1SWjEvSlJ4alRaaVRaWXIzbmxOT0JVSTZpNHNSUi82MlBu?=
 =?utf-8?B?UXBacVJPZUhrR2lZMzJ2RTZPVjIwdFFpVkZwSU9VNHNjMDRqOFI3T01YWGdB?=
 =?utf-8?B?dkNFV0piUkRFdHE5dWY0TkZ1WVRnZ00wWmQ4UDNjbzR2U0Q1d3pRY3pYWHRW?=
 =?utf-8?B?c3hTSDJHRy9hM001TG9ScUhtZVFYbzVuLzRwR3hFMzZwbTNGUU81ZGFwN2pJ?=
 =?utf-8?B?UFBpZThoRXhPMDVHS3RaVVlXUktBWDlpdWRxaUloZVM2TG1HUU9zYXZGWFd1?=
 =?utf-8?B?ckg1MzZNa0dPeGxHc3JjQnphVm1xWWQrbllieWVXSG9lS0g1Mkwxc3FtZEdI?=
 =?utf-8?B?aVhkRWFkcG5vTmVxb0ptSWgrN3M5ZmJsd291ZTZQbVZ2aFd5YlFDd1R3MVdw?=
 =?utf-8?B?K3owdXRTZXhxOVIwK2piWkxKNmFQTWY0bGV1alRRU240QUpRQ3psS1lFcjRK?=
 =?utf-8?B?S251YU4vVk5lWVN6L2hzR2QrbExFdjJ0cjIvZDZHTENoTjFMSTJMcjRSMElx?=
 =?utf-8?B?Y2hncVRGbXJ6VU5DUXd5VmcvV1l6T3NCU0dJbmliSzdLekkzU2VZWTcrdHhl?=
 =?utf-8?Q?VTck7nZ+C5Dj5rV0YxZlsYC0I38Ki8y3Y5raojnzAZb8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d5ab43-ef21-4a54-c0c7-08daf9345834
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 09:14:04.3407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGkuWLHVsW/WIAdju+U6Ryj3tVl3xTuEcyRb4y14ozY5fsiGxIimD4okyHBAI8MA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6005
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

Hi guys,

for a couple of weeks now the command "dim rebuild-tip" fails for me. 
The error message is:

Merging drm-intel/drm-intel-gt-next... Applying manual fixup patch for 
drm-tip merge... patching file drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
dim:
dim: FAILURE: Could not merge drm-intel/drm-intel-gt-next
dim: See the section "Resolving Conflicts when Rebuilding drm-tip"
dim: in the drm-tip.rst documentation for how to handle this situation.

This also happens on a fresh clean install of dim, so I'm pretty sure 
that this isn't a problem on my side.

What can we do?

Thanks,
Christian.
