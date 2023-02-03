Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B39168A0E9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 18:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1637C10E828;
	Fri,  3 Feb 2023 17:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0830110E826
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 17:54:07 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id e10so4136746pgc.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 09:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=LLnqCYAl80KX/AnP1MJvwNbR1JOT9Aa+XpKrlSinwlU=;
 b=gFMT+46x88hehfxt5nx2SHbG2j17btymqYVEISu7Bm/njCyE3UWdBByqE0ygnOpqbq
 RyXlYuL4F5rbEaCNn+aV31qhLuDPXngVVgCbE1BKV6mZgSIgQh9L8CMbZwo8khDT5YyX
 x/M7eOzHzP5TXUSTLQ1ZMWBgXCRirXQmAIqoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LLnqCYAl80KX/AnP1MJvwNbR1JOT9Aa+XpKrlSinwlU=;
 b=rfBOQECextLwnm+yEovLY7ak0OZFOiemT2gVQpKrD3QWPdi4a2HF/N9yjCiwLIh0wr
 xt4T1xt4zA53TkJ/J5OxHk+CrnjMKOC6ZFLOIaXbXRFziqKsaJQNL68WIVzNYbCTxq29
 pFPfPQ3v79CkcFJXezZzwaQ1boo4/eASRZ2sJGsf375YLA99+jIYh1tKH2iH2Uekwts8
 lJ7btoP8grSgQxx26hUcqirel7fjuTB/0NZT1TKLNq/bJFS9jEQ2mPOnGQhc1zaSEZSi
 5y4gO8D83V3G4NzIggaDbk9WZ4ejrxx3TH2c08nSsZ40Khxzh+u9rKHB8ojm4165ClEN
 YwKQ==
X-Gm-Message-State: AO0yUKV/u9K9YVLa5ePi3ECDjsdzsVctxSVMVvBb2LKj0oJNS+TzCAF7
 bOy0QCfkZkvXVyN+KhCJVtSSuw==
X-Google-Smtp-Source: AK7set9g3wK6cBF7u1oZ+DgClsdvFB5iS6W2QtUSeUf14md3Qq7pBO/9xIF/z0HeTuuWMIvw3W6qcQ==
X-Received: by 2002:a05:6a00:22cc:b0:58d:f20b:5f2e with SMTP id
 f12-20020a056a0022cc00b0058df20b5f2emr14077223pfj.1.1675446847523; 
 Fri, 03 Feb 2023 09:54:07 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 p21-20020a056a000a1500b00593d7db7f29sm2068958pfh.216.2023.02.03.09.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 09:54:07 -0800 (PST)
Message-ID: <63dd4a3f.050a0220.fd05.3c7a@mx.google.com>
X-Google-Original-Message-ID: <202302031754.@keescook>
Date: Fri, 3 Feb 2023 17:54:06 +0000
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] drm/vmwgfx: Replace one-element array with
 flexible-array member
References: <Y9xi7nFWRV3S9gCg@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9xi7nFWRV3S9gCg@work>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 02, 2023 at 07:27:10PM -0600, Gustavo A. R. Silva wrote:
> One-element arrays are deprecated, and we are replacing them with flexible
> array members instead. So, replace one-element array with flexible-array
> member in struct vmw_view.
> 
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].
> 
> This results in no differences in binary output.
> 
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/254
> Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [1]
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
