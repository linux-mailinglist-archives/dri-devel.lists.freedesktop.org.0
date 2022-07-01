Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17232563AE2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 22:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029D714AA29;
	Fri,  1 Jul 2022 20:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB20918B108
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 20:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656707033;
 bh=Z1UEhgmidaXi4/WieoYcUBXq92uqjzRZY9cnT4LiicY=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=SV/a+sKo4bE6Qm6R+8Eenicw+ZA8UG7p1UNlv41KpcQ6E6E3fF8TCXvHenJNzEddd
 9+8FGK8wJkHIsWWKTS9OkKzQpNino+Uq5+RqN9RJW2ffzZEFonc2Pq4wKGOYP5bcfQ
 uOp9jXIKwCoOCnwQ8b9lm+a9dGt5MtzKhZyoEVg0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.182.192]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6ll8-1nz6m71ysY-008NIA; Fri, 01
 Jul 2022 22:23:53 +0200
From: Helge Deller <deller@gmx.de>
To: geert@linux-m68k.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org
Subject: [PATCH v2 0/4] fbcon: Fixes for screen resolution changes - round 2
Date: Fri,  1 Jul 2022 22:23:48 +0200
Message-Id: <20220701202352.559808-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MCfHJW8wQPELwgxc8meZE0bEqToyvAELGqzxQFhkpZO6Xj19H36
 3z04dEvE71V5dnHmsIXWym5/dgMijOXWzfIHQEdLi7/gTZGZEjRQdKvFZog1+LaH5sHGoBV
 CLJTPw9vGDJy2euKGiL0fJFLnZwHiS4tXqQUpc2s8J6RfL9GkpURoQOAO8uh4UxdyGxTnFl
 AkzPgHwef8g8vmZQB4fiA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eRqgOc7sqaM=:6FENq9gb0/1BsGMKWWlBpU
 voXqpuaZFhK7wlA5pmaRfcVW1MMtNoU/5TzWxqIbImMw9sttMVyX1ZVRlB6zfRdFMVaYYLuk6
 GH0q0UG1NJp1C1eLaTKL+nkFrEpbGir8yCcJ6vLPl9/D2oRK0DF6z8RSoX8zUyylEFuDLB+q3
 J/izvrYiTpxY7pjxfRAWx5Y9YikNoqVhjAfFMzdwsKtPI5aYIf4dtTI27mbbNFmZKE+hnZAUk
 HFXSVVlb1GvtAq/gpoKn9KUoY/C2fAT/I5lu5wat/cdBrqCuI/bNyuD8S0Z+Q9hccIotmPaHC
 oKtBI9u03ElZQAS0xViTUGjEK+9iQKbuwlycSpi/0bI/NhkZ7wpbt1oJFbwkrpw/+Gn9cV4ya
 k2O9ggodmxxpJBt1QqjEtBMhEuRQW+7pTnvEHOSagaKQt68LDNsOiDj4eF7g9VZDaK729+fB1
 LiIDStAmVezuQf0ODSSCT2258niOQLpH6gHfGfHh5BFHjhWsFUuWOeWm7lFMkwsjAx9Gj+abo
 b603dXGcXJwHVR1h1fmnh7nDdWiv7CkscaY2pRkNGWVPhc33NlEihQb0/BdXK7VIM9ikpCZTO
 051A528EG2Lw421maDMge/qHRtgaj9MukDkZX1c6wRzZFifrT2z4M92KlOsAtesVw/sdTkJib
 bA108cHCiQWR7H5Dz0U7uXw/enWU+QUwepAMcUeMVHVhQ9J0PCAfRJdDoOGViGiiUf2KpQMa9
 fRsRYGOi8bHZrQHlS+drvJg3gfmGnfWJh8ZOwYxhUcaJ+BLObW+Blk2r2jCSsQNsmTUTosmdA
 zPC67UTIoAiYqTa4+CGagAG3P2LkBXfu/1QTV1vIa4kHzpCbLd1eSuv0rdkqAi5WGgZjyoHMT
 AfoF7TSX/EjBwnR+1yHdPZHckahtG0KH7EhlNKkB6v3REaSwzx3YkpxvK7kv/ddmzDs9bWCla
 11SuIhzDJLl2/F5tnF+kuct0XLdGYMHqGzQmtg6gaw7YafTyo3IXjGOoSPMq0CmTPf1n8JRIs
 whkaLUSQdNRd2x4WxNsCvQgvTxlpr454V2glKC/oex6855fDccNKekyemKFRvNOxF3f1QvEl9
 Kz6t0nXB0sUTPa/YgtOXeQk8z2utG9Ae+G2BXXvBIvyxEa+YTtUYxKgEA==
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

Changes in v2:
- don't fixup wrong xy_vres values, but instead print warning.
- add Reviewed-by tags, minor variable name fixes

Helge Deller (4):
  fbcon: Disallow setting font bigger than screen size
  fbcon: Prevent that screen size is smaller than font size
  fbmem: Prevent invalid virtual screen sizes in fb_set_var()
  fbcon: Use fbcon_info_from_console() in fbcon_modechange_possible()

 drivers/video/fbdev/core/fbcon.c | 33 ++++++++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c | 16 +++++++++++++++-
 include/linux/fbcon.h            |  4 ++++
 3 files changed, 52 insertions(+), 1 deletion(-)

=2D-
2.35.3

