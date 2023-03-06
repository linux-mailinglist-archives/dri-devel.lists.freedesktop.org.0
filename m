Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D5C6AB8AD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 09:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DE010E194;
	Mon,  6 Mar 2023 08:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1632710E194
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 08:43:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l1so7890015wry.12
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 00:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678092225;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QZEJmZby2wtp2N/ubBCyHC+kgDBokSCAHmX4OKZIirk=;
 b=WPfJV8QUOFJvl3Hc2sJI436+4fZlyELC9lxav4xDCRrzwqw6bJIAy15vEd8ed4aC2g
 nUkftZtJAYGvoFUjsQlifxarTc06/hapOZIxCM1W+KhjL/hPicRfR94wRzrVKoc8uV6T
 VCV2v1o+qpckor9f4C4VaqZ2iMtMzCQ2dySiBto2ar7UtpCWThFbc/4E5yna7cfCQGHf
 /bWa5uvsv5ezSYs6aaThhc45rFz6LA97Oip+Mg+qazwrCvmQG9pawfKmmOF7Az14liJI
 ErKKYGoaMOvy+Vj7RT13BGVsM/6wrXK+JK4xT7nho8cD86S52MxVFoPXNFjVAV5P+kpl
 ++wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678092225;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QZEJmZby2wtp2N/ubBCyHC+kgDBokSCAHmX4OKZIirk=;
 b=szJvJX3dFjP+00RwbDVghAP1sjQmR+lD+cWMqlkXMNGdqgqnsFNRvcOrjMclEIhjE9
 KoH5JMUYE5FwQsWRWEnVbsB/slT/hgmFM979US2OyucQMXAZOonC+EdYYkFYOaoNiY81
 8oDpBDApA6RtbzeS+tTttDxT4zFmsY3oUK8jPvu6Ca9LPeWR2xeAMQ5BKPTIi/zTv86Y
 bRSUOvyv/JQi5sb/8ZHnEQgBrC083Dm9N29hpEcTA9joFTBk3xRsPJrcN3rMfohTkMp0
 TzO0M8L+Pq/SrHHyOaoMiZH+Dpx81ghogbfUwhFDZ2XbriKQ7Fv4z+KNU9XspduKUf7O
 PAAg==
X-Gm-Message-State: AO0yUKXqcrLhqHw+vU/WY2WIXeF17MLtFR+TJjf1ZMxmBXOdl2E55acm
 zNktEQN2RzT//lyvFhwrwT2yGw==
X-Google-Smtp-Source: AK7set/ZxD7wiI2b8xRTQAmyrmK9gEAwsitbyEhRqHPRzYROYUlP0inT+LCKU6Vm2ybtKZPkfTr8yQ==
X-Received: by 2002:a5d:4452:0:b0:2ca:ab68:eff3 with SMTP id
 x18-20020a5d4452000000b002caab68eff3mr6081160wrr.67.1678092225447; 
 Mon, 06 Mar 2023 00:43:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d510b000000b002c55b0e6ef1sm9495632wrt.4.2023.03.06.00.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 00:43:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20230303123312.155164-1-christianshewitt@gmail.com>
References: <20230303123312.155164-1-christianshewitt@gmail.com>
Subject: Re: [PATCH v2] drm/meson: fix 1px pink line on GXM when scaling
 video overlay
Message-Id: <167809222462.18238.7243626712537618474.b4-ty@linaro.org>
Date: Mon, 06 Mar 2023 09:43:44 +0100
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 03 Mar 2023 12:33:12 +0000, Christian Hewitt wrote:
> Playing media with a resolution smaller than the crtc size requires the
> video overlay to be scaled for output and GXM boards display a 1px pink
> line on the bottom of the scaled overlay. Comparing with the downstream
> vendor driver revealed VPP_DUMMY_DATA not being set [0].
> 
> Setting VPP_DUMMY_DATA prevents the 1px pink line from being seen.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: fix 1px pink line on GXM when scaling video overlay
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5c8cf1664f288098a971a1d1e65716a2b6a279e1

-- 
Neil

