Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2672D2C30F0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97CE6E5A4;
	Tue, 24 Nov 2020 19:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C776E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:46 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r17so23605281wrw.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IuYUPAmdjNAB2iB0feai5NRQku3ocmldwDZ4+yeUjOQ=;
 b=G6RizRk86LJoiRxWoHggIJioWd/Caezt6X9dDirbeZl2WR1uV0CaD0Ho13XnPd5XtC
 T0S4wjyWXh9IbLoGuJJie52QMC1nQDAogfU2C50i9BdbT+sZO2vfn/sQ+8EpCwYGHFr/
 8cvlIibvBz9utcaqPcSen+zbb9g4q/fEaMXU1zyDfaG0UljGysQMCyu9yd74N5P6+FtZ
 huQU/Q3b68Q2mmTXVS/vH3yZ05TtTa0u96Hy1edtsgmC9aNg9CwFnfX+9vD28/L1Dsht
 59aRyImfMp+OTRPrcesVD0/YgR9S0iK5b336NZUfp7FPsz3cUuNzEphWmZGdJLJw/ELu
 +3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IuYUPAmdjNAB2iB0feai5NRQku3ocmldwDZ4+yeUjOQ=;
 b=RY5g+kG+cPT34ELFjHUgzP6FTh+b/OYWXrrBhO6jwhckhneoPiWM2bJVqaJ4xrN7m8
 qX6+9wUSQvRNhvpbzNevLnE+I5GnNHKjg77NVSFA7e7za7hmHrkX+Ev9ft/CxN2AotHe
 VQ8FHGhv5bmS4p3wPj8tMmkHDwv+y/jT/DUSNK7vY9b8xaDspWjnu+t2TPepTK0URx5l
 SORmX8uNyWtiHg6cRAXO6V78STn78dqt4jpKFBzyIynNGcU2PoixJKcj2sEU6MRjuwps
 SdvbARHT4kJvaKHZOvkYmr74fTSd5MisFEgEtXkWGNscbguyasrsO/e1DN03YWkr9MAM
 3Y8w==
X-Gm-Message-State: AOAM530EMKtNmoKrnhx4MtiVxJcyGZeEfljZYiruVUyB8gwa2+8LPfSw
 mB+Y1/cOCWQ5QNGnVRkGnH3/8g==
X-Google-Smtp-Source: ABdhPJz3fTSV3/+18bQ/0bhtmER6mtf+OjZ8lu5pN+mo0EYPCn9N9UjXgTCZ4wuw7uOtKLmiQljm5w==
X-Received: by 2002:a5d:51c2:: with SMTP id n2mr94838wrv.326.1606247085224;
 Tue, 24 Nov 2020 11:44:45 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:44 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 37/40] drm/amd/pm/swsmu/smu12/renoir_ppt: Demote kernel-doc
 formatting abuse
Date: Tue, 24 Nov 2020 19:38:21 +0000
Message-Id: <20201124193824.1118741-38-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgpDYzogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7Zu
aWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
bGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTIvcmVub2lyX3BwdC5jIHwgNCArKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTIvcmVub2lyX3BwdC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUxMi9yZW5vaXJfcHB0LmMKaW5kZXggNDZjNDRm
MGFiZGZiOC4uZDM2NDFhOGVkOTljMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
bS9zd3NtdS9zbXUxMi9yZW5vaXJfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9z
d3NtdS9zbXUxMi9yZW5vaXJfcHB0LmMKQEAgLTE3MCw3ICsxNzAsNyBAQCBzdGF0aWMgaW50IHJl
bm9pcl9pbml0X3NtY190YWJsZXMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJcmV0dXJuIC1F
Tk9NRU07CiB9CiAKLS8qKgorLyoKICAqIFRoaXMgaW50ZXJmYWNlIGp1c3QgZm9yIGdldHRpbmcg
dWNsayB1bHRpbWF0ZSBmcmVxIGFuZCBzaG91bGQndCBpbnRyb2R1Y2UKICAqIG90aGVyIGxpa2V3
aXNlIGZ1bmN0aW9uIHJlc3VsdCBpbiBvdmVybXVjaCBjYWxsYmFjay4KICAqLwpAQCAtNjU2LDcg
KzY1Niw3IEBAIHN0YXRpYyBpbnQgcmVub2lyX2dldF9wb3dlcihzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSwgdWludDMyX3QgKnZhbHVlKQogCXJldHVybiAwOwogfQogCi0vKioKKy8qCiAgKiBUaGlz
IGludGVyZmFjZSBnZXQgZHBtIGNsb2NrIHRhYmxlIGZvciBkYwogICovCiBzdGF0aWMgaW50IHJl
bm9pcl9nZXRfZHBtX2Nsb2NrX3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBzdHJ1Y3Qg
ZHBtX2Nsb2NrcyAqY2xvY2tfdGFibGUpCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
