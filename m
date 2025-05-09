Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E869EAB23A5
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 13:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B826910E0DF;
	Sat, 10 May 2025 11:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=att.net header.i=@att.net header.b="OBb962fV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic314-23.consmr.mail.ne1.yahoo.com
 (sonic314-23.consmr.mail.ne1.yahoo.com [66.163.189.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03E110EA43
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 13:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1746797966; bh=ADmfeXbYVrDzo/rDXY++W/kzpel6AyNdpSR2cnvzbrE=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From:Subject:Reply-To;
 b=OBb962fV59hAR6O6eDXAxNSOJ4Kq+QivSA7yiWU6kPRrjPbhzNofe2rSgnzskFPNR+WBjaO8YSBY0lpA5sGa2b0WdyJgWgfWTRpLZAejSxbw4E2HoGSuTDTQinWxsjDPYjo88Koxsd3qXqaKo67Y9etjOj5NvLw8jIw1LXNCX1c=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1746797966; bh=I9EoVNqvMyKBD+pwvaLDg+XogrgtnZxmmaYbpEB/7uF=;
 h=X-Sonic-MF:Date:From:Subject:To:From:Subject;
 b=owhmv4g952urCg/CeEEPmD4p2cWBJ4bE+tx5Iv3mBAZA1wuQC50Yn0dk1Z6x4EBSQW98kzZhoJQ8tfWh4uuxogNXWIdsQ4aILv4MP5Ye8x9WYbqzqeARK7zKekW/8jBn7afcmJPUR2FCpOgonSPjeOw0sfZMSaiodqy6r3zvv9xjR5IEjj1EZAG8g+umxXtg94EE8yqbiAWDhZE5M2zmWSTuaCXZAMaFREPQZjTGe541ty/8SNCBi1w8vekSXK2iuw7ecQ8hwdas3C0JFDmwDwhAVhA2AFallGr/1sZpwYSwm87cEm5O9p++UdPGkHdymIwXK6EKVVkw8k1vHgqJGg==
X-YMail-OSG: UMy7_HAVM1nP1jJKVUfKSATPwLlxyXbjdCqqETxwj2ha7Ug2swiO8e1Rc61gTAp
 zkfyhAPQIpH0DgCBndY4jdNepwbURrQtoEVEvxrPRTpGrULNll6A2U5AdaviNiyCsRZuFzCCLTx7
 ZGHCuycseGGJ.KEQPBPeKo12io4HiIftiHXIFAnYC2Q0lEek7QELLI8x7xZBHsCYPkNUdm4O_jqe
 1MbA7.quHvLmBuDUKfUorVGP52uDHLIWGUQ2GhreICsV7z0wBC_TT2rdR7jPJInZ73GQkfUq4iVw
 WhXCa8Fa6eiIEkYftQiwON440MXVOMJR8g.nUZx1IAuUwgYdC6hogOGHPD80EMlWG9E8Aj64NKRJ
 ZQGlupDxCqpJ6_P1eHKK1cVf8QQ4op0EzVlZ5wGlTXx33U1w.yziulli3Ru99PYjMMRg_udHUQMT
 smkoImYjSe6IRoqxYOsICRsGmtAX3A8lXZqYp8QXieb24vi23YV9lsyv_z_1bInXowx.w9l75CGq
 K_CcgfAWU7RRMCyWG8_ayPCXii6oNlaZ1EN8s1V6F4RBPyz_sphBT0J7.4lgNmSOQp2n61t69fcG
 DPyZyskZG1OGzbLEG1bOhpw79tKuHYQ1lCy_NPgm1VJYwlMjeEFDp53jlbRim4bcAPlJ6h9qCrJD
 H0PRzCWxXCo2tbDQOAgsHgw_cn7d9F4yQN2Z2fPrl0MsZ231naHZn6.zFS4yNU3l41wQ0R0aYwXf
 11Kg35OQe7XM.22UqhPNN..YFHa_fGjuIf45Orc2OdQRn1IRgoEj0KGdNu0I14.tdS79Eyfe6_rG
 E9ZirCqIRiIQAm7J2bXhd5o.u8CrbLvieC_.YdjCRFOVFYw7FPFfmCOJQfA3qRw_WAQL9VfgyoNg
 bnizYs_biOy96GpVp8EDjzH925KgI9hZR2kfcNwOBslZFMoZ.FHO4Q71Lr0TopL.3hGO9NtcPaCG
 kvoX_uwV8N4_yTyjJ0qPHO49k7T9089cLVb.1fcV5Bb7F2ehrnx2fep8mt_tE.e7PxljYUwQeJBN
 d_gOri4raoYJXps19LTcsVga.BZPHZ2Fdykw5AiK.YZBDePu6nh9Q4Sk4EOPmTmuQFOw8ABvXlnR
 lRHVchbArM0SL46M_08cwNCwyXRsElaN85ZSmXz6ub9gnXXS1CfeWI7785uhz7vDG08ILsgQvfwA
 tymuI2uSJjo.kllpnhbkqMij.O11EELwQKrwNHkRQ6y7wEkhA.QAvf3UamIrWBZuaLolPqBgqe6I
 Jto8RQNgtXTRIMuL.75FCx3BjFAKH5fef1uYmp6HNn3RDhD18b_Pq_lOd1DtvPk4UZLiL6oxeFP4
 iAMKccvaAn4h8PgO.rXvcaacTK7GGXT_4fDH3nf5hlL4KAvE1ut_Qyg1MTlTVHJieCy8VjSsV79X
 P3yKeheJUF2eHf2XIXKErMnGuf3uf1nq8_iublaaYhREvx9RF0pistU1cqxgRxHIvDjOs.Fda4Ms
 vZLLROAMnNIYWovh1mB6e8JT0nIkZb3nS8kMGCu.s9vD0Kdv1qNfxro5v7Odu59CYi5be1NmKHue
 70bkf0QEP4NwoBFveeJgVU9POoHEC8iEBB01euGLbtcYRa1MsGg567jqGZuQWUkBWnwv1O56PCgr
 8oMX_30R1CHHz1eZSLIAxfnhFbhjhOcTuxa8obsdeMZ4cvf2F0iG5lIrjZCVf_E7QOrh8fa_GIzK
 9lIXcU5zVkyslU3M53GHwNh1F0x5GTHlSCcKbFIJz5p0RbqD4NkBt47gZOwvCr0xLgfVQmBbdmUY
 Xrb9b_JBeAAa_0t1ZNQWXR__0En4VGWGHvlmcI5oxZo0rh_rEVQnkt4Z08zgmDFI_UV09gZMMsiW
 T5xqgu4ho46YS3lXvbMIO6g7YPWL8N3mXw9J4vOG7oHrV_59C6P.27eVgSmtEAXQsomcyJn5UYn8
 wgGXzHA1IzNRGe5dDTgSngEv9JrzR2jDzhvB2eOm5ROTi_XvLRcY_sIHlUtjSvzheAHO31kLwlof
 2zsEURw9peWY0zFFRIhRsvMx9mg7n7an5XnKB0pOEbXcNhSM_WVTwAk3pnPLdO25UvKnSvYU8TLr
 ioOF7Vu4.ut34JEnPN_cU4LnWKEWq8k3w_1YdB8z7nAaTjUrHG3smFx4b9kM.Bc8oQrUA2PucTj_
 kru5KtGwOOLcxde5p3zPgliBCUVGLlR2iL1x_KTKjX5Q7t4EebOUU67rLdlPViGcFhSGG9Ug4kQm
 tL2xLZSked7QMZ0.fTyhppagua7M.xYkdn1D2rdqIrcrK8A--
X-Sonic-MF: <pheonix.sja@att.net>
X-Sonic-ID: 0748ea28-60fc-4af5-9c14-aa8e6350f1c3
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ne1.yahoo.com with HTTP; Fri, 9 May 2025 13:39:26 +0000
Received: by hermes--production-ne1-9495dc4d7-l887h (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID ca033b468cc0a5842ccbac3d44678853; 
 Fri, 09 May 2025 13:39:22 +0000 (UTC)
Date: Fri, 09 May 2025 09:39:16 -0400
From: Steven J Abner <pheonix.sja@att.net>
Subject: Re: Kernels >= 6.3 disable video output
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-Id: <GXXZVS.Q1GIIU1M9VBL1@att.net>
In-Reply-To: <CADnq5_Pk41iOvibFSjt7+Wjj=FXWR--XMt+OCqmkWWveLfU_ig@mail.gmail.com>
References: <6DWYVS.BXJ4YUZ0KN5B3.ref@att.net> <6DWYVS.BXJ4YUZ0KN5B3@att.net>
 <CADnq5_Pk41iOvibFSjt7+Wjj=FXWR--XMt+OCqmkWWveLfU_ig@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Mailman-Approved-At: Sat, 10 May 2025 11:45:19 +0000
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

On Fri, May 9 2025 at 01:11:17 PM +0000, Alex Deucher 
<alexdeucher@gmail.com> wrote:
> What display(s) are you using and how are they connected?  Can you 
> bisect?

Not sure the question, but it's a tv thru HDMI.

Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 16384 x 16384
DisplayPort-0 disconnected primary (normal left inverted right x axis y 
axis)
HDMI-A-0 connected 1920x1080+0+0 (normal left inverted right x axis y 
axis) 575mm x 323mm
   1920x1080 60.00*+ 60.00 50.00 59.94 30.00 25.00 24.00 29.97 23.98

And hopefully to verify, 3 OSs run fine: Ubuntu/Elementary 5.4, PearlOS 
5.15, and LFS 5.15 thru 6.2.16. 6.3 and above has 70% fail rate with 
firmware built in to kernel, no fail if no firmware. Mainline 6.8 was 
on PearlOS.
Steve


