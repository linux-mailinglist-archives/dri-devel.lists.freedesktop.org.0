Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D45DAB6FBB
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DBD10E2D4;
	Wed, 14 May 2025 15:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VcuX65I+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2B610E2D4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 15:27:58 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ad221e3e5a2so858173466b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 08:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747236477; x=1747841277; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SGKjeHVkf6yzlsanhJUth/0wT7fmx6nVcIxyoA2ge08=;
 b=VcuX65I+t8lisjRzIBwDSwNYJ68JzqGq+ZDk6R7dbssQrEuWXPGJdXbS7F+daLHAW4
 0fsYif/xar++McUmTfwi1V3Aj0oOTuofZ5VPdz2oEU3tAn6T4Z1hlRk7UiNtrIcTCbJw
 /rdcNgGw2oQkXVTrysqMtZsQJMdviLBA9hLw7bkHgN5U9rD4dref4utr0JDkhVLTC0J9
 Jny12MciA3cdHpN20Cee0SuSiJIed7FD6A/72vnimqkYfhITtEQaY3mVvVM7MMIH2Ov5
 kbixVQ01ENdCi1D7hSkhRuBN3i5RPt6DFw3QrM+gu7P7V+liTs4qxw1IzbMpF7TcUK0H
 m7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747236477; x=1747841277;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SGKjeHVkf6yzlsanhJUth/0wT7fmx6nVcIxyoA2ge08=;
 b=pydMI8Bux6Kzh84659V7l5yMOcX0ec0/zFLRWKJ+0Byz5fCdFJ/SJgHD3cWyDVEbEe
 Rz/fdPk0gd6r5fQVuO+/LjL34QW1YpudRkXD6yx1a+BAP46vvOJlVQPGFgq+/J5SWP2h
 OTF0smkFDpdTY+DsTpvOxmLMT4Raz9JiN/i5WITfirp8EStP/JwmDb+V8b7srcTaJeXy
 KpEdstdCR6r+sFYIjOkkpExiN2uqKnNU0CfRiG2KhFC2+3zeDRHG2rgrQ2j2Fjc4c6uH
 jMzlVEtPko1nU0gG4WgbHDU+BH8EbjFQleJXAoOhXY7gDoCb3eVw0pu8WaqkCNfmPUaw
 +PgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrqEst2/4ZeNrVYqNi5urfm6Ndrv5ufOk11Pv6AVBhgq+Ep1Q6KX4WMXA9MCQXhvNWHLYm9ypusdE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI9XQFuqLzJZRWX2ytucMkdoLyaZ626VBG6uW0MCC0P4cGOUHH
 /rTStQCgDketmkMHSxLRgzeTXmU+DBwURUDvaFJctqkgT6fsNBCeAWoGhE7Pna1+W9TuaTWUexS
 6snCh9ow5ar0AVByo3pmAd1oB1p+uDCXeBmxWTQ==
X-Gm-Gg: ASbGncs4vIvc703mlRe/F4udrm+Rkq2rP4FVyaQeyHjUXOIjy68tYnjKSeTlTndn7KK
 e8Sj5sC6CcUK1CdiJ9eVryS1akYisouph9yfRfyqGhVwx4JVgnMCYnMFR6RGqd1ylKQzdnVqzy+
 jcArvvqvwrhf+c3+5IIKwJVOJm3q+BSfs=
X-Google-Smtp-Source: AGHT+IFI6WGyYTssVEodUuBbRbHdt/cK0IPusMpr/1+pqSkJpRWIkQArQUnuyloTmvBZCSiRQ0Ya6krvZBl9FePgExs=
X-Received: by 2002:a17:906:4f86:b0:ad5:935:81db with SMTP id
 a640c23a62f3a-ad5093584e3mr109467866b.10.1747236476735; Wed, 14 May 2025
 08:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
 <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-5-6a143640a6cb@oss.qualcomm.com>
 <aCRkRTMFi65zBODh@sumit-X1>
In-Reply-To: <aCRkRTMFi65zBODh@sumit-X1>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 14 May 2025 17:27:44 +0200
X-Gm-Features: AX0GCFubE386IXxNi4n8B2NKhYEqMdnxy1eH-BueT9owSlm2f-luFbE7L4_yv50
Message-ID: <CACMJSev2qqnxLN6OiSEKhUqxeewY09to0Jd2oPNoE39YFS6i3A@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] firmware: qcom: scm: add support for object
 invocation
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
 Jens Wiklander <jens.wiklander@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 May 2025 at 11:37, Sumit Garg <sumit.garg@kernel.org> wrote:
>
> Hi Amir,
>
> I am still unable to get the QCOMTEE driver to work on db845c. As I can
> see machine: "qcom,sdm845" is not supported for tzmem based on SHM
> brigde here: drivers/firmware/qcom/qcom_tzmem.c +81. I am still seeing
> following logs from userspace:
>
> # /mnt/unittest -d
> [test_print_diagnostics_info][31] test_get_client_env_object.
> [test_supplicant_release][65] test_supplicant_worker killed.
>
> I think you should first check here for SHM bridge support. If available
> then only add a QTEE platform device.
>

On platforms not supporting SHM Bridge, the module should fall back to
non-SHM mode. Isn't it the case?

Bart
