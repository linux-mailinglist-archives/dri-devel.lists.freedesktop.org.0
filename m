Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93F2D5EA8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 11:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01A16E1A8;
	Mon, 14 Oct 2019 09:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5E96E1A8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 09:22:23 +0000 (UTC)
Date: Mon, 14 Oct 2019 09:22:12 +0000
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: WARNING in vkms_gem_free_object
Message-ID: <ActXXBRCAJY1WXkb1rRkIIdrHBvij0nuYv61GfTkwduOvS-mmb2jOAFmwxq0UPOZeZFXxWIhkOZBgYPSUFxKdGgxmYcPVBUk8IF6PodWFg8=@emersion.fr>
In-Reply-To: <20191014091736.GJ11828@phenom.ffwll.local>
References: <0000000000006bed900594d5e99a@google.com>
 <20191014091736.GJ11828@phenom.ffwll.local>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emersion.fr; s=protonmail; t=1571044941;
 bh=GNIUeV2PuZLavbtg2ZGccQlI/K/j81rR62oMYmqSBOQ=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=bXcOKmYxGh3vGMlF8bG2pTRj3pvMMbr8GTC8I/lZexfnv1xNvglc8H/t9AGGFWI0t
 La/yH/j0jFzPcFbzh7hunuVD5Xw9IRK8ARtFb8GmQxcRX+ebdvolEiJFP1bG0Jk58k
 rCnIIH5KoWWLKH8+EYSmml1jOjv29J+4GktcMQ/4=
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>,
 "rodrigosiqueiramelo@gmail.com" <rodrigosiqueiramelo@gmail.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "oleg.vasilev@intel.com" <oleg.vasilev@intel.com>,
 "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "simon.ser@intel.com" <simon.ser@intel.com>,
 "omrigann@gmail.com" <omrigann@gmail.com>,
 syzbot <syzbot+e7ad70d406e74d8fc9d0@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uZGF5LCBPY3RvYmVyIDE0LCAyMDE5IDEyOjE3IFBNLCBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+IHdyb3RlOgoKPiBPbGVnLCB3aWxsIHlvdSBiZSBsb29raW5nIGF0IHRoaXM/
IFdpdGggdGhlIHJlcHJvZHVjZXIgYW5kIGZ1bGwgZHJtCj4gZGVidWdnaW5nIGVuYWJsZWQgaXQg
c2hvdWxkbid0IGJlIHRvbyBoYXJkIHRvIGZpZ3VyZSBvdXQgd2hhdCdzIGdvaW5nIG9uCj4gaGVl
cmUgLi4uCgpPbGVnIGlzIG5vIGxvbmdlciB3b3JraW5nIGF0IEludGVsLiBJIGRvbid0IHRoaW5r
IGhlIG1vbml0b3JzIGRyaS1kZXZlbAphbnltb3JlLgoKSSdkIGxpa2UgdG8gd29yayBvbiBWS01T
IG15c2VsZiwgYnV0IGl0J3MgdmVyeSB1bmxpa2VseSBJIGhhdmUgdGltZSB0bwpkbyBzbyBhbnl0
aW1lIHNvb24uCgooTmVpdGhlciBPbGVnIG5vciBJIGhhdmUgYWNjZXNzIHRvIG91ciBAaW50ZWwu
Y29tIGFkZHJlc3MgYW55bW9yZS4pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
