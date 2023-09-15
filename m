Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1334A7A14CB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 06:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483F810E055;
	Fri, 15 Sep 2023 04:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE7910E055
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 04:30:45 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-565334377d0so1347509a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 21:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694752245; x=1695357045;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XsL0E9wvxns4U7l/ZwCaHkG93dEorgZ6k1wpN9ixUXY=;
 b=Hwn9CuCaY86A975isoUdPK+5GIOdFwYGRFd/np5PD7LWS4vWvqAiETAEGoC4ya6nJC
 Arw0YMV1pi3C9lt/H4UmzfBJcyKpH9J3XFiF3uKp1KCM2x3VdZgDGzVsQWXbMhr9hOOj
 2iIfnROVehMFI4v2qpPRgDdk7oznqe2Vndgxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694752245; x=1695357045;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XsL0E9wvxns4U7l/ZwCaHkG93dEorgZ6k1wpN9ixUXY=;
 b=Jbgc2uF4l9jAhPSZxbfbUPSVkpZA/sETxCuMMzwcH7sI3d+v++0Vj3IRmcpAapSEuR
 /KnaY5rNdkNDNAQFJOWuvWApzq/tPN+0ODAzjOQgM6iVwqSiiD71hcDloro9gnQFVaxf
 CWKV3Lsr4bzS//UblycPIZacgatcjG4QfkLcdFypMXObmnqiyQHNeJIE1cL8idt5nZrI
 KIHpxSDlTMIJBaD6LMTRB3l1tepoakiTtLezIEIFSxDWYTfVUwkJPT3B2B4u/TLjem83
 eJc3N3WZ7lP7i0+CQZlivrZhloZVkgnhaV+db9sK3ihXDsD3PeXZ7f9unOxNi9FQ7eZY
 YG4w==
X-Gm-Message-State: AOJu0Yzlj4jcUychVmQQ1jc9DK7SE8Ir/J1En/PfNigQo7iH5b7hGnU6
 QdDmwYWAOjFjbeSUi6lTZ3tKsw==
X-Google-Smtp-Source: AGHT+IHQxJBzE959LD14CEM1tohj88xdcd7+u7zKv8kSGIXuEzf6ekyCP/qKCPCuomlgXxkHpjJDxg==
X-Received: by 2002:a05:6a20:3255:b0:14d:6309:fc94 with SMTP id
 hm21-20020a056a20325500b0014d6309fc94mr747971pzc.36.1694752244954; 
 Thu, 14 Sep 2023 21:30:44 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 a6-20020aa78646000000b0069026841829sm2049947pfo.113.2023.09.14.21.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 21:30:44 -0700 (PDT)
Date: Thu, 14 Sep 2023 21:30:43 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] drm/modes: refactor deprecated strncpy
Message-ID: <202309142129.46C1EAE2E2@keescook>
References: <20230914-strncpy-drivers-gpu-drm-drm_modes-c-v1-1-079b532553a3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914-strncpy-drivers-gpu-drm-drm_modes-c-v1-1-079b532553a3@google.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Xu Panda <xu.panda@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 06:08:44PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> A suitable replacement is `strscpy` [2] due to the fact that it guarantees
> NUL-termination on the destination buffer and doesn't incur the
> performance loss of unnecessarily NUL-padding.

How did you decide it didn't need %NUL padding?

I suspect it should have it, as I see what looks like full struct copies
happening in places:

        struct drm_mode_modeinfo umode;

	...
                struct drm_property_blob *blob;

                drm_mode_convert_to_umode(&umode, mode);
                blob = drm_property_create_blob(crtc->dev,
                                                sizeof(umode), &umode);

Can you send a v2 using strscpy_pad() instead?

Thanks!

-Kees

-- 
Kees Cook
