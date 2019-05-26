Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0582AB87
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2019 20:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7283897BB;
	Sun, 26 May 2019 18:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D49897BB;
 Sun, 26 May 2019 18:05:40 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q62so12727128ljq.7;
 Sun, 26 May 2019 11:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ycuLjC6k+VnN1iKFq7tl7afSKE2WFInGsOCieSx5QS0=;
 b=jzN395un28T615Q/5d4ZintBb+zfAFeCCL38BD2429qByB+LzMeeG6VTtb32fm6ETf
 ySHpxkFCYDUyZOhxYxui/iSPyGj9vbqWsTwq0MjQ4+qN+CdGWR1d0MHdLOdZuJPGxlgw
 yVWQ1wnLU/ShPIFrWvQmjR9/j7RJZqJ7/sbKClGFanFbvBPoZupbwTLX3KJvx1lFlRwe
 eHHoxvrnZv/8gc/O6VbeDkMJsxekVN11pnqd7coPkfx+jO2iXkLTS1usV5b8GCBPjwAv
 yNjgfJ6dj3L5miuUUNvbR9d6J/ddPssEXExOtDfJwZC0gX37IUJddM1Sim6ls5oNjPsC
 jTpw==
X-Gm-Message-State: APjAAAXxpDObPTJV6HpYYl0BlsMTyaY9PbJ53iVHIV+EOjl6erYIS0qI
 6QyfoKUfvAV/xXhC6FoZS7Q=
X-Google-Smtp-Source: APXvYqzvVSI319Y1Th8mQHTCt14rvGUSW6TmnftLwxA1uQNwQEKSPOBAZLDSq4T2ly/VFpn+JSjQBw==
X-Received: by 2002:a2e:995:: with SMTP id 143mr50362444ljj.92.1558893939235; 
 Sun, 26 May 2019 11:05:39 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 q6sm1779753lff.26.2019.05.26.11.05.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 11:05:38 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/panel: drmP.h removal + small fix
Date: Sun, 26 May 2019 20:05:30 +0200
Message-Id: <20190526180532.1641-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ycuLjC6k+VnN1iKFq7tl7afSKE2WFInGsOCieSx5QS0=;
 b=Oibblfr7BoTGrbDeno6qZkBzJDQ70MIX2wRUwn3BWJghVOEqvWZqbQ7CesbuewUWmh
 nDXfdzr7DuLsiloUk8j6C3Yae90l3qGZ/jXNGkBbm9j7CnX/QefiXbC2voe4rWOpNceo
 IJdAXtNuo+MeTn3Doo9vhPaUy4+Fh0RfciOQrgx5hgkwA0Z51gmI7yQvJeqG7m9WG4OD
 hp2OwDT19me0ma/VdPOuu2v7vFehSN22mNgmvkyUokO+7EXrAlGOXRvmoHskrEoFsR7p
 OCQu0JdO4dQKd/9c56vMxm+s2n8WGuxrqzAo6vIZCO4IiuXdKYKrsGluCiGVqVfsV+N+
 ItHA==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Stefan Mavrodiev <stefan@olimex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGhlYWRlciBmaWxlIGRybVAuaCBoYXZlIGJlZW4gZGVwcmVjYXRlZCBhbmQgdGhpcwpzZXQg
aW5jbHVkZSBhIHBhdGNoIHRvIHJlbW92ZSB0aGUgdXNlIG9mIGRybVAuaCBpbgphbGwgZmlsZXMg
aW4gZHJtL3BhbmVsLyouCgpUaGUgcGF0Y2hzZXQgaGFzIGJlZW4gYnVpbGQgdGVzdGVkIHdpdGgg
eDg2LCBhcm0sICsrCmluIHZhcmlvdXMgY29uZmlncy4KClRoZXJlIGlzIGEgZmx1eCBvZiBpbmNv
bWluZyBwYW5lbHMsIGFuZCByZW1vdmluZwp1c2Ugb2YgZHJtUC5oIGZyb20gZXhpc3RpbmcgZmls
ZXMgd2lsbCBob3BlZnVsbHkKc2V0IHRoZSB0cmVuZCB0aGF0IG5ldyBwYW5lbHMgZG8gbm90IHRy
eSB0bwpyZWludHJvZHVjZSB0aGUgZHJtUC5oIGhlYWRlciBmaWxlLgoKRm9yIGFsbCBmaWxlcyB0
b3VjaGVkIHRoZSBmb2xsb3dpbmcgd2FzIGRvbmU6Ci0gaW5jbHVkZSBmaWxlcyBkaXZpZGVkIHVw
IGluIGJsb2NrcyBpbiBmb2xsb3dpbmcgb3JkZXI6CiAgICAgICAgbGludXgvKgogICAgICAgIHZp
ZGVvLyoKICAgICAgICBkcm0vKgogICAgICAgICIiCi0gd2l0aGluIGVhY2ggYmxvY2sgdGhlIGlu
Y2x1ZGUgZmlsZXMgYXJlIHNvcnRlZCBhbHBoYWJldGljYWxseQoKQSB0cml2aWFsIHBhdGNoIHRv
IHJlbW92ZSBhbiB1bnVzZWQgdmFyaWFibGUgaW4gYSBzdHJ1Y3QKYXMgYSBzZXBhcmF0ZSBwYXRj
aC4KCnYyOgotIERyb3BwZWQgcGF0Y2hlcyB0byB1c2UgRFJNX0RFVl8qLgogIFRoZXkgd2VyZSBk
aXNjdXNzZWQgYnV0IG5vIGZpbmFsIGNvbmNsdXNpb24KLSBSZWJhc2VkIG9uIGxhdGVzdCBkcm0t
bWlzYy1uZXh0CgoJU2FtCgoKU2FtIFJhdm5ib3JnICgyKToKICAgICAgZHJtL3BhbmVsOiBwYW5l
bC1pbm5vbHV4OiBkcm9wIHVudXNlZCB2YXJpYWJsZQogICAgICBkcm0vcGFuZWw6IGRyb3AgZHJt
UC5oIHVzYWdlCgogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWFybS12ZXJzYXRpbGUuYyAg
ICAgICAgICAgfCAgNiArKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbGl0ZWst
aWxpOTMyMi5jICAgICAgICAgIHwgIDkgKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtaW5ub2x1eC1wMDc5emNhLmMgICAgICAgICB8IDEwICsrKysrKy0tLS0KIGRyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1qZGktbHQwNzBtZTA1MDAwLmMgICAgICAgIHwgIDggKysrKyst
LS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1raW5nZGlzcGxheS1rZDA5N2QwNC5jICAg
IHwgIDkgKysrKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbGctbGc0NTczLmMg
ICAgICAgICAgICAgICB8ICA5ICsrKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LWx2ZHMuYyAgICAgICAgICAgICAgICAgICAgfCAgNyArKystLS0tCiBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtb2xpbWV4LWxjZC1vbGludXhpbm8uYyAgICB8ICA4ICsrKystLS0tCiBkcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtb3Jpc2V0ZWNoLW90bTgwMDlhLmMgICAgICB8IDExICsr
KysrKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcGFuYXNvbmljLXZ2eDEwZjAz
NG4wMC5jICB8ICA3ICsrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVy
cnlwaS10b3VjaHNjcmVlbi5jIHwgIDQgKystLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXJheWRpdW0tcm02ODIwMC5jICAgICAgICAgfCAgNSArKysrLQogZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXNhbXN1bmctbGQ5MDQwLmMgICAgICAgICAgfCAxMCArKysrKysrLS0tCiBkcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1zNmUzaGEyLmMgICAgICAgICB8IDEwICsr
KysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzajB4MDMu
YyAgICAgIHwgMTEgKysrKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1z
dW5nLXM2ZThhYTAuYyAgICAgICAgIHwgMTIgKysrKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtc2Vpa28tNDN3dmYxZy5jICAgICAgICAgICB8IDEwICsrKysrKy0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaGFycC1scTEwMXIxc3gwMS5jICAgICAgIHwgIDcg
KysrKy0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNoYXJwLWxzMDQzdDFsZTAxLmMg
ICAgICAgfCAgNyArKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMg
ICAgICAgICAgICAgICAgICB8ICA5ICsrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXNpdHJvbml4LXN0Nzc4OXYuYyAgICAgICAgfCAxMCArKysrKysrLS0tCiBkcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtdHJ1bHktbnQzNTU5Ny5jICAgICAgICAgICB8IDEyICsrKysrKysr
LS0tLQogMjIgZmlsZXMgY2hhbmdlZCwgMTIxIGluc2VydGlvbnMoKyksIDcwIGRlbGV0aW9ucygt
KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
