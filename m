Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E9430044C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 14:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BAB6EA01;
	Fri, 22 Jan 2021 13:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BBF6EA01
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 13:36:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id m2so4337810wmm.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 05:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=edG1bcKl/JltMmw8l3x2znGINV2sLZxwkYJ8IRqXyp4=;
 b=QAgz2EzaBlKwijAgAQpl6fX2ZKyUP4Vt+msdnx4A5y5bo6FldmRBNMpJDtqtar9arz
 E4tu8bXvgQDwpg9+YC8HyVujuwbaXSsEBW3JnMWcsvkgXskLMtDPf7FvHBUSs7Qn8KMV
 YXo4RpK0uOHegM18CS014aqDUxy5uVGc92ctQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=edG1bcKl/JltMmw8l3x2znGINV2sLZxwkYJ8IRqXyp4=;
 b=dC9nKuN0cPoiPn07w02mLKZV9nOW9bGSBKlBz5aIJgpsFAAR1z4KqMKzB4+8SPA0BZ
 RhS86XdcrQkRweldPE2XHbzt+B1b4jnRnlqIb814VqWCcoySy01owxv5f81xvUdU564B
 Q7LSDxQlyAGdGp74qnb+CZOGxomRLftkGtutuH6xdm3F8FoLiuv3G+wZ1L8tNuU18yIb
 sZ62E9BO6i1VCjYMWSBQ/3uqbQUxjDLz/X+u0H4tZpX2maw3gTnkKfENEgbyJRv1RSGt
 CaXeOn4s/20y/6Iwq1XpoQUABrjVbtg2M2KVRDslTxiCa2NCYnF8b2zJu8zSIL0Nm4mC
 ktIQ==
X-Gm-Message-State: AOAM532FzpzTnVDH8JE6ybqLQcPMMYJWTA08YrdBgiBErmsfvWXnXXbK
 kf19CdU/HrKX1/PRYHi050Vt6Mk7M8fpsNnN
X-Google-Smtp-Source: ABdhPJyqUays+vT7bQV8b2GQBF2WkY4wYp/uur4k09VBD0DwleCxtfjPL3RB07HyZym+ymor5fJfww==
X-Received: by 2002:a7b:cd8e:: with SMTP id y14mr4119720wmj.61.1611322590741; 
 Fri, 22 Jan 2021 05:36:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i131sm10939005wmi.25.2021.01.22.05.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 05:36:30 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/todo: Add entry for moving to dma_resv_lock
Date: Fri, 22 Jan 2021 14:36:23 +0100
Message-Id: <20210122133624.1751802-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVxdWVzdGVkIGJ5IFRob21hcy4gSSB0aGluayBpdCBqdXN0aWZpZXMgYSBuZXcgbGV2ZWwsIHNp
bmNlIEkgdHJpZWQKdG8gbWFrZSBzb21lIGZvcndhcmQgcHJvZ3Jlc3Mgb24gdGhpcyBsYXN0IHN1
bW1lciwgYW5kIGdhdmUgdXAgKGZvcgpub3cpLiBUaGlzIGlzIHZlcnkgdHJpY2t5LgoKU2lnbmVk
LW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBNYWFy
dGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4
aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0
LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+CkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1t
bS1zaWdAbGlzdHMubGluYXJvLm9yZwotLS0KIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IHwg
MTkgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3VtZW50YXRpb24v
Z3B1L3RvZG8ucnN0CmluZGV4IGRlYTkwODJjMGU1Zi4uZjg3MmQzZDMzMjE4IDEwMDY0NAotLS0g
YS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2Rv
LnJzdApAQCAtMjMsNiArMjMsOSBAQCBBZHZhbmNlZDogVHJpY2t5IHRhc2tzIHRoYXQgbmVlZCBm
YWlybHkgZ29vZCB1bmRlcnN0YW5kaW5nIG9mIHRoZSBEUk0gc3Vic3lzdGVtCiBhbmQgZ3JhcGhp
Y3MgdG9waWNzLiBHZW5lcmFsbHkgbmVlZCB0aGUgcmVsZXZhbnQgaGFyZHdhcmUgZm9yIGRldmVs
b3BtZW50IGFuZAogdGVzdGluZy4KIAorRXhwZXJ0OiBPbmx5IGF0dGVtcHQgdGhlc2UgaWYgeW91
J3ZlIHN1Y2Nlc3NmdWxseSBjb21wbGV0ZWQgc29tZSB0cmlja3kKK3JlZmFjdG9yaW5ncyBhbHJl
YWR5IGFuZCBhcmUgYW4gZXhwZXJ0IGluIHRoZSBzcGVjaWZpYyBhcmVhCisKIFN1YnN5c3RlbS13
aWRlIHJlZmFjdG9yaW5ncwogPT09PT09PT09PT09PT09PT09PT09PT09PT09CiAKQEAgLTE2OCw2
ICsxNzEsMjIgQEAgQ29udGFjdDogRGFuaWVsIFZldHRlciwgcmVzcGVjdGl2ZSBkcml2ZXIgbWFp
bnRhaW5lcnMKIAogTGV2ZWw6IEFkdmFuY2VkCiAKK01vdmUgQnVmZmVyIE9iamVjdCBMb2NraW5n
IHRvIGRtYV9yZXN2X2xvY2soKQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCisKK01hbnkgZHJpdmVycyBoYXZlIHRoZWlyIG93biBwZXItb2JqZWN0IGxvY2tp
bmcgc2NoZW1lLCB1c3VhbGx5IHVzaW5nCittdXRleF9sb2NrKCkuIFRoaXMgY2F1c2VzIGFsbCBr
aW5kcyBvZiB0cm91YmxlIGZvciBidWZmZXIgc2hhcmluZywgc2luY2UKK2RlcGVuZGluZyB3aGlj
aCBkcml2ZXIgaXMgdGhlIGV4cG9ydGVyIGFuZCBpbXBvcnRlciwgdGhlIGxvY2tpbmcgaGllcmFy
Y2h5IGlzCityZXZlcnNlZC4KKworVG8gc29sdmUgdGhpcyB3ZSBuZWVkIG9uZSBzdGFuZGFyZCBw
ZXItb2JqZWN0IGxvY2tpbmcgbWVjaGFuaXNtLCB3aGljaCBpcworZG1hX3Jlc3ZfbG9jaygpLiBU
aGlzIGxvY2sgbmVlZHMgdG8gYmUgY2FsbGVkIGFzIHRoZSBvdXRlcm1vc3QgbG9jaywgd2l0aCBh
bGwKK290aGVyIGRyaXZlciBzcGVjaWZpYyBwZXItb2JqZWN0IGxvY2tzIHJlbW92ZWQuIFRoZSBw
cm9ibGVtIGlzIHRoYSByb2xsaW5nIG91dAordGhlIGFjdHVhbCBjaGFuZ2UgdG8gdGhlIGxvY2tp
bmcgY29udHJhY3QgaXMgYSBmbGFnIGRheSwgZHVlIHRvIHN0cnVjdCBkbWFfYnVmCitidWZmZXIg
c2hhcmluZy4KKworTGV2ZWw6IEV4cGVydAorCiBDb252ZXJ0IGxvZ2dpbmcgdG8gZHJtXyogZnVu
Y3Rpb25zIHdpdGggZHJtX2RldmljZSBwYXJhbWF0ZXIKIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogCi0tIAoyLjMwLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
