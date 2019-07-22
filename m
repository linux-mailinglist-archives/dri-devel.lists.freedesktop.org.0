Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C17DE70866
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 20:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BD589DB0;
	Mon, 22 Jul 2019 18:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F0689DB0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 18:25:04 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id az7so19517783plb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 11:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x8c0DPCRMv9IW9PP1p4HBNy16Fzp3nQIOkgwmBpQwpo=;
 b=Kv0sZNwySuFYi+9+E2iyx7uuvDWHAM5357ppjDN8AeB32R9aKP9fDPk6mbIldoFlOq
 AiV7t/sGx7LkPYs14RB1lZRZ6xxDP+6LBkdQuF31mepbVVLYbvgfKHcuWRqs30pMQszc
 Ud7MAchC75ng32rURQSA0B8LuXwfBBDeWv+ZO/xqdIWK6WCD51q/oNJJs9bu/62YIhkh
 bR03lrDJn5BUGvZOIS2Uz8kqpgQX1ml/UAGq9XUWhLrBrJA7/ex9CnA9lHgn8NOj/+TI
 iSmqL4UCNMRuJTzZjffFoXESOV0azDKgD4oeEZVGgsyU9HTl+dvjY3oOAY14hL7uTCyP
 XpIQ==
X-Gm-Message-State: APjAAAWrnqz6X+y+JlH7rL6Pyww0H7IkaHSmsdOd0thYlhupdxCttgoT
 3nz1bQwabGcwpIry4Qr+Xr1d6g==
X-Google-Smtp-Source: APXvYqwyyl3J3Mb8JWQgZSDuxJTdfEQ/qKsf4Mi5pmNYAuIsVFOtUl3uWg6CUWJmNS9uHBU4AAA4AQ==
X-Received: by 2002:a17:902:7448:: with SMTP id
 e8mr76695940plt.85.1563819903648; 
 Mon, 22 Jul 2019 11:25:03 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id a3sm36117683pfl.145.2019.07.22.11.25.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 11:25:03 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 0/4] video: of: display_timing: Adjust err printing of
 of_get_display_timing()
Date: Mon, 22 Jul 2019 11:24:35 -0700
Message-Id: <20190722182439.44844-1-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x8c0DPCRMv9IW9PP1p4HBNy16Fzp3nQIOkgwmBpQwpo=;
 b=FfZ6mG6bnACwo8lgLXr1zYGkAj7V4iNwkTU4H5ELO+CqHQDbFy8TPLhLV8XtPvILqW
 TowJOHAi23SCQrrxtT2YTfMTfZT0utOVqKKuvQM9feJUKIT7JNt7M+zJZk8pj3Ja4Z0d
 xtriekUe46UMlYaBOMlvThIUciUDwEHKz3k6E=
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXMgcmVwb3J0ZWQgYnkgU2FtIFJhdm5ib3JnIFsxXSwgYWZ0ZXIgY29tbWl0IGI4YTI5NDhmYTJi
MwooImRybS9wYW5lbDogc2ltcGxlOiBBZGQgYWJpbGl0eSB0byBvdmVycmlkZSB0eXBpY2FsIHRp
bWluZyIpIHdlIG5vdwpzZWUgYSBwb2ludGxlc3MgZXJyb3IgbWVzc2FnZSBwcmludGVkIG9uIGV2
ZXJ5IGJvb3QgZm9yIG1hbnkgc3lzdGVtcy4KTGV0J3MgZml4IHRoYXQgYnkgYWRqdXN0aW5nIHdo
byBpcyByZXNwb25zaWJsZSBmb3IgcHJpbnRpbmcgZXJyb3IKbWVzc2FnZXMgd2hlbiBvZl9nZXRf
ZGlzcGxheV90aW1pbmcoKSBpcyB1c2VkLgoKTW9zdCBjZXJ0YWlubHkgd2UgY2FuIGJpa2VzaGVk
IHRoZSB0b3BpYyBhYm91dCB3aGV0aGVyIHRoaXMgaXMgdGhlCnJpZ2h0IGZpeCBvciB3ZSBzaG91
bGQgaW5zdGVhZCBhZGQgbG9naWMgdG8gcGFuZWxfc2ltcGxlX3Byb2JlKCkgdG8KYXZvaWQgY2Fs
bGluZyBvZl9nZXRfZGlzcGxheV90aW1pbmcoKSBpbiB0aGUgY2FzZSB3aGVyZSB0aGVyZSBpcyBu
bwoicGFuZWwtdGltaW5nIiBzdWItbm9kZS4gIElmIHRoZXJlIGlzIGNvbnNlbnN1cyB0aGF0IEkg
c2hvdWxkIG1vdmUgdGhlCmZpeCB0byBwYW5lbF9zaW1wbGVfcHJvYmUoKSBJJ20gaGFwcHkgdG8g
c3BpbiB0aGlzIHNlcmllcy4gIEluIHRoYXQKY2FzZSB3ZSBwcm9iYWJseSBzaG91bGQgX3JlbW92
ZV8gdGhlIGV4dHJhIHByaW50cyB0aGF0IHdlcmUgYWxyZWFkeQpwcmVzZW50IGluIHRoZSBvdGhl
ciB0d28gY2FsbGVycyBvZiBvZl9nZXRfZGlzcGxheV90aW1pbmcoKS4KCldoaWxlIGF0IGl0LCBm
aXggYSBtaXNzaW5nIG9mX25vZGVfcHV0KCkgZm91bmQgYnkgY29kZSBpbnNwZWN0aW9uLgoKTk9U
RTogYW1iYS1jbGNkIGFuZCBwYW5lbC1sdmRzIHdlcmUgb25seSBjb21waWxlLXRlc3RlZC4KClsx
XSBodHRwczovL2xrbWwua2VybmVsLm9yZy9yLzIwMTkwNzIxMDkzODE1LkdBNDM3NUByYXZuYm9y
Zy5vcmcKCgpEb3VnbGFzIEFuZGVyc29uICg0KToKICB2aWRlbzogb2Y6IGRpc3BsYXlfdGltaW5n
OiBBZGQgb2Zfbm9kZV9wdXQoKSBpbgogICAgb2ZfZ2V0X2Rpc3BsYXlfdGltaW5nKCkKICB2aWRl
bzogb2Y6IGRpc3BsYXlfdGltaW5nOiBEb24ndCB5ZWxsIGlmIG5vIHRpbWluZyBub2RlIGlzIHBy
ZXNlbnQKICBkcm06IHBhbmVsLWx2ZHM6IFNwb3V0IGFuIGVycm9yIGlmIG9mX2dldF9kaXNwbGF5
X3RpbWluZygpIGdpdmVzIGFuCiAgICBlcnJvcgogIHZpZGVvOiBhbWJhLWNsY2Q6IFNwb3V0IGFu
IGVycm9yIGlmIG9mX2dldF9kaXNwbGF5X3RpbWluZygpIGdpdmVzIGFuCiAgICBlcnJvcgoKIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMgfCAgNSArKysrLQogZHJpdmVycy92aWRl
by9mYmRldi9hbWJhLWNsY2QuYyAgICB8ICA0ICsrKy0KIGRyaXZlcnMvdmlkZW8vb2ZfZGlzcGxh
eV90aW1pbmcuYyAgfCAxMSArKysrKysrLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQoKLS0gCjIuMjIuMC42NTcuZzk2MGU5MmQyNGYtZ29vZwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
