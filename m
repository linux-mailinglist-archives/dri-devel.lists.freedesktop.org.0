Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2B2jJXpRoWkBsQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 09:10:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FD91B446A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 09:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E2810EA52;
	Fri, 27 Feb 2026 08:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B09B10EA52
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 08:10:29 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-94dd6f452f0so1344103241.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 00:10:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772179828; x=1772784628;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hS+Nq6fE9ANsMccogrQUTDz/b1EfY+/VnApqIp7Qs5A=;
 b=jTdL3+MqrSiD6L9k8bOVTyf8ZX9eEhbpuv/Qcfp2850iQ0qY/qX+/zQb+BVu5EwnML
 aGnX0S6QtoCEOnTUXPXMmlyaB94XZRd87Z9sprzu2SlbM11nVprzBa0zwdLwOGPxNg3t
 Qg9L1p1xva90iZUN0NuBYBMoAlIT+qvYKXFamgFS+Z2fpgGfWU9aqkRA+DuMqRZL1gVp
 KwD36vWgO8VNIEtZnT4Y0CaPvPbWxx2seF9HrB49JukqiuJaAZvTHWIM7dClO01ZRCQq
 MblWuL0ijJYOh+rYBuxuKgBTBUYr1fqAfBKV15+viJZehypQN5KY6OxFjZFClFGDlTYv
 hXiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAWUVXtU0mZBOVz3OJB50I3juN7D5PAoWcaiM7IhkOQwsbF4I7UR8GlCRmOTfvGFshb1fpm3U0nt8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPOkDWlEjh/Gc3aYR5JpAZtGU0l03WfVVzHp31wAQjmkCOplxY
 D8mUZe7vcKeesJ7WIHUNC3jwUU5rXq0NG08kWICU67dXApMx7/bankHfNCovu8jEssI=
X-Gm-Gg: ATEYQzzILWgz/AXS6tkCJAZnwAhId+CF/mFru3FCl/UTBKrzZo/WD04iHXqJgqCVd4O
 k7jmcTeuRMuoB9T6Hs0q9TpLP70vFLpZAA4WR6hRXEZD+7SMmmPSzOP8ixc4W1Q6wL1Jf3rgI++
 r0LvI/zSHbNyBvg/FptKpkBthm2HW0ZtfX+kxVZbKJr9Qnk0MUX1TCjL8KiIPop6tWRZO5NOolh
 G0qfUAo7CcjP5Z40L+w/Bwcvpmr0Lp2IAxYkOQrqjyZXbkVFm03rW8WgsJCWEiMphly20d3Pvu+
 biRYXyY7ZrseCAeQchRjxHRJubyr1fUh5v6zT8z8D5LUP6s5HA/qMhirPDLkxXyMMrC9xBWP7H8
 hSyOAwfn/mDiKEGidsg+TSQ7UfwZnH7+Hr44WcoIVux87/m3lxSMVXv9ITE+rHckkv/XHDDbMgF
 JLTb6JAOuy+61glufbZQrBqakgVG5W1up/tuZXgEhQOQayhAlAzLI0G+ykGXtZ
X-Received: by 2002:a05:6102:292c:b0:5f8:e54c:2f72 with SMTP id
 ada2fe7eead31-5ff324b0ac7mr1250165137.20.1772179828182; 
 Fri, 27 Feb 2026 00:10:28 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-94df641e133sm3897099241.5.2026.02.27.00.10.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Feb 2026 00:10:26 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-94dd06a96easo1267729241.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 00:10:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXvP0haMZsrJ3Eua7DNH7KlzNNE84a8NDQ0AqpjJ8skFKqJbxBV0uLREd+k7b6QneuWG/BDrCGJlLM=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3f0b:b0:5f5:256d:c0cd with SMTP id
 ada2fe7eead31-5ff3252a602mr1351611137.34.1772179825969; Fri, 27 Feb 2026
 00:10:25 -0800 (PST)
MIME-Version: 1.0
References: <20260123-pm-domain-attach-list-v1-1-d51dd7e43253@imgtec.com>
 <c353fdef-9ccd-4a11-a527-ab4a792d8e70@sirena.org.uk>
In-Reply-To: <c353fdef-9ccd-4a11-a527-ab4a792d8e70@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 09:10:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5aNzuK2a05y+hPsQubc5EEL4-HWuogwPk4PKJZUm9kQ@mail.gmail.com>
X-Gm-Features: AaiRm51dht9shWvn_cyhMi2zpTdQ1R6tDUZPQSQmlY_CJ2Avf6OMEpTOhy9cyhA
Message-ID: <CAMuHMdU5aNzuK2a05y+hPsQubc5EEL4-HWuogwPk4PKJZUm9kQ@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: Use dev_pm_domain_attach_list()
To: Mark Brown <broonie@kernel.org>
Cc: Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Frank Binns <frank.binns@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
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
X-Spamd-Result: default: False [-0.61 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:frank.binns@imgtec.com,m:brajesh.gupta@imgtec.com,m:alessio.belle@imgtec.com,m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 01FD91B446A
X-Rspamd-Action: no action

Hi Mark,

On Thu, 26 Feb 2026 at 18:24, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Jan 23, 2026 at 02:44:50PM +0000, Matt Coster wrote:
> > This helper handles the attaching and linking of the entire list of power
> > domains. Besides making pvr_power_domains_init() simpler, this also lays
> > the groundwork to simplify supporting the varied power domain names used in
> > Volcanic GPU cores.
>
> I'm seeing oopses in -next on at least k3-am625-verdin-wifi-mallow which
> bisect to this patch.  We get:
>
> [   10.820056] powervr fd00000.gpu: Direct firmware load for powervr/rogue_33.15.11.3_v1.fw failed with error -2
> [   10.831903] powervr fd00000.gpu: [drm] *ERROR* failed to load firmware powervr/rogue_33.15.11.3_v1.fw (err=-2)
> ...
> [   10.844023] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000018
> ...
> [   11.090162] Call trace:
> [   11.092600]  pvr_power_domains_fini+0x18/0xa0 [powervr] (P)
> [   11.098218]  pvr_probe+0x100/0x14c [powervr]
> [   11.102505]  platform_probe+0x5c/0xa4
>
> which does seem relevant to the changed code.
>
> Full log:
>
>    https://lava.sirena.org.uk/scheduler/job/2499326#L865
>
> bisect log (with links to additional runtime logs):

> # first bad commit: [e19cc5ab347e3cdcc21c97ea5d11af8da7f1358d] drm/imagination: Use dev_pm_domain_attach_list()

Thanks for your report!

I can confirm this crash on e.g. R-Car H3 ES2.0 (after adding a
GPU node).  Actually I had seen it earlier this week, but didn't pay
enough attention.  Hence  I just assumed it was the known race condition
when removing multiple PM Domains, and thus missed it is a new bug.

The issue is that pvr_power->domains is a NULL pointer, thus causing
a crash when dereferencing that pointer:

    int i = (int)pvr_power->domains->num_pds - 1;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
