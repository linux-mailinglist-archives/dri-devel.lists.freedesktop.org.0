Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2234D8981
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 09:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB2E6E8D4;
	Wed, 16 Oct 2019 07:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB066E0A5;
 Wed, 16 Oct 2019 00:03:38 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y21so801941wmi.0;
 Tue, 15 Oct 2019 17:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z+boKbPCJy6Y+QmEBbA2r6Sy5oF4Bkb5MuauoyykrQg=;
 b=lG04XZ9149dfOOTVEwfVC7H9GV0bGkSckh1+4muOnzJ+cU2dIrwV2zdef4eObtmNp9
 YrmBhx0+LbuXIfuvODhJQUD8yKj/+4cmeKyouraM9XeEIGvVLrkLPtnKQcC30mHs+k1p
 BNDJnq+EYXGGIdGmiWNSRRFGoj/sVD6DLZBRTIUbxFHe3hJGQQvWWAdACskrkDGP9ZkU
 UaAAMdN0Af4wtIB2PORmCNjERITkpLsJB5KaQ0i5uMuOaVkric7e7cvfd4LlnV2j2FCI
 Mh5hLfWfJ6H8xlB1VT6czKdI2xiGjLlKtpFbs8dN+YZ7QVE7cjW35c04pUkSCZb21pKN
 1Lwg==
X-Gm-Message-State: APjAAAXgr6gX0X90IMibYzy091S64laar842ml0+aqViYAWd7wVar2YZ
 91swnS5UhAfoLobzkNknOGw=
X-Google-Smtp-Source: APXvYqyCj2CodWgBxqzJ6BnmheAkq7jFR2HRMpb748mzst4r2RhVtoYTg1jcyiHQDjd7jbTwZwftgw==
X-Received: by 2002:a7b:cd87:: with SMTP id y7mr807381wmj.93.1571184216877;
 Tue, 15 Oct 2019 17:03:36 -0700 (PDT)
Received: from mail.google.com ([104.238.174.53])
 by smtp.gmail.com with ESMTPSA id q19sm47346920wra.89.2019.10.15.17.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 17:03:35 -0700 (PDT)
Date: Wed, 16 Oct 2019 08:03:24 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] kernel-doc: rename the kernel-doc directive 'functions'
 to 'specific'
Message-ID: <20191016000322.7dnuwvxqtdbg7clq@mail.google.com>
References: <20191013055359.23312-1-changbin.du@gmail.com>
 <875zkrd7nq.fsf@intel.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF977CAF09@USCULXMSG01.am.sony.com>
 <7e7557b5-469f-3e63-6254-53dab2d7234a@suse.de>
 <20191015115439.GE32665@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015115439.GE32665@bombadil.infradead.org>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Wed, 16 Oct 2019 07:33:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z+boKbPCJy6Y+QmEBbA2r6Sy5oF4Bkb5MuauoyykrQg=;
 b=o9s23SP7JEIeCegNEId+494t1oUADoPW/AaYLQCM9nW0UZY9VnFOmgJAKyfhJV+vfU
 SUM67QdQDD5jfkrS6zCFCJiY9HkKYL41XjA5rTppD9+Cn/Mf87TyIvcdt6TfoX8sLplC
 SHxLR2sjCen3SsmBsodriYKupoRWPzbRNr//tuLfLVxJH0dkiv7cW6XWTVlL49G3gBcZ
 TavTe8XoTdJDg3jnnbsW26uuFU4iPOE3ydfvc3pkAjt5zpmUMw2fBjHIwP8x1gnJzaeL
 L+xycGn81efQM6XCUoVgqn5ACf4ZVgvewcW3NfYREkAnQ18+p0G5cPrcTSgUX/Uk82Ay
 XvnQ==
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
Cc: linux-usb@vger.kernel.org, linux-kselftest@vger.kernel.org, corbet@lwn.net,
 linux-pci@vger.kernel.org, Tim.Bird@sony.com, linux-doc@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, linux-fpga@vger.kernel.org,
 changbin.du@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDQ6NTQ6MzlBTSAtMDcwMCwgTWF0dGhldyBXaWxjb3gg
d3JvdGU6Cj4gT24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMTE6MjU6NTNBTSArMDIwMCwgVGhvbWFz
IFppbW1lcm1hbm4gd3JvdGU6Cj4gPiA+IE15IHByZWZlcmVuY2Ugd291bGQgYmUgdG8gdXNlICdz
eW1ib2xzJy4gIEkgdHJpZWQgdG8gY29tZSB1cCB3aXRoIHNvbWV0aGluZwo+ID4gPiBidXQgJ3N5
bWJvbHMnIGlzIGJldHRlciB0aGFuIGFueXRoaW5nIEkgY2FtZSB1cCB3aXRoLgo+ID4gCj4gPiBN
YXliZSAnaW50ZXJmYWNlcycgb3IgJ2FydGlmYWN0cycuIFRoZSB0ZXJtICdzeW1ib2xzJyBpcyBq
dXN0IGFzCj4gPiBpbXByZWNpc2UgYXMgJ2Z1bmN0aW9ucycuCj4gCj4gSSBzdWdnZXN0ZWQgJ2lk
ZW50aWZpZXInIGJlY2F1c2UgdGhhdCdzIHRoZSB0ZXJtIHVzZWQgaW4gdGhlIEMgc3BlYyAoNi4y
LjEpOgo+IAo+IDogQW4gaWRlbnRpZmllciBjYW4gZGVub3RlIGFuIG9iamVjdDsgYSBmdW5jdGlv
bjsgYSB0YWcgb3IgYSBtZW1iZXIKPiA6IG9mIGEgc3RydWN0dXJlLCB1bmlvbiwgb3IgZW51bWVy
YXRpb247IGEgdHlwZWRlZiBuYW1lOyBhIGxhYmVsIG5hbWU7Cj4gOiBhIG1hY3JvIG5hbWU7IG9y
IGEgbWFjcm8gcGFyYW1ldGVyLgo+CkkgYWxzbyBwcmVmZXIgdGhpcyBvbmUgbm93LiBJIHdhcyBs
b29raW5nIGZvciBzb21ldGhpbmcgbGlrZSB0aGlzLiBNeSBvcmlnaW5hbAppZGVhIGlzICdwcm90
b3R5cGUnLCBidXQgdGhhdCBpcyBvbmx5IGZvciBmdW5jdGlvbi4KCj4gV2UgZG9uJ3QgYWxsb3cg
ZG9jdW1lbnRpbmcgYWxsIHRob3NlIHRoaW5ncyBzZXBhcmF0ZWx5LCBidXQgaXQgZG9lcyBjb3Zl
cgo+IGFsbCB0aGUgdGhpbmdzIHdlIGRvIGFsbG93IHRvIGJlIGluZGl2aWR1YWxseSBkb2N1bWVu
dGVkLgoKLS0gCkNoZWVycywKQ2hhbmdiaW4gRHUKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
