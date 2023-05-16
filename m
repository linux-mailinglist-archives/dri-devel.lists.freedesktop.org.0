Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2E270458B
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 08:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D480510E2F4;
	Tue, 16 May 2023 06:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F1410E2F4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 06:50:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DA8C61FC5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 06:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A07C4339E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 06:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684219856;
 bh=OVP/rerETkXsjJ0I6Oo86srhf+okaQ4WPHGI2BJ0adU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cX0gUuIWjuMYOeF8xYopDOXyaLqObrvjwvfDoNS3Zd/QpCrSheAGqFQR4KtRpv0Ga
 8EP1ivUqUtGAisYjKu/NX7BIzLQI9GceJrzQ9pA6OwvbeWRsfWfkh/GaD/jir/TFD+
 QWakD3Gst/TFIJ4rE5QLubI9QNTLNfdhluMzhSY3wYVxKnAZbVEyDF/izaZbkmcWEX
 XCQC0TTztcuz+qQf8blIe95/AjaTI1q7xuujtxK6LvZF+ba7aUWP0496qJM7+TM/Hy
 vsfnFk784nN64prOcWzmdRO/yBJqiXhl4M7VyTjZvZ+bji6FzELiqL24cABMmmUZ0c
 4cYLvZdPpwCUA==
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-561a33b6d63so971457b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 23:50:56 -0700 (PDT)
X-Gm-Message-State: AC+VfDzLZx6KuLKYiwB/JpEUUcIbVpkk5qlGgSygMT+cfPaG/79UpvHM
 T1i4cXXNeHBHFO/DpiUbyFHM5SifzJ1NWdHU4oE=
X-Google-Smtp-Source: ACHHUZ797wJH62FhSxc0l09+6zJ+7Djyy3aB4kp9B63Ei2gpKIZqgZUgw3jpLrG2e+qYrge+r721aglIYLNutMGush8=
X-Received: by 2002:a81:52d0:0:b0:55a:20d5:e103 with SMTP id
 g199-20020a8152d0000000b0055a20d5e103mr33500157ywb.34.1684219855580; Mon, 15
 May 2023 23:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230512064655.82246-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230512064655.82246-1-yang.lee@linux.alibaba.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 16 May 2023 09:50:28 +0300
X-Gmail-Original-Message-ID: <CAFCwf139EwbAnhf4RJXxLmxPA4gZGjrMNCJv55muncBMMp8BAA@mail.gmail.com>
Message-ID: <CAFCwf139EwbAnhf4RJXxLmxPA4gZGjrMNCJv55muncBMMp8BAA@mail.gmail.com>
Subject: Re: [PATCH -next] habanalabs: Fix some kernel-doc comments
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 9:47=E2=80=AFAM Yang Li <yang.lee@linux.alibaba.com=
> wrote:
>
> Make the description of @regs_range_array and @regs_range_array_size
> to @user_regs_range_array and @user_regs_range_array_size  to silence
> the warnings:
>
> drivers/accel/habanalabs/common/security.c:506: warning: Function paramet=
er or member 'user_regs_range_array' not described in 'hl_init_pb_ranges_si=
ngle_dcore'
> drivers/accel/habanalabs/common/security.c:506: warning: Function paramet=
er or member 'user_regs_range_array_size' not described in 'hl_init_pb_rang=
es_single_dcore'
> drivers/accel/habanalabs/common/security.c:506: warning: Excess function =
parameter 'regs_range_array' description in 'hl_init_pb_ranges_single_dcore=
'
> drivers/accel/habanalabs/common/security.c:506: warning: Excess function =
parameter 'regs_range_array_size' description in 'hl_init_pb_ranges_single_=
dcore'
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D4940
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/accel/habanalabs/common/security.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/habanalabs/common/security.c b/drivers/accel/h=
abanalabs/common/security.c
> index 297e6e44fd0c..dc23ff57c91a 100644
> --- a/drivers/accel/habanalabs/common/security.c
> +++ b/drivers/accel/habanalabs/common/security.c
> @@ -495,8 +495,8 @@ int hl_init_pb_single_dcore(struct hl_device *hdev, u=
32 dcore_offset,
>   * @instance_offset: offset between instances
>   * @pb_blocks: blocks array
>   * @blocks_array_size: blocks array size
> - * @regs_range_array: register range array
> - * @regs_range_array_size: register range array size
> + * @user_regs_range_array: register range array
> + * @user_regs_range_array_size: register range array size
>   *
>   */
>  int hl_init_pb_ranges_single_dcore(struct hl_device *hdev, u32 dcore_off=
set,
> --
> 2.20.1.7.g153144c
>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Applied to -next.
Thanks,
Oded
