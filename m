Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B122AC2C21
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 01:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9447410E0C4;
	Fri, 23 May 2025 23:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UwOxPnsM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D63310E097
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 19:52:33 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-477296dce8dso1752161cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 12:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748029952; x=1748634752; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LZuMU82VeoD6SjXQ3MttsAUR2lLhSZagEoZvudH6MeI=;
 b=UwOxPnsMmO9EHwPEqbhYy3nOOP7ZUVEQZ3bWz9UVPdRvAbc2kbMjK1duo0aUXj08I3
 SBst98DE4mVswPp+AZs5x1nzybS7ELt1n7+wz1heAkSqYTK7eXzKFP89r788XS3D/6XA
 v2NAvFPcY5MOZHzcIE3UWt6zy+YqIqICD1sIN2piTCcreYXIjeJpym5sTEj0Vnsawkrs
 DGUnqxlhU7S8Hdh088tZX3N2cucA06HAgMho146TqKj6h5NpXYuDQ4HBUak3QkaDWyGu
 Nx5xmRFi+N5V0MfUF2yD5mw38mCIsZjfpFZZSI12EI3GbXNLn5Yb2o8PUa+Jm5CRqtdD
 mfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748029952; x=1748634752;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LZuMU82VeoD6SjXQ3MttsAUR2lLhSZagEoZvudH6MeI=;
 b=LqUts6WCLWZHVtj68tW/VBHxgqA+EwzO7JL6fns4sfiX/CZYrLyn/RYaUzIuOd6KS5
 A6flV2z7e49q+ODFWgI1DQIjdSNVGQ1PDj8qh+JrWDhVYvZ72A4LIHTD9cEIicYsoM2U
 VsYZMMFinrTHGl7mYcYr7aIc1f2O8Mus0HLWaVPUuv3n/p38fD5gBpX5sR4j0794eJOu
 sTHRhHwVEaUN0IGWhWiboQVrHiwXll/CtAtwrM4z6W80E5ECHwpKahBFiyo04TFzgyBR
 Wy/bBeRAh2/aY6V5DWSGaZ3Ba9olLDyGG9WdYB552h2GcUZXtYp9Y0glPDNrkoXEBiK+
 9Xfg==
X-Gm-Message-State: AOJu0Ywg6bp0y93HgAcxUr67K8IDksXtwkGrbeLmwaBNoo7hj/H88gu1
 m8OU0gvhidcWGIIX5TnNbEkseQOLy6Z5NQVjNw9Zyfiop7UWV/0/6SVk
X-Gm-Gg: ASbGncuhg8w/voKX3Y0rGBhabMZGPnbBzqM5KMdl3W4QMJwLoopEg9JAiWsgf/zytDI
 Bn0XIcPwKBeVEl74/X8/sqHMmNUWkInWxboKtyikhbLmwCGomHBQYA//LO9te5qojM2D6BcI3Jg
 GZWOXvz8Y9QQanYKkEhrmdHCvATXqmjd8FnOqRIERK17u+/pTfBAamx66xpxYWlAzWIzJF1Qp/D
 xBMrQ3N+e8fhkYlNfhr69vRaHzreaur0pSlskkzGl5G6S3f9fHVs/Ecsez3s0w1sDIxhbSaYari
 3fWSx/hpRQXl6Bgc6JXUi7s3L6Ch345DaKK536el8B4JDWX0r6zQefx89JW+SwzxVA==
X-Google-Smtp-Source: AGHT+IGnQY/z93JEf+AGmMMUkG5oJIhr6LzAzc5bOd7Mu9OECAnddCKCevcAKu7ElP4DlshKGt75zg==
X-Received: by 2002:a05:622a:1b94:b0:494:a01d:a912 with SMTP id
 d75a77b69052e-49f46940cc6mr8469011cf.13.1748029952122; 
 Fri, 23 May 2025 12:52:32 -0700 (PDT)
Received: from [10.0.0.88] ([2607:fea8:bad7:5400:a4e6:39bc:5bd6:cf8f])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae4fd718sm117133001cf.53.2025.05.23.12.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 12:52:31 -0700 (PDT)
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Subject: [PATCH v2 0/2] drm: add overview diagram for drm stack
Date: Fri, 23 May 2025 15:52:24 -0400
Message-Id: <20250523-drm-doc-updates-v2-0-e517df152cf6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPjRMGgC/3WNQQ6CMBBFr0Jm7Rg6UiSuuIdhgcwUJhFKWiQaw
 t2t7F2+l/z3N4gSVCLcsg2CrBrVTwnolEE3tFMvqJwYKCebWyLkMCL7Dl8zt4tEvJRV6UouKkM
 EaTUHcfo+ivcm8aBx8eFzHKzmZ/+3VoMG2YhjW1yL/MF1P7b6PHd+hGbf9y8DXZydrgAAAA==
X-Change-ID: 20250522-drm-doc-updates-3686f6d48122
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748029951; l=889;
 i=abdulrasaqolawani@gmail.com; s=20250522; h=from:subject:message-id;
 bh=DoYl8neMKOeuqXR7Psb9wz68aPAx8dAQ69CSXWwjT6E=;
 b=WA/dUAMQLPhuxLwgIo8veI2CO3as2EZ8+WPAF94JfZrJoUrO/ZohIijjxG3vKnUIVAMSISNKq
 zNem1mKp16/DieY+exXzEmk6SjqacQLsWM+zx0Ufrao/Hb2Ykj7Mgvi
X-Developer-Key: i=abdulrasaqolawani@gmail.com; a=ed25519;
 pk=LCvBseqd+rEj8B1vNEnSSfNcqQwMsfWx1DGDT1LYddo=
X-Mailman-Approved-At: Fri, 23 May 2025 23:25:09 +0000
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

Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
---
Changes in v2:
- Update the overview diagram to display correctly by putting in a literal block.
- Also update the overview section diagram to a higher order.
- Ensured docs are successfully rendering by building for htmldocs and pdfdocs.
- Rendered pages are okay on html and pdf.
- Link to v1: https://lore.kernel.org/r/20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com

---
Abdulrasaq Lawani (2):
      drm: add overview diagram for drm stack
      drm: add overview diagram for drm stack

 Documentation/gpu/introduction.rst | 40 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)
---
base-commit: 4d07f5440d7afee27dada528aaf5230e760531cb
change-id: 20250522-drm-doc-updates-3686f6d48122

Best regards,
-- 
Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>

