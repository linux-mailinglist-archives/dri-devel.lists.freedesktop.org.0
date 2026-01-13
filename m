Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E72D177AD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 10:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075D110E47F;
	Tue, 13 Jan 2026 09:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Nkn+2xGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E356D10E47F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:06:05 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-47d3ffb0f44so50354145e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 01:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768295164; x=1768899964; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L29VwTANnH+RezFPF6aYTIRBnxavbBsOi/fMTWqtTgQ=;
 b=Nkn+2xGyFCwXbWOwh9z9KokwqnP1sWEr+aDV5m3CTMBRJPY8ZXR30KpVxEbXrg/bBs
 9lWxWX8QmiPwzOSLW/SNRngZVGCpqaOjdZeQRqdaVEYs4MUyy8r4xTIh3SO+EK80sfBh
 WM2nE2xBqh8qKtmKgwWyaXPm9Sf8WptdXBfYQKMt5FTSf29RyegWeFS61dWVjFuJaPbJ
 7mBDg8acyCUW5epEAQCKxuWDgL6tnH+mzx8FwwmKCALUIhJ0UK0FHXu3xDP1rEpIcScH
 sa2fOtmVd1znI5jxj2Q+AQha/zVh2RGL7FJnntUGQk5am3b6mhDuZJrqwiqwGeoamdtH
 nFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768295164; x=1768899964;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=L29VwTANnH+RezFPF6aYTIRBnxavbBsOi/fMTWqtTgQ=;
 b=pTG5hOQazm2J4uS9jw5esGC8LLyo2o866NhgnYZfqZPQ481Vs+JH8UxdLn19ixLC1/
 3TPkMF+ZqrpvqWSXDrSol9JwK4BP/Lxi6jDcz1F9BD5OppLX6M4bU2Veu95Bd9qnz0CW
 zzKuuzrV5Lsba3TscZu9qI8nBhqnsdcAV0Ne6F9pMyUzAGb9pJg2ssIpMW4BfTZyS3bA
 bcwxx7rp/mapxpfBNoIRE8CW0hqRfH1l7eifTjSKMuWl+/iu8ZbgWetzCvA3UvbLcpfE
 DeEyK9K3BhnFWJ0Wfik6XGUBjCHvO1TAtbfTBa/RYfBwvABlZxMadgqLcBRMoliakTsC
 VVow==
X-Gm-Message-State: AOJu0Yw3N+sdtHbfWK4vkMRJ9Dm/CWGvT9pZ+wzQ9vFY0Jw619/LDqse
 h7PhIDAi3Gzd0VBEvO/3JOM+uVveN5QslgL020sedPCe6iJs+/FRkGgyIvegbqhGXkM=
X-Gm-Gg: AY/fxX6Ld9mDdC5vOVbU6mcU51we7yvIX3sn3Vqf5HVRUZdhOljBNP5gjKLfU8YtS+Y
 pPwoTpRX+ADsYW0AoDTXAvYIhLjeOKvK2Y4jqpYUv7duzjJA/csLQij9VgJYLFFYPXZjhnV1QWf
 9mBOdvLIFHfUmmzkxk4f8atjmoDWn9kNSbE0msXr4vUq2BsRJ66uqIFBElAcSawV/3cfLjXaHUn
 K+XXrHHYAK71EYVenQEu/eLgTemHNTanXz1x9BPSOXAyHksz6UTj4r4K7f/ny5MVwEL/4tn2lD4
 h847Hko3cAQjCDTHQ9k1xrGjHliRDAXiUI1wLafqfBsSXxGuvvZuTRrVM4hpb17xy5NCNf2673E
 CjxfErkN/sqvrxjx78uSR9q6OJESqti4TmQakbCWI6PbAAzJNrLB8xs5i8M6W9bZYMSrWl3jZh+
 v2oY8+/osdF+kvbNSUf7VMRKhRR2N9+g==
X-Google-Smtp-Source: AGHT+IFG3j1TJYbfdR6n2OslDfFru4bj1CngQUuByC5GxM/iNtfgfgW4/noUDJ8OQ0s1YIf5EjkQ3w==
X-Received: by 2002:a05:600c:4ed4:b0:477:9986:5e6b with SMTP id
 5b1f17b1804b1-47d84b41b53mr250052995e9.28.1768295164355; 
 Tue, 13 Jan 2026 01:06:04 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080::17ad:35a9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ed9fe7ac3sm11118635e9.4.2026.01.13.01.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:06:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 Tuo Li <islituo@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251218120955.11185-1-islituo@gmail.com>
References: <20251218120955.11185-1-islituo@gmail.com>
Subject: Re: [PATCH] drm/panel: Fix a possible null-pointer dereference in
 jdi_panel_dsi_remove()
Message-Id: <176829516371.3839584.9008115736560140038.b4-ty@linaro.org>
Date: Tue, 13 Jan 2026 10:06:03 +0100
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

On Thu, 18 Dec 2025 20:09:55 +0800, Tuo Li wrote:
> In jdi_panel_dsi_remove(), jdi is explicitly checked, indicating that it
> may be NULL:
> 
>   if (!jdi)
>     mipi_dsi_detach(dsi);
> 
> However, when jdi is NULL, the function does not return and continues by
> calling jdi_panel_disable():
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: Fix a possible null-pointer dereference in jdi_panel_dsi_remove()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/95eed73b871111123a8b1d31cb1fce7e902e49ea

-- 
Neil

