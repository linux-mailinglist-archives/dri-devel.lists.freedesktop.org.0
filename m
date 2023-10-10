Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF487BF630
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 10:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C6D10E32B;
	Tue, 10 Oct 2023 08:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FC310E32B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 08:40:08 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3231d67aff2so5366017f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 01:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696927207; x=1697532007; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5V8neVpY2GyLdSJsnZ8MOddhcYp6sdc0BYbuhT9I1jQ=;
 b=qyCG/lIIcVXFa6auEcbUMVd7EE9PHO7X0NqJDElPqE8X0u/CDTtWqTLQCE9A8cwIQk
 ugoblSXP5hxr3mH4v21o72IOZFuY6Meme27LBlcEVC9k2AYZ/XpGlwOqY8omjEi+yTqb
 5K4hiyfXSWHLR6B3gFEW7o/fusN5ICdU9zBi9RJvTKgtytP3O7TFmsVxPV5EVm4sIHZs
 ILfeoSRphc3L1yBgfERkH/JOjMTR87RWESs7PCNIZKkyopISpjHROxucRKQpgE9oGfKV
 yxt9MVTiO+1nqvmEiX1m7z90RTJMQMkDatdmGeRqbRVdJ8kpxU8zLFaikrGcD64pMnQX
 hYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696927207; x=1697532007;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5V8neVpY2GyLdSJsnZ8MOddhcYp6sdc0BYbuhT9I1jQ=;
 b=j2BPLzov/FfR58yKZu0OOKU8e8W/tOionvbZKpsK7Yv4Asl/ZaYP/NOBYKAssBRKPY
 D1qAGL16XSXO3vQmr3Ku2zw4Xan8AnmgIdUexzD2oD8XOrOGFOf3hr4mYHWtYwzGhsl6
 r5sIcQVhnb9POq3Bj6gut132XINHdJucju5udB0TA9MXQFr89bPQXbqkpfxH3/yrDhZA
 NTegN3HeZcqY2XFg1Xnuf7/3etn7YUXxgwzLBI03/o9phnJRO/I0hnaU9uKUGSWmEjJz
 trRyC5YgYSKGvZjTRAtny9C1BNpRmBYkXUkHK8yBeerRlhMs83R3GcL84Xyi5aQyfoQO
 Vt9w==
X-Gm-Message-State: AOJu0YzU7oKIuSaKV2H/iZwzrLkueaQeX808P+qgFZeOGAxlqk9kPjQV
 fVmVQZMt0Ub1khK5YwFQX5nnN9/uURfsUuGi9f7FSCfb
X-Google-Smtp-Source: AGHT+IH1kmpxEfIe7fVGzRzvDNu56x2D7KkVclXW4oI19nKrGRc3frP0Z8AyVAk1RdaBj0q63jEwVQ==
X-Received: by 2002:adf:f48e:0:b0:324:8239:2873 with SMTP id
 l14-20020adff48e000000b0032482392873mr16993689wro.37.1696927206711; 
 Tue, 10 Oct 2023 01:40:06 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a5d5489000000b003179d5aee67sm12052874wrv.94.2023.10.10.01.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 01:40:06 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 yangcong5@huaqin.corp-partner.google.com, 
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
In-Reply-To: <20231007064949.22668-1-zhouruihai@huaqin.corp-partner.google.com>
References: <20231007064949.22668-1-zhouruihai@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v2] drm/panel: boe-tv101wum-nl6: Completely pull GPW to
 VGL before TP term
Message-Id: <169692720597.2649526.6802678685318841336.b4-ty@linaro.org>
Date: Tue, 10 Oct 2023 10:40:05 +0200
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

On Sat, 07 Oct 2023 14:49:49 +0800, Ruihai Zhou wrote:
> The sta_himax83102 panel sometimes shows abnormally flickering
> horizontal lines. The front gate output will precharge the X point of
> the next pole circuit before TP(TouchPanel Enable) term starts, and wait
> until the end of the TP term to resume the CLK. For this reason, the X
> point must be maintained during the TP term. In abnormal case, we
> measured a slight leakage at point X. This because during the TP term,
> the GPW does not fully pull the VGL low, causing the TFT to not be
> closed tightly.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/panel: boe-tv101wum-nl6: Completely pull GPW to VGL before TP term
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=258dd5e6e65995ee85a941eed9a06708a36b1bfe

-- 
Neil

