Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0A670E77A
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 23:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0781A10E0DA;
	Tue, 23 May 2023 21:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BB910E0DA
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 21:39:32 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-25566708233so214915a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 14:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684877971; x=1687469971;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e8J4p6YIWy3rwiFFiWD8sVBLEWJtrwGY9Rb+6LKgbgU=;
 b=AyuLyEipYz70RrO0MkAQTcObYB3pgiVzGaOVUVjM7g4EKBmivjTls3n3OEMNeZMymF
 eHE8SbLPU1oZU8sBxg49f6r9b7BBVU8ZCiDjZqUfP5Ex1TJ22x4YjsBdjAPfpQjhpUyX
 72Nx2t7cyhst8QMZbmpAF/u7KYavR1ZtM9hL9daQ8yn2mPT088EViMVOPROBr3CD0Ueq
 Sk1Koe549LMl6oLWsHBENndJtIMpuE+rG/JPpNRs8wRId1kMM95oO5Qz9lE1r374O5tL
 EIIG70xlIlYEGACA42HIsHa5lKy8kPudJad1nWgIfMdZupH5gkPB0MyhZrp/NZ17i38B
 N/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684877971; x=1687469971;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e8J4p6YIWy3rwiFFiWD8sVBLEWJtrwGY9Rb+6LKgbgU=;
 b=hRVR7NehyJb8pDsJKNj1zUSg7YXz7P2qMOeAGYEtT2jyV+3po6QJyiOdhYwtcAKSTr
 eu9DogqYu66vtYjiWWJXPbgg3KMBdY71L9SODFQ53rx/WWuLbHBKHhRfr4djAruqtNta
 loiIAxQxn94vrI207sx7qMfmZCy0KZtReK6hJ8PCyBb2MaBEipRHcqP0w7W9MRy/PepA
 Ybf905PewEgfw6k2l7w6GQL0AlaI+rwNIukGLMdzIELJsfooxiALnFVKtp2xB6oEWxWK
 odn5vIKZtDK7Dp0ZNkvI8RO/JldeOgsA0FQYbuvLJctJ1ZBDMJ8b33Wg6nkhG6Y6wzo/
 o2PQ==
X-Gm-Message-State: AC+VfDxr18PVfUfFT0M3kU+doDHy+1gy+zebYMqYqjJyg8Kf0X5fLgGG
 4/UwOo8WVkVdwouf9Q2R0ZI=
X-Google-Smtp-Source: ACHHUZ6a9iblkWuV5z76z2aSS5vYgHIkddjE5Muwt+iafdWTMh4nWbEJ/jsTonoYro5mB3RT38WsSQ==
X-Received: by 2002:a17:90a:ab08:b0:234:889f:c35d with SMTP id
 m8-20020a17090aab0800b00234889fc35dmr13881642pjq.3.1684877970802; 
 Tue, 23 May 2023 14:39:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:3913:9c00:6a9e:2c95])
 by smtp.gmail.com with ESMTPSA id
 21-20020a17090a01d500b0024e2980574asm49274pjd.4.2023.05.23.14.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 14:39:30 -0700 (PDT)
Date: Tue, 23 May 2023 14:39:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 0/9] drm/panel and i2c-hid: Allow panels and touchscreens
 to power sequence together
Message-ID: <ZG0yjuNvhnircAxA@google.com>
References: <20230523193017.4109557-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523193017.4109557-1-dianders@chromium.org>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-input@vger.kernel.org, hsinyi@google.com,
 Sam Ravnborg <sam@ravnborg.org>, yangcong5@huaqin.corp-partner.google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Tue, May 23, 2023 at 12:27:54PM -0700, Douglas Anderson wrote:
> 
> The big motivation for this patch series is mostly described in the patch
> ("drm/panel: Add a way for other devices to follow panel state"), but to
> quickly summarize here: for touchscreens that are connected to a panel we
> need the ability to power sequence the two device together. This is not a
> new need, but so far we've managed to get by through a combination of
> inefficiency, added costs, or perhaps just a little bit of brokenness.
> It's time to do better. This patch series allows us to do better.

This seems to grow a new way of building relationship between panels and
associated devices. Can we make device_link_*() work for us?

Thanks.

-- 
Dmitry
