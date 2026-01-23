Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKczG7p8c2lowwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:50:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC3976761
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3566C10E2C5;
	Fri, 23 Jan 2026 13:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99D610E2C5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 13:50:45 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-5664848545fso92899e0c.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 05:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769176245; x=1769781045;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erKWy/OEWmr/yg9KkMYnuhF8IxKQ1EzG0rrpKtHiTIM=;
 b=ZaRIjQq96QRhgoCimKuHinRmKKNCHb8XCY36mS0EwCOcJ9dqdTwyz7lBJ2oUwgcdSZ
 Gc/Thy30wcju7pNlBlDlPkCznl/G6seUP9DqJM51T9WetCaaz2jgNP7ShaZM8EpwdOMn
 FMKuXk9SCJyhUSvwZaSggg+RDW/vaJK2/0HDB7UAYrc8DTawoZicV6o/VaZcD+h7YFRj
 MKdxcnrcvr2DRXDT+dGsywFuTaYVJx3kQ9k0ie3HxpB9Kcnmnzp50UXR6ThH6cFZuNIh
 f6Zbnom5rfeegzhxvj7DkidF4o7T8b8fm7ZwMh9kIbRrxYswC85t7eKYfGIcy6PF3ACh
 DAlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUeQ2csVVM/LNFWIIYZmWNLpZ2W6cTt+/mj1NPc8W1F87MtDf1a9IqkYgreQnHo60qMZ6hoDk9Ry4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyhXsF/ItclaJaGOmHm89ekd3tT5MfVIVsIxTZvE2usl6EW1PG
 8UhDGeoW4fkbGVeytaO9Ou2aBSpwCjJbM4AiZl5ARB8oEK+g50qmPMXelhfyD841
X-Gm-Gg: AZuq6aJMjuxWqzAbPdT7yc6uE5L3nzUJsrWTahxSJ3oUdgw9hg2aiW94WRoeGCnjE6i
 p+c7IQiA5bPdyrvkOK/JwN9q09JPrg/p8AoZI6CYZ8oV935sH11CadVTDuCsRIOJzMglfugsdf8
 Zz1d0+TYpa+vTSunBxAi8F9h096UKSFP0YfLWYIEhmbG7TsAlMP/aXywkVMPs5dJJXn43WHOK40
 j92yMD4eUHKKOmXZSNVXkmMAjPEDw56l048q8hmHrz2PU6IZTX7bikTS0uiTtfPrDQPVdoiQa6a
 bk+Ja9+Ty6UsxM0TPc4t5DyA+m3Zx9fDGDlVY25NpZlk86E5eYcRgKdKQqHAhpVQKuLWOn52iCB
 sPcKm6zQnsoYAz3TFd2RoBUxCEzGdv6XHwm4eJjeVpjtx07UiqngEthqa+kiWOo0TpdDn5I1+5k
 1hDKAiM4QDi3wmIu0ew/o/mnnZE9lsGIc8UqpuhqrlNCa+XLSj
X-Received: by 2002:a05:6122:414e:b0:566:3d24:c0b2 with SMTP id
 71dfb90a1353d-5663ebed2bamr842974e0c.21.1769176244293; 
 Fri, 23 Jan 2026 05:50:44 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5663fa632d8sm478142e0c.1.2026.01.23.05.50.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jan 2026 05:50:43 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-5f52b0728ccso857912137.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 05:50:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVnepcTMyLCEwWfVJXuZU6VQXaCPHs91g5eBWWuytRgcUmfTdsDE3OFmhQqnmANnwaT8A+5rN00B08=@lists.freedesktop.org
X-Received: by 2002:a05:6102:e07:b0:5ef:b5fc:dd48 with SMTP id
 ada2fe7eead31-5f54b994197mr835389137.9.1769176242766; Fri, 23 Jan 2026
 05:50:42 -0800 (PST)
MIME-Version: 1.0
References: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
 <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com>
In-Reply-To: <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:50:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWMh_oJFg-KtapcTDGvYWZ-hg_ZEJ2=E5Tp1apOEc8tnQ@mail.gmail.com>
X-Gm-Features: AZwV_QggHEVwIqc1kEtstmdEvFabNWQsOAWxfVgLAyebxcJ0E8lsdThbjxeQnuI
Message-ID: <CAMuHMdWMh_oJFg-KtapcTDGvYWZ-hg_ZEJ2=E5Tp1apOEc8tnQ@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: Convert to dev_pm_domain_{at,
 de}tach_list()
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Frank Binns <Frank.Binns@imgtec.com>,
 Brajesh Gupta <Brajesh.Gupta@imgtec.com>, 
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>, 
 Marek Vasut <marek.vasut@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
	FORGED_RECIPIENTS(0.00)[m:Matt.Coster@imgtec.com,m:Frank.Binns@imgtec.com,m:Brajesh.Gupta@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:marek.vasut@mailbox.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[imgtec.com,mailbox.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.030];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imgtec.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: CFC3976761
X-Rspamd-Action: no action

Hi Matt,

On Fri, 23 Jan 2026 at 14:36, Matt Coster <Matt.Coster@imgtec.com> wrote:
> On 22/01/2026 16:08, Geert Uytterhoeven wrote:
> > Call the dev_pm_domain_attach_list() and dev_pm_domain_detach_list()
> > helpers instead of open-coding multi PM Domain handling.
> >
> > This changes behavior slightly:
> >   - The new handling is also applied in case of a single PM Domain,
> >   - PM Domains are now referred to by index instead of by name, but
> >     "make dtbs_check" enforces the actual naming and ordering anyway,
> >   - There are no longer device links created between virtual domain
> >     devices, only between virtual devices and the parent device.
>
> We still need this guarantee, both at start and end of day. In the
> current implementation dev_pm_domain_attach_list() iterates forwards,
> but so does dev_pm_domain_detach_list(). Even if we changed that, I'd
> prefer not to rely on the implementation details when we can declare the
> dependencies explicitly.

Note that on R-Car, the PM Domains are nested (see e.g. r8a7795_areas[]),
so they are always (un)powered in the correct order.  But that may not
be the case in the integration on other SoCs.

> We had/have a patch (attached) kicking around internally to use the
> *_list() functions but keep the inter-domain links in place; it got held
> up by discussions as to whether we actually need those dependencies for
> the hardware to behave correctly. Your patch spurred me to run around
> the office and nag people a bit, and it seems we really do need to care
> about the ordering.

OK.

> Can you add the links back in for a V2 or I can properly send the
> attached patch instead, I don't mind either way.

Please move forward with your patch, you are the expert.
I prefer not to be blamed for any breakage ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
