Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CUFKKdxlmlqfQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 03:12:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150FC15B99B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 03:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA87C10E652;
	Thu, 19 Feb 2026 02:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pvyFQCyN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011036.outbound.protection.outlook.com [52.101.62.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6737710E652;
 Thu, 19 Feb 2026 02:12:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWm0Ejl9a+iE34HYjNlauvkROTVcfs8rHTIcXHqMpPfU3awQIAIO9Y+wMqoHdzA0jrPemON/n7Gi79tpmaGX0J2J6avlNKRWkWdP5SnpuskoqGfFqcabXjQXqRmt+iLGslVeRKLTESj6Dv5e6zGq17kzP7UJGQY/LDExxkzaBb73whpvfPFj+kjnTXF8WzEy6/1r6U6TBS2/R6Ps5nI83TX5cYdZdN9QEUPm0cT3hMu+83v3ESR1z5+3M5mEwP2L5W3m9LyZR+zNes0rXCGPjuTUv0cpqG/FVRvdqdacb18JAwH0qkwOgZ98fkwqBR78NS9FxlNqOyo1C+WJkaOu1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LH9OaNZ6LtiSBmpGRg2ka79zt862a+QTSr4ow+hWRMI=;
 b=xXmZ6jXng7mO46mN44TOno9M+jn8m0aoMG9mollLaQLZoY+nb94VoyLB0C08dzo3zzFwEur7IGJgJBtUlrw9bC7oe0G/sl0JFbuyR8hv8Q/aAieWAQT0f7mYu47Fsbtns0PeJgMGacm38TW5BEm4PDPQnpA3r4d6JE7mpu+CtVQsg5vxoZvkn7sSvehCyA83+KKb73eDZIQkSwVCK7cxyYNlWJdm1h75LNNAqZXvS0ule/IUuRGbMNEKh15VsGXTRF1DuO3yoOt/0P4xrNyxdhuSJaBCWABbsnxtnI3IkKpYcg7o22a+etZHsrCNabtQFIMoz0eo4zGnrIkL6KYXvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LH9OaNZ6LtiSBmpGRg2ka79zt862a+QTSr4ow+hWRMI=;
 b=pvyFQCyN4/7KowCVq9WCaG5ebQNPcG4FnY9qB22w/F6bN7T8UKL+TAqngK6LMCgkDjmX0IhwvoE/w2unt+2tAoaHaZ98Ou+Z5ezJalW+RdYVhYugOgWuXuKPd6n+Ed01GncMj+IJ7EXpL0+MIV6VwERS7UVMOjMtDIObA/f+JwV+jfrA54BRUz07nXGUJx//+GLPeWvZzr4I0D2HM9Eg9gkS+ykCT34QvZsRxsiBbtbDN3DtVXzNw049ULIckMgYuG8fYWp9WYnxrkev9WimcGdActy44rWFoRCMgZV+k3dNGVohQN6pArxY1K72Re/tOPkK5CgNeUvZXKaY7QlKow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7702.namprd12.prod.outlook.com (2603:10b6:8:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 02:12:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 02:12:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 11:12:42 +0900
Message-Id: <DGIKP80A3B3F.FVME95TBM5JD@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Gary
 Guo" <gary@garyguo.net>
Subject: Re: [PATCH v3 0/8] gpu: nova-core: miscellaneous improvements
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
 <DGH7DVJRH25E.2C9F743QLF6IA@kernel.org>
In-Reply-To: <DGH7DVJRH25E.2C9F743QLF6IA@kernel.org>
X-ClientProxiedBy: TY4P301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: 854b16e5-53e5-44b4-d742-08de6f5c5fb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0tkdTFRVWRERVlLYURQbytUZkhqbkpMbTZidnRmSXV4TnNvK1FSTXc1TnJK?=
 =?utf-8?B?bHhNeU9LZmVoVC9SdFJqZ1RrZUEzeFFORFk2aXJDWUttOTNIUmc2YWNadWhW?=
 =?utf-8?B?bTIxZUw4MnI4SjhwVG9oSFBmWG5aaXdtMEh0S1RxZjNEemdzYTFyWGxaeWRx?=
 =?utf-8?B?UGFPR3RtWm9Welg3L3I5TWZXbGp6a0ppeSsvWGQvaU11endSM1AzTkFDdzRP?=
 =?utf-8?B?VGk5dDJxZUtSY3FsY0haQzR0V0VUdGdPMVFsV0pXcWU0SjRCSkZkOFV0WnY2?=
 =?utf-8?B?QlB4MFB1NGNRazljTDlmN1hzVm92R0hjWDZuNWlwL0V1bHBYUVFjWmsySWpW?=
 =?utf-8?B?VVFEVDQzQXJ2d2I1RmpLU2psMzZCSnNBNVpYV05PUWYwNkRYdFlSTkZZcHpC?=
 =?utf-8?B?QVBBM0tIZGxsWkZtWnE3djdVSVZ6ejFuQUxBSEMzV3ZSL1JETC84SEpqcldG?=
 =?utf-8?B?UDN5RDcweGdkOVlJUm1odlB4OHBKdWlPSWJaVVA0OEV5SENZMzR4U3gzekhz?=
 =?utf-8?B?Ukx3S0Q0dk8zUktzZDI3QUh6ejVJbmgvb1lYVXdlejgybjljSWRzTzZ1aGlJ?=
 =?utf-8?B?ZHlzbGpBaWRQNXdGcmpIaUU4MDl1N3BsMFRuRzA1U000M1c2enNCcHhsZmlE?=
 =?utf-8?B?cmloeWZRNXVJUkhFUlp2V29USzhBT0J5eWhtSTZGbTB3NmxmZGp4ZjdkYitU?=
 =?utf-8?B?UTUxTkQ1T1lweTJLaGxFQzZYNlp5dm9ENjN3ME9qa1ZmK2tyaWp1Q1dBTDJo?=
 =?utf-8?B?YU9XenJ5eUxUd04xd1hTSXVVSzJFcVUwM1g4Q0xMQUhhOTJYeFlXY2dxNytk?=
 =?utf-8?B?MlNCMDVxSkVYOXRseWtzTzB4emNDL1dVcGlYd05CQ0lIOWxVQlF2S0xFdnBp?=
 =?utf-8?B?STh3dzBOeVIweVJyVy90NUpUWUptYlV4UDBvelkydSs5cmRXdlJZUnlPdjd1?=
 =?utf-8?B?VHBnYmRVTkxrNWwvNURVUTF4WXF4bXE0cnB4cytlR2FmekkrVGIyRGt2NjVv?=
 =?utf-8?B?UU93UEd5UWs1eFk5SG5CdjNIZDhwRnVSNjJqUXNLSEFHeVFpdU5CbERQUDAv?=
 =?utf-8?B?cWQrRmU2eXpDeXVaWjVweGsyQURya2pvYUlVeFFhRlFHTWI3cmE1amhObjh1?=
 =?utf-8?B?bitjYlprY3VoeVZzUmZDV09GZ21TeDFqdmM4QlMxSXY3ZEtpaWF0NWhFNGRD?=
 =?utf-8?B?YkhOR0FKVldUYzJNeFA4REp5ZXJZY000UmRtamtTQjhyTDhkTElFUnZLZ2hy?=
 =?utf-8?B?cDdTUThBTzd3MzJ1R1NTdFQ4SEFMeFBpNXk0RUpnTjVOMEdpTHBGWXJsenBa?=
 =?utf-8?B?NTFvY2RHb2w4M0I5eFZJUDg5MXIyd3NIdzcxMVRjWlNsOUpZMVVJUEdyOTdE?=
 =?utf-8?B?TkVXejYrdnU1OXdGekhlbG5ERHc1ZEkyWjE1am9rRllRL2VoYytiZnRDUGJD?=
 =?utf-8?B?V3N6SXkzb3NLeXdraHQxemhQM0VmNHZYUEVqaWoxQ2Q5WFNCa0drRHlXNVZI?=
 =?utf-8?B?alk0QThyOGJBT2FiTFJCRkhxazRPVzQ3b3hrSE5YT0lORWZaUVEveldsdkFq?=
 =?utf-8?B?QlJ0Slc2K09PTjczR2c0TVRxM2pBcm1oKzZyWk9XWFVjZEx3ZVVlS0xucXNk?=
 =?utf-8?B?Z1prNm55OUhlOFRNNkkvWlh5UjI3ZTNJcThFWkVvUmZwT0VXVHRuczE5R0FU?=
 =?utf-8?B?V3l4VTVxL0lLNXZOZUM4OFQyZGtYUHoxNUtacERSVktCQ3Eya2xMeDg1QkY5?=
 =?utf-8?B?UjVVR3U3VE9nRHgrNHFUZU4yS1EyNkNlMlp0cGRoUkhzTWVlV3VYMHlpRkRN?=
 =?utf-8?B?QkZEaWJXMHNJb3lGUzh4bUZMUEw3ajhDaHhCY0R4L04rSm9rVEZRZXhMMGpH?=
 =?utf-8?B?dDVEeVFwczZxQlo3YXllLzZEYlZMbUlWRkpoZlQyS0RKT3Jmdmgvb3RWWk5Z?=
 =?utf-8?B?cU9rYkhzK1lacDdXd2lwTlRHNTJpQ3hzQ0JpQnhoMXJ5RHJ2dW16aTJFY2Jq?=
 =?utf-8?B?RE5mdkZBamhYT3VBMVhCVTRMM2ZTTjM4ckRUMDduWmdZKzhldlpMM2IxNWJu?=
 =?utf-8?B?UTBJb2RqZkk1aU1NRXhYeGNwaW1KWHROZnZKdmdDMWtMSnYyUytJdU5aV0tF?=
 =?utf-8?Q?Hfzk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzFRa29QYTBEOGgvNlZsSG5Id3hHY1Y3YXZDVjd3YlZWMC9QaFdHZC8xRzZ0?=
 =?utf-8?B?RXlYb2JJZENhRERFM1VadkEvVHBqRTg5Q3FITWg1Vk1JRi95ZlpDMm5SSmZa?=
 =?utf-8?B?WFhHNk8zZnJTcjF5VmplSnkzN1A1alpaL3B0UHcrNlljVDZJU2ozNVAzUEQ3?=
 =?utf-8?B?Zys1V0xZZXRKTkNHWWNvY3lDaUxUdjBuS1JhdFp3VEpjRkVobDlzRmRKMFB3?=
 =?utf-8?B?Mm0xNDV5bHVnME5JZzBkcEtpajdCMUVLdzdFODc0ekcydEtTQndYRG10Vk9a?=
 =?utf-8?B?L3BzckNsZWVBSlA0VDBSc2tEeHRXV2I5eU9mZGdVVlo4RGs0YWlPVTJjWjhs?=
 =?utf-8?B?Q3VLVjhLUTZWbUVBRmUvSnBkdUliUVhuWm5yTFpTd2V2TFByVml3ME5ZNlN0?=
 =?utf-8?B?Zmw0QzNNTnFTOE9tc3o3Q3pUTWY1TmNtRUxOZGl6bVdYZHRJT2psVHFWMFdv?=
 =?utf-8?B?TW5nRmIvTk9SbWxENlZlczJoT0V0b201S0pIMDFZVlorWkhyNnZnRzlWZWJl?=
 =?utf-8?B?aDNQa2JEY2N1UFJySXIxdDkvMXc3OTJVUXBrelBvSzdYejZQMURKM3d6RTUr?=
 =?utf-8?B?bDh6enVHMW13ekFwaVdCdkg5a1hwelV5bEZxM3M0Y1pDVk1rYTN0YmM4YlBz?=
 =?utf-8?B?dng3azI0NnNwcmNySTEzRm9iZTZlMTUrRmZ1UUtYQitHcVR0YnMweHpnd2Rj?=
 =?utf-8?B?Z29ucGJaajJLcW10cVQ4MW9hUnV1MWJYYk5oTU41ajZRbUdwa1hzcysyTEEy?=
 =?utf-8?B?Q0tMWWVEZmUzWExZOXRXajhyWnFEVEE4eU8xVkJyaC85TnRHclpTOUxGaTJS?=
 =?utf-8?B?V29Rdk44STB6b2hUaFRDSWloTmYzNTlTbkxJbjVSeTdYcUo1QllVcTYrMTdH?=
 =?utf-8?B?aHZ3U0hVc3pvQkwxYmxyak1sblg4UkFScDkvM29DTTZMSXVZcmlQVUhnSk9B?=
 =?utf-8?B?dnNCcWhVTXE1REZ1Q21YcWZMVi9wbVZvakdQMEpzQjMyRmcwbGh5c25GMkxI?=
 =?utf-8?B?TC9WZnkrbUx5bWl6cEJ3a3EyNi9wd05NbkZKZmUyYldkcWhFenpPeERkSy9R?=
 =?utf-8?B?bUw1dXRBUXZUQXNjZzFEb1ArNkV2Q3phYjZvS25KZzZIMkplV29BcWZEMzhu?=
 =?utf-8?B?SXhod09tUHhGdnh3bzg5Wnk4R2draElySTRSMHhoeWVmUEdnZlJZNU5GaUVj?=
 =?utf-8?B?VkNNRXV6ZktsZFhoM3RSbTlvN1JNT1VNUXZrTCszRnFvZmlFbHllMCtQWVBH?=
 =?utf-8?B?NjVvdDc0RVNORjB2WURLcEx1SWdQRjRxR2NqMHIzRWppSzZrQjNHSVlZMGwy?=
 =?utf-8?B?V2lTUEhMMzNLeFp5ZjJQam9QS3haQWtxT3JkU1VrZ2trK0NOY2J5Yk5FZ1dL?=
 =?utf-8?B?R1hRK05EWnlYdXp0Wk4yZ0ZjYjJKT0VMS3lOS25NWjk2WWtrY1VxTlFlcC8w?=
 =?utf-8?B?NUlEVnBNYzFVVHZzUDl0c280S3ZDQUZWN0FFbU1HeW9vMUV0bFl5TGNNMEYz?=
 =?utf-8?B?TkhRUVZ3cmhCY1pQeXNCbUZPZXdhV3I5cGhVcUs3SUg1OHR0eW5ZbEVMbkI1?=
 =?utf-8?B?aGE0NUswM1FWU2JlNllVRE9zV1dtQ3ZaK3BCTlFnblJ2bTZMclBQZTRiNGxC?=
 =?utf-8?B?WFpJMHVXbG1tTk1tQUdieWFFdHlPYlh3Q1EwWS9jNHF6MGcxa2I4eGFtU1Nt?=
 =?utf-8?B?TUlBNHN6VGlRSkF3SmJZYWt1YVBKYkpkUkg2L2I1TUJpYUpqQUE4RzMxNmty?=
 =?utf-8?B?ZUsraVRZckgzNzhOcTBVNFRlaE54dmdYYnVMbjdXU2M0blV4a1hxci82endo?=
 =?utf-8?B?dUFRTGdRTDZ5YWFob3d3ZVJneitjOElHOTArTVhJQmlWWnpiTkR3b2l1K0Qz?=
 =?utf-8?B?M3BEbld3c1RnQk9Rb3FBelZGYXlTdjVHUi9rNkd5M3pybjdFYXZ3SDBtTDR4?=
 =?utf-8?B?bUFzOEVOenBPRmJFcHlwbURXSldScWlQNHhmYTd5YnZhaTRETUFPY3g0bG85?=
 =?utf-8?B?K1VaYVdndUJOQkF5SzhvOFVKREFQM01jVDNpRkJRVGhLdE9FS1BhTHJsOHFI?=
 =?utf-8?B?UklKK01hbTFZMEw0WUU2NDVBYnM0MFNCbkpPU254SU1sWkhBcml6bEdXSjY1?=
 =?utf-8?B?eFRTdEVKd0FNZUxpdTIvUFFUbm53b0Z2d3R4NVoyS1F3NDZSYWZyMUxqUzBr?=
 =?utf-8?B?TEc3R3JMK3RLR2VhdWxrK3p4WFNNaFNRcFhiaHUzU2FEK2hiMWhJM0kxZjBZ?=
 =?utf-8?B?c0x3cGM4OVdhRU9ETnM5K2FVMjhHYmswTlNRQzMzTUNYTWxoSVdDc1FuUWxz?=
 =?utf-8?B?WUM0cDBMTW8rRUpXQlcwTEV2NlljemUwRjBPZjIvUEs3enh1SnFidUc2RzZj?=
 =?utf-8?Q?tLpAxfCXUc/dhsB4iAZBPvh6rvLZJ/eLaJO3b3zfWgxNb?=
X-MS-Exchange-AntiSpam-MessageData-1: M/YfxZxc1qY7Vg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 854b16e5-53e5-44b4-d742-08de6f5c5fb5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 02:12:46.9940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8YACjlrMW9m5GffYAhcXQKim1PS5Aggia+ayGEs+P/DMLUOoKeiZ5o+6k/FpBFWQDpaBhogx9SA9fB2iPiAug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7702
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 150FC15B99B
X-Rspamd-Action: no action

On Tue Feb 17, 2026 at 8:33 PM JST, Danilo Krummrich wrote:
> On Tue Feb 17, 2026 at 3:45 AM CET, Alexandre Courbot wrote:
>> A few simple, loosely-related small improvements for nova-core,
>> including reporting unprocessed data in GSP messages, removal of
>> unnecessary code in GSP and the sequencer, and leveraging the Zeroable
>> derive macro and core library's CStr. Probably nothing too
>> controversial, so I plan on applying it soon after -rc1 gets released.
>>
>> This revision is based on master.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> With my comments in patch 7 addressed,
>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>

Thanks! Staging for applying after -rc1 is released, with the comments
on patch 7 addressed.
