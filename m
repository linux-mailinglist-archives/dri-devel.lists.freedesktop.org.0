Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6F53BC4E1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 04:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D308996E;
	Tue,  6 Jul 2021 02:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F12489933;
 Tue,  6 Jul 2021 02:44:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6gI1ZnZoGagoqE/oMVBx3azbdDistutnRPeRUdGJ2DCYYV6UrjcG0OE1W7GKY2tqn8eDqxvO6+2X2fJxwYmo2QgLLGsv3YIHWWTZ4yVPSrQEfSDbO/cQsuXhTnoVMFVfA9oPLv5ZuVhda6WxQMOWZB+48Of8I8ssRchG+Y5BBatv0SnADFBuDfE/orTQ+gGODHmWYBULqcUvfeVVmyLKDFZz3Y3zseIDmHPbFHPQHgVsFmgRKM5rlaiCfdtjhQsYzcrwOTv5DE+zX/oJmKrYqnqLbSP8GJcytt9HYpOK4WQlNT45ldI89Yu+L2EAyOTFnDfuSz7W6SQMfCuUA7MQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPQLyBjQ71qLOTl9OjhrEYbXaFdHTlRlXs3ppIRWRqk=;
 b=KFXRAmrpBi2pd3/kltOWdnbP4qip2SEQltzGRbBpKCLwcKwozkSFggWDD3COHRnRUr+OfwIWgOem80/zc2i/ghacNNYahCixLrdFy5fRne8dVbIn+FvbzPtWc0zcWly5N2XXuQv9y0eN4I+dryZ6AvRRcHHGcytBVrH0Qkjk2JI1id1GcIoxs3kUsyRaC2kiHA9V9ZV0de/gOKumMNIrqr0MINUQxpJ2tPgSXk4ryPvVbgzqR6Q2lftWBpYaz1nT7y2nfLLZehDeYqjDFE4Y5iA6WdlMmdAqJk7Sho7TTy4lOd///Fb5ye+DS3EjLEd+wT0+En8+2gTtLJFlvmaOhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPQLyBjQ71qLOTl9OjhrEYbXaFdHTlRlXs3ppIRWRqk=;
 b=c/0zT6sOZKoUFW4ELh8ut3caEFw6mOlN4gOJTqgszyT3WkXaveeHhRfdZKjheaiubcqeaztzfFVeonIQBss8o2dFkHYjLW5eTNAov9t1tC0BxNUXHE0NQl2R/wjBlEdsXYEwht5DxR7QX5XaDM9kL0P6TAv7bXDCqNgkSCodQt4bSubSpcYFPKVMazsgXu2hGoAW8A3taoFoyg0kqp/AWl9lAA+S+kf3YBe2gff25jmjxBdX6RdWMKHt7AuK8QsJGbaVCqpVZcrpxPfv+Qb+ADJ7NW257eAY2A4LUnl0BcGUODhJemlaoSqW4LdkAHcYHZ54hiTK+S+3KMLo0JtDhQ==
Received: from MW4PR03CA0020.namprd03.prod.outlook.com (2603:10b6:303:8f::25)
 by CH2PR12MB4022.namprd12.prod.outlook.com (2603:10b6:610:22::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Tue, 6 Jul
 2021 02:44:07 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::6d) by MW4PR03CA0020.outlook.office365.com
 (2603:10b6:303:8f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Tue, 6 Jul 2021 02:44:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 02:44:06 +0000
Received: from nvdebian.localnet (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 6 Jul
 2021 02:44:04 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: nouveau: failed to initialise sync
Date: Tue, 6 Jul 2021 12:44:02 +1000
Message-ID: <1682547.0nLxAY2a9E@nvdebian>
In-Reply-To: <YOC4uekpD7iA3xPi@Red>
References: <YOC4uekpD7iA3xPi@Red>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04111392-c2a7-4f68-75a5-08d94027ec89
X-MS-TrafficTypeDiagnostic: CH2PR12MB4022:
X-Microsoft-Antispam-PRVS: <CH2PR12MB40222C93A787BCDB71F7FF1EDF1B9@CH2PR12MB4022.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:119;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hPJppZanGJL+O+sLtq4YwbAus/nQGGwo8LmO8CbMyQEV+3d/FdJ6Y0Xcw8y+VZbrelwKNGsTZqQQouPmglQ610HFmdz9TNkRusjUCS2bV9eVXavLRHpUI7t26nxmzPebAgLHOOx1LlBPH7+zZu6GScow8w7rva4dE6aevv+qlAufRrpvYFaFjk0e5ZsbEp2qZ3cKW+67f7rncAvpK8dsbKE4vT4vJrvNXproWoVqZKURyofKKt32RKa0rjaz/VJn53k80rZWOeb6F3WKKaYZjoFvMBCKmrsLVpAoX6s1F3m76oR57Tv7JTKWWeMQ+jEqc77mZ+6pd1ioXnoEv+QaFHWDcT9Tpw4l0eaqWTFQiV7xIpciSRuRS8eB8sOFPjj3ncGKPh3ezqYKktOeuOkXGhay38V1xzVLNplepcGtePeZw5Y3BWbccIJ1rqotcNN30hJvNAetNP6GgwFXgc/t5GdRkjqOEOlw63P0tvgI3RpS36DgAy0WdAJGBpJDhSgRE1F148oNZo+a3r36aN1lI0rHe7DnBmAoep3QNeXUNtNQVCVDnEJU4cKLDi3Ik4tcweoG2+J2AX8p167SgnpFC/2vZLbfsFbS94kxVupU2BtNkCxqH+MUQLagB5bkg/XXVYkgcctBacfMRDIj06T3Y6/Xyz1W7ECEjdXl9KGJ2FRsgjDTOtxpU16QCQVQR0t+gBar/xy1dOrERPtMa+TV7Zm4lbCGAQlceA/wTFhfvKQ=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(36840700001)(46966006)(86362001)(8676002)(54906003)(2906002)(6916009)(83380400001)(36860700001)(336012)(36906005)(4326008)(316002)(5660300002)(82310400003)(478600001)(47076005)(33716001)(8936002)(9686003)(26005)(7636003)(426003)(16526019)(966005)(9576002)(356005)(70586007)(70206006)(186003)(82740400003)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 02:44:06.4890 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04111392-c2a7-4f68-75a5-08d94027ec89
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4022
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I am also hitting this with upstream. Reverting d02117f8efaa ("drm/ttm: remove 
special handling for non GEM drivers") also fixed it for me.

The change log for that commit reads:

    drm/ttm: remove special handling for non GEM drivers
    
    vmwgfx is the only driver actually using this. Move the handling into
    the driver instead.

I wonder if Nouveau might actually have been using this somehow too?

 - Alistair

On Sunday, 4 July 2021 5:21:29 AM AEST Corentin Labbe wrote:
> Hello
> 
> Since some days on next, nouveau fail to load:
> [    2.754087] nouveau 0000:02:00.0: vgaarb: deactivate vga console
> [    2.761260] Console: switching to colour dummy device 80x25
> [    2.766888] nouveau 0000:02:00.0: NVIDIA MCP77/MCP78 (0aa480a2)
> [    2.783954] nouveau 0000:02:00.0: bios: version 62.77.2a.00.04
> [    2.810122] nouveau 0000:02:00.0: fb: 256 MiB stolen system memory
> [    3.484031] nouveau 0000:02:00.0: DRM: VRAM: 256 MiB
> [    3.488993] nouveau 0000:02:00.0: DRM: GART: 1048576 MiB
> [    3.494308] nouveau 0000:02:00.0: DRM: TMDS table version 2.0
> [    3.500052] nouveau 0000:02:00.0: DRM: DCB version 4.0
> [    3.505192] nouveau 0000:02:00.0: DRM: DCB outp 00: 01000300 0000001e
> [    3.511632] nouveau 0000:02:00.0: DRM: DCB outp 01: 01011332 00020010
> [    3.518074] nouveau 0000:02:00.0: DRM: DCB conn 00: 00000100
> [    3.523728] nouveau 0000:02:00.0: DRM: DCB conn 01: 00001261
> [    3.529455] nouveau 0000:02:00.0: DRM: failed to initialise sync 
subsystem, -28
> [    3.545946] nouveau: probe of 0000:02:00.0 failed with error -28
> 
> I bisected it to:
> git bisect start
> # good: [62fb9874f5da54fdb243003b386128037319b219] Linux 5.13
> git bisect good 62fb9874f5da54fdb243003b386128037319b219
> # bad: [fb0ca446157a86b75502c1636b0d81e642fe6bf1] Add linux-next specific 
files for 20210701
> git bisect bad fb0ca446157a86b75502c1636b0d81e642fe6bf1
> # good: [f63c4fda987a19b1194cc45cb72fd5bf968d9d90] Merge remote-tracking 
branch 'rdma/for-next'
> git bisect good f63c4fda987a19b1194cc45cb72fd5bf968d9d90
> # bad: [49c8769be0b910d4134eba07cae5d9c71b861c4a] Merge remote-tracking 
branch 'drm/drm-next'
> git bisect bad 49c8769be0b910d4134eba07cae5d9c71b861c4a
> # good: [4e3db44a242a4e2afe33b59793898ecbb61d478e] Merge tag 'wireless-
drivers-next-2021-06-25' of git://git.kernel.org/pub/scm/linux/kernel/git/
kvalo/wireless-drivers-next
> git bisect good 4e3db44a242a4e2afe33b59793898ecbb61d478e
> # bad: [5745d647d5563d3e9d32013ad4e5c629acff04d7] Merge tag 'amd-drm-
next-5.14-2021-06-02' of https://gitlab.freedesktop.org/agd5f/linux into drm-
next
> git bisect bad 5745d647d5563d3e9d32013ad4e5c629acff04d7
> # bad: [c99c4d0ca57c978dcc2a2f41ab8449684ea154cc] Merge tag 'amd-drm-
next-5.14-2021-05-19' of https://gitlab.freedesktop.org/agd5f/linux into drm-
next
> git bisect bad c99c4d0ca57c978dcc2a2f41ab8449684ea154cc
> # bad: [ae25ec2fc6c5a9e5767bf1922cd648501d0f914c] Merge tag 'drm-misc-
next-2021-05-17' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
> git bisect bad ae25ec2fc6c5a9e5767bf1922cd648501d0f914c
> # bad: [cac80e71cfb0b00202d743c6e90333c45ba77cc5] drm/vkms: rename cursor to 
plane on ops of planes composition
> git bisect bad cac80e71cfb0b00202d743c6e90333c45ba77cc5
> # good: [178bdba84c5f0ad14de384fc7f15fba0e272919d] drm/ttm/ttm_device: 
Demote kernel-doc abuses
> git bisect good 178bdba84c5f0ad14de384fc7f15fba0e272919d
> # bad: [3f3a6524f6065fd3d130515e012f63eac74d96da] drm/dp: Clarify DP AUX 
registration time
> git bisect bad 3f3a6524f6065fd3d130515e012f63eac74d96da
> # bad: [6dd7efc437611db16d432e0030f72d0c7e890127] drm/gud: cleanup coding 
style a bit
> git bisect bad 6dd7efc437611db16d432e0030f72d0c7e890127
> # bad: [13b29cc3a722c2c0bc9ab9f72f9047d55d08a2f9] drm/mxsfb: Don't select 
DRM_KMS_FB_HELPER
> git bisect bad 13b29cc3a722c2c0bc9ab9f72f9047d55d08a2f9
> # bad: [d02117f8efaa5fbc37437df1ae955a147a2a424a] drm/ttm: remove special 
handling for non GEM drivers
> git bisect bad d02117f8efaa5fbc37437df1ae955a147a2a424a
> # good: [13ea9aa1e7d891e950230e82f1dd2c84e5debcff] drm/ttm: fix error 
handling if no BO can be swapped out v4
> git bisect good 13ea9aa1e7d891e950230e82f1dd2c84e5debcff
> # first bad commit: [d02117f8efaa5fbc37437df1ae955a147a2a424a] drm/ttm: 
remove special handling for non GEM drivers
> 
> Reverting the patch permit to have nouveau works again.
> 
> Regards
> 
> 




