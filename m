Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1493AB8BFC
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 18:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE6310E8FB;
	Thu, 15 May 2025 16:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=att.net header.i=@att.net header.b="mQHNBCzd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic307-12.consmr.mail.ne1.yahoo.com
 (sonic307-12.consmr.mail.ne1.yahoo.com [66.163.190.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC8710E8FB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 16:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1747325485; bh=O76SHHXQZgA+EpWomFALQCHjcEYdFJfVnrFAlAf4t7w=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From:Subject:Reply-To;
 b=mQHNBCzdlBK3VojoYcIVR7jCtbAn2VSWk8cVQeWgtednz2/ru9MwL+HCQ45hD7qobXCcEwNiaAZQ3uWu6Un5cXjN70vQdwu/wJwwm65Fcn5W3mSVR0Vg7Sh/kLfn5WLpLdKpczubW1glW6nUeMLhch/jwjBo78/q4P/9JcJVWxE=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1747325485; bh=HoJ3fQFWk0ELs3ubb6mo58ut2kaYPS6JmQHlupsEMsO=;
 h=X-Sonic-MF:Date:From:Subject:To:From:Subject;
 b=EiQ9yEbK69NZKPTzTokCCwxjQLD9EA7oyOFEpwAfj9Tttq6Mp/h8skX1i5pTpyYTYS/NzZVTgoSCpE++mZflbMzkQkIpQ2aormqe0uQKf/TqJbapmqs743fG+cPofLGE9MeyLWGPT9wIis1KaGRm2d/MYBcK4wS/oTCwphF9M5ZCefMcCxKQDNSED9yx05sz/a4+oL7WN4FX2q1AMke8P17DsCFGr/ssUE9zII1ZWpCNRQomYL2ajwZNo7U1ieduX4lxJAPprRBVGDzf/9a8BHk3tflIwElvUuhQutHHcCWI4G+OtfIl29u7IZopv+Nd0trKDBOffvSLrzNPYFiVOA==
X-YMail-OSG: ADZlCpAVM1kHtMlANVU4dAY5uHPlE26ysqdYexDs9S2lT9lXJHjL4YSOAR9tdxl
 iOSRt0HoZ1AYP3IBJ12DztmGwm4OKlU1c_pcJZmzFMIrr52AsUFNhpgctzqdDioNr5Hn.L1NuAbp
 8LTUmSQ7tuztN9IksHSsYri08n8D.snMkMj.41ZRdJzfLc3XyiiBEDHNg2idC0UNHaJBY27wBQLz
 JPyLkp8n0NjIDLKZWTFtlqullSZomRrjO.RceHAK_vSwMKLH_NI2FUf95_1dXGQztwnPB5VgZrXH
 WuffrjKXanA9ZDYZNV_tsZnZlgb44RGBp8VOA7d6V.dARCpkAvW7kuntCm0m.0ofIXV1I1pZyjKO
 Afz0AMm4rPy69KgtkZ4LKi.9mhWh3MB3_zIVGIpXJ5Y9zi5bIl8vPofL2BzVBGyfRW4OHDBa2UP9
 pmj5VBpaHMe3OGYHEgFwXN77f3qdbfqr3WrFsgD4bbs99iK8vIMAw3R88l0GeAPsDRjPM5sivQHR
 jayOl5QKUNuk.jlwzRMB0BHUPNE8723y5et26hnZGhyvdOU73dtzzL_yEKd4pRj83lA8_ElIRvAq
 xCdljtSRZkYwM7qpaRzgagY7pfvuKnlMKnvH6MgMNcmZIPMaMOAjwwJRZt9TM4qYkqpF1_55qUB0
 1GV_mzBIk0.vESgZvcomFGF64v0GRt9bLnPOV6gU85gFdtZQIE9e2Dra5Pp8E.z12XnmUOeiSotp
 KDF4NO7jAgV2T.s4GjdIAfEjLNnzamEoJALlS.bjFd1u2thghTDm82bq_coK370T4sivvVjosiT4
 pa2LOGO1eO0meT.AXQ8KAYtfLeCQYDIOJ0HbCSNLsdr2fIopD5i.fI56urspWKNAqEPWlvPUVQ1h
 eWoGcpNldCukZ0FPhAimemXDVYPzx2K6mbx1laZ6n4JUfBgxzGRI.U5mQ8MH0aY3nOgKFrVTjGRm
 G0jIvZNnsLEXoH1ORAi_OMVi1tJGRqSWfHG.Sm7DBT9.ibDx1v1.WXkVGMUIlKU6xSBUjvr7o5a4
 Voqd_PIPp_ExuWE0_Ft_ouoH8utR11fm7BiZBYQ7WkryYcxlXo97lp7dpVzTXDA9Csxwx_Fx6es.
 yjjiIAuJHo9kiKIe8vO5IqCviPigi0UA_KHHiJrI1rdd1wsUPN2XPf.xXmhdqwoIa4NEUcZ3EJWD
 4Y1mD4Xz.fRRoHxr95GUDV7B7ehHWl56Z2MbHP59ucffA_Gw5HeIkykBoIq.CeUlYauIb5w53Yig
 Vc_X6FJDlJ64ncff8r1k8AtekW7XqgrUyrqJOHe5GVLQD4ToBa6LpKhCdb2k5ZmhZK1rHD7xbTy9
 gEAifZN_QnRecfaoeB5dkNmP5SwC6a4nXiAP1LdubBEBMDV5m6a2KVQ.tMpadt1lTDPnDycTgN6G
 uCYOazOiB1qVfamVY0nzuIFJEWhhfufhV7MQ.q7FNmq0.3B4M_PStVSn7XI3H0drG8JC1BnuTGV5
 rqg8_kSVM7HfpBDodHBHeHZVbYC4XhYculfI4812kXoVbjxveKKhqwTp9wWDnsNvJzYVN4UJunLR
 k0Rp40R7PmWOFLiG0NuL6jUt_pp9VzKA9e13G1P03KkOmDTjrk8ZwxZunAvKRlg0faPXSYeD7W53
 9X5W2upx04_nI9rgbP.HLcylun6qOAl_1aC5AgxTUXB3bJlm1FT1yaCc6FR096DsBGw.LXS5nupA
 HegqwAkid4rkbe0YvK_PodisneChWr9b8zlF.he3tnX6OgmKitn_vpIqLZ51Uu8adRJK24MHf61c
 VzN2GPOtNYv_vSB3e5EQXv7sZOAb_e1He24rq2E0Vy1VRmrPOFpDC1QfzSJkcKqtXJwlmHenFSu8
 dOQXCqj58.3HEeuNqgWOOVWES6nLQ10h.yeJ9abJyYz.1b7zSkDFQqnKiOKefunEeSZlNEcyY3qs
 hFkdjDvNkfDdzKEZFi_PwrOqQw_3G8Do9B_s6mrXZqLo0JePeKdOqgoJAfc2Sq5vdxLCG4UlB7NG
 wp02PgXX5rgL.4_oabtyZzku8ALJVAMozwuReleb_lszixw5s1OeZd2S2FwS.TpKzHt_aHlWx3A9
 nrJ4t3GPYHuQep_Q3F7PeO089oP1YM3Z9D2C1wUP509BKQMjJf.lWvMZOvV2XQruiZZWxGTmcnFq
 DVa1RLqNEKdKX8HvskZYOMdPt
X-Sonic-MF: <pheonix.sja@att.net>
X-Sonic-ID: 6a98b255-e2ff-4986-b4f1-3fd111e879ca
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ne1.yahoo.com with HTTP; Thu, 15 May 2025 16:11:25 +0000
Received: by hermes--production-ne1-9495dc4d7-9mdbh (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 43d5d9edef7359cb552bcf57ec7b14fb; 
 Thu, 15 May 2025 16:11:19 +0000 (UTC)
Date: Thu, 15 May 2025 12:11:12 -0400
From: Steven J Abner <pheonix.sja@att.net>
Subject: Re: Kernels >= 6.3 disable video output
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-Id: <OY8BWS.OAO65CCC74TY1@att.net>
In-Reply-To: <CADnq5_PbeZCPD7WWO0i5HSVMepka7Ao6byfkx3zHkiBfg4amwg@mail.gmail.com>
References: <6DWYVS.BXJ4YUZ0KN5B3.ref@att.net> <6DWYVS.BXJ4YUZ0KN5B3@att.net>
 <CADnq5_Pk41iOvibFSjt7+Wjj=FXWR--XMt+OCqmkWWveLfU_ig@mail.gmail.com>
 <GXXZVS.Q1GIIU1M9VBL1@att.net>
 <CADnq5_NvoPfgTxOxjBCc-iGR7k8w7oR7VKkXQtWga8VP7vBViQ@mail.gmail.com>
 <1Q10WS.BHBZBX486I3M2@att.net> <EWZ5WS.K2DTZM5DEZCL2@att.net>
 <CADnq5_PbeZCPD7WWO0i5HSVMepka7Ao6byfkx3zHkiBfg4amwg@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
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

On Mon, May 12 2025 at 08:10:40 PM +0000, Alex Deucher 
<alexdeucher@gmail.com> wrote:
> See:
> https://docs.kernel.org/admin-guide/bug-bisect.html
> ... identify the exact commit which broke caused your issue.

 One heck of a journey! But tested the solution on the first broken 
kernel 6.3. Too chicken to force revert attempts of 6.12 and 6.6 since 
I really didn't understand why revert spewed out 'nah-ah' for a one 
liner. 6.3 passed simple test of no blackouts for 8 in a row boots.
 Firstly let me qualify the revert, cause it's how i got it to work:
git show c76e483cd9163138e8fc44d829c986819f072d4f | patch --fuzz=999 
-p1 -R
 It seems simple enough of code which appears to set 8 bits of color 
for rgb as maximum, but with struct changes and me having a 
'historical' processor :) didn't want to have a non-expert speak that 
this is the full solution.
 Also note that I didn't 100% follow the bug-bisect guide as mine was 
apparently a unique situation where it had to first learn to connect to 
the internet and I don't use intrd images among other oddities. Also 
did this from last working kernel (6.2.16) to verify it was the last. 
PS had to patch amdgpu Makefile to allow the 6.2 series to compile with 
new gcc (-Wno-error).
 If need other info or need me to test actual patched 'upstream' 
kernel, I'm here.
Thank you!
Steve


