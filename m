Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED9974E994
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 10:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495FC10E332;
	Tue, 11 Jul 2023 08:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5812410E332
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 08:58:02 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fb87828386so1608316e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 01:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1689065880; x=1689670680;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vU/q9F+j7T29Ov8VGxEBf0ga2x1TW8QqZSc1uPgejXw=;
 b=ZAYLsHz1srKC6rodvE90k3M2axRg9MqOhBHiSomPBA3k80qu6tnzcZLed105eqB3mB
 3jfffCy/8VP9kCx5f9oP9AeHHmIFOK4jenCBSFQXP3/mWEwmJRjABLQiok/pxYTeqkpr
 8ssAfAR+eXCL1meiVj6KmFQ8M6F4/m2s6q2CU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689065880; x=1689670680;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vU/q9F+j7T29Ov8VGxEBf0ga2x1TW8QqZSc1uPgejXw=;
 b=ZlYWLRLXLIdhf9GfSG/BWmrFT61O/Rhvn1Lv1jmqZHcdbS6TtcnKE7qnA0aQfy3zIu
 9J49J2SaKquVtdMWuzJbX+pSeIUqjJa/6PAizbhgfyFDirpJcxO93PmgNgXpcKjllous
 a01R4IaSjJuVQQd3oCaK6vK7x0tL++y6T9FcjvqTmVSNR1Pj4G/gONKNuYB9oBZkrcC+
 x2CIGscOXZWb7nttmN90muaWuvXy/eyDgZ+Iad0C9bQI4+zfArdePmjwM2whJpi9yJEF
 crONmwbk/+2443dzZOYy0HQwSDfXAWydDbymXy18zNFM4Rw4z1yFKeXcRxo8rEjpMgwv
 XjcA==
X-Gm-Message-State: ABy/qLad3RqYL2QC0S20EQZzT43IiY4ylqTxas6MsTJd515PV+QBVInv
 cuG+dOY+VKLEvGEXv52iOSUsKQ==
X-Google-Smtp-Source: APBJJlFG4pTsS/5OU08doNJkGnPN/YPs+LTOaHjyktlkkHHgWCUC0uJHQGeiOEg+95dWXGz0oSUrhw==
X-Received: by 2002:a19:a414:0:b0:4fb:8341:43d3 with SMTP id
 q20-20020a19a414000000b004fb834143d3mr9326203lfc.5.1689065880058; 
 Tue, 11 Jul 2023 01:58:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 v6-20020aa7cd46000000b0051e3385a395sm949732edw.3.2023.07.11.01.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 01:57:59 -0700 (PDT)
Date: Tue, 11 Jul 2023 10:57:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v5 6/6] drm/doc: Define KMS atomic state set
Message-ID: <ZK0ZlciR66oTO+Td@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, pierre-eric.pelloux-prayer@amd.com,
 Simon Ser <contact@emersion.fr>, Rob Clark <robdclark@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, hwentlan@amd.com,
 joshua@froggi.es, ville.syrjala@linux.intel.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20230707224059.305474-1-andrealmeid@igalia.com>
 <20230707224059.305474-7-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230707224059.305474-7-andrealmeid@igalia.com>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
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
Cc: pierre-eric.pelloux-prayer@amd.com, Pekka Paalanen <ppaalanen@gmail.com>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 hwentlan@amd.com, dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Pekka Paalanen <pekka.paalanen@collabora.com>,
 christian.koenig@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 07, 2023 at 07:40:59PM -0300, André Almeida wrote:
> From: Pekka Paalanen <pekka.paalanen@collabora.com>
> 
> Specify how the atomic state is maintained between userspace and
> kernel, plus the special case for async flips.
> 
> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v4: total rework by Pekka
> ---
>  Documentation/gpu/drm-uapi.rst | 41 ++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 65fb3036a580..6a1662c08901 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -486,3 +486,44 @@ and the CRTC index is its position in this array.
>  
>  .. kernel-doc:: include/uapi/drm/drm_mode.h
>     :internal:
> +
> +KMS atomic state
> +================
> +
> +An atomic commit can change multiple KMS properties in an atomic fashion,
> +without ever applying intermediate or partial state changes.  Either the whole
> +commit succeeds or fails, and it will never be applied partially. This is the
> +fundamental improvement of the atomic API over the older non-atomic API which is
> +referred to as the "legacy API".  Applying intermediate state could unexpectedly
> +fail, cause visible glitches, or delay reaching the final state.
> +
> +An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY, which means the
> +complete state change is validated but not applied.  Userspace should use this
> +flag to validate any state change before asking to apply it. If validation fails
> +for any reason, userspace should attempt to fall back to another, perhaps
> +simpler, final state.  This allows userspace to probe for various configurations
> +without causing visible glitches on screen and without the need to undo a
> +probing change.
> +
> +The changes recorded in an atomic commit apply on top the current KMS state in
> +the kernel. Hence, the complete new KMS state is the complete old KMS state with
> +the committed property settings done on top. The kernel will automatically avoid
> +no-operation changes, so it is safe and even expected for userspace to send
> +redundant property settings.  No-operation changes do not count towards actually
> +needed changes, e.g.  setting MODE_ID to a different blob with identical
> +contents as the current KMS state shall not be a modeset on its own.

Small clarification: The kernel indeed tries very hard to make redundant
changes a no-op, and I think we should consider any issues here bugs. But
it still has to check, which means it needs to acquire the right locks and
put in the right (cross-crtc) synchronization points, and due to
implmentation challenges it's very hard to try to avoid that in all cases.
So adding redundant changes especially across crtc (and their connected
planes/connectors) might result in some oversynchronization issues, and
userspace should therefore avoid them if feasible.

With some sentences added to clarify this:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
> +A "modeset" is a change in KMS state that might enable, disable, or temporarily
> +disrupt the emitted video signal, possibly causing visible glitches on screen. A
> +modeset may also take considerably more time to complete than other kinds of
> +changes, and the video sink might also need time to adapt to the new signal
> +properties. Therefore a modeset must be explicitly allowed with the flag
> +DRM_MODE_ATOMIC_ALLOW_MODESET.  This in combination with
> +DRM_MODE_ATOMIC_TEST_ONLY allows userspace to determine if a state change is
> +likely to cause visible disruption on screen and avoid such changes when end
> +users do not expect them.
> +
> +An atomic commit with the flag DRM_MODE_PAGE_FLIP_ASYNC is allowed to
> +effectively change only the FB_ID property on any planes. No-operation changes
> +are ignored as always. Changing any other property will cause the commit to be
> +rejected.
> -- 
> 2.41.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
