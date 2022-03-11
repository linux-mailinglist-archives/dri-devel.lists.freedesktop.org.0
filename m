Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECBF4D618F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 13:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F8B10E95E;
	Fri, 11 Mar 2022 12:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABFB10E95E;
 Fri, 11 Mar 2022 12:30:44 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1647001842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iGjJ4TBsWHm5TiXi6/pffWagCsVPkn1ed0Af/pLc4uI=;
 b=3G7IszRPENmilBXPsqfS057rH0YJqxkNsG5ofMjoYlXPt3FioXcvYg2MyB0yqYrF6VBpMh
 DuvfANC9Tjatdb2fxtvYB8UHv/Nkq3Vf/2aMnClTd0cvkvDzXJw+2GLAJ29Iw95SJd4gYm
 SB4P+8V/nXmn1qF00T3UvPYoZj7FdCA+QP4+SqT2f0CQiXob4idc9e2NKbQTHKXrOuT48I
 zkSGQvXurq1LacNhZBqaJ0SJK1Bd4rDGubo9zvq8UVbxyrlGqdXxiF/Ja78vmZG7HZ44Lh
 Df5FNOa2Oq3dI0i2pc1c01RpYrrAML+T8RRfKaHLudXcs/9pawlHPizHdg1S9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1647001842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iGjJ4TBsWHm5TiXi6/pffWagCsVPkn1ed0Af/pLc4uI=;
 b=PwJfRu2EJJzE6fQSTKA/PBJT9I8IxONpOeq1GIsvW0It0FRhnO6sN3FkAAWjOdED54LVyF
 Fo2jbzewDi+IxXAg==
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] drm/i915: Avoid explicit IRQ-off sections.
Date: Fri, 11 Mar 2022 13:30:30 +0100
Message-Id: <20220311123032.4078431-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

these two patches are from the RT queue. They avoid IRQ-off checks and
IRQ-off regions which are not valid/ possible on PREEMPT_RT and are not
needed on !PREEMPT_RT.

Sebastian


