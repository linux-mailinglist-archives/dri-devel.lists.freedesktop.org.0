Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1437B3203F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 18:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B145810EB60;
	Fri, 22 Aug 2025 16:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="AJ3dSVO4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559B410EB5F;
 Fri, 22 Aug 2025 16:15:08 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 26E2E33F2AA;
 Fri, 22 Aug 2025 17:15:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1755879306; bh=6gc+mTlbSfkH6uEN49mrKi1vZJLZUQ3GGSSD7Q/DFj0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AJ3dSVO461lWrHhw0LcdTJR+c30Z2TYNNDoYt4pcjsJeIPcXqWSgwcpNP4cMEtjtV
 4kakd1yilAEHPrFPxbXB96N2VJavTYfGBr7ZAQfhznBk1PfQ+e+IjCPI5Y444iSdTq
 4BUOpgth1Yr9Vokl3OHDoxTqxThPa8xvo+F7TBkZrOKX3g3m/toiC38qJdgQ2IsOSw
 MO6KDypH0hy+6EWgqe0+F/8TjhhEr0/0ZPa/2GKQ/OYEtuZhVRUyWpLnANtJFIX7Bf
 7ekOGKaEDKMDMVSbRuzSBSej6PliIPwF4gt/9Ak9R9jNNH1ELQuFEh1zI9K0dxndWJ
 7OJF1/hftD+KA==
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-61c14b1689eso2180669a12.1; 
 Fri, 22 Aug 2025 09:15:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUGGgyc/edPRjT4Plrd38+MWraC2yPAzxFxo1Be6ZoO6mFdU4p5/oHCuPWrDwNTGI0cTM08AKTQ5VA=@lists.freedesktop.org,
 AJvYcCXW9fBhdXFJYTT2Gr9wDRnf8KkiPPABCNRML/KD5mrb+GJ5LJnk/V6Y+g3yKikhIhGTK9CMpF/dxBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfzN9fXRydjmWiynLNIFYOFGbp8l3FIMCTiPEQOPwEcR4qEkC4
 2KHZSXE9p6BkCUGKQo2n2sOnDwSciMSdgVDHQjr3He/20ztLVLG26BVCkjpDf58kixMrAEd+j8l
 TGBOWVjful+ZvmMtjndN2xnEQqLoXXJs=
X-Google-Smtp-Source: AGHT+IE5b7oShYSOfBwESqfvTkAao0lF+k2ssCA0/dqQXC8llmtYCqUdh3figntKqnBSeIpAJPqnPYRIZrJ5MM5f9uA=
X-Received: by 2002:a17:907:868d:b0:af9:7a90:6750 with SMTP id
 a640c23a62f3a-afe28f8369fmr368407566b.3.1755879305486; Fri, 22 Aug 2025
 09:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
 <20250822-atomic-v3-1-13a0e8f2c581@intel.com>
In-Reply-To: <20250822-atomic-v3-1-13a0e8f2c581@intel.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Fri, 22 Aug 2025 18:14:54 +0200
X-Gmail-Original-Message-ID: <CAFZQkGwqgo7FavPQecKgwaZ1DcXccY9urRzcfocg+Srd4P9WPA@mail.gmail.com>
X-Gm-Features: Ac12FXxjkvwgTrNfXGJNKCXUDTzvGQiqv_mY1SQly4_gNZZtuFXlpu_ovpjPM3g
Message-ID: <CAFZQkGwqgo7FavPQecKgwaZ1DcXccY9urRzcfocg+Srd4P9WPA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm: Define user readable error codes for atomic
 ioctl
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, naveen1.kumar@intel.com, 
 uma.shankar@intel.com, harry.wentland@amd.com
Content-Type: text/plain; charset="UTF-8"
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

> +#define DRM_MODE_ATOMIC_FAILURE_REASON \
> +       FAILURE_REASON(DRM_MODE_ATOMIC_CAP_NOT_ENABLED, "DRM_ATOMIC capability not enabled") \
> +       FAILURE_REASON(DRM_MODE_ATOMIC_INVALID_FLAG, "invalid flag") \
> +       FAILURE_REASON(DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC, "Legacy DRM_MODE_PAGE_FLIP_ASYNC not to be used in atomic ioctl") \
> +       FAILURE_REASON(DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY, "requesting page-flip event with TEST_ONLY") \
> +       FAILURE_REASON(DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET, "Need full modeset on this crtc") \
> +       FAILURE_REASON(DRM_MODE_ATOMIC_NEED_FULL_MODESET, "Need full modeset on all the connected crtc's") \
> +       FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_NOT_SUP_PLANE, "Async flip not supported on this plane") \
> +       FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED, "Modifier not supported on this plane with async flip") \
> +       FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED, "No property change allowed when async flip is enabled")
As mentioned before, some of these errors are a bit too specific. We
don't need to have an enum value for every way the API can be used
wrongly - CAP_NOT_ENABLED, INVALID_FLAG, PAGE_FLIP_ASYNC and
MODIFIER_NOT_SUPPORTED should all just be one enum value for "invalid
API usage".
In general, there should only be enum values that the compositor
implementation can actually use on end-user systems. For further
information when debugging a broken compositor implementation, other
tools can be used instead, like drm debug logging or the returned
string.

> +#define FAILURE_REASON(flag, reason) flag,
> +typedef enum {
> +       DRM_MODE_ATOMIC_FAILURE_REASON
> +} drm_mode_atomic_failure_flag;
> +#undef FAILURE_REASON
> +
> +#define FAILURE_REASON(flag, reason) #reason,
> +extern const char *drm_mode_atomic_failure_string[];
> +#undef FAILURE_REASON
The intention for the string wasn't for the enum values to be paired
with a description of the enum - that belongs into documentation, not
uAPI.

The idea behind it was that drivers could add driver-specific
information in the string for compositors to log (only in commits
where failure isn't normally expected), so we have an easier time
debugging issues a user system experienced by looking at the
compositor logs. Sending the enum value again in string form isn't
useful.

- Xaver
