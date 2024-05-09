Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856238C1018
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 15:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0902410E87C;
	Thu,  9 May 2024 13:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=verizon.net header.i=@verizon.net header.b="G7nzpbQb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic317-26.consmr.mail.bf2.yahoo.com
 (sonic317-26.consmr.mail.bf2.yahoo.com [74.6.129.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1302110E87C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 13:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.net; s=a2048;
 t=1715259995; bh=9SEJ0rk3ZnNU4UrM4PY0YH133/jnTCybgl881I9OF9E=;
 h=From:To:Subject:Date:References:From:Subject:Reply-To;
 b=G7nzpbQb0W+hYew3ozNTw++1iDUk6DLySLbJ9wj7q1vmaWF9atfWvQ0obW8wngbJQqXU7W62CK5u6WrqDgllHNXFldBvHYy+BpLBPLX5iZyzOc70n6X/Z6ClBfQiXZ0LVyCPIBGT3pGwUboqU4gTOXZwme1PyvF/gyWWBYruQllZ+hGA1LGpWYoAkerLALETdPzTfuiUXN/ci/mYunEceBt+wBe4P4qgeJ+wjDZmCgLSWaQGSixxR1bM8L7JWZHr9zmTtp3I662QAQ0dPkJXGTvxFDQk0gAyb4KGOgzWh7K2Cew5v5fbcUPyoXyW/sYqn8/E+max/MijzEC8FWKaIg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1715259995; bh=DTQSrMrgio8Zsjig8ooScrpFcuwJ0HWADs8aC2yMCw0=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=lw+n7iUhhs1MQdUzCGU6Afl75dYtw82OWWfnmPAiWOdxfyg/MzfgP7Zbv2e+c7b0WAEI2jbHdhhmHveMSpc8ElGmcpFeDpbWon4kc2UAbaV7YQcC2vxW4ER5Ip+YEiKayD5feQxyl/sxNHFJJkkJEmJANLUOh95gjlw/C4ZGYHUB5sgjzAK7a44kARqM2nyKOjXP71aoI7UvQRoLIcSevCrBuq1Hmi4zZXY6z0X44+MkFUF5EMAdb+xppjBHrUmJa0pbnhtXCQK+Oqw1W094qhQ8sCULF4tBjb2/X1BAOn91sEy/+avxtoIaUEd+XjwmbaS6ehwSGmZXwZhIpgftUg==
X-YMail-OSG: P7tPlK0VM1kbVW6_2GbLWoFI8.PeSds_Yuw9HWB0WCx2hDdkd1Q.5f7qZQHAEY4
 uFCRAj2Bs5q3jeww52.v8gnmlk8ZIKhed1oqBoOWIGeXlxRpIZcdk9HAnKezsuIF2CFHh7GCGgxm
 bTTf6WlLooLDqaE72UL87RYGuZc6yQrfbZo.VIpDag2CnCVb40zOGefIMoVv8qEs_obEo0KHF_27
 zo6UWJARSleWpgc3mcxmYyYlJhlE9nEgSp0tHZfPum8qIIRH7zyJc0RbiR8SC05YymmRBV0nG_rD
 90ccYJ1WiQfmso6Cb.b9PKrvsE.xrW8QglEIyoNWaREsNeUFRBASX._76vRGvFoutY1Ddc6UytqH
 SClFIpekTH82Xhz2UT8S1WdPAOE9Rz6v95LB6qjWd2I5MxRaMztQsYegKj_YgOwlCQWi_VdYNZmZ
 iUAxhGzzQF.0LcY9DMkgmxbhJuWBGyEUAIDXiqcT.j4n7KA1GApZTxBRBFBnltm_66KCTWpFQ1YX
 9I1mKfH2i0AqTcuJeZ8mZyYHILVb9qoF_Zdvi0SwbKcouyeDcDSuh.r6rMayJjttIDXJjfOX8jjV
 rBPxObQu2k3dkfmHk2mibT3J7zWNYeFhjlIVYQcA_9JapNlWRT2lmJC9xqkQQLvih7fO8JtTVZ9X
 Zi7FmSiiw7.5sTn0Q41tJRbHMAO6EBkEHaBxpGqlvGmjBUjBfcmlJCIKsWuq7Cf1xusB_n0Zm5v5
 sE_glrNBb74f6pximx0rB.Lae5Di3mFXLHkOrUXxcdM_BAHZFPn_alDiDAi9Tfyr_og_NBRxiyT1
 3GTnsTi0TYIzWtCUMddKLSJm_3b3bQvnd9QnuCF7IJtvQl9e2Bri8nsjTQN8iTNmfwJ0mR4N.bZN
 9vJ3e4bwz_NmaAKIo3bSLJTLxJmSipVtEu9is.kJ3Bm4g86mZPfIkTQ6oau6np1MSqbHfEmJY61C
 Fn1r_TqLmmxHds8fkkrhNwgJyoc5QWm9XJ9l.5JrRKgX.ufA2bmW1xhGZ0znamKn3V66QMm3eEx.
 eifV2zUAXCxLOT6UfAkc2JFjhV7aMERFH.IyBL81APmqe1Cl7eYtICttYrX42Z9C06jQgc2SPi_i
 urThN7LPYnv8nFA3NuVRGE9O6BkKhIRGshYRABwNLIFqJp6cF81xTiClJ7cTjwT3AfjkLSmE2MdH
 PwRrv261qVRRN5dV79DsBMl4YA1QoGuuQ8uSSovV5fVsHrnWi2REzHli1sH4UC5lTBdZ8lK0vo13
 dqYS8rSq1r2Mxs3M1pvurlfic.lEkXsCa9pJwo4W7VF4MZtEBEaMV0Hqiyn8vtraKdS019G506U7
 5PrTMHjnR0h5kbkdPQMSUocDn774.CQYWixBvWoRqGJpJO18ioN0Unto2tX4n7a.J3YrG3QYqpz8
 7ma5M3zVoRUMQ9Bv1zYUzzA2C5qCZiqT_KIeCUXGNf3wWm3Mj4U6BYiqO2vlztzSw6Qj2gAxmYKq
 d7zpa6FdzDmXFDKAd9w0RKtjJ6CkwICfu37tPwO7JzX.goNRuiNWABCaQhBG6uqb25DwGNsLPoUA
 CZ1pLLbVwMlPP7q49cdvzV5aJRm_7VfjCzkOnf9L9jSwroIZZ_dfLTVNDnjESPohzOn1Lfhto_u6
 z7vE72V5Y.hlp8LQWB8Yv8B1Xdm5yhzXDnzgjMWfMiqvoX.gv9D43nCpAkQjGcAe2gOppqXYE8Rr
 zVHdp_q36s6A3AjKafxPIjIRwkXwxo6DECVA50MXmE5U.gEYqPLze8vABTVY2Iv9md2.LQOfAd_d
 jmYBWWYpWBE29zrdmIoNChKFMbc32EkP6T5iG.hV9HpdQ6CbhEVuiSGKkA7QqtZtvMn5Q2ktOsmI
 roxtO9vARI5fBjjEh58ykxRLwrUmxnta1UuTu0U6xCHKInug9l44_x9KrwFjM_4SJjkmRJjlgXwx
 NSydIw1MR_hVLnWJUSvoQrTOP5xrABcnr.Hpm5rtyNqBcT3m6ZBULP1c1.o_2QZl0kdO_DcVBwH2
 ckxbMURF__X2Wat_On4DXEvIsWM8wFp.VlTS6StNFGcxTAm1HDXmZV.OEGU8ICrI0oFLfy5zllB9
 LC29XZ_kuxA.Lgk_WTbuPkuiXBGvhfF3hsZhmhWL3y6CY5ZG2ohNybAbNapG4stAjpvCj2rH8SKX
 33LdTnLDjgjrEUMNLViLopr95H6lHFXwCGRb_WCuOHzvtDSugK.Xe0AphA.qWLFv8bvN6iSvI1.i
 a.mDlUSOK_zArQhXWDUppartsh.3xzLaFoDKldCOk
X-Sonic-MF: <bluescreen_avenger@verizon.net>
X-Sonic-ID: bb50d54e-28ab-42a3-853a-2e04ff8898d7
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.bf2.yahoo.com with HTTP; Thu, 9 May 2024 13:06:35 +0000
Received: by hermes--production-bf1-5cc9fc94c8-kfglr (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 21b0fa36f1014e33cc2872d886055c3a; 
 Thu, 09 May 2024 13:06:30 +0000 (UTC)
From: nerdopolis <bluescreen_avenger@verizon.net>
To: dri-devel@lists.freedesktop.org
Subject: simpledrm, running display servers,
 and drivers replacing simpledrm while the display server is running
Date: Thu, 09 May 2024 09:06:29 -0400
Message-ID: <9215788.EvYhyI6sBW@nerdopolis2>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="nextPart5361615.kQq0lBPeGt"
Content-Transfer-Encoding: 7Bit
References: <9215788.EvYhyI6sBW.ref@nerdopolis2>
X-Mailer: WebService/1.1.22321
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

This is a multi-part message in MIME format.

--nextPart5361615.kQq0lBPeGt
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi

So I have been made aware of an apparent race condition of some drivers taking a bit longer to load, which could lead to a possible race condition of display servers/greeters using the simpledrm device, and then experiencing problems once the real driver loads, the simpledrm device that the display servers are using as their primary GPU goes away. 

For example Weston crashes, Xorg crashes, wlroots seems to stay running, but doesn't draw anything on the screen, kwin aborts, 
This is if you boot on a QEMU machine with the virtio card, with modprobe.blacklist=virtio_gpu, and then, when the display server is running, run sudo modprobe virtio-gpu

Namely, it's been recently reported here: https://github.com/sddm/sddm/issues/1917[1] and here https://github.com/systemd/systemd/issues/32509[2]

My thinking: Instead of simpledrm's /dev/dri/card0 device going away when the real driver loads, is it possible for simpledrm to instead simulate an unplug of the fake display/CRTC?
That way in theory, the simpledrm device will now be useless for drawing for drawing to the screen at that point, since the real driver is now taken over, but this way here, at least the display server doesn't lose its handles to the /dev/dri/card0 device, (and then maybe only remove itself once the final handle to it closes?)

Is something like this possible to do with the way simpledrm works with the low level video memory? Or is this not possible?

Thanks

--------
[1] https://github.com/sddm/sddm/issues/1917
[2] https://github.com/systemd/systemd/issues/32509

--nextPart5361615.kQq0lBPeGt
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="us-ascii"

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Hi</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">So I have been made aware of an apparent race condition of some drivers taking a bit longer to load, which could lead to a possible race condition of display servers/greeters using the simpledrm device, and then experiencing problems once the real driver loads, the simpledrm device that the display servers are using as their primary GPU goes away. </p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">For example Weston crashes, Xorg crashes, wlroots seems to stay running, but doesn't draw anything on the screen, kwin aborts, </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">This is if you boot on a QEMU machine with the virtio card, with modprobe.blacklist=virtio_gpu, and then, when the display server is running, run sudo modprobe virtio-gpu</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Namely, it's been recently reported here: <a href="https://github.com/sddm/sddm/issues/1917">https://github.com/sddm/sddm/issues/1917</a>&nbsp;and here <a href="https://github.com/systemd/systemd/issues/32509">https://github.com/systemd/systemd/issues/32509</a></p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">My thinking: Instead of simpledrm's /dev/dri/card0 device going away when the real driver loads, is it possible for simpledrm to instead simulate an unplug of the fake display/CRTC?</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">That way in theory, the simpledrm device will now be useless for drawing for drawing to the screen at that point, since the real driver is now taken over, but this way here, at least the display server doesn't lose its handles to the /dev/dri/card0 device, (and then maybe only remove itself once the final handle to it closes?)</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Is something like this possible to do with the way simpledrm works with the low level video memory? Or is this not possible?</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Thanks</p>
</body>
</html>
--nextPart5361615.kQq0lBPeGt--



