Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BC166759
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 09:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C916E2D8;
	Fri, 12 Jul 2019 07:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anchovy1.45ru.net.au (anchovy1.45ru.net.au [203.30.46.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454046E07F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 08:32:06 +0000 (UTC)
Received: (qmail 12548 invoked by uid 5089); 11 Jul 2019 08:32:04 -0000
Received: by simscan 1.2.0 ppid: 12384, pid: 12387, t: 0.1091s
 scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
X-RBL: $rbltext
Received: from unknown (HELO preid-c7.electromag.com.au)
 (preid@electromag.com.au@203.59.235.95)
 by anchovy1.45ru.net.au with ESMTPA; 11 Jul 2019 08:32:03 -0000
Received: by preid-c7.electromag.com.au (Postfix, from userid 1000)
 id 5EAC120971BA7; Thu, 11 Jul 2019 16:32:00 +0800 (AWST)
From: Phil Reid <preid@electromag.com.au>
To: gregkh@linuxfoundation.org, bhanusreemahesh@gmail.com,
 leobras.c@gmail.com, nishadkamdar@gmail.com, preid@electromag.com.au,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 devel@driverdev.osuosl.org, nsaenzjulienne@suse.de
Subject: [PATCH 0/2] Staging: fbtft: Fix probing of gpio descriptor
Date: Thu, 11 Jul 2019 16:31:51 +0800
Message-Id: <1562833913-10510-1-git-send-email-preid@electromag.com.au>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Fri, 12 Jul 2019 07:00:44 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R1BJTyBwcm9iaW5nIGFuZCByZXNldCBwb2xhcml0eSBhcmUgYnJva2VuLgpGaXggdGhlbS4KCkZp
eGVzOiBjNDQwZWVlMWE3YTEgKCJTdGFnaW5nOiBmYnRmdDogU3dpdGNoIHRvIHRoZSBncGlvIGRl
c2NyaXB0b3IgaW50ZXJmYWNlIikKClBoaWwgUmVpZCAoMik6CiAgU3RhZ2luZzogZmJ0ZnQ6IEZp
eCBwcm9iaW5nIG9mIGdwaW8gZGVzY3JpcHRvcgogIFN0YWdpbmc6IGZidGZ0OiBGaXggcmVzZXQg
YXNzZXJ0aW9uIHdoZW4gdXNpbmcgZ3BpbyBkZXNjcmlwdG9yCgogZHJpdmVycy9zdGFnaW5nL2Zi
dGZ0L2ZidGZ0LWNvcmUuYyB8IDQzICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCgot
LSAKMS44LjMuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
