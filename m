Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8C71CBF8A
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 11:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835A36E2ED;
	Sat,  9 May 2020 09:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20083.outbound.protection.outlook.com [40.107.2.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DA56EB19;
 Fri,  8 May 2020 15:00:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzO04pnsBir+nkWCKTeXKJpiXUvaeJ5KJhMv3YpmzZ2GtXihnp2qaZgl2C6Xxnb16k20U6MpQWU/xgKE7d4Xrj5L+lAPbSL0WtXhWmx4mzRxJK9rc4shL2x3peVnQ4vwmJdv7oMLr7tb9e9ZwMpcLXl7BmSImVyk1EzRR63JZPK+nOtd1hHtKItxlm6ITTElZ8hizQQ6zwacbq7V2Q/MQrx/dTvmq7pFCzpcuFKatH43Y09xseGHlGqa73jkSB5hXsvs7jeavg8Z9Lzcp6Us71ZRFxqpUHI9jn+UsnFaqkgdJA6QMgakj/nKL+cNJQLEMNFfTvZZbPcmHxVJ6kPlGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8V7ASgBS5PqV98Cmy3Z8v4zNMw4FzKVwyVNKHCdwFHg=;
 b=fLGoIZwXn+OFZjlGFW1MiFqBevknTkD+cOLpe5ngnd4t/L5tDceb8ejYNpgpbRI9Fle1EJIDm1hfdAWxMTijkSLxQ+S4997IN/YCo0RBechSanYXdaTassADCx7ucx62aEA+ySoQvFwV4SByQYIm52NkGur5y+gcFsQ5dHxSHzdZ/jsXr6MMF6lUr3ZbJiJ05lQ84Dc2DHfdYZm7NhWlAbQuwhpyMwV/6WIvW+xOLlCcRN+xxnNaFrqsAs15wJMyHtC4A16OSnfQYaPKr/OyhM9ZLqfNteB6lJ9mohAnPnsipD0KP2oCaKOrQ5KR9qs+tXgmzYoCZ0/BvIG44R4t/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8V7ASgBS5PqV98Cmy3Z8v4zNMw4FzKVwyVNKHCdwFHg=;
 b=LNKjAwB7A4hx6kdEmnqEQr+JI/Z2AvjA4iT7JcyEktGzZXx/3P/YDX9XnjN3tSc55Hd5leFMEMCYf7GZMynzR9xpbqBZmzmOANVtxB6lDDAsAR8Rojf5Ve0cKzQ5hXMYL7h1AKsyvXK0nArz0Y3EVsw5PS57ViQUrHFqGd0M5Bc=
Authentication-Results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=mellanox.com;
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (2603:10a6:803:44::15)
 by VI1PR05MB5231.eurprd05.prod.outlook.com (2603:10a6:803:b2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.21; Fri, 8 May
 2020 15:00:45 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::a47b:e3cd:7d6d:5d4e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::a47b:e3cd:7d6d:5d4e%6]) with mapi id 15.20.2979.030; Fri, 8 May 2020
 15:00:45 +0000
Date: Fri, 8 May 2020 12:00:41 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] nouveau: fix dependencies for DEVICE_PRIVATE
Message-ID: <20200508150041.GI19158@mellanox.com>
References: <20200508144017.3501418-1-arnd@arndb.de>
 <20200508144017.3501418-2-arnd@arndb.de>
Content-Disposition: inline
In-Reply-To: <20200508144017.3501418-2-arnd@arndb.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: BL0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:91::27) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by
 BL0PR05CA0017.namprd05.prod.outlook.com (2603:10b6:208:91::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.12 via Frontend Transport; Fri, 8 May 2020 15:00:45 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1jX4UT-0006Tx-1D; Fri, 08 May 2020 12:00:41 -0300
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e16ac852-5a19-4c22-6372-08d7f36095bd
X-MS-TrafficTypeDiagnostic: VI1PR05MB5231:
X-Microsoft-Antispam-PRVS: <VI1PR05MB5231B3A04D48419600D6480BCFA20@VI1PR05MB5231.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ojWfEiXVqN8qK903SX4vXCpNEUgJ3E9BOl81pW79Fp5j/h1olNTbg6QG9QYRkW1mjQbu/hc0i2xGtK9D8caC41KowowY1oXx5f6mS/bFKN8hPMumqYHTArqlny9riPmN8sAlMu7S8kYqZ+idNwyrbCpCoDAFbr6OOjtVe5uWvFymKJWsQfa4UTFb3sAyw1lnrWvH2k1rEmsYf+wn+OL31e774dcJyxqDhKvZeIOO/7+AUz6b0hQzdSJ/nysgFmq1oLuOixUmvwkQ8wotsLCpqzqXAee9N2eRB2iE/rFx8SBEOvr4sL+Cwz8agAGGKbyBG5pF3Rth9SFeqmhfrILKL+t/sPExvzADE1WWRO5Gz6B2dL/JY3dxORA4/zTOHYv5JLXWPuXRnRItQyVb8cMUidY/BxkLEXm4ZdhQA4gG06/ePTo/M2P9Is0gIZvV8CK0nORQdqF1kVK3Amy0tp/Ny6dB5mwBvnFruwnfEwNcmsjSH35a1aICTkgyi7zkOjfgPiOhar6WwPxmJBYesfsgWCaYuEVcwm59KRhiGN2siP8z9yACeQoQKZ7zNod/f4Aw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR05MB4141.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(33430700001)(52116002)(66556008)(26005)(36756003)(33440700001)(8676002)(5660300002)(9786002)(9746002)(83290400001)(83300400001)(4744005)(8936002)(1076003)(83280400001)(83310400001)(83320400001)(86362001)(4326008)(186003)(7416002)(66476007)(66946007)(478600001)(6916009)(33656002)(54906003)(316002)(2616005)(2906002)(24400500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: QhqeP9xDLq8FRJQE/YQ1PYroDXY3FJ0UzoqV3YxGuB1C5rjoWZTQQW/qVfDyPzTZehBYtoejbMMAgRjPnUEtg8z/uROqlw2u/XpTfT6Xf48tN5fEEqnhj3Njq2qIAse+RtzcFdUqLMlZsfIwZRYwLZ0vQ4wZjPth4tPfOB5fEH4S58n2yZ6dFe5ZhvR4yP+baNMGTUwv/nqdTOjJ6KWDYoqDEWZmbn5IZisDzf7ddErnpvreO0KDZ00DmMVAihRCcu7cck2mptMMKgYRzN3W3uceGBnCYtTlKTFHfChzaMCp8NMlPKqy3BqOerada12JVoxQnckmYa4ac/WPGZJQkqN4dEi2t1shE+i7QD0VPhY/L9+a9LlxlEqeT3Xgr9ul3AzwPN6yDkUPRA4NKjwnU1Whbkh1YXKYi9yr2GSd2vBEmKqjNFPSRNpEkwrfcnT4vgGIYhyjhPQg2NBxDPALE28M+fRfuzW83APauKNrx9km9On10BHuKz87Q1SX8NuQ
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e16ac852-5a19-4c22-6372-08d7f36095bd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 15:00:45.3220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHUZNrY9tbacLK0JliFLoz48G0VU/VsGTeHW7tsxu4n126F51y5Fd0BWjxfiwoHSVQUuGh9m1vUe6Rav5zB0Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5231
X-Mailman-Approved-At: Sat, 09 May 2020 09:04:57 +0000
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

It is kind of unfortunate to lift dependencies from DEVICE_PRIVATE
into the users, is this really how kconfig is supposed to work or is
something else wrong here?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
