Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC297A14FB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 06:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333A610E5C0;
	Fri, 15 Sep 2023 04:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3CB10E5C0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 04:59:27 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c336f5b1ffso15500255ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 21:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694753967; x=1695358767;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BYRpyQlIT436zPtN6nLdUj+VpyPz7BPfenc2yhNBnyA=;
 b=VQkrjVSrVgow9Zv8yBr1s6KLehh3/LcxaQV0noAJE76htLbe82IVpCjoJL3pG1W1/u
 QrIUzT6hTr0+VWFDYBae17AgoVBl31HwKYnh2RB3/mQys132ZDHdE4rdE+YGGpd01Uxb
 lgOY/G6QT7WAO6mUYY569+SrFF0OMk31lWeas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694753967; x=1695358767;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BYRpyQlIT436zPtN6nLdUj+VpyPz7BPfenc2yhNBnyA=;
 b=NCYRPbGxF/k5LGUiapRrVia2rLBTLGk8jHLiWez+usIEBV3ySlvn6cy7SzJzx30XcO
 rG6D1905Aj8Syau93p0xTq9Gjh0Q333ed8sy9YgYpP35r47RgDi/JNoWDI9hhKaO6fk/
 4vWG6M5t6y4J8m3SUtKNFTWKOlyVkmBbfa3gMPGeRG5TjH4RgabH4NA4jhvKHy3OuseT
 Q1f8FTdublJ4u/a47rXIdIpqYO/J2o7nR0JF9FuBcSlUJSpYSST0QSTsjYm3HAfmfu3i
 IwaIS/OuaWYZ383tJoc7GNDbe8UZMTiAsTuoeZwgOw+TAUqxloLZEoobBDhLYvyVcFTU
 3/vA==
X-Gm-Message-State: AOJu0YxFb0qBSXDfg1Q5WREyHqPM3SvqmL0OW9loeMuOOZOWz2vDB5G+
 XEwTgUI5blu4BC167vIEkc2jXw==
X-Google-Smtp-Source: AGHT+IHpnSwhbI66lN4Z3sU7pXA6O9Wq2OcHhE6YgrndvyVXYXJ9PNFRMH9fyCLkUgX/bGvjpC5C/A==
X-Received: by 2002:a17:902:7081:b0:1b7:fd82:973c with SMTP id
 z1-20020a170902708100b001b7fd82973cmr618871plk.39.1694753967460; 
 Thu, 14 Sep 2023 21:59:27 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001c0a414695bsm2461749pld.43.2023.09.14.21.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 21:59:26 -0700 (PDT)
Date: Thu, 14 Sep 2023 21:59:26 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] drm/nouveau/pm: refactor deprecated strncpy
Message-ID: <202309142158.59A6C62F@keescook>
References: <20230914-strncpy-drivers-gpu-drm-nouveau-nvkm-engine-pm-base-c-v1-1-4b09ed453f84@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914-strncpy-drivers-gpu-drm-nouveau-nvkm-engine-pm-base-c-v1-1-4b09ed453f84@google.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 10:17:08PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> A suitable replacement is `strscpy` [2] due to the fact that it guarantees
> NUL-termination on the destination buffer without unnecessarily NUL-padding.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

The "- 1" use in the original code is strong evidence for this being a
sane conversion. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
