Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A17793796
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83D810E5A7;
	Wed,  6 Sep 2023 09:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D310310E1A5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:00:27 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2bceca8a41aso52501461fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 02:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693990826; x=1694595626; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YNR9tc9V8X845jqkup6Rb0/4lLzAX/3+ihyBS0Kt6/Y=;
 b=bmRRNWz8DRPFfkrEmLlB0DSTHnj5JlW1o5jMceQx3rGoyJpqFmEya0lqLZTzzZrUrG
 UcOHzeW0yvbDst3EzuZRjRdo3oPevDFlfl4vI4q4mAddrLUVArrZ5Utjf+wzGj7OhUOa
 IK0+nJvzlZo/N5FqYqFYVidKG3O8fD3QxJHSPVg/hBCqfaW3nC/xvaTS+wWN2pfOOUzl
 vC9IQ03RrcE5X4UzPerEHFq8R/1PJwQfv41XdkyAS/41H0ScAsyxHKvyzoSl+XKUU9Ck
 PjjTKf61+BSrjtpUPLuZ8IPIyBwHaZWu9j6s6YxRUMxaaZAOwkC37Q+W7nKwI0VtY5ur
 uI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693990826; x=1694595626;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YNR9tc9V8X845jqkup6Rb0/4lLzAX/3+ihyBS0Kt6/Y=;
 b=UGPRaeehgyl6QqAKrwq0a58QQIwzxeEKmJ1LIn/1dpKeRDkD+RAUQvBuLeTmW48Sum
 79hY42YDthfa4rDsKBD74QjfBaKL5W+x2UQTWRcrpH4pOTb2zhoFM11Wmq1bfm8EhmqD
 nV7rHwyTMZ6pe4l5gwIv/fhM5Yas0O7Qg3YxjkHnNizpxUcLgROSaAw9eDkEiskVn3J6
 ovDssCQy+3g0WD1Iq1aO5BYk50PwfsicfTkni2ICIr+GVM9mjkcyp9Klf2RchauV6NgM
 e70YWVDEzPsV1+QlMYzjJqgbVWw5CbV0V0t1IsXmn2jbRe3BGpSjeloQBqsW1cH1BFZL
 zDsw==
X-Gm-Message-State: AOJu0Yx872oHdD8HKbApNpqWHIR50T9uj7zItodTdEBS3BTFQQAe+bM6
 0iT4/iyxmSfcAQ+xi2Fw5+5o4R7BXMt0RCvAjXs=
X-Google-Smtp-Source: AGHT+IENm9l0/7Lf8ftURYcnkrJwmqqxmbkhcKp46xPYLirM/SwAyy6pdxjcREnyxJKZ0XEvZQ9wGA==
X-Received: by 2002:a2e:3a13:0:b0:2bc:ed75:1ba with SMTP id
 h19-20020a2e3a13000000b002bced7501bamr1572102lja.16.1693990825833; 
 Wed, 06 Sep 2023 02:00:25 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 y11-20020a1c4b0b000000b003fe2b081661sm22199669wma.30.2023.09.06.02.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 02:00:25 -0700 (PDT)
Date: Wed, 6 Sep 2023 12:00:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v5 3/6] drm/i915/panelreplay: Initializaton
 and compute config for panel replay
Message-ID: <31382522-4aaf-473e-a459-0368ab4cc1e2@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905073551.958368-4-animesh.manna@intel.com>
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
Cc: jani.nikula@intel.com, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Animesh,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Animesh-Manna/drm-panelreplay-dpcd-register-definition-for-panelreplay/20230905-154811
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230905073551.958368-4-animesh.manna%40intel.com
patch subject: [Intel-gfx] [PATCH v5 3/6] drm/i915/panelreplay: Initializaton and compute config for panel replay
config: i386-randconfig-141-20230906 (https://download.01.org/0day-ci/archive/20230906/202309060644.uWp5zW4i-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230906/202309060644.uWp5zW4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309060644.uWp5zW4i-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_dp.c:3779 intel_dp_vsc_sdp_pack() warn: was && intended here instead of ||?

vim +3779 drivers/gpu/drm/i915/display/intel_dp.c

03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3755  static ssize_t intel_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3756  				     struct dp_sdp *sdp, size_t size)
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3757  {
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3758  	size_t length = sizeof(struct dp_sdp);
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3759  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3760  	if (size < length)
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3761  		return -ENOSPC;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3762  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3763  	memset(sdp, 0, size);
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3764  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3765  	/*
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3766  	 * Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3767  	 * VSC SDP Header Bytes
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3768  	 */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3769  	sdp->sdp_header.HB0 = 0; /* Secondary-Data Packet ID = 0 */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3770  	sdp->sdp_header.HB1 = vsc->sdp_type; /* Secondary-data Packet Type */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3771  	sdp->sdp_header.HB2 = vsc->revision; /* Revision Number */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3772  	sdp->sdp_header.HB3 = vsc->length; /* Number of Valid Data Bytes */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3773  
cafac5a9836199 Gwan-gyeong Mun 2020-05-14  3774  	/*
4dd2d4a2ffcae4 Animesh Manna   2023-09-05  3775  	 * Other than revision 0x5 which supports Pixel Encoding/Colorimetry
4dd2d4a2ffcae4 Animesh Manna   2023-09-05  3776  	 * Format as per DP 1.4a spec, revision 0x7 also supports Pixel
4dd2d4a2ffcae4 Animesh Manna   2023-09-05  3777  	 * Encoding/Colorimetry Format as per DP 2.0 spec.
cafac5a9836199 Gwan-gyeong Mun 2020-05-14  3778  	 */
4dd2d4a2ffcae4 Animesh Manna   2023-09-05 @3779  	if (vsc->revision != 0x5 || vsc->revision != 0x7)

This changes the rest of the function into a no-op.  Ideally this sort
bug would be caught in testing.

cafac5a9836199 Gwan-gyeong Mun 2020-05-14  3780  		goto out;
cafac5a9836199 Gwan-gyeong Mun 2020-05-14  3781  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3782  	/* VSC SDP Payload for DB16 through DB18 */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3783  	/* Pixel Encoding and Colorimetry Formats  */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3784  	sdp->db[16] = (vsc->pixelformat & 0xf) << 4; /* DB16[7:4] */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3785  	sdp->db[16] |= vsc->colorimetry & 0xf; /* DB16[3:0] */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3786  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3787  	switch (vsc->bpc) {
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3788  	case 6:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3789  		/* 6bpc: 0x0 */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3790  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3791  	case 8:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3792  		sdp->db[17] = 0x1; /* DB17[3:0] */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3793  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3794  	case 10:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3795  		sdp->db[17] = 0x2;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3796  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3797  	case 12:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3798  		sdp->db[17] = 0x3;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3799  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3800  	case 16:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3801  		sdp->db[17] = 0x4;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3802  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3803  	default:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3804  		MISSING_CASE(vsc->bpc);
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3805  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3806  	}
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3807  	/* Dynamic Range and Component Bit Depth */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3808  	if (vsc->dynamic_range == DP_DYNAMIC_RANGE_CTA)
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3809  		sdp->db[17] |= 0x80;  /* DB17[7] */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3810  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3811  	/* Content Type */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3812  	sdp->db[18] = vsc->content_type & 0x7;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3813  
cafac5a9836199 Gwan-gyeong Mun 2020-05-14  3814  out:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3815  	return length;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3816  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

