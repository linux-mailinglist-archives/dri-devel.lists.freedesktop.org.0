Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B254BFEFA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 17:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34E510E17A;
	Tue, 22 Feb 2022 16:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188DE10E158;
 Tue, 22 Feb 2022 16:39:11 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 j8-20020a056830014800b005ad00ef6d5dso10071638otp.0; 
 Tue, 22 Feb 2022 08:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HUDPBUCCyZ+r0/t1fOspP5japV7Qp4b2ztEVMD6jnZQ=;
 b=bPO+4Uv2v8uNdCOhqot+RlJnrcS31qSjx9SM8Jtf53qMdfsGwEZcXdPmOQrCQ3Q8E1
 UrBGUZAFtzScTxO1X8CTsvH+RcH/PldVUq7pLfgX1KM85gw15RMlGZhF+D7tjhHBBr2Y
 wLrmWpBRNREY91sYWNwiECXwJU8+pGntyPa8fvHXd1xMQBX0KZUTBPKuPaAuA1eDtw5m
 RYCFMGmRDERWj0Xvg5nkxfvTQ3dyEkL/zjrB3NfUseWGOtJCAABcyTzJfPivRVOwlxA0
 C63VEQR5h9lJbLgmTx/6Bqud/ajcS03+UpiP0T0rruoCCRDomoETRsspg7ZNdMDqvsV0
 lxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HUDPBUCCyZ+r0/t1fOspP5japV7Qp4b2ztEVMD6jnZQ=;
 b=4cmPh/+HymLqwnZuNbJdYwBvEKnTTx6pxTWyZ/8mig+yepxa30v/skpSzlE7x0RMn1
 xIdGSmQ/0fzsDkmzH53hsTBVaddu5ZX2YQ7WDJRe3TUqTAvgMHbslqdQx8HeTUFmzL6+
 ZSjUQBFv6pdYQSVSdmPrHP/RvNQlPfT4qL4MZ3VfBZFnrpP652AjM+0P/MWTMAz3Ga3G
 4SdHcbQ9RfDNYEyKf7TyHZLzI5NndAB1fLGfv2nltkt3BLZ1+ul/k//fIFozIhk2U0Vc
 k3MmXzhAmnlu/25SUZRH3ysLIXNOR7PTTZyEh+EDPggPqordq5/XyF4if0Qhu0IY/026
 o2pg==
X-Gm-Message-State: AOAM530fUFcZCU5GIohh8mEYBvK2WLXq4h8/+0C+1O+pCBv8syqPGLqc
 QJXifRZwcgbiAoTaKvgle97lbeNyuQy1QeM38EqSHe3K
X-Google-Smtp-Source: ABdhPJy48t44vEi7/215bq21/ShouYaMou6wewiEwkT80+ZUXpPpncs9g6wGqbMIp8lqU20r71y8DU04IFc9zAcU21o=
X-Received: by 2002:a9d:4a8:0:b0:5ad:35f8:31a6 with SMTP id
 37-20020a9d04a8000000b005ad35f831a6mr6847722otm.200.1645547950284; Tue, 22
 Feb 2022 08:39:10 -0800 (PST)
MIME-Version: 1.0
References: <20220222131701.356117-1-maira.canal@usp.br>
 <20220222131701.356117-8-maira.canal@usp.br>
In-Reply-To: <20220222131701.356117-8-maira.canal@usp.br>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Feb 2022 11:38:59 -0500
Message-ID: <CADnq5_Nuc8UbGGqrWW=TDJh-3QzPQ7Ho5FCcuAHVz-qPpfbf4g@mail.gmail.com>
Subject: Re: [PATCH 07/10] drm/amd/display: Remove unused
 dmub_outbox_irq_info_funcs variable
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
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
Cc: "Tuikov, Luben" <luben.tuikov@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, "Joshi, Mukul" <mukul.joshi@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mwen@igalia.com, "Chai, Thomas" <YiPeng.Chai@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Magali Lemes <magalilemes00@gmail.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Isabella Basso <isabbasso@riseup.net>,
 John Clements <john.clements@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Feb 22, 2022 at 8:18 AM Ma=C3=ADra Canal <maira.canal@usp.br> wrote=
:
>
> Remove the unused struct irq_source_info_funcs
> dmub_outbox_irq_info_funcs from the file, which was declared but never
> hooked up.
>
> This was pointed by clang with the following warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:=
141:43:
> warning: unused variable 'dmub_outbox_irq_info_funcs'
> [-Wunused-const-variable]
> static const struct irq_source_info_funcs dmub_outbox_irq_info_funcs =3D =
{
>                                           ^
>
> Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> ---
>  .../gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c   | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201=
.c b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
> index aa708b61142f..45f99351a0ab 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
> @@ -138,11 +138,6 @@ static const struct irq_source_info_funcs vupdate_no=
_lock_irq_info_funcs =3D {
>         .ack =3D NULL
>  };
>
> -static const struct irq_source_info_funcs dmub_outbox_irq_info_funcs =3D=
 {
> -       .set =3D NULL,
> -       .ack =3D NULL
> -};
> -
>  #undef BASE_INNER
>  #define BASE_INNER(seg) DMU_BASE__INST0_SEG ## seg
>
> --
> 2.35.1
>
