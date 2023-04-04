Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E77D6D5FF6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 14:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BDF10E20A;
	Tue,  4 Apr 2023 12:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B0810E20A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 12:14:57 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id y4so129772985edo.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 05:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680610496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sWpcdu+p0/E6sUTGVtKHFSC5GsGqtN7SMwVz/gyGBzk=;
 b=EaLkr8nP/08C55ln4iwIgp4kUL8ORZeCB7UHmYZ38ILW6MfyOhPVNxEbMUrkTgJsYj
 icEEZA1Uk3CytZZuFI4YLdrC/6NUFNWBgWW1BX0Ur8eK4r2u8c6HVCCqBv5Y4qOZXYuP
 /bfoGBfIkqjUHKNsMa/cko8I3GhKZ2XCp9DdwDTUTmARBm0kn3rcDOD/JTbr9KUW0XW9
 7/e7ON39d5Ypc41FLkrZ6HgZFmYbm0gtjdqV3eKntfQ8acj6ly2HVXNzq0HbglZVIK48
 a5WXone5j4gQx3rNfDP6uyoVcoraCzUPTQVES9zZNEwSEGWuYi6zd47w/bq7flUhefkB
 Fkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680610496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sWpcdu+p0/E6sUTGVtKHFSC5GsGqtN7SMwVz/gyGBzk=;
 b=nqPFHRdRMF/b5q+pCj+DXU8MaiK+Mu9Hi3YVn8RAh8Qzwra3PpOEVWrlO3Q8Sjw+yK
 Nw9IwVE2U04Rf6/KfMqgBsjBGU+eSbT1UqBB3RsGTnyQ8pCop8UXzjAmyhd4SU6j0b7j
 xbKP+4aXQhq+8vchILBHYYlMH8HzJVBdvTh/12GYHqd8S/Ee/mFT2RtQM0mlblUNHwIK
 RPeNxj5cfu72UaaHs0j46d7qBg4Qa5btTp2Xioxpoplvaf/OHvPz9gE8yf2zfE4+TetJ
 358UwMxkCUy0/4LUlpCv4DQOaozKwtii8nnxG590i9XUCYNyLRY/U17XHeDLIrKidU/n
 F2Jw==
X-Gm-Message-State: AAQBX9fRsO3/o9UA0ZZCBveDQWxmFymQN8TtiJ52erXGFl72WqKG8oKk
 8mg6ECzKw1NgqM7lfXUWQcM=
X-Google-Smtp-Source: AKy350YQdHuwC3/O3osGuzHIwHh+ZY6uPeVw68YRZlwwXBjBJLPXqU9IgqyL7LmE+ZofbSvbnFoPMQ==
X-Received: by 2002:a17:906:5a5e:b0:92c:138e:ff1f with SMTP id
 my30-20020a1709065a5e00b0092c138eff1fmr1860634ejc.18.1680610495847; 
 Tue, 04 Apr 2023 05:14:55 -0700 (PDT)
Received: from localhost
 (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a17090669d100b009334a6ef3e8sm5963490ejs.141.2023.04.04.05.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 05:14:55 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Lee Jones <lee@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH 09/37] drm/tegra/dc: Remove set but unused
 variable 'state'
Date: Tue,  4 Apr 2023 14:14:46 +0200
Message-Id: <168061024449.2054665.1446031361966014884.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230317081718.2650744-10-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-10-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

On Fri, 17 Mar 2023 08:16:50 +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/tegra/dc.c: In function ‘tegra_crtc_calculate_memory_bandwidth’:
>  drivers/gpu/drm/tegra/dc.c:2384:38: warning: variable ‘old_state’ set but not used [-Wunused-but-set-variable]
> 
> 

Applied, thanks!

[09/37] drm/tegra/dc: Remove set but unused variable 'state'
        commit: 42d364ad88ee81356f0417170bafbdc894594914

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
