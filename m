Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF4D4BF904
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069C710E63F;
	Tue, 22 Feb 2022 13:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8B110E63F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:18:38 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id j2so14402120oie.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 05:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Qcw9bKKE/I3YtOTGrr/IloXYnLQKsqmcABj+F9w5gU=;
 b=c8BAJ4m67w3KkA6R8MfDkVVbI33E3DVexeALTYofb5l6z5ouhhOz4fZsya2JyYKPgi
 sat/gkEnc4YCyfXFmsZ6JizPCfEvFBKy3sUlF5kqA1LOCaburVgG3znbklkOywSEkBWA
 G4dNPu+gyva002SGyTd8sipk9LyYX5MNusk7OkITM29UMV63h0QVBRWT6pIy3yDo9idu
 jgK7nVvQLQAScQ/Glv4ROveNyabb2dodxJT5dc5JgNJIC0pXpAIFcfOgR8kMlIPvhSdn
 hLddDjV84SiN5tH1H6kiw2/03Ghq9xeP9fyF2dPGNWNLtG9Zvhe8yLlqRFgwIim9Y3FD
 ZvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Qcw9bKKE/I3YtOTGrr/IloXYnLQKsqmcABj+F9w5gU=;
 b=yLIoOJ3kYqy73tIzB3IhLCkxgYFkPGlmow1BQFeaNVeQsnswXQCQ3Rn9s9zDqeW2VW
 TwOZi3MfS1LG60Uxg5yuMKWRhVLKUdeTRnHx71ywckaGMaboOw2t2MC8v3w5J6ibiW9Z
 u6eolZnhkmKzU4jmC/cb9Y1lPujDmMMfl9s0iAusBaa6oL724qRLmW252O9yOXnmNyvh
 Lph0c4sQUoRzbToeUughdCS/95VzPWThtRS73Lamj4F+z+hOZ1kIENFjxMy9+qt+wtTc
 5oTrQ0bioZEba8830x1BOhsgPKw8U2KB3bYM9jvq+HBKRFzwFGDR/JQrsLkMgVT3MW41
 e0SA==
X-Gm-Message-State: AOAM533fPmAt+EVVzz3wtoB9DYRg6GV8KoVM0gD52dU0xfFLqFfOLQfq
 d3EjP4AFaX8Ki9RAo8NNrWRfxQ==
X-Google-Smtp-Source: ABdhPJxEgvmm3gdK2nB9u+S/MLEXPpJvc+viMUQ4NlZZF4yuwT7VswodNQo1pHuKz6DJMA/hokhwcg==
X-Received: by 2002:a05:6808:11cc:b0:2d4:9b7c:6d76 with SMTP id
 p12-20020a05680811cc00b002d49b7c6d76mr1803271oiv.193.1645535917778; 
 Tue, 22 Feb 2022 05:18:37 -0800 (PST)
Received: from fedora.. ([187.36.236.204])
 by smtp.gmail.com with ESMTPSA id c9sm6325050otd.26.2022.02.22.05.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 05:18:37 -0800 (PST)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 Hawking.Zhang@amd.com, john.clements@amd.com, tao.zhou1@amd.com,
 YiPeng.Chai@amd.com, luben.tuikov@amd.com, Stanley.Yang@amd.com,
 Dennis.Li@amd.com, mukul.joshi@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, Anthony.Koo@amd.com
Subject: [PATCH 09/10] drm/amd/display: Add missing prototypes to dcn201_init
Date: Tue, 22 Feb 2022 10:17:00 -0300
Message-Id: <20220222131701.356117-10-maira.canal@usp.br>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222131701.356117-1-maira.canal@usp.br>
References: <20220222131701.356117-1-maira.canal@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: magalilemes00@gmail.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 amd-gfx@lists.freedesktop.org, isabbasso@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Include the header with the prototype to silence the following clang
warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_init.c:127:6:
warning: no previous prototype for function 'dcn201_hw_sequencer_construct'
[-Wmissing-prototypes]
    void dcn201_hw_sequencer_construct(struct dc *dc)
         ^

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_init.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_init.c
index f1f89f93603f..1826dd7f3da1 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_init.c
@@ -27,6 +27,7 @@
 #include "dcn10/dcn10_hw_sequencer.h"
 #include "dcn20/dcn20_hwseq.h"
 #include "dcn201_hwseq.h"
+#include "dcn201_init.h"
 
 static const struct hw_sequencer_funcs dcn201_funcs = {
 	.program_gamut_remap = dcn10_program_gamut_remap,
-- 
2.35.1

