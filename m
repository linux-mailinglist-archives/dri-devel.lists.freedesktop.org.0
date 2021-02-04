Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDE830EB7A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 05:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2F56EC71;
	Thu,  4 Feb 2021 04:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184D86EC71;
 Thu,  4 Feb 2021 04:13:13 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id d15so1492433qtw.12;
 Wed, 03 Feb 2021 20:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q7nM3YW8wdhCWWDuBbukrMOV0Icg4zaeK2JPFZ1TIZk=;
 b=C7duKSeHYsWSq/qICmtwTPNTOTyMSOOj0mEkzla71QUCpcJvFZ9JQLTwUz7hJX/jOW
 s3cgM5hEYMsSvyFHE5PktzO0paEp+Nbxs/D+CFWKY3vXL6cNGhaS5pq/AIcTSVVMIOas
 luvrQHV7vnnZ1R1Qjt8T3qDvVPMr8In3F6/o7Q+cMJu+QYsHLI2xPEZEsPpwNWQ9AsZd
 PyMMRRqkiUBgibhg+VjchxWncC7yRHz+RHVOXe7JdEFua0tWS/nsUZYSNy/LsTtXP5IX
 +txGLJpfaZ0wI7eM0y3HU3FVnfyHMzYVWkn8mHhDQLUIv/fCBCl3rHMycSS7+nTRtb4m
 +flA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q7nM3YW8wdhCWWDuBbukrMOV0Icg4zaeK2JPFZ1TIZk=;
 b=tc3nRyyb20PkMv/iG8Vzv+AoQLZRkAf5UPBVKOqkoUH9cmehnkOS1nF2+Iks24izW1
 IYT47mKVDCiGCazxbcvPI+MvbE0hILP5siHxW6XypP87Pc2+T19ldLJhtYWOxBCVP8Wd
 VUek8XmNzkq458XEq6s4EWnL7uAaOZW3nB/2/5wo2J+04BDtzPIPpst4SQfEAqJRwli5
 /3AMM7CzCYdC/vzWnqfBqDPp58WNrfr69ekkK/mZ33uzmVhBYik+uve8o3z5gUefIJPS
 RlxtKb6QjyapS2xypK5PtqYw1Z+7eaMgAmuuALVuSGjGOa8q0Oxv9xxPKtzAHE4qH8m5
 LMVQ==
X-Gm-Message-State: AOAM531aj0HxjtC7LTgsjZWW0BKbeSQhjqggOx/PzYuK27ResJBUOuhD
 +Cgwo/SPj8jDS+z9kGgLIZ7XwlsT/cM=
X-Google-Smtp-Source: ABdhPJwoTdwuMkPLffM0c9jZwV0O5zsO29qD4YsSMMk8P87MILwFnMRY1zaY4kjLubxkugsTWCX6LA==
X-Received: by 2002:ac8:16b9:: with SMTP id r54mr5549519qtj.68.1612411991973; 
 Wed, 03 Feb 2021 20:13:11 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.237])
 by smtp.gmail.com with ESMTPSA id s6sm3544063qtx.63.2021.02.03.20.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 20:13:11 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-fixes-5.11
Date: Wed,  3 Feb 2021 23:13:00 -0500
Message-Id: <20210204041300.4425-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.29.2
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKRml4ZXMgZm9yIDUuMTEuCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMg
c2luY2UgY29tbWl0IGUwZWNhZmVkZTg3ZWIxYTNkMWU3MDhmMDM2NWZhZDBkNTk0ODkyODU6Cgog
IE1lcmdlIHRhZyAnYW1kLWRybS1maXhlcy01LjExLTIwMjEtMDEtMjgnIG9mIGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9hZ2Q1Zi9saW51eCBpbnRvIGRybS1maXhlcyAoMjAyMS0wMS0y
OSAxMTozNjozOCArMTAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0
OgoKICBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvYWdkNWYvbGludXguZ2l0IHRhZ3Mv
YW1kLWRybS1maXhlcy01LjExLTIwMjEtMDItMDMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1
cCB0byA4ZTkyYmIwZmE3NWJjYTlhNTdlNGFiYTJlMzZmNjdkODAxNmEzMDUzOgoKICBkcm0vYW1k
L2Rpc3BsYXk6IERlY3JlbWVudCByZWZjb3VudCBvZiBkY19zaW5rIGJlZm9yZSByZWFzc2lnbm1l
bnQgKDIwMjEtMDItMDIgMTc6NDU6MDEgLTA1MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmFtZC1kcm0tZml4ZXMtNS4x
MS0yMDIxLTAyLTAzOgoKYW1kZ3B1OgotIEZpeCByZXRyeSBpbiBnZW0gY3JlYXRlCi0gVmFuZ29n
aCBmaXhlcwotIEZpeCBmb3IgZGlzcGxheSBmcm9tIHNoYXJlZCBidWZmZXJzCi0gVmFyaW91cyBk
aXNwbGF5IGZpeGVzCgphbWRrZmQ6Ci0gRml4IHJlZ3Jlc3Npb24gaW4gYnVmZmVyIGZyZWUKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KQmhhd2FucHJlZXQgTGFraGEgKDEpOgogICAgICBkcm0vYW1kL2Rpc3BsYXk6IHJldXNl
IGN1cnJlbnQgY29udGV4dCBpbnN0ZWFkIG9mIHJlY3JlYXRpbmcgb25lCgpDaHJpc3RpYW4gS8O2
bmlnICgxKToKICAgICAgZHJtL2FtZGdwdTogZW5hYmxlIGZyZWVzeW5jIGZvciBBK0EgY29uZmln
cwoKR2VvcmdlIFNoZW4gKDEpOgogICAgICBkcm0vYW1kL2Rpc3BsYXk6IEZpeCBEUENEIHRyYW5z
bGF0aW9uIGZvciBMVFRQUiBBVVhfUkRfSU5URVJWQUwKCkh1YW5nIFJ1aSAoMik6CiAgICAgIGRy
bS9hbWRncHU6IGZpeCB0aGUgaXNzdWUgdGhhdCByZXRyeSBjb25zdGFudGx5IG9uY2UgdGhlIGJ1
ZmZlciBpcyBvdmVyc2l6ZQogICAgICBkcm0vYW1ka2ZkOiBmaXggbnVsbCBwb2ludGVyIHBhbmlj
IHdoaWxlIGZyZWUgYnVmZmVyIGluIGtmZAoKTWlraXRhIExpcHNraSAoMSk6CiAgICAgIGRybS9h
bWQvZGlzcGxheTogUmVsZWFzZSBEU0MgYmVmb3JlIGFjcXVpcmluZwoKU3R5bG9uIFdhbmcgKDEp
OgogICAgICBkcm0vYW1kL2Rpc3BsYXk6IFJldmVydCAiRml4IEVESUQgcGFyc2luZyBhZnRlciBy
ZXN1bWUgZnJvbSBzdXNwZW5kIgoKU3VuZyBMZWUgKDEpOgogICAgICBkcm0vYW1kL2Rpc3BsYXk6
IEFkZCBtb3JlIENsb2NrIFNvdXJjZXMgdG8gRENOMi4xCgpWaWN0b3IgTHUgKDMpOgogICAgICBk
cm0vYW1kL2Rpc3BsYXk6IEZpeCBkY19zaW5rIGtyZWYgY291bnQgaW4gZW11bGF0ZWRfbGlua19k
ZXRlY3QKICAgICAgZHJtL2FtZC9kaXNwbGF5OiBGcmVlIGF0b21pYyBzdGF0ZSBhZnRlciBkcm1f
YXRvbWljX2NvbW1pdAogICAgICBkcm0vYW1kL2Rpc3BsYXk6IERlY3JlbWVudCByZWZjb3VudCBv
ZiBkY19zaW5rIGJlZm9yZSByZWFzc2lnbm1lbnQKClhpYW9qaWFuIER1ICgxKToKICAgICAgZHJt
L2FtZC9wbTogZmlsbCBpbiB0aGUgZGF0YSBtZW1iZXIgb2YgdjIgZ3B1IG1ldHJpY3MgdGFibGUg
Zm9yIHZhbmdvZ2gKCmNoZW4gZ29uZyAoMSk6CiAgICAgIGRybS9hbWRncHUvZ2Z4MTA6IHVwZGF0
ZSBDR1RTX1RDQ19ESVNBQkxFIGFuZCBDR1RTX1VTRVJfVENDX0RJU0FCTEUgcmVnaXN0ZXIgb2Zm
c2V0cyBmb3IgVkdICgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9n
cHV2bS5jICAgfCAxNiArKystLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Rpc3BsYXkuYyAgICAgICAgfCAgOCArKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZ2VtLmMgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfb2JqZWN0LmMgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjEwXzAuYyAgICAgICAgICAgICB8IDE4ICsrKysrKysrLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyAgfCA0NyArKysrKysrKysrLS0t
LS0tLS0tLS0tCiAuLi4vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMu
YyAgICB8ICA2ICsrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyAg
ICAgICAgICAgfCAyNyArKysrKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rX2RwLmMgICB8ICA2ICstLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjX3N0cmVhbS5oICAgICAgICAgfCAgMyArLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYyAgfCAxMCArKysrKwogZHJpdmVycy9ncHUvZHJt
L2FtZC9wbS9zd3NtdS9zbXUxMS92YW5nb2doX3BwdC5jICAgfCAgMyArKwogMTIgZmlsZXMgY2hh
bmdlZCwgOTIgaW5zZXJ0aW9ucygrKSwgNTYgZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
