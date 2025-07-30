Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53413B1562A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 02:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7BC10E0CA;
	Wed, 30 Jul 2025 00:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="kPh288dK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC11010E0CA
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 00:02:46 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7425bd5a83aso5932391b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 17:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753833766; x=1754438566;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y/M5/sPM670c0P9olu2X4VtHM3mcoU/sU4qAieG2bB0=;
 b=kPh288dKOCDJ3g3mHsG8EY1DEu/7qwmvNd7jwFe9PSwgcBi15Pa8WR+CTjhXoSwIIG
 XvyIOvwS8XCTmr21XC5eyh/2/hmiH+QwFfpTjybz5L5vdaGQ2HNhLRcZR0B7S9FwCYpT
 skf/IzTr3mxNOPUT85rPMaUunVpbk3Q0r2medb0eN63hNs+LSZaRa92GLOr27CuXwCu/
 pwx1MG+cjDW1LoqguCVQYTpVkpJyIJ6VFs1ovBwQ9pvA3X431Dyu++JXavd5n3RkWYmR
 O002vwSRz7fa+CV+KJwv/N4ayPPMwAIgwDUMf93soQcgvzuAJopnHsQKIZYRz1TPMFr0
 HYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753833766; x=1754438566;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Y/M5/sPM670c0P9olu2X4VtHM3mcoU/sU4qAieG2bB0=;
 b=RxqT92zM5SreQ54yQFdkN0W05EtxUXRSjjVAJy6xJ+y3tlD4Trav2X6HaUhoYBVpQx
 4ux5LvEfR87Z/rPTBI3GI4+7z3h9NH73TUsx9J7z2o1cad0SLMBwmzeWPtbklEIh9QzT
 Qo3foV999D7I0KD7CKBCKrp5GPcEWId9xhAu4y8zS72UrUAUh/4Er1N9yDTBKSvOMxJJ
 T7l3OuuxRFTaW998DgTn/Gfsm414iCl/1dq+NipyVb+QdtKEnktNC4hrbl7QP+A2qZYH
 eS9C42lcwWR3efMsAUE9VoLuEOsGsbLOVwsYIWXPN++maS4eSyvufDv+ieMaPUWPxDmu
 FHzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhpP8yrHNPghwc+xF2PHRcfJ9ho/fwvUBbWJnlzLFiEiNk2UvEZC1AuQRm4WJc/LfwK7OeyaKPMPs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywn/5BUUtEdPiwjYthJaTcDgojOOEVTHgz0WMP5VPz+AJX6sAeX
 LG2KIE+fLwVYIopH9Q4axSago0QP+I/OZeKgQ68zUci0IRUTJE7bqMnVDCy/sudL+/A=
X-Gm-Gg: ASbGncsFBJFqNVEa1jijkmSkUFzurKGHDxDb26mPPXw//uUyEDZxt53W2R2N/7rQHvi
 /iE0NtLEjG2vI79gbIjfmBSF7a0kj4wccF/wHrkX425ZhmaIiUReUXM6eYet96gcfPgVxt1Azm7
 FW+T6N2IGVnvO+kr9MYcNaFWac5HgI4MjePA7/EMzNj2YCb2foH3YgyaVb8veX7iV6BaueS5iS6
 0pKZJDdaUkdP7VjdR8rKYwZ5MijJ+ec61Q9oqI3xL3jRNSNuYWlSyiqwELZj+/tcQBFPXaxBlqB
 /Er9HrTUwDhNZe87VTKw0bq/lrTNWQ0B7uozinVTlfC6wfMSlOB52MJ7KkTUN1m07cdv+4W7EMj
 lKtPDkj0lJB2JSfDmbrl/ax6tgw32uw==
X-Google-Smtp-Source: AGHT+IHVlZ6q95uroEIypdpjQbCuABwWzb7jPvXq7QWXyjT6+dlzAgyJCRMwTznOfewVnzIM/Cjhyw==
X-Received: by 2002:a05:6a00:2450:b0:74c:f1d8:c402 with SMTP id
 d2e1a72fcca58-76ab101929fmr2149656b3a.8.1753833766071; 
 Tue, 29 Jul 2025 17:02:46 -0700 (PDT)
Received: from localhost ([64.71.154.6]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640b4c8516sm8967780b3a.106.2025.07.29.17.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 17:02:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Jul 2025 18:02:43 -0600
Message-Id: <DBOY6KA7U0VE.1QR5VMO09T27H@brighamcampbell.com>
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linus.walleij@linaro.org>, <neil.armstrong@linaro.org>,
 <jessica.zhang@oss.qualcomm.com>, <sam@ravnborg.org>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] drm/panel: novatek-nt35560: Fix invalid return
 value
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Doug Anderson" <dianders@chromium.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250729054435.1209156-1-me@brighamcampbell.com>
 <20250729054435.1209156-2-me@brighamcampbell.com>
 <CAD=FV=VUdfTT4AJk77BFXWy7q_je0EbRKWc=nUVevbgitkn0gw@mail.gmail.com>
In-Reply-To: <CAD=FV=VUdfTT4AJk77BFXWy7q_je0EbRKWc=nUVevbgitkn0gw@mail.gmail.com>
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

On Tue Jul 29, 2025 at 3:33 PM MDT, Doug Anderson wrote:
>>
>> Fixes: 7835ed6a9e86 ("drm/panel-sony-acx424akp: Modernize backlight hand=
ling")
>
> I think your Fixes tag is wrong, actually. I think it needs to be:
>
> Fixes: 8152c2bfd780 ("drm/panel: Add driver for Sony ACX424AKP panel")

Oh, good catch! I thought that 7835ed6a9e86 introduced that code instead
of just reorganizing it. I'll remember to take a closer look at the git
tree next time I add a Fixes tag to a commit and I'll address this in
v3.

Thanks,
Brigham
