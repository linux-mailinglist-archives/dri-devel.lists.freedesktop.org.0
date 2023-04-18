Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 433536E5BF0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BA210E6F4;
	Tue, 18 Apr 2023 08:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1E210E6F1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:22:05 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id q5so15081087wmo.4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 01:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681806123; x=1684398123;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sOCCLAEeZnpHxAtmmGgzxPwF66rFZDU3rDLalgc9zEQ=;
 b=XyU1r783tqz29k99NMiDpHgiXTPnCw33Nun3tmjuQA4WFmEH0ddmRl6lTyFp2R+6l4
 6ifo7qBvBnbM6Rwv/p6HapTjL6018wlLFeeDGV1l4n3Fp3cEv5JfEnVdZ86mO9pyfWZr
 Rpg7jjEoDR6wgWs8JKtUTlaeang7N2hd77oTDgRKIuxHNU917kfI2zvhmvMMb+ydho/7
 h+VkPep9PARngBmsYdm1MGDjITVhD7zVrtUxxA6pb95jfeqnrqyVpkPfXev0yIe8qV3y
 6IlI2halY9wDtBv9RIlhCInHlPJ6aKq+BwyoUrvZ9lBFfeBUjUgpXnLl1ReslGMa5mP6
 o23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681806123; x=1684398123;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sOCCLAEeZnpHxAtmmGgzxPwF66rFZDU3rDLalgc9zEQ=;
 b=GN6q9D3iuXx9vnT19fQrYu0dkX+AzRAYFa9fu9cap706TyRt5fFdtCc2Xjr4vdIOLk
 mjZlQSCmCzLJxUCfpy15B5uLH1ISjFd9//sdSuicm3nvxL+0nMcmBZgHVKo+bPDZRMZm
 oCwmemw2UYkn/vB91VKgzmSNjSIwKFtE1+1k9vw/vlhfw96QPDd1eoxKC4vbaSp8Iox+
 9jrVLJ3ZHHKkxq2lkrPbvMpwJ6FqXFl0l8VyiKo07Og3D0Ngx208K0qDm7M5yVQ6QoRO
 jUXUkjPYQtuJESVLmLuz+oONsOXkIAC5p42ekyxHQJgXwkEt3g0WHV7OSw3K1bmhnuU2
 /D1g==
X-Gm-Message-State: AAQBX9fToscuIsAJKlYr0WZXhP5iMeKTbOTT+sgZlrvLr/b/VxCufMrz
 UEaaU2GKtgm6fxasjc2RYOI5xQ==
X-Google-Smtp-Source: AKy350ZA7c/Isc4ixslJcBkYI3gZlJzvqaQTmuMdbZ40kxrfCu7z1GoBWjUWHvVpFGs6vR76VWOz0g==
X-Received: by 2002:a7b:c8d4:0:b0:3ef:6aa1:9284 with SMTP id
 f20-20020a7bc8d4000000b003ef6aa19284mr13088585wml.29.1681806123357; 
 Tue, 18 Apr 2023 01:22:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 y14-20020adffa4e000000b002f5fbc6ffb2sm12329185wrr.23.2023.04.18.01.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 01:22:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230417-topic-maple_panel_fixup-v1-1-07c8db606f5e@linaro.org>
References: <20230417-topic-maple_panel_fixup-v1-1-07c8db606f5e@linaro.org>
Subject: Re: [PATCH] drm/panel: novatek-nt35950: Only unregister DSI1 if it
 exists
Message-Id: <168180612256.1150495.3672863817651132915.b4-ty@linaro.org>
Date: Tue, 18 Apr 2023 10:22:02 +0200
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 17 Apr 2023 17:41:08 +0200, Konrad Dybcio wrote:
> Commit 5dd45b66742a ("drm/panel: novatek-nt35950: Improve error handling")
> introduced logic to unregister DSI1 on any sort of probe failure, as
> that's not done automatically by kernel APIs.
> 
> It did not however account for cases where only one DSI host is used.
> Fix that.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

[1/1] drm/panel: novatek-nt35950: Only unregister DSI1 if it exists
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a50be876f4fe2349dc8b056a49d87f69c944570f

-- 
Neil

