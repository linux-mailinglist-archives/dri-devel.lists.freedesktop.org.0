Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA365552F7B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982DF10E5E9;
	Tue, 21 Jun 2022 10:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC4E10E5E9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 10:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655806405; x=1687342405;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=mR5Un6+9WKGYeywFJRvZiZCin9Uu7YE1gj2wX8VDPHE=;
 b=FXibfh9HV9WY5pUfCY1SBaOyWZde+hf7EsFcBR0F5dbDqvY0JdE//tti
 cNTuOHEktTfmH5Z4KyKg/g3+bPjnrVSDz2C9ShQwhYcRfzBjDb0SW/Axi
 8Wt1hYHJyIxBDIMFcjwpOO2BpdZhI4O10tlAt9+BA85/Z3/IL+DxR+4eZ
 7VTuvtNOZNU7Njxa6ekvEQeQiG1utRVoggNgmJowsQGSWXhpqx+A92JgZ
 v+K0vV4xS5gKfb/OJoA50uLLnQ8TeWyuwjIEgk+/bF4u3KaZUXzUtHPGg
 CD4kD+VpnFVAiN3KGoZgLW1vzy85rhbGZZrkBHU9lcCQrw80d1lYeiHnA g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="259904760"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="259904760"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:13:24 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="591589620"
Received: from rgrotewx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.153])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:13:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, David Gow
 <davidgow@google.com>, =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?=
 <jose.exposito89@gmail.com>
Subject: Re: [PATCH v4 1/3] drm/rect: Add DRM_RECT_INIT() macro
In-Reply-To: <045f480b-9f47-6f10-9e5d-4436335b272e@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220620160640.3790-1-jose.exposito89@gmail.com>
 <20220620160640.3790-2-jose.exposito89@gmail.com>
 <CABVgOSmPfxdcxuU6xtuT2sN75ivs+Atgmt=2PNcdWqnMcrnbEQ@mail.gmail.com>
 <045f480b-9f47-6f10-9e5d-4436335b272e@suse.de>
Date: Tue, 21 Jun 2022 13:13:18 +0300
Message-ID: <87fsjys4sh.fsf@intel.com>
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
Cc: magalilemes00@gmail.com, David Airlie <airlied@linux.ie>,
 =?utf-8?Q?Ma=C3=ADra?= Canal <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 tales.aparecida@gmail.com, Isabella Basso <isabbasso@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Jun 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 21.06.22 um 11:38 schrieb David Gow:
>> On Tue, Jun 21, 2022 at 12:06 AM Jos=C3=A9 Exp=C3=B3sito
>> <jose.exposito89@gmail.com> wrote:
>>>
>>> Add a helper macro to initialize a rectangle from x, y, width and
>>> height information.
>>>
>>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
>>> ---
>>=20
>> This looks good to me, though I have one minor concern about the macro
>> name. (But if it's okay with the DRM folks, which it seems to be, I
>> won't object.)
>>=20
>> Either way,
>> Reviewed-by: David Gow <davidgow@google.com>
>>=20
>>>   include/drm/drm_rect.h | 16 ++++++++++++++++
>>>   1 file changed, 16 insertions(+)
>>>
>>> diff --git a/include/drm/drm_rect.h b/include/drm/drm_rect.h
>>> index 6f6e19bd4dac..e8d94fca2703 100644
>>> --- a/include/drm/drm_rect.h
>>> +++ b/include/drm/drm_rect.h
>>> @@ -47,6 +47,22 @@ struct drm_rect {
>>>          int x1, y1, x2, y2;
>>>   };
>>>
>>> +/**
>>> + * DRM_RECT_INIT - initialize a rectangle from x/y/w/h
>>> + * @x: x coordinate
>>> + * @y: y coordinate
>>> + * @w: width
>>> + * @h: height
>>> + *
>>> + * RETURNS:
>>> + * A new rectangle of the specified size.
>>> + */
>>> +#define DRM_RECT_INIT(x, y, w, h) ((struct drm_rect){ \
>>> +               .x1 =3D (x), \
>>> +               .y1 =3D (y), \
>>> +               .x2 =3D (x) + (w), \
>>> +               .y2 =3D (y) + (h) })
>>> +
>>=20
>> My only slight concern here is that it might be a little bit confusing
>> that a macro called DRM_RECT_INIT() accepts x/y/w/h, whereas the
>> actual struct drm_rect is x1/y1/x2/y2. If the macro were called
>> something like DRM_RECT_INIT_FROM_XYWH() or similar.
>
> The existing drm_rect_init() function uses xywh arguments. So the=20
> current name is consistent with existing practice. I don't think we=20
> refer to x2,y2 much, if ever.

Agreed, and if we initialized with x1,y1,x2,y2 we wouldn't need the
function/macro in the first place.

BR,
Jani.

>
> Best regards
> Thomas
>
>>=20
>>=20
>>>   /**
>>>    * DRM_RECT_FMT - printf string for &struct drm_rect
>>>    */
>>> --
>>> 2.25.1
>>>

--=20
Jani Nikula, Intel Open Source Graphics Center
