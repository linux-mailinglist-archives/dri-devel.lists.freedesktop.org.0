Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C8C32E2E2
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 08:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE0B6EAE3;
	Fri,  5 Mar 2021 07:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A686EAE3
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 07:24:09 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1257K2HL190956;
 Fri, 5 Mar 2021 07:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=uWmflhu+h7bxWvzYHXWilSvhq8wM4VlKGBtw0ZO98GE=;
 b=Co5n8q5d4nCOFDtoCmJEao6xe7PnBVNddOxTgwpaGTg131MA86/8QfODNy1pq06yV+S9
 L1likEHoa3PofpwhKYe2TpwZ3zpaUOvcm/gtxFvGwO/Pnxp4uqvsRUtLTz2oTR1PPRhO
 GDuueCMRTEV5rBBX3Hpu3rQoH416qO2f2H9bukNb1LKszcy/c0QVEtPwyvLqDwWWRjOQ
 oivhCtl2S2PA6WGQCpHIrUfVfdvToC6j7EFWpEtWjUHw/Mi7mLMJezJHxK/hlNTxLyme
 459SRTutzM4asoP9NLOzFlSXf8/+Snuj4dsGQzMHUnZxyfAC1CA31s363jgxCjhNmy5W CQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 36yeqn9f0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Mar 2021 07:24:03 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1257F9CT130759;
 Fri, 5 Mar 2021 07:24:02 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 370011wara-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Mar 2021 07:24:02 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 1257O0Hp017150;
 Fri, 5 Mar 2021 07:24:00 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 04 Mar 2021 23:23:59 -0800
Date: Fri, 5 Mar 2021 10:23:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm/msm/dp: Fix warnings reported by kbot in DP driver
Message-ID: <20210305072350.GF2222@kadam>
References: <1614907912-6880-1-git-send-email-abhinavk@codeaurora.org>
 <161492735848.1478170.885416005935439120@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161492735848.1478170.885416005935439120@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9913
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103050033
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9913
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=999 suspectscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050033
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
Cc: tanmay@codeaurora.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 04, 2021 at 10:55:58PM -0800, Stephen Boyd wrote:
> > @@ -368,44 +368,21 @@ static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
> >         int rc = 0;
> >         struct dp_debug_private *debug = container_of(dp_debug,
> >                         struct dp_debug_private, dp_debug);
> > -       struct dentry *file;
> > -       struct dentry *test_active;
> > -       struct dentry *test_data, *test_type;
> >  
> > -       file = debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
> > +       debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
> >                         debug, &dp_debug_fops);
> > -       if (IS_ERR_OR_NULL(file)) {
> > -               rc = PTR_ERR(file);
> > -               DRM_ERROR("[%s] debugfs create file failed, rc=%d\n",
> > -                                 DEBUG_NAME, rc);
> > -       }
> >  
> > -       test_active = debugfs_create_file("msm_dp_test_active", 0444,
> > +       debugfs_create_file("msm_dp_test_active", 0444,
> >                         minor->debugfs_root,
> >                         debug, &test_active_fops);
> > -       if (IS_ERR_OR_NULL(test_active)) {
> > -               rc = PTR_ERR(test_active);
> > -               DRM_ERROR("[%s] debugfs test_active failed, rc=%d\n",
> > -                                 DEBUG_NAME, rc);
> > -       }
> >  
> > -       test_data = debugfs_create_file("msm_dp_test_data", 0444,
> > +       debugfs_create_file("msm_dp_test_data", 0444,
> >                         minor->debugfs_root,
> >                         debug, &dp_test_data_fops);
> > -       if (IS_ERR_OR_NULL(test_data)) {
> > -               rc = PTR_ERR(test_data);
> > -               DRM_ERROR("[%s] debugfs test_data failed, rc=%d\n",
> > -                                 DEBUG_NAME, rc);
> > -       }
> >  
> > -       test_type = debugfs_create_file("msm_dp_test_type", 0444,
> > +       debugfs_create_file("msm_dp_test_type", 0444,
> >                         minor->debugfs_root,
> >                         debug, &dp_test_type_fops);
> > -       if (IS_ERR_OR_NULL(test_type)) {
> > -               rc = PTR_ERR(test_type);
> > -               DRM_ERROR("[%s] debugfs test_type failed, rc=%d\n",
> > -                                 DEBUG_NAME, rc);
> > -       }
> 
> Debugfs failures.

[ Update.  I misunderstood what you were saying, and initially thought
  you were critiquing the patch instead of the commit message.  The
  patch looks okay.  Probably a lot of maintainers would prefer it
  broken multiple chunks with one patch per class of warning.  But I
  already wrote this email and I love the sound of my own voice so I'm
  sending it.  - dan ]

The Smatch warning for this was that the error handling was slightly
off because debugfs_create_file() doesn't return NULL these days.  But
really these functions are not supposed to be error checked in the
normal case.

If you do a `git grep -w debugfs_create_file` there are 1472 callers
and only 192 check.  This is partly because Greg went through and did a
mass delete of error handling.

The way that debugfs works is if you fail to create a directory then
the debugfs_create_file will check if the root is an error pointer.  So
passing it "handles" errors itself.

The one time where I've seen that checking for errors is essential is
if they driver dereferences the "test_data" dentry itself.  That's
pretty uncommon.

[ So probably the commit message for this chunk should be:

  Delete unnecessary debugfs error handling

  Debugfs functions are not supposed to be checked in the normal case
  so delete this code.  Also it silences a Smatch warning that we're
  checking for NULL when these functions only return error pointers.  ]

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
