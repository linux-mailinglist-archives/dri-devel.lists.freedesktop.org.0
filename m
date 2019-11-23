Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B1E107C1D
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2019 01:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2186E123;
	Sat, 23 Nov 2019 00:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731576E123;
 Sat, 23 Nov 2019 00:44:40 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id l14so7759047oti.10;
 Fri, 22 Nov 2019 16:44:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ocM/TfQWn8TE8osmtfQ8wIGRKP2lr8zZ4qHKR/RTxk8=;
 b=lzaVGFw1XlJ3QdytCTw+YrABu8WeiUlQSsIbdAQfy4kVPHrf8205FVPCbHXrFVmLwo
 5zT6KCnAwyO0Eu/CXseIeJoegPc7qhtC1ktJq1rd9KDF9Sq4uX9cpPj4jS2UQbTCTXMV
 7xvrJGwk6stnOSf52PUAOru+1Og34zDJE9NOhv0aFQqrGHQQqzjxqS2koNkhjkOKubtV
 anML/ACnHaJ76jxZIeQkXlIroqwasmHeZLlPGLdEJjv/WW2i+/0pCiiMj+eNhv0wXaM/
 vXQ5Vb39Wdp0FjrPprY0bzYe7kaLRp8tjh9bsc2VtyACWL86NKAY2GnZ1sqoSULMTdoG
 ga6Q==
X-Gm-Message-State: APjAAAUm7EcZvbJog9msq80sURHkLNVxQE4mso9/rqEkL0XkV7bO9h9p
 fs8d71xGeh5cJ34+Mlx0Sg==
X-Google-Smtp-Source: APXvYqwTtwrVHOXVe5oR9OATyOVwIbX//sNr5xMzcE6pqC7NMGobhGuQsuCW78elG91OHMWuUlwY+Q==
X-Received: by 2002:a9d:604d:: with SMTP id v13mr12838416otj.222.1574469879638; 
 Fri, 22 Nov 2019 16:44:39 -0800 (PST)
Received: from localhost (ip-70-5-93-147.ftwttx.spcsdns.net. [70.5.93.147])
 by smtp.gmail.com with ESMTPSA id m205sm2685802oib.27.2019.11.22.16.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 16:44:38 -0800 (PST)
Date: Fri, 22 Nov 2019 18:44:36 -0600
From: Rob Herring <robh@kernel.org>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [PATCH v3] msm:disp:dpu1: add support for display for SC7180
 target
Message-ID: <20191123004436.GA18110@bogus>
References: <1574252368-4645-1-git-send-email-kalyan_t@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574252368-4645-1-git-send-email-kalyan_t@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, dhar@codeaurora.org, travitej@codeaurora.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org, chandanu@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDU6NDk6MjhQTSArMDUzMCwgS2FseWFuIFRob3RhIHdy
b3RlOgo+IEFkZCBkaXNwbGF5IGh3IGNhdGFsb2cgY2hhbmdlcyBmb3IgU0M3MTgwIHRhcmdldC4K
PiAKPiBDaGFuZ2VzIGluIHYxOgo+ICAtIENvbmZpZ3VyZSByZWdpc3RlciBvZmZzZXRzIGFuZCBj
YXBhYmlsaXRpZXMgZm9yIHRoZQo+ICAgIGRpc3BsYXkgaHcgYmxvY2tzLgo+IAo+IENoYW5nZXMg
aW4gdjI6Cj4gIC0gbWRzc19pcnEgZGF0YSB0eXBlIGhhcyBjaGFuZ2VkIGluIHRoZSBkZXBlbmRl
bnQKPiAgICBwYXRjaCwgYWNjb21tb2RhdGUgdGhlIG5lY2Vzc2FyeSBjaGFuZ2VzLgo+ICAtIEFk
ZCBjby1kZXZlbG9wZWQtYnkgdGFncyBpbiB0aGUgY29tbWl0IG1zZyAoU3RlcGhlbiBCb3lkKS4K
PiAKPiBDaGFuZ2VzIGluIHYzOgo+ICAtIGZpeCBrZXJuZWwgY2hlY2twYXRjaCBlcnJvcnMgaW4g
djIKCkJ1dCBub3QgdGhlIG9uZSB0ZWxsaW5nIHlvdSB0byBzcGxpdCBiaW5kaW5ncyB0byBzZXBh
cmF0ZSBwYXRjaD8KCj4gCj4gVGhpcyBwYXRjaCBoYXMgZGVwZW5kZW5jeSBvbiB0aGUgYmVsb3cg
c2VyaWVzCj4gCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTI1MzY0Ny8K
PiAKPiBDby1kZXZlbG9wZWQtYnk6IFNodWJoYXNocmVlIERoYXIgPGRoYXJAY29kZWF1cm9yYS5v
cmc+Cj4gU2lnbmVkLW9mZi1ieTogU2h1Ymhhc2hyZWUgRGhhciA8ZGhhckBjb2RlYXVyb3JhLm9y
Zz4KPiBDby1kZXZlbG9wZWQtYnk6IFJhdml0ZWphIFRhbWF0YW0gPHRyYXZpdGVqQGNvZGVhdXJv
cmEub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFJhdml0ZWphIFRhbWF0YW0gPHRyYXZpdGVqQGNvZGVh
dXJvcmEub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEthbHlhbiBUaG90YSA8a2FseWFuX3RAY29kZWF1
cm9yYS5vcmc+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2Rw
dS50eHQgICAgICAgIHwgICA0ICstCgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4KCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19jYXRhbG9nLmMg
ICAgIHwgMTg5ICsrKysrKysrKysrKysrKysrKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvZHB1MS9kcHVfaHdfY2F0YWxvZy5oICAgICB8ICAgNCArCj4gIGRyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9od19sbS5jICAgICAgICAgIHwgICAzICstCj4gIGRyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYyAgICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVy
cy9ncHUvZHJtL21zbS9tc21fZHJ2LmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KPiAg
NiBmaWxlcyBjaGFuZ2VkLCAxOTAgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21z
bS9kcHUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNt
L2RwdS50eHQKPiBpbmRleCBhNjFkZDQwLi41MTJmMDIyIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kcHUudHh0Cj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2RwdS50eHQKPiBAQCAt
OCw3ICs4LDcgQEAgVGhlIERQVSBkaXNwbGF5IGNvbnRyb2xsZXIgaXMgZm91bmQgaW4gU0RNODQ1
IFNvQy4KPiAgCj4gIE1EU1M6Cj4gIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gLS0gY29tcGF0aWJs
ZTogInFjb20sc2RtODQ1LW1kc3MiCj4gKy0gY29tcGF0aWJsZTogInFjb20sc2RtODQ1LW1kc3Mi
LCAicWNvbSxzYzcxODAtbWRzcyIKPiAgLSByZWc6IHBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQg
bGVuZ3RoIG9mIGNvbnRvbGxlcidzIHJlZ2lzdGVycy4KPiAgLSByZWctbmFtZXM6IHJlZ2lzdGVy
IHJlZ2lvbiBuYW1lcy4gVGhlIGZvbGxvd2luZyByZWdpb24gaXMgcmVxdWlyZWQ6Cj4gICAgKiAi
bWRzcyIKPiBAQCAtNDEsNyArNDEsNyBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ICAKPiAgTURQ
Ogo+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+IC0tIGNvbXBhdGlibGU6ICJxY29tLHNkbTg0NS1k
cHUiCj4gKy0gY29tcGF0aWJsZTogInFjb20sc2RtODQ1LWRwdSIsICJxY29tLHNjNzE4MC1kcHUi
Cj4gIC0gcmVnOiBwaHlzaWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiBjb250cm9sbGVy
J3MgcmVnaXN0ZXJzLgo+ICAtIHJlZy1uYW1lcyA6IHJlZ2lzdGVyIHJlZ2lvbiBuYW1lcy4gVGhl
IGZvbGxvd2luZyByZWdpb24gaXMgcmVxdWlyZWQ6Cj4gICAgKiAibWRwIgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
