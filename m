Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 414712DBC00
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 08:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC3589C2A;
	Wed, 16 Dec 2020 07:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B1189C2A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 07:37:10 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BG7Xg1P042176;
 Wed, 16 Dec 2020 07:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=bo/uD/tZH7NFSMa3YZ2tF+HViSGoGxlRdqNJ9m6VMEc=;
 b=hiubOBAkWt2YOleDXwoXRD/wDeF04WjYIjrsENyU8CqpCrQDsa0zzP5KINI2GpJo4i/R
 5y6L60oELIp7dnPKKCWs2j6YU/x5P+Nx5UgLrJP5SXTz6ALG9IIXvf2ecd5SdXTBIrSO
 /Juik0iXDjj2sNgEgKUgiOc2p9QVEw5/HPLzry4doF2HMC6Ika63PE/p/IsgOmleMaHv
 H6D5xXcaxY7lrV417+pbcLgvLXu9FUqI9S3kCzR1DCDGmqz/zvzJHZ65pk4R9sKAg9Az
 kxp8+h4eGdgK3nkqCon+xrKm9Q8iro7v+OCUmOdeaVo6q0rkMRv9zeAP/ytcbXcHBkuw vA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 35ckcbesjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Dec 2020 07:36:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BG7UBOD012430;
 Wed, 16 Dec 2020 07:34:31 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 35d7sxekrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 07:34:31 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BG7YClx003898;
 Wed, 16 Dec 2020 07:34:12 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 15 Dec 2020 23:34:12 -0800
Date: Wed, 16 Dec 2020 10:34:01 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Philip Li <philip.li@intel.com>
Subject: Re: [kbuild-all] Re: [PATCH v2 2/2] drm: automatic legacy gamma
 support
Message-ID: <20201216073400.GF2831@kadam>
References: <20201208135759.451772-3-tomi.valkeinen@ti.com>
 <202012110104.ZPkkhoVT-lkp@intel.com>
 <8c0fa5f2-9751-ca11-686d-8876a3a9d633@ti.com>
 <X9OFODh+xRWrFTcf@intel.com> <20201212085445.GC31899@intel.com>
 <20201214184917.GA17052@kadam> <20201216010650.GA330@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216010650.GA330@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160046
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160047
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

On Wed, Dec 16, 2020 at 09:06:50AM +0800, Philip Li wrote:
> On Mon, Dec 14, 2020 at 09:49:17PM +0300, Dan Carpenter wrote:
> > On Sat, Dec 12, 2020 at 04:54:45PM +0800, Philip Li wrote:
> > > On Fri, Dec 11, 2020 at 04:42:00PM +0200, Ville Syrj=E4l=E4 wrote:
> > > > On Fri, Dec 11, 2020 at 01:24:49PM +0200, Tomi Valkeinen wrote:
> > > > > On 10/12/2020 20:06, kernel test robot wrote:
> > > > > > Hi Tomi,
> > > > > > =

> > > > > > I love your patch! Perhaps something to improve:
> > > > > > =

> > > > > > [auto build test WARNING on drm-intel/for-linux-next]
> > > > > > [also build test WARNING on linus/master v5.10-rc7]
> > > > > > [cannot apply to drm-tip/drm-tip anholt/for-next next-20201210]
> > > > > > [If your patch is applied to the wrong git tree, kindly drop us=
 a note.
> > > > > > And when submitting patch, we suggest to use '--base' as docume=
nted in
> > > > > > https://git-scm.com/docs/git-format-patch  ]
> > > > > > =

> > > > > > url:    https://github.com/0day-ci/linux/commits/Tomi-Valkeinen=
/drm-fix-and-cleanup-legacy-gamma-support/20201208-215917  =

> > > > > > base:   git://anongit.freedesktop.org/drm-intel for-linux-next
> > > > > > config: i386-randconfig-m021-20201209 (attached as .config)
> > > > > > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > > > > > =

> > > > > > If you fix the issue, kindly add following tag as appropriate
> > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > =

> > > > > > New smatch warnings:
> > > > > > drivers/gpu/drm/drm_color_mgmt.c:307 drm_crtc_legacy_gamma_set(=
) error: potential null dereference 'blob'.  (drm_property_create_blob retu=
rns null)
> > > > > =

> > > > > I don't see how this could happen. There's no code path I see whe=
re drm_property_create_blob could
> > > > > return null...
> > > > =

> > > > IIRC we've received multiple similar nonsense reports from lkp, but
> > > > no explanation why it thinks it could ever be null. Hmm, maybe there
> > > > is a codepath somewhere that has a null check on the return value?
> > > hi Dan, can you help on this to share some idea?
> > > =

> > > The original report is at
> > > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org/thread/F=
3MVBRGF2R4URBNLNY3GMTSDZUCBX6RF/  =

> > =

> > Thanks, Philip.  I've pushed a fix for this.
> Thanks Dan for this, we will pack the new code to run in the robot.
> =

> > =

> > It didn't show up if you had the cross function DB built, so it's not
> > something I would see in my testing.
> Got it, do you recommend this "cross function DB" is necessary for us to
> setup or not a must?

It's not a must.  Smatch is supposed to work fine without it.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
