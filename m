Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E62F527DCE
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 08:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF8A10EB99;
	Mon, 16 May 2022 06:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD34610EA5A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 06:49:50 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24G5KhB4017756;
 Mon, 16 May 2022 06:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=DzyuHuz698ZY0p/UjY+lJHPQmWPqOLwwKikCT1ZapHk=;
 b=iSWDlk6C0UYE5wpyA39NmY0P+R3iFmjkt4Lh2Wl9Fs091PKYzCWhTZgDiWzqxQnGRq0D
 m82Le0QX696kIB7gAqzmSoJqTinShggVd2x5YhQ6/aj9ZSzUJoOuNfu8Nsb+rkGTt54M
 djJmoZhnO71enQJerokwR/xKDmI92zo76ALnfI9t9D5qss5wQby8HEx92SCZjvlW9Cu8
 GnMRjiyzygALlKGmT05TmQqkwimbyKx2Moa9dumIGhmgKWxna8HR1yDH1gOFUcAeWVHE
 h0l6YmeZYw6lBrugQ/byZltEt/lw1AV6H9NnS4GE/mC0qJBfJ0U5p7nQORE/WejSfZhg jg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g24aaabvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 May 2022 06:49:49 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24G6ZsUw029734; Mon, 16 May 2022 06:49:49 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g22v1cws8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 May 2022 06:49:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+Wznu6caDv7BAaLRSQfAJnbWjF4sgt9Jw2UcnO9wE4gwqqdzLVjyA1xAUZpM6f46h0wibofFZB6SZdbxJLVJTQfxFnW+25mN65Yu7SuqsurkZAXdi+5l7XYATELntiQ4ZpRZ8z/WqDl/rX0pfSSrHSksuRepLUoQyRJkS6DKJCShJngHk/LR8wpIwyaij/3X4v3Vawj/2X/VBmvM2+V0L1sW1beB7WI0cRYMpAqKIlfAEik2D8M3D2V39HhHXGvs2qoCQOSlp9qLV1E1L1YCFzmgSmMJ9bIFjpTunVOjBgKt9z1nzaO+c37MHvA2j27M2Tk0kxgPz86w7mP8c5XSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzyuHuz698ZY0p/UjY+lJHPQmWPqOLwwKikCT1ZapHk=;
 b=kumNRkAmi94frM0xhsafHjiboz1JkrU55q/qAGiEYTTUqx3rfqVyRxrc+5hZASdSBcSgOIFoCJW3fG+82gtsmHpV1KIn0hTYNmhOdJlwhXRLqQADIO8RXMr6d5NlcNVQCWkV6rNh+bWR/gLiLdjM7bP4mOB6WXsjMTiunTrRIi/iKYWExvRHDmV5sBdfW8t1ECkcnpNc+BL0XhrUR3UqtHLSIo5y7iY9UQTz1rGzyoc7GzrwQ/8B3NUKi5yyqfnpsht3+lXvufNV+ReK+FpF8IJ9/jQBmTyWRmJrbGfWeZznhSuzWmIbr4Z5ucHDYvRSosy93KInQoVeDA5kCHRDCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzyuHuz698ZY0p/UjY+lJHPQmWPqOLwwKikCT1ZapHk=;
 b=zaI4XFnwAdrt9ExdwlLzGGutbv4EwK8x9Vyw3SLL40ld0GuLd2FrzJODz9w1zOgrp+xkpHhybPSSBhTxYbSXbruQ1oN4OWS5K0xWs9k/5ieu4RglT2/f65OLdDx3f9c3aDCrtxYqRjdUZYnIF3AS3ApQJIoy7d3xozgUt1FCIOo=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1677.namprd10.prod.outlook.com
 (2603:10b6:301:a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.17; Mon, 16 May
 2022 06:49:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 06:49:47 +0000
Date: Mon, 16 May 2022 09:49:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: quic_charante@quicinc.com
Subject: [bug report] dma-buf: call dma_buf_stats_setup after dmabuf is in
 valid list
Message-ID: <YoH0AcDvgowmOot4@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0043.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7086fc77-b55b-49f5-25aa-08da37084436
X-MS-TrafficTypeDiagnostic: MWHPR10MB1677:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB16778FC9F97B775AF269D8CA8ECF9@MWHPR10MB1677.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZV13UX94oVLFZ71TDiR8tNXGS9XzuO8m0Qo+FHggLcRKOeAuRGidyn95rd7gvHIAy7RVVGHDzqb+xA0XWlcR+/0wK945et16BOst6LMyxvAIi76S/1XHlyAph5BkfiR59FvJbw4b5ppewxVT2tIxvF5piwdUNmtJpMOD7+x8vjv07qU3svyHFo5aVuUsJUrugkwjn/s+Mfrd576npkZFy8xGcfvgFaoGeSQmM6QI1vIKYyigymsTTkP1gmx222dXKhxwqyYi6QTcaWY8MzKlOzesOHwQ+m09R0jGjSzeVLxQdmi7SOI++gLvGTzyCqi1goyKUIcVnocG64UkOvDVS8V7peNKcC73A5RuMH33SLKa3t3QacDe7pBo0YcFXzTmQDR8gHaMNhNPJHaj7mwQwuw/1k5ANRCDckrl+zpPYKtAKkadh9P2m0ooU2IKAMFIYW79xFIJjZ2XsGv8Y0qP0U7aYWU2hbpefn6n+hqdus9Kt0nLwSslY1pNjdR3iyzeCWAdfAKD75M/nWFwzbl/YJL0ldLhxSpFAKUIyvJ8CD1ULmys/esfSk8T3LZBGTASOKpR6FzZuBisozCSbd6K0uqH9PFcJ1AXTNoC5SywxMbrua9L7p4HR10T+lP9zPjX1t6nT6E4FjKOpYxTn+F9yeNPSGXampS0tDOsCOg14iUojAUxhbeT9nYEc9NEkW1wVEsDux8DQDxv/7GrK8HoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(52116002)(6666004)(38350700002)(186003)(508600001)(33716001)(8936002)(5660300002)(66556008)(66476007)(4326008)(8676002)(66946007)(6506007)(38100700002)(6512007)(9686003)(2906002)(6486002)(6916009)(316002)(83380400001)(44832011)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C3356uTo7g4CBXptkBxGIdf0s6o82Z6Ru8kZqXg62Y9Wx3glX/hU5FngrhWT?=
 =?us-ascii?Q?jemo4p7qijVdt/pPJ12nbRQ/o1NQ48v5shv9pZCe+nFois+Y0G1qff2V8H0b?=
 =?us-ascii?Q?KUm+LaZoXI9HRInIscllbqkB4M6QRzYsuF4QfEIMu3gFaGFCdC4Zw7wj8eSD?=
 =?us-ascii?Q?PTtSjgN6aDi+Q65GzxFGcMcKFIgTBAeK1kVQSowMsJ1HUTRBo6wCvT0mSOtA?=
 =?us-ascii?Q?pNpYGtMJYRu0FA9ZDB+rsEimP/U6c8Yd01PFAp7NdZleuznnqOEO4sjg2e2X?=
 =?us-ascii?Q?jgV+1Leij+2ipqMNjXDvC3qQFObGiwN/oHNAhTPHiB3IRSYzPrMvoYRFRmic?=
 =?us-ascii?Q?kIm7gbLMiLOE6e5GF+OPB54z1ivsdtiXQf49dGRduPhOlvx72IjWmAmgVZuS?=
 =?us-ascii?Q?7euiMTEdZQAuyROpsBbH9VhitkPA0JnEQ3MvPTB/zSUJOdBPhXyGMf7omRzO?=
 =?us-ascii?Q?qr8XQAeZVDwy2JgaSIFcm1D+3Aszkc9wRVxc7kOAR08XSL33StF61KORwsVu?=
 =?us-ascii?Q?trQF+R35e+5xH+35orvI6u/FP5oqB36awymfMHKQORZe1qATds+dTxIUUVL8?=
 =?us-ascii?Q?zP7sespTPAUqOpybkUkMV6zEdsWkkIZTsjbGu7fJm8Tx8+uUURdfblmB3eUi?=
 =?us-ascii?Q?PHQ2VNHUeX9hxb6q9LSNWQf+83JAybAdLvy+fEvznxsGd8+PVJo/77wui3BO?=
 =?us-ascii?Q?RXACZV3z8EDxfJtH6FrJ0S4648QHfo0lGSXaJeQ4pbUiaVMkL4i+gachpL9O?=
 =?us-ascii?Q?87blWShuTxbZXjkS7dhjv/F92fMtJPETb5DKEXi7wseu7L6zJemUBFvASEM6?=
 =?us-ascii?Q?m7JwNSaafxxQ/wsV+NSRJImUfuuPN4QKGbgtPmlsjXjzJSEAT3lTtGGtk4T5?=
 =?us-ascii?Q?SPN1RLMzGmYnrApU3PT18MNQke4PUKPAHVkQm9q0SCdXvcymX7edyHlAqMNT?=
 =?us-ascii?Q?DZT7jbRQsB2dnLZa1aK7NrTNQNfA7AjAMhmB/0TxGctAROtMrHEzN9IzqLCm?=
 =?us-ascii?Q?DceFTAJoy+qbqi+8C9nWvjDm+WsSL/+pMioZvmgDVCQo0g4yB+t0AU9hZhPu?=
 =?us-ascii?Q?j/kWMJXx+HrA7m8uoNZbkLYFFrvcNznWrQDE6UScM5Qu+bKTv+to7yqelKWh?=
 =?us-ascii?Q?ulZGLJb0EJRHXGwVEraCwGJhbwdVOE8PPK+LFxAM255JV9NiGS7yRdetmk71?=
 =?us-ascii?Q?ubtk52B3g/EWVosaDNhj27tvOKfoAhJvai7muQTFTwNmzU/FLuZivtDjjxEp?=
 =?us-ascii?Q?jUZwvY0GgHAfOmMyR4r3KEMJc4/SH6oi+WLuQz/TtRNp0X8lXY5dm7sO+Bhp?=
 =?us-ascii?Q?kSDcglMvVT7q5sQUbx0i9TVkmeuFZ4j8lJI+RLg2F8f0jtgWTYvWj3nwihtG?=
 =?us-ascii?Q?IidbW5ahfzgTlkpJ+rC5zbblpe29MQ1FsPJtdCc6o1iZkpyd3vMptuqjsRhh?=
 =?us-ascii?Q?R2zGzbwh8WEl7rHe11afJkmzi9f8xpYnbyNW210P70d9IVfF2WQSZVmqhfqJ?=
 =?us-ascii?Q?IqGfwFLLlORMRc+/wfXKMUtaYyrq05NA/LW/BaL6y2/P6K1Cr6l7dTn/wqGz?=
 =?us-ascii?Q?eURiH3PQ9JWk7b2DXk/k0NrasBnSz692qcRNZc0FSE7yltbHaXqBEhxKRMiu?=
 =?us-ascii?Q?oLP9NtZqE4ICzfIMYRP680SrQLEskOORSzBUmm8+puTERJgh5G8FVhzMJSRU?=
 =?us-ascii?Q?5WBlR7jmH0smCaNG3RYnXMeANsuvjGCKnEU90rwoy3j5/VCspucDRLGjBGoJ?=
 =?us-ascii?Q?7eGL6es/mzyNBboFwYgYDWoLA1U6E+Y=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7086fc77-b55b-49f5-25aa-08da37084436
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 06:49:47.2042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tR2hekez7PiRR0WsaNPuzJX7qa2lmuZpx8mjIv1fG7UTRWB/BePnwUS8NCqbQtFT75hq6cnj88dHGJgK5/ESUt7B4bODxNsOe3sIdYExtzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1677
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-15_11:2022-05-13,
 2022-05-15 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=632 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205160036
X-Proofpoint-ORIG-GUID: FjNlyaPFcr5Qrwg6XJUivoeMG77gE0T3
X-Proofpoint-GUID: FjNlyaPFcr5Qrwg6XJUivoeMG77gE0T3
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Charan Teja Reddy,

The patch ef3a6b70507a: "dma-buf: call dma_buf_stats_setup after
dmabuf is in valid list" from May 10, 2022, leads to the following
Smatch static checker warning:

	drivers/dma-buf/dma-buf.c:569 dma_buf_export()
	warn: '&dmabuf->list_node' not removed from list

drivers/dma-buf/dma-buf.c
   538          file = dma_buf_getfile(dmabuf, exp_info->flags);
   539          if (IS_ERR(file)) {
   540                  ret = PTR_ERR(file);
   541                  goto err_dmabuf;
   542          }
   543  
   544          file->f_mode |= FMODE_LSEEK;
   545          dmabuf->file = file;
   546  
   547          mutex_init(&dmabuf->lock);
   548          INIT_LIST_HEAD(&dmabuf->attachments);
   549  
   550          mutex_lock(&db_list.lock);
   551          list_add(&dmabuf->list_node, &db_list.head);

Added to the list

   552          mutex_unlock(&db_list.lock);
   553  
   554          ret = dma_buf_stats_setup(dmabuf);
   555          if (ret)
   556                  goto err_sysfs;

Goto

   557  
   558          return dmabuf;
   559  
   560  err_sysfs:
   561          /*
   562           * Set file->f_path.dentry->d_fsdata to NULL so that when
   563           * dma_buf_release() gets invoked by dentry_ops, it exits
   564           * early before calling the release() dma_buf op.
   565           */
   566          file->f_path.dentry->d_fsdata = NULL;
   567          fput(file);
   568  err_dmabuf:
   569          kfree(dmabuf);

dmabuf is freed, but it's still on the list so it leads to a use after
free.

   570  err_module:
   571          module_put(exp_info->owner);
   572          return ERR_PTR(ret);
   573  }

regards,
dan carpenter
