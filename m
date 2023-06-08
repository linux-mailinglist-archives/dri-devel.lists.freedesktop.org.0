Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E730728076
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 14:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87DE10E424;
	Thu,  8 Jun 2023 12:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF09110E424
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 12:51:19 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f6e4554453so3624195e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 05:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686228677; x=1688820677;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQMTg2asd6/z1TQc0GwCD1tU1OXhoBS7NtC63V59A9o=;
 b=dU5IQj4BJptT5+1iMV4cWGdd+DqQmnjGSnkU31rDAIkiGaV91UFUSc4AEpKZroSnKy
 TkJO8TruUgMuk9MMwX54oIdSr3In++wZulIBTtPPpeOe+1r4/nHcF67mhN7QAHHxolK7
 QVgXByYCQG4P57Ng924N8la/d2HPmvp04+2bRYpcCVKmYoHVeQVt8dmffWqmxNsP0sB8
 +P+XltdgkLnUA2W1zznqZcw+5wYWkgDhYKRXzLv51Wjv6ehUrZzH3gDcAQU6xPRw7ZU7
 JMEytqeH0r+5QKfg0fQZjUl2M5NNSaisdvrQxUUfwQHDH7sH38U1KV3b20KCTKxLrVBW
 exQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686228677; x=1688820677;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YQMTg2asd6/z1TQc0GwCD1tU1OXhoBS7NtC63V59A9o=;
 b=TrfYoHFfJNaKmeOwKUQqF9ucDwgp16rdSd2exk8dOOyXGMT3rZ5TFpBnFU2KRHpLb3
 Oaz3EpJy+cMc49smIpfA/jrKpKDpgleENeoumy/lx6RY2BZ9j7oQd0MWqs/tD9MjC5wo
 01tRc2sotC06u8A8JVOpgEyvyrCXL5WOcAY33lwBbFD3K7oI9NAqtAt7U7lRAMIHULC0
 m9/Q66qlRh3AsSf+HRzbxVrkGDJdrD65k2INB8/wjBEQs8XPjVBSvpj8TLsC4zasoF43
 GcbxHpTO8TFg/xlVmG8vS3MSHx9x1yHmyLAWlL7WsxAly4Qhm9ZhdVSqHUHV6RN3yrnn
 F33w==
X-Gm-Message-State: AC+VfDzX3ra0HRJ5q+I6rsGXFgOqqhycgdrlvq7D7NKk7Yun3UFUNtm1
 yMYz0TKZkTpi2IOLp4yaOoOT9A==
X-Google-Smtp-Source: ACHHUZ4fddPWAXwB7Ei2gnzuTtFtKvFSYafaL+nGQniuAjfX2uouva1tLaCbYWA97I8kJkOUexFXKA==
X-Received: by 2002:adf:dcc4:0:b0:30a:e66d:25b7 with SMTP id
 x4-20020adfdcc4000000b0030ae66d25b7mr6867184wrm.13.1686228677644; 
 Thu, 08 Jun 2023 05:51:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a5d650f000000b0030adfa48e1esm1523143wru.29.2023.06.08.05.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 05:51:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Wang Jianzheng <wangjianzheng@vivo.com>
In-Reply-To: <20230608033446.18412-1-wangjianzheng@vivo.com>
References: <20230608033446.18412-1-wangjianzheng@vivo.com>
Subject: Re: [PATCH] drm/panel: s6d7aa0: remove the unneeded variable in
 s6d7aa0_lock
Message-Id: <168622867695.567381.16167502106642001528.b4-ty@linaro.org>
Date: Thu, 08 Jun 2023 14:51:16 +0200
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
Cc: opensource.kernel@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 08 Jun 2023 11:34:46 +0800, Wang Jianzheng wrote:
> Remove unneeded variable and directly return 0.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: s6d7aa0: remove the unneeded variable in s6d7aa0_lock
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c5dacfe2e6c1251276e29b4cdac771f504593523

-- 
Neil

