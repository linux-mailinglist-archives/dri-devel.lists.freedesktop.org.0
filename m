Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0348D8AD2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 22:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E1A10E13B;
	Mon,  3 Jun 2024 20:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="0dWtBwU5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CCE10E3D2
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 20:19:20 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-57a4ce82f30so2667081a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 13:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1717445958; x=1718050758;
 darn=lists.freedesktop.org; 
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NE9jYYLZ0PrSccgsEhjOgnrd5/z1uEs9526Bwz64hQs=;
 b=0dWtBwU5zKl7bvad9HIE/m8ST+0FB0UU3ZtLwGYWEaDclUYrxdbWczt1D/aiux2ydb
 6r3xsjdtqxfl/RablGCtQUoLXfz89VnNq3j99Rvmizgzd/8PhX7Go4s2/qErKSWdmRDM
 mNmDj+Irlp8xymChPcpfvDoctR4ggCExlWxyF+r5QxhP6cdRzaekWyvJS0wwOlFoSq2N
 lpcbnu56E/wA5TUvP9n2f1FviO8YgAEz8I6zduoKg4MJu+IZ4QMSXvu8WTVilnc1AaMR
 7W+tEZGFZ4KKra+CCIYOtnCP+fmnYnrVlLshtahu6JDH85mPOIzhve/k0ewOQg/+d/I6
 cc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717445958; x=1718050758;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NE9jYYLZ0PrSccgsEhjOgnrd5/z1uEs9526Bwz64hQs=;
 b=AkRn2JojTjuzTeaCl1KGdqYYNw5+XnV9iMpIGTREdepdB60cvP+6yMHpAMKhrz/KXg
 4IzURL1Gm1AnNKdsULJcc0NgijgZ0VK2xBq1lzyihMKa6Da/tpkNjzLgk1dWS82lIfUy
 dYsR+PKYgxZoJVqP/2VENfsWP43v6LqXmX1dIogAjJDHVpSyHWVeac5L6TVRvkECvMmq
 mfJ6D8QQ52xiqSQM9NzTagsakJzPf4fXh7LywfJdJuNsphFMlokgHcpfPrd2ltcazh7y
 8td3wzij35rZ0KJ8tanmyUECNnweTNn37O3N89D4THIBNdJfjbydu4vYC0J+OB38qVSX
 HBEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLEl42ka/Q+1nQtG9V8cLxJvcmKCn3Zt8HYWRdplCGltz6evucfFFCwymDEhwYpC451XefiN+cZ6TAPmIkkFflcETflF0oGpjI1QDMg/mh
X-Gm-Message-State: AOJu0Yxka4lJQJ82z09O0CjzdMr6FCaK0vLjYVcWrO5rTm45+bFoZC3n
 ZcGDZxTHdd6P+AOPNzvCqvX+5+qm+S1SkZSBgIYJ57kunaTJO4qoiLhEQP5NGWo=
X-Google-Smtp-Source: AGHT+IGCGZ7cF+tHbsfD6KOVH6D6GrgBTp1TEU5e+4nXy9DMXeQtp8U//GR6FwSKI00bG8jWZoX3Eg==
X-Received: by 2002:a50:cc9a:0:b0:579:a956:76fd with SMTP id
 4fb4d7f45d1cf-57a363eb01dmr8280627a12.8.1717445957901; 
 Mon, 03 Jun 2024 13:19:17 -0700 (PDT)
Received: from smtpclient.apple ([2001:a61:1083:f101:b82c:e1f8:a3c2:1047])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a3173c8c3sm5888800a12.0.2024.06.03.13.19.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2024 13:19:17 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] drm: Combine identical if/elif code blocks
From: Thorsten Blum <thorsten.blum@toblux.com>
In-Reply-To: <CAB3Z9RJ3RXOMc887N3cJntC1U24HXLkS4jm72xZtcDxNawRN3Q@mail.gmail.com>
Date: Mon, 3 Jun 2024 22:19:05 +0200
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6365BD12-0283-4FCA-B84B-95DD6ADB5438@toblux.com>
References: <20240513212836.292589-3-thorsten.blum@toblux.com>
 <CAB3Z9RJ+VVAvVfKWF2LCzH3288vi6CF7uv+g+qbeu_L0c_k0Nw@mail.gmail.com>
 <60613D48-7C93-4B9F-894C-CE70E5F8D123@toblux.com>
 <227C6981-AFFC-4E0E-A95F-BF8979D5AD2A@toblux.com>
 <CAB3Z9RJ3RXOMc887N3cJntC1U24HXLkS4jm72xZtcDxNawRN3Q@mail.gmail.com>
To: Luc Ma <onion0709@gmail.com>
X-Mailer: Apple Mail (2.3774.600.62)
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

On 16. May 2024, at 03:24, Luc Ma <onion0709@gmail.com> wrote:
> On Wed, 15 May 2024 at 17:31, Thorsten Blum <thorsten.blum@toblux.com> =
wrote:
>> On 15. May 2024, at 11:22, Thorsten Blum <thorsten.blum@toblux.com> =
wrote:
>>> On 15. May 2024, at 09:43, Luc Ma <onion0709@gmail.com> wrote:
>>>> On Tue, 14 May 2024 at 19:37, Thorsten Blum =
<thorsten.blum@toblux.com> wrote:
>>>>>=20
>>>>> Merge the identical if/elif code blocks and remove the following =
two
>>>>> warnings reported by make includecheck:
>>>>>=20
>>>>>     asm/ioctl.h is included more than once
>>>>>     linux/types.h is included more than once
>>>>>=20
>>>>> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
>>>>> ---
>>>>> include/uapi/drm/drm.h | 8 +-------
>>>>> 1 file changed, 1 insertion(+), 7 deletions(-)
>>>>>=20
>>>>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>>>>> index 16122819edfe..315af7b19c97 100644
>>>>> --- a/include/uapi/drm/drm.h
>>>>> +++ b/include/uapi/drm/drm.h
>>>>> @@ -35,13 +35,7 @@
>>>>> #ifndef _DRM_H_
>>>>> #define _DRM_H_
>>>>>=20
>>>>> -#if defined(__KERNEL__)
>>>>> -
>>>>> -#include <linux/types.h>
>>>>> -#include <asm/ioctl.h>
>>>>> -typedef unsigned int drm_handle_t;
>>>>> -
>>>>> -#elif defined(__linux__)
>>>>=20
>>>> I think it is intentionally like that. Please see
>>>> https://patchwork.freedesktop.org/patch/78747/
>>>=20
>>> Thank you for the link.
>>>=20
>>> Does anyone know if the reason for the change from 2016 ("make
>>> headers_install can't handle fancy conditions, ...") is still valid?
>=20
> I guess it is. If you can try ./scripts/unifdef as below[1], you might
> find out the thing.
>=20
> =
[1]https://elixir.bootlin.com/linux/v6.9/source/scripts/headers_install.sh=
#L41

I just tested it with make headers_install and it worked fine.

Thorsten=
