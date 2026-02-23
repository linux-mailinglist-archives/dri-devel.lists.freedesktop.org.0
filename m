Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIjBNgHKm2kJ7AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 04:31:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DBC17188B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 04:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A928110E1F7;
	Mon, 23 Feb 2026 03:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PhArHXti";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013062.outbound.protection.outlook.com
 [40.93.201.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1752110E1F7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 03:31:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJgyjQdsXlI6wvQlVRf7zyCdob1WHgc3EywCZZWRJKSlDzpfBW+0lQoUBOyYi+fKzuDyJGWG5Id6QR1ZXOLnPtkCqdFfgQrwUK816k0oeg5m1G3Z1z4v11/0yR9fs4iV/rQLXuXdCK8VGytfuhzRhEryNUd2uskorPZ494rzA6tyUJCKDa7aYHc9HpFPsPUJRZIGc6daLZngTExXRGj2ftbKeTO2IvJZPJ9trPKnqOr6MReckYRVWy49ekJowLl7VnTRGXgbU6qvTNfZlGuXCYKW4ZnEwdi4rPA4q/eV9L3gza/hfgkqDu3mXEvcrUyEkG496uoI2QHiaCL2IwPBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPwSPZuYT0pLRS5CEH1JrZtgs3kXB+z3k4vahPZiKNI=;
 b=UJTcvmWf9mSPrYiUW1eLSRIUJg/hSeVzGDFGHHiHfiqnpLAB8eeaOEpF3yJT/wji+BQ6cmvX80H4g4ybcsK9LwvyHmMsD31bbv/sttNo6FiQLg3kW96eMc7WMO9Jp0HNQbSbRqZUUQEyDOFTuwlQ0dYmChpkzXIe8ngqOrxyXQlJHQnMGUz847sW/4l2G/ilRNix8XbDl3kg9iSmwoL+Qc9k3p8cEiYIBg60141CcVkLrHSbaxiloyN/Vax40loknFQHj5/2CpRLFoWLHQFE+RR4SJzmljSR9p58uNYmN39IN7HXqx5Hy2+Glhc0JlF+Kf4wvcopOzUYWq99i2HXVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPwSPZuYT0pLRS5CEH1JrZtgs3kXB+z3k4vahPZiKNI=;
 b=PhArHXtiMTBtroWYsb8VaSgv0jwEcJnvg9sODis6sSUmqlPWmtk8IxM41odp+0RRoh999Y03bqxa+OY60Gyi/byx1pFMqHuCyKmJIhOZT8fkH/ByM4o+ak3LSQyrXulEo2c1Kx3B5jD674dKShOx+HN+uiG/NW6rMYiOEWhQHEPPJN7V5ufmG41IQIQ9aycAReroqsoji0WRebI1aTnqTUGVRmB7/2eTIAHcNaYfVhiwzVqEqf6tohNCyulKKTBHz3Zil8ZA3wLto5/qNtp0wXt8bM00+5HsQGV4LjdlkVgswPWYHbEuu0C8nFraN/MYbp0yXxjti8kZRyGK156vIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA0PR12MB8908.namprd12.prod.outlook.com (2603:10b6:208:48a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Mon, 23 Feb
 2026 03:31:05 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 03:31:05 +0000
From: Zi Yan <ziy@nvidia.com>
To: linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>
Subject: [PATCH v1 06/11] binder: zero page->private when freeing pages
Date: Sun, 22 Feb 2026 22:26:36 -0500
Message-ID: <20260223032641.1859381-7-ziy@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223032641.1859381-1-ziy@nvidia.com>
References: <20260223032641.1859381-1-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:208:530::15) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA0PR12MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ad93ce-7c4a-4a12-6284-08de728bf9fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REt6QWpFdFFoN2c0M2FROG9SdXJ0aEhreVhjMTlJVENCV2pwZHpGeDhQWUtt?=
 =?utf-8?B?bjR6Qjl5dzcxY2hvUWFlbm1vQ0RPOHZuSWU2M05DSUNBcWNsUHNic1RaTDZW?=
 =?utf-8?B?czl6QTltMlB2YVRhaDJKNnFnVG1jcFZBVXpDK1BlbXFlbXdEOXZscjFCVTBt?=
 =?utf-8?B?bWl0T3RFNGtsMDZ5YUM5Y25sRThFcmhLTThqT3FJK0Yyd0pIR2lpeWVnUXM1?=
 =?utf-8?B?cnVlTkE5aGJCVXhhS2hDZ0Y0UWJycGpVLzNyWktKNTRWbUozWWx2QkdhTDhN?=
 =?utf-8?B?UEZSK2s4K0RFekJkZW1DVXczV1Z3YnEwSG9pNFh0Wm0rOGk5elBQcWVRUzBo?=
 =?utf-8?B?b1lLN1BYMXF2RTRzK2UvOWR5SkVhU2JxZnNCVFZpMFZ0b0tZTHVSb0VoYXAz?=
 =?utf-8?B?SmhKUjF5UGZVNjhpSG1zS3l4OXhjQ1RNNnprTGR0RGVuMG1teXVqSDJBcER2?=
 =?utf-8?B?YW1MNzF6cTJKVWZTaWRSdGs1TzNWRkhJVmlOV29mMnRucXM5SVg4SHdKbGJO?=
 =?utf-8?B?eTduRm12UVBkMnB6R1BFUUZRWXdDR2p1d2wrd2lSOTJoZEcwYlRNL3hQRXFq?=
 =?utf-8?B?YitkbHJSYURLd0pPdlNHYU1tNjl5b3diRmFnNEN4U2lXUVVLL1RFUjBxVjc1?=
 =?utf-8?B?dWRCWG5pODN6VjdST2NpdXZvVTNHbEFzZFo5ZlRmbDR4ZXpZNE1HWlRzaFlz?=
 =?utf-8?B?elZPT29vYlBEcnBRcE51YkphOEtFM3FzZytFbnM2cVFmSHUyR3dKS0Q1anls?=
 =?utf-8?B?R2Z2OGtPb2ZwYVVrc05ZekhZeW5seUtIL1ArZi9aWGlKMnNJcmh3b2QrdHpn?=
 =?utf-8?B?b0dsUW9WZmpnMnRVSkNKdmRLV0h6UmwzQ0x4QWxjUVlNRFRRUzZKK3VUZmcr?=
 =?utf-8?B?Mk1NUWZGb3hGaURqWXRZSkY1WTV6aHZ4UlRPTEhFYlY1b0tYNlp6eW9td0l2?=
 =?utf-8?B?b2FueXo1a2I4aEdORE1HNTNwU1pYdFZYWkpBeExXdzFWVXpsd3MvYUVzWWR5?=
 =?utf-8?B?YnFOODFGZTY0QmQxSDNNcGFHYzZBSUlUbnJucmd5V3ZiaWs1ZktuaWxpVGxK?=
 =?utf-8?B?eEF6dlgzdERTY0o0M3pjeEhhZ3F2bjZCUGdlNkhLK0IrdGJ1Z1Fackc0bnNU?=
 =?utf-8?B?bUNKc0ZVblBqa3ltRDhHWWdSdmFTMWVhcUUwOG52b2RPb3VTVUFnZkpBSkVq?=
 =?utf-8?B?ZXJuRm5yMDFwNFFhQ3JxbGx3U3V6QUtxalQ3UGtEYVdWendwanYyOG5CVmIz?=
 =?utf-8?B?dVU3WWJMcUxPOUdmc3ZJNWlnbGx3UGpFKzRLdWxRNlptTHNTRVFkSS9UNzJ3?=
 =?utf-8?B?ZVdnZng5V2pTTklWVThwUVdYMFNkVVVwZDhNZy8zY0JGR0Z6djBoa01wR3hs?=
 =?utf-8?B?ZGpUMnVNTCtqaURrQ0F2Vk5UUHhEdERHZytNNDhxTGxJc2JNZjRKb0NxSUUy?=
 =?utf-8?B?aS95a2xwVEFEN3VxV1dtamR0TlhtY0UyeVBPdXVITDY3TGpYeWNYcEpGM3Uw?=
 =?utf-8?B?OGFOc3hTRzY5b2t3YVBZNURzbkxSVnRKaTg1NFZUaVNlS04yZlY4dUlCQURX?=
 =?utf-8?B?bjl4SFpjbWNybFJTZk9RdFRtUW9hMVh1N3czOThodzBuTUZLWmpTWUVrZ3pY?=
 =?utf-8?B?eUMweU43YTJTNldYL0d4bFBidTMvZTlkU2pNMjNZSFkxN3dVR3lmdE5CRUlz?=
 =?utf-8?B?dTdwSElqOTFBQkhnMlRBVHRSSGJ2eUpYTGZwd3N1R1hlcmtjZnd6S1ZrRUV1?=
 =?utf-8?B?WHR3azg1SURPaEV3ZGZqL2wyQ1J1eHkvellLUWoxOCtsLzNzalBDazdKbXRW?=
 =?utf-8?B?ajNna0V2aXlrYmtiZ2JrQ1A4WndRdS9qU05CRnl1Y01Ta3Nwa1FXZXNtZnVM?=
 =?utf-8?B?V2J0Nm5NSVBLVmZZdS8vTGlwSmtSdUtETk1kellHSTBMMGgxNEk0RzFLY3VP?=
 =?utf-8?B?eElFbmR2NTlPelVWa2VGOVRiQm1VUW9VSEhIRXQzWm9XZ3dLZElVNWFFa0li?=
 =?utf-8?B?QWFaZUcxeWNjM1F4eVZYb0d1cCs4aVRaTktaS3VSL3pKVTN4dlVkbXhBS2d1?=
 =?utf-8?B?UWZzbDIvRnZFd3ZDcW5rVDNxZjQ4MXkzRDRIUk55V01qV09iNWFIM1RXSWFL?=
 =?utf-8?Q?joHY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlZ0M1N6OXNUN2o1WFlEN1pHcHVneVBxMEtyc3Z0Y0lJSjU2UTNqOUVxR25R?=
 =?utf-8?B?N3d5bU9XdFd3aDN1TEI4Z3FSUkdPYUFQREdkTVhlRkt3Q2UzcGJrZnNXM2c0?=
 =?utf-8?B?SElpekVzV0JNKzRqU0pFaStwVUlaV1RZdjdwTmZRallGWGNmcGlMNkI0L2xF?=
 =?utf-8?B?ekVveTVXL0U3c1RWbTRxYzJ2dHFYMHQ3cENTK2Q5VkFKZGtUdVV0Qlg4aEtG?=
 =?utf-8?B?MW5tZkdsdHV0YjFEM1QwUTAyWWVCNHNWOVpJTk5paHdUbzgwT1dQTlJTK1Mw?=
 =?utf-8?B?enpqc2ZFYzk5S0VJZSs3d1JWazFDM0FCSnRCMk1GRGlJUkZPZWhuTHlrVXJN?=
 =?utf-8?B?T0dZQXZxSnVmOEs2bitrUmZRa2JGai9YNW0vdzhKRDNVdTVmN0tQa1k3OTRE?=
 =?utf-8?B?YlVpL2F4TkExcllYRDU2TXdHVDZBRjV4d2s5ckxleU85bWo2c3c3SmxyUU5D?=
 =?utf-8?B?ejRFSmo4L04rS1NWM3p4VEhhby9RZjM0NnhCWENoeGovdHRFbXdqaS9vVHNR?=
 =?utf-8?B?dnVqNW1PeVhnUVlaSGNOb3V0U3Q3ekhyUllYMEN2UFJuOUk0WURENncvYXY1?=
 =?utf-8?B?elYwK0xLRzFuVEV0YlZxZy9QRmxxNFNZeHkzdWJmWWFaOE9VRng2TGtCMlhP?=
 =?utf-8?B?NzhVWUNDUDhmZWZHOVZPOG5lRkZXUldBdDRIZXZYaStPTmtIa053VitkZW8r?=
 =?utf-8?B?RzN3WXE2aUo5YkxxeGdKaFRLUVpCT2ZQVHViazRQanA3MEVTdWV0VVFoOEV5?=
 =?utf-8?B?V1UwYUYvZG5lZnN5cEFNSUR1SzJjeDdLWFdtZm5hWlVINnlEbFZEdTNscWN6?=
 =?utf-8?B?VldxSnFxRm5heVBvTzkwTUpFcWxkSkI4bEVIQlFRTXpqQXlVVkpZY21hZkdL?=
 =?utf-8?B?WmJwZWxOa1UrY2JvVHJKVHhTYTNscnB1QkkzTE1GMDl0c1pGZ0JBTjlYSTE5?=
 =?utf-8?B?dWNLa2tmWTI0U2w4TTJNMks1K042ZGxjRlVVSmtYRzhodU5uM3Nvd2N4cThk?=
 =?utf-8?B?d1F2V3F4WWF6VHdUY0JObyt1dXFnTFFRR2QxNFJGeFRCYXU0ZTB5S25GYm00?=
 =?utf-8?B?K1NpbE5vWmV0Vm5jLzBNdXVOVW9Ma05iclRzT2hjVjJGSEFKREV4WG8zUC9M?=
 =?utf-8?B?ZXczWHBCMEc2WUNYR050YmI2SWd4TWtnMWh6eHpNSkVkdXJqNTBySFdwenFR?=
 =?utf-8?B?ME8rdVpneXNCemRuWVZGYzhsQi9zaklubjgxNlNxTW5xenpLN3J2bTlSVllS?=
 =?utf-8?B?VnFMVXVPUyt6eHFZODFyWXUvY0x0cjJ2UlppREFMc1VzdXR4VTF4YXRNdnpT?=
 =?utf-8?B?bXAzL2lLaDNwdjF5alA1ekhncDFXSlNVUU4ySFVHQXpZR2Y1bXlVMXl0UUwy?=
 =?utf-8?B?YTBobDVUanFySkIwWHVEUXpoS1p5R0tla1k3RUVtbCtON3hnYk5tY1RmbW1q?=
 =?utf-8?B?dGNBSXdRdk1xbUt2VmVjOUVRZ3VuTWNMWHlPZklTMFpHbG55dW9vVmVGd0Fu?=
 =?utf-8?B?cDlWVmV2QklVc0pXVHZycGQwMElRWkpkZzNJMHQzR2huYmNFN2prVXlhbmZW?=
 =?utf-8?B?cUE2b2FhVVhhYm9FMUtuYzhBTU4yeGpxaTVST3BMS0pxdXBtRWNCeTFaRnVp?=
 =?utf-8?B?TlZHNHEyRDEySXhZTEV1TWpBV2tJbU5ST3RKcXRUb1dNSXVlTU9QeDBQdi9K?=
 =?utf-8?B?SE96dzIxOGNmM0VDUDJaU2ZNaTBYdWd0RENSdUo3NXpFWllmV3ZLY2pKT2NK?=
 =?utf-8?B?TjVMYVRkVW5XTWNseEZQT2J6THpXcFhmU1dwaUtPWUNLdTMxZ0lBbWR1YXV3?=
 =?utf-8?B?TnBuR2lxWGl4MU41ekxKUFlGRTI2VzNpQmhRVm9kV0V0dHpTMWl2U1c1aytN?=
 =?utf-8?B?d1FPNnptS1IvSUZkMUJPcGZGcHZIMWxIRGh1b3Y4cjZmR2NpZC9WWGhHOTR2?=
 =?utf-8?B?N21JNDVJMGtvblhpSnkyOXY0SzA4RzQ4ZGFJUWZabUhXMjdYWlg4emFsaWJs?=
 =?utf-8?B?V29UOU1zMXVOcTNlVnZNVXM1UkRVMnd4Z085Y2dZRHZ1c0hTVGlqVHhTUmg4?=
 =?utf-8?B?YS8zaXdoZjArWXFTYVVmSG1iUjI0QUc0YU1GakcxVkl1VkRjeGZZNUdYZjA4?=
 =?utf-8?B?Z1o2RnI4akFWYS95OXpNalJOdko2SU1VZGswWDVBMVR6ZWxZWmRZb2NtN1Bj?=
 =?utf-8?B?OS9zUTZseXk0bDM5SDFmUzdaN0k4Z3pSTWpHdlFGbTY2RHFNTExVZmIyZU1Q?=
 =?utf-8?B?eGJmZkltcUtJR3BLSHhBS0VwWFA3NFRTTWR3U1h3Z3Z0THlTdTFvdHEzVlZw?=
 =?utf-8?Q?lgxalO0IKmZrhf7hqj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ad93ce-7c4a-4a12-6284-08de728bf9fa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 03:31:05.4064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRX71ZWlQex14K1nYic6/2dxhfQQT1HfamY20a1W/YOoSFfYJ6r6Z5KeEhj958f6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8908
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:david@kernel.org,m:akpm@linux-foundation.org,m:linux-erofs@lists.ozlabs.org,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ziy@nvidia.com,m:gregkh@linuxfoundation.org,m:arve@android.com,m:tkjos@android.com,m:brauner@kernel.org,m:cmllamas@google.com,m:aliceryhl@google.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ziy@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,android.com:email]
X-Rspamd-Queue-Id: 70DBC17188B
X-Rspamd-Action: no action

This prepares for upcoming checks in page freeing path.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Arve Hjønnevåg" <arve@android.com>
Cc: Todd Kjos <tkjos@android.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Carlos Llamas <cmllamas@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder_alloc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index 67a068c075c0..5c960513c7bc 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -306,6 +306,7 @@ static struct page *binder_page_alloc(struct binder_alloc *alloc,
 static void binder_free_page(struct page *page)
 {
 	kfree((struct binder_shrinker_mdata *)page_private(page));
+	set_page_private(page, 0);
 	__free_page(page);
 }
 
-- 
2.51.0

