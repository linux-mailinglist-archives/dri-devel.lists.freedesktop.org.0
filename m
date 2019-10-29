Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95522E97CD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DFE6ECA3;
	Wed, 30 Oct 2019 08:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C4B6E16D;
 Tue, 29 Oct 2019 09:19:52 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id q26so5472441pfn.11;
 Tue, 29 Oct 2019 02:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=VQh5oRSrn/jaJpLx3QrkWsF+eR7SZm+MJ/X6BG8VNCk=;
 b=ONgi5Jdxlq6OUZ9/TX61c3qOT4iKd2Say75bS95PC9xAkfl7FVxf7ppp7KQOLbEQG6
 8jgoOcnj9n0v0v8aZBdma63X4hG7AVPqn2uWTwitHI4Mbdg4Kkx8O+WaVdJatZdhqdT1
 AbPKye8o5B1Uu0oc5J8mp3258gumwyVR04nD4izJOpY5Nu/D5wXaLOj2Cv/NzzG7//zJ
 0oHwcNeSWbzhcylpBkHG06a/keQ3GW6XECcn02nqP+3K1PLE4uQUlmjsGUAfzqR4WoBU
 X4XtSulg8H+mwRGbYDDs+WZqas+nIoRmTnlDlg0A1cxlfnkusaAxV7ijgP7+inuxXKDc
 Va7Q==
X-Gm-Message-State: APjAAAWXEL4GwkGFCvs4ksYGQ6qJHhRDAsj6p9SYgQUEJXXfDvWv+U5c
 KjweeLEKo4DJEhjuGdUmKg8=
X-Google-Smtp-Source: APXvYqy1UQHX5TYjIfx2Ppc5n9sA+ugVLJUG+NpLME8hrS1nyMrwsO4VWwFQqfXlPEwYoDneY4FW4A==
X-Received: by 2002:a62:6411:: with SMTP id y17mr26055073pfb.158.1572340791899; 
 Tue, 29 Oct 2019 02:19:51 -0700 (PDT)
Received: from saurav ([27.62.167.137])
 by smtp.gmail.com with ESMTPSA id i7sm1691256pjs.1.2019.10.29.02.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 02:19:51 -0700 (PDT)
Date: Tue, 29 Oct 2019 14:49:43 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com,
 David1.Zhou@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 tom.stdenis@amd.com, xywang.sjtu@sjtu.edu.cn, Jack.Xiao@amd.com,
 sam@ravnborg.org, Kevin1.Wang@amd.com, saurav.girepunje@gmail.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: amd: amdgpu: Remove NULL check not needed before
 freeing functions
Message-ID: <20191029091943.GA10258@saurav>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=VQh5oRSrn/jaJpLx3QrkWsF+eR7SZm+MJ/X6BG8VNCk=;
 b=uxs0uwpFgkNBtfpybCdyu7Hxl0sazaEpDe6OVN/XLuv0QfEAaizwFdoXk1N8Ez4U77
 FWXhlodBqy63DTFmodqIUg8GsY+BXuMK4A2ShaSNKw/bpOsSxazJtpa0y9ytv6Fmj/t6
 93eMignZ/0T+J7QCTWiK4lILtBJ3NiiYtqP1bbYll/OKeLuuUPPyVEMabcMuJ8Qo5VxC
 XIgTX+YaO1ynvmNWoIUuCmggyj22t/k4mAJ1wSO19GmQ8MoUSxoGiCNSlqrAPHI3BZ74
 Kbwnqjww9rwrpPHjsy02EJK8+AMmunuWrZydY70UaPJYSDYg7I4AI79wc89tc4m+FXgj
 /gKA==
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
Cc: saurav.girepunje@hotmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIHVubmVlZGVkIE5VTEwgY2hlY2sgYmVmb3JlIGZyZWVpbmcgZnVuY3Rpb25zCmtmcmVl
IGFuZCBkZWJ1Z2ZzX3JlbW92ZS4KClNpZ25lZC1vZmYtYnk6IFNhdXJhdiBHaXJlcHVuamUgPHNh
dXJhdi5naXJlcHVuamVAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZWJ1Z2ZzLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RlYnVnZnMuYwppbmRleCA1NjUyY2M3MmVkM2EuLmNiOTQ2MjdmYzBmNCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCkBAIC0xMDc3LDggKzEwNzcsNyBA
QCBzdGF0aWMgaW50IGFtZGdwdV9kZWJ1Z2ZzX2liX3ByZWVtcHQodm9pZCAqZGF0YSwgdTY0IHZh
bCkKIAogCXR0bV9ib191bmxvY2tfZGVsYXllZF93b3JrcXVldWUoJmFkZXYtPm1tYW4uYmRldiwg
cmVzY2hlZCk7CiAKLQlpZiAoZmVuY2VzKQotCQlrZnJlZShmZW5jZXMpOworCWtmcmVlKGZlbmNl
cyk7CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTExMDMsOCArMTEwMiw3IEBAIGludCBhbWRncHVfZGVi
dWdmc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiB2b2lkIGFtZGdwdV9kZWJ1
Z2ZzX3ByZWVtcHRfY2xlYW51cChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKLQlpZiAo
YWRldi0+ZGVidWdmc19wcmVlbXB0KQotCQlkZWJ1Z2ZzX3JlbW92ZShhZGV2LT5kZWJ1Z2ZzX3By
ZWVtcHQpOworCWRlYnVnZnNfcmVtb3ZlKGFkZXYtPmRlYnVnZnNfcHJlZW1wdCk7CiB9CiAKICNl
bHNlCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
