Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AF1891249
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 05:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78C210ECE7;
	Fri, 29 Mar 2024 04:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Yu626sxf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B9610E879
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 04:05:52 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-5a49261093cso862204eaf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 21:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711685091; x=1712289891;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=69VUW1JBrC64hXBRbspWF21+J8tNtsC9yt2uIqIg1HQ=;
 b=Yu626sxfHtIva+0AnXt57y46OyobbvG+MNAk70sWlrUG8TzifOGKrVQv3JALv5SZor
 pzFNgGefkEqQVQuuGQI/RHf2ixSJRgxq8n7BIYCPJXwTpbRW++bBM3+weiksRt8TDfH8
 HirBfJJls5B6VGP18TSYbRBU1hKS99j571+E0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711685091; x=1712289891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=69VUW1JBrC64hXBRbspWF21+J8tNtsC9yt2uIqIg1HQ=;
 b=GKEUVdc5Q7H1M8ClKFGdcLKQiZMsQUEPQorb8GDP97cHqpq+0oHo0jyD/HGGzne3YG
 /lMj1K6aN7zGlF1/oTcG3ACrTNPSQSXb2b4QI8Q4pNX8Vdla1Qnm/b4vNEPX95Lpgcdm
 wmOd0j6mYTLBSh9JTXiMMiBroDSqMOzebsZ1CGB/GLR258DSOzoTjGr2i/uDMP4UZni+
 MXftGQWn5XzKptXf0rszvEoKBjf5dCNsksQnBUBhFSScTdbiYvam6ppDNSDxlGT+kGHV
 QjSQT0rbLPvkw36Thz9nxTIBl2r3Dn4rWiasgqS2V39d0fsTjmU5CdhlVRUzSTABcprW
 i1rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcQSbhZ79XiMiD5kwMWveZO7199QDwWWSdqPV4qUHzJ7+0dIpnqr0rdlvdkci6yvB8NP0A/zzsz+F5w2+BKcxu3oRnkDfs6TfR+k9lvTLK
X-Gm-Message-State: AOJu0YxnbLtMBLHguBGW6bEejpYj8mrPMljAos3JuE39iebLEdfXXuMx
 RzFeSVKfz7Skk7nIHZhEYoCsLG7+G2k/F90tASvRaE4zHsbsDV1YiIJAcRmjfg==
X-Google-Smtp-Source: AGHT+IFvNh8aPME+bk9MigIg8cgiL4SPF+c4/TssLm62fUGeJU6j/Ecq0WtTIJm48S6HEzmuuKfGsA==
X-Received: by 2002:a05:6870:c34f:b0:229:c1d4:83bf with SMTP id
 e15-20020a056870c34f00b00229c1d483bfmr1130237oak.8.1711685091224; 
 Thu, 28 Mar 2024 21:04:51 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 q14-20020aa7982e000000b006e73508485bsm2159777pfl.100.2024.03.28.21.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 21:04:50 -0700 (PDT)
Date: Thu, 28 Mar 2024 21:04:50 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] video/hdmi: prefer length specifier in format over
 string copying
Message-ID: <202403282104.CC17451@keescook>
References: <20240320-strncpy-drivers-video-hdmi-c-v1-1-f9a08168cdaf@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320-strncpy-drivers-video-hdmi-c-v1-1-f9a08168cdaf@google.com>
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

On Wed, Mar 20, 2024 at 11:22:02PM +0000, Justin Stitt wrote:
> strncpy() is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> It looks like the main use of strncpy() here is to limit the amount of
> bytes printed from hdmi_log() by using a tmp buffer and limiting the
> number of bytes copied. Really, we should use the %.<len>s format
> qualifier to achieve this.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
