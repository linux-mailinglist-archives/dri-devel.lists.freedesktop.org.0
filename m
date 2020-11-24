Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103812C1F7A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02A46E21C;
	Tue, 24 Nov 2020 08:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B4A89A74
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 03:24:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oD+YNFl3y4gx/rM+CL34di6O3PTeYHJmAOU50+6L8Bc9AsGePQBP5AnXZ3nSm4yf9qaibJv9d72ANSM4fzEicNk2LFhEDuTk6CGYdZJ5j5wDGNG7Br3Ft1XSJo82rbQ5EQA4QMQn557KQxDj90BqV4u+RHM22B4KwcMHeul2Moa37mFJkGwqaUmVagP4hjKVH6pgk8vUMf9FxaErknCqPIC1/FIyOQTMrA2J7NxPJovx1hirCd2z4OAKhfgcfN8jcMNR+LXQ7R1usBFT2+ZqhjzQLlkoc9BClvPgF00uFZ3iKNxJA6ExhKzkTW3tzFoYPXtpTFpmfzNYeJepOLnvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUrSFmc2F3Hexip2YCZMyqeuXLEf1F+dX8lkLWtb36A=;
 b=UgJzy5gPSHXOD/ksh2/SCEW7FfiNho/Ys0W9U7ol4W40uy7cSGuNBysKyt8lZJuH6WLhONHyamtU348jSlsFagDJAExwh4odDsIEboe4ko7zej3nhZDoXD+ELi/swtapswpoz68XeHsrBGoDbrEii/+XGdF6TiUHtFgvdZbMAfTCxWUWPAKLhyO61PTDR0MGhmP2iI9DC5r5TnDgiWyHdXnSMh3QsHMwB45FqoYugkto1ssWD7FiNlAaWYmNz9ePwludzm7KsAdHYy61DR6VsMIEl8piq5df5ZsrHKuC2hF7saggfMiJshKnNI7A47JZAAy6z1ftMDJmTymI7cKRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUrSFmc2F3Hexip2YCZMyqeuXLEf1F+dX8lkLWtb36A=;
 b=FLlvJc2ye272H7iYGIRuIjxjYFtWWFhDmvuqlKB+DGzwGY0KZAERQ+2UI2YCX8O7ffS1ArrUeq46dtwpNjenrGmspMaehtTXD0c/8aSs/ZM+72X/wf4Hsz79mItoaOvr4ZGQD+gyu6UZsw/15Q9HKv29lsit1kpt+lUcc74rWCE=
Received: from MN2PR22CA0010.namprd22.prod.outlook.com (2603:10b6:208:238::15)
 by CO6PR02MB7667.namprd02.prod.outlook.com (2603:10b6:303:a5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Tue, 24 Nov
 2020 03:24:31 +0000
Received: from BL2NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:238:cafe::f9) by MN2PR22CA0010.outlook.office365.com
 (2603:10b6:208:238::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Tue, 24 Nov 2020 03:24:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT057.mail.protection.outlook.com (10.152.77.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 03:24:31 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 23 Nov 2020 19:24:29 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 23 Nov 2020 19:24:29 -0800
Envelope-to: nishad.saraf@xilinx.com, michal.simek@xilinx.com,
 wendy.liang@xilinx.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 arnd@arndb.de, robh+dt@kernel.org, hdanton@sina.com
Received: from [10.23.125.111] (port=58718)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1khOwP-000806-IM; Mon, 23 Nov 2020 19:24:29 -0800
Subject: Re: [PATCH v2 9/9] misc: xilinx-ai-engine: Add support for servicing
 error interrupts
To: Hillf Danton <hdanton@sina.com>, Wendy Liang <wendy.liang@xilinx.com>
References: <1605743289-26575-1-git-send-email-wendy.liang@xilinx.com>
 <20201119083645.544-1-hdanton@sina.com>
From: Wendy Liang <wendy.liang@xilinx.com>
Message-ID: <627ef0ef-5e4c-b310-92e1-a9bb57d1aa96@xilinx.com>
Date: Mon, 23 Nov 2020 19:24:28 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201119083645.544-1-hdanton@sina.com>
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92a24136-47f7-4768-ba79-08d89028753c
X-MS-TrafficTypeDiagnostic: CO6PR02MB7667:
X-Microsoft-Antispam-PRVS: <CO6PR02MB76670F4379907301C9BE13D2B0FB0@CO6PR02MB7667.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RhEhorgQinWIM04sYHPsL8+Zcl9GNDORPYlwaHKDxu50t/tVckL8BPl0Ec5yewQ7NWIHwA6FYrwNOZUGb4QzHFTAA8NjWZ3QcyyyVd14s7uUV2zR0yNC8BeBnAsqkVU68ivMSp2yl4vvjDdG2eSo1vULvd+cWNT+PTqONzgirOeFUecXiVRtnkDtyTOY8IULDb2ojFGEs6dHK11XJ9V7PVb5MxCd9+KfWToFHmZjm1MXhcJDwzH0Yb1xj+eLQgxxXdUc8T09Tc0QAzrQAXAZzLbAbXY4bCbgGNZeNdFDOiReMyAfLD++eoqGYEnSMadihpzYh2RRGU2MVLni0bKnwRYPrvHPvktHLiS9Wx18eA+/WpDsOvDLLpK0f+zIAF7tgThJLyEwHA4MQzTf04dM2dB5LHdH+JweaGbXOr0vu2nD8rstv6uLr+LVWx/SJcTPE0FsSj/xfuxIkFbz4a/TpQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966005)(2906002)(7636003)(336012)(186003)(44832011)(478600001)(2616005)(26005)(53546011)(9786002)(31686004)(426003)(70586007)(107886003)(70206006)(83380400001)(316002)(4326008)(110136005)(36906005)(54906003)(5660300002)(8676002)(36756003)(356005)(8936002)(47076004)(82740400003)(82310400003)(31696002)(50156003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 03:24:31.1521 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a24136-47f7-4768-ba79-08d89028753c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7667
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/19/20 12:36 AM, Hillf Danton wrote:
> On Wed, 18 Nov 2020 15:48:09 -0800 Wendy Liang wrote:
>> +/**
>> + * aie_interrupt() - interrupt handler for AIE.
>> + * @irq: Interrupt number.
>> + * @data: AI engine device structure.
>> + * @return: IRQ_HANDLED.
>> + *
>> + * This thread function disables level 2 interrupt controllers and schedules a
>> + * task in workqueue to backtrack the source of error interrupt. Disabled
>> + * interrupts are re-enabled after successful completion of bottom half.
>> + */
>> +irqreturn_t aie_interrupt(int irq, void *data)
>> +{
>> +	struct aie_device *adev = data;
>> +	struct aie_partition *apart;
>> +	int ret;
>> +	bool sched_work = false;
>> +
>> +	ret = mutex_lock_interruptible(&adev->mlock);
>> +	if (ret) {
>> +		dev_err(&adev->dev,
>> +			"Failed to acquire lock. Process was interrupted by fatal signals\n");
>> +		return IRQ_NONE;
>> +	}
>> +
>> +	list_for_each_entry(apart, &adev->partitions, node) {
>> +		struct aie_location loc;
>> +		u32 ttype, l2_mask, l2_status, l2_bitmap_offset  = 0;
>> +
>> +		ret = mutex_lock_interruptible(&apart->mlock);
>> +		if (ret) {
>> +			dev_err(&apart->dev,
>> +				"Failed to acquire lock. Process was interrupted by fatal signals\n");
>> +			return IRQ_NONE;
> 
> Though quite unlikely, you need to release adev->mlock before
> going home.
Thanks to point it out, I will change in next version

Thanks,
Wendy
> 
>> +		}
>> +
>> +		for (loc.col = apart->range.start.col, loc.row = 0;
>> +		     loc.col < apart->range.start.col + apart->range.size.col;
>> +		     loc.col++) {
>> +			ttype = apart->adev->ops->get_tile_type(&loc);
>> +			if (ttype != AIE_TILE_TYPE_SHIMNOC)
>> +				continue;
>> +
>> +			l2_mask = aie_get_l2_mask(apart, &loc);
>> +			if (l2_mask) {
>> +				aie_resource_cpy_from_arr32(&apart->l2_mask,
>> +							    l2_bitmap_offset  *
>> +							    32, &l2_mask, 32);
>> +				aie_disable_l2_ctrl(apart, &loc, l2_mask);
>> +			}
>> +			l2_bitmap_offset++;
>> +
>> +			l2_status = aie_get_l2_status(apart, &loc);
>> +			if (l2_status) {
>> +				aie_clear_l2_intr(apart, &loc, l2_status);
>> +				sched_work = true;
>> +			} else {
>> +				aie_enable_l2_ctrl(apart, &loc, l2_mask);
>> +			}
>> +		}
>> +		mutex_unlock(&apart->mlock);
>> +	}
>> +
>> +	/* For ES1 silicon, interrupts are latched in NPI */
>> +	if (adev->version == VERSAL_ES1_REV_ID) {
>> +		ret = zynqmp_pm_clear_aie_npi_isr(adev->pm_node_id,
>> +						  AIE_NPI_ERROR_ID);
>> +		if (ret < 0)
>> +			dev_err(&adev->dev, "Failed to clear NPI ISR\n");
>> +	}
>> +
>> +	mutex_unlock(&adev->mlock);
>> +
>> +	if (sched_work)
>> +		schedule_work(&adev->backtrack);
>> +
>> +	return IRQ_HANDLED;
>> +}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
