Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B952575FA
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 11:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC3189BE8;
	Mon, 31 Aug 2020 09:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F84389BE8
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 09:07:11 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07V8Thlv074362;
 Mon, 31 Aug 2020 09:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=pFDVUiM8+dLzoVvHzxDqp4okJ2m2dQv38JpZsTyI9to=;
 b=0FOm5Sap5mFqRRpIsP6/wTloKF3UnDpmAfxZxzy3+V542pPtCYCec6QAHyBaib9MYBHX
 zIpTUWcgOdsGseHH2loDv0FoPlnwrw7ffWTkCJNtVdalAKBY10eHSMR6kvytPuBndl0h
 wNn5dAbxg95x6ZUs8uwHrElvFtkxf5pMvjbo6ObeQaFhBbxaT+0oI/KjJnW2LrufiFXS
 r2bnaNI4xr3TfLekNRdHbvsUaRixsbMEvNTUOJpE6XUl3dZof71s/bjJIJKyWjFPkGox
 uu/oMQnrQMk8MGd7ZK0BGTFUL0riz/++FcYul9zXo2BBd+jLQsPUtzQFVOru37nFa19Z pw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 337qrhc8n0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 31 Aug 2020 09:07:03 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07V8TeWo170928;
 Mon, 31 Aug 2020 09:07:03 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 3380xuf31s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Aug 2020 09:07:03 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 07V971Gu021551;
 Mon, 31 Aug 2020 09:07:02 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 31 Aug 2020 02:07:01 -0700
Date: Mon, 31 Aug 2020 12:06:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [bug report] drm/dp: annotate implicit fall throughs
Message-ID: <20200831090655.GA8321@kadam>
References: <20200825112759.GA287100@mwanda>
 <87v9h33xlv.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87v9h33xlv.fsf@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9729
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008310051
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9729
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008310051
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
Cc: malat@debian.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 28, 2020 at 12:53:32PM +0300, Jani Nikula wrote:
> On Tue, 25 Aug 2020, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > Hello Mathieu Malaterre,
> >
> > The patch e9c0c874711b: "drm/dp: annotate implicit fall throughs"
> > from Jan 14, 2019, leads to the following static checker warning:
> >
> > 	drivers/gpu/drm/drm_dp_helper.c:495 drm_dp_downstream_max_bpc()
> > 	warn: ignoring unreachable code.
> >
> > drivers/gpu/drm/drm_dp_helper.c
> >    467  int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> >    468                                const u8 port_cap[4])
> >    469  {
> >    470          int type = port_cap[0] & DP_DS_PORT_TYPE_MASK;
> >    471          bool detailed_cap_info = dpcd[DP_DOWNSTREAMPORT_PRESENT] &
> >    472                  DP_DETAILED_CAP_INFO_AVAILABLE;
> >    473          int bpc;
> >    474  
> >    475          if (!detailed_cap_info)
> >    476                  return 0;
> >    477  
> >    478          switch (type) {
> >    479          case DP_DS_PORT_TYPE_VGA:
> >    480          case DP_DS_PORT_TYPE_DVI:
> >    481          case DP_DS_PORT_TYPE_HDMI:
> >    482          case DP_DS_PORT_TYPE_DP_DUALMODE:
> >    483                  bpc = port_cap[2] & DP_DS_MAX_BPC_MASK;
> >                                             ^^^^^^^^^^^^^^^^^^
> > This is 0x3.
> >
> >    484  
> >    485                  switch (bpc) {
> >    486                  case DP_DS_8BPC:
> >    487                          return 8;
> >    488                  case DP_DS_10BPC:
> >    489                          return 10;
> >    490                  case DP_DS_12BPC:
> >    491                          return 12;
> >    492                  case DP_DS_16BPC:
> >    493                          return 16;
> >    494                  }
> >    495                  fallthrough;
> >
> > This fallthrough is impossible.  Probably the way to work around the
> > bogus warning is the change the fallthough to "return 0; /* impossible */"
> > otherwise the fallthrough is sort of misleading...
> 
> Won't that be unreachable as well?
> 
> Maybe just add the default label to switch (bpc)?

A default switch is going to be unreachable as well...  But adding a
return 0 is the older more traditional ways way of marking these so
people and checkers are used to it.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
