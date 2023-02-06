Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8F168B84E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 10:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F0F10E173;
	Mon,  6 Feb 2023 09:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8B510E161
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 07:52:35 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id a10so3644894edu.9
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Feb 2023 23:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jf0eABmWCkzWHSAjxzxyePRPwheCG8eTMDjMOdk7BGM=;
 b=HLA49fFS6j+626RbExOu4egzV7bViU7IWs4hTVf7yE6b11vk/x9M/250B2/IwCB4RB
 VTHLfR2TBZTehuCW8zHe/6bvSHicWpMEbHjk474th1SXzE7gRPh5U2/zvYproO/yFoCN
 WS/FnItAogbGXn052nhSqu8Cf63RL/s3fdFHjNIPx/cYBVlvPitFQXOT9kqqZNZZwVZ1
 9gdw8nm2rh/AOudJbEVIWRTlrVJvPp1Ib1AS5UTew5LlN3qJE4NxwuAGUyhcb8YPFyca
 aP9GZ5Oiayq0E0KHZZvAV0tEdFlZWXfmr417twGhKqA0cU2MJFtoaG6m/yt6+TpZ4svB
 Vaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jf0eABmWCkzWHSAjxzxyePRPwheCG8eTMDjMOdk7BGM=;
 b=w1xWAGbNMFLbf8r7jx9mk7jm0fT/cqbjyCwknz8GgD3ck+qq9iMx1fv217Nk9Q2MIU
 RwBZ6g8/UNEPGXTchjrS+tevUfoyrtDUMWok1zcRD4D7m8YSEHrW8UilYtfcTzpjOuvB
 aNSJpjjfw9QJQWPJkzjLvVcQDrBwuQnSsRu53LsVNT3sdFfOIGGwkclMfI0C/YC2OGxA
 QVpFldo0UFglbqOesbtLz+pPiVdaX1pvG0Uy10vV/RwQBGLUOpuzY9L02JPxa1Nm6uVx
 9yYINqlEkMj2QO1xef7pb8zNATo1mnAYoFgNLVZHYpjAAba3Y9z1eFd043Xf5PHL/dfG
 YL8w==
X-Gm-Message-State: AO0yUKV011l9P3G5HjELfPPFs0b25+heGsYN9SQ1LLWebGn6SyS/keJ0
 QFZd/bR8MW8Q0a9QXbSzamTkZZ3sJ7QA0tHqtpc=
X-Google-Smtp-Source: AK7set98RyHvAcN3yuHhJF5tdfRYgn++sIR/5KBDTNjoxgKqV1UGEA9H6cdKCTV9EZUAGCmNN1dTlaiSWBSLmmdWIkc=
X-Received: by 2002:a50:935a:0:b0:4aa:a503:7354 with SMTP id
 n26-20020a50935a000000b004aaa5037354mr1548010eda.49.1675669953383; Sun, 05
 Feb 2023 23:52:33 -0800 (PST)
MIME-Version: 1.0
References: <20230205210751.3842103-1-airlied@gmail.com>
In-Reply-To: <20230205210751.3842103-1-airlied@gmail.com>
From: Zeno Davatz <zdavatz@gmail.com>
Date: Mon, 6 Feb 2023 08:52:22 +0100
Message-ID: <CAOkhzLWSJsDK9Gm-AzeUw7fCpkjDg7d9GuDWyF-6hDr5UZ4DZg@mail.gmail.com>
Subject: Re: [PATCH] nvidiafb: detect the hardware support before removing
 console.
To: Dave Airlie <airlied@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>, 
 Bjorn Helgaas <bjorn@helgaas.com>
Content-Type: multipart/mixed; boundary="000000000000554ed205f403504d"
X-Mailman-Approved-At: Mon, 06 Feb 2023 09:10:58 +0000
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
Cc: Dave Airlie <airlied@redhat.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000554ed205f403504d
Content-Type: text/plain; charset="UTF-8"

Dear Dave

Thank you for your patch.

On Sun, Feb 5, 2023 at 10:07 PM Dave Airlie <airlied@gmail.com> wrote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> This driver removed the console, but hasn't yet decided if it could
> take over the console yet. Instead of doing that, probe the hw for
> support and then remove the console afterwards.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=216859
> Reported-by: Zeno Davatz <zdavatz@gmail.com>
> ---
>  drivers/video/fbdev/nvidia/nvidia.c | 81 +++++++++++++++--------------
>  1 file changed, 42 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
> index 1960916098d4..e60a276b4855 100644
> --- a/drivers/video/fbdev/nvidia/nvidia.c
> +++ b/drivers/video/fbdev/nvidia/nvidia.c
> @@ -1197,17 +1197,17 @@ static int nvidia_set_fbinfo(struct fb_info *info)
>         return nvidiafb_check_var(&info->var, info);
>  }
>
> -static u32 nvidia_get_chipset(struct fb_info *info)
> +static u32 nvidia_get_chipset(struct pci_dev *pci_dev,
> +                             volatile u32 __iomem *REGS)
>  {
> -       struct nvidia_par *par = info->par;
> -       u32 id = (par->pci_dev->vendor << 16) | par->pci_dev->device;
> +       u32 id = (pci_dev->vendor << 16) | pci_dev->device;
>
>         printk(KERN_INFO PFX "Device ID: %x \n", id);
>
>         if ((id & 0xfff0) == 0x00f0 ||
>             (id & 0xfff0) == 0x02e0) {
>                 /* pci-e */
> -               id = NV_RD32(par->REGS, 0x1800);
> +               id = NV_RD32(REGS, 0x1800);
>
>                 if ((id & 0x0000ffff) == 0x000010DE)
>                         id = 0x10DE0000 | (id >> 16);
> @@ -1220,12 +1220,11 @@ static u32 nvidia_get_chipset(struct fb_info *info)
>         return id;
>  }
>
> -static u32 nvidia_get_arch(struct fb_info *info)
> +static u32 nvidia_get_arch(u32 Chipset)
>  {
> -       struct nvidia_par *par = info->par;
>         u32 arch = 0;
>
> -       switch (par->Chipset & 0x0ff0) {
> +       switch (Chipset & 0x0ff0) {
>         case 0x0100:            /* GeForce 256 */
>         case 0x0110:            /* GeForce2 MX */
>         case 0x0150:            /* GeForce2 */
> @@ -1278,16 +1277,44 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
>         struct fb_info *info;
>         unsigned short cmd;
>         int ret;
> +       volatile u32 __iomem *REGS;
> +       int Chipset;
> +       u32 Architecture;
>
>         NVTRACE_ENTER();
>         assert(pd != NULL);
>
> +       if (pci_enable_device(pd)) {
> +               printk(KERN_ERR PFX "cannot enable PCI device\n");
> +               return -ENODEV;
> +       }
> +
> +       /* enable IO and mem if not already done */
> +       pci_read_config_word(pd, PCI_COMMAND, &cmd);
> +       cmd |= (PCI_COMMAND_IO | PCI_COMMAND_MEMORY);
> +       pci_write_config_word(pd, PCI_COMMAND, cmd);
> +
> +       nvidiafb_fix.mmio_start = pci_resource_start(pd, 0);
> +       nvidiafb_fix.mmio_len = pci_resource_len(pd, 0);
> +
> +       REGS = ioremap(nvidiafb_fix.mmio_start, nvidiafb_fix.mmio_len);
> +       if (!REGS) {
> +               printk(KERN_ERR PFX "cannot ioremap MMIO base\n");
> +               return -ENODEV;
> +       }
> +
> +       Chipset = nvidia_get_chipset(pd, REGS);
> +       Architecture = nvidia_get_arch(Chipset);
> +       if (Architecture == 0) {
> +               printk(KERN_ERR PFX "unknown NV_ARCH\n");
> +               goto err_out;
> +       }
> +
>         ret = aperture_remove_conflicting_pci_devices(pd, "nvidiafb");
>         if (ret)
> -               return ret;
> +               goto err_out;
>
>         info = framebuffer_alloc(sizeof(struct nvidia_par), &pd->dev);
> -
>         if (!info)
>                 goto err_out;
>
> @@ -1298,11 +1325,6 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
>         if (info->pixmap.addr == NULL)
>                 goto err_out_kfree;
>
> -       if (pci_enable_device(pd)) {
> -               printk(KERN_ERR PFX "cannot enable PCI device\n");
> -               goto err_out_enable;
> -       }
> -
>         if (pci_request_regions(pd, "nvidiafb")) {
>                 printk(KERN_ERR PFX "cannot request PCI regions\n");
>                 goto err_out_enable;
> @@ -1318,34 +1340,17 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
>         par->paneltweak = paneltweak;
>         par->reverse_i2c = reverse_i2c;
>
> -       /* enable IO and mem if not already done */
> -       pci_read_config_word(pd, PCI_COMMAND, &cmd);
> -       cmd |= (PCI_COMMAND_IO | PCI_COMMAND_MEMORY);
> -       pci_write_config_word(pd, PCI_COMMAND, cmd);
> -
> -       nvidiafb_fix.mmio_start = pci_resource_start(pd, 0);
>         nvidiafb_fix.smem_start = pci_resource_start(pd, 1);
> -       nvidiafb_fix.mmio_len = pci_resource_len(pd, 0);
> -
> -       par->REGS = ioremap(nvidiafb_fix.mmio_start, nvidiafb_fix.mmio_len);
>
> -       if (!par->REGS) {
> -               printk(KERN_ERR PFX "cannot ioremap MMIO base\n");
> -               goto err_out_free_base0;
> -       }
> +       par->REGS = REGS;
>
> -       par->Chipset = nvidia_get_chipset(info);
> -       par->Architecture = nvidia_get_arch(info);
> -
> -       if (par->Architecture == 0) {
> -               printk(KERN_ERR PFX "unknown NV_ARCH\n");
> -               goto err_out_arch;
> -       }
> +       par->Chipset = Chipset;
> +       par->Architecture = Architecture;
>
>         sprintf(nvidiafb_fix.id, "NV%x", (pd->device & 0x0ff0) >> 4);
>
>         if (NVCommonSetup(info))
> -               goto err_out_arch;
> +               goto err_out_free_base0;
>
>         par->FbAddress = nvidiafb_fix.smem_start;
>         par->FbMapSize = par->RamAmountKBytes * 1024;
> @@ -1401,7 +1406,6 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
>                 goto err_out_iounmap_fb;
>         }
>
> -
>         printk(KERN_INFO PFX
>                "PCI nVidia %s framebuffer (%dMB @ 0x%lX)\n",
>                info->fix.id,
> @@ -1415,15 +1419,14 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
>  err_out_free_base1:
>         fb_destroy_modedb(info->monspecs.modedb);
>         nvidia_delete_i2c_busses(par);
> -err_out_arch:
> -       iounmap(par->REGS);
> - err_out_free_base0:
> +err_out_free_base0:
>         pci_release_regions(pd);
>  err_out_enable:
>         kfree(info->pixmap.addr);
>  err_out_kfree:
>         framebuffer_release(info);
>  err_out:
> +       iounmap(REGS);
>         return -ENODEV;
>  }
>
> --
> 2.38.1

This patch fails for me.

sudo patch -p1 < /tmp/patch
Passwort:
patching file drivers/video/fbdev/nvidia/nvidia.c
Hunk #1 FAILED at 1197.
Hunk #2 FAILED at 1220.
Hunk #3 FAILED at 1278.
Hunk #4 FAILED at 1298.
Hunk #5 FAILED at 1318.
Hunk #6 FAILED at 1401.
Hunk #7 FAILED at 1415.
7 out of 7 hunks FAILED -- saving rejects to file
drivers/video/fbdev/nvidia/nvidia.c.rej

See attachments.

Best
Zeno

--000000000000554ed205f403504d
Content-Type: application/octet-stream; name=patch
Content-Disposition: attachment; filename=patch
Content-Transfer-Encoding: base64
Content-ID: <f_ldsiklek0>
X-Attachment-Id: f_ldsiklek0

LS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L252aWRpYS9udmlkaWEuYyB8IDgxICsrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMzkg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9udmlkaWEvbnZp
ZGlhLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L252aWRpYS9udmlkaWEuYwppbmRleCAxOTYwOTE2
MDk4ZDQuLmU2MGEyNzZiNDg1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9udmlk
aWEvbnZpZGlhLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9udmlkaWEvbnZpZGlhLmMKQEAg
LTExOTcsMTcgKzExOTcsMTcgQEAgc3RhdGljIGludCBudmlkaWFfc2V0X2ZiaW5mbyhzdHJ1Y3Qg
ZmJfaW5mbyAqaW5mbykKICAgICAgICByZXR1cm4gbnZpZGlhZmJfY2hlY2tfdmFyKCZpbmZvLT52
YXIsIGluZm8pOwogfQoKLXN0YXRpYyB1MzIgbnZpZGlhX2dldF9jaGlwc2V0KHN0cnVjdCBmYl9p
bmZvICppbmZvKQorc3RhdGljIHUzMiBudmlkaWFfZ2V0X2NoaXBzZXQoc3RydWN0IHBjaV9kZXYg
KnBjaV9kZXYsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvbGF0aWxlIHUzMiBfX2lv
bWVtICpSRUdTKQogewotICAgICAgIHN0cnVjdCBudmlkaWFfcGFyICpwYXIgPSBpbmZvLT5wYXI7
Ci0gICAgICAgdTMyIGlkID0gKHBhci0+cGNpX2Rldi0+dmVuZG9yIDw8IDE2KSB8IHBhci0+cGNp
X2Rldi0+ZGV2aWNlOworICAgICAgIHUzMiBpZCA9IChwY2lfZGV2LT52ZW5kb3IgPDwgMTYpIHwg
cGNpX2Rldi0+ZGV2aWNlOwoKICAgICAgICBwcmludGsoS0VSTl9JTkZPIFBGWCAiRGV2aWNlIElE
OiAleCBcbiIsIGlkKTsKCiAgICAgICAgaWYgKChpZCAmIDB4ZmZmMCkgPT0gMHgwMGYwIHx8CiAg
ICAgICAgICAgIChpZCAmIDB4ZmZmMCkgPT0gMHgwMmUwKSB7CiAgICAgICAgICAgICAgICAvKiBw
Y2ktZSAqLwotICAgICAgICAgICAgICAgaWQgPSBOVl9SRDMyKHBhci0+UkVHUywgMHgxODAwKTsK
KyAgICAgICAgICAgICAgIGlkID0gTlZfUkQzMihSRUdTLCAweDE4MDApOwoKICAgICAgICAgICAg
ICAgIGlmICgoaWQgJiAweDAwMDBmZmZmKSA9PSAweDAwMDAxMERFKQogICAgICAgICAgICAgICAg
ICAgICAgICBpZCA9IDB4MTBERTAwMDAgfCAoaWQgPj4gMTYpOwpAQCAtMTIyMCwxMiArMTIyMCwx
MSBAQCBzdGF0aWMgdTMyIG52aWRpYV9nZXRfY2hpcHNldChzdHJ1Y3QgZmJfaW5mbyAqaW5mbykK
ICAgICAgICByZXR1cm4gaWQ7CiB9Cgotc3RhdGljIHUzMiBudmlkaWFfZ2V0X2FyY2goc3RydWN0
IGZiX2luZm8gKmluZm8pCitzdGF0aWMgdTMyIG52aWRpYV9nZXRfYXJjaCh1MzIgQ2hpcHNldCkK
IHsKLSAgICAgICBzdHJ1Y3QgbnZpZGlhX3BhciAqcGFyID0gaW5mby0+cGFyOwogICAgICAgIHUz
MiBhcmNoID0gMDsKCi0gICAgICAgc3dpdGNoIChwYXItPkNoaXBzZXQgJiAweDBmZjApIHsKKyAg
ICAgICBzd2l0Y2ggKENoaXBzZXQgJiAweDBmZjApIHsKICAgICAgICBjYXNlIDB4MDEwMDogICAg
ICAgICAgICAvKiBHZUZvcmNlIDI1NiAqLwogICAgICAgIGNhc2UgMHgwMTEwOiAgICAgICAgICAg
IC8qIEdlRm9yY2UyIE1YICovCiAgICAgICAgY2FzZSAweDAxNTA6ICAgICAgICAgICAgLyogR2VG
b3JjZTIgKi8KQEAgLTEyNzgsMTYgKzEyNzcsNDQgQEAgc3RhdGljIGludCBudmlkaWFmYl9wcm9i
ZShzdHJ1Y3QgcGNpX2RldiAqcGQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpCiAg
ICAgICAgc3RydWN0IGZiX2luZm8gKmluZm87CiAgICAgICAgdW5zaWduZWQgc2hvcnQgY21kOwog
ICAgICAgIGludCByZXQ7CisgICAgICAgdm9sYXRpbGUgdTMyIF9faW9tZW0gKlJFR1M7CisgICAg
ICAgaW50IENoaXBzZXQ7CisgICAgICAgdTMyIEFyY2hpdGVjdHVyZTsKCiAgICAgICAgTlZUUkFD
RV9FTlRFUigpOwogICAgICAgIGFzc2VydChwZCAhPSBOVUxMKTsKCisgICAgICAgaWYgKHBjaV9l
bmFibGVfZGV2aWNlKHBkKSkgeworICAgICAgICAgICAgICAgcHJpbnRrKEtFUk5fRVJSIFBGWCAi
Y2Fubm90IGVuYWJsZSBQQ0kgZGV2aWNlXG4iKTsKKyAgICAgICAgICAgICAgIHJldHVybiAtRU5P
REVWOworICAgICAgIH0KKworICAgICAgIC8qIGVuYWJsZSBJTyBhbmQgbWVtIGlmIG5vdCBhbHJl
YWR5IGRvbmUgKi8KKyAgICAgICBwY2lfcmVhZF9jb25maWdfd29yZChwZCwgUENJX0NPTU1BTkQs
ICZjbWQpOworICAgICAgIGNtZCB8PSAoUENJX0NPTU1BTkRfSU8gfCBQQ0lfQ09NTUFORF9NRU1P
UlkpOworICAgICAgIHBjaV93cml0ZV9jb25maWdfd29yZChwZCwgUENJX0NPTU1BTkQsIGNtZCk7
CisKKyAgICAgICBudmlkaWFmYl9maXgubW1pb19zdGFydCA9IHBjaV9yZXNvdXJjZV9zdGFydChw
ZCwgMCk7CisgICAgICAgbnZpZGlhZmJfZml4Lm1taW9fbGVuID0gcGNpX3Jlc291cmNlX2xlbihw
ZCwgMCk7CisKKyAgICAgICBSRUdTID0gaW9yZW1hcChudmlkaWFmYl9maXgubW1pb19zdGFydCwg
bnZpZGlhZmJfZml4Lm1taW9fbGVuKTsKKyAgICAgICBpZiAoIVJFR1MpIHsKKyAgICAgICAgICAg
ICAgIHByaW50ayhLRVJOX0VSUiBQRlggImNhbm5vdCBpb3JlbWFwIE1NSU8gYmFzZVxuIik7Cisg
ICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsKKyAgICAgICB9CisKKyAgICAgICBDaGlwc2V0
ID0gbnZpZGlhX2dldF9jaGlwc2V0KHBkLCBSRUdTKTsKKyAgICAgICBBcmNoaXRlY3R1cmUgPSBu
dmlkaWFfZ2V0X2FyY2goQ2hpcHNldCk7CisgICAgICAgaWYgKEFyY2hpdGVjdHVyZSA9PSAwKSB7
CisgICAgICAgICAgICAgICBwcmludGsoS0VSTl9FUlIgUEZYICJ1bmtub3duIE5WX0FSQ0hcbiIp
OworICAgICAgICAgICAgICAgZ290byBlcnJfb3V0OworICAgICAgIH0KKwogICAgICAgIHJldCA9
IGFwZXJ0dXJlX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZGV2aWNlcyhwZCwgIm52aWRpYWZiIik7
CiAgICAgICAgaWYgKHJldCkKLSAgICAgICAgICAgICAgIHJldHVybiByZXQ7CisgICAgICAgICAg
ICAgICBnb3RvIGVycl9vdXQ7CgogICAgICAgIGluZm8gPSBmcmFtZWJ1ZmZlcl9hbGxvYyhzaXpl
b2Yoc3RydWN0IG52aWRpYV9wYXIpLCAmcGQtPmRldik7Ci0KICAgICAgICBpZiAoIWluZm8pCiAg
ICAgICAgICAgICAgICBnb3RvIGVycl9vdXQ7CgpAQCAtMTI5OCwxMSArMTMyNSw2IEBAIHN0YXRp
YyBpbnQgbnZpZGlhZmJfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkLCBjb25zdCBzdHJ1Y3QgcGNp
X2RldmljZV9pZCAqZW50KQogICAgICAgIGlmIChpbmZvLT5waXhtYXAuYWRkciA9PSBOVUxMKQog
ICAgICAgICAgICAgICAgZ290byBlcnJfb3V0X2tmcmVlOwoKLSAgICAgICBpZiAocGNpX2VuYWJs
ZV9kZXZpY2UocGQpKSB7Ci0gICAgICAgICAgICAgICBwcmludGsoS0VSTl9FUlIgUEZYICJjYW5u
b3QgZW5hYmxlIFBDSSBkZXZpY2VcbiIpOwotICAgICAgICAgICAgICAgZ290byBlcnJfb3V0X2Vu
YWJsZTsKLSAgICAgICB9Ci0KICAgICAgICBpZiAocGNpX3JlcXVlc3RfcmVnaW9ucyhwZCwgIm52
aWRpYWZiIikpIHsKICAgICAgICAgICAgICAgIHByaW50ayhLRVJOX0VSUiBQRlggImNhbm5vdCBy
ZXF1ZXN0IFBDSSByZWdpb25zXG4iKTsKICAgICAgICAgICAgICAgIGdvdG8gZXJyX291dF9lbmFi
bGU7CkBAIC0xMzE4LDM0ICsxMzQwLDE3IEBAIHN0YXRpYyBpbnQgbnZpZGlhZmJfcHJvYmUoc3Ry
dWN0IHBjaV9kZXYgKnBkLCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQogICAgICAg
IHBhci0+cGFuZWx0d2VhayA9IHBhbmVsdHdlYWs7CiAgICAgICAgcGFyLT5yZXZlcnNlX2kyYyA9
IHJldmVyc2VfaTJjOwoKLSAgICAgICAvKiBlbmFibGUgSU8gYW5kIG1lbSBpZiBub3QgYWxyZWFk
eSBkb25lICovCi0gICAgICAgcGNpX3JlYWRfY29uZmlnX3dvcmQocGQsIFBDSV9DT01NQU5ELCAm
Y21kKTsKLSAgICAgICBjbWQgfD0gKFBDSV9DT01NQU5EX0lPIHwgUENJX0NPTU1BTkRfTUVNT1JZ
KTsKLSAgICAgICBwY2lfd3JpdGVfY29uZmlnX3dvcmQocGQsIFBDSV9DT01NQU5ELCBjbWQpOwot
Ci0gICAgICAgbnZpZGlhZmJfZml4Lm1taW9fc3RhcnQgPSBwY2lfcmVzb3VyY2Vfc3RhcnQocGQs
IDApOwogICAgICAgIG52aWRpYWZiX2ZpeC5zbWVtX3N0YXJ0ID0gcGNpX3Jlc291cmNlX3N0YXJ0
KHBkLCAxKTsKLSAgICAgICBudmlkaWFmYl9maXgubW1pb19sZW4gPSBwY2lfcmVzb3VyY2VfbGVu
KHBkLCAwKTsKLQotICAgICAgIHBhci0+UkVHUyA9IGlvcmVtYXAobnZpZGlhZmJfZml4Lm1taW9f
c3RhcnQsIG52aWRpYWZiX2ZpeC5tbWlvX2xlbik7CgotICAgICAgIGlmICghcGFyLT5SRUdTKSB7
Ci0gICAgICAgICAgICAgICBwcmludGsoS0VSTl9FUlIgUEZYICJjYW5ub3QgaW9yZW1hcCBNTUlP
IGJhc2VcbiIpOwotICAgICAgICAgICAgICAgZ290byBlcnJfb3V0X2ZyZWVfYmFzZTA7Ci0gICAg
ICAgfQorICAgICAgIHBhci0+UkVHUyA9IFJFR1M7CgotICAgICAgIHBhci0+Q2hpcHNldCA9IG52
aWRpYV9nZXRfY2hpcHNldChpbmZvKTsKLSAgICAgICBwYXItPkFyY2hpdGVjdHVyZSA9IG52aWRp
YV9nZXRfYXJjaChpbmZvKTsKLQotICAgICAgIGlmIChwYXItPkFyY2hpdGVjdHVyZSA9PSAwKSB7
Ci0gICAgICAgICAgICAgICBwcmludGsoS0VSTl9FUlIgUEZYICJ1bmtub3duIE5WX0FSQ0hcbiIp
OwotICAgICAgICAgICAgICAgZ290byBlcnJfb3V0X2FyY2g7Ci0gICAgICAgfQorICAgICAgIHBh
ci0+Q2hpcHNldCA9IENoaXBzZXQ7CisgICAgICAgcGFyLT5BcmNoaXRlY3R1cmUgPSBBcmNoaXRl
Y3R1cmU7CgogICAgICAgIHNwcmludGYobnZpZGlhZmJfZml4LmlkLCAiTlYleCIsIChwZC0+ZGV2
aWNlICYgMHgwZmYwKSA+PiA0KTsKCiAgICAgICAgaWYgKE5WQ29tbW9uU2V0dXAoaW5mbykpCi0g
ICAgICAgICAgICAgICBnb3RvIGVycl9vdXRfYXJjaDsKKyAgICAgICAgICAgICAgIGdvdG8gZXJy
X291dF9mcmVlX2Jhc2UwOwoKICAgICAgICBwYXItPkZiQWRkcmVzcyA9IG52aWRpYWZiX2ZpeC5z
bWVtX3N0YXJ0OwogICAgICAgIHBhci0+RmJNYXBTaXplID0gcGFyLT5SYW1BbW91bnRLQnl0ZXMg
KiAxMDI0OwpAQCAtMTQwMSw3ICsxNDA2LDYgQEAgc3RhdGljIGludCBudmlkaWFmYl9wcm9iZShz
dHJ1Y3QgcGNpX2RldiAqcGQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpCiAgICAg
ICAgICAgICAgICBnb3RvIGVycl9vdXRfaW91bm1hcF9mYjsKICAgICAgICB9CgotCiAgICAgICAg
cHJpbnRrKEtFUk5fSU5GTyBQRlgKICAgICAgICAgICAgICAgIlBDSSBuVmlkaWEgJXMgZnJhbWVi
dWZmZXIgKCVkTUIgQCAweCVsWClcbiIsCiAgICAgICAgICAgICAgIGluZm8tPmZpeC5pZCwKQEAg
LTE0MTUsMTUgKzE0MTksMTQgQEAgc3RhdGljIGludCBudmlkaWFmYl9wcm9iZShzdHJ1Y3QgcGNp
X2RldiAqcGQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpCiBlcnJfb3V0X2ZyZWVf
YmFzZTE6CiAgICAgICAgZmJfZGVzdHJveV9tb2RlZGIoaW5mby0+bW9uc3BlY3MubW9kZWRiKTsK
ICAgICAgICBudmlkaWFfZGVsZXRlX2kyY19idXNzZXMocGFyKTsKLWVycl9vdXRfYXJjaDoKLSAg
ICAgICBpb3VubWFwKHBhci0+UkVHUyk7Ci0gZXJyX291dF9mcmVlX2Jhc2UwOgorZXJyX291dF9m
cmVlX2Jhc2UwOgogICAgICAgIHBjaV9yZWxlYXNlX3JlZ2lvbnMocGQpOwogZXJyX291dF9lbmFi
bGU6CiAgICAgICAga2ZyZWUoaW5mby0+cGl4bWFwLmFkZHIpOwogZXJyX291dF9rZnJlZToKICAg
ICAgICBmcmFtZWJ1ZmZlcl9yZWxlYXNlKGluZm8pOwogZXJyX291dDoKKyAgICAgICBpb3VubWFw
KFJFR1MpOwogICAgICAgIHJldHVybiAtRU5PREVWOwogfQoKLS0KMi4zOC4xCg==
--000000000000554ed205f403504d
Content-Type: text/x-reject; charset="US-ASCII"; name="nvidia.c.rej"
Content-Disposition: attachment; filename="nvidia.c.rej"
Content-Transfer-Encoding: base64
Content-ID: <f_ldsil8pm1>
X-Attachment-Id: f_ldsil8pm1

LS0tIGRyaXZlcnMvdmlkZW8vZmJkZXYvbnZpZGlhL252aWRpYS5jCisrKyBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L252aWRpYS9udmlkaWEuYwpAQCAtMTE5NywxNyArMTE5NywxNyBAQCBzdGF0aWMgaW50
IG52aWRpYV9zZXRfZmJpbmZvKHN0cnVjdCBmYl9pbmZvICppbmZvKQogICAgICAgIHJldHVybiBu
dmlkaWFmYl9jaGVja192YXIoJmluZm8tPnZhciwgaW5mbyk7CiB9CiAKLXN0YXRpYyB1MzIgbnZp
ZGlhX2dldF9jaGlwc2V0KHN0cnVjdCBmYl9pbmZvICppbmZvKQorc3RhdGljIHUzMiBudmlkaWFf
Z2V0X2NoaXBzZXQoc3RydWN0IHBjaV9kZXYgKnBjaV9kZXYsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHZvbGF0aWxlIHUzMiBfX2lvbWVtICpSRUdTKQogewotICAgICAgIHN0cnVjdCBu
dmlkaWFfcGFyICpwYXIgPSBpbmZvLT5wYXI7Ci0gICAgICAgdTMyIGlkID0gKHBhci0+cGNpX2Rl
di0+dmVuZG9yIDw8IDE2KSB8IHBhci0+cGNpX2Rldi0+ZGV2aWNlOworICAgICAgIHUzMiBpZCA9
IChwY2lfZGV2LT52ZW5kb3IgPDwgMTYpIHwgcGNpX2Rldi0+ZGV2aWNlOwogCiAgICAgICAgcHJp
bnRrKEtFUk5fSU5GTyBQRlggIkRldmljZSBJRDogJXggXG4iLCBpZCk7CiAKICAgICAgICBpZiAo
KGlkICYgMHhmZmYwKSA9PSAweDAwZjAgfHwKICAgICAgICAgICAgKGlkICYgMHhmZmYwKSA9PSAw
eDAyZTApIHsKICAgICAgICAgICAgICAgIC8qIHBjaS1lICovCi0gICAgICAgICAgICAgICBpZCA9
IE5WX1JEMzIocGFyLT5SRUdTLCAweDE4MDApOworICAgICAgICAgICAgICAgaWQgPSBOVl9SRDMy
KFJFR1MsIDB4MTgwMCk7CiAKICAgICAgICAgICAgICAgIGlmICgoaWQgJiAweDAwMDBmZmZmKSA9
PSAweDAwMDAxMERFKQogICAgICAgICAgICAgICAgICAgICAgICBpZCA9IDB4MTBERTAwMDAgfCAo
aWQgPj4gMTYpOwpAQCAtMTIyMCwxMiArMTIyMCwxMSBAQCBzdGF0aWMgdTMyIG52aWRpYV9nZXRf
Y2hpcHNldChzdHJ1Y3QgZmJfaW5mbyAqaW5mbykKICAgICAgICByZXR1cm4gaWQ7CiB9CiAKLXN0
YXRpYyB1MzIgbnZpZGlhX2dldF9hcmNoKHN0cnVjdCBmYl9pbmZvICppbmZvKQorc3RhdGljIHUz
MiBudmlkaWFfZ2V0X2FyY2godTMyIENoaXBzZXQpCiB7Ci0gICAgICAgc3RydWN0IG52aWRpYV9w
YXIgKnBhciA9IGluZm8tPnBhcjsKICAgICAgICB1MzIgYXJjaCA9IDA7CiAKLSAgICAgICBzd2l0
Y2ggKHBhci0+Q2hpcHNldCAmIDB4MGZmMCkgeworICAgICAgIHN3aXRjaCAoQ2hpcHNldCAmIDB4
MGZmMCkgewogICAgICAgIGNhc2UgMHgwMTAwOiAgICAgICAgICAgIC8qIEdlRm9yY2UgMjU2ICov
CiAgICAgICAgY2FzZSAweDAxMTA6ICAgICAgICAgICAgLyogR2VGb3JjZTIgTVggKi8KICAgICAg
ICBjYXNlIDB4MDE1MDogICAgICAgICAgICAvKiBHZUZvcmNlMiAqLwpAQCAtMTI3OCwxNiArMTI3
Nyw0NCBAQCBzdGF0aWMgaW50IG52aWRpYWZiX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZCwgY29u
c3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkKICAgICAgICBzdHJ1Y3QgZmJfaW5mbyAqaW5m
bzsKICAgICAgICB1bnNpZ25lZCBzaG9ydCBjbWQ7CiAgICAgICAgaW50IHJldDsKKyAgICAgICB2
b2xhdGlsZSB1MzIgX19pb21lbSAqUkVHUzsKKyAgICAgICBpbnQgQ2hpcHNldDsKKyAgICAgICB1
MzIgQXJjaGl0ZWN0dXJlOwogCiAgICAgICAgTlZUUkFDRV9FTlRFUigpOwogICAgICAgIGFzc2Vy
dChwZCAhPSBOVUxMKTsKIAorICAgICAgIGlmIChwY2lfZW5hYmxlX2RldmljZShwZCkpIHsKKyAg
ICAgICAgICAgICAgIHByaW50ayhLRVJOX0VSUiBQRlggImNhbm5vdCBlbmFibGUgUENJIGRldmlj
ZVxuIik7CisgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsKKyAgICAgICB9CisKKyAgICAg
ICAvKiBlbmFibGUgSU8gYW5kIG1lbSBpZiBub3QgYWxyZWFkeSBkb25lICovCisgICAgICAgcGNp
X3JlYWRfY29uZmlnX3dvcmQocGQsIFBDSV9DT01NQU5ELCAmY21kKTsKKyAgICAgICBjbWQgfD0g
KFBDSV9DT01NQU5EX0lPIHwgUENJX0NPTU1BTkRfTUVNT1JZKTsKKyAgICAgICBwY2lfd3JpdGVf
Y29uZmlnX3dvcmQocGQsIFBDSV9DT01NQU5ELCBjbWQpOworCisgICAgICAgbnZpZGlhZmJfZml4
Lm1taW9fc3RhcnQgPSBwY2lfcmVzb3VyY2Vfc3RhcnQocGQsIDApOworICAgICAgIG52aWRpYWZi
X2ZpeC5tbWlvX2xlbiA9IHBjaV9yZXNvdXJjZV9sZW4ocGQsIDApOworCisgICAgICAgUkVHUyA9
IGlvcmVtYXAobnZpZGlhZmJfZml4Lm1taW9fc3RhcnQsIG52aWRpYWZiX2ZpeC5tbWlvX2xlbik7
CisgICAgICAgaWYgKCFSRUdTKSB7CisgICAgICAgICAgICAgICBwcmludGsoS0VSTl9FUlIgUEZY
ICJjYW5ub3QgaW9yZW1hcCBNTUlPIGJhc2VcbiIpOworICAgICAgICAgICAgICAgcmV0dXJuIC1F
Tk9ERVY7CisgICAgICAgfQorCisgICAgICAgQ2hpcHNldCA9IG52aWRpYV9nZXRfY2hpcHNldChw
ZCwgUkVHUyk7CisgICAgICAgQXJjaGl0ZWN0dXJlID0gbnZpZGlhX2dldF9hcmNoKENoaXBzZXQp
OworICAgICAgIGlmIChBcmNoaXRlY3R1cmUgPT0gMCkgeworICAgICAgICAgICAgICAgcHJpbnRr
KEtFUk5fRVJSIFBGWCAidW5rbm93biBOVl9BUkNIXG4iKTsKKyAgICAgICAgICAgICAgIGdvdG8g
ZXJyX291dDsKKyAgICAgICB9CisKICAgICAgICByZXQgPSBhcGVydHVyZV9yZW1vdmVfY29uZmxp
Y3RpbmdfcGNpX2RldmljZXMocGQsICJudmlkaWFmYiIpOwogICAgICAgIGlmIChyZXQpCi0gICAg
ICAgICAgICAgICByZXR1cm4gcmV0OworICAgICAgICAgICAgICAgZ290byBlcnJfb3V0OwogCiAg
ICAgICAgaW5mbyA9IGZyYW1lYnVmZmVyX2FsbG9jKHNpemVvZihzdHJ1Y3QgbnZpZGlhX3Bhciks
ICZwZC0+ZGV2KTsKLQogICAgICAgIGlmICghaW5mbykKICAgICAgICAgICAgICAgIGdvdG8gZXJy
X291dDsKIApAQCAtMTI5OCwxMSArMTMyNSw2IEBAIHN0YXRpYyBpbnQgbnZpZGlhZmJfcHJvYmUo
c3RydWN0IHBjaV9kZXYgKnBkLCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQogICAg
ICAgIGlmIChpbmZvLT5waXhtYXAuYWRkciA9PSBOVUxMKQogICAgICAgICAgICAgICAgZ290byBl
cnJfb3V0X2tmcmVlOwogCi0gICAgICAgaWYgKHBjaV9lbmFibGVfZGV2aWNlKHBkKSkgewotICAg
ICAgICAgICAgICAgcHJpbnRrKEtFUk5fRVJSIFBGWCAiY2Fubm90IGVuYWJsZSBQQ0kgZGV2aWNl
XG4iKTsKLSAgICAgICAgICAgICAgIGdvdG8gZXJyX291dF9lbmFibGU7Ci0gICAgICAgfQotCiAg
ICAgICAgaWYgKHBjaV9yZXF1ZXN0X3JlZ2lvbnMocGQsICJudmlkaWFmYiIpKSB7CiAgICAgICAg
ICAgICAgICBwcmludGsoS0VSTl9FUlIgUEZYICJjYW5ub3QgcmVxdWVzdCBQQ0kgcmVnaW9uc1xu
Iik7CiAgICAgICAgICAgICAgICBnb3RvIGVycl9vdXRfZW5hYmxlOwpAQCAtMTMxOCwzNCArMTM0
MCwxNyBAQCBzdGF0aWMgaW50IG52aWRpYWZiX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZCwgY29u
c3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkKICAgICAgICBwYXItPnBhbmVsdHdlYWsgPSBw
YW5lbHR3ZWFrOwogICAgICAgIHBhci0+cmV2ZXJzZV9pMmMgPSByZXZlcnNlX2kyYzsKIAotICAg
ICAgIC8qIGVuYWJsZSBJTyBhbmQgbWVtIGlmIG5vdCBhbHJlYWR5IGRvbmUgKi8KLSAgICAgICBw
Y2lfcmVhZF9jb25maWdfd29yZChwZCwgUENJX0NPTU1BTkQsICZjbWQpOwotICAgICAgIGNtZCB8
PSAoUENJX0NPTU1BTkRfSU8gfCBQQ0lfQ09NTUFORF9NRU1PUlkpOwotICAgICAgIHBjaV93cml0
ZV9jb25maWdfd29yZChwZCwgUENJX0NPTU1BTkQsIGNtZCk7Ci0KLSAgICAgICBudmlkaWFmYl9m
aXgubW1pb19zdGFydCA9IHBjaV9yZXNvdXJjZV9zdGFydChwZCwgMCk7CiAgICAgICAgbnZpZGlh
ZmJfZml4LnNtZW1fc3RhcnQgPSBwY2lfcmVzb3VyY2Vfc3RhcnQocGQsIDEpOwotICAgICAgIG52
aWRpYWZiX2ZpeC5tbWlvX2xlbiA9IHBjaV9yZXNvdXJjZV9sZW4ocGQsIDApOwotCi0gICAgICAg
cGFyLT5SRUdTID0gaW9yZW1hcChudmlkaWFmYl9maXgubW1pb19zdGFydCwgbnZpZGlhZmJfZml4
Lm1taW9fbGVuKTsKIAotICAgICAgIGlmICghcGFyLT5SRUdTKSB7Ci0gICAgICAgICAgICAgICBw
cmludGsoS0VSTl9FUlIgUEZYICJjYW5ub3QgaW9yZW1hcCBNTUlPIGJhc2VcbiIpOwotICAgICAg
ICAgICAgICAgZ290byBlcnJfb3V0X2ZyZWVfYmFzZTA7Ci0gICAgICAgfQorICAgICAgIHBhci0+
UkVHUyA9IFJFR1M7CiAKLSAgICAgICBwYXItPkNoaXBzZXQgPSBudmlkaWFfZ2V0X2NoaXBzZXQo
aW5mbyk7Ci0gICAgICAgcGFyLT5BcmNoaXRlY3R1cmUgPSBudmlkaWFfZ2V0X2FyY2goaW5mbyk7
Ci0KLSAgICAgICBpZiAocGFyLT5BcmNoaXRlY3R1cmUgPT0gMCkgewotICAgICAgICAgICAgICAg
cHJpbnRrKEtFUk5fRVJSIFBGWCAidW5rbm93biBOVl9BUkNIXG4iKTsKLSAgICAgICAgICAgICAg
IGdvdG8gZXJyX291dF9hcmNoOwotICAgICAgIH0KKyAgICAgICBwYXItPkNoaXBzZXQgPSBDaGlw
c2V0OworICAgICAgIHBhci0+QXJjaGl0ZWN0dXJlID0gQXJjaGl0ZWN0dXJlOwogCiAgICAgICAg
c3ByaW50ZihudmlkaWFmYl9maXguaWQsICJOViV4IiwgKHBkLT5kZXZpY2UgJiAweDBmZjApID4+
IDQpOwogCiAgICAgICAgaWYgKE5WQ29tbW9uU2V0dXAoaW5mbykpCi0gICAgICAgICAgICAgICBn
b3RvIGVycl9vdXRfYXJjaDsKKyAgICAgICAgICAgICAgIGdvdG8gZXJyX291dF9mcmVlX2Jhc2Uw
OwogCiAgICAgICAgcGFyLT5GYkFkZHJlc3MgPSBudmlkaWFmYl9maXguc21lbV9zdGFydDsKICAg
ICAgICBwYXItPkZiTWFwU2l6ZSA9IHBhci0+UmFtQW1vdW50S0J5dGVzICogMTAyNDsKQEAgLTE0
MDEsNyArMTQwNiw2IEBAIHN0YXRpYyBpbnQgbnZpZGlhZmJfcHJvYmUoc3RydWN0IHBjaV9kZXYg
KnBkLCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQogICAgICAgICAgICAgICAgZ290
byBlcnJfb3V0X2lvdW5tYXBfZmI7CiAgICAgICAgfQogCi0KICAgICAgICBwcmludGsoS0VSTl9J
TkZPIFBGWAogICAgICAgICAgICAgICAiUENJIG5WaWRpYSAlcyBmcmFtZWJ1ZmZlciAoJWRNQiBA
IDB4JWxYKVxuIiwKICAgICAgICAgICAgICAgaW5mby0+Zml4LmlkLApAQCAtMTQxNSwxNSArMTQx
OSwxNCBAQCBzdGF0aWMgaW50IG52aWRpYWZiX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZCwgY29u
c3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkKIGVycl9vdXRfZnJlZV9iYXNlMToKICAgICAg
ICBmYl9kZXN0cm95X21vZGVkYihpbmZvLT5tb25zcGVjcy5tb2RlZGIpOwogICAgICAgIG52aWRp
YV9kZWxldGVfaTJjX2J1c3NlcyhwYXIpOwotZXJyX291dF9hcmNoOgotICAgICAgIGlvdW5tYXAo
cGFyLT5SRUdTKTsKLSBlcnJfb3V0X2ZyZWVfYmFzZTA6CitlcnJfb3V0X2ZyZWVfYmFzZTA6CiAg
ICAgICAgcGNpX3JlbGVhc2VfcmVnaW9ucyhwZCk7CiBlcnJfb3V0X2VuYWJsZToKICAgICAgICBr
ZnJlZShpbmZvLT5waXhtYXAuYWRkcik7CiBlcnJfb3V0X2tmcmVlOgogICAgICAgIGZyYW1lYnVm
ZmVyX3JlbGVhc2UoaW5mbyk7CiBlcnJfb3V0OgorICAgICAgIGlvdW5tYXAoUkVHUyk7CiAgICAg
ICAgcmV0dXJuIC1FTk9ERVY7CiB9CiAK
--000000000000554ed205f403504d--
