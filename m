Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FCF41EEE8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 15:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE99D6ECE9;
	Fri,  1 Oct 2021 13:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3543D6ECE9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 13:50:55 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 191DkBvZ012499; 
 Fri, 1 Oct 2021 13:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=ewhlTdW7xJL+ahqiVU8MBlyNLtATIdjUA1P36tmekgI=;
 b=xpWZ13p7i4garErFTi9J8xhNYp6DQDFkgMr++usaKgcFVYvsfxh+tIhB8DwEaMPMKkjK
 2k1JhBKu0bhbSB9XVDaDTj+aF6BIxEm4XvdDstyl+m7966kmH6wHI+PPs74Hew8gmWlJ
 VV+5RP90/f/HuEcENjd3P4lUiqznwBAEA47hhxuXFwNpIbckeyHjd+rKUcy6WurOOU6j
 gFhzLMki9gwHAqq6KC8KpR6bQ1GGhDW64s0a19JW8D9/5VYT++ykNlU3U1xT/vdPLFFM
 YF0FRz8LaYIOctwYuwoBIwG+VJTkASw/4HT4s/k8lUjwPbsE9Ep0oeGH+TAYjG3LfIb2 /Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bdevvenmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 13:50:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 191DoOMq189964;
 Fri, 1 Oct 2021 13:50:47 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by userp3020.oracle.com with ESMTP id 3bc3chhcgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 13:50:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hK4a6MkedYfgVnAUYrlpp4Q6buie2rPuGvyv7FDubiM2TlZt3AxkNjNNJENynYcjxwRHBESiGJ7TYQ5dZOHFAE/Pd5IEQACB8q+VeXjlDbfLq+NXkEAUZ3oeep16pjH0ZOog6XSzzvAjt6b6TtDUWdlm8id7zU9fYmcpTdqpkgl2O0LqogqFLDaDSw+k9pAzSq7KUABk6YAs6ZiMnswy/1yUrUggl3qEuxiu+88kBxuTRUS16r9KC7TLhpnjj6CDOPE567NpMK59G88LXS5j2g8Nd3aZl/ObvPCmV2wvS1ZyU72CP+8obvxYZpDQzj5TwVDDVEq6qyilX1YUbNgKTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewhlTdW7xJL+ahqiVU8MBlyNLtATIdjUA1P36tmekgI=;
 b=WG7L14plBJWPL04vDV97odQmkNrh6UZSh1YVdnjybY/PlO4NysmoAOVzKHGC5PWC0xB71YkshEqFC+9FNShBLM65itoCFgTS7Yu1aLI5Lil7+hyap8sGUOuebisn8mWVt8KgtDs+WYlZw/eff40wrRGcE7mUVUxZvpN1SDaGEOHAYj7ZmWS6oqiS/2yxGpEFTNhMbY+HssXn7E9H8aAIYeTSvgEq1A4zedq2me/GUlz+c7ihjNZRR9foF6vSvqSZTNJPTgCmblVmoNt8ejkPDbURdUkSMK8agQc0RKmxMNWJMouODxpUuXbtdECVHFJKgT4Mpb6oNIss2vL8ehExkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewhlTdW7xJL+ahqiVU8MBlyNLtATIdjUA1P36tmekgI=;
 b=scxVNkx7tyZAFC68b5hLCfLq7N/MqAdKg6ldjP9BlZWi6X8R+vtBqVCbwXBgDo47WVhNSKRpEGsWfaXcIIJJuMDo2fT1hUIMB9CdnN23ArrjcfEho8Pnt9opX8VDWuaVbDGd4BL4iNq+Ah1xdXvYdAtLdZkPVYvEJBNAQja8yuE=
Authentication-Results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1357.namprd10.prod.outlook.com
 (2603:10b6:300:21::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Fri, 1 Oct
 2021 13:50:45 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4544.025; Fri, 1 Oct 2021
 13:50:45 +0000
Date: Fri, 1 Oct 2021 16:50:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: jsanka@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/msm: Add SDM845 DPU support
Message-ID: <20211001135033.GZ2083@kadam>
References: <20211001134912.GA9248@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001134912.GA9248@kili>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0041.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNAP275CA0041.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:4e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Fri, 1 Oct 2021 13:50:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a44ee9a-7031-4008-0e8d-08d984e2776a
X-MS-TrafficTypeDiagnostic: MWHPR10MB1357:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1357A105F50BC522B074969B8EAB9@MWHPR10MB1357.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XL0iuD/6N96gxcAXuuWluqJSNIR47ezfohkUw01oNeAIqo3LcTLcrxsBXRm5B4YQXqbvdhE65qoTX5Y9sovu6esFJlRRWgGCwVHeyIN+XOnuqoxgCtK2sZl/7Clm3h/H6QYrxognSHuQMFm8RKM/MaerF2Ik1yjGgHDYZwKeFdt69HTkw+QpJZcJJyHonwzEVm9qn0ONQsBc2k4jX3U4LBWdiMiBhWd9OiQuTvU/y2lUmUUeC5QdUxG3TUGIuTd/RCr6WuCiT2EDAsgpzEIlPdSSAkblHAOT5M8KWUemZGnMxMLGMFyUGwodBXqpu7fX9+Vp6GnMnSpIzikgTaALqPG33pRdB4iQjly7d/Lt1pJWpL+O3jA+4i5IQXncx9PAgoDkrJKXt6edlMVemXdTBLYh42NkrSoJdK8mrVw3GztCmwx3az5IYBv+fdlLBIO71sqEHT7eGee2WzJB9XMwPGNhXzkroXRQ6KSJ6W9QgC+LJtg2c+DBPUUFrvnxVhg3h2lRM21cxfZDtZEIRzba4E4sNYR68ibJ+IUClO8bqRnD76C1D3NvUg2FQggfeRci4EdO4xK+hc9BCuKCGXjg+iCGQgfJFGfRH43W8lq2fh4vyT6WucTQgX42Mgi1l7valgRE/lfEV/OJWXXtTMbsu41qzqM+bz1SpDwYc5J0jzRmjq+17SZ2IaSGN7oKd1PfoXCpNuSpTGbFILYvP1opvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66476007)(66556008)(33716001)(5660300002)(4326008)(9576002)(8936002)(8676002)(6666004)(316002)(44832011)(38100700002)(38350700002)(83380400001)(52116002)(956004)(6916009)(9686003)(6496006)(55016002)(186003)(86362001)(26005)(2906002)(508600001)(33656002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MymOJY3+6a+ZH0o/gdVbK+sq9tkG5sOv7Rm2FD1cvhh62t0JYwKcyTfkql9m?=
 =?us-ascii?Q?z/VOODID3/7o+2UYfV9vRIgNyPr0AQKh6rtJ2vj9eqIoznrosY62lzdufzKY?=
 =?us-ascii?Q?p1vwC8vNih0p7qST52Cdn9COlZFd2h6boRqnRSo4gKXKXYd5fnVcNnVN2K7R?=
 =?us-ascii?Q?VEdRsA3I4QybUISpcuvYIsILbwj36bveHhtEGEsUWmjAZijxciluGsUSI7hI?=
 =?us-ascii?Q?XNBEyEpBLIlomATR3DsndhZvs6ivr4hrFAhsYVzOvVOhR1BOnod8jHP16zsX?=
 =?us-ascii?Q?YtLCHFxS3IfKQtCbGxAHikdgdsZw0fWU1BW68gOIo1tHhs0uNqT+gCOkfYx2?=
 =?us-ascii?Q?Gdp8XXoY5VG6HtJxhYZ9L3qsKmY7J4aTIN6VSJxytgKegRfF0vdvNl4R+FIR?=
 =?us-ascii?Q?fyVqBQaQ7ynBjMKLBK99o04dqP+/+XSV2RMB59Rsr5yyq3YjsaPVYpw3Tb2R?=
 =?us-ascii?Q?N8807EDmZQXWnp3sFlg7hbRy3zJ6R5U1zQA82ovVxFNzLVnwhm9QTI6wkGDF?=
 =?us-ascii?Q?lu8Zrf4G4UkFTCsca6s6YL+1AdcEvJh1+KmfLlOodkCCHpDU9TvY+GCeHIw3?=
 =?us-ascii?Q?xEZVFHHC0pP4oCo1s8OVOBPBg4Ke0EhLr+XV++6eDU/tkcIDpwU1QWLbfQE6?=
 =?us-ascii?Q?5zEeeLHVwMHKkdF54oDUHLchTeJZkxhS8DTaRrdemuqyz7J9ECQrVx5087Ia?=
 =?us-ascii?Q?VHO21Pg+p9G53Jfp3SvVs1nDL+dxhSHdCPZab7LhIh+jA/9jVvTlXSG31EZ+?=
 =?us-ascii?Q?ExVnkpICFGgEQfzBETOiWykoLnkvBVL65AC90a5k9PDmHFM7Z3EDQSlxjE0u?=
 =?us-ascii?Q?Vzc2c46B4bWw0DmeUYGCAhWsthB4Ny/L6gr++YcT2QTXDBVUBXzS6OgEl1PY?=
 =?us-ascii?Q?2Gk2iQVDD74rmTUiNV2x06GIj9qf7N7E/gXS2b0Y8Ow0TxAPR9w9VfkUrG3g?=
 =?us-ascii?Q?fcKuafgTzWsSP3s+SWtwlo8mXtnJlzxXh6CxixTdH1QlGfw0OzeDkAkqhoOb?=
 =?us-ascii?Q?qi/kkWP7HrWtMb1dB6Na6M8qK6N3GNJJ7D7h+Lw/p7WdvcG7HFRUaNJbjOnI?=
 =?us-ascii?Q?udASE95XdWhOYfW2Vg37RcR9gpM8SxRa0Y3goLm+OySiWONIzdeILwe0QM7B?=
 =?us-ascii?Q?/O9t57ybKwW4yxlhfVMufEJbvsPa2eg2GGcgbba366bM7u6QQCP/nYOt/JS6?=
 =?us-ascii?Q?TNuXh99wIsvnAG+deduM79L+IN3VmUECW8nXFh7RSo0QFBrlS12v7DyNQ7ak?=
 =?us-ascii?Q?203OXzcH6SFryQkWn5CwJa4hw84FaVodOba8lCgeiabRAJ2OYOHhyEdBFge+?=
 =?us-ascii?Q?b3gqQPZhZkdRJw5TGTorj/ox?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a44ee9a-7031-4008-0e8d-08d984e2776a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 13:50:45.5147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdIcLCG6UTt18tuXdCWkPXFi1460Y9DbRYC1RIAHfVdi6JqwxIzo8hJLlokhcYXW/ezpCq96eXNIdyYYnXkcfk7qrdQ7vcNlMunZQOUxmyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1357
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10123
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 mlxlogscore=998
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110010094
X-Proofpoint-ORIG-GUID: yhb0GIh14cpZDZpUgkQqX5efoUQN107H
X-Proofpoint-GUID: yhb0GIh14cpZDZpUgkQqX5efoUQN107H
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 01, 2021 at 04:49:12PM +0300, Dan Carpenter wrote:
> Hello Jeykumar Sankaran,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 25fdd5933e4c: "drm/msm: Add SDM845 DPU support" from Jun
> 27, 2018, leads to the following Smatch complaint:
> 
>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:422 _dpu_hw_sspp_setup_scaler3()
>     warn: variable dereferenced before check 'ctx->cap->sblk' (see line 421)
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>    420		(void)pe;
>                 ^^^^^^^^^
> You should file a bug report with your compiler devs instead of adding
> these sorts of statements to your code.  This function is used as a
> function pointer so unused parameters are normal.
> 
>    421		if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || !sspp
>                     ^^^^^^^^^^^^^^^^^^^^
> The _sspp_subblk_offset() dereferenced "ctx" before it is checked and
> then it also derefereces "ctx->cap->sblk" without checking.
> 
>    422			|| !scaler3_cfg || !ctx || !ctx->cap || !ctx->cap->sblk)
>                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> So these will have already crashed before we reach this point.
> 

Same thing later as well.

drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:591 dpu_hw_sspp_setup_creq_lut()
warn: variable dereferenced before check 'ctx->cap' (see line 588)

regards,
dan carpenter

