Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CADA7DC8B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 13:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E65810E437;
	Mon,  7 Apr 2025 11:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lDRhkJFG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FFD10E408
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:38 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-301e05b90caso3882808a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 02:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744019618; x=1744624418; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/Q9Wp6VrDxx2zQOy34OYdMEGfGFXEUS7MNs4xrisK+c=;
 b=lDRhkJFGHYuL38mnAgzCQzJBUftlPmib29UXtzlVlE4xYmy2FzYwoQcKQKZShAwjQT
 diHjfy5xu3mS3eaou5Psn69RI4/JJyu3UKPRNTZ65+EYP3j0uin84wHBopHegoC80wMI
 gaAyim+HCbLdiZdh8qPwKUmD7p4wP/m56jK7EO1dNIkFIr+DjVqIzxgXtM96CVUzwWKq
 xqwsQpHqIk3oML2OgkAIJzHU18pqzvNSG1E04O9ikxelpHvRTzNEzpz3B+ElpbKA9lh6
 vokueeCLb2yLbq2smjYQ3Wf3PciaW/6ELJeVDlV2ozLORMlqaNCTPKSYDNwjKsmWEN+5
 V1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744019618; x=1744624418;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Q9Wp6VrDxx2zQOy34OYdMEGfGFXEUS7MNs4xrisK+c=;
 b=qGPwhCQU6NOLqWtMuBR8/CLW0byUBR4wBR66tzmQ+HsqRTuUEwAWDH0V9iTEjGY5+I
 B10U6pkd2ERvY9X35jckJhQVcz5Fkr+3kTC8aWOjJAzow8OdPBsGQVN4TXBcugtl/b2K
 fMn+fWnuGRwPV/ZD/MDDScUucb44shbHpKeNF050k7SUMpAdoSsbRq1XJVSOeEugN1Fb
 aZVW7C7pT+lfMZCp1TWCNilYjBmkBPwPvv0JraI/pCjUOBdVfM6tjeVrj/0+i5X2MrfU
 oK9BYHmapoFXMPjCxb1tn1lGaIfAuh0DQOnn3Lrz6lDdtKSUTy83ouQh2SE2dPdfOveo
 uObg==
X-Gm-Message-State: AOJu0YwqEJbwm4Pg90CG+OjR2FwC9SIc4j4KSX4dIoqqBB/RbUOaBhkm
 znFqtVOnPWoda2hYUpClkmUi1Q+lo5EmJ7J8zFK1yGL4XgndhMbE
X-Gm-Gg: ASbGncvHCRJaP8dmFQJT4gpmOmhj/fbpvKPsHKvT22hgmpsjCOR7HRrZEuKlzDHL7Dn
 xxLlIdt+es2XKB1+rvOdY0fJBqC3h8KvYvzAxZX7qA0/1WhoQI1Pt8F+zK1ONVIBpQKJnvLw3bA
 zKRtB9KYFm5gYBUM4udgnoeU8FJU5XiXz2gE7fuzGK8GS+QyA37a3mds+IGHSxQZaJQzB2hZFde
 VoCE/Okadq5uwSCuI+pa4xgmhyu6CZ340LVdjUiMA31zaaU5G10cXlT64624oRtysU4d133RIQZ
 hOsV8qO4QyDua2q3YBH3Uk7WgAKt3rV8Fe+jKb8wJrXV1hT65+vwnQ==
X-Google-Smtp-Source: AGHT+IEClB+vbekKfxRBf/hP+3rUD6Xa6pkq1Auukmq5xl2Q3VLLviKbENQ+2DbT97tBfvtw6yt2Ww==
X-Received: by 2002:a17:90b:4ece:b0:305:2d27:7ca7 with SMTP id
 98e67ed59e1d1-306a47f0fbfmr19199586a91.16.1744019618464; 
 Mon, 07 Apr 2025 02:53:38 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-229785bfddfsm77213805ad.66.2025.04.07.02.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 02:53:37 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 0/4] backlight: ktz8866: improve it and support slave
Date: Mon,  7 Apr 2025 17:51:15 +0800
Message-ID: <20250407095119.588920-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 07 Apr 2025 11:40:40 +0000
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

Sending this patchset to support coming devices which are using dual
ktz8866, original driver would only handle half backlight region on
these devices, registering it twice is unreasonable,  and two devices
share the same resources(pinctrl) which is required for every single
node under recent dt-bindings, so adding new support. and improve
original driver. Details in every commit log.

Pengyu Luo (4):
  dt-bindings: backlight: kinetic,ktz8866: add ktz8866 slave compatible
  backlight: ktz8866: add slave handler
  backlight: ktz8866: improve current sinks setting
  backlight: ktz8866: add definitions to make it more readable

 .../leds/backlight/kinetic,ktz8866.yaml       | 29 +++++-
 drivers/video/backlight/ktz8866.c             | 99 ++++++++++++++++---
 2 files changed, 108 insertions(+), 20 deletions(-)

-- 
2.49.0

