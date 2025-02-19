Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E96A3CAB5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 22:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74E210E049;
	Wed, 19 Feb 2025 21:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LFrlZJYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269C310E065
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 21:02:05 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5e05717755bso254627a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739998923; x=1740603723; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vxdKCP6DZMfUjXK7siDz6HfrRhXpGFwXZwRUOkR4i4w=;
 b=LFrlZJYZ7buiVgzxZ2oRU3fb8oVAspbkeE/9yKnjUCSZ+QlTDDp71hhCqxYDsjpnnc
 ax9rMVbyysx2Rgr5RpU2KX9vV0QcuvGPKeqTx/PiRCaUKE/+ixoC/0Lo9F9BK0Wa6jO0
 OA07Sla5+nX4uf7LXEvujJe5VHHJ4KuwWU3kY9tUMG8ILdqRd41BW1kKoLMUGCuYQLaZ
 ftV0H0jxRXB1yxcLf8m74/PiTHNrviVg05iLM6HOn4zAsBEZniqVeQR2XgLsHds4mE+T
 FAXo/xKZvPsdyagP8555BEHDwVXulbdx9TFtZDM8F76ifoTc5Kf2IxslLXH6nLDhA7fW
 z51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739998923; x=1740603723;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vxdKCP6DZMfUjXK7siDz6HfrRhXpGFwXZwRUOkR4i4w=;
 b=OovaAajok/odwfRk/2rqMTKQqhkzW0eKmBN04nH6UQXKlmAjwVdhnv2Lez+p0BRNl0
 bkgUxQn0tusR6ygkHZKnQXM/zy8JQoEwCo5UoUonz2UjIwi6fzzBFO4/2QsZ3qLcgeJq
 Z86/nWcVS84Csx8w0PUXL0HmssThnUigWRUHoylaHaoexPIYrRnBvk4IXRr0lBqyieDJ
 oJhKVDqTZIje1JUWkc1ncFcz1luKmamjkyu4O9jLsKIW+lc8RI7Qc/1NGBv1EGwHPqpo
 MxbX06U3i0fc7tgGEzb1MgjP8tAnkHj9sjOt8yijo4QRqlj/Dgjqgbd+PISZIsD7kl+3
 4cbw==
X-Gm-Message-State: AOJu0Yw8mwkbD4mrdJvbcC+PDkR6Fo1GFCiz9uKF8NP1OgoN1EM/gmZw
 bLcPU/PH1t93ZLKaOWzd8KFDnaL7CIqvSbUsm6geCK67OQRIj4dEwPLNjVN6RpHGJAzRYhbn4/r
 KjQalxEULgADy+HkMIrqh6rO9MPSkHAb1
X-Gm-Gg: ASbGncv12DjV0sgk8ob4TZoF+DgQYl8Dz1uHrGifqM2fNCGW4D1aBiWAExRoEioKVPH
 tbIGn07A3DT6CMsCA39iOfxF83Eq1Rbk6tY2XJ1PdYThItuv1gbKrRTglAfw5yfK8G0nEUUs=
X-Google-Smtp-Source: AGHT+IFyNLgBemsG3ROpjUwwEU9YDLBUnK3UfEh8y7s1DncBvbp5QbPHL3bDdPfLCsvS3XLyFF23VOsbOM6lK7/ZQs8=
X-Received: by 2002:a17:907:d27:b0:ab7:c6a5:4555 with SMTP id
 a640c23a62f3a-abb70a7c662mr1916034966b.2.1739998923077; Wed, 19 Feb 2025
 13:02:03 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 20 Feb 2025 07:01:52 +1000
X-Gm-Features: AWEUYZl1Y2Dca5ftLg5SpNteaLXnKbIAVRCv7lNrEalUiy-5AyRjcUHA0Pm71P8
Message-ID: <CAPM=9tw_a+3qLjUn0=SqjVL=N6ExRbw0u9TamwGwigWwDwc23Q@mail.gmail.com>
Subject: firmware requirements
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, 
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Min Ma <min.ma@amd.com>,
 Lizhi Hou <lizhi.hou@amd.com>
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

I'd just like to remind everyone of the firmware requirements for
vendors that control their firmware and the driver upstreams:

https://docs.kernel.org/driver-api/firmware/firmware-usage-guidelines.html

Intel VPU it seems like you are not currently shipping upstream
firmware, and might have tied your fw and userspace together.

I'm cc'ing the AMD XDNA driver as it recently landed and I'd like them
to confirm they are following the above requirements.

The main reason we don't allow userspace/fw direct linkage is if a
user deploys two containers with two different userspace drivers in
them on the same hardware, what is the kernel driver supposed to do?

Firmware should be abstracted in the kernel if it is not possible to
build proper fw APIs for userspace to use directly, by proper I mean
forward and backwards compatible.

Thanks,
Dave.
