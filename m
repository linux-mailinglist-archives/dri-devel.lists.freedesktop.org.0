Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7987A22B1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 17:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EC510E643;
	Fri, 15 Sep 2023 15:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F1410E643
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 15:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694792580; x=1726328580;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=+bhmUCWZzNmLPGMd0PHFWWoi5JXlJtf/KEHz5FM7kaA=;
 b=YKp0J/yGyW6H2sDqsKJ10ttbQ5Bd5GUfwzOlU1oIA0YZNVuUp/TZksbJ
 KVaaQ1BBQ9SxtDBZMvbPMz+RPpkqw5OqZjT1sZK/l96ord6jTj6zyAuXC
 MiSf++jFeikwsbPxBoNqLGA0CvmCxHiWP0/WFb1tNY/R56lsigf9Upsfk
 gN1dehRUiL5gbgsYizYMSaA998EoIoKFsbRp4u++X+0NN7TkSIwdgO+NL
 b6nLeZdpiP5JM2pW9mXoJFcVGJx8E28SM+ObGnmyqiwRhBcDprdL2SnBT
 dgOGdWSwDhQmgeKvlCZOGjvzEfGO2ar8u/RF2PfgxsnIdzHt9vDO4PIzS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358695923"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="358695923"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 08:43:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="918693516"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="918693516"
Received: from azafrani-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.177])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 08:42:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Robert Foss <rfoss@kernel.org>, neil.armstrong@linaro.org
Subject: Re: [PATCH] MAINTAINERS: add drm_bridge_connector.[ch] files under
 bridge chips
In-Reply-To: <CAN6tsi5EBbRmKn9A_2R5MHzuqw5+-5UMWe7b4ZF1vRdR+5oHwA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230914131951.2473844-1-jani.nikula@intel.com>
 <e20aa74f-3b40-4901-963d-41fa8286244f@linaro.org>
 <CAN6tsi5EBbRmKn9A_2R5MHzuqw5+-5UMWe7b4ZF1vRdR+5oHwA@mail.gmail.com>
Date: Fri, 15 Sep 2023 18:42:53 +0300
Message-ID: <87a5tnv3wi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Sep 2023, Robert Foss <rfoss@kernel.org> wrote:
> On Fri, Sep 15, 2023 at 12:31=E2=80=AFPM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> On 14/09/2023 15:19, Jani Nikula wrote:
>> > Clearly this should be under bridge chips.
>> >
>> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> > Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> > Cc: Robert Foss <rfoss@kernel.org>
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> > ---
>> >   MAINTAINERS | 2 ++
>> >   1 file changed, 2 insertions(+)
>> >
>> > diff --git a/MAINTAINERS b/MAINTAINERS
>> > index 354ac7ef553d..c331f2ea89d7 100644
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -6909,7 +6909,9 @@ T:      git git://anongit.freedesktop.org/drm/dr=
m-misc
>> >   F:  Documentation/devicetree/bindings/display/bridge/
>> >   F:  drivers/gpu/drm/bridge/
>> >   F:  drivers/gpu/drm/drm_bridge.c
>> > +F:   drivers/gpu/drm/drm_bridge_connector.c
>> >   F:  include/drm/drm_bridge.h
>> > +F:   include/drm/drm_bridge_connector.h
>> >
>> >   DRM DRIVERS FOR EXYNOS
>> >   M:  Inki Dae <inki.dae@samsung.com>
>>
>> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>
> Acked-by: Robert Foss <rfoss@kernel.org>

Thanks, pushed to drm-misc-next.

BR,
Jani.

--=20
Jani Nikula, Intel
