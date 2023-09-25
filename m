Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C5C7AD6B1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 13:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6037710E16C;
	Mon, 25 Sep 2023 11:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1493610E16C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 11:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695640125; x=1727176125;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=9p+XqtzXvIJ3hJIh/2hgy3YcmayjqQFoFDHhEcEBbDk=;
 b=J4t20yzPBfn7uQ/3F+G38CUHn8VYxKrmafFRpojIF2MI/v2aIKVzSjeJ
 Vyz9/K2lwXOrbiNv5i1T8jBdo0S+8rG9HqroQKIETHQ3NVkPqsP9U0Ma/
 vPvwBLyphEWVlP3W0w00CCPQmpH9/7Fcxhvf8F1Y/0PdUbmU+luX1ewO3
 PqBOls8rcD97mRXAxY+QFwvpqTtGA+M7iRubPOLKssaHNalOP2PRulZD6
 QLx366HQDTLZDwQciD4BzyOsaXL68e5nX3yNB9SRoY5lNMVZ3kclz2pCm
 GuMt5A5xsxAEihFRBA4hbXRe+0aqNh+d+Wvk/kFNtNqjofgspv7vJHDqA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467510681"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="467510681"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 04:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="838536484"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="838536484"
Received: from smgotth-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.46])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 04:08:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Robert Foss <rfoss@kernel.org>, Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] drm/bridge: clean up some inconsistent indentings
In-Reply-To: <CAN6tsi44s3h3Ox3mK2pi+Mw8pGCB9fgMcoWmJhCenHoK9=t=-w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230920004400.81091-1-yang.lee@linux.alibaba.com>
 <CAN6tsi44s3h3Ox3mK2pi+Mw8pGCB9fgMcoWmJhCenHoK9=t=-w@mail.gmail.com>
Date: Mon, 25 Sep 2023 14:08:25 +0300
Message-ID: <87a5tao6hi.fsf@intel.com>
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
Cc: neil.armstrong@linaro.org, jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Sep 2023, Robert Foss <rfoss@kernel.org> wrote:
> NAK

Feels a bit harsh.

> Personally I value maintaining a simple to follow `git blame` history
> over correcting indentation.
>
> Ideally bad indentation should never be committed in the first place.

Agreed, but when that inevitably happens, do you really want it to be
cast in stone? To me leaving bad indent (or style, or whatever) in place
indicates we don't care, while the opposite is true.

Maybe look into tooling that lets you easily git blame the parent commit
of a line in git blame? (For example, in emacs vc-annotate, it's just a
matter of hitting 'a'.)


BR,
Jani.


>
> On Wed, Sep 20, 2023 at 2:44=E2=80=AFAM Yang Li <yang.lee@linux.alibaba.c=
om> wrote:
>>
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c:336 dw_hdmi_cec_suspend() =
warn: inconsistent indenting
>>
>> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu=
/drm/bridge/synopsys/dw-hdmi-cec.c
>> index 673661160e54..fe2ff4984fc5 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
>> @@ -333,9 +333,9 @@ static int __maybe_unused dw_hdmi_cec_suspend(struct=
 device *dev)
>>         struct dw_hdmi_cec *cec =3D dev_get_drvdata(dev);
>>
>>         /* store interrupt status/mask registers */
>> -        cec->regs_polarity =3D dw_hdmi_read(cec, HDMI_CEC_POLARITY);
>> -        cec->regs_mask =3D dw_hdmi_read(cec, HDMI_CEC_MASK);
>> -        cec->regs_mute_stat0 =3D dw_hdmi_read(cec, HDMI_IH_MUTE_CEC_STA=
T0);
>> +       cec->regs_polarity =3D dw_hdmi_read(cec, HDMI_CEC_POLARITY);
>> +       cec->regs_mask =3D dw_hdmi_read(cec, HDMI_CEC_MASK);
>> +       cec->regs_mute_stat0 =3D dw_hdmi_read(cec, HDMI_IH_MUTE_CEC_STAT=
0);
>>
>>         return 0;
>>  }
>> --
>> 2.20.1.7.g153144c
>>

--=20
Jani Nikula, Intel
