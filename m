Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BD8160CF9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8706E8A3;
	Mon, 17 Feb 2020 08:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D92E6E828
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1581698305;
 bh=aljnTBBsgqVrEDd/gZAFSsxFP6sDswfp9xiGBdfL1cM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=bqDWKVI/Vp3YAxe60eR6+WGucMg1H67N6O8r8ZLW0yRNqU143urojx8/60nnRRebe
 YXHkLM9nXvblGEL649ohvDF9PjBn9Iowm4fZW59mdhKgOJdt++r/WATx7Rd5tU4QFw
 r+N4obr7fkme+oFpoNvlJ5ivK9VnijHrdQTP7dKM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.12]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbzuH-1jcWAY0P8x-00dVlW; Fri, 14
 Feb 2020 17:38:25 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND] drm/mcde: Fix Sphinx formatting
Date: Fri, 14 Feb 2020 17:38:15 +0100
Message-Id: <20200214163815.25442-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:vZ9nWg5BWeKK1PKzyMUn6ldpagxahM+XpFuW53lIDolnke9gr2c
 RQUC5gkxbZz06w9tIB974S2dxOP+wJyl/79mFZdPo53zqFruF4o5j7rhFhLZMmmxH+84llB
 ER3FYu+hDSOh0QulSLYKQ4gv47VrGK5uvKalLABt6Jo90zAp8Sc0xK7qFy2cKFEK8dPzcls
 7bFG99gh7lgzU6Gl/hufQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KIrrjmF1rqM=:ZfVoE6CxftqLKTNVFw+DBU
 xxz+xlB5M8SyPHZ5JiBz6sFQkWwVJNtjCZvh4EKOvQMKcOoeT3cArZfbsniXkdpGZC0wA4V+j
 FH5YNtoofAJny+FanImwgUZWRPigBIk8k+Jl2FVPiu7gsMUaNCt+ouS9vKazLK4n9tn8//fqe
 /g0YwCrHezTjvq89mfbPtr7dEkyxTO7CNAowKicHLwmvPeEXazEVTXij6rSkzeblitTxyGpl8
 A7H7QWXtskfX6dxGM6AFh4trMzDalDA+7iIQmcmhHcQA+FDrgSzcxJutRROJwHBXzwesYIDjM
 pjDSEfRMwYlmdQ139qZJGs3oIQd9W9OGWzj95MPA/0z8h3XAxZ2mcWBDzYSwEGIxlsn/LzwUD
 TbVWfPOv9++PRETtt+zmoIjdSLrQE85gNSepi0dI5VcaoVwcw1IpQNha7Egc8odcmoYqzLdOo
 23AOiLN6frx1mFeLYu/THm/doCFEgI+DMxBUdbIihwabvrRzojqflzHwLHHLBuSYt30ObrpW3
 7nj+L1sbKCevzQqI9CsFNcaswseH6eblVWBYNQLJm0DkScn4lBUpzezkpkGUwrsW7/+bJkdv7
 T5MFJzV/X8QUBUcZ90nWtIh6XCkdZjFo6kbu6DNmrRKaR8NaFwkqEbeKCM//8Q5ymgx8h9Wg4
 PDGyRDlCfMYYtQBNV4ObwzWs+ebTH2WIoavKLQ9l5Ld7BBPM3XEBgjvvFfQ4+NhM/EjJ6my+K
 sqmuLNp6F1yP9tE0dOLPbf/tOejYjOGvM0sm8yOPBhvhchzQ7WGC+ccbBEDhb8Y9dMj5u0GIf
 aZF2qUyQZ2GfkrnCJYQmzExhWOjlUi4Ubz29ajvHdY00W5WEsMLQbDMu1rEs62CcxpkxdfyCE
 amTSV25I0hEBFVtgkAGsakRCI5hDBBv0Ve+NlAOvUwHM7003uhyjhWc4Ya4un1WzkBSksUMLN
 ZdvYUoER/4Exl7UZCVnL/dyt5NUXJxxsZIDcqDWUVOxq7GreLQrVUDWoRedOr+SpGlwrS/Pcl
 0QkC//3zXqLKjU+ZDO8odU9+A435N5GFTZUkB5+7ZIc2IbLz8YDvaBbkMAuXqQzsjLGb/TFa3
 xpZx6+XXMJJcqMOjKe1/xX0h3mbGGG1zU8EHSFlSbZ/ehGilzBuMtEZPOFUe33fGTPWDyAADP
 I3qjgN/TL5v5DQppmNQ/Ka8YJ/4MtXjTbImesOL3T7qkBf5LW6hHLC8cVd/wtLMMeEBoKUAaD
 VaAHYEDD+dx1aegof
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LSBGb3JtYXQgdGhlIHBpcGUgZGlhZ3JhbSBhcyBhIG1vbm9zcGFjZSBibG9jay4KLSBGaXggZm9y
bWF0dGluZyBvZiB0aGUgbGlzdC4gV2l0aG91dCB0aGUgZW1wdHkgbGluZSwgdGhlIGZpcnN0IGRh
c2ggaXMKICBub3QgcGFyc2VkIGFzIGEgYnVsbGV0IHBvaW50LgoKU2lnbmVkLW9mZi1ieTogSm9u
YXRoYW4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0tClByZXZpb3VzIGNv
cHk6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTEwMDIxNTM4MjcuMjMwMjYtMi1q
Lm5ldXNjaGFlZmVyQGdteC5uZXQvCgpJdCBzZWVtcyB0aGF0IHRoaXMgcGF0Y2ggZ290IGxvc3Qs
IHNvbWVob3cuCi0tLQogZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYyB8IDkgKysrKyst
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWNkZS9tY2RlX2Rydi5jCmluZGV4IDlhMDllYmE1MzE4Mi4uYzUzNWFiZWQ0NzY1IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tY2RlL21jZGVfZHJ2LmMKQEAgLTIwLDExICsyMCwxMSBAQAogICogaW5wdXQgZm9ybWF0
cyBpbmNsdWRpbmcgbW9zdCB2YXJpYW50cyBvZiBSR0IgYW5kIFlVVi4KICAqCiAgKiBUaGUgaGFy
ZHdhcmUgaGFzIGZvdXIgZGlzcGxheSBwaXBlcywgYW5kIHRoZSBsYXlvdXQgaXMgYSBsaXR0bGUK
LSAqIGJpdCBsaWtlIHRoaXM6CisgKiBiaXQgbGlrZSB0aGlzOjoKICAqCi0gKiBNZW1vcnkgICAg
IC0+IE92ZXJsYXkgLT4gQ2hhbm5lbCAtPiBGSUZPIC0+IDUgZm9ybWF0dGVycyAtPiBEU0kvRFBJ
Ci0gKiBFeHRlcm5hbCAgICAgIDAuLjUgICAgICAgMC4uMyAgICAgICBBLEIsICAgIDMgeCBEU0kg
ICAgICAgICBicmlkZ2UKLSAqIHNvdXJjZSAwLi45ICAgICAgICAgICAgICAgICAgICAgICAgIEMw
LEMxICAgMiB4IERQSQorICogICBNZW1vcnkgICAgIC0+IE92ZXJsYXkgLT4gQ2hhbm5lbCAtPiBG
SUZPIC0+IDUgZm9ybWF0dGVycyAtPiBEU0kvRFBJCisgKiAgIEV4dGVybmFsICAgICAgMC4uNSAg
ICAgICAwLi4zICAgICAgIEEsQiwgICAgMyB4IERTSSAgICAgICAgIGJyaWRnZQorICogICBzb3Vy
Y2UgMC4uOSAgICAgICAgICAgICAgICAgICAgICAgICBDMCxDMSAgIDIgeCBEUEkKICAqCiAgKiBG
SUZPcyBBIGFuZCBCIGFyZSBmb3IgTENEIGFuZCBIRE1JIHdoaWxlIEZJRk8gQ08vQzEgYXJlIGZv
cgogICogcGFuZWxzIHdpdGggZW1iZWRkZWQgYnVmZmVyLgpAQCAtNDMsNiArNDMsNyBAQAogICog
dG8gY2hhbmdlIGFzIHdlIGV4cGxvaXQgbW9yZSBvZiB0aGUgaGFyZHdhcmUgY2FwYWJpbGl0aWVz
LgogICoKICAqIFRPRE86CisgKgogICogLSBFbmFibGVkIGRhbWFnZWQgcmVjdGFuZ2xlcyB1c2lu
ZyBkcm1fcGxhbmVfZW5hYmxlX2ZiX2RhbWFnZV9jbGlwcygpCiAgKiAgIHNvIHdlIGNhbiBzZWxl
Y3RpdmVseSBqdXN0IHRyYW5zbWl0IHRoZSBkYW1hZ2VkIGFyZWEgdG8gYQogICogICBjb21tYW5k
LW9ubHkgZGlzcGxheS4KLS0KMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
