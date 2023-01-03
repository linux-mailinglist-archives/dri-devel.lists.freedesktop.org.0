Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5863265BB97
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 09:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF6410E39F;
	Tue,  3 Jan 2023 08:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808F110E39F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 08:07:52 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d4so20644510wrw.6
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jan 2023 00:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YQO0ONCN4ZgZtx9HE+Nsk3Zq7sSG4eK1JNOppC+Lx/M=;
 b=QDLW1jX26AnzUwefK2H+ja7576rr/JSkW+0K2ljLG+6oZyopCuqAABCXZ3ttcx+kDm
 rphxzjnPsFyNFkPffo8odV6vt4PbFDc9cqI+u8JDxzKceNO4WgoGsUxREIsnDUc0We7R
 v0rNKXv8unP0hz2MkdTwrgMe/35vng2kL8cLfRcU0Dfm9/reaRkj9d1dqBGii7+wxkg4
 lySdvACqMcEwQMj7koxsJKBHZbQ13IVluzaJUKU439TJovDsSQCUQJBhr0XRbaS3LGiz
 K7kxbtef9AQxASGqRMOZlYH4TmEedLmz0NryAw+5hkJzUmd+KUJDzhEgZC1FwD4lRT45
 56lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YQO0ONCN4ZgZtx9HE+Nsk3Zq7sSG4eK1JNOppC+Lx/M=;
 b=8Ho5yDPiHwINMAm4sdSdR1h+XPLP9Aqnh/nC7lBH9R06nLEaAHsOIJZIbQyBh+Ln9d
 S131bO+lCRRIkujtc9J/rUbWQPlJk3hcGRKoKcTs295PIZBZ87VHvdUmJOCD0NKL1CDZ
 +dCyD0M59rikPWmWsKjB52Ij+VE9Q4LJk+SH4zBim2BSZHYkHN1EDYtriZ6rTLhAcoRY
 1JqWs1bWkCRVPBV355cE03//asWFeGkyuyNZo6rmWfWqPVVQk15cFO+PejwlxL/YhdRp
 Jo3R8J4AOErpSQm/qIPID01XUcrqIkTGyKlaDPPNZWnHKM1IFIxR0//eBuJ0Hbk54xSL
 rACg==
X-Gm-Message-State: AFqh2kpKBlGmTio++JlCHZo4nei1RQ926wCC8y43d7wlG+7cM+SPMzF2
 S/XKhN8AefaLoUVstzUzzSw=
X-Google-Smtp-Source: AMrXdXtmMg3fso+1Q3zVGl2iFiX51Pj04IeNueZWY1axHYHgHL3dcIYuPR3TZbL9T/xOaJH0CCZjkA==
X-Received: by 2002:adf:f606:0:b0:28c:1ae0:e67f with SMTP id
 t6-20020adff606000000b0028c1ae0e67fmr10080656wrp.55.1672733270983; 
 Tue, 03 Jan 2023 00:07:50 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 i1-20020adfb641000000b002425787c5easm30768195wre.96.2023.01.03.00.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 00:07:50 -0800 (PST)
Date: Tue, 3 Jan 2023 11:07:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Michael Riesch <michael.riesch@wolfvision.net>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/rockchip: vop2: use symmetric function pair
 vop2_{create,destroy}_crtcs
Message-ID: <202301010414.gzia8KzY-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130140217.3196414-4-michael.riesch@wolfvision.net>
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
Cc: Sandy Huang <hjc@rock-chips.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, oe-kbuild-all@lists.linux.dev,
 Sascha Hauer <sha@pengutronix.de>, lkp@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Riesch/drm-rockchip-vop2-add-support-for-the-rgb-output-block/20221130-220346
base:   b7b275e60bcd5f89771e865a8239325f86d9927d
patch link:    https://lore.kernel.org/r/20221130140217.3196414-4-michael.riesch%40wolfvision.net
patch subject: [PATCH 3/5] drm/rockchip: vop2: use symmetric function pair vop2_{create,destroy}_crtcs
config: parisc-randconfig-m031-20221225
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2330 vop2_create_crtcs() error: uninitialized symbol 'possible_crtcs'.

vim +/possible_crtcs +2330 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

fb83276e59f2d6 Michael Riesch 2022-11-30  2249  static int vop2_create_crtcs(struct vop2 *vop2)
604be85547ce4d Andy Yan       2022-04-22  2250  {
604be85547ce4d Andy Yan       2022-04-22  2251  	const struct vop2_data *vop2_data = vop2->data;
604be85547ce4d Andy Yan       2022-04-22  2252  	struct drm_device *drm = vop2->drm;
604be85547ce4d Andy Yan       2022-04-22  2253  	struct device *dev = vop2->dev;
604be85547ce4d Andy Yan       2022-04-22  2254  	struct drm_plane *plane;
604be85547ce4d Andy Yan       2022-04-22  2255  	struct device_node *port;
604be85547ce4d Andy Yan       2022-04-22  2256  	struct vop2_video_port *vp;
604be85547ce4d Andy Yan       2022-04-22  2257  	int i, nvp, nvps = 0;
604be85547ce4d Andy Yan       2022-04-22  2258  	int ret;
604be85547ce4d Andy Yan       2022-04-22  2259  
604be85547ce4d Andy Yan       2022-04-22  2260  	for (i = 0; i < vop2_data->nr_vps; i++) {
604be85547ce4d Andy Yan       2022-04-22  2261  		const struct vop2_video_port_data *vp_data;
604be85547ce4d Andy Yan       2022-04-22  2262  		struct device_node *np;
604be85547ce4d Andy Yan       2022-04-22  2263  		char dclk_name[9];
604be85547ce4d Andy Yan       2022-04-22  2264  
604be85547ce4d Andy Yan       2022-04-22  2265  		vp_data = &vop2_data->vp[i];
604be85547ce4d Andy Yan       2022-04-22  2266  		vp = &vop2->vps[i];
604be85547ce4d Andy Yan       2022-04-22  2267  		vp->vop2 = vop2;
604be85547ce4d Andy Yan       2022-04-22  2268  		vp->id = vp_data->id;
604be85547ce4d Andy Yan       2022-04-22  2269  		vp->regs = vp_data->regs;
604be85547ce4d Andy Yan       2022-04-22  2270  		vp->data = vp_data;
604be85547ce4d Andy Yan       2022-04-22  2271  
604be85547ce4d Andy Yan       2022-04-22  2272  		snprintf(dclk_name, sizeof(dclk_name), "dclk_vp%d", vp->id);
604be85547ce4d Andy Yan       2022-04-22  2273  		vp->dclk = devm_clk_get(vop2->dev, dclk_name);
604be85547ce4d Andy Yan       2022-04-22  2274  		if (IS_ERR(vp->dclk)) {
604be85547ce4d Andy Yan       2022-04-22  2275  			drm_err(vop2->drm, "failed to get %s\n", dclk_name);
604be85547ce4d Andy Yan       2022-04-22  2276  			return PTR_ERR(vp->dclk);
604be85547ce4d Andy Yan       2022-04-22  2277  		}
604be85547ce4d Andy Yan       2022-04-22  2278  
604be85547ce4d Andy Yan       2022-04-22  2279  		np = of_graph_get_remote_node(dev->of_node, i, -1);
604be85547ce4d Andy Yan       2022-04-22  2280  		if (!np) {
604be85547ce4d Andy Yan       2022-04-22  2281  			drm_dbg(vop2->drm, "%s: No remote for vp%d\n", __func__, i);
604be85547ce4d Andy Yan       2022-04-22  2282  			continue;
604be85547ce4d Andy Yan       2022-04-22  2283  		}
604be85547ce4d Andy Yan       2022-04-22  2284  		of_node_put(np);
604be85547ce4d Andy Yan       2022-04-22  2285  
604be85547ce4d Andy Yan       2022-04-22  2286  		port = of_graph_get_port_by_id(dev->of_node, i);
604be85547ce4d Andy Yan       2022-04-22  2287  		if (!port) {
604be85547ce4d Andy Yan       2022-04-22  2288  			drm_err(vop2->drm, "no port node found for video_port%d\n", i);
604be85547ce4d Andy Yan       2022-04-22  2289  			return -ENOENT;
604be85547ce4d Andy Yan       2022-04-22  2290  		}
604be85547ce4d Andy Yan       2022-04-22  2291  
604be85547ce4d Andy Yan       2022-04-22  2292  		vp->crtc.port = port;
604be85547ce4d Andy Yan       2022-04-22  2293  		nvps++;
604be85547ce4d Andy Yan       2022-04-22  2294  	}
604be85547ce4d Andy Yan       2022-04-22  2295  
604be85547ce4d Andy Yan       2022-04-22  2296  	nvp = 0;
604be85547ce4d Andy Yan       2022-04-22  2297  	for (i = 0; i < vop2->registered_num_wins; i++) {
604be85547ce4d Andy Yan       2022-04-22  2298  		struct vop2_win *win = &vop2->win[i];
604be85547ce4d Andy Yan       2022-04-22  2299  		u32 possible_crtcs;
604be85547ce4d Andy Yan       2022-04-22  2300  
604be85547ce4d Andy Yan       2022-04-22  2301  		if (vop2->data->soc_id == 3566) {
604be85547ce4d Andy Yan       2022-04-22  2302  			/*
604be85547ce4d Andy Yan       2022-04-22  2303  			 * On RK3566 these windows don't have an independent
604be85547ce4d Andy Yan       2022-04-22  2304  			 * framebuffer. They share the framebuffer with smart0,
604be85547ce4d Andy Yan       2022-04-22  2305  			 * esmart0 and cluster0 respectively.
604be85547ce4d Andy Yan       2022-04-22  2306  			 */
604be85547ce4d Andy Yan       2022-04-22  2307  			switch (win->data->phys_id) {
604be85547ce4d Andy Yan       2022-04-22  2308  			case ROCKCHIP_VOP2_SMART1:
604be85547ce4d Andy Yan       2022-04-22  2309  			case ROCKCHIP_VOP2_ESMART1:
604be85547ce4d Andy Yan       2022-04-22  2310  			case ROCKCHIP_VOP2_CLUSTER1:
604be85547ce4d Andy Yan       2022-04-22  2311  				continue;
604be85547ce4d Andy Yan       2022-04-22  2312  			}
604be85547ce4d Andy Yan       2022-04-22  2313  		}
604be85547ce4d Andy Yan       2022-04-22  2314  
604be85547ce4d Andy Yan       2022-04-22  2315  		if (win->type == DRM_PLANE_TYPE_PRIMARY) {
604be85547ce4d Andy Yan       2022-04-22  2316  			vp = find_vp_without_primary(vop2);
604be85547ce4d Andy Yan       2022-04-22  2317  			if (vp) {
604be85547ce4d Andy Yan       2022-04-22  2318  				possible_crtcs = BIT(nvp);
604be85547ce4d Andy Yan       2022-04-22  2319  				vp->primary_plane = win;
604be85547ce4d Andy Yan       2022-04-22  2320  				nvp++;
604be85547ce4d Andy Yan       2022-04-22  2321  			} else {
604be85547ce4d Andy Yan       2022-04-22  2322  				/* change the unused primary window to overlay window */
604be85547ce4d Andy Yan       2022-04-22  2323  				win->type = DRM_PLANE_TYPE_OVERLAY;
604be85547ce4d Andy Yan       2022-04-22  2324  			}
604be85547ce4d Andy Yan       2022-04-22  2325  		}
604be85547ce4d Andy Yan       2022-04-22  2326  
604be85547ce4d Andy Yan       2022-04-22  2327  		if (win->type == DRM_PLANE_TYPE_OVERLAY)
604be85547ce4d Andy Yan       2022-04-22  2328  			possible_crtcs = (1 << nvps) - 1;

What about if win->type is not equal to either DRM_PLANE_TYPE_PRIMARY or
DRM_PLANE_TYPE_OVERLAY?  That's what the checker is worried about.

604be85547ce4d Andy Yan       2022-04-22  2329  
604be85547ce4d Andy Yan       2022-04-22 @2330  		ret = vop2_plane_init(vop2, win, possible_crtcs);
                                                                                                 ^^^^^^^^^^^^^^

604be85547ce4d Andy Yan       2022-04-22  2331  		if (ret) {
604be85547ce4d Andy Yan       2022-04-22  2332  			drm_err(vop2->drm, "failed to init plane %s: %d\n",
604be85547ce4d Andy Yan       2022-04-22  2333  				win->data->name, ret);
604be85547ce4d Andy Yan       2022-04-22  2334  			return ret;
604be85547ce4d Andy Yan       2022-04-22  2335  		}
604be85547ce4d Andy Yan       2022-04-22  2336  	}
604be85547ce4d Andy Yan       2022-04-22  2337  
604be85547ce4d Andy Yan       2022-04-22  2338  	for (i = 0; i < vop2_data->nr_vps; i++) {

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


