Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3430234F5E
	for <lists+dri-devel@lfdr.de>; Sat,  1 Aug 2020 04:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C2A6EB52;
	Sat,  1 Aug 2020 02:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70276EB52
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Aug 2020 02:04:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0YGUGB97lBVHBpU4b+fueUBggzLmiV6fbamzSbiVPjZc+AeL1i2AOzcUCtnDoig9+MtTELY3iYjzhuWnTifHHJ4nXpQuCDWELseUBIpoJNcyXZVNh7DKcsVGkObHWXY7795Yg7C3MoHWpXtabYslBVNJnFu06CdBCo/5psRA4Sxvz5irsfBBDXXwAkUYgm4B1iL+J2bBYcaarzYLWmdlql4kdL7ik1akLwYPoGSYwCfSLHwuzVpKvFKZb2W/HvG5XZV82MNCKkJWhHgeKp8hpFBHNnWsBn3IcoEehbLyYJDhGYQl4Bjh6dsW3uGcVbIcqtO2TPmks9c7f4ZAM5stw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lx+GoULuWvlAXC/kBXa1l22NZHhr72ro3bKdHfgzW2M=;
 b=Dg2LGImigdvmtu0UqrMFUsRL39ycUJkVbS98T6/MNFARQG9fIOK1cG4YfX6/XrO1EkUNSGrR9Y1YuT7xKN8Dw4s7zUv+LY/gt/PUeWZaiKNI0z+BxWsbOxWgwOm787QGuqc7UMuLmiaEOI8ASvH3vaxujjFcV1QLKeCiLYsKkkosPwEFs22XlbgexeiH1fG4Tox2DldN8OCY4hsVsEK8eCcGbiICh0eEVL+xkg1XbuNjVKaEMO34FcslrIQWzn6f7pAnNSSn1d/+NH5AkWrjz4mzx+zdY14EXEiQapJKgCdAmO/ojtuwRbcu6vgGhVrj+CaLurZvhDMHdt7nNP8tAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lx+GoULuWvlAXC/kBXa1l22NZHhr72ro3bKdHfgzW2M=;
 b=OiisoJSuzK1kHjuxdCW8dLFNXFBtwcnpZgVumzdk5KA+MgMoqJC21hG0zmQPjaNIiQdTVJbbdk2qWmMGSGlaimHqW/2UAStADgg+NjCYZQU3pWJlAOAkmyV5D8ImejcGYhDA6aRq/x8NUaiCK5uRltTzsf2skHBYlk4WAWrQofg=
Received: from MN2PR20CA0062.namprd20.prod.outlook.com (2603:10b6:208:235::31)
 by BYAPR02MB4136.namprd02.prod.outlook.com (2603:10b6:a02:fb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Sat, 1 Aug
 2020 02:04:03 +0000
Received: from BL2NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:235::4) by MN2PR20CA0062.outlook.office365.com
 (2603:10b6:208:235::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Sat, 1 Aug 2020 02:04:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT003.mail.protection.outlook.com (10.152.76.204) with Microsoft SMTP
 Server id 15.20.3239.17 via Frontend Transport; Sat, 1 Aug 2020 02:04:02
 +0000
Received: from [149.199.38.66] (port=38176 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k1gqR-0004K9-Po; Fri, 31 Jul 2020 19:01:55 -0700
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k1gsT-0004Gi-UA; Fri, 31 Jul 2020 19:04:01 -0700
Received: from [172.19.2.244] (helo=xsjhyunkubuntu)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyunk@smtp.xilinx.com>)
 id 1k1gsT-0004Gb-M3; Fri, 31 Jul 2020 19:04:01 -0700
Received: by xsjhyunkubuntu (Postfix, from userid 13638)
 id A3D332C2337; Fri, 31 Jul 2020 19:00:00 -0700 (PDT)
Date: Fri, 31 Jul 2020 19:00:00 -0700
To: Hyun Kwon <hyun.kwon@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 1/1] drm: xlnx: zynqmp: Use switch - case for link
 rate downshift
Message-ID: <20200801015959.GA27681@xilinx.com>
References: <1596065445-4630-1-git-send-email-hyun.kwon@xilinx.com>
 <20200730231246.GJ6107@pendragon.ideasonboard.com>
 <20200731023301.GB20223@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731023301.GB20223@xilinx.com>
Thread-Topic: [PATCH v2 1/1] drm: xlnx: zynqmp: Use switch - case for link
 rate downshift
Thread-Index: AQHWZgBIX+AOHIRwJE6gKYBkXIY/w6kgwd4A///CmoCAAf7lEA==
Content-Language: en-US
User-Agent: Mutt/1.5.24 (2015-08-30)
From: hyun.kwon@xilinx.com (Hyun Kwon)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db2bb08a-4803-4efa-0f8f-08d835bf2978
X-MS-TrafficTypeDiagnostic: BYAPR02MB4136:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4136A7E3430BF3194E6E4790D64F0@BYAPR02MB4136.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iWQe19gMI0tY8n0HJPLseFV6JqIF1L5NnRBgGwujW2qjFSYeZT6BEJuSJwi8ssSFjzo1sQmMP4ndagNy0YC3PanLsYvhxHGimcdotCQMFrW+Xt5Fy+DjHoGsB6dd7juovnNcphlYEB63SZp1H+f4p8Tn06NQWFV7X5e72ipD2tog+SuEx0obvbCOVnd6cozWE1lVCVKtIy8LrLhAP1C8ojuSRMVkU3Wgs0tbPfo2ujHe49lMcyxrVgywXc+Y38uROz3Mdl/bADW4ndhuopl97jVYm7fJQB9ILEyMsHLNrdTBUv2qv9o8mhNMSbn5c3Njz0bVUmdzai70E60HmX6oPaZzLAXWsPHblJFc90tephf9CddkPzJbU1on/Ml1+qh95k0PT0LP5FtZOOGQpfN5rFJkUy+bo/SBhNW0Ut9dKIEbtiMstZ8uxMbKP27t5EiD
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(396003)(136003)(39860400002)(46966005)(8676002)(110136005)(83170400001)(83380400001)(70586007)(5660300002)(54906003)(53546011)(70206006)(26005)(4326008)(81166007)(356005)(82310400002)(186003)(47076004)(82740400003)(316002)(6266002)(8936002)(426003)(336012)(966005)(2906002)(9686003)(42186006)(42882007)(33656002)(36756003)(1076003)(478600001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2020 02:04:02.3645 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db2bb08a-4803-4efa-0f8f-08d835bf2978
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT003.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4136
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Hyun
> Kwon
> Sent: Thursday, July 30, 2020 7:33 PM
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>; dri-
> devel@lists.freedesktop.org; Daniel Vetter <daniel.vetter@ffwll.ch.ch>
> Subject: Re: [PATCH v2 1/1] drm: xlnx: zynqmp: Use switch - case for link rate
> downshift
> 
> Hi Laurent,
> 
> Thanks for the comment.
> 
> On Thu, Jul 30, 2020 at 04:12:46PM -0700, Laurent Pinchart wrote:
> > Hi Hyun,
> >
> > Thank you for the patch.
> >
> > On Wed, Jul 29, 2020 at 04:30:45PM -0700, Hyun Kwon wrote:
> > > Use switch - case to downshift from the current link rate. It's a small
> > > loop now, so fine to be replaced with switch - case. With a loop, it is
> > > confusing and hard to follow as reported below.
> > >
> > > The patch d76271d22694: "drm: xlnx: DRM/KMS driver for Xilinx ZynqMP
> > > DisplayPort Subsystem" from Jul 7, 2018, leads to the following
> > > static checker warning:
> > >
> > > 	drivers/gpu/drm/xlnx/zynqmp_dp.c:594 zynqmp_dp_mode_configure()
> > > 	error: iterator underflow 'bws' (-1)-2
> > >
> > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
> > > ---
> > > v2
> > > - Convert the for loop into switch - case
> > > ---
> > > ---
> > >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 29 ++++++++++++++++-------------
> > >  1 file changed, 16 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > index b735072..5d6adeaa 100644
> > > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > @@ -567,34 +567,37 @@ static int zynqmp_dp_mode_configure(struct
> zynqmp_dp *dp, int pclock,
> > >  				    u8 current_bw)
> > >  {
> > >  	int max_rate = dp->link_config.max_rate;
> > > -	u8 bws[3] = { DP_LINK_BW_1_62, DP_LINK_BW_2_7,
> DP_LINK_BW_5_4 };
> > > +	u8 bw_code;
> > >  	u8 max_lanes = dp->link_config.max_lanes;
> > >  	u8 max_link_rate_code = drm_dp_link_rate_to_bw_code(max_rate);
> > >  	u8 bpp = dp->config.bpp;
> > >  	u8 lane_cnt;
> > > -	s8 i;
> > >
> > > -	if (current_bw == DP_LINK_BW_1_62) {
> > > +	/* Downshift from current one */
> >
> > Maybe "Downshift from the current bandwidth" ?
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> 
> I agree. I'll fix and add the tag.
> 

Applied to drm-misc-next-fixes.

Thanks,
-hyun

> Thanks!
> 
> -hyun
> 
> > > +	switch (current_bw) {
> > > +	case DP_LINK_BW_5_4:
> > > +		bw_code = DP_LINK_BW_2_7;
> > > +		break;
> > > +	case DP_LINK_BW_2_7:
> > > +		bw_code = DP_LINK_BW_1_62;
> > > +		break;
> > > +	case DP_LINK_BW_1_62:
> > >  		dev_err(dp->dev, "can't downshift. already lowest link rate\n");
> > >  		return -EINVAL;
> > > -	}
> > > -
> > > -	for (i = ARRAY_SIZE(bws) - 1; i >= 0; i--) {
> > > -		if (current_bw && bws[i] >= current_bw)
> > > -			continue;
> > > -
> > > -		if (bws[i] <= max_link_rate_code)
> > > -			break;
> > > +	default:
> > > +		/* If not given, start with max supported */
> > > +		bw_code = max_link_rate_code;
> > > +		break;
> > >  	}
> > >
> > >  	for (lane_cnt = 1; lane_cnt <= max_lanes; lane_cnt <<= 1) {
> > >  		int bw;
> > >  		u32 rate;
> > >
> > > -		bw = drm_dp_bw_code_to_link_rate(bws[i]);
> > > +		bw = drm_dp_bw_code_to_link_rate(bw_code);
> > >  		rate = zynqmp_dp_max_rate(bw, lane_cnt, bpp);
> > >  		if (pclock <= rate) {
> > > -			dp->mode.bw_code = bws[i];
> > > +			dp->mode.bw_code = bw_code;
> > >  			dp->mode.lane_cnt = lane_cnt;
> > >  			dp->mode.pclock = pclock;
> > >  			return dp->mode.bw_code;
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
