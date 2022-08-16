Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7895962B0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 20:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7C910E34D;
	Tue, 16 Aug 2022 18:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7803510EAA3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 18:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660675810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AkK5XVOSKnldgDxtfSJhIQ0VryUaBistREPEqG430YQ=;
 b=JOcvcCtlCsv2esMbSV0YocJZqb2bMVhSNn+vSucXSmOpZX8h145QVQ/FPbarCsEYUarBp5
 0Of93DcsYnmVZJjItIXnaWZFUf4HgZW+qgHFqXi14/ojB1Rgoa0UZUdQmMqQeSGGRTrfQD
 m686cBUhgtM2QbITWgPtVfnD3xEtUic=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-7fR3lSVNMvmEkcsyTNC0oQ-1; Tue, 16 Aug 2022 14:50:09 -0400
X-MC-Unique: 7fR3lSVNMvmEkcsyTNC0oQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 cj19-20020a05622a259300b003446920ea91so3608554qtb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 11:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=AkK5XVOSKnldgDxtfSJhIQ0VryUaBistREPEqG430YQ=;
 b=JS4pimpXYb+1nH5dFO+VpazK1x4arfBisOvnqzUufedE2rGfJtk0/AcVIajLA4sQB4
 XxRGWYsQuli3Zz72jHYgLFj8Dok8DbXuDqqoqpNAIRSBCh6B+QJz9PZrOAhP3WOLbl2I
 igDqD2FK1mCNTxMs/GdEVYdxh80ChEHIsmC/Q476/A03YDAcJDYZXAgcHNYclhxGY/Sg
 HIkqwVFFd8JTSpQeC5h7rIwmb/gtz+YYAHu1DAtpAbdGpLLH0R8cgqfVCIy4exvU2hMs
 APn5hlgKHuKJDLounPzkvjjsdvku8E9YnL9lga8hSildT4u3e2doGgWXspcpjRzhyrro
 O01A==
X-Gm-Message-State: ACgBeo30rYahset5GfDFgwGGEa+3LgTvuzpVX7BWe60kUfYEntlPsQE7
 ptlF73E3nZ/m+0pY10mJSIyWq1pQS9TFgonSvIQ53vHTynyTg0QeN9BmQB4Wb5aUe1gGquWLGSx
 gj4YqPxPw3j23p0vrOq4/JKMD8lBRfg73vbPtw3KW4OUW
X-Received: by 2002:a05:620a:2444:b0:6bb:3397:556b with SMTP id
 h4-20020a05620a244400b006bb3397556bmr7441196qkn.336.1660675809313; 
 Tue, 16 Aug 2022 11:50:09 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5dUXuiPf2SvaQ6qdoG4GXaAVy4hA4WC5ASn4P0jVmQCPTsYvEx5t9BOulk4AEAIjwyNZlyUh+bojKePuTiVL4=
X-Received: by 2002:a05:620a:2444:b0:6bb:3397:556b with SMTP id
 h4-20020a05620a244400b006bb3397556bmr7441175qkn.336.1660675809065; Tue, 16
 Aug 2022 11:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220816025217.618181-1-kai.heng.feng@canonical.com>
In-Reply-To: <20220816025217.618181-1-kai.heng.feng@canonical.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 16 Aug 2022 20:49:58 +0200
Message-ID: <CACO55tt=Op=0E94kK+1M8cDXNCk5Tkc=FMR8=OQFc5ohehjwaw@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Switch TGL-H DP-IN to dGFX when it's supported
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: tvrtko.ursulin@linux.intel.com,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Zenghui Yu <yuzenghui@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 16, 2022 at 4:53 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> On mobile workstations like HP ZBook Fury G8, iGFX's DP-IN can switch to
> dGFX so external monitors are routed to dGFX, and more monitors can be
> supported as result.
>
> To switch the DP-IN to dGFX, the driver needs to invoke _DSM function 20
> on intel_dsm_guid2. This method is described in Intel document 632107.
>

Can we please not do things like this just because?

It forces the discrete GPU to be on leading to higher thermal pressure
and power consumption of the system. Lower battery runtime or higher
fan noise is the result. Not everybody wants to use an AC simply just
because they attach an external display.

If the problem is "we run out of displays" then can we have something
more dynamic, where we are doing this only and only if we run out of
resources to drive as that many displays.

Most users will be fine with ports being driven by the iGPU. Why hurt
most users, because of some weird special case with mostly only
drawbacks?

> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/gpu/drm/i915/display/intel_acpi.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
> index e78430001f077..3bd5930e2769b 100644
> --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> @@ -20,6 +20,7 @@ static const guid_t intel_dsm_guid =
>                   0xa8, 0x54, 0x0f, 0x13, 0x17, 0xb0, 0x1c, 0x2c);
>
>  #define INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED 0 /* No args */
> +#define INTEL_DSM_FN_DP_IN_SWITCH_TO_DGFX 20 /* No args */
>
>  static const guid_t intel_dsm_guid2 =
>         GUID_INIT(0x3e5b41c6, 0xeb1d, 0x4260,
> @@ -187,6 +188,7 @@ void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
>         struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>         acpi_handle dhandle;
>         union acpi_object *obj;
> +       int supported = 0;
>
>         dhandle = ACPI_HANDLE(&pdev->dev);
>         if (!dhandle)
> @@ -194,8 +196,22 @@ void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
>
>         obj = acpi_evaluate_dsm(dhandle, &intel_dsm_guid2, INTEL_DSM_REVISION_ID,
>                                 INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED, NULL);
> -       if (obj)
> +       if (obj) {
> +               if (obj->type == ACPI_TYPE_INTEGER)
> +                       supported = obj->integer.value;
> +
>                 ACPI_FREE(obj);
> +       }
> +
> +       /* Tiger Lake H DP-IN Boot Time Switching from iGfx to dGfx */
> +       if (supported & BIT(20)) {
> +               obj = acpi_evaluate_dsm(dhandle, &intel_dsm_guid2,
> +                                       INTEL_DSM_REVISION_ID,
> +                                       INTEL_DSM_FN_DP_IN_SWITCH_TO_DGFX,
> +                                       NULL);
> +               if (obj)
> +                       ACPI_FREE(obj);
> +       }
>  }
>
>  /*
> --
> 2.36.1
>

