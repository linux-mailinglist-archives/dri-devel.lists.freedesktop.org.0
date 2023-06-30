Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1717974388C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 11:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3034A10E10A;
	Fri, 30 Jun 2023 09:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3C610E10A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 09:44:06 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so2754304e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688118243; x=1690710243;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=536WfOybnBv0QL0P/caoe+QPLMkSTKJq0WYMXCXpLoA=;
 b=scWc61H6CzTVrzlyA0or4m3Rhx109d9guKzf8dNek99w/VBJEVa6d8fl46BgGGibM2
 aPjDOM/M5VN/dWvolAsoSuKe1Px9YIJNrrHY2/PdYX2uLBa3p8tC7pXUYaSywvlGZGZY
 vE3Em9ukH5JFvR1q52PIZRsJ95HdiNVKNJbNFF93vBkErA3ry8ftd6fRybNtQXIptiSJ
 3lGOaE6oNer58BVOKajrdX89Eo9t2p+tlx/oUPSbCeDoynLQU8+64b33HAP4w0Ft/ffX
 dFaxpG+yH67VG7bmmOOi4buaWv2jnr+YiSjhsH0KvKHgLD1z9s3yYJ6LzB1JtHfj4i+9
 AUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688118243; x=1690710243;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=536WfOybnBv0QL0P/caoe+QPLMkSTKJq0WYMXCXpLoA=;
 b=i53MQORYK/QbcKXpRy3VGm5O8EI/PJpPqEwtUioy9tWOjq8mATDN4isy7ehlyIIRBd
 IqQbdiT0M+MaqhDZCCc37RsXr1wW2UB1jpZpKnGtwJbDxqWDAp0j4UgFRQ0xlIW8xymI
 8tvxrtVyZuPGqb5HmzvgJJlukOngACl/PELOC90lxjBSSWAsV8IW/eJhu9O6z8p8qPlm
 qDkF+tnYpqbgbqtUfwTYn/i/q6p5GoB/mGKciJ+/6QXxRtxhG1o2lq+9UGRc49uaUOev
 SKqJECtn/7stDviZG3+uiN2zbwZsDnnFlHvxWF+F5WgUMN+NvH8j3PhxFI7uwvSt+VpI
 bHaA==
X-Gm-Message-State: ABy/qLbybzGWsbMaiHoh1dwX17l2UmzwYKoiIVTHpNgRF4WE/+y9q8fs
 PmiXdyih8C8SaS79V2SjU/djrHTkSLLBPTo0HEoziw==
X-Google-Smtp-Source: APBJJlGv8w24kuDZe30aasyJRPA74InjsQN2D9mo5POBpkHeTpcB7g/gTwNOiczSocI/uXP9KCy3Gg==
X-Received: by 2002:a19:3846:0:b0:4fb:893a:d322 with SMTP id
 d6-20020a193846000000b004fb893ad322mr1477786lfj.68.1688118243292; 
 Fri, 30 Jun 2023 02:44:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a1c7911000000b003fbb9339b29sm3701656wme.42.2023.06.30.02.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 02:44:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
In-Reply-To: <20230615201602.565948-1-marex@denx.de>
References: <20230615201602.565948-1-marex@denx.de>
Subject: Re: [PATCH] drm/panel: simple: Add Powertip PH800480T013
 drm_display_mode flags
Message-Id: <168811824189.1780752.12527502390722941250.b4-ty@linaro.org>
Date: Fri, 30 Jun 2023 11:44:01 +0200
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
Cc: Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 15 Jun 2023 22:16:02 +0200, Marek Vasut wrote:
> Add missing drm_display_mode DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC
> flags. Those are used by various bridges in the pipeline to correctly
> configure its sync signals polarity.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/panel: simple: Add Powertip PH800480T013 drm_display_mode flags
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1c519980aced3da1fae37c1339cf43b24eccdee7

-- 
Neil

