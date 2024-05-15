Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEFA8C63B2
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 11:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57F310E28F;
	Wed, 15 May 2024 09:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="D9i54nQm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2400410E28F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 09:31:20 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-41fd5dc04e2so40633075e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 02:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1715765478; x=1716370278;
 darn=lists.freedesktop.org; 
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6G3NLZQ7adr3CERsJjkdE8ocBCFRaDGrcowv5jfCJI=;
 b=D9i54nQmeo1pkl4bAuxtf9XiZgRoCb7GueCFsImgmHqshK722BXApB0+4mm8jmqLla
 CHGQzaed5cwfqyJvxhfAXS+dQdhanEV47nLP04EgPg/IN349EHD8iGA2YNcUiMXDwypy
 SAjGASoITxXElGhjPWK0TLkeq3EGFRj/QhLbxCnKg3K8r+DIlmq6VAvCGn+fAvw9kJtI
 91nSc7ttF7tVjGGtuV3oK+JZR971VoLvG6iOdvSfk/47/ECO0Lvf0daZVH4F19uKXuZd
 wqx50LBxPICp9CmN/fsdpzZkfwZd/2Xe35LstDg0srFThpJwOuZCtJDLe4c23uSYZ2uk
 u5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715765478; x=1716370278;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W6G3NLZQ7adr3CERsJjkdE8ocBCFRaDGrcowv5jfCJI=;
 b=GQm5OWOEsEIspDPsq1YiokziS5JpY6BdWpq87+NMA8ymgBA2xCODI5afRe42i/RWo3
 hi59htz9Pxj2wuI/uo30Pa3UQAhJ3iqDHR4BvLsSqV9HQqzazSH7K2Ri25KnfeMc6MQb
 RGRRP7GQZ1LR5dc2CsM9gz1afSt3cGm0WfBIBeGML/3+o4uGNLznkvMtKU0zgkO7mYkD
 ZrtVkwvhw1G0CPUtKqJroTF+CU3IVYWZvURS9OqPDCRfGG3CAd15KvPlOQXXT+LA5bQs
 AAaQV3gwsaBmfPrObM/+qUFbyFz2oFUGr4ZfzoTOsbgEkhJy6sjdQWp8P46Iqaf9MZ3X
 DuaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0EhorsRTCfpeAPSxKEI/1a3/bJW/544gxInsydVe73N7S7LDfl9D8XtNo70v6AWBia7y3Oxv7HLH+FUFur0kxBkESDqRYodxkJWpD2kY3
X-Gm-Message-State: AOJu0Yy7/PSQzllw/OvIArizJgPoHtTobcT6N/0Os708UHZvs2NJV2aK
 /J6GdHDCLbWFKq9SPzuKYFJmsSMv5KyMbd2ENrx+fnfG3rrCLbNeBCgroF8gddw=
X-Google-Smtp-Source: AGHT+IEWq6C+Q69fwOKt2Hhmyp59PTVplWyL7OAWiHlAN1uxl4iQWE0fRjH5iltmnd9peTcPahGTlw==
X-Received: by 2002:a05:600c:46d0:b0:41b:d08d:dce4 with SMTP id
 5b1f17b1804b1-41feaa2f3c4mr133082205e9.5.1715765478259; 
 Wed, 15 May 2024 02:31:18 -0700 (PDT)
Received: from smtpclient.apple ([2001:a61:aa3:5c01:b167:7b8d:34fb:4ec8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42010ca475asm146321755e9.16.2024.05.15.02.31.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2024 02:31:17 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH] drm: Combine identical if/elif code blocks
From: Thorsten Blum <thorsten.blum@toblux.com>
In-Reply-To: <60613D48-7C93-4B9F-894C-CE70E5F8D123@toblux.com>
Date: Wed, 15 May 2024 11:31:06 +0200
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <227C6981-AFFC-4E0E-A95F-BF8979D5AD2A@toblux.com>
References: <20240513212836.292589-3-thorsten.blum@toblux.com>
 <CAB3Z9RJ+VVAvVfKWF2LCzH3288vi6CF7uv+g+qbeu_L0c_k0Nw@mail.gmail.com>
 <60613D48-7C93-4B9F-894C-CE70E5F8D123@toblux.com>
To: Luc Ma <onion0709@gmail.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
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

On 15. May 2024, at 11:22, Thorsten Blum <thorsten.blum@toblux.com> =
wrote:
> On 15. May 2024, at 09:43, Luc Ma <onion0709@gmail.com> wrote:
>> On Tue, 14 May 2024 at 19:37, Thorsten Blum =
<thorsten.blum@toblux.com> wrote:
>>>=20
>>> Merge the identical if/elif code blocks and remove the following two
>>> warnings reported by make includecheck:
>>>=20
>>>      asm/ioctl.h is included more than once
>>>      linux/types.h is included more than once
>>>=20
>>> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
>>> ---
>>> include/uapi/drm/drm.h | 8 +-------
>>> 1 file changed, 1 insertion(+), 7 deletions(-)
>>>=20
>>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>>> index 16122819edfe..315af7b19c97 100644
>>> --- a/include/uapi/drm/drm.h
>>> +++ b/include/uapi/drm/drm.h
>>> @@ -35,13 +35,7 @@
>>> #ifndef _DRM_H_
>>> #define _DRM_H_
>>>=20
>>> -#if defined(__KERNEL__)
>>> -
>>> -#include <linux/types.h>
>>> -#include <asm/ioctl.h>
>>> -typedef unsigned int drm_handle_t;
>>> -
>>> -#elif defined(__linux__)
>>=20
>> I think it is intentionally like that. Please see
>> https://patchwork.freedesktop.org/patch/78747/
>=20
> Thank you for the link.
>=20
> Does anyone know if the reason for the change from 2016 ("make
> headers_install can't handle fancy conditions, ...") is still valid?
>=20
> Other headers use the same #if directive:
>=20
> fs/ext4/ext4.h:948:#if defined(__KERNEL__) || defined(__linux__)
> include/uapi/sound/asound.h:11:#if defined(__KERNEL__) || =
defined(__linux__)
>=20
> And there are many others using similar conditions:
>=20
> arch/arm/include/uapi/asm/swab.h:27:#if !defined(__KERNEL__) || =
__LINUX_ARM_ARCH__ < 6
> arch/sparc/include/uapi/asm/signal.h:92:#if defined(__KERNEL__) || =
defined(__WANT_POSIX1B_SIGNALS__)
> arch/sparc/include/uapi/asm/termios.h:8:#if defined(__KERNEL__) || =
defined(__DEFINE_BSD_TERMIOS)
> include/uapi/linux/soundcard.h:1040:#if !defined(__KERNEL__) || =
defined(USE_SEQ_MACROS)
> include/uapi/linux/stat.h:7:#if defined(__KERNEL__) || =
!defined(__GLIBC__) || (__GLIBC__ < 2)
> include/uapi/sound/asound.h:11:#if defined(__KERNEL__) || =
defined(__linux__)
> ...
>=20
> Thanks,
> Thorsten

Re-sending this to linux-kernel@vger.kernel.org because the mailing list
somehow got lost in Luc's reply.=
