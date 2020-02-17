Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37963161092
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 12:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FB26E91D;
	Mon, 17 Feb 2020 11:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A716E91D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 11:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUmyWZ01GBGKmN8OLQ6yL8Am6WSe8pftKBeg19A7y+U=;
 b=sC19wl0l/zf8m8IlmGr0MroXLaVCjTSz4foEGdCzykZ31wslHNLU681yDYm9OkMtJWF98scCf3QUyiWGSWVD3cIaaD4XIVMVeq1yPJon8nQDlA++4NBFXIW1UGN9Cs6P3/klzstGSHYFi+EDHvmLgkrJXg11XXwuGsyZzP9jgm4=
Received: from VI1PR08CA0220.eurprd08.prod.outlook.com (2603:10a6:802:15::29)
 by DBBPR08MB4267.eurprd08.prod.outlook.com (2603:10a6:10:cb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.24; Mon, 17 Feb
 2020 11:02:41 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::206) by VI1PR08CA0220.outlook.office365.com
 (2603:10a6:802:15::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Mon, 17 Feb 2020 11:02:39 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.18 via Frontend Transport; Mon, 17 Feb 2020 11:02:39 +0000
Received: ("Tessian outbound 1f9bda537fdc:v42");
 Mon, 17 Feb 2020 11:02:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1889b03efc910df2
X-CR-MTA-TID: 64aa7808
Received: from 1b0820487fee.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 56DBB04B-1B06-49FA-A233-028DC4390195.1; 
 Mon, 17 Feb 2020 11:02:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1b0820487fee.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Feb 2020 11:02:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrIu1V0Wj/ZfVbDj9QG8ITUvPwQupxMd800ZvIqAed65CeeGGzIp+8o2UBPueg+dhNb1xidYBXldOBUenu8jOscVy7yvyb0xkyjZJ/aVPSbGxEVltLCM+8DDX3hBlydQmxnp0KfseG4SI1eXSo0YB0bR3Ss1eqyiRG4r9fu0+yf48zfpB46w8jTZsDGjLe2KfSrVjp8rJMhhQhxImJF4VolvJ4MCntih4bFBfrSIdy8wdocaUiMmwTWIObBIUV0kdbrR8cYYkY+RDMaLoL5bybUs8Tb/2XxyuBeufjMPxGvKcJovZiFeLgp0p3Dhj2OlX7jgx1TFmOJrCMP0Zm8pjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUmyWZ01GBGKmN8OLQ6yL8Am6WSe8pftKBeg19A7y+U=;
 b=del/Y+EhvCyg3lOqqrLjUH1mNJT5CeOW/v4HOGnT13QBohJXOEfoifAmJDvbP6IyZ5H03u2WiMzOjee6kjiBpIpxDNewxERWYOWj32lleLXn7wqqsuyI+mCkTYKF9Xf9SBJhS6ac0EH69lhOh8HvRSqsCHzMyCR3nJwpEruQKZK8ggf3rS9cj66esgT22rrvtStbiqhzFHjZmKdzpDtrxeS+VZX0BEPezM42QVCwOdK0mfqRsNcBMfjuAZzz88iKg4cHs00Fv2+i57Vo2g7t7LQSSJX17lhq5gR5UPb2hdCg3lNsLNBYUzxvGuvdF06KrrKTI5jPWGHVDmg0RFvMlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUmyWZ01GBGKmN8OLQ6yL8Am6WSe8pftKBeg19A7y+U=;
 b=sC19wl0l/zf8m8IlmGr0MroXLaVCjTSz4foEGdCzykZ31wslHNLU681yDYm9OkMtJWF98scCf3QUyiWGSWVD3cIaaD4XIVMVeq1yPJon8nQDlA++4NBFXIW1UGN9Cs6P3/klzstGSHYFi+EDHvmLgkrJXg11XXwuGsyZzP9jgm4=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4798.eurprd08.prod.outlook.com (10.255.112.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 17 Feb 2020 11:02:30 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520%7]) with mapi id 15.20.2729.032; Mon, 17 Feb 2020
 11:02:30 +0000
Date: Mon, 17 Feb 2020 19:02:22 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv4,05/36] drm/gem-fb-helper: Add generic afbc size checks
Message-ID: <20200217110222.GA5929@jamwan02-TSP300>
References: <20191213155907.16581-6-andrzej.p@collabora.com>
Content-Disposition: inline
In-Reply-To: <20191213155907.16581-6-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: HK2PR02CA0193.apcprd02.prod.outlook.com
 (2603:1096:201:21::29) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
MIME-Version: 1.0
Received: from localhost (113.29.88.7) by
 HK2PR02CA0193.apcprd02.prod.outlook.com (2603:1096:201:21::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.23 via Frontend Transport; Mon, 17 Feb 2020 11:02:29 +0000
X-Originating-IP: [113.29.88.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb2ced25-4ebe-459e-f859-08d7b398e787
X-MS-TrafficTypeDiagnostic: VE1PR08MB4798:|VE1PR08MB4798:|DBBPR08MB4267:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB4267D5348101AF52FFD7D1DDB3160@DBBPR08MB4267.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-Forefront-PRVS: 0316567485
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(136003)(376002)(366004)(346002)(396003)(189003)(199004)(52116002)(6496006)(4326008)(86362001)(1076003)(8936002)(33656002)(478600001)(6666004)(2906002)(33716001)(956004)(6486002)(54906003)(26005)(6916009)(55236004)(316002)(66556008)(16526019)(81156014)(81166006)(66946007)(9686003)(8676002)(66476007)(5660300002)(186003)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4798;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: GmQWYqT6MSXMzuoYZS0/ug1bdlrBLoGmzpPEBYz0rj0oWHRt0Nej2Pu9keI0PEICzXA6HcIqVlQkztZLvfzBNrlHcbTaUzM+bTdFzzJP3GfIt4mULwUsS4atsCzBVhoSe6k0yBbqXzQmSkFPU5vlL6vJLGYRCbzrRqtHnEo3wG0ZItpXlbBonjS++X2s/km1G0MMlYZC9qPnNL6ih2cuNMLX5Ehe70uxNHEqRq0QSJ/QybFBHN0saslJByszICdWKMG5gZoOKB/ukK34T5zZg3ianTIuvQAByPM3na1wx7iYeUWocJFeWlZkqMIid9xqaOef9XE1sKzqr21stZ9VDe17zA5lZg7zw03Ru0JfSsKbuda76PyqVlgdW7PYo0WwUtw5sqnN8xG/ZofdikM9nAHKJ5nGKLv7kXozabIBhxW+jumbaCeWX/umRB/Jb/guo4dJ/EFfeIcDDkCsZTvyt/MVe0W6+l3qQAtUeCUzkRtxjBtnDfuB8lssAJtxjuOb
X-MS-Exchange-AntiSpam-MessageData: 1AfodQpIkYnzDnvvdZJg3aV+AcZZC29Q1qNwwJlnFY6cTasQ8G0N199LuAaLueV/7JCCXcWWVfyNrra8ydMiRozo1HlRd+MZoM0MU4W295zz+XOT10ClbXFFk1g9r3Gqq/ef76RYTX8IZn3FmaiFxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4798
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(136003)(39860400002)(376002)(346002)(199004)(189003)(316002)(36906005)(9686003)(54906003)(6496006)(6486002)(4326008)(26005)(336012)(956004)(6862004)(16526019)(186003)(33656002)(5660300002)(356004)(6666004)(81156014)(81166006)(70586007)(1076003)(33716001)(2906002)(70206006)(478600001)(86362001)(26826003)(8936002)(8676002)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4267;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 257281b3-077d-49ba-7714-08d7b398e1ce
X-Forefront-PRVS: 0316567485
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UgUuUMv2CjWfw/rPORT5FlLFzb/A32dCE+czr0/x819tVHDlJrHZER4nM+12V97mhOORLU/C0l0DkKVK0z3h0cWcgiHgSC8Ni7hXdWv/D557iQ+p3h6GDxdXTm4Vxuzi+E6fCXrabmAo6EE2bmMaQ+LVGODc5AWfBm5qb8KsYHXtyVuMog2QW4ooHVRkycSbpas34ocOyb/DnEwH7uyHaFP8yYUj/2NSqY0omNxRWae5Ayc4M7ufxof9gETWYingMedxbNnTMHnh3+i4qbUTAlVMSzfY3BudVecs6M9T81Wk0sqr+mKQ35o33OyqnpnArkbm6beWLYGK9qjWti6rKt4XiBZYKtDJo9Fb7GVSzPD5JhWiIOVEDm6rIAqXi8pfEYmFM7dLRo87IqpBCKpWFkeK/M2Kool9PG8utUNUG1xghveB4wEpavT0aWA2hsd5bJ2WHh5AkeiZE3SmIDc+ITPGeF96BEzY5RHzftuhytsp5i7unJCpCQoGIkwP7LpA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 11:02:39.5742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2ced25-4ebe-459e-f859-08d7b398e787
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4267
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
Cc: nd@arm.com, kernel@collabora.com,
 Mihail Atanassov <mihail.atanassov@arm.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, Ayan Halder <Ayan.Halder@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej:

On Fri, Dec 13, 2019 at 04:58:36PM +0100, Andrzej Pietrasiewicz wrote:
> Extend the size-checking special function to handle afbc.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c                 | 10 +++-
>  drivers/gpu/drm/drm_framebuffer.c            |  3 +
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 60 ++++++++++++++++++--
>  include/drm/drm_gem_framebuffer_helper.h     | 16 ++++++
>  4 files changed, 82 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index d14dd7c86020..9ac2175c5bee 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -323,8 +323,14 @@ drm_get_format_info(struct drm_device *dev,
>  {
>  	const struct drm_format_info *info = NULL;
>  
> -	if (dev->mode_config.funcs->get_format_info)
> -		info = dev->mode_config.funcs->get_format_info(mode_cmd);
> +	/* bypass driver callback if afbc */
> +	if (!drm_is_afbc(mode_cmd->modifier[0]))
> +		if (dev->mode_config.funcs->get_format_info) {
> +			const struct drm_mode_config_funcs *funcs;
> +
> +			funcs = dev->mode_config.funcs;
> +			info = funcs->get_format_info(mode_cmd);
> +		}
>  
>  	if (!info)
>  		info = drm_format_info(mode_cmd->pixel_format);
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index 57564318ceea..33b741cc73e8 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -204,6 +204,9 @@ static int framebuffer_check(struct drm_device *dev,
>  		unsigned int block_size = info->char_per_block[i];
>  		u64 min_pitch = drm_format_info_min_pitch(info, i, width);
>  
> +		if (drm_is_afbc(r->modifier[i]))
> +			block_size = 0;
> +
>  		if (!block_size && (r->modifier[i] == DRM_FORMAT_MOD_LINEAR)) {
>  			DRM_DEBUG_KMS("Format requires non-linear modifier for plane %d\n", i);
>  			return -EINVAL;
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 4201dc1f32a5..e20f4d00b0a5 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -21,6 +21,11 @@
>  #include <drm/drm_modeset_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>  
> +#define AFBC_HEADER_SIZE		16
> +#define AFBC_TH_LAYOUT_ALIGNMENT	8
> +#define AFBC_SUPERBLOCK_PIXELS		256
> +#define AFBC_SUPERBLOCK_ALIGNMENT	128
> +
>  /**
>   * DOC: overview
>   *
> @@ -200,6 +205,40 @@ int drm_gem_fb_lookup(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_lookup);
>  
> +static int drm_gem_afbc_min_size(struct drm_device *dev,
> +				 const struct drm_mode_fb_cmd2 *mode_cmd,
> +				 struct drm_afbc *afbc)
> +{
> +	u32 n_blocks;
> +
> +	if (!drm_afbc_get_superblock_wh(mode_cmd->modifier[0],
> +					&afbc->block_width,
> +					&afbc->block_height)) {
> +		return -EINVAL;
> +	}
> +
> +	/* tiled header afbc */
> +	if (mode_cmd->modifier[0] & AFBC_FORMAT_MOD_TILED) {
> +		afbc->block_width *= AFBC_TH_LAYOUT_ALIGNMENT;
> +		afbc->block_height *= AFBC_TH_LAYOUT_ALIGNMENT;
> +	}
> +
> +	afbc->aligned_width = ALIGN(mode_cmd->width, afbc->block_width);
> +	afbc->aligned_height = ALIGN(mode_cmd->height, afbc->block_height);
> +	afbc->offset = mode_cmd->offsets[0];
> +
> +	n_blocks = (afbc->aligned_width * afbc->aligned_height)
> +		 / AFBC_SUPERBLOCK_PIXELS;
> +	afbc->offset_payload = ALIGN(n_blocks * AFBC_HEADER_SIZE,
> +				     afbc->alignment_header);

After check the references in malidp, rockchip and komeda, seems this
afbc->alignment_header is dedicated for komeda only.

This is not true. Per afbc HW spec alignment is essential for
all afbc usage. according to the spec the requiremnt are:

  AFBC1.0/1.1: 64 byte alignment both for header and body buffer.
  AFBC1.2 (tiled header enabled): 4096 alignment.

So this alignement is not a vendor specific value, but afbc feature
requirement, can be determined by afbc modifier.
(malidp and komeda obeys this spec, not sure about Rockchip, but I
think it should be)

But you may see, komeda uses 1024 (not 64) for none-tiled-header afbc,
that's because GPU(MALI) changed this value to 1024 for bus
performance (sorry I don't know the detail), and komeda changed to
1024 to follow.

Back to display alignment, I think we can just follow the spec, use 64
for none-tiled-header, 4096 for tiled-header, but no need to caller to
pass a value.

> +
> +	afbc->afbc_size = afbc->offset_payload + n_blocks *
> +			  ALIGN(afbc->bpp * AFBC_SUPERBLOCK_PIXELS / 8,
> +				AFBC_SUPERBLOCK_ALIGNMENT);
> +
> +	return 0;
> +}
> +
>  /**
>   * drm_gem_fb_size_check_special() - Helper function for use in
>   *				     &drm_mode_config_funcs.fb_create
> @@ -218,6 +257,7 @@ int drm_gem_fb_size_check_special(struct drm_device *dev,
>  				  const struct drm_size_check *check,
>  				  struct drm_gem_object **objs)
>  {
> +#define CHECK_HAS(field) (check && check->field)
>  	const struct drm_format_info *info;
>  	int i;
>  
> @@ -231,24 +271,34 @@ int drm_gem_fb_size_check_special(struct drm_device *dev,
>  		unsigned int min_size;
>  		u32 pitch = mode_cmd->pitches[i];
>  
> -		if (check && check->use_pitch_multiplier)
> +		if (CHECK_HAS(use_pitch_multiplier))
>  			if ((pitch * check->pitch_multiplier[i]) %
>  			    check->pitch_modulo)
>  				return -EINVAL;
>  
> -		if (check && check->use_min_size)
> +		if (CHECK_HAS(use_min_size)) {
>  			min_size = check->min_size[i];
> -		else
> +		} else if (CHECK_HAS(data) &&
> +				drm_is_afbc(mode_cmd->modifier[0])) {
> +			struct drm_afbc *afbc;
> +			int ret;
> +
> +			afbc = check->data;
> +			ret = drm_gem_afbc_min_size(dev, mode_cmd, afbc);
> +			if (ret < 0)
> +				return ret;
> +			min_size = ret;
> +		} else {
>  			min_size = (height - 1) * pitch
>  				 + drm_format_info_min_pitch(info, i, width)
>  				 + mode_cmd->offsets[i];
> -
> +		}
>  		if (objs[i]->size < min_size)
>  			return -EINVAL;
>  	}
>  
>  	return 0;
> -
> +#undef CHECK_HAS
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_size_check_special);
>  
> diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
> index 74304a268694..3d6015194b3c 100644
> --- a/include/drm/drm_gem_framebuffer_helper.h
> +++ b/include/drm/drm_gem_framebuffer_helper.h
> @@ -22,6 +22,22 @@ struct drm_size_check {
>  	u32 pitch_multiplier[4];
>  	u32 pitch_modulo;
>  	bool use_pitch_multiplier;
> +	void *data;
> +};
> +
> +/**
> + * struct drm_afbc - AFBC-specific data.
> + */
> +struct drm_afbc {
> +	u32 block_width;
> +	u32 block_height;
> +	u32 aligned_width;
> +	u32 aligned_height;
> +	u32 offset;
> +	u32 alignment_header;
> +	u32 afbc_size;
> +	u32 offset_payload;
> +	u32 bpp;

Seems we can remove this bpp if we set the block_size (4x4) for these afbc
only formats like DRM_FORMAT_YUV420_8BIT/10BIT in drm_format_info, and then
we can calculate the bpp like the pitch calculation, then no need
caller to specify bpp anymore, and vendor specific get_bpp() likes in malidp
and komeda also can be removed.

for this change maybe we can put it into a new series.

Thanks
James

>  };
>  
>  struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
