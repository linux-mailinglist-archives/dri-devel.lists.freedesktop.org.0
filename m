Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD342889B6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 15:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AD96ECDE;
	Fri,  9 Oct 2020 13:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70041.outbound.protection.outlook.com [40.107.7.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4F36ECDE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 13:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUu93/uCR466utgl9tSNohORPMPrzZKhJRcI9Njha7c=;
 b=ufxQgr5wiZbilq2rCMD7/dnEfLE/KEq7cMedbzqbk+e3kPIdP6gWIZjNGLyWvbrVKoQOkIkQnTEvUQeQycMq3X1TrOSxSPTImbMG1w6gwoiCY1pYwxfO0cZERLbadJQsgOwOqNsJdE0yPJ3o8CvB5y3VDme+yleFeJpdod/lC/w=
Received: from DB6P192CA0018.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::28) by
 VI1PR08MB3534.eurprd08.prod.outlook.com (2603:10a6:803:85::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.36; Fri, 9 Oct 2020 13:26:25 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::8c) by DB6P192CA0018.outlook.office365.com
 (2603:10a6:4:b8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Fri, 9 Oct 2020 13:26:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Fri, 9 Oct 2020 13:26:25 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64");
 Fri, 09 Oct 2020 13:26:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 80b13548913b6cf5
X-CR-MTA-TID: 64aa7808
Received: from 8626556837a8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A931C3BA-84A9-4484-86EC-51EAED56A753.1; 
 Fri, 09 Oct 2020 13:26:20 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8626556837a8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Oct 2020 13:26:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRYHMuFQb19YqJvmvjvQ762xtvD5R0OSSAX/PL9ryvZRVUgUN625FsTSrmiHBNUZEZR3SW087kFlW9RCUO8RX7qbh6K629BUS9SHSz9aISYin52cJWy2DZhEnk6VCIYqn5hvVa+UqKJBEgjg9wW7F8HVBybQVRIj06Saiy/XjSLXtzX2mcrrnH50Bw3Ub4vXsm4kxpUAOGWTJ5xRQoCH9njy3WbsF1z9HvDXQundi+r7lNYWWlnivPFDWvgKaI+x2qgJCkGDEVTpJHmygybvaf0YINzLQw+lA4J7cANi4WE6wTKVh2TJF305tOx3Qc0aJmCZ/ZzylllYzqbRqf8D3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUu93/uCR466utgl9tSNohORPMPrzZKhJRcI9Njha7c=;
 b=Bm0Gor9R5UiOIMW69LX3z4Mnsx456pGwr6TY2QVbyMgy4p/IcPdjspb87lDmplrzjKErYqGaNhLVMXiMLwSwmf43OwgJLx7lWcwN3J3hqL4gqbWWgGIjBfWKW8uiXMeSB9y4buGw/eSXtQIz/80lsPwwim7BQQJmlLMm8wJByBfse/JyJj2vl7ppwokOAo30qmdkJY/7eBC+O4BJFhMzulY0tvDSzxyE5MpE/Vnu4HjTKPCMwhVzTtGDBT1864EDXmMteVB9bUVHXWpq++KlGS+JiVwo1YMHGZ+HE4ML9IhKXnNbdT/Opba5FqSPQ4IcTTE7VgtwLhVkAqtJgP9zxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUu93/uCR466utgl9tSNohORPMPrzZKhJRcI9Njha7c=;
 b=ufxQgr5wiZbilq2rCMD7/dnEfLE/KEq7cMedbzqbk+e3kPIdP6gWIZjNGLyWvbrVKoQOkIkQnTEvUQeQycMq3X1TrOSxSPTImbMG1w6gwoiCY1pYwxfO0cZERLbadJQsgOwOqNsJdE0yPJ3o8CvB5y3VDme+yleFeJpdod/lC/w=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR08MB2892.eurprd08.prod.outlook.com (2603:10a6:7:30::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.26; Fri, 9 Oct 2020 13:26:16 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::5034:ca82:7e1:7e6f]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::5034:ca82:7e1:7e6f%7]) with mapi id 15.20.3433.044; Fri, 9 Oct 2020
 13:26:16 +0000
Date: Fri, 9 Oct 2020 14:26:13 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Matteo Franchin <Matteo.Franchin@arm.com>
Subject: Re: [PATCH v2] drm/fourcc: Add AXBXGXRX106106106106 format
Message-ID: <20201009132613.3zvbn76guoxvahdw@DESKTOP-E1NTVVP.localdomain>
References: <20201008143350.5306-1-matteo.franchin@arm.com>
Content-Disposition: inline
In-Reply-To: <20201008143350.5306-1-matteo.franchin@arm.com>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0330.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::30) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LO2P265CA0330.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Fri, 9 Oct 2020 13:26:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4479e5b9-caa8-4fe2-7a23-08d86c56ec2c
X-MS-TrafficTypeDiagnostic: HE1PR08MB2892:|VI1PR08MB3534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3534793737C6A181E1A78361F0080@VI1PR08MB3534.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JQ9aE3uLt7oSpqxKizl1EVd8d3Ge3AjJa2JtmdcuhCzvsVXxZUKlJIOHoIcUYHFkTkXXRhiZjVFwr9xRgj+gh14r9hLSZUNcYV9jR+FUIKoNCK7Hd9KJNdmILVnF7fllkPqFDJQYhOO7YakmVgqgvJvknE7RM4XFeZ4O0sYC6+CevHdiTWjZojXK8+8son4gS/F2ykJs7O8yDEsai7F0s6lOzLzGvoIv+BLsmiyK2n+9ZxfZjLl3zO9NrAGcR68LiAWD+HdZBGNLAZiX72yFZpGunnVXVpd1aQblz0/ckRmBhzwHDnzOOOCMuILFY2trYEvr5XFcAic3r5lGQ4EcAg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39850400004)(478600001)(956004)(2906002)(66946007)(44832011)(8676002)(7696005)(8936002)(54906003)(5660300002)(316002)(6862004)(4326008)(1076003)(52116002)(16526019)(9686003)(6506007)(66556008)(66476007)(186003)(86362001)(55016002)(26005)(6636002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: aFfLGuHmA4FTngVipGfqZVDCuGoJ5plrFKJnsM66Xi+/CpgokMiATMScE/GJDepb2D7B+OaxAuC1QFyQG4HXtRziqmLATLeLtyGZmU6nO/XEBHCve+81BtygEcWgM4Us3I3wesekJo1ZXlQ/t8O+JF+Mf/qPpO3uXCBYl5tiXzjeQjMG93THfaUXciKb5Eiwe7P0cyQNtaMlduZaxfoihzY7iIZurwbNFDX6VqBZPxIjt1qv4SJitg5KbGULITJQuIlvOmzdFA3XJsjgc6BknGoL55DNLh+xmP2Ux8EikkgnerS0vzomz/p/Juhv+v7OvpiS7rOSEmYPNU1dI76bQBG6tvqqpafu62znLcBikFaA+izDlhqwMV/340Q1WztL+OwQCoj0UyKfcaj6ToKwrU/ZNJv5U6idduEaoB+1Wrgg2u4YWn4iZD8HpMHo5JCUDE5m2XgwRwKUATFGqr+mX+67h106kIeVSn74TcWlAMrJCYfNijVfCRRacwt764lNNnQZKia8EziogWX5O4s9imPJrszxJjZyc+bmlX3s9MVDWvgdVjqmkPjFricnMlUEA6sIg7O4C8bJH/y0ujg+119REEi89mdJ/WWtfNy6HgqZ6E2XGqrx5zf80IfAZCtiNz2qFwHht7lupaLCke3rVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2892
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: b12c55ea-b549-43d8-419f-08d86c56e5e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K2zBd5QaWYpKa6RNbB4jtRYlCoCiBvlHJ0Eai/oVuLxgeunypKCf4Oj+5XM4e/2i9FiFEcJKzmEhm8X7zZMSPVa1RqJmzj7x3UAFWEEk5etmxZPOP5tRqeYAupYlp5inr7HO76bdML+7sxmOtZcpLA2O7Qbp0vJsjvrjdrwe4abxIJfAPBSSy61bEPEXlRSGdGPDBHFrNp6sugwuVsR0s1VN+yqPUe5Z+74aaOb64UPjdDYBYhmkpu65s9A3NLpKyUUQ3dFrXlDeOTnnSbh4rBgOmt/me1NMfcW6yyDDq0hz61lNKOQvnbHBlrQvzonoqCfCZKu/NN+3dXKN8zQ8X5GjIwRZzQ9Tzaq+Bc8ch62Q0MBfXFz1L3NME9OHwB293x5EeV4SAGWWQSC7/0pfFQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(396003)(136003)(346002)(46966005)(70206006)(70586007)(316002)(55016002)(9686003)(47076004)(356005)(6862004)(4326008)(7696005)(44832011)(82310400003)(82740400003)(6506007)(6636002)(8936002)(1076003)(956004)(336012)(186003)(54906003)(86362001)(16526019)(26005)(2906002)(81166007)(5660300002)(478600001)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2020 13:26:25.8180 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4479e5b9-caa8-4fe2-7a23-08d86c56ec2c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3534
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, joe@perches.com, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matteo, +Joe to Cc

On Thu, Oct 08, 2020 at 03:33:50PM +0100, Matteo Franchin wrote:
> Add ABGR format with 10-bit components packed in 64-bit per pixel.
> This format can be used to handle
> VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16 on little-endian
> architectures.
> 
> Signed-off-by: Matteo Franchin <matteo.franchin@arm.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 1 +
>  include/uapi/drm/drm_fourcc.h | 6 ++++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 722c7ebe4e88..03262472059c 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -202,6 +202,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_XBGR16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1 },
>  		{ .format = DRM_FORMAT_ARGB16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>  		{ .format = DRM_FORMAT_ABGR16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> +		{ .format = DRM_FORMAT_AXBXGXRX106106106106, .depth = 0, .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },

I'm OK with it formatted like this tbh. The YUV formats at the bottom
already mess up the formatting of the table as a whole.

If Joe feels strongly about having it split, I don't think that should
hurt grep-ability much for the common cases (grep for format name, or
grep for format parameters). So either way you can add:

Reviewed-by: Brian Starkey <brian.starkey@arm.com>

Thanks!
-Brian

>  		{ .format = DRM_FORMAT_RGB888_A8,	.depth = 32, .num_planes = 2, .cpp = { 3, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>  		{ .format = DRM_FORMAT_BGR888_A8,	.depth = 32, .num_planes = 2, .cpp = { 3, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>  		{ .format = DRM_FORMAT_XRGB8888_A8,	.depth = 32, .num_planes = 2, .cpp = { 4, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 82f327801267..9374d9558493 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -155,6 +155,12 @@ extern "C" {
>  #define DRM_FORMAT_ARGB16161616F fourcc_code('A', 'R', '4', 'H') /* [63:0] A:R:G:B 16:16:16:16 little endian */
>  #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0] A:B:G:R 16:16:16:16 little endian */
>  
> +/*
> + * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
> + * of unused padding per component:
> + */
> +#define DRM_FORMAT_AXBXGXRX106106106106 fourcc_code('A', 'B', '1', '0') /* [63:0] A:x:B:x:G:x:R:x 10:6:10:6:10:6:10:6 little endian */
> +
>  /* packed YCbCr */
>  #define DRM_FORMAT_YUYV		fourcc_code('Y', 'U', 'Y', 'V') /* [31:0] Cr0:Y1:Cb0:Y0 8:8:8:8 little endian */
>  #define DRM_FORMAT_YVYU		fourcc_code('Y', 'V', 'Y', 'U') /* [31:0] Cb0:Y1:Cr0:Y0 8:8:8:8 little endian */
> -- 
> 2.17.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
