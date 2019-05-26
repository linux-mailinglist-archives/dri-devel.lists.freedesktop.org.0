Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 752AE2B43E
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3466489C86;
	Mon, 27 May 2019 12:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD646E1AA;
 Sun, 26 May 2019 07:56:40 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id t1so7359578pgc.2;
 Sun, 26 May 2019 00:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=KlCZZbqSoq/MJg7RIhnS5XN0yjpHRVX96n1/cDuyLB4=;
 b=VYMgamBtXSivOgcKTO3A/NPJhRkBo+TSN3kH85sgSTyLq8tcrm/Xuev4zdW320nm1c
 II5I5ECeF8qi1QjxP62KGEJWwGKbitP0WHz8/S/pFgF+pUP4R9I62jtellk/bja2kBVV
 heKK5ApEZnd1aOQO/gowuQGFWd7/LXkFqd5JJFch7jD+0qrBH/4jGh1TwLNM/p2ShQMB
 doZpLJSIFV+xh8Nx2aoE5djQAvT0/9QJ1PwUzU9QEGBqURT3INemSy7DhWWtiPkLNsSj
 rKFp3yXg/oIFUmvegU+DtbH2Yqew8tzbwAELFRdUUGopEIaSzyxKBlX6smDgEnnIkRes
 QsKw==
X-Gm-Message-State: APjAAAU9GYHDqzvEJYxJO4ym4s1T4SHvvm83CPhs5/yNRoMtqgjU2uPN
 RGExWCF4PvScrKqcQjyNImw=
X-Google-Smtp-Source: APXvYqx4mtbkMYP7BtHxoAsheCKF7G3ehabBGjanIgM05/vsT/7ztFMbjgGagVmDcICsu2KPzs1X/Q==
X-Received: by 2002:a63:fd50:: with SMTP id m16mr2717464pgj.192.1558857400300; 
 Sun, 26 May 2019 00:56:40 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.92.73])
 by smtp.gmail.com with ESMTPSA id 5sm7703827pfh.109.2019.05.26.00.56.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 00:56:39 -0700 (PDT)
Date: Sun, 26 May 2019 13:26:33 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/gvt: remove duplicate entry of trace
Message-ID: <20190526075633.GA9245@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=KlCZZbqSoq/MJg7RIhnS5XN0yjpHRVX96n1/cDuyLB4=;
 b=oQ2+9rTU2vAEU4CZXBWNSm4rFLCyGCxJEYa2/sofNGkwBlEFqVFnjSECKFGJH8uokt
 gV2RtAomnUR1jar2QNyACLY5IVAc/Z3qeBdZgm/IPAA96sO4crn+jUR0BYFu0SVkJCXM
 RAvle730TddMpMRxnw1tvzNY6hB+Xi2zy9Fg2M1rTSuE6RvIH3hPcw7fC1SyhepvOGo6
 6CC8AjS0KkPZkTqVdVNlJy0MY4aRBOcSZY37ER1bnahe2m9hJBZza46h5Hd+QgeKejf1
 kuyJFzA5+zHu6/Q82Da3Y/hymRPWSVbhGCtXM/6OiJ8uNS06uFEdcJDyL7fGyaZs4Okf
 B4dg==
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

UmVtb3ZlIGR1cGxpY2F0ZSBpbmNsdWRlIG9mIHRyYWNlLmgKCklzc3VlIGlkZW50aWZpZWQgYnkg
aW5jbHVkZWNoZWNrCgpTaWduZWQtb2ZmLWJ5OiBIYXJpcHJhc2FkIEtlbGFtIDxoYXJpcHJhc2Fk
LmtlbGFtQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdHJhY2VfcG9p
bnRzLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3RyYWNlX3BvaW50cy5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L3RyYWNlX3BvaW50cy5jCmluZGV4IGEzZGVlZDY5Li41NjlmNWUzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdHJhY2VfcG9pbnRzLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L3RyYWNlX3BvaW50cy5jCkBAIC0zMiw1ICszMiw0IEBACiAKICNp
Zm5kZWYgX19DSEVDS0VSX18KICNkZWZpbmUgQ1JFQVRFX1RSQUNFX1BPSU5UUwotI2luY2x1ZGUg
InRyYWNlLmgiCiAjZW5kaWYKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
