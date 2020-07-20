Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9C222586D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD30F899DE;
	Mon, 20 Jul 2020 07:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268EF899DE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 07:27:00 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06K7Qod7158107;
 Mon, 20 Jul 2020 07:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Q4QOV6E4cEiZJl8LoBokQO1NalrOQTTvJSBeRpTAAxw=;
 b=j+nzyVrNGO/I3G3PGeaGLoHi38ux8RAwhEAm1wGaQ0UvCST5LRrmaxFu05FkJiyhroT0
 2+RAy0Uu82kX9nJ3XuXGElkhnx6354aknn5qMkuvKnouq9579gNbsUn4fVf6HfnVzIKD
 3odvHKnnvD20uWRbV9T+1RsYZ3ovdfa7Vd3uYdBu6j/hX11+OhLclE4nDgINR1ROba+l
 1y73wJZpDKmuC/T9dgpYHyRN20PXEdo9IF6Kh0KByXwProC+8/mH+smlYSR+62mdzQJ9
 mMcX1kBKXEzoOYKStxbiAehiqrhqSFCYOskpK7vw1vJ4rzyzRW+mhNCZGwpD7qy6WDQN 3Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 32brgr560g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Jul 2020 07:26:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06K7MuFw129022;
 Mon, 20 Jul 2020 07:24:51 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 32d68g2npg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 07:24:51 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06K7OncW022688;
 Mon, 20 Jul 2020 07:24:50 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 20 Jul 2020 00:24:49 -0700
Date: Mon, 20 Jul 2020 10:24:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: paul@crapouillou.net
Subject: Re: [bug report] drm/ingenic: Add support for the IPU
Message-ID: <20200720072444.GI2571@kadam>
References: <20200720072237.GA8232@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720072237.GA8232@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 phishscore=0 mlxlogscore=999 suspectscore=1 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200054
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=1 adultscore=0 clxscore=1015 mlxlogscore=999
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

On Mon, Jul 20, 2020 at 10:22:37AM +0300, dan.carpenter@oracle.com wrote:
> Hello Paul Cercueil,
> 
> The patch fc1acf317b01: "drm/ingenic: Add support for the IPU" from
> Jul 16, 2020, leads to the following static checker warning:
> 
> 	drivers/gpu/drm/ingenic/ingenic-drm-drv.c:232 ingenic_drm_crtc_atomic_check()
> 	error: potentially dereferencing uninitialized 'ipu_state'.
> 
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>    197  static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
>    198                                           struct drm_crtc_state *state)
>    199  {
>    200          struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
>    201          struct drm_plane_state *f1_state, *f0_state, *ipu_state;
>    202          long rate;
>    203  
>    204          if (!drm_atomic_crtc_needs_modeset(state))
>    205                  return 0;
>    206  
>    207          if (state->mode.hdisplay > priv->soc_info->max_width ||
>    208              state->mode.vdisplay > priv->soc_info->max_height)
>    209                  return -EINVAL;
>    210  
>    211          rate = clk_round_rate(priv->pix_clk,
>    212                                state->adjusted_mode.clock * 1000);
>    213          if (rate < 0)
>    214                  return rate;
>    215  
>    216          if (priv->soc_info->has_osd) {
>    217                  f1_state = drm_atomic_get_plane_state(state->state, &priv->f1);
>    218                  f0_state = drm_atomic_get_plane_state(state->state, &priv->f0);

drivers/gpu/drm/ingenic/ingenic-drm-drv.c:224 ingenic_drm_crtc_atomic_check() error: 'f1_state' dereferencing possible ERR_PTR()
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:224 ingenic_drm_crtc_atomic_check() error: 'ipu_state' dereferencing possible ERR_PTR()
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:231 ingenic_drm_crtc_atomic_check() error: 'f1_state' dereferencing possible ERR_PTR()
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:231 ingenic_drm_crtc_atomic_check() error: 'f0_state' dereferencing possible ERR_PTR()
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:232 ingenic_drm_crtc_atomic_check() error: 'ipu_state' dereferencing possible ERR_PTR()

Also Smatch complains that these need error checking.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
