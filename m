Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA147C44E07
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 05:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AB910E297;
	Mon, 10 Nov 2025 04:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pnos2SN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FCE10E16E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 04:00:18 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-3436d6ca17bso1613105a91.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Nov 2025 20:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762747218; x=1763352018; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FMUfG6d8YJVoEPCuzvVWiCBdiIaGW3adtjAXZfiawOQ=;
 b=Pnos2SN9RPdqVdUhWPii/LvuJ9bg74gg1u03VIHDAfsObbBQbT4M4ieclToBeLkRgu
 gW3dQcUNVm9eg+SYAdc+NZCLL9NsS3CkwtVAQ7jX87Mve1PB7qTfWzl4jXHkj3E3C6tm
 eCMEyxkvGY0auOnEZEl7XjS38lwCt9gOG1ll0upaIi7VGHFoGuj4jXhxvFn0B1f3Tsvl
 elPCxyu9H+OYs7fphyxUUdVCNoLZhWSV5MFiKkCOVB6JtPN3vCtdEU0yTMTszhrhrOLl
 qa9aeN36Ft70INJVXsFdv4ugV0UEI3Mwhx1JECHQYWwO0iFTVJcSkiPpO5FRynESVC0f
 gaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762747218; x=1763352018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FMUfG6d8YJVoEPCuzvVWiCBdiIaGW3adtjAXZfiawOQ=;
 b=FRtbdHbEM8YlMNVjaetnq4Vho8ugtwN4OtpnPpINPXVC5Vqo/2V5x3EdgqqFbYzLJe
 mw1X/gi3y5mgBBwdehtzQ8MKQdifNUIZbR/7Jl2ROfL3Gzja/TslWFrDusfmI0mkUoJ5
 iNh/jDlxeh5tG749Ojoz91t0M5qfz29z5N8+h0G6E5UgEpwwIYfJllrwThhmu0IMaXlv
 OJFSLGk4BzqDauQrOM3/Y7pcSXSnsqyBZTiUP80hCeadO5izYbRWs/TIxCkYbv+pPcPd
 A1hqDn7xLnTjscC0mEN9Ow6TuLVSAFkzxzwoegjaLview/ZZYGrSGcqcJh96yf/Gh0YP
 2QXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcEUAAzRMRNnha6iATo51zvEx3qJFw8K9vL6DEYnIDO+3o8ge2XdOv76zmjqWp25RpJbncalBS9wg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlmNf92zuNcbATqEMTqD7ZHW5+bFM1vHoA2n4Zoxa0B70kmRkb
 4ViMpEtbaa092ABM7FxDtiXjcNKrmq8e3oPAA82CM0zSdHOYCtZHAKlw
X-Gm-Gg: ASbGncuW6s2LLskufwRXuFrgCD4X0BnKxqdFJfO4ZnTxs7Uxq4gWCZ3JFHELLeZJSK3
 0hqbb/xBYzG6NaPiljG5xkoKkI3oWU8u6dxXHUtFgAk1g8k+6NHdq018wZN4R/Ahawpv2HfpLLk
 5qNReQfiZY2cPnCHqvWjKkJmGNuTQZ7/haWnQg6fhExhC8XpOIdOD7jJUKThtUSqqZormjSsb96
 ySfuJuQFV04tEtUIm0PkBSOhpvwU6Wjl249uMswhDUYp5GuzkSCaZtC9o6HMjWtV+lJDjhyp8Tf
 A8acPc8j/yHufvsxczeZale5Vyu6GtV0VU8Wybz0nJY1ze6o1V37V52O40HZhFvk/yYPmeGWS50
 fe6QFjBjYlNlEhL5qOFXjIkYfLPKMfqtfLR93JGlnVJaeUMYLIvrdJc/RAsGIIAF+tChE/fWv7l
 4PtaEMwNHnX2s=
X-Google-Smtp-Source: AGHT+IGylS3DANSimRKsqAmshVHWUS6uHhBsurOh5pZoC5DU/3TeXp2D1eGJLyuUWjqFxc7R7ZxiJw==
X-Received: by 2002:a17:90b:5588:b0:343:60ab:ca8e with SMTP id
 98e67ed59e1d1-3436ccf9da2mr10566796a91.17.1762747216926; 
 Sun, 09 Nov 2025 20:00:16 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3437221b329sm5519516a91.16.2025.11.09.20.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Nov 2025 20:00:16 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id B7B4B41F3D47; Mon, 10 Nov 2025 11:00:13 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Subject: [PATCH 0/2] accel/qaic documentation fixes
Date: Mon, 10 Nov 2025 10:59:51 +0700
Message-ID: <20251110035952.25778-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=720; i=bagasdotme@gmail.com;
 h=from:subject; bh=+YLA1pF2u5tBPkoi+r5JyGU4phxXNOGQYDiMD+cdBrs=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJmCSfFXI9PM/p+54WFUsvFkzdomDv+PhZf0hNiuf5x+e
 YX0/Z2sHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZhIpxfDPwOD25v26U9xXiG9
 6GKHacdzFTmGCRYnJPqjNNidFmq++svwP0i4nOsFx8qwC3+U1ijM3X1phaSvyUbbokzDizxrGYO
 eMAAA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Hi,

Here are two documentation (indentation) fixes for accel/qaic as reported in
linux-next ([1], [2]).

Enjoy!

[1]: https://lore.kernel.org/linux-next/20251110132401.200d88bd@canb.auug.org.au/
[2]: https://lore.kernel.org/linux-next/20251110135038.29e96051@canb.auug.org.au/

Bagas Sanjaya (2):
  accel/qaic: Separate DBC_STATE_* definition list
  accel/qaic: Format DBC states table in sysfs ABI documentation

 Documentation/ABI/stable/sysfs-driver-qaic | 17 ++++++++++-------
 Documentation/accel/qaic/aic100.rst        |  1 +
 2 files changed, 11 insertions(+), 7 deletions(-)


base-commit: a2b0c33e9423cd06133304e2f81c713849059b10
-- 
An old man doll... just what I always wanted! - Clara

