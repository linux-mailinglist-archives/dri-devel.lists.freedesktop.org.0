Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 030003ED2E6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 13:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D866F89DC2;
	Mon, 16 Aug 2021 11:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2048.outbound.protection.outlook.com [40.107.22.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CD489C1A;
 Mon, 16 Aug 2021 11:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rg3EqflEyu3Vmeifd0ikt6nYd4aHwyD/3RAWQtXGYZE=;
 b=GieSF0o0sNum3iG2UnDdEYkQGlcnU3BxSvWYMuhTklhLPFimBV4kV2q2oZLQDK47OlJARnmSktjLuLY+9LBrJw350EQiZVscDMeE/7pPfp0Arv7TEkxTWdvC3mFtiFIpCZ7/NtRzxWhok8jqvXJb42vhvEHtfNhjKA4REANiTRI=
Received: from AM5PR0202CA0002.eurprd02.prod.outlook.com
 (2603:10a6:203:69::12) by AM0PR08MB4481.eurprd08.prod.outlook.com
 (2603:10a6:208:148::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Mon, 16 Aug
 2021 11:10:47 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::58) by AM5PR0202CA0002.outlook.office365.com
 (2603:10a6:203:69::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 11:10:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Mon, 16 Aug 2021 11:10:47 +0000
Received: ("Tessian outbound 8b41f5fb4e9e:v103");
 Mon, 16 Aug 2021 11:10:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 503eb2c24f34dc4e
X-CR-MTA-TID: 64aa7808
Received: from 56651af0e388.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0AB446CC-FEE8-42BF-AF87-C280E321836D.1; 
 Mon, 16 Aug 2021 11:10:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 56651af0e388.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Aug 2021 11:10:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKIUBUNTcJ+k8VRVezTuCSdwtM+xJbfES3NqCd01P4ErMg/LpdmNVs2br5hcyGjXOjCMONCkWpcqbobbzvPEepKNZvo4LqWPar+XGtndc1A71gwblQh7TKLpksk8xnbnvV18tFHGoDg8ah0HYs7z7lnczh8arJX4TrJm9gir1jQi3RV1ZyRkG9s17iYSYVtgdSFTpkLL+YyEomUolDP/7Hu+oU0V8UBQirp9CWu313HXvqCAWl1CKSKBtypNNqDRCtE+eZbuvcTZO4fI9JJNjB21C8h6VSp9IeICtAW4YFDsNYaWcHL20cdmd+tSAlrHZOLE+gB38fu5+udf66wLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rg3EqflEyu3Vmeifd0ikt6nYd4aHwyD/3RAWQtXGYZE=;
 b=VSWhEESOesJ52M9w3qZQXrQY4dcRCmd1kslhhcp60Wsn1nlOkAHaUHEiJpT+e5/Jl9ko6SNt6/o3QkmI7+Vfz0PuzIjYvzyMiMYm8Z5PSRGdn/9tNFlYb/02WfuWm7fx+fE4n2+235mJnop+BSDml1ncuaZltjgRWhor0fveBc7LDgLyNL9lKqasOnR93q50dRyXHT5vm3KjPh0/XZJIg/kk+W8bdJrc6E8vHAAhnSWy98ynmpL+JUqGc/08GSW3Vn6KGgz3gZbgGGAXTLvbGYk/8mXb8m+h7qEeGz4xJA4UeJ82yJmeO3N/V2q613RukBS3hgDynjYFmjK4DaZEeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rg3EqflEyu3Vmeifd0ikt6nYd4aHwyD/3RAWQtXGYZE=;
 b=GieSF0o0sNum3iG2UnDdEYkQGlcnU3BxSvWYMuhTklhLPFimBV4kV2q2oZLQDK47OlJARnmSktjLuLY+9LBrJw350EQiZVscDMeE/7pPfp0Arv7TEkxTWdvC3mFtiFIpCZ7/NtRzxWhok8jqvXJb42vhvEHtfNhjKA4REANiTRI=
Authentication-Results-Original: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=arm.com;
Received: from AM7PR08MB5367.eurprd08.prod.outlook.com (2603:10a6:20b:dd::15)
 by AM7PR08MB5365.eurprd08.prod.outlook.com (2603:10a6:20b:109::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 11:10:31 +0000
Received: from AM7PR08MB5367.eurprd08.prod.outlook.com
 ([fe80::153c:577c:eac9:37bc]) by AM7PR08MB5367.eurprd08.prod.outlook.com
 ([fe80::153c:577c:eac9:37bc%9]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 11:10:31 +0000
Date: Mon, 16 Aug 2021 12:10:29 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: "Sharma, Shashank" <shashank.sharma@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 sebastian@sebastianwick.net, mcasas@google.com, jshargo@google.com,
 Deepak.Sharma@amd.com, Shirish.S@amd.com, Vitaly.Prosyak@amd.com,
 aric.cyr@amd.com, Bhawanpreet.Lakha@amd.com,
 Krunoslav.Kovac@amd.com, hersenxs.wu@amd.com,
 Nicholas.Kazlauskas@amd.com, laurentiu.palcu@oss.nxp.com,
 ville.syrjala@linux.intel.com, nd@arm.com, uma.shankar@intel.com
Subject: Re: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
Message-ID: <20210816111029.74cisnhblllindcv@000377403353>
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
 <20210802163042.2phdkytybie236x4@000377403353>
 <4e13504d-20ec-ae9c-7cb0-f79376d0f98b@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e13504d-20ec-ae9c-7cb0-f79376d0f98b@amd.com>
X-ClientProxiedBy: LO4P123CA0097.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::12) To AM7PR08MB5367.eurprd08.prod.outlook.com
 (2603:10a6:20b:dd::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 000377403353 (82.27.180.53) by
 LO4P123CA0097.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13 via Frontend Transport; Mon, 16 Aug 2021 11:10:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bb14b40-9be3-4bd4-f91f-08d960a67f9f
X-MS-TrafficTypeDiagnostic: AM7PR08MB5365:|AM0PR08MB4481:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4481EF8962326B3C1A931537F0FD9@AM0PR08MB4481.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: dDMyzRqZOSGp+LGaWg+MAnNnalkqnLeNPTrPkaaiOdkfm2BWywi8txSrmGTiqeVZWjd5OJHUmK5OOYVAH3Qc+vcXZhjtpiOHywcUH5q0gAbysIPOogj7Vqd0YRgl752jHL/f6PWslp1PsOPj1sc0LXurJlNMievZqkGdWZ5BAAdean3KZGuZPHgM9SE++qA2tpvSbs0ppbDpDnzMw+r7lRsg5vgCggPe37pWTD7izzbFj98wTBaUTlzoOFX4cP/9pA3+Cwo0GLInKeD/44WT8jI+83y9qZe2B8W+fR4yAtboQwSnxnJb7hCARD/cAOofdR0LOGX9+gGFjQs9xotYqF7njP5PH/zzt0HlHDuSF3nViAItL3d8uyIErNnIYTz1WXqVztZBbZGkp9ItMlhs74GMGRR2oKCNyCZyVfgiMTF1wuPMK1ZLsurtKi6DY1CZsRJbHUkAeYjt+olaupFsN9+Rn/FMx20NuBwEGglRNfgdfYUaQB8UtQtKdyPsZdJgGcyGVY4mz1PTGJpLSx2PEMxozy3i+CvHfROdCec6HWl7kiZ0WO8sKFflnpx4uQuc++Al0Wrck0KzpfjErme2cSNJFWaTk3jnENQBBEorrywwj3cK8zRKNK1NvYqSZDF6YqWeFvZ3pR80DW8LLsNOob59V9dN5yjoxNViu610IMN8Zo5Fp3rZa/d9RxlfzbBAohCqV/hpJ+s0Fa8ZC8Zpnw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM7PR08MB5367.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(7416002)(2906002)(86362001)(8676002)(66556008)(4326008)(38100700002)(508600001)(38350700002)(66476007)(66946007)(956004)(5660300002)(44832011)(9686003)(33716001)(6916009)(6496006)(316002)(26005)(52116002)(9576002)(8936002)(55016002)(53546011)(83380400001)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rsZlCLdD7v1CbYuFMzGrSb+DsvOZeNTINJgumBzySmfHqlQlzFOKr431rItM?=
 =?us-ascii?Q?uRnVM+QsxwQU0tZK8sWH2RPp3IowXjY8BLOhbWFe6eDfPigZBi399CLz6lNu?=
 =?us-ascii?Q?z3MRyXu6VHenRjVY0ah3ZPn/Ua1CwUFmlyIOzdgH2zEP5e61+cQEUlQMXR/C?=
 =?us-ascii?Q?MTZI0GPEMO5KrJwczFVew6LR1uc2JZMFpoeL6N+pIlvjMXz44aNsVlzQLyNv?=
 =?us-ascii?Q?qj9Y8VCx6+RnWhPUdYr3CWFceLxqZxQmokQtctXgVoWKZQEu1PEDTdwIM7+l?=
 =?us-ascii?Q?Sqc8P09xO4z2aOe5pVSy7cn79odi8NYhP8Wr1gLJcle25d5hRhiTWFFetC9l?=
 =?us-ascii?Q?bPhOKqIPhxgEMy/TcGjggyidhrjHEWb+V59Zs/AOAjOdZtQWU552FZCUjv0o?=
 =?us-ascii?Q?B1t9pAkWR3XIMV/AGtGoNkUWTdJ7W1yevfKUbZ/u7KeIOqvLoYXDjNPtfQ2K?=
 =?us-ascii?Q?iKUwnY5gZ7Mb3isrx/C2+X9FeVi4lyHbMo4WivzNIuhfOdCULsG/n2IOFzob?=
 =?us-ascii?Q?fl+oEU7tUe02pqJjIou8Idsbarkc4KffVEK+Y6/OHPF+9FS7w0CFnEcecdE0?=
 =?us-ascii?Q?vQVxCI9DuQI/xcNGVw09bwXIdhYId4TTSP1cfjQ/lv75JiZ+5e4CrofxuOW/?=
 =?us-ascii?Q?kiUr05iCNH/A//jLA7CQcZvCmcj1k3w3Bv/l/cWPLCf47NYTcdmZjcJBYQk2?=
 =?us-ascii?Q?RDO9e9wtOQ2BKRqG/1LE8SzoU0WlAcfSFZhzXX+nhoMpR60DQVFOC0F4K75Y?=
 =?us-ascii?Q?ZkZkGkof/qF7C2jpGyZx2xC101lr1vYls3E29K3h/GQC+pFPDh3WPbERsEel?=
 =?us-ascii?Q?Bk7ltWraQKHCywJUlZmF4FSTwjf/dSWSUHIGqqoRq91c16w0jhIC2Y3I+/GK?=
 =?us-ascii?Q?VGvgu93Pq6aOgUFMnX3pqTFpv/uurkzsez106UNXFh9CyJAlXO2Nbp0VP9YH?=
 =?us-ascii?Q?ncabgxoci//3/DkgtX+hfLyG6WDXjkJJ+wXM89HNN0e6NVsagdbPIsBnNTtn?=
 =?us-ascii?Q?SfD/8CdJt/pP6MIobcZEV7Myb1u7N+RgMFUR96KYmBIQvYcUoCAdOa5CHhBg?=
 =?us-ascii?Q?jMwmYu929iHPw6lCSmOkZtAKh5m1yTuoLGqAVj61jxs8oCGyXtPlbpKrcOhc?=
 =?us-ascii?Q?jij09Zl4ulQZ8Zj6Sd4hmTh5DLpbj6K+1HzAbB53lGFmYQQPgc4ViL9bLB7s?=
 =?us-ascii?Q?xWhZet3f3oIiwuZG4TjkVjmGobmeodxCjwmynvktL1pNGSymtdEZDkJMbQUy?=
 =?us-ascii?Q?XJjMVie6nNz7nSNSBfjVv4T7+vZP6LuPuaTiILbaF7KN/KxT1dq2rqegFHug?=
 =?us-ascii?Q?nuAKhDlUKTcwuE1/mz2T55vK?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5365
Original-Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1117cbc0-f1ac-4f02-2696-08d960a67606
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5lHCEDVqdZkrf/uhTvLghqCh8pC1+I1YvpObb1HAf1ByY8t+PGvm6PGP8aQY6spK4/IBJOguVYS52e4qxugMnsQVTiLCmpGefme/ZQbFCfPngc5PjAr682U8kvMicI4RAYCp50CMK8aBGe5jDe6B55tXcyBCwF/tSgOkOnwWNDh0ip0esHshJl9lYOxogHuKQc3rC4kqbYa7S5t+wxuYv/Vfgk2YoEboHwPVgpq30ak5U/T2aNN9Uh+3IlTa5FGFEQvk5zfV1r7K1n51tTrNufSuKyDo/eJro8Q7JQzaBGElNXkiIJGNYzM+3AZovcRKtfoHBwr4A8tcl9XDuvVDuLqtGaFEqhqcXwNjJl8gB3Ral8ONq2JxOaQ+N4q0gk/Xli/gcaJBgKxmRw9paFZn+eMeUapGo36ohHbyNOJu5Ezah+JZMo656pkKi6Qb9glqE3/DhILZk82Gk/n+di7i2nRTrHLKFt7ulFvTcBOMWDsc7UhHyOvHZm3dB1yO16KqfVRJ/G9Xo6kf+IbxN0sKo9wrE7TLLyXVR3iTKDkEVW2bFmuDxJarPwUNdPKJ7HOq9rF7dXLBBFYRwSGj5s/CFcQM1RyrI8PU6Iu56WgDYPezCxGgamERCs9xH6+SDKdYFr3h+Idx1GRaxf260ULneU7yXcxNca+j+msCikBRbf81RssludUgFmIR7V1hGSGZGRM4NzUEVSr9o3GeXCHpyQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(36840700001)(46966006)(26005)(450100002)(9686003)(2906002)(1076003)(336012)(8676002)(33716001)(356005)(186003)(4326008)(70206006)(70586007)(8936002)(6862004)(55016002)(36860700001)(82740400003)(81166007)(478600001)(86362001)(9576002)(83380400001)(5660300002)(53546011)(956004)(316002)(47076005)(6496006)(107886003)(44832011)(82310400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 11:10:47.0855 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb14b40-9be3-4bd4-f91f-08d960a67f9f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4481
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

On Fri, Aug 13, 2021 at 10:42:12AM +0530, Sharma, Shashank wrote:
> Hello Brian,
> (+Uma in cc)
> 
> Thanks for your comments, Let me try to fill-in for Harry to keep the design
> discussion going. Please find my comments inline.
> 
> On 8/2/2021 10:00 PM, Brian Starkey wrote:
> >

-- snip --

> > 
> > Android doesn't blend in linear space, so any API shouldn't be built
> > around an assumption of linear blending.
> > 
> 
> If I am not wrong, we still need linear buffers for accurate Gamut
> transformation (SRGB -> BT2020 or other way around) isn't it ?

Yeah, you need to transform the buffer to linear for color gamut
conversions, but then back to non-linear (probably sRGB or gamma 2.2)
for actual blending.

This is why I'd like to have the per-plane "OETF/GAMMA" separate
from tone-mapping, so that the composition transfer function is
independent.

> 

...

> > > +
> > > +Tonemapping in this case could be a simple nits value or `EDR`_ to describe
> > > +how to scale the :ref:`SDR luminance`.
> > > +
> > > +Tonemapping could also include the ability to use a 3D LUT which might be
> > > +accompanied by a 1D shaper LUT. The shaper LUT is required in order to
> > > +ensure a 3D LUT with limited entries (e.g. 9x9x9, or 17x17x17) operates
> > > +in perceptual (non-linear) space, so as to evenly spread the limited
> > > +entries evenly across the perceived space.
> > 
> > Some terminology care may be needed here - up until this point, I
> > think you've been talking about "tonemapping" being luminance
> > adjustment, whereas I'd expect 3D LUTs to be used for gamut
> > adjustment.
> > 
> 
> IMO, what harry wants to say here is that, which HW block gets picked and
> how tone mapping is achieved can be a very driver/HW specific thing, where
> one driver can use a 1D/Fixed function block, whereas another one can choose
> more complex HW like a 3D LUT for the same.
> 
> DRM layer needs to define only the property to hook the API with core
> driver, and the driver can decide which HW to pick and configure for the
> activity. So when we have a tonemapping property, we might not have a
> separate 3D-LUT property, or the driver may fail the atomic_check() if both
> of them are programmed for different usages.

I still think that directly exposing the HW blocks and their
capabilities is the right approach, rather than a "magic" tonemapping
property.

Yes, userspace would need to have a good understanding of how to use
that hardware, but if the pipeline model is standardised that's the
kind of thing a cross-vendor library could handle.

It would definitely be good to get some compositor opinions here.

Cheers,
-Brian
