Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBC172234F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 12:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EBF10E285;
	Mon,  5 Jun 2023 10:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6144410E284
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 10:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685960492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i5G/dz9nbK/JSD2enIPaONJbILsF/54DvTtt6irDTng=;
 b=Lj738rw5903uRaSUse5JOafCf6Alj9IKVh1AKSRaF2lxl0GACA1ZolAeU8iXUEwI5HegD7
 e3UTWuV/B8o3OENrBnqE5amRL9qw5RkSSjIB2kU3e3PVMDHNsi67NERlFSArkVKUZgSFna
 +ldLgANWfV3V+EtM/kEP0JqMKdd/ZwY=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-nPUore-4N5yOKXGCLmsU9A-1; Mon, 05 Jun 2023 06:21:31 -0400
X-MC-Unique: nPUore-4N5yOKXGCLmsU9A-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b1e52292beso1109081fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 03:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685960490; x=1688552490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i5G/dz9nbK/JSD2enIPaONJbILsF/54DvTtt6irDTng=;
 b=LVidwS5TFwwKH18B5iBg515U7IUg3ulZ8FynsdMnksoe6Yj9eVsmH/VubJyKUF8xXg
 tpmjF96oxmP6lXYGoHh6rWegJt41zVP+NiR3ygkupJbntnMJ3u8TZSDMsy1p4I5p4CMe
 oFxADSuOSJYBdfqQuVakHo3QTb0CziVvWZxg2PlOQMgteytvcdG0xePXO0WQ4jciSQJj
 i5W7AWbu4roELXJthfS09lpqwOkb7Z5O7JkRzSwK1Qb8IAcPwCWtvv1NK9PIazBY8hrq
 DdCYTIHHe/1zXRbR7faeRR2a8afNzAe1M9aYsXLiCKlMsUIz6fG9aZk8nQfUf9TRnk4z
 hmbQ==
X-Gm-Message-State: AC+VfDz/C70tuZ1HsUCSi2QDTI2RTIBfxBbIUmQsq9jXNoyUt2fFR+KH
 yeJsbF+zmBUjvIdRUc6vXNdQcoXj7TUbC4FRN1JQjBbCnRbKmiXo2N+EQfp/iHJN0f7cSiYDX8H
 n6wtcxa7iGIiCqY34D3ePUGRAU4eKmGcnH2yILjgDkXDO
X-Received: by 2002:a05:651c:309:b0:2b1:b012:e126 with SMTP id
 a9-20020a05651c030900b002b1b012e126mr3214654ljp.3.1685960490476; 
 Mon, 05 Jun 2023 03:21:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Ifasbc4YdoMu43AjBf53AQoBF88rpDabFVOadXuldaSfVB0lpoRYF1UqDwhH+sAHsyBu2d/h+9h+nspcCqU0=
X-Received: by 2002:a05:651c:309:b0:2b1:b012:e126 with SMTP id
 a9-20020a05651c030900b002b1b012e126mr3214639ljp.3.1685960490092; Mon, 05 Jun
 2023 03:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR19MB2780805D4BE1E3F9B3AC96D0BC409@DM6PR19MB2780.namprd19.prod.outlook.com>
In-Reply-To: <DM6PR19MB2780805D4BE1E3F9B3AC96D0BC409@DM6PR19MB2780.namprd19.prod.outlook.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 5 Jun 2023 12:21:18 +0200
Message-ID: <CACO55ttutaud0zO-aw=x9i-++jhsOBmDJKiFE9NT=1tYc1GXuQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/nouveau: don't detect DSM for non-NVIDIA device
To: Ratchanan Srirattanamet <peathot@hotmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, bskeggs@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 11:12=E2=80=AFPM Ratchanan Srirattanamet
<peathot@hotmail.com> wrote:
>
> The call site of nouveau_dsm_pci_probe() uses single set of output
> variables for all invocations. So, we must not write anything to them
> unless it's an NVIDIA device. Otherwise, if we are called with another
> device after the NVIDIA device, we'll clober the result of the NVIDIA
> device.
>
> For example, if the other device doesn't have _PR3 resources, the
> detection later would miss the presence of power resource support, and
> the rest of the code will keep using Optimus DSM, breaking power
> management for that machine.
>
> Also, because we're detecting NVIDIA's DSM, it doesn't make sense to run
> this detection on a non-NVIDIA device anyway. Thus, check at the
> beginning of the detection code if this is an NVIDIA card, and just
> return if it isn't.
>
> This, together with commit d22915d22ded ("drm/nouveau/devinit/tu102-:
> wait for GFW_BOOT_PROGRESS =3D=3D COMPLETED") developed independently and
> landed earlier, fixes runtime power management of the NVIDIA card in
> Lenovo Legion 5-15ARH05. Without this patch, the GPU resumption code
> will "timeout", sometimes hanging userspace.
>
> As a bonus, we'll also stop preventing _PR3 usage from the bridge for
> unrelated devices, which is always nice, I guess.
>
> Signed-off-by: Ratchanan Srirattanamet <peathot@hotmail.com>
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/79
> ---
> V1 -> V2:
> - Update the changelog to indicate that it now actually fixes the issue.
> - Add 'Closes:' tag.
>
>  drivers/gpu/drm/nouveau/nouveau_acpi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nou=
veau/nouveau_acpi.c
> index 8cf096f841a9..a2ae8c21e4dc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> @@ -220,6 +220,9 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pde=
v, acpi_handle *dhandle_out
>         int optimus_funcs;
>         struct pci_dev *parent_pdev;
>
> +       if (pdev->vendor !=3D PCI_VENDOR_ID_NVIDIA)
> +               return;
> +
>         *has_pr3 =3D false;
>         parent_pdev =3D pci_upstream_bridge(pdev);
>         if (parent_pdev) {
>
> base-commit: 5fe326b4467689ef3690491ee2ad25ff4d81fe59
> --
> 2.34.1
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

I'll add a Cc: <stable@vger.kernel.org> when pushing the change as
I'll also think about how far in the past to get it applied. Though it
shouldn't hurt as it shouldn't make things worse on any system.

