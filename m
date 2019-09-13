Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36439B2458
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 18:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672AF6F421;
	Fri, 13 Sep 2019 16:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8E66F421
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 16:47:42 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 01464C057867
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 16:47:42 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id n125so33451906qkc.16
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 09:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=X+Gw4oltcKWp0pNSL2jvRbQwq2ryUW+pvfo0CPfINZg=;
 b=UVpUS86ys2GgpaxZNdjCCwseoZsV6iKY4W7BWnWQJljh0NXtRnZL5eC47Af/0geL77
 kufcy5PIb12GLKmuBALdSMyx4HeUgo25EbCJ2vbhxW/l6mVG/2fY60kiprkSTHn5pyx7
 ZWiaFozLwqEPN4KywXNpIfNhTwlnxwemOaGKsTJvF/PT9OzVW4QYXjE0OvZLSNYvcx5o
 abNYmKP7TR0mYmcLOiRj8lWloh0ywou9XC6Mds7sPDg69i7XqIBoFrsNjxATrgu1pPE4
 fMzSxL7RsuTXq9KDEFArCXMOtu5Ambjm31JUcn0sUr/8XZ38neq56DPeYxrPM8srnIdC
 Ketg==
X-Gm-Message-State: APjAAAUhGwQciK9ni3EoxgdSvkImtYbBV6bvTsaxw1oLrmMGSX8cOLmy
 1JHEhKel4R186cFia4mLKVOnGl0jdbek53BfA3v21swVfBFY0X/Xng/nJJpaVa8OV8SArMSH8Le
 yv7vQfJ38MFd1pTcwDSkNVYWPVlQE
X-Received: by 2002:ac8:5554:: with SMTP id o20mr4083482qtr.282.1568393261362; 
 Fri, 13 Sep 2019 09:47:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzIEQ980tFqyfbaeMnpk1LbA1xC7gVZZH4yzzlSooBbk3qEyQaJPmNadxlERCvjre9DT5O4aw==
X-Received: by 2002:ac8:5554:: with SMTP id o20mr4083470qtr.282.1568393261206; 
 Fri, 13 Sep 2019 09:47:41 -0700 (PDT)
Received: from dhcp-10-20-1-78.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id n17sm15497519qke.103.2019.09.13.09.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 09:47:40 -0700 (PDT)
Message-ID: <9ec132ccb19458e369ae55b60471ffbebe401321.camel@redhat.com>
Subject: Re: image size is wrong in EDID, how to use EDID quirks
From: Adam Jackson <ajax@redhat.com>
To: "zhangn1985@outlook.com" <zhangn1985@outlook.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Date: Fri, 13 Sep 2019 12:47:39 -0400
In-Reply-To: <MN2PR04MB61259770991EDF5573603645CDB30@MN2PR04MB6125.namprd04.prod.outlook.com>
References: <MN2PR04MB61259770991EDF5573603645CDB30@MN2PR04MB6125.namprd04.prod.outlook.com>
User-Agent: Evolution 3.33.91 (3.33.91-1.fc31) 
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA5LTEzIGF0IDA0OjIxICswMDAwLCB6aGFuZ24xOTg1QG91dGxvb2suY29t
IHdyb3RlOgo+IERlYXIgZGV2ZWxvcGVycwo+ICAKPiBJIGhhdmUgYSBTYW1zdW5nIDQw4oCZIEhE
TUkgVFYsIHdoaWNoIGhhcyB3cm9uZyBFRElELgo+ICAKPiBUaGUgYWN0YXVsIHNpemUgb2YgdGhp
cyBUViBpcyA0MOKAmSAoODhjbSo0OWNtKSwgYnV0IGluIEVESUQgdGhlIHNpemUKPiBpcyA0OeKA
mSAoMTA2KjYzY20pCj4gIAo+IFRodXMgbWFrZXMgaW1hZ2Ugc2l6ZSBpcyBsYXJnZXIgdGhhbiBz
Y3JlZW4sIGJvdGggaW4gY29uc29sZSBhbmQKPiBkZXNrdG9wLgoKVGhhdCdzIG5vdCBob3cgRURJ
RCB3b3JrcyBpbiBMaW51eC4gSXQncyBvbmx5IHVzZWQgdG8gY29tcHV0ZSB0aGUgRFBJCm9mIHRo
ZSBzY3JlZW4sIG5vdCB0byBzY2FsZSB0aGUgaW1hZ2UuIElmIHRoZSBpbWFnZSBvbiB0aGUgVFYg
bG9va3MKbGlrZSBpdCBleHRlbmRzIG9mZiB0aGUgZWRnZSBvZiB0aGUgVFYgeW91IG5lZWQgdG8g
ZmluZCB0aGUgIm92ZXJzY2FuIgpzZXR0aW5nIGluIHlvdXIgVFYgYW5kIHR1cm4gaXQgb2ZmLgoK
LSBhamF4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
