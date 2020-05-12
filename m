Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341501D0B84
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918096E148;
	Wed, 13 May 2020 09:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DE96E859
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:33:39 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id y24so22112708wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wKq0OblocqgUWBq4FWdZOwAZXIyc1/tnZx0SSOmf9GY=;
 b=AaC+PLz40PrYk1QteaLXTxbS33yMEGk2kdK9ESxDU17sZXwVCgmJ/MhsfJT+PDC0GP
 OJ90A9e3bNFgSaTkyjgkoJU50p/FofrEmIqAsMqPgyxEG4/Qp/SbxmFR7DNxs3OKZuUC
 Bp4L78a8pijD3F7VtK4VzCKTo4DQn4Sd3v9gPX/Yf8gygv8nUtuSCxtvQzgwvf5PJ7Hx
 dET4SQmz8nm7aUAiB+/Xr7XscRQ9F4JRD6ILitJAz7yUw+HSA7i4XruGCMHt+R+mxyio
 JaGFxlHQbm0hGE8FINJl9W5pkPbB6nVLur3SYeefLaGZHkjQwLTSFcPp59Gp/3ufUvIO
 ulFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wKq0OblocqgUWBq4FWdZOwAZXIyc1/tnZx0SSOmf9GY=;
 b=uUzsI1Tv2GOP3NQ0Zxp8XowbS+tQrxGnd2WmejRetL9DmAZgC/HM4iRrw+T/4REBcr
 1JDni3HaBFXwDEF9OIHOWdPuYVLGhsaYarkDolE9AMBlw26fHbDvM+csHTXVaVq8rYss
 16UljMshQs2Gkm4CKXIti7/Aj3SYQVX3NId8l8NqtWhJWMpG6X4t4q5GdCpmByfOn2Ys
 Ibku9Je0eYC5qfREAVUADKD+rSPgaNH+CZIBbljnMrY2shKz/UM1zBcovZlHWrzt+rAN
 A6Qi/18CVoW53cMLfEUedp4LnMjPoYQY6FqdEo7PWDoJATjWqaU8m25VXGjF0YvOLkv3
 rofg==
X-Gm-Message-State: AGi0PuZwTKUzMvq1VbvEMzuDbZXlOmyFbpZiQPejhNakqVemqYr6c3da
 piPidlVqA3ESUEv7loWAvHY=
X-Google-Smtp-Source: APiQypKpQU+sRBnu4YugVLYHjTcTRmLyX7V4CIuyHUXUHwnJzx9zFlbWQdFPuVC8uZJ2zsgvyvFG2w==
X-Received: by 2002:a1c:108:: with SMTP id 8mr13028297wmb.148.1589268818521;
 Tue, 12 May 2020 00:33:38 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id d9sm5961197wmd.10.2020.05.12.00.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:33:38 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 support
Date: Tue, 12 May 2020 09:33:28 +0200
Message-Id: <20200512073329.742893-5-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512073329.742893-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
 <20200512073329.742893-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkZWQgYnJjbSxicmNtbmFuZC12Mi4xIGFuZCBicmNtLGJyY21uYW5kLXYyLjIgYXMgcG9zc2li
bGUgY29tcGF0aWJsZQpzdHJpbmdzIHRvIHN1cHBvcnQgYnJjbW5hbmQgY29udHJvbGxlcnMgdjIu
MSBhbmQgdjIuMi4KClNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9s
dGFyaUBnbWFpbC5jb20+Ci0tLQogdjI6IGFkZCBuZXcgcGF0Y2gKCiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQudHh0IHwgMiArKwogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50eHQgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQudHh0CmluZGV4IDA1NjUxYTY1NGM2Ni4u
NDQzMzVhNGY4YmZiIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL2JyY20sYnJjbW5hbmQudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50eHQKQEAgLTIwLDYgKzIwLDggQEAgUmVxdWlyZWQg
cHJvcGVydGllczoKICAgICAgICAgICAgICAgICAgICAgICJicmNtLGJyY21uYW5kIiBhbmQgYW4g
YXBwcm9wcmlhdGUgdmVyc2lvbiBjb21wYXRpYmlsaXR5CiAgICAgICAgICAgICAgICAgICAgICBz
dHJpbmcsIGxpa2UgImJyY20sYnJjbW5hbmQtdjcuMCIKICAgICAgICAgICAgICAgICAgICAgIFBv
c3NpYmxlIHZhbHVlczoKKyAgICAgICAgICAgICAgICAgICAgICAgICBicmNtLGJyY21uYW5kLXYy
LjEKKyAgICAgICAgICAgICAgICAgICAgICAgICBicmNtLGJyY21uYW5kLXYyLjIKICAgICAgICAg
ICAgICAgICAgICAgICAgICBicmNtLGJyY21uYW5kLXY0LjAKICAgICAgICAgICAgICAgICAgICAg
ICAgICBicmNtLGJyY21uYW5kLXY1LjAKICAgICAgICAgICAgICAgICAgICAgICAgICBicmNtLGJy
Y21uYW5kLXY2LjAKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
