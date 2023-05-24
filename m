Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCB070F365
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 11:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BAB10E5E5;
	Wed, 24 May 2023 09:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1D810E5E5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 09:48:37 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f611ccd08cso6069245e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 02:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684921715; x=1687513715;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p8l4VvjVr94dZvrHGrr+e0WzgjbnJVVHX2dBYB3myQU=;
 b=TI3rCsYo2SNzhf5zQfmZSRtYeNc8hUycL+Z4AvQVV8sW/Al2OnQLdnPrx/QxQlRSyJ
 /cgF15H0vt2fqgiB0apLuzvj1YjFtbQhdaFJGfQzrKotWJ0G897+K0O8zvDhF/9PNw81
 4+J1wgyQQJJL1A5hafGylJaGRkNjkxfEvUYC3uX+ixSPK4F6JGqZV/97nUd/v0lrn5m2
 5FGBqOiEGLxvO8K2QWxixuSdsmjo8FAYS97QvHlEpuniHFjtYLeHg2EsXUB988zpfkZ8
 OjYtzDOu89NghcIDpRFFdM4qS+iZEmlowN7Ei8I4Bb8G5aUWWa/PjTcBoEnUMLw7Nk7m
 hzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684921715; x=1687513715;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p8l4VvjVr94dZvrHGrr+e0WzgjbnJVVHX2dBYB3myQU=;
 b=dfuKPgGaomzHIs5XiZ2BVkF+4D80j9XEoz2bjhn5MvHCLrUyATskTykIDfuOZVUeIu
 dSxJ/fswP1EfHIS265p3rjggxRqs0CGjWZqlN5js7+HrdOwtEA2PppYTygmgVLmRu7yy
 4Scgkbh6doSpn7Nf45vbfcalVzYXZhoCKr4uyyt4QRTrG45QfUqsbVywjJ8RlXHWXWbd
 W6kwvgbY7EKKX6BujqlQEeamMsXBSEpQCJ7tghn9Y8J9ChIhCwKPIkxA2o5sySlZUe2E
 9gWFHoewefkZX0JBdaTT1O7CFHo/TdThO6TF/Ef7IHKurA07WcGJGUiJvLEduvuPuQbV
 9Axg==
X-Gm-Message-State: AC+VfDyd6U3quxYxs+/NEQwnhdOVbHvadccOstnxItgdA2Yam7ykCEYD
 EBKONRhvEMEQLvobE9UmjyeI5A==
X-Google-Smtp-Source: ACHHUZ4XMDdStQgKrff85NZEZKRFlVA8V9QFMCe0slXyyQJwfdTbHSQ4YIcgmdFK84dT03iLAg2KDA==
X-Received: by 2002:a05:600c:2942:b0:3f4:2158:28a0 with SMTP id
 n2-20020a05600c294200b003f4215828a0mr12600097wmd.12.1684921714948; 
 Wed, 24 May 2023 02:48:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a5d53c2000000b002ffbf2213d4sm14031808wrw.75.2023.05.24.02.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 02:48:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20230524084324.11840-1-aweber.kernel@gmail.com>
References: <20230524084324.11840-1-aweber.kernel@gmail.com>
Subject: Re: [PATCH v2] drm/panel: samsung-s6d7aa0: use pointer for
 drm_mode in panel desc struct
Message-Id: <168492171413.2467334.7480313657663164313.b4-ty@linaro.org>
Date: Wed, 24 May 2023 11:48:34 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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
Cc: "kernelci . org bot" <bot@kernelci.org>, Sam Ravnborg <sam@ravnborg.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tom Rix <trix@redhat.com>, thierry.reding@gmail.com,
 Nikita Travkin <nikita@trvn.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 24 May 2023 10:43:24 +0200, Artur Weber wrote:
> Fixes compilation issues with older GCC versions and Clang after
> changes introduced in commit 6810bb390282 ("drm/panel: Add Samsung
> S6D7AA0 panel controller driver"). Tested with GCC 13.1.1, GCC 6.4.0
> and Clang 16.0.3.
> 
> Fixes the following errors with Clang:
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: samsung-s6d7aa0: use pointer for drm_mode in panel desc struct
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6a038f0183dd5d3e289f6c1fe6962de9b31f8fd2

-- 
Neil

