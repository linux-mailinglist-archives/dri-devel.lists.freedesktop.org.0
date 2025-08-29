Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32606B3B625
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 10:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7CC10EB6F;
	Fri, 29 Aug 2025 08:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4d1GNmX6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9AD10EB6F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:41:32 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-3cf48eca078so430905f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756456891; x=1757061691;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=Y9GTxy6MJuLlyrzepwhfDhnHCqcx0fyZuh4kGoILFfE=;
 b=4d1GNmX632f7TkUlosGCbdu3Y08TY+NZ+AbTfatX6M/MnbaE58rNolQkaQrBl0fage
 QQPwKw0camAY4gVgLL9XCn5TbKTX7lq14PeO0darfZhYrgE6LGxYj7l3YeG9Pp+Wbylm
 sKYD9KeY+UGypapzHI162pLki+cdxu5dOjWxfN0d5sm4IYravlFnoSLAX06oNclph3aA
 d55YUAJ7e3Phv+wQFU1wvlg1CMFjIw46EyerVv/2zz8hCH5xuYoMVpaheacMm3s8c7ln
 IVLZUnSl9ZM5/IA8AHU+akenD8dRJu9cHzcn4FJZIrCYAZLF89k9CWbkx6ayUUdsTRkM
 C6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756456891; x=1757061691;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Y9GTxy6MJuLlyrzepwhfDhnHCqcx0fyZuh4kGoILFfE=;
 b=pUewDcx+HAT8yRAbfItckF1UsXZJoKPjMNBF8S1z8VcaK52EF+la/N+/uvtZ7z18Hg
 HZUeJGn5Pb+t+uUgcZ6VkFiS3uydHxDladKlkiEgjdyzTgHFT90VrEhgfPvfW4j4Yu/o
 yQ/4DLnLDQOy620Bo4krZ2hnHET6ZXlkk25Z34+/fX27LbCj27JEN0NIrxH7NwqoAfB5
 KTa7gdKySjR6jqVgKwIxLP9YTu/1+8piQHHUqQcbodgS5JmGBzQD8r5sAwfVixckfmGt
 AOYUFWknxyr7NT9QQ2HUy8qbMMo/Vky76xJKm7wogmDFCyEUNE3hkptC8XOIBazMK7Ef
 3vIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdUfOQOLsvL+ntYeNWihhT7n1v+A1rjY8xQzSbX9jgnf2E8+ZzfnX6++Zi+2ZAWCZ/lOfK2/5RcIc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFCkipNag/LR5nW1rY0FlKGSpyb0nX84k/KbTL5pyl3VkjYnL1
 SPF4hjYb7mbGgdZbL/ei6JxEvO6qfoaRM/FvOrVJfbeO2qbfBFmbkd2txfMCYQh6CmgbDIz48OK
 rJ4E1hejfPHbRD2SQRw==
X-Google-Smtp-Source: AGHT+IGbmW+qPHw98CHGdxYcrLfuEWktQe5Wq3FEJrTPB9X6bZcH/Q0f/Q7ZQEvl5xTicKBG6i9LKaPK90N6Ctc=
X-Received: from wrbby17.prod.google.com ([2002:a05:6000:991:b0:3c5:1565:6a2b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:381:b0:3b7:89a2:bb8c with SMTP id
 ffacd0b85a97d-3c5db0eeb6dmr23742673f8f.16.1756456891353; 
 Fri, 29 Aug 2025 01:41:31 -0700 (PDT)
Date: Fri, 29 Aug 2025 08:41:30 +0000
In-Reply-To: <20250829075633.2306-1-dakr@kernel.org>
Mime-Version: 1.0
References: <20250829075633.2306-1-dakr@kernel.org>
Message-ID: <aLFnuhHomj2ISG1C@google.com>
Subject: Re: [PATCH] drm/test: drm_exec: use kzalloc() to allocate GEM objects
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
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

On Fri, Aug 29, 2025 at 09:55:39AM +0200, Danilo Krummrich wrote:
> Since commit e7fa80e2932c ("drm_gem: add mutex to drm_gem_object.gpuva")
> it is possible for test_prepare_array() to exceed a stack frame size of
> 2048 bytes depending on the exact configuration of the kernel.
>=20
>   drivers/gpu/drm/tests/drm_exec_test.c: In function =E2=80=98test_prepar=
e_array=E2=80=99:
>   drivers/gpu/drm/tests/drm_exec_test.c:171:1: error: the frame size of 2=
128 bytes is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
>     171 | }
>         | ^
>   cc1: all warnings being treated as errors
>   make[6]: *** [scripts/Makefile.build:287: drivers/gpu/drm/tests/drm_exe=
c_test.o] Error 1
>   make[6]: *** Waiting for unfinished jobs....
>=20
> In order to fix this, allocate the GEM objects in test_prepare_array()
> with kzalloc(), rather than placing them on the stack.
>=20
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Fixes: e7fa80e2932c ("drm_gem: add mutex to drm_gem_object.gpuva")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
