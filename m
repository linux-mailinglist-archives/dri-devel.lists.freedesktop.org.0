Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DA767727F
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 21:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2C010E1C1;
	Sun, 22 Jan 2023 20:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA7F10E1C1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 20:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=vkY+Tv3KPWQDcmttZWTVlNqczJidjdFlIO5ekuKYKO0=;
 b=ACJ8IOVh/81++WEnvbt+c4axuq6Cc1c3iZNjWANGT1VmLmeoqpilKaryokYxHBKYgdnUkV7ORgucM
 rN6FHPzr+Zr04RLkxHd6MhaelGBwN7f3Lf7h7JIzd/xkU2j2RedsYrJVCKj5jF72VRwSifN5iJyS95
 TrOWoEZB4cPBHGkaWDmdRq8QgDWCShZBet5BUwryax4aucWP54ZmWIC7o9Zf4pqjNO+iLka1dkWi3A
 yXBK3mgyzi7FAbdiUfphfr3WmB1EVvw8iYQy11hZDy9AuwI0ElWzmILTkSKP+PhEMnI4zTlpELvh//
 ojqU1USdJmP11qAm6aNx8+y/sPPoWrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=vkY+Tv3KPWQDcmttZWTVlNqczJidjdFlIO5ekuKYKO0=;
 b=2AGnclCTzMCHKpKT9R52s+zkQOOztf7K+7a5PBONUI9VuuP3M6C4rE3Y0uwTyL/EIgkkq4DkHdHa+
 UxDMOMSBw==
X-HalOne-ID: 90edecf1-9a97-11ed-867d-ede074c87fad
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id 90edecf1-9a97-11ed-867d-ede074c87fad;
 Sun, 22 Jan 2023 20:58:49 +0000 (UTC)
Date: Sun, 22 Jan 2023 21:58:48 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 16/86] drm/drm_print: Minimize include footprint
Message-ID: <Y82jiIlxn7oG/jIX@ravnborg.org>
References: <20230113-drm-include-v1-v1-16-c5cf72d8a5a2@ravnborg.org>
 <202301220750.HzZm1ZHu-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301220750.HzZm1ZHu-lkp@intel.com>
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
Cc: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all.

On Sun, Jan 22, 2023 at 07:19:15AM +0800, kernel test robot wrote:
> Hi Sam,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on 2e337a8d14bd4b04913d52ccf076be29d846acd7]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Sam-Ravnborg-via-B4-Submission-Endpoint/drm-komeda-Direct-include-headers-from-drm_print/20230122-041306
> base:   2e337a8d14bd4b04913d52ccf076be29d846acd7
> patch link:    https://lore.kernel.org/r/20230113-drm-include-v1-v1-16-c5cf72d8a5a2%40ravnborg.org
> patch subject: [PATCH 16/86] drm/drm_print: Minimize include footprint
> config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20230122/202301220750.HzZm1ZHu-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/530d852970d1a75527031a4f23689f89f0a85804
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Sam-Ravnborg-via-B4-Submission-Endpoint/drm-komeda-Direct-include-headers-from-drm_print/20230122-041306
>         git checkout 530d852970d1a75527031a4f23689f89f0a85804
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/gpu/drm/drm_mode_object.c:195:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>                    DRM_DEBUG("OBJ ID: %d (%d)\n", obj->id, kref_read(&obj->refcount));
>                    ^

For anyone following this. I failed to reproduce the error below using
the instructions above. It looks like some obscure combination of CONFIG
options that may be unrelated to this patch.
allmodconfig, allyesconfig for i386 did not trigger the bug.

I will get back to this in a few days (maybe first in the weekend), and
will share my findings.

	Sam
