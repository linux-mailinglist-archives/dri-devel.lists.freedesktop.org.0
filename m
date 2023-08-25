Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64422789174
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 00:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2166810E162;
	Fri, 25 Aug 2023 22:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1D310E162
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 22:12:23 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5007f3d3235so2116843e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 15:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693001542; x=1693606342;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jiWB9v97HWraryvHTLxgc+CEYJjrfdQeQMgf9JwDwYo=;
 b=o1abNyuclFO15A/6/McYne+QOGIvn+XTYDY6EIdUqTY7Uv72XDgslSh4NIBvaPwrky
 VefCSgOlljqAYmvca33GNDESWnr8NjwUtptaxUI7HSp5I4f7L+qS8ObI9awr+xXDNFJq
 OT17UeWtSdtNMigelavMdMQ7qsP1EFFGutJfQN0MNi1kmp9XMF0h1UrQsw0nNm3O3rIH
 ZYGWjlbDXdumPqFAfFSlsc9NRMs0hEAIOp2L1WihyC94uiDt44DsNRdtNrdZm3UakEo7
 5UxbuKT6LL/v1kdfL2NOj0u8INTOOqDCuKNZ97EbAnejSfI2lXJlEgSOHvehrCVynpgk
 BPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693001542; x=1693606342;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jiWB9v97HWraryvHTLxgc+CEYJjrfdQeQMgf9JwDwYo=;
 b=c5GWavHbsp59THgpEZTI/f8v41wz/MPCFoFQw1IIcLokaaFvyqF7yIQ1raFhhPffG+
 CJvPh6BCYjUDrXDvUdeK8hqFWC9TX9mzHlv3WwqIxpkKFLZKRxU5J3k0el24+tcJCo1s
 h144o2N+YWDsyKrKsb8YYL3wuZ2JtE6fjLY3Kqd04eCcgTMLKkFlbmRd3PY1AdAOCjqr
 qIvh9YPuqPjI5TR9PJCgTOQDuc3yuiN1vBJNqC9GC3NPpgxxb+uepz3d6S2F+3jSRePM
 e5PXHEb+avDeeBWwUbsu9e/3dO0JrATRwyo+Z19bCp2xTSnf/M1m3ipmJgnj3Azuap7r
 chZg==
X-Gm-Message-State: AOJu0Ywf7zBCb8b4EzFVK8TNB+Se6Na2Ag3Y8Co79hvfYJ8NcilzD6kr
 6zFt/bjHnHc3Pjq8ukxZzFR5wprZAn4YXJXetPL7Ow==
X-Google-Smtp-Source: AGHT+IEh37w7GhGca8NdEFatO+jxjw3lxK9RNgllGYwXHOM5rh3j9u6rw1eIsrbFwWS9IZn0hsI2lv3Fj8ImeK3KR9k=
X-Received: by 2002:a19:ca44:0:b0:500:90d1:90a6 with SMTP id
 h4-20020a19ca44000000b0050090d190a6mr7433122lfj.63.1693001541950; Fri, 25 Aug
 2023 15:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230824-strncpy-drivers-accel-habanalabs-goya-goya-c-v1-1-b81d5639e7a3@google.com>
In-Reply-To: <20230824-strncpy-drivers-accel-habanalabs-goya-goya-c-v1-1-b81d5639e7a3@google.com>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 25 Aug 2023 15:12:10 -0700
Message-ID: <CAFhGd8p-8a4SGQgcN=3LGA4Ju2tyxnkBf9yUTQSBpsXcZ12_7Q@mail.gmail.com>
Subject: Re: [PATCH] habanalabs/goya: refactor deprecated strncpy
To: Oded Gabbay <ogabbay@kernel.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch as well as two other related patches were combined into a
single patch [1]

 Thu, Aug 24, 2023 at 1:49=E2=80=AFPM Justin Stitt <justinstitt@google.com>=
 wrote:
>
> `strncpy` is deprecated for use on NUL-terminated destination strings [1]=
.
>
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on its destination buffer argument which is
> _not_ the case for `strncpy`!
>
> Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-n=
ul-terminated-strings[1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.h=
tml [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: build-tested only.
> ---
>  drivers/accel/habanalabs/goya/goya.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/habanalabs/goya/goya.c b/drivers/accel/habanal=
abs/goya/goya.c
> index 7c685e6075f6..d0ac7065f3d7 100644
> --- a/drivers/accel/habanalabs/goya/goya.c
> +++ b/drivers/accel/habanalabs/goya/goya.c
> @@ -466,7 +466,7 @@ int goya_set_fixed_properties(struct hl_device *hdev)
>         prop->pcie_dbi_base_address =3D mmPCIE_DBI_BASE;
>         prop->pcie_aux_dbi_reg_addr =3D CFG_BASE + mmPCIE_AUX_DBI;
>
> -       strncpy(prop->cpucp_info.card_name, GOYA_DEFAULT_CARD_NAME,
> +       strscpy(prop->cpucp_info.card_name, GOYA_DEFAULT_CARD_NAME,
>                 CARD_NAME_MAX_LEN);
>
>         prop->max_pending_cs =3D GOYA_MAX_PENDING_CS;
> @@ -5122,7 +5122,7 @@ int goya_cpucp_info_get(struct hl_device *hdev)
>         }
>
>         if (!strlen(prop->cpucp_info.card_name))
> -               strncpy(prop->cpucp_info.card_name, GOYA_DEFAULT_CARD_NAM=
E,
> +               strscpy(prop->cpucp_info.card_name, GOYA_DEFAULT_CARD_NAM=
E,
>                                 CARD_NAME_MAX_LEN);
>
>         return 0;
>
> ---
> base-commit: f9604036a3fb6149badf346994b46b03f9292db7
> change-id: 20230824-strncpy-drivers-accel-habanalabs-goya-goya-c-2a05a220=
2c78
>
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>

[1]: https://lore.kernel.org/r/20230825-strncpy-habanalabs-combined-v1-1-da=
a05a89b7e3@google.com
