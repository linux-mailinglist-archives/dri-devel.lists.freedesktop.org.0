Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2386B6CCD94
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 00:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E6A10E9EB;
	Tue, 28 Mar 2023 22:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0943210E9F5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:16 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id z42so14148978ljq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xzrHNhj4mC5D3BSVzsRn+bfppIAJb6omjbQHw5uSNww=;
 b=wiY9wELxeAw8XealgU0KrNeoQG7lMAOp1Z/t/H/9fpFrj99bdXDk3xvoZyst7EUVWh
 RALoCZF9lRQxK2hdARTVKrS0gQyoNnbezfUpz2E+T+FoKtfvI+9SRy7DvFmTJLJZW75+
 gkVF8nvXaO9+/VFTZ3x6CAYfryI+g8kQNSqIBmDgm/UQcOQrBY5XCViAvCDHm32N/Hz1
 rsx6cCol2oD9Gghtf3CwwequBRhFts3H7PWTGu29iue2gx+yu43CeOWgSEr7tHFUJ02k
 Fl/LiX33mznL3PzpUvaAV+qhtNDlapAnb8+ljW5eIeHJLmoXxmpIdZOzugE+KSnkO3tt
 JKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xzrHNhj4mC5D3BSVzsRn+bfppIAJb6omjbQHw5uSNww=;
 b=c7fxamceFih4B4bf8PMV8p1Z/AjExFROihgQ+QF+6/7A+taSxRFkhn3FH5CgtS9j63
 0jjTXbjI/sLaenqSJgOnNedIFNISICindu4TWCBIGm0x6oLeJFiKsCjvEGsyrRc5lhev
 kDd3ETaRqllP3nPstpqUZaON5w+47Cu+0iGh82ooKD7RazT1NCu24cZ+9TY1vwxiL+xd
 IYWCf+LAKNopC8DG1eM/4kA3Ilk9gGCkAntbx4O2MA0sNecf/Rq94Tvb7hwTlpHsxhqT
 qR0ICf88YJrvUvNsUpmPOuZjElBjvSiNro/VCHAG1IAStLIkEr5LF0tXNunHpAVMXrN7
 Gg9w==
X-Gm-Message-State: AAQBX9fwXUxv3QFgkxWgkunZA8GgVTvL0ta5F97TuwaL49SEMYbopNJq
 S7oDITbx+aFhB8YU+6/Pb4zedQg1t+mozXgoh3M=
X-Google-Smtp-Source: AKy350YPdYgCgBPwMF71vrPCJWfK+dspAXZuTvv4O48LPCzNaPLnY08jSnb2j+86thVL4IGtKMf0qw==
X-Received: by 2002:a2e:7c06:0:b0:2a4:44a5:d4a3 with SMTP id
 x6-20020a2e7c06000000b002a444a5d4a3mr4760700ljc.0.1680043095309; 
 Tue, 28 Mar 2023 15:38:15 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm: Rename drm_msm_gem_submit_reloc::or in C++ code
Date: Wed, 29 Mar 2023 01:38:02 +0300
Message-Id: <168004255460.1060915.10055014271321088817.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326163813.535762-1-robdclark@gmail.com>
References: <20230326163813.535762-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Danylo Piliaiev <dpiliaiev@igalia.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 26 Mar 2023 09:38:13 -0700, Rob Clark wrote:
> Clashes with C++ `or` keyword
> 
> 

Applied, thanks!

[1/1] drm/msm: Rename drm_msm_gem_submit_reloc::or in C++ code
      https://gitlab.freedesktop.org/lumag/msm/-/commit/be7772e53681

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
