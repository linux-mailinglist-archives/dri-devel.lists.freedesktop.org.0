Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08640E4491
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 09:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9D76E8BC;
	Fri, 25 Oct 2019 07:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FF96E8BC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 07:34:39 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v3so3617816wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 00:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=cMo4X/xx2JIKtFgiEkgftLhIMxRj/yxay+IpYU9F3/o=;
 b=YhvRr/bh5JxcSV0NCsmrKWFXOmehXc+uqGs0oFVNcLftPQN/ylH7Td/6glIphS4i7D
 sYd69vYZ0uPB5Or+egpTa//KeKXIbYKlvEv1AUMkzmAWAltKDEDQgZrN392SkpXNvt+4
 h/Oboaa3N6GDqw5kOEhPYTepdMOGWGnZjn8c4mrtEAxF2asLcntOK52TD/j+s5P6IZyh
 J8tSc3xYwcIzfK56xEUL1LBtvIFt6EgIgbiUX4pRHTzCsHZa1ijgbG7YkqHkYtlARbMq
 iWnGfIQqvcGHKYiMiaHyUEHf9MH6PUxu1AmRm9Zig7LkXoFrt7WE7npodgsEHJ0RF07C
 CDbQ==
X-Gm-Message-State: APjAAAVZGrWCZscIGjMU33dgD0H5pYP4o8nYzQ/HvLFAmsBjrXtAtG0Q
 YZvEt7ny1mEBYec4k1pVyunmbI0Lhoc=
X-Google-Smtp-Source: APXvYqytBcaTF9r1JAzK49An4U/o/cQvTnHYi4AVoJVGJ7qfv2ZIvfJ61mCEo1dxHOixuDqXVk/Qsw==
X-Received: by 2002:a1c:e08a:: with SMTP id x132mr2122991wmg.146.1571988878511; 
 Fri, 25 Oct 2019 00:34:38 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id o6sm1207326wrx.89.2019.10.25.00.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 00:34:37 -0700 (PDT)
Date: Fri, 25 Oct 2019 09:34:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Bhanusree <bhanusreemahesh@gmail.com>
Subject: Re: [PATCH 0/2] drm/gpu: Fix checkpatch.pl warnings
Message-ID: <20191025073436.GM11828@phenom.ffwll.local>
References: <1571984808-4552-1-git-send-email-bhanusreemahesh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571984808-4552-1-git-send-email-bhanusreemahesh@gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cMo4X/xx2JIKtFgiEkgftLhIMxRj/yxay+IpYU9F3/o=;
 b=QE/mewJRN8ywufwtcw+ud8jU2dYa/nGRbOBkSAoKT8iNzgveJTkbNxNZ8oChnKJDxh
 AKPdzqy7+1jeM8xBc4Y/81dj6PHDIjn03INEtr1baKS6SKGcYoIQo3L3rD1TFcvpTdYm
 EqzMGI7M6zjYqWfEd82gxYGtegmQADxhzv1Yc=
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMTE6NTY6NDhBTSArMDUzMCwgQmhhbnVzcmVlIHdyb3Rl
Ogo+IFRoaXMgcGF0Y2ggc2VyaWVzIGNsZWFycyB0aGUgY2hlY2twYXRjaC5wbCB3YXJuaW5ncwo+
IFtQQVRDSCAxLzJdOkZpeCBNaXNzaW5nIGJsYW5rIGxpbmUgYWZ0ZXIgZGVjbGFyYXRpb25zCj4g
W1BBVENIIDIvMl06Rml4IE1lbW9yeSBiYXJyaWVyIHdpdGhvdXQgY29tbWVudAo+IAo+IEJoYW51
c3JlZSAoMik6Cj4gICBkcm0vZ3B1OiBGaXggTWlzc2luZyBibGFuayBsaW5lIGFmdGVyIGRlY2xh
cmF0aW9ucwo+ICAgZHJtL2dwdTogRml4IE1lbW9yeSBiYXJyaWVyIHdpdGhvdXQgY29tbWVudCBJ
c3N1ZQoKVGhlIHRocmVhZGluZyBpbiB0aGlzIHN1Ym1pc3Npb24gaXMgYnJva2VuIHNvbWVob3cg
Li4uIERpZCB5b3Ugc2VuZCB0aGVzZQpwYXRjaGVzIG91dCBpbmRpdmlkdWFsbHk/IEVpdGhlciBk
byB0aGVtIGFsbCB0b2dldGhlciwgb3IgZG8gaW52aWRpZHVhbApzdGFuZC1hbG9uZSBwYXRjaGVz
LiBBbHNvIGZvciBhbnl0aGluZyBvdXRyZWFjaHkgcGxzIGFsd2F5cyBjYyB0aGUKb3V0cmVhY2h5
IGxpc3QgdG9vLgoKVGhhbmtzLCBEYW5pZWwKCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2Fj
aGUuYyB8IDEwICsrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPiAKPiAtLSAKPiAyLjcuNAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
