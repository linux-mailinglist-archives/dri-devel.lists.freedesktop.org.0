Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432AA668744
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 23:49:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1794210E955;
	Thu, 12 Jan 2023 22:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F72510E953
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 22:49:36 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id s67so13802289pgs.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 14:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SWHx2ArszmWOMvOmL9HMTqeLRyXml8x4aecIK4J1xfM=;
 b=T2d6xQChtkuCRaI870QbrNhFwwVCxfB/ltmBQERjU/+oJfBXhY/cz1RHeYyjIdraiI
 0RZZ1XMlhfo7B3NY4rKRaaxKLRWCZVgiVPgtgr17CgwOgHSIpYEu4zv+lpmlbvU88r6e
 jK9fILTLJRz6ovtajskEvsL9o5FUM/PTks/iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SWHx2ArszmWOMvOmL9HMTqeLRyXml8x4aecIK4J1xfM=;
 b=tpBsWhLvSb1hXS9ZlZHaVxJPpH2smZkju7HJ20eXHV0IIyRGRkRfOvbKP9sH9nYY4w
 NJRZyBZKojzAbHOXTF08ntQ2op33ANFxgYoqCuX1hWr3eUe5c7gsoQo7r0TuQUVZOsB5
 Y1JTjJaTcxzdD2J70rmnEy9ot2LXRWft54dnLk0VQxRTovaQ7QN74Pzn0Ys+HEJU36kk
 S01g7aWKd52S/9eDL0YD14js69/2jKfnOWZsJzOMXT2nDXAr6Ve8wLSWsqhajT6fUos3
 y3wX+uXMphZNIqyj89o5oNoEJtrlZBZKxqpesL0LThYdYHmajwjoWiV6WVEO6xw6Xr/Q
 h3kg==
X-Gm-Message-State: AFqh2kqgaYm/PUitMQGq1kCjQMrHSAQ6hV8u+/nSYPLh5rHWzrYdhxpL
 oFALD8D/kap8htmIUF4Fm97/Bw==
X-Google-Smtp-Source: AMrXdXtrkkqEGE9cFZZR5OGma23Ht+dZor8UGc1LpcFDNVZF1aHL808lC/1ioJhhRsAmf4y/+tUmZw==
X-Received: by 2002:aa7:99c4:0:b0:589:69ec:c6bc with SMTP id
 v4-20020aa799c4000000b0058969ecc6bcmr8245382pfi.21.1673563775884; 
 Thu, 12 Jan 2023 14:49:35 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 x14-20020aa79a4e000000b005811c421e6csm12220412pfj.162.2023.01.12.14.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 14:49:35 -0800 (PST)
Date: Thu, 12 Jan 2023 14:49:34 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] drm/nouveau/nvkm: Replace zero-length array with
 flexible-array member
Message-ID: <202301121449.EE489AA@keescook>
References: <Y7zB0q2pr7lEpHGs@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7zB0q2pr7lEpHGs@work>
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

On Mon, Jan 09, 2023 at 07:39:30PM -0600, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated[1] and we are moving towards
> adopting C99 flexible-array members instead. So, replace zero-length
> array declaration in struct nvfw_hs_load_header_v2 with flex-array
> member.
> 
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [2].
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays [1]
> Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [2]
> Link: https://github.com/KSPP/linux/issues/78
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
