Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BB31E97E8
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 15:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F7B89E9B;
	Sun, 31 May 2020 13:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18C289E9B;
 Sun, 31 May 2020 13:46:16 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c71so8238302wmd.5;
 Sun, 31 May 2020 06:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:subject:mime-version
 :content-transfer-encoding:content-disposition;
 bh=vltHbCf/YzphA0i1K874A1cqpT4cIDmiuGQWGOJBMC0=;
 b=Iq4oZdoApLB2TSPYEjNZNmi8o4hHH3nHBkkaGoC+mSzAxKLklhjy9HzP8WnI1ljX7w
 DC/bpXkLcvfaI0sDFPiFZFwnAwyfFf2btztc5/MHfcYh2hOLht4kSnmTde/CxBGfb3cW
 ptc8mEpwZu7wChV/AsJOctxLynvSVQrXauE7yKA/dUVEITtD6HH/oqEIOYqJI92fzges
 kkG1KaXA5JDx8E4ROKnNxhjMO96Od8aiZeTIj0uHW+dw+FIEPh9BH0igY4YeYAhBGVJS
 Sjt+Xfvs0qpiln0SFqTUkvRqrUDsWl8qq/5kEJIj8pC8s0UvJIOf0uulQvuzvCY+oN/o
 h2JA==
X-Gm-Message-State: AOAM532Z9ngBJ32ZBfeqRU5TP39PF4GTK7qTjbuBS7VBImh9Uq5FaTPP
 GRjD5a8qGWywNltkEQbCYa+fDupLzlM=
X-Google-Smtp-Source: ABdhPJzfysuMV0Ihm/f9qzb+eZ7Maxal5yo5IX+Dcgi47lPOrcITPRbaOz6zqtT/mk1oVl+MorRDCg==
X-Received: by 2002:a7b:cd94:: with SMTP id y20mr16888826wmj.87.1590932774704; 
 Sun, 31 May 2020 06:46:14 -0700 (PDT)
Received: from iHack.local.mail ([194.44.16.38])
 by smtp.gmail.com with ESMTPSA id r7sm7841425wmb.32.2020.05.31.06.46.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 31 May 2020 06:46:14 -0700 (PDT)
Date: Sun, 31 May 2020 16:46:07 +0300
From: Yurii Kolesnykov <root@yurikoles.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <etPan.5ed3b524.19a55007.762@yurikoles.com>
Subject: Current drm-tip =?utf-8?Q?doesn=E2=80=99t_?=build with gcc10 -
 error in amdgpu_amdkfd_gpuvm.c
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: alexander.deucher@amd.com, jghodd@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3JpZ2luYWxseSByZXBvcnRlZCBieSBqZ2hvZGRbMV0gaW4gbGludXgtZHJtLXRpcC1naXQgQVVS
IHBhY2thZ2UgWzJdLCBhbHNvIHJlcG9ydGVkIG9uIGRybS9hbWQgb24gRnJlZWRlc2t0b3AgR2l0
TGFiIFszXS4KCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0u
YzogSW4gZnVuY3Rpb24g4oCYYW1kZ3B1X2FtZGtmZF9ncHV2bV9mcmVlX21lbW9yeV9vZl9ncHXi
gJk6IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYzoxMzU3
OjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhkcm1fZ2VtX29i
amVjdF9wdXRfdW5sb2NrZWTigJk7IGRpZCB5b3UgbWVhbiDigJhkcm1fZ2VtX29iamVjdF9wdXRf
bG9ja2Vk4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0gMTM1NyB8
IMKgZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKCZtZW0tPmJvLT50Ym8uYmFzZSk7IHwgwqBe
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4gfCDCoGRybV9nZW1fb2JqZWN0X3B1dF9sb2NrZWQg
Y2MxOiBzb21lIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzIG1ha2VbNF06ICoqKiBb
c2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyNjc6IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hbWRrZmRfZ3B1dm0ub10gRXJyb3IgMSBtYWtlWzNdOiAqKiogW3NjcmlwdHMvTWFrZWZp
bGUuYnVpbGQ6NDg4OiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdV0gRXJyb3IgMiBtYWtlWzJd
OiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDg4OiBkcml2ZXJzL2dwdS9kcm1dIEVycm9y
IDIgbWFrZVsxXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQ4ODogZHJpdmVycy9ncHVd
IEVycm9yIDIgbWFrZTogKioqIFtNYWtlZmlsZToxNzI5OiBkcml2ZXJzXSBFcnJvciAyID09PiBF
UlJPUjogQSBmYWlsdXJlIG9jY3VycmVkIGluIGJ1aWxkKCkuIEFib3J0aW5n4oCmCgpbMV0gaHR0
cHM6Ly9hdXIuYXJjaGxpbnV4Lm9yZy9hY2NvdW50L2pnaG9kZApbMl0gaHR0cHM6Ly9hdXIuYXJj
aGxpbnV4Lm9yZy9wa2diYXNlL2xpbnV4LWRybS10aXAtZ2l0ClszXSBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvZHJtL2FtZC8tL2lzc3Vlcy8xMTU2CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
