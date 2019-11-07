Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8656F41CD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863F56F87D;
	Fri,  8 Nov 2019 08:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBDC6F7F1;
 Thu,  7 Nov 2019 22:49:29 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id s75so3376635ilc.3;
 Thu, 07 Nov 2019 14:49:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=ffzpUwIorM0GYm+otb4yX6nA1X5rclBWmv4V/VNNQzk=;
 b=p7zz/WCbkjG08nl7WA/UV+RNtDl5/xRggfexr0eNI7mDsSNyi9Bg590Q3G4a5AnVk3
 a3154hOSWxo4jZ2TYgditIaAxP45v7ah01410RWhU6PZqaFiu9z+JFUGXBQJCHtFGGXC
 y+nAEoznoovbLwhMCsVb7R2QEwmDEBJH4qD1uA9RMrXPu6O6/mby0b+6KvT+6KWan7wK
 r3iEBEv/wNKR6np4ZoicVtuoQGW3Gvd/49aVvIsVwdxzS0Qm/5I8Vjo4xHsQA36Pp4jw
 hgDY5qJI6RDbqyEzMGt0pN/vPvcBMrj+66sJdFNXmFjpRIyON/oNyopUNIoO0ufIMfDP
 eaIg==
X-Gm-Message-State: APjAAAVddz4AFsZyBozh+F567u9L2aQqPvSjw8MCNoZIm919KzJZkkuU
 qaFsjv5fJapKuvApUIoZwVnsAzn1X8Do864bKsuF4PnM
X-Google-Smtp-Source: APXvYqxSPQJatDOPCGIaQj/EifeCJ7gwe6kD7ks74Sjs6Z494AAHFaH4vrmZdLR3Ex/RpgwKGevVhQ4/EBGsMLNNvVs=
X-Received: by 2002:a92:9ecd:: with SMTP id s74mr7972872ilk.145.1573166968704; 
 Thu, 07 Nov 2019 14:49:28 -0800 (PST)
MIME-Version: 1.0
References: <20191107222047.125496-1-helgaas@kernel.org>
 <20191107222047.125496-2-helgaas@kernel.org>
 <CAKb7Uvjj+18cAFW+yBEHWkJLXVTHVMW=zJ-V+uqpzdbcEKsHrQ@mail.gmail.com>
In-Reply-To: <CAKb7Uvjj+18cAFW+yBEHWkJLXVTHVMW=zJ-V+uqpzdbcEKsHrQ@mail.gmail.com>
From: Bjorn Helgaas <bjorn.helgaas@gmail.com>
Date: Thu, 7 Nov 2019 16:49:17 -0600
Message-ID: <CABhMZUWFZ7M1wpnWaTs3+OsWqN8Nq6c8zyCCSxXbq0qZSjvgnw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: replace Compliance/Margin magic numbers with
 PCI_EXP_LNKCTL2 definitions
To: Ilia Mirkin <imirkin@alum.mit.edu>
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=ffzpUwIorM0GYm+otb4yX6nA1X5rclBWmv4V/VNNQzk=;
 b=egbcvsTLdseg/9piyzK+5ahhYoTrNpWwJ3jxektx+Gk/J8c2U6vNqUFHkU5uM/SwnN
 8jAh6qpHN6CSM4bM6olgDTM0ofDGFafXENoH5j4qD1QO2ghR2Eh4up3fAz3TFiAEvaUU
 Qb9irL/Xhk3/6jrfaYvAKrryE0NJCJ0aR0W8SwacAQUKX4KkFSWH0qH4NkLRrkzdW7f5
 ytE0lO9Stvd4Bs2NedPSEWxJe4oybuX0E0sVgHs7VoTrrrbTEUhSHIywjVNCF4krP6uC
 015Xb03w5dFFbvcYtWWAHSAy3mM63YxAIk+zcLjOydWc3xbXdWGEgzthZUZt/PtXsNJ6
 mUdQ==
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
Reply-To: bjorn@helgaas.com
Cc: Frederick Lawler <fred@fredlawl.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas <helgaas@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgNywgMjAxOSBhdCA0OjMwIFBNIElsaWEgTWlya2luIDxpbWlya2luQGFsdW0u
bWl0LmVkdT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE5vdiA3LCAyMDE5IGF0IDU6MjEgUE0gQmpvcm4g
SGVsZ2FhcyA8aGVsZ2Fhc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL3VhcGkvbGludXgvcGNpX3JlZ3MuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9wY2lfcmVncy5o
Cj4gPiBpbmRleCAyOWQ2ZTkzZmQxNWUuLjAzNDQ2YmU4YTdiZSAxMDA2NDQKPiA+IC0tLSBhL2lu
Y2x1ZGUvdWFwaS9saW51eC9wY2lfcmVncy5oCj4gPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgv
cGNpX3JlZ3MuaAo+ID4gQEAgLTY3Myw2ICs2NzMsOCBAQAo+ID4gICNkZWZpbmUgIFBDSV9FWFBf
TE5LQ1RMMl9UTFNfOF8wR1QgICAgIDB4MDAwMyAvKiBTdXBwb3J0ZWQgU3BlZWQgOEdUL3MgKi8K
PiA+ICAjZGVmaW5lICBQQ0lfRVhQX0xOS0NUTDJfVExTXzE2XzBHVCAgICAweDAwMDQgLyogU3Vw
cG9ydGVkIFNwZWVkIDE2R1QvcyAqLwo+ID4gICNkZWZpbmUgIFBDSV9FWFBfTE5LQ1RMMl9UTFNf
MzJfMEdUICAgIDB4MDAwNSAvKiBTdXBwb3J0ZWQgU3BlZWQgMzJHVC9zICovCj4gPiArI2RlZmlu
ZSAgUENJX0VYUF9MTktDVEwyX0VOVEVSX0NPTVAgICAgMHgwMDEwIC8qIEVudGVyIENvbXBsaWFu
Y2UgKi8KPiA+ICsjZGVmaW5lICBQQ0lfRVhQX0xOS0NUTDJfVFhfTUFSR0lOICAgICAweDAzODAg
LyogRW50ZXIgQ29tcGxpYW5jZSAqLwo+Cj4gV2l0aG91dCBjb21tZW50aW5nIG9uIHRoZSBtZWF0
IG9mIHRoZSBwYXRjaCwgdGhpcyBjb21tZW50IHNob3VsZAo+IHByb2JhYmx5IHJlYWQgIlRyYW5z
bWl0IE1hcmdpbiIgb3Igc29tZXRoaW5nIGFsb25nIHRob3NlIGxpbmVzPwoKSW5kZWVkLCB0aGFu
ayB5b3UhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
