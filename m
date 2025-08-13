Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B5BB24321
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 09:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920DE10E4CB;
	Wed, 13 Aug 2025 07:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JkKncQoy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE4810E4CB
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 07:49:40 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-619a603b7cdso1885478eaf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755071379; x=1755676179; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wfeJn6OXLOSd2GklhvEK2KXBF/te/QhNlLJRLLpT6NU=;
 b=JkKncQoyJGZrtPV/w93NP9XnnnJcmgrpJ3cFupndF1xQXwWFEDRzMGbTfn5jAac/tK
 nnQcPQkXTUpZBQqr8ISAZsPeenUQgHXMqMgix/u9fKdYf+719OY0vBv7CrF6+UtbHdHC
 nB8mL/sZ38zhCZiDhTKoWXU40EMW07M4MUusRf4CQejlS6XMfpp6vo/Esj+Nmm6G8wWC
 OaNlZvzAgdr7Ab31zprwKd4zOjvuceBt6TiEjRaboy1MUc5oVoTWBe2/jpn50OlkcvET
 eR5lBX3NeKMfwFF8hM3gE/nkAs1JWqP7oQAJ6AYhnF2LJcaMm9NkbG9xJOBBM3gIldv6
 JUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755071379; x=1755676179;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wfeJn6OXLOSd2GklhvEK2KXBF/te/QhNlLJRLLpT6NU=;
 b=dQNJBC3SY9FJi+UFe0tpqySy8nWaBRwPLJAyzFiCmQxvl+lOL6onkf0ZGZe/V23lo7
 uIfHwVbe+DfbipCC5DbmBdfyi1GuHEfb2HNOHnLWvvUbblDbwlLLqRQVDL6dYC8vA37A
 YZ/iKZqborn/wjd3LKOrsqlnLahXLMnUPllh1SJpY0dDTSFPRmsanU/cnmoiT+hZqMjw
 A15cF3dJTbTgWyO2tA+JXOTFSp08rEQbsNwctIMhTU1ZL9cz2toqK3gZJ86Iqc6ehD0Q
 I+/FAVnw4e6HJ9C92fgwUWPwNP3VXRJ5hd+NfI0VOKr7pCVJCbOyDKmBOrl0bEgR6AVD
 r1Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkB95s8XU8o/3D8wLyP5o1o6AMDGHMq38P5zxx5iHPWXZjEb4zdafnMe6/jF3OGozZePOD9gYSgm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcJDklwbYqwcYXlPEAGGI01D9hpHuL5MOnSEPvONZihSnRnvEl
 6GFDgV29aocnqsMs1YK7ONyMeWnk2g6S6gcf7SKHiVl6qxC8yA+uaKS4V3oWogU7Lsld6bu1R80
 fkoSZkqMLQIeIJeVeuCIQpFfUM12hcSgjF+8orPGbTA==
X-Gm-Gg: ASbGncsItJ04NzgXR9eOdKVMeRm0Uzg1sruckn80Q1Nd7HZ1VzQklpvaQVM67XDC90B
 qUlqdlv7gzFcuFrDBe7wONsm8dLOQeBFJEGLMcizdsnJqIHLtxqVWo3K6QL4jCbDNJH3u57trCm
 XTrojRIwWO/i3y+Tle8/rP4DBA9yGiOgGlalTTDS8YSWjGG1ubJtULjLm8tsVhGvJfCyFxxmAs/
 T72BMJ4SVXHGeCXZ+4=
X-Google-Smtp-Source: AGHT+IFAfPPXVnV/fIsv8KnI8b8Bl+IOsf+U5t0pmvRJM0gZ8xG3AukFt3DXdXVb9aF/gWZVqDSUuTyRuSP2uDtgU3s=
X-Received: by 2002:a05:6820:1ac1:b0:619:a6c0:b4b with SMTP id
 006d021491bc7-61bc758538amr1013523eaf.5.1755071379266; Wed, 13 Aug 2025
 00:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 13 Aug 2025 09:49:27 +0200
X-Gm-Features: Ac12FXyfvHrDtrackOzZC99WcBb71C_WC3_DT2d5Ppi_3YWKQtwtthH808vWulI
Message-ID: <CAHUa44FJ9iRMyDHffRBwgxxX27vTwsAwNiCCEGQ8fMQPZS_D+g@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Sumit Garg <sumit.garg@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
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

Hi Amir,

On Wed, Aug 13, 2025 at 2:37=E2=80=AFAM Amirreza Zarrabi
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

There are some build errors/warnings for arm and x86_64, see
https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/jens/plans/31DmCOn1pF=
2JGVDk3otBOXOL6kV

Thanks,
Jens
