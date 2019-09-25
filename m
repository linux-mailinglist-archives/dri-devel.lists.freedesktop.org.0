Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4729BE4CB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 20:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5340C6EF00;
	Wed, 25 Sep 2019 18:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B4F6EEF6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 18:42:54 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id c6so1324252ioo.13
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 11:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7TqSWERPDP6dY8lexk4L6mhRR8imTrM3/l99588sDqo=;
 b=Wxt2Yte4fgYWchpaCip7GuwuNkgrAI+lmP6+VvoW2Io/s3rrjDBG++BqWE0HZ2qVah
 Pi/pF8jRcVpEcLr2RLrUnsx/ZC4xZIp91UH9KOuMINLmvQ4AwgeA4Ln0b9lVUFxIpEHm
 qqpCSX3gaJML5gM9GLjbbKVq94rQ+zcU82Y3AnPUPY1r7nUhyLyX1PJWbi5KZLTnEQM8
 XngrD7O8/JxNmVpNu/cpqPeCjzbjr9D1Uh2vTEGR92HPi8wC8m1FfHM/hMnlQ9GC/xRB
 TSLwysp7GCkNo3kPjGq4J//fxKpSZVIt8tpipCVBjnB8sVMngZGxgSr3yQNnxK/GDi5l
 nyAA==
X-Gm-Message-State: APjAAAXehsTT3cY2bjIAV9K1KOf3Poz2dMtTH6phHoNjHpGmEbtIxp4r
 6GHk2wAn5nwRPtvNLoRMtYduHVIyNME=
X-Google-Smtp-Source: APXvYqwwrDy8W/AtYbORQyLWMA9NN2CDdud93Tg9fQpFlGiWbambEjDSW7EoczUuk/UioCsYM2LQuQ==
X-Received: by 2002:a6b:3e55:: with SMTP id l82mr877956ioa.216.1569436972896; 
 Wed, 25 Sep 2019 11:42:52 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net.
 [73.37.219.234])
 by smtp.gmail.com with ESMTPSA id q17sm337511ile.5.2019.09.25.11.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 11:42:52 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 2/3] dt-bindings: Add Logic PD Type 28 display panel
Date: Wed, 25 Sep 2019 13:42:37 -0500
Message-Id: <20190925184239.22330-2-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190925184239.22330-1-aford173@gmail.com>
References: <20190925184239.22330-1-aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7TqSWERPDP6dY8lexk4L6mhRR8imTrM3/l99588sDqo=;
 b=FqmZgGUBYxcX6ZXTvgF1ZCGrqCQk4byoZONJBWX/y2WJE1WFxXZy/a/FjD26O420kK
 FxIDzsvAtqvHmKAYSZaqFkUxG57+n9YbAw6NzXffmaE5miqSzRbgKlBOkq2qM0ov5C90
 mX0sV8PP9TGvYnH+e+0pwJqj6vipdHKVWkQFS8/SzjzsMdSSX8aVgkHuepyIB+CJm0yc
 bdmpz6vLOEpQ5Iis1pI4zxssvDaAwPycCtxq9kWhX4q6i8xS7edBxEgMXOXMdmqwUyWn
 +yFrgyQDxWpXUbsy5Acr+k8aLkXAdy9rm1WPZGM0vFjGNNSVue/6B+axo7tFHDgYzyYz
 emyA==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 adam.ford@logicpd.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Adam Ford <aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIGRvY3VtZW50YXRpb24gb2YgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9y
IHRoZSBXVkdBIHBhbmVsCkxvZ2ljIFBEIFR5cGUgMjggZGlzcGxheS4KClNpZ25lZC1vZmYtYnk6
IEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPgotLS0KVjM6ICBDb3JyZWN0IGJ1aWxkIGVy
cm9ycyBmcm9tICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snClYyOiAgVXNlIFlBTUwgaW5zdGVhZCBv
ZiBUWFQgZm9yIGJpbmRpbmcKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC9sb2dpY3BkLHR5cGUyOC55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbG9naWNwZCx0eXBlMjgueWFtbApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjc0YmE2NTBlYTdhMAotLS0g
L2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL2xvZ2ljcGQsdHlwZTI4LnlhbWwKQEAgLTAsMCArMSwzMSBAQAorIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogKEdQTC0yLjArIE9SIFgxMSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwvbG9naWNwZCx0eXBlMjgu
eWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55
YW1sIworCit0aXRsZTogTG9naWMgUEQgVHlwZSAyOCA0LjMiIFdRVkdBIFRGVCBMQ0QgcGFuZWwK
KworbWFpbnRhaW5lcnM6CisgIC0gQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+CisKK3By
b3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IGxvZ2ljcGQsdHlwZTI4CisKKyAg
cG93ZXItc3VwcGx5OgorICAgIGRlc2NyaXB0aW9uOiBSZWd1bGF0b3IgdG8gcHJvdmlkZSB0aGUg
c3VwcGx5IHZvbHRhZ2UKKyAgICBtYXhJdGVtczogMQorCisgIGVuYWJsZS1ncGlvczoKKyAgICBk
ZXNjcmlwdGlvbjogR1BJTyBwaW4gdG8gZW5hYmxlIG9yIGRpc2FibGUgdGhlIHBhbmVsCisgICAg
bWF4SXRlbXM6IDEKKworICBiYWNrbGlnaHQ6CisgICAgZGVzY3JpcHRpb246IEJhY2tsaWdodCB1
c2VkIGJ5IHRoZSBwYW5lbAorICAgICRyZWY6ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0
aW9ucy9waGFuZGxlIgorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisKK2FkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
