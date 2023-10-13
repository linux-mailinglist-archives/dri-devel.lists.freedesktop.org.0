Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC26A7C8AFA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 18:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F3A10E622;
	Fri, 13 Oct 2023 16:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A7210E1A3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 16:28:45 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9adb9fa7200so466821766b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 09:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1697214523; x=1697819323;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SVjdnO017TGpoqeYiTjgwR24iVqshPB2PJMKMRPRcz0=;
 b=vuCVBt3ufvErUHjs8WDvD/bkBtrkgxq6CHg/obJ4jCDGA72TgjhrcJf9g6WsLdeVi6
 gPB32aRJya3nigP7r0QjtlDx4HNkClI6XwH9GNgPzuWC2Mr0uCVMrbbElxNxqU60ifTu
 SwSskAaYRWGHxhcH3asuQUF4kWS2Zd1+81be6eptINvq7Iu163rTB97iXGx0BatK9GxS
 B73BgkcDSl5CJYcye2FGJgRx9bvZBaBqieAaX2yrq5P0hAH7j9ckv97ffLdn9EcrJCDv
 fWg5pB3i1nfuRyygzQKG4szm1E/Nbu5mgFml7nEBIEYwhEhDpQ+jL1Lcs2Otnpe79UQk
 O1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697214523; x=1697819323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SVjdnO017TGpoqeYiTjgwR24iVqshPB2PJMKMRPRcz0=;
 b=mTfqk1oXYo4cFSKo1/lZ9BbfwqC8Chvse1qVFNB6WLN0atr2uXh3wZdsEXvG4/M1P5
 5/NKqcPS861ylp5h24mn0q9xDYK2OK7qmAgsszBJOjoaY3Y0fQXlakVHH/J7ETfV1u0N
 quCENodT/voxn/aUDGif/mbEg8KkWH0lQeVUm/vYXPn9eJwMVDzYZzfVbGQVWjI2FxZI
 WgavP58di/XSkBMm/bouAsov0wtidNoP2fnpDm+JMbnqCv77tnHZ/RWJIke8Ebbs/HeN
 zt9nJfzWF9YldzEEfV1A0IOZpeV8Sl9pxti7GXAmRkSjgW0+sS/Ju9nRvDD6PRt8rOAg
 q6Dw==
X-Gm-Message-State: AOJu0YxwxYckMxuQjYV/q8DChGK9H/i4oHJLEqSFzkEo8zMdnoNFTWRF
 V8WjZSNelYee7vSujopvr0n+xZt52ctTycXjkQ5yDQ==
X-Google-Smtp-Source: AGHT+IF9dkaPMN55YI5eeSdgA29qSKtrLhdcDFV5hkaJapbSuaSIotOLn33LxoI85KsCbbaVtQxamMT2qvzUIDbhLvI=
X-Received: by 2002:a17:907:1c91:b0:9a9:fa4a:5a4e with SMTP id
 nb17-20020a1709071c9100b009a9fa4a5a4emr637165ejc.13.1697214523459; Fri, 13
 Oct 2023 09:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231006173205.371205-1-robdclark@gmail.com>
In-Reply-To: <20231006173205.371205-1-robdclark@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 13 Oct 2023 17:28:31 +0100
Message-ID: <CAPj87rNT7rhL_GiSA6GtgcnByKwTmWUsFVMWTRSECz2QydjtMg@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: Default to UART for logging
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, Helen Koike <helen.koike@collabora.com>,
 Emma Anholt <emma@anholt.net>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 6 Oct 2023 at 18:32, Rob Clark <robdclark@gmail.com> wrote:
> ssh logging is the default for mesa, as it is generally more reliable.
> But if there are kernel issues, especially at boot, UART logging is
> infinitely more useful.

Hmm, we should still be capturing the UART boot logs regardless. Those
go into a collapsed 'LAVA boot' section but they don't just disappear
... ?
