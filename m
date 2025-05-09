Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C500EAB23AA
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 13:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E26110E24D;
	Sat, 10 May 2025 11:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=att.net header.i=@att.net header.b="UzDBeqkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic307-12.consmr.mail.ne1.yahoo.com
 (sonic307-12.consmr.mail.ne1.yahoo.com [66.163.190.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB6210E2E3
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 15:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1746802885; bh=MnJtzmxO2DKR+sytRV5G8hrd9rz4pnvL8AY98E6l2Qw=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From:Subject:Reply-To;
 b=UzDBeqkFY2mEF5kp0GKQKjgcvak3EqZrE6gOTuZQG8Ol6Y+Ekv/rs0n2Kqz/7TpjKjqPVzX8rizCTVii7DiYfXZ01UyYZ08JTwT4VgOnJIj0sXZkpS94AzSs07Rl9SQddF2YGbsMX/7CoaKkofW99uoYQRuQegnJcNNs6KRM4og=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1746802885; bh=HA4524DMit1CBBqKaL3H0iQgsKo32AoiNyr8EZs1jPH=;
 h=X-Sonic-MF:Date:From:Subject:To:From:Subject;
 b=O2BXk4F07ptMwS5C8IED7FqiWnyIISBY68NEHWID7vDdY2gx6PhXEqf+dO7uxIItKfVufWUVidXoQpOW7GLZiIadozElXOTo0c5gMnvdpz7KpdeJ2Sr3WUKNeYeVAoZ1nDb++bT2n3RyRw35NCZaqrhygC0Tc+9PUczV+4YroFozeVhPsaXzA8jOX4K1b6I5qjrfNvGv204Q4f4WyoqhIjKwZrnh9iVOrIKhHoJnBk0r243rjsZu9X806ebGeZw+2aRnEwzc/b98R2xwSW8f3iyFj78xkGnAmspnTRZLjmaKT1zEVTaoHYNUw4cabKHJ/ra+qg1ex3HBAK0KsHykag==
X-YMail-OSG: BZ8KBtoVM1kcSkcZPScaVAjS_rZHGoNNi.mydSl1pP1B3rH2IjmsZ1nFTkv77MT
 WugkrrAOrT6uXrEIw7aRo0YAZIZt2sMACDSCdppLTHJGTHZwJNYKSEIBMOpuWNhgw81UIohyhADi
 qslsKOQfIAIZ.RBEBxCerbKBnNF8eubkLnrCQLuJT63qfj.F96T1suik8PSE5Z2a7UJuQKOvsN7o
 4.w2Pn4._m4.jjISTYcpFKdP3_FXmDMo_jXNR4a1dNVbAyW798QwJNnZk2WVy0r9sufJhbnkKKMu
 7b9U1jKgi4U1R4PwIFrOgPQwispsdfDIFNaskOwWaD7P4y.Ss2Y4Qsg5kkHYPl_k_2vEOiTnwT5N
 vnXpyrDRbq_fPJnW8LM2inB6X2.abX_fz_QgJLLOp4okccNFNlcgH4FSWlpjx.hy_QVEbbRUYCr9
 uQmVg4H8f65yd84Q6Q11nWsiI1xeriiv.kJ7TKaVF.jRXZQnRwXVFAE1nFUGPUVZdAMTuIRCMOO_
 qNfgrKgjf662W.e6x9hYzKddjwxDZSYmUdtN9YxrWtUlql0WOwwfha3Hc4QKEnyJbiZ3IPwG50A3
 8btebVNvOvih00ea2qizSZXM8s.E2S7bzAFWwAzPnIcOydcGikYqcqjeAhi0Pa9E1ZIEye1Z_lUG
 cuty4jwVb0OAs3u_fYA5KF03.lxdY5DYxMok_5W4L0n40lB.qFZ1hh4.zVB2Yn5MXA6XalWKv.CB
 s5JR.JaIDlTUuhuJkurqUUdanEdFpdoyMz2gYxVtXPBHywNBG35kgjgviBsGgZ3K37XVCec9V.ZT
 fT.YsWNqh1ezma6iJ8X79HoMfqVQ8MNX_17TerjmbOyGime8GtOdL6nz.akMPBOBjVDGKE2Atprp
 pss8iA8fMprsBdZIERqUA0areM0cbPztBO8CMxyxmyYJ48PAAzurlG.J_dx4E09W8gqHU8JrxvtP
 KkgmxY.RFidy7bR6hiCaJ3EW4s8JmDgTN7t5.x871t8RGjrsV2qNeXPyPo7CO14OvZ9PScNkJ2IU
 r.LCEeqgw6bPoDl6vWFZN0I1D4OotfletW1cV5ss8bVqyL1yrXDWee_M5_2u_OQxm.letCrk1umI
 wiF4X3C962BTf6EJoZkc4V4NeVwUyIYtaF9H1rmRS4UX2ARdGOgJGBKhnQ44UZRJR0kDOmnfJ3ej
 U6fELm1eSRqOzPKSKSluVgUPcQMxrrnAm6pBSk0Xfh5eTq6cUF2BIMSccmXsWU9ZaQ4OxSsYcZGJ
 GbWMTWc3jXauPPbR_E3Cdfd4FLmk_AMkYxTpQ6VIah0xvNZCGE7THFv9Kd3X3HENyWS8xHhdVW7_
 Uk91gIhBVJMJ6JVWO3YUSOiqWVTBVv6oIuRN3i_QFbZZQ70F5Wp8z56oOoRuw.DphT50uy2tce3F
 wP88CYpC1O0_ot06cMoZmPYHh2ccWBK2kebAA.6bf0f76ROh04f50XM.wDbSRQnS8BRH9taALxw9
 HewkLAbPLT_J7i.MeeA8Yr5688MsGzLR.KcqMH_izoLhWNThuF9zkLXVKzcmGZyxVpeGPD4T935z
 9Bck6uzxcNwS1X0Xhuoppl0Xd86f2VbWq11DpluZIS0lF_2PtajArWEjjDBOdjxOWhNMIUdiSUpp
 mv8ZGFqut1EIkBswu9hMSoq_yg77GclpuFtiK1gHS0xZNl4.p6TKbYuYEE_ErshNb9O5vEjSPsBK
 Om0cF.ePYODKuZeLGFdyxBj.JId1uoYVAj9eOZ3SU3U6U15OUAE8U7hCo02z_RPAoxlNefOkHfih
 5f40oIMyRsKbFZBT.29ietKheIAorMIFDS08JVHnJAr09XdpC4gaRAan7Plo_7JRdLJMjZFhhoxc
 3v..poJeztLSpX7zi9Drjh6x3mDdIOIXONYUMH.qwC2IoZFiFtZMUyFhDGhafrWjvDZsajV_l9yp
 NlWvfiDPIjNFEKy4I7pkHoGW8oW2V3A3YKZUKZhJsAcCiwycDfjLVu0_DPLW.yR_YoP.25P4OTGF
 1oYANExqrJ8qtGUw4dzTRZTbZCySRp5h1L5CqOspULfX1_NqvPAcxVED8JsbqBZxHNViNJf7xEDe
 _WfEZRorCCDqBbTYgDlNC0T865WjK4xvwXxZ6r0rcQn5pJGIhQr4BJNENfS1Q4.bYR3CHsoByBX_
 wPCLdVZlQ3SYjluqm3NxWv2fUgER2Ue2oR6Ifaa9r3a6vIeCU4NTrvO9VfzVL5zPdUDbnmrZSV.o
 L6ltwxgTdRT3kVJB.bLytzWRvZbmHWaYMyR2jbIgypphN1nxo
X-Sonic-MF: <pheonix.sja@att.net>
X-Sonic-ID: 68aa4eb0-bef2-432a-a898-166ed79cc9d1
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ne1.yahoo.com with HTTP; Fri, 9 May 2025 15:01:25 +0000
Received: by hermes--production-ne1-9495dc4d7-lq7tf (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 5e0a71cad5c1557fbea7f93b9a5539e8; 
 Fri, 09 May 2025 15:01:20 +0000 (UTC)
Date: Fri, 09 May 2025 11:01:13 -0400
From: Steven J Abner <pheonix.sja@att.net>
Subject: Re: Kernels >= 6.3 disable video output
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-Id: <1Q10WS.BHBZBX486I3M2@att.net>
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
> bisect between 6.2.16 and 6.2.17 to identify the commit which broke

 Are you asking for a 'diff' output of drm and amdgpu directories 
between 6.2.16 (last of the 6.2 series) and 6.3 (start of the 6.3 
series)? I can and will if you want it.
Steve


