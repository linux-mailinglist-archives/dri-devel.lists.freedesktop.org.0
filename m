Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B27E65F51EC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 11:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA90F10E48A;
	Wed,  5 Oct 2022 09:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1071910E5AE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 12:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664884940;
 bh=fs3ySkOW+EiPXZAZkPQfN0y5SLnhnrmupPI5ncy/v8k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=dY+iPSDlStmqyECrjt9DJPSsal/XH57fIOBnsnTQugjmqZyeQ4XDxpQKWrgqCWLbH
 pT9tVC6LXRYCIzMbg409elKF5qhA1M5nvt1yb6OTyRx4CX5x5srIEgCcHIhsjLWaE5
 O8p/S8oXkxczELs/rUdk4sK/8Ey3FWqGPSFowS/4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ubuntu.localdomain ([77.246.119.226]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJVHe-1ov91u2PKS-00JvRl; Tue, 04
 Oct 2022 13:57:14 +0200
From: estl@gmx.net
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/1] drm/bridge: ti-sn65dsi83: Fix LVDS panel overclocking
Date: Tue,  4 Oct 2022 13:57:09 +0200
Message-Id: <20221004115710.1553357-1-estl@gmx.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Y6GHTVG5j6goV6lbLn7qF/iq/zdfKnFuLcSOnOvW2SoQR72Wyio
 g5kU4UmMNNcRewXwOh7p6vb9UF8EfskyKEmPqhbYfeI+1fCTT73C38zRLEDbOi+YNgUdA7i
 lGCPCoxg98PifOusc6pWCtEoYAFKp0q3vfO+iSoILdkliPMlaOiQpAByKHcGY8HMl9+bJs7
 uhZWRgJx4gJ0+QsIYNDnw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5kxIRp3/JjI=:lreEPZ/am4iQ1gGO86bjvw
 9XVixzLjOgcAuSegM1dW1cO21E6RMBwsbyIlMhBxWmEqWpksHA51N/Qv42TPOZgTwbpaJnaYP
 B6hmtOQgBJf0KvjR1WEuztV8QeEh4ZKJSm70ArrOlb94ekezDnUdyxlaEosvYZdvYzjySqS4d
 65guevTrvtEZMSS6ZD5KSXTk+FF11UoigfA731waVPsnRIrraZhfT7l0jL84wwJ8uBN/a8RD6
 QIsYWH0wnED9I7mx7R0tJYi3fyDHViErdpcLcmRgH5opyQ3Ywii3eFjXzV7aATy9E1ypM3+SX
 KlBDvTjcuiJ0KfEhh5fLSZjsPBbGOfUJw70CvRTmVbTaVphDNwz1MyxvUyE0zm/sdSN7idQpg
 VLVZ3tM+vh7EGG4JH+HklIP/dSTmcZpi1tPydHYB/VsDtafuNrYlAB9O5QXCeNj/nTApUNZxD
 2pZPYIgFqBl9fNtS2pJfRCL85SCchRELZ9X+YeAxbgpeX/kyT/ubUWzV5zf6iYnOPbNM62cqy
 nF6IENseXlM/qcl7Ehv0qELu7PSKQaTei95QaGi+3keMagrF3HxdepimNxbU/WwwcLSJ/bG8s
 3l21OLvMuJEzfLlvNMg0R6+b5tjMKsjQGvJ+JItucgKf93C8vv0AIdxdJSZr+XXVsH+8NHNLF
 C4qTIbkck8pKRv7ZqPXUgQkD2Ju/A0tHYCVM5oc9NKPsd+I9ol2gxlQKOExlPq3/pfOs1nCW3
 LYPJj+B8F4a/Szb8u2AQpKV+mW4xBlyr1qmdwF0IQka1ySn9wk52Lc0CrkN56hitziFm3wfNb
 7i4x1Kze9b8AchFuBjd/JMQaGVPSMBlNZNRaHutjgx+mNdbcI8UkOCxey3hlasqDwZIr3i4N2
 S0PCReIUClYvP3orqAVxv1ttGtjMiJJlUpps6kvrFqFvk2Wj1Sf2cNhOUZ6SGDnJfPdTPYhCw
 cec88vW1qLJ2lUMDB8o7O2BvDMxUjElMcwlXYNk0Nqnnu9SnajHVGWj7xydr2FQlJdy2H6Qei
 zVBA8gf+8C09zg4UlXCXN5O2Zrcpg+eMJo8Y/SqDYZ2RSG2UTM18M4b79LSmTg0j1HxQEbWbF
 Tw+rCvNnKjP2A8Ka/MC8UJZi4lkhxARf+8ZLOp+M1Uyz8QRPyYCaVJLuBjClUVrqHooWbAbBd
 tWb38=
X-Mailman-Approved-At: Wed, 05 Oct 2022 09:45:02 +0000
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
Cc: Marek Vasut <marex@denx.de>, Eberhard Stoll <eberhard.stoll@kontron.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Eberhard Stoll <eberhard.stoll@kontron.de>

I'm currently working on a board with stm32mp157 SOC which contains
a synposys LTDC to DSI bridge (drm/stm/dw_mipi_dsi-stm.c). In this
configuration i observe a overclocking of the LVDS pixel clock.

The reason for this is, that the synopsys bridge increases the DSI
lane clock by 20% for burst mode. On the other hand the sn65dsi83
chip uses the DSI lane clock to generate LVDS pixel clock. So in
this configuration the LVDS pixel clock is 20% higher as the panel
configuration pretends.

Removing burst mode solves this issue. It also seems sensible to
me, that a fixed divider to generate the pixel clock out of the DSI
lane clock is not compatible with burst mode.

But i'm not sure if i'm missing someting in the big picture and
whether this issue should be solved somewhere else.

Eberhard Stoll (1):
  drm/bridge: ti-sn65dsi83: Remove burst mode

 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

=2D-
2.25.1

