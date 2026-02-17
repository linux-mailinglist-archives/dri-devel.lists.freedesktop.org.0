Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPcBAXTWk2li9AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 03:46:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF0314885E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 03:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982FC10E1CC;
	Tue, 17 Feb 2026 02:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="me17+pUH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011012.outbound.protection.outlook.com [52.101.52.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0587A10E15A;
 Tue, 17 Feb 2026 02:46:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJWNtUdlyLMtfsOL3gOMaiCwtJcmjdQY/+sEaJQCk1tsOn22CjYmFtBuonAtK++8J3Qw4ZtE+SxfRCBbPOEC34alZBpwe7G2pEmK0KZY5gol3vOMQVLwprSFJ7WK9OwLWDduQSIODPkhdUbViL1qiYtz0ozUIlIzvytU7lCnNNgf5vFITo1DLbwgNj8qXtN/MBMtNgrODxnWh6QZ1Yii//bpnzgKVa3LXRjD2uROfgUjsc5JXdQB1gMFwJq8jb052lAvEd7ZkDxGvWvy7ya+A5iyx9Ug0xLoGCxXhXLyYCUGim6FFGfLd+COWeQx8SY7l1+u0FhqZEWfbJxEK+dW1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2P40+2+Heq/Mo3QlYNkKav1I5H2ykfrDM3bOpwkr8BE=;
 b=G3lsuo2DUXkkZ5HuRDS4qqRs6245AnqrSawofqyxuf8LAnMvFZUW/pVlIrnrTvJqZNNfyEmVjugMVRx280BmzdueMxY0IAYNsbd/P0DTDtC6Q8bLhAtwCFMILQu/zTD6IQkJjHgciw9AelYkkroZKml+shqZANNTl7fNZTHkxiLVFZfHNPnkt/duHjRgNKHSwIHAhfYwBzF50DZJvh8y4hRQgl7eS/4wgm7Ha8rGSx70V9dJtBGx2AaD0k0PdqdD4OEZLabPEhwrwtwm3U+KkwmnOCxU8uQGvPbZYmafxMUfEBQAkfeFAmoF4r3558Fs3YK1rWIUbiPAn0EAn8CvJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P40+2+Heq/Mo3QlYNkKav1I5H2ykfrDM3bOpwkr8BE=;
 b=me17+pUH2dNh5d0gePN0dKxeLFz01RfJ4jGcU0mTH5FCoQ554MvgDJ+y9kQHfXep+g1sXFxzTpYztz9a2CXhSP1LVTorDP+f/hxg0is7uiUe1J/wLkv0mCIrQQ+7PBFMl1ap0Iv8dImrTGhAH984sJfhhBq0i3R37LeqN0gBHkONpjWVHViOUMxDJ3UZyJkVTofNpF9S9ONe4w8Djs9VjvIFUmrpJtDLolrBf4K3yE8cGh1mod8DUjyDIxXaLa5OizKqyt2w54I1vh4IsLltvTRFKPUXqaVjVqjE9eld6bq5J/vlF9N6pX0b+Othj5rCP0eMaI5vqvjY8af4ZaLbGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB9476.namprd12.prod.outlook.com (2603:10b6:8:250::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 02:45:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 02:45:56 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 0/8] gpu: nova-core: miscellaneous improvements
Date: Tue, 17 Feb 2026 11:45:48 +0900
Message-Id: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22MwQ6DIBAFf8XsuTSwKmhP/Y+mBwSsexAaaEgb4
 78XPdmkx3l5MwskF8kluFQLRJcpUfAF6lMFZtL+4RjZwoAcW4G8Yz5kzWZKhgmrejW0VjYjQvk
 /oxvpvbdu98ITpVeInz2dxbb+q2TBONO1cVzUSgrZX30mS/pswgxbJuNBFfKoYlGtUUODbScNb
 37UdV2/mKo3Tt4AAAA=
X-Change-ID: 20251208-nova-misc-1d797b5d64f2
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0213.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f68c63-a9b3-47ae-8315-08de6dceac80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0Y5SnZJMFhFRXdFaVI3bDdmUTUrV1JsQ3gyQlVSVjZYaUEzK2txNGNFQWxJ?=
 =?utf-8?B?ZTRyMVIvSGJ0SVNDS05XcUtva013czRJRzV2NzlIWFRKTFl0UVA2cFl1YU1W?=
 =?utf-8?B?M1BwOWI1QUlIM0tiQVppWGpTSGcwa21QVHRoUHRQdG9Cak8vbFZyT3Btd3h4?=
 =?utf-8?B?UDFONEVJc2xubTJFQllRdDFTNkZxclRqOTdQWlZ3NVlwM2ZqMnJ4NGdFUWZM?=
 =?utf-8?B?cE9OazVRS1luQWFWL3FtaVFvVlF3YkVjb1U5RHZrZzhrdzFWS3BWd25aNWtY?=
 =?utf-8?B?eDVWZFdQUjgvZjJsVzhKV2lnajZMVitDVm5keS81Qy9PRnU3SmgwK0xHaE42?=
 =?utf-8?B?UEd3dm01bVJhU0FuMkt6VDM2bDJIS0RFMmhNSnEwcU9xdEVXVWdUSU9IZno5?=
 =?utf-8?B?c1BIWmVLWWsySFpzbzRhc3F5UjNJZzVKOU00R2tITllqYUg2L1hsUkc0L3Zu?=
 =?utf-8?B?ams3Wm1lb3Z1UVFlb1VmR1FXVkVHQ2xhMGpYWkEvV0MrUzhOcllZZFZuUHdy?=
 =?utf-8?B?bTJTTHdWVG1nS0hLUGZOV0lhTGJBQUhDT1VaTzVXNE5rT1pPREJEK3J5SFFZ?=
 =?utf-8?B?RU53WE5JcU8zQi9HRjFUQXBMVU5zM3VNTEZCL3pDTExQbWM4eWtkd1BRL1JR?=
 =?utf-8?B?akZBd3dxL1pvV1NZZ2tWOEVqd3hlZm5Oa3NIV0RaOGpnRGZ0dlJFMzlqZDlk?=
 =?utf-8?B?amZDNVhOWk5kYkdYSmlRKzd1aTZoYUVBdjBra0JXNjVRR2s2cUVRdWJUUGxp?=
 =?utf-8?B?V2I1RFYzY3JmNXNVWHBXOExMZDIvRGFCYUt3REk1TnF1WU8rWjMwWUtRUUw4?=
 =?utf-8?B?TWc4WVFZc1VqRW83NzJXN0ZJY3FrOU42Qzd5ZXBuYUkySXpHQ2kvVEh3cXZY?=
 =?utf-8?B?OUs1YXJJS0tzTFVNOUIwSEZuUTdyL3E4czE4UVBBZWZVZlJjYWFPaWg2VU5X?=
 =?utf-8?B?Qm1iSFU0ODFVYnZkN3NuS1ZGTUNrTG5WQzIyQVJVU1lrUG4zNEt3RXJydEha?=
 =?utf-8?B?SXZWWnJWMWgyajQwNi9RVzJQQWhUbTNxeFExN3g4SjFaSEpGcmprc21iRDNP?=
 =?utf-8?B?SVM2UE96YlcxRmJldkhMN3RZRklEMHBSWnFpRk9FZVhYeHVXVmlTV3VEdFFP?=
 =?utf-8?B?SmJrbTdzVFIzMDd0eCt3K3U4dXBLdTNxQVF5NGg3bFdwSGdmZHFJaGtLdnFz?=
 =?utf-8?B?cDYzMDgxaVRtT1Nvd205MkhTQno0SE9lTWJkSGgzL3loV1pna243amN5ekZl?=
 =?utf-8?B?V1ArQm1UQW83bDR4SVdaM21LbnBHQVZtUXdVeVVUcm8wMEZFK1hBTG5OYlVR?=
 =?utf-8?B?QlVnY0FrWUlrMUhyaVEvWTk1aVY3UmVMdENDR1RqNW5iSnZnMVlMZlFTOXFj?=
 =?utf-8?B?UkM5ZUsyMWxEYk9LUWxoSVlCejk2UGVEQ0pOTllqWHdLQlhLNGZHRjNhdFQ3?=
 =?utf-8?B?OHJSRGxGYVZwMVFZWkNJTHl3VlVYU3ZNYTBUZE8rR0FVdEJUbWMzakY1RHFp?=
 =?utf-8?B?NlcvcDhxUEZuL2FYYnJvNFlVTnBGNDJYdk9RRkdSTnRZdlNSVFVhcWNsNThm?=
 =?utf-8?B?aHF1MjBjV25HVGNXOThZakdQc3dDZkdLbnJVMWFwSFBlK3B1R2lTU0V0U2Zx?=
 =?utf-8?B?UCtmL2NQNFBQYXNCYWVNTTZpbXo3OG9HaWRFbVhua1BEeVlHelRCbTJiWmRI?=
 =?utf-8?B?dEdiL2NHcHFQVEhRWmtreWgxeWozWlM5Rm9taVNqVTdKS2ZQUUJYMDlWVVRh?=
 =?utf-8?B?Q3laSThXSEF6MlUvU3M1UUVTNjF4RTRMbDZ1bTRScUV0c3ErSE9sNkNaQTJH?=
 =?utf-8?B?WU1HZWtBVU5wVm1ZK3k4LzBTS2tSaGdHQS8vbVUzanBvcFNMUFI2b250TXBV?=
 =?utf-8?B?dnA2ZGZtZitaYUhqUDJGUVRVeWx5cXBJSmVoUWxjYmxBbWp0MUJBUFU1WC9P?=
 =?utf-8?B?eVN3VHRNeEM5ZUlKOVJhUzREQjNtRmk5Qy9xOWJwR3FaMjYyTnQxSlZ3RERs?=
 =?utf-8?B?YlVlbjBjVDZMVW9IREpiNm4zS2JiY0N4ZkZtSG9EMm1kVDM1djdQWGF6MGt2?=
 =?utf-8?B?MHBEK1pjN1lJMFlYVEVzaWx1VS93Z3NHcml6bVVGeU90Qy9xS0VDQndoVm1q?=
 =?utf-8?Q?geHI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnB0Ymduc3YrLzF1NTNnZ3RNQnFzZk9rL2doZlBpaitXckFaSmIvd1lyU09w?=
 =?utf-8?B?c00zblZhSWVYKy9lbVI3bkpPcGxoTmx6bXYwL01Fd0hxTWxWempaeGVnSnI1?=
 =?utf-8?B?eGUyRVBkWkd2cHNQNXh5UDBuZFRQNmYwKzBCUUUrL3M1NnpSdU9tMHV3QmJ3?=
 =?utf-8?B?WExzYmxpTWVIT1F1dEl2SFkvSXdCckRrbTQ3ckdVRDB6VGNrVTFLS05PU29L?=
 =?utf-8?B?QmlYOGNPVElXdHZ6UjVmU1ZIRzFMS0xHV3FoRGdONGtGa3phZ3dWd1hxODA3?=
 =?utf-8?B?anFzaklaZ0pwaVh4VVlCMUZRY1UrTXp3MFVLLzBXKzQyTXBncG1kbS9UVkpu?=
 =?utf-8?B?dmN5Tk1sYkNWTlFlVjgvMzE3UitsUVlQQ2QxUjJOMy9MemQxdkJpVWhicit0?=
 =?utf-8?B?RWg1T1FqZzFKcnBWTG1tczcvRHRrWGpvcjZseVc2TFBtZU91TFpzbnBmUnNw?=
 =?utf-8?B?SEh1NXRnR2x0YkppZVl0cjNoRDAzVTBPZ0FORktyTU1SMW41MUlUMjlGYW5Z?=
 =?utf-8?B?VWxpSlB1b2xqMTJ1NE82NnRBeDR0WmRyRi80dHJ2WnIvcXdrVXVDdHpUeDcr?=
 =?utf-8?B?elFVN2NGNXZoM1lxQVI4dG8rL0dxd24xL0kwODhBRzBQR1d0ZS9Xc2ovdEk1?=
 =?utf-8?B?ZE13bld0ZDhyVmFMZFpNTXNaWFk3c21pUllUeDZ3N2MrZHdPdGlqL3RzdG1W?=
 =?utf-8?B?Y2xudTRkSy9POWZNdEVLc3pyNUNTeHJBdGFtTHpzcXVWNVVGbUl0c3dqSW92?=
 =?utf-8?B?MnlOU1N0QUxGSUJzTE5oZVRscTZxZFhpMWNqN0ZGbkNFcjJPWjJJZ3hQTmt6?=
 =?utf-8?B?TURObXVQTE5jVXFLV3dWNGVFNnpWK1BBNmU0di9ickpZOHNCUVJpakFmWGFx?=
 =?utf-8?B?czdVcXdPUkhrd0NmdUg0WXV5dGJZVzc1YnF5RGN2R1BHZTY3d1UyZGM5ZzBY?=
 =?utf-8?B?MVhnOGhFdlJId2g5UWpFTm5HNGJhaklaMjRpU0VxdFJQTnI1Z3VzamkrMEJn?=
 =?utf-8?B?OWpzN1hMckpwM3lWN3VDS2hSdStGUzVpNFhiREFtNE5lU1dxdTdkcFhzOEs1?=
 =?utf-8?B?dEEyQUpKb0k2ZUR1b2JKNU1FMFdCSjZseE9kajJ2dkpTVkN5WmY5WFgxMmQ3?=
 =?utf-8?B?ZURhaEQ4UWtyZUFrUGlyTTJBWGxOb0JySnZmU29hSlRLdGhpbVpsbUV1ZDZy?=
 =?utf-8?B?NGV3blJMdTVOalJPWEQ2V3VKeEttM1NoTXdTeUdDTHZpOHBXcGVRQ1VZK0FC?=
 =?utf-8?B?VnI2am5jWVhKTlFoUWdXWVR4QitXd0JuWmRFNmxJeUpZL3FOZFZYSmxtUUxm?=
 =?utf-8?B?WkJiUjdYRDJOUE9jbTJ6WTJXaXpuc3IzZzJaN2s4eERCOG0rTnpQNkQ4eEI4?=
 =?utf-8?B?MVRwWjJwK01qRzVBeHREbmM4aHFSazNmeGtaUmd1aDRxbVpmbDZrZk8rS2RM?=
 =?utf-8?B?d29RTnFidlVLbktnbk9wTUY5M2h4dXYxY1cvY0w0ekE5Z0lhczgrcVhKRndi?=
 =?utf-8?B?YkJNeXlEUE94TkFFWUxNR3RjbnJxSzArVTNsSmh0aGVGdjl2R2JtVS9KeVRB?=
 =?utf-8?B?Vk1JSGZ5andoTEZXWURlY1ZFVmU5d2tPM0N2eUtVWG43aFBsYk5yeXlLQjh0?=
 =?utf-8?B?eWo4ME52YmU5NndzSk5ZUnNLZFhzN2I3QURvdnRCNXorb3k4ZkZ1U2Q5MkRX?=
 =?utf-8?B?TElaQXRVYndWWkczNkFzaDlJKzFuSG5YeHRLUU1UQUFUbGt2UzExMTBBQmpm?=
 =?utf-8?B?MEttSC9LZkN1L05VbWtQVWp5S0RhSHVud2ZKRXZXdEZIMXQ0amNMWEdUMTFC?=
 =?utf-8?B?bWp1ZTVLNE96MkhSVG0xM0NTbzdjZ1Y5c0cyMkhrTFkxb0Yvd2o0ZU1tRmhU?=
 =?utf-8?B?b1NwNkxVOFhSc1JLbUs1WWk1NjRMdGgzY1IydSswRGJpdUVSTFFCNTdwb1pH?=
 =?utf-8?B?djV1RzNhcWxLTWlCV281WlIyQWs1WUtyNEFlcVloNHhhaW84VERROE5nYWdN?=
 =?utf-8?B?bmpuR292aldlaTZkOWpJdENRcTd1NWpMWS81WHJPNEdJL3FrSTAyYkhURUVO?=
 =?utf-8?B?N2pTTDJmNGtZQm4xTFhLcFloZWhNbWZGOHZEakJlQUpzclJ6L05nbGs5eHhO?=
 =?utf-8?B?MW8vQUUzTGZseEg2WkhGbE9oTEhBMytheGRselRQeGV2bE5IaXRHelQ2K2da?=
 =?utf-8?B?c3krVHBCcnVoU2ZDcTZDYVFKelIvTkkrWU1PNlpYdTlhT2Qva1BwZTBvMHcv?=
 =?utf-8?B?Mk9GTi9PWWlaY3B5bGlaV29zMzFQTVBRSEJROHpodndWYm5sb2NheWdHaFVP?=
 =?utf-8?B?VkdlQUJrWCswR0NIejBSVGxwTE0rZzE4OHlsMFVQZ1NoclA4VGFxWExxWjBE?=
 =?utf-8?Q?PNAEEB555oT0gNpzZu1dJm+6oSLh1HA4DACGSkmiDq82p?=
X-MS-Exchange-AntiSpam-MessageData-1: BiSASulCy9RDlg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f68c63-a9b3-47ae-8315-08de6dceac80
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 02:45:55.9578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYE12ei+sipn8QorLZEELpmmpoG+xS9Qw/QzuuAkBjHPD7H983HiLkIcfpWCQu532SNTWOIrcCLMYtMGYmpohg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9476
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,msgid.link:url];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 1AF0314885E
X-Rspamd-Action: no action

A few simple, loosely-related small improvements for nova-core,
including reporting unprocessed data in GSP messages, removal of
unnecessary code in GSP and the sequencer, and leveraging the Zeroable
derive macro and core library's CStr. Probably nothing too
controversial, so I plan on applying it soon after -rc1 gets released.

This revision is based on master.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v3:
- Use inspect() to warn about remaining data in the GSP command queue.
- Drop "firmware: fwsec: do not require bound device when unneeded".
- Drop "simplify str_from_null_terminated" as `str_from_null_terminated`
  has been removed.
- Derive `Zeroable` on the original `GspStaticConfigInfo` tuple struct.
- Link to v2: https://patch.msgid.link/20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com

Changes in v2:
- Rebase on drm-rust-next.
- Add a patch to reuse previously acquired reference to define in GSP
  boot sequence.
- Link to v1: https://patch.msgid.link/20251208-nova-misc-v1-0-a3ce01376169@nvidia.com

---
Alexandre Courbot (8):
      gpu: nova-core: gsp: warn if data remains after processing a message
      gpu: nova-core: gsp: remove unnecessary Display impls
      gpu: nova-core: gsp: simplify sequencer opcode parsing
      gpu: nova-core: gsp: remove unneeded sequencer trait
      gpu: nova-core: gsp: derive `Debug` on more sequencer types
      gpu: nova-core: gsp: derive Zeroable for GspStaticConfigInfo
      gpu: nova-core: use core library's CStr instead of kernel one
      gpu: nova-core: gsp: use available device reference

 drivers/gpu/nova-core/firmware.rs        |   2 +-
 drivers/gpu/nova-core/firmware/gsp.rs    |   6 +-
 drivers/gpu/nova-core/gsp/boot.rs        |  34 +++-------
 drivers/gpu/nova-core/gsp/cmdq.rs        |  14 ++++-
 drivers/gpu/nova-core/gsp/fw.rs          | 104 +++----------------------------
 drivers/gpu/nova-core/gsp/fw/commands.rs |   5 +-
 drivers/gpu/nova-core/gsp/sequencer.rs   |  18 +++---
 drivers/gpu/nova-core/nova_core.rs       |   2 +-
 8 files changed, 45 insertions(+), 140 deletions(-)
---
base-commit: 9702969978695d9a699a1f34771580cdbb153b33
change-id: 20251208-nova-misc-1d797b5d64f2

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

