Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2673A307115
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D9F6E956;
	Thu, 28 Jan 2021 08:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547216E247;
 Wed, 27 Jan 2021 19:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=pRxuyKfUVYtNaC0BqhWAs8owtg4XfDmRLmcs5SzkWbY=; b=PsDyxsjRYL6fmY2S+GD8vcIsPm
 H8gagWKh7k/RF6ztRzMhenwRwcYpQC/MKpcHgqr4wL1Zd4fJmuyR07W7u08ugRAQx8LO6g6AROFmG
 FasEVa9dD6Nqx7SDkcrH+pgD+QHCChNCe7iIyc3tQk5BDgqrgwPlGtG/QwtOfTThJVaNfmX/xHy26
 rRkZTjbbbra7N+SGKwWqBExFPtt+NF9U55UfWVMbvrcQ8Vug3KSfTmjXbIwo92bxK8ps42Ij0uJjV
 O+VtyT+2hsblhEJ/TW9X39pAggUaeB/JKPIN+r13rETTwA2sdLgFtPnSj4mlQwgyLcdLlcNMdL6FA
 0nhHdQXQ==;
Received: from [2601:1c0:6280:3f0::7650]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4qAx-0007wt-Rm; Wed, 27 Jan 2021 19:08:24 +0000
Subject: Re: linux-next: Tree for Jan 27 (drm/i915)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210128014419.55ea9ae4@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f173c63a-d71f-15bd-02ef-518736600cf1@infradead.org>
Date: Wed, 27 Jan 2021 11:08:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210128014419.55ea9ae4@canb.auug.org.au>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMS8yNy8yMSA2OjQ0IEFNLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOgo+IEhpIGFsbCwKPiAK
PiBOb3RlOiB0aGUgcGF0Y2ggZmlsZSBoYXMgZmFpbGVkIHRvIHVwbG9hZCA6LSgKPiAKPiBDaGFu
Z2VzIHNpbmNlIDIwMjEwMTI1Ogo+IAoKb24geDg2XzY0OgoKLi4vZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9nZW0uYzogSW4gZnVuY3Rpb24g4oCYaTkxNV9nZW1fZnJlZXplX2xhdGXigJk6Ci4u
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmM6MTE4MjoyOiBlcnJvcjogaW1wbGljaXQg
ZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYd2JpbnZkX29uX2FsbF9jcHVz4oCZOyBkaWQgeW91
IG1lYW4g4oCYd3Jtc3Jfb25fY3B1c+KAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVj
bGFyYXRpb25dCiAgd2JpbnZkX29uX2FsbF9jcHVzKCk7CgoKLS0gCn5SYW5keQpSZXBvcnRlZC1i
eTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
