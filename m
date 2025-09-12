Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C809EB54524
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 10:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3411310E446;
	Fri, 12 Sep 2025 08:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F9/N1kfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E92710E446
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 08:22:08 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-74572fb94b3so1564004a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 01:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757665327; x=1758270127; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FqmWGb+bqV5HnkceUK4yMUe3ao70v2Hu/Bx0pkeeRhg=;
 b=F9/N1kfHIybKTMBzZnNPkF3cdNkrKlejwAA5fnwxqv8xt815HQ0ZVSAPGZxbO9aSZ7
 jYDM26IpNAWt4cr1kE1nPkGQgz/BEuJHpcxQZCwLPTHE0dDwexOePpLcK4e6WjpnSRr3
 i/Vg+2P5FgoVRwUKX1T8vPCdivKfpzeJAAv5izsTJrOgRgmxF3a08g5WSxztG57j0okX
 eeqhqxLMvgI/w5qoVpPO6CUO4+gSFQokcAlQ/NjW/RbTzWGtKLwR/v6TnXDo8EDwSlnG
 RtRUlEi7V4wTs80bAJwr5KdmNfdeKhF8zzBDBO/5A7HaDB2IwnHv0SuZVfKFHQKd4Teg
 SsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757665327; x=1758270127;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FqmWGb+bqV5HnkceUK4yMUe3ao70v2Hu/Bx0pkeeRhg=;
 b=sWZYTUdF/3Tnhbr2HdH9buHFM8GxlBniR7BrqnTN2ZrPQhDzyCqsCPhGPhvwfqrr3V
 deYWOASmUk5M8t51qiwHI5C2A0bOUhG6K+ymnifmH8Uh9oZYtZvYlbK1ISUi16ArF8ni
 jCRLUV6atdmA0XbND0fvkOLiKk0GXtNmEZGlAPuHjsYaeaBTH74ZuA+ssA3EGEVo2K72
 WrSqV+63RMOcUQ+VBwYK8m3QYoO710VRwuUUWBytjnh05Xjuxo48R4OzgDFxHp3sY1WN
 /XfsWHVuPRrAtksNofbMIk7q7La7NJMQbvC/kuZcI7fjyXJrZPE7l6M8BnXWmyuK14iH
 1G2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsYXUKoot7CC/GXXcxHjpQZbvUnpXrgFht2f3hR/33YHNT2rkvfrV1X5EIzg4VXys+V79TizZm8xo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCCMUXiUiWVLNs9C478V8Nh4aCKi1N7VZl0CUgxPmjacskpao/
 58tppZO/Zz2W77E7bBs3QxLMQaJowGv8XyXWe2PGfmEbgxmTQaZUZXUZxPD3/1oel/9DWN8Fj1c
 nlQeDj/7JTRRxVLFjKVxVicw0VkFHZNv4pd4S4lFOGw==
X-Gm-Gg: ASbGncvH8876aYMRliSaelj3YOeSBtrNABZCYPGlFKGgbTS97JWoWGKm7pggc2OaLxD
 D+c572DB3oxIdjY6Q39FLB8WTKM4/0UfAI+DCTiKlpSh+nemFUmZJQ3vj+V400dBQjok+nJW+XZ
 mn5mk1meu0ywJ/nicnHFeDir8jYnXdp2ux4ybFRWf8QZJM8mpGXHj9UIsYJeksLq+Yuq5lbOYRA
 kGBXxor
X-Google-Smtp-Source: AGHT+IF6KSmtzV3lD8Ye2Smqf1AHbbHzZL7yhMscYVEGZKEmeFM9f9fBRAk0lKMT9A8gz3y+3CIy3hDQkioIiFSlJ2M=
X-Received: by 2002:a05:6830:6a94:b0:745:9d11:cc87 with SMTP id
 46e09a7af769-75355ac462dmr1395964a34.35.1757665327140; Fri, 12 Sep 2025
 01:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
In-Reply-To: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 12 Sep 2025 10:21:55 +0200
X-Gm-Features: Ac12FXxUkHtHNTLgZu3XBq2-UbPsnB-71u1NgRvPtOLVCD8F1behB1r-vwEiHeY
Message-ID: <CAHUa44Fow6BhkdTki=rt2psOC=dq99cRgwXsVagmQU7fttXyCw@mail.gmail.com>
Subject: Re: [PATCH v12 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: Sumit Garg <sumit.garg@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuldeep Singh <quic_kuldsing@quicinc.com>, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>
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

Hi,

On Fri, Sep 12, 2025 at 6:07=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> This patch series introduces a Trusted Execution Environment (TEE)
> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
> and services to run securely. It uses an object-based interface, where
> each service is an object with sets of operations. Clients can invoke
> these operations on objects, which can generate results, including other
> objects. For example, an object can load a TA and return another object
> that represents the loaded TA, allowing access to its services.
>
[snip]

I'm OK with the TEE patches, Sumit and I have reviewed them.

There were some minor conflicts with other patches I have in the pipe
for this merge window, so this patchset is on top of what I have to
avoid merge conflicts.

However, the firmware patches are for code maintained by Bj=C3=B6rn.
Bj=C3=B6rn, how would you like to do this? Can I take them via my tree, or
what do you suggest?

It's urgent to get this patchset into linux-next if it's to make it
for the coming merge window. Ideally, I'd like to send my pull request
to arm-soc during this week.

Cheers,
Jens

>
> ---
> Amirreza Zarrabi (11):
>       firmware: qcom: tzmem: export shm_bridge create/delete
>       firmware: qcom: scm: add support for object invocation
>       tee: allow a driver to allocate a tee_device without a pool
>       tee: add close_context to TEE driver operation
>       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
>       tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
>       tee: increase TEE_MAX_ARG_SIZE to 4096
>       tee: add Qualcomm TEE driver
>       tee: qcom: add primordial object
>       tee: qcom: enable TEE_IOC_SHM_ALLOC ioctl
>       Documentation: tee: Add Qualcomm TEE driver
>
>  Documentation/tee/index.rst              |   1 +
>  Documentation/tee/qtee.rst               |  96 ++++
>  MAINTAINERS                              |   7 +
>  drivers/firmware/qcom/qcom_scm.c         | 119 ++++
>  drivers/firmware/qcom/qcom_scm.h         |   7 +
>  drivers/firmware/qcom/qcom_tzmem.c       |  63 ++-
>  drivers/tee/Kconfig                      |   1 +
>  drivers/tee/Makefile                     |   1 +
>  drivers/tee/qcomtee/Kconfig              |  12 +
>  drivers/tee/qcomtee/Makefile             |   9 +
>  drivers/tee/qcomtee/async.c              | 182 ++++++
>  drivers/tee/qcomtee/call.c               | 820 +++++++++++++++++++++++++=
++
>  drivers/tee/qcomtee/core.c               | 915 +++++++++++++++++++++++++=
++++++
>  drivers/tee/qcomtee/mem_obj.c            | 169 ++++++
>  drivers/tee/qcomtee/primordial_obj.c     | 113 ++++
>  drivers/tee/qcomtee/qcomtee.h            | 185 +++++++
>  drivers/tee/qcomtee/qcomtee_msg.h        | 304 ++++++++++
>  drivers/tee/qcomtee/qcomtee_object.h     | 316 +++++++++++
>  drivers/tee/qcomtee/shm.c                | 150 +++++
>  drivers/tee/qcomtee/user_obj.c           | 692 +++++++++++++++++++++++
>  drivers/tee/tee_core.c                   | 127 ++++-
>  drivers/tee/tee_private.h                |   6 -
>  include/linux/firmware/qcom/qcom_scm.h   |   6 +
>  include/linux/firmware/qcom/qcom_tzmem.h |  15 +
>  include/linux/tee_core.h                 |  54 +-
>  include/linux/tee_drv.h                  |  12 +
>  include/uapi/linux/tee.h                 |  56 +-
>  27 files changed, 4410 insertions(+), 28 deletions(-)
> ---
> base-commit: 8b8aefa5a5c7d4a65883e5653cf12f94c0b68dbf
> change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527
>
> Best regards,
> --
> Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>
