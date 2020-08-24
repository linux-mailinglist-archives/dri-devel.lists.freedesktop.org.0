Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1442B24FCE2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 13:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060FD6E204;
	Mon, 24 Aug 2020 11:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362126E203
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 11:43:56 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07OBhj8d022877;
 Mon, 24 Aug 2020 11:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ENhKfqoc7RZ3alnPL8Dsu7Y/MFA2nBwzyI61xAxBZi4=;
 b=QhwJdMUF6JyInRnY45/J0LoShMw9LuxGql3s61iV0Ny1+ktHzIfRIuwcIDjOFyiTxHc9
 w+/0MV0Y/Kpu9TCQ0YVlWYEeI0l8HdljfRxJJUpqI8cCGaesLFrhySiXA2feHc1Sc4tp
 hv2eOoF5x6KzAWhjATXYJF9igy7SAD+XCJgLdmqCF2oFtr0zfuKnj84XKbMcFWldxvG/
 fgV7yldus/Hv247dY7pKTOPmkLjB3lhsPYydNhQwNZ4hPQTVCUt3Ldng6rkgFsJl4/xM
 Vy9v14cZx36ClscwKgVZmd1i43uucWAwgUtTq5//XOMLGSV8pIjMwLjFEVc9xULz/hTO Kw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 333dbrm1sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 24 Aug 2020 11:43:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07OBfE5Q152972;
 Mon, 24 Aug 2020 11:43:44 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 333r9h3a14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2020 11:43:44 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07OBhgEU009699;
 Mon, 24 Aug 2020 11:43:42 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 24 Aug 2020 04:43:41 -0700
Date: Mon, 24 Aug 2020 14:43:32 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v4 2/2] staging: android: Remove BUG from ion_system_heap.c
Message-ID: <20200824114332.GN5493@kadam>
References: <cover.1598023523.git.tomersamara98@gmail.com>
 <a39407f84031eaeed5e65a7aab515a079edf5fcc.1598023524.git.tomersamara98@gmail.com>
 <3eba90dc-128f-49da-41a6-81494653d535@infradead.org>
 <20200824112457.GI1793@kadam> <20200824112708.GM5493@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824112708.GM5493@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9722
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008240093
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9722
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008240093
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tomer Samara <tomersamara98@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Joel Fernandes <joel@joelfernandes.org>,
 Riley Andrews <riandrews@android.com>, Martijn Coenen <maco@android.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Hridya Valsaraju <hridya@google.com>, Laura Abbott <labbott@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 24, 2020 at 02:27:08PM +0300, Dan Carpenter wrote:
> On Mon, Aug 24, 2020 at 02:24:57PM +0300, Dan Carpenter wrote:
> > On Fri, Aug 21, 2020 at 09:25:26AM -0700, Randy Dunlap wrote:
> > > On 8/21/20 8:28 AM, Tomer Samara wrote:
> > > > Remove BUG() from ion_sytem_heap.c
> > > > 
> > > > this fix the following checkpatch issue:
> > > > Avoid crashing the kernel - try using WARN_ON &
> > > > recovery code ratherthan BUG() or BUG_ON().
> > > > 
> > > > Signed-off-by: Tomer Samara <tomersamara98@gmail.com>
> > > > ---
> > > >  drivers/staging/android/ion/ion_system_heap.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/staging/android/ion/ion_system_heap.c b/drivers/staging/android/ion/ion_system_heap.c
> > > > index eac0632ab4e8..00d6154aec34 100644
> > > > --- a/drivers/staging/android/ion/ion_system_heap.c
> > > > +++ b/drivers/staging/android/ion/ion_system_heap.c
> > > > @@ -30,7 +30,7 @@ static int order_to_index(unsigned int order)
> > > >  	for (i = 0; i < NUM_ORDERS; i++)
> > > >  		if (order == orders[i])
> > > >  			return i;
> > > > -	BUG();
> > > > +	/* This is impossible. */
> > > >  	return -1;
> > > >  }
> > > 
> > > Hi,
> > > Please explain why this is impossible.
> > > 
> > > If some caller calls order_to_index(5), it will return -1, yes?
> > > 
> > 
> > I was happy enough with the comment as-is given that I suggested it.
> > But an alternative comment could be "/* This is impossible.
> > We always pass valid values to this function. */
> 
> Another option is to just change the BUG_ON() to a WARN_ON().  I feel
> like that communicates the same thing but makes checkpatch happy.

Actually earlier Greg pointed out that some systems have panic on warn
so WARN_ON() doesn't work.  Just add the comment.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
