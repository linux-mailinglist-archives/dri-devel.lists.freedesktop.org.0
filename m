Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F18A47120C4
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 09:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1F310E74E;
	Fri, 26 May 2023 07:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2282010E74E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 07:18:55 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-30a8c4afa46so357461f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 00:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685085533; x=1687677533;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7x8EaOVciQbaWaP7P7FJjb990SGfOsPyezBQlBQ+Diw=;
 b=gbIOZDLWvLSxweRWLTzaY8XBjZ5q08yrxVQxiv39jl2zy6TQZa2lgdlICWZEWDSIHZ
 fpabCR6kGa+foz/21JE4Cojs3fkY4BI/iG3y4epRfXiX7j5xEyFsRzYYW9HBUNNPkbj+
 6feD5bHx9YvCa+CqFh8q91RZ4uFIpTPKgNdXi8ohDHul0t+99soOoJx6yo8Vxtyxr/c1
 h1/sjhkffuOOrS8lxEUxW0OSChsIPxBPuICJeRAPI3rSRDYKcY70uh+IJnUZyX4XOy2x
 WL7yZyBfYkb5uM8OjhkM+htw9dkUB/8CaB7nGsQ7vkgmYUhl/yoiZha5An+LjS9Wd0Bx
 Wuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685085533; x=1687677533;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7x8EaOVciQbaWaP7P7FJjb990SGfOsPyezBQlBQ+Diw=;
 b=JlN8FusmZDXNjR8hnZy0UIIIAEsWNVE6Zc95uzHRzmMma6f8OZd1uLpkLNBYGvETNO
 6sL31FgZtl9S6U5NQBJQO8eTM57eU0YQ6/0SHnzEy4eoNArcDfBDRE1vHOHG7Cad+Mb8
 Lse4piyDhRF02MuhxGM8gV8El+44Gl1/Eo/tHpjMNZjhz50nJSXBiJkqi3ca8UiArOvx
 OTNnLzXrVE9ozQOD/B3EKaQzUy1Sc8zcww+AsMJHEATfr1QNoX0jBV/odSuWlxu06ugu
 PHKiPgcO3CRZsZZFuAKXb0ujfpvnpOIEVMBDga7FcONSA9vjLDx8bPm12xR8z+boPrEN
 2r2w==
X-Gm-Message-State: AC+VfDz0ym+K54xW7FsYqJe4EJZJXc4tP3sVSJgt/6VV8Tqkg+lwydM+
 8Yxek9v4xMKVRSJwsviWydA/Nw==
X-Google-Smtp-Source: ACHHUZ6R6U6shWgeZfTSnEZIBLJRJhvCBwuNhpQtzNz+PMH2uTCIIEyZulY1YDZ4YG/YtXlVkmmLqQ==
X-Received: by 2002:a5d:4402:0:b0:30a:bd8b:b102 with SMTP id
 z2-20020a5d4402000000b0030abd8bb102mr591334wrq.19.1685085533126; 
 Fri, 26 May 2023 00:18:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a5d6849000000b003078c535277sm4085490wrw.91.2023.05.26.00.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 00:18:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
In-Reply-To: <20230525155227.560094-1-robdclark@gmail.com>
References: <20230525155227.560094-1-robdclark@gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: Fix no-procfs build
Message-Id: <168508553213.1425379.11727335048829128937.b4-ty@linaro.org>
Date: Fri, 26 May 2023 09:18:52 +0200
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
Cc: Rob Clark <robdclark@chromium.org>, Lijo Lazar <lijo.lazar@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 kernel test robot <lkp@intel.com>, Guchun Chen <guchun.chen@amd.com>,
 =?utf-8?q?Marek_Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?utf-8?q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 25 May 2023 08:52:24 -0700, Rob Clark wrote:
> Fixes undefined symbol when PROC_FS is not enabled.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] drm/amdgpu: Fix no-procfs build
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1a56fcf08ae463a4564d111356091b2bdb6c7bce
[2/2] drm/amdgpu: Remove duplicate fdinfo fields
      (no commit info)

-- 
Neil

