Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ECCABA060
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 17:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C4610EB05;
	Fri, 16 May 2025 15:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=att.net header.i=@att.net header.b="LRo7Z+N9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic317-35.consmr.mail.ne1.yahoo.com
 (sonic317-35.consmr.mail.ne1.yahoo.com [66.163.184.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E6B10EB05
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 15:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1747411004; bh=pJd+lY0QZkmnnY/vhcMoMvU4wZA08MP/PaZorqMJHbE=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From:Subject:Reply-To;
 b=LRo7Z+N9QiwM/SgnyegaYlvI5MTNyFVRxFKm/hqRW3LPcKTc0ZcChziYEKvLqK7Ok+BuqFW8miWQAVSk7xjU+PGEoWDOfZLhAksfMB7bSXK+wq0OCMV9b4kVeJh2VnXI+k45JLtM1bI49yAUSsngnayb+snAsracfZ7Or0a/jH4=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1747411004; bh=wwsdBDx9LcYFBTJMt5ma0hGUOh3lVTAwJ91U7B+omzm=;
 h=X-Sonic-MF:Date:From:Subject:To:From:Subject;
 b=klKOLW7q0Qr2vHHrh03Mi62kbGcUvePAREvmyX6le6rsx/RFYeKxp+9K4dsfWX28nf1xHLwDLZ+skdwKYm5kOskaunu6rKTPD5HWJ5iBt4ShtqfJ831kvx4mpb0k3ko2yP/gMKLmJimniS6+62LIxL1RVsc/Z7NpBiogBVrnDofmZVGXztCjohyImwl/G34kmaaTteRCEvulHO+SG2P2tHBHWweCvQyXd5j5OeS84xq44H501Rdu6SC92PD2vx63Ix9SC2Hh3+ujoC8QSybCdMB4ZNULhm5jZraK5D4/WU5nnBRnEuZODMCMCOr7o/D/ieaDH6lJp80CjrrzzN/q8g==
X-YMail-OSG: qVfEePoVM1mr8U4iNpdI8d3iOmDFssz9k7tg1c9Ekj4kjXFTPz8elmK0UIRKueS
 FH1BhQyiNy4PZFnGKgIhZ69UAQieHM6XpDTiiGdIMOYzrV5y1NtGKvWoTSj7InAEUAygXOqi5Cw2
 CzOeD1yBmj8r3cMrMTArRo.lPomDj.JJUz355ivlekn4rip2CoQCJv5uqYMGrQpe8x_v644MpNCt
 kqYpStNal9UFNsT2wdrE6ut6ekA7O5y771TG0YDPVo1Xp1lqvpNVurN0PdYD3EkqZ.9B.pXMW3r2
 B5z5Dy1u_OuGv1xf7DJH_wgnJSa_rJWWaA_vE2e7f5qOLwJE_yjtk7i.1529LD8ZHQraaCTjwlyR
 bDgHAq9UdsvCi5_IRRpm9ij0hnIK7GUTtWXv2zp8uu9f7camVS9kllRtdohpWc5dXxYyMrONwBlh
 1.Xdqo_NrmmtUlk3OcQTdd0Yait.4Xv3Y_WRv8Gd1xeV4rIGn4jZyjH3gFa1wkn5DKvRJVBzQVRc
 tKYjXHJ3UAXTuHlvzTtko_RdhQPl5x.3BhWqfzOyRG8N8QSvcCtPG2HzidNNcH6BO.F7S9iGl7eb
 lEhwAig_7VgkA6Z3IDwhdEOYrD.NsZpPT_0efhSoibD9csZ1XgSpmySDTJ3C4M17ZEdsI6kmjDxD
 ElknWo412p05FVBryhDxlWSDD3y3hzq3Bru90OVEywY4cjWxISR8jjVRYclL_xL_aYZ2gpMyQzh4
 ru6ItMiUKkvFiGCpXHVWAwchcP9_TCRdbjoLpUMYBcXn17pfeFdXbewBLPyLoay_odlGfhiABFj5
 9L.HE4IDv4oIA39PObvd4YtMxSIDj_AIOJNtll6lMsUcH6yeZ2_4bnHpwe0c85JoCAq02mtp62dH
 yspzPMNgBQM67dZF1xfdbYIwAbFY5bfRbMk2.omkq5Q.sI3YtxNDvGHTNvk8HeOWadmkGOAxhjxk
 zMXYhMWQDkbo9TEpeQF6_a1334Ac0udFsSUeYW0GhaX9wa1b1LsbQ0flA1fLGgpw2Vo07VvTz6XD
 xzTX7BN2sZ1HSA1O6RFJUvwCfnncYupYhSp44.bt1Ux57P6l5UoCOqN2y9.y_IfxoYAdBtAgYC5c
 c6wScIx3MzjuS73BssSnAuTVONOPNv5RbXSQ3jYu0TonnZJ66Nh4HqgzxUTPQ1198nQd0Y8VRjom
 .lAB3kPBXdd.y9eh7YxfD1I6xscYwCszVbzu_QaJqVqxu8hmCeOm77vX364DWtY71VhM0AEEQWVY
 WDoGJ11cSjUE9cA7xn.8QJfGR5rIrj4rmVo0qk6ULVeqtOD.EP7Pab.iebU7qi1.D2P3jGXSf88M
 YFf5An91R.dvT7.FvgmMZs55bvxxsVwpNeGcIybpabEmBOpBhOKZvz3kzrnr47bNsVqIhMS6e1eV
 JFtZz8SKa472JdKG8T53z1wRcWkbP1myPpfVidqBEEfBC.FOYbgl8YleJ0I2b3LZQkA1cNDxUkJq
 wyQmS5whM7IGov2ixJjRKuimV3EHaowiNGM.TJe_DO1duvnCCrJ9xv4jWZtYUccqI55g4NVemn1z
 KSgpB1Mld2pdmq3f0mLQwSatV25ICuvcpTbdoMOgRhJd1gpD.UNt6Ms32A448AJdEXIJ6yz1UKlb
 J8dP_dh.QoAXOi812WbCjMWllupTa1HDE9Xa3f5VBOAtZXoNcD31dlS_L7MSiz77xrxsUeRWXiYh
 AOeUXyrgQu_7epgfsViZA5iYU8D.ar9ArpVvDsZl_ZL4SBZisg9iQAmFyD1TXLVMCTIymPIiutLn
 HU445pLGp.X9E03b0pxIGEQIp3PRlj6IJFoB_ZDMIxDceBwGDlG0xKhLjDBUlt7meu6obpDGH8FS
 X5LAQ6qnrRHX1cBy8Pi.JwMOxm9dj5LQjwdFS5DtB8NuO3eq.I0yiRldPzKhpVgR81tLlEZOuoj2
 NcXkRoYeeeMNNSxwcykpcyuppwufcryRDSHN5bpHbHrxJoNbUfyPwzXAJF3Z7vjIj6v4xAK_tyzG
 BVMaPgfnoH_UZvXMMAZvFcalEzTWyeIrg37gDev2_B46m9hky6ib_fS17Cp6gJV2tZXXcYJHHeEl
 WWOQMbxTSsmXZpizn0l2408skGGWsNL4dkWixyKKTf7w6ZWS4JINS_HyDtIQlhkpevpu6H8s7oaD
 S21QZEbtx4FOrnrg-
X-Sonic-MF: <pheonix.sja@att.net>
X-Sonic-ID: 0f777bca-258c-48d2-89ce-8880a6837499
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.ne1.yahoo.com with HTTP; Fri, 16 May 2025 15:56:44 +0000
Received: by hermes--production-bf1-689c4795f-fbg4j (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID adf240d91ca2665cd4e84e28aba5d229; 
 Fri, 16 May 2025 15:56:39 +0000 (UTC)
Date: Fri, 16 May 2025 11:56:31 -0400
From: Steven J Abner <pheonix.sja@att.net>
Subject: Re: Kernels >= 6.3 disable video output
To: Michel =?iso-8859-1?q?D=E4nzer?= <michel.daenzer@mailbox.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Message-Id: <7Y2DWS.S2B813X7LPJT3@att.net>
In-Reply-To: <G32DWS.2C801BL0Y0SE2@att.net>
References: <6DWYVS.BXJ4YUZ0KN5B3.ref@att.net> <6DWYVS.BXJ4YUZ0KN5B3@att.net>
 <CADnq5_Pk41iOvibFSjt7+Wjj=FXWR--XMt+OCqmkWWveLfU_ig@mail.gmail.com>
 <GXXZVS.Q1GIIU1M9VBL1@att.net>
 <CADnq5_NvoPfgTxOxjBCc-iGR7k8w7oR7VKkXQtWga8VP7vBViQ@mail.gmail.com>
 <1Q10WS.BHBZBX486I3M2@att.net> <EWZ5WS.K2DTZM5DEZCL2@att.net>
 <CADnq5_PbeZCPD7WWO0i5HSVMepka7Ao6byfkx3zHkiBfg4amwg@mail.gmail.com>
 <OY8BWS.OAO65CCC74TY1@att.net>
 <CADnq5_NqAQPO1NRbzQJzR+tZnOSqrhTmZj4z-B54X-hRxo3b4w@mail.gmail.com>
 <df6872b3-1048-416b-82d7-63f732cb6b4d@amd.com>
 <ba97cecf-d820-4ae7-98ae-2cf57db228fb@mailbox.org>
 <G32DWS.2C801BL0Y0SE2@att.net>
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

On Fri, May 16 2025 at 03:38:04 PM +0000, Steven J Abner 
<pheonix.sja@att.net> wrote:
> A boot param like 'amd_prefcore=disable' could work

But kinda a band aid. What if you just download a Mainline kernel (as I 
did to verify not a build/configure issue). Writing bug report to OS 
provider could take a while for them to figure out what the issue is.


