Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41F8C7A5FF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3839A10E895;
	Fri, 21 Nov 2025 15:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bRpp6k3t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445EB10E895
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:03:15 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4779d47be12so16812785e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 07:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763737394; x=1764342194; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/rMGPhIF9yY9grNNRyQ+ygeZWk0DaZMplPyvp51ZIDQ=;
 b=bRpp6k3tu1l9LilWg5BRbpJLmU/Uy7MQC0x02hpfq5QdAl0EswNFqKN0u07wzSx2uw
 MdraTp7NUnvZzuMepSyBB1NBm1HbFWCCegHDIRqOCAkA133Ikz7IjRbjsCqxILEhj77q
 Eu+dYNbbq10W2mCxP0gLIf8uATyAg98M9qMHAK/mgF+QOxFROKAZtDzFzQqM0wHvIjBC
 r15TTn/RjjRp/VReSTgIxnh47hgI7ITce9huLZiXyvj0iQgfsaTFf8BsADH9hq94MV/S
 EdZdNZ/AxFiUJHYR+Xsz3EPAzwcnft0do4bCKEIuiaLr+tmfMnqV0rdCc97fqGGusrFb
 mNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763737394; x=1764342194;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/rMGPhIF9yY9grNNRyQ+ygeZWk0DaZMplPyvp51ZIDQ=;
 b=vDkNvjLFP5YAqwkJ65iiXXME7oJ/YdOcymgVg2wRYZRC/qvbPUXzyuOcK5mAc0CySx
 jgtTc4dFoqIjagLa8LIiaMPbNnnM6F/JE5qZk6XG6om4AxvMIDfWp47Fx5IXQMEZ3w8V
 NvmN/tgBEu/hly46gd65QJEi/r+Z7k2+7spdAlLw2wecywl5ZjyIjszY69+xfMQSgjKn
 rKkxz8ublBcbCUP/c8ZzQYoJoP2csGzTTBPDW8dHyU3HnwCWMcAaTVPkErYNXF/wkRTU
 YeVxyaGbHnIawDsvyhQNQeCkX4JIl9dPksjc+/vt3vwUDK/QqSbgOH4g+VxF/PKu2/Uy
 fESg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaVy25XCWjBXJIPKz62YmUczm7/bHQg/Y85b4pAQluMCBvw3duAR3MiDjmr0ZQXzupvoQeB90AgeY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCu9PfXflBwDnbeuomGcy0R79awLeykMn9GNOMEebwB6dNVJmM
 dITpyWIXb5YkKR8/4aEg7e1q7WVD6G+vrv8KFmCo49aJDIFOERKRoVb4Y/rij3baFZNIyvX0XTt
 6sH8Sb8M=
X-Gm-Gg: ASbGncv4cZTX4rq8oSdYYuBX7wAcYJcOEsuwwJI1rXh44mHR1yH3XyRrabj1Zll5jFl
 rei78YFyyKs1andZoTRQ1em+ltS0PbBMG7rMHg0EaKHnJGnXLIU4oNtvspkAKtYsFQadkLAGDeD
 YGYoVYtWDd3SwJP73KwvMpxwtQUnirwsZXB9Tias0SF3UFrKOfpSA5WnjIsCudnQzLgjsgHfooV
 BkCKD73D+xiNGjZD3GBROzRPLjhp2qwuPhqNu7CFnBCks+iConb0hYl54OpopmBKGsuVBqBGjMD
 QYmBiC4eSnM+L3YsbNj6pEUkqmlxUnv+tjvOaKStYT586JCX2fAhWOvDnz0i24zJbS8NsPYwHqj
 myWGr+B7WTcRhVPedvyvaHT6xm+PNW/3L/ewm0/MkGc65zJqQ3TMo4pQK2ZQd9i0d9Z1qtxok+F
 YVgBvfaV/dthd3huZce+wnfdIkjA1Fjmk=
X-Google-Smtp-Source: AGHT+IEvkcjCWHOGkvqunkPqZXFma+mlTZawsj4Ti6PhRG5pHSm7GPa5JtsJ4tKFSDWApDFKzbX70A==
X-Received: by 2002:a05:600c:1c82:b0:477:73cc:82c3 with SMTP id
 5b1f17b1804b1-477c01ee405mr27061645e9.26.1763737392148; 
 Fri, 21 Nov 2025 07:03:12 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf36f535sm49989405e9.8.2025.11.21.07.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 07:03:11 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: andrzej.hajda@intel.com, rfoss@kernel.org, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, jani.nikula@intel.com, simona@ffwll.ch, 
 linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>
Cc: tomi.valkeinen@ideasonboard.com, praneeth@ti.com, vigneshr@ti.com, 
 aradhya.bhatia@linux.dev, s-jain1@ti.com, s-wang12@ti.com, 
 r-donadkar@ti.com, h-shenoy@ti.com, dmitry.baryshkov@oss.qualcomm.com
In-Reply-To: <20251030151635.3019864-1-devarsht@ti.com>
References: <20251030151635.3019864-1-devarsht@ti.com>
Subject: Re: [PATCH v4] drm/bridge: sii902x: Fix HDMI detection with
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-Id: <176373739119.405542.6739584381002284376.b4-ty@linaro.org>
Date: Fri, 21 Nov 2025 16:03:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

Hi,

On Thu, 30 Oct 2025 20:46:35 +0530, Devarsh Thakkar wrote:
> The sii902x driver was caching HDMI detection state in a sink_is_hdmi field
> and checking it in mode_set() to determine whether to set HDMI or DVI
> output mode. This approach had two problems:
> 
> 1. With DRM_BRIDGE_ATTACH_NO_CONNECTOR (used by modern display drivers like
> TIDSS), the bridge's get_modes() is never called. Instead, the
> drm_bridge_connector helper calls the bridge's edid_read() and updates the
> connector itself. This meant sink_is_hdmi was never populated, causing the
> driver to default to DVI mode and breaking HDMI audio.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/bridge: sii902x: Fix HDMI detection with DRM_BRIDGE_ATTACH_NO_CONNECTOR
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d6732ef4ab252e5753be7acad87b0a91cfd06953

-- 
Neil

