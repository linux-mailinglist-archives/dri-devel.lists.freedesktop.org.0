Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE798D117A2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 10:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0404010E084;
	Mon, 12 Jan 2026 09:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="sPBX5ZlK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26AC10E084
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 09:25:06 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-430fd96b440so3081774f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 01:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768209905; x=1768814705;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=MZSVrZZ5XFd8mNpHYbw8llM2WdOVnlGmbhvs07WeTVc=;
 b=sPBX5ZlKHGtpvZRZ9W72UgtCCxrFROp/2Q0xMBCm8PBCgMKnj55eNGKbaS0GfFoNLJ
 F7zeeEM6t2AjBSnhUiCJUiW2fALba5EfVZ/fL1Sn0t2E10NCtNG6fQHskEMpa8VzB/OG
 0R7hvWUSpd5tPzyrXxjlyx34oj7Mwvbosr57IzDySBOBlYngV6zwUSfGPX6z097we9hI
 4xmwD+YvFbAtBtcxrE4oN9duy1xugNy1o2vevLlJy0kJRtP8dHwqhqQCpkw8uZD/TXI2
 w1YZJ9N+LlREX4DoprOCCw1Png1hDrpWNMlfYck6wzb9xHx4A5YUfiLO4tgiB9fwgBBm
 MiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768209905; x=1768814705;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MZSVrZZ5XFd8mNpHYbw8llM2WdOVnlGmbhvs07WeTVc=;
 b=dcPSQM/ULrYRaK6Caj0dZH3zLZFkiE6LMFz3yorC7WfEUmNWlsMCxOe8UUr0PIl7rO
 j8hZ97fYZsnyLkc0BUlPwnvWZssEfTOeCxDbIrOpEKMklwdkZ9GOppXypWcS/QcFlQtA
 mDQmXFltO0eqfAJdMqH+HrcKpsSlZX1qUe4uZac5JQTMhnvIi4RjGY/QnTrXB5JImOYw
 bFmIbD1wEkVMuVL4KpTA1ffqe4jxso4SKIk1OwUtQhXH9BuQMZZe4iJaPwG1qWqgT0jc
 eSnoRrBdLG9f60UBqpj1HTDMxwrykO7wBVIwSw/NnDimnpEDpK96tsHlo+d1Y8ipYouj
 ZPew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZCfPnrecddm01ADhYZ6vw3F/JdeWXSYS4ZA78zzUN1J3d4i0Q9o2zm737ig9sk2F3+fn509kWi7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2/6RD4joqV7nw9pXtyBOq2MRQAs43v3uJsb80tzpK71d2pzgZ
 4rwE7i98SNsKEbru+Kzsh2tVmPHKMHPPVk5ybkzRqzuGyXmQcs0Ap/0YPMzFd8O6NvkB+Kwi6U7
 B7U7wiUCy9ojnE0/6Jw==
X-Google-Smtp-Source: AGHT+IE7ScWv734CX2qBVCGtCqQj1RJ8Rndo+Q80CMSww3VDHfiU/+FT5N5OTN5p+S58QDWxExJ11Wv6kym+NQA=
X-Received: from wrib2.prod.google.com ([2002:a05:6000:18a2:b0:432:da3b:5944])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:53d2:0:b0:430:ff41:5c91 with SMTP id
 ffacd0b85a97d-432c3765641mr16144143f8f.52.1768209905066; 
 Mon, 12 Jan 2026 01:25:05 -0800 (PST)
Date: Mon, 12 Jan 2026 09:25:04 +0000
In-Reply-To: <20260109130801.1239558-2-boris.brezillon@collabora.com>
Mime-Version: 1.0
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-2-boris.brezillon@collabora.com>
Message-ID: <aWS98P5ocWn8GmJk@google.com>
Subject: Re: [PATCH v1 1/9] drm/gem: Consider GEM object reclaimable if
 shrinking fails
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 "=?utf-8?Q?Adri=C3=A1n?= Larumbe" <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akash Goel <akash.goel@arm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
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

On Fri, Jan 09, 2026 at 02:07:53PM +0100, Boris Brezillon wrote:
> If the object wasn't moved to a different LRU after the shrink callback
> is called, it means the buffer is still reclaimable. Update the remaining
> counter to reflect that.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Should this have a Fixes:?

Alice
