Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BF64A39B4
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jan 2022 22:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CEF113B9B;
	Sun, 30 Jan 2022 21:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33842113B9B
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 21:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643576814;
 bh=qSVMf7chVzMagzN/bacdMfHBC86sKSIqr4jBC0qTajU=;
 h=X-UI-Sender-Class:Date:To:From:Subject;
 b=Udp1Exmia+qZE4zi3IZ055ESP7CgAmGVCK+W+XlNYCIiZWpHCOL/16SmcA8dLUJZz
 yBsGLf2ITkkxOSpE4dXqCuEygUr1NRNhOsikSK7Wya9BVhDT7rSOGxNSXCWl5bdZOS
 2gVTOAwKdtYwIm2fhkPe5rq3+9buHIe6VDgx35S0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.133.128]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ml6qC-1mXCHQ3Wsm-00lUnD; Sun, 30
 Jan 2022 22:06:54 +0100
Message-ID: <e1e5b7d1-ea09-6e28-9c39-45b983734a85@gmx.de>
Date: Sun, 30 Jan 2022 22:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: linux-fbdev@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Subject: fbdev git tree update
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Dcux0DNKKNw6RIKgK0IHtd3G0/ad1L27Ms5kiww8liz2M8DuaxX
 7pCa6KoAJADYin9fwfvrk2h6tVjJhI92CCbN6Ddjy+flCZsttJJWkV9q6kFByPeF3huGbKS
 hUFo8zvAOm99b7rNDJk1sudRuHlPt1r6MKhQiLGJkz+Uvtfw29v5Qg9WZrEg8X6dltHin/P
 IFrTbcdoxUn3sRBiW0nbA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LJiB3E+4EJ4=:jHpckpb1vPDxfjVFpb9KGJ
 IjhX+4Ce37eVrMC397SvTdY4dehAeS7SnQBjEkzl9ubMHTEbUHcZe5j72IjvsoB2lR1NrGzN4
 B/An5DKbuN1mVNQHALdy70TyvbRTo1acIItLTytrksa5cjAsivQv+vwoyo41XO3TCZDBBhyHm
 RZuNtwnblO3mzAq8+42h0Uq3P4/wia4iEDVqdDpdBZsebAfIYqslKSkpAdjiY8zaJXTMwOk/p
 VC1E9wn+QFm05A1OHbSpA3owH5Uj7OgTODLp/15rok8bEvNILQGAgVx7+gSXmExpKPEyFfPeO
 Nmi8xasX0ZNfBp+dIf0NE36u3Hc77B6xGO5CUoF+mjQ3FoEdD735Z6EQ7iI+YfYV8u8OweCmy
 5LIxVIr18kwZnJ3haKJjRugfE2hRtwPO0INwif80OmbZ7M/Z1MK9gl99Ho8EuATrAoaqudRf8
 rTq37tUEfCx9xwdxYLTmA/4xFgcys+rm16jb8j7WECdjmChqeHS3ZmBIRnirbihnWxEkds6QJ
 CMrW4QE398eg3HOYvQpXdN9PCxsTvp4HCnBmNwnjZqhe4r6rIs0reMtNm1Dv52j9IRTqt1sCY
 HpOaoyl+VpdHe3W+EWPJOdQS2TOovlJWceufF3diafAPmcxqs1Q94r/xJOIe1ptoLsKtu2Z5B
 VOHcxIN1thjH0EsAO79RXaZrbuCLjWj4iphK0IVZwpCiRUZ9INcc2sKi70LHDGwRiRqpCQx6S
 OZQtVPVnHy+eMCONAg7+KHjuImCuVXP8egAZcE4z+xfu+EdH1SC9EkM7su4G3sJzD0Fmngvbq
 YgNBqZfbefbfiuCwkgeFowlc4yaY+hOAadL/KJ98PxMaBjWykeSIzKtc2GKcZL6TdzqMkmL1J
 nxrjLbZ57WKvWEccDdIyp773XWt43LZ3bD46oK9BrDz7zGO9K6MaXA9jEvw1YuutKh4fAoCWS
 nuDoO9D1vYaOvPNQyKH6A5g9gs6/OG9kZpA8q/Rn5ksSIvWVMIFCnrDB6cyaS0a4QJVa+AfUP
 7m4uFiH3GyTuK1Mh9wOTITZt8CennGGTTF8nKvBtq/5L/lf6SAPe5vJJ/Q5EsfJ245vfMp74J
 FmnLL/1Tio3lLQ=
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

Hello DRI and fbdev developers,

I've now mostly checked all queued-up patches on the fbdev mailing list:
https://patchwork.kernel.org/project/linux-fbdev/list/

and applied the ones which seemed appropriate.
IMHO there is nothing really critical/important/conflicting in there.
Shortlog is below, the git "fbdev for-next" branch is here:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/log/?h=for-next

If you see critical things in there or want me to drop (or add) something,
just please let me know.
If everything goes well I plan to send a pull request when the
merge window for kernel v5.18 opens.

Helge

----------------------------------------------------------------
Arnd Bergmann (1):
      agp: define proper stubs for empty helpers

Cai Huoqing (11):
      video: fbdev: au1200fb: Make use of dma_mmap_coherent()
      video: fbdev: omapfb: panel-lgphilips-lb035q02: Make use of the helper function dev_err_probe()
      video: fbdev: omapfb: lcd_ams_delta: Make use of the helper function dev_err_probe()
      video: fbdev: omapfb: panel-sharp-ls037v7dw01: Make use of the helper function dev_err_probe()
      video: fbdev: omapfb: panel-tpo-td043mtea1: Make use of the helper function dev_err_probe()
      video: fbdev: da8xx-fb: Make use of the helper function dev_err_probe()
      video: fbdev: pxa168fb: Make use of the helper function dev_err_probe()
      video: fbdev: pxa3xx-gcu: Make use of the helper function dev_err_probe()
      video: fbdev: ssd1307fb: Make use of the helper function dev_err_probe()
      video: fbdev: s3c-fb: Make use of the helper function dev_err_probe()
      video: fbdev: mmp: Make use of the helper function dev_err_probe()

Changcheng Deng (1):
      video: fbmem: use swap() to make code cleaner in fb_rotate_logo()

Chunyang Zhong (1):
      video: fbdev: ocfb: add const to of_device_id

Colin Ian King (6):
      video: fbdev: aty128fb: make some arrays static const
      video: fbdev: mb862xx: remove redundant assignment to pointer ptr
      video: fbdev: via: Fix spelling mistake "bellow" -> "below"
      video: fbdev: atyfb: Remove assigned but never used variable statements
      video: fbdev: asiliantfb: remove redundant assignment to variable Ftarget
      video: fbdev: pxa168fb: Initialize pointers with NULL and not plain integer 0

Dan Carpenter (3):
      video: fbdev: savagefb: make a variable local
      video: fbdev: atmel_lcdfb: fix an error code in atmel_lcdfb_probe()
      video: fbdev: fbcvt.c: fix printing in fb_cvt_print_name()

Evgeny Novikov (1):
      video: fbdev: w100fb: Reset global state

George Kennedy (1):
      video: fbdev: cirrusfb: check pixclock to avoid divide by zero

Greg Kroah-Hartman (1):
      video: fbdev: omapfb: use default_groups in kobj_type

Jiasheng Jiang (1):
      video: fbdev: imxfb: Check for null res pointer

Krzysztof Kozlowski (1):
      video: fbdev: s3c-fb: drop unneeded MODULE_ALIAS

Luca Weiss (2):
      backlight: qcom-wled: Add PM6150L compatible
      dt-bindings: simple-framebuffer: allow standalone compatible

Minghao Chi (1):
      video: fbdev: mach64_ct: remove redundant res variable

Tim Gardner (1):
      video: fbdev: nvidiafb: Use strscpy() to prevent buffer overflow

Wang Hai (1):
      video: fbdev: smscufx: Fix null-ptr-deref in ufx_usb_probe()

Xu Wang (2):
      backlight: lm3630a_bl: Remove redundant 'flush_workqueue()' calls
      video: fbdev: omapfb: Remove redundant 'flush_workqueue()' calls

Yang Guang (2):
      video: fbdev: sis: use swap() to make code cleaner
      video: fbdev: omapfb: acx565akm: replace snprintf with sysfs_emit

YueHaibing (1):
      video: fbdev: controlfb: Fix COMPILE_TEST build

Z. Liu (1):
      video: fbdev: matroxfb: set maxvram of vbG200eW to the same as vbG200 to avoid black screen
