Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBF64DE5AF
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 04:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B6810E193;
	Sat, 19 Mar 2022 03:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432E110E193;
 Sat, 19 Mar 2022 03:57:34 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22J2ro58012531; 
 Sat, 19 Mar 2022 03:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=dOCvppNUKgOlcA89bNUdrq8FTQRYfsjfsvR3rEo7hmg=;
 b=rB4F0btdvmuQ8qSVzB0TI/MVdj6L1wLlPT1srOv4birzBP2VsA5D9mxqDnty9FGI031e
 OhuXiDi8PP/hnk9+43pScgnlvc1Msx3IXhpur+XlVll5oz+03KUF4YG2ZJeO5ctAVyuc
 ABInatOkvEpdjQe0XOBM3Vw23gTi3RCDw1NbsqI8/p8gXop58M1CrcTLpLi34DxilkOw
 aIKWvxzBLmxogO1BmHkA0n6pbxmOlCrA4EQcUelFgQP2O0W9a5LqlQOoSqpIeuQaOZbZ
 7pKjNVt7qrQPqi5lf6wtbxwtbMHhpxhomcEA8IcEfMLaUK5a8MKBz0qkUbZ41JgSbvMB dA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew6ss016q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Mar 2022 03:57:15 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 22J3uvsm007045; Sat, 19 Mar 2022 03:57:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ew5kyshp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Mar 2022 03:57:14 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 22J3v5Qm007126;
 Sat, 19 Mar 2022 03:57:13 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ew5kyshmn-6; Sat, 19 Mar 2022 03:57:13 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Julia Lawall <Julia.Lawall@inria.fr>, linux-can@vger.kernel.org
Subject: Re: [PATCH 00/30] fix typos in comments
Date: Fri, 18 Mar 2022 23:56:56 -0400
Message-Id: <164766213032.31329.14855996441316567317.b4-ty@oracle.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314115354.144023-1-Julia.Lawall@inria.fr>
References: <20220314115354.144023-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ryygBDbx4ESlJehbCVsBuy2qL-PPuldd
X-Proofpoint-GUID: ryygBDbx4ESlJehbCVsBuy2qL-PPuldd
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Namhyung Kim <namhyung@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>,
 Jiri Olsa <jolsa@kernel.org>, linux-power@fi.rohmeurope.com,
 Shayne Chen <shayne.chen@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Mar 2022 12:53:24 +0100, Julia Lawall wrote:

> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
> 

Applied to 5.18/scsi-queue, thanks!

[02/30] scsi: lpfc: fix typos in comments
        https://git.kernel.org/mkp/scsi/c/9a866e6aaf4e
[17/30] scsi: elx: libefc_sli: fix typos in comments
        https://git.kernel.org/mkp/scsi/c/8037185d1ad8
[24/30] scsi: qla2xxx: fix typos in comments
        https://git.kernel.org/mkp/scsi/c/5419e0f15622
[25/30] treewide: fix typos in comments
        https://git.kernel.org/mkp/scsi/c/9d05790f5187

-- 
Martin K. Petersen	Oracle Linux Engineering
