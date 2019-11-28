Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DD210C8E2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 13:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8E66E079;
	Thu, 28 Nov 2019 12:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A416E079
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 12:46:47 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g206so10839829wme.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 04:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=STsXGIxlpKeuPZp+Vn2QA8KnIL8lpW4s4OgT+hmouXE=;
 b=dN5CRBvPWfAk1ThzoBZqGZggUCDR2FQR+/s5ErYd97oVes3JrIXS5KPVRYhtJS36s6
 /sA2fVhcT723vDlUvv2NVBqhPaV/pXrtLNeCj2paW2h47QfNo1x+MkzpB4T3CcZmHoYN
 AKvgB8vmjEnmP/BuXTcbIVd4kHCK15SjC+I//zz92LLpcSfsockJUSOYpTAHpL16Ax6C
 45K1gMUTBf/DBs/w51/ey+F6MRq+qay1+MDNM51gq0rpJ6ug52rukzFYJ3B0zrwGO81r
 BJXFSnZEM3ELHKqf+ZGZpAuVsj3WWPHsqVj1vgv2DBI7A+877ybV+3UbhxfDjp+3rvX8
 eq2g==
X-Gm-Message-State: APjAAAVMqjNIogYaFUoahU7KpvtCk54p2u6SwZKQPIqNliIc+gAvr6yM
 xHMmojfSR/JGn92wY794BZw=
X-Google-Smtp-Source: APXvYqz1W8bxVosL7NtHYjDlEnoHqf0gsbzp+DXZgse8WI5qd4Ou2QMkjPFXu86KVVEcRCv9aWJFeQ==
X-Received: by 2002:a7b:c8c2:: with SMTP id f2mr8904741wml.99.1574945206599;
 Thu, 28 Nov 2019 04:46:46 -0800 (PST)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id f19sm24492776wrf.23.2019.11.28.04.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 04:46:45 -0800 (PST)
Date: Thu, 28 Nov 2019 12:46:03 +0000
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/3] drm/mgag200: Extract device type from flags
Message-ID: <20191128124603.GA9293@arch-x1c3>
References: <20191126101529.20356-1-tzimmermann@suse.de>
 <20191126101529.20356-2-tzimmermann@suse.de>
 <CACvgo52_L9RRCh6rKBCqkCuBwmH40NPnGQkCtqpR-T1feKC_5w@mail.gmail.com>
 <98068118-8988-e31a-11c3-17a88059fbed@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98068118-8988-e31a-11c3-17a88059fbed@suse.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=STsXGIxlpKeuPZp+Vn2QA8KnIL8lpW4s4OgT+hmouXE=;
 b=NfCy8kNCntgaDCtGBuCJGqwrGwE+TjPAz9SDCI05cYUfodniq4uCbybMqgQOvztEkC
 IBB0BP+nOnmXCC/6rkzp4g84+fSn3NiRA/9FKoFP2s///Vz0yTNHZFbVBNHtZEbF7t/c
 lFzhJwD51zhewk12JnlAHj6wFWpL/gn43DJEN3946Bl6yE1236p26yavF3gKSIuk8QC1
 sXC44EadYZeHFasnF6dYifpwqPZ7R6M5iqE/NQ06ymjY1rCvqkyVvYApRLjWqzFNngYT
 9bMipcpnhdE4WHGYmVKtvHA9ncyG2RzFjoFF2s9d3tABI4x4X1UakpPHa6QXvw/GCQS5
 +KcQ==
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
Cc: john.p.donnelly@oracle.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Dave Airlie <airlied@redhat.com>, "# 3.13+" <stable@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8xMS8yNywgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gSGkgRW1pbAo+IAo+IEFt
IDI3LjExLjE5IHVtIDE3OjI5IHNjaHJpZWIgRW1pbCBWZWxpa292Ogo+ID4gSGkgVGhvbWFzLAo+
ID4gCj4gPiBPbiBUdWUsIDI2IE5vdiAyMDE5IGF0IDEwOjE1LCBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4gPj4KPiA+PiBBZGRzIGEgY29udmVyc2lvbiBm
dW5jdGlvbiB0aGF0IGV4dHJhY3RzIHRoZSBkZXZpY2UgdHlwZSBmcm9tIHRoZQo+ID4+IFBDSSBp
ZC10YWJsZSBmbGFncy4gQWxsb3dzIGZvciBzdG9yaW5nIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24g
aW4gdGhlCj4gPj4gb3RoZXIgZmxhZyBiaXRzLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gPj4gRml4ZXM6IDgxZGE4N2Y2
M2ExZSAoImRybTogUmVwbGFjZSBkcm1fZ2VtX3ZyYW1fcHVzaF90b19zeXN0ZW0oKSB3aXRoIGt1
bm1hcCArIHVucGluIikKPiA+IAo+ID4gQXJlIHlvdSBzdXJlIHRoZSBmaXhlcyB0YWcgaXMgY29y
cmVjdD8gTmVpdGhlciB0aGUgY29tbWl0IHN1bW1hcnkgbm9yCj4gPiB0aGUgcGF0Y2ggaXRzZWxm
IHNlZW1zIHJlbGF0ZWQgdG8gdGhlIGNoYW5nZXMgYmVsb3cuCj4gCj4gWWVzLCBpdCdzIGNvcnJl
Y3QuIEl0J3MgcGFydCBvZiBhIHBhdGNoIHNlcmllcyBbMV1bMl1bM10gdGhhdCBmaXhlcyB0aGUg
YnVnLgo+IAo+IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+IAo+IFsxXQo+IGh0dHBzOi8vY2dpdC5m
cmVlZGVza3RvcC5vcmcvZHJtL2RybS10aXAvY29tbWl0Lz9pZD0zYThhNWFiYTE0MmE0NGVhZWJh
MGNiMGVjMWI0YThmMTc3YjVlNTlhCj4gWzJdCj4gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9y
Zy9kcm0vZHJtLXRpcC9jb21taXQvP2lkPWQ2ZDQzN2Q5N2Q1NGM4NWExYTkzOTY3YjI3NDVlMzFk
ZmYwMzM2NWEKPiBbM10KPiBodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tdGlw
L2NvbW1pdC8/aWQ9MTU5MWZhZGY4NTdjZGJhZjJiYWE1NWU0MjFhZjk5YTYxMzU0NzEzYwo+IApJ
IHNlZSwgZGlmZmVyZW50IGFsaWdubWVudCBpcyByZXF1aXJlZCBmb3Igb25lIG1nYTIwMCBHUFUu
ClBlcnNvbmFsbHksIEkgd291bGQgaGF2ZSBtZW50aW9uZWQgdGhhdCBpbiB0aGUgY29tbWl0IG1l
c3NhZ2UuCgpSZWdhcmRsZXNzLCBoYXRzIG9mZiBmb3IgdGhlIHByb21wdCBmaXh1cC4KClRoYW5r
cwpFbWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
