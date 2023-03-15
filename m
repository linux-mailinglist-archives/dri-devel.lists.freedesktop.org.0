Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB076BABD7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF1E10E1ED;
	Wed, 15 Mar 2023 09:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AF010E1ED
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 09:13:50 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso626842wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678871628;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xGIgG+nfQ3uyl4drl9en2yuuyKPUqcLJi9WOxBRKmpM=;
 b=POVA8cuflMM+b1KPOZ+/fjiWcXC+mQMXKztdD1MrgwV/FEb7jjy4lH1/TuLRY7/nYb
 2zxJGbCq0rzzeYZ9fiHCeBrNFPQWsC4JH0EN6PwMNojafbtgN1DxaRE81irRrMUYJr8u
 OVb6kpra+GUOAwcWcwWQEmMEz9GCPAUb+4zZbU64YwahtuqQcjmQofa3Xm3x51zPRU4O
 kqX3nATOm/NdqnT36AL/Nek/vjaRj/Swea1Zhkv0Vv70COhbtzgN4vNtafBtJu56awur
 j15ULP+voQKu78bUWAHDelMg3opitMCgVQ9dTprkbmM+pzDrlKvsVEO2sGHyPcXtteuT
 GiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871628;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xGIgG+nfQ3uyl4drl9en2yuuyKPUqcLJi9WOxBRKmpM=;
 b=YB4y3HCcGWSix+UgDISDms7RHDMpNTnU7I+oKx/fljuCqibwWJLTigKWrDVz9r5ZAQ
 k0/R2g6RrRosMJMa2HoiZ2jNO/X60KkieE/VBQBg5KG8ccjXk+7+hLz4ybWso4HX8x/i
 a7m2s9CMjQi45ZnmH3y3J//6Bo3wGRlo5xNJ9uqSpwfgC+6Q9qncmXYoqH5Xa6RfDc37
 sdySIIhPksKrg3cW4V0nixbDGZtY2zUaZERW668nCzrYu5bzi+9s6JwY2M6pUFSawywk
 v0NMJyijwNuxXfVmJbUQSA0aBcNrTpIZJ0HqpMn3TwulkQl6oKIxv3w9/S3Qi62X9elE
 z+ig==
X-Gm-Message-State: AO0yUKU4keQeTJ8mli3PxYCmBp+AIiCR9OI1ExUIl59GYkeLLZ8L7KMP
 TeJQxb6D+CcXeXfnm+I9AiocZQ==
X-Google-Smtp-Source: AK7set/Dn9l8p8DdE3Dci/nG0+h7h2RMwo75JEjKq6kRPJnyXo0lQGRS9k1C3pTqAw7FS3w+tp2r/A==
X-Received: by 2002:a05:600c:3503:b0:3ea:e7f6:f8fa with SMTP id
 h3-20020a05600c350300b003eae7f6f8famr16434518wmq.10.1678871628832; 
 Wed, 15 Mar 2023 02:13:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003ed23845666sm1136212wmq.45.2023.03.15.02.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 02:13:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: sam@ravnborg.org, airlied@gmail.com, daniel@ffwll.ch, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 thierry.reding@gmail.com, 
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
In-Reply-To: <20230314085034.6380-1-zhouruihai@huaqin.corp-partner.google.com>
References: <20230314085034.6380-1-zhouruihai@huaqin.corp-partner.google.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add compatible for
 Starry 2081101QFH032011-53G
Message-Id: <167887162800.2174720.1844367111418757005.b4-ty@linaro.org>
Date: Wed, 15 Mar 2023 10:13:48 +0100
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 14 Mar 2023 16:50:34 +0800, Ruihai Zhou wrote:
> The STARRY 2081101QFH032011-53G is a 10.1" WUXGA TFT LCD panel,
> which fits in nicely with the existing panel-boe-tv101wum-nl6
> driver. Hence, we add a new compatible with panel specific config.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

[1/2] dt-bindings: display: panel: Add compatible for Starry 2081101QFH032011-53G
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c4969c95266c672b5dc0c6a1ac070b6d647fea22

-- 
Neil

