Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E84591238
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 16:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC7FB54A6;
	Fri, 12 Aug 2022 14:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA566B54AE
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 14:31:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6PPYtKI7xjDm5CAXSyKYbft+um3PRDOxUT3QL+yUtlqB8zeJJNklvgn6EveIrTnDqll3kJdRu4QHJCUXX6kiwtVwkt+wwOUZWHnqUTFe7qtw0KWQ8VJWGx4Wyq9KzDTCWPpCvFmoJsBVnKDBy9Uh3S5Yl5uEp3LuCqm/2f6CpR+j1gMmM3u4smdPhrSl165r70OMtS1OWXu6gA+2gD+SJ9koGXsDs8dtmrKpy/w6ymMS/KmMBJDbIWc2T73EpGA7qDBPdWb2VoXnDdpCWkKpli0gfs2X6b+8NgGsa9PTduN/XNyUpLq/dHFXVw3Vv9SxAMTuRjCeXRIbmVliJqZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQnw5ocThnCjKQjJGwswZe5PKaU3L01ekS6fvIWRPhU=;
 b=P+NXaYIBaWHEXX0R0Jboe5cUqPJrdXN4XP8K19ZieqO7KmyIROhAKYS7EdCllN/vjw4Vne/8+GAktiJcUPMWTidgErZ8NdI0JyfL53esr0A6WcFpsLsDRiJVFdrQ8nB/SCsbYO/NGzdrve06v/4LkNfMBag5rdvkWXQt5LuhDg52j/bYejBlW9uid8sXuo78b2gjAVMndovnPq9WS/NSprpkuUmP91FI0kaS/WVXjRlii6VUQuLupetL2425z+pSsiARx3moqXJ+W4SvvgEflyOpjdqisCK4ceYGdozrAH4TdFzq7Mj+yuWye9T5O7Sz+rlJKH+TcA6rTZxcPE6tJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQnw5ocThnCjKQjJGwswZe5PKaU3L01ekS6fvIWRPhU=;
 b=IR9rT1gLa6lA105hydE37/7IlSw2cJjEJCN+vj40TbSyHLZx2tbJ2P0Z0vpXoqZG+zEs5XD/WdNuL2NbnQuP5W6jJsYVEVyd714SFgwjYu4sYsA9eG5G8IOai85w0J2Y4BwavSGIPE4xPrLv7X2MzEcd4IQ/44/K+6acbj1EwCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by AS8PR04MB9208.eurprd04.prod.outlook.com (2603:10a6:20b:44f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 14:31:01 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6%4]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 14:31:01 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: etienne.carriere@linaro.org, jens.wiklander@linaro.org,
 sumit.garg@linaro.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 op-tee@lists.trustedfirmware.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/1] tee: Add tee_shm_register_fd
Date: Fri, 12 Aug 2022 16:30:54 +0200
Message-Id: <20220812143055.12938-1-olivier.masse@nxp.com>
X-Mailer: git-send-email 2.25.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0202CA0007.eurprd02.prod.outlook.com
 (2603:10a6:200:89::17) To AM6PR04MB6743.eurprd04.prod.outlook.com
 (2603:10a6:20b:f1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7373414-13ee-4a28-5180-08da7c6f4790
X-MS-TrafficTypeDiagnostic: AS8PR04MB9208:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qIdhm2/LlDVAFIxGmcK1PVTlX+J/J/z6dINTmkG/b4P+4WBO+OJVhrr4Yo5qEaUIrtAWYhCakZZaxVN+2KZapCorDSs5Cfs+8VHTQxw5oYvESpQOgk0acAuTaX5ZIQtv4MCAVt7dwAR3k9a/sWlWwSCUVOQhMMazc71tq92Ymz8liUlGyO70MoogBabpGGONKEgQEJ9N1z+3BsrfpBFmwXpFskOIENE0VivTUKN+xzwO1tyzJSbgnobKoLUU2o9P0Pr8II7tdG+MpLENkp7QMdFDyxx430NvTTsR3QgVd9B4QqafOmOmVwO1s1YOWUcJn985A7gPtU4f633rSIt5PQ1j6Q2HvmuUMKmfAAxYr4yQrXBfKOacV6uzziz2EmfMKdrh+k1darDr4xAu+UT1x5f9INfNFOqkTpMM1CipvqoH6dUGH3pzZKCoOYF9736x0i8jqZe6fz1wjFy64oZm12NxLP2QgZtnsM7HVoKtPnn93EQycFdCUpf/GKqlwte9dNmQuEcKfKE9BtmdygqWhOIjeqhF02H2oWwZz4nTpEeuOlBo2lQ8Jch2tajVZ+nq1BMbj47SZQrIza6+tLM5ngXZF1qqLNFVjw6eC0LEVD3m/YGk3KKP+WALfIlE7aO0qv+lnVb81to7YKcCgxPumf+770azncCDDa1iEKlqwjt4P3qSmGIcYvjg8b/vJNlGltBTJgba7z0Jdbi15TI51S1LVpn+QD3ORT1IU1g41EsPM2kxCETQf8NXbhA0xs/T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(478600001)(83380400001)(5660300002)(1076003)(186003)(36756003)(6486002)(2616005)(86362001)(8936002)(966005)(41300700001)(921005)(7416002)(316002)(66476007)(44832011)(38100700002)(55236004)(6512007)(52116002)(66556008)(4744005)(66946007)(8676002)(2906002)(26005)(4326008)(6506007)(6666004)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qdLwSoqxvpTC5iNOyWEXDbgSJf318Z7YuJgYIFnUFgQndCyoAcosTwbrufDd?=
 =?us-ascii?Q?OmTfUCkaJAG6bB9DeuAxC4j2qmuUdtVED3+4c/ytc+fD6DiJJWL2+TcoMvP1?=
 =?us-ascii?Q?ovoAv8emvK9sL7m+AsK7iQ1cNlHT8xIcYaAO62gHVuyFW9QaAiWSSWTCaf2x?=
 =?us-ascii?Q?8NDLYZuHHPsp+ClpDQHCObQLbWXpsJqwSMH2wGIIWP30E/tq7kmQwk9M/VIV?=
 =?us-ascii?Q?WnGgnQ92VLwFoNGNXoQPWZBFSX6KyF1SP4ZZ9skmuwL4zWmcTp+xG2X4IWQj?=
 =?us-ascii?Q?JLwiXZHYsM+xzMJ1927igVj6iGTThOPpjJ1BdgjFbDml/reWhPLf+BGb4w81?=
 =?us-ascii?Q?uDDi0L+RQUN54JUU06roiN+XDYLJcR8c0TzEw/LYrTPzcgPKR5M8sJR76cnB?=
 =?us-ascii?Q?qsxboWaY4llsXFtJNAc6U23si3YHiAZmQmscKXdqKhMDg1iw4FXktGhFXX2a?=
 =?us-ascii?Q?AHleTRwMntIuwYju9wR6bg55CydreeQz916+By9iv5+awV5jyPAWaDITJKoi?=
 =?us-ascii?Q?+jwGTCZ31j6yptSHxwWGYT78J1G5alHa/dxbGMa6B++C6f5egkWA7fgggFUW?=
 =?us-ascii?Q?/eQkCma8jpMd7Iv8i/1HDCDpJET2IaZHultDcTetY4thn6JxIO4N71uCrsve?=
 =?us-ascii?Q?Xw29STX2x4SRGMQF6cxHiEHb1FCfbYl6zFVyt5CvL8TcMWwrEni1Y13KtY4R?=
 =?us-ascii?Q?0w1IrCyRR1GXkO4SK2tIcMyUfG2OyXx9to0MkgJksyhUc4g+FcnfSjMJEb3q?=
 =?us-ascii?Q?M2GCWeUc4YcOF3MimdbPr6a0tpUbWqcm/2KPD7vNfmm7O56WGCWNu/JREkp4?=
 =?us-ascii?Q?9led9y4ABpkBRwY+yNMavUn0MrrKTkG+1zZ8bKhBEBWHRSVJRnjAL/RSV1gS?=
 =?us-ascii?Q?CByhWf9jOquI8TNNwq1MUNgxC1+QTKeNu8/Mdf1KkxF5AwxbMQqtjm7ajlFq?=
 =?us-ascii?Q?3O+eKgeAtQ7gzrXkjVGdiEvYyZeyXWc3Rw4XJlquxvAVL+xUm1QfNkGAy/bY?=
 =?us-ascii?Q?Sqi0UVYF8xVFUzHNjrbc242hdjDq5ZKUBvgsozhawXMYCRsZf1U5tXLiwXm1?=
 =?us-ascii?Q?vy5ETeWg/9AvxAMKSNfqpubgNIj0/TzZZvNXk0+zvdKgbHTSK93MDWZ7lI0n?=
 =?us-ascii?Q?TxeYQzrQtYnHMRA/IlEKBmfMa9NRGnnpQv4u0KqkdwJpAWhkb6nh307pijHc?=
 =?us-ascii?Q?+tMBaDrUOhHVxYIDG7EEo1d6nT168zpPF6WAQg2bG6QzIM+64Ctxjwiwa3Z2?=
 =?us-ascii?Q?jMejF7SK0v6ltfIW/mJOh0zYQKH6hBnT1gpgJMoladiBs5MWgbUBAUuLPDFX?=
 =?us-ascii?Q?qbjBHRzzKhFlsAUwKGLmvmZXIvDmiQp4FkKBmQmHNx8YjPsjnWIiuLm2vkRr?=
 =?us-ascii?Q?n1WbCTiITYVNiHY8ZdVy8txDnGs+5rWFYRSA8cjQEetisobpE+k7dRqMhD1w?=
 =?us-ascii?Q?mUadBx+BgApwTe10xfEKss31ypZtDJ6TljPIfk/FKPOfPvj5jKgIF8M16a9U?=
 =?us-ascii?Q?UBU1tRXMAteTDeFP6m3a/3x6ROYXlwOEBjgUIHMmjKbJE/R4cMdrJV70qzh9?=
 =?us-ascii?Q?cwcfjmcgDP0bNAWVoAIsXbDCUpjgoTLQqLUd8vVI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7373414-13ee-4a28-5180-08da7c6f4790
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 14:31:01.2700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ItA5TNAhdGFxpsCC/BK+MbnHa4dHutmlCBg953NegDgLzc4kOXRyB4bn95aglQW5MoOvp5aLe8K0lHS8zhluKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9208
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
Cc: clement.faure@nxp.com, olivier.masse@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new ioctl called TEE_IOC_SHM_REGISTER_FD to register a
shared memory from a dmabuf file descriptor.
This new ioctl will allow the Linux Kernel to register a buffer
to be used by the Secure Data Path OPTEE OS feature.

Please find more information here:
https://static.linaro.org/connect/san19/presentations/san19-107.pdf

Patch tested on Hikey 6220.

Etienne Carriere (1):
  tee: new ioctl to a register tee_shm from a dmabuf file descriptor

 drivers/tee/tee_core.c   | 38 +++++++++++++++
 drivers/tee/tee_shm.c    | 99 +++++++++++++++++++++++++++++++++++++++-
 include/linux/tee_drv.h  | 11 +++++
 include/uapi/linux/tee.h | 29 ++++++++++++
 4 files changed, 175 insertions(+), 2 deletions(-)

-- 
2.25.0

