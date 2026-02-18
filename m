Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHgTDlBolWk/QgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 08:20:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD2A1539D9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 08:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E6510E2E1;
	Wed, 18 Feb 2026 07:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IapKEE0n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010044.outbound.protection.outlook.com [52.101.46.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4486510E2E1;
 Wed, 18 Feb 2026 07:20:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLkGCbCm18SUhL8v4+129L5nh+3YJNJJEUaNCcwl52f83lKxxEukmIGDmy9luhMMpYYtW9IG1Vf0Exg3MosTksPvQeTVEypeDII0jYi0IBG+Fo01ltG3QFEkio3jBsDKVh9qDtUCp2VmIRqhxEYjNqvTna4UPuBAzBRbWk8Rs83qrfCRZ2jP34oHqoq4Oqqr6ZsCT2luH+XMzQrAMdPHTfXDUgqu15VHt5XNYVMN73NDfzHwVyzzZNhHQ/KFWKFn2+ZRe9/2IvkcnL1M1IseRa7tRoHm1cuHR8elqCLbXB79ewZIMw2jNtQdKdo795bIePEQFoxhnra6n56Yw6enTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/Lu+WMTcjP/pFVueCCNoBu483FDRZvKaRveBC/QTQY=;
 b=W+nILsB4XUuxSxonFN6Uw9a/uh4OOhqT2WhZ9eglKT7ZMcozUwUhmGp1ZdJyYrQxtVKFvMHReOG3L5TRmj6PGQEpLNIcz0n6U4QigPYzN8sRHPcCjPatcljCm/x39Tq8WoAaUN15fms+4CWx5YOQoFxCGdEEo3m9pVib/+WMmQRugrT4Ar7n7fOLFc50AjuVvHSgOLcriuyLYwcOjdWDhk4GPEDQLL0WSoL2of94VALIcWfOBVZwSYN1rmOIgv9CPDP5t8I9M5s4g/DFYFCI+Xq4TPAFRqASShbQtHJFN0kFhcwJeUBHFIRPMnqbLzlvWON0Zfv8ZhHh6IWQ1s1+kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/Lu+WMTcjP/pFVueCCNoBu483FDRZvKaRveBC/QTQY=;
 b=IapKEE0nGyy9M0s+qG8NF6NpLUtG5kBnIMgfEwMzqgaxcZJxJ/eYFA4I7zxipkfr3Ux9I5hnE1uWCn3KXXZHLJazhcmte6olYAm3hBNz31XtlKTLHA+Jswe+C95W/9LjPrT3rfC+wxpiovuixnfbLDdt1dWJVumpXyWgmIhU1/WH2gF7rZAFqlSMwtgbRH2HFG41EHlS8v6JhvnTXUewKzLpBToc2UpKvPrdWoOWmWdRbZamsp7RslwqlzBc/+saHfcGNLDHbWmrX39NRhCVxAuX81K9fZREssS3YJKSiXcTkWIP2mzB6EP8OdIjruELH4kDgxpM8OkoV2HxaoPAvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB9086.namprd12.prod.outlook.com (2603:10b6:a03:55f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 07:20:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 07:20:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 16:20:34 +0900
Message-Id: <DGHWME7KSKXW.2DIMW5UTM5NO@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/7] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
 <20260212-cmdq-continuation-v1-2-73079ded55e6@nvidia.com>
 <DGHRDFE9M6P7.L7JEOCLL3VS9@nvidia.com>
 <DGHSGO2E0U9F.2M8MOSKBNA9JY@nvidia.com>
In-Reply-To: <DGHSGO2E0U9F.2M8MOSKBNA9JY@nvidia.com>
X-ClientProxiedBy: TY4P286CA0081.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: 195f16ba-0c80-4e25-5b73-08de6ebe3751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVZYSDhzVHEwVEREaGVaRDR5eE9oMFE1MWFZNmpoSTdnOXZ5UDVvYXB0SUtt?=
 =?utf-8?B?WXdNY0t2YUxCeWZ1QlZydlJSY09idUJ0aUY5ZlhXUEF4ZDE5R0ltSGp1VUwr?=
 =?utf-8?B?K0oreFNEbngyMWE5ajV3d1NlOWFwOFc1QzRESENmN0YwbjlFRmpBTjBRTmVR?=
 =?utf-8?B?SEtVN0JLdk05MUJzMkt6Y3Vhd3FmNjNOdjdwd0gwQjNWZVc1WVhxL1NTdnRT?=
 =?utf-8?B?aVZ6WEdrMHYxVU16dnBpbVhySVJGaHIzd05pN0hmM2RtRlhadlFxTzhSeDh0?=
 =?utf-8?B?dHNWcVN2eFdGNWh1aHZLRXcrQVZlUjlYWXpDZlpYazRFY3ZKSkU1Z0hzS0VP?=
 =?utf-8?B?VkczNDIxeUlsZXVVNmNnZStLOGVpYmRqKzRFVVZWeVVRcjFRaVZpLzRsTUxC?=
 =?utf-8?B?d0w3SUJRclN0QThGVzBSQVhQQzRNbU1nYXZ1NDRTdHZjaHV6WGNkTzM5cHlK?=
 =?utf-8?B?UXNKOTFRL1RocWhxdm0reS9vd0JHM1E2anF4ODZQblpJakNoQUZ0aU5DT2d6?=
 =?utf-8?B?aFcxandCSm42L0lzb2lVc2RjOTMyZEFOODdlMnBkSkU3d1luZ25TTEJVMHU0?=
 =?utf-8?B?RW8wSjEzTXBmS0hjWXhUdFdmTzdYTklYM1piMkZWM0thelFSVkQzZTR1Zlpo?=
 =?utf-8?B?dkpjT2o1WjBWNXk1d09oUWorZ1hsNWdvYklMbHdraWF0OWRSZXE2QkFPT0Vy?=
 =?utf-8?B?RDhXNTFlb0dBa0tHaHRoc0FQcTNrL09XTnlOcW9wMFM1T3owSlMvbkVEWjRY?=
 =?utf-8?B?azFMMmp0M0h6ZG84djY0RzVXQzRGS0Jsb2RZbVdaclNiUytDQW5IbGlhUDgr?=
 =?utf-8?B?OENDQkhzRGlsM2JZMDA4cFNCODZYL1dxbFE3VU5WaHJTcjYreGtlU3p3amV4?=
 =?utf-8?B?QWU0RS9ZdkpSN0lCZStYam01ZThram9nbWpZOVE2WWo2dVZrSUNSSEl2ZlhV?=
 =?utf-8?B?VGtpQXBLa3ptUjFlc0tTRlc5emsyOFBmWGE4Z1A3aGFsTEJxSHRXcTQ5dUJU?=
 =?utf-8?B?dFVVMUpxbWl2UVNEYUxIU05YeVNKV0VaTVBPWFVDZXVQTWpNMzlKT2xOU2dN?=
 =?utf-8?B?OW1pYnBrWDJHTGw1RmIxUGFPNFBVamlpS2lTaHVjUnA2MFdMVFRodi9vNWF0?=
 =?utf-8?B?QnNXd2Qwb1JkeEtNa1NHZkdLYnVNYnIyZ0w0RloyK1BudWZsUkFHVTY2djhi?=
 =?utf-8?B?SkxCMEFINDNGZ0NqV1hMWDJFb0ttU01PNEREVElsU0ozSk5COGk2TTkyTUJL?=
 =?utf-8?B?MFlmelhXZndpUW9zN0sycDhBamt4SEt0N1Y5QnVYVU5nc2o3N2ZLN0V4SVFx?=
 =?utf-8?B?eXI2Qm1nR203WjJ1REFVSDRSU1dGRjBXbnNkUlFSRmt6SHVVWnd3OXpXMEdB?=
 =?utf-8?B?aXEwOE1ETUpxaVluZ1Z1Unh1U0toK1p3ZDRZTVhRYmpHYUUxbUZBOHl0QjlU?=
 =?utf-8?B?dFkySlZ2b3ArWDVsQzM1WTZVWnNUUFpoaDladFdNTVRUWG83d0w5cmluQnNL?=
 =?utf-8?B?eFJ5QmIwMlZpTXRjb0VWVWlGSlVGWjh6YnhsaTFsOTkxSjBHMklyWE4zWkN5?=
 =?utf-8?B?dXRNUHRzbkZEa0haaHNEdVRRamd2UlBCaWdnUGVQd1JOYld1c2xhK1dIRGQ4?=
 =?utf-8?B?Z2ZUY2FsampzTllrM0t5Z2RjREhLTVVoR3NIaDFhQ1dDWVpVTUUrZ0FYVmdj?=
 =?utf-8?B?RkdxZVBnc2UycjZPdUI0SDVvRmxRTnZrWWlpMDJQclJ0b0UrVjkrMERYZkcx?=
 =?utf-8?B?YWNCU24raGFRaERLYk5jaW9VWW1wOEpNUjRJZjlzdTltTnEwSUx3bUtKN2RX?=
 =?utf-8?B?YktoaUtvTzBveEJZbng2Q095ajRsUFplQ1BiS0gwQ3BLckZmQWtoS09hWHBx?=
 =?utf-8?B?NzBlS0kya25WcHRZWklJVStUTFRNZUwxN2pEdGpqTHpCMlJpYjZyYUd5eUZh?=
 =?utf-8?B?MTZkNG9GdmVBZmloa2xqVzBCbmo0VEtxc0YrUDdJekZmbE9KcC9ka3V3MTQy?=
 =?utf-8?B?MFc2OGpxUWVlVnZWMThNMU9OeGxZcUY0ZmdGT0ZHVUdtNTZPRzlqZkR1OVpt?=
 =?utf-8?B?WmtTcHdudVNOU0JhcWRJeCtKYWlrS056djZKTmNXLzRKMG5GU0VOK05JQ3ow?=
 =?utf-8?Q?EyM0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0Q0aU5jekZHOTYxbTVNSklvekZkZUVNSjVTankxa1lOcDZtc1JHUythRkMz?=
 =?utf-8?B?MEVvQWllM3pGT2h6YnREbUVIdnNUVmxuQkFiVEJ6V01GNG5jUS96SkVXYlBT?=
 =?utf-8?B?dFdqZklBSEVXSjRXdDR3V01vWXloUG00NTVPbTByd00yZHNVRmo1VUVPM29m?=
 =?utf-8?B?VkFRSkJZNlQ3Q3lHV0NWVDFIcjhHM2l3OVJhbEtISkRNK1pOSHlkTm9pbTdF?=
 =?utf-8?B?bHB3aWZjRWpyMlp1ZTk5MFBBTzRFMEJHN2lQZG5XZllSR1VLNndieGN3RVRV?=
 =?utf-8?B?NWJSTXp4ZXBmSldtdGVXa3d1Zk5haURuaDZ1c0hCNk5NVW5LMmN2aGVHNFFa?=
 =?utf-8?B?aEdUcnluTmlqUnJBR3orcEVTRGw1ZDlYN3B4eHpUMVZEZHBDeE5uY0FyRkJU?=
 =?utf-8?B?TEhLMVQzYTBNUWtGSmZTOG84WmJuNHFDNlRYTmdmQVZtbTFwN3U4SERKbThC?=
 =?utf-8?B?UGZncmFZbEprU1V3cnQvdzEyWGcwK2tOOUF1ZzlaQmRMcFYzczBuR2FCK0hm?=
 =?utf-8?B?MC9MOU9mTDdERnMxUGtkSDdHMW9YWUhtVjhYWXp0TEVpdXowbE5od2JDc3ZW?=
 =?utf-8?B?T3NUczhPaDlLb2d2bEVaQnZrMDhpampTNUtiYWs0WHFPZkJmV0x3a0VXMmt1?=
 =?utf-8?B?MEh1dTBaNENEaG1vcGVCbjBxNmRrODVwTjM2WG0vaTNsd054eHIxQlY4L0ky?=
 =?utf-8?B?UmJYbkZxREJiWFQ5Zmd3SXRITU9LdVJ4VGJ0RkI5bVFyOEFaYWJzWWYyNktC?=
 =?utf-8?B?WlBMeEdaWkNEbGt2dDVwQ2R4QWh6QzAzMnpnendPZExLR3FvdWpReWJwZ0U3?=
 =?utf-8?B?QXZsaVZZWmlkbXhjY2JmOHByK2VPRGk4VDZWbjlYQWoxNlhuRHUwRHQ1T040?=
 =?utf-8?B?Z0ZDTTdpT2Nwd0RhM1pGZ2tOU2FHYnhWT1JwaEx4clFTK2dESDRTeWtwRHAy?=
 =?utf-8?B?NXhrVWtmNnZsRnJVS3ZGK3ZheUE5SEltSm5ZK00zMnFUb2RLR05oLzJPSmhL?=
 =?utf-8?B?REdVMXVpbUNQZ1pMN0wrQ3RWcTErMGFnL3ZJVUlSTEpWNmh6V1E1ZlJEcG9G?=
 =?utf-8?B?cS8zN2NiQmVUdklOalZHTUJMOW5VbHIzYTVaK05aVGNxaGhPNzhkTWJpa2wz?=
 =?utf-8?B?OWZCRGw1cnBxYmlSSnpuN3hhK2pHeXNXUmdXTy8wY0FTWThXMWJXNjZHRkc5?=
 =?utf-8?B?RVI5SU95YlpuNTRDYlppaUI2ZGpjZFpzbW55bW9Gb25mYzAxd2k1cWZIWEpp?=
 =?utf-8?B?VTl0RkFRY2Qrb1R3S0g2NjYybFo1ME5lSjN0NGo0SG41b2w0cU5DTVd3cktQ?=
 =?utf-8?B?ZnBXbVRGZ2hwZ2l0Q0RDU0xNT0FIMU5RbDAyV1ozdEgvalV2SGp6c2VpQlpR?=
 =?utf-8?B?cW9XMHNVK0ZKaHk3NUVuUmhUSmI4VDRSaTdLQjRheFhJOWhqMjNiRTJ4RDlP?=
 =?utf-8?B?dzdGTVl3VWcyMS9tc3JreTE0MXlzanVFZTFRKy9sTktLbmJBQjlvTHVDZmtX?=
 =?utf-8?B?eDkrZzNKYWRYS1lVUFpXNkpJR3JkS2g1LzhuZm9QU3NQSXp6Njl0N3BjbGNH?=
 =?utf-8?B?NDZYaTRlWFFwUXRPbXFkbXF5aExWaHVtS3Nsb2QwQUtzQjN3M0NsUWZQMWJ3?=
 =?utf-8?B?UFZON2d4cjBIb0dXcnJ3MERIYUJyMkQyUXB1dGc5ZHdSdDVrT2x3R2I3NWpN?=
 =?utf-8?B?cis3TlRITTBkckM0d2d0V1FaTEZKMWxvTUw4ZGcwYkJtNU9EWW5YaGhZdzBB?=
 =?utf-8?B?ZnU0WFc4aUFMdkQ0QWNmcjVOeWJndUI0NG1zaUt2bTVkRWVDbGFTR2NOTmZJ?=
 =?utf-8?B?NEx3NVd2SEQ3ckdZaXhpb0F0d0VTRTJBenlQR1g4dnVqbDJQdXNTM3cwdlRU?=
 =?utf-8?B?WjFzNkdBTFVBZlZrRHdXb2ovM1p3cWVabFQ1SEtoMDIvSUw3NnN5MHl4MW9O?=
 =?utf-8?B?VmhwMnkraU5aYUVaSEpxVGFNMXpDZUVxWko2cEwrZ1ZleDNvU3BYMCtmVmJV?=
 =?utf-8?B?R2l1VG9rYXlUS1FKSGV0YmxoOGFqMFpEbFI0OGR2L25EMGJBNkxDa2hzbVAw?=
 =?utf-8?B?Tm9YdGhxWUZoeVRVODluRnR0WFJmOW14V2RRUW9kdEJGdTNXQTlWT2U2eEt2?=
 =?utf-8?B?cnhZVmFWZkFtQkZWaUxyZDRHbVNVK1JyZzhQbHU0d2VkL0RXb0FWbVhCakFa?=
 =?utf-8?B?MzlZSjZPYUxmcWJSWDNMQ1BJQTgvYnUydlNJS2lJZDF4L25JQ0VhSWQ5TWEz?=
 =?utf-8?B?TkZPQlFnSitjalp4K1JqRitlQ2lwMnZSU3FXWDIzbzFOdGFXSlIwM3lwZWxn?=
 =?utf-8?B?R2VkSUxlc1plMSt6TWQydDFVelQzR2tyYStRZlViSGZERmVsZ2t5UVcrQ244?=
 =?utf-8?Q?p/YqeO8+sScUgWAmaF3vJDg1BtZ2PCnzuQeqz0OJa4q4i?=
X-MS-Exchange-AntiSpam-MessageData-1: C4jpxQAqPyyfCA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 195f16ba-0c80-4e25-5b73-08de6ebe3751
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 07:20:38.8940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgzsD24LD2CX6L9WkhEQ9ZYkB1geehVw5XyOsMNtDOAXH2L24bS1XkxZ6A1GJ8tLric11gEj9pH+i0TvW/PJsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9086
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 9DD2A1539D9
X-Rspamd-Action: no action

On Wed Feb 18, 2026 at 1:05 PM JST, Eliot Courtney wrote:
>>> +    fn command_size<M>(command: &M) -> usize
>>
>> Shouldn't this be a member function of `CommandToGsp`? Please add some
>> basic documentation for it as well. As a general rule, all methods, even
>> basic ones, should have at least one line of doccomment.
>
> I thought about this, but adding a function to CommandToGsp with
> a default implementation seems odd to me, because implementors of that
> trait could override it, which does not really make sense. We have
> command size defined as the size of the struct plus the variable payload
> size. Adding a function to CommandToGsp would give two methods to
> calculate the command size which could differ. So, seems weird to me.
>
> An alternative would be to make it a free standing function. This would
> let it be used by WrappingCommand later as well. WDYT?

Using default trait methods even when they should not be overriden is
common in the kernel, so I am not worried about that. But you are right
that the use of this size is local to the command queue so maybe it's
better to keep it as a (documented :)) method of it.
