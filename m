Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D934AB23A6
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 13:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CBC10E0D7;
	Sat, 10 May 2025 11:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=att.net header.i=@att.net header.b="TKIdV/Q/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic311-26.consmr.mail.ne1.yahoo.com
 (sonic311-26.consmr.mail.ne1.yahoo.com [66.163.188.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B26310E2D4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 14:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1746801545; bh=e4uks5X50H8wn45u1yv8mw6nfQlYxi8FSM3+fNp+tww=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From:Subject:Reply-To;
 b=TKIdV/Q/e1tGy5cHrgyPdSsCtK4Ns/JHIRL55D0WOLJfb5Kh2QPHE4Ct6hkgnQqr+rwnOGqPquVcsytmmpaiIOFs+RkWsBy81jdorhqlDZUnX9l/hLp893WbxkEwbs2xX/cuDhCFpE+g57nMmDjmVcP+EuRxHqvIlX/Y7y/R+Hc=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1746801545; bh=4MTqU5VaiTNvk+zfDuPZ5Sd4CZId1ZOnvUBHtaokT1C=;
 h=X-Sonic-MF:Date:From:Subject:To:From:Subject;
 b=H6/nso1uBwcukIlv+XAvR5nChiklZaLg678dgfctPnLuxSEW0rTF4KPJPCNjPbSgzyO540XXqAIrzzkNm7zIVbrxQBDMEhy6bUPXU+y3haVS9mflaOlZ876OncjZrvXb5kluqXKxTk+USEd3VRkZyH9eDkYczBJnpjjOOAv8IrFXxSDW1+i+zA7eublRZYefyDVSvv9EuiverpV3/D6HGBRRj/IGbAWxS+bEvBs0RhW+H1PqQ/wwynHXeUGGFG9GCNP9EQXhQo/tqNqRnH4M3Up22CYTg7IfqcXa/sp7pnvo6uEhdjo73m+nMolrexS7FJ0ORpfGvnMZ/Ij8LRaxEQ==
X-YMail-OSG: uxXkQ6YVM1kO8_21GHYFBSG8y9fZmMjHDMQiL1beH..seXd.quZqVBffx0Jt4Yo
 NCEYp4f7uwiQzrOssRkj2ovWRDewETy314yCb9KFS0m4bUYIERt.OdyIZ8a6oTr9FbkQsS6zpsO4
 ffwuFsLUskBSvF1kgiKQijLxubeOF1w_SN3Hlhtl4VAW1FlwueJDdKjkxObtngkg6AnTkO.wYJEY
 6ysKfBis0SMwjF7YUjlk4JU5CE4Maj4SmsD4VisW2NUPjlFKjHHi4FXFyiU4PBiws.hhlwhk.dY4
 mE1D8xM3e2.C1BwFm2e2pVnoFmc3DNfgaDYFH5Yh8jr.fnW0J79cojDqPW3AEVsnRyf.7vJRFdOu
 T_2.MtBQ0kwGjh5wpYrsjsqoogHjyG5FOkx6D7PUl2KfGrG3UptXulQIoQDFB8QHI4zgFjNSZM2q
 0DBoaMx289KSgZ4SbfrQ.PJ1A0YQC2ea5phfPIF_f0hbSTWtc0pPEGq84lcy8ZPR84xvo76vuRmA
 .cPwcNU1M.ZsTZSlQm_f84e13JWR3dbZnYDrLAyc5dBNz.3AMvtQvkjRacnIuWgQ5S3YWPCqydui
 JY3ijB4AvQ3GmdmQyxP4k1UUg76TSDW6bfIDqwvAf3PAPd2GtpnLKJu20aoinGPXqx2vPoAIUx9C
 AuBUoZH.YR_EQP5eX_0d020tlbZYIFwbP0Fwl_3TU.DQGxWxIM7vydbVzdCW9YFxoeF4XFQtEEZY
 9awcWBqVvy_4sVALxIT7bdXxmgJ_yXVuF2ghjF4kFgpkBDFirAWI_.s7FS12TJYkBPcHOSa.GYFB
 o48Y18_FLzdEA_UWQt.XEMIrieDWqRr0PbS8Z3PbtYLj8OIwvWr9EPWPHLqrYwvNyokpXKOx9foi
 jhjz4ZmB4O20916SrVXv1akqlpPOZOUBMQpM2D7WBttjQ2ulcpjVHEPtdv_XpJPO0lCGqpKRfxKo
 qNVi999oXheXS3Z.I71KcVClclFAmx0yeAlk0oJeQnjax5yqw3mCk69_D9JZwTKK954CN2QgVcZs
 IUWLXbhmKCWvhFdHYI6HaJRIPMPfKzgrmLj7aAKZc4Lo.q3EVXHBCweqNixpxuQEkQu2cu5qQ022
 .rkFIH.8LBRWba6wFf704nfikZfQWPP6xUExvjB.x6QXuEBumedetC8uHLmSLiz.UWVCzCc_zeVX
 nHj5LtCBnXoAxyqGZ2U5d6BQr1p48HYQFdi3Hzjgw9vdnMGb1y4999Iz2Y6jxu4hsb_8eEv40tFm
 2igm0JAAcPTKTecooIe7cIVEAqBRP_W4ll_sNldTjAy0EeqEo3GZ9P5huVd3E3PG33xK3vorwttS
 i3ynAztvSS4Taez_ReO2epmDZ218COaM5VUR7Y2SIAG_sspJJ.nR4uaz1yiksNzR5JZMQLZHehbN
 XMKOaf8kYvM0pO854i18Fia3WC9kO0iiXfPl.oHUmRHInLeuRf_nHn5tKiwTATC0woS2L7WIAx3y
 Y5kfnBSxJElbgAJo0EMofHyysoKb_fJpUXAVxFyGkgHrqOnGCcq1MuiE2wB2a0PNVTFzlFdiGRfs
 lVuCFQvNbyL1Wica734NNGgUizq8m1I5sSYd4qGzEzed.WDghLkbJgM1AQEh1vnVI4Muwo0ju5uS
 i2NUOnZKbvzADHXV.eGbfm.FwjBkzdQBaBUdFB.pfzeBOiM5DoZRaK37XasRUozNdgN_LSE9a6wa
 4JqvQPH.5t.beVN3fkonUjuI6lJ7Bcue31PRl7IhzXn0n5QopPjqVMon2Ye6BurH1Gb8phMQyfxy
 Xc8O4plTNPmsOIJdjgcq.5tMAYrnbec4bdTd3ssfyC87MC0IxDAitwTyU1OyFeAHlSW8DgUnhrnM
 p8fhYQb.oOWVi0K5hAG3c2JrjuJIK5Mw0GW_xonhnu0l1HSp1HTuT.9EikZMhacOxaSXy6FsGCd6
 O1JBs4Ibq0atrpk0w1p.cT50WK2Ak1Bm20FF3IdNMROgNgm3jMiNQccacuN47IMYx.7YJY0mcL63
 76h3jHEVPCnIAkrNwAKwxEm_30DJhc.zOJvNb96ceFnCWlsgaAuL_CcP4ptcug3CYpaP0XgdvN4q
 H_Z2Q1Lt7IhDdwYwNzPQBC_BmoeisI8wKfYQnPi3N8vkBW5QmJQY5i_2hHnw_CcKO8gbQ8PjbTlz
 P522pMUpVexiVAuTPUiGZNekZAVFCiTca39ZzX7iaAyCkHcBiAHA1yJt9TGrdwr6DlNFpfSMYNvm
 YTiYnA8VGunit3r7bv.AQIWSGBy9jbG8cAL_FLBmUeW1B8BzN
X-Sonic-MF: <pheonix.sja@att.net>
X-Sonic-ID: 82d7a6bf-5614-440d-93cd-4c31009021e6
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.ne1.yahoo.com with HTTP; Fri, 9 May 2025 14:39:05 +0000
Received: by hermes--production-ne1-9495dc4d7-k9rtt (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID d121195633553f50086309dab9577647; 
 Fri, 09 May 2025 14:39:00 +0000 (UTC)
Date: Fri, 09 May 2025 10:38:52 -0400
From: Steven J Abner <pheonix.sja@att.net>
Subject: Re: Kernels >= 6.3 disable video output
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-Id: <SO00WS.37KCGL8UH4LW@att.net>
In-Reply-To: <CADnq5_NvoPfgTxOxjBCc-iGR7k8w7oR7VKkXQtWga8VP7vBViQ@mail.gmail.com>
References: <6DWYVS.BXJ4YUZ0KN5B3.ref@att.net> <6DWYVS.BXJ4YUZ0KN5B3@att.net>
 <CADnq5_Pk41iOvibFSjt7+Wjj=FXWR--XMt+OCqmkWWveLfU_ig@mail.gmail.com>
 <GXXZVS.Q1GIIU1M9VBL1@att.net>
 <CADnq5_NvoPfgTxOxjBCc-iGR7k8w7oR7VKkXQtWga8VP7vBViQ@mail.gmail.com>
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

On Fri, May 9 2025 at 02:05:16 PM +0000, Alex Deucher 
<alexdeucher@gmail.com> wrote:
> Can you narrow down where it broke?

 Have built kernels from 5.15 thru 6.2.16 (last of the 6.2 series), 
have no issues, ran Xorg server as test. Kernels 6.13.4 down to 6.3 
builds, more builds focused in the 6.3 series, have the 70% failure 
rate of monitor saying "no input", not just the normal blackout you can 
get from a bad configure setting. Kernel runs of 6.3 thru 6.13.4, on 
igpu disconnect, will perform the normal console functions of login, 
password, reboot and message sending via redirect, along with full 
/var/log files logging up to rebooting.
 Initial build, started with 6.13.4, had this bug detected prior to 
even install of any other software, Xorg, mesa or gdb. All other 
kernels had Xorg/mesa added, gdb was added after decided 6.1.137 would 
be base, cause it works and hopefully not the last LTS that will 
(6.6.89 fails, 70% blackouts).
Steve


