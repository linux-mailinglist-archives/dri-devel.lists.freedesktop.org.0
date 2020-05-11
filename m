Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C783F1CE872
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAD36E7DA;
	Mon, 11 May 2020 22:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150079.outbound.protection.outlook.com [40.107.15.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9AE6E47E;
 Mon, 11 May 2020 13:53:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KD1zKHPocl/DKZF00C3Jgc3L+yzaWtkM4fmpbyZACQ3QrIVEw3k6m0aFUmobUOKnX6YhGx30fotzdB8bQ0vzoBM7Tw8nEHkgiYm8EsqlsXGzkVIpxC/GdXgEJRNr/T99fh6MIXAk4Z1jRiALh2QJCna76eqzTc57CkhteszGR+j3b8wd/uZF4d5dYd5j/Y7Jk2XsF/mAT37D9ZVXucFaJW7ymYrDfUWIsyOHG1ZKzx4hmTMP3XxgYzmrusSEOOJ8mg1GqFMyXWEncLgfqpRMXMXdyYHcQY4jCUQUrsSJHERJn/0KDTH+F5bMHzCBQTmbiswsG+z4+ga0qQLZs4NWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5ZJ7nwLAEgiloip484vc2nqKALP6FN62V+Jo5+D1fA=;
 b=msohBbo/PUsGUBo6mznKtwuieVd8+8RlPdFrcrbTUYQFbTryjsrhgXd42CQcxL0EdzyuCqCzp80CplC0wh3PhanJ89SFxXdB2EBocFmy6D5UbjmEFzWcNgSjVLH7LGDke3/qtkvq6iaWurrNdywsOyCxN4fMjpHgqeVdmTqlMhOyCaq74fPoRBf7o62d9oGqoRlJc3oFG7OxWRP2XYbbQTI/yGr52mPp8g7xF0z8+4CO6kNab+O01wTKE3t9QMiFC2NX0VMMIkXUavrkqkLryEq0u9OZM7fRKJJeaPlFWqKeyT5RqIyX3buR3ot/nIKUfu5HCAewvaVyY3NEtAeEGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5ZJ7nwLAEgiloip484vc2nqKALP6FN62V+Jo5+D1fA=;
 b=bPWKt1+j5uF0mCPq8Q7FVExWYPhxGAt82FRoHFmI9ncZOg5+2ysUJx6HoZtzXFRJJ/ijeXKDYTSTBt5lx7lngXwf+Dmv/2odzl4M3jtA4cdu/osx6IkkOxgbBqnXjFat7qjRWwomvxgn6vsMDaeK7vk7obS+Tly03fvr+x6OL1o=
Authentication-Results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=mellanox.com;
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (2603:10a6:803:44::15)
 by VI1PR05MB5775.eurprd05.prod.outlook.com (2603:10a6:803:ca::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.30; Mon, 11 May
 2020 13:53:02 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::a47b:e3cd:7d6d:5d4e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::a47b:e3cd:7d6d:5d4e%6]) with mapi id 15.20.2979.033; Mon, 11 May 2020
 13:53:01 +0000
Date: Mon, 11 May 2020 10:52:57 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] nouveau: fix dependencies for DEVICE_PRIVATE
Message-ID: <20200511135257.GT19158@mellanox.com>
References: <20200508144017.3501418-1-arnd@arndb.de>
 <20200508144017.3501418-2-arnd@arndb.de>
Content-Disposition: inline
In-Reply-To: <20200508144017.3501418-2-arnd@arndb.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR19CA0042.namprd19.prod.outlook.com
 (2603:10b6:208:19b::19) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR19CA0042.namprd19.prod.outlook.com (2603:10b6:208:19b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33 via Frontend
 Transport; Mon, 11 May 2020 13:53:01 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1jY8rZ-0005a8-Vh; Mon, 11 May 2020 10:52:57 -0300
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1892e4fe-c0ee-47e4-5f8b-08d7f5b29eef
X-MS-TrafficTypeDiagnostic: VI1PR05MB5775:
X-Microsoft-Antispam-PRVS: <VI1PR05MB5775A05924E1426342803552CFA10@VI1PR05MB5775.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 04004D94E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fZt6VaK45FmKIEiVbbdPOuFBXam2z7LSd7B4Bgx4mnEKs9gP8W7YtJ6QR6DTJthM4W8UtmF2Aga1kVRZWFgboxEDxJZq+wTbYo0zxKCPgj/mpO8oTI0C6lCpw7nqnP9c9N/IULfIcZPeL7XkxW3dHD1yYyKnUi0xscmHJQ8K7/kn70Z8+oKnNHBO10K/YiPeMUGZ6Mh3yi1Z2zLXo5Y881yO4Oos9gOJ1S4t8e/9SfKW4psrK0zkZigJY43tOxPFcHO5Anx6pVPNFSfcuCsNE5uo5de3yrP0mmr9XEHHpmw5C0aEj9BZ114WmwO76T9O0DHcnIp1p5RaruzFh20xNjqw7Jqdd7yg4GifDbXVwaVYlNBsGYjdPwEo0ozQc8Z/6pLxKPtjKzvCcLe7DG0SSwN7SlQcMSDUI5Lzo2AWb+SDDf/6mvCNDND53S91807tUAiluQZYDwnAVvGzEk4RNt0gfKd5xa962PFRExBZjjnzNML9WNpgWmoq0ePDnNZ4bAvkSlEeJEf5WPH234LLZP17av/j+Goaf2F43VPi1OIVTFB+HG1o1OFFIfhCzNkw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR05MB4141.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(33430700001)(2616005)(36756003)(26005)(5660300002)(4744005)(478600001)(186003)(2906002)(1076003)(8676002)(316002)(54906003)(33440700001)(33656002)(66946007)(66476007)(8936002)(52116002)(6916009)(9746002)(9786002)(86362001)(7416002)(4326008)(66556008)(24400500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: BY/oXkvYyC8NByrdiEWbBYbEmPfwK8PollehsQ3uDEyQIb1NKNbxnJIstmMVZNshrIIuhFXQ+gQD2Lu6kgMncOhsayWKf1vru1bDXUGsIAH9vCLk+O5N7b7G2x/dFIDRRGvfOWcsWp8u7t1FkFEOk5d5lOo9llkK7JH0asJ/rVN2M67KU75pml3GbU8pxIj/2nwMhyb1vQcVgtYay6x/pk5i7cXQ1mHIWCkr8YNLQlJR2oeiMO96RSKwdhUtD1FttJMruOzegpT5xHOGYf/vwHqgGjy5v3n7ST2dPp1V/g4W984hN51WvgopJWgXTRz7da/xGfMlEmZDlMn0nw2LBsczyXy9mZMddDPQD0SbgejBmj0QkFoBhq51rpDt039MlPL/O7vT19cqwdsql89JC9iIB5e+ZM2D2RwIAXlD1QTuQSL67mRmxwkcxHlp0bMXVRSvFELtRYkWwcCTVdr1pfltdLKQjIgTmL7S+oSRwba5aMNCjaNZBCgPzi1eThcX
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1892e4fe-c0ee-47e4-5f8b-08d7f5b29eef
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2020 13:53:01.7974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfir74XcsyAKSreaMY/Uq0DVLRmfj7GSdR6SVjVoMk7uAmyBXd9b0mKhVSCQQlAjYDfU+fIr8OlNGFRezCkJ4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5775
X-Mailman-Approved-At: Mon, 11 May 2020 22:51:58 +0000
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
Cc: David Airlie <airlied@linux.ie>, John Hubbard <jhubbard@nvidia.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 08, 2020 at 04:40:09PM +0200, Arnd Bergmann wrote:
> CONFIG_DEVICE_PRIVATE cannot be selected in configurations
> without ZONE_DEVICE:
> 
> WARNING: unmet direct dependencies detected for DEVICE_PRIVATE
>   Depends on [n]: ZONE_DEVICE [=n]
>   Selected by [y]:
>   - DRM_NOUVEAU_SVM [=y] && HAS_IOMEM [=y] && DRM_NOUVEAU [=y] && MMU [=y] && STAGING [=y]
> kernel/resource.c:1653:28: error: use of undeclared identifier 'PA_SECTION_SHIFT'
>         size = ALIGN(size, 1UL << PA_SECTION_SHIFT);
>                                   ^
> kernel/resource.c:1654:48: error: use of undeclared identifier 'MAX_PHYSMEM_BITS'
> 
> Add a dependency for Nouveau to avoid broken randconfig builds.
> 
> Fixes: d2c63df2242e ("mm/hmm: make CONFIG_DEVICE_PRIVATE into a
> select")

I've reverted the patch this fixes, it seems more trouble than it is
worth.

Thanks,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
