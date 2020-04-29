Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 173511BE390
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 18:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7DB6EAA6;
	Wed, 29 Apr 2020 16:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2080.outbound.protection.outlook.com [40.107.20.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71ED26EAA6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 16:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34lveSXBwU7erA9Fw6JUf3+RYQ11/epkVi7mTF5DABU=;
 b=Gw1e6Q4L1dteg1WXDFLj7a8UtGsAskaHR/L7R6VrGcYGCxoXqLzQKRHyfgOg29ljEFUjiQE5FpsEd+FEkS9MjLCTe/RWa9F87nMJYDnGmAcUh9XgqBvnsTxVP5oZf1zbxuFl0mccIneo+sAAbbHdE1Cy52fiBGk6DfzxesTXT3k=
Received: from AM6PR05CA0030.eurprd05.prod.outlook.com (2603:10a6:20b:2e::43)
 by AM6PR08MB4660.eurprd08.prod.outlook.com (2603:10a6:20b:c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Wed, 29 Apr
 2020 16:16:59 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::e5) by AM6PR05CA0030.outlook.office365.com
 (2603:10a6:20b:2e::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Wed, 29 Apr 2020 16:16:59 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Wed, 29 Apr 2020 16:16:59 +0000
Received: ("Tessian outbound 5abcb386707e:v54");
 Wed, 29 Apr 2020 16:16:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: eca90f5bbcce0235
X-CR-MTA-TID: 64aa7808
Received: from d0f1752e0f77.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2A57CFC8-259A-4342-908B-262E1462CF21.1; 
 Wed, 29 Apr 2020 16:16:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d0f1752e0f77.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Apr 2020 16:16:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2driR1R29tU0R3x1F4Z4qCw1osGpuKLRFqR3eRXggVSAXGqcERU1NS1s94frySsLNFhNPSAHO6cKKANJiuddLig8N8+qSaV8yP/8HVXfvEmdhrbj3Y0YWsp4mIXjQn8r7Pp6jIjbsCmXSzD1UQ/Ah56grpckwHipx7oZAS4tqD01EwT4Fjx7HfxfKLaHV9rNa2Y8MNTUMkc8NgDTHyBDS70c2+LeM9eRhov/IR+bTPwdjeQZP5uISUPsESJK+Ck9v+XCyDC4q/SNJx8LQMUOwJr01Dk1yOOFRu0GZrIQN2uWOXoLL+dLDYeZ4hL+87lFAG5j0bp6iM1Eo2GqtGnPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34lveSXBwU7erA9Fw6JUf3+RYQ11/epkVi7mTF5DABU=;
 b=ajCVUxVRa6Wb4axkZEKoN6H/8KJFVYkoVpNWUTaYzMjPF7jEcvWeteSKc75hz1jxkgQdyPEWYLmVHNdyVmjpWSXFjibold90xN0dPgqWmvFDZa0XQa5YSGwJXnwDmel9AQ+ef5/KR44diJoKbDITKr/TmU1Zgvb2NV5vwseZpsX7br6nUfAQJf1G4XdhKVhGgEQYEUgfRTS65CX4/zRddHKm5BPiP/qIfoGBij9p73210k3hR58QPIZDLgvLiZGy8xYNVkwfYtygVIvIaj5ZONibizxlY24XUlfvc9iNLzYqCQjWqv2oDL2nC2/e8fg6B6EmOsTYhKZKQxhOUXC4nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34lveSXBwU7erA9Fw6JUf3+RYQ11/epkVi7mTF5DABU=;
 b=Gw1e6Q4L1dteg1WXDFLj7a8UtGsAskaHR/L7R6VrGcYGCxoXqLzQKRHyfgOg29ljEFUjiQE5FpsEd+FEkS9MjLCTe/RWa9F87nMJYDnGmAcUh9XgqBvnsTxVP5oZf1zbxuFl0mccIneo+sAAbbHdE1Cy52fiBGk6DfzxesTXT3k=
Authentication-Results-Original: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (2603:10a6:20b:85::14)
 by AM6PR08MB3478.eurprd08.prod.outlook.com (2603:10a6:20b:4a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Wed, 29 Apr
 2020 16:16:52 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::78d3:4ffd:f7da:b26d]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::78d3:4ffd:f7da:b26d%3]) with mapi id 15.20.2937.028; Wed, 29 Apr 2020
 16:16:51 +0000
Date: Wed, 29 Apr 2020 17:16:50 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH] drm: enable render nodes wherever buffer sharing is
 supported
Message-ID: <20200429161650.65m37srq3sucbsit@DESKTOP-E1NTVVP.localdomain>
References: <CAMn1gO4NsAoBUN4VFntB+pZK=cVCmwxBGUyipLPYYWFvpH1Z+A@mail.gmail.com>
 <20200427200513.36328-1-pcc@google.com>
Content-Disposition: inline
In-Reply-To: <20200427200513.36328-1-pcc@google.com>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO2P265CA0451.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::31) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LO2P265CA0451.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.13 via Frontend Transport; Wed, 29 Apr 2020 16:16:51 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a124d4e3-6f5b-4356-ecac-08d7ec58be63
X-MS-TrafficTypeDiagnostic: AM6PR08MB3478:|AM6PR08MB3478:|AM6PR08MB4660:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46603891AFE1E428ABE082AFF0AD0@AM6PR08MB4660.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;OLM:4502;
X-Forefront-PRVS: 03883BD916
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3829.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(66476007)(66946007)(66556008)(54906003)(86362001)(1076003)(8676002)(316002)(8936002)(16526019)(186003)(956004)(5660300002)(44832011)(6506007)(9686003)(6916009)(52116002)(4326008)(478600001)(7696005)(55016002)(26005)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Ky+EXBd7t/7ptXZ8D0MR16jz668atViFra8rOg7ZwklvDODYGG3/nWAfzqydV4KKR9YiEKd14Y/wLAypKEA5UvHTruDmWrIRy8M6MUjCbm8D3OcjtjB/wMXvquavkehmimOg46daNBgyVbSU3BO1V7sqSkLVaGq97OgJVlFPKWSIdEgzK/vqMCA0NaCgzxsMieT2aDuZO4QkLK70R1Uwn5brWaSXg8Wfu5UXru9/5/y9YIIGtOAoTDYhJxjLE1QmgOIpKjoURzvV824P5p1OSKF477ICOKxb9dE4hK2Z4ANFcNeTXEUj97GYN04ewS6LTrPwEW7oUval+HmUaUS0hdXq6c78Z5ilN3IDumYzNmxLejmbU9Ko6YdRotVIXoP5Vv8T21+5b+KZxgLlXEYInKZHhCugqfXQEORgKepwUpbf2mfuB3vlrc85HA3JiPCF
X-MS-Exchange-AntiSpam-MessageData: bXWztLkH5+hTgNL1CIl1s1blIcBfg/r4LLumJNtcd5XIopQXZ0u8tU11nDWcwqY2DRkMysP4IJzf0q6ueXMLQbTDp2cmmKAZweDGo5pZRMiG5WZOl+gT8Fw0ipYD2a5c+SUJjm6Xx4CSlyJNvYh5PcSwItXcVVvW+xBoG5k8TAZue9WlsHOPg3f8okyrDkzMt30ALMb57mn1IAzOnQ5NNCgdrlRewoUcYbw6/A3MiGVERGdxvJgEXr9HSCHM9/FGdBUinGuBrr5z+9wn0jJ3jW4+geMt1rxobrZ/pU1WFYoZztin8V/wsFdASbBu07yk4xWnSYqrtzZ65UJrdUxWx7P1j5thEQZZ0zloOJKNB0w1cmY2mWJXolY4p8Wvg+glIoX512HQc7w96kZhp/zzJuA/RZEKXs4a4eUCwjdFm9Rtz+76gFy4vVukMr/Qme3Mt1v7+TT1LOYIOzUf+NgElGOw928FVPvpN3fg1jK3favdOnWq0qlHISYNfdetzT5G672vK+pOErw/YfpSuuJjnAtgU6itBc0af2GrMwdML4PdYT9rUViNaTkZKUKBnmVGn8EhNzqJFQLm3t0KVLqqVDT+VIUacQ5YB8RcXC+aYZNEzsmLPMHb+zpITnHF9c58xiLc3A+Ii5q6RoCSk6ScoPNYnQorCQ4uIc3ZNmsBmZrUeB5reE5467CkiqB37oEw/xvAiKkz2gnzrGcS1Iq+99nCexAg2QYeP6ul4f2F7KN7BYRenS2srsoz579HvJ4AdrFb6yyrV3FZfiH7hz8thJfq4GaGKMrPZodJG9RruR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3478
Original-Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966005)(1076003)(86362001)(70586007)(5660300002)(55016002)(478600001)(82310400002)(70206006)(9686003)(81166007)(356005)(336012)(6506007)(54906003)(7696005)(16526019)(26005)(186003)(47076004)(82740400003)(44832011)(2906002)(8936002)(4326008)(6862004)(8676002)(956004)(36906005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b27ef4ac-32ae-4d33-f79c-08d7ec58b9e3
X-Forefront-PRVS: 03883BD916
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5jTU1x8gD1hg/1W+urDRjhIMG3eZz5QrpXS/kycDLaL5F9q3GtnM0sOtYAnODAe3rPCeU6v5Yt6l5hnyx9XfeU9lQTK134XoATRM5yiDxdK+Xub7wm4r2ezL4IofeNKVpaIAIb7wIC9CaLipvshE5cGO6Ae2nH/t6J9v1gDfofUMALXQOGK8y9fEdWztzDh2WGKmYYOvSmvCpH+vLnr/bTqvCeaSYgJ42OeGHaoV4zTi+pibaG0N4o3i1XZ3R4lkMFHAd3kCSRK+xp2ao9ptFP+g7vgX0NUZtbCdoVBOL17yDNr8ieStcXvD5De8sItsBEQLPa5Y6PFGWs6eQ0kK05RvovPOK5lq1mbHQvp8O/wpIQwBwl1AOfsmamaG8CM/FWPXszkxPA2khrwhx4190tbbHpTzRzbzIVHyEHdkxcjjfLz9S4J4zPwqMI/KQyxOTRdQ2FYzXfFHe9w6mQCro83RP33uQGSKEzDVx1xqawocPJWFVBuMSN70H11WM1yKMPQ+VzYHukMhiXrEifhB4w==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2020 16:16:59.0651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a124d4e3-6f5b-4356-ecac-08d7ec58be63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4660
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
Cc: Liviu Dudau <Liviu.Dudau@arm.com>, nd@arm.com,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Peter,

On Mon, Apr 27, 2020 at 01:05:13PM -0700, Peter Collingbourne wrote:
> Render nodes are not just useful for devices supporting GPU hardware
> acceleration. Even on devices that only support dumb frame buffers,
> they are useful in situations where composition (using software
> rasterization) and KMS are done in different processes with buffer
> sharing being used to send frame buffers between them. This is the
> situation on Android, where surfaceflinger is the compositor and the
> composer HAL uses KMS to display the buffers. Thus it is beneficial
> to expose render nodes on all devices that support buffer sharing.

If I understand your problem right, the issue is that you're getting
your buffers in minigbm via pl111, which means you want a render node
just for buffer allocation? Then HWComposer will import those on the
primary node for displaying.

I'm not at all familiar with how minigbm sits in Android, but on our
platforms where the Display and GPU devices are different, we allocate
via ion in Gralloc, and import those into both the GPU and Display.
I think that should work on pl111 too - if you can allocate contiguous
memory from ion (or dma-buf heaps) in minigbm, then you don't need the
render node.

Cheers,
-Brian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
