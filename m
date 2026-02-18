Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4cMhDY+elWk4SwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 12:12:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1C5155CED
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 12:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCAC10E5A6;
	Wed, 18 Feb 2026 11:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6DA10E5A6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 11:12:10 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-5674d8be45eso1655102e0c.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 03:12:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771413130; x=1772017930;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qVLsxu170PB1z35uEMY8OwYn2VFsOBgEYVbP/16mc98=;
 b=K1T5dfnrIFtAX2e6cO4vQxjYk6VmqMtKc1SrF27lPlYPFTy5DZJFaIUzavRVqOYQKP
 3Umr5he/FzdTgmYQkVITlIEEJBZAPP8fj46BaZL5HjPXyJZpw9f5I/HCT9G9DXNIJZeL
 v1TdfK2/Drem3gTaLnZgJBlIazqiEo/5W43tcRfTjAU/ni2LSnnAVzksQpcdbkNmJyl+
 9dDHVQH/P04GbUf+kjx5CWQDgjwVjxO8kdmONmSKjJIHoTvGhUb7gDCn5ga4cNx1sKBh
 AeN3Uf29jJeyv5sNpMwXVS0HkuN+zO7s/6yqeID6LmfG17uYmjiDd7QAaDENBxVcUqMS
 72Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXu7X3cwZq46Fxd4LEPz4CZng4jzAGACg6r25ovVZmZOhnHZxqMX32xF4Wo+dz65yI9VficP4TGG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRECdFU2iGVnImYYQNx+BEKztH4SMnpqimQ/wSZt/mz9vonv7h
 wgU4wXVKPdj7gbUagsDnlbjNW0TyZdr8nAWHxw4fHDyqHw2PH4Iegi/rrLa3EUz2
X-Gm-Gg: AZuq6aJ8xLx8RU96ZNzgLsyMZFT+g5Px4RABBXJB2pWJLKLBoQUxguoF5gxsJBa9VlI
 Ml+dvMTHOqFHY0JRlknDl8k743X9d4+ZahTeomCY1woaG8h5N+4ei8HpRi0uQfFxwjdr/Fmx8CV
 7HQFt9I9TVraqruBTJAS+BovdKyjZBkhgF5oFMUS0Hyw2UCx01LA7NXRJeoLdHuoTvyv/Iv92Fr
 rgeKVnPQ9p3V0CVWpP8znLI4FFVuSEp2Qh92DColuUmd7WxQXLUCiTZ8jG08b2zuZ7lveMit7Er
 IASE9klllVEgj/CcomtiPRywjE7+mk0qp6DNszxzUE93LdtRXWivyQ+CKTuy4amdEqtwnAMJJeq
 iIIj68Mk8pE0MykaZ7QWUUgATU6Sz6TDBeMSYUq6q5XEKreVMaNPBQvZaQy36sbNHG0nRJYi788
 sbzGQYUwzypRhB3eK9FQBCDNVqjWKzVJh3N6nfNiKBL1MSIsdgLPhDDckX4uxZJWZXNpvj6BMJd
 ps=
X-Received: by 2002:a05:6122:20a9:b0:567:4f94:b2e4 with SMTP id
 71dfb90a1353d-568bf5c3f58mr518733e0c.11.1771413129722; 
 Wed, 18 Feb 2026 03:12:09 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5674bff1078sm11700611e0c.7.2026.02.18.03.12.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 03:12:08 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-5688c221fd3so1430410e0c.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 03:12:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWYOClWBZ8/FDxvV/F9CRI1x4HgFWjA4dRxHtxZ5dQDN30lfRtHEp+lfrgBuXvMWgjEAK7VkRlpigI=@lists.freedesktop.org
X-Received: by 2002:a05:6122:221e:b0:566:23dd:19b9 with SMTP id
 71dfb90a1353d-568bf50eee7mr565791e0c.3.1771413128203; Wed, 18 Feb 2026
 03:12:08 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
 <6854ea2b-b316-4711-b849-038d532f00c1@imgtec.com>
 <CAMuHMdUdYidx7u2FOFUmiijp-YeYaQQw_Lrj_E-BoUubuxxR_A@mail.gmail.com>
 <0256cf2b-ac62-437c-a6ee-7768e56a35fb@imgtec.com>
In-Reply-To: <0256cf2b-ac62-437c-a6ee-7768e56a35fb@imgtec.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Feb 2026 12:11:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUFS7zyvro7h_XvKrKAsK06m4WB+2nD_iYbMLYEVkxn0g@mail.gmail.com>
X-Gm-Features: AaiRm51vN2U_vJPwapu806O-QDmm3RJwGxx5l1KqCSVNurX9AILsymzNQI7z9fY
Message-ID: <CAMuHMdUFS7zyvro7h_XvKrKAsK06m4WB+2nD_iYbMLYEVkxn0g@mail.gmail.com>
Subject: Re: drm/imagination: genpd_runtime_suspend() crash
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>, 
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
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
	FORGED_RECIPIENTS(0.00)[m:Matt.Coster@imgtec.com,m:Frank.Binns@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:ulf.hansson@linaro.org,m:rafael@kernel.org,m:marek.vasut+renesas@mailbox.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imgtec.com:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 7F1C5155CED
X-Rspamd-Action: no action

Hi Matt,

On Wed, 18 Feb 2026 at 12:00, Matt Coster <Matt.Coster@imgtec.com> wrote:
> On 31/10/2025 08:43, Geert Uytterhoeven wrote:
> > On Thu, 30 Oct 2025 at 13:18, Matt Coster <Matt.Coster@imgtec.com> wrote:
> >> On 29/10/2025 14:08, Geert Uytterhoeven wrote:
> >>> While playing with the PowerVR driver on various R-Car SoCs, I ran into
> >>> a crash/race condition on Gray Hawk Single (R-Car V4M).  After adding
> >>> the GPU device node to DTS, the driver fails to probe due to lack of
> >>> suitable firmware, as expected:
> >>
> >> Thanks for the detailed report! I'll make time to look into this. Do you
> >> encounter a similar issue on other R-Car platforms, or is this exclusive
> >> to the V4M?
> >
> > Yes, I managed to trigger it on Salvator-X with R-Car M3-W, too.
> > Reproduction steps at:
> > https://lore.kernel.org/linux-renesas-soc/CAMuHMdWyKeQq31GEK+-y4BoaZFcCxJNac63S7NoocMj1cYKniw@mail.gmail.com
> >
> > renesas-drivers-2025-10-28 is available at
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/tag/?h=renesas-drivers-2025-10-28-v6.18-rc3
> > My aarch64-linux-gnu-gcc is gcc version 13.3.0 (Ubuntu 13.3.0-6ubuntu2~24.04)
>
> I've managed to get some time with a Gray Hawk board today, but I'm
> struggling to reproduce the original issue. Can you share the DTS node
> you've constructed for the GPU? The patch below contains what I put
> together based on the previous gen3 DTS changes and the V4M TRM.

Your DTS node looks fine to me.

> That said, it's not all clear sailing. I hit this error way before the
> original reported error could occur:
>
>   renesas-cpg-mssr e6150000.clock-controller: Cannot get module clock 0: -2
>
> This is emitted when attempting to dev_pm_domain_attach_by_name() for
> the first domain (A33DGA), and is reproducible on the tag mentioned
> above, as well as the master branch in renesas-drivers and drm-misc-next
> (as of this morning).

The R-Car V4M clock driver does not have the GPU clocks yet
(we haven't added them yet, as we couldn't test the GPU).
The whitespace-damaged patch below should add the clocks.

Note that to reproduce you do need the extra pr_info() calls added in
https://lore.kernel.org/linux-renesas-soc/CAMuHMdWyKeQq31GEK+-y4BoaZFcCxJNac63S7NoocMj1cYKniw@mail.gmail.com
And any R-Car board with IMG GPU should do, just make sure the GPU
node is enabled in the board DTS (it is still disabled, due to the crash).

Thanks for looking into this!

--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -158,6 +158,8 @@ static const struct cpg_core_clk
r8a779h0_core_clks[] __initconst = {
        DEF_DIV6P1("csi",       R8A779H0_CLK_CSI,       CLK_PLL5_DIV4,
 CPG_CSICKCR),
        DEF_FIXED("dsiref",     R8A779H0_CLK_DSIREF,    CLK_PLL5_DIV4,  48, 1),
        DEF_DIV6P1("dsiext",    R8A779H0_CLK_DSIEXT,    CLK_PLL5_DIV4,
 CPG_DSIEXTCKCR),
+       // FIXME programmable divider in FRQCRB
+       DEF_FIXED("zg",         R8A779H0_CLK_ZG,        CLK_PLL4_DIV2,  2, 1),
        DEF_DIV6P1("mso",       R8A779H0_CLK_MSO,       CLK_PLL5_DIV4,
 CPG_MSOCKCR),

        DEF_GEN4_SDH("sd0h",    R8A779H0_CLK_SD0H,      CLK_SDSRC,
    CPG_SD0CKCR),
@@ -171,6 +173,7 @@ static const struct cpg_core_clk
r8a779h0_core_clks[] __initconst = {
 };

 static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
+       DEF_MOD("3dge",           0,    R8A779H0_CLK_ZG),
        DEF_MOD("isp0",          16,    R8A779H0_CLK_S0D2_VIO),
        DEF_MOD("avb0:rgmii0",  211,    R8A779H0_CLK_S0D8_HSC),
        DEF_MOD("avb1:rgmii1",  212,    R8A779H0_CLK_S0D8_HSC),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
