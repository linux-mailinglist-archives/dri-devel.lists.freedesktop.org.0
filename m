Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 520A16D5FF8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 14:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C2D10E244;
	Tue,  4 Apr 2023 12:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851BC10E1DD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 12:14:55 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b20so129731556edd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 05:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680610494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xcckzg95zpKeurnjtan7E8VP+EYwCJoi2cRFH+SxLY4=;
 b=MaAjRRFugUvjadZGGJRXWMxFGP3C+fpBJg9N4EY47OixBVN6M7Ff/CxGNwnhPZSMjg
 Rmu9tS6icUukt3KVYABNtD6RK58Y5tsb55mTyDDku7bDiccsYlKFIAeDDbqIVJdBUhHD
 ykqEsCTrmretXQnYjLSuH+fo9x+eSVbvUOkOvpxaHR6FFqA5mO0010AD3ux8OchBB59Z
 CP7vGg4mWcMjzfUXxh8lqF5cVH+eA2dn72TNMl+roMKrvOUczkRcOoyJIIxqzk6KOp7N
 9a4M+DQWdzHiCtovTGKs8BrxzqSA85IY5QOKlS+a40YRr69imrL2KZhLSKnAbfBQbk6l
 Snpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680610494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xcckzg95zpKeurnjtan7E8VP+EYwCJoi2cRFH+SxLY4=;
 b=Sg90ST8CbJAWkeKTa5DPU/nA1xs5KzYs6zlK3ZC0Y1n8KrEupxS3zR7tGJI0hGe7nT
 RuHGdNRwYAJsfWi/lRI9n2xWomWU4usDCLJnfoiKEuyfe7CiRuLD5bf3OzXOmpP1Ppij
 fGL+RpdUALsOlm9RDYfHVJ3uof46k3d2Z9B3wYajUWVCfn/AorMvbMGnEidK41RM6FeP
 MAP/hZRDeIDwLLG86SLaXz1xXGkpll+u2MkDpGGhAYVpYHzmi1pmRiyb2Jrndo24LMaI
 UFJ6QBFfiAEZWz7DYyr/z0UQ73kc0d5nXUi0s7zkyoggVmAtcpw6hblT/WlHQHCCQt8F
 l8Tw==
X-Gm-Message-State: AAQBX9cwJXrEGnhB+kCahuNvPGZ9OODtQ+z39a2CAryLhDkbUV5aU7d5
 JMIneHBTX1SD4jAUJPkX4Xc=
X-Google-Smtp-Source: AKy350ZAccl7ypQjeajCpBxjnbYrGDamuVDbdEk5hzFtzr6jmcUkKbPu7ycNguia4WaGj1vfQpk0CA==
X-Received: by 2002:aa7:d598:0:b0:501:cde5:4cc9 with SMTP id
 r24-20020aa7d598000000b00501cde54cc9mr2212071edq.39.1680610493757; 
 Tue, 04 Apr 2023 05:14:53 -0700 (PDT)
Received: from localhost
 (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a056402175700b004c5d1a15bd5sm5724789edx.69.2023.04.04.05.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 05:14:53 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [PATCH v2] drm/tegra: sor: Make use of the helper function
 dev_err_probe()
Date: Tue,  4 Apr 2023 14:14:44 +0200
Message-Id: <168061024450.2054665.8080259648129396992.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20210917020741.17525-1-caihuoqing@baidu.com>
References: <20210917020741.17525-1-caihuoqing@baidu.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

On Fri, 17 Sep 2021 10:07:41 +0800, Cai Huoqing wrote:
> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> And using dev_err_probe() can reduce code size, the error value
> gets printed.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/tegra: sor: Make use of the helper function dev_err_probe()
      commit: a4c56f2f8ce0e242eb51e5309a743361e2348a64

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
