Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A9393F753
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 16:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE5610E06F;
	Mon, 29 Jul 2024 14:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V7FftfET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F9A10E06F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 14:10:28 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-25e3d8d9f70so2229080fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 07:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722262227; x=1722867027; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LNp+cQPSoj/8O6JaY8fRlRrTVGCksavAKQMIAp/dl6c=;
 b=V7FftfETW1Tr3849Ku9SCkwn5JndBNQmtWjMRYBqxF7pKGWVp1H2dO6Rhj/NJLHQVI
 HEDc9OM5VaTsMbOWvvNTzQ5x+g7FvPTX3n3g7m5tmy9m+C0wMm7VuKotH5yQkNADay3h
 T3SaKoftF83/RJ+8CBEdEqW8uY0DHoxj8rHmY/jhN5y+LtgqYoD4ziBXnyLNfb83o/n4
 8IJcXt8A/zLUmh/Bb6srfR8MJsfle9GnekVnKIZxsLMoQddJt++KzQKdSSYd0TfABxbg
 hDYInpznqxDFovEQlfeEMgk9KuT5gsN+54DxZ2s9UlB60MJGwgAsA5C1zNAYfWOYOjXd
 ftLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722262227; x=1722867027;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LNp+cQPSoj/8O6JaY8fRlRrTVGCksavAKQMIAp/dl6c=;
 b=fSqikVDSTIqFS+upodIoPZIQ1+e4qTXSyTXguFR+Z0rLHVAS0ZXSbaOVIWOpbEwiWJ
 oiuWJQTVTBYyYco2py/Qmzh3uXWGhN1NpMbFdar5QXqg/Cvj0m8umcKo+GaYWhqgkeQm
 xa9T0bmLkoqY2ao5mHzTclpoE4Ui2cYiUCxi+VCWs9FxvMW8YTqdzynUF5iTBXDxl5wR
 9ybVEBFyDpAo1tC0NqHzWv1hdHA5+xf0+i+hvkr1dwLX5F2CFcG4bajUXc4QYt0DHGyS
 zG2wnl+Zd7L1NFVjlIMSd3IEBhhyaawVcdG1Ry3HwjSU6sOaD5Mw5ZbsDZQCKM9ewJsX
 uLIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYbpS5Rx1Z9nQ3iR96ATgUd7dDFXJpgZInnIU6t4qDnjjV9fa6RmaJxl77VMNkanJ8eZg97U4aIUW/bAMJEobQfX4JvZOTvGdW0XI+LoNC
X-Gm-Message-State: AOJu0Yxhy/1ApB6mSq8Fh/gnoBgU2Cm/1slIUylKBhnMIsKAowUg+KOP
 3vpdkrkbIjTrhPAmhT7TXkz1ZmIxOtmPIFtBhi+F4AIzSY/uPHJHF1pHtxjPajM=
X-Google-Smtp-Source: AGHT+IE3F+o5CY91JWS1hd0lkqMsJMWrwAKpE0XMh1kK950xmMKvPHuWAQCxIuhFBKMTtCuJb/sdLA==
X-Received: by 2002:a05:6871:3312:b0:260:e678:b653 with SMTP id
 586e51a60fabf-267d4ef4399mr9073460fac.42.1722262227161; 
 Mon, 29 Jul 2024 07:10:27 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-70930722531sm2096942a34.38.2024.07.29.07.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 07:10:26 -0700 (PDT)
Date: Mon, 29 Jul 2024 09:10:24 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Jingwen.Chen2@amd.com,
 suhui@nfschina.com, bokun.zhang@amd.com, chongli2@amd.com,
 Luqmaan.Irshad@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 guanwentao@uniontech.com, shaoyang@uniontech.com,
 hongao@uniontech.com, wenlunpeng <wenlunpeng@uniontech.com>
Subject: Re: [PATCH v2] drm/amd/amdgpu: Properly tune the size of struct
Message-ID: <93d10611-9fbb-4242-87b8-5860b2606042@suswa.mountain>
References: <D51E93EE77EF1231+20240729140000.890760-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D51E93EE77EF1231+20240729140000.890760-1-wangyuli@uniontech.com>
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

On Mon, Jul 29, 2024 at 10:00:00PM +0800, WangYuli wrote:
> The struct assertion is failed because sparse cannot parse
> `#pragma pack(push, 1)` and `#pragma pack(pop)` correctly.
> GCC's output is still 1-byte-aligned. No harm to memory layout.
> 
> The error can be filtered out by sparse-diff, but sometimes
> multiple lines queezed into one, making the sparse-diff thinks
> its a new error. I'm trying to aviod this by fixing errors.
> 
> Link: https://lore.kernel.org/all/20230620045919.492128-1-suhui@nfschina.com/
> Fixes: 1721bc1b2afa ("drm/amdgpu: Update VF2PF interface")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: wenlunpeng <wenlunpeng@uniontech.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---

Thanks for doing this, but these Signed-off-by tags aren't correct.
Signed-off-by is like signing a legal document.  It came out of the SCO
lawsuits.  SCO was a scam where SCO claimed that Linux stole their
source code and tried to get Linux users to pay licensing fees.  (No one
stole anything and SCO didn't even own the copyrights to Unix, those
belonged to IBM).

You could maybe use the Reported-by: or Suggested-by: tags for Su Hui.
But the rest of us could just be Cc:

Cc: Dan Carpenter <dan.carpenter@linaro.org>
Cc: wenlunpeng <wenlunpeng@uniontech.com>
Reported-by: Su Hui <suhui@nfschina.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>


regards,
dan carpenter

