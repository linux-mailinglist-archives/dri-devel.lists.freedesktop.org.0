Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4137F70CA97
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303E610E285;
	Mon, 22 May 2023 20:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB3410E286
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 20:15:18 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1ae52ce3205so44450455ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684786517; x=1687378517;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7kJUhMwhu8pmB0S/reI91bCPURToQamQOJVM6YT2PQk=;
 b=K0i7JwPBVmGMOLMWLK/3kPh9tQi1cz1mf6ZiGbF/qmCvezU63ySpE7rp+c4R65Zjs9
 zimyPm3Odf3qhFjVr9OwQ7BCcY6Pec/gRL3wCPUSN4Gd+jk/oC+PnZ/s3udoM5zUnE5p
 20QdzjUctLVil0kxmBOGLAgfuZC2jtKYOjFz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684786517; x=1687378517;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7kJUhMwhu8pmB0S/reI91bCPURToQamQOJVM6YT2PQk=;
 b=LXkvZGqzb2vOF/J5OPc+d5HJKw3TMkg7Yh5/WeazdiR3AgoE8a2TLFs8tm/c5v2+du
 osnXyM44dxhkeShCtV20T3iOr3OIObBoiqdJnK135R3+uPPITpUkyiy8mVVhBzg9EvZo
 bfysueSNMpm44lviAdJ+RV7X6g20Q0+wWk8z74cvr94LPhKqxztY2QCS9fpYNF8w5wL0
 bz9lR+tDZN62S3IVlUlKz9SGhGOHtehe2xmQFMQMMAOcKSGx8VnbV2G5sowWAsqGLyoP
 QnmuuEmRHJZjoUoTbahu0HktkshIOCxdG7oZUjfG9Q6f7x/dasDDuW9tdNZHguHlNuD3
 Ne2Q==
X-Gm-Message-State: AC+VfDyEfuKkBJi0cJ4aj2Kb19qGk4N/ywEhLSlrFQ4ElAomM1KkqFz/
 NB0C623chCP8i//pHIHvKndfow==
X-Google-Smtp-Source: ACHHUZ5QSapbcHFKbYzfAO0Hf2n6h4/H3FAnhE+dze/4InLVr1Uc7D3qUfrMrjPffZ+EQHaD+UWsGQ==
X-Received: by 2002:a17:902:934a:b0:1af:c1af:8d83 with SMTP id
 g10-20020a170902934a00b001afc1af8d83mr1319174plp.45.1684786517491; 
 Mon, 22 May 2023 13:15:17 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 l6-20020a170902f68600b001ab2b415bdbsm5247305plg.45.2023.05.22.13.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 13:15:16 -0700 (PDT)
Date: Mon, 22 May 2023 13:15:16 -0700
From: Kees Cook <keescook@chromium.org>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Subject: Re: [PATCH] drm/display/dp_mst: Replace all non-returning strlcpy
 with strscpy
Message-ID: <202305221315.9CD6F67@keescook>
References: <20230522155124.2336545-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522155124.2336545-1-azeemshaikh38@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 03:51:24PM +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
