Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD8674F024
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 15:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC5210E0B0;
	Tue, 11 Jul 2023 13:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D79810E07B;
 Tue, 11 Jul 2023 13:31:28 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-992dcae74e0so740484266b.3; 
 Tue, 11 Jul 2023 06:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689082285; x=1691674285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=RlJZ2SsUKhMssYjcshkRnhdOmrcJ96qc4qivUr8edK8=;
 b=mAPwxS1OVjABhyQJWV4hC+1tmJv6pIZFdmmGrefkD6db3OO9cEZprQCDIffVwT/OLc
 3DWyGC8KaJWAILvtM6ck3F+vWqSfMwskd6WXw7DxBSX8jmMAjdksfKRXk84/1b7pTp/c
 pl6nWRxdUZJhmMo1xe7ecEO9U1rcdYjlkGJzQw/aM3IhFnZQzf3DkK2zBuRZ2Hf5Qy7O
 Jj55N/5kTR+qpPv2ldOclbf8e5HLSpRVSVEhNDxvjBV/w8x0h27yUzBI8VDTgNOUUv3J
 34/eQBHLOeHG/RBAw4cqLRdxAs67QuPUSZDBJ5Vt9j7j3/hhVz3Llyyyok150XlFqPYq
 UHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689082285; x=1691674285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RlJZ2SsUKhMssYjcshkRnhdOmrcJ96qc4qivUr8edK8=;
 b=W9+YCK/UDUrT4mfJRuDTjLsYdBfAREgimoONxunsVui6mi3/7qiY0GOzOVyNP8sBXL
 RM9oLe7rtlJL7X1twyzZW7hLyuIGpob5wsuSEqU+gAZmEZZXpl2li2l8gmepH+DYnLhP
 T2ToGaf8lynGoQJ8PRM1zxAHQ2QN0cU08dsAQg+PGpRAoZVry/0sqtJ4lzilw7V/dwuk
 kN2tyPc+G1OPutQTPsr2GhKLwPgafoxU7atZhm4Ke5NY9N0qntESp51rYt8C13YLkPxp
 3TQ87AIckqyLXk6jyLiKmzPrm5qKIa5q9fAoVBwU65CdFZCAinXG0W27Gm3PzUYLVtB1
 fnQQ==
X-Gm-Message-State: ABy/qLY7ERQfHS4/FGZVJ+JHAYDr1rMMiuC0AoZr9dqXzDU48+YEZLNR
 K9MTrp6TllCi9TO9dc8HWlD4dDDCNNE=
X-Google-Smtp-Source: APBJJlFJxYYwhwvvTXv1+mtFZlll7720TxwE5CughgYjlcfd/gPuULDcjb48OJM8zYu2+c8QAkABjQ==
X-Received: by 2002:a17:907:7f89:b0:98d:cacb:888f with SMTP id
 qk9-20020a1709077f8900b0098dcacb888fmr21780727ejc.49.1689082285119; 
 Tue, 11 Jul 2023 06:31:25 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:154b:c600:448d:6e36:e62e:af18])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a1709060d9b00b009932337747esm1176967eji.86.2023.07.11.06.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 06:31:24 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: alexdeucher@gmail.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: drm_exec context for amdgpu
Date: Tue, 11 Jul 2023 15:31:16 +0200
Message-Id: <20230711133122.3710-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

so apart from some RADV semaphore issue which seems to be unrelated to
this changes our CI systems are happy with the changes.

Can I get some ack to push them through drm-misc-next?

Thanks,
Christian.


