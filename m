Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24462D9F86
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 19:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E9C6E0E8;
	Mon, 14 Dec 2020 18:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D276E0E8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 18:50:10 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BEInccI181529;
 Mon, 14 Dec 2020 18:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=BIm5PIPglvF2cICEPRO4ex85AH7+bQdnf4QqxsIpViI=;
 b=lEfjAZNPEByjC75YmDDSuPs8T2OcRafcG0XgBHBRIUKAiPzPLe/wtjg8DPAeG4vVGiBs
 oSas9IfI5/rT3DxtUBATn2hyjVLqaVj6BQely1Ve/kablG9nM0lJgl+lhnYQlOKOVSIo
 QpP/rfFm00+sTsw5RMTY+mFcHOMLcyMSQd4a9ZL1HGRkiRo2GWJhPt1jVwsbhgGSoWys
 njRnoup3zOKd/xVBJ71fPBApoZfL9ONt6J9ZH3bwEuubgL6AAnXmkjqAONn0GWCR+fqq
 XFMGWOhs2FCX69atI9L2G1s4ifY/S1TjCg7Uts3u2ARjBFHRpqIsgSSm4ZTiCqCi4QQE aw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 35cntkxtwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Dec 2020 18:49:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BEIe5id165290;
 Mon, 14 Dec 2020 18:49:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 35d7suy61g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 18:49:45 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BEInSC9030958;
 Mon, 14 Dec 2020 18:49:28 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 14 Dec 2020 10:49:27 -0800
Date: Mon, 14 Dec 2020 21:49:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Philip Li <philip.li@intel.com>
Subject: Re: [kbuild-all] Re: [PATCH v2 2/2] drm: automatic legacy gamma
 support
Message-ID: <20201214184917.GA17052@kadam>
References: <20201208135759.451772-3-tomi.valkeinen@ti.com>
 <202012110104.ZPkkhoVT-lkp@intel.com>
 <8c0fa5f2-9751-ca11-686d-8876a3a9d633@ti.com>
 <X9OFODh+xRWrFTcf@intel.com> <20201212085445.GC31899@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201212085445.GC31899@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012140123
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
Cc: Paul Cercueil <paul@crapouillou.net>, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, Sandy Huang <hjc@rock-chips.com>,
 David Airlie <airlied@linux.ie>, Philippe Cornu <philippe.cornu@st.com>,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Yannick Fertre <yannick.fertre@st.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 12, 2020 at 04:54:45PM +0800, Philip Li wrote:
> On Fri, Dec 11, 2020 at 04:42:00PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Fri, Dec 11, 2020 at 01:24:49PM +0200, Tomi Valkeinen wrote:
> > > On 10/12/2020 20:06, kernel test robot wrote:
> > > > Hi Tomi,
> > > > =

> > > > I love your patch! Perhaps something to improve:
> > > > =

> > > > [auto build test WARNING on drm-intel/for-linux-next]
> > > > [also build test WARNING on linus/master v5.10-rc7]
> > > > [cannot apply to drm-tip/drm-tip anholt/for-next next-20201210]
> > > > [If your patch is applied to the wrong git tree, kindly drop us a n=
ote.
> > > > And when submitting patch, we suggest to use '--base' as documented=
 in
> > > > https://git-scm.com/docs/git-format-patch ]
> > > > =

> > > > url:    https://github.com/0day-ci/linux/commits/Tomi-Valkeinen/drm=
-fix-and-cleanup-legacy-gamma-support/20201208-215917 =

> > > > base:   git://anongit.freedesktop.org/drm-intel for-linux-next
> > > > config: i386-randconfig-m021-20201209 (attached as .config)
> > > > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > > > =

> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > =

> > > > New smatch warnings:
> > > > drivers/gpu/drm/drm_color_mgmt.c:307 drm_crtc_legacy_gamma_set() er=
ror: potential null dereference 'blob'.  (drm_property_create_blob returns =
null)
> > > =

> > > I don't see how this could happen. There's no code path I see where d=
rm_property_create_blob could
> > > return null...
> > =

> > IIRC we've received multiple similar nonsense reports from lkp, but
> > no explanation why it thinks it could ever be null. Hmm, maybe there
> > is a codepath somewhere that has a null check on the return value?
> hi Dan, can you help on this to share some idea?
> =

> The original report is at
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org/thread/F3MVB=
RGF2R4URBNLNY3GMTSDZUCBX6RF/ =


Thanks, Philip.  I've pushed a fix for this.

It didn't show up if you had the cross function DB built, so it's not
something I would see in my testing.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
