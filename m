Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9546B2CD59
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE67F6E287;
	Tue, 28 May 2019 17:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www17.your-server.de (www17.your-server.de [213.133.104.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FB489836
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 20:41:19 +0000 (UTC)
Received: from [88.198.220.130] (helo=sslproxy01.your-server.de)
 by www17.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <thomas@m3y3r.de>)
 id 1hVMQn-0006wV-Ed; Mon, 27 May 2019 22:41:17 +0200
Received: from [2a02:908:4c22:ec00:915f:2518:d2f6:b586]
 (helo=maria.localdomain) by sslproxy01.your-server.de with esmtpsa
 (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <thomas@m3y3r.de>)
 id 1hVMQm-0002Kt-4r; Mon, 27 May 2019 22:41:17 +0200
Received: by maria.localdomain (sSMTP sendmail emulation);
 Mon, 27 May 2019 22:41:15 +0200
From: "Thomas Meyer" <thomas@m3y3r.de>
Date: Mon, 27 May 2019 22:41:15 +0200
Subject: [PATCH] drm/omap: Make sure device_id tables are NULL terminated
To: tomi.valkeinen@ti.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Mime-Version: 1.0
X-Patch: Cocci
X-Mailer: DiffSplit
Message-ID: <1558989631162-1860150863-1-diffsplit-thomas@m3y3r.de>
References: <1558989631144-20791398-0-diffsplit-thomas@m3y3r.de>
In-Reply-To: <1558989631144-20791398-0-diffsplit-thomas@m3y3r.de>
X-Serial-No: 1
X-Authenticated-Sender: thomas@m3y3r.de
X-Virus-Scanned: Clear (ClamAV 0.100.3/25462/Mon May 27 09:58:16 2019)
X-Mailman-Approved-At: Tue, 28 May 2019 17:13:51 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFrZSBzdXJlIChvZi9pMmMvcGxhdGZvcm0pX2RldmljZV9pZCB0YWJsZXMgYXJlIE5VTEwgdGVy
bWluYXRlZC4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBNZXllciA8dGhvbWFzQG0zeTNyLmRlPgot
LS0KCmRpZmYgLXUgLXAgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb21hcGRzcy1ib290
LWluaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLWJvb3QtaW5pdC5j
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLWJvb3QtaW5pdC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLWJvb3QtaW5pdC5jCkBAIC0x
OTgsNiArMTk4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb21hcGRzcwog
CXsgLmNvbXBhdGlibGUgPSAidG9wcG9seSx0ZDAyOHR0ZWMxIiB9LAogCXsgLmNvbXBhdGlibGUg
PSAidHBvLHRkMDI4dHRlYzEiIH0sCiAJeyAuY29tcGF0aWJsZSA9ICJ0cG8sdGQwNDNtdGVhMSIg
fSwKKwl7fSwKIH07CiAKIHN0YXRpYyBpbnQgX19pbml0IG9tYXBkc3NfYm9vdF9pbml0KHZvaWQp
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
