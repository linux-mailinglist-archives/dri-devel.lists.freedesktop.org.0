Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIn0HG9UnGmSEAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 14:21:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5030176B7C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 14:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FB210E3A3;
	Mon, 23 Feb 2026 13:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0151A10E3A1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 13:21:47 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-5fae01e8893so2487625137.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 05:21:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771852907; x=1772457707;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x0CXl7ooZIKZBR/9WuxpQTwfG3DhRjXklstmaRrGH4A=;
 b=mnP+omTHrDz8gVLlFtu6IFLnmSmWTrnIxTXqHpi2g4Kwjcu4T1Ae4CjKcnxZtT5WZB
 aIe3oViSa4vIpKkD+TmxztbfJlHj8vOxiWdlDqZhm94RBw5uqluXsFYBuPJrXt2HLK/U
 QrSdB+YG66+M6e4cyugvAqY/AAph9eDd8tXuI7EPRh5D/LQAjDcaSyEe+vzqmCtX0ehf
 PP+B4YcsBINeMK5Rh1yEjKBVBv5+jEwGyqi9daBrwC6x9TnsjHk1nSMcvyypfRXGOmcP
 8oysqWlj1ybkZagIvcDJYO0SBMhal5M8WfSIpiYMItUelmcI/SZw64ZOneKvB4GypSqJ
 yhHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3jcvTZdNEtPSIdx8CG1ugjD3403BexzJvITp/W6AJAWv2mEQB4zivWMcm11bevxPUjs8P7Sx1Cm4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0qvtT33TBxx9MzA6ykTHtVox9GFOZMZ7Bq1Ixh5xm4jcZMgAC
 BzVf5cHw4+JpqxTNBH8cBS9YW4oIMtN4ReSCPdtp/8CUQrt9fZlwMiBaW9XzM3iU
X-Gm-Gg: AZuq6aJQKOfIRwVMt6HFjXcmjQJHZNN2eUC54ekiTwMPOHbAeRjbcjtL1HIKkyuNHbM
 UarSw68E47pgRGCV9KdFQAnvrnU5SPDqfhIUDAG5ZsNakv9992QQ9L6TB0evFGMHBwC7+G16WF0
 JpmYqJgmIagdBhwIReR2OXS0Z9XfV+PlAdmj83jkpMuCk9GejuLNxf4ZCLAeBtgRkYzKBit50Rd
 Bhs3oFhnRkiUByVrq4/7QJuOQdtrgCpyprKFNfNKPZBIHCGsVzMBuXE0Iis8maFCFVOn1bVKghp
 OEhlgEs4wfE82s9Qdj5VAtBxNHAfpCI0jWItZckiz/0+18ARZDuiBJvVCuXZaAcnJHd+ImueknP
 V/IB+tBRQ5L7Ba28rhGhiS90Ub4t7ohpsVxob/00hbVOLg+XhoAaUCW8kO3i9KFXm9w5wv67zex
 mnuZiqqPqhhY3kuctyVL5UKIsjCRseRh9ftMBQXnqDxVfie2XCcr7/P67lzrhicwC5qaBQClwdU
 6U=
X-Received: by 2002:a05:6102:a4f:b0:5f5:256d:c0cd with SMTP id
 ada2fe7eead31-5feb31340a8mr4250048137.34.1771852906773; 
 Mon, 23 Feb 2026 05:21:46 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com.
 [209.85.221.176]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5feb6485fd5sm7525953137.11.2026.02.23.05.21.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 05:21:45 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-5665171836cso5177469e0c.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 05:21:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW+zits1QKclSrYzVZ4ijUdO3c9MfDUTTtdu+ukDijZBgIz5IdSQItGUNkREOp7XbXHx2BDr0m3J0c=@lists.freedesktop.org
X-Received: by 2002:a05:6122:3306:b0:567:54cd:f258 with SMTP id
 71dfb90a1353d-568e4883762mr3858484e0c.9.1771852905007; Mon, 23 Feb 2026
 05:21:45 -0800 (PST)
MIME-Version: 1.0
References: <20260113-device-support-info-v1-0-91e5db7f7294@imgtec.com>
 <20260113-device-support-info-v1-6-91e5db7f7294@imgtec.com>
In-Reply-To: <20260113-device-support-info-v1-6-91e5db7f7294@imgtec.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Feb 2026 14:21:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXEdzgbB=3nHTyAdM_4YjGy79wbe2nb5Uh8nGs4Fd4Jdw@mail.gmail.com>
X-Gm-Features: AaiRm51wonfdpnxXafgHLkyNjFl6HLu4ultQI2-gg0aP3kgQDiY6wlG_WR4tQxI
Message-ID: <CAMuHMdXEdzgbB=3nHTyAdM_4YjGy79wbe2nb5Uh8nGs4Fd4Jdw@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/imagination: Warn or error on unsupported hardware
To: Matt Coster <matt.coster@imgtec.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Frank Binns <frank.binns@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:frank.binns@imgtec.com,m:brajesh.gupta@imgtec.com,m:alessio.belle@imgtec.com,m:alexandru.dadu@imgtec.com,m:marek.vasut+renesas@mailbox.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,imgtec.com,mailbox.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,imgtec.com:email,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D5030176B7C
X-Rspamd-Action: no action

Hi Matt,

On Tue, 13 Jan 2026 at 11:21, Matt Coster <matt.coster@imgtec.com> wrote:
> Gate the use of unsupported hardware behind a new module parameter
> (exp_hw_support).
>
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>

Thanks for your patch, which is now commit 1c21f240fbc1e47b
("drm/imagination: Warn or error on unsupported hardware")
in v7.0-rc1.

> --- a/drivers/gpu/drm/imagination/pvr_device.c
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -525,6 +525,77 @@ pvr_gpuid_decode_string(const struct pvr_device *pvr_dev,
>  }
>  EXPORT_SYMBOL_IF_KUNIT(pvr_gpuid_decode_string);
>
> +static bool pvr_exp_hw_support;
> +module_param_named(exp_hw_support, pvr_exp_hw_support, bool, 0600);
> +MODULE_PARM_DESC(exp_hw_support, "Bypass runtime checks for fully supported GPU cores. WARNING: enabling this option may result in a buggy, insecure, or otherwise unusable driver.");
> +
> +/**
> + * enum pvr_gpu_support_level - The level of support for a gpu_id in the current
> + * version of the driver.
> + *
> + * @PVR_GPU_UNKNOWN: Cores that are unknown to the driver. These may not even exist.
> + * @PVR_GPU_EXPERIMENTAL: Cores that have experimental support.
> + * @PVR_GPU_SUPPORTED: Cores that are supported and maintained.
> + */
> +enum pvr_gpu_support_level {
> +       PVR_GPU_UNKNOWN,
> +       PVR_GPU_EXPERIMENTAL,
> +       PVR_GPU_SUPPORTED,
> +};
> +
> +static enum pvr_gpu_support_level
> +pvr_gpu_support_level(const struct pvr_gpu_id *gpu_id)
> +{
> +       switch (pvr_gpu_id_to_packed_bvnc(gpu_id)) {
> +       case PVR_PACKED_BVNC(33, 15, 11, 3):
> +       case PVR_PACKED_BVNC(36, 53, 104, 796):
> +               return PVR_GPU_SUPPORTED;
> +
> +       case PVR_PACKED_BVNC(36, 52, 104, 182):
> +               return PVR_GPU_EXPERIMENTAL;
> +
> +       default:
> +               return PVR_GPU_UNKNOWN;
> +       }
> +}
> +
> +static int
> +pvr_check_gpu_supported(struct pvr_device *pvr_dev,
> +                       const struct pvr_gpu_id *gpu_id)
> +{
> +       struct drm_device *drm_dev = from_pvr_device(pvr_dev);
> +
> +       switch (pvr_gpu_support_level(gpu_id)) {
> +       case PVR_GPU_SUPPORTED:
> +               if (pvr_exp_hw_support)
> +                       drm_info(drm_dev, "Module parameter 'exp_hw_support' was set, but this hardware is fully supported by the current driver.");
> +
> +               break;
> +
> +       case PVR_GPU_EXPERIMENTAL:
> +               if (!pvr_exp_hw_support) {
> +                       drm_err(drm_dev, "Unsupported GPU! Set 'exp_hw_support' to bypass this check.");
> +                       return -ENODEV;
> +               }
> +
> +               drm_warn(drm_dev, "Running on unsupported hardware; you may encounter bugs!");
> +               break;
> +
> +       /* NOTE: This code path may indicate misbehaving hardware. */
> +       case PVR_GPU_UNKNOWN:
> +       default:
> +               if (!pvr_exp_hw_support) {
> +                       drm_err(drm_dev, "Unknown GPU! Set 'exp_hw_support' to bypass this check.");

After marking the gpu device node enabled in DTS for Renesas Salvator-X
with R-Car M3-W (as you are aware, it is still disabled upstream
because the system may crash when the firmware is not found), this
error message is triggered:

    powervr fd000000.gpu: [drm] *ERROR* Unknown GPU! Set
'exp_hw_support' to bypass this check.

and the driver fails to probe. Using the exp_hw_support flag makes
the driver probe (when the firmware is available):

    # echo 1 > /sys/module/powervr/parameters/exp_hw_support
    # echo fd000000.gpu > /sys/bus/platform/drivers/powervr/bind
    powervr fd000000.gpu: [drm] Running on unknown hardware; expect issues.
    powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.45.2.58_v1.fw
    powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)
    [drm] Initialized powervr 1.0.0 for fd000000.gpu on minor 1

I am not sure if this counts as a regression.  Given firmware is
available for this device, I'd expect it to fall (at least) in the the
PVR_GPU_EXPERIMENTAL case?

Thanks!

> +                       return -ENODEV;
> +               }
> +
> +               drm_warn(drm_dev, "Running on unknown hardware; expect issues.");
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
>  static char *pvr_gpuid_override;
>  module_param_named(gpuid, pvr_gpuid_override, charp, 0400);
>  MODULE_PARM_DESC(gpuid, "GPU ID (BVNC) to be used instead of the value read from hardware.");
> @@ -555,7 +626,7 @@ pvr_load_gpu_id(struct pvr_device *pvr_dev)
>                         return err;
>         }
>
> -       return 0;
> +       return pvr_check_gpu_supported(pvr_dev, gpu_id);
>  }
>
>  /**

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
