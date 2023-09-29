Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987887B39EC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 20:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAED710E1A1;
	Fri, 29 Sep 2023 18:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF2610E1AA
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 18:20:27 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c0ecb9a075so109928425ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 11:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696011627; x=1696616427;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H/kevk4tNSCK4yq8Y8Eq8euOICXuk1g8ja9WwJ3j9fE=;
 b=SyNBCNdT5WKQAIZ8s6vPzq4kdrnQBUqsBXXPE3U4TIojTAYPsWFTzW849qnMZx081c
 Q0CXh2NzXZSCWWUFpEP4Nj9ZXVNlKBj7ylFZlkFZ4jwyaZjW/BqvHe+x1YEysPGKlEWP
 9ZMPb7pB9e0tWuWnB+PVREC6rLTmbzpJoAQ/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696011627; x=1696616427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H/kevk4tNSCK4yq8Y8Eq8euOICXuk1g8ja9WwJ3j9fE=;
 b=Gf/pTtjesa4c+ieSAKU1CA5xn8JtkB9kAdimJAh7NR/L+PXMq2VAhSNFZHSuZEyaB7
 tA3C+yEZ/iIwpIgwmq3f/otf1+7PBq0oprXwvh8AE9Ytmf/fzko3hvBytROuOJ1235AR
 GpvNIBVPaUGz6LhGQuxcwRi75nCldyeoyvWm+mSD3HjJzUc2XFLAPneUdyYmNkUDogz4
 tYEj7mPbcLNQD1+wtsqLwlFTLFn9687LmNK4X4In1+D/Vg41C48yAlUZsA3O/61Ku0CM
 UPZppEE6tDHpGrLbPXe3Z3ONZJWsALMQTOWoYLk0uG592q5f51z5u548j0Lyzf+PICne
 D+Lw==
X-Gm-Message-State: AOJu0Yygl1N1IWeKLP26T/eC5ok7hpqOdGbh25TgVNJNsR3KB5Apnsm/
 AdYMWj98JflkyQ/Z+PMsdookHQ==
X-Google-Smtp-Source: AGHT+IGcMZNuu5by/ybQZhXigau4jvxccIHAaE4PpspYWQGaz1tg3yDDLn1/20+ox//v17UMP49BKA==
X-Received: by 2002:a17:902:d2c7:b0:1bd:a42a:215e with SMTP id
 n7-20020a170902d2c700b001bda42a215emr5862019plc.38.1696011626675; 
 Fri, 29 Sep 2023 11:20:26 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 v3-20020a1709029a0300b001b850c9d7b3sm17135700plp.249.2023.09.29.11.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 11:20:26 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH 0/2][next] nouveau/svm: Replace one-element array with
 flexible-array member
Date: Fri, 29 Sep 2023 11:20:01 -0700
Message-Id: <169601159821.3006883.15782981674963813068.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692208802.git.gustavoars@kernel.org>
References: <cover.1692208802.git.gustavoars@kernel.org>
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
Cc: nouveau@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Aug 2023 12:03:06 -0600, Gustavo A. R. Silva wrote:
> This small series aims to replace a one-element array with a
> flexible-array member in struct nouveau_svm. And, while at it,
> fix a checkpatch.pl error.
> 
> Gustavo A. R. Silva (2):
>   nouveau/svm: Replace one-element array with flexible-array member in
>     struct nouveau_svm
>   nouveau/svm: Split assignment from if conditional
> 
> [...]

These look trivially correct and haven't had further feedback for over a month.

Applied to for-next/hardening, thanks!

[1/2] nouveau/svm: Replace one-element array with flexible-array member in struct nouveau_svm
      https://git.kernel.org/kees/c/6ad33b53c9b8
[2/2] nouveau/svm: Split assignment from if conditional
      https://git.kernel.org/kees/c/4cb2e89fea5f

Take care,

-- 
Kees Cook

