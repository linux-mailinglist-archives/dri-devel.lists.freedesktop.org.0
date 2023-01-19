Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C1F673261
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 08:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04DB10E8B6;
	Thu, 19 Jan 2023 07:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9BE10E8B6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 07:24:22 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id z5so914661wrt.6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 23:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BuvvxU5SQjrPNh/tsenI3bDuTK1r+L/h3C2FusTkVJM=;
 b=naPlxqGjiqVsWt05MsYVWdzKkcBus4Gbs4pbt/tn1HcDoe3V89aXmti61qphNonjLY
 7xcsJSm+V2e1WNwIb52SN9OF/FOzQibPCPORVLt3So/RfhORVa/769EFquj2bA23dujL
 fcyu3Q2k3Anr+CMEbYiReJa5vfqn/H1rrcHY1GwVNrsy9x3smdC9hntNrgDAxQkNAfba
 0mxuG6Jv0Q9cFhrhwhkHKKsrc+AJzFFNi8VMxBvfmOTUDmlejKtaiwxCFpbKCRZZRUl4
 AQt0wGDkiaYSvHkdNxB9lNvGFAYv9OlQH7nzkyqKfGUg+0Ic4bqF7dbZ7RHXGkg4QRAH
 zlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BuvvxU5SQjrPNh/tsenI3bDuTK1r+L/h3C2FusTkVJM=;
 b=LKgchZvk+FlIr+6lbGPVIewup627tSzw6+hAfBGe7QWhadDJyRjjfbk43405GaK/8t
 EomKaEfesuAuhgWnhbag3kZzM6ryVj8fckO65lITypSzaBuO1C5GAN8nZUM/GXBDc0hV
 Un8txhxVLVQU0evUJKqk0MHgRT9ZhcQaELPp2uIBOR8uBL97Yw9IltV8SUEHOwpxJc4i
 m/4zbcREY19i31HJCq9q6VVSR/gCvNNUbiap9YI1LzwCi6YuUM33uicouzcM1k+JAA+J
 W9/Ureu4qtEEOlGWlJYP+endAsieN89Gom6EsfH2JHcUZDYEA7+xb+EDD5qRIWc5kMl5
 HVEA==
X-Gm-Message-State: AFqh2kpoSp3LP1TQao/eccav7PVm09o3jLZn3BqgCsR2lBDwhRLFaQqz
 Sv0Xdf7hkFslUhBjJomH/st9bulAzUqflyAQASM=
X-Google-Smtp-Source: AMrXdXs2UyDs6MMmSx1HD83ql/F8H3MVkRcUOF5XNTPpk8+TtFKjPT9nGENMak1zYW6i+qrg+2qEKQ==
X-Received: by 2002:adf:dd01:0:b0:289:773c:59ee with SMTP id
 a1-20020adfdd01000000b00289773c59eemr8341444wrm.6.1674113060803; 
 Wed, 18 Jan 2023 23:24:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 r11-20020adff70b000000b002bdf290efdasm10397537wrp.58.2023.01.18.23.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:24:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, Vinay Simha BN <simhavcs@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Richard Acayan <mailingradian@gmail.com>
In-Reply-To: <20230116224909.23884-1-mailingradian@gmail.com>
References: <20230116224909.23884-1-mailingradian@gmail.com>
Subject: Re: [RFC PATCH v3 0/3] drm/mipi-dsi: 16-bit Brightness Endianness Fix
Message-Id: <167411305980.243807.4478206402643640808.b4-ty@linaro.org>
Date: Thu, 19 Jan 2023 08:24:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.1
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
Cc: Caleb Connolly <caleb@connolly.tech>, Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 16 Jan 2023 17:49:06 -0500, Richard Acayan wrote:
> Changes since v2 (20230114010006.50471-1-mailingradian@gmail.com):
>  - patch vtdr6130 to use _large (3/3)
>  - remove Change-Id again (1/3)
>  - change patch subject (1-2/3)
>  - correct function name in patch description (2/3)
>  - add Tested-by tags (1-2/3)
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/3] drm/mipi-dsi: Fix byte order of 16-bit DCS set/get brightness
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c9d27c6be518b4ef2966d9564654ef99292ea1b3
[2/3] drm/panel: sofef00: Use 16-bit brightness function
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=fd40749a4f62a03d0aebe6eb446ea84a9901795a
[3/3] drm/panel: vtdr6130: Use 16-bit brightness function
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9402cde9347eca050e14ea9e47270e84a6899162

-- 
Neil
