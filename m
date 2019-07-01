Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E13A5BBA1
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 14:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F6D89C25;
	Mon,  1 Jul 2019 12:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44746898BE;
 Mon,  1 Jul 2019 12:37:20 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id a97so4991871uaa.9;
 Mon, 01 Jul 2019 05:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q8qXk/n+3rdVBDEavtXjY7etsHzDiYEiRL3WTtVL85Y=;
 b=LEE8N1dBbbucfJrlzwh0ii3jGIzw7/n8oq4pw71SXHHnBzV+iMQtjxLYPWIIdIaVE5
 Ug8MG/M2lF6osqwbGA5VveMBXW82F7sfo7T97HVKe5EwBJfW26RBEpHtoGWQRXiqQreB
 3jWN5i47DPY2+lStWM6v4P3knK0l5hzG8SFFnsflagM5HAacUO/SueVYALF2EYLbEIDz
 zyEJYzSTWDz71Q4r5i+6ynbzhidoNzrhj+edf/L6kRG6eqw9H8rv5KrmC3hQ56d4QfU6
 gZqeMwOs3R+dH8b3b/QG3mk0XpdKj/AhCWHiS0AEQl02qSv8noh4ruwAGe6ujDgafae2
 GEZQ==
X-Gm-Message-State: APjAAAUJbuXJEuWCqk2bs710gNzam960rLDMBguF01kaFcmVTJRQ4WTp
 CPCJkgkHrWqgPKudSd8JCc+SjUoRYYnGlJ1R/+Q=
X-Google-Smtp-Source: APXvYqwX1A2Ge22hNk0sNPWU4E1Kc+5pDoUd7KJF6Ltzx2z+GBS1+2EbBnnCCdTqd/lxfujquNJ3jA9QZRjJxZN2nr4=
X-Received: by 2002:ab0:5973:: with SMTP id o48mr5077380uad.19.1561984639288; 
 Mon, 01 Jul 2019 05:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190701032245.25906-1-huangfq.daxian@gmail.com>
In-Reply-To: <20190701032245.25906-1-huangfq.daxian@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 1 Jul 2019 13:37:33 +0100
Message-ID: <CACvgo52N7c3mtAvfH-98pkgHC6UpdKPNH+cYozb4yRsMetMhkg@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpu: Use dev_get_drvdata()
To: Fuqian Huang <huangfq.daxian@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=q8qXk/n+3rdVBDEavtXjY7etsHzDiYEiRL3WTtVL85Y=;
 b=qYcY/7lQy1CgNd8mir2T92J/oON5i+/nuKlFXZbwntSuvuJwOcgd5/nbtSfY9c5wyK
 68U+Qg0FMSB07vB2zreh5uJ0/057ANxLNDTzaNtIrRod8+E8PUmEPV8zB+CyzVbpetdi
 7iLYej+bNrBSeIEdu8AAmmE5MKztobYW4JAHWauvGIyDL+MwSB+suBGxZWFFm7GNDOsR
 S21Vix2PC5KtrjI8V2uUHvM9QtzqcruXKJNC+NJa45roazBRj7xNp/nyhnu4HpBejhjt
 d/giHHUifsBkWTZgsFQ8ijJ0gfMLmtv6aEYpOpU1sK5cz5fRdo/cjdLoRrpsbiD15LSf
 DNTg==
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
Cc: David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sibi Sankar <sibis@codeaurora.org>,
 freedreno@lists.freedesktop.org, Rajesh Yadav <ryadav@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Bruce Wang <bzwang@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Daniel Mack <daniel@zonque.org>, Enrico Weigelt <info@metux.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRnVxaWFuLAoKT24gTW9uLCAxIEp1bCAyMDE5IGF0IDA4OjEzLCBGdXFpYW4gSHVhbmcgPGh1
YW5nZnEuZGF4aWFuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBVc2luZyBkZXZfZ2V0X2RydmRhdGEg
ZGlyZWN0bHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBGdXFpYW4gSHVhbmcgPGh1YW5nZnEuZGF4aWFu
QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2Rl
dmljZS5jICAgICAgfCAgNiArKy0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X2ttcy5jICAgICAgICAgfCAxMyArKysrKy0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9tZHA1L21kcDVfa21zLmMgICAgICAgIHwgIDYgKystLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9tc20vZHNpL2RzaV9ob3N0LmMgICAgICAgICAgICAgIHwgIDYgKystLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jICAgICAgICAgICAgICAgICAgIHwgIDMgKy0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWRzaS1jbS5jIHwgMTUgKysrKyst
LS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyAg
ICAgIHwgIDYgKystLS0tCkFzIGZhciBhcyBpIGNhbiBzZWUgdGhlIHBhdGNoIGlzIHNwb3Qgb24s
IHRoYW5rcyBmb3IgdGhhdC4KCkNhbiB5b3Ugc3BsaXQgdGhpcyBpbiB0aHJlZSBzaW5jZSBpdCBj
b3ZlcnMgMyBzZXBhcmF0ZSBkcml2ZXJzLgpGb3IgZWFjaCBvbmUgeW91IGNhbiBnZXQgYSBzbWFs
bGVyIENDIGxpc3QgLSBwYXRjaGVzIHdpdGggMjArIHBlb3BsZQp0ZW5kIHRvIGdldCBibG9ja2Vk
IDotKAoKV2UgY2FuIHBpY2sgdGhlIFBBTkZST1NUIGVudHJpZXMgZnJvbSB0aGUgZ2V0X21haW50
YWluZXIucGwgb3V0cHV0LAphbmQgYWRkIHRoZW0gdG8gdGhlIGNvbW1pdCBtZXNzYWdlLgpUaHVz
IGdpdCBzZW5kLWVtYWlsIHdpbGwgcGFyc2UgdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCBhdXRvbWF0
aWNhbGx5IENDCnRoZSBwZW9wbGUgOy0pCgpDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4gKHN1cHBvcnRlcjpBUk0gTUFMSSBQQU5GUk9TVCBEUk0gRFJJVkVSKQpDYzogVG9tZXUgVml6
b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4gKHN1cHBvcnRlcjpBUk0gTUFMSQpQQU5G
Uk9TVCBEUk0gRFJJVkVSKQpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyAob3Bl
biBsaXN0OkFSTSBNQUxJIFBBTkZST1NUIERSTSBEUklWRVIpCgpIVEgKLUVtaWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
