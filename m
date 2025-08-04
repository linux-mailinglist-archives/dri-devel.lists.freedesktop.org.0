Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB45FB1A610
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A533710E599;
	Mon,  4 Aug 2025 15:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cab6ZGN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFE810E598
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 15:33:05 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3b783ea5014so2014506f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 08:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754321584; x=1754926384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pNqaDE0XRwMT9nDKDCZRUJSQjxM5DO6M30BKsMqcjqM=;
 b=cab6ZGN9AdMq9tKiraa0Jxq/mh00X5moGOxSRv4TF7owMUnB+IPU+jGXEOxgUcXSIA
 TNOEc4VZCYoG+VamVfqxx1pas7FDXatDyHdoQURi+jeXQ10s0QjKSkgr1kHEl/AlcSEe
 f5WSYwK6IEDxuiVI0ZULDctBxjpKyw0IJAnuLceM6rAS6kBOBSEd7dsKrZiqUHImvBrK
 IkW/yDpEGL8qgUIMfjijQ3lb4HXGsrIp6LJReb0Fo9i5guys2FdwwdbX8FU2Ra77cf4M
 VsLlFVLAnxHZ8oqIdtSF+Dx6OVy/XJ71D/RnGOFNghbVAKCA8o/JETX41srNRwGIQWW9
 0NiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754321584; x=1754926384;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pNqaDE0XRwMT9nDKDCZRUJSQjxM5DO6M30BKsMqcjqM=;
 b=RIKGLQzNaXJFH0w/cpZ9w3F9cIgpc4gjEd5qt11WtAJSL8rTgu3FVvOl2+Bpod4Lej
 tC0wlWLGgMzlo/SVTFW0qJuzCK+BCuxG0qw/5+JO+hyRqeQpHjaH0tjLcKHFP9TGmJPR
 Yc6U2A/NC4gNkUlj1PaFEdiU9HL1B+iqdqa8mUkriz+Anga4nAdQn/OGAzYXWx3MIfqy
 OO8ak2ljOVHMkRdAVl914b9n07oXLK3klqv1x370zAs7SMUlDKEV8yN7W8lWF4bRHUYt
 PPWL433A3b0o9KD2xkhaJ4t7EmaZra3MUS4cuKMie65n20NLJrBoHHtNcHWYWoXoA9sb
 ICmA==
X-Gm-Message-State: AOJu0YxufUBOWiBwgac+XC0n3iVFjBC8/+g4eos0ipwSTRVkLPLmJpAH
 nYawmiA1TPMj/RIjiqzWnA1TVq2XpGFFMshG5j4Y1/5E9SxkH3QfSd0FnCxyAOI7WlE=
X-Gm-Gg: ASbGncvCt0awvPoBLNvMLDIEe3yJaroiFYWXOQWv4UBSkCNJHhJ+hSivQL/RpkuGwRS
 fq7qtrFV38T3wIKglaynOlTuVkC0olvYpZwRMfPE6KGF9TPW5+GRl3fLHdBQd8DsaQ+qfPrX4Sk
 BCQ6lmQgeUrJ8ADP4Eno8KpP6125nj5B+0t8CO1dLrOJBNl0d84JuQHqXumdXRHZvtvgM1UFgoH
 q2gVfReoVc0+FWDqTAviSndIsiu5jehowmZ0sXVVSuaCSH1nivrqFVZd9yWNvJJj/2jPR2Qvw0s
 RIBcNh3jG1BquKdHFj0n4un/0lzuXXOg08t6znO3y7X74p0NZpY0G3ZX6/rUH5bQC0orm+xDgmg
 yAgLQuNWep99MAXxHIPkvi6BEnKKWvPefQBq38lMofbM=
X-Google-Smtp-Source: AGHT+IEH7J1aEyt847RMQ8pSGEOtrPbTd6+jjxQIc6w8XSKcTYDqjv4qErJpnuzKoW61kb/HVPQIFQ==
X-Received: by 2002:a05:6000:2007:b0:3a4:dc93:1e87 with SMTP id
 ffacd0b85a97d-3b8d9464a92mr7863001f8f.1.1754321584448; 
 Mon, 04 Aug 2025 08:33:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c47ca5fsm15664010f8f.63.2025.08.04.08.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 08:33:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250729054214.2264377-1-nichen@iscas.ac.cn>
References: <20250729054214.2264377-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] drm/panel: himax-hx8279: Remove unneeded semicolon
Message-Id: <175432158371.3671011.9003968976517689248.b4-ty@linaro.org>
Date: Mon, 04 Aug 2025 17:33:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 29 Jul 2025 13:42:14 +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: himax-hx8279: Remove unneeded semicolon
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/05efa7f1d14febf0cd230c4950abfa6add1344a2

-- 
Neil

