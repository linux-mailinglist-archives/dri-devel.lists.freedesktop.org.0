Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73892C9F20
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 11:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87C26E4DD;
	Tue,  1 Dec 2020 10:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841486E4DD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 10:27:08 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z7so1834764wrn.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 02:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=TkHSBf0Y4Aa6IfCBB6BqBgjrMxTCo4yUD4NQ14lHsWg=;
 b=bIQv4DWorFQLSLt/f4sNxk/jXVMt/gaBYE2nZDruE/OcBlTjIHUcPkFvvIP6Rq457o
 UmgC3mAQ8uTxfw+G1VtOvYIY4nResMg2/rxevaldljJv2HrNP5B6M8PYbfC2XOjq1WrW
 ZCsYwBNprlxq1ZJj5vIrCKMIVUn2EinN55I7ohumkPrSg3ylW88LxmjkRMLpHdMzhtDh
 oA8G5pPaPgYbqzra3k9+3MSQ9btbo/x0JE7R752W9fvpcw445GtMwP3jDWKCkCjrvs9B
 CrZb7tAvj9DNDhIeZJFdjeKC9ryJbNgyJgb79GlUpc3npkfGO5N7wseeoySyY9GG63d4
 YySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TkHSBf0Y4Aa6IfCBB6BqBgjrMxTCo4yUD4NQ14lHsWg=;
 b=cJcLWrrNrwvg+q2RBMxnjuzV2jcZG6qw+n3fv8RKgtli6HchgrqiVAoSi0NtzIW9ip
 ZDtqSPCNb99V64QaYCZbB/apPBnhU5J2Vm412tkikeF4bIOS/2aVTLhUzTm0ljXXj7Q0
 Njcg146iEcfzkVdmdgy9wgpuG5UVfZNop/hv9lRVTSBweMvCTwrSY9wCXujJO6obWVTv
 O9iiF6mwI33P3vw/8Sl3cOZf1OT4eZgHmAcECrBVWgoXiGUJRASBQ8LwxxvB4ta3l3aN
 w56jeZVnsb+KE6THOh+wA+/Q9WcR/OquW7ytS65/9W1Y4v/mGuNICUlQOG/2WpGgjRBC
 9xzQ==
X-Gm-Message-State: AOAM533Znls/LY98OnIGxhXTqeJEp74p332Y6fIawRuU5/PerdD66wov
 ngNpKCcbTNXtyeM++AgRg82T4g==
X-Google-Smtp-Source: ABdhPJwdcN76+wHTOWuOVVwHQy1GYZ7hUQ0G3fUBGdjzsMySPZ6Xld4ZKzt10eIo3P0un/x1Mtmmow==
X-Received: by 2002:a5d:4802:: with SMTP id l2mr2914270wrq.424.1606818427006; 
 Tue, 01 Dec 2020 02:27:07 -0800 (PST)
Received: from dell ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id v7sm2218419wma.26.2020.12.01.02.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 02:27:06 -0800 (PST)
Date: Tue, 1 Dec 2020 10:27:04 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v2 13/28] video: fbdev: riva: Fix kernel-doc and set but
 not used warnings
Message-ID: <20201201102704.GH4801@dell>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-14-sam@ravnborg.org>
 <53f3e91e-d8da-bce6-878c-7842250a7a7c@suse.de>
 <20201130183549.GA1498572@ravnborg.org>
 <20201201084718.GF4801@dell>
 <20201201090745.GA1980788@ravnborg.org>
 <20201201094629.GG4801@dell>
 <CAKMK7uGUJbVRVTO8xL8Kc8BbYMXzqS2KAVYL8bgex3Zz=aF9EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGUJbVRVTO8xL8Kc8BbYMXzqS2KAVYL8bgex3Zz=aF9EQ@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Sam Ravnborg <sam@ravnborg.org>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Alexander Klimov <grandmaster@al2klimov.de>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peter Rosin <peda@axentia.se>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwMSBEZWMgMjAyMCwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4gT24gVHVlLCBEZWMg
MSwgMjAyMCBhdCAxMDo0NiBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90
ZToKPiA+Cj4gPiBPbiBUdWUsIDAxIERlYyAyMDIwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gPgo+
ID4gPiBIaSBMZWUsCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBDb3Atb3V0IQo+ID4gPiA+Cj4gPiA+
ID4gRG8gd2hhdCBJIGRvIGFuZCBtYWtlIHNvbWV0aGluZyB1cCAoam9rZSkhIDonRAo+ID4gPgo+
ID4gPiBJZiBJIHRob3VnaHQgYW55b25lIHdvdWxkIGFjdHVhbGx5IHJlYWQgdGhlIGNvbW1lbnRz
IHRoZW4gbWF5YmUgeWVzLgo+ID4gPiBCdXQgSSBhc3N1bWUgdGhhdCBhcGFydCBmcm9tIHRoaXMg
dGhyZWFkIG5vLW9uZSB3aWxsIHJlYWQgaXQuCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiA+ID4gV2Vs
bCwgaXQgZml4ZXMgdGhlIHdhcm5pbmcgOykKPiA+ID4gPiA+Cj4gPiA+ID4gPiBZZWFoLCBJIGNv
dWxkIG5vdCBkaWcgdXAgYW55dGhpbmcgdXNlZnVsIHRvIHNheSBoZXJlLgo+ID4gPiA+ID4gV2Fz
IHRlbXB0ZWQgdG8ganVzdCBkcm9wIGFsbCB0aGUga2VybmVsLWRvYyBzeW50YXggYnV0IHRoYXQK
PiA+ID4gPiA+IHdhcyBhIGxhcmdlciBjaGFuZ2UuCj4gPiA+ID4KPiA+ID4gPiBEaWQgeW91IHRy
YWNlIGl0IGZyb20gaXQncyBvcmlnaW4gZG93biB0byBpdCdzIGZpbmFsIHVzZT8KPiA+ID4gWWVh
aCwgYnV0IG5vdCBzb21ldGhpbmcgdGhhdCBzZWVtZWQgdXNlZnVsLgo+ID4gPiBJIGNvdWxkIGhh
dmUgYWRkZWQgInRyYW5zbGF0aW5nIGZyb20gcGl4ZWxzLT5ieXRlcyIgYXMgdGhleQo+ID4gPiBh
cmUgZGVzY3JpYmVkIHNvbWV3aGVyZSBlbHNlLiBCdXQgSSBjb3VsZCBub3QgY29udmluY2UgbXlz
ZWxmCj4gPiA+IHRoaXMgd2FzIHJpZ2h0IHNvIEkganVzdCBzaWxlbmNlZCB0aGUgd2FybmluZy4K
PiA+ID4KPiA+ID4gVGhlIG9ubHkgcmVhc29uIEkga2VwdCB0aGUga2VybmVsLWRvYyBpbiB0aGUg
Zmlyc3QgcGxhY2UgaXMKPiA+ID4gdGhhdCBJIGFtIHRvbGQgc29tZSBlZGl0b3JzIHVzZSBpdC4K
PiA+ID4KPiA+ID4gVGhlIG9ubHkgZWZmZWN0IHRoZSBrZXJuZWwtZG9jIGluIGZiZGV2IGhhcyBy
aWdodCBub3cgaXMgYnVybmluZwo+ID4gPiBlZmZvcnQgdGhhdCBjb3VsZCBoYXZlIGJlZW4gc3Bl
bnQgKGJldHRlcj8pIHNvbWV3aGVyZSBlbHNlLCBhbmQKPiA+ID4gSSB3b3VsZCBwZXJzb25hbGx5
IHByZWZlciB0byBkcm9wIHRoZSBrZXJuZWwtZG9jIGFubm90YXRpb25zLgo+ID4gPgo+ID4gPiBC
dXQgSSBhbHJlYWR5IGRpc2N1c3NlZCB0aGlzIGluIGFub3RoZXIgdGhyZWFkIChub3QgZmJkZXYg
cmVsYXRlZCkKPiA+ID4gYW5kIEkgd2FzIHRvbGQgaXQgd2FzIHVzZWZ1bCBmb3Igc29tZSwgc28g
aXQgaXMga2VwdC4KPiA+Cj4gPiBJIHBlcnNvbmFsbHkgdGhpbmsgdGhleSBzaG91bGQgYmUga2Vw
dC4gIERlc3BpdGUgbm90IGJlaW5nIHJlZmVyZW5jZWQKPiA+IGJ5IGFueSBrZXJuZWwtZG9jOjog
a2V5LXdvcmRzLiAgQXMgeW91IHNheSwgaXQgY2FuIGJlIGhlbHBmdWwgYXMgYW4KPiA+IGluLWNv
ZGUgcmVmZXJlbmNlIGZvciBkcml2ZXIgd3JpdGVycywgcGVvcGxlIGRlYnVnZ2luZyBjb2RlLCBl
dCBhbC4KPiA+Cj4gPiBOb3Qgc3VyZSBJIHdvdWxkIGp1c3QgcmVwZWF0IHRoZSB2YXJpYWJsZSBu
YW1lIGp1c3QgdG8gc2lsZW5jZSB0aGUKPiA+IHdhcm5pbmcgdGhvdWdoIC0gdGhhdCBpcyBkZWZp
bml0ZWx5IGEgaGFjay4gIEluIHRoZSB0aG91c2FuZHMKPiA+IChsaXRlcmFsbHkhKSBvZiB0aGVz
ZSB0aGF0IEkndmUgZml4ZWQgdGh1cyBmYXIsIEkgaGF2ZW4ndCBuZWVkZWQgdG8gZG8KPiA+IHRo
YXQuCj4gCj4gUGVyc29uYWxseSB3aGF0IEkndmUgZG9uZSBpcyB0byBqdXN0IHJlbW92ZSB0aGUg
a2VybmVsZG9jIG1hcmtlciAoYW5kCj4gYW55dGhpbmcgZWxzZSB0aGF0J3Mgb2J2aW91c2x5IHdy
b25nKSBhbmQgbGVhdmUgcGxhaW4gY29tbWVudHMgYmVoaW5kLgo+IEF0IGxlYXN0IGZvciBvbGQg
b3V0ZGF0ZWQgY29kZSB0aGF0IG5vIG9uZSBhY3RpdmVseSBtYWludGFpbnMgYW55bW9yZS4KPiBL
ZWVwcyB0aGUgY29tbWVudCBhcyBtYXliZSBzb21ldGhpbmcgdXNlZnVsLCBhbmQgYXZvaWRzIHBv
aW50bGVzcyBidXN5Cj4gd29yayBvZiBpbnZlbnRpbmcga2VybmVsZG9jIHdoaWNoIG1pZ2h0IG9y
IG1pZ2h0IG5vdCBhY3R1YWxseSBiZQo+IGNvcnJlY3RseSBkZXNjcmliaW5nIHdoYXQncyBnb2lu
ZyBvbi4KClJpZ2h0LiAgRGVtb3RpbmcgaXMgYWxzbyBhIGdvb2Qgb3B0aW9uIGlmIGluIGRvdWJ0
LgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZl
bG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFy
bSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
