Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5B732B8B3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 15:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3163C89861;
	Wed,  3 Mar 2021 14:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0F389861
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 14:47:23 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id m1so6591745wml.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 06:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cHGLMgmESXIFZCs0JUgZJMepuDsyuMDs79DqzpopOh4=;
 b=lBZHN8bPn8ofPtdUDEJ9YHpgj9Y5X9y4JEPsFoxiXXsOoaBiEw7ABoTWgRRMkeTh4L
 L8dYeKAZ04n2f2OIyrIhaHoY7l++4dm/3AUZLiFo2dfGV/iEuQZP55N6fRrjG8zYkTWU
 euyHo8Yvjnd8bI0HMhSOOJI9oGLvDNM/A23TYmyn4Zmh2FrZzNSQ+nA0+5RQoe8eAUeL
 fhsF9IePdsCJfsqQeTNpErqcHANrWkvpwGb82NRgFMln2r4vEAv9tdBiLA+q29a+zmKF
 aX6v0Kc/1/Mg1A6sroXBtZSwvxYSDW6Xr7Qqts1qxZL5RY89YQppWO5OFg+1Zk2ctl/9
 WjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cHGLMgmESXIFZCs0JUgZJMepuDsyuMDs79DqzpopOh4=;
 b=uEprNN+bX+IaL87bhx/U4XwDl+cJq5+L+sJaA+xnjoR55VffvdtIvtUTUigDfJ5ADc
 FFeWBetO2sMTl5nP04Y94G+ysO2fya1ctX5fbmrNpl0ijevvNDgqNpA6m6hTGSTmF1pm
 imHbvOKNsgQkitivjEMYGxm6364/yOJsB/qZHyj21glNmW52IWuZn458yY0tr03OtsmC
 /gO/ZxtGR5SeIKE0kH6IASx75E9lzoYqGg5EkHPC4bUjoK2F9q4PbnUFksxZJqPXKNM7
 yg+2wtly5MrXYLk2KfE3V22JKKsp7xsdrpVyyuc33Rv6WrdiRWI9ga7Q33C2RKBQxzHO
 GAqw==
X-Gm-Message-State: AOAM530wNFWtP1HVj2bdZqT19QHhEwzt26Kr1yMhCo+xE+2HJtq11YrR
 lysKe8FHAsNSmamwlU4Rp67Wrw==
X-Google-Smtp-Source: ABdhPJwT5ycXh7v72pauBAfT/7F41M3dC7pMHTlOeEz2LNBHe69VWsAs12AKit5DPIkGD21Kk0wVyQ==
X-Received: by 2002:a1c:2403:: with SMTP id k3mr9543941wmk.130.1614782842402; 
 Wed, 03 Mar 2021 06:47:22 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id a14sm36567233wrg.84.2021.03.03.06.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 06:47:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/30] scsi: aacraid: commsup: Repair formatting issue in
 aac_handle_sa_aif()'s header
Date: Wed,  3 Mar 2021 14:46:17 +0000
Message-Id: <20210303144631.3175331-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303144631.3175331-1-lee.jones@linaro.org>
References: <20210303144631.3175331-1-lee.jones@linaro.org>
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
Cc: linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, "PMC-Sierra,
 Inc" <aacraid@pmc-sierra.com>,
 Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9zY3NpL2FhY3JhaWQvY29tbXN1cC5jOjMzNDogd2FybmluZzogZXhwZWN0aW5nIHByb3RvdHlw
ZSBmb3IgZmliX2RlYWxsb2NhdGUoKS4gUHJvdG90eXBlIHdhcyBmb3IgZmliX2RlYWxsb2MoKSBp
bnN0ZWFkCiBkcml2ZXJzL3Njc2kvYWFjcmFpZC9jb21tc3VwLmM6MTk2MTogd2FybmluZzogZXhw
ZWN0aW5nIHByb3RvdHlwZSBmb3IgYWFjX2hhbmRsZV9zYV9haWYgICAgICAgSGFuZGxlIGEgbWVz
c2FnZSBmcm9tIHRoZSBmaXJtd2FyZSgpLiBQcm90b3R5cGUgd2FzIGZvciBhYWNfaGFuZGxlX3Nh
X2FpZigpIGluc3RlYWQKCkNjOiBBZGFwdGVjIE9FTSBSYWlkIFNvbHV0aW9ucyA8YWFjcmFpZEBt
aWNyb3NlbWkuY29tPgpDYzogIkphbWVzIEUuSi4gQm90dG9tbGV5IiA8amVqYkBsaW51eC5pYm0u
Y29tPgpDYzogIk1hcnRpbiBLLiBQZXRlcnNlbiIgPG1hcnRpbi5wZXRlcnNlbkBvcmFjbGUuY29t
PgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6ICJDaHJpc3Rp
YW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogIlBNQy1TaWVycmEsIElu
YyIgPGFhY3JhaWRAcG1jLXNpZXJyYS5jb20+CkNjOiBsaW51eC1zY3NpQHZnZXIua2VybmVsLm9y
ZwpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCkNjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKU2lnbmVkLW9m
Zi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL3Njc2kv
YWFjcmFpZC9jb21tc3VwLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zY3NpL2FhY3JhaWQvY29t
bXN1cC5jIGIvZHJpdmVycy9zY3NpL2FhY3JhaWQvY29tbXN1cC5jCmluZGV4IDBhZTBkMWZhMmI1
MDcuLjU0ZWI0ZDQxYmMyYzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc2NzaS9hYWNyYWlkL2NvbW1z
dXAuYworKysgYi9kcml2ZXJzL3Njc2kvYWFjcmFpZC9jb21tc3VwLmMKQEAgLTMyMyw3ICszMjMs
NyBAQCB2b2lkIGFhY19maWJfaW5pdChzdHJ1Y3QgZmliICpmaWJwdHIpCiB9CiAKIC8qKgotICoJ
ZmliX2RlYWxsb2NhdGUJCS0JZGVhbGxvY2F0ZSBhIGZpYgorICoJZmliX2RlYWxsb2MJCS0JZGVh
bGxvY2F0ZSBhIGZpYgogICoJQGZpYnB0cjogZmliIHRvIGRlYWxsb2NhdGUKICAqCiAgKglXaWxs
IGRlYWxsb2NhdGUgYW5kIHJldHVybiB0byB0aGUgZnJlZSBwb29sIHRoZSBGSUIgcG9pbnRlZCB0
byBieSB0aGUKQEAgLTE5NTAsNyArMTk1MCw3IEBAIHZvaWQgYWFjX3NyY19yZWluaXRfYWlmX3dv
cmtlcihzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiB9CiAKIC8qKgotICoJYWFjX2hhbmRsZV9z
YV9haWYJSGFuZGxlIGEgbWVzc2FnZSBmcm9tIHRoZSBmaXJtd2FyZQorICoJYWFjX2hhbmRsZV9z
YV9haWYgLQlIYW5kbGUgYSBtZXNzYWdlIGZyb20gdGhlIGZpcm13YXJlCiAgKglAZGV2OiBXaGlj
aCBhZGFwdGVyIHRoaXMgZmliIGlzIGZyb20KICAqCUBmaWJwdHI6IFBvaW50ZXIgdG8gZmlicHRy
IGZyb20gYWRhcHRlcgogICoKLS0gCjIuMjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
