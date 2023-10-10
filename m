Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515147BF626
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 10:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBD210E1BB;
	Tue, 10 Oct 2023 08:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E42B10E159
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 08:37:55 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-317c3ac7339so4930009f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 01:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696927073; x=1697531873; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bM0cR+jHfOI2qILAaNh+9FecRjTICMAQmR3rcDSCM5s=;
 b=NdAVRWz/zmJTyZrfS4dAsZn+emFTX2RcpsetTC36ExyVcW8yzArxPmUiqxhMBA6HC1
 FJOEffxJWI627hBqRXtnERUaMFivEt8n5QuyRt2dTN3m1rKC/BwEmf6L2f1gdt0SIFh5
 NPlmt1VTulrqIUXjMWGStBGKNBNpXOZ52A5l/fjroLWkM6VGfRUC1x+VYh20iA+IMIrz
 HzsJ2dG3dpADDWjSbsh9v60beeYuMxMz7vHH34g/OmXtjdYwLkRfLDgUxKVwKFPtzcmW
 RILqzQ1utrNtzs9Q2EbTNAKPjqcgv1xseTqSDxFdp6SagQluXeVnB/OerD64D3Maay50
 d5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696927073; x=1697531873;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bM0cR+jHfOI2qILAaNh+9FecRjTICMAQmR3rcDSCM5s=;
 b=sbn+oN0hNWZs+DpQOl4KyzO04/JUnjs/Kj3p/mGEM9iPNCi34BpDNGRWlm0LbnitNi
 duuz7PU0rCGVf3bZV1GExVomEDC/hbY0nwGXlglqOlgj5QLFqcOFGyUxmbQ9Wy3yEXZE
 7FkJHLjCNHXJMs5plKifyEvNtzxS2yolSzT/DQQdfNb36cVuu2ZDYrqONXI5sPUagOdX
 a3AeInmfoz7Teu7TDJ3hvWXjHKgrLAD49+kCz6JgyDGTKdL9rNo0K4jR8LcexybknlHE
 lXVnoIFYZxBzHDYm4QYB8dkAX4r/HUjF+MkAjXJ0TVgnangjaKL5m6yLXrTPdviJoD51
 0rNA==
X-Gm-Message-State: AOJu0YwYtMAqxDAtsXihCBALUopL04NwM+pkaM894ya5pUGmddqRzeNO
 64hkS/lVQStP6XC6LW7wx6vp5g==
X-Google-Smtp-Source: AGHT+IG9IppgKYYkVDqtUqADzSZdWZdWAucN7caZjsxQ4qL8cKRUnJM4yujPA6kDuAL7oB8yi8j+dQ==
X-Received: by 2002:adf:d1cf:0:b0:32c:d0e0:3e71 with SMTP id
 b15-20020adfd1cf000000b0032cd0e03e71mr1289947wrd.38.1696927073358; 
 Tue, 10 Oct 2023 01:37:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a5d6a84000000b00327bf4f2f14sm11983147wru.88.2023.10.10.01.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 01:37:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linus.walleij@linaro.org, sam@ravnborg.org, airlied@gmail.com, 
 daniel@ffwll.ch, Ma Ke <make_ruc2021@163.com>
In-Reply-To: <20231009090446.4043798-1-make_ruc2021@163.com>
References: <20231009090446.4043798-1-make_ruc2021@163.com>
Subject: Re: [PATCH v2] drm/panel/panel-tpo-tpg110: fix a possible null
 pointer dereference
Message-Id: <169692707268.2632460.16120897194118078768.b4-ty@linaro.org>
Date: Tue, 10 Oct 2023 10:37:52 +0200
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

On Mon, 09 Oct 2023 17:04:46 +0800, Ma Ke wrote:
> In tpg110_get_modes(), the return value of drm_mode_duplicate() is
> assigned to mode, which will lead to a NULL pointer dereference on
> failure of drm_mode_duplicate(). Add a check to avoid npd.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel/panel-tpo-tpg110: fix a possible null pointer dereference
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=f22def5970c423ea7f87d5247bd0ef91416b0658

-- 
Neil

