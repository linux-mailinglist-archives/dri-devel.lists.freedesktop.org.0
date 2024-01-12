Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 842E682BD58
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 10:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9895110E104;
	Fri, 12 Jan 2024 09:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E9E10E101
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 09:36:32 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e5afc18f5so20601125e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 01:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705052191; x=1705656991; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zrigGjhUftMsEvvhMgmyslWsk/A848z/GQjhjvTjG/k=;
 b=esYhSR/bzt/FyPU+Vkr2IkUzgJQ8w3sEcMeUO4xtMUmWEkXLZEeUKfseMfFWHXifpu
 prEH9bks8qHIfCmyOXcaDtbh4v2hT7U5YkBGD2V9bAiIxGrwU68tKEnl0hA0HiNP0d7k
 l2mjaHTxF7WDChAihWQgQlkaINNhXNwSdxct57ZZOCFW2Chw8+ptIiwwkpD5323biMvA
 N0/D98WfkrgeYkMjDUtFYmevwmIqREq9GheJiP2bptALUR01uXVNFK9aRv0DzMLh7V0P
 4fkwzTCeN0dhrWbDHq//6qJ20xMAnJ/Pzrw9W+Z+xON9wrC/pJScFv3lpJbKtQz/FCHG
 f1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705052191; x=1705656991;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zrigGjhUftMsEvvhMgmyslWsk/A848z/GQjhjvTjG/k=;
 b=Y0MzCMwIL0BI4ss6/AnnXPzC5TjJJ3uURndfPf2zcp9cyLVQeOQGUBKqmNwVoUij90
 A5jAZPAtZ7XzaOI6PtQQObPaZlEk4xdZuNVl1dqQP3/MiGdnxg+SPtkvks2RbcA/v3XP
 dxEp9RfUT9869w+gQ2yHfpvBa/Urqy85Pp+1JCNeJWZngJuiBy3bkvs1Wn595FjDozOF
 LWeXYUqMGx68Repr0mT+uiV3dk8LalmTDOalVESDAtOlHXZYLLtbMffkWAgVDkqyigFj
 u0Ebu8DhZyUzKfGCanVaAfUJKYol6IqO6ZFWYltd/y6Ami2bsbFxsL5R2UZrc0LzBlYR
 49Qw==
X-Gm-Message-State: AOJu0YwjcpsPWk5X81dIc6oYMuUjuRRx9ymu+HWQZghGl/PX6s9WICOp
 8GXDRZBosyHPuFFT7eR0s7wlsDgJW8BGJA==
X-Google-Smtp-Source: AGHT+IHgqUL55KHKFHM7XsRYKmr5WOBKPZJZ5ZbriznBeeHT9jeaIeg+abl+at93zuAmnmr9t1om2w==
X-Received: by 2002:a05:600c:1f92:b0:40d:70c3:5f3d with SMTP id
 je18-20020a05600c1f9200b0040d70c35f3dmr577626wmb.105.1705052191103; 
 Fri, 12 Jan 2024 01:36:31 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 fl13-20020a05600c0b8d00b0040d8cd116e4sm9009008wmb.37.2024.01.12.01.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 01:36:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: hanxu5@huaqin.corp-partner.google.com, chenguanxi11234@163.com
In-Reply-To: <3ac20d355b0b3ad3cedb87c8f4efa819a055624b.1702967834.git.chen.haonan2@zte.com.cn>
References: <3ac20d355b0b3ad3cedb87c8f4efa819a055624b.1702967834.git.chen.haonan2@zte.com.cn>
Subject: Re: [PATCH linux-next v2] drm/panel: Simplify with dev_err_probe()
Message-Id: <170505219020.999327.8364667104260922232.b4-ty@linaro.org>
Date: Fri, 12 Jan 2024 10:36:30 +0100
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
Cc: cgel.zte@gmail.com, linux-kernel@vger.kernel.org, mripard@kernel.org,
 Chen Haonan <chen.haonan2@zte.com.cn>, jiang.xuexin@zte.com.cn,
 yang.guang5@zte.com.cn, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 quic_jesszhan@quicinc.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 25 Dec 2023 22:26:15 +0800, chenguanxi11234@163.com wrote:
> dev_err_probe() can check if the error code is -EPROBE_DEFER
> and can return the error code, replacing dev_err() with it
> simplifies the code.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: Simplify with dev_err_probe()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9f78b3ae051d9eeeed9658cf54b3f0ea6920097b

-- 
Neil

