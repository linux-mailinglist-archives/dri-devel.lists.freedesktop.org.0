Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BC12D748D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 12:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CA06EDA0;
	Fri, 11 Dec 2020 11:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AD06EDA0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 11:25:11 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BBBOqfs027078;
 Fri, 11 Dec 2020 05:24:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607685892;
 bh=WG5yZQ/WZOeqEFegbGW+qUZNgf6cqP0RJasVuxkXIKc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=zGonFmQ7helNtsPX4mm3134jO+JGFywu0NOtbPCdiOyRWXi9m8tUFyulaMqhT5mg2
 /dqoGuBJ9p2kzIVsZbtzoI7ivUucHzFxeV97JsPayoijf6g9B/GYwW4f1Zar4CrR7E
 msIUDTnkPOPZlcq8p1TN003nH4oHjtkrTf2WFF1M=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BBBOqTr015246
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Dec 2020 05:24:52 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 11
 Dec 2020 05:24:52 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 11 Dec 2020 05:24:52 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BBBOnOJ129361;
 Fri, 11 Dec 2020 05:24:50 -0600
Subject: Re: [PATCH v2 2/2] drm: automatic legacy gamma support
To: kernel test robot <lkp@intel.com>, <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
References: <20201208135759.451772-3-tomi.valkeinen@ti.com>
 <202012110104.ZPkkhoVT-lkp@intel.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <8c0fa5f2-9751-ca11-686d-8876a3a9d633@ti.com>
Date: Fri, 11 Dec 2020 13:24:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202012110104.ZPkkhoVT-lkp@intel.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/12/2020 20:06, kernel test robot wrote:
> Hi Tomi,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on drm-intel/for-linux-next]
> [also build test WARNING on linus/master v5.10-rc7]
> [cannot apply to drm-tip/drm-tip anholt/for-next next-20201210]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Tomi-Valkeinen/drm-fix-and-cleanup-legacy-gamma-support/20201208-215917
> base:   git://anongit.freedesktop.org/drm-intel for-linux-next
> config: i386-randconfig-m021-20201209 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> New smatch warnings:
> drivers/gpu/drm/drm_color_mgmt.c:307 drm_crtc_legacy_gamma_set() error: potential null dereference 'blob'.  (drm_property_create_blob returns null)

I don't see how this could happen. There's no code path I see where drm_property_create_blob could
return null...

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
