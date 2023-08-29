Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B978F78C2E1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44DA10E201;
	Tue, 29 Aug 2023 11:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9342B10E201
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 11:01:19 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-99c1f6f3884so528483466b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 04:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693306878; x=1693911678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=XkoIkDT2S+jk/gV5wNGdd6GrWOThJOBgTpSbIgwDhOg=;
 b=OQnuYFyppeq3LzNnHKv0euAFNHLgyltcjN1ip2Ut9L+IjwxUhWEydr9X4qKcTPtQLz
 OgaCoZEd10MGJDCnpldpCgDBk8kWjbyVRo3W603nZEg7BEXMnCTO5nKZfMCBHmxDuDkX
 TBAAKZjOpg2S/TquIHN6p21qdRnvUhrGw6pey8Xe1DHXSyjw5oGBrFfDL/4wn+xH+pOq
 4BAR93eq7ZVMaVN1D6K74L2qGd0wEDl7hUhUGuzGecPkZwa/OC/Fk+qCatJCRdLbyu4B
 BDw8+6D+bnbBP1WkVhE4LZXt4Fjbrejh/+Y9RXVbE66Dz1waVoGOx4e8rw6MyVYEMv/m
 1rRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693306878; x=1693911678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XkoIkDT2S+jk/gV5wNGdd6GrWOThJOBgTpSbIgwDhOg=;
 b=fLC+gTNt2hDuNBio02M7w/EYtNwqw9Ehuc7W/jBKP0sGLIgi0Q37ZHsJMkmUdbETfw
 4Ep9vwxcqB+QK/CNFRDkaz8GssNAJNU8kZGgTcVEgWSZM2mwM1r5rhfQDatQUTOhKRuW
 AfhCYXe3/gge9NCLr+lXJBV5CpXJ+8wtC7MsQDsvEQpo//HUon4rWspwKjeS7ej1wTMY
 cjV6IxUA5f2ugGoDIA6XJoxe4W/NJKdwrcnUFCBh5ftvLEErNnTWT13sdbLN7L/SbvIP
 QXoUvM2epYyR/ePZaRRkh0ATU39zsMV+GZMTFh14TUzxDVJSsKYGAHi125xCv3M6mgIX
 PcAw==
X-Gm-Message-State: AOJu0YwteygVOmw5EEKMIHZ8Pb2GoW4YWejjxChniWJgP8zyRSuBVoui
 9gzc4oGd352QbkAMLiFJPC/gDv50tPLMhA==
X-Google-Smtp-Source: AGHT+IHubr8r9VBtXOaAguE6CEvw1eZylaPqixrTMuNXcCjdAswg2h1EWaSJJ3KhHCJQKvKTtMY/OQ==
X-Received: by 2002:a17:907:75c2:b0:99c:a23b:b4f4 with SMTP id
 jl2-20020a17090775c200b0099ca23bb4f4mr19990672ejc.2.1693306877661; 
 Tue, 29 Aug 2023 04:01:17 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:158b:d500:cd84:8e32:621d:b36b])
 by smtp.gmail.com with ESMTPSA id
 i27-20020a1709063c5b00b009928b4e3b9fsm5805885ejg.114.2023.08.29.04.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 04:01:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ogabbay@kernel.org,
	ttayar@habana.ai,
	dri-devel@lists.freedesktop.org
Subject: DRM debugfs cleanup take 6
Date: Tue, 29 Aug 2023 13:01:10 +0200
Message-Id: <20230829110115.3442-1-christian.koenig@amd.com>
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

Hi guys,

Tomer found a few more issues (mostly kerneldoc) which are fixed in this
spin. I think we can land that now.

Please review and/or comment,
Christian.


