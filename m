Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FF56CCD82
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 00:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A0B10EA14;
	Tue, 28 Mar 2023 22:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322E810E9F9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:11 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id o20so11257829ljp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YqMzGFEFZ4G3mn3A0af48ETcAL5sqfZTnAC0vsbZt14=;
 b=eQ60LDXSa/NVEp4396sz4hz+p/96XdIU9Pip0WxwqTeDbs/roQIiiJVmWc9GSVUtix
 75nWME5ZWnYqrmc9OtB6ywbO8PCuGwcSWvA7+VyG507sdqQPwBU52LNtw2wD9+0FTTnt
 Zero1A208G+D6DXr65eVVOaCy+KTZCO+rT2m+wKv1nW/liRIU/skkpmM3493qRu5c+6u
 yoAm9taQWLP4lo01aBwSbiyRP0U1l3MC9RUQI9V4bKU2CuNFlCRVw9wp50v1LE4iDBCu
 femRp1Vup/4Tw38cu4zVg2e13QVXAlGVkp8rVnNcF1uiVGK/ljcDDKrx0mazDFsklpkw
 YCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YqMzGFEFZ4G3mn3A0af48ETcAL5sqfZTnAC0vsbZt14=;
 b=HlzsXFXz0KIUJn5pFaN9JeTKORERpgr3xB6OUt6R2uUadUh8oR9NbEtIoQQXksAk+s
 qKq+BnFTuMakJerscjdJWfpLI1l+js1SEo8ZKXcfB1/rnEb8427Rg7JkhBkTJsjUmapo
 q+StJdlKTAOnVFtCSBq3yi+QjudLzK1K72llwZs9InJjrzAsYxcIFxgk9XR499RhqyDr
 ds8oHQGiBUJMIoT7lAoLJ7LIqREWROzBoG+yq+XbHBatifFwnwFKQrzUQfwLrrfQh1u5
 VXGG+lVmxDAHTTfHZYu4tqXxcxhH5Hu7Z6mJLMF/TsbqhF5jn7DzxLH/ktIv44nOg8Zr
 23jA==
X-Gm-Message-State: AAQBX9fzLEGLmTEo7eRw7I9V0dDPeCbhwrWPiCC+Pk4QTOtiCnWcHX68
 rEJ3Ku3vT0ptkNJ4427HPgxRPQ==
X-Google-Smtp-Source: AKy350bc+C5IlC+/Eg5CjRjnK2y1Lqc4kF2FkzeVDTt7xxGQ98NBtHIaDLDNL/a3JVnrPHhasMQXbQ==
X-Received: by 2002:a2e:a3d0:0:b0:2a0:7a74:b0d3 with SMTP id
 w16-20020a2ea3d0000000b002a07a74b0d3mr5509419lje.19.1680043089474; 
 Tue, 28 Mar 2023 15:38:09 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: Re: [PATCH 1/2] drm/lima: Use drm_sched_job_add_syncobj_dependency()
Date: Wed, 29 Mar 2023 01:37:54 +0300
Message-Id: <168004255464.1060915.109088243199139578.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224214133.411966-1-mcanal@igalia.com>
References: <20230224214133.411966-1-mcanal@igalia.com>
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 24 Feb 2023 18:41:32 -0300, Maíra Canal wrote:
> As lima_gem_add_deps() performs the same steps as
> drm_sched_job_add_syncobj_dependency(), replace the open-coded
> implementation in Lima in order to simply use the DRM function.
> 
> 

Applied, thanks!

[2/2] drm/msm: Use drm_sched_job_add_syncobj_dependency()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8fd531e6bc56

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
