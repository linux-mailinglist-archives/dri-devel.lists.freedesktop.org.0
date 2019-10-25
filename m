Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950BEE455C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 10:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660C46E8FB;
	Fri, 25 Oct 2019 08:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE3D6E8A7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 06:26:57 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id f14so848782pgi.9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 23:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kWGp9sOeuM7g3L8X/Vi+/PrzfPBp78lgCDYiRXJdTLk=;
 b=O+bs0Ee8rukLOTJkE3Q7EGjyNatn9U+Vf9e1KRhB3jHFTuWxmZ6+mGfErh0VNN5YKS
 AAeqyIrRKt2uETAwbSQpPnW/XFXwnoxYCSyiX2884otew+P4UwE68TutejiRhEFahLdD
 6BzJBeBYBvC3kVBuiDP2lCQQWz35Z01JhdQ5YjXPG5vAJsv2SftZRy4OCkcMH1b0algS
 92SrAAhAw1lN46GuHwiQkaNMZz15dl9+Jc6eYhHLXtz0XHitT+n8n9eozvAky3nnXgwF
 JDDJkuR6Qml/uMYehCU1eDQKGhsJQ6ypQtvyJAJ/AeB5DmeuYnNs81gqFOcZkQMGMI5u
 lDXQ==
X-Gm-Message-State: APjAAAW9zRmwFS6F/RfaVX11S7lRIaqNXNnUHxdYrmk5gLS1ejeaRPyz
 bB3F5vq+18X9GUhbhMC+0u9JX+Dm
X-Google-Smtp-Source: APXvYqz5/74/3oFQyz7Vc41KmEIqKMW8P4EZWUyvgGSlkzCFolh/5N1hFAYsjA7fP7AmbNRIGTR+nA==
X-Received: by 2002:a62:4e03:: with SMTP id c3mr2272532pfb.114.1571984816928; 
 Thu, 24 Oct 2019 23:26:56 -0700 (PDT)
Received: from bhanu-VirtualBox.danlawtech.com ([183.82.102.247])
 by smtp.gmail.com with ESMTPSA id c128sm1068876pfc.166.2019.10.24.23.26.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 24 Oct 2019 23:26:56 -0700 (PDT)
From: Bhanusree <bhanusreemahesh@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/gpu: Fix checkpatch.pl warnings
Date: Fri, 25 Oct 2019 11:56:48 +0530
Message-Id: <1571984808-4552-1-git-send-email-bhanusreemahesh@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 25 Oct 2019 08:11:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=kWGp9sOeuM7g3L8X/Vi+/PrzfPBp78lgCDYiRXJdTLk=;
 b=Tzy8BLci8g6EDM+CX+1WfnedU6CWfcz1sShaGHplB3lz9l5AmVpftRF8JCJu5E+AC/
 5UsUBzL7z/fyGw0JsCMTHZ5IbA0BArxCijAs1mS4HsuyMkFUBxVd2CpJgrfRHoh8b7K6
 MGMIIDvzuxiGVPA58BVF0+FqWnlvSDolJHhONjjK5EIUGWUjiB6Tl+oW3IGXF+TxR6b+
 8FGsNZPKFa/lCEjr7rYcxkPVmRm4LxiyBYJHuQZdYWPh7YoInJZAVek4j7WzFoplBmfZ
 Cro6EVop69NMEvSDS225BCSYQVHlj/Y75/f4fnSLkgX4Ho5jMXBh/D2WMY47QaHMqYB/
 qlZg==
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
Cc: airlied@linux.ie, Bhanusree <bhanusreemahesh@gmail.com>, sean@poorly.run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgY2xlYXJzIHRoZSBjaGVja3BhdGNoLnBsIHdhcm5pbmdzCltQQVRD
SCAxLzJdOkZpeCBNaXNzaW5nIGJsYW5rIGxpbmUgYWZ0ZXIgZGVjbGFyYXRpb25zCltQQVRDSCAy
LzJdOkZpeCBNZW1vcnkgYmFycmllciB3aXRob3V0IGNvbW1lbnQKCkJoYW51c3JlZSAoMik6CiAg
ZHJtL2dwdTogRml4IE1pc3NpbmcgYmxhbmsgbGluZSBhZnRlciBkZWNsYXJhdGlvbnMKICBkcm0v
Z3B1OiBGaXggTWVtb3J5IGJhcnJpZXIgd2l0aG91dCBjb21tZW50IElzc3VlCgogZHJpdmVycy9n
cHUvZHJtL2RybV9jYWNoZS5jIHwgMTAgKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
