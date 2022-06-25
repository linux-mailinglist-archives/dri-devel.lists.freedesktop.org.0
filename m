Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E06655AD6D
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 01:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A3410ED0A;
	Sat, 25 Jun 2022 23:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC10610E40D
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 23:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656199624;
 bh=Qs/pH1q8+WXCBzpHp5+tsgK0kJz9Prg89jDdOUgeLAA=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=YJ16LATVAaqDEXfCqWX5kIBiOqbb25j7I+qIL7A2K2a8NpJ8PSiVNZqdJWnS4N7me
 IstGzkCnfTiIkKyRuK4RtqpGuMtSwHzhoPje5ih4vqd+TbBYQ61NcJmHu9QMctmh2B
 TvjI8KN+xXynZ4b3K9QdVBVfZbSvw0NQnmkLUfbQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.162.44]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mwwdl-1nkWfb17ql-00yQmJ; Sun, 26
 Jun 2022 01:27:04 +0200
From: Helge Deller <deller@gmx.de>
To: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v4 0/3] fbcon: Fixes for screen resolution changes
Date: Sun, 26 Jun 2022 01:27:00 +0200
Message-Id: <20220625232703.401821-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lTnu1fWOblBzAat1bEuzW7oF1e3UKUcZeu/M+VCzlJ23+/20LFI
 5mJijGdDsy2fJ37/oVM3O+3PWzIexomzymXrupCcfSe6pczYioPvldQyftt8Vw+h/hEyaGA
 ZXMACwoyrKQxwjW0/Os4Wu3RwVi7RgM9Myql+e1UFkjEZOQPwf2GGFNwLOPyGr1KXyJgw1a
 qyTzXScT6S9fdXBEOd/mw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1eji9Z9Anrw=:aAATJbBTosvcG9m5QoRsSy
 qXGSeB9c5QYJmAYzfurxMtj7kEfUapDJ/Hd/Yi1K7xgG++CGzr2a5UhnFhLjgS++6Wcdqsi0G
 AbufOpADeuN7RH29nuCHK5NbAPab9urXnWGxi/84yc+81WCFdJM3LpWNMtBkDlO3KH9g4LGKX
 veJlIVCq0/1Da5iqMVdP4nkFGsK6YSuhuA/vsEMPTV+fh8z65OXs/HzlexjYN16rVOokEJP1B
 s3QQFWKR75INtHvZoGFlldTa85eUII1R3+bofD54789NgAmYTw1BSFcwVgyHA7fVXC+9KFyQ1
 nBJLu38ke6RINTqpMw7nCh+MjZrrbkKJVCDrqwbb359Iu1dj07jTObknDG8KZKKKISnl/2MxB
 JMMVzUDfQEFtlqmvrleyUkkGbF1GX+qVO6KYOKqZUTVxHF+oBM+GouOtXVC9gMRytylYvwHks
 JxqHZbXnTtjv2n4lP14hu5fHbEGjUo1WaYNQmp3Jd6cEDQf2lHWNoCH+4IrhVA5HMX2kTf5vU
 dflIErQDRrFUiuY9H2u3bzktDNu3qqCeHldskvS5T+MiWsii5Sz+97n+j5EBFPG95nBpJ3R8i
 2ZwRXBDialSUTaJzNMljTQ8ebvBD5wD5ySFdZ0zQKsTtQm0aBFAxxter+Ehjgziuvpoe4aHB+
 /SXwiK/PE90WYSOU366i0Ru0/7VcAUNgBeVnz5Sy0lAAkxyHKs5JHmlmXWtJSG3ZQlcQs3+cX
 G9ODcugYYyJGe5GWx60e8mhIDql7D4uO5XZMMYS4QaWlzA+dmlRDiXLDJisHibfMIjtNl3ijw
 jaaZNl8WcxF0NyFVQ+Ok9GWUJHYmermSZJG0EPwx1CfJDq+a7weHyQ0qnyTnOTphDNhqpkZJs
 M/psjUehPjzUT0ZhL4ugXKm5BluZyCffhTZdah7mqixX8log6dLPCWRT9TAWC1tLRBLAqgVx9
 VQcuJB8/rJCx5ARsRm8lQs55bGz8a73SZmFsgnWONlfmhWFb6VOE5dWqJB7zk+thkuAUr+a9e
 FUDSV3CbDyqC8ymcN0U9O/QUGRme5vw7mto+v/+QvwN6fFCgkt+50UMBv59kUz0Vjvrc+GgNE
 gl+2Aypw/Vz/YweybwSqxl9hog2zTjhbEa/mBMpywBagQu1B9wF6PILcA==
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

v4:
- merged former patch #2 and #3
- added more Reviewed-by
- new patch #2 needs more testing. Note added to comit message that
  another patch needs to be backport as well.

Helge Deller (3):
  fbcon: Disallow setting font bigger than screen size
  fbcon: Prevent that screen size is smaller than font size
  fbmem: Prevent invalid virtual screen sizes

 drivers/video/fbdev/core/fbcon.c | 32 ++++++++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c | 10 +++++++++-
 include/linux/fbcon.h            |  4 ++++
 3 files changed, 45 insertions(+), 1 deletion(-)

=2D-
2.35.3

