Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1037A114D6B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60ED488C5A;
	Fri,  6 Dec 2019 08:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p7.oit.umn.edu (mta-p7.oit.umn.edu [134.84.196.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA206E185
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 23:42:41 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 47TXMN2JXxz9vcGf
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 23:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cU8halPkEI5T for <dri-devel@lists.freedesktop.org>;
 Thu,  5 Dec 2019 17:42:40 -0600 (CST)
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 47TXMN13Zyz9vcHC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 17:42:40 -0600 (CST)
Received: by mail-yb1-f198.google.com with SMTP id d131so3862681ybb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 15:42:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pdZdRYJjEUXDLjH6ecgkCpYlUe5NSw8y98ikYjaziR0=;
 b=J6Y/buSYleFGWWDvOl6UWxlx+PkHXSt6V3nkGC6+fsNks8i+lSZ9BJ5E5FDJt7MZnG
 sDINVQamTyeTNJ62jjdYpj+WXQAXpzhDKZE8RGIw47ajb6Xkj54QN/6jGMly/yyWhoQY
 eK1aE0eEAGjd17n8OgcrIA5HJN3wTel+wLSDlx0z+IBCFrcQF1nQ256GmOUI0jPUH8uk
 XE8WUqPRQDnIw7kEqBg3F+qPB77m+3r7SAGx7PZ5tLJqdEEdgE0MurAURyKzUzyplD85
 tm91uiDcVtW/wSj7JqbQf0c5/IDGFpxmNnMGthe7XlOaKHXeANyOkHGBL2U+Mlka57tO
 xoRA==
X-Gm-Message-State: APjAAAW0fzyRBM3sBwsb97O4x+A5lvbt1m3JNjTf0H5vyJt7h9+TDiQL
 k3wYy8ZR+vvYkWB05FOVxLBDaV404ybT/FyZ68f4/UuKnmjDBjU/1d/sUpW+xKJDxKqDg+sRou6
 QarCArfMKNQoeXKvgDxVbe3ClMMEKcvQ6
X-Received: by 2002:a81:24d4:: with SMTP id k203mr8565853ywk.308.1575589359476; 
 Thu, 05 Dec 2019 15:42:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqx+x4PNK70e3ElY7ROALSM9ZNL3VxTDfROlKpZSqQ1+jPpCF1o7EJYZ7UIRDoZlqzpTBuX5Qw==
X-Received: by 2002:a81:24d4:: with SMTP id k203mr8565837ywk.308.1575589359236; 
 Thu, 05 Dec 2019 15:42:39 -0800 (PST)
Received: from cs-u-syssec1.dtc.umn.edu (cs-u-syssec1.cs.umn.edu.
 [128.101.106.66])
 by smtp.gmail.com with ESMTPSA id v186sm5388395ywv.34.2019.12.05.15.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 15:42:38 -0800 (PST)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Subject: [PATCH] drm/qxl: remove unnecessary BUG_ON check for handle
Date: Thu,  5 Dec 2019 17:42:31 -0600
Message-Id: <20191205234231.10849-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=pdZdRYJjEUXDLjH6ecgkCpYlUe5NSw8y98ikYjaziR0=;
 b=h0F9bA9gPBWqhHGztxcSe9ZaACWK7AXiD76k291yefwX093tjV7CdXxN4t9bTx+RaT
 T42W+y97udOSBhOlx/nzcZQYOLyo806uKWVtIoJhFul7qGm+4Tt45DkKKiHfGjbIyGR7
 0egnwSs320Qax6mGNYh1klTbVdb5KN5oYfdh/7J3sALZmZBOnPygEw/drcQuFc3LZQaZ
 QnZ0SuMcchPcB4zGcIr6su/rxJmaW+GvmDPx2QZ8S2sCSx+C8Ih2Lox/kSPEdfcfafXU
 DDHIAv2aIgKHoc1QIp3HVU2uDX82d7Vt9K8zyx++Gpv9TL8Q1eb+DgII9rwJ2iiGwIv+
 P4Vg==
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, spice-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gcXhsX2dlbV9vYmplY3RfY3JlYXRlX3dpdGhfaGFuZGxlKCksIGhhbmRsZSdzIG1lbW9yeSBp
cyBub3QKYWxsb2NhdGVkIG9uIHRoZSBoZWFwLiBDaGVja2luZyBmb3IgZmFpbHVyZSBvZiBoYW5k
bGUgdmlhIEJVR19PTgppcyB1bm5lY2Vzc2FyeS4gVGhpcyBwYXRjaCBlbGltaW5hdGVzIHRoZSBj
aGVjay4KClNpZ25lZC1vZmYtYnk6IEFkaXR5YSBQYWtraSA8cGFra2kwMDFAdW1uLmVkdT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9nZW0uYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9nZW0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2dlbS5jCmluZGV4IDY5ZjM3ZGIxMDI3YS4uNDViNzc5
YThiYzIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9nZW0uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9nZW0uYwpAQCAtODQsNyArODQsNiBAQCBpbnQgcXhsX2dl
bV9vYmplY3RfY3JlYXRlX3dpdGhfaGFuZGxlKHN0cnVjdCBxeGxfZGV2aWNlICpxZGV2LAogCWlu
dCByOwogCiAJQlVHX09OKCFxb2JqKTsKLQlCVUdfT04oIWhhbmRsZSk7CiAKIAlyID0gcXhsX2dl
bV9vYmplY3RfY3JlYXRlKHFkZXYsIHNpemUsIDAsCiAJCQkJICBkb21haW4sCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
