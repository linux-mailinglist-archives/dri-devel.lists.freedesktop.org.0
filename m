Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640A2FAA3D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 20:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712626E573;
	Mon, 18 Jan 2021 19:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770054.outbound.protection.outlook.com [40.107.77.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175296E570;
 Mon, 18 Jan 2021 19:33:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aG+BdsFNDgowqXooMz0qykp8S4m4ikklXeyEIsutpdCSdyuRZMb4ozPB3b0tPFum1TJYtc4amUtT5uicXZQ4xsG7vChb/yQIiRpcmJ50z3vjUTz4AVm54l38AnpUZzY2T7r2WHdA+JJXuW6R0l1KaVteKjicV+rNVu0D46BhBf7GEXSgU8iYlrToEs0yKsMzZZACfj/lSRmjfCuAVFR6WxTqMh6VW151IO3QTRHS45hN5tsa5IEEyaimBUySMqDvYTX+HYWP64VDasMyozret+dr9gHXmzWPvAjFIvWDIHsfArCvFxqUM1r9yotm1rfkps/5PwnKw629ij3swGfWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+AkQcHX+xzrwhhEM/zgfqpPUe8og6Dd2tQTJeYsE5U=;
 b=DMiCl4fshBiggsNeFPMHzlvHpa0cCCCr2WFq5C94oB9OEmWXipJUJvAExdbenMtdWr6KCFQ6DzLZR2Rbn9nTxK8KDMwB/8pfm97gvnS4k+FuS7VVKNfGqlxEEUD8TsNC/I8rQjK0t1WMOxmZ9g7vI9w1k44y3kcTCPoHSavYPMP3/NXWNKM6WpA1VMxUaf0mm219MF9gR8nPqUoQku/GA2wYopAuLQnIm9bgQNZ/wCE2NWH7AgswQQlyUP/KoxmPQAFCTs5dXztIxjzGYFS9fz7ApINntFxDpTv+9gn78fkMa0SolJ/H+efNaFA2A8U/78PWC0QDDAsSkzURrydGNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+AkQcHX+xzrwhhEM/zgfqpPUe8og6Dd2tQTJeYsE5U=;
 b=X5IKBtm9EtKJRnZrIJll03uhTSyVw9u10Qd33PSwXV2XzryTOOQ0mku9Kh9NvCtdkuk3UFAEBHv7vy019cGTJonHhyazFSUOTExoDtwFI/c/LIV/8Q0SE22/8N9bgJQ7Brp8ehAF7kqRE6D/EHkbAcBegTzmqxcfzkYAUVliA9k=
Received: from (2603:10b6:208:8f::18) by
 BLAPR05MB7409.namprd05.prod.outlook.com (2603:10b6:208:294::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.4; Mon, 18 Jan 2021 19:33:09 +0000
Received: from BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::856b:10f9:d35c:cde1]) by BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::856b:10f9:d35c:cde1%4]) with mapi id 15.20.3784.010; Mon, 18 Jan 2021
 19:33:09 +0000
From: Zack Rusin <zackr@vmware.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 5/6] drm/vmwgfx: Remove reference to struct
 drm_device.pdev
Thread-Topic: [PATCH v4 5/6] drm/vmwgfx: Remove reference to struct
 drm_device.pdev
Thread-Index: AQHW7Zvj340/8ECBAEqG6awTVqydY6otxkSA
Date: Mon, 18 Jan 2021 19:33:09 +0000
Message-ID: <4AE40A60-7DE8-4018-9CDB-FA4EE4F378CB@vmware.com>
References: <20210118131420.15874-1-tzimmermann@suse.de>
 <20210118131420.15874-6-tzimmermann@suse.de>
In-Reply-To: <20210118131420.15874-6-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01136b05-f562-4d13-4d7a-08d8bbe7e320
x-ms-traffictypediagnostic: BLAPR05MB7409:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BLAPR05MB740903A7FB2BA3EFCB58CBA1CEA49@BLAPR05MB7409.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v7SUfQ3hfgpjKQHJLvMynkVewAxiYSkUONBopywHRupMH5Y1fYOO3WsohR/0GcYEHog/oGeGiQ7ddPmsKpXHhUqdOzUWNsGHSPhwQlbV8fsZ+g9hI/ps1vMpLApDsAWWKpHMGUY7RCr3BpB3obvAaxG1VGP893EbbJGYcJ5jPOX9iVtE0wZ31xE3/VYtGct094KSJcfrMbGkceO/CUCjfXHXSf4otIdXfz7JqLB3DAvRDmxXB8YwauWuA4poel/do8sMn6C4agF7ndW/fhEoarQBGPkIwYsq/Fffnb4UmbG+WJiVbKnJQzsb3iR+2swthgBUUcOf6aSVuOaIylFq1wcP3TBmQ92MmqasWrwzuFMl5Ec82FFD4Oj1BjjIk9WiZm2awz/oQA//gKJZeu2S3ZHXrdoh7BJorF2lBBkY/BHAqFfXxc1pgc0RCbcRnLqhoS+ty3XdBTGq7OWn3HgEGmnsCfwWbsonq6QnDPu2R90pejg2HXnDy4c+MzQdikf1+uLazwG150xSfNU7gIV1Md4P2LM/iTWupJRy2IMstk7MTjwgG0Vb2+fuUN2OEFRxlse2hD98xq+q3oF7AJoCIg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR05MB5186.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(86362001)(478600001)(6512007)(76116006)(8936002)(316002)(8676002)(66556008)(64756008)(53546011)(6506007)(66476007)(33656002)(186003)(26005)(66946007)(36756003)(83380400001)(2616005)(66446008)(4326008)(5660300002)(107886003)(71200400001)(6486002)(54906003)(2906002)(6916009)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?EXpmoVEDsqdPMTRwzyJQe1Y8W2izArOW9W3i0ObJEHNQlolU+8sG3jUFo3Z1?=
 =?us-ascii?Q?t1jmgGGMkOZad3lqryGRSoGMe4mkri/69gcT+3QXcFPSien1YwYZr6ORNTRx?=
 =?us-ascii?Q?tBDEbgV0I81a1FAB15v6KxfEtLOarD6sKp8HHVjqVvbC7XmCP7nFCTYOqPy0?=
 =?us-ascii?Q?ekoc6nRFqgL+U1G7DYp+Z51WqfbFv7MRIIxZ5yLmBrbeUpxDICXSfVMv48OI?=
 =?us-ascii?Q?6Bxj5WBM6/OmpgbwI/G30lGhdHr4En6ESug9BIb1kas9mTe1RZlrTZBKAbcf?=
 =?us-ascii?Q?LvhfN/Fm71VQVCGMHQyUZo7iqDt+Q713Zj/vqWsrNfZ13lMXYHQV3C5AsfX9?=
 =?us-ascii?Q?CZuZ4juVpy0qUt71vvCtxKZ6/1Fzx2ubvp4EOviQmA/cg0GMpsAdfS9lyOXX?=
 =?us-ascii?Q?OQssz9kRZqdK0knSJMwMgntNlKfinVixIVKOcQdwxLeMq8f7qQ2PtHQURhuH?=
 =?us-ascii?Q?Q4nBh9aOO7XQple79EiUmWKDUHdmGFz49PJiYMHYMaTOGpO7gf2DK/LR53Cn?=
 =?us-ascii?Q?zhJte4V13OOT/iQcFOj9w/fj+0lcECsyBweFzSCSpctdf2x1EGSI4FjRHhxs?=
 =?us-ascii?Q?QtODksVigYmYAJ7QRuOnf5hbSE0BXC0Tz3shGRZLOKuO6S/KKW2HQU+I+ZCT?=
 =?us-ascii?Q?/a4Y2KFySdF491PgJB1j+MNOVoQIqt5yArzpKVRO9MIK3mfzYAEZONdSQCZs?=
 =?us-ascii?Q?Hnk07qYMYCJOGk4rQNlYcTjNW7BtkMTfisJoi9+3imr/iz9t82TR94CGtRGR?=
 =?us-ascii?Q?7JD95asC9/oWJ5aJNa8CWNXQCJ/EDvyai/GQq4tucMTZA+AOYZlxfkAylgjo?=
 =?us-ascii?Q?ZUnakxmm8taAZLMnpu6R8Cq05MOh1Fk4uHqJjBY2osHED8KI80Ykp5jOYM8m?=
 =?us-ascii?Q?9z/TLn0KeOJMr4p4IfwQzJlnQcqfZGGU/3CEa+Pac8Yt22YD5jel2FiCNQ8i?=
 =?us-ascii?Q?NWGG36Fn9TaOGj9A6k75N5AnS+qsBERIKMdUz8iyM1cZ8m6sm/qTfHlMaz7s?=
 =?us-ascii?Q?4z2X?=
Content-ID: <C844590CC3171849874BAF6A1BD101A2@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5186.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01136b05-f562-4d13-4d7a-08d8bbe7e320
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2021 19:33:09.3940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b6/RhD9ghtJaNTG1t17RNSjZFHwOKKaTsl5NJRYApFSpPkAObflOjKENrw4phRJbzxRNpL58fU1qVwNYqvsYmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR05MB7409
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
Cc: David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Roland Scheidegger <sroland@vmware.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> On Jan 18, 2021, at 08:14, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> 
> Using struct drm_device.pdev is deprecated in favor of drm_device.dev.
> The reference to the field was reintroduced during a rebase.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 9703bb329206 ("drm/vmwgfx: Switch to a managed drm device")
> Cc: Zack Rusin <zackr@vmware.com>
> Cc: Martin Krastev <krastevm@vmware.com>
> Cc: Roland Scheidegger <sroland@vmware.com>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 1 -
> 1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 8c3eb00e8b54..545b83e338fc 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1524,7 +1524,6 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	if (IS_ERR(vmw))
> 		return PTR_ERR(vmw);
> 
> -	vmw->drm.pdev = pdev;
> 	pci_set_drvdata(pdev, &vmw->drm);
> 
> 	ret = vmw_driver_load(vmw, ent->device);

Ah, sorry about that. Looks good.

Reviewed-by: Zack Rusin <zackr@vmware.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
