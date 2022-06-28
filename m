Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD4855BF38
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 09:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7182D11BA28;
	Tue, 28 Jun 2022 07:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2C911BA26
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 07:47:16 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25S7FMki002063;
 Tue, 28 Jun 2022 07:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=JfNVJr2RUaSRG5LrAWW7f8mGSbGB946W6UzrZQHKR+8=;
 b=yYjAqG7tVvmHrU9BH51tGxshFs38J8t4SsKWiklGEJE83Mes5s8YoR6Su9fjYGEunv2p
 lJZjygADdK7s7WZwKlS/MMxFYcZ8UBDtY1WIhYOpPmC1uhBksVzlZQPqM7gbgZ7OsbRh
 ohbi5pyo5hzHE0woiVjMFSU2Eq7QP/cb2dN5OwokkQhZ91g3vGSBYiE6+G7QpeGw7YAj
 9MkvcQsXQyzxkWLzgf/+qK7zM+c0ssFp/0y4ArQKzG/lWyVJppQFZ0d/WQTGI5nWwOYJ
 Se//hVP5EFVSeg/M+B70KINs5p9yRB7Y6Jvssz9ywlsuE3EelSicNeVVGrZxmXbgh1eD Rg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gwry0db8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jun 2022 07:46:06 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25S7f1s1039727; Tue, 28 Jun 2022 07:46:05 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gwrt2awx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jun 2022 07:46:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqJp0hMhv1+f2CNOmxQE9DCUFuLeLGwQ6buqPahHbDxI4zRyU89XkJcEu30H+6Phrlf0A7KgUsgipLyWAALLPWYk4neN+s4OUPG5eKI1vcCQQngloHmxVS2uD6Kd4rnaECMP4XnxuEnwz/FZNwdRVSsc3eL6hG/y1kr0a4+32GJwWx7Vna2qvFjNOegqga0LFVoCVNEflJ9GEhoi2tlxE4XHxsF/isEYwWxYeQs05UPtQJ9iwTK1IyemOd9TEjV4nn5Vuy0yeHaul+GoRii3+pSL4aznsdLufMRvt4Fo128Y1+DiinzRD+hCVT+OAuVMS7xNW47B6I1HAapA6v5c2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfNVJr2RUaSRG5LrAWW7f8mGSbGB946W6UzrZQHKR+8=;
 b=cnuQiRNJGOGWXyEG4BQ6nHwUwZWoBPI6SogJ8Q1EeZtbjvTDwNAes8of3R5vzXJZyGaDmuPx4f2u2DsQVZaSjaynGhqEeFs8i6QZjgf8N+7tUjDzzshCgo+cPxbUpVCtEMIJNTwllKyI4drZnvcJHdAoTtB029wPjE/E7I745f3/mF04MMLmDIz4l1VO/C2U8oGyeeIZ/0XQv7/YalEADJnf+v5PMZXDZhIrWS/uWW9ZgUj7BE0R3m2VsO+660YC6qm+2NqCdLlWUygT0T7owDPgMzysqnyfwhFQyuL/SOeIdefMQONNmggRFfge9cgN1qd4LSVsV7Cn1pgXmzmD7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfNVJr2RUaSRG5LrAWW7f8mGSbGB946W6UzrZQHKR+8=;
 b=TXe+lIq+IC95UmKp3aenF75P6r3HRaCz35VzB80QIVRFYJS1aPhOTRWtAiWK2J0KXpyHuWHNmP/HhaQZelf96vkMz559wrSRHWVXtN017b4ktYCIDIVq6+KXLcYmbaromnqinFr0MZ1J1GmzIFiHjMdvgyWPfG9Sp9bAz3Q0oU4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1519.namprd10.prod.outlook.com
 (2603:10b6:300:28::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 07:46:03 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Tue, 28 Jun 2022
 07:46:03 +0000
Date: Tue, 28 Jun 2022 10:45:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] drm/bridge: Avoid uninitialized variable warning
Message-ID: <20220628074519.GL11460@kadam>
References: <Yrqm5yYVa6xMY2vq@kili>
 <20220628092609.7d0b1ea3@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628092609.7d0b1ea3@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0021.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::33)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 931bf050-d153-40c8-d816-08da58da406f
X-MS-TrafficTypeDiagnostic: MWHPR10MB1519:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XAEVVjXKAb3BFdm5Xteq7/BHOINYHQvUPOHfsRSClh1HANkiTCeGCK4zqS3oclrcd51DTamqudgY2WVdvFchCucC+7YsJkwxkp5rDo0nEqKF6+0TmUoj2mRqBHiNXLqRHAHhROFP798t8S5ajf+xqw6M/7wBvokDVJuoI8Hl1nfYGU2KRPyY3AMnmyJC2F5PBZWRMIkbkoasicdzv1kOTZbV/TqPcF6bRnznypck33u99XJNSt9zt4tMY2BcXfPGEy/5fFKtg+EzkqNqTVhM/FvLcAZVRPzjdyenzk483y/omG56MmvHjOa2/Krms2JyVxuqXA6iHUaPKgRd+hV3apk1ccnkDcnMrppn6LRpTb75FVUI32jVtB+kHuFeIt0YhP66qGVVbImKJwKNRW9hr/tEwDDmhEPLQ4Ey4XMLLiDjSC3CGAoxWgLvKg/P3IKVAdN1iOCBUsKI9AQWekXav5i9qHxEa82EScgxNUBDuOdnld5FhWJ0KIhQsJ5dMtJ/lfOYgcLbWvxvSgGYDziB/lkCuZlboO1qDNAyZstIqd8VNewBkKL+RhRkdM1mKRh6UnCXj302Ph7Bv3j4oAaCKf9Kuv9AZN9O+lIEEY2+kz5il4tRebRFK4DJsuewXPYOV8mF48XPdLj3/j2tijtPJcXrlgSgbUQSX2mzIbY6kdoQsRYB4Aky8dqffEr8RpRLE4+hUO6Vqp/SBA8Q9CuOT71OqKMR0vXyl207SVq0dPJHfXBaRmUMuMC2ADQIm/eQA41TNRFnpKRieMl/OrIrCy1BASjLqYIPy3nGaCVxYJg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(376002)(136003)(346002)(366004)(39860400002)(186003)(83380400001)(38100700002)(38350700002)(6506007)(41300700001)(6666004)(52116002)(66476007)(26005)(6512007)(9686003)(54906003)(6916009)(6486002)(478600001)(44832011)(2906002)(316002)(1076003)(66556008)(8676002)(4326008)(66946007)(5660300002)(7416002)(8936002)(33716001)(33656002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S0hPkT7ZGmBbtLBfgTi7zb50BstOy2Y525ZqYJTTMtI66XnoXcXoVlHNw1cX?=
 =?us-ascii?Q?euvLqWXCZtV9NYnQ/6zp2OPWjTpbCKtQSXi129cJ+0Kx7kEmJNagcN5NvNLS?=
 =?us-ascii?Q?9psGyIEAqO+3yz5f4RIIM3ipzhwv5mTbDHE16v3U+r/PCriEQQ1uOhgbJtSu?=
 =?us-ascii?Q?YE6fosG/0F6JJZxaJF6g9XsRqQjwE90hw85JwM/kWgHqkepaQ0p/KCW8kCZA?=
 =?us-ascii?Q?OyLVdcwCbTZ4C4TmjyFcq+k7EuBqe27ZskJ24YtBnYOMR42LWweCmsfvHea8?=
 =?us-ascii?Q?fttwfww4J2AvflumcegtPElLf0aLpxdWKSeZkpDoydZhOjkO37nxxUBmpD/P?=
 =?us-ascii?Q?vL0p9f+jcqWnA3SddAigLrO5r1r1G3TYbvMXWZi8Ds4aLXNgMGTZKc5iW+AG?=
 =?us-ascii?Q?AHccpietAzzASvtFchBox2PRxiCCFEoVXIh8zrMkfnzBO5+Sodtq3KDCSDa5?=
 =?us-ascii?Q?SnAXMu2sZ4Tqv0rH+gP1eQJ0wnAPP49GhKQ8XGS8IgW6ABko/sWNh+qALl4T?=
 =?us-ascii?Q?5bU0U6TfE0yaeN1cFxIPk+O94cZnVq89ph3JLx7Ybhjh6S+ZIuV9kdzOHODL?=
 =?us-ascii?Q?9eLpIsvlVc7E5zhekxZHymW3Y+1qNtwB5/kc3/NyR5KYqRN4Z2uOW1hDRlEM?=
 =?us-ascii?Q?j7GrGMa2hdsNux44eGLajYV3qb2SdiK0T34WsocnxFk8GTRMWmbaP0FTy+fs?=
 =?us-ascii?Q?pp5fiEzjG6EQ9/1PvH4TyV9fHrpWw3BpXZOl79FQryvf0M5QiaaJjWSanz4Z?=
 =?us-ascii?Q?9PwGoQrGitgHwHEauCTtASfHOgDZXY0asrKGBG5gbJEM76futUm4qtO/D9wc?=
 =?us-ascii?Q?6FAIW5CBpCgJEQCiDULpIZ4rJqk15xQYU29SLItxkCJp2EndReVcXVFnUxCh?=
 =?us-ascii?Q?nxgoKBqxu8telMbT8ibYxZbTiPFvMD+O3eFTN1ftqnfaTcZFm0JGK3kg9MDb?=
 =?us-ascii?Q?1KVoHDqUG/Ijod7tCFGPpIX/rZ9a4zKprxJo5Fthz9n8bRkGvQwaHNjYV2AV?=
 =?us-ascii?Q?+/4nZ2TYRSmGvaLP7v8Boi4DULSNbc26h/DmSXVgQRXSf6UgbdXQ5WI4JSZl?=
 =?us-ascii?Q?o2Ql2QwImZg+eXokCcKS3DXgsMUcP5E+aTL9koAXDvAGMxqr/3lLFy6rQCLp?=
 =?us-ascii?Q?mfrADsm8qEKLuwWasISZV9MIwxCtaWidrjhOY+bXRNGOYeyfd/qDIz8UcYke?=
 =?us-ascii?Q?MM2LEYk+ZX7mOnhSktrShwzwtWMj/0hjeAri98Pz/G+MDHi7WSCBdgc0jCWE?=
 =?us-ascii?Q?dlHV2TFSyg5k3exng9i1BjvZl31iOs4DLIrqp/rKcKMWG3ciPbbNB/Ea/yBT?=
 =?us-ascii?Q?taFLBXCV7W9DlKCk8akbis9XLbKevbupkX8gnAJrYMGH+3HpcZeXUDegEKMv?=
 =?us-ascii?Q?5xImdhrMFkXOE5ZhPZ235RvYa110w1KCMvQOj8yZsVshXktf1icvLB5MfoL5?=
 =?us-ascii?Q?GR2pz/EDppJre+tTc3nTe7kbS0ALAfrtWLSh7JFEjCKKfmY1nJ9k+KIUdPdT?=
 =?us-ascii?Q?ssyFR4sNr+w+rdnNJKXQVTUpydoHQqQl6XtT3gnLWdq1N+sc4skY8LFqTheA?=
 =?us-ascii?Q?5hwT9YXwlK1naqStqwWocXgp2NFiXH7xwfPXKjU9SaCeqyXWHeyO8nxYwrlj?=
 =?us-ascii?Q?3g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 931bf050-d153-40c8-d816-08da58da406f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 07:46:03.4939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5PBzyxXh4wlTlz+aPBDYRb+Fp8X5dYkWWJFPlClQbKsFx9CCFxUC+ITgiCLnXwWdF7oSzuX2v+sYa1/lw7scB+GHbVgjS0rlSrC1ya3Szk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1519
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-27_09:2022-06-24,
 2022-06-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206280031
X-Proofpoint-GUID: j_heSwijCGbXmdBM2V45xcQGrmvkP4Ca
X-Proofpoint-ORIG-GUID: j_heSwijCGbXmdBM2V45xcQGrmvkP4Ca
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 09:26:09AM +0200, Boris Brezillon wrote:
> On Tue, 28 Jun 2022 09:59:51 +0300
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > This works, but technically it uses "num_in_bus_fmts" before it has been
> > initialized so it leads to static checker warnings and probably KMEMsan
> > warnings at run time.  Reverse the checks so it checks for failure first
> > and then check for unsupported formats next.
> > 
> > Fixes: f32df58acc68 ("drm/bridge: Add the necessary bits to support bus format negotiation")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index e275b4ca344b..00cbde654472 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -897,10 +897,10 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
> >  							conn_state,
> >  							out_bus_fmt,
> >  							&num_in_bus_fmts);
> > -	if (!num_in_bus_fmts)
> > -		return -ENOTSUPP;
> > -	else if (!in_bus_fmts)
> > +	if (!in_bus_fmts)
> >  		return -ENOMEM;
> > +	else if (!num_in_bus_fmts)
> > +		return -ENOTSUPP;
> 
> Well, it changes the error we return when num_in_bus_fmts = 0
> && in_bus_fmts == NULL which is not an ENOMEM situation, so I'd rather
> initialize num_{in,out}_bus_fmts to 0 here.
> 

I can do that but there is no real consistency in how
->atomic_get_input_bus_fmts() functions are implemented.  Some set
*num_input_fmts = 0; before the kmalloc() and then reset it to
*num_input_fmts = 1; if the allocation succeeds.  Some just set it to
*num_input_fmts = 1 at the start.

This bug only affects the imx code like:
imx8qm_ldb_bridge_atomic_get_input_bus_fmts()
imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts

Anyway, it's not a problem to resend.

regards,
dan carpenter

