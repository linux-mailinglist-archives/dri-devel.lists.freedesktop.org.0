Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B81837BBF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 02:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7666010F22B;
	Tue, 23 Jan 2024 01:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74C510F22B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 01:06:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=it7rtCPXZ248Ak3yEAsnFFr+8/p+tU/oKmDnf4IoGu0IBM4mzft5hYOzmT0b1DL4w1mnR6jvVKOM2RQNNBGS8VrnUIVxWijN4+cNpUOrLjHooycua0cX+dpZsT2ns7VkXjq0TbtPy2HucISgGYe3LQ2JtVEOpTdMr9VNhvxN3y0jeXv17ojwPX9sckwMsDRT1Ul4W9FLHXNmxn6Dw8eqL05DfoUbjQCgUjJgaSXddCdYAk9PGTpWthdFdMaGuU5TSCpSRO0JSWOamCdaMyY8QLQORQ8iryNhA5d26CBORGO3ggVKNS+R8Qpvk4YZdOF8P9bG+3cmzV+tq8e3QXENkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uU8eMBhJWEQMwAsGIjqYfpqEVDr7stG4PYJ9eZQFgQ=;
 b=ZhCupOFOaVJB0gwxgfd+FOTH+MniSzmJ2I8B3KQkb/1DDNIK9+Jrb03/Co1zIqb3nUqHspeDm3oNEVV0d9fQwU/nN80V4OmBwFmMjSNSpFvgGpQ6wZtw6NGDtyt4a4a2U45vNpXw/uon26xSjvXqB2hL6bweX22uMbD29B/2swD/dJLITOuzsKE83CfDdxtIOZFa0SYBoSPmlnb7DEY1DexJrsBujAbtbtpdHCcMKu1BY8eAJnkJrVIv6PhRp00wq4eFA+Gk2JoVoFQJcYlKUFVlz2COMZd4tf2lWWdCy4cJ62MhW+OWEQRW85ZqjAM1dAE1qFvplTGSrc2kcXcSlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uU8eMBhJWEQMwAsGIjqYfpqEVDr7stG4PYJ9eZQFgQ=;
 b=aXxmbSVqEQyvZg4R55oot1ubkRkpS2LrysBuY9fc+6jv3FJFBomPsVLTQcvlsrOWn7cfc/51ivIU+U7+/7oQAcGOE9hWppNidF/KvuCaONQZQCvF7aFBwy5kQKX9zqTXvHGiYgFrH+iCIuHTAp0wNWDOT4sWbD9OxkFJaA4ULZE=
Received: from DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 01:06:54 +0000
Received: from DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::5704:c345:989b:8095]) by DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::5704:c345:989b:8095%7]) with mapi id 15.20.7202.031; Tue, 23 Jan 2024
 01:06:54 +0000
From: "Bhardwaj, Rajneesh" <Rajneesh.Bhardwaj@amd.com>
To: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>
Subject: RE: [BUG]  BUG: kernel NULL pointer dereference at
 ttm_device_init+0xb4
Thread-Topic: [BUG]  BUG: kernel NULL pointer dereference at
 ttm_device_init+0xb4
Thread-Index: AQHaTYdixZBeWUpYNUC35r9ns8G1yrDmds2AgAAA6ICAAB2fsA==
Date: Tue, 23 Jan 2024 01:06:54 +0000
Message-ID: <DS7PR12MB5933AD00B803A227CC197E00FE742@DS7PR12MB5933.namprd12.prod.outlook.com>
References: <20240122180605.28daf23a@gandalf.local.home>
 <20240122181547.16b029d6@gandalf.local.home>
 <20240122181901.05a3b9ab@gandalf.local.home>
In-Reply-To: <20240122181901.05a3b9ab@gandalf.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=0beb8593-8ca5-4bc0-a977-d16e0bd3c784;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-01-23T01:05:02Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5933:EE_|PH8PR12MB7229:EE_
x-ms-office365-filtering-correlation-id: 7a7473b0-2b45-405e-6bf8-08dc1baf96c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /tzMi023LiQKhHG814LxsWSAFxTSQiAa2uiRLm/jI9fRPnB2HJCBdDGpesQi1SYWuYLUcs+xlraLLrfnjVbFR7YhTSQwJaIKRpG40vc/S63XDyMAmqisy1hI8ezjeaaw3hI6GoSGIesVWELMfMYBw5ydKvrCfaBS0Ycp6uyGkMoo0jWuwhHf+KgDrh5O5r8TLoSqYbqFnlIPVNroSYS/8UcJmlDHVMzUtGZJDCoYoOtYMSVCuzBJkZO48RAoVrywG5wbeJWTlM6jLlng8UIc9hPUY+2kUb7PyxLxmQQe/EzSXQIvTbfSZoBrrewIHJKbNPUyTCjrRakb8acoXO9s0K0KVo5rDsER0W7LBlY/DDSxDdjAK/I7D6B5StCAn7EWwLnBbQ22O+qhLaS6IomIvVC6V/++VnozejttnAQSUtO73UsWmhHLTzFbRPpq5Q8RF9XJHyjlPO2cDRpdsX6UFkz+8BdcXg7UP+b2Yf1jWDvon4aET/rGFu1KbINhvpxqGkVrTx5XinGO3yiFpA+nbZXUFcinAUTTNvjyNSMbLbg22sH2CSe26P56z3dxBF/tojrqRa+cxpFucGPeyXZanEZP4rsnTK8JYwPtTZNj524=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB5933.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(396003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(38070700009)(55016003)(83380400001)(86362001)(41300700001)(33656002)(122000001)(38100700002)(26005)(9686003)(966005)(6506007)(7696005)(316002)(2906002)(8676002)(478600001)(110136005)(76116006)(54906003)(53546011)(66446008)(66476007)(64756008)(66556008)(66946007)(5660300002)(52536014)(71200400001)(4326008)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?siWKCeXwGMuIYPQ4sAgJ5s09q4uIE5v/pHI1AJKZ40OsVNBgtfpX032bmUSZ?=
 =?us-ascii?Q?QcQWyx5QexeluWjkzfBp1d+Jq8sbkeNGpZLzxEc2LFj94/ib1JLPFnOURXsC?=
 =?us-ascii?Q?y7qfEvRAnKBuvD6VM+FsEhRThKyz2/2U/rUCsEWPGfQ6USP34GT7ISBy0w1g?=
 =?us-ascii?Q?8+ctB53BRDfYXh4SHWgKSzq7kccI4iMYgUr/FcCfLQMNSNQNEb34i+dHb72K?=
 =?us-ascii?Q?oCUnWCCC3RXeCPkWvrEpb5zQWtiRNr+Gf82T6HfyjVc4ZFWs4Qo/mow0XgUY?=
 =?us-ascii?Q?4UX6Y0SvW/CuRRl500PZsJlYcxbFJg11StLmcXlLsxCDaJGKBC5sQMPOCJv7?=
 =?us-ascii?Q?F/kqlwdpDXx7/DYoY9gecCN7sIKQSkcKsRa9KEC6TP9WCTCt/Sal1eyNBPZo?=
 =?us-ascii?Q?ZY1G7v2lB5+br5/e/gO0oDpzBasCKIZqkuEq5KSL1jalYwcS9lFFaZE8XuyP?=
 =?us-ascii?Q?fcwBCoot9ek+Ab2KJsQfIAvX1udNzeVx8KNIKtU1iw4js3cxdQcMaC/wU6Hj?=
 =?us-ascii?Q?BHU81kNtml7H7BDk8TXjetuYYo2uz79TGPSzgRycUo7MQdN6/OjqMogGGb7r?=
 =?us-ascii?Q?qvHzBJ1KKvUP8Pu+DirQgAUI3RvQeAOAbMZaSlgaNWuhX5ZD6RRgDo+7r9XR?=
 =?us-ascii?Q?C27VdCIt6SxMhoB1Av6q7Cbiz0jJksP8dPE5rnAB+Rjmm/T+aIKuri2ekdj2?=
 =?us-ascii?Q?KzRtt+y7vV3qNgT8rBlERsaWCcmu7pOk5eFcSHhOVl0STuF3PL098rlYVq9/?=
 =?us-ascii?Q?k3Wjvd/kDIkYsnyFAsCj+MN4uEYBdlNda13nO/Mry2DpcCY4/ifGLmbsI71S?=
 =?us-ascii?Q?vRiclXgcL0or08CFeSY5tntFb+o4k7lM7h+HZ213YQofb+5S46VEVOtA8hJX?=
 =?us-ascii?Q?d/VhtQD3LFc0zmpC4TrmgfXn+PAqSVqYFlnlKUiMNickE77RYBbBY4aGnd6n?=
 =?us-ascii?Q?hEasp9NVsn+q6bYmmro+VDNa2sFg9Ht/M7pjBCX3r60dU/qq9PY9QQbsOPNC?=
 =?us-ascii?Q?EdF9oIyKlvdgEZksR+WXEA6SJenjwuBZgzDcf8yCt2asKghleJzcCyAEpu6I?=
 =?us-ascii?Q?LEEKCHSb9UYZIctWPgU/xtbycXDK+eHMRGau5GVqmNux+wJ5vHXPAM7rxspg?=
 =?us-ascii?Q?oKxE57hbA06sSXnvfSQFdBJN3upL1Ui9799mdrmmqYhro5tvosITiZwjNxSA?=
 =?us-ascii?Q?CGDWD2i4U6FPi6gjbPg9t9KGj7tlkf6Gh0lV2bXmhnaM7VkxjTBf98ZZeesc?=
 =?us-ascii?Q?ksfCQfKjGzldkqbI3JF3oCuBGvzhq7xXi8jJOrxDrXOSwOHhYJd7CUSHQlQw?=
 =?us-ascii?Q?1YU8e23kZgdIEshj7elFbZKi0i6jcUCMoOZST+hlX0FYVp2txRKzoJ3xewZ3?=
 =?us-ascii?Q?WTqHUX6sslpQs923+ls5HOC0hvSbhgOYH0q/xnFrNj7ywu0BYqcVNFQfnxmq?=
 =?us-ascii?Q?LWDs+2NHNsExTdMOHvppA430SbY1OF9/rr6tz1c70uZenHnZffYb9l27juid?=
 =?us-ascii?Q?ea3d/wmhsJwAYvVEsUe7A/HLZB62kDknr9I4c3gZkKmKQjZFN+qePPU2/vPu?=
 =?us-ascii?Q?1Ik9g00Wci9ciX3hsXU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5933.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7473b0-2b45-405e-6bf8-08dc1baf96c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 01:06:54.2292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: osOA3988KX4HNnLMsy0G90HhFGH7+2KQPlSkU5gOPYery/+WNHT6jCjv+l6Y7w2+6/GAAXlZNHZcTaVs8O74Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

-----Original Message-----
From: Steven Rostedt <rostedt@goodmis.org>
Sent: Monday, January 22, 2024 6:19 PM
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>; Bhardwaj, Rajneesh <Raj=
neesh.Bhardwaj@amd.com>; Kuehling, Felix <Felix.Kuehling@amd.com>; Koenig, =
Christian <Christian.Koenig@amd.com>; dri-devel@lists.freedesktop.org
Subject: Re: [BUG] BUG: kernel NULL pointer dereference at ttm_device_init+=
0xb4

On Mon, 22 Jan 2024 18:15:47 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> >     ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc, us=
e_dma32); <<<------- BUG!
> >
> > Specifically, it appears that dev is NULL and dev_to_node() doesn't
> > like having a NULL pointer passed to it.
> >
>
> Yeah, that qxl_ttm_init() has:
>
>       /* No others user of address space so set it to 0 */
>       r =3D ttm_device_init(&qdev->mman.bdev, &qxl_bo_driver, NULL,
>                           qdev->ddev.anon_inode->i_mapping,
>                           qdev->ddev.vma_offset_manager,
>                           false, false);
>
> Where that NULL is "dev"!
>
> Thus that will never work here.

Perhaps this is the real fix?

I think the fix might be already applied to drm misc. Please see, https://l=
kml.iu.edu/hypermail/linux/kernel/2401.1/06778.html


-- Steve

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_dev=
ice.c
index f5187b384ae9..bc217b4d6b04 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -215,7 +215,8 @@ int ttm_device_init(struct ttm_device *bdev, const stru=
ct ttm_device_funcs *func

        ttm_sys_man_init(bdev);

-       ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc, us=
e_dma32);
+       ttm_pool_init(&bdev->pool, dev, dev ? dev_to_node(dev) : NUMA_NO_NO=
DE,
+                     use_dma_alloc, use_dma32);

        bdev->vma_manager =3D vma_manager;
        spin_lock_init(&bdev->lru_lock);
