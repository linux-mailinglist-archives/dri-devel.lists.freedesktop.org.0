Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF93340C63
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 19:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE2189F0B;
	Thu, 18 Mar 2021 18:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C3589F0B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 18:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=ODxAg8Wqr81xB7zG6/U4iNV+VQ8asoiM0yjqEKw10s4=; b=cwdhb8rAOeIk5AxjSIOOgXpBPb
 l41aCIRkpN+Q0W7eLUI+6NcimweO0rWZkY1XFUnaUllIICZAm/mZVZJ40K7SfgGpR0/wV5Ma66C8l
 cZiiztpOelw91Uq9Ge+iaGuqUd6FQBfha2NbGGflXjTGnnGILo+jcQE/ypGJqOocy77ICvbUbDE+4
 NzQdVeMOrn8/wEN74bckdA2gm2MHG0alAHUcv8N8SdTOhIOhbE+G+EqDYA2Do3nLut9I6b9tOIwsQ
 fxAchF0LFuNdHfG+H5IrUDIA4ENAzSQlTPT0oylukmK7M2kvyd1XwpdO6f6wc25vBSECy4RUM0gWo
 js7z5/sw==;
Received: from [2601:1c0:6280:3f0::9757]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMwzf-003K5h-97; Thu, 18 Mar 2021 18:03:39 +0000
Subject: Re: [PATCH] drm: Few typo fixes
To: Joe Perches <joe@perches.com>, Bhaskar Chowdhury <unixbhaskar@gmail.com>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210318103739.27849-1-unixbhaskar@gmail.com>
 <49d9c9372870da1c235b0afb01f5eab4385cbf0b.camel@perches.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ca4e3882-c0e7-e2f0-2f7c-0ec4ea2393c2@infradead.org>
Date: Thu, 18 Mar 2021 11:03:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <49d9c9372870da1c235b0afb01f5eab4385cbf0b.camel@perches.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMy8xOC8yMSA3OjI1IEFNLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBPbiBUaHUsIDIwMjEtMDMt
MTggYXQgMTY6MDcgKzA1MzAsIEJoYXNrYXIgQ2hvd2RodXJ5IHdyb3RlOgo+PiBzL2luc3RhdGlh
dGVkL2luc3RhbnRpYXRlZC8KPj4gcy91bnJlZmVyZW5jZS91bnJlZmVyZW5jZWQvCj4gCj4gW10+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb3BlcnR5LmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX3Byb3BlcnR5LmMKPiBbXQo+PiBAQCAtNjQ0LDcgKzY0NCw3IEBAIEVYUE9SVF9T
WU1CT0woZHJtX3Byb3BlcnR5X2Jsb2JfZ2V0KTsKPj4gwqDCoCogQGlkOiBpZCBvZiB0aGUgYmxv
YiBwcm9wZXJ0eQo+PiDCoMKgKgo+PiDCoMKgKiBJZiBzdWNjZXNzZnVsLCB0aGlzIHRha2VzIGFu
IGFkZGl0aW9uYWwgcmVmZXJlbmNlIHRvIHRoZSBibG9iIHByb3BlcnR5Lgo+PiAtICogY2FsbGVy
cyBuZWVkIHRvIG1ha2Ugc3VyZSB0byBldmVudHVhbGx5IHVucmVmZXJlbmNlIHRoZSByZXR1cm5l
ZCBwcm9wZXJ0eQo+PiArICogY2FsbGVycyBuZWVkIHRvIG1ha2Ugc3VyZSB0byBldmVudHVhbGx5
IHVucmVmZXJlbmNlZCB0aGUgcmV0dXJuZWQgcHJvcGVydHkKPiAKPiBJIHRoaW5rIHRoaXMgaXMg
d29yc2UuCgpBZ3JlZWQgLS0gbm90IGdvb2QuCgotLSAKflJhbmR5CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
