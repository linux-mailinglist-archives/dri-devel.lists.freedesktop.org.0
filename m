Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0002D931EEF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 04:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5506A10E557;
	Tue, 16 Jul 2024 02:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=verizon.net header.i=@verizon.net header.b="jLIkCWQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic317-27.consmr.mail.bf2.yahoo.com
 (sonic317-27.consmr.mail.bf2.yahoo.com [74.6.129.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F76A10E557
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 02:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.net; s=a2048;
 t=1721097485; bh=eMi9qQ2ZLq9P7wuDenacbGK/gLNdguG1TKqanH8blEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=jLIkCWQUrdk2uAy64ayo1ytiQQMg4lYSiaL6YWiyDA5uxKUuHIixOe13Pl83vA3sSz5RZ0kamigzc4iSYChfARPAPP//OkeAsepA6W4MULdqPI+cMaQ6xFLWp5eA7k3F5fly3SewuoMK36fCYb+BCgJxg3Qr0sRXJM+fOhNvaV3Shyspa8dteBx3ZZ0hNSNn2W6rwnr5Zm2P0umOkxvBWDPoX8zfrbChlqKH5rzUOeOFg60SorvKvNmphuoNz+ZfvPzJYffSmXFSP5iEidUdSadyhXAVEQ+6S5Lj/j1cNomsI8n97NOieJIFgX8PtpVArdCZt+Cvfr6Cb90YwVISMQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1721097485; bh=BXd3sTopWW/L+pZ41oxhMzuKjrdCUrN9U2fTDnlIQIj=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=jEuSmBV/7cIY3SOxL0A8nuSqTmcdNohFG5hhL4PMbqC5KI5ELA15wJ+m/Wnugll/ZLCMDDPf0/Mou1lcNrSEQ8vcuPPTjam0WBGwJPBJqGHzDrUJjQQluT2j3evGDHmw6KaTa0Ewi1ISWyy58VBN/FFPR9bctK0M/FV4StmCYQ62rDRB6GEgdzh7WjHd/zMGC+VLH4Vw+K3pxcchjNKU4tlITJa24AagZuniQGIsw2nGC2K9Bu5m5F3wF84peJKYSmtsfVUUqEH+lBfLTWyDgl86s4Zp2vXokrMLzwc9Nrsgj1HEmOF3tT31a3n5S0+XNvpBbzukdnm7m9P/P9bh4g==
X-YMail-OSG: l1GtpZ4VM1lCHHYJWyRPF2UnuNblBj4xHLa.V3xwf8FYuBqkZS8bzt2OoYVXtzj
 coaYDmY7EljFLEE4hP_0pZsRnwdv.L9IUtZmR1tPcg3E0yE.puCg4cjK9G15hcJe6YUeOWiXkvDt
 _a.ZCM7td2e6cRHqd8Hw2kHD5v8qi2gPTdw71nVLB1SCmpj3GiNbi6ZfzrMWzxUcHEhqfNAApaAa
 YLoR4B.9E3J5PY6Ye0pICjkMiltrW6EhAeSLauO6savQ8rfn9.jmea5U5OsEwBm4PDLpVvb70_UT
 DJn51h8VvpCuEIeVM8VuysbW014E_ERPk7FjO4aiJFhuGn69qL8kfPtQBqfo07ckkWLGYravE8EI
 xI78V6.g2Yvdad_DZMze7u6.s8kb7rKDJ09TlbjkcDR5nZTOZ8qEOCazkrkJFlm8oUheWSvcGCfM
 TIJCkFJQ3iHXWt5d1_Nl8QtE.Q5leBqs0fHFBcc210YD7Zeaz2dGzRuNZYu8J5pgFQh4dDI34GmG
 rbDzDZTBmlJ3ThQR5AznA2I4NWwNZ7SbG_wQzz7JslSQvmJZajoaSfwE0MBa8BKQXN64Rt.IVVKQ
 XMM2XbbBZmVt6hsjMcoOuitNUsnmlziIzVRW4e94M7B4KLnus4FebwbDSvKPubVAiiTLaubMiYY1
 lJ3BHNxiH.yQlUt1BmW0hK2X1F7mCfw_KEZuZh9r4bDQT2WGr0JtuF6oNC99GNebb.cuOPMNgOvT
 C7jPagaegOuhJl9Fx0igL75jY4BcGXrF3iMlSa4tXG1mFqy2Sstw0XbTB.4YEyduCJ_6u2UTJfyi
 I6PD00tD4uTFEJhTvQZpuqlDNoWqjEwIDwpIKzmsGYqhYW987NN491jJyn9qZAJmwPTQFS3zk4xd
 .xkR49M76SkBYSTYMU3ahR4.IEZbrO4Bl5.LQvz3bCBwmte69BdxJYaIZhRxARDzrK0b95Gkmkvy
 EYyhvCgiJc6Ywtyif1olks5RAWO.uHO1GLqTKmI9flGQC6Zeei99tKz8ASdCH_J6qzskYt8giYBz
 Gv2oAntjRWKTm0F27YbeVFYKBYEk.fIg7pfOhTfZf3b9WjDiptcZ4O9WOlFulhnDfqmOTCFyEpn8
 dwuvjTuxvdxtWt_8f7ArhCIEhHLjqIHNTbe_lO_G2Pj3X3Y529TKcd88myX_uZ3MH1yM.tJ1DaZc
 2ekPqU7U9J1.PQfNE8VInVk2yrt.5CBytAuQWLQwJOXlXoRoHiwFZC2fAbINT2HuVn2gSvv90kKw
 OnGXcZuDppAiMi80hxviByDN9ut3XZt1OqG8yYKeRylEO.2uZXH.iLzgFDUDMNLxtPpwZSQsQnga
 jycSq0MHgB1CbqIePTtLn4NebdVebPaAJMZtye85Z6a5LRsEAxrj9FDOa3.ETJsf7aVjlR62Jqsj
 aM6Eb3DHfPCJpUZadAOAr_lSlO0CZ6DU1CNxRbkmhljJ8RtCn8lXbK5VpLVe598Vwkw9Wbj80m1U
 6ROON0TP9b.OF6dv8pxjjyZqoadnCFjIviiSxZQKD7wsnXY_t.cxYOT87._bHVNcpOoTFSoyEr.J
 wAOb2v_eGiN5tIm1k42rgL4Rhlc7CGi8TxqH4i4mElREj4ZK1msmSApzx.Bo0.Rontj.xvepJevy
 .CuSXaw8KyFYsEn16t91SI7yYkoV5InFPwezx49GJW2WCVIwqESIX3qf6MyyP7.A1u4cVpI3RVfh
 6p1xe6FrHwd1aYEG6HcezB5FTBKY0Hi5xuZTkH4PB1JOlFu5OowFHBIVTmHImYhyltDtWsLMoPYu
 FmN8MsEixvgMWvpwx7EPSYb.3DXNkYIi_D_CXj61nWbIIT5ZcoTRAs5hKEXHqoBhkAXCrveAXdgc
 IBRu.Uopx8Tn6LOEYf79XQc6y9bHFJFtsi6GwOfJV2KQLS32K5q0ELvponEu1ZrF.N8zqzOFUcrn
 DF1RxguP9tgHjVwgE0G.PDpWHrfFVhRDxN235QW4o8GBv7URWh4QBM234hRSshr914k1mzySUNon
 PYefrkGHQ7Y0MQ311T7hxNuaUtWzxc8E5FOkAho846Kt.pcTJyp4tEkLogc1MWf5_oZJwwghCKbk
 rWR.CtB3IbVcocWrXxgTytHlSkFri9VoBvuUbZJEiu2T4t_N4CD2HDfXS3aOjyoYJXJjrnvLHf60
 J1SATnDJLxi75qVV6k4kplMzNCam0vIrz3l9lRq05eWpmPvZ5t01UXYWb7pjJvFCxy783Po8zCDP
 RZfo7cup7JRRAlp9Tk9UqdBjCDyEVgVcjGhG1T5KijRMFHDEskcgazqUV2.82x_SnafP1kdl3ago
 9o9u9hg--
X-Sonic-MF: <bluescreen_avenger@verizon.net>
X-Sonic-ID: ad97cc5f-03ca-42b0-a8af-78bacf2c8d5e
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.bf2.yahoo.com with HTTP; Tue, 16 Jul 2024 02:38:05 +0000
Received: by hermes--production-bf1-7bd4f49c5c-mmp69 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 03529fb2798258868d5c925062dfbf5f; 
 Tue, 16 Jul 2024 02:38:02 +0000 (UTC)
From: nerdopolis <bluescreen_avenger@verizon.net>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/panic: depends on !VT_CONSOLE
Date: Mon, 15 Jul 2024 22:38:00 -0400
Message-ID: <46533171.fMDQidcC6G@nerdopolis2>
In-Reply-To: <20240613154041.325964-1-jfalempe@redhat.com>
References: <20240613154041.325964-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailer: WebService/1.1.22501
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, June 13, 2024 11:40:16 AM EDT Jocelyn Falempe wrote:
> The race condition between fbcon and drm_panic can only occurs if
> VT_CONSOLE is set. So update drm_panic dependency accordingly.
> This will make it easier for Linux distributions to enable drm_panic
> by disabling VT_CONSOLE, and keeping fbcon terminal.
> The only drawback is that fbcon won't display the boot kmsg, so it
> should rely on userspace to do that.
> At least plymouth already handle this case with
> https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/224
Hi

An FYI, seeing this and https://fedoraproject.org/wiki/Changes/EnableDrmPanic ,
there is a slight issue with CONFIG_VT_CONSOLE=n in relation to systemd that
was recently discovered outside of virt-manager VMs, (or computers that have no
devices connected to the first serial port)

This was seen on a full CONFIG_VT=n kernel, but it also happens on kernels
with just CONFIG_VT_CONSOLE disabled.

When /dev/console is /dev/ttyS0 (as that is the new default without the VT
console, and /dev/ttyS0 is not connected to anything, isatty()'s TCGETS ioctl
on /dev/console results in an input output error, causing isatty() to return
false. Because of this, systemd's status logging then rejects /dev/console as
not being a terminal device, and rejects writing status output to it, resulting
in a decrease of verbosity available to Plymouth.

It at first did not show up in my testing, because all my virt-manager and qemu
VMs had serial devices attached, which would cause isatty() to return true on 
/dev/ttyS0 backed /dev/console, but now I have raised this with linux-serial.

Thanks
> 
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index a9df94291622..f5c989aed7e9 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -107,7 +107,7 @@ config DRM_KMS_HELPER
>  
>  config DRM_PANIC
>  	bool "Display a user-friendly message when a kernel panic occurs"
> -	depends on DRM && !FRAMEBUFFER_CONSOLE
> +	depends on DRM && !(FRAMEBUFFER_CONSOLE && VT_CONSOLE)
>  	select DRM_KMS_HELPER
>  	select FONT_SUPPORT
>  	help
> 
> base-commit: 2bae076f3e35234e42bd7c90acd8caae8368ba90
> 




