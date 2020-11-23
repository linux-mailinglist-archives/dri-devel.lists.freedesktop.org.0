Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759DE2C1F89
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C214F6E23B;
	Tue, 24 Nov 2020 08:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062846E0A8;
 Mon, 23 Nov 2020 20:03:51 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fbc15a70004>; Mon, 23 Nov 2020 12:03:51 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Nov
 2020 20:03:49 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 23 Nov 2020 20:03:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gITd84wMHHzcOptjQRg1Bi4wKYLoloErjGXTzbxbsYYxXpRm6DfDjP1G8JsqPPruG8n8djHpWT3ChykgCoTQdTlPHkj05TPw7WZ4Y46HlI8bprZC3XuF3n009Te/qaTwPxc9ef3s3wxgnUStlvtZrJvP5WQhh3MIKLFTGEWjhLXWcgs1VmoV9q6ndrBwWgPhsRBIC9rKh9qqm9cf9Ujr9sks/ml2cZ4bW16uPSJVifE1ke5RuUikXPZ60YcpNVw15sbmeBPfJ8v059YAkVfr8AOpsBgi+OymMySTg/JYVNFtVJ2pGo3M9pC5txLp474ztgTCR2D9RfvqUQOXT+42RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QophqWBVIGhmInjMMmoN1JCz5yEuED07MVw87J8AVUY=;
 b=dpOj+p56VpZQgFejSTc+TjZx9PpIbmIlWcJPfXyA8QiV6hyerQ1PNIg37pZm/OoPMM7dRNU+MPO2Sxmva5Z6iKtLQpQNkcM79tS52of8WjxHEmReB+Qc/VB0gzy26dU2FtXMoEzn5Rx6YHRp97uhlWeSk7Nsi1BUrieORD+G9yqkgKBmwQvC726s6EkJ0s32uNc7iMGffyCjKbyBtSLggJX9G9WEJ0m0GYQlYWRE7aVXL+Iy16bXoksvn7nW7YXP74v45GAqxPt7EElquzCZ4kXurFfWXXWM9ThsUobGLm/yb7wWVAmTEM+ttWZwc1mR7P3I+RsId2H9o2Xiqq+zAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4338.namprd12.prod.outlook.com (2603:10b6:5:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Mon, 23 Nov
 2020 20:03:48 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::e40c:730c:156c:2ef9]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::e40c:730c:156c:2ef9%7]) with mapi id 15.20.3589.022; Mon, 23 Nov 2020
 20:03:48 +0000
Date: Mon, 23 Nov 2020 16:03:45 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
Message-ID: <20201123200345.GA38546@nvidia.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
X-ClientProxiedBy: MN2PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:208:23a::18) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR03CA0013.namprd03.prod.outlook.com (2603:10b6:208:23a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Mon, 23 Nov 2020 20:03:47 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1khI3t-000A35-Tb; Mon, 23 Nov 2020 16:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1606161831; bh=QophqWBVIGhmInjMMmoN1JCz5yEuED07MVw87J8AVUY=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=Zr1EZlr7FGouweCXJ2A3YJZ8lxsTazMwmiIDkNNgeYuPc4M3hA0h9guNHLXrnnLeX
 Dp0jtpGLpYuZZsYit0m8+Y/3Pgk+U78P2KDuhjfei0oh+kHbQnRfzB2jD1Wu7rVyZ8
 A2iuCgvA8hhwNVx8Bo/l4LfRAECKvf8eJj6um7c8+wyJ6oFgyijvPixB8Xcq6YNTLj
 o7o09Zdo2SkPJV9Ld82VvGAW1KENwGx8qxL8L4kHw5xGizl/kk/4FLfOCs8mx17bXD
 N2PIS7AsaPoH2bHogxWrZ7vcH6YOCMGYKk/oZQ1BhSoaDoH96AMZAs9BCirfcyYEMq
 3EMRDyReptNPA==
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:40 +0000
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
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Nathan Chancellor <natechancellor@gmail.com>, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
 samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 usb-storage@lists.one-eyed-alien.net, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
 linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, tipc-discussion@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 target-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, x86@kernel.org, linux-nfs@vger.kernel.org,
 GR-Linux-NIC-Dev@marvell.com, Kees Cook <keescook@chromium.org>,
 linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-sctp@vger.kernel.org, linux-usb@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 12:21:39PM -0600, Gustavo A. R. Silva wrote:

>   IB/hfi1: Fix fall-through warnings for Clang
>   IB/mlx4: Fix fall-through warnings for Clang
>   IB/qedr: Fix fall-through warnings for Clang
>   RDMA/mlx5: Fix fall-through warnings for Clang

I picked these four to the rdma tree, thanks

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
