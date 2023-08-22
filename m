Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0FB7852F3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 10:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE8F10E3F4;
	Wed, 23 Aug 2023 08:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic312-21.consmr.mail.bf2.yahoo.com
 (sonic312-21.consmr.mail.bf2.yahoo.com [74.6.128.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FF310E009
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 22:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.net; s=a2048;
 t=1692743364; bh=ZSXOTKKbePMNxKpc1ILXksajs3kWfCDRe7Tdh3fcgjM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=s2kR4XK5+/hR0pOGYHlpnT44tpBEnh+7Ji9J34TvdZwaxwlTOaKX80DP0WUdwokMgEGlUtoo8tiXJGQu1t6EypSIjNMe0yaQnf/qYt1hgMIyL5CyYCbyiJ/czviXxoksXueAwiAYrcsChyByt5wLIA6z0DwE+hyBQ/xx/n7m5EuhrFRYCZ/Gd6JyH/Bw1+js7fkLV3wf+rWgqJ2zKxXgNck7iQ3ZYEbl3tlHHoEdaUtszqqc/MjPJPncvfCsO8zdrt1IEWL44TYjET/pfejWhT16Vy1NTjDeGz/XN1YvMReGNmGCKg5Eqx+4W7Ix946AN/t8/6mCW1nSTcKMuByguA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1692743364; bh=ZPmtd4suJAdXetX7yi2iQqRHgvuclykM44aMr8X4zhp=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=mEtgYVenWRlk1+idwFPrRjhuThhUtM49glblhvjxTPsLZE7SGHTuxlKK44kUw33RWT9y+bmOgBr6vFmimeq5tveyazin1rzD3GpLUlJa8LP4hY7zIIzZUPVinXwAFL8KEr4Mak/DOqhyZvqlpENCkB+pkghvKo5LJxinwj+6j7ZG0ts8lic21NCh9M18RxcWFxbe4wDkVaKzUrPPU4RdghpM8CAH3aUxN8NQZDH41a5O4ClcnuGdwJh7wszeyPzVMc/I8kdvQ587nqVwcquWZr3KMiiKT5Hy6j4s0zbkBQ2zqP1QgAOjWXFO5C4mWNoDbEV49l9PoCILyHtJmWKKXA==
X-YMail-OSG: dBXv.04VM1n0GhatAs5xxYcGWrVMu.g_dRjvZqGz9nMMI73LYB4ZpOvXuw3PJo8
 irOqAcvJk.ADMRC27PF0yvZodLKuQYma_lbXuyQZZARv2qG_udMSkTQInnKoQeDjUCJu6qU92OO6
 _2s6tTRgsI4IXdPO1.MGDf.8X7xo0z.QSW0Xid_Hb3NJL5mbeFyOxqPWMLNmWTEMYeBtWUVgtXup
 sJ3ITJUpgSF.jraM72U6ONA.6q8UtUhKmFk_eW.945AGUk0_OdTkbUfKXN5tMHIfte3VbCIGu7Yu
 Km1PHXjvSZ9jxMUaLhLWSRHtdtAV1fmsQSJ9Wd14deTPLWeEj5XRGaaM5U_e6EK.Ppw.SonMUZT5
 fA0mwKEfpHahAI3ivb1loJ4d4_u2w0XPZis7rCO2HOlUuuvlIbt.wl6rL9w2OjwSIIqrGJCCzxaa
 oDxLAOzBHhNnijVKb62Mt7v3EO2eL2Twm5qOIE1w5qWUBtlq4bMQHaQwF3v4oU5EJvYLZ.Hn10YA
 SFBGgkCDg4wctfFw0bq2JeO4G5k_RO_j1Sq7yKEEZ7Rd3B.rzk2ud5NoNbqV4Kuk2l40qNoagyWu
 3e2gkOK6P1qaEDjbCR5W4XQkJFL_pniJRaQsxbcczuvHW_0E7Kdo4K_RfQD2RinwLUg5_qSlf46h
 vqfiGgGx0T3rTt8sghEFWRR.dkqZ52fe0zMbGXRjsnBOaI_AjauB18x7gDoLtnBiafR4WAJU8P6B
 k32Zvz3LhtJahCbZhd_aek5_P8jOOGsU.ySHs9dsdN4eo5NlPYRHlQd9ErCeSTSX7WcvOBYtPBWE
 qFcck00IaihBF7XKdxunSi5ZKHI2mHFWkbwLma8fWUOTlKy7htj5Jkhoit5H61C9szY6Gc.CHsXu
 slQjLSvtzEP0aaDIpJhbdsb7ylQSPtmsQUmSSGq5QJJjR1g1ZRTykll9dEhbhgZJ3OaOo9ruXXqU
 yI6PeAQnfmqHingTvilRXvgMZ0IICjjR_5HWAIbw6kpvu6u6ofFxu5sV0ocfsNzT4Fpi_S55kYvQ
 dAW.0A7dp8_Pr_Tr_6r5D.xzee30p4Mf3YHubtyBkrYdh6xW.24IrFfUponBUbi1L6dUDNIy6omy
 IEmqlIRygzdzHrbSXyyrRZDfwlUbHSxSDyJroVUc3W3WSYSLmZorhdHuWbIG0uSTaaocShIUF1xg
 gkV.8tbHhk.5GjXfInmUaPShJrbujsYe48eJbSYvNPiodEiMrTEleNv_pAtbRl5iUcZ8ojEW4qyM
 uNZmmVsLSVh5vXeEu6yEJpKUvJi6Fs9VlodzZDPrXlxhUOET6aMuOyZkpD9h0QAyodqIRv3x6u_l
 V8HayXlNniMx0VypyQrpngMz8LoOW23NeLe81riReOJ6IjL3_JUKWVx3I7cQC5VYDU8Jn2gvHjuY
 hsxf0VNLVZiMxw2rufMFYDRmI9uz2qFfhbsjW2ilunouL.FagqKdTw_NzhT8uJV_Y9unuGS1VuTG
 .kSVpOmWPBhmK1JFbFJQuLsatC1H5sgWe2tSHprrf0TnnP7YdRFPtHioxbaU5HXKGsaAoVghWeHx
 zm1sxVi9Vfhgk3run210NkBcZ5JhJCfRqzprixrpYFY.Aj5svyxY35Tu6unEEnF3lcz_I5_ejJTd
 EegIcSnkJlco5cd5XcmSTnZcZUz3cXgm_wBLBEl93hY7jXPksQW5jibzcBIAcHS5LxNAOYbv.80T
 HJBaRzGhz1TvN8J8Xxi.WmKKbd9IdSKAM6FKxiCp.d2zoOjQooc8QFlohTW6nt0wH2LvgZFWlJoQ
 57bEqKW4NkqGrvdUuraRYPfEelFW62IbSa5_0hLj0YQHlZeUDehmrMKNa4_Irck4Z8h_H87iG3Cg
 SScNJZiQaXYxV5nxBkMdwWMdkYk_Jc4pMKFSH57DGjhDcs1y2Oq5CufN01LUadI_z3ycosy22FZM
 Z1iVr34TwO7L4ZOjYUpTi4_gJJxfEjflnZzrIvffwaJbGYNyRm3Lwj_QUqjIHIKqbb7OlpEsekMs
 WNYIxZDTATDKinGI1ZgBMPCA2Algtl16dViOs89IFw.Bw77jJRmmAQeLM38BiTW8vxfgQhEF.s1C
 6kfardMwaAG9cOS61yvb_1MPCxCPa_4fCzYT42N1eEY.Ydtp8gz033l3hwWPMmjIvhLcHc8OVD15
 Ghx5HYMCKasCKAaK4TGI2UyR1ANxWJCob1Y4QsN38ERYHKC.pGI4Cp2qw5T.0sTO2XN6tZT18_T9
 YZHxMCHIUrUtEGZwn1ULM_hwefUNVT367f3Lyo09sWGCpolY2yEvees2rSA--
X-Sonic-MF: <bluescreen_avenger@verizon.net>
X-Sonic-ID: 99ee7f54-07c1-44d6-87f8-307052500595
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.bf2.yahoo.com with HTTP; Tue, 22 Aug 2023 22:29:24 +0000
Received: by hermes--production-bf1-865889d799-r6v2w (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 1b75b73b52003e977c1f67c7ce867d61; 
 Tue, 22 Aug 2023 22:29:20 +0000 (UTC)
From: nerdopolis <bluescreen_avenger@verizon.net>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com
Subject: Re: [RFC][PATCH 0/2] drm/panic: Add a drm panic handler
Date: Tue, 22 Aug 2023 18:29:20 -0400
Message-ID: <7004990.aeNJFYEL58@nerdopolis2>
In-Reply-To: <d37338e6-94cb-0005-3a0c-4bdfcb87141f@redhat.com>
References: <20230809192514.158062-1-jfalempe@redhat.com>
 <3182767.5fSG56mABF@nerdopolis2>
 <d37338e6-94cb-0005-3a0c-4bdfcb87141f@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailer: WebService/1.1.21732
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
X-Mailman-Approved-At: Wed, 23 Aug 2023 08:45:37 +0000
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, August 21, 2023 9:34:52 AM EDT Jocelyn Falempe wrote:
> On 13/08/2023 04:20, nerdopolis wrote:
> > On Wednesday, August 9, 2023 3:17:27 PM EDT Jocelyn Falempe wrote:
> >> This introduces a new drm panic handler, which displays a message when a panic occurs.
> >> So when fbcon is disabled, you can still see a kernel panic.
> >>
> >> This is one of the missing feature, when disabling VT/fbcon in the kernel:
> >> https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
> >> Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.
> >>
> >> This is a proof of concept, and works only with simpledrm, using the drm_client API.
> >> This implementation with the drm client API, allocates new framebuffers, and looks a bit too complex to run in a panic handler.
> >> Maybe we should add an API to "steal" the current framebuffer instead, because in a panic handler user-space is already stopped.
> >>
> >> To test it, make sure you're using the simpledrm driver, and trigger a panic:
> >> echo c > /proc/sysrq-trigger
> >>
> >> There is one thing I don't know how to do, is to unregister the drm_panic when the graphic driver is unloaded.
> >> drm_client_register() says it will automatically unregister on driver unload. But then I don't know how to remove it from my linked list, and free the drm_client_dev struct.
> >>
> >> This is a first draft, so let me know what do you think about it.
> > Hi,
> > 
> > Oh wow, that's my post. I'm sorry about the late reply, I only saw this late yesterday, and I wanted to test it first.
> > I had to edit my test QEMU script a bit to use TianoCore for virtual UEFI boot as there is no gfxmode=keep for SimpleDRM to work otherwise when specifying -kernel to qemu AFAIK
> > 
> > I tested it, and it works! That's pretty cool, although is it possible to show the message, such as "attempted to kill init"?
> 
> Thanks for taking time to test it. Yes it's possible to show the panic 
> reason, as it's a parameter in the panic callback.
> > 
> > I like the little ASCII Tux. Maybe an ASCII /!\ or [X] on the belly would make it more obvious to users that it is an error condition.
> > Especially for non-English speaking users
> 
> That's a good idea. It's also probably possible to re-use the tux boot 
> logo, but I didn't try it yet.
> 
> But currently, my priority is to see if it can get accepted, and if it 
> can work with a wide range of drivers.
> 
Alright, that makes sense. I don't have a huge variety of hardware, but I have a udl (displaylink 2) device that can be tested once ready
> > 
> > 
> > I will tweak my script a bit so I can test it more quickly in the future too.
> 
> 
> Best Regards,
> 
> > 
> > Thanks!
> >>
> >> Best regards,
> >>
> >>
> >>
> >>
> >> Jocelyn Falempe (2):
> >>    drm/panic: Add a drm panic handler
> >>    drm/simpledrm: Add drm_panic support
> >>
> >>   drivers/gpu/drm/Kconfig          |  11 ++
> >>   drivers/gpu/drm/Makefile         |   1 +
> >>   drivers/gpu/drm/drm_drv.c        |   3 +
> >>   drivers/gpu/drm/drm_panic.c      | 286 +++++++++++++++++++++++++++++++
> >>   drivers/gpu/drm/tiny/simpledrm.c |   2 +
> >>   include/drm/drm_panic.h          |  26 +++
> >>   6 files changed, 329 insertions(+)
> >>   create mode 100644 drivers/gpu/drm/drm_panic.c
> >>   create mode 100644 include/drm/drm_panic.h
> >>
> >>
> >> base-commit: 6995e2de6891c724bfeb2db33d7b87775f913ad1
> >>
> > 
> > 
> > 
> > 
> 
> 
> 




