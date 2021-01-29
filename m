Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392323094BC
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:28:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064BE6EC9B;
	Sat, 30 Jan 2021 11:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 682 seconds by postgrey-1.36 at gabe;
 Fri, 29 Jan 2021 10:32:00 UTC
Received: from pv50p00im-ztdg10011901.me.com (pv50p00im-ztdg10011901.me.com
 [17.58.6.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA726EAC6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 10:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1611915637;
 bh=RtWPONjyLKXQg7N/xiKKHxgPOMcT6jbH/Pw2E0sU4E8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=PQkzh2RLjK38Yub6SuOS3EOpzjOrz1N4ttgQerAaNycw+SHhMbOQNyGgnxogOkJhx
 ydP29F39Z0KHvcv8iVxkUyuT0ZWrhNrGAS6EW+7McaeDu9YNay1MCb25HFbe8Mt5+J
 kp3kLDl2L0K6iKWV/GbE/2fpJBgSJDQetIRskvkSuGHDckNBTftX+WHVvTyoKrYtvl
 Y6nUCC9e+0R4ltGpeHHc+spdRlR3iD4nW7jv7/3YgcEKInbx1w9S6IJxR2gWqbL0Nt
 1cepnnjmYbo4MrqGAtt4Ui2j14ltCGL26OylQO7RD2v9Y1/BpJOatcjDFT3UtPyadM
 EqRITKvOjac+g==
Received: from localhost.localdomain (unknown [119.3.119.19])
 by pv50p00im-ztdg10011901.me.com (Postfix) with ESMTPSA id 9047F800470;
 Fri, 29 Jan 2021 10:20:34 +0000 (UTC)
From: Abel Wu <abel.w@icloud.com>
To: gustavo@padovan.org, maarten.lankhorst@linux.intel.com, sean@poorly.run,
 airlied@linux.ie
Subject: [PATCH 0/2] vgaarb: minor fixes on return value
Date: Fri, 29 Jan 2021 05:19:42 -0500
Message-Id: <20210129101944.2083-1-abel.w@icloud.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-01-29_04:2021-01-28,
 2021-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=767 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2101290052
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:28:30 +0000
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
Cc: hewenliang4@huawei.com, wuyun.wu@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abel Wu <abel.w@icloud.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two minor fixes on return value, of which one for the pci notifer and
the other for initcall.

Abel Wu (2):
  vgaarb: Fix return value of notifier callback
  vgaarb: Make initcall always return success

 drivers/gpu/vga/vgaarb.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
