Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70A1853F2F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 23:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD58E10E5EE;
	Tue, 13 Feb 2024 22:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="gVw3JHhE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1F310E5D0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 22:52:18 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-5d81b08d6f2so3845509a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 14:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1707864738; x=1708469538; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n1biSooTx/UrebYR5OP4qSXkcgnNa/5VFREgCxOwPao=;
 b=gVw3JHhE5eKzjmfUWlV6um7Ld+MIg7eajO6BWo+bTfO+Cs1aAq4QAxNs1954KJyoTo
 lO72lIborEFoZ1eMuim9rwxrbWi0pmRCluKkerzZVt8Fmi6bW9STXVtouWatAk2FqJuw
 +2P91P5Ysyv89jngGyHYLy3kCkXfZNf0MuMSsK5Y2nMe/4reihPlvE4GM+X9fuDPs3Tw
 /w4gck5u4H+deEEpb2ehvgjirx0PF7ZN4jBcEV95PxnUAzTDr3occ/ziqkaVlALYP1Hm
 siQmZ3N/zup6/5hbskEkuq/8axRgvv1CMF4NBQnfbm0+yXOlUdvEX4dyGBOQSc9Chk3O
 0MBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707864738; x=1708469538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n1biSooTx/UrebYR5OP4qSXkcgnNa/5VFREgCxOwPao=;
 b=bqTnZ7H2xQVuAUK8zBpRgYZ1v83Lcp8wNJgLRgXpL0NbMj6Ehk9R/EDFniLNAByZtW
 yosiGg5XnxWGHywY6xhnGI8OjrabPOjPiz66CDdGzwsUWroZ/7WjTLXf7pLKnDlpyyhO
 5gRmT3r3qkrNDoHAAnAeE/6nOAeBhT2HfiaPCrmO47GVPb+o2xMAjWX5Tz4O+SkJ676Z
 4mn/BLurLHkiT42hCww24Guk/vTQG7GTrqDhH1Z016Wo2dp26qjnPGA7HjPQ2DFtnvR1
 YVaOlbyh9zDFZ7bgiWTnKFxyA2FnI/NvPrdSk681PsFcYImaHEWai1wUtTqwKLc7ReK/
 myTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWofBAHQnkTx7ifoJ1heav9sL6K2o+4U7gV4frPxppycuXVaocH9y4nA65iNag8Ek+0X+IvujFjjhaiuTrkN8F7FDc66yzzwlBBe7/rFpzy
X-Gm-Message-State: AOJu0Yw013hrSyBsEK4DwWkP/P4Xv3FJ/5RYj5uJ18H6y9eNGjrwpwjP
 bkqOfGE6SR5c5BpeSxWii1yUcNX+4c4L1dsifL1Sgp9PNu/aP6mShzMHmCN9CA==
X-Google-Smtp-Source: AGHT+IG83kjcMgyb2TepVhraekXIrGAoO7/5x2dYYti0Y2M/nalGgdcVnPISARyASbiN2EjZJxr0xQ==
X-Received: by 2002:a05:6a20:6f07:b0:19b:673d:824d with SMTP id
 gt7-20020a056a206f0700b0019b673d824dmr1066486pzb.46.1707864738360; 
 Tue, 13 Feb 2024 14:52:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXCiFWioP2hocfsaygH9ibRlbits+JDjuU/QXuJb2JVlOpqNH/v23Dygl9ANykWvEBeaX+I99sxAIVTQierYXlXJ+ZNpjQ9clLsKzo3whCzixc/NMeLrB5twSJzY2NE/+snoB/KB7FZ0RP4dV2a+j59NZsYPGN86+pimfvFR0KZqXAKt3jcLuEUx4+1woE1pwc6qI1RtcVqQ2BNl5IlKvWoD7oEAXvp5hrlClJSsSK3gf8+eiRXg8m96nUjr7VfnR48sax7zY2aipw6+W/VrP0PivaN0TuUMo3uzgn99VX4kbf3VooNNIGWt4Cudrvttf/4P1c22Y/TcNrychwT0JQmO13cAjvgDfMMDSV4AMU=
Received: from fedora.. ([2804:7f4:8280:6434:9a20:a151:2d8b:d5a0])
 by smtp.gmail.com with ESMTPSA id
 r25-20020a639b19000000b005dc89142b99sm1528379pgd.84.2024.02.13.14.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 14:52:17 -0800 (PST)
From: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, harry.wentland@amd.com, Rodrigo.Siqueira@amd.com,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com
Cc: Joao Paulo Pereira da Silva <jppaulo11@usp.br>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/amd/display: clean codestyle errors
Date: Tue, 13 Feb 2024 19:43:08 -0300
Message-ID: <20240213224339.379599-1-jppaulo11@usp.br>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

jppaulo (2):
  drm/amd/display: clean inconsistent indenting
  drm/amd/display: clean else not following close brace

 drivers/gpu/drm/amd/display/dc/core/dc.c              | 6 +++---
 drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c | 3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)

-- 
2.43.0

