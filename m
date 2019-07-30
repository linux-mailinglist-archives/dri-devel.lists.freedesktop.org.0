Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5DA7AF59
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 19:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80E56E5D1;
	Tue, 30 Jul 2019 17:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F58C6E5D1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 17:12:28 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id x74so6050941ywx.6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 10:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ImY2DybhOrcM2lI55Kc331ajwFUz03xP4fYhf/CoFd4=;
 b=dotQpPr2BnNCCoz5v+glNg4Q9JinKpf6UunZsdpXJMv5BfMLWnYGV7vAa9jHZ0oapi
 ltU0Rl8RglBrN+oaogxlKHk7Lf9yMyBuSFQkvMPfKWc5Be4nmPpidh0Eq0TXio2JPTXZ
 QruR9qqokf537smGC+mX+lEYuqCdBykrIsBtU+vLDGhABX32MyXIMPyXfvB+qoL3d4ZB
 +bOe5RZN6tL7T2ZwFD2YLxXSnZ4vtBx3oEbt5kAZ76wJeD0b3lRwbTJxAPXGLZoiCwdC
 Ra7/+6GsG/3/aCpdNgbUrtgVcdEvsa7nCM7YnXx3SOVMGt7mW2Jc8RQBsUysnXlwg/We
 Iygw==
X-Gm-Message-State: APjAAAW+vT0cQfYD1T5/aJf7V3R4BBuZ0YdKpMryPa0AwTr4IGzKLZZU
 Z/zjOoqzYV4qH4mVitbhH9ZRIg==
X-Google-Smtp-Source: APXvYqyrgMcO6GnWamgao3bXgcKs3QGF2zVbFr+EJ+2MO+luR4eSsfFewIm3vX0bBfYAvjwhDqbgCw==
X-Received: by 2002:a0d:eb89:: with SMTP id
 u131mr71135814ywe.417.1564506747714; 
 Tue, 30 Jul 2019 10:12:27 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id x67sm15128373ywg.70.2019.07.30.10.12.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 10:12:27 -0700 (PDT)
Date: Tue, 30 Jul 2019 13:12:27 -0400
From: Sean Paul <sean@poorly.run>
To: Chuhong Yuan <hslester96@gmail.com>
Subject: Re: [PATCH] drm/modes: Fix unterminated strncpy
Message-ID: <20190730171227.GS104440@art_vandelay>
References: <20190730084032.26428-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730084032.26428-1-hslester96@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ImY2DybhOrcM2lI55Kc331ajwFUz03xP4fYhf/CoFd4=;
 b=fnTPfuSOS5xpzgI/dQJjNEhuWQ9V5NaVEYODjti6i+5CsuI18ORya/MuBcyjj5rKHw
 OGqBw9FvQA+91ljA6QWTZ+QjMYN6u0YAvnZ6iB6zumCkot1zgc+Ge8Zr36k9WdlYCPIq
 5Qa+Xb7vJCv4lzx1IY48fS1EAyLA9/Pui0xCKvGCSTggjJbOVlLLVggs++kF07g3IQ+O
 MDdhIiresslcCgniwoC9JKTEDXB2NgciRQNn42Sv31gjZ6lsRJdl5wmhwdJ/hRypG8x5
 /ePhj9cW+yWQYFKxEnLr1qEJp1o4qn6Mm25gYkJ3tlQqAsxDseFTGf3giZ5YNxic5xeY
 6ocQ==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDQ6NDA6MzJQTSArMDgwMCwgQ2h1aG9uZyBZdWFuIHdy
b3RlOgo+IHN0cm5jcHkoZGVzdCwgc3JjLCBzdHJsZW4oc3JjKSkgbGVhZHMgdG8gdW50ZXJtaW5h
dGVkCj4gZGVzdCwgd2hpY2ggaXMgZGFuZ2Vyb3VzLgo+IEZpeCBpdCBieSB1c2luZyBzdHJzY3B5
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENodWhvbmcgWXVhbiA8aHNsZXN0ZXI5NkBnbWFpbC5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyB8IDIgKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+
IGluZGV4IDgwZmNkNWRjMTU1OC4uMTcwZmMyNGUwZjMxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fbW9kZXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+
IEBAIC0xNzcwLDcgKzE3NzAsNyBAQCBib29sIGRybV9tb2RlX3BhcnNlX2NvbW1hbmRfbGluZV9m
b3JfY29ubmVjdG9yKGNvbnN0IGNoYXIgKm1vZGVfb3B0aW9uLAo+ICAJfQo+ICAKPiAgCWlmIChu
YW1lZF9tb2RlKSB7Cj4gLQkJc3RybmNweShtb2RlLT5uYW1lLCBuYW1lLCBtb2RlX2VuZCk7Cj4g
KwkJc3Ryc2NweShtb2RlLT5uYW1lLCBuYW1lLCBtb2RlX2VuZCArIDEpOwoKU2hvdWxkbid0IHlv
dSBiZSBjaGVja2luZyB0aGF0IG1vZGVfZW5kICsgMSBpcyBub3QgPiB0aGFuIHRoZSBzaXplIG9m
IG1vZGUtPm5hbWUKKGllOiBEUk1fRElTUExBWV9NT0RFX0xFTik/IFRoaXMgc3RpbGwgc2VlbXMg
dW5zYWZlLgoKU2VhbgoKPiAgCX0gZWxzZSB7Cj4gIAkJcmV0ID0gZHJtX21vZGVfcGFyc2VfY21k
bGluZV9yZXNfbW9kZShuYW1lLCBtb2RlX2VuZCwKPiAgCQkJCQkJICAgICAgcGFyc2VfZXh0cmFz
LAo+IC0tIAo+IDIuMjAuMQo+IAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdv
b2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
