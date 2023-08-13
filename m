Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D68477B25F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 09:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0180A10E127;
	Mon, 14 Aug 2023 07:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic312-22.consmr.mail.bf2.yahoo.com
 (sonic312-22.consmr.mail.bf2.yahoo.com [74.6.128.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328F310E04D
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Aug 2023 02:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.net; s=a2048;
 t=1691893261; bh=fWxRfNM2cND9/63P3/kXOlW7MU7xCvgf7dVrVRENZxU=;
 h=From:To:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=Rn8+3t/S7QgkNSGA40yx65x7QSLAzL9ayzxpuS4oybqq3nuKNBkP63cCKoyyJk4YgrsvNUIWxbC7HrqqtlUClgK+aip1KkTu+XAS4/awexRu/MolkZ7Do5oBMaObYAuoy7bJToi6AjIaAxbwaeaG6CN+mIkhuKtm7LPm6AgPx6YyaCwT2E3LK1dGdZWHCIr/avsO6EY2kctB5kWN4oOGyYDSZEQR/1xHS2X0TSIpNQ4byacAPMEEyj8XDRyS7mYbXIya71ESeVNedZRkvR2bQcd2SEiSfzqe3BIcCTMIaqInxEKW9qVOACYW+RnUxl341CRZ9XYBLSj3gCSuEfJ+6w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1691893261; bh=VH/c1i6ej//kAyMPCPWE7gEPxAX32HbpAbTuIIImYaU=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=qcMW2aQ0D+Odq3OrtJnL66nz8Ao25b8HvgQLC4uRCyCn+0oKhUsMjasMhSdKtJIABi/PmP8UKroQb51T+yXPJkZ1D9rMKVhv7ucDDzHvJ49WnisVB6Q7IYWqUWUfPZDrcQBbd4PyDCFakVeRT11HmuzgB0G2wQbZ4r7A2pspzpRIbsl4BDJEQwTlj1WNNf7r8Ym3NNy2m5Pn5JU1OIs5qemhHR5Omut+qjq7a5slDMO9pMSbaQKkwt2xgcVwWUMDFFVfF580KGf7/sDcMxAiDYDN28yqHOHc6WSdh0vtP/gKCYCigLBbQBsOsQgXlYlB+TPKt/Whipl++yG5tpStDw==
X-YMail-OSG: 1y4EIUgVM1mIf2bnvAx2mNKYGvNxNj_m.dCD8aG3abNwV.Tz2OYhLwI8g8Tal1J
 apIqjqBYR3Lc7Se4csUx._HmYTzlt.Zvco09A9LP0Znqfr97GqrTBeoAkOLcjfMv4.6GY620K02B
 5JNJjfu53G0iwT06EbPdDQ9TxykYENpjkUgK4YszCV2Xx8v9emVSkQfyBVKjuA60lWY7_WHsEyVB
 SokeHe1SwIF3sQDKt9b3KWBTkcZ9wzET6mt9.FOx0RP1cSV0tUUKqY.0WKPdCssuOx2FpsIjkzDh
 VkWxhyz8CZxVeqRAYszKSiTk0BH6EH2W08r2iT_qdewsfyapWRWlWmtQF9cL5A63aKwR1JnwjjKZ
 _ua3yUvo4u6VeROSLlYNuRPMkfe__dccJKK6qa75bhcllRxsV_MTHO2x8S5lc82H.h98KVLf_iow
 SvxNFqgq78Nj70_WQg2rMaK2aWindh6fQ6bAtOGPyg2CWZLYotv2JZvo7SRjx.bHESa5u.0VrSRY
 34fxRwZVjw2qWOv..7LI0Xcpa9typozY1lOYWNQqzZUyPefWa1kjkjxXhey1PjxvpmhaZZ0Y1auJ
 MHemxXo12bAiSG2a9Uv55yXo4pOjElhc5ZYUpZMWbQ_xDhC7kBvGMg6vmHZp1R09yCwGydREftIp
 9CeJmnhMl6tNYfqi4AMMmO.iakPphzwSw_RhS9q9Sx7_Y0t9pjXu329g0hEfifP95SjQTAM_ru5s
 UjPl2saGhSppTDpyTt9986IFP5NgdbMHKcNW.g_eHlnUY6YH71TDojy_JpWH.TZZwGaI9fdp3yYy
 EGM561mSEfnP7UpKYLA5sQyjJhDs5g8jBwG2brZKZoPfKR5Uxowuli_QowvDTiJ16fz1Yk7UGLVp
 uScui6fzrXSu8o72tgR4ElNj_LUTpvwtxkVTf2I0EXFxoA6kvRt9s47R8iTAqaTVpFys.xxqmipa
 VqxOBglJXut77mLfw5kFo2e7YCnKZwWPYIer_0zJgoLBP1Chlcbgbz6raTXRH.i6a11N0ya1Tpai
 3j5lEdhL24EPnb_Xks5XdawDYCkB94bNNrq04wzDxy0fFgM4Gwim2pFtba.NPsxE7LOH.o1Quf.a
 9S5GAtT2EyE7Dia5mSrTFDcJwzpkGOlp8O3PZPiXxArY9LX.4fk7aY0SUouyrueV0cVy1MNZXLj9
 0ZxyRCPZcKrUZZEO9hkJL2VzMa9hw5iNcKF_YTlROjKMa_sNploXlUiyCZGDWJVMtxBXBqSMu7ma
 JS7T3fYeWC2V2UAkpPbWeBXPkGA8ltu2YARyM8LSlRv8TKr.EkN1NkMWoL9UrlE5UzLuF3iWk4gP
 iMLphjPciYMP4CirLGPY4ArieiZHxJiPHfyoJDqVhPKG6p.UX9eaCIpfycokLbgiVPK.l0VB0GZR
 VwN5sZTcuM.lgk4cYi7LJ21Gp.JHGegYARgzfee3X6hMGPRCoL.YTLk.i2QvVex3OnoJPz5SmMfi
 zwYmCB.ss_SB71poVxrPIZscg4adOrRGVsemVTzlHmHjNB.k33qFjMFAplzejtjiAJ6CJuVau32O
 B3JrGRcCjcOXzMsHa7UX5N0UcO6Nmy05t6SZayE80sSW4boVia7NHXYyAH4nYrTWvnnNfPKOJLJg
 IZz3VMYaFP59FJo6kjylcbIDQg9kGYO3sb_9PJjWJclRZHilfRP4i0WqmAz_oSgF0fazcRANFy5w
 kixJOYhYeADDjIu.OK1t70W5EnnVUkD_s5kw9wNjfBNmsNpxX74lKfBZqMOSymGCmD_odBQJ70ZD
 RyAlZ_dP5BAVWa75kSmPABijQqDe3KINW4xP6Wesru2G4mkyYjJkCOhgsIkr2Lbd8zl.gCUcP7mw
 5KM5VcIf_gA9_k_WacaLC1LwPYnOhK714wqRYpOsyxH8yE8w4IXE3fhHd.TN.xlRrmjD2_SQm9PN
 WxiTOg4D.6xu52.nwq.bGFIZiOiq4WDG1tgd.rr2WthrMDCkv4u6MNaAjdIp9M_.JfrNez_8OMfE
 QqjiElcISVYQW2AeRsdZKdDNqVar_yUydjIpzDLTWc8peFcZ1IPH2U6LqI7_QKNcLE4e8wvl.4kk
 jY5bl1nKKrgKkIoBdsU.HDuXg_Kels2wfZTcD92cPsq.X4mYcr7JussUDnsKFsbhscP1RBrChiqq
 ZzRTZTRaa4fRfoc_71WhNGOUGIu522eJxpTyK9EmgnNZ42CQPFQiXb0b7j8EVmBVPVZJyqOv_V5z
 EdD0lHtPk5Rk1PuuYTlENt.DUREEkfdKFgYTai5KgjWdT1KaJ6ffi
X-Sonic-MF: <bluescreen_avenger@verizon.net>
X-Sonic-ID: 94b050cd-29b7-4c78-9ee5-513e71bd989c
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.bf2.yahoo.com with HTTP; Sun, 13 Aug 2023 02:21:01 +0000
Received: by hermes--production-bf1-865889d799-x5klk (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 625558f0b743f66ad7acffa31f3ac5b7; 
 Sun, 13 Aug 2023 02:20:58 +0000 (UTC)
From: nerdopolis <bluescreen_avenger@verizon.net>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [RFC][PATCH 0/2] drm/panic: Add a drm panic handler
Date: Sat, 12 Aug 2023 22:20:57 -0400
Message-ID: <3182767.5fSG56mABF@nerdopolis2>
In-Reply-To: <20230809192514.158062-1-jfalempe@redhat.com>
References: <20230809192514.158062-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailer: WebService/1.1.21695
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
X-Mailman-Approved-At: Mon, 14 Aug 2023 07:25:51 +0000
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

On Wednesday, August 9, 2023 3:17:27 PM EDT Jocelyn Falempe wrote:
> This introduces a new drm panic handler, which displays a message when a panic occurs.
> So when fbcon is disabled, you can still see a kernel panic.
> 
> This is one of the missing feature, when disabling VT/fbcon in the kernel:
> https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
> Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.
> 
> This is a proof of concept, and works only with simpledrm, using the drm_client API.
> This implementation with the drm client API, allocates new framebuffers, and looks a bit too complex to run in a panic handler.
> Maybe we should add an API to "steal" the current framebuffer instead, because in a panic handler user-space is already stopped.
> 
> To test it, make sure you're using the simpledrm driver, and trigger a panic:
> echo c > /proc/sysrq-trigger
> 
> There is one thing I don't know how to do, is to unregister the drm_panic when the graphic driver is unloaded.
> drm_client_register() says it will automatically unregister on driver unload. But then I don't know how to remove it from my linked list, and free the drm_client_dev struct.
> 
> This is a first draft, so let me know what do you think about it.
Hi, 

Oh wow, that's my post. I'm sorry about the late reply, I only saw this late yesterday, and I wanted to test it first.
I had to edit my test QEMU script a bit to use TianoCore for virtual UEFI boot as there is no gfxmode=keep for SimpleDRM to work otherwise when specifying -kernel to qemu AFAIK

I tested it, and it works! That's pretty cool, although is it possible to show the message, such as "attempted to kill init"?

I like the little ASCII Tux. Maybe an ASCII /!\ or [X] on the belly would make it more obvious to users that it is an error condition. 
Especially for non-English speaking users


I will tweak my script a bit so I can test it more quickly in the future too.

Thanks!
> 
> Best regards,
> 
> 
> 
> 
> Jocelyn Falempe (2):
>   drm/panic: Add a drm panic handler
>   drm/simpledrm: Add drm_panic support
> 
>  drivers/gpu/drm/Kconfig          |  11 ++
>  drivers/gpu/drm/Makefile         |   1 +
>  drivers/gpu/drm/drm_drv.c        |   3 +
>  drivers/gpu/drm/drm_panic.c      | 286 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tiny/simpledrm.c |   2 +
>  include/drm/drm_panic.h          |  26 +++
>  6 files changed, 329 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_panic.c
>  create mode 100644 include/drm/drm_panic.h
> 
> 
> base-commit: 6995e2de6891c724bfeb2db33d7b87775f913ad1
> 




