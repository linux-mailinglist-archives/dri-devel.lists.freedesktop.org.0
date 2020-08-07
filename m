Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7711323ED53
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 14:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23016E0F5;
	Fri,  7 Aug 2020 12:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27F56E0F0;
 Fri,  7 Aug 2020 12:28:35 +0000 (UTC)
IronPort-SDR: oI2Y6ETGcr2n/CL5tkowwYt2k6dGBoRPnPOEh4y9+f3LACxf1QCZSrVCg9Nh0ItbKul194kyxO
 ytdoT6kviZ1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="152297311"
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="152297311"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 05:28:35 -0700
IronPort-SDR: IKrIvkFBBo5FW3TnZubxXc1BEUMh6OF08yD1bXTLgTIuXe+t5mlea+FyakuKMWG4ClUoOHWGGx
 Wqd/NdbQnT7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="468214228"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 07 Aug 2020 05:28:34 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 7 Aug 2020 05:28:34 -0700
Received: from orsmsx113.amr.corp.intel.com (10.22.240.9) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 7 Aug 2020 05:28:34 -0700
Received: from orsmsx163.amr.corp.intel.com ([169.254.9.31]) by
 ORSMSX113.amr.corp.intel.com ([169.254.9.62]) with mapi id 14.03.0439.000;
 Fri, 7 Aug 2020 05:28:34 -0700
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: missing cases of rename
 ttm_mem_reg to ttm_resource.
Thread-Topic: [Nouveau] [PATCH] drm/nouveau: missing cases of rename
 ttm_mem_reg to ttm_resource.
Thread-Index: AQHWbG/DY4vW/hCDoUKQoWwMuz7n2Kksg2mAgACFlgA=
Date: Fri, 7 Aug 2020 12:28:33 +0000
Message-ID: <816C5382-21E4-4E7A-9ADB-4D18F19E85B4@intel.com>
References: <20200807011517.2814096-1-rodrigo.vivi@intel.com>
 <CAPM=9txAFXQoRcD-uw3nNUKDg+QrOgdafC6J401Da5ax=1US2w@mail.gmail.com>
 <CAPM=9txoPFXo=+sRV1UanY9iBUkCcuTu62Hz4X0C1iEG=qZCuA@mail.gmail.com>
In-Reply-To: <CAPM=9txoPFXo=+sRV1UanY9iBUkCcuTu62Hz4X0C1iEG=qZCuA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.212.251.152]
Content-ID: <582C618166D9614E922242CCF3152AD5@intel.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Aug 6, 2020, at 9:30 PM, Dave Airlie <airlied@gmail.com> wrote:
> 
> On Fri, 7 Aug 2020 at 14:03, Dave Airlie <airlied@gmail.com> wrote:
>> 
>> On Fri, 7 Aug 2020 at 11:13, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>>> 
>>> From: Rodrigo Vivi <rodrigo.vivi@gmail.com>
>>> 
>>> These are missed cases that I just identified with allyesconfig build.
>>> 
>> 
>> Is this against drm-tip? it's a merge problem, that I thought I'd
>> already addressed, but tip seems to have lost it.
> 
> I think I've fixed drm-tip rebuilds now.

perfect, thanks!

> 
> Dave.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
