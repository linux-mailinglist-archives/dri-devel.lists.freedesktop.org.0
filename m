Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4156EC99E09
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 03:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998EB10E4B1;
	Tue,  2 Dec 2025 02:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Pq45z1QC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17F010E4B1
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 02:30:11 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-8824a756771so54208856d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 18:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764642611; x=1765247411;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zz3A2Jg+PGY0a1PLJjO54ukyknEReKSGGE4+cabS4YM=;
 b=Pq45z1QCcSkCsjZ67Qb98h8A2+to+8oOJpMdh1J0vZC1NgwBeXX4holtWm9p4T58j5
 i75E9qxSChqeNtQNhUk66y4iFZziTVt0a2OC1nkhzE2jk9I7zqOq9/3n/0Ei6RUd0j9o
 8jMCo187OusZZiKZ3tVHs2QoRrnChfSqJKd/whSAFnXlEvYBWaC9NjM1Rejke0lJZj8r
 ZGoIvChN04lc/FFsreL5cV/DHHFpZvf7nzWI7myyVRNzuJNpg100gFrB14+7EMecYBRa
 PJGhkRYl5fQJF5kX3IwC653GeNnJUi3hTOVFCA6ndKp1S6lWFven4VIVoJIqqhzBLEfg
 6HIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764642611; x=1765247411;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Zz3A2Jg+PGY0a1PLJjO54ukyknEReKSGGE4+cabS4YM=;
 b=TVEfBVaz7LqlDNelBxsC0+6E5KUJTIgkNdABs9racPct5O65WQRIdpHphIoS3Ybm8Q
 yo2zu5U42hUwhzg50vwMMY+JfiNHBJjtJ7Urx9IysjEZJ2zaS33gNanVE0Uy9GVgVnj+
 Dbi+cH+d6mMC+ojpj7MoYrU5m+8qySwEtJsNLrF14kqY2yDAXL+Rqqx0j7VQGgOrvyOT
 s6RHaZ8WFslEWl3mXoTOiE4udClsrbH/AsO0qeShCefYrgzZrrZfhUkcKLET7i/0cCvb
 r1x6WErpfqhlxzL5calRfbzQ+9vO3bGVNCN/W6EL51MYoSvft1pneKbPHkb892ulfytt
 wjOQ==
X-Gm-Message-State: AOJu0Yz3x5NbgHeV7f+vzM6y1oXXj/ybKJJnnsDyCMgWTEvVBnm4oD/s
 tLDowHVT/YL6iRhEQ/tP1fZIlPMz/0d6oofgnrTbc3+2QMmuL/KF+emy5ijAd8J+cibwxgn4vDE
 bHZzAhNlR8Av37vn9Vs4w+PfHq20fLI6eagzA/bX5eQ==
X-Gm-Gg: ASbGncsms38ga8PmYj84edehEhLRYigcT4iVXms9S5/YGgebRHxsZfDimxHVrXLBhRL
 Sa7TGE0dGPxtiaFPyQgZFaIWJoLeoLMd/ry1QSqWizTUn6og8b/UsocY5sHwfVcVkk24KKJas/5
 deyISWlw5ehAhJWqVUHm7r/u1MFaYA5PZSCmNYbpOlhkkmbWGJF5cCXRimQ6U9Jq3JYa2/NKhN0
 EVkwtWrRnnEJS+7XeS5u/3oMUrHlrXHD3qG54PpoCiyS2KTyT/ZozrPZ47RIEqhKubtfU/+
X-Google-Smtp-Source: AGHT+IEgBKhTEWj0yo/k2QbbUD+ebq2fxaAtdaDGRaQogMFgpgYGjUkIoxMkOexLG4H1ZGHvTwrBJdvKlqrCkcfJ1rQ=
X-Received: by 2002:a05:6214:2301:b0:880:4548:a059 with SMTP id
 6a1803df08f44-8880db33334mr20537836d6.15.1764642610324; Mon, 01 Dec 2025
 18:30:10 -0800 (PST)
MIME-Version: 1.0
References: <20251106114818.1871161-1-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20251106114818.1871161-1-yelangyan@huaqin.corp-partner.google.com>
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Date: Tue, 2 Dec 2025 10:29:59 +0800
X-Gm-Features: AWmQ_blz_BVU_uXK9g-7hnXhutXGLpR_cF7DXAtzKP-I3vlzSAZfFV9w0JeI5SE
Message-ID: <CA++9cvoJkWeZb97Jx2kXe6kvWiy1S-O1yEoPMFU6XoEop7Tqtg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ilitek-ili9882t: Switch Tianma TL121BVMS07 to
 DSC 120Hz mode
To: neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Nov 6, 2025 at 7:48=E2=80=AFPM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Migrate the TL121BVMS07 panel from non-DSC 60 Hz to DSC-enabled 120 Hz,
> including updated init sequence, DSC configuration, and display timings.

Gentle ping.

Any comments on this patch? I=E2=80=99m happy to update or resend if needed=
.
Thanks!
