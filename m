Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019787696FB
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 15:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C15510E290;
	Mon, 31 Jul 2023 13:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E57610E28F
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 13:01:24 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31792ac0fefso1691174f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 06:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690808483; x=1691413283;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+DDzJV1vwG/o6GKGnxfHEJZ1cqvyrsDF+27hqWZCPcs=;
 b=HNlXr+bTJpd570DCOScEd9dY+NVscjCQ4TZ9qFzuXcBnjryFEUiHuZbKNxi2KqLjAp
 ecv9fhdryF6j/Pe2vkwFnNGN8wZwsQtEqtj3V+IlJNP3uiDjdEydI10UKNHBVEiZQcoY
 qSy1GbGl3jgq/R0n9J2pqbH9lhxVyBt0gIjKs+ssZUYjhr1LjJvunNK4eM0YJLLIruXv
 f1DMFsZZFb7ZmfGhFsZzGElD9gLRTj/z9h229paaQ+eiXZ2ofBRTzgQDYBx7tDko5/+J
 FjotG2lESjTZLosm8YI5NdlR0xUrtY9Uhxcb66SYwqP26VdrjkTCzPlcioQSCeDDn5Yw
 3EgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690808483; x=1691413283;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+DDzJV1vwG/o6GKGnxfHEJZ1cqvyrsDF+27hqWZCPcs=;
 b=CeEuHM1MymzGu5oAvYy4b4sig8Qn6xU2Mxp0oaxpJntz+czNllw7lUqOG2eghm29mI
 cy1zhW+U3B+108QnF7BMGihVHIEUvXA3CMsA57LSZvKweaxREyIANbcSUx4PqxTKqEPX
 l7QUXlJKQzJ/w0mMb7cgg4DzE62DC10srFW1zmlNfQL/0oWXS6JTQpyqQvdVBGPfG9h5
 R/qXFx2JRz1ZamrTlCdaC4Cw6LJmetw46XvWkHV7MF7wdekH/zH6lOVN1pAMXABZcpbb
 Y7PdgA9Bssx///2ZuskMPlqkPBi5HKHx4wPv9jpXwoV3H90zz49JtrSjAC1NP2eQV4nA
 L4Vw==
X-Gm-Message-State: ABy/qLaHOFzuV21zW2vp9bm2lb+b++hMtErKbReVkP2ryM97Ift/n66i
 V5PwWBnUXqh+9zGU9Y4AW9u+5w==
X-Google-Smtp-Source: APBJJlF2MLeys5HLsk1/ygRiquwn+xckE5m8ikRTKpgfwE+Po7ISnMqt/ZWo7+1AjEMXNPeiJ0RT3Q==
X-Received: by 2002:a5d:4dcb:0:b0:317:58a8:bb4 with SMTP id
 f11-20020a5d4dcb000000b0031758a80bb4mr6694637wru.40.1690808482528; 
 Mon, 31 Jul 2023 06:01:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 j4-20020adfe504000000b003063a92bbf5sm13220390wrm.70.2023.07.31.06.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 06:01:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matus Gajdos <matuszpd@gmail.com>
In-Reply-To: <20230719102616.2259-1-matuszpd@gmail.com>
References: <20230719102616.2259-1-matuszpd@gmail.com>
Subject: Re: [PATCH 0/2] drm/panel: ilitek-ili9881c: Add TDO
 TL050HDV35-H1311A LCD panel
Message-Id: <169080848175.304500.6200088546909299961.b4-ty@linaro.org>
Date: Mon, 31 Jul 2023 15:01:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 19 Jul 2023 12:26:13 +0200, Matus Gajdos wrote:
> The first patch updates the DT documentation and the second is the
> update of the ilitek ili9881c driver.
> 
> Matus Gajdos (2):
>   dt-bindings: ili9881c: Add TDO TL050HDV35 LCD panel
>   drm/panel: ilitek-ili9881c: Add TDO TL050HDV35 LCD panel
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] dt-bindings: ili9881c: Add TDO TL050HDV35 LCD panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9cd437c870b10da4a3276a569f5089af06435f85
[2/2] drm/panel: ilitek-ili9881c: Add TDO TL050HDV35 LCD panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=81aedd50697c876e633b68d6188a31aeafcfc535

-- 
Neil

