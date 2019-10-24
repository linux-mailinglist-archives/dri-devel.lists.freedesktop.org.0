Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FD1E3B3E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 20:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBDD6E5F0;
	Thu, 24 Oct 2019 18:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2377C6E5F0;
 Thu, 24 Oct 2019 18:46:28 +0000 (UTC)
Received: from localhost (unknown [75.104.69.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D08A420659;
 Thu, 24 Oct 2019 18:46:26 +0000 (UTC)
Date: Thu, 24 Oct 2019 14:46:19 -0400
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] Cleanup: replace prefered with preferred
Message-ID: <20191024184619.GB260560@kroah.com>
References: <20191022214208.211448-1-salyzyn@android.com>
 <20191023115637.GA23733@linux.intel.com>
 <fa12cb96-7a93-bf85-214d-a7bfaf8b8b0a@android.com>
 <875zkecosr.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875zkecosr.fsf@intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571942787;
 bh=LcyuoGg9oQj2WX2v7tCYiF0gA66s4qp8WOPNh6Xx7QE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CbyBTNu2fVYsik/kCROL/cnq39RKtShNVeJoYppp1ZSAP3n/kz95S8eff/ReQnyUf
 8y2Q8nmnO/d6RIlNdvHv/04IF/+Cz4wPj3HZs7fMDGoIX0E4qYRcI85rRfKl+V5oPH
 srzrOAG66fo+khOjey6zl8LLwlgbCg8yIC0yGnao=
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
Cc: Alexander Aring <alex.aring@gmail.com>, linux-efi@vger.kernel.org,
 Linus =?iso-8859-1?Q?L=FCssing?= <linus.luessing@c0d3.blue>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Feng Tang <feng.tang@intel.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Roman Li <Roman.Li@amd.com>,
 "David S. Miller" <davem@davemloft.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, netdev@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Rafael Aquini <aquini@redhat.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Jonathan Corbet <corbet@lwn.net>,
 Francesco Ruggeri <fruggeri@arista.com>,
 Matthew Garrett <matthewgarrett@google.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, linux-media@vger.kernel.org,
 Leo Li <sunpeng.li@amd.com>, "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Hans de Goede <hdegoede@redhat.com>, hersen wu <hersenxs.wu@amd.com>,
 dri-devel@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-nfs@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, kernel-team@android.com,
 Maxim Martynov <maxim@arista.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mark Salyzyn <salyzyn@android.com>,
 linux-bluetooth@vger.kernel.org, David Ahern <dsahern@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jukka Rissanen <jukka.rissanen@linux.intel.com>, linux-wpan@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDM6MjY6MjhQTSArMDMwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gV2VkLCAyMyBPY3QgMjAxOSwgTWFyayBTYWx5enluIDxzYWx5enluQGFuZHJvaWQu
Y29tPiB3cm90ZToKPiA+IEkgd2lsbCBzcGxpdCB0aGlzIGJldHdlZW4gcHVyZSBhbmQgaW5lcnQg
ZG9jdW1lbnRhdGlvbi9jb21tZW50cyBmb3Igbm93LCAKPiA+IHdpdGggYSBmb2xsb3d1cCBsYXRl
ciBmb3IgdGhlIGNvZGUgcG9ydGlvbiB3aGljaCB1bmRlcnN0YW5kYWJseSBpcyBtb3JlIAo+ID4g
Y29udHJvdmVyc2lhbC4KPiAKPiBQbGVhc2Ugc3BsaXQgYnkgZHJpdmVyL3N1YnN5c3RlbSB0b28s
IGFuZCBpdCdsbCBiZSBhbGwgYXJvdW5kIG11Y2gKPiBlYXNpZXIgZm9yIGV2ZXJ5b25lLgoKSSBh
Z3JlZSwgc3BlbGxpbmcgZml4ZXMgYXJlIHRyaXZpYWwgYW5kIHNob3VsZCBnbyBpbiBwZXItc3Vi
c3lzdGVtLgoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
