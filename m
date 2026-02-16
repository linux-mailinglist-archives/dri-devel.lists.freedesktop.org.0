Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DsLJNLckmlvzQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 10:01:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5B8141C8B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 10:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0D210E20D;
	Mon, 16 Feb 2026 09:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A5210E227
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 09:01:02 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id
 71dfb90a1353d-5673fd077b4so1315167e0c.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 01:01:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771232462; x=1771837262;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kge8JOhnejw0JLwZ79trJtM/bgRZ8RfiXwLb+ldmjbA=;
 b=kKCz0hhd+cunzyV1ON48tlTLa2+xxETg2azBgnEmAoB1RC/us7OQPUYHoYfJTGP+kV
 o0HeI2DMiiDMt8ChgArvvsvb4Gn1CRlmDps4i6g2aDJIAWntzImNi5UbcCXqDhFK9S7A
 viVBb3kIED/gCbzF7LDcBSos3w2jC5ar8a6xTlGPNuwJ+mK8KPGMp3NZN0vWwaKnWmel
 /wsDahePAqel30JOsmeA6iNEVZ2aOkgICN5L6DYUkdQ3rroZLtHVG+J4LEHEdBLSxi5w
 EANVx6Bdx2XRrElOxyRVCfW5Z+rN77TPchobTBagEcJPZPr+e4ux2tpuUcnwtK1aYfQx
 /rKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSfWrjxaauPh+amlvGJu7L4Ggg/V6EU+WvzRmJXvJIBpW5OPIb4xXvh9MyVS6HRlA+n5cjyHBeVBA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvM8oMOj/G1oDH0Xa1jUujrz5Q9SBw+kafc0I/PqXCyGyvs+W1
 MyOSjyk+/QVCM1d2Mtk2Tw6JOE0aDvDFpcM6NV5FfIpyl1cZlf6gZesrc/OQ3wp/
X-Gm-Gg: AZuq6aJ0hjR7+63v9dw/qqW0D7FSOFZbN2KJEyFfWLmJX7m+/Fu6FG910b+aEzivHaw
 vRCCtHdc0rF0PMOFp1tN8qT1d1pnznsHAXyTmGeBzgFG22CCCvQOGTiKQaXV1Wsfbiilp/x2nlx
 Pm/08sWv0z6+MVrHYduAKFin5zha8fVpV91xACbKRF2frX0GAuNPl/fjXS643/wV7gZSl2u7rJO
 zIGz2eGrT37SgBwkqhqMfXQ7Yb9QJFkmTIVXkfnVy+T8gX3VNCwRyGUsST9rTPlAoQvQNcma8kk
 20ae+o8Xhx7MB7ihmnsQ2AXULjMWFkGV+IQfzTcdw16XwOSpBlY7hmncj43BqwPzLo+SSdRpyM+
 xDBdhqVGnZif4vnr1s3GkGc2w2gR5OW6iAlM9E6o1pfGPj1j2Mwz4XL5yM1YncpiZmLlh8nJZgt
 kArBkq9agkT4SbeTUAC02ZqBj7mTGMKLQYrbvHeykzNxj7GvqyCxTNCWKHPpGr
X-Received: by 2002:a05:6122:4d84:b0:566:2711:d8ab with SMTP id
 71dfb90a1353d-567681c18ecmr3277382e0c.6.1771232461518; 
 Mon, 16 Feb 2026 01:01:01 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5674bfc973asm7173298e0c.2.2026.02.16.01.01.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 01:01:01 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-948ab1c79ebso786598241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 01:01:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCULQG5abGR8oo2YAOprxinnKDxWnIYZ/mu9UAW8o/GtqzxBEojF+eMvy982VfbDJbj7Cefey/bBrbY=@lists.freedesktop.org
X-Received: by 2002:a05:6102:2913:b0:5f5:2638:9f3f with SMTP id
 ada2fe7eead31-5fe16c0367amr3303732137.8.1771232460393; Mon, 16 Feb 2026
 01:01:00 -0800 (PST)
MIME-Version: 1.0
References: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
 <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com>
 <CAMuHMdWMh_oJFg-KtapcTDGvYWZ-hg_ZEJ2=E5Tp1apOEc8tnQ@mail.gmail.com>
 <b3b4f10e-1222-44f7-b308-db7199c67147@mailbox.org>
 <3e0def93-2f6c-4bcf-8ee5-bf607f2ca382@imgtec.com>
 <f5d3dde6-edec-42f4-93cb-459c8677245a@mailbox.org>
 <f82b7734-6ddc-4029-b38d-147e9a1de021@leemhuis.info>
 <fcf5ab75-029e-469e-8b2a-51fa5c2a2374@mailbox.org>
 <95fd3f52-c3ed-40c5-920f-11e8767f701d@leemhuis.info>
In-Reply-To: <95fd3f52-c3ed-40c5-920f-11e8767f701d@leemhuis.info>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Feb 2026 10:00:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-g+3kTaG6Ost4iHo1Tdi_H=qscLBkBRWuR+6DG5c=SA@mail.gmail.com>
X-Gm-Features: AaiRm52WVbXjwZzPHyB6pXVlpVbl_Xj9ZkKfZnmmR7eryStWwzhYeOW7DeWViQM
Message-ID: <CAMuHMdV-g+3kTaG6Ost4iHo1Tdi_H=qscLBkBRWuR+6DG5c=SA@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: Convert to dev_pm_domain_{at,
 de}tach_list()
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Marek Vasut <marek.vasut@mailbox.org>, Matt Coster <Matt.Coster@imgtec.com>,
 Frank Binns <Frank.Binns@imgtec.com>, Brajesh Gupta <Brajesh.Gupta@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
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
	FORGED_RECIPIENTS(0.00)[m:regressions@leemhuis.info,m:marek.vasut@mailbox.org,m:Matt.Coster@imgtec.com,m:Frank.Binns@imgtec.com,m:Brajesh.Gupta@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[mailbox.org,imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,leemhuis.info:email,imgtec.com:email]
X-Rspamd-Queue-Id: EA5B8141C8B
X-Rspamd-Action: no action

Hi Thorsten,

On Sat, 14 Feb 2026 at 13:38, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
> On 2/13/26 23:52, Marek Vasut wrote:
> > On 2/12/26 4:56 PM, Thorsten Leemhuis wrote:
> >> On 2/12/26 15:38, Marek Vasut wrote:
> >>> On 2/12/26 10:00 AM, Matt Coster wrote:
> >>>> On 11/02/2026 19:17, Marek Vasut wrote:
> >>>>> On 1/23/26 2:50 PM, Geert Uytterhoeven wrote:
> >>>>>> On Fri, 23 Jan 2026 at 14:36, Matt Coster <Matt.Coster@imgtec.com>
> >>>>>> wrote:
> >>>>>>> On 22/01/2026 16:08, Geert Uytterhoeven wrote:
> >>>>>>>> Call the dev_pm_domain_attach_list() and
> >>>>>>>> dev_pm_domain_detach_list()
> >>>>>>>> helpers instead of open-coding multi PM Domain handling.
> >>>>>>>>
> >>>>>>>> This changes behavior slightly:
> >>>>>>>>      - The new handling is also applied in case of a single PM
> >>>>>>>> Domain,
> >>>>>>>>      - PM Domains are now referred to by index instead of by
> >>>>>>>> name, but
> >>>>>>>>        "make dtbs_check" enforces the actual naming and ordering
> >>>>>>>> anyway,
> >>>>>>>>      - There are no longer device links created between virtual
> >>>>>>>> domain
> >>>>>>>>        devices, only between virtual devices and the parent device.
> >>>>>>>
> >>>>>>> We still need this guarantee, both at start and end of day. In the
> >>>>>>> current implementation dev_pm_domain_attach_list() iterates
> >>>>>>> forwards,
> >>>>>>> but so does dev_pm_domain_detach_list(). Even if we changed that,
> >>>>>>> I'd
> >>>>>>> prefer not to rely on the implementation details when we can
> >>>>>>> declare the
> >>>>>>> dependencies explicitly.
> >>>>>>
> >>>>>> Note that on R-Car, the PM Domains are nested (see e.g.
> >>>>>> r8a7795_areas[]),
> >>>>>> so they are always (un)powered in the correct order.  But that may
> >>>>>> not
> >>>>>> be the case in the integration on other SoCs.
> >>>>>>
> >>>>>>> We had/have a patch (attached) kicking around internally to use the
> >>>>>>> *_list() functions but keep the inter-domain links in place; it got
> >>>>>>> held
> >>>>>>> up by discussions as to whether we actually need those dependencies
> >>>>>>> for
> >>>>>>> the hardware to behave correctly. Your patch spurred me to run
> >>>>>>> around
> >>>>>>> the office and nag people a bit, and it seems we really do need to
> >>>>>>> care
> >>>>>>> about the ordering.
> >>>>>>
> >>>>>> OK.
> >>>>>>
> >>>>>>> Can you add the links back in for a V2 or I can properly send the
> >>>>>>> attached patch instead, I don't mind either way.
> >>>>>>
> >>>>>> Please move forward with your patch, you are the expert.
> >>>>>> I prefer not to be blamed for any breakage ;-)
> >>>>>
> >>>>> Has there been any progress on fixing this kernel crash ?
> >>>>>
> >>>>> There are already two proposed solutions, but no fix is upstream.
> >>>>
> >>>> Yes and no. Our patch to use dev_pm_domain_attach_list() has landed in
> >>>> drm-misc-next as commit e19cc5ab347e3 ("drm/imagination: Use>>
> >>>> dev_pm_domain_attach_list()"), but this does not fix the underlying
> >>>> issue of missing synchronization in the PM core[1] is still unresolved
> >>>> as far as I'm aware.
> >>>
> >>> OK, but the pvr driver can currently easily crash the kernel on boot if
> >>> firmware is missing, so that should be fixed soon, right ?
> >>
> >> Well, drm-misc-next afaik means that the above mentioned fix would only
> >> be merged in 7.1, which is ~4 months away, which is not really "soon"
> >> I'd say. Or did I misjudge this?
> >
> > The PM domain issue here crashes the kernel, so I think this would be
> > material for drm-misc-fixes .
>
> Yeah, sounds a lot like it.
>
> >>> I added the regressions list onto CC, because this seems like a problem
> >>> worth tracking.
> >>
> >> Noticed that and wondered what change caused the regression.
> >
> > I think this one:
> >
> > 330e76d31697 ("drm/imagination: Add power domain control")
>
> Thx; FWIW, that was merged for v6.16-rc1.
>
> >> Did not
> >> find a answer in a quick search on lore[1]. Because if it's a
> >> regression, we maybe should just revert the culprit for now according to
> >> Linus:
> >> https://lore.kernel.org/lkml/CAHk-=wi86AosXs66-
> >> yi54+mpQjPu0upxB8ZAfG+LsMyJmcuMSA@mail.gmail.com/
> >>
> >> [1] I guess this was the initial report from Geert?
> >> https://lore.kernel.org/all/
> >> CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com/
> >
> > It is.
> >
> > I think there are other SoCs which depend on the power domain commit, so
> > revert is not so clear cut anymore.
>
> Well, it's a judgement call. 330e76d31697 was merged less then a year
> ago, so I'd not be surprised at all if Linus would revert it in a case
> like this. But it seems it doesn't revert clearly anymore, which
> complicates things.
>
> > But SoCs which have hierarchical
> > power domains and which manage to probe this driver without having a
> > firmware available for the GPU will simply end with crashed kernel,
> > which is really not good.
>
> Does the patch Matt mentioned fix the crash? His "this does not fix the
> underlying issue [...]" (see quote earlier) makes it sound like the
> crash or some other problem (theoretical or practical? regression or
> not?) remains. If that's the case and no quick fix in sight I guess it
> would be best if someone affected could post a revert and then we can
> ask Linus if he wants to pick it up.

I don't think that patch would fix the crash.  The Adreno and Panfrost
GPU drivers do similar things (explicit multi-PM Domain handling),
so I am wondering if the issue can be triggered with them too (e.g. on
unbind).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
