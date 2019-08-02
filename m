Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C44177EDE3
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 09:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED09B6ECDF;
	Fri,  2 Aug 2019 07:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5A26ECDF
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 07:48:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63D42CC;
 Fri,  2 Aug 2019 09:48:03 +0200 (CEST)
Date: Fri, 2 Aug 2019 10:48:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH/RFC 01/12] dt-bindings: display: renesas: lvds: RZ/G2E
 needs renesas,companion too
Message-ID: <20190802074801.GC5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564731249-22671-2-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564732083;
 bh=F7EcIwTg1zH6A0iHD8dIESp+yC+C8KwvQYvH/TMKvCg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qafg1dFY6VNomX3BebAW8Cgx9jVO+s6K8GumORKuV+5S1fFcJRv6oruyq25WiTajx
 tIfKzilrXLQHtpUSbbUZ8sMtXOudTG8CHBVcPskpzoW1vVnnsYlLyu8ITL+Qq9R5Ek
 Jj+g3vR/dUYSj54df2P6Av2Y2xd/Eklmd8zhr0d0=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIEZyaSwgQXVnIDAy
LCAyMDE5IGF0IDA4OjMzOjU4QU0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBEb2N1
bWVudCBSWi9HMkUgc3VwcG9ydCBmb3IgcHJvcGVydHkgcmVuZXNhcyxjb21wYW5pb24uCj4gCj4g
U2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNh
cy5jb20+CgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPgoKYW5kIHRha2VuIGluIG15IHRyZWUuCgo+IC0tLQo+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4
dCB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQKPiBpbmRleCBjNmEx
OTZkLi5kZWNlNzllIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQKPiBA
QCAtNDksOSArNDksOSBAQCBFYWNoIHBvcnQgc2hhbGwgaGF2ZSBhIHNpbmdsZSBlbmRwb2ludC4K
PiAgT3B0aW9uYWwgcHJvcGVydGllczoKPiAgCj4gIC0gcmVuZXNhcyxjb21wYW5pb24gOiBwaGFu
ZGxlIHRvIHRoZSBjb21wYW5pb24gTFZEUyBlbmNvZGVyLiBUaGlzIHByb3BlcnR5IGlzCj4gLSAg
bWFuZGF0b3J5IGZvciB0aGUgZmlyc3QgTFZEUyBlbmNvZGVyIG9uIEQzIGFuZCBFMyBTb0NzLCBh
bmQgc2hhbGwgcG9pbnQgdG8KPiAtICB0aGUgc2Vjb25kIGVuY29kZXIgdG8gYmUgdXNlZCBhcyBh
IGNvbXBhbmlvbiBpbiBkdWFsLWxpbmsgbW9kZS4gSXQgc2hhbGwgbm90Cj4gLSAgYmUgc2V0IGZv
ciBhbnkgb3RoZXIgTFZEUyBlbmNvZGVyLgo+ICsgIG1hbmRhdG9yeSBmb3IgdGhlIGZpcnN0IExW
RFMgZW5jb2RlciBvbiBSLUNhciBEMywgUi1DYXIgRTMsIGFuZCBSWi9HMkUgU29DcywKPiArICBh
bmQgc2hhbGwgcG9pbnQgdG8gdGhlIHNlY29uZCBlbmNvZGVyIHRvIGJlIHVzZWQgYXMgYSBjb21w
YW5pb24gaW4gZHVhbC1saW5rCj4gKyAgbW9kZS4gSXQgc2hhbGwgbm90IGJlIHNldCBmb3IgYW55
IG90aGVyIExWRFMgZW5jb2Rlci4KPiAgCj4gIAo+ICBFeGFtcGxlOgoKLS0gClJlZ2FyZHMsCgpM
YXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
