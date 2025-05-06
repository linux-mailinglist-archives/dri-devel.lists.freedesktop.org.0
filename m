Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D489AAB604
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 07:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BEDF10E19A;
	Tue,  6 May 2025 05:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="V98INLcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A2F10E19A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 05:40:42 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-30863b48553so5838534a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 22:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1746510040; x=1747114840;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FBXKSLJj7UUfdC38mgyAQwdq5cvKODFsNSOaU/O1LPA=;
 b=V98INLcOBLKVZpw6PWoPtPVpbECQ6ilGPy2LL7GW6sEwnBkX4u8U9cjYpMbyXv9Q9Y
 5ho0s7xBX06fE+aNSlW/SoaUlIP3ufulApFGin8kUyxdJCq47csj/L/bpNsTvDSWhyJN
 LRv5jt3qqsutBK+hdFxp+/oRMWZihYeodLmoSfRMP5C9sFLdev79syWnjNa/eBtNFg7O
 dkJl8mzhXOe0nuGFY474iDAwGwcLGVUYKODlNbIcH/nOUpiRlFilFULVZQhCL11oE4U0
 CEBEg9dlGn7yCcF+r0oU86IxQxNpjYHCQjgKRu8/Ccpw6OcGyKogiVZVaGfyYhRC1YLA
 yDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746510040; x=1747114840;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FBXKSLJj7UUfdC38mgyAQwdq5cvKODFsNSOaU/O1LPA=;
 b=HWDE31Qk+JzZEbGDg4BOtWxvnSm/rY3lT923v8HEPlz5j5n1f5/spMRjswuaK4lxMv
 8T/bVVGAXve+Yp16L1arNDWaOURqcash74nHxXeDna23044KYLjOOl/8X+7IUN3x8QJV
 G5IZhYorJRqaLvNHnddm546MjNhluTGo8n7tlWo+ZHZBwraNcw9SMFLlUdfq+0EREC+X
 Li1fRqrtSOEa+AVEh63gwrhw1hULQVqhu7bSYJ2mnA/ggZ6k3AstqhgnAWwjMMqo7urU
 uJMLuE9LJ+sJa846vYgL0gIGrgbBoybVo+oZw2bPkzunpjj49GNSMCniwXIL8SILgxFM
 1vBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrRkISmnkFLE2JTNBAZqnEAuvS/BHIA2HtEd7hDGLpqfbAYAWi1YnGmTw9SACi8YxtkSauK4Kh574=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzgv64iQBf3MHq/3wtN8LgH/7hxEmOMqo/l4qbwJ6U3u1Ap4M12
 Lwx6AhlWglANOIzBSsxVUPfY9QDyGH5cAHvOy5EzyXpr8hU11fwvZgDW95KE7dsOmjJOUGMQIZY
 BnRUQp2/XAku0Y+BrnM9rXXGOoDI=
X-Gm-Gg: ASbGncsezCWWhYr3sJ7LGkpvsuiuh8bw2uvyo3RygNXYzQsoSUevPSJ3Bxrb8Vdc1H1
 8IYyFFvElG6JJ+MPTiyoWZBzljk5G0pJ7gr4VywWn79LTw20ZGKDofDSvW7zb3tyVaPkpK+EHVB
 5jJGraFlUHsqNq8bgbalyn7v3OaD2eyJ122NGGelYCvdohdHY=
X-Google-Smtp-Source: AGHT+IGH2VPUNqhKP0n7asYw5iLX2WnGWqBav+nif7/SVHvaSVRrallgXVrGMUXr17M5pJMS8YFYExxZQjpe5eZ+A3c=
X-Received: by 2002:a17:90b:380f:b0:2ff:556f:bf9 with SMTP id
 98e67ed59e1d1-30a7bad3792mr2973119a91.4.1746510039781; Mon, 05 May 2025
 22:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250505184338.678540-1-richard120310@gmail.com>
In-Reply-To: <20250505184338.678540-1-richard120310@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 May 2025 07:40:28 +0200
X-Gm-Features: ATxdqUEfi7YvCZqVRTEcgT4RIKU17ch-N4bMmEbxaRpKJa39QnO_szEOKK7kln8
Message-ID: <CAFBinCD2wHRfP+1i+pUwG0FVNr0t6uHPxH5uetbJN=RcQC_A8Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
To: I Hsin Cheng <richard120310@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 khilman@baylibre.com, jbrunet@baylibre.com, christophe.jaillet@wanadoo.fr, 
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
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

On Mon, May 5, 2025 at 8:43=E2=80=AFPM I Hsin Cheng <richard120310@gmail.co=
m> wrote:
>
> Coverity scan reported the usage of "mode->clock * 1000" may lead to
> integer overflow. Use "1000ULL" instead of "1000"
> when utilizing it to avoid potential integer overflow issue.
>
> Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selected=
Issue=3D1646759
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Thank you and best regards,
Martin
