Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA2397ADC6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 11:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DDE10E209;
	Tue, 17 Sep 2024 09:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Pa69DZwm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id C5EC010E166
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 07:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Content-Type:From:Mime-Version:Subject:Message-Id:
 Date; bh=VCMoz0pfiXITvmkI13i26DbCBRGs50uyhJjWCgV/eW4=; b=Pa69DZw
 m1ZSqb+Rgb0L5a435iss0G4wVvavD4a+Vs3aQ6ziwJL6cqzKdHJBRMreXXg4XhDL
 fMWB6mP+r2QGi4BLQ7P1r7RXcc8uYzvyN3+BMHU27TN8f1UQv0mo5uvAUTQF9rQb
 eZgEXVzgOUS5rGQoOTg68K4hwjaVg9DYU2ns=
Received: from smtpclient.apple (unknown [39.144.238.104])
 by gzga-smtp-mta-g2-3 (Coremail) with SMTP id _____wDXH86wL+lmr6HVBQ--.38819S2;
 Tue, 17 Sep 2024 15:28:48 +0800 (CST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Qianqiang Liu <qianqiang.liu@163.com>
Mime-Version: 1.0 (1.0)
Subject: [PATCH] fbcon: Fix a NULL pointer dereference issue in fbcon_putcs
Message-Id: <578C92EE-A2B2-4611-BDBD-E33EB6CAB046@163.com>
Date: Tue, 17 Sep 2024 15:28:37 +0800
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
To: Helge Deller <deller@gmx.de>
X-Mailer: iPhone Mail (21H16)
X-CM-TRANSID: _____wDXH86wL+lmr6HVBQ--.38819S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUvmiiUUUUU
X-Originating-IP: [39.144.238.104]
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiYBRdamV4JTLP7gAAso
X-Mailman-Approved-At: Tue, 17 Sep 2024 09:21:51 +0000
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

=EF=BB=BF
> I think this patch just hides the real problem.
> How could putcs have become NULL ?
>=20
> Helge

Oh, you are right!
I will figure it out.

Best,
Qianqiang Liu

