Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC23307948
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 16:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675CD6E978;
	Thu, 28 Jan 2021 15:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542C96E978
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 15:15:45 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10SFDxIW112824;
 Thu, 28 Jan 2021 15:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=MsQ7ftbtbqZUBrl4lNec+ukn/EWP/aTSC+PR3mkKyBU=;
 b=ufETMjRyMAtLep4DOPQp1rceJOeUf+MwUriOaPq+DuR8tsjCnIaziXDpxZmd7e99N+s6
 kHBxm2ahxr01rrQIVbNWsu3Xepz/RL0m5x2SPUfnVqCd33JXba0ctusYdwOmxXVWgBj8
 4IZlgDUI09A2GNCGau00nsUsIkaDdHQCPxUCKPl512ZF8F9upS+vXF5tCex49TGmK5vj
 4jCEwqzH6zWideO69MbAzOf7UxDyqgFYMeML1sDbhnPC6VN9yVXd/r22EScLOCSEUaVR
 Nw1K/gZVyc7BFuSGrxyJYj5w5R1PFm3Pz59HeHhMiq0jcKWp38vY0CyKpCX4rKmcArbF HQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 368b7r4mn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 15:15:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10SFAESf071867;
 Thu, 28 Jan 2021 15:13:31 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 368wr0ey6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 15:13:31 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10SFDGvg024584;
 Thu, 28 Jan 2021 15:13:17 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 28 Jan 2021 07:13:15 -0800
Date: Thu, 28 Jan 2021 18:13:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Kari Argillander <kari.argillander@gmail.com>
Subject: Re: [PATCH v10] staging: fbtft: add tearing signal detect
Message-ID: <20210128151306.GG2696@kadam>
References: <1611754972-151016-1-git-send-email-zhangxuezhi3@gmail.com>
 <20210127223222.3lavtl3roc4cabso@kari-VirtualBox>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210127223222.3lavtl3roc4cabso@kari-VirtualBox>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280078
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280078
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 mh12gx2825@gmail.com, gregkh@linuxfoundation.org,
 oliver.graute@kococonnector.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sbrivio@redhat.com,
 Carlis <zhangxuezhi3@gmail.com>, colin.king@canonical.com,
 zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 28, 2021 at 12:32:22AM +0200, Kari Argillander wrote:
> On Wed, Jan 27, 2021 at 09:42:52PM +0800, Carlis wrote:
> > @@ -82,6 +111,33 @@ enum st7789v_command {
> >   */
> >  static int init_display(struct fbtft_par *par)
> >  {
> > +	int rc;
> > +	struct device *dev = par->info->device;
> > +
> > +	par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0, GPIOD_IN);
> > +	if (IS_ERR(par->gpio.te)) {
> > +		rc = PTR_ERR(par->gpio.te);
> > +		dev_err(par->info->device, "Failed to request te gpio: %d\n", rc);
> > +		return rc;
> > +	}
> 
> You request with optinal and you still want to error out? We could just
> continue and not care about that error. User will be happier if device
> still works somehow.
> 

Carlis tried that approach in previous versions.  See the discussion
about -EPROBEi_DEFER.

That's not the right way to think about it anyway.  It's optional but
the user *chose* to enable it so if an error occurs then it's still an
error and should be treated like an error.  The user should fix the
error or disable the feature if they want to continue.

There are lots of places in the kernel where the error handling could
be written to try continue but in a crippled state.  It's not the right
approach.  Over engineering like that just leads to bugs.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
