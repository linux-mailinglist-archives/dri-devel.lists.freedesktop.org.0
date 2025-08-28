Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8928DB39B3E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 13:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E361F10E984;
	Thu, 28 Aug 2025 11:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lF0en1jY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5014410E980;
 Thu, 28 Aug 2025 11:13:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQvFfJFXyovgzpYrfP0SNHRpzNTlpXCM393e0v4CvZtrJWJzpsArt+TV0pwqfgP+KCOaWhZ0NfNnpzqe8bcnDd+ikt7X6I01tQwLTv3QxOnmJkUyWpQTiDs1eYvRQauXgzdN6V0o+GLvA9idw6nSN6mcMSOt4poec+xTPULFQYpV5MqXE2c0NeWOT1i1R5aW1IETEWfsODpTgOHX1rMkqU4AnbZ91CxHDVAvrc8WWoQXKtiiu/+STuRt5oEHbnylHzKOeiAaQuH+wpSBmybpGjlkwl75Vta7aM++chMAKEPtq9lomCoHyFqy1ZK1/DMCKOp+DLm/XdHA+H/L5p7ezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxEFtOw+7F8TRaBnoIA9R6BVenf3qdU2x641uWUQ+74=;
 b=VGULvcWmk6Jjq7LdGpXFjOlfwPGtSXyrcwqbhuLprgXHyoDghp4nip7UNEfzdwFmPSksKBTyjMS5r0E3J8OwzdsrhIhi01XOZguHJ2oVVkmIFrjngXKmzZO4L196XM9fTWzZJKX6DQOUAqX+2ePnG2FCm9rIMRaT+rcBZibiZm9Obl5aLkDjd7p341VLPufwdJ7jcuOrhrOYYn1z75DhTJ0r8cMSY/CrgipNLmfBCRXqGId3gLHLyaBVle9ciVJpbrKlh9JtkcLNMO363270CkwnlzwrNPwznidM/qG44miWd5Nxkg2EzJiNpsErVDW5XM8XEvbv9lFb/mg3amak6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxEFtOw+7F8TRaBnoIA9R6BVenf3qdU2x641uWUQ+74=;
 b=lF0en1jYm/NM9egIPMA8mnh2F9AtI/EakX8C7JrioiyPnD742REzsjJJMo0I/iQ5PEuBCtkmqWH+cR4F4llbiexanfiIHZnu5we8QFecD2O5l0MXmI2ewZA2d6/NfU8oRznQ3ZOPVzyKfYiEdHGh63QzzwbB54sl5CJF1clSeY/lGKLP1X4ZMeqrtglrXbBMFOuL1R0XpjySrEMiwmiqWcp0jcE9gkd4yhcMO0JXlQ736YSOQcKkDf83NAUo4xEXxIywzjqL1//vWSR4M425H18uTre0HDrZ++SSc9hKSiJTBnKs3TpUqoCPfedOz/opjpCe0QnNgGx9G3gUWf1E0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5994.namprd12.prod.outlook.com (2603:10b6:208:39a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 11:13:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 11:13:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Aug 2025 20:13:44 +0900
Message-Id: <DCE0M4NY29YA.K4IX71XOHF4C@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/8] gpu: nova-core: firmware: process and prepare
 the GSP firmware
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-5-93566252fe3a@nvidia.com>
 <407bf89c-0488-40e4-91f7-440610b6a906@nvidia.com>
In-Reply-To: <407bf89c-0488-40e4-91f7-440610b6a906@nvidia.com>
X-ClientProxiedBy: TYCP301CA0039.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: cb08a034-f360-4812-2d9f-08dde623f5d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkRvNmVsTWlPM3plVTl1YzhkM2FxTFdlemtWL1phTHJwdVlhK2ZtbFFWQlhZ?=
 =?utf-8?B?dkhUUmsyVDNjWkQwQm9ERmxKVENTTjNIWWhCOUszRFhyUDdlVXBOWWszRVVl?=
 =?utf-8?B?eG1oQXNjZjR0K2lZeUkzT2M1cDVsMVEvQVpWMFBXQ21YbWtnQk13cGNub1Jx?=
 =?utf-8?B?UFVZMk1pd25NWUUyOG4rMkNiSDFHb09ldit2UnMxYkl2eUhQeWdkbFNYWEFi?=
 =?utf-8?B?UWFEYXZpTkZlZFNhMThzb3Iwck9oN0tLOStFUlRQbDA1Q0hrWGxVYU9sRWVC?=
 =?utf-8?B?T0lrMGlGSUFsR2pYekhJUVNJNGxwVSt0b1JjNnhLZjFNNldpeDJqalZkMWYw?=
 =?utf-8?B?RzBtaXZMSGVqR2FLT0NNRTQ1QkFQRkRFbm5vMVRXbWgwRzNHVWpSU1FMeXVZ?=
 =?utf-8?B?QXB2ZGpxUUc3SEdJVm8wZ2ZoakJXb2JNRitaWGc1d21EcEFiMC96Z3ZvNko0?=
 =?utf-8?B?L2VLQWQrNW4vV29iSmNpbDQxUk4rVlBvalZqUXk3VVl4VU5vU1IwZ3ZqZ2VI?=
 =?utf-8?B?UTlNTEkrdkk2ZDA4N3FOME9Zd0ZESktCaGM2REdqTnBnM1R5OEFJYW12c01u?=
 =?utf-8?B?MGdmTzdQMWZrdjRuNVBVOVViUTlPeTJ4RmFZNTdvdklqUUdtQlVwbG5sL3FT?=
 =?utf-8?B?dGtpUUNyTitZWDZLUzB5WjZFb2FzbVhmZHBTU0RYb2VRQm1jSWUvZnJjMWpR?=
 =?utf-8?B?cW5SN0l4ZFhtVCtSK1I2Sk1LSk90czZUSSsxc3JGcEZZdHJvVHJLWWFyZWtP?=
 =?utf-8?B?cmRmTWtBcytKb3VtdkRqL3hOaHdsTEY1YkhRMys3SDlFdWRmTHVqSWpXNGR4?=
 =?utf-8?B?aTBiUkg0elJ6d0t0TVZqRE4wYzZWcU1UTjAwTWFPejdtSGhGSXN4dkVjbXlj?=
 =?utf-8?B?ZzVHdWorbEJFUWJ2MU5NVW91ZHFkNUxpNnU5eDh0bXpyc3VtVVVnZE5IRHdY?=
 =?utf-8?B?Z2Jrd2VZNTd2VTlFMGJtWHlGYWVESXY2ejdMK1FmbjlYRXdwVExnN2VwKzlZ?=
 =?utf-8?B?aG5HMjBwdmNvOWNLdDBlcnFMQ3ZDSHhnZ1grYnpGMnBwRXdKZWdLeVZzZmQ4?=
 =?utf-8?B?ekJGbkl3TUVyZUJEUHZUNTZIQ00vR09ibWNaU3F1T2VKRWF5QlkwU3RTZStK?=
 =?utf-8?B?bm5EbC82ZFJMckJWOTZmZjRBOVBva3Z2RUxvMXpBTlJRNlRSaHlVMGtRR3Vh?=
 =?utf-8?B?bUtNSFFkZE9OSjFDMFpjdW1RVDdENzMra3A4VE5iTHl3Vmg0cGlRSFlMeCsz?=
 =?utf-8?B?RGRENjkxYVBHbGhXVnp3NXpNOWtGV090dDFTTlZCU2lGZWFFOVBFbzBGMjl2?=
 =?utf-8?B?Vi9sZ0orbDcxVE9ndTF2MWw3UExaSWREcExBK1dBWU9JTUsrRVBsenNTeW4v?=
 =?utf-8?B?RnRpbm1VaDQvRVVLd3ozbytmSVcrSUpnbUpUeG1tUjFNZ1IzYkhuaGdkV0Nt?=
 =?utf-8?B?SGhrRUYvS3lqNk14V2xLOE1oSkpJVEhoMm41NDNmMm9KN3EvOTl6enlnWnVO?=
 =?utf-8?B?ZWRMMGdhODhiNWVqTWF3bEF3Z2I1akx1bklUbGVCRE9CWnd6UEswd2tmckkx?=
 =?utf-8?B?K0pHeVY1UXN2MG0wc2UxQzhJMW0zTjNMMlN2NStQcGRGampNWVB2VEovVzli?=
 =?utf-8?B?eDFpTHpLVDIrcy9WWnB5TnpNSkE5UnhONGowekFoMWRpTDlRcXN2eHNvNmJP?=
 =?utf-8?B?VHBFV3NFMEpva2xIOVVhTjBNUHkyWUk4R2NtR21XQ2F0cVVsZXZpOWd6OS82?=
 =?utf-8?B?UjBwcVQ2SytjWkpYeTNjYkJuOVE4VVNsVUViQkNzMUJrcFE1U1NMbnFNVlFC?=
 =?utf-8?B?cWZIQWVhcDlRSEc1d0lwYmFYTEJGNmZzdDVnS3MwZ2xLTHZwdjRNUWNpL2Zr?=
 =?utf-8?B?VlF0RzZKZjZybnBOLzdEWDVGdGNyRFBJcnp5RW0rNC9oU0xBUmRTRGN2bUZ5?=
 =?utf-8?B?MHI0K3ZOdm10R2FKV1I3RHYvbS9vajQyWHluWXo4dUphbXkvLzZEblM3RS9k?=
 =?utf-8?B?RVJ1VkwyYTBnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUtLWmhTcnRITU5oa2VUdWNxdDdzd1R6SzdEa0NmS0dJK1EzUHhZV2dOaVpm?=
 =?utf-8?B?U3plVVJxY1BGY2J1TUQvZ2dsNWMyM1dBVlM4WXhpM2tndEpMOWJwaExRRmE2?=
 =?utf-8?B?V3FINXFRVFFtc3JzWlpvei8ySUxVUHVLbWJXUGtkcHdEeGRBUUdWU3Z6OHMz?=
 =?utf-8?B?c2Qzazl0aW82OUc2c3FNS3VWN1NDQTdhQitYWTloTEdsU1hYS0RENUtyNWZ6?=
 =?utf-8?B?MlBLTGJ1dDlYejZCY0NHYUxXUEV1MCtpaFhoRnJ6R09MZzNJZy9aTURkKzZi?=
 =?utf-8?B?VXJEai85R01nTFd6UHc1eXlLallHT0c1d0E3REd5ekE0U3RIV2JnSUF4TExs?=
 =?utf-8?B?ckwzaFNodW94aTJvRWlLSUNmUWFSZXRtMys2aEU3Ykw4Ym1wL3N6QXZhNXpz?=
 =?utf-8?B?U2JVVHdtTFJlODU3dzg0YTh6VW8xN3BORFV6UHRGbk9qRDFwNFlKaitaaUVJ?=
 =?utf-8?B?em95c1NPd2UwdFNETysyUTh3SEJEN2I1NHVxa2xqbks3MGt2T0xMUFRNOXJu?=
 =?utf-8?B?K29vZ2wxK3lqeTEvNU5QUmJNK2tYRmZpM3RNejRLNFNIYjlyUHhJaEFoQ2pa?=
 =?utf-8?B?b0hLejk3UFl1ai84UlRlKzJwMVk5djk0R3d3RHBQbEFXSGF0R0lOakNOeGpU?=
 =?utf-8?B?bXltUXpHazJpMTRGbmlVN2NHTjlzM1VIOU9Pc1drM01wVXBTZEZEbDZGNDM5?=
 =?utf-8?B?cENZU2Z6N25XMEwzYXU2TDZoTlJDZmZ5OHJlVlN0bVJKMGpnRGhsOU9zdHYx?=
 =?utf-8?B?NnU5ZlhEcHhHbzY5bjhZeDBOaTFCVDlxS24zM1o0d0tYRi9UY3RKTHpVakNi?=
 =?utf-8?B?NWJZRWpzUEpFNmNQZnJ5WWl6WTdvZEtrZnNmQ25ldmE2ZGFQb3hhSmJxTE1T?=
 =?utf-8?B?M3pNaTdqU0x4bHpWNjhnK2lFMFVGSUJjSmErWENTb21oUlNWWnlTakQ1SWFz?=
 =?utf-8?B?NHdFdlNrdktLaGQ2ckhJd0wyaitmL1RTeklrc2lzeFQ3UFJuUlkwUW0xMStu?=
 =?utf-8?B?ZWkwOHo5YWRwR0RmeWlaMzRjQmRTa3BESFpVTDFFNVFJbi9nazJtaHV6anBF?=
 =?utf-8?B?NlFZRzFEZlZ6NDNJelhtbWk3SE5VQ3ptaFhML1IvOExBeHlzZW1VcTA4cUl2?=
 =?utf-8?B?SXpWWTJIM1ZYVy96VjAzTUkvczduUTk5cFZxNStVcnd6T1pZbVN5RUZxeERu?=
 =?utf-8?B?d1crZHRKVHJDbkU0dWJXaVFwZGhvb1JDbEJFcFJia2V6U3gzRnlrRmdNU1l2?=
 =?utf-8?B?Yi8yMHhsV2xvQURrMS9FVkFMbUdnQ0FRQ2EveUp6em1CWWxYV0ZiNU1JZTUw?=
 =?utf-8?B?NzY1Qm5CMlJFUlE1Rmo3VUt2cnhRNGxTT0hOZE8xVnR0TnJVQmN4eG8wYXYz?=
 =?utf-8?B?NU0zR3Vlc1hONE5CdFNybkJncElLajczTWh5V1dPYitBWXlGTXZMRGlyWGJu?=
 =?utf-8?B?ZVFxMGphUnlHeWVFZVlNQ1Z0UkErZkJ4ZEgyR3I1Y0dONlp2SVlId1h4bkVo?=
 =?utf-8?B?Zmx0aUJHVHpTU3lUb1Q4dytMcGlVVGRWMnBoNkp6ZGQrVzZucE9YM1ppSXNF?=
 =?utf-8?B?RjhUZ1g5cXNwZHRuSFZwMFVmWnltczVvVHVvdy9xY2tJLyt6YU5lL1ZnWEZo?=
 =?utf-8?B?aU9XTWUxMXJjNmpERVFOaHVPcVJLS1hEUk83NGtXQXhhSkFpZytOMzV6OXcw?=
 =?utf-8?B?MHRyV0NteTZwYTFhMDZDdXd1TnlWSHFqSzBPdDBaNkJLM0VBUFprMTBzbVVU?=
 =?utf-8?B?bHgvYlExNysxb0FCZmY0UlJ6dXNYV0M1QzZsR01XbnBLT21pZzNGVkorNUc3?=
 =?utf-8?B?R1ZyRmwxeWRmTWRtYmQ0ZENOeFdjblRTei9IQXhpR2ozeVk2THhFeEdBUXNx?=
 =?utf-8?B?TW9ONVF0Z3JObTFiY0VsV0tNMG0yQThOb08zZnR5WFp3OVNEOTRGWlJUaWlq?=
 =?utf-8?B?azR0dWNIaHVVNGZxNlpPaG9RWnZCcXBydlhjaVA0Q1A3SXA0SkloaEZ0bG5I?=
 =?utf-8?B?dE9XUURDYVRlOVNPdUVZWWNMdjlqbG10Wi9HVEc3ZHo5anp5VkYzOHcyMWhJ?=
 =?utf-8?B?UlFnbHNJUFhKTlRNc3ZxdmUyN2lWOEVENUw3OVU4RGpZR2ZMZjlrOUU3RWhE?=
 =?utf-8?B?ZnpXa1pVTVV5cTl0NW43ZmdBY2J3eTZ3K25sb0d4L2RManBJRXVaREg3dWln?=
 =?utf-8?Q?XXnfCHgWa6PVN8/93B3H6nSz/3mWMKdhI2slWM61ALYj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb08a034-f360-4812-2d9f-08dde623f5d2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 11:13:48.1042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+5ByO4FUkt+6itsaFVMVa2Gh0j2Rt6qY215Q1jBxVo1HFQanvZjvuNsc8fviPsrYQdtknoCBtBmgcxZP6Vn5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5994
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

On Thu Aug 28, 2025 at 1:01 PM JST, John Hubbard wrote:
> On 8/25/25 9:07 PM, Alexandre Courbot wrote:
>> The GSP firmware is a binary blob that is verified, loaded, and run by
>> the GSP bootloader. Its presentation is a bit peculiar as the GSP
>> bootloader expects to be given a DMA address to a 3-levels page table
>> mapping the GSP firmware at address 0 of its own address space.
>>=20
>> Prepare such a structure containing the DMA-mapped firmware as well as
>> the DMA-mapped page tables, and a way to obtain the DMA handle of the
>> level 0 page table.
>>=20
>> As we are performing the required ELF section parsing and radix3 page
>> table building, remove these items from the TODO file.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  Documentation/gpu/nova/core/todo.rst  |  17 -----
>>  drivers/gpu/nova-core/firmware.rs     | 110 +++++++++++++++++++++++++++=
++++-
>>  drivers/gpu/nova-core/firmware/gsp.rs | 117 +++++++++++++++++++++++++++=
+++++++
>>  drivers/gpu/nova-core/gsp.rs          |   4 ++
>>  drivers/gpu/nova-core/nova_core.rs    |   1 +
>>  5 files changed, 229 insertions(+), 20 deletions(-)
> =20
> Code looks good. Or more accurately, it's working on my machine, and
> I think I understand it, aside from the SG Table internals.
>
> The documentation on the whole "radix 3" aspect is too light though, so
> I've created some that you can add in if you agree with it.
>
> ...
>> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-co=
re/firmware/gsp.rs
> ...
>> +/// A device-mapped firmware with a set of (also device-mapped) pages t=
ables mapping the firmware
>> +/// to the start of their own address space, also known as a `Radix3` f=
irmware.
>
> I'd like to replace the above two lines with something like this:
>
> /// GSP firmware with 3-level radix page tables for the GSP bootloader.
> ///
> /// The bootloader expects firmware to be mapped starting at address 0 in=
 GSP's virtual address
> /// space:
> ///
> /// ```text
> /// Level 0:  1 page, 1 entry         -> points to first level 1 page
> /// Level 1:  Multiple pages/entries  -> each entry points to a level 2 p=
age
> /// Level 2:  Multiple pages/entries  -> each entry points to a firmware =
page
> /// ```
> ///
> /// Each page is 4KB, each entry is 8 bytes (64-bit DMA address).
> /// Also known as "Radix3" firmware.

Thanks, this is perfect!

>
>
>> +#[pin_data]
>> +pub(crate) struct GspFirmware {
>
> And then a slightly higher-level set of inline comments will help
> developers, I think:
>
>> +    /// The GSP firmware inside a [`VVec`], device-mapped via a SG tabl=
e.
>> +    #[pin]
>> +    fw: SGTable<Owned<VVec<u8>>>,
>> +    /// The level 2 page table, mapping [`Self::fw`] at its beginning.
>
> Instead, how about:
>
>       /// Level 2 page table(s) whose entries contain DMA addresses of fi=
rmware pages.
>
>> +    #[pin]
>> +    lvl2: SGTable<Owned<VVec<u8>>>,
>> +    /// The level 1 page table, mapping [`Self::lvl2`] at its beginning=
.
>
>        /// Level 1 page table(s) whose entries contain DMA addresses of l=
evel 2 pages.

Looking good. But isn't it singular "table"? We have one table, with
potentialy several pages, but each page is not a table in itself IIUC.

>
>> +    #[pin]
>> +    lvl1: SGTable<Owned<VVec<u8>>>,
>> +    /// The level 0 page table, mapping [`Self::lvl1`] at its beginning=
.
>
>        /// Level 0 page table (single 4KB page) with one entry: DMA addre=
ss of first level 1 page.
>
>> +    lvl0: DmaObject,
>> +    /// Size in bytes of the firmware contained in [`Self::fw`].
>> +    pub size: usize,
>> +}
>> +
>> +impl GspFirmware {
>> +    /// Maps the GSP firmware image `fw` into `dev`'s address-space, an=
d creates the page tables
>> +    /// expected by the GSP bootloader to load it.
>> +    pub(crate) fn new<'a>(
>> +        dev: &'a device::Device<device::Bound>,
>> +        fw: &'a [u8],
>> +    ) -> impl PinInit<Self, Error> + 'a {
>> +        try_pin_init!(&this in Self {
>> +            fw <- {
>> +                // Move the firmware into a vmalloc'd vector and map it=
 into the device address
>> +                // space.
>> +                VVec::with_capacity(fw.len(), GFP_KERNEL)
>> +                .and_then(|mut v| {
>> +                    v.extend_from_slice(fw, GFP_KERNEL)?;
>> +                    Ok(v)
>> +                })
>> +                .map_err(|_| ENOMEM)
>> +                .map(|v| SGTable::new(dev, v, DataDirection::ToDevice, =
GFP_KERNEL))?
>> +            },
>> +            lvl2 <- {
>
> Why must we use a strange vowel-removal algorithm for these vrbl nms? I'l=
l let you have
> a few extra characters and you can spell out "level2"...

Yeah, let me spell these fully.

>
>> +                // Allocate the level 2 page table, map the firmware on=
to it, and map it into the
>> +                // device address space.
>> +                // SAFETY: `this` is a valid pointer, and `fw` has been=
 initialized.
>> +                let fw_sg_table =3D unsafe { &(*this.as_ptr()).fw };
>> +                VVec::<u8>::with_capacity(
>> +                    fw_sg_table.iter().count() * core::mem::size_of::<u=
64>(),
>> +                    GFP_KERNEL,
>> +                )
>> +                .map_err(|_| ENOMEM)
>> +                .and_then(|lvl2| map_into_lvl(fw_sg_table, lvl2))
>> +                .map(|lvl2| SGTable::new(dev, lvl2, DataDirection::ToDe=
vice, GFP_KERNEL))?
>> +            },
>> +            lvl1 <- {
>> +                // Allocate the level 1 page table, map the level 2 pag=
e table onto it, and map it
>> +                // into the device address space.
>> +                // SAFETY: `this` is a valid pointer, and `lvl2` has be=
en initialized.
>> +                let lvl2_sg_table =3D unsafe { &(*this.as_ptr()).lvl2 }=
;
>> +                VVec::<u8>::with_capacity(
>> +                    lvl2_sg_table.iter().count() * core::mem::size_of::=
<u64>(),
>> +                    GFP_KERNEL,
>> +                )
>> +                .map_err(|_| ENOMEM)
>> +                .and_then(|lvl1| map_into_lvl(lvl2_sg_table, lvl1))
>> +                .map(|lvl1| SGTable::new(dev, lvl1, DataDirection::ToDe=
vice, GFP_KERNEL))?
>> +            },
>> +            lvl0: {
>> +                // Allocate the level 0 page table as a device-visible =
DMA object, and map the
>> +                // level 1 page table onto it.
>> +                // SAFETY: `this` is a valid pointer, and `lvl1` has be=
en initialized.
>> +                let lvl1_sg_table =3D unsafe { &(*this.as_ptr()).lvl1 }=
;
>> +                let mut lvl0 =3D DmaObject::new(dev, GSP_PAGE_SIZE)?;
>> +                // SAFETY: we are the only owner of this newly-created =
object, making races
>> +                // impossible.
>> +                let lvl0_slice =3D unsafe { lvl0.as_slice_mut(0, GSP_PA=
GE_SIZE) }?;
>> +                lvl0_slice[0..core::mem::size_of::<u64>()].copy_from_sl=
ice(
>> +                    #[allow(clippy::useless_conversion)]
>> +                    &(u64::from(lvl1_sg_table.iter().next().unwrap().dm=
a_address())).to_le_bytes(),
>> +                );
>> +
>> +                lvl0
>> +            },
>> +            size: fw.len(),
>> +        })
>> +    }
>> +
>> +    #[expect(unused)]
>> +    /// Returns the DMA handle of the level 0 page table.
>> +    pub(crate) fn lvl0_dma_handle(&self) -> DmaAddress {
>> +        self.lvl0.dma_handle()
>> +    }
>> +}
>> +
>> +/// Create a linear mapping the device mapping of the buffer described =
by `sg_table` into `dst`.
>
> How about this:
>
> /// Build a page table from a scatter-gather list.
> ///
> /// Takes each DMA-mapped region from `sg_table` and writes page table en=
tries
> /// for all 4KB pages within that region. For example, a 16KB SG entry be=
comes
> /// 4 consecutive page table entries.

Much better. And I mixed some words in the original message which didn't
even make sense to begin with.

