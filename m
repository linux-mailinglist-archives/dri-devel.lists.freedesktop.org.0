Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 248ACA62DE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 09:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA0B89664;
	Tue,  3 Sep 2019 07:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46456891CC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 06:54:49 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id n4so8596402pgv.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 23:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dZueRWZd1uZbZNG0riAle5evD2RPXFUMBIbKb1n2stM=;
 b=NBQU7ZIRFtr6QvWwkT8x5+iD5i4CtHCkjWLGOITLgNuIqHkRMsVeF27PKNMeGoHSfL
 Ma+UGfsyMpdFdDpH/yow/fiVpEXhYywoCZHWJVY/t4J+BEoyC/Xw6c+0GjHsck6JpamO
 Oct7felrh+z3Zik50s3dWBZlbkZD6Nb3Xony6ieXvp1x24+5pqXlR1iHe+buNMa3yyf3
 nYz0cCvuOP2NsfbYOHHsv1Dn1rVyDXr+dFnfWhZtZNp0Xv1odtd+WE7eRdnuPKwprv9z
 VGAIUmj2nrHrzSCe8tZJly+VZ8sbosWjzVa6eiNVi41tFjQLmgIVCK4xQ34RE+9cg4D6
 eZ3g==
X-Gm-Message-State: APjAAAWPREHLVNYZ246k5rLR+WL+xvEW144MeSrTbPje/VAEqUxzrl+9
 bzhW3FEviLS0cWTRzZziuL6lPQ==
X-Google-Smtp-Source: APXvYqxkoDM0uGwkQpRgclz5RRJ0gAHteeMYv8Fxj1KTi5HwH2NFSQ2AQjYuF7bCDIFRGM9OMwEfJg==
X-Received: by 2002:a63:7887:: with SMTP id
 t129mr28954591pgc.309.1567493688797; 
 Mon, 02 Sep 2019 23:54:48 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id s7sm5872032pjn.8.2019.09.02.23.54.39
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 02 Sep 2019 23:54:48 -0700 (PDT)
From: Baolin Wang <baolin.wang@linaro.org>
To: stable@vger.kernel.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 davem@davemloft.net, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
 edumazet@google.com, peterz@infradead.org, mingo@redhat.com,
 vyasevich@gmail.com, nhorman@tuxdriver.com, linus.walleij@linaro.org,
 natechancellor@gmail.com, sre@kernel.org, paulus@samba.org,
 gregkh@linuxfoundation.org
Subject: [BACKPORT 4.14.y 0/8] Candidates from Spreadtrum 4.14 product kernel
Date: Tue,  3 Sep 2019 14:53:46 +0800
Message-Id: <cover.1567492316.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
X-Mailman-Approved-At: Tue, 03 Sep 2019 07:41:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=dZueRWZd1uZbZNG0riAle5evD2RPXFUMBIbKb1n2stM=;
 b=FGEtBmTw+UijXa25Ipc7xQ4tq+qIvfBqVg1NmnanWKkTe7yno7WjcxKffa1nMJRAxD
 AOYney+tqn0eT+NmaNjlkHQOanv2QIDA74pDFkjN2+P7BgoLwUFLkf7WRlMExbShWPkY
 li/3kKiY2mP6zBN27Xf9uW7QmC1Xh1uz3qOhy4WUq3vxN6fp1IjTUXp0jvN9sbegwtGr
 jBZD8enNnF01X7NkZsKZipwUc+J5nvDpaxa6aPgYmHKkqoD/xsVarFNXkIr2mGdpaGkC
 eWL7t0M4ytePKm2cj76neBQtC3gx6gqV2FTcsx3B5KgRrVZLgUaYfZ51ZUJWctoicY7C
 TIoA==
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
Cc: hariprasad.kelam@gmail.com, vincent.guittot@linaro.org,
 david@lechnology.com, arnd@arndb.de, linux-pm@vger.kernel.org,
 netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org, ebiggers@google.com,
 orsonzhai@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-sctp@vger.kernel.org, baolin.wang@linaro.org, lanqing.liu@unisoc.com,
 linux-ppp@vger.kernel.org, longman@redhat.com, linux-serial@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCBBcm5kJ3Mgc2NyaXB0IFsxXSBoZWxwLCBJIGZvdW5kIHNvbWUgYnVnZml4ZXMgaW4gU3By
ZWFkdHJ1bSA0LjE0IHByb2R1Y3QKa2VybmVsLCBidXQgbWlzc2luZyBpbiB2NC4xNC4xNDE6Cgo4
NmZkYTkwYWI1ODggbmV0OiBzY3RwOiBmaXggd2FybmluZyAiTlVMTCBjaGVjayBiZWZvcmUgc29t
ZSBmcmVlaW5nIGZ1bmN0aW9ucyBpcyBub3QgbmVlZGVkIgoyNWEwOWNlNzk2MzkgcHBwOiBtcHBl
OiBSZXZlcnQgInBwcDogbXBwZTogQWRkIHNvZnRkZXAgdG8gYXJjNCIKZDliMzA4YjFmOGExIGRy
bS9pOTE1L2ZiZGV2OiBBY3R1YWxseSBjb25maWd1cmUgdW50aWxlZCBkaXNwbGF5cwo0N2QzZDdm
ZGIxMGEgaXA2OiBmaXggc2tiIGxlYWsgaW4gaXA2ZnJhZ19leHBpcmVfZnJhZ19xdWV1ZSgpCjVi
OWNlYTE1YTNkZSBzZXJpYWw6IHNwcmQ6IE1vZGlmeSB0aGUgYmF1ZCByYXRlIGNhbGN1bGF0aW9u
IGZvcm11bGEKNTEzZTEwNzNkNTJlIGxvY2tpbmcvbG9ja2RlcDogQWRkIGRlYnVnX2xvY2tzIGNo
ZWNrIGluIF9fbG9ja19kb3duZ3JhZGUoKQo5NTcwNjNjOTI0NzMgcGluY3RybDogc3ByZDogVXNl
IGRlZmluZSBkaXJlY3RpdmUgZm9yIHNwcmRfcGluY29uZl9wYXJhbXMgdmFsdWVzCjg3YTJiNjVm
Yzg1NSBwb3dlcjogc3VwcGx5OiBzeXNmczogcmF0ZWxpbWl0IHByb3BlcnR5IHJlYWQgZXJyb3Ig
bWVzc2FnZQoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTAzMjIxNTQ0MjUu
Mzg1MjUxNy0xOS1hcm5kQGFybmRiLmRlL1QvCgpDaHJpcyBXaWxzb24gKDEpOgogIGRybS9pOTE1
L2ZiZGV2OiBBY3R1YWxseSBjb25maWd1cmUgdW50aWxlZCBkaXNwbGF5cwoKRGF2aWQgTGVjaG5l
ciAoMSk6CiAgcG93ZXI6IHN1cHBseTogc3lzZnM6IHJhdGVsaW1pdCBwcm9wZXJ0eSByZWFkIGVy
cm9yIG1lc3NhZ2UKCkVyaWMgQmlnZ2VycyAoMSk6CiAgcHBwOiBtcHBlOiBSZXZlcnQgInBwcDog
bXBwZTogQWRkIHNvZnRkZXAgdG8gYXJjNCIKCkVyaWMgRHVtYXpldCAoMSk6CiAgaXA2OiBmaXgg
c2tiIGxlYWsgaW4gaXA2ZnJhZ19leHBpcmVfZnJhZ19xdWV1ZSgpCgpIYXJpcHJhc2FkIEtlbGFt
ICgxKToKICBuZXQ6IHNjdHA6IGZpeCB3YXJuaW5nICJOVUxMIGNoZWNrIGJlZm9yZSBzb21lIGZy
ZWVpbmcgZnVuY3Rpb25zIGlzCiAgICBub3QgbmVlZGVkIgoKTGFucWluZyBMaXUgKDEpOgogIHNl
cmlhbDogc3ByZDogTW9kaWZ5IHRoZSBiYXVkIHJhdGUgY2FsY3VsYXRpb24gZm9ybXVsYQoKTmF0
aGFuIENoYW5jZWxsb3IgKDEpOgogIHBpbmN0cmw6IHNwcmQ6IFVzZSBkZWZpbmUgZGlyZWN0aXZl
IGZvciBzcHJkX3BpbmNvbmZfcGFyYW1zIHZhbHVlcwoKV2FpbWFuIExvbmcgKDEpOgogIGxvY2tp
bmcvbG9ja2RlcDogQWRkIGRlYnVnX2xvY2tzIGNoZWNrIGluIF9fbG9ja19kb3duZ3JhZGUoKQoK
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2ZiZGV2LmMgICAgICAgIHwgICAxMiArKysrKysr
LS0tLS0KIGRyaXZlcnMvbmV0L3BwcC9wcHBfbXBwZS5jICAgICAgICAgICAgICAgIHwgICAgMSAt
CiBkcml2ZXJzL3BpbmN0cmwvc3ByZC9waW5jdHJsLXNwcmQuYyAgICAgICB8ICAgIDYgKystLS0t
CiBkcml2ZXJzL3Bvd2VyL3N1cHBseS9wb3dlcl9zdXBwbHlfc3lzZnMuYyB8ICAgIDMgKystCiBk
cml2ZXJzL3R0eS9zZXJpYWwvc3ByZF9zZXJpYWwuYyAgICAgICAgICB8ICAgIDIgKy0KIGluY2x1
ZGUvbmV0L2lwdjZfZnJhZy5oICAgICAgICAgICAgICAgICAgIHwgICAgMSAtCiBrZXJuZWwvbG9j
a2luZy9sb2NrZGVwLmMgICAgICAgICAgICAgICAgICB8ICAgIDMgKysrCiBuZXQvc2N0cC9zbV9t
YWtlX2NodW5rLmMgICAgICAgICAgICAgICAgICB8ICAgMTIgKysrKy0tLS0tLS0tCiA4IGZpbGVz
IGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQoKLS0gCjEuNy45LjUK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
