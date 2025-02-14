Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE9DA363C3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 18:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362B710E05F;
	Fri, 14 Feb 2025 17:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gVVOlnVI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B8910E05F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:00:32 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54506b54268so2238317e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739552429; x=1740157229;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c2tb/suTl1nSS8YywUwSH5Dc0llHnUO+gUroKzzSxGM=;
 b=gVVOlnVIGtCBxrYq8WFFL6NQnbcovInpVVrUHsg8D9aySGRWtyxPxMR0c+UKF9QyTF
 anFIHvRP75LhCKQlnLJya1BWgVjIiXI1M0h2T0BXDT7eT6vkknqWLRJnsqKLYb0FHw9O
 oO292XHvufe62trZMqwph8WiA5Cpk2t3AXi3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739552429; x=1740157229;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c2tb/suTl1nSS8YywUwSH5Dc0llHnUO+gUroKzzSxGM=;
 b=eXA48jGQAHlkIzj5C5ckqjUrQ/uTHULlhuIPNIuEPCzJdq2ETUwpWIEXKCIO212k2B
 hEisltGnyaRy9A9O4cVCWSmEIqiTqKkM0Kh+csbwf7lllPRVs7ZAUHjoenXBd7aOP3sd
 pLO9FN9tuIp6usRaIELLP7hOarWyr0iyy1iu9/5ZWsAGB1iS7lM0ZgU7raJ0Z4V8ZINT
 0JNYynEwy7hSy19kO4ZX+Q39rOVz86+LDyT1122FYiUTiDWqBNjKg9ASbiezYLc3Ynud
 E/2tIJlfQWB6nXqIA7kLvfx6OiWfjZEtm0lIlR2Gzg/81/nfx8rW25OQAdDtp/Ec8OUN
 4YKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8j1KtJu9DPfBKl32qzUqw/B5DG7BgYAKxD1KndX4qZd3EP5THzOnDibInTQP1Q/o5xz4Fn8Mblxo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsGrUO2gj7VYWpUwNU7jvWIfKJM+rCfwjhuIquMj5BVNG7yk5g
 JKx2EM1I82XgcsfnhRp0uyUltwxp0Psk9g1ic1Z1SgW6hsEUPdqfoPv8rBIY2uI5P1EHlwLGLqP
 KDHFb
X-Gm-Gg: ASbGncuJaRlcgXOmnBDVw8q68h9lFtDFTYZX68l+xoxKxoCJE+BjJZQOQ6GEaQc2IqC
 umCm1CqKrToAq2tg/kz9zhkK9zkr7DcWxMKNhqmvymPhTIELnpm0p4hnckrWGJ4c8rFjBD24kpr
 auZ6BKaQokLNQipZTts1ZRGhKMkQz1xVgBBwz3HQGI+IlsETAOIFMabr5W0wopiBlHad6ZCXK4t
 6H01QUXfIvikgtpa2+5iRKVuCAau9KZFZPmaFC4z0FqxNMmVkesZUmcihtv1pzlD34vnWb9gm+v
 KFUvIni9+bTrJ5TATwIsCvjW+QnTq2ypAmRGwtqHc0s2FekXuuE9oOE=
X-Google-Smtp-Source: AGHT+IFLCchvmcnW+Dx6OU/7Ok25UxP68DUBB/aWjADmPYeM2xInHu+pUR9sd+bVAWE+EKj4rAc7kg==
X-Received: by 2002:a05:6512:a91:b0:545:617:6f07 with SMTP id
 2adb3069b0e04-5452fe2e0dbmr17775e87.6.1739552428579; 
 Fri, 14 Feb 2025 09:00:28 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f10ca5esm589473e87.161.2025.02.14.09.00.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 09:00:27 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-543cc81ddebso2405584e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:00:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU/8NF9YGhjZO6TNrEF390s5Y1dPv3mopKBogD/CU7H9JPUSu34WwVySqYdEK88WlsdFwKKCxHmbso=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3b0b:b0:545:17b:3cf5 with SMTP id
 2adb3069b0e04-5452fea5f11mr5412e87.47.1739552425610; Fri, 14 Feb 2025
 09:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-2-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-2-e71598f49c8f@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Feb 2025 09:00:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WvmWCgEDOF7Wxw5UGjnmy2_b3CzFuZNH2+t4JLc6JEuA@mail.gmail.com>
X-Gm-Features: AWEUYZlwb8rAgYDd-6FmyrJKUl5kYa0lEXcUU7k0RahjDPdc1oQN7hzxIRS7TgA
Message-ID: <CAD=FV=WvmWCgEDOF7Wxw5UGjnmy2_b3CzFuZNH2+t4JLc6JEuA@mail.gmail.com>
Subject: Re: [PATCH v3 02/37] drm/bridge: Pass full state to atomic_pre_enable
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Thu, Feb 13, 2025 at 6:44=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> It's pretty inconvenient to access the full atomic state from
> drm_bridges, so let's change the atomic_pre_enable hook prototype to
> pass it directly.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

From the point of view of ti-sn65dsi86 and parade-ps8640:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
