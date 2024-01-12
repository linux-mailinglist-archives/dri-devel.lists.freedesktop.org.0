Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C37E82BD21
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 10:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FE710EAAD;
	Fri, 12 Jan 2024 09:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24FA10EAAD
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 09:28:01 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3366e78d872so6516399f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 01:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705051680; x=1705656480; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2NCYVeywthYmIsrxQeF1XaxxekG4gcaUob9s27+cb08=;
 b=wz3dUbBEGVwZsa7LasyPFvymDcFRXjS21h5260IS86g+okVTBQH+thUORLaEdHOhD4
 Pn2K3auk+hCLOhvMP72N/gOVkyPs3ISyom7jZpmGvT3dRtNru8eyX+NctaORUO3Dkml5
 TZUFFgYHDOrZfTbDVoFvIeKcdyYBNfxi4N2jdRiJL9W0pZRfl30MIsYcpR+FAWYCpGYa
 94e0omdwkn3YwraYVTZavSUt3uFx4JfrXHk14P3hEklEbXutv2VaDsGFfJxq/6fe0GGl
 37swyF02H4RYdqSEfCsqxabJUsX03BzrEuJqcU0ztVVZLik7bxMDF8wDHkDhzs1bfL48
 12pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705051680; x=1705656480;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2NCYVeywthYmIsrxQeF1XaxxekG4gcaUob9s27+cb08=;
 b=tmkq0kG22fdqoJ3tBnnSmF7isDQYPYIbTIbnIRkL8wzrOjhtU0DJLRblnQ+vP6yUvt
 DE1GfCRer3QYV6+fITT/ncjrsRISbLrCJhVURyWmT5baOZAbniF1Vu3JbmrRJS/6VSL2
 2mDqLwxSnP2LU7QSD70NUAXo1PxTXwiWHr+uRU2djexa9+RQ3kc2hr3evQv8Ecry9IVZ
 bgiHM+0JHte9/lT3zwgf/xGj+F8l5xw3L2+Ze7GSYqbIzk1EXtFV5rTkYFzXJXzmiCkT
 CkhX1xkdVyFHSKSJDytdZBVs1oVcw8aHS/l0ztyarI1WzWXL7/dUPwaPWOJnNGrxvZTZ
 FYyw==
X-Gm-Message-State: AOJu0YwFsoD5EwNj83Q3sTAM+jUH7YQd2KXRfHHanyaaBI+UAbag7HXR
 xe8h7+CmPCyN1CpYbwsumLoAsCVxx300pQ==
X-Google-Smtp-Source: AGHT+IHmpnLNrMCfXBpSsxK1XN7TMi6MDCBV+eQHrgduX2+GjPUmROUVUbbgIHe2mBIZvBmditAB5A==
X-Received: by 2002:a5d:5543:0:b0:337:70cb:3eb3 with SMTP id
 g3-20020a5d5543000000b0033770cb3eb3mr255195wrw.89.1705051680110; 
 Fri, 12 Jan 2024 01:28:00 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 d11-20020adfa34b000000b00336e15fbc85sm3324822wrb.82.2024.01.12.01.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 01:27:59 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20240105-tab3-display-fixes-v2-0-904d1207bf6f@gmail.com>
References: <20240105-tab3-display-fixes-v2-0-904d1207bf6f@gmail.com>
Subject: Re: (subset) [PATCH v2 0/2] Fix panel polarity mixup in S6D7AA0
 panel driver and Galaxy Tab 3 8.0 DTSI
Message-Id: <170505167913.950726.6420816428690062433.b4-ty@linaro.org>
Date: Fri, 12 Jan 2024 10:27:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 05 Jan 2024 07:53:00 +0100, Artur Weber wrote:
> Two small one-line patches to address a mixup in the Samsung S6D7AA0
> panel driver and the Samsung Galaxy Tab 3 8.0 board it was initially
> added for.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[2/2] drm/panel: samsung-s6d7aa0: drop DRM_BUS_FLAG_DE_HIGH for lsl080al02
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=62b143b5ec4a14e1ae0dede5aabaf1832e3b0073

-- 
Neil

