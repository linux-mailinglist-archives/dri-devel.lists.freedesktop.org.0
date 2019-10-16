Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE10D9301
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 15:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D956E982;
	Wed, 16 Oct 2019 13:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997FD6E982
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 13:52:17 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id c4so2665586ilq.13
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 06:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tddk5aNBbKCrf3Fe8pk7EXB/w7qFIAJSPZblsSzkzAM=;
 b=G2J/A4gWAiAox5HHKuOGix4KrcEKVQR9ogw1GklLLQH93noDFIJ7RhdMf5yAKRZDPS
 6BTvHrc0lMBPUuK+x+43ByMuJDQXWWT6143FThw4Czqu5NmH2TJVD8fsNrME3fjhuhty
 pmEERUTvnK9F4eO5Yp5y5gznAdRsx6nJt9EN/rzGJ29avq/V6gy70ldSBV8U/wM4lbdb
 UgxZ0lOyNbLfHsw6q8UZOoQ1rIW0ZxDI6qQLulQwjQcAa2RWwiFyqChF0fOzgJGr8rWA
 KPriULtBZn5rLBSxzMjKxhfLkRkEUczLd114bVDmg5W8VbwACr1U88TsTje+5DmRhajJ
 9jfw==
X-Gm-Message-State: APjAAAU3nzJQpqvd3Um44SFr7lFrCrmNGJJH6MA3L0CX4EI4mj5FvWWz
 7OIO4iC4utxmwRhMQRWiqgChbhBq
X-Google-Smtp-Source: APXvYqxfffYQGm7jczNh9MwYJUxP6Nn83rdo7ZuYmUEPfLGieQVEeLob/zjOrNMikp4xn1sZnO/d0g==
X-Received: by 2002:a92:5f4c:: with SMTP id t73mr11861707ilb.220.1571233936326; 
 Wed, 16 Oct 2019 06:52:16 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net.
 [73.37.219.234])
 by smtp.gmail.com with ESMTPSA id e139sm17227545iof.60.2019.10.16.06.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 06:52:15 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V5 3/3] ARM: logicpd-torpedo-37xx-devkit-28: Reference new DRM
 panel
Date: Wed, 16 Oct 2019 08:51:47 -0500
Message-Id: <20191016135147.7743-3-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016135147.7743-1-aford173@gmail.com>
References: <20191016135147.7743-1-aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tddk5aNBbKCrf3Fe8pk7EXB/w7qFIAJSPZblsSzkzAM=;
 b=kTcMabWGqmRCfYcYJhOVUHGGartS+59ZQ56ld4laMvfK65ghicCYqQEvJ+MdfNZFKt
 y6MSu97f9Fj6D3ZqFoqpOn13J+olCrcN4xcPwIZrRnHAs5pP5JtNtpBTAl0609P/63Z3
 AiMvkCNmszBXcI5rPr56HjpXCVKKzPDSD0R3lSXcw0E5ogDMhERdt/QqGXiZ3GKsK9Ed
 j+QDu017oT1mSDeo50Yb947NFuBW1MiB/n5ed3UqI3kbEzyqdZtVkAhavahAEDohgPDm
 MLCUEu2iHWwEMp1QrZwHONybXqpAhfqYve8ZJvDseafG5u3CeLDsDC9hujkteBCDur6N
 pOmw==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGUgcmVtb3ZhbCBvZiB0aGUgcGFuZWwtZHBpIGZyb20gdGhlIG9tYXAgZHJpdmVycywg
dGhlCkxDRCBubyBsb25nZXIgd29ya3MuICBUaGlzIHBhdGNoIHBvaW50cyB0aGUgZGV2aWNlIHRy
ZWUgdG8KYSBuZXdseSBjcmVhdGVkIHBhbmVsIG5hbWVkICJsb2dpY3BkLHR5cGUyOCIKCkZpeGVz
OiA4YmY0YjE2MjExNzggKCJkcm0vb21hcDogUmVtb3ZlIHBhbmVsLWRwaSBkcml2ZXIiKQoKU2ln
bmVkLW9mZi1ieTogQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+CkFja2VkLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0tLQpWNTogIE5vIENoYW5nZQpWNDogIE5vIENo
YW5nZQpWMzogIE5vIGNoYW5nZQpWMjogIFJlbW92ZSBsZWdhY3kgJ2xhYmVsJyBmcm9tIGJpbmRp
bmcKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9sb2dpY3BkLXRvcnBlZG8tMzd4eC1k
ZXZraXQtMjguZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvbG9naWNwZC10b3JwZWRvLTM3eHgtZGV2
a2l0LTI4LmR0cwppbmRleCAwN2FjOTliOWNkYTYuLmNkYjg5YjNlMmE5YiAxMDA2NDQKLS0tIGEv
YXJjaC9hcm0vYm9vdC9kdHMvbG9naWNwZC10b3JwZWRvLTM3eHgtZGV2a2l0LTI4LmR0cworKysg
Yi9hcmNoL2FybS9ib290L2R0cy9sb2dpY3BkLXRvcnBlZG8tMzd4eC1kZXZraXQtMjguZHRzCkBA
IC0xMSwyMiArMTEsNiBAQAogI2luY2x1ZGUgImxvZ2ljcGQtdG9ycGVkby0zN3h4LWRldmtpdC5k
dHMiCiAKICZsY2QwIHsKLQotCWxhYmVsID0gIjI4IjsKLQotCXBhbmVsLXRpbWluZyB7Ci0JCWNs
b2NrLWZyZXF1ZW5jeSA9IDw5MDAwMDAwPjsKLQkJaGFjdGl2ZSA9IDw0ODA+OwotCQl2YWN0aXZl
ID0gPDI3Mj47Ci0JCWhmcm9udC1wb3JjaCA9IDwzPjsKLQkJaGJhY2stcG9yY2ggPSA8Mj47Ci0J
CWhzeW5jLWxlbiA9IDw0Mj47Ci0JCXZiYWNrLXBvcmNoID0gPDM+OwotCQl2ZnJvbnQtcG9yY2gg
PSA8Mj47Ci0JCXZzeW5jLWxlbiA9IDwxMT47Ci0JCWhzeW5jLWFjdGl2ZSA9IDwxPjsKLQkJdnN5
bmMtYWN0aXZlID0gPDE+OwotCQlkZS1hY3RpdmUgPSA8MT47Ci0JCXBpeGVsY2xrLWFjdGl2ZSA9
IDwwPjsKLQl9OworCS8qIFRvIG1ha2UgaXQgd29yaywgc2V0IENPTkZJR19PTUFQMl9EU1NfTUlO
X0ZDS19QRVJfUENLPTQgKi8KKwljb21wYXRpYmxlID0gImxvZ2ljcGQsdHlwZTI4IjsKIH07Ci0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
