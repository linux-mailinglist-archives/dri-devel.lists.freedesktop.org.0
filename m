Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF7755B074
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 10:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D50C14ADAD;
	Sun, 26 Jun 2022 08:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCDD14ADA7
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 08:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656233776;
 bh=4JAuHaTLkz/JzLra4c18B+NmRKbJo0riSTivAcu/sJY=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=C9eTeVKUgKK4Q6PNeNa6vCXTc8J2sFojexwTdm9dkxZ+XMJDwF6GG/bq351xCeOvJ
 95ll91OQNo7sTm/ZkeksO0LnHAhjNUXLEfbf3DAU7isP40g5f5tNqCy0k7VHAyAi5X
 jpWkmImRXOs1y1IeKZAElJ/0ITGo7S+7F4QhNCNo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.166]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4s4r-1o7IwR19j5-001x4b; Sun, 26
 Jun 2022 10:56:16 +0200
From: Helge Deller <deller@gmx.de>
To: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v5 0/4] fbcon: Fixes for screen resolution changes
Date: Sun, 26 Jun 2022 10:56:11 +0200
Message-Id: <20220626085615.53728-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6WYwd5gOQ7tonxkhAAO1TF0Js4BLQQvOzKW7x2PuJrIBko/g9Pj
 ZTzHffgui7A2vLV/WhEADI62PT5DVxC79X1HTmNHCybTc+SdAQKr+WS82We0odaFuMcE9u8
 tk2mXOpD2GYHvHdUpx9OOYbZtdGEJU2YKguvZdTRDVSNZMeICKVOl1LZtVsf0LsDL9dpi3m
 TymYY/+x4liFypsDVwYWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ck5oGGMOf7c=:GABgZh38PdfBrhCiDTsR/5
 Xq1OfRlHt/BaOcNedaqnTDQgwsmC+4WJ3RDyOhWl6gmX791ThawFY3C4SLc1ClIfH9iOeP3gb
 u2B9GZQTBBOsj2o5H+UdD1QzWC6lz9tM8yCabkgdaxp6aLf2P8cbn/B5pBJpTudidNnOkxsSW
 SQeQfJR0vhHW9iKv85hU0pJJMwGSK9yhOhs+Uboc4uIH8i307sQeIITDEd10nJBxyDa7WYIuj
 v8MbnWNgbvlSw6S3WfnFkLIZzqXLMjM/nzEEta20GbI+c14LVcP+8VPwOPe6xeOr5FfhA+qOQ
 aM1R/JopY0927RD8h9n+WBRAStyHazSutUUiNJFcl5MB73HIhpYZbi+x+rmftGaxUGF/wzT0N
 8WoTsIEoW04cEsC2pTklSbY7a2RMDsXSU2MNmw/fa+padCLl6pJLyNlvG7mmIZbKuWaMJ9Eqd
 wJthqsbIC/Mtj9bhIlMu72pqTH/RQgXwapyInu22vXEG8palhr6UnJ2xeA04+lZMz5xvaGkgL
 hlI/tXJsFuatqZ8zxCIk2TbUlv1xfWhPz5SJ0E5wl3xhstbfybJeAki5TH2UWTK4WYnc0Y209
 RjpMuHv50K6iF1oYxayNmIqd1qPDsS5QWNNiWCguXs58cWM1WMSs8mX6IEQl1aK/kdl1LQWcS
 +pZhKLkD4rPz+holUmYom87ZXvfh466roJC63xK2uJ7gG/a66eergCVppLzCKKWbASl1un6a1
 9R19QwvSwpV1radmkVQju/pP+SBYw55dYMZgV5tlLkH0oXL8YAQDLw2LFiS1XsPyNMtSDXy+D
 Lszha1O5CNeLwDhop5XVeVXIi+9l21jbnFxU2I0mK9s8RGflO5UlmSNZMO3S77dacX7enaO4j
 EKDshRFC8uYvb7QoOj60Ko27f09zMZ+c/rbgiMhQkOUJVXvMV5Y+SaBL0Ay7iYHWPZ54VRHIC
 9MzoJ8WrD86YHF8KV17ctZ7AG7m0PNFuwKhD4LEG3kWISHKQt5hvlVGYOoS7KFfwXinfl+jZ3
 fwibK0bKsgU1fTR8L0Bvy5MvvN+Jh4a4dl3FZGRXN50dWTCFTZIoq9HLg8t81qJZV3lg2XiG/
 iGLvFySa2jVQEkiqV7fCmFgeqgKz4L883BlpPJSLq83F1ni9hQ0MXjikg==
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

This series fixes possible out-of-bound memory accesses when users trigger
screen resolutions changes with invalid input parameters, e.g. reconfigure=
s
screen which is smaller than the current font size, or if the virtual scre=
en
size is smaller than the physical screen size.

Major change in this version v5 is that since we can't easily push
commit 409d6c95f9c6 ("fbcon: Introduce wrapper for console->fb_info lookup=
")
downwards, a new patch #4 to clean up the old usage of "registered_fb[con2=
fb_map[i]]"
afterwards has been added.

v5:
- swapped patch #2 and #3
- modified patch #3 to use registered_fb[con2fb_map[i]] instead of
  fbcon_info_from_console(). This is necessary that the patch can
  be cleanly pushed back to v5.4
- added cleanup patch #4 to fix up patch #3 again to use fbcon_info_from_c=
onsole()
  for v5.19+

v4:
- merged former patch #2 and #3
- added more Reviewed-by
- new patch #2 needs more testing. Note added to comit message that
  another patch needs to be backport as well.

Helge Deller (4):
  fbcon: Disallow setting font bigger than screen size
  fbmem: Prevent invalid virtual screen sizes
  fbcon: Prevent that screen size is smaller than font size
  fbcon: Use fbcon_info_from_console() in fbcon_modechange_possible()

 drivers/video/fbdev/core/fbcon.c | 32 ++++++++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c | 10 +++++++++-
 include/linux/fbcon.h            |  4 ++++
 3 files changed, 45 insertions(+), 1 deletion(-)

=2D-
2.35.3

