Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B777A308B
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 15:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C7F10E0EF;
	Sat, 16 Sep 2023 13:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic310-13.consmr.mail.bf2.yahoo.com
 (sonic310-13.consmr.mail.bf2.yahoo.com [74.6.135.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D5E10E102
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 13:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.net; s=a2048;
 t=1694869771; bh=6OJAEqxlo11CSjfjkuHZ5tKnpD3PG1s3Kd3OiXjvdlA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=ZHId/cnKmd7bDqNT/BI2ZJnFaui/3+b9ZX88vJ/e4xAoEKMREOGZBWUbbMAJg6c2OznrQupfJqrR6z3y36pyvGTKLT8dX38LOkiZc5vm13aF0K1Jng3EnQnvAL5DvB60/3tT0NygWukHiYVU7MTm+1j19QnC16JG29xMBJKgF7/RZpnES1KiVKSP7CNeRM6Aqj6K/3HHmigQ4rV1lSaB5qtqJOvDiXZqT268Hn0YKeUS8Rr8wTGu1hr5jifHAmbLXW8Pm5d7LkWln+Hd5d9jJkv6RMiSH2Vs4SHqlcxnBhje2nl6qk4hBvclLl5sj/Eui76fAbAKEbagMXcP5qIrfA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1694869771; bh=Qs9zxBOuzOqJ1uGsKO7HRenAAMkiApEycoC0IvyehLG=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=Xzd7c2xEQGw1TNAhDfGmhimnuDLTP4c2I9W/3Oaf3IGU+iSu06iQmMHn3lKJYrM/lkg++TBqoVIWVQ0BLUCza1dnN4lRTFa36Ht8COaq3CazaVW/jnu/NZjnzYw9rt6gwZI2+96168IjCclZ8YmPGy48w89o8yXvqz4Y0dIP+fJAkmpM+bIo7JW8IJz3ZPF+ITun0CmOXJ3Bt75Wrt6fAHHoUtrpDc8wQor3V2N/NdyL9JfufQ5C87glB6OWrdafaMcaIkIIueVlPOFdGNW7jfVPINU+GP3VPooAiRflMBatFfFDX8whvntLe4+1yZA/P57G/Zg7aux9rzVqoVEmDw==
X-YMail-OSG: Re04V6oVM1nByVsUDmAKnwgr.jJvuoQw4Lw2axKvb.wAwQ3Ptl3xzsK2vTUOz6.
 caODF6S_vPb1j8FFwAcq_uxV5GmJMVIVLLTFtWlcWQgkaqvqMwpcf.TzC0RfXcV4FRhMo6QbGqg4
 95uBvtzEQtrkTAyVhNxdmuMDtajQfMyHtmBGnNYwyQgO2g1nGeVYj87iNPaW4.Cpzfr1KD7Y5Fh6
 so7HlEARs9gkQg6bA4IOFSaji8RzlXtmr1A722b5jGBId.O.LQ.tFN2iTO4SGelffF512mIt41xI
 spkAaj_PgkpRT4YKDXNIIAgQue.2AS2ENexdnGg6eEF92d9Pmsao6Lir46p4w.h9Aqoge.raSfg.
 lXmGWQg_4BXktRdKxGkhE.P9.OilsCvj5LoETL5enzy3LZ3L0oGDNcQvbOybnM.qFbWcPjCV1dV9
 e6bINd_u8BUpPq.CFPW1M5wOIDNYdJVCWjtYWdb2MxxqAT1r5VC6t1wpolsDTH9QXXEw3zpH.8tP
 WhTgCaN0vk_ixtDHsh4FfBFToV0PsMzRxDBwWKgURCPF6L4MrK7a.t5nC394LRY0gPZBHz7SrD0D
 U9zOwrps51AEVcktcCgcY6AjrzIC8iLwROY1MfQ8HXOslpqhZsltu1PlDzXdiH3BJ5AEafwQnM_w
 ZH.p5mE27ubbiU9TOHhbLayRp_.meyv.QF.O5CWrdt.eSdiRTKXLhXpwL1ATgpOZ1fw4hQCy6TK6
 NSfN8L7IOdDsWwS_tncxX9h.jsHYtwZZvhDv15gKTC3FV3ZD9YEVyvJ3mS5D4dk1dIX0YM_FuQO5
 BYaOCBj3KlxcUx3cQsaUtrlYmrjAYK1rQDz0.IT82GBm83Nxkjt7X2C0ez_P_GfiDcXBQWiPiOVA
 cUewCmnJbDxQA3390UkDsHbla51bssJcbC.k.zrMzCMGR3itK2uVIgJSzV8ms1H8MAM286vgW4Vr
 N.2Qt4I89RUADw0T5K_WpFEYo3c7OJObaOGpwNyVXp4X3KfF5tAJfdSKEJCMJUoU3dWFjKYCcuGu
 zRh8zrSibGJI2W1HYvQONXAJuB75_SejIz9vS6_Elp018s62Xk4GYEwiIxQuzt8SWtvPfaSIrBUD
 sALnhnPfh19Vr2K7JKsOGI52QFdvqOn.KHNvjJ3aJaF8lg9aQa8kQo95b_GPcf4aWEwcu7PjQfwV
 pQJr0SYKSwkRDRZ_3YLraF0R.Ok1SR0S.R9PlAdumApb_bwijNm7MDEBAUtbKyj4v8Q4op2i9xGj
 lu5Az2msF4JVwSCXVA3uZuYWD7M351OITPsN88bIgj85M6usQwLmgz4UELfqYwR10.ivvS0hOh.o
 merlB0h9KaLxGNQTBDfzCQcs1nyYkfo_YjZ9nAdVPZx.sQ0_fgH8IUoSWAMQrdD2V8S_zgt1GWhe
 a_oRsafD7ljj9FEGlj4rdQjnJRMr7h0QksTeMDn.zqSqWpknLj33W0vPhRIoMYpAAVBKqBQyXrgw
 ZrFYdH.vk0wTE5dHoizotN7xlOvLxcwe0xl_AjvhDqQL8wbsO2AGLgffLk6_R1SXormZmOqWBZq0
 dQfJ30TiMZ449QtKX5PSbiqGagtQ_LZ4BBhVuKeyO0lDXNuYkE_bxESHyMnjFM6CCBGLGaFF457_
 11p1pfU0FWwEwUll.ti04wChKM1esiSUVhalsjtnsy0F2bkf0MSany6JtAP7wdgCT4.k4iMXAVTn
 REpFBMcpRpC0Djs_dtFjJZBOJE017HPEDuya8zSWkDaaVxLcL50iyn1R2L_DRHNHz9l0TKhvQ52g
 U48XBhyPod1bnGZGU8ACQk0mdkesEuix20ny0lRheWeT396ys3xzI3NLCn91Gn7rCCsVacCmU0Hi
 0awi86iGsG56aw3hYkpiYqeBMdCrEVEo7GGi.LzjzUpfCHoeP0Z9qHeaY578o03_AWY9T1Tq0c.t
 yUhoYS_EWeZydgMY2d8IWhAg2LK_uiDmbudJSy6WAByJYI97CSzQhecRbdeUHGNcBQWDZ25JGpny
 RRA8QbMNFCAYn93RlnQ1n5B3re9ZIPatirtmzWIciv62b.UVh5sxMysIGaWQnuEp9CNdvTJASb9k
 FyXlUrB0QVofPt_ptuq_XX_Mp3OZ3VIK6m3AyaiO4T37m8tpHhfsugLlihPaX5VuVZME6RwLnExi
 874NAf7XfjddjqZ2merGxc3EsOHaxYHK7FIzMErvwk_WRzSyBgwCAkDLjOdQPNu8B5CLjxTjeM7j
 BO2KkfPogbLrn1Tsxi5xt65uKLSKRpv1JTBThF4197uXeY1nt1Ms_3rZrn1g-
X-Sonic-MF: <bluescreen_avenger@verizon.net>
X-Sonic-ID: 45a6165b-12ca-4664-a7ad-ac7ab71a676a
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.bf2.yahoo.com with HTTP; Sat, 16 Sep 2023 13:09:31 +0000
Received: by hermes--production-bf1-678f64c47b-7r85z (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID ca9e3aa6f01dbd3746eadfc90478dc3e; 
 Sat, 16 Sep 2023 13:09:26 +0000 (UTC)
From: nerdopolis <bluescreen_avenger@verizon.net>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com
Subject: Re: [RFC][PATCH v2 0/2] drm/panic: Add a drm panic handler
Date: Sat, 16 Sep 2023 09:09:25 -0400
Message-ID: <6657118.e9J7NaK4W3@nerdopolis2>
In-Reply-To: <20230915083307.1185571-1-jfalempe@redhat.com>
References: <20230915083307.1185571-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailer: WebService/1.1.21797
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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

On Friday, September 15, 2023 4:28:20 AM EDT Jocelyn Falempe wrote:
> This introduces a new drm panic handler, which displays a message when a panic occurs.
> So when fbcon is disabled, you can still see a kernel panic.
> 
> This is one of the missing feature, when disabling VT/fbcon in the kernel:
> https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
> Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.
> 
> This is a proof of concept, and works only with simpledrm, using a new get_scanout_buffer() api
> 
> To test it, make sure you're using the simpledrm driver, and trigger a panic:
> echo c > /proc/sysrq-trigger
> 
This seems to work pretty good! With this one, I don't need to have Weston (or another display server) running for it to work this time.
The panic reason works, which is pretty sweet.

FYI: I do get a hunk that fails to apply in simpledrm_remove in drivers/gpu/drm/tiny/simpledrm.c
Seems to be a change in a recentish commit
https://github.com/torvalds/linux/commit/84e6da7ad5537826343636b846530ec2167d4a19

Thanks!
> v2
>  * Use get_scanout_buffer() instead of the drm client API. (Thomas Zimmermann)
>  * Add the panic reason to the panic message (Nerdopolis)
>  * Add an exclamation mark (Nerdopolis)
>  
> I didn't reuse the fbdev functions yet, that would need some fbdev refactoring, because they rely on struct fb_info, and struct vc_data (for font/console). But I still plan to at least try it for v3.
> 
> A few more though:
>  1) what about gpu with multiple monitor connected ?
> maybe get_scanout_buffer() could return a list of scanout buffers ?
>  2) I think for some GPU drivers, there might need a flush_scanout_buffer() function, that should be called after the scanout buffer has been filled ?
> 
> Best regards,
> 
> Jocelyn Falempe (2):
>   drm/panic: Add a drm panic handler
>   drm/simpledrm: Add drm_panic support
> 
>  drivers/gpu/drm/Kconfig          |  11 ++
>  drivers/gpu/drm/Makefile         |   1 +
>  drivers/gpu/drm/drm_drv.c        |   3 +
>  drivers/gpu/drm/drm_panic.c      | 270 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tiny/simpledrm.c |  17 ++
>  include/drm/drm_drv.h            |  14 ++
>  include/drm/drm_panic.h          |  41 +++++
>  7 files changed, 357 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_panic.c
>  create mode 100644 include/drm/drm_panic.h
> 
> 
> base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
> 




