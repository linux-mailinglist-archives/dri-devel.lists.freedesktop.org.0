Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983B6C264AB
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 18:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB4910EBF5;
	Fri, 31 Oct 2025 17:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="A+Erj3Kl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5069A10EB42
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 14:18:12 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b403bb7843eso500290966b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 07:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mary.zone; s=google; t=1761920291; x=1762525091; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dpOwsW4OaXt3IO+YhE8vGcbgUYzLvgd4DmQgy491Rb8=;
 b=A+Erj3Kl6+O8Qmf58MKPu+cb5A762bKJoTAeVfIHLTd4AqWJbepdUGpqwM9ic+TJfI
 cWYrXRxyc9IoRkcsN1CmzSapWWeWcUXZ5tp5+CKiJHno9xLehU/DEeRv68dzyAZbgUsI
 uKgMJO1YYEfyFzL/UpOO/UAAUSBiLiuAzW7JgeKwvVA5eiujbwYX3e5MOOcSa3QkTkKL
 5VV556PtjQ/NV+d+KbloTpdcVvR+S2qfl2n4+55Z6LaD8L3paUteK44DYa0B9NfObePE
 uGz3+4WfJqA4m3BEvnh9rDOSoPKXTmY2bNGPNrLLa6+wJhyhd3pw8LSVVFXBq69OhAao
 PLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761920291; x=1762525091;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dpOwsW4OaXt3IO+YhE8vGcbgUYzLvgd4DmQgy491Rb8=;
 b=dM6AV8vzOLknP9d733JgV0bbz0dS8iwjugMf+iVrPOarIjZ0YxYq7zIa4UOfuU2VH0
 ZiQLu2HtTN6R7BczggXMq0l50PN0ibDBky2FYbnCNVLtHjmE72By7ik8Pa2Gduq8cFc3
 hg8qXc3sxb42YqqLtP/vBtI1icIKMawpuZTQAgkLRdAPnNTSrw1cZvqB5TfAffinhuVc
 cQsFkgo6pcnwwhejYuVb4nrBzdOO5V8LmT5OZB9x59j3DjG5n7+xB08x4ID9TkcxTvHb
 X6sGE7kZHHqwlb5PDzOlonAX0pvOf6+BpbrK4v1mQpXN8EQZJxFIVcaDhWcbHhUxiNG1
 t0rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaYKecdardYfwxIAW8XidYsHCB+nZLpAmitei/tVPYKTzLC0lVvzDswSfhw1inLhH7oA39vkSUPj0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyT8JbUmRKZ8cp6pQm6J2vhrEhNbEkGgaxRlWSrR3AmruzukMZm
 /jUtewSogFBcGSfI8zytJgfXlhEsyqaBLl610kVFlYRP/HWKClWd9AlTCIq5xgoXgcA=
X-Gm-Gg: ASbGncuqrcQZZkUfvULR4QbE2IgNjqaz+cDuRXgnObfNYEiqDPYTmRU923jAnQZX8hq
 QaOYS72NGO4BtyKM4o43BZ+wHg87+WgapMDEcuhc6423yhGHkTfnSkYKtA+hMudohLkIKdVZJiP
 519cp04DhcBY10Ud3mtBG2JGuU9GaXN9/EWrJRVOFCTDF+F+BUSFmCWfpl5+I66esGNLv9HxiYe
 uE8SdY/fPXWv/9uQFH7xdK5WPxk1qWal2oprSY7Ntarl0RhAO+72EDq2qV2yWXuSuHF68H+0urr
 9aM5cmaSEvGyCx6+TNgJXpcsx9GPf4omWwO2PKKxxbMv2gYuni1v5hrAtteeRyno8Xd3MVbTXn1
 NiAq3JAJUs0u18Z32yPHondsrGdIbVybSvmLjHA09ZOhdk3Bd0lxmXFNrwVlt0L/N/UIjgwmURM
 NzYxDTVLdm3MYSi1MbrZ7N8PQv/JGNQR+k/0ELiG2LK374Iv2D7V5r
X-Google-Smtp-Source: AGHT+IG/on2h4t3AE4tA/aWcwth5JN9h8ZraeYNLOQDKECZbI1ZJ38z/033kuQ3rG2khwd8SssYwHQ==
X-Received: by 2002:a17:907:1c93:b0:b04:9ad9:5b29 with SMTP id
 a640c23a62f3a-b707082f754mr437109266b.54.1761920290566; 
 Fri, 31 Oct 2025 07:18:10 -0700 (PDT)
Received: from caroline (2a01cb0405e83a000cb38cfe29807c1e.ipv6.abo.wanadoo.fr.
 [2a01:cb04:5e8:3a00:cb3:8cfe:2980:7c1e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b70779a92c9sm185644766b.22.2025.10.31.07.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 07:18:10 -0700 (PDT)
Date: Fri, 31 Oct 2025 15:18:08 +0100
From: Mary Guillemard <mary@mary.zone>
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 0/5] drm/nouveau: Enable variable page sizes and
 compression
Message-ID: <aQTFIN1dPHVtL4NR@caroline>
References: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
X-Mailman-Approved-At: Fri, 31 Oct 2025 17:10:51 +0000
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


Series is working fine on older versions of NVK and with compression
patches on mesa side (tested on Ada and Ampere):

Tested-by: Mary Guillemard <mary@mary.zone>

Regards,
Mary
