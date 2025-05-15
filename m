Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F41BAB8F3A
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 20:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019E310E0C1;
	Thu, 15 May 2025 18:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=att.net header.i=@att.net header.b="GNbbPnoI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic303-25.consmr.mail.ne1.yahoo.com
 (sonic303-25.consmr.mail.ne1.yahoo.com [66.163.188.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBD310E0C1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 18:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1747334537; bh=8JAYg8dxHCcjUzVV53KONrb4RuOQKGiIMC3xN42E6lE=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From:Subject:Reply-To;
 b=GNbbPnoIwGhyBul332jXQidW6isU5N6bU0ImNMgaArxksr79YVfLIuOX09Y7KsDSqY++B7kWLhQQ2XF6vdH5NBhS+MBzAvug3fRwmEg/hHjLz2Dd+q/3z2zMYwg4B8O8AmXSo2flucmmrfcmibTPac7v6NZaWhvHIwCYH3tZR18=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1747334537; bh=3J1NlAHgtzDexSof45kAuPXU+yLcAZfUzhVqDY44kcX=;
 h=X-Sonic-MF:Date:From:Subject:To:From:Subject;
 b=c8lZOZNuYw+UmHzRJjmym2ooIkb5e2EIZml9SWFpO8OrfQDYz2ASAWssNH694/3eFSQwSLLInj3uqrjz2WJcKgo8u5EB1h1nDJdavC1bLyqxFUM/d9rV/uqHBGAB/UOtOHXKwSRiXK/Sq0w6pGWtE8p6mivoH+zAagQlu31PHRywQs7/Y/O1+CORggMm82AvoQqV9Jw+/xDPnzIFhI34IOGBD+2Il5tOOYFpEMkcNsbr6xcSe+8kW5p+u78pNMV/dVLJ6ElJYq2Q60DexNaJ7vQ3uxkWMnh3pZZhyb3xGw2UzXuoZ7HFXUiQc4y4Or/c+rGxccr8ELGzWKwhGDI19Q==
X-YMail-OSG: WtWVjhgVM1ldrGUKVnjlfecrOG1YXZ38AzRxp87nHHjyc6Og6V9mfxQ.E83wsfl
 eKWzFNUsqbuWNi_XTqWbBr85SL3SZCcz0P5j7eQOz8cl2Dv.7RqeE8LZ9JxObcB1EDWlCKe118EA
 xlC25pf7nVMJaw1uuGzk4RkD6uViRD38n8yA_I6QhC8Zp.3hniV9dxRBWBU40pT6RPW8cmIoaa1I
 B5C9i3SaZoLNntQej1MAWd7qCKawz.HTKLoKOKZevLD.HumIR8d4E43eQlmd8XKbgnvzC.3JJeRp
 vZeMErPZ5DqCtfRwwCRmLVd6mFxEJOs2EAsRojsLvHBrvub9k5mInTSrP4SCGthvogU7ID.83XvT
 pivZvCGb9vP5Z1QrAp2kHiNGBfZVawiYQp.in2jzQbyHT0ZOEL7xDVQVMY.0jgR3Fp1ZoBVxrOAV
 gyAV3JPlvKLE1YUSabFI1hw19vJ93yUqzNgGS.VGWFoI0WfVGeXAZRvUDpUFPx55KIiW32GWjE6R
 vKYez.65twTE7yziKG.vBHhxUbziDC.W00s_ICvrdjeu1hV.M0z6ToUqB7X0ODkDN.mnlhF9RZO6
 NjtkgxuVLwe2VX.Z2YGVX.sjI3YNyzoF0hVg6qnS9lKP3PxXBXYlZpYOUQvqS_Qx_iFz53UhsTrM
 1Xk4SEh_MupLrHg5xvYPjxljuDG30ACFxGgZ041FvXLTuyGt64W6xze5kqSINaUQ01Pg65uGF9y.
 S5Y7lH.W_e6zGcp5EilyFqH6yClwhyrNooHAOmckfYLuXXrRS4X4yc5S8vSIzJWFQuB_HxKjwzHV
 57qXiDRghCDhBJKlNcXeAVOiObTv9c2FXIfry8ZY9bfcx8UvM7ye0Q2V05fiFxNYiR9UxL4tXjYq
 Q0_ykavZXlJ7V78zd3aX9SGxUBs66cfFTC9rXAybRgzVM3jmDZf57l6X_slxEcrWgQu9soaf8cI7
 JpdD_MzxYyvpr3SPD7KtBWBcOPZ3rKSgclH98A2KSNUrT7mrA6HmKI3EjLR1.id.0fM_.cLkbCVB
 OBGKj9Lzx4JhUak0Mv2tvouovuwjRwPnGpzWHiHMLuNZan9Dh6pky96aHwlud.hY.Z7adqporCth
 t800VMsEC.Ucu0EW_M04dcIBLHJB5kgxwzAwAC3W_AmzPtdwYGvdpH5yyEEXzgaF7NJnU6WdB2dW
 kXAgXmcIgPDYp5HuzmT0OwXOUKdTZjOpRwSv_PKFIX.I1TxgJGD3wUB3_ouwFc3xmXbdHsysgWIY
 37VXblTJhwpQSREDsPRuhQjZgGxiaqkWh3sEP3VH3rCCcBaMLYWHLsmAwGr9W_BRoe55oZ2F9gbh
 7hM5VWXjpvIdLAzSX0G9FTpb6qR6uUgq.rncpNvspH0.v69pAhJmaxc_J8iiwjxlLuxFp.XNRp4Y
 V1kMP1C_aXA14b5LnpYU.zqRRrvemR9ZXh459tISnlexjdZdRW.V4ySMnHrjx16xSizIsUL80ZdF
 rrOcCTRR.hGxvXmg75IxY74J1FgjhdCGqeKrvcm1M_Q_mS0laJqEoaCse_qsmVQsThw21c90_Q0i
 RHI9nMg9gH.hvlRMS.cOXqqR4AyuekTOnp4p1GGifW1xwFHbj9bUkmeHoPqW42ZM4fHnMYN6ib2e
 AjvFLAwdmUiZTE_ljRsUAlldTvuJgZMCK1KM.kttWd0qaa8PGNKQddONZOIYKMxTtqCRyb0dfwCi
 E3_SM5CmEOm84b1QVDW9JpMgSKyXWUDeQcbMV8jnjRVxsd8rawPcC9bX0rkdE3Q17el4I6Z.lLov
 hAjIt1jJUCENFObQX.LMsfY7VdhN4dXQ2kgK.YAnGd9dDR6cy0fGbC1jDQUeDERwdWkebkKafk.Q
 5lOmWU_l_TYRcW0aqXAqnbHskf3hIoQhEGrGwCf3KiJJnK8lsF3klSZZ4_XKPWpwaD5mXOW1WwuT
 D8vYERX4_RIeL3KOM_fAYuudmoPfyr4QbrYIshbERTOFJVJC7EMPxjU9JRPaFziLcpJKY_OYebSo
 ECS1yIzAKhZ1.bPGMg5A.ZbH_pzc0Yd3BC6qeMszvu7CqvVb63Fdb1FizA_aG4gecK5i6WitUP3A
 WBFt0EoNqKEPmwk4b7G0b5LuroOhP6M3G7Mh.Sg7J5n4TvlMIg1lcZxCvfjpbv7jZ4mqT5esEgPD
 77yBZoj22FxGdmQgUXRmUkL6QamSL0nEZeA8fsoFNVCRWqotZp.jMGSAitdKRlDTsEajx5PRRSq7
 JexW_laPmcz2EDwV68mjgT_DGnoecEBOsbIVlfaRU4u9owQ--
X-Sonic-MF: <pheonix.sja@att.net>
X-Sonic-ID: e2b3ded4-8a60-449a-8e96-46dc4b0d8c25
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.ne1.yahoo.com with HTTP; Thu, 15 May 2025 18:42:17 +0000
Received: by hermes--production-bf1-689c4795f-ct644 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID c936fa76a81cdfd351750cf543112881; 
 Thu, 15 May 2025 18:42:15 +0000 (UTC)
Date: Thu, 15 May 2025 14:42:08 -0400
From: Steven J Abner <pheonix.sja@att.net>
Subject: Re: Kernels >= 6.3 disable video output
To: Harry Wentland <harry.wentland@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Message-Id: <8YFBWS.FJ3FQS6VCKB52@att.net>
In-Reply-To: <df6872b3-1048-416b-82d7-63f732cb6b4d@amd.com>
References: <6DWYVS.BXJ4YUZ0KN5B3.ref@att.net> <6DWYVS.BXJ4YUZ0KN5B3@att.net>
 <CADnq5_Pk41iOvibFSjt7+Wjj=FXWR--XMt+OCqmkWWveLfU_ig@mail.gmail.com>
 <GXXZVS.Q1GIIU1M9VBL1@att.net>
 <CADnq5_NvoPfgTxOxjBCc-iGR7k8w7oR7VKkXQtWga8VP7vBViQ@mail.gmail.com>
 <1Q10WS.BHBZBX486I3M2@att.net> <EWZ5WS.K2DTZM5DEZCL2@att.net>
 <CADnq5_PbeZCPD7WWO0i5HSVMepka7Ao6byfkx3zHkiBfg4amwg@mail.gmail.com>
 <OY8BWS.OAO65CCC74TY1@att.net>
 <CADnq5_NqAQPO1NRbzQJzR+tZnOSqrhTmZj4z-B54X-hRxo3b4w@mail.gmail.com>
 <df6872b3-1048-416b-82d7-63f732cb6b4d@amd.com>
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

On Thu, May 15 2025 at 05:59:55 PM +0000, Harry Wentland 
<harry.wentland@amd.com> wrote:
> Are you able to share the specific TV model?

 From TV itself: Sansui S55VAUG. From System info within tv menu: 
Settings: Device Name: GoogleTV8931 Model: Apollo Premium 4KTV
 from cat /sys/class/drm/card0/card0-HDMI-A-1/edid:
binary stuff with words 'AndroidTV' embedded.
 TV's only about 6 months old and MicroCenter offers them.
Steve


