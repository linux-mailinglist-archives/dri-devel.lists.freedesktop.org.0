Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA942FEB49
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 14:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B37589F92;
	Thu, 21 Jan 2021 13:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D43889973;
 Thu, 21 Jan 2021 13:14:57 +0000 (UTC)
IronPort-SDR: IrRK9EEFGzhh6aS+4WhMBm1CrzbaYeVCpDlpVfQnFYoTS2DepUDrqd8AHs9vFnjwOCn7p85HP3
 8rt+2q6KedKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="175759621"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="175759621"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 05:14:31 -0800
IronPort-SDR: BrkhjJ9IzmfmEjVPKw7zX9YSyUTjDaEPReWveRN9Q+MEU3Qj9pB0AK7yNBhJj7NRaAZm880tZf
 7FafPE/CdVvw==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="427322473"
Received: from cohrs-mobl.ger.corp.intel.com (HELO localhost) ([10.252.51.23])
 by orsmga001-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 05:14:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix build after dp quirk helper change
In-Reply-To: <CAOMZO5D5c=5uMD5HEfHk6z4C41zzOroRV7ghumjBgmWrLEuehg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210120110708.32131-1-jani.nikula@intel.com>
 <92f48ffdfa30c3941e0fd22337217f0b10d75ec8.camel@redhat.com>
 <875z3qmt5b.fsf@intel.com>
 <CAOMZO5Du9+DTYpuG3FNLRrO_LJVSJa3cdJWWwt_qzQDthGESkg@mail.gmail.com>
 <8735yums94.fsf@intel.com>
 <CAOMZO5DBXerrJEvvXnfzjB376SMKVJTyo9MRD0H0u9pz8p+2yg@mail.gmail.com>
 <87pn1ylcdd.fsf@intel.com>
 <CAOMZO5D5c=5uMD5HEfHk6z4C41zzOroRV7ghumjBgmWrLEuehg@mail.gmail.com>
Date: Thu, 21 Jan 2021 15:14:24 +0200
Message-ID: <87mtx2l9e7.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Jan 2021, Fabio Estevam <festevam@gmail.com> wrote:
> On Thu, Jan 21, 2021 at 9:10 AM Jani Nikula <jani.nikula@intel.com> wrote:
>
>> Kinda catch-22 because next has dropped current drm-intel-next because
>> it doesn't build because of the issue this patch fixes. ;)
>
> Ok, so I built drm-intel-next and I was able to reproduce the buid
> error as reported by Stephen.
>
> Applied this patch and it builds fine now.

Thanks, much appreciated.

Pushed to drm-intel-next.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
