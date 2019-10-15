Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC0CD7BDE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABA56E05F;
	Tue, 15 Oct 2019 16:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC176E7B5;
 Tue, 15 Oct 2019 11:54:46 +0000 (UTC)
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iKLPT-0005JE-TQ; Tue, 15 Oct 2019 11:54:39 +0000
Date: Tue, 15 Oct 2019 04:54:39 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] kernel-doc: rename the kernel-doc directive 'functions'
 to 'specific'
Message-ID: <20191015115439.GE32665@bombadil.infradead.org>
References: <20191013055359.23312-1-changbin.du@gmail.com>
 <875zkrd7nq.fsf@intel.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF977CAF09@USCULXMSG01.am.sony.com>
 <7e7557b5-469f-3e63-6254-53dab2d7234a@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e7557b5-469f-3e63-6254-53dab2d7234a@suse.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0yszEpJzojsv0U117iSsMG8HSxDkuZTGjoLlQ1g6Cro=; b=H2QiGrYjU+ubokt8xpeZfhmc4
 KeJqoyW8uxg7q1ISBlPkeTP2VdHeNdFTEjfM200kGher4lLa4FDZstL8YRJD8ekvVwvsmb0Xh9MA/
 lfFABlsn9oxUQAauCLzlpFOdRUSbEbEftAcVJJaMGJY9NIPHKq6QjSrP6QslqqBxQ3eLaFQdzC3DX
 TIla8pTIh8VTxkbhj7ewvknq0SzA4BjENLyfZTNdx3ia+LGoTRLtZYCdz0cbkHhiqHgzceQQAS/CK
 Ds/hLOlmUytSUF8O1f0IFiZGzOvwnZuONgSdBd4omuLOkIVrqAZm05F0lAxgbTylf8FsZGeFd7LZF
 KVLvVEaeQ==;
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
Cc: linux-usb@vger.kernel.org, corbet@lwn.net, linux-pci@vger.kernel.org,
 Tim.Bird@sony.com, linux-doc@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-fpga@vger.kernel.org,
 changbin.du@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMTE6MjU6NTNBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gPiBNeSBwcmVmZXJlbmNlIHdvdWxkIGJlIHRvIHVzZSAnc3ltYm9scycuICBJ
IHRyaWVkIHRvIGNvbWUgdXAgd2l0aCBzb21ldGhpbmcKPiA+IGJ1dCAnc3ltYm9scycgaXMgYmV0
dGVyIHRoYW4gYW55dGhpbmcgSSBjYW1lIHVwIHdpdGguCj4gCj4gTWF5YmUgJ2ludGVyZmFjZXMn
IG9yICdhcnRpZmFjdHMnLiBUaGUgdGVybSAnc3ltYm9scycgaXMganVzdCBhcwo+IGltcHJlY2lz
ZSBhcyAnZnVuY3Rpb25zJy4KCkkgc3VnZ2VzdGVkICdpZGVudGlmaWVyJyBiZWNhdXNlIHRoYXQn
cyB0aGUgdGVybSB1c2VkIGluIHRoZSBDIHNwZWMgKDYuMi4xKToKCjogQW4gaWRlbnRpZmllciBj
YW4gZGVub3RlIGFuIG9iamVjdDsgYSBmdW5jdGlvbjsgYSB0YWcgb3IgYSBtZW1iZXIKOiBvZiBh
IHN0cnVjdHVyZSwgdW5pb24sIG9yIGVudW1lcmF0aW9uOyBhIHR5cGVkZWYgbmFtZTsgYSBsYWJl
bCBuYW1lOwo6IGEgbWFjcm8gbmFtZTsgb3IgYSBtYWNybyBwYXJhbWV0ZXIuCgpXZSBkb24ndCBh
bGxvdyBkb2N1bWVudGluZyBhbGwgdGhvc2UgdGhpbmdzIHNlcGFyYXRlbHksIGJ1dCBpdCBkb2Vz
IGNvdmVyCmFsbCB0aGUgdGhpbmdzIHdlIGRvIGFsbG93IHRvIGJlIGluZGl2aWR1YWxseSBkb2N1
bWVudGVkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
