Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C936997BC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 15:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A362710EDAF;
	Thu, 16 Feb 2023 14:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063BD10EDAF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:44:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AA881B825E1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB90C4339B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676558653;
 bh=AzkJe/MGy9FfZYVbw+wWyqBlRmZQLjZbXpGIIkABrKY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Le92NlNpvRigYDnm20rRXhUnFbnd+bdJdnmMDBVG9R4irxWSGjgQIMLU259i230Oi
 Sw9jY2A1j8GaP3WAr54Mclnb1KpK4pmwKzoCIGN8pylpi6/HzdXkxCdwlXLMte50/o
 KkOARaeGbuyK186cDUzUkv/7eVSElbPsv0tXByaW9vI6RkQbHpAhl331OdCnhNCWb+
 zwzFg6dUInESP1aBj6+fZdbaVvIvOrmSEZI+Cgcbdp5dDxBEuUXjyqln2SqEQyKGkW
 iPF0Jx3WUEwUKlAQfyUJQ5tRtoKN2JpMaL4i7RQq5fsoDYvf2pt4LTErcAe5WuZwyj
 VwJc1a4Y5+WUA==
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-52eb7a5275aso27761217b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 06:44:13 -0800 (PST)
X-Gm-Message-State: AO0yUKUt/opnlIeB8kvXNW4+B0ZA22Zekf3w0jBpkyBj03IY/sDDuviT
 74EfkQg8GCiRzHGRybCqeTSxctIiiBb5vrvCRQU=
X-Google-Smtp-Source: AK7set+mXat/4yIjI/tnV63gM/GqcjAa22n2yodbqqQczzxbxUloison1sozumN/5fU4N0OpwptZ1Iw2dAPG8aCgdcg=
X-Received: by 2002:a0d:c846:0:b0:527:ac4c:9f80 with SMTP id
 k67-20020a0dc846000000b00527ac4c9f80mr837802ywd.342.1676558652363; Thu, 16
 Feb 2023 06:44:12 -0800 (PST)
MIME-Version: 1.0
References: <20230213144814.2225707-1-trix@redhat.com>
In-Reply-To: <20230213144814.2225707-1-trix@redhat.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 16 Feb 2023 16:43:46 +0200
X-Gmail-Original-Message-ID: <CAFCwf10pZbtrVkLEjH07KMcMU7giF8Z-ok8vX5mYGaGf-iGxfQ@mail.gmail.com>
Message-ID: <CAFCwf10pZbtrVkLEjH07KMcMU7giF8Z-ok8vX5mYGaGf-iGxfQ@mail.gmail.com>
Subject: Re: [PATCH] habanalabs: set hl_capture_*_err storage-class-specifier
 to static
To: Tom Rix <trix@redhat.com>
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
Cc: osharabi@habana.ai, gregkh@linuxfoundation.org, dliberman@habana.ai,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dhirschfeld@habana.ai, ttayar@habana.ai
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 13, 2023 at 4:48 PM Tom Rix <trix@redhat.com> wrote:
>
> smatch reports
> drivers/accel/habanalabs/common/device.c:2619:6: warning:
>   symbol 'hl_capture_hw_err' was not declared. Should it be static?
> drivers/accel/habanalabs/common/device.c:2641:6: warning:
>   symbol 'hl_capture_fw_err' was not declared. Should it be static?
>
> both are only used in device.c, so they should be static
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/accel/habanalabs/common/device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
> index fefe70bbbede..a5f5ee102823 100644
> --- a/drivers/accel/habanalabs/common/device.c
> +++ b/drivers/accel/habanalabs/common/device.c
> @@ -2616,7 +2616,7 @@ void hl_handle_page_fault(struct hl_device *hdev, u64 addr, u16 eng_id, bool is_
>                 *event_mask |=  HL_NOTIFIER_EVENT_PAGE_FAULT;
>  }
>
> -void hl_capture_hw_err(struct hl_device *hdev, u16 event_id)
> +static void hl_capture_hw_err(struct hl_device *hdev, u16 event_id)
>  {
>         struct hw_err_info *info = &hdev->captured_err_info.hw_err;
>
> @@ -2638,7 +2638,7 @@ void hl_handle_critical_hw_err(struct hl_device *hdev, u16 event_id, u64 *event_
>                 *event_mask |= HL_NOTIFIER_EVENT_CRITICL_HW_ERR;
>  }
>
> -void hl_capture_fw_err(struct hl_device *hdev, struct hl_info_fw_err_info *fw_info)
> +static void hl_capture_fw_err(struct hl_device *hdev, struct hl_info_fw_err_info *fw_info)
>  {
>         struct fw_err_info *info = &hdev->captured_err_info.fw_err;
>
> --
> 2.26.3
>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Thanks, applied to -next.
Oded
