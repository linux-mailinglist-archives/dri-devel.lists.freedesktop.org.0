Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1084E874FF4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 14:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834CA10F108;
	Thu,  7 Mar 2024 13:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XCS/fRzT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984AB10F108
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 13:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709818136; x=1741354136;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=yjdIRk7sd3qilCPNdIe1vadTlkaMwe9EisUimCP9pyw=;
 b=XCS/fRzTsAsNU+dKE5mPnEbPyeSH4vGMSOB5Ok9jz96d6RY9WGCOdl5K
 1kBAN9io+QrDqdjAKKvnOprwJS2+ll7N+Vqjc4UiaxqzqmmbvIP0cS2jn
 42FJKovS1rvq0R95jb5zjvp6lzE2ECOAiBYNmyrVru4XxE1umDyT1K9Bu
 CS4N0SaXPtawPfwhuWW4V8Ayq0v+ZCOMWaOmuJAJKgZYFMioFgweUZhHE
 sIL1wvvL4gUwUZavNMZ7+Vr4V4Yh7ib4ymmy3D7N+c0GQseYNJaYbwcp4
 AW+/exCfrqNqB2u4z0UutdV6I2tTqhHrYT/PIe6tLr7sZS9QyRpgaUSgV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4338654"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="4338654"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 05:28:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="33260982"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 05:28:51 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/6] drm/panel-edp: Fix AUO 0x405c panel naming and
 add a variant
In-Reply-To: <CAD=FV=VvhKZHVzHQdOO=_p0E5m7ig1LY2s5MZRojRynKHbF1xw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240306200353.1436198-1-hsinyi@chromium.org>
 <20240306200353.1436198-7-hsinyi@chromium.org>
 <CAD=FV=VvhKZHVzHQdOO=_p0E5m7ig1LY2s5MZRojRynKHbF1xw@mail.gmail.com>
Date: Thu, 07 Mar 2024 15:28:49 +0200
Message-ID: <87msraw4q6.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 06 Mar 2024, Doug Anderson <dianders@chromium.org> wrote:
> Hi,
>
> On Wed, Mar 6, 2024 at 12:04=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org=
> wrote:
>>
>> @@ -1009,6 +1009,19 @@ static const struct panel_desc auo_b101ean01 =3D {
>>         },
>>  };
>>
>> +static const struct drm_display_mode auo_b116xa3_mode =3D {
>> +       .clock =3D 70589,
>> +       .hdisplay =3D 1366,
>> +       .hsync_start =3D 1366 + 40,
>> +       .hsync_end =3D 1366 + 40 + 40,
>> +       .htotal =3D 1366 + 40 + 40 + 32,
>> +       .vdisplay =3D 768,
>> +       .vsync_start =3D 768 + 10,
>> +       .vsync_end =3D 768 + 10 + 12,
>> +       .vtotal =3D 768 + 10 + 12 + 6,
>> +       .flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
>> +};
>> +
>>  static const struct drm_display_mode auo_b116xak01_mode =3D {
>>         .clock =3D 69300,
>>         .hdisplay =3D 1366,
>> @@ -1990,7 +2003,9 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B116=
XAN06.1"),
>>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, "B116=
XTN02.5"),
>>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B140=
HAN04.0"),
>> -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B1=
16XAK01.0"),
>> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B1=
16XAN04.0"),
>> +       EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B=
116XAK01.0 ",
>
> Remove the trailing space from the string above now?

Maybe it actually needs to be considered part of the name; see my other
reply in the earlier patch.

>
> Aside from that:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

--=20
Jani Nikula, Intel
