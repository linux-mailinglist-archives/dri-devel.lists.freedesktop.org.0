Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1804F6BABD8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580DA10E982;
	Wed, 15 Mar 2023 09:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C5610E980
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 09:13:51 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id g18so353189wmk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 02:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678871630;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0wZm7ql20rMJKCtfDir4y8dhV/8MRg5f2HHVArWMyHE=;
 b=msgjES3Ds6zTYgNAad7SZAc3slkU+646dKpyVPzCi3BOyNQHL52Pjy58omFPaDKLzN
 f7o4QmohTE3c2vrtJhMrBe83tKMgFJg9A2/Xop1/Q3XVNhzE6/uJHe/hzO5ikj642L43
 62Rr5V5er+wTb70rsQAPTAwntaPEAMr96sUcXY13Qb3vJ3ojQlNGU0Madlu+OVhuyQmZ
 lBnQlp61UOV8R70SmKJzPKOqiuXGIxowAjx1VpAA/FPXA8G0X16pbEut/E63MdU2LXWx
 Mz0pM2njpHAQP2IMA2EPAAd5ACdak4gEBObotJe4UnEPAHbkjiYmItPcNF+ZTW722gjK
 nUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871630;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0wZm7ql20rMJKCtfDir4y8dhV/8MRg5f2HHVArWMyHE=;
 b=n0fv34PM7PiJAS9qbeglrN7r1i0yzKaxqoTfynI+txwYBTDYWeX3HIPLAWlX6HapTt
 gBKU7LkOPnywXluVtuDf7aQsQRjjdGwcC9UBGEUs81CCoc/IlPTvgdxEue8IS8oZJL0R
 QKbE7VJY7Cu45hkMYiMvAajXqtOf0yEBMfZl8IVFeQl7JfguB/pdouuO5/KqyYg42Z0V
 /N42J33hHl+KxLcl/I5PojVfp42XPF9CIqsI+tn+HVwto/rgUPgayIFsUV+zeLFjPcSY
 nVU8+4EOijCZK1V076774f5eui6qOKCAr8ZN5vFGi9FnlQj7+HwOCRHCsJH1QQdXbgDL
 ikkA==
X-Gm-Message-State: AO0yUKXa2Po6iNrgd6xU2sXhFbY9WdO+I7RC61MJpyIJaEYJkFeE1lVv
 Dj7rMagPQo+fzmDHqtu15SxT6Q==
X-Google-Smtp-Source: AK7set9WvwBXpYyvhdXU6tW5hUtBLFeDNVy92t8NWESSmxzsb3T0IUxy2e0vq8po0ilcv1sJ1Ed4VQ==
X-Received: by 2002:a05:600c:35cd:b0:3ed:1ea4:e5bb with SMTP id
 r13-20020a05600c35cd00b003ed1ea4e5bbmr12580184wmq.32.1678871630268; 
 Wed, 15 Mar 2023 02:13:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003ed23845666sm1136212wmq.45.2023.03.15.02.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 02:13:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Fabio Estevam <festevam@denx.de>
In-Reply-To: <20230314111724.1520178-1-festevam@denx.de>
References: <20230314111724.1520178-1-festevam@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: seiko,43wvf1g: Add the
 'enable-gpios' property
Message-Id: <167887162959.2174720.18189027719777152587.b4-ty@linaro.org>
Date: Wed, 15 Mar 2023 10:13:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 CPHEALY@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 14 Mar 2023 08:17:23 -0300, Fabio Estevam wrote:
> Add an optional 'enable-gpios' property that can be used to turn on/off
> the display.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

[1/2] dt-bindings: display: seiko,43wvf1g: Add the 'enable-gpios' property
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1afdbd475adc609d829e560389d33eb90501660f
[2/2] drm/panel: seiko-43wvf1g: Add the 'enable-gpios' property
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e2945e6c5111726536c6046eaa1b840636e066a8

-- 
Neil

