Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E4F2C1F8C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1588C6E243;
	Tue, 24 Nov 2020 08:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5522A6E1B3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 02:42:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEfKb08e/8bVwljDu5/0Nq/3ypiQTH73SZ+daci9LQPMdWW2eZgjGGqdsPoiQBlJVHeABef4JrosX7L5lZXFLvjOpiDDpd0reKM417znb5h1Pz9WT95pz5ykntG93IIR3UBSzj2AM7Q7Vb0wC9QLGhVrQhIczuJcaayGyjpYI1XRMWuyuFaunczQyUHrdl25GbMK6ABA8Nd3dMR6t6t81khZ4AfWn9k0TxQZpVdabIpQF0OpWuYujRpDTHPbKJ4Y74Xo95L0WLIiQUSMY+Dy9EyfkUE437BIxiKYypObA1/TUCGboTV/ZSgiHLGSuteQAC6P11/S8ULvbSTdxOUZFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paxo4Wb1968wblo+aM0o6rgkxSbMJwRZmyOmLiWu5fk=;
 b=KrNLbpETYcUStmak98d1OttQgzM12QpD2UwXJGvnL+/rGMPJ3cdsSjqrL620wsoOCEXZ+zIhfaob/OZpEcY6F+7oVX0y4sT6VHsy2nsA0Nl5Wjr7Pqxz57Ny/su3QFboWlX7LXT9vDeCHjrlWUGy4AusRzNfsJIcLFB0bcdvlCPHyqf0z3hzLNKEVxhqVhDcgROu/0d1wj1rGZ19pqUlvMu8VNuDqRd1dcbR7z8gKtHLORCt7GgW+m52xj0uFG2WCcjFv4hnaksfk0qHXsLaC4qXr3r/OMZPLChbJiBzELuIRSDyNOUr0JmhJqI+GgWy+OPZOLpU0R6pAsIIhGK9oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paxo4Wb1968wblo+aM0o6rgkxSbMJwRZmyOmLiWu5fk=;
 b=K7EtyNS2U/rBCCR8WJ8l7iNmiQQcsI7FNhOgs1HV0IlTUlfa9srhfgypjCKpFc+BI3clspQ6J42xo+Gwl/HOYKNfQq/PbXG8KD+r1PWNSHzDbZ2qXF+VxXUd7vhgfeZ5YZkluifIFKg7I4IwWOyrM3HDElzB6UKY6dbPpBeLlEI=
Received: from SN4PR0201CA0071.namprd02.prod.outlook.com
 (2603:10b6:803:20::33) by MN2PR02MB5997.namprd02.prod.outlook.com
 (2603:10b6:208:117::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Tue, 24 Nov
 2020 02:42:24 +0000
Received: from SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:20:cafe::ac) by SN4PR0201CA0071.outlook.office365.com
 (2603:10b6:803:20::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Tue, 24 Nov 2020 02:42:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT063.mail.protection.outlook.com (10.152.72.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 02:42:22 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 23 Nov 2020 18:42:21 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 23 Nov 2020 18:42:21 -0800
Envelope-to: arnd@arndb.de, robh+dt@kernel.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, hdanton@sina.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Received: from [172.19.2.167] (port=44350 helo=xsjjliang50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <"jliang@wendy.liang"@xilinx.com>)
 id 1khOHd-00024g-E2; Mon, 23 Nov 2020 18:42:21 -0800
Received: by xsjjliang50.xilinx.com (Postfix, from userid 13219)
 id 92A201C042F; Thu, 19 Nov 2020 13:46:54 -0800 (PST)
Date: Thu, 19 Nov 2020 13:46:54 -0800
From: Wendy Liang <wendy.liang@xilinx.com>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: [PATCH v2 9/9] misc: xilinx-ai-engine: Add support for servicing
 error interrupts
Message-ID: <20201119214653.GA28237@wendy.liang@xilinx.com>
References: <1605743289-26575-1-git-send-email-wendy.liang@xilinx.com>
 <20201119083645.544-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119083645.544-1-hdanton@sina.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28941b60-3de5-4d90-196e-08d89022922a
X-MS-TrafficTypeDiagnostic: MN2PR02MB5997:
X-Microsoft-Antispam-PRVS: <MN2PR02MB59970101A7ECA6CD09350EB8D2FB0@MN2PR02MB5997.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FPqLkom74xRnios0v9FSfXGCVo93Rch//JaUCS11D+RVABNT1B3YBjbx7ZyrzKGG3gVSSOAkcRLdlgPHls76R0H53d7jDto8q93Aj+Fo5tiGDD/InWxcpv+1RYXmlJFt2kmON3iT/GEkb59GR6hIYV9Bi27oG5kt+myZqh2Ixj47YZNeLdd9ft+QbUfXZDrAXhV/4Hj5w4wqhGir8hXH5qFMZ0UFsjLb+Y9/zHOk/XRoGL2QBEnlS6QeAhtzJN9AHEq/0gPgFWQ423dym5s051ih1/UQzir1XJKPLgd1OkBM2ILVhZbczlXL/FeLKU9QVzpfrztbThPCiFpBnAAJZexAQ4tQ8GaXf+iWvcqUejkpl3OxDSnY7uPz+aLFfSLNFzKCZ/a1JERvjfDQRsa6O1b9rewbLjbnQs0piFoahY8=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966005)(61793004)(186003)(36756003)(478600001)(8676002)(42882007)(9686003)(4326008)(107886003)(1076003)(2906002)(70206006)(70586007)(83170400001)(5660300002)(356005)(6916009)(7636003)(47076004)(82740400003)(83380400001)(426003)(82310400003)(26005)(6266002)(316002)(42186006)(336012)(33656002)(54906003)(36906005)(8936002)(44832011)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 02:42:22.7645 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28941b60-3de5-4d90-196e-08d89022922a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5997
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:40 +0000
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
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, michal.simek@xilinx.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Nishad Saraf <nishad.saraf@xilinx.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 19, 2020 at 04:36:45PM +0800, Hillf Danton wrote:
> On Wed, 18 Nov 2020 15:48:09 -0800 Wendy Liang wrote:
> > +/**
> > + * aie_interrupt() - interrupt handler for AIE.
> > + * @irq: Interrupt number.
> > + * @data: AI engine device structure.
> > + * @return: IRQ_HANDLED.
> > + *
> > + * This thread function disables level 2 interrupt controllers and schedules a
> > + * task in workqueue to backtrack the source of error interrupt. Disabled
> > + * interrupts are re-enabled after successful completion of bottom half.
> > + */
> > +irqreturn_t aie_interrupt(int irq, void *data)
> > +{
> > +	struct aie_device *adev = data;
> > +	struct aie_partition *apart;
> > +	int ret;
> > +	bool sched_work = false;
> > +
> > +	ret = mutex_lock_interruptible(&adev->mlock);
> > +	if (ret) {
> > +		dev_err(&adev->dev,
> > +			"Failed to acquire lock. Process was interrupted by fatal signals\n");
> > +		return IRQ_NONE;
> > +	}
> > +
> > +	list_for_each_entry(apart, &adev->partitions, node) {
> > +		struct aie_location loc;
> > +		u32 ttype, l2_mask, l2_status, l2_bitmap_offset  = 0;
> > +
> > +		ret = mutex_lock_interruptible(&apart->mlock);
> > +		if (ret) {
> > +			dev_err(&apart->dev,
> > +				"Failed to acquire lock. Process was interrupted by fatal signals\n");
> > +			return IRQ_NONE;
> 
> Though quite unlikely, you need to release adev->mlock before
> going home.
Thanks for pointing it out. I will change in the next version.

Best Regards,
Wendy
> 
> > +		}
> > +
> > +		for (loc.col = apart->range.start.col, loc.row = 0;
> > +		     loc.col < apart->range.start.col + apart->range.size.col;
> > +		     loc.col++) {
> > +			ttype = apart->adev->ops->get_tile_type(&loc);
> > +			if (ttype != AIE_TILE_TYPE_SHIMNOC)
> > +				continue;
> > +
> > +			l2_mask = aie_get_l2_mask(apart, &loc);
> > +			if (l2_mask) {
> > +				aie_resource_cpy_from_arr32(&apart->l2_mask,
> > +							    l2_bitmap_offset  *
> > +							    32, &l2_mask, 32);
> > +				aie_disable_l2_ctrl(apart, &loc, l2_mask);
> > +			}
> > +			l2_bitmap_offset++;
> > +
> > +			l2_status = aie_get_l2_status(apart, &loc);
> > +			if (l2_status) {
> > +				aie_clear_l2_intr(apart, &loc, l2_status);
> > +				sched_work = true;
> > +			} else {
> > +				aie_enable_l2_ctrl(apart, &loc, l2_mask);
> > +			}
> > +		}
> > +		mutex_unlock(&apart->mlock);
> > +	}
> > +
> > +	/* For ES1 silicon, interrupts are latched in NPI */
> > +	if (adev->version == VERSAL_ES1_REV_ID) {
> > +		ret = zynqmp_pm_clear_aie_npi_isr(adev->pm_node_id,
> > +						  AIE_NPI_ERROR_ID);
> > +		if (ret < 0)
> > +			dev_err(&adev->dev, "Failed to clear NPI ISR\n");
> > +	}
> > +
> > +	mutex_unlock(&adev->mlock);
> > +
> > +	if (sched_work)
> > +		schedule_work(&adev->backtrack);
> > +
> > +	return IRQ_HANDLED;
> > +}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
