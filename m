Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197C26BAD74
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 11:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E380F10E993;
	Wed, 15 Mar 2023 10:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A3510E993
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 10:19:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 830F761CD5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 10:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE72C4339B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 10:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678875570;
 bh=/ussKYXUoRi9/8f5OSHrM5/7XrSufnqd6npdfnXgl1k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=g5b3UJMwsJ0jgNfnZ8uvE+Cz3Aq6R7LbcFB1deZ8Gfe7y7u12wk74cxWSGv4wz2f5
 WxVXTbjLcElg6MBn8dwjCCvTYpg6y7HwneGPbxlp758g2+OO4M2IhswAh8bE4uFTqy
 YvOL8fwLjb5YaCzJ6UfnlvFw+hCQmt6QfeA1L+oF4TClIlVxlsqKpzFnQNVigHjPdF
 Cd4rFRvPAfdtKr+MisifwPlO2Sed9HerZyh8zykS/jtgGHb8q7YQiZIicx8xa4AfLW
 eNhKbJ+3t+y8JmPi1kb6cQtQJpmCvuhs4rXDECXj+R43eNDNm5SzY9i1WiffKIxSfO
 Xjy8JDIoVy/KA==
Received: by mail-yb1-f169.google.com with SMTP id r1so5972332ybu.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 03:19:29 -0700 (PDT)
X-Gm-Message-State: AO0yUKVzsRHZ9zBIXk4RojK+/7kak8Gg29lRihmt012TNcNBLlf5GOGU
 u5EqHX4tF4jpVpIBUgQndRRqeGmR55TrCoj7ZFk=
X-Google-Smtp-Source: AK7set/7traRT7mrw96UuGndfjQj//Zk/eGWzn/SrP0oE30xnYqD7NfDtcimPZPeVzTV2xDh4RspdgeRii7F+qBEE0I=
X-Received: by 2002:a5b:f87:0:b0:b30:8d4b:230e with SMTP id
 q7-20020a5b0f87000000b00b308d4b230emr9001232ybh.7.1678875568933; Wed, 15 Mar
 2023 03:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230314081812.26065-1-colin.i.king@gmail.com>
In-Reply-To: <20230314081812.26065-1-colin.i.king@gmail.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Wed, 15 Mar 2023 12:19:02 +0200
X-Gmail-Original-Message-ID: <CAFCwf13FTaytTqoJ_C9zsSEKwuOsVY8+O52oCJH58+LRhy81AA@mail.gmail.com>
Message-ID: <CAFCwf13FTaytTqoJ_C9zsSEKwuOsVY8+O52oCJH58+LRhy81AA@mail.gmail.com>
Subject: Re: [PATCH][next] habanalabs: Fix spelling mistake "maped" -> "mapped"
To: Colin Ian King <colin.i.king@gmail.com>
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
Cc: Yuri Nudelman <ynudelman@habana.ai>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 10:18=E2=80=AFAM Colin Ian King <colin.i.king@gmail=
.com> wrote:
>
> There is a spelling mistake in a dev_err message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/accel/habanalabs/common/memory_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/accel/habanalabs/common/memory_mgr.c b/drivers/accel=
/habanalabs/common/memory_mgr.c
> index 30f8059f28c2..c4d84df355b0 100644
> --- a/drivers/accel/habanalabs/common/memory_mgr.c
> +++ b/drivers/accel/habanalabs/common/memory_mgr.c
> @@ -275,7 +275,7 @@ int hl_mem_mgr_mmap(struct hl_mem_mgr *mmg, struct vm=
_area_struct *vma,
>
>         if (atomic_cmpxchg(&buf->mmap, 0, 1)) {
>                 dev_err(mmg->dev,
> -                       "%s, Memory mmap failed, already maped to user\n"=
,
> +                       "%s, Memory mmap failed, already mapped to user\n=
",
>                         buf->behavior->topic);
>                 rc =3D -EINVAL;
>                 goto put_mem;
> --
> 2.30.2
>

Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Applied to -next
Thanks,
Oded
