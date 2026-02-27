Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJuxHTZ7oWmdtgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:08:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD7F1B65CD
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3BE10E17A;
	Fri, 27 Feb 2026 11:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885F410E17A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 11:08:33 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-56a8dce7235so650193e0c.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 03:08:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772190512; x=1772795312;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sDfQnSnUgwZ0D2gaoP/+jse3qzI6E0xxpEhaImQcbyQ=;
 b=bZkmOQXXcHA6A4bGuJW97Ls5KC7knUI1IqHssZ5kh2bVU7Fk4DMc1Hsy1oII7JiuHf
 2/xJ/WhkvWZtqk2e75hW8g1RB82Yw1iODzGY/1MBDG1whUT8EsurZbW5PeiHzyzGoB9l
 tSyPlfG5pY/3klntC/Og5eIIghsPUQu3umcAYCPSNaZ0c799Za6+KimPflhutOo4DOHh
 Vhv461Gy5bxxy9lLRgr7jrDi/lOH8M/6ZvSawXZNYHu1h7ra8kNyQ+M4IwPncYQN/GXY
 wknjrENI7VWyZBbhxufwb/jG95oO9fsjnQScT0A1sqJ3b/MWAnd/iSS+dwDByvEZ1aDi
 jyqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8jP7QNYbeB6wAJ7sSONCOfmABcRyqMz2EOgcuQep3/e7KXtLGUlByxEukMogy5QtQ4WUfYiCfRoI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbYM1d19t97xemmOBWyI9gu0BSwFXf22gs7p8EhH273bkTjC76
 vrQFz/e6vkbc8h0PdtrULewiYRkE2hOf7Cb85H7mKjHbMu0JmeiUd11e0R1fHdYUtM8=
X-Gm-Gg: ATEYQzxHW2/z8oPL/UaSORF5zfEieKFV+R4Zkcv23hyAHXJafhe2BdqSgVEKarxq8wk
 jD+suJp+ReeVmgiDmIYITSMwX5BF9H2j7I0XntNcaRT/SNDwGPcWaOR0B12eeNJ9YKF6Ew3pDD5
 zfZUKui9F4r6vY1sR6Pm2w2ORYEz9nOsOc1Kp0AhdpzCc3QXIS6xsAfIo7yJx4agCJnPYAj4S3P
 vHi6Z9/U9Vk6GlYrePLXSxb3DFsNvmEm/J79ADunGEM2+oN/uvD0SDC3p2QkjdQ0/26xaqnCvmR
 J2gljWDl/a06qSLGRMHVNZ31WHhKh9gfEfa3JDzZC3i0+n5nDoO7EeShx/Ndj4R2UQQdZImDpGU
 ZtN5Qtw7YT2al+FcRSmuxmLef3Ai7VODKIzY6EXmmx2UioGFyevaNLSFKTdC6F/CNB8Qeuzw0RT
 ECLrYlq4KFYEBw6fjKehyqpQOi+sfGb4D79MAiLRvtDpt4ob394jSsfaHAwPXs
X-Received: by 2002:a05:6122:4b08:b0:566:ed4e:8320 with SMTP id
 71dfb90a1353d-56aa0a179bamr1276244e0c.2.1772190512621; 
 Fri, 27 Feb 2026 03:08:32 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56a922afe47sm5610755e0c.20.2026.02.27.03.08.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Feb 2026 03:08:29 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id
 a1e0cc1a2514c-94de664b541so550073241.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 03:08:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXB/bk0z7HO1EeD453tmZIfkIu6EsQCIl6hPGvKlQNkvUbhazssi6qKuKFWV8ypeL4MNOjO9TvG3Cs=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3746:b0:5fe:49f:e89d with SMTP id
 ada2fe7eead31-5ff3256fd36mr1144024137.36.1772190509483; Fri, 27 Feb 2026
 03:08:29 -0800 (PST)
MIME-Version: 1.0
References: <20260227015216.2721504-1-chris.brandt@renesas.com>
 <TY3PR01MB11346FB8BDCBBD83203F776FC8673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346FB8BDCBBD83203F776FC8673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 12:08:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUio47o1V4KBZyzu9zQdN5SxfRCPTmdwhV1E7EdNL-0CQ@mail.gmail.com>
X-Gm-Features: AaiRm51gHW9GETMAes2Z9ivngK3oJKl1o5FGPuNM9TjngwCQIps-FMH-5H7ZGvw
Message-ID: <CAMuHMdUio47o1V4KBZyzu9zQdN5SxfRCPTmdwhV1E7EdNL-0CQ@mail.gmail.com>
Subject: Re: [PATCH v7] drm: renesas: rz-du: mipi_dsi: Set DSI divider
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Hien Huynh <hien.huynh.px@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,hugovil.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:Chris.Brandt@renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hien.huynh.px@renesas.com,m:hugo@hugovil.com,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DCD7F1B65CD
X-Rspamd-Action: no action

Hi Biju,

On Fri, 27 Feb 2026 at 11:50, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Chris Brandt <chris.brandt@renesas.com>
> > Before the MIPI DSI clock source can be configured, the target divide ratio needs to be set.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Fixes: 5a4326f2e3b1 ("clk: renesas: rzg2l: Remove DSI clock rate restrictions")
>
> As my testing shows the above commit breaks RZ/{G2L, V2L} SMARC EVK connected to
> ADV7535. This patch has functional dependency on the above commit.
>
> Hi Maxime, Maarten Lankhorst and Thomas,
>
> Can you please apply this patch to drm-misc-fixes please as the
> display is broken on 6.19 kernel since the above Fixes commit?

s/6.19/7.0-rc1/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
