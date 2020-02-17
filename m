Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA88160A1E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 06:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8FC6E4CA;
	Mon, 17 Feb 2020 05:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2089.outbound.protection.outlook.com [40.107.20.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0656E4CA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 05:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uL0p2XMbGtj/uX0sKSZ8G5LJnJmulzJJiQz3YMcQkv4=;
 b=P6+w99S8yj/pNGSO4lpeirw+Mv6VVM0DTj2pZt6WhuEWXddgEsCaxYLT37OMsUX2t2KGwPtGCO7YpMTtc1gbaYMwTSy/JCpGABepdLk58RLhPmF6fs4xf+YrYkQh7p92N26Q1PFy4DVT5P59xhws14Q72XS79+Lxz12XpU8J8po=
Received: from VI1PR0802CA0023.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::33) by VI1PR08MB4205.eurprd08.prod.outlook.com
 (2603:10a6:803:e1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25; Mon, 17 Feb
 2020 05:50:18 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by VI1PR0802CA0023.outlook.office365.com
 (2603:10a6:800:aa::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.24 via Frontend
 Transport; Mon, 17 Feb 2020 05:50:18 +0000
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
 15.20.2665.18 via Frontend Transport; Mon, 17 Feb 2020 05:50:17 +0000
Received: ("Tessian outbound 62d9cfe08e54:v42");
 Mon, 17 Feb 2020 05:50:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e7e15395a18024f4
X-CR-MTA-TID: 64aa7808
Received: from 7d03344a736f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2D820791-0936-4078-9458-510FEA192130.1; 
 Mon, 17 Feb 2020 05:50:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7d03344a736f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Feb 2020 05:50:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ogf1EQ7b6O+ScDPwT7YpwY97dLYyui4PwQfpHkftvE8nfRbrvc6womUe1AZW2Twu7MaTUM1jWpsR5ZQ3uS2NHU9cBKAQv3080elUG0u1ZCy++1c4+9FkwgCWMuvBRVdWg9B14H7kJTuDC0C3W7CD+n+AJ8nrrw/w+fvCYoLzewjUgofdulYPH8aKicYpS7CYyg6GJJehCTTcXqSt6HzzbNzBwHaG4CnZLI5l8HNvXJWbF2iVP7omdMShcbfo5mO77rlk0jI6p3nxgQneZHn62JCSaRrnnkAA7VLsTjy/XcIxnSnN8tfLG0pJppW5HcMPwggSH6LVCtGaru+bnmLvIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uL0p2XMbGtj/uX0sKSZ8G5LJnJmulzJJiQz3YMcQkv4=;
 b=bev/oKjGFK63Ggm/y5KMuciKiMrfXFpvD6wvnmdwOAlYH7qU3upgAU/ri2LyDUBN7vilAKg9kiyN7wSkp/h8N1iDquJGXeTssnxG3p/dkOOVPZyKdPxLx5pZcHkiCMItR7x7eZUu6ASnYUm//QQRPcI1SPt6tmYJHI9eJLq+3Oy5TmfoTUN/JYOl9kXlXokvPre58nEnPGw0NJVqsQj3yWHITOOEWIsUC35lHGN0L/vrIJqL/LgjupSOMdB5gRI0ZoaCeO+Dh6aSr5EEa3R7Fa9r2SU9ghQJOiCf8xB7MdBHDdTILNgwM+HbCbzrnc9QyaaW94iFQ6z8N0ZKISkgeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uL0p2XMbGtj/uX0sKSZ8G5LJnJmulzJJiQz3YMcQkv4=;
 b=P6+w99S8yj/pNGSO4lpeirw+Mv6VVM0DTj2pZt6WhuEWXddgEsCaxYLT37OMsUX2t2KGwPtGCO7YpMTtc1gbaYMwTSy/JCpGABepdLk58RLhPmF6fs4xf+YrYkQh7p92N26Q1PFy4DVT5P59xhws14Q72XS79+Lxz12XpU8J8po=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4862.eurprd08.prod.outlook.com (10.255.113.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.24; Mon, 17 Feb 2020 05:50:10 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520%7]) with mapi id 15.20.2729.031; Mon, 17 Feb 2020
 05:50:10 +0000
Date: Mon, 17 Feb 2020 13:50:02 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv4,01/36] drm/framebuffer: Add optional modifier info
Message-ID: <20200217055002.GA4231@jamwan02-TSP300>
References: <20191213155907.16581-2-andrzej.p@collabora.com>
Content-Disposition: inline
In-Reply-To: <20191213155907.16581-2-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: HK0PR01CA0056.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::20) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
MIME-Version: 1.0
Received: from localhost (113.29.88.7) by
 HK0PR01CA0056.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Mon, 17 Feb 2020 05:50:09 +0000
X-Originating-IP: [113.29.88.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 76070052-8d3c-4af9-92b5-08d7b36d449f
X-MS-TrafficTypeDiagnostic: VE1PR08MB4862:|VE1PR08MB4862:|VI1PR08MB4205:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB42058C59A8CC9CE7280DFBA7B3160@VI1PR08MB4205.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-Forefront-PRVS: 0316567485
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(39850400004)(366004)(346002)(136003)(396003)(199004)(189003)(66946007)(66556008)(5660300002)(66476007)(54906003)(6486002)(316002)(9686003)(86362001)(6496006)(52116002)(4326008)(478600001)(6666004)(6916009)(8936002)(26005)(186003)(81166006)(16526019)(1076003)(2906002)(33656002)(956004)(55236004)(81156014)(33716001)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4862;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2pTzaldip21BvRYqQNR7SyTptAEKGpdt9p4Bx2U/mbdtiz4Vp8Ero6dmUBRtHumul6sEMFYecyoFqjOJDJphVTVbYqPwvkmIVMSNLUrFYF/jldlE2gjszy5MbNA42fqFLvLwqUiaXtOeG/NzlZrl9kSpRVKOxZt99yWtA01aHCWX269zMBMAMjX8pniSr9d56/yj7mleoTC3nTvJfbC6H3scavBVSpeXmSHJiE7dj9H0hLpAZZibBuJVBEjOKURykmYZKkUv5GZYrInkC6o2R3Sc00Pd8qOxPCx1WN8+Um390B7IsYU8mEpb7U1nR6Q+FTVdDHaT/UceCeu2q1K6uUCQGaXOQ5KPngDe1Zqcg3e5XDwosEYkXzQ8Jjveeg6smMy6zY6bi8z9pr10Obd+s6a6xbhIsxfrSEMW59YqQCLyehd4QwtKY4nVe/G7nJZ9
X-MS-Exchange-AntiSpam-MessageData: B5rxm+4/9B9yM6yiEHH6ysCu0dR5c/PgEnAF1BIYyCpaNR8TYebgA/+6OxchGqM6WSKH8sKFjOsDb2Bp1r6+hRpSUs1W/JiLEWwpmUAdkgg4e42N7Df4EwuxH2hnaZVduHSb/7lw0wlczn7vZ5Mbjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4862
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(39850400004)(376002)(136003)(346002)(189003)(199004)(26005)(336012)(186003)(956004)(9686003)(16526019)(6486002)(6496006)(26826003)(36906005)(54906003)(316002)(478600001)(5660300002)(81166006)(8936002)(356004)(6666004)(4326008)(81156014)(70586007)(33716001)(70206006)(2906002)(86362001)(6862004)(33656002)(1076003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4205;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: aabfa9a1-ef6f-48d2-9ba5-08d7b36d3fe3
X-Forefront-PRVS: 0316567485
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GGpSepOfefJdT8CGmp2Hh8iDe0EBOn1TjWBoglFp/u5Jx1xhqHBzWKZU/TO7SlGHuTfUaGdpqtbscGdNOgiQasFU7Y3U1vAcP+P1s/3fBp+hVdMMJG/+dn1wUureq+o9PiFJ1dFRLp9eD5Fr4/ehg6+wYFk3jzczj1rUskGiz9raLz6+1cXbuulwfGRjbk02xi6IxKTWXlG45LDHMfLNUvEcGKmW4OMDak52IWJI8EWUUfAQt35CA4jpLjdpn0kaPjbZqAUaq2RMnm93/rQpD29+Lp3IbVn41drL178MsWFVLfaXXOoLANXak+0X7nQlYptpVGZ8a5GRpNFcAEzGNu8XoWNDRoflnPC8Qq4u1SvkKylOrcDDFPNE/XPFkieTwuh/8SmJYzjayHK+qDce9yFz66vvkMbPBuuIQ63EcNfv8HMglNfDXnd2DvXt6p7L
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 05:50:17.9249 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76070052-8d3c-4af9-92b5-08d7b36d449f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4205
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

Sorry for late due to the outbreak of coronavirus in china.

Reviewed-by: James Qian Wang <james.qian.wang@arm.com>

James.

On Fri, Dec 13, 2019 at 04:58:32PM +0100, Andrzej Pietrasiewicz wrote:
> modifier_info is a pointer to an optional modifier-related information.
> Managing the memory needed for that information is the responsibility
> of drivers.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  include/drm/drm_framebuffer.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
> index c0e0256e3e98..2b3341b526d7 100644
> --- a/include/drm/drm_framebuffer.h
> +++ b/include/drm/drm_framebuffer.h
> @@ -29,6 +29,7 @@
>  
>  #include <drm/drm_mode_object.h>
>  
> +struct drm_afbc;
>  struct drm_clip_rect;
>  struct drm_device;
>  struct drm_file;
> @@ -139,6 +140,21 @@ struct drm_framebuffer {
>  	 * @format: framebuffer format information
>  	 */
>  	const struct drm_format_info *format;
> +
> +	union {
> +		/**
> +		 * @modifier_info: pointer to an optional modifier-related
> +		 * information. Managing the memory holding that information
> +		 * is driver's responsibility.
> +		 */
> +		void *modifier_info;
> +
> +		/**
> +		 * @afbc_info: afbc-specific pointer
> +		 */
> +		struct drm_afbc *afbc_info;
> +	};
> +
>  	/**
>  	 * @funcs: framebuffer vfunc table
>  	 */
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
