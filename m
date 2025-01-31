Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5FCA23AD2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 09:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5A710EA33;
	Fri, 31 Jan 2025 08:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FSPB44A6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE4B10EA33
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 08:41:34 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-385deda28b3so920650f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 00:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738312893; x=1738917693; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NFGFJLeaz2HAGkOCSKYlYf0/2RFD85s/ExqGLb/n/Go=;
 b=FSPB44A6oR1109bgIkBkPlSwTgkGXywxwMRBBjozd4e5KEDDbZ8TSdkoEfnWwn5imK
 5+KsGTsRTsnq+gRXIL2MPSAOJ9Z55UQxNcuOtIMF8ZqFpzzbdxIq6TCR9HZAq8LoYcZU
 NlGxTc4VaqAEPxvTRDsxZfueZXfh+g7TsGKlqvtGye2IrRIFbRYcqP4Ue/enF3b3fhCB
 UJ9f2Kw6R6WUMYSMI1e9BX+ErxN8dUpJrcxjUWOwYOJuWYjwt9rvH9D5MhGbY3rGa791
 IJ2Fk2JLqJGH2dWcl0LvwvchLmpAhkBpip0tS7ZI6Ofu+8UmygmzhGIMEoV45gCnQA0L
 3QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738312893; x=1738917693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NFGFJLeaz2HAGkOCSKYlYf0/2RFD85s/ExqGLb/n/Go=;
 b=bBMaUyxhCGimV6qvfa+wOAtO7bGYWAZKWA1SiV6+Pylyqv0zTRCbcH/YBuOhpjVBNU
 Y1kDK9whMxQiKIq+b78TxC40kWDe97HfBKaBAEMXnIC2Py1HoVhNS9ZwCAEef6DOBysx
 k9gG/Bh7Vuq2bN9SbGqy/N5fqCW0uqGj/6vyzQv87UC6l70lMTVyG8HYtWp5Dk/6sE32
 J9AgEvPr0H2HfqyvjghDqJWDXq53qMNf8ZR8GBc+ZH4yjxamANTUPhy5Cc4PCnxkUJlQ
 lbsUcNMjHOM17XtKCY95MDmZw0a05tOSvPXHKXH1Q8p87MP1oytpte0GYg84nR2gsl2Q
 zznQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHFnimvEErw/IgmcOq6mfW6K4vJ9VWq4Bw80cuzGJkZjwsNe3SMr/2Zslmr4zvD8JimRz4fwZp8CU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNyydS9ANEm8/21Yep5UyZEHrHvBIvRMMIDL3ZPlPivLKMicgb
 ZLDeQvMYhuhyovGLZ2WJpsaUk2+zOOn7inspvkGTSmGCIv88avDf
X-Gm-Gg: ASbGncsRsKsH/CVLA88RRzh7On1WwZIVsvparnP3khMIV4gRdz8aiG1+HT5qoGC9ZNG
 bDalPEOOszu73FNXme27rUtHzJT5DfW9Op6iYObi0d+sT7LxWzZUxRooJz/qyRU1uu79g/gAVwa
 AReGKUl8vItxruqEKQ9flWRNMtq0c1E1lj3pwAt9GHwi9e9+rU65g/EFsBv9nhgiJLfY1edgT7n
 CBeAYAsYigXFzZMe2017+fXA13tVOo16R9kkKW3SC/AftLJ2vNzdHJHnVbX/xTLykX+MJmnbL8Z
 zAaQ+rrUtjFBz/z3
X-Google-Smtp-Source: AGHT+IEaE6yGIZDx54kroqIVqmGJoHqCF0sYGEIUuOHDq3Omq4BWLMf6QtZU5j2yfl1l7rvtmAeqAw==
X-Received: by 2002:a05:6000:dd2:b0:385:f0c9:4b66 with SMTP id
 ffacd0b85a97d-38c51969feemr8075197f8f.33.1738312891560; 
 Fri, 31 Jan 2025 00:41:31 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23e6860sm47975155e9.20.2025.01.31.00.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 00:41:31 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mairacanal@riseup.net, marcheu@google.com, melissa.srw@gmail.com,
 miquel.raynal@bootlin.com, mripard@kernel.org, nicolejadeyee@google.com,
 pekka.paalanen@haloniitty.fi, rdunlap@infradead.org,
 rodrigosiqueiramelo@gmail.com, seanpaul@google.com, simona.vetter@ffwll.ch,
 simona@ffwll.ch, thomas.petazzoni@bootlin.com, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v16 6/7] drm/vkms: Add how to run the Kunit tests
Date: Fri, 31 Jan 2025 09:41:27 +0100
Message-ID: <20250131084129.2919-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250121-yuv-v16-6-a61f95a99432@bootlin.com>
References: <20250121-yuv-v16-6-a61f95a99432@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

> From: Arthur Grillo <arthurgrillo@riseup.net>
> 
> Now that we have KUnit tests, add instructions on how to run them.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Oh nice, I missed this in [1].

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

[1] https://patchwork.kernel.org/project/dri-devel/patch/20250129110059.12199-3-jose.exposito89@gmail.com/

> ---
>  Documentation/gpu/vkms.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 13b866c3617cd44043406252d3caa912c931772f..5ef5ef2e6a210382a070eaf3552bbce75b04ff0c 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -89,6 +89,17 @@ You can also run subtests if you do not want to run the entire test::
>    sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
>    sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
>  
> +Testing With KUnit
> +==================
> +
> +KUnit (Kernel unit testing framework) provides a common framework for unit tests
> +within the Linux kernel.
> +More information in ../dev-tools/kunit/index.rst .
> +
> +To run the VKMS KUnit tests::
> +
> +  tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/vkms/tests
> +
>  TODO
>  ====
>  
> 
