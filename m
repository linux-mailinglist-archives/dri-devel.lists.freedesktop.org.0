Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 393B9611FE5
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 06:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B85210E921;
	Sat, 29 Oct 2022 04:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A8E10E921
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 04:04:53 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id g62so6348321pfb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 21:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tMaMkImdQZaNqUgti1ui/K41+y+AL88pFosNOHMxJ84=;
 b=Ux1QnJSFsPhlOZ53YWzFTayM+PUEQP5+/uXEqueNh0EqtsgtSI9Prvj9twfgh5pDXw
 29+JZmQ5svNpUpDGhBNpo1dpbTcnNFcima2Y3Jg9Tc2OzMjiaQWtqgirDYvgaVHbOU/P
 06oSPhDdtRxnWGg7n39UhlmDp4mL6X13qdmyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tMaMkImdQZaNqUgti1ui/K41+y+AL88pFosNOHMxJ84=;
 b=YUuUZYaUJt7D0MHpe4B4zhL721IeeNuH6jsBsZOVr4c51SXrbOHv0DULCyUMHRdjvm
 BJ7lGXz4xfAfNHOu/Y+RlzVuTVazdu4V6bLhi9pMDJsthN+D3Hk+I42NsD7hh2RriVmP
 5aWHpalIko3GcnHaP32W7xO+aQkVlA1tlmuV4CEhtW0R2cRwn3SDx2yNM7qX19kHJRIr
 6ZTOX1ZnWiMDKhyUI+kNbkimsizLnwi8jP6F5G7BZ3Krp9yLQLM9bIuV5agm2k/+MLdq
 WGGNjRby1o05YNXJkVyi+q4rD05Vr4xjRz/wIVCtBXGKHCV+42xkreJQx09lT0lEZnH4
 ewhQ==
X-Gm-Message-State: ACrzQf2l43y1nuxQ42d9LK0eaDPXz7L3f/91400uYpl0w7GMRPoiFmNk
 uEEpOfXk3rRVnvpIcPJjbRPx8Q==
X-Google-Smtp-Source: AMsMyM7t6QlEKQZM+4owmDR0tkjanbFz+ACEy3fBIM1prLQKttFi7mMcho6fjf8O7bNpqkxQyhRzVA==
X-Received: by 2002:a63:a06:0:b0:458:2853:45e4 with SMTP id
 6-20020a630a06000000b00458285345e4mr2486144pgk.20.1667016293156; 
 Fri, 28 Oct 2022 21:04:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 4-20020a621404000000b0056c704abca7sm218661pfu.220.2022.10.28.21.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 21:04:52 -0700 (PDT)
Date: Fri, 28 Oct 2022 21:04:51 -0700
From: Kees Cook <keescook@chromium.org>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Subject: Re: [PATCH v2] [next] drm/radeon: Replace one-element array with
 flexible-array member
Message-ID: <202210282104.4981D58822@keescook>
References: <Y1trhRE3nK5iAY6q@mail.google.com>
 <Y1yetX1CHsr+fibp@mail.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1yetX1CHsr+fibp@mail.google.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 29, 2022 at 04:32:05PM +1300, Paulo Miguel Almeida wrote:
> One-element arrays are deprecated, and we are replacing them with
> flexible array members instead. So, replace one-element array with
> flexible-array member in struct _ATOM_FAKE_EDID_PATCH_RECORD and
> refactor the rest of the code accordingly.
> 
> It's worth mentioning that doing a build before/after this patch results
> in no binary output differences.

Thanks for checking it!

> 
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].
> 
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/239
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836 [1]
> 
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
