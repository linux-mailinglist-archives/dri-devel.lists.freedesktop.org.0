Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA211233D37
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 04:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D35B6E990;
	Fri, 31 Jul 2020 02:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760047.outbound.protection.outlook.com [40.107.76.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD9A6E990
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 02:37:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDTe+9cR8QBDa+Kr+/ntvxZCAs40rggrIflHGbi+nU3cBuo1DlvvMpHzCbUK11HAKd+hn+ziVdrnH76GWyG370bL/iJLK3qW1hCWnr5RHMnpPIMkcTeCcXJRgS0s0rWn+MRdJ2bWWftRuoqz6yCCarEmaXX9gC0hi+N48Ccgd3lTlA1nc9WJPPbq5QhYjDK3LsmwHxJgpoS337kYNa1E/j4RRhLfX3nIy2nNw28Agw6cxt2WUBYZkGxyo1EVejiZ08DC52UJIc/evdEmJgVzNcvXx4jm6S7VaJE+kQFVVxluLpAQ6XbkTnGU+U3ka1VE7mHQ3Kfi42IjkA+Jz2ACsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adJEZZwAjEQ2T9Q7Y0lNZIKAcbfS15ON50MbLhJPHr8=;
 b=CjLu2+uvjiGuBe6w0RZ2t5brl5NC+Yrto08/phY/RhJoMjmtNahY3ZjsnKQt7B8tZS7mvMVLWjfVa7b73H4iRF4tF81HgKXJbUF6FV8Hh0tSoVda2U5iobA/f+4xjD9yzR+2zZIYBOg4yxYDD5YuKLNKxsO7SJggfwbYRlwaEj/AxX5MkLBAcGoloTsemItfQ9elq/r/II7mGFmgb2ern7npgcTMRSzu6nLPFrWuPpWZq13MlBeLKP59yyPi48RruPl9eyq1WMHhpht4Hcxze0P/kQD9BWt4ovZnsrBsdL7S5UG5dHnldtQMd2qclzGCA8gwYXR5X3FbpKhkS4Yg1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=oracle.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adJEZZwAjEQ2T9Q7Y0lNZIKAcbfS15ON50MbLhJPHr8=;
 b=lZ4vk7KT2634qMtj7/W9x7tARm74IAlpA4UgOUPT/Kek+nTkaIgglW89J5LDu47mBKdZOlb+GcvDjKxyXwHPX3EoAGqsziFmXUk5fWyQSnYaWb1c1gV1NAb/0RKG5VBsGlvsz8aXNxwBG9bdItmVTGcgnR8Nyz70jkbyAfZHFFw=
Received: from SA9PR10CA0004.namprd10.prod.outlook.com (2603:10b6:806:a7::9)
 by BY5PR02MB6520.namprd02.prod.outlook.com (2603:10b6:a03:1d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 31 Jul
 2020 02:37:09 +0000
Received: from SN1NAM02FT047.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:a7:cafe::ea) by SA9PR10CA0004.outlook.office365.com
 (2603:10b6:806:a7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Fri, 31 Jul 2020 02:37:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT047.mail.protection.outlook.com (10.152.72.201) with Microsoft SMTP
 Server id 15.20.3239.17 via Frontend Transport; Fri, 31 Jul 2020 02:37:09
 +0000
Received: from [149.199.38.66] (port=58762 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k1Ksy-0006t4-41; Thu, 30 Jul 2020 19:35:04 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k1Kuy-00048y-Sv; Thu, 30 Jul 2020 19:37:08 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 06V2awfl031267; 
 Thu, 30 Jul 2020 19:36:58 -0700
Received: from [172.19.2.244] (helo=xsjhyunkubuntu)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1k1Kuo-00044M-Ej; Thu, 30 Jul 2020 19:36:58 -0700
Received: by xsjhyunkubuntu (Postfix, from userid 13638)
 id 8C01E2C240F; Thu, 30 Jul 2020 19:33:01 -0700 (PDT)
Date: Thu, 30 Jul 2020 19:33:01 -0700
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/1] drm: xlnx: zynqmp: Use switch - case for link
 rate downshift
Message-ID: <20200731023301.GB20223@xilinx.com>
References: <1596065445-4630-1-git-send-email-hyun.kwon@xilinx.com>
 <20200730231246.GJ6107@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730231246.GJ6107@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e469c8db-fe14-4663-08ce-08d834fa9f3d
X-MS-TrafficTypeDiagnostic: BY5PR02MB6520:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6520073F3B1D883144742834D64E0@BY5PR02MB6520.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1xzffss6NkOXJNnBWi4/Wl1kSVjlBwFusJZFgJwZuH0IJrUTSW2v5fkwTvXM29EGaKedJf5tix7GXi68bK6EkyGbvazUZ2PaQTrXtLcfZVSid7wNzZljVeIZ1HJ6tWZ46DlzgiohFrnpg8lvEah5Glw+zpGHv147x5gVg6f1vbxDvQ9xUMvL7tXR5JTiUDyaeMls4oQngpkrGDeuLpER9BJG9ChbzeSopk6rJ91S314V7tgq/na+rkL3MJL9Ao9ND4t7zBWEqIH8egXq/+rNI/XI/Kwuk8Zvohq/OmhacJjJqhgVtFxdgw/mFI4dW7jrI+TEDszDFW0Bn0i2qiPTaZgLk7XQvF2gUxL3VVE0KcT1nXcKA4b9KhphNRXb6qgFGZzl5rSO9RUp7k6bnzkKBw==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(396003)(376002)(346002)(136003)(46966005)(81166007)(426003)(83380400001)(336012)(36756003)(82310400002)(356005)(2616005)(316002)(82740400003)(44832011)(186003)(47076004)(2906002)(26005)(54906003)(6916009)(42186006)(478600001)(8936002)(5660300002)(4326008)(6266002)(33656002)(8676002)(70586007)(70206006)(1076003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 02:37:09.0910 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e469c8db-fe14-4663-08ce-08d834fa9f3d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT047.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6520
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for the comment.

On Thu, Jul 30, 2020 at 04:12:46PM -0700, Laurent Pinchart wrote:
> Hi Hyun,
> 
> Thank you for the patch.
> 
> On Wed, Jul 29, 2020 at 04:30:45PM -0700, Hyun Kwon wrote:
> > Use switch - case to downshift from the current link rate. It's a small
> > loop now, so fine to be replaced with switch - case. With a loop, it is
> > confusing and hard to follow as reported below.
> > 
> > The patch d76271d22694: "drm: xlnx: DRM/KMS driver for Xilinx ZynqMP
> > DisplayPort Subsystem" from Jul 7, 2018, leads to the following
> > static checker warning:
> > 
> > 	drivers/gpu/drm/xlnx/zynqmp_dp.c:594 zynqmp_dp_mode_configure()
> > 	error: iterator underflow 'bws' (-1)-2
> > 
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
> > ---
> > v2
> > - Convert the for loop into switch - case
> > ---
> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 29 ++++++++++++++++-------------
> >  1 file changed, 16 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > index b735072..5d6adeaa 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > @@ -567,34 +567,37 @@ static int zynqmp_dp_mode_configure(struct zynqmp_dp *dp, int pclock,
> >  				    u8 current_bw)
> >  {
> >  	int max_rate = dp->link_config.max_rate;
> > -	u8 bws[3] = { DP_LINK_BW_1_62, DP_LINK_BW_2_7, DP_LINK_BW_5_4 };
> > +	u8 bw_code;
> >  	u8 max_lanes = dp->link_config.max_lanes;
> >  	u8 max_link_rate_code = drm_dp_link_rate_to_bw_code(max_rate);
> >  	u8 bpp = dp->config.bpp;
> >  	u8 lane_cnt;
> > -	s8 i;
> >  
> > -	if (current_bw == DP_LINK_BW_1_62) {
> > +	/* Downshift from current one */
> 
> Maybe "Downshift from the current bandwidth" ?
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

I agree. I'll fix and add the tag.

Thanks!

-hyun

> > +	switch (current_bw) {
> > +	case DP_LINK_BW_5_4:
> > +		bw_code = DP_LINK_BW_2_7;
> > +		break;
> > +	case DP_LINK_BW_2_7:
> > +		bw_code = DP_LINK_BW_1_62;
> > +		break;
> > +	case DP_LINK_BW_1_62:
> >  		dev_err(dp->dev, "can't downshift. already lowest link rate\n");
> >  		return -EINVAL;
> > -	}
> > -
> > -	for (i = ARRAY_SIZE(bws) - 1; i >= 0; i--) {
> > -		if (current_bw && bws[i] >= current_bw)
> > -			continue;
> > -
> > -		if (bws[i] <= max_link_rate_code)
> > -			break;
> > +	default:
> > +		/* If not given, start with max supported */
> > +		bw_code = max_link_rate_code;
> > +		break;
> >  	}
> >  
> >  	for (lane_cnt = 1; lane_cnt <= max_lanes; lane_cnt <<= 1) {
> >  		int bw;
> >  		u32 rate;
> >  
> > -		bw = drm_dp_bw_code_to_link_rate(bws[i]);
> > +		bw = drm_dp_bw_code_to_link_rate(bw_code);
> >  		rate = zynqmp_dp_max_rate(bw, lane_cnt, bpp);
> >  		if (pclock <= rate) {
> > -			dp->mode.bw_code = bws[i];
> > +			dp->mode.bw_code = bw_code;
> >  			dp->mode.lane_cnt = lane_cnt;
> >  			dp->mode.pclock = pclock;
> >  			return dp->mode.bw_code;
> 
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
