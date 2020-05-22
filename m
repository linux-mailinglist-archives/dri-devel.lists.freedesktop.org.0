Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BAB1DF656
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251EC6E1EE;
	Sat, 23 May 2020 09:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7916E14D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 12:15:28 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h17so9933678wrc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 05:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fQoBl3iAB4AAXzroqv3WcbLITd0lPVqqa2vsLWJSegM=;
 b=U350gRFZNFttFLFDn7l6Ua1iUdEfSGq+wqwtW6wCoLJj1Pz/ANf1sGDDYOG85/hXjb
 1Wy5kKSUwgY1Q1nHUaNS/TqKkxIs0a5m8qp5dSYt0sfqXvXZzKdzWtGRyR9NheoUC/bM
 7UgkPGJIT4uQehBOuaNUNs8iCVYp4a+bbf/pHOehAcBv+sgxrDIoxw0/3lhBwYDYlcAz
 LBd1hgMpCKX0WhUdIhYsFzdvrlwWGcV4UEuABPEemGik9iq/icN6z7Kx+ajfJZWnI6MZ
 4StIIgeHCSZDejXLiQdE+ZB/v0UR5DPyvlmCpbqD9dPwY/Y4bzPbjXTaqGvLGy5zp+x7
 lnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fQoBl3iAB4AAXzroqv3WcbLITd0lPVqqa2vsLWJSegM=;
 b=C+G3nKH8thSPmemkFfC7UNQnj03LT3Xs/icfUtvkFUUrkoe7O4xip3OEEnPyJ6vBnv
 gDz3cVmFa+2AXJ5WMJs6M/Y88DRDkwJ/JViQuKrNpYAujoRrHECSZ4SicKS9dCp7y+H1
 N8WIUt5rl/Wgio8X0qvf9iZ7DKIRPjKQF2f1/sgXnNa82GWO6GvJRnmFpFFoY3wAQJfp
 6f9S6ym3tUWZ641+wj3N+Rq3mG+l4EJeUEf1pDQxgoDptgWT3O6Rn+n2jwBWNLfwVIBz
 W6DHWpLM0LzGTdmGh5kutAt8F37mOUwLuuC8KCv06r3SFGWSvloW9vs9sr6janvr9H7B
 b1Ug==
X-Gm-Message-State: AOAM5327J/xONLsXKf94Fm7BU75d/li9JMMiyZQMVtyfxn8tdMqYrtQv
 OAykYKAZO0m9t+q4m2kv0oA=
X-Google-Smtp-Source: ABdhPJy9YsaQM1hIz0EqZ7h7vCKorss2/EuI/RFW7gjWph4x4T+L9tElIO36RODgl0g69l+kHetDzQ==
X-Received: by 2002:adf:9507:: with SMTP id 7mr3128224wrs.63.1590149727152;
 Fri, 22 May 2020 05:15:27 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net.
 [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id g6sm9293784wrp.75.2020.05.22.05.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 05:15:26 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 0/5] mtd: rawnand: brcmnand: support v2.1-v2.2 controllers
Date: Fri, 22 May 2020 14:15:19 +0200
Message-Id: <20200522121524.4161539-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522072525.3919332-1-noltari@gmail.com>
References: <20200522072525.3919332-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
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

QWRkIHN1cHBvcnQgZm9yIHYyLjEgYW5kIHYyLjIgTkFORCBjb250cm9sbGVycy4KCnY0OiBmaXgg
Y29tbWl0IHN1YmplY3QuCnYzOiBmaXggdjIuMSBwYWdlIHNpemUgc2hpZnQKdjI6IGludHJvZHVj
ZSBjaGFuZ2VzIHN1Z2dlc3RlZCBieSBNaXF1w6hsLgoKw4FsdmFybyBGZXJuw6FuZGV6IFJvamFz
ICg1KToKICBtdGQ6IHJhd25hbmQ6IGJyY21uYW5kOiByZW5hbWUgdjQgcmVnaXN0ZXJzCiAgbXRk
OiByYXduYW5kOiBicmNtbmFuZDogZml4IENTMCBsYXlvdXQKICBtdGQ6IHJhd25hbmQ6IGJyY21u
YW5kOiByZW5hbWUgcGFnZSBzaXplcwogIGR0OiBiaW5kaW5nczogYnJjbW5hbmQ6IGFkZCB2Mi4x
IGFuZCB2Mi4yIHN1cHBvcnQKICBuYW5kOiBicmNtbmFuZDogc3VwcG9ydCB2Mi4xLXYyLjIgY29u
dHJvbGxlcnMKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50eHQg
fCAgIDIgKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyAgICAgIHwg
MTAwICsrKysrKysrKysrKysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCA4NiBpbnNlcnRpb25zKCsp
LCAxNiBkZWxldGlvbnMoLSkKCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
