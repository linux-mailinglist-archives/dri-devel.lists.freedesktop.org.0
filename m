Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A525922586E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3297389A4B;
	Mon, 20 Jul 2020 07:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F3C899F2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 07:27:00 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06K7QpNU158272;
 Mon, 20 Jul 2020 07:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=yffP6ggWuXETh4Kxto7Itnc5d0YPWi2QmaKUiNSo2X4=;
 b=YamWtYbzqbVoSMKa7Ni1m3a0Q9nWdJ3llNFgHKZVogaIbF14YIYBTvGYK5c1K6LxhKx0
 9JmWRmt1hsISblHpiDk6Dj69gDqGNrtRKh2sLbYEtWKuruwx9jHXw4ogNPzeTCNtmR3/
 VHMAWdkd/jGPttNtFRpEO3l1OFoT8mS4+17jZem6wjMYNjA/inwoIKOLuSiQH0mRkIJT
 klxk3tkE5IBRp7cYvlYoxKN7e3OfG4sNeMzgEZj/QMwgDkB5canmpvHyHvtFpVUhyvol
 mLYuCBc/95ElX+3AVqoNzksXKKE46jVYf2yWzNLv9iGmsCHKyNk1WjqwJ7lcthPA5Vbm fw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 32brgr55qw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Jul 2020 07:26:51 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06K7E5ar124404;
 Mon, 20 Jul 2020 07:22:44 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 32cvj9a74x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 07:22:44 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06K7MhTK031849;
 Mon, 20 Jul 2020 07:22:43 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 20 Jul 2020 07:22:42 +0000
Date: Mon, 20 Jul 2020 10:22:37 +0300
From: <dan.carpenter@oracle.com>
To: paul@crapouillou.net
Subject: [bug report] drm/ingenic: Add support for the IPU
Message-ID: <20200720072237.GA8232@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=3 spamscore=0
 mlxlogscore=930 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007200053
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=3 adultscore=0 clxscore=1015 mlxlogscore=929
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007200055
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Paul Cercueil,

The patch fc1acf317b01: "drm/ingenic: Add support for the IPU" from
Jul 16, 2020, leads to the following static checker warning:

	drivers/gpu/drm/ingenic/ingenic-drm-drv.c:232 ingenic_drm_crtc_atomic_check()
	error: potentially dereferencing uninitialized 'ipu_state'.

drivers/gpu/drm/ingenic/ingenic-drm-drv.c
   197  static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
   198                                           struct drm_crtc_state *state)
   199  {
   200          struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
   201          struct drm_plane_state *f1_state, *f0_state, *ipu_state;
   202          long rate;
   203  
   204          if (!drm_atomic_crtc_needs_modeset(state))
   205                  return 0;
   206  
   207          if (state->mode.hdisplay > priv->soc_info->max_width ||
   208              state->mode.vdisplay > priv->soc_info->max_height)
   209                  return -EINVAL;
   210  
   211          rate = clk_round_rate(priv->pix_clk,
   212                                state->adjusted_mode.clock * 1000);
   213          if (rate < 0)
   214                  return rate;
   215  
   216          if (priv->soc_info->has_osd) {
   217                  f1_state = drm_atomic_get_plane_state(state->state, &priv->f1);
   218                  f0_state = drm_atomic_get_plane_state(state->state, &priv->f0);
   219  
   220                  if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && priv->ipu_plane) {

Do we need to check both the CONFIG and the priv->ipu_plane or would it
be sufficient to just check if (priv->ipu_plane) {?

   221                          ipu_state = drm_atomic_get_plane_state(state->state, priv->ipu_plane);
   222  
   223                          /* IPU and F1 planes cannot be enabled at the same time. */
   224                          if (f1_state->fb && ipu_state->fb) {
   225                                  dev_dbg(priv->dev, "Cannot enable both F1 and IPU\n");
   226                                  return -EINVAL;
   227                          }
   228                  }
   229  
   230                  /* If all the planes are disabled, we won't get a VBLANK IRQ */
   231                  priv->no_vblank = !f1_state->fb && !f0_state->fb &&
   232                                    !(priv->ipu_plane && ipu_state->fb);
                                            ^^^^^^^^^^^^^^^
Because here we're only checking "priv->ipu_plane".

   233          }
   234  
   235          return 0;
   236  }

regards,
dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
