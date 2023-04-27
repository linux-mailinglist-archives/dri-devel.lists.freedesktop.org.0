Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D806F0631
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 14:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392EC10EB40;
	Thu, 27 Apr 2023 12:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EA710EB40
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 12:52:04 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2fa47de5b04so8170563f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 05:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682599920; x=1685191920;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vfWLAe/fF1E4LgUmECNUtdr8sZ/Z/BT/KZ2q+zP0IlY=;
 b=ssf4q2tqkQe8GWV2NhnHzlfB1EFlj2xlT5+L+5STyjYwTHyNixHH/xbHNLJ8WQbhDM
 W9Qy/goPwiyWfsS8LeXJSrrqnZI0ibD7BeHltDffIADyQhnklKeJPHc73w/7A/lfFPii
 iuTWxKaE4O+PZBxhfX3Rz8Xw/ZQuoixe5wDDUa3a3ow6YZGUORJC3G8/eTBYqPwLn2cG
 PAHptahVaA7eYA4WoUSXBpAKh0x9DPnoo+boaAWB2y1Cxgl7exLimNNekvidA3nosQvm
 2mHEib5vZ76wooGH11x6nOUXluNRp5mrMM9/gncTpG02QUqKl/pv93mArpb3Il7ciOq3
 1uQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682599920; x=1685191920;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vfWLAe/fF1E4LgUmECNUtdr8sZ/Z/BT/KZ2q+zP0IlY=;
 b=jEzbObQxVVuw7ccp1JL8VcdIzhsolqfiiHz+Ap2Gn/MYCpXtlICXnbfbn266z1KGbO
 RvrhKr+ZjF1sFtvA0tXDilxVkkQli0NSvTi5XLa71ce5hO+Hjc+i7jQkj9JjK6RzYjss
 XQgo+JnIbbsOubGvmSlJrD9OkEmG8nX/8x0oalskU6YSM9MctW3KokRai0BcPvU6L2PU
 QjwEwmRJG6WtH3D2dhlACbjcV+fm1i9TTpJfrmKVAgLs9Os0nBVhmpsTOYzt9/W9HW7T
 HKTsSBTT8bR7Z/5vQxqCieX/F6LmCBarL1oqqoTj8ooNsyNBmc6CGgE/uZk8dsK7cJdk
 +S+Q==
X-Gm-Message-State: AC+VfDwFJry7k2lNjPV23RDax9GVGri9gpR8jCifA/J9GMjz5tC9/WPb
 +vfn/le4UiDFFXP7q6lN0ta2og==
X-Google-Smtp-Source: ACHHUZ6jkZGtDsfDwIEI40ww2DZomo1siHaiNuHWw1JgWvoQFqIbKz2YXzN8VVmfDkjJ6lOmgvBLeQ==
X-Received: by 2002:a5d:6a83:0:b0:2fb:283a:1757 with SMTP id
 s3-20020a5d6a83000000b002fb283a1757mr1413955wru.26.1682599920684; 
 Thu, 27 Apr 2023 05:52:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a5d5950000000b0030490c8ccafsm6499980wri.52.2023.04.27.05.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 05:52:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: airlied@gmail.com, daniel@ffwll.ch, khilman@baylibre.com, 
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
 Tom Rix <trix@redhat.com>
In-Reply-To: <20230423145300.3937831-1-trix@redhat.com>
References: <20230423145300.3937831-1-trix@redhat.com>
Subject: Re: [PATCH] drm/meson: set variables meson_hdmi_*
 storage-class-specifier to static
Message-Id: <168259991963.3093924.6221745093198482770.b4-ty@linaro.org>
Date: Thu, 27 Apr 2023 14:51:59 +0200
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, 23 Apr 2023 10:53:00 -0400, Tom Rix wrote:
> smatch has several simailar warnings to
> drivers/gpu/drm/meson/meson_venc.c:189:28: warning: symbol
>   'meson_hdmi_enci_mode_480i' was not declared. Should it be static?
> 
> These variables are only used in their defining file so should be static
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/meson: set variables meson_hdmi_* storage-class-specifier to static
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=4b733b2c38b7c9304bbb92cf88f1b23f43ca575d

-- 
Neil

