Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B68992B77C7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264886E3C6;
	Wed, 18 Nov 2020 08:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2138.outbound.protection.outlook.com [40.107.92.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4336389CA0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 00:20:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FloEF17SQVxkGzis9jj+bNW9RxfotjDZA+CChFhnIABsSW+SnzZep33Y29PdhIn4FMlEcZZIP2XN/IjXdhEeiYD/oY2Ob3+913FGIwtwIJq4jfH2XdoxMdz5B2Q6zWLZzADFBG/zcwxVG7V2B91g2+22qKEFGxNRiX6pdvFiWy+p1kxjcDSDTpPwHrN8NmOxu1cFtOmTYm+WWFcTOcPQ/flcfZ5vzdeBKhY4mR9l/EK1Fdlpn1KNUPEmt71FwgI42mT3WJb+w/PBZGcxz53JzUUza+U3nE2ofJFWKq5Fqd08ercBj7Pz3mZaqFrMsVgKjfKsOmPIrFK0ZOmpwqjChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0p8bBET6I/lJFcCbDC2/2PI7+/RSDigUYD2YRqIwgo=;
 b=DnsWDW7aotkWRcX/rx5U/SETJI2XRxeHYYB5EdfGFj418Lpy35SBTELQePR3omMpnNtJF/wKAbgLLs9o932fxdRwWce0ENkLzjiVE/I7XQIxQDwZp3gSM8lX7Jg9G4lPOCRSly1QJhZTXBiKqKETKAaPOZI4OKH1Wrt8Kikic8lu4okDZEbfqQqxUSSmhdIBf/aq3mn6M4I8d6/+cghv7BvANyajhaq8WL2myA2RmOT3VDZImXA44jfWSmMWmNix18slVZDlFdZxBc9Ihd3307Guq9N5VRB+M5oCoLCMJV6i1UIPy/ZW+4mymgjLRFPX86SivoOxgtiobwUCsZ41gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0p8bBET6I/lJFcCbDC2/2PI7+/RSDigUYD2YRqIwgo=;
 b=MG6rpoH8f+ZtXGpunaM+kWYmbl5HSgTFNPE04RagU0M5Vn6quIk/1Qw40MQj0SjQkb/oNQDuqdm9B1HGwMAP+6krZ6eIWvgrYoe5uFENqqVQoJsDPT9UxMg8cD97CVcfIYEzv09KGws3HDZzPoXMmgosy4y2DOqUrYLa8YkCZrc=
Received: from MW2PR2101MB1052.namprd21.prod.outlook.com (2603:10b6:302:a::16)
 by MW4PR21MB1891.namprd21.prod.outlook.com (2603:10b6:303:79::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.4; Wed, 18 Nov
 2020 00:20:11 +0000
Received: from MW2PR2101MB1052.namprd21.prod.outlook.com
 ([fe80::b8f6:e748:cdf2:1922]) by MW2PR2101MB1052.namprd21.prod.outlook.com
 ([fe80::b8f6:e748:cdf2:1922%9]) with mapi id 15.20.3564.033; Wed, 18 Nov 2020
 00:20:11 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Dexuan Cui <decui@microsoft.com>, KY Srinivasan <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger
 <sthemmin@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] video: hyperv_fb: Fix the cache type when mapping the VRAM
Thread-Topic: [PATCH] video: hyperv_fb: Fix the cache type when mapping the
 VRAM
Thread-Index: AQHWvT5LrMWTzMjad0qzQTxNmF/vRanNBgtg
Date: Wed, 18 Nov 2020 00:20:11 +0000
Message-ID: <MW2PR2101MB105243C3AD5106B2ABEDBAB5D7E10@MW2PR2101MB1052.namprd21.prod.outlook.com>
References: <20201118000305.24797-1-decui@microsoft.com>
In-Reply-To: <20201118000305.24797-1-decui@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-11-18T00:20:09Z; 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=de31e602-f6bc-4895-98ef-7ba20096348c;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0
authentication-results: microsoft.com; dkim=none (message not signed)
 header.d=none;microsoft.com; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [24.22.167.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e30d2e1c-e0f8-4fa4-e08a-08d88b57b6c5
x-ms-traffictypediagnostic: MW4PR21MB1891:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW4PR21MB1891B170E78EF11DD106C9DDD7E10@MW4PR21MB1891.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 31A4akYy/NvTFierrRX6u1IBYNC6+s8FxaCVt5u8Mz3uwaTmNp+oEOHLiSX0TKg9YQO5MSQqcZhnFs2W7gEJd+jwYVdLPqdT7zVsmOQSFenSaZIm3m0vQTsHaKAJVUsiXLagW99WQh3C+npZPlT2Y0+pY7XC22ggaWedyVp9y/in7aw4Umz3XMMQcBsxjoZLm2DIbj//3+udDiIYZ+oaGIoPYySIacH7M8qlYrnFGYSRrzrxfc4jqL4rH/yZ6wQHyiKANFLvvweyVIEuiMVm98lYn7rT/QE/wsxUKYLdDJgppIxyiSw2e4M5PBRnaq1ji6zR/3iWqR2GZZm2UdLdPh32xwd86OpiynEo0a3fnRY13OV/EwerXGFnUWOwm1MP67SVIyyvCMPp7NcTXQyIfyoe86xpj75nvOBZAd853fBwweCzjKcFjl0vH2/Um2hq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR2101MB1052.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(316002)(8990500004)(82950400001)(2906002)(186003)(966005)(33656002)(7696005)(921005)(110136005)(26005)(6506007)(82960400001)(71200400001)(8676002)(8936002)(5660300002)(66556008)(86362001)(4326008)(52536014)(66476007)(66446008)(83380400001)(10290500003)(55016002)(66946007)(64756008)(107886003)(478600001)(76116006)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: AY8Kg4BTIQc8/CkGpo+qI2KCTqFqIGl9+fjyAEY6aq5JRFnRMJGTEOoDpdhRcY378eCuBWBczyD9SnM3QQNIkC+hEgkHukdM9QBlzdW16Ncgdwmdkw5QzRCH3vx/0qbia+X8nW/m4FJ0QEvEmIHA0PbhJ24M4r+ut5Gkhb3vIRutUXRCmlmBL018arbnJ0mi8C08+1lBR0Yo4X4uis65eY+/c6aV1Ut0wFwDERv/mJfu6dhmc0kabtW5PC/ECYn3JRhYf80VblhBiDCINVvlKCRoooz/kJCL0E61oNWkLKSvta4kBl4f/M7Lro5AOeo4tT2mNmGiyihRPmFdTThmHSxdf58OdmMRHxPFv8CfomMDNybsfhx7ijRvU4js/CSHavzdpbowx1GuQAuK4sVnAP8Bigne1kVPF1yg+XvNwq0SSODNCUzvz1WOzi8l6AGMkcif8YROW4fp0tB5SgjCp/kv6nwMiZ7sI4ixB7hJHDmQKfuzDQW6BYfbFR/mQaBQv9rdfjueDMrv2vq/AmmVr4dgb35Glx9EzH5sQ0yxnrqWVFSa1gTizF8INzR++x8j73mQoc/qv6TLAhkM8TbAfyZ0Yps8Pw8AOX6K6kBerr/nmBC9ZtlgFJEJi57lmRopK2GNYmde+gBTmSip7yWw3oLhYQKMQgDFv88wA4kZ/Wq7mmeqmrFj7Rtkk1zGev1o3vu4Yo+tizH6vZKI35bvLItxrZZ8AUqFQOJMWW7Xb8KHbXlSyTtTRzCkAvKhvAkaMmqHgzgvLz/JSCHQothk9mLNwBwPxcA/CiEurvfZDPgol4/q9Wu9+sl3G4Ow31JBRWE8dfMBICM+Q9BsfLSaP+ac6a1a1MX8eepPSF/9SCfN//kq3Iw86pxlmIzliETH0g69y3o3Wa27RpFKvOHQ1w==
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR2101MB1052.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e30d2e1c-e0f8-4fa4-e08a-08d88b57b6c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2020 00:20:11.5283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UmCqKdtQsMi1o5xYrQLes12XTRwg/dGOaqL6zFZMz9IbmYlb6ipZuJ4+aGBs4U/tsyIwdzqo4dFAFOVKSbexAuxFh1x46z3hhJEZseiwBLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR21MB1891
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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
Cc: Wei Hu <weh@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dexuan Cui <decui@microsoft.com> Sent: Tuesday, November 17, 2020 4:03 PM
> 
> x86 Hyper-V used to essentially always overwrite the effective cache type
> of guest memory accesses to WB. This was problematic in cases where there
> is a physical device assigned to the VM, since that often requires that
> the VM should have control over cache types. Thus, on newer Hyper-V since
> 2018, Hyper-V always honors the VM's cache type, but unexpectedly Linux VM
> users start to complain that Linux VM's VRAM becomes very slow, and it
> turns out that Linux VM should not map the VRAM uncacheable by ioremap().
> Fix this slowness issue by using ioremap_cache().
> 
> On ARM64, ioremap_cache() is also required as the host also maps the VRAM
> cacheable, otherwise VM Connect can't display properly with ioremap() or
> ioremap_wc().
> 
> With this change, the VRAM on new Hyper-V is as fast as regular RAM, so
> it's no longer necessary to use the hacks we added to mitigate the
> slowness, i.e. we no longer need to allocate physical memory and use
> it to back up the VRAM in Generation-1 VM, and we also no longer need to
> allocate physical memory to back up the framebuffer in a Generation-2 VM
> and copy the framebuffer to the real VRAM. A further big change will
> address these for v5.11.
> 
> Fixes: 68a2d20b79b1 ("drivers/video: add Hyper-V Synthetic Video Frame Buffer Driver")
> Tested-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Dexuan Cui <decui@microsoft.com>
> ---
> 
> Hi Wei Liu, can you please pick this up into the hyperv/linux.git tree's
> hyperv-fixes branch? I really hope this patch can be in v5.10 since it
> fixes a longstanding issue: https://github.com/LIS/lis-next/issues/655
> 
>  drivers/video/fbdev/hyperv_fb.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
> index 5bc86f481a78..c8b0ae676809 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -1093,7 +1093,12 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info
> *info)
>  		goto err1;
>  	}
> 
> -	fb_virt = ioremap(par->mem->start, screen_fb_size);
> +	/*
> +	 * Map the VRAM cacheable for performance. This is also required for
> +	 * VM Connect to display properly for ARM64 Linux VM, as the host also
> +	 * maps the VRAM cacheable.
> +	 */
> +	fb_virt = ioremap_cache(par->mem->start, screen_fb_size);
>  	if (!fb_virt)
>  		goto err2;
> 
> --
> 2.19.1

Reviewed-by: Michael Kelley <mikelley@microsoft.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
